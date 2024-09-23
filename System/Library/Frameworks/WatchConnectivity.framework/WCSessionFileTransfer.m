@implementation WCSessionFileTransfer

- (WCSessionFileTransfer)init
{
  WCSessionFileTransfer *v2;
  WCSessionFileTransfer *v3;
  NSError *transferError;
  void *v5;
  uint64_t v6;
  NSString *transferIdentifier;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WCSessionFileTransfer;
  v2 = -[WCSessionFileTransfer init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    transferError = v2->_transferError;
    v2->_transferError = 0;

    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "UUIDString");
    v6 = objc_claimAutoreleasedReturnValue();
    transferIdentifier = v3->_transferIdentifier;
    v3->_transferIdentifier = (NSString *)v6;

    -[WCSessionFileTransfer initializeProgress](v3, "initializeProgress");
  }
  return v3;
}

- (WCSessionFileTransfer)initWithFile:(id)a3
{
  id v5;
  WCSessionFileTransfer *v6;
  WCSessionFileTransfer *v7;

  v5 = a3;
  v6 = -[WCSessionFileTransfer init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_file, a3);

  return v7;
}

- (void)cancel
{
  void *v3;

  +[WCSession defaultSession](WCSession, "defaultSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelFileTransfer:", self);

  self->_transferring = 0;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[WCSessionFileTransfer file](self, "file");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "file");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)initializeProgress
{
  NSProgress *v3;
  NSProgress *progress;
  _QWORD v5[4];
  id v6;
  id location;

  objc_msgSend(MEMORY[0x24BDD1768], "progressWithTotalUnitCount:", 100);
  v3 = (NSProgress *)objc_claimAutoreleasedReturnValue();
  progress = self->_progress;
  self->_progress = v3;

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__WCSessionFileTransfer_initializeProgress__block_invoke;
  v5[3] = &unk_24D662070;
  objc_copyWeak(&v6, &location);
  -[NSProgress setCancellationHandler:](self->_progress, "setCancellationHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __43__WCSessionFileTransfer_initializeProgress__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  wc_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446210;
    v5 = "-[WCSessionFileTransfer initializeProgress]_block_invoke";
    _os_log_impl(&dword_216F21000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s ", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancel");

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCSessionFileTransfer file](self, "file");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WCSessionFileTransfer isTransferring](self, "isTransferring");
  v8 = "NO";
  if (v7)
    v8 = "YES";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, session file: %@, transferring: %s>"), v5, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  WCSessionFileTransfer *v4;
  WCSessionFileTransfer *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (WCSessionFileTransfer *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[WCSessionFileTransfer transferIdentifier](self, "transferIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WCSessionFileTransfer transferIdentifier](v5, "transferIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WCSessionFileTransfer transferIdentifier](self, "transferIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *transferDate;
  id v5;

  transferDate = self->_transferDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", transferDate, CFSTR("transferDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transferIdentifier, CFSTR("transferIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_file, CFSTR("file"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_transferring, CFSTR("transferring"));

}

- (WCSessionFileTransfer)initWithCoder:(id)a3
{
  id v4;
  WCSessionFileTransfer *v5;
  uint64_t v6;
  NSDate *transferDate;
  void *v8;
  uint64_t v9;
  NSString *transferIdentifier;
  uint64_t v11;
  WCSessionFile *file;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WCSessionFileTransfer;
  v5 = -[WCSessionFileTransfer init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    transferDate = v5->_transferDate;
    v5->_transferDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    transferIdentifier = v5->_transferIdentifier;
    v5->_transferIdentifier = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("file"));
    v11 = objc_claimAutoreleasedReturnValue();
    file = v5->_file;
    v5->_file = (WCSessionFile *)v11;

    v5->_transferring = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("transferring"));
    -[WCSessionFileTransfer initializeProgress](v5, "initializeProgress");
  }

  return v5;
}

- (WCSessionFile)file
{
  return self->_file;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (BOOL)isTransferring
{
  return self->_transferring;
}

- (void)setTransferring:(BOOL)a3
{
  self->_transferring = a3;
}

- (NSDate)transferDate
{
  return self->_transferDate;
}

- (void)setTransferDate:(id)a3
{
  objc_storeStrong((id *)&self->_transferDate, a3);
}

- (NSString)transferIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTransferIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSError)transferError
{
  return (NSError *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTransferError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSProgress)internalProgress
{
  return (NSProgress *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInternalProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (id)progressToken
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setProgressToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressToken, 0);
  objc_storeStrong((id *)&self->_internalProgress, 0);
  objc_storeStrong((id *)&self->_transferError, 0);
  objc_storeStrong((id *)&self->_transferIdentifier, 0);
  objc_storeStrong((id *)&self->_transferDate, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_file, 0);
}

@end

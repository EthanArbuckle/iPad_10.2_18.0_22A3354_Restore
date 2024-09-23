@implementation IMDMessageActiveDevice

- (IMDMessageActiveDevice)initWithIDSDestination:(id)a3 latestDate:(id)a4 latestReadReceiptDate:(id)a5 hasReceivedReadReceipt:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  IMDMessageActiveDevice *v14;
  IMDMessageActiveDevice *v15;
  IMDMessageActiveDevice *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = 0;
  if (v11 && v12)
  {
    v18.receiver = self;
    v18.super_class = (Class)IMDMessageActiveDevice;
    v15 = -[IMDMessageActiveDevice init](&v18, sel_init);
    v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_idsDestination, a3);
      objc_storeStrong((id *)&v16->_latestActiveDate, a4);
      v16->_hasReceivedReadReceipt = a6;
      objc_storeStrong((id *)&v16->_latestReadReceipt, a5);
    }
    self = v16;
    v14 = self;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  IMDMessageActiveDevice *v4;
  NSString *idsDestination;
  void *v6;
  char v7;

  v4 = (IMDMessageActiveDevice *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4 == self)
    {
      v7 = 1;
    }
    else
    {
      idsDestination = self->_idsDestination;
      -[IMDMessageActiveDevice idsDestination](v4, "idsDestination");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSString isEqualToString:](idsDestination, "isEqualToString:", v6);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_hasReceivedReadReceiptRecently
{
  void *v3;
  double v4;
  double v5;
  BOOL result;

  result = self->_hasReceivedReadReceipt
        && (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "timeIntervalSinceDate:", self->_latestReadReceipt),
            v5 = v4,
            v3,
            v5 <= 86400.0)
        && self->_hasReceivedReadReceipt;
  return result;
}

- (BOOL)shouldSendTypingIndicator
{
  void *v3;
  double v4;
  BOOL v5;

  if (!-[IMDMessageActiveDevice _hasReceivedReadReceiptRecently](self, "_hasReceivedReadReceiptRecently"))
    return 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_latestActiveDate);
  v5 = v4 <= 300.0;

  return v5;
}

- (BOOL)shouldDisplayAttachmentDownloadFailure
{
  void *v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_latestActiveDate);
  LOBYTE(self) = v4 <= 86400.0;

  return (char)self;
}

- (BOOL)shouldDisplayRemoteDecryptionFailure
{
  void *v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_latestActiveDate);
  LOBYTE(self) = v4 <= 600.0;

  return (char)self;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("YES");
  if (!self->_hasReceivedReadReceipt)
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@: <Device%@ activeDate:%@ readReceipt:%@, read ReceiptDate %@>]"), v5, self->_idsDestination, self->_latestActiveDate, v7, self->_latestReadReceipt);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)idsDestination
{
  return self->_idsDestination;
}

- (void)setIdsDestination:(id)a3
{
  objc_storeStrong((id *)&self->_idsDestination, a3);
}

- (NSDate)latestActiveDate
{
  return self->_latestActiveDate;
}

- (void)setLatestActiveDate:(id)a3
{
  objc_storeStrong((id *)&self->_latestActiveDate, a3);
}

- (BOOL)hasReceivedReadReceipt
{
  return self->_hasReceivedReadReceipt;
}

- (void)setHasReceivedReadReceipt:(BOOL)a3
{
  self->_hasReceivedReadReceipt = a3;
}

- (NSDate)latestReadReceipt
{
  return self->_latestReadReceipt;
}

- (void)setLatestReadReceipt:(id)a3
{
  objc_storeStrong((id *)&self->_latestReadReceipt, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestReadReceipt, 0);
  objc_storeStrong((id *)&self->_latestActiveDate, 0);
  objc_storeStrong((id *)&self->_idsDestination, 0);
}

@end

@implementation NEIKEv2PrivateNotify

- (NEIKEv2PrivateNotify)initWithNotifyStatus:(unsigned __int16)a3 notifyData:(id)a4
{
  unsigned int v4;
  id v6;
  NEIKEv2PrivateNotify *v7;
  NEIKEv2PrivateNotify *v8;
  NSData *v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  unsigned int v14;
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v4 >> 13 <= 4)
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v4;
      _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "Invalid private notify status %u", buf, 8u);
    }

    goto LABEL_7;
  }
  v12.receiver = self;
  v12.super_class = (Class)NEIKEv2PrivateNotify;
  v7 = -[NEIKEv2PrivateNotify init](&v12, sel_init);
  if (!v7)
  {
    ne_log_obj();
    self = (NEIKEv2PrivateNotify *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19BD16000, &self->super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v8 = v7;
  v7->_notifyStatus = v4;
  v9 = (NSData *)v6;
  self = (NEIKEv2PrivateNotify *)v8->_notifyData;
  v8->_notifyData = v9;
LABEL_8:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[NEIKEv2PrivateNotify notifyStatus](self, "notifyStatus");
  -[NEIKEv2PrivateNotify notifyData](self, "notifyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = (void *)objc_msgSend(v4, "initWithNotifyStatus:notifyData:", v5, v7);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "notifyStatus");
    if (self)
      self->_notifyStatus = v6;
    if (v6)
    {
      -[NEIKEv2PrivateNotify notifyData](self, "notifyData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "notifyData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
      {
        v11 = 1;
      }
      else
      {
        -[NEIKEv2PrivateNotify notifyData](self, "notifyData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "notifyData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  id v3;
  unsigned int v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = -[NEIKEv2PrivateNotify notifyStatus](self, "notifyStatus");
  -[NEIKEv2PrivateNotify notifyData](self, "notifyData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("[Private Notify %u %@]"), v4, v5);

  return v6;
}

- (unsigned)notifyStatus
{
  return self->_notifyStatus;
}

- (NSData)notifyData
{
  return self->_notifyData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifyData, 0);
}

@end

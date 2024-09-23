@implementation AMSDeviceMessengerFilter

- (BOOL)matchesMessage:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  if (!v4)
    goto LABEL_8;
  if (-[AMSDeviceMessengerFilter messageType](self, "messageType"))
  {
    if (-[AMSDeviceMessengerFilter messageType](self, "messageType") != 1)
      goto LABEL_8;
    objc_msgSend(v4, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_8;
  }
  if (!-[AMSDeviceMessengerFilter deviceType](self, "deviceType"))
  {
    LODWORD(v8) = 1;
    goto LABEL_9;
  }
  if (-[AMSDeviceMessengerFilter deviceType](self, "deviceType") == 1)
  {
    objc_msgSend(v4, "origin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v7, "type") == 1;

  }
  else
  {
LABEL_8:
    LODWORD(v8) = 0;
  }
LABEL_9:
  -[AMSDeviceMessengerFilter account](self, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ams_DSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v8 && v10)
  {
    objc_msgSend(v4, "object");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12 = objc_opt_isKindOfClass();

    if ((v12 & 1) != 0)
    {
      objc_msgSend(v4, "object");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", 0x1E2552980);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = &unk_1E25AF428;
      if (v15)
        v17 = (void *)v15;
      v18 = v17;

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v8 = objc_msgSend(v18, "longLongValue");
        LOBYTE(v8) = v8 == objc_msgSend(v10, "longLongValue");
      }
      else
      {
        LOBYTE(v8) = 0;
      }

    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return v8;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(int64_t)a3
{
  self->_messageType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end

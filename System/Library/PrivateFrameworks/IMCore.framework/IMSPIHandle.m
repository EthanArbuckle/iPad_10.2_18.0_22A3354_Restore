@implementation IMSPIHandle

- (IMSPIHandle)initWithAddress:(id)a3 countryCode:(id)a4 isMe:(BOOL)a5
{
  id v9;
  id v10;
  IMSPIHandle *v11;
  IMSPIHandle *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IMSPIHandle;
  v11 = -[IMSPIHandle init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_address, a3);
    objc_storeStrong((id *)&v12->_countryCode, a4);
    v12->_isMe = a5;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMSPIHandle address](self, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSPIHandle businessName](self, "businessName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("IMSPIHandle: %p [Address: %@  Business Name: %@]"), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isBusiness
{
  void *v2;
  char v3;

  -[IMSPIHandle address](self, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1A85827F4]();

  return v3;
}

- (NSString)businessName
{
  void *v2;
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  id v13;
  uint8_t v15[16];
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  -[IMSPIHandle address](self, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!MEMORY[0x1A85827F4]())
  {
    v13 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0D396F8], "placeholderNameForBrandURI:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_semaphore_create(0);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1A200AF14;
  v23 = sub_1A200ACFC;
  v24 = 0;
  +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1A21527E8;
  v16[3] = &unk_1E4723278;
  v18 = &v19;
  v6 = v4;
  v17 = v6;
  objc_msgSend(v5, "businessNameForUID:updateHandler:", v2, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "length");
  v9 = v7;
  if (!v8)
  {
    v10 = dispatch_time(0, 3000000000);
    if (dispatch_semaphore_wait(v6, v10) && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Business name lookup timed out", v15, 2u);
      }

    }
    if (!objc_msgSend((id)v20[5], "length"))
      goto LABEL_11;
    v9 = (void *)v20[5];
  }
  v12 = v9;

  v3 = v12;
LABEL_11:
  v13 = v3;

  _Block_object_dispose(&v19, 8);
LABEL_13:

  return (NSString *)v13;
}

- (id)handle
{
  void *v3;
  void *v4;
  void *v5;
  IMHandle *v6;
  IMHandle *imHandle;

  if (!self->_haveFetchedIMHandle)
  {
    +[IMService iMessageService](IMServiceImpl, "iMessageService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    IMPreferredAccountForService(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      IMStripFormattingFromAddress();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "existingIMHandleWithID:", v5);
      v6 = (IMHandle *)objc_claimAutoreleasedReturnValue();
      imHandle = self->_imHandle;
      self->_imHandle = v6;

      self->_haveFetchedIMHandle = 1;
    }

  }
  return self->_imHandle;
}

- (NSString)displayName
{
  void *v3;
  uint64_t v4;

  -[IMSPIHandle businessName](self, "businessName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "length"))
  {
    -[IMHandle displayNameForChat:](self->_imHandle, "displayNameForChat:", 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return (NSString *)v3;
}

- (NSString)cnContactID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[IMSPIHandle handle](self, "handle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  IMSPIHandle *v4;
  IMSPIHandle *v5;
  NSString *address;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;

  v4 = (IMSPIHandle *)a3;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      address = self->_address;
      -[IMSPIHandle address](v5, "address");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(address) = -[NSString isEqualToString:](address, "isEqualToString:", v7);

      if ((_DWORD)address)
      {
        v8 = !self->_isMe;
        v9 = v8 ^ -[IMSPIHandle isMe](v5, "isMe");
      }
      else
      {
        LOBYTE(v9) = 0;
      }

    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_address, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMe);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (NSString)address
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAddress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (void)setIsMe:(BOOL)a3
{
  self->_isMe = a3;
}

- (NSString)countryCode
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCountryCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_imHandle, 0);
}

@end

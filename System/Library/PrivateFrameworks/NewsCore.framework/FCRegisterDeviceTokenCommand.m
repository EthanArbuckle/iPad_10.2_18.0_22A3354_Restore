@implementation FCRegisterDeviceTokenCommand

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[FCRegisterDeviceTokenCommand userID](self, "userID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("UserIDKey"));

  -[FCRegisterDeviceTokenCommand deviceToken](self, "deviceToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("DeviceTokenKey"));

  -[FCRegisterDeviceTokenCommand storefrontID](self, "storefrontID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("StorefrontIDKey"));

  objc_msgSend(v7, "encodeInt:forKey:", -[FCRegisterDeviceTokenCommand deviceDigestMode](self, "deviceDigestMode"), CFSTR("DigestModeKey"));
}

- (NSString)userID
{
  return self->_userID;
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

- (NSString)deviceToken
{
  return self->_deviceToken;
}

- (int)deviceDigestMode
{
  return self->_deviceDigestMode;
}

- (FCRegisterDeviceTokenCommand)initWithUserID:(id)a3 deviceToken:(id)a4 storefrontID:(id)a5 deviceDigestMode:(int)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  FCRegisterDeviceTokenCommand *v15;
  FCRegisterDeviceTokenCommand *v16;
  FCRegisterDeviceTokenCommand *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = v13;
  v15 = 0;
  if (v11 && v12 && v13)
  {
    v19.receiver = self;
    v19.super_class = (Class)FCRegisterDeviceTokenCommand;
    v16 = -[FCRegisterDeviceTokenCommand init](&v19, sel_init);
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_userID, a3);
      objc_storeStrong((id *)&v17->_deviceToken, a4);
      objc_storeStrong((id *)&v17->_storefrontID, a5);
      v17->_deviceDigestMode = a6;
    }
    self = v17;
    v15 = self;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCRegisterDeviceTokenCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  FCRegisterDeviceTokenCommand *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceTokenKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("StorefrontIDKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("DigestModeKey"));

  v9 = -[FCRegisterDeviceTokenCommand initWithUserID:deviceToken:storefrontID:deviceDigestMode:](self, "initWithUserID:deviceToken:storefrontID:deviceDigestMode:", v5, v6, v7, v8);
  return v9;
}

- (void)executeWithContext:(id)a3 delegate:(id)a4 qualityOfService:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  FCRegisterDeviceTokenCommand *v17;

  v7 = a4;
  objc_msgSend(a3, "notificationsEndpointConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRegisterDeviceTokenCommand userID](self, "userID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRegisterDeviceTokenCommand deviceToken](self, "deviceToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRegisterDeviceTokenCommand storefrontID](self, "storefrontID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[FCRegisterDeviceTokenCommand deviceDigestMode](self, "deviceDigestMode");
  dispatch_get_global_queue(-2, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__FCRegisterDeviceTokenCommand_executeWithContext_delegate_qualityOfService___block_invoke;
  v15[3] = &unk_1E463BC78;
  v16 = v7;
  v17 = self;
  v14 = v7;
  objc_msgSend(v8, "registerDeviceWithUserID:deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:", v9, v10, v11, v12, v13, v15);

}

void __77__FCRegisterDeviceTokenCommand_executeWithContext_delegate_qualityOfService___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 0;
  }
  else if (objc_msgSend(v5, "fc_isNetworkUnavailableError"))
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 1;
  }
  else
  {
    v9 = objc_msgSend(v10, "fc_shouldRetry");
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    if (v9)
      v8 = 2;
    else
      v8 = 3;
  }
  objc_msgSend(v6, "command:didFinishWithStatus:", v7, v8);

}

- (void)setUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setDeviceToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setStorefrontID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setDeviceDigestMode:(int)a3
{
  self->_deviceDigestMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontID, 0);
  objc_storeStrong((id *)&self->_deviceToken, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

@end

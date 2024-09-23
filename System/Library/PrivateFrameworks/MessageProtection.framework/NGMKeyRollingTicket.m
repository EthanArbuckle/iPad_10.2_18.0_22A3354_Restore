@implementation NGMKeyRollingTicket

- (id)initTicketWithSigningKey:(id)a3 error:(id *)a4
{
  id v6;
  NGMKeyRollingTicket *v7;
  NGMFullPrekey *v8;
  NGMFullPrekey *prekey;
  NGMPublicDeviceIdentity *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NGMPublicDeviceIdentity *registrationInfo;
  NGMKeyRollingTicket *v16;
  NSObject *v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NGMKeyRollingTicket;
  v7 = -[NGMKeyRollingTicket init](&v19, sel_init);
  if (!v7)
    goto LABEL_4;
  v8 = -[NGMFullPrekey initWithPrekeySignedBy:error:]([NGMFullPrekey alloc], "initWithPrekeySignedBy:error:", v6, a4);
  prekey = v7->_prekey;
  v7->_prekey = v8;

  if (!v7->_prekey)
  {
    MessageProtectionLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[NGMKeyRollingTicket initTicketWithSigningKey:error:].cold.1(v17);

    goto LABEL_9;
  }
  v10 = [NGMPublicDeviceIdentity alloc];
  -[NGMFullPrekey publicPrekey](v7->_prekey, "publicPrekey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMFullPrekey tetraRegistration](v7->_prekey, "tetraRegistration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "publicKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NGMPublicDeviceIdentity initWithEchnidaRegistration:tetraRegistration:signingKey:](v10, "initWithEchnidaRegistration:tetraRegistration:signingKey:", v11, v12, v13);
  registrationInfo = v7->_registrationInfo;
  v7->_registrationInfo = (NGMPublicDeviceIdentity *)v14;

  if (!v7->_registrationInfo)
  {
    MPLogAndAssignError(700, a4, CFSTR("Failed to initialize the public identity."));
LABEL_9:
    v16 = 0;
    goto LABEL_10;
  }
LABEL_4:
  v16 = v7;
LABEL_10:

  return v16;
}

- (id)identityData
{
  void *v2;
  void *v3;

  -[NGMKeyRollingTicket registrationInfo](self, "registrationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identityData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)prekeyData
{
  void *v2;
  void *v3;

  -[NGMKeyRollingTicket registrationInfo](self, "registrationInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prekeyData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)publicDeviceIdentity
{
  return self->_registrationInfo;
}

- (NGMFullPrekey)prekey
{
  return self->_prekey;
}

- (NGMPublicDeviceIdentity)registrationInfo
{
  return self->_registrationInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationInfo, 0);
  objc_storeStrong((id *)&self->_prekey, 0);
}

- (void)initTicketWithSigningKey:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20BABB000, log, OS_LOG_TYPE_ERROR, "Failed to generate a key rolling ticket because of failed prekey generation.", v1, 2u);
}

@end

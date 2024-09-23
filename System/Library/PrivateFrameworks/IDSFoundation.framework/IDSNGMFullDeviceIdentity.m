@implementation IDSNGMFullDeviceIdentity

+ (IDSNGMFullDeviceIdentity)identityWithAccess:(id)a3 usageIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  Class v9;
  const char *v10;
  uint64_t v11;
  double v12;
  void *v13;
  NSObject *v14;

  v7 = a3;
  v8 = a4;
  v9 = NSClassFromString(CFSTR("NGMFullDeviceIdentity"));
  if (v9)
  {
    objc_msgSend_identityWithAccess_usageIdentifier_error_(v9, v10, (uint64_t)v7, v12, v8, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v10, v11, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      sub_19BAF4E04();

    v13 = 0;
  }

  return (IDSNGMFullDeviceIdentity *)v13;
}

+ (IDSNGMFullDeviceIdentity)identityWithDataRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  Class v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  NSObject *v11;

  v5 = a3;
  v6 = NSClassFromString(CFSTR("NGMFullDeviceIdentity"));
  if (v6)
  {
    objc_msgSend_identityWithDataRepresentation_error_(v6, v7, (uint64_t)v5, v9, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v7, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      sub_19BAF4E04();

    v10 = 0;
  }

  return (IDSNGMFullDeviceIdentity *)v10;
}

- (id)dataRepresentationWithError:(id *)a3
{
  double v3;
  NSObject *v4;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    sub_19BAF4E30();

  return 0;
}

- (id)publicDeviceIdentityWithError:(id *)a3
{
  double v3;
  NSObject *v4;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    sub_19BAF4EAC();

  return 0;
}

- (BOOL)eraseFromKeyChain:(id *)a3
{
  double v3;
  NSObject *v4;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    sub_19BAF4F28();

  return 0;
}

- (id)unsealMessage:(id)a3 signedByPublicIdentity:(id)a4 error:(id *)a5
{
  double v5;
  NSObject *v6;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v5, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    sub_19BAF4FA4();

  return 0;
}

- (void)unsealMessage:(id)a3 signedByPublicIdentity:(id)a4 decryptionBlock:(id)a5
{
  double v5;
  NSObject *v6;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v5, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    sub_19BAF5020();

}

- (void)unsealMessageAndAttributes:(id)a3 signedByPublicIdentity:(id)a4 decryptionBlock:(id)a5
{
  double v5;
  NSObject *v6;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v5, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    sub_19BAF509C();

}

- (void)unsealMessageAndAttributes:(id)a3 guid:(id)a4 signedByPublicIdentity:(id)a5 decryptionBlock:(id)a6
{
  double v6;
  NSObject *v7;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v6, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    sub_19BAF5118();

}

- (void)unsealMessageAndAttributes:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 signedByPublicIdentity:(id)a11 decryptionBlock:(id)a12
{
  double v12;
  NSObject *v13;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v12, a4, a5, a6, a7, a8);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    sub_19BAF5194();

}

- (void)openPaddyMessage:(id)a3 sendingURI:(id)a4 sendingPushToken:(id)a5 receivingURI:(id)a6 receivingPushToken:(id)a7 signedByPublicIdentity:(id)a8 decryptionBlock:(id)a9
{
  double v9;
  NSObject *v10;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v9, a4, a5, a6, a7, a8);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    sub_19BAF5210();

}

- (BOOL)shouldRollEncryptionIdentity
{
  uint64_t v2;
  double v3;
  NSObject *v4;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    sub_19BAF528C();

  return 0;
}

- (id)keyRollingTicketWithError:(id *)a3
{
  double v3;
  NSObject *v4;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    sub_19BAF5308();

  return 0;
}

- (BOOL)updateWithRegisteredTicket:(id)a3 error:(id *)a4
{
  double v4;
  NSObject *v5;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v4, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    sub_19BAF5384();

  return 0;
}

- (id)sign:(id)a3 forType:(int64_t)a4 error:(id *)a5
{
  double v5;
  NSObject *v6;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v5, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    sub_19BAF5400();

  return 0;
}

- (id)batchSign:(id)a3 forType:(int64_t)a4 error:(id *)a5
{
  double v5;
  NSObject *v6;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v5, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    sub_19BAF547C();

  return 0;
}

@end

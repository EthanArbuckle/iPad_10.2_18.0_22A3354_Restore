@implementation IDSNGMPublicDeviceIdentity

+ (IDSNGMPublicDeviceIdentity)identityWithDataRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  Class v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  NSObject *v11;

  v5 = a3;
  v6 = NSClassFromString(CFSTR("NGMPublicDeviceIdentity"));
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
      sub_19BAF54F8();

    v10 = 0;
  }

  return (IDSNGMPublicDeviceIdentity *)v10;
}

+ (IDSNGMPublicDeviceIdentity)identityWithIdentityData:(id)a3 prekeyData:(id)a4 error:(id *)a5
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
  v9 = NSClassFromString(CFSTR("NGMPublicDeviceIdentity"));
  if (v9)
  {
    objc_msgSend_identityWithIdentityData_prekeyData_error_(v9, v10, (uint64_t)v7, v12, v8, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v10, v11, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      sub_19BAF54F8();

    v13 = 0;
  }

  return (IDSNGMPublicDeviceIdentity *)v13;
}

- (id)dataRepresentationWithError:(id *)a3
{
  double v3;
  NSObject *v4;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    sub_19BAF5524();

  return 0;
}

- (id)identityData
{
  uint64_t v2;
  double v3;
  NSObject *v4;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    sub_19BAF55A0();

  return 0;
}

- (BOOL)isIdenticalIdentityTo:(id)a3
{
  double v3;
  NSObject *v4;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    sub_19BAF561C();

  return 0;
}

- (id)prekeyData
{
  uint64_t v2;
  double v3;
  NSObject *v4;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    sub_19BAF5698();

  return 0;
}

- (id)sealMessage:(id)a3 signedByFullIdentity:(id)a4 error:(id *)a5
{
  double v5;
  NSObject *v6;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v5, a4, a5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    sub_19BAF5714();

  return 0;
}

- (id)sealMessage:(id)a3 withEncryptedAttributes:(id)a4 signedByFullIdentity:(id)a5 error:(id *)a6
{
  double v6;
  NSObject *v7;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v6, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    sub_19BAF5790();

  return 0;
}

- (id)sealMessage:(id)a3 forceSizeOptimizations:(BOOL)a4 resetState:(BOOL)a5 encryptedAttributes:(id)a6 signedByFullIdentity:(id)a7 errors:(id *)a8
{
  double v8;
  NSObject *v9;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v8, a4, a5, a6, a7, a8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    sub_19BAF580C();

  return 0;
}

- (id)sealMessage:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 forceSizeOptimizations:(BOOL)a11 resetState:(BOOL)a12 encryptedAttributes:(id)a13 signedByFullIdentity:(id)a14 errors:(id *)a15
{
  double v15;
  NSObject *v16;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v15, a4, a5, a6, a7, a8);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    sub_19BAF5888();

  return 0;
}

- (id)sealPaddyMessage:(id)a3 sendingURI:(id)a4 sendingPushToken:(id)a5 receivingURI:(id)a6 receivingPushToken:(id)a7 signedByFullIdentity:(id)a8 error:(id *)a9
{
  double v9;
  NSObject *v10;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v9, a4, a5, a6, a7, a8);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    sub_19BAF5904();

  return 0;
}

- (BOOL)isValidSignature:(id)a3 forMessage:(id)a4 forType:(int64_t)a5 error:(id *)a6
{
  double v6;
  NSObject *v7;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v6, a4, a5, a6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    sub_19BAF5980();

  return 0;
}

- (BOOL)markForStateResetWithOurURI:(id)a3 ourPushToken:(id)a4 ourSigningIdentity:(id)a5 theirURI:(id)a6 theirPushToken:(id)a7
{
  double v7;
  NSObject *v8;

  objc_msgSend_registration(MEMORY[0x1E0D36AA8], a2, (uint64_t)a3, v7, a4, a5, a6, a7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    sub_19BAF59FC();

  return 0;
}

+ (BOOL)shouldMarkForStateReset:(id)a3
{
  id v3;
  Class v4;
  const char *v5;
  uint64_t v6;
  double v7;
  char shouldMarkForStateReset;
  NSObject *v9;

  v3 = a3;
  v4 = NSClassFromString(CFSTR("NGMPublicDeviceIdentity"));
  if (v4)
  {
    shouldMarkForStateReset = objc_msgSend_shouldMarkForStateReset_(v4, v5, (uint64_t)v3, v7);
  }
  else
  {
    objc_msgSend_registration(MEMORY[0x1E0D36AA8], v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      sub_19BAF54F8();

    shouldMarkForStateReset = 0;
  }

  return shouldMarkForStateReset;
}

@end

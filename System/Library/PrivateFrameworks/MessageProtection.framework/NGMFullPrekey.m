@implementation NGMFullPrekey

+ (id)fullPrekeyForTestingSignedBy:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "signingKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v7 = (void *)objc_msgSend(v5, "initWithPrekeySignedBy:error:", v6, &v10);
  v8 = v10;

  if (v8)
    +[NGMFullPrekey fullPrekeyForTestingSignedBy:].cold.1();

  return v7;
}

- (BOOL)isSEPKey
{
  void *v2;
  BOOL v3;

  -[NGMFullPrekey dhKey](self, "dhKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "keyStore") == 2;

  return v3;
}

+ (id)newCompactPrivateKey
{
  +[SecKeyP256Private compactPrivateKeyWithAccessControl:](SecKeyP256Private, "compactPrivateKeyWithAccessControl:", *MEMORY[0x24BDE8F70]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)keychainData
{
  void *v2;
  void *v3;
  void *v4;

  -[NGMFullPrekey dhKey](self, "dhKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keychainData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NGMFullPrekey)initWithPrekeySignedBy:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  NGMFullPrekey *v14;
  NGMFullPrekey *v15;
  NGMECDHPublicPreKey *v16;
  uint64_t v17;
  NGMECDHPublicPreKey *publicPrekey;
  _TtC17MessageProtection17TetraRegistration *tetraRegistration;
  void *tetraPrivateKey;
  NGMFullPrekey *v21;
  NSObject *v22;
  uint64_t v23;
  _TtC17MessageProtection23Kyber1024ObjCPrivateKey *v24;
  void *v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _TtC17MessageProtection17TetraRegistration *v31;
  _TtC17MessageProtection17TetraRegistration *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v6 = a3;
  +[SecKeyP256Private defaultProtectionClassForPlatform](SecKeyP256Private, "defaultProtectionClassForPlatform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FullKey generateNewKeyWithAccess:error:](DHKey, "generateNewKeyWithAccess:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "publicKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[NGMPrekeySignatureFormatter initToSignKey:]([NGMPrekeySignatureFormatter alloc], "initToSignKey:", v9);
    if (!v10)
    {
      MPLogAndAssignError(151, a4, CFSTR("Time is misconfigured on device."));
      v21 = 0;
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend(v6, "signDataWithFormatter:error:", v10, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v6, "publicKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "verifySignature:formatter:", v11, v10);

      if ((v13 & 1) != 0)
      {
        v37.receiver = self;
        v37.super_class = (Class)NGMFullPrekey;
        v14 = -[NGMFullPrekey init](&v37, sel_init);
        v15 = v14;
        if (v14)
        {
          objc_storeStrong((id *)&v14->_dhKey, v8);
          v16 = [NGMECDHPublicPreKey alloc];
          objc_msgSend(v10, "timestamp");
          v17 = -[NGMECDHPublicPreKey initWithPublicKey:signature:timestamp:](v16, "initWithPublicKey:signature:timestamp:", v9, v11);
          publicPrekey = v15->_publicPrekey;
          v15->_publicPrekey = (NGMECDHPublicPreKey *)v17;

          if ((MPSecondaryRegistrationDisabled() & 1) != 0)
          {
            tetraRegistration = v15->_tetraRegistration;
            v15->_tetraRegistration = 0;

            tetraPrivateKey = v15->_tetraPrivateKey;
            v15->_tetraPrivateKey = 0;
          }
          else
          {
            +[Kyber1024ObjC KeyGen](_TtC17MessageProtection13Kyber1024ObjC, "KeyGen");
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = v15->_tetraPrivateKey;
            v15->_tetraPrivateKey = (_TtC17MessageProtection23Kyber1024ObjCPrivateKey *)v23;

            v33 = [_TtC17MessageProtection17TetraRegistration alloc];
            -[Kyber1024ObjCPrivateKey publicKey](v15->_tetraPrivateKey, "publicKey");
            tetraPrivateKey = (void *)objc_claimAutoreleasedReturnValue();
            -[NGMFullPrekey dhKey](v15, "dhKey");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "publicKey");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "key");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "dataRepresentation");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "timestamp");
            v27 = v26;
            v28 = +[TetraVersions currentTetraVersion](_TtC17MessageProtection13TetraVersions, "currentTetraVersion");
            objc_msgSend(v6, "tetraWrapped");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = -[TetraRegistration initWithKyberPublicKey:ecdhPublicKey:timestamp:version:signedBy:](v33, "initWithKyberPublicKey:ecdhPublicKey:timestamp:version:signedBy:", tetraPrivateKey, v25, v28, v29, v27);
            v31 = v15->_tetraRegistration;
            v15->_tetraRegistration = (_TtC17MessageProtection17TetraRegistration *)v30;

          }
        }
        self = v15;
        v21 = self;
        goto LABEL_18;
      }
      MPLogAndAssignError(201, a4, CFSTR("Failure to verify the signature for the freshly generated prekey."));
    }
    else
    {
      MessageProtectionLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[NGMFullPrekey initWithPrekeySignedBy:error:].cold.1(a4, v22);

    }
    v21 = 0;
LABEL_18:

    goto LABEL_19;
  }
  MPLogAndAssignError(7, a4, CFSTR("Failure to get the public prekey of a new ephemeral."));
  v21 = 0;
LABEL_20:

  return v21;
}

- (NGMFullPrekey)initWithPBPrekey:(id)a3 verifySignedBy:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NGMFullPrekey *v10;
  DHKey *v11;
  void *v12;
  uint64_t v13;
  DHKey *dhKey;
  NGMECDHPublicPreKey *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NGMECDHPublicPreKey *publicPrekey;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NGMFullPrekey *v27;
  _TtC17MessageProtection23Kyber1024ObjCPrivateKey *v28;
  void *v29;
  uint64_t v30;
  id v31;
  _TtC17MessageProtection23Kyber1024ObjCPrivateKey *tetraPrivateKey;
  void *v33;
  void *v34;
  void *v35;
  _TtC17MessageProtection17TetraRegistration *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  double v41;
  double v42;
  void *v43;
  _TtC17MessageProtection17TetraRegistration *v44;
  void *v45;
  uint64_t v46;
  _TtC17MessageProtection17TetraRegistration *tetraRegistration;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v54;
  id v55;
  id v56;
  objc_super v57;

  v8 = a3;
  v9 = a4;
  v57.receiver = self;
  v57.super_class = (Class)NGMFullPrekey;
  v10 = -[NGMFullPrekey init](&v57, sel_init);
  if (!v10)
    goto LABEL_11;
  v11 = [DHKey alloc];
  objc_msgSend(v8, "dhKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[FullKey initWithProtobufferData:error:](v11, "initWithProtobufferData:error:", v12, a5);
  dhKey = v10->_dhKey;
  v10->_dhKey = (DHKey *)v13;

  v15 = [NGMECDHPublicPreKey alloc];
  -[DHKey publicKey](v10->_dhKey, "publicKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prekeySignature");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timestamp");
  v18 = -[NGMECDHPublicPreKey initWithPublicKey:signature:timestamp:](v15, "initWithPublicKey:signature:timestamp:", v16, v17);
  publicPrekey = v10->_publicPrekey;
  v10->_publicPrekey = (NGMECDHPublicPreKey *)v18;

  if (!a5 || !*a5)
  {
    if (objc_msgSend(v8, "hasTetraPrivateKey"))
    {
      v28 = [_TtC17MessageProtection23Kyber1024ObjCPrivateKey alloc];
      objc_msgSend(v8, "tetraPrivateKey");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 0;
      v30 = -[Kyber1024ObjCPrivateKey initWithProtoBufData:error:](v28, "initWithProtoBufData:error:", v29, &v56);
      v31 = v56;
      tetraPrivateKey = v10->_tetraPrivateKey;
      v10->_tetraPrivateKey = (_TtC17MessageProtection23Kyber1024ObjCPrivateKey *)v30;

      if (v31)
      {
        v33 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v31, "description");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("Failed to deserialize a prekey containing a Kyber key because of error: %@"), v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        MPLogAndAssignError(200, a5, v35);
LABEL_10:

        goto LABEL_11;
      }
      v36 = [_TtC17MessageProtection17TetraRegistration alloc];
      objc_msgSend(v8, "tetraRegistrationData");
      v37 = objc_claimAutoreleasedReturnValue();
      -[FullKey key](v10->_dhKey, "key");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "publicKey");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "dataRepresentation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v8, "tetraVersion");
      objc_msgSend(v8, "timestamp");
      v42 = v41;
      objc_msgSend(v9, "tetraWrapped");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0;
      v44 = v36;
      v45 = (void *)v37;
      v46 = -[TetraRegistration initWithTetraRegistrationData:ecdhPublicKey:version:timestamp:signedBy:isEncrypting:error:](v44, "initWithTetraRegistrationData:ecdhPublicKey:version:timestamp:signedBy:isEncrypting:error:", v37, v39, v40, v43, 0, &v55, v42);
      v31 = v55;
      tetraRegistration = v10->_tetraRegistration;
      v10->_tetraRegistration = (_TtC17MessageProtection17TetraRegistration *)v46;

      if (v31)
      {
        v48 = (void *)MEMORY[0x24BDD17C8];
        -[Kyber1024ObjCPrivateKey publicKey](v10->_tetraPrivateKey, "publicKey");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "prekeySignature");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timestamp");
        v50 = v49;
        objc_msgSend(v31, "description");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "stringWithFormat:", CFSTR("Failed to deserialize a prekey containing a Kyber key: %@ \n signature: %@ \n timestamp: %f \n because of error: %@"), v34, v35, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        MPLogAndAssignError(200, a5, v52);

        goto LABEL_10;
      }
    }
LABEL_11:
    v27 = v10;
    goto LABEL_12;
  }
  v20 = (void *)MEMORY[0x24BDD17C8];
  -[DHKey publicKey](v10->_dhKey, "publicKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prekeySignature");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timestamp");
  v24 = v23;
  objc_msgSend(*a5, "description");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("Failed to deserialize a prekey containing an ECDH private key: %@ \n signature: %@ \n timestamp: %f \n because of error: %@"), v21, v22, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  MPLogAndAssignError(200, a5, v26);

  v27 = 0;
LABEL_12:

  return v27;
}

- (id)pbDevicePrekey
{
  NGMPBDevicePreKey *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = objc_alloc_init(NGMPBDevicePreKey);
  -[NGMFullPrekey publicPrekey](self, "publicPrekey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  -[NGMPBDevicePreKey setTimestamp:](v3, "setTimestamp:");

  -[NGMFullPrekey dhKey](self, "dhKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "protobuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMPBDevicePreKey setDhKey:](v3, "setDhKey:", v6);

  -[NGMFullPrekey publicPrekey](self, "publicPrekey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "signature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMPBDevicePreKey setPrekeySignature:](v3, "setPrekeySignature:", v8);

  -[NGMFullPrekey tetraPrivateKey](self, "tetraPrivateKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MessageProtectionLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v11)
      -[NGMFullPrekey pbDevicePrekey].cold.2(v10, v12, v13, v14, v15, v16, v17, v18);

    -[NGMFullPrekey tetraPrivateKey](self, "tetraPrivateKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "protobufData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NGMPBDevicePreKey setTetraPrivateKey:](v3, "setTetraPrivateKey:", v20);

    -[NGMFullPrekey tetraRegistration](self, "tetraRegistration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "registrationData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NGMPBDevicePreKey setTetraRegistrationData:](v3, "setTetraRegistrationData:", v22);

    -[NGMFullPrekey tetraRegistration](self, "tetraRegistration");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NGMPBDevicePreKey setTetraVersion:](v3, "setTetraVersion:", -[NSObject tetraVersion](v10, "tetraVersion"));
  }
  else if (v11)
  {
    -[NGMFullPrekey pbDevicePrekey].cold.1(v10, v12, v13, v14, v15, v16, v17, v18);
  }

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NGMFullPrekey dhKey](self, "dhKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMFullPrekey publicPrekey](self, "publicPrekey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("NGMFullPrekey with DHKey: %@\n Public Prekey: %@."), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)delete
{
  void *v3;
  char v4;
  NSObject *v5;

  +[NGMReplayManager sharedManager](NGMReplayManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deleteReceivingCountersForKey:", self);

  if ((v4 & 1) == 0)
  {
    MessageProtectionLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[NGMFullPrekey delete].cold.1(self, v5);

  }
  return v4;
}

- (_TtC17MessageProtection17TetraRegistration)tetraRegistration
{
  return self->_tetraRegistration;
}

- (_TtC17MessageProtection23Kyber1024ObjCPrivateKey)tetraPrivateKey
{
  return self->_tetraPrivateKey;
}

- (DHKey)dhKey
{
  return self->_dhKey;
}

- (NGMECDHPublicPreKey)publicPrekey
{
  return self->_publicPrekey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicPrekey, 0);
  objc_storeStrong((id *)&self->_dhKey, 0);
  objc_storeStrong((id *)&self->_tetraPrivateKey, 0);
  objc_storeStrong((id *)&self->_tetraRegistration, 0);
}

+ (void)fullPrekeyForTestingSignedBy:.cold.1()
{
  __assert_rtn("+[NGMFullPrekey fullPrekeyForTestingSignedBy:]", "NGMFullPrekey.m", 63, "error == nil");
}

- (void)initWithPrekeySignedBy:(id *)a1 error:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_20BABB000, a2, OS_LOG_TYPE_ERROR, "Failed to sign a new prekey with error: %@", (uint8_t *)&v4, 0xCu);

}

- (void)pbDevicePrekey
{
  OUTLINED_FUNCTION_0_2(&dword_20BABB000, a1, a3, "Serializing prekey with Tetra key.", a5, a6, a7, a8, 0);
}

- (void)delete
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dhKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(0, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_20BABB000, a2, OS_LOG_TYPE_ERROR, "Failed to delete prekey ephemeral key (%@) with error: %@", (uint8_t *)&v6, 0x16u);

}

@end

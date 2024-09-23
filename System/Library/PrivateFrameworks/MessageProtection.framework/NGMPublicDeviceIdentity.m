@implementation NGMPublicDeviceIdentity

- (NGMPublicDeviceIdentity)initWithEchnidaRegistration:(id)a3 tetraRegistration:(id)a4 signingKey:(id)a5
{
  id v9;
  id v10;
  id v11;
  NGMPublicDeviceIdentity *v12;
  NGMPublicDeviceIdentity *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NGMPublicDeviceIdentity;
  v12 = -[NGMPublicDeviceIdentity init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_signingKey, a5);
    objc_storeStrong((id *)&v13->_echnidaRegistration, a3);
    objc_storeStrong((id *)&v13->_tetraRegistration, a4);
  }

  return v13;
}

+ (NGMPublicDeviceIdentity)identityWithIdentityData:(id)a3 prekeyData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NGMPBPublicDeviceIdentity *v10;
  void *v11;
  SigningPublicKey *v12;
  void *v13;
  SigningPublicKey *v14;
  NGMPBPublicDevicePrekey *v15;
  NGMPBPublicDevicePrekey *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  _TtC17MessageProtection17TetraRegistration *v26;
  void *v27;
  unsigned int v29;
  _TtC17MessageProtection17TetraRegistration *v30;
  void *v31;
  void *v32;

  v8 = a4;
  v9 = a3;
  v10 = -[NGMPBPublicDeviceIdentity initWithData:]([NGMPBPublicDeviceIdentity alloc], "initWithData:", v9);

  if (v10
    && (-[NGMPBPublicDeviceIdentity signingKey](v10, "signingKey"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    v12 = [SigningPublicKey alloc];
    -[NGMPBPublicDeviceIdentity signingKey](v10, "signingKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PublicKey initWithData:error:](v12, "initWithData:error:", v13, a5);

    if (v14)
    {
      v15 = -[NGMPBPublicDevicePrekey initWithData:]([NGMPBPublicDevicePrekey alloc], "initWithData:", v8);
      v16 = v15;
      if (v15
        && (-[NGMPBPublicDevicePrekey prekey](v15, "prekey"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v17,
            v17))
      {
        v18 = -[NGMECDHPublicPreKey initRemotePrekeyWithPublicPrekeyPB:signedBy:error:]([NGMECDHPublicPreKey alloc], "initRemotePrekeyWithPublicPrekeyPB:signedBy:error:", v16, v14, a5);
        v19 = v18;
        if (v18
          && (objc_msgSend(v18, "dhKey"), v20 = (void *)objc_claimAutoreleasedReturnValue(), v20, v20))
        {
          if (+[TetraVersions isWireCompatibleWith:](_TtC17MessageProtection13TetraVersions, "isWireCompatibleWith:", -[NGMPBPublicDeviceIdentity tetraVersion](v10, "tetraVersion")))
          {
            v30 = [_TtC17MessageProtection17TetraRegistration alloc];
            -[NGMPBPublicDevicePrekey tetraPreKey](v16, "tetraPreKey");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "dhKey");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "key");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "dataRepresentation");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = -[NGMPBPublicDeviceIdentity tetraVersion](v10, "tetraVersion");
            -[NGMPBPublicDevicePrekey timestamp](v16, "timestamp");
            v24 = v23;
            -[SigningPublicKey tetraWrapped](v14, "tetraWrapped");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = -[TetraRegistration initWithTetraRegistrationData:ecdhPublicKey:version:timestamp:signedBy:isEncrypting:error:](v30, "initWithTetraRegistrationData:ecdhPublicKey:version:timestamp:signedBy:isEncrypting:error:", v21, v22, v29, v25, 1, a5, v24);

          }
          else
          {
            NSLog(CFSTR("Tetra version mismatch. Versions: Theirs: %u, Ours: %ld"), -[NGMPBPublicDeviceIdentity tetraVersion](v10, "tetraVersion"), +[TetraVersions currentTetraVersion](_TtC17MessageProtection13TetraVersions, "currentTetraVersion"));
            v26 = 0;
          }
          v27 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEchnidaRegistration:tetraRegistration:signingKey:", v19, v26, v14);

        }
        else
        {
          v27 = 0;
        }

      }
      else
      {
        MPLogAndAssignError(100, a5, CFSTR("Failed to deserialize the device public prekey."));
        v27 = 0;
      }

    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    MPLogAndAssignError(302, a5, CFSTR("The deserialization of the public fixed device identity failed."));
    v27 = 0;
  }

  return (NGMPublicDeviceIdentity *)v27;
}

- (id)identityData
{
  NGMPBPublicDeviceIdentity *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v3 = objc_alloc_init(NGMPBPublicDeviceIdentity);
  -[NGMPublicDeviceIdentity signingKey](self, "signingKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMPBPublicDeviceIdentity setSigningKey:](v3, "setSigningKey:", v5);

  -[NGMPublicDeviceIdentity tetraRegistration](self, "tetraRegistration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NGMPublicDeviceIdentity tetraRegistration](self, "tetraRegistration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NGMPBPublicDeviceIdentity setTetraVersion:](v3, "setTetraVersion:", objc_msgSend(v7, "tetraVersion"));

  }
  -[NGMPBPublicDeviceIdentity signingKey](v3, "signingKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NGMPBPublicDeviceIdentity data](v3, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    MessageProtectionLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[NGMPublicDeviceIdentity identityData].cold.1();

    v9 = 0;
  }

  return v9;
}

- (BOOL)isIdenticalIdentityTo:(id)a3
{
  id v4;
  NGMPBPublicDeviceIdentity *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  NSObject *v16;
  BOOL v17;

  v4 = a3;
  v5 = -[NGMPBPublicDeviceIdentity initWithData:]([NGMPBPublicDeviceIdentity alloc], "initWithData:", v4);

  if (!v5
    || (-[NGMPBPublicDeviceIdentity signingKey](v5, "signingKey"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    MessageProtectionLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[NGMPublicDeviceIdentity isIdenticalIdentityTo:].cold.1();
    goto LABEL_13;
  }
  -[NGMPublicDeviceIdentity signingKey](self, "signingKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMPBPublicDeviceIdentity signingKey](v5, "signingKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToData:", v9);

  if ((v10 & 1) == 0)
  {
    MessageProtectionLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[NGMPublicDeviceIdentity isIdenticalIdentityTo:].cold.3();
LABEL_13:
    v17 = 0;
    goto LABEL_14;
  }
  -[NGMPublicDeviceIdentity tetraRegistration](self, "tetraRegistration");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11
    || (v12 = (void *)v11,
        -[NGMPublicDeviceIdentity tetraRegistration](self, "tetraRegistration"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "tetraVersion"),
        v15 = -[NGMPBPublicDeviceIdentity tetraVersion](v5, "tetraVersion"),
        v13,
        v12,
        v14 >= v15))
  {
    v17 = 1;
    goto LABEL_15;
  }
  MessageProtectionLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[NGMPublicDeviceIdentity isIdenticalIdentityTo:].cold.2();
  v17 = 1;
LABEL_14:

LABEL_15:
  return v17;
}

- (id)prekeyData
{
  NGMPBPublicDevicePrekey *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v22;

  v3 = objc_alloc_init(NGMPBPublicDevicePrekey);
  -[NGMPublicDeviceIdentity echnidaRegistration](self, "echnidaRegistration");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "timestamp");
  -[NGMPBPublicDevicePrekey setTimestamp:](v3, "setTimestamp:");

  -[NGMPublicDeviceIdentity echnidaRegistration](self, "echnidaRegistration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  LOBYTE(v4) = +[NGMTimeBasedEvaluations validateFetchedPrekeyTimestamp:forEvaluationType:](NGMTimeBasedEvaluations, "validateFetchedPrekeyTimestamp:forEvaluationType:", 1);

  if ((v4 & 1) == 0)
  {
    MessageProtectionLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[NGMPublicDeviceIdentity prekeyData].cold.2();
    v19 = 0;
    goto LABEL_16;
  }
  -[NGMPublicDeviceIdentity echnidaRegistration](self, "echnidaRegistration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dhKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMPBPublicDevicePrekey setPrekey:](v3, "setPrekey:", v8);

  -[NGMPBPublicDevicePrekey prekey](v3, "prekey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[NGMPublicDeviceIdentity echnidaRegistration](self, "echnidaRegistration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "signature");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NGMPBPublicDevicePrekey setPrekeySignature:](v3, "setPrekeySignature:", v11);

    -[NGMPublicDeviceIdentity tetraRegistration](self, "tetraRegistration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[NGMPublicDeviceIdentity tetraRegistration](self, "tetraRegistration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "registrationData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NGMPBPublicDevicePrekey setTetraPreKey:](v3, "setTetraPreKey:", v14);

    }
    -[NGMPBPublicDevicePrekey data](v3, "data");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NGMPublicDeviceIdentity identityData](self, "identityData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    +[NGMPublicDeviceIdentity identityWithIdentityData:prekeyData:error:](NGMPublicDeviceIdentity, "identityWithIdentityData:prekeyData:error:", v16, v15, &v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v22;

    if (v18 || !v17)
    {
      MessageProtectionLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[NGMPublicDeviceIdentity prekeyData].cold.1(v18);

      v19 = 0;
    }
    else
    {
      v19 = v15;
    }

LABEL_16:
    goto LABEL_17;
  }
  v19 = 0;
LABEL_17:

  return v19;
}

- (BOOL)verifySignature:(id)a3 formatter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[NGMPublicDeviceIdentity signingKey](self, "signingKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "verifySignature:formatter:", v7, v6);

  return v9;
}

- (BOOL)isValidSigningDestination
{
  void *v2;
  BOOL v3;

  -[NGMPublicDeviceIdentity echnidaRegistration](self, "echnidaRegistration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  v3 = +[NGMTimeBasedEvaluations validateFetchedPrekeyTimestamp:forEvaluationType:](NGMTimeBasedEvaluations, "validateFetchedPrekeyTimestamp:forEvaluationType:", 1);

  return v3;
}

- (BOOL)isTetraCompatibleWithFullKey:(id)a3
{
  id v4;
  _TtC17MessageProtection17TetraRegistration *tetraRegistration;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  NSObject *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  _DWORD v17[2];
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  tetraRegistration = self->_tetraRegistration;
  if (!tetraRegistration)
    goto LABEL_5;
  if (!+[TetraVersions isWireCompatibleWith:](_TtC17MessageProtection13TetraVersions, "isWireCompatibleWith:", -[TetraRegistration tetraVersion](tetraRegistration, "tetraVersion")))goto LABEL_5;
  objc_msgSend(v4, "devicePrekeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tetraRegistration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[TetraVersions isWireCompatibleWith:](_TtC17MessageProtection13TetraVersions, "isWireCompatibleWith:", objc_msgSend(v8, "tetraVersion"));

  if (v9)
  {
    v10 = 1;
  }
  else
  {
LABEL_5:
    MessageProtectionLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = -[TetraRegistration tetraVersion](self->_tetraRegistration, "tetraVersion");
      objc_msgSend(v4, "devicePrekeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tetraRegistration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = 67109632;
      v17[1] = v12;
      v18 = 1024;
      v19 = objc_msgSend(v15, "tetraVersion");
      v20 = 1024;
      v21 = +[TetraVersions currentTetraVersion](_TtC17MessageProtection13TetraVersions, "currentTetraVersion");
      _os_log_impl(&dword_20BABB000, v11, OS_LOG_TYPE_INFO, "Their remote registered Tetra version (%u), our registered Tetra version (%d) and our software version (%u) are different.", (uint8_t *)v17, 0x14u);

    }
    v10 = 0;
  }

  return v10;
}

- (id)sealMessage:(id)a3 signedByFullIdentity:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  MessageProtectionLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[NGMPublicDeviceIdentity sealMessage:signedByFullIdentity:error:].cold.1();

  -[NGMPublicDeviceIdentity sealMessage:withEncryptedAttributes:signedByFullIdentity:error:](self, "sealMessage:withEncryptedAttributes:signedByFullIdentity:error:", v9, 0, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)sealMessage:(id)a3 withEncryptedAttributes:(id)a4 signedByFullIdentity:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NGMMessageSignatureFormatter *v43;
  NGMMessageSignatureFormatter *v44;
  void *v45;
  void *v46;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (-[NGMPublicDeviceIdentity isValidSigningDestination](self, "isValidSigningDestination"))
  {
    +[FullKey generateNewKeyWithAccess:forceNoSEP:error:](DHKey, "generateNewKeyWithAccess:forceNoSEP:error:", 0, 1, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[NGMPublicDeviceIdentity echnidaRegistration](self, "echnidaRegistration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dhKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "keyAgreementWithPublicKey:error:", v15, a6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v21 = 0;
LABEL_18:

        goto LABEL_19;
      }
      objc_msgSend(CFSTR("LastPawn-MessageKeys"), "dataUsingEncoding:", 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKDF deriveKeyWith:salt:outputSize:](_TtC17MessageProtection4HKDF, "deriveKeyWith:salt:outputSize:", v16, v17, 48);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v21 = 0;
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v18, "subdataWithRange:", 0, 32);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "subdataWithRange:", 32, 16);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      +[NGMMessageFormatter formatOutgoingInnerMessageWithPayload:attributes:destinationIdentity:sendingIdentity:error:](NGMMessageFormatter, "formatOutgoingInnerMessageWithPayload:attributes:destinationIdentity:sendingIdentity:error:", v10, v11, self, v12, a6);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (void *)v19;
        if (*a6)
        {
          v21 = 0;
          v22 = (void *)v19;
LABEL_16:

          goto LABEL_17;
        }
        +[NGMPadding padMessage:error:](NGMPadding, "padMessage:error:", v19, a6);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!*a6)
        {
          +[MP_AES_CTR encrypt:key:IV:](MP_AES_CTR, "encrypt:key:IV:", v22, v46, v45);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v43 = [NGMMessageSignatureFormatter alloc];
            -[NGMPublicDeviceIdentity echnidaRegistration](self, "echnidaRegistration");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "dhKey");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "dataRepresentation");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "publicKey");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "dataRepresentation");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[NGMPublicDeviceIdentity signingKey](self, "signingKey");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "dataRepresentation");
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = v27;
            v30 = (void *)v28;
            v38 = v29;
            v44 = -[NGMMessageSignatureFormatter initWithDHOutput:prekeyPub:ephemeralPub:recipientPub:ciphertext:](v43, "initWithDHOutput:prekeyPub:ephemeralPub:recipientPub:ciphertext:", v16, v41, v39, v28);

            objc_msgSend(v12, "signDataWithFormatter:error:", v44, a6);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (v31)
            {
              v42 = v31;
              +[NGMKeyValidator keyValidatorWithReceiversIdentity:sendersIdentity:](NGMKeyValidator, "keyValidatorWithReceiversIdentity:sendersIdentity:", self, v12);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "key");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "publicKey");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              +[NGMMessageFormatter formatOutgoingMessageWithEncryptedPayload:ephemeral:signature:keyValidator:](NGMMessageFormatter, "formatOutgoingMessageWithEncryptedPayload:ephemeral:signature:keyValidator:", v38, v33, v42, v40);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              v31 = v42;
            }
            else
            {
              v21 = 0;
            }

            v27 = v38;
          }
          else
          {
            MPLogAndAssignError(400, a6, CFSTR("The encryption of an outgoing message failed."));
            v21 = 0;
          }

          goto LABEL_16;
        }
      }
      else
      {
        v22 = 0;
      }
      v21 = 0;
      goto LABEL_16;
    }
    MPLogAndAssignError(4, a6, CFSTR("Failed to generate an ephemeral P-256 key for message sealing."));
  }
  else
  {
    v23 = (void *)MEMORY[0x24BDD17C8];
    -[NGMPublicDeviceIdentity echnidaRegistration](self, "echnidaRegistration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timestamp");
    objc_msgSend(v23, "stringWithFormat:", CFSTR("Failed to encrypt to prekey that is no longer valid: %f."), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    MPLogAndAssignError(150, a6, v25);

  }
  v21 = 0;
LABEL_19:

  return v21;
}

- (id)sealMessage:(id)a3 forceSizeOptimizations:(BOOL)a4 resetState:(BOOL)a5 encryptedAttributes:(id)a6 signedByFullIdentity:(id)a7 errors:(id *)a8
{
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v17;

  v11 = a7;
  v12 = a3;
  MessageProtectionLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[NGMPublicDeviceIdentity sealMessage:forceSizeOptimizations:resetState:encryptedAttributes:signedByFullIdentity:errors:].cold.1();

  v17 = 0;
  -[NGMPublicDeviceIdentity sealMessage:withEncryptedAttributes:signedByFullIdentity:error:](self, "sealMessage:withEncryptedAttributes:signedByFullIdentity:error:", v12, 0, v11, &v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v17;
  if (!v15)
  {
    NoError();
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*a8, "setObject:forKey:", v15, &unk_24C4C9138);

  return v14;
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
  -[NGMPublicDeviceIdentity signingKey](self, "signingKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMPublicDeviceIdentity echnidaRegistration](self, "echnidaRegistration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("NGMPublicDeviceIdentity with device signing key: %@ \n prekey: %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)validateTetraBindingsAuthenticatedData:(id)a3 GUID:(id)a4 sendingURI:(id)a5 sendingPushToken:(id)a6 receivingURI:(id)a7 receivingPushToken:(id)a8
{
  id v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  __CFString *v17;
  id v18;
  NSObject *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  int v23;
  int v24;
  _BOOL4 v25;
  int v26;
  uint64_t v27;
  BOOL v28;
  NSObject *v29;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  _BOOL4 v37;
  uint8_t buf[4];
  __CFString *v39;
  __int16 v40;
  __CFString *v41;
  __int16 v42;
  __CFString *v43;
  __int16 v44;
  __CFString *v45;
  __int16 v46;
  __CFString *v47;
  __int16 v48;
  __CFString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = (__CFString *)a4;
  v15 = (__CFString *)a5;
  v16 = a6;
  v17 = (__CFString *)a7;
  v18 = a8;
  MessageProtectionLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "base64EncodedStringWithOptions:", 0);
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "base64EncodedStringWithOptions:", 0);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v39 = v20;
    v40 = 2112;
    v41 = v14;
    v42 = 2112;
    v43 = v15;
    v44 = 2112;
    v45 = v21;
    v46 = 2112;
    v47 = v17;
    v48 = 2112;
    v49 = v22;
    _os_log_impl(&dword_20BABB000, v19, OS_LOG_TYPE_INFO, "Tetra binding arguments: {authenticatedData = %@, guid = %@, sendingURI = %@, sendingPushToken = %@, receivingURI = %@, receivingPushToken = %@}", buf, 0x3Eu);

  }
  if (v13)
  {
    v37 = objc_msgSend(v13, "length") != 0;
    if (v14)
      goto LABEL_5;
  }
  else
  {
    v37 = 0;
    if (v14)
    {
LABEL_5:
      v23 = -[__CFString isEqualToString:](v14, "isEqualToString:", &stru_24C4C0760) ^ 1;
      if (v15)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  v23 = 0;
  if (v15)
  {
LABEL_6:
    v24 = -[__CFString isEqualToString:](v15, "isEqualToString:", &stru_24C4C0760);
    if (v16)
      goto LABEL_7;
    goto LABEL_13;
  }
LABEL_12:
  v24 = 1;
  if (v16)
  {
LABEL_7:
    v25 = objc_msgSend(v16, "length") != 0;
    if (v17)
      goto LABEL_8;
LABEL_14:
    v26 = 0;
    if (!v18)
      goto LABEL_18;
    goto LABEL_15;
  }
LABEL_13:
  v25 = 0;
  if (!v17)
    goto LABEL_14;
LABEL_8:
  v26 = -[__CFString isEqualToString:](v17, "isEqualToString:", &stru_24C4C0760) ^ 1;
  if (!v18)
    goto LABEL_18;
LABEL_15:
  v27 = objc_msgSend(v18, "length");
  if ((v37 & v23 & ~v24 & v25 & v26) != 1 || !v27)
  {
LABEL_18:
    MessageProtectionLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
LABEL_19:

      v28 = 0;
      goto LABEL_20;
    }
    if (v37)
    {
      v31 = CFSTR("Valid");
      if ((v23 & 1) == 0)
        goto LABEL_23;
    }
    else
    {
      objc_msgSend(v13, "description");
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ((v23 & 1) == 0)
      {
LABEL_23:
        -[__CFString description](v14, "description");
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v15)
          goto LABEL_24;
        goto LABEL_30;
      }
    }
    v36 = CFSTR("Valid");
    if (v15)
    {
LABEL_24:
      v35 = CFSTR("Valid");
      if (v16)
        goto LABEL_25;
      goto LABEL_31;
    }
LABEL_30:
    objc_msgSend(0, "description");
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
LABEL_25:
      v34 = CFSTR("Valid");
      if (v17)
        goto LABEL_26;
      goto LABEL_32;
    }
LABEL_31:
    objc_msgSend(0, "description");
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
LABEL_26:
      v33 = CFSTR("Valid");
      if (v18)
      {
LABEL_27:
        v32 = CFSTR("Valid");
        goto LABEL_34;
      }
LABEL_33:
      objc_msgSend(0, "description");
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_34:
      *(_DWORD *)buf = 138413570;
      v39 = v31;
      v40 = 2112;
      v41 = v36;
      v42 = 2112;
      v43 = v35;
      v44 = 2112;
      v45 = v34;
      v46 = 2112;
      v47 = v33;
      v48 = 2112;
      v49 = v32;
      _os_log_fault_impl(&dword_20BABB000, v29, OS_LOG_TYPE_FAULT, "Invalid Tetra binding argument: {authenticatedData = %@, guid = %@, sendingURI = %@, sendingPushToken = %@, receivingURI = %@, receivingPushToken = %@}", buf, 0x3Eu);
      if (v18)
      {
        if (v17)
          goto LABEL_36;
      }
      else
      {

        if (v17)
        {
LABEL_36:
          if (v16)
            goto LABEL_37;
          goto LABEL_44;
        }
      }

      if (v16)
      {
LABEL_37:
        if (v15)
          goto LABEL_38;
        goto LABEL_45;
      }
LABEL_44:

      if (v15)
      {
LABEL_38:
        if ((v23 & 1) != 0)
          goto LABEL_40;
        goto LABEL_39;
      }
LABEL_45:

      if ((v23 & 1) != 0)
      {
LABEL_40:
        if (!v37)

        goto LABEL_19;
      }
LABEL_39:

      goto LABEL_40;
    }
LABEL_32:
    objc_msgSend(0, "description");
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v18)
      goto LABEL_27;
    goto LABEL_33;
  }
  v28 = 1;
LABEL_20:

  return v28;
}

+ (BOOL)shouldMarkForStateReset:(id)a3
{
  return +[TetraErrorHelpers shouldMarkForStateResetWithString:](_TtC17MessageProtection17TetraErrorHelpers, "shouldMarkForStateResetWithString:", a3);
}

- (BOOL)markForStateResetWithOurURI:(id)a3 ourPushToken:(id)a4 ourSigningIdentity:(id)a5 theirURI:(id)a6 theirPushToken:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  NSObject *v32;
  id v34;
  id v35;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[NGMPublicDeviceIdentity tetraRegistration](self, "tetraRegistration");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    v34 = v13;
    v35 = v15;
    -[NGMPublicDeviceIdentity tetraRegistration](self, "tetraRegistration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "signingPublicKey");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      -[NGMPublicDeviceIdentity tetraRegistration](self, "tetraRegistration");
      v22 = v16;
      v23 = v14;
      v24 = v12;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "signingPublicKey");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "compactRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v24;
      v14 = v23;
      v16 = v22;

      v13 = v34;
      v15 = v35;
      if (v27)
      {
        -[NGMPublicDeviceIdentity tetraRegistration](self, "tetraRegistration");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "deviceSigningKey");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "tetraWrapped");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = +[TetraAPI markForStateResetWithOurURI:ourPushToken:theirURI:theirPushToken:theirRegistration:signedByOur:](_TtC17MessageProtection8TetraAPI, "markForStateResetWithOurURI:ourPushToken:theirURI:theirPushToken:theirRegistration:signedByOur:", v12, v34, v35, v16, v28, v30);

        goto LABEL_9;
      }
    }
    else
    {

    }
  }
  MessageProtectionLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    -[NGMPublicDeviceIdentity markForStateResetWithOurURI:ourPushToken:ourSigningIdentity:theirURI:theirPushToken:].cold.1();

  v31 = 0;
LABEL_9:

  return v31;
}

- (id)sealMessage:(id)a3 authenticatedData:(id)a4 messageType:(int64_t)a5 guid:(id)a6 sendingURI:(id)a7 sendingPushToken:(id)a8 receivingURI:(id)a9 receivingPushToken:(id)a10 forceSizeOptimizations:(BOOL)a11 resetState:(BOOL)a12 encryptedAttributes:(id)a13 signedByFullIdentity:(id)a14 errors:(id *)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  int v27;
  int v28;
  id v29;
  void *v30;
  _BOOL4 v31;
  NSObject *v32;
  _BOOL4 v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  NGMPBOuterMessage *v46;
  uint64_t v47;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  int v59;
  __int16 v60;
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  v20 = a4;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v49 = a13;
  v26 = a14;
  v27 = MPSecondaryEncryptionDisabled();
  v28 = MPSecondaryRegistrationDisabled();
  v52 = v22;
  v53 = v20;
  v51 = v23;
  v29 = v23;
  v30 = v21;
  v31 = -[NGMPublicDeviceIdentity validateTetraBindingsAuthenticatedData:GUID:sendingURI:sendingPushToken:receivingURI:receivingPushToken:](self, "validateTetraBindingsAuthenticatedData:GUID:sendingURI:sendingPushToken:receivingURI:receivingPushToken:", v20, v21, v22, v29, v24, v25);
  MessageProtectionLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v57 = v21;
    v58 = 1024;
    v59 = v27;
    v60 = 1024;
    v61 = v28;
    _os_log_impl(&dword_20BABB000, v32, OS_LOG_TYPE_INFO, "Sealing message with GUID: %@. secondaryDisabled=%d, secondaryRegistrationDisabled=%d", buf, 0x18u);
  }

  v33 = -[NGMPublicDeviceIdentity isTetraCompatibleWithFullKey:](self, "isTetraCompatibleWithFullKey:", v26);
  if (a5 == 1)
    v34 = 1;
  else
    v34 = v27;
  if (v33 && (v34 & 1) == 0 && v31)
  {
    -[NGMPublicDeviceIdentity tetraRegistration](self, "tetraRegistration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "deviceSigningKey");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "tetraWrapped");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    LOBYTE(v47) = a12;
    +[TetraAPI sealWithMessage:authenticatedData:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:receiverRegistration:encryptedAttributes:resetState:signedBy:error:](_TtC17MessageProtection8TetraAPI, "sealWithMessage:authenticatedData:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:receiverRegistration:encryptedAttributes:resetState:signedBy:error:", v50, v53, v21, v52, v51, v24, v25, v35, v49, v47, v37, &v55);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v55;

    if (!v39)
    {
      NoError();
      v44 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*a15, "setObject:forKey:", v44, &unk_24C4C9150);
      v46 = objc_alloc_init(NGMPBOuterMessage);
      -[NGMPBOuterMessage setTetraMessage:](v46, "setTetraMessage:", v38);
      -[NGMPBOuterMessage data](v46, "data");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = v49;
      v41 = v50;
      goto LABEL_16;
    }
    objc_msgSend(*a15, "setObject:forKey:", v39, &unk_24C4C9150);
    MessageProtectionLog();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[NGMPublicDeviceIdentity sealMessage:authenticatedData:messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:forceSizeOptimizations:resetState:encryptedAttributes:signedByFullIdentity:errors:].cold.1(v39);

  }
  v54 = 0;
  v42 = v49;
  v41 = v50;
  -[NGMPublicDeviceIdentity sealMessage:withEncryptedAttributes:signedByFullIdentity:error:](self, "sealMessage:withEncryptedAttributes:signedByFullIdentity:error:", v50, v49, v26, &v54);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v54;
  if (!v44)
  {
    NoError();
    v44 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*a15, "setObject:forKey:", v44, &unk_24C4C9138);
LABEL_16:

  return v43;
}

- (id)sealMessage:(id)a3 guid:(id)a4 sendingURI:(id)a5 sendingPushToken:(id)a6 receivingURI:(id)a7 receivingPushToken:(id)a8 forceSizeOptimizations:(BOOL)a9 resetState:(BOOL)a10 encryptedAttributes:(id)a11 signedByFullIdentity:(id)a12 errors:(id *)a13
{
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v31;

  v19 = (void *)MEMORY[0x24BDBCE50];
  v20 = a12;
  v21 = a11;
  v22 = a8;
  v23 = a7;
  v24 = a6;
  v25 = a5;
  v26 = a4;
  v27 = a3;
  objc_msgSend(v19, "data");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v31) = __PAIR16__(a10, a9);
  -[NGMPublicDeviceIdentity sealMessage:authenticatedData:messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:forceSizeOptimizations:resetState:encryptedAttributes:signedByFullIdentity:errors:](self, "sealMessage:authenticatedData:messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:forceSizeOptimizations:resetState:encryptedAttributes:signedByFullIdentity:errors:", v27, v28, 0, v26, v25, v24, v23, v22, v31, v21, v20, a13);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (SigningPublicKey)signingKey
{
  return self->_signingKey;
}

- (void)setSigningKey:(id)a3
{
  objc_storeStrong((id *)&self->_signingKey, a3);
}

- (NGMECDHPublicPreKey)echnidaRegistration
{
  return self->_echnidaRegistration;
}

- (void)setEchnidaRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_echnidaRegistration, a3);
}

- (_TtC17MessageProtection17TetraRegistration)tetraRegistration
{
  return self->_tetraRegistration;
}

- (void)setTetraRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_tetraRegistration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tetraRegistration, 0);
  objc_storeStrong((id *)&self->_echnidaRegistration, 0);
  objc_storeStrong((id *)&self->_signingKey, 0);
}

- (BOOL)isValidSignature:(id)a3 forMessage:(id)a4 forType:(int64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;

  v9 = a3;
  v10 = a4;
  if ((unint64_t)a5 > 2)
  {
    v13 = 0;
  }
  else
  {
    v11 = (void *)objc_msgSend(objc_alloc(*off_24C4BF0D8[a5]), "initWithApplicationData:", v10);
    -[NGMPublicDeviceIdentity signingKey](self, "signingKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "verifySignature:formatter:", v9, v11);

  }
  return v13;
}

- (void)identityData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_20BABB000, v0, v1, "Failed to obtain the dataRepresentation of the signing key.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)isIdenticalIdentityTo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_20BABB000, v0, v1, "Identity is not identical since the pinned data couldn't be decoded.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)isIdenticalIdentityTo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_20BABB000, v0, v1, "Tetra version has been lowered.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)isIdenticalIdentityTo:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_20BABB000, v0, v1, "Identity is not identical since the identity public key doesn't match.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)prekeyData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_20BABB000, v0, v1, "Cannot retrieve prekey information because the timestamp of the signature is too old to be registered.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)sealMessage:signedByFullIdentity:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_20BABB000, v0, v1, "Calling the deprecated seal method: sealMessage:forceSizeOptimizations:resetState:shouldReset:encryptedAttributes:signedByFullIdentity:error. Encrypted attributes will be nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)sealMessage:forceSizeOptimizations:resetState:encryptedAttributes:signedByFullIdentity:errors:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_20BABB000, v0, v1, "Calling seal method sealMessage:forceSizeOptimizations:resetState:encryptedAttributes:signedByFullIdentity:errors.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)markForStateResetWithOurURI:ourPushToken:ourSigningIdentity:theirURI:theirPushToken:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_3(&dword_20BABB000, v0, v1, "Failed to reset the Tetra session because the device doesn't appear to have a valid Tetra registration.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)sealMessage:(void *)a1 authenticatedData:messageType:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:forceSizeOptimizations:resetState:encryptedAttributes:signedByFullIdentity:errors:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_20BABB000, v2, v3, "Tetra encryption failed, allowing fallback on Echnida. {tetraError=%@}", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end

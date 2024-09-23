@implementation NGMECDHPublicPreKey

- (id)initRemotePrekeyWithPublicPrekeyPB:(id)a3 signedBy:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  DHPublicKey *v10;
  void *v11;
  DHPublicKey *v12;
  void *v13;
  NGMECDHPublicPreKey *v14;

  v8 = a3;
  v9 = a4;
  v10 = [DHPublicKey alloc];
  objc_msgSend(v8, "prekey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PublicKey initWithData:error:](v10, "initWithData:error:", v11, a5);

  if (!v12)
  {
    MPLogAndAssignError(100, a5, CFSTR("Failed to initialize the DHPublicKey for the prekey."));
    goto LABEL_5;
  }
  objc_msgSend(v8, "prekeySignature");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timestamp");
  self = -[NGMECDHPublicPreKey initWithPublicKey:signature:timestamp:](self, "initWithPublicKey:signature:timestamp:", v12, v13);

  if (!-[NGMECDHPublicPreKey isValidlySignedBy:error:](self, "isValidlySignedBy:error:", v9, a5))
  {
LABEL_5:
    v14 = 0;
    goto LABEL_6;
  }
  self = self;
  v14 = self;
LABEL_6:

  return v14;
}

- (NGMECDHPublicPreKey)initWithPublicKey:(id)a3 signature:(id)a4 timestamp:(double)a5
{
  id v9;
  id v10;
  NGMECDHPublicPreKey *v11;
  NGMECDHPublicPreKey *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NGMECDHPublicPreKey;
  v11 = -[NGMECDHPublicPreKey init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dhKey, a3);
    objc_storeStrong((id *)&v12->_signature, a4);
    v12->_timestamp = a5;
  }

  return v12;
}

- (BOOL)isValidlySignedBy:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NGMPrekeySignatureFormatter *v8;
  char v9;
  __CFString *v11;
  uint64_t v12;
  double v13;

  v6 = a3;
  -[NGMECDHPublicPreKey signature](self, "signature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NGMPrekeySignatureFormatter initWithPublicPrekey:]([NGMPrekeySignatureFormatter alloc], "initWithPublicPrekey:", self);
  v9 = objc_msgSend(v6, "verifySignature:formatter:", v7, v8);

  if ((v9 & 1) != 0)
  {
    -[NGMECDHPublicPreKey timestamp](self, "timestamp");
    if (+[NGMTimeBasedEvaluations validateFetchedPrekeyTimestamp:forEvaluationType:](NGMTimeBasedEvaluations, "validateFetchedPrekeyTimestamp:forEvaluationType:", 2))
    {
      return 1;
    }
    -[NGMECDHPublicPreKey timestamp](self, "timestamp");
    v11 = CFSTR("The ephemeral prekey has expired.");
    if (v13 >= 1554681600.0)
      v12 = 102;
    else
      v12 = 103;
  }
  else
  {
    v11 = CFSTR("The prekey was incorrectly signed, rejecting.");
    v12 = 101;
  }
  MPLogAndAssignError(v12, a4, v11);
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NGMECDHPublicPreKey dhKey](self, "dhKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NGMECDHPublicPreKey timestamp](self, "timestamp");
  v7 = v6;
  -[NGMECDHPublicPreKey signature](self, "signature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("NGMPublicPreKey with DHKey: %@\n Timestamp:%f \n Signature: %@."), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (DHPublicKey)dhKey
{
  return self->_dhKey;
}

- (NSData)signature
{
  return self->_signature;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_dhKey, 0);
}

@end

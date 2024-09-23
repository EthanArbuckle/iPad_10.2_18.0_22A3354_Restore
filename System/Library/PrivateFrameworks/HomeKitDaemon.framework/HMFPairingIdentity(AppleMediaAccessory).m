@implementation HMFPairingIdentity(AppleMediaAccessory)

- (void)initWithProtoData:()AppleMediaAccessory
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x24BDD73D8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

  if (!v6)
    goto LABEL_5;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "publicPairingKeyData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x24BE3F230]);
      objc_msgSend(v6, "publicPairingKeyData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithPairingKeyData:", v10);

      objc_msgSend(v6, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = (id)objc_msgSend(a1, "initWithIdentifier:publicKey:privateKey:", v12, v11, 0);

      v7 = a1;
      goto LABEL_6;
    }
LABEL_5:
    v7 = 0;
  }
LABEL_6:

  return v7;
}

- (id)protoPayload
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x24BDD73D8]);
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIdentifier:", v3);

  objc_msgSend(a1, "publicKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPublicPairingKeyData:", v5);

  return v2;
}

- (id)pbData
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "protoPayload");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end

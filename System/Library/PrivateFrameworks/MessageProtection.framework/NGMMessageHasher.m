@implementation NGMMessageHasher

+ (id)computeHashForMessage:(id)a3
{
  id v3;
  NGMPBOuterMessage *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const void *v14;
  CC_LONG v15;

  v3 = a3;
  v4 = -[NGMPBOuterMessage initWithData:]([NGMPBOuterMessage alloc], "initWithData:", v3);

  if (!v4)
    goto LABEL_7;
  -[NGMPBOuterMessage encryptedPayload](v4, "encryptedPayload");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_7;
  v6 = (id)v5;
  -[NGMPBOuterMessage ephemeralPubKey](v4, "ephemeralPubKey");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NGMPBOuterMessage signature](v4, "signature");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      -[NGMPBOuterMessage encryptedPayload](v4, "encryptedPayload");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendData:", v10);

      -[NGMPBOuterMessage ephemeralPubKey](v4, "ephemeralPubKey");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendData:", v11);

      -[NGMPBOuterMessage signature](v4, "signature");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appendData:", v12);

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 32);
      v6 = objc_retainAutorelease(v9);
      v14 = (const void *)objc_msgSend(v6, "bytes");
      v15 = objc_msgSend(v6, "length");
      v7 = objc_retainAutorelease(v13);
      CC_SHA256(v14, v15, (unsigned __int8 *)objc_msgSend(v7, "bytes"));
      goto LABEL_6;
    }
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
LABEL_6:

LABEL_8:
  return v7;
}

@end

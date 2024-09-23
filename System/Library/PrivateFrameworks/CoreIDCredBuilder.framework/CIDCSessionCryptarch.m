@implementation CIDCSessionCryptarch

- (CIDCSessionCryptarch)initWithRole:(unint64_t)a3 curve:(unint64_t)a4
{
  return -[CIDCSessionCryptarch initWithRole:curve:variant:](self, "initWithRole:curve:variant:", a3, a4, 0);
}

- (CIDCSessionCryptarch)initWithRole:(unint64_t)a3 curve:(unint64_t)a4 variant:(unint64_t)a5
{
  CIDCSessionCryptarch *v8;
  _TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CIDCSessionCryptarch;
  v8 = -[CIDCSessionCryptarch init](&v11, sel_init);
  v9 = -[CIDCInternalSessionCryptarch initWithRole:curve:variant:]([_TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch alloc], "initWithRole:curve:variant:", a3, a4, a5);
  -[CIDCSessionCryptarch setInternalCryptarch:](v8, "setInternalCryptarch:", v9);

  return v8;
}

- (BOOL)setRemoteKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CIDCSessionCryptarch internalCryptarch](self, "internalCryptarch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "setRemoteKey:error:", v6, a4);

  return (char)a4;
}

- (BOOL)deriveSessionKeysFromSessionTranscript:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CIDCSessionCryptarch internalCryptarch](self, "internalCryptarch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "deriveSessionKeysWithSessionTranscript:ikm:error:", v6, 0, a4);

  return (char)a4;
}

- (BOOL)deriveSessionKeysFromSessionTranscript:(id)a3 intermediateKeyMaterial:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[CIDCSessionCryptarch internalCryptarch](self, "internalCryptarch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "deriveSessionKeysWithSessionTranscript:ikm:error:", v9, v8, a5);

  return (char)a5;
}

- (id)decryptData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CIDCSessionCryptarch internalCryptarch](self, "internalCryptarch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decryptWithData:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)encryptData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CIDCSessionCryptarch internalCryptarch](self, "internalCryptarch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encryptWithData:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSData)publicKey
{
  void *v2;
  void *v3;

  -[CIDCSessionCryptarch internalCryptarch](self, "internalCryptarch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publicKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (_TtC17CoreIDCredBuilder28CIDCInternalSessionCryptarch)internalCryptarch
{
  return self->_internalCryptarch;
}

- (void)setInternalCryptarch:(id)a3
{
  objc_storeStrong((id *)&self->_internalCryptarch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalCryptarch, 0);
}

@end

@implementation DIPStreamingCryptor

- (DIPStreamingCryptor)initWithKey:(id)a3
{
  id v4;
  DIPStreamingCryptor *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DIPStreamingCryptor;
  v5 = -[DIPStreamingCryptor init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_retainAutorelease(v4);
    CCCryptorCreateWithMode(0, 0xBu, 0, 0, 0, (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), 0, 0, 0, 0, &v5->_cryptor);
  }

  return v5;
}

- (void)addIVParameter:(id)a3
{
  id v3;

  v3 = objc_retainAutorelease(a3);
  objc_msgSend(v3, "bytes");
  objc_msgSend(v3, "length");

  CCCryptorAddParameter();
}

- (void)addAuthParameter:(id)a3
{
  id v3;

  v3 = objc_retainAutorelease(a3);
  objc_msgSend(v3, "bytes");
  objc_msgSend(v3, "length");

  CCCryptorAddParameter();
}

- (id)encryptBuffer:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _CCCryptor *cryptor;
  id v8;
  const void *v9;
  size_t v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0C99DF0];
  v5 = a3;
  objc_msgSend(v4, "dataWithLength:", objc_msgSend(v5, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  cryptor = self->_cryptor;
  v8 = objc_retainAutorelease(v5);
  v9 = (const void *)objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");

  v11 = objc_retainAutorelease(v6);
  CCCryptorUpdate(cryptor, v9, v10, (void *)objc_msgSend(v11, "mutableBytes"), objc_msgSend(v11, "length"), 0);
  return v11;
}

- (id)finish
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 16);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "mutableBytes");
  objc_msgSend(v3, "length");
  CCCryptorGCMFinalize();
  CCCryptorRelease(self->_cryptor);
  return v3;
}

@end

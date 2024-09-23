@implementation IMNicknameEncryptionKey

- (IMNicknameEncryptionKey)initWithData:(id)a3
{
  id v5;
  IMNicknameEncryptionKey *v6;
  IMNicknameEncryptionKey *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMNicknameEncryptionKey;
  v6 = -[IMNicknameEncryptionKey init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_data, a3);

  return v7;
}

- (const)bytes
{
  id v2;
  const void *v3;

  -[IMNicknameEncryptionKey data](self, "data");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const void *)objc_msgSend(v2, "bytes");

  return v3;
}

- (unint64_t)length
{
  void *v2;
  unint64_t v3;

  -[IMNicknameEncryptionKey data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end

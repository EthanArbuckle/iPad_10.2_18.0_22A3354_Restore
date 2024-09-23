@implementation SGWalletOrderKey

- (SGWalletOrderKey)initWithIdentifier:(id)a3
{
  id v6;
  SGWalletOrderKey *v7;
  SGWalletOrderKey *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGWalletOrderKey.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SGWalletOrderKey;
  v7 = -[SGWalletOrderKey init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_identifier, a3);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SGWalletOrderKey *v4;
  SGWalletOrderKey *v5;
  BOOL v6;

  v4 = (SGWalletOrderKey *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGWalletOrderKey isEqualToWalletOrderKey:](self, "isEqualToWalletOrderKey:", v5);

  return v6;
}

- (BOOL)isEqualToWalletOrderKey:(id)a3
{
  SGWalletOrderKey *v4;
  NSString *v5;
  NSString *v6;
  char v7;

  v4 = (SGWalletOrderKey *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    v5 = self->_identifier;
    v6 = v5;
    if (v5 == v4->_identifier)
      v7 = 1;
    else
      v7 = -[NSString isEqual:](v5, "isEqual:");

  }
  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (id)serialize
{
  return self->_identifier;
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[SGWalletOrderKey identifier: %@"), self->_identifier);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  return a3 == 25;
}

@end

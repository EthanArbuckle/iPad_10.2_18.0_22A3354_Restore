@implementation CEMAssetReference

+ (id)referenceForIdentifier:(id)a3 assettype:(int)a4
{
  uint64_t v4;
  id v5;
  CEMAssetReference *v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = -[CEMAssetReference initWithIdentifier:assettype:]([CEMAssetReference alloc], "initWithIdentifier:assettype:", v5, v4);

  return v6;
}

+ (id)referenceForIdentifier:(id)a3 assetschematype:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  CEMAssetReference *v8;

  v5 = a4;
  v6 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("application")) & 1) != 0)
  {
    v7 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("applicationID")) & 1) != 0)
  {
    v7 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("book")) & 1) != 0)
  {
    v7 = 2;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("certificate")) & 1) != 0)
  {
    v7 = 3;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("credential")) & 1) != 0)
  {
    v7 = 4;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("font")) & 1) != 0)
  {
    v7 = 5;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("image")) & 1) != 0)
  {
    v7 = 6;
  }
  else
  {
    objc_msgSend(v5, "isEqualToString:", CFSTR("string"));
    v7 = 7;
  }
  v8 = -[CEMAssetReference initWithIdentifier:assettype:]([CEMAssetReference alloc], "initWithIdentifier:assettype:", v6, v7);

  return v8;
}

- (CEMAssetReference)initWithIdentifier:(id)a3 assettype:(int)a4
{
  id v7;
  CEMAssetReference *v8;
  CEMAssetReference *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CEMAssetReference;
  v8 = -[CEMAssetReference init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_assettype = a4;
  }

  return v9;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int)assettype
{
  return self->_assettype;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

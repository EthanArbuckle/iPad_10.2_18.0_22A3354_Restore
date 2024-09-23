@implementation DKAssetUploadItems

+ (id)assetWithItems:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithItems:", v4);

  return v5;
}

- (DKAssetUploadItems)initWithItems:(id)a3
{
  id v5;
  DKAssetUploadItems *v6;
  DKAssetUploadItems *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DKAssetUploadItems;
  v6 = -[DKAssetUploadItems init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_items, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_decoderClasses
{
  if (_decoderClasses_onceToken_43 != -1)
    dispatch_once(&_decoderClasses_onceToken_43, &__block_literal_global_44);
  return (id)_decoderClasses_decoderClasses_42;
}

void __37__DKAssetUploadItems__decoderClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_decoderClasses_decoderClasses_42;
  _decoderClasses_decoderClasses_42 = v7;

}

- (DKAssetUploadItems)initWithCoder:(id)a3
{
  id v4;
  DKAssetUploadItems *v5;
  DKAssetUploadItems *v6;
  void *v7;
  uint64_t v8;
  NSArray *items;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DKAssetUploadItems;
  v5 = -[DKAssetUploadItems init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[DKAssetUploadItems _decoderClasses](v5, "_decoderClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("items"));
    v8 = objc_claimAutoreleasedReturnValue();
    items = v6->_items;
    v6->_items = (NSArray *)v8;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DKAssetUploadItems items](self, "items");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("items"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSArray copyWithZone:](self->_items, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end

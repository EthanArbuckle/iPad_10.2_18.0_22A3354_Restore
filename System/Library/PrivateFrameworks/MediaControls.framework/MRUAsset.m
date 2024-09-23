@implementation MRUAsset

+ (id)packageAsset:(id)a3 symbolName:(id)a4 image:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPackageAsset:symbolName:image:", v10, v9, v8);

  return v11;
}

+ (id)packageAsset:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPackageAsset:", v4);

  return v5;
}

+ (id)packageAssetNamed:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPackageAssetNamed:", v4);

  return v5;
}

+ (id)symbolNamed:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSymbolName:", v4);

  return v5;
}

+ (id)symbolNamed:(id)a3 symbolEffect:(id)a4 symbolEffectOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSymbolName:symbolEffect:symbolEffectOptions:", v10, v9, v8);

  return v11;
}

+ (id)image:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImage:", v4);

  return v5;
}

- (MRUAsset)initWithPackageAsset:(id)a3 symbolName:(id)a4 image:(id)a5
{
  return -[MRUAsset initWithPackageAsset:symbolName:symbolEffect:symbolEffectOptions:image:](self, "initWithPackageAsset:symbolName:symbolEffect:symbolEffectOptions:image:", a3, a4, 0, 0, a5);
}

- (MRUAsset)initWithPackageAsset:(id)a3 symbolName:(id)a4 symbolEffect:(id)a5 symbolEffectOptions:(id)a6 image:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MRUAsset *v17;
  MRUAsset *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)MRUAsset;
  v17 = -[MRUAsset init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_packageAsset, a3);
    objc_storeStrong((id *)&v18->_symbolName, a4);
    objc_storeStrong((id *)&v18->_symbolEffect, a5);
    objc_storeStrong((id *)&v18->_symbolEffectOptions, a6);
    objc_storeStrong((id *)&v18->_image, a7);
  }

  return v18;
}

- (MRUAsset)initWithPackageAsset:(id)a3
{
  return -[MRUAsset initWithPackageAsset:symbolName:image:](self, "initWithPackageAsset:symbolName:image:", a3, 0, 0);
}

- (MRUAsset)initWithPackageAssetNamed:(id)a3
{
  void *v4;
  MRUAsset *v5;

  +[MRUCAPackageAsset packageNamed:](MRUCAPackageAsset, "packageNamed:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MRUAsset initWithPackageAsset:symbolName:image:](self, "initWithPackageAsset:symbolName:image:", v4, 0, 0);

  return v5;
}

- (MRUAsset)initWithSymbolName:(id)a3
{
  return -[MRUAsset initWithPackageAsset:symbolName:image:](self, "initWithPackageAsset:symbolName:image:", 0, a3, 0);
}

- (MRUAsset)initWithSymbolName:(id)a3 symbolEffect:(id)a4 symbolEffectOptions:(id)a5
{
  return -[MRUAsset initWithPackageAsset:symbolName:symbolEffect:symbolEffectOptions:image:](self, "initWithPackageAsset:symbolName:symbolEffect:symbolEffectOptions:image:", 0, a3, a4, a5, 0);
}

- (MRUAsset)initWithImage:(id)a3
{
  return -[MRUAsset initWithPackageAsset:symbolName:image:](self, "initWithPackageAsset:symbolName:image:", 0, 0, a3);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ package: %@ | symbol: %@ | image: %@"), objc_opt_class(), self->_packageAsset, self->_symbolName, self->_image);
}

- (BOOL)isEqual:(id)a3
{
  MRUAsset *v4;
  id *v5;
  MRUCAPackageAsset *v6;
  MRUCAPackageAsset *v7;
  char v8;
  char v9;
  NSString *v10;
  NSString *v11;
  char v12;
  char v13;
  UIImage *image;
  UIImage *v15;
  UIImage *v16;
  char v17;

  v4 = (MRUAsset *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(v5, "packageAsset");
      v6 = (MRUCAPackageAsset *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 == self->_packageAsset)
        v8 = 1;
      else
        v8 = -[MRUCAPackageAsset isEqual:](v6, "isEqual:");

      objc_msgSend(v5, "symbolName");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 == self->_symbolName)
        v12 = 1;
      else
        v12 = -[NSString isEqual:](v10, "isEqual:");
      v13 = v8 & v12;

      image = self->_image;
      v15 = (UIImage *)v5[1];
      v16 = v15;
      if (v15 == image)
        v17 = 1;
      else
        v17 = -[UIImage isEqual:](v15, "isEqual:", image);

      v9 = v13 & v17;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (UIImage)image
{
  UIImage *v2;

  if (self->_symbolName)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:");
    v2 = (UIImage *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = self->_image;
  }
  return v2;
}

- (MRUCAPackageAsset)packageAsset
{
  return self->_packageAsset;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (void)setAccessibilityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityIdentifier, a3);
}

- (NSSymbolEffect)symbolEffect
{
  return self->_symbolEffect;
}

- (NSSymbolEffectOptions)symbolEffectOptions
{
  return self->_symbolEffectOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolEffectOptions, 0);
  objc_storeStrong((id *)&self->_symbolEffect, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_packageAsset, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end

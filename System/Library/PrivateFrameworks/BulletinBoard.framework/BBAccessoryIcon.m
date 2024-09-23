@implementation BBAccessoryIcon

- (BBAccessoryIcon)init
{
  BBAccessoryIcon *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *imagesForContentSize;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BBAccessoryIcon;
  v2 = -[BBAccessoryIcon init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    imagesForContentSize = v2->_imagesForContentSize;
    v2->_imagesForContentSize = v3;

  }
  return v2;
}

- (void)setImagesForContentSize:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *imagesForContentSize;

  if (self->_imagesForContentSize != a3)
  {
    v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
    imagesForContentSize = self->_imagesForContentSize;
    self->_imagesForContentSize = v4;

  }
}

- (void)addImage:(id)a3 forContentSizeCategory:(id)a4
{
  if (a3)
  {
    if (a4)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_imagesForContentSize, "setObject:forKeyedSubscript:");
  }
}

- (id)imageForContentSizeCategory:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_imagesForContentSize, "objectForKeyedSubscript:", a3);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[BBAccessoryIcon imagesForContentSize](self, "imagesForContentSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  BBAccessoryIcon *v4;
  BBAccessoryIcon *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (BBAccessoryIcon *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[BBAccessoryIcon imagesForContentSize](self, "imagesForContentSize");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BBAccessoryIcon imagesForContentSize](v5, "imagesForContentSize");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = BSEqualObjects();
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[BBAccessoryIcon imagesForContentSize](self, "imagesForContentSize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImagesForContentSize:", v5);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BBAccessoryIcon)initWithCoder:(id)a3
{
  id v4;
  BBAccessoryIcon *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[BBAccessoryIcon init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7, v11, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("imagesForContentSize"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBAccessoryIcon setImagesForContentSize:](v5, "setImagesForContentSize:", v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BBAccessoryIcon imagesForContentSize](self, "imagesForContentSize");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("imagesForContentSize"));

}

- (NSDictionary)imagesForContentSize
{
  return &self->_imagesForContentSize->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagesForContentSize, 0);
}

@end

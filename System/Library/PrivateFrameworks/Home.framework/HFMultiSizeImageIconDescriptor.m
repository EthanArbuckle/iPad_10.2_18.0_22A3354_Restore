@implementation HFMultiSizeImageIconDescriptor

- (HFMultiSizeImageIconDescriptor)initWithImageIdentifiersKeyedBySize:(id)a3
{
  id v4;
  void *v5;
  HFMultiSizeImageIconDescriptor *v6;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HFImageIconIdentifierSizeRegular"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFMultiSizeImageIconDescriptor initWithImageIdentifiersKeyedBySize:defaultImageIdentifier:](self, "initWithImageIdentifiersKeyedBySize:defaultImageIdentifier:", v4, v5);

  return v6;
}

- (HFMultiSizeImageIconDescriptor)initWithImageIdentifiersKeyedBySize:(id)a3 defaultImageIdentifier:(id)a4
{
  id v7;
  __CFString *v8;
  const __CFString *v9;
  HFMultiSizeImageIconDescriptor *v10;
  HFMultiSizeImageIconDescriptor *v11;
  objc_super v13;

  v7 = a3;
  v8 = (__CFString *)a4;
  v9 = v8;
  if (!v8)
  {
    NSLog(CFSTR("No default image identifier specified!"));
    v9 = CFSTR("HFImageIconIdentifierSizeRegular");
  }
  v13.receiver = self;
  v13.super_class = (Class)HFMultiSizeImageIconDescriptor;
  v10 = -[HFImageIconDescriptor initWithImageIdentifier:](&v13, sel_initWithImageIdentifier_, v9);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_imageIdentifiersKeyedBySize, a3);

  return v11;
}

- (id)imageIdentifierForSize:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HFMultiSizeImageIconDescriptor imageIdentifiersKeyedBySize](self, "imageIdentifiersKeyedBySize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[HFMultiSizeImageIconDescriptor imageIdentifiersKeyedBySize](self, "imageIdentifiersKeyedBySize");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HFImageIconIdentifierSizeRegular"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HFMultiSizeImageIconDescriptor *v4;
  HFMultiSizeImageIconDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (HFMultiSizeImageIconDescriptor *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HFMultiSizeImageIconDescriptor imageIdentifiersKeyedBySize](v5, "imageIdentifiersKeyedBySize");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFMultiSizeImageIconDescriptor imageIdentifiersKeyedBySize](self, "imageIdentifiersKeyedBySize");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[HFMultiSizeImageIconDescriptor imageIdentifiersKeyedBySize](v5, "imageIdentifiersKeyedBySize");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFMultiSizeImageIconDescriptor imageIdentifiersKeyedBySize](self, "imageIdentifiersKeyedBySize");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToDictionary:", v9);

      }
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HFMultiSizeImageIconDescriptor imageIdentifiersKeyedBySize](self, "imageIdentifiersKeyedBySize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (int64_t)compare:(id)a3
{
  return 0;
}

- (NSDictionary)imageIdentifiersKeyedBySize
{
  return self->_imageIdentifiersKeyedBySize;
}

- (void)setImageIdentifiersKeyedBySize:(id)a3
{
  objc_storeStrong((id *)&self->_imageIdentifiersKeyedBySize, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageIdentifiersKeyedBySize, 0);
}

@end

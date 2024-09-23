@implementation MDSearchableItem

- (MDSearchableItem)initWithUniqueIdentifier:(id)a3 domainIdentifier:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  CSSearchableItemAttributeSet *v11;
  MDSearchableItem *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[CSSearchableItemAttributeSet initWithAttributes:]([CSSearchableItemAttributeSet alloc], "initWithAttributes:", v8);

  v12 = -[CSSearchableItem initWithUniqueIdentifier:domainIdentifier:attributeSet:](self, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v10, v9, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MDSearchableItem;
  -[CSSearchableItem encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (MDSearchableItem)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MDSearchableItem;
  return -[CSSearchableItem initWithCoder:](&v4, sel_initWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MDSearchableItem;
  return -[CSSearchableItem copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (NSDictionary)attributes
{
  void *v2;
  void *v3;

  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setAttributes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttributesFromDictionary:", v4);

}

- (NSString)localizedDisplayName
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  -[CSSearchableItem attributeSet](self, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[CSSearchableItem attributeSet](self, "attributeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "localizedString");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }

  return (NSString *)v8;
}

- (void)_standardizeDeprecatedProperties:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MDSearchableItem;
  -[CSSearchableItem _standardizeDeprecatedProperties:](&v3, sel__standardizeDeprecatedProperties_, a3);
}

- (NSString)displayName
{
  void *v2;
  void *v3;

  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDisplayName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisplayName:", v4);

}

- (NSString)secondaryDisplayName
{
  void *v2;
  void *v3;
  void *v4;

  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alternateNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v4;
}

- (void)setSecondaryDisplayName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchableItem attributeSet](self, "attributeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlternateNames:", v6);

  }
  else
  {
    -[CSSearchableItem attributeSet](self, "attributeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlternateNames:", 0);

  }
}

- (NSString)contentUTI
{
  void *v2;
  void *v3;

  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setContentUTI:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentType:", v4);

}

- (NSURL)contentURL
{
  void *v2;
  void *v3;

  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)setContentURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentURL:", v4);

}

- (NSData)thumbnailImageData
{
  void *v2;
  void *v3;

  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumbnailData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setThumbnailImageData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setThumbnailData:", v4);

}

- (NSURL)thumbnailURL
{
  void *v2;
  void *v3;

  -[CSSearchableItem attributeSet](self, "attributeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumbnailURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)setThumbnailURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSSearchableItem attributeSet](self, "attributeSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setThumbnailURL:", v4);

}

@end

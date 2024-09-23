@implementation CKContextExtractionItem

- (CKContextExtractionItem)initWithTitle:(id)a3 type:(unint64_t)a4 bundleIdentifier:(id)a5
{
  id v9;
  id v10;
  CKContextExtractionItem *v11;
  CKContextExtractionItem *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKContextExtractionItem;
  v11 = -[CKContextExtractionItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a3);
    v12->_type = a4;
    objc_storeStrong((id *)&v12->_bundleIdentifier, a5);
  }

  return v12;
}

- (CKContextExtractionItem)initWithCoder:(id)a3
{
  id v4;
  CKContextExtractionItem *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  BOOL v9;
  CKContextExtractionItem *v10;
  NSString *title;
  NSString *v12;
  NSString *bundleIdentifier;
  NSString *v14;
  uint64_t v15;
  NSString *identifier;
  uint64_t v17;
  NSString *extractionSourceClassName;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKContextExtractionItem;
  v5 = -[CKContextExtractionItem init](&v20, sel_init);
  if (!v5)
    goto LABEL_8;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    title = v5->_title;
    v5->_title = v6;
    v12 = v6;

    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = v8;
    v14 = v8;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v15 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extractionSourceClassName"));
    v17 = objc_claimAutoreleasedReturnValue();
    extractionSourceClassName = v5->_extractionSourceClassName;
    v5->_extractionSourceClassName = (NSString *)v17;

    v5->_onScreen = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onScreen"));
LABEL_8:
    v10 = v5;
    goto LABEL_9;
  }

  v10 = 0;
LABEL_9:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extractionSourceClassName, CFSTR("extractionSourceClassName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_onScreen, CFSTR("onScreen"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)-[NSString copy](self->_title, "copy");
  objc_msgSend(v4, "setTitle:", v5);

  objc_msgSend(v4, "setType:", self->_type);
  v6 = (void *)-[NSString copy](self->_bundleIdentifier, "copy");
  objc_msgSend(v4, "setBundleIdentifier:", v6);

  v7 = (void *)-[NSString copy](self->_identifier, "copy");
  objc_msgSend(v4, "setIdentifier:", v7);

  v8 = (void *)-[NSString copy](self->_extractionSourceClassName, "copy");
  objc_msgSend(v4, "setExtractionSourceClassName:", v8);

  objc_msgSend(v4, "setOnScreen:", self->_onScreen);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CKContextExtractionItem *v4;
  unint64_t v5;
  BOOL v6;

  v4 = (CKContextExtractionItem *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[CKContextExtractionItem hash](self, "hash");
      v6 = v5 == -[CKContextExtractionItem hash](v4, "hash");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;

  v3 = -[NSString hash](self->_title, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") - v3 + 32 * v3;

  v6 = -[NSString hash](self->_bundleIdentifier, "hash") - v5 + 32 * v5;
  v7 = -[NSString hash](self->_identifier, "hash") - v6 + 32 * v6;
  v8 = -[NSString hash](self->_extractionSourceClassName, "hash");
  return self->_onScreen - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7) + 887503681;
}

- (id)description
{
  void *v3;
  NSString *title;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  title = self->_title;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_onScreen)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Title: %@, Type: %@, Identifier: %@, BundleIdentifier: %@, ExtractionClass: %@, On Screen:%@\n"), title, v5, self->_identifier, self->_bundleIdentifier, self->_extractionSourceClassName, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)toJSONSerializableDictionary
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_title, CFSTR("title"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("type"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_extractionSourceClassName, CFSTR("extractionSourceClassName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_onScreen);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("onScreen"));

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)extractionSourceClassName
{
  return self->_extractionSourceClassName;
}

- (void)setExtractionSourceClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (void)setOnScreen:(BOOL)a3
{
  self->_onScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionSourceClassName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end

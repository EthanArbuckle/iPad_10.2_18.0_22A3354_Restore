@implementation SWHighlightIdentifier

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SWHighlightIdentifier)initWithStringIdentifier:(id)a3
{
  id v4;
  SWHighlightIdentifier *v5;
  SWHighlightIdentifier *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SWHighlightIdentifier;
  v5 = -[SWHighlightIdentifier init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SWHighlightIdentifier setStringIdentifier:](v5, "setStringIdentifier:", v4);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SWHighlightIdentifier stringIdentifier](self, "stringIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sid"));

}

- (SWHighlightIdentifier)initWithCoder:(id)a3
{
  id v4;
  SWHighlightIdentifier *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SWHighlightIdentifier;
  v5 = -[SWHighlightIdentifier init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWHighlightIdentifier setStringIdentifier:](v5, "setStringIdentifier:", v6);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3;
  void *v4;

  v3 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v3, "stringIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStringIdentifier:", v4);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[SWHighlightIdentifier stringIdentifier](self, "stringIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (objc_msgSend(v6, "stringIdentifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SWHighlightIdentifier stringIdentifier](self, "stringIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if (v7)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v10 = 1;
    }

    goto LABEL_9;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SWHighlightIdentifier stringIdentifier](self, "stringIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)stringIdentifier
{
  return self->_stringIdentifier;
}

- (void)setStringIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringIdentifier, 0);
}

@end

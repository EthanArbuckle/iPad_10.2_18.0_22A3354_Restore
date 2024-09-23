@implementation MXMSampleTag

+ (NSSet)ancestery
{
  return 0;
}

- (NSString)domainNameString
{
  void *v2;
  void *v3;

  -[NSOrderedSet array](self->_taxonomy, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (MXMSampleTag)initWithDNString:(id)a3
{
  void *v4;
  MXMSampleTag *v5;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MXMSampleTag initWithComponents:](self, "initWithComponents:", v4);

  return v5;
}

- (MXMSampleTag)initWithComponents:(id)a3
{
  void *v4;
  MXMSampleTag *v5;

  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MXMSampleTag initWithTaxonomy:](self, "initWithTaxonomy:", v4);

  return v5;
}

- (MXMSampleTag)initWithTaxonomy:(id)a3
{
  id v5;
  MXMSampleTag *v6;
  MXMSampleTag *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXMSampleTag;
  v6 = -[MXMSampleTag init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_taxonomy, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_taxonomy, CFSTR("_taxonomy"));
}

- (MXMSampleTag)initWithCoder:(id)a3
{
  id v4;
  MXMSampleTag *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSOrderedSet *taxonomy;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MXMSampleTag;
  v5 = -[MXMSampleTag init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_taxonomy"));
    v9 = objc_claimAutoreleasedReturnValue();
    taxonomy = v5->_taxonomy;
    v5->_taxonomy = (NSOrderedSet *)v9;

  }
  return v5;
}

- (id)copy
{
  return -[MXMSampleTag copyWithZone:](self, "copyWithZone:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc((Class)objc_opt_class());
  v6 = (void *)-[NSOrderedSet copyWithZone:](self->_taxonomy, "copyWithZone:", a3);
  v7 = (void *)objc_msgSend(v5, "initWithTaxonomy:", v6);

  return v7;
}

- (BOOL)containsTag:(id)a3
{
  return -[NSOrderedSet isSubsetOfOrderedSet:](self->_taxonomy, "isSubsetOfOrderedSet:", *((_QWORD *)a3 + 1));
}

- (BOOL)isEqualToTag:(id)a3
{
  id *v5;
  char v6;
  void *v8;

  v5 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMSampleTag.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[tag isKindOfClass:MXMSampleTag.class]"));

  }
  v6 = objc_msgSend(v5[1], "isEqualToOrderedSet:", self->_taxonomy);

  return v6;
}

- (unint64_t)hash
{
  return -[NSOrderedSet hash](self->_taxonomy, "hash");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXMSampleTag domainNameString](self, "domainNameString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p '%@'>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MXMSampleTag)parent
{
  return self->_parent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_taxonomy, 0);
}

@end

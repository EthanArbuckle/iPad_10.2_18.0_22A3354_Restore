@implementation ILClassificationReportRequest

- (ILClassificationReportRequest)initWithExtensionIdentifier:(id)a3 jsonDictionary:(id)a4
{
  id v6;
  id v7;
  ILClassificationReportRequest *v8;
  uint64_t v9;
  NSString *extensionIdentifier;
  uint64_t v11;
  NSDictionary *jsonDictionary;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ILClassificationReportRequest;
  v8 = -[ILClassificationReportRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    extensionIdentifier = v8->_extensionIdentifier;
    v8->_extensionIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    jsonDictionary = v8->_jsonDictionary;
    v8->_jsonDictionary = (NSDictionary *)v11;

  }
  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[ILClassificationReportRequest extensionIdentifier](self, "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ILClassificationReportRequest jsonDictionary](self, "jsonDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p extensionIdentifier=%@ jsonDict=%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[ILClassificationReportRequest isEqualToRequest:](self, "isEqualToRequest:", v4);

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = a3;
  -[ILClassificationReportRequest extensionIdentifier](self, "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[ILClassificationReportRequest jsonDictionary](self, "jsonDictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jsonDictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 | v8)
      v9 = objc_msgSend((id)v7, "isEqual:", v8);
    else
      v9 = 1;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[ILClassificationReportRequest extensionIdentifier](self, "extensionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[ILClassificationReportRequest jsonDictionary](self, "jsonDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ILClassificationReportRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  ILClassificationReportRequest *v16;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_extensionIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_jsonDictionary);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[ILClassificationReportRequest initWithExtensionIdentifier:jsonDictionary:](self, "initWithExtensionIdentifier:jsonDictionary:", v7, v15);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[ILClassificationReportRequest extensionIdentifier](self, "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_extensionIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[ILClassificationReportRequest jsonDictionary](self, "jsonDictionary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_jsonDictionary);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (NSDictionary)jsonDictionary
{
  return self->_jsonDictionary;
}

- (void)setJsonDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonDictionary, 0);
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
}

@end

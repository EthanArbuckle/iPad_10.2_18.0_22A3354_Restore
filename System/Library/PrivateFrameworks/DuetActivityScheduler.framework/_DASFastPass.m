@implementation _DASFastPass

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DASFastPass)initWithCoder:(id)a3
{
  id v4;
  _DASFastPass *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *processingTaskIdentifiers;
  _DASFastPass *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_DASFastPass;
  v5 = -[_DASFastPass init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("processingTaskIdentifiers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    v11 = objc_msgSend(v10, "copy");
    processingTaskIdentifiers = v5->_processingTaskIdentifiers;
    v5->_processingTaskIdentifiers = (NSArray *)v11;

    v5->_semanticVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kSemanticIdentifier"));
    v13 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_DASFastPass processingTaskIdentifiers](self, "processingTaskIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v5, "encodeObject:forKey:", self->_processingTaskIdentifiers, CFSTR("processingTaskIdentifiers"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[_DASFastPass semanticVersion](self, "semanticVersion"), CFSTR("kSemanticIdentifier"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DASFastPass *v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init(_DASFastPass);
  -[_DASFastPass processingTaskIdentifiers](self, "processingTaskIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[_DASFastPass setProcessingTaskIdentifiers:](v5, "setProcessingTaskIdentifiers:", v7);

  -[_DASFastPass setSemanticVersion:](v5, "setSemanticVersion:", -[_DASFastPass semanticVersion](self, "semanticVersion"));
  return v5;
}

- (NSArray)processingTaskIdentifiers
{
  return self->_processingTaskIdentifiers;
}

- (void)setProcessingTaskIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)semanticVersion
{
  return self->_semanticVersion;
}

- (void)setSemanticVersion:(int64_t)a3
{
  self->_semanticVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingTaskIdentifiers, 0);
}

@end

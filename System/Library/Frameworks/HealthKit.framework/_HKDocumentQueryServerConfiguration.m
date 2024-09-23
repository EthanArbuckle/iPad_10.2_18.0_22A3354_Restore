@implementation _HKDocumentQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKDocumentQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setSortDescriptors:", self->_sortDescriptors);
  objc_msgSend(v4, "setLimit:", self->_limit);
  objc_msgSend(v4, "setIncludeDocumentData:", self->_includeDocumentData);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKDocumentQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKDocumentQueryServerConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *sortDescriptors;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_HKDocumentQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("sortDescriptors"));
    v9 = objc_claimAutoreleasedReturnValue();
    sortDescriptors = v5->_sortDescriptors;
    v5->_sortDescriptors = (NSArray *)v9;

    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("limit"));
    v5->_includeDocumentData = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeDocumentData"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKDocumentQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sortDescriptors, CFSTR("sortDescriptors"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_limit, CFSTR("limit"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_includeDocumentData, CFSTR("includeDocumentData"));

}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (BOOL)includeDocumentData
{
  return self->_includeDocumentData;
}

- (void)setIncludeDocumentData:(BOOL)a3
{
  self->_includeDocumentData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

@end

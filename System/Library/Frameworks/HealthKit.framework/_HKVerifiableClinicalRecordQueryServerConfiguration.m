@implementation _HKVerifiableClinicalRecordQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKVerifiableClinicalRecordQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setRecordTypes:", self->_recordTypes);
  objc_msgSend(v4, "setSourceTypes:", self->_sourceTypes);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKVerifiableClinicalRecordQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKVerifiableClinicalRecordQueryServerConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *recordTypes;
  uint64_t v14;
  NSArray *sourceTypes;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_HKVerifiableClinicalRecordQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("recordTypes"));
    v12 = objc_claimAutoreleasedReturnValue();
    recordTypes = v5->_recordTypes;
    v5->_recordTypes = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("sourceTypes"));
    v14 = objc_claimAutoreleasedReturnValue();
    sourceTypes = v5->_sourceTypes;
    v5->_sourceTypes = (NSArray *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKVerifiableClinicalRecordQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_recordTypes, CFSTR("recordTypes"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sourceTypes, CFSTR("sourceTypes"));

}

- (NSArray)recordTypes
{
  return self->_recordTypes;
}

- (void)setRecordTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)sourceTypes
{
  return self->_sourceTypes;
}

- (void)setSourceTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceTypes, 0);
  objc_storeStrong((id *)&self->_recordTypes, 0);
}

@end

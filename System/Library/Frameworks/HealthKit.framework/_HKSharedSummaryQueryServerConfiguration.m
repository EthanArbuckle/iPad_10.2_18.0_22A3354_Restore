@implementation _HKSharedSummaryQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKSharedSummaryQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setTransaction:", self->_transaction);
  objc_msgSend(v4, "setPackage:", self->_package);
  objc_msgSend(v4, "setIncludedIdentifiers:", self->_includedIdentifiers);
  objc_msgSend(v4, "setIncludedObjectTypes:", self->_includedObjectTypes);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKSharedSummaryQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKSharedSummaryQueryServerConfiguration *v5;
  uint64_t v6;
  HKSharedSummaryTransaction *transaction;
  uint64_t v8;
  NSString *package;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSSet *includedIdentifiers;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSSet *includedObjectTypes;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_HKSharedSummaryQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transaction"));
    v6 = objc_claimAutoreleasedReturnValue();
    transaction = v5->_transaction;
    v5->_transaction = (HKSharedSummaryTransaction *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("package"));
    v8 = objc_claimAutoreleasedReturnValue();
    package = v5->_package;
    v5->_package = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("included-identifiers"));
    v13 = objc_claimAutoreleasedReturnValue();
    includedIdentifiers = v5->_includedIdentifiers;
    v5->_includedIdentifiers = (NSSet *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("included-objecttypes"));
    v18 = objc_claimAutoreleasedReturnValue();
    includedObjectTypes = v5->_includedObjectTypes;
    v5->_includedObjectTypes = (NSSet *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKSharedSummaryQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_transaction, CFSTR("transaction"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_package, CFSTR("package"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_includedIdentifiers, CFSTR("included-identifiers"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_includedObjectTypes, CFSTR("included-objecttypes"));

}

- (HKSharedSummaryTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)package
{
  return self->_package;
}

- (void)setPackage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSSet)includedIdentifiers
{
  return self->_includedIdentifiers;
}

- (void)setIncludedIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSSet)includedObjectTypes
{
  return self->_includedObjectTypes;
}

- (void)setIncludedObjectTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includedObjectTypes, 0);
  objc_storeStrong((id *)&self->_includedIdentifiers, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end

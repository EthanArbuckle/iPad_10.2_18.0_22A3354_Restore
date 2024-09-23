@implementation FPImportItemPendingScanningProvider

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *itemIdentifier;
  id v5;

  itemIdentifier = self->_itemIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", itemIdentifier, CFSTR("_itemIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_diagnosticAttributes, CFSTR("_diagnosticAttributes"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemPendingScanningProviderEnumerationStatus, CFSTR("_itemPendingScanningProviderEnumerationStatus"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_itemPendingScanningProviderHasMultiplePagesEnumeration, CFSTR("_itemPendingScanningProviderHasMultiplePagesEnumeration"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemPendingScanningProviderNumberOfChildren, CFSTR("_itemPendingScanningProviderNumberOfChildren"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemPendingScanningProviderNumberOfChildrenPendingCreation, CFSTR("_itemPendingScanningProviderNumberOfChildrenPendingCreation"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemPendingScanningProviderNumberOfChildrenFailingCreation, CFSTR("_itemPendingScanningProviderNumberOfChildrenFailingCreation"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemPendingScanningProviderRemovalOfDatalessBitStatus, CFSTR("_itemPendingScanningProviderRemovalOfDatalessBitStatus"));

}

- (FPImportItemPendingScanningProvider)initWithCoder:(id)a3
{
  id v4;
  FPImportItemPendingScanningProvider *v5;
  uint64_t v6;
  NSString *itemIdentifier;
  uint64_t v8;
  NSFileProviderDiagnosticAttributesDescriptor *diagnosticAttributes;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPImportItemPendingScanningProvider;
  v5 = -[FPImportItemPendingScanningProvider init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_itemIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_diagnosticAttributes"));
    v8 = objc_claimAutoreleasedReturnValue();
    diagnosticAttributes = v5->_diagnosticAttributes;
    v5->_diagnosticAttributes = (NSFileProviderDiagnosticAttributesDescriptor *)v8;

    v5->_itemPendingScanningProviderEnumerationStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_itemPendingScanningProviderEnumerationStatus"));
    v5->_itemPendingScanningProviderHasMultiplePagesEnumeration = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_itemPendingScanningProviderHasMultiplePagesEnumeration"));
    v5->_itemPendingScanningProviderNumberOfChildren = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_itemPendingScanningProviderNumberOfChildren"));
    v5->_itemPendingScanningProviderNumberOfChildrenPendingCreation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_itemPendingScanningProviderNumberOfChildrenPendingCreation"));
    v5->_itemPendingScanningProviderNumberOfChildrenFailingCreation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_itemPendingScanningProviderNumberOfChildrenFailingCreation"));
    v5->_itemPendingScanningProviderRemovalOfDatalessBitStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_itemPendingScanningProviderRemovalOfDatalessBitStatus"));
  }

  return v5;
}

- (id)json
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemPendingScanningProviderEnumerationStatus);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("itemPendingScanningProviderEnumerationStatus"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_itemPendingScanningProviderHasMultiplePagesEnumeration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("itemPendingScanningProviderHasMultiplePagesEnumeration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemPendingScanningProviderNumberOfChildren);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("itemPendingScanningProviderNumberOfChildren"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemPendingScanningProviderNumberOfChildrenPendingCreation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("itemPendingScanningProviderNumberOfChildrenPendingCreation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemPendingScanningProviderNumberOfChildrenFailingCreation);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("itemPendingScanningProviderNumberOfChildrenFailingCreation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemPendingScanningProviderRemovalOfDatalessBitStatus);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("itemPendingScanningProviderRemovalOfDatalessBitStatus"));

  return v3;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSFileProviderDiagnosticAttributesDescriptor)diagnosticAttributes
{
  return self->_diagnosticAttributes;
}

- (void)setDiagnosticAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)itemPendingScanningProviderEnumerationStatus
{
  return self->_itemPendingScanningProviderEnumerationStatus;
}

- (void)setItemPendingScanningProviderEnumerationStatus:(int64_t)a3
{
  self->_itemPendingScanningProviderEnumerationStatus = a3;
}

- (BOOL)itemPendingScanningProviderHasMultiplePagesEnumeration
{
  return self->_itemPendingScanningProviderHasMultiplePagesEnumeration;
}

- (void)setItemPendingScanningProviderHasMultiplePagesEnumeration:(BOOL)a3
{
  self->_itemPendingScanningProviderHasMultiplePagesEnumeration = a3;
}

- (int64_t)itemPendingScanningProviderNumberOfChildren
{
  return self->_itemPendingScanningProviderNumberOfChildren;
}

- (void)setItemPendingScanningProviderNumberOfChildren:(int64_t)a3
{
  self->_itemPendingScanningProviderNumberOfChildren = a3;
}

- (int64_t)itemPendingScanningProviderNumberOfChildrenPendingCreation
{
  return self->_itemPendingScanningProviderNumberOfChildrenPendingCreation;
}

- (void)setItemPendingScanningProviderNumberOfChildrenPendingCreation:(int64_t)a3
{
  self->_itemPendingScanningProviderNumberOfChildrenPendingCreation = a3;
}

- (int64_t)itemPendingScanningProviderNumberOfChildrenFailingCreation
{
  return self->_itemPendingScanningProviderNumberOfChildrenFailingCreation;
}

- (void)setItemPendingScanningProviderNumberOfChildrenFailingCreation:(int64_t)a3
{
  self->_itemPendingScanningProviderNumberOfChildrenFailingCreation = a3;
}

- (int64_t)itemPendingScanningProviderRemovalOfDatalessBitStatus
{
  return self->_itemPendingScanningProviderRemovalOfDatalessBitStatus;
}

- (void)setItemPendingScanningProviderRemovalOfDatalessBitStatus:(int64_t)a3
{
  self->_itemPendingScanningProviderRemovalOfDatalessBitStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticAttributes, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end

@implementation FPImportItemPendingScanningDisk

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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemPendingScanningDiskEnumerationStatus, CFSTR("_itemPendingScanningDiskEnumerationStatus"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_itemPendingScanningDiskHasMultiplePagesEnumeration, CFSTR("_itemPendingScanningDiskHasMultiplePagesEnumeration"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation, CFSTR("_itemPendingScanningDiskNumberOfChildrenPendingReconciliation"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation, CFSTR("_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion, CFSTR("_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion, CFSTR("_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent, CFSTR("_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp, CFSTR("_itemPendingScanningDiskNumberOfChildrenPendingSyncUp"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent, CFSTR("_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown, CFSTR("_itemPendingScanningDiskNumberOfChildrenPendingSyncDown"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemPendingScanningDiskNumberOfChildrenPendingRejection, CFSTR("_itemPendingScanningDiskNumberOfChildrenPendingRejection"));

}

- (FPImportItemPendingScanningDisk)initWithCoder:(id)a3
{
  id v4;
  FPImportItemPendingScanningDisk *v5;
  uint64_t v6;
  NSString *itemIdentifier;
  uint64_t v8;
  NSFileProviderDiagnosticAttributesDescriptor *diagnosticAttributes;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPImportItemPendingScanningDisk;
  v5 = -[FPImportItemPendingScanningDisk init](&v11, sel_init);
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

    v5->_itemPendingScanningDiskEnumerationStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_itemPendingScanningDiskEnumerationStatus"));
    v5->_itemPendingScanningDiskHasMultiplePagesEnumeration = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_itemPendingScanningDiskHasMultiplePagesEnumeration"));
    v5->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_itemPendingScanningDiskNumberOfChildrenPendingReconciliation"));
    v5->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation"));
    v5->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion"));
    v5->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion"));
    v5->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent"));
    v5->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_itemPendingScanningDiskNumberOfChildrenPendingSyncUp"));
    v5->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent"));
    v5->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_itemPendingScanningDiskNumberOfChildrenPendingSyncDown"));
    v5->_itemPendingScanningDiskNumberOfChildrenPendingRejection = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_itemPendingScanningDiskNumberOfChildrenPendingRejection"));
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_itemIdentifier, CFSTR("itemIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemPendingScanningDiskEnumerationStatus);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("itemPendingScanningDiskEnumerationStatus"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_itemPendingScanningDiskHasMultiplePagesEnumeration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("itemPendingScanningDiskHasMultiplePagesEnumeration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("itemPendingScanningDiskNumberOfChildrenPendingReconciliation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("itemPendingScanningDiskNumberOfChildrenPendingSyncUp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("itemPendingScanningDiskNumberOfChildrenPendingSyncDown"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemPendingScanningDiskNumberOfChildrenPendingRejection);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("itemPendingScanningDiskNumberOfChildrenPendingRejection"));

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

- (int64_t)itemPendingScanningDiskEnumerationStatus
{
  return self->_itemPendingScanningDiskEnumerationStatus;
}

- (void)setItemPendingScanningDiskEnumerationStatus:(int64_t)a3
{
  self->_itemPendingScanningDiskEnumerationStatus = a3;
}

- (BOOL)itemPendingScanningDiskHasMultiplePagesEnumeration
{
  return self->_itemPendingScanningDiskHasMultiplePagesEnumeration;
}

- (void)setItemPendingScanningDiskHasMultiplePagesEnumeration:(BOOL)a3
{
  self->_itemPendingScanningDiskHasMultiplePagesEnumeration = a3;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingReconciliation
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingReconciliation:(int64_t)a3
{
  self->_itemPendingScanningDiskNumberOfChildrenPendingReconciliation = a3;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation
{
  return self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation;
}

- (void)setItemPendingScanningDiskNumberOfChildrenNotPendingReconciliation:(int64_t)a3
{
  self->_itemPendingScanningDiskNumberOfChildrenNotPendingReconciliation = a3;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion:(int64_t)a3
{
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpDeletion = a3;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion:(int64_t)a3
{
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownDeletion = a3;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent:(int64_t)a3
{
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUpReparent = a3;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncUp
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncUp:(int64_t)a3
{
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncUp = a3;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent:(int64_t)a3
{
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDownReparent = a3;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingSyncDown
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingSyncDown:(int64_t)a3
{
  self->_itemPendingScanningDiskNumberOfChildrenPendingSyncDown = a3;
}

- (int64_t)itemPendingScanningDiskNumberOfChildrenPendingRejection
{
  return self->_itemPendingScanningDiskNumberOfChildrenPendingRejection;
}

- (void)setItemPendingScanningDiskNumberOfChildrenPendingRejection:(int64_t)a3
{
  self->_itemPendingScanningDiskNumberOfChildrenPendingRejection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticAttributes, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end

@implementation FPImportItemPendingReconciliation

- (FPImportItemPendingReconciliation)initWithItemIdentifier:(id)a3
{
  id v5;
  FPImportItemPendingReconciliation *v6;
  FPImportItemPendingReconciliation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPImportItemPendingReconciliation;
  v6 = -[FPImportItemPendingReconciliation init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_itemIdentifier, a3);
    v7->_itemPendingReconciliationIsLocked = 0;
    v7->_itemPendingReconciliationJobBlockingCode = -1;
  }

  return v7;
}

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
  objc_msgSend(v5, "encodeBool:forKey:", self->_itemPendingReconciliationIsLocked, CFSTR("_itemPendingReconciliationIsLocked"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_itemPendingReconciliationIsLockedInDB, CFSTR("_itemPendingReconciliationIsLockedInDB"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemPendingReconciliationJobCode, CFSTR("_itemPendingReconciliationJobCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemPendingReconciliationJobSchedulingState, CFSTR("_itemPendingReconciliationJobSchedulingState"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_itemPendingReconciliationJobBlockingCode, CFSTR("_itemPendingReconciliationJobBlockingCode"));

}

- (FPImportItemPendingReconciliation)initWithCoder:(id)a3
{
  id v4;
  FPImportItemPendingReconciliation *v5;
  uint64_t v6;
  NSString *itemIdentifier;
  uint64_t v8;
  NSFileProviderDiagnosticAttributesDescriptor *diagnosticAttributes;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPImportItemPendingReconciliation;
  v5 = -[FPImportItemPendingReconciliation init](&v11, sel_init);
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

    v5->_itemPendingReconciliationIsLocked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_itemPendingReconciliationIsLocked"));
    v5->_itemPendingReconciliationIsLockedInDB = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_itemPendingReconciliationIsLockedInDB"));
    v5->_itemPendingReconciliationJobCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_itemPendingReconciliationJobCode"));
    v5->_itemPendingReconciliationJobSchedulingState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_itemPendingReconciliationJobSchedulingState"));
    v5->_itemPendingReconciliationJobBlockingCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_itemPendingReconciliationJobBlockingCode"));
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

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_itemIdentifier, CFSTR("itemIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_itemPendingReconciliationIsLocked);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("itemPendingReconciliationIsLocked"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_itemPendingReconciliationIsLockedInDB);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("itemPendingReconciliationIsLockedInDB"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemPendingReconciliationJobCode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("itemPendingReconciliationJobCode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemPendingReconciliationJobSchedulingState);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("itemPendingReconciliationJobSchedulingState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_itemPendingReconciliationJobBlockingCode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("itemPendingReconciliationJobBlockingCode"));

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

- (BOOL)itemPendingReconciliationIsLocked
{
  return self->_itemPendingReconciliationIsLocked;
}

- (void)setItemPendingReconciliationIsLocked:(BOOL)a3
{
  self->_itemPendingReconciliationIsLocked = a3;
}

- (BOOL)itemPendingReconciliationIsLockedInDB
{
  return self->_itemPendingReconciliationIsLockedInDB;
}

- (void)setItemPendingReconciliationIsLockedInDB:(BOOL)a3
{
  self->_itemPendingReconciliationIsLockedInDB = a3;
}

- (int64_t)itemPendingReconciliationJobCode
{
  return self->_itemPendingReconciliationJobCode;
}

- (void)setItemPendingReconciliationJobCode:(int64_t)a3
{
  self->_itemPendingReconciliationJobCode = a3;
}

- (int64_t)itemPendingReconciliationJobSchedulingState
{
  return self->_itemPendingReconciliationJobSchedulingState;
}

- (void)setItemPendingReconciliationJobSchedulingState:(int64_t)a3
{
  self->_itemPendingReconciliationJobSchedulingState = a3;
}

- (int64_t)itemPendingReconciliationJobBlockingCode
{
  return self->_itemPendingReconciliationJobBlockingCode;
}

- (void)setItemPendingReconciliationJobBlockingCode:(int64_t)a3
{
  self->_itemPendingReconciliationJobBlockingCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticAttributes, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end

@implementation DAABLegacyContainer

- (DAABLegacyContainer)initWithABSource:(void *)a3
{
  DAABLegacyContainer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DAABLegacyContainer;
  v4 = -[DAABLegacyContainer init](&v6, sel_init);
  if (v4)
  {
    v4->_source = (void *)CFRetain(a3);
    ABSourceSetShouldIgnoreCapabilitiesRestrictions();
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_source);
  v3.receiver = self;
  v3.super_class = (Class)DAABLegacyContainer;
  -[DAABLegacyContainer dealloc](&v3, sel_dealloc);
}

- (id)identifier
{
  void *v2;

  v2 = -[DAABLegacyContainer source](self, "source");
  return (id)(id)ABRecordCopyValue(v2, *MEMORY[0x1E0CF6300]);
}

- (id)name
{
  void *v2;

  v2 = -[DAABLegacyContainer source](self, "source");
  return (id)(id)ABRecordCopyValue(v2, *MEMORY[0x1E0CF6318]);
}

- (void)setName:(id)a3
{
  void *v4;
  id value;

  value = a3;
  v4 = -[DAABLegacyContainer source](self, "source");
  ABRecordSetValue(v4, *MEMORY[0x1E0CF6318], value, 0);

}

- (BOOL)isLocal
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = -[DAABLegacyContainer source](self, "source");
  v3 = (void *)ABRecordCopyValue(v2, *MEMORY[0x1E0CF6338]);
  v4 = objc_msgSend(v3, "integerValue") == 0;

  return v4;
}

- (int64_t)type
{
  void *v2;
  void *v3;
  int64_t v4;

  v2 = -[DAABLegacyContainer source](self, "source");
  v3 = (void *)ABRecordCopyValue(v2, *MEMORY[0x1E0CF6338]);
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)setType:(int64_t)a3
{
  void *v4;

  v4 = -[DAABLegacyContainer source](self, "source");
  ABRecordSetValue(v4, *MEMORY[0x1E0CF6338], (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3), 0);
}

- (id)externalIdentifier
{
  void *v2;

  v2 = -[DAABLegacyContainer source](self, "source");
  return (id)(id)ABRecordCopyValue(v2, *MEMORY[0x1E0CF62E8]);
}

- (void)setExternalIdentifier:(id)a3
{
  void *v4;
  id value;

  value = a3;
  v4 = -[DAABLegacyContainer source](self, "source");
  ABRecordSetValue(v4, *MEMORY[0x1E0CF62E8], value, 0);

}

- (id)cTag
{
  void *v2;

  v2 = -[DAABLegacyContainer source](self, "source");
  return (id)(id)ABRecordCopyValue(v2, *MEMORY[0x1E0CF62F0]);
}

- (void)setCTag:(id)a3
{
  void *v4;
  id value;

  value = a3;
  v4 = -[DAABLegacyContainer source](self, "source");
  ABRecordSetValue(v4, *MEMORY[0x1E0CF62F0], value, 0);

}

- (id)syncTag
{
  void *v2;

  v2 = -[DAABLegacyContainer source](self, "source");
  return (id)(id)ABRecordCopyValue(v2, *MEMORY[0x1E0CF62F8]);
}

- (void)setSyncTag:(id)a3
{
  void *v4;
  id value;

  value = a3;
  v4 = -[DAABLegacyContainer source](self, "source");
  ABRecordSetValue(v4, *MEMORY[0x1E0CF62F8], value, 0);

}

- (id)syncData
{
  void *v2;

  v2 = -[DAABLegacyContainer source](self, "source");
  return (id)(id)ABRecordCopyValue(v2, *MEMORY[0x1E0CF6330]);
}

- (void)setSyncData:(id)a3
{
  void *v4;
  id value;

  value = a3;
  v4 = -[DAABLegacyContainer source](self, "source");
  ABRecordSetValue(v4, *MEMORY[0x1E0CF6330], value, 0);

}

- (id)constraintsPath
{
  void *v2;

  v2 = -[DAABLegacyContainer source](self, "source");
  return (id)(id)ABRecordCopyValue(v2, *MEMORY[0x1E0CF62D8]);
}

- (void)setConstraintsPath:(id)a3
{
  void *v4;
  id value;

  value = a3;
  v4 = -[DAABLegacyContainer source](self, "source");
  ABRecordSetValue(v4, *MEMORY[0x1E0CF62D8], value, 0);

}

- (BOOL)isContentReadonly
{
  -[DAABLegacyContainer source](self, "source");
  return ABSourceIsContentReadonlyInCapabilityRestrictions();
}

- (void)setContentReadonly:(BOOL)a3
{
  -[DAABLegacyContainer source](self, "source");
  ABSourceSetContentReadonly();
}

- (BOOL)arePropertiesReadonly
{
  -[DAABLegacyContainer source](self, "source");
  return ABSourceAreFoldersReadonlyInCapabilityRestrictions();
}

- (void)setArePropertiesReadonly:(BOOL)a3
{
  -[DAABLegacyContainer source](self, "source");
  ABSourceSetFoldersReadonly();
}

- (BOOL)isSearchContainer
{
  return ((unint64_t)-[DAABLegacyContainer type](self, "type") >> 24) & 1;
}

- (id)meContactIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[DAABLegacyContainer source](self, "source");
  objc_msgSend(v2, "numberWithInt:", ABRecordGetIntValue());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setMeContactIdentifier:(id)a3
{
  id v4;
  const void *AddressBook;
  ABRecordID v6;

  v4 = a3;
  -[DAABLegacyContainer source](self, "source");
  AddressBook = (const void *)ABRecordGetAddressBook();
  v6 = objc_msgSend(v4, "intValue");

  ABAddressBookGetPersonWithRecordID(AddressBook, v6);
  -[DAABLegacyContainer source](self, "source");
  ABSourceSetMe();
}

- (id)accountIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[DAABLegacyContainer source](self, "source");
  objc_msgSend(v2, "numberWithInt:", ABRecordGetIntValue());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setAccountIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[DAABLegacyContainer source](self, "source");
  objc_msgSend(v4, "intValue");

  ABRecordSetIntValue();
}

- (void)markForDeletion
{
  const void *AddressBook;

  -[DAABLegacyContainer source](self, "source");
  AddressBook = (const void *)ABRecordGetAddressBook();
  ABAddressBookRemoveRecord(AddressBook, -[DAABLegacyContainer source](self, "source"), 0);
}

- (void)markAsDefault
{
  -[DAABLegacyContainer source](self, "source");
  ABRecordGetAddressBook();
  -[DAABLegacyContainer source](self, "source");
  ABAddressBookSetDefaultSource();
}

- (BOOL)isGuardianRestricted
{
  -[DAABLegacyContainer source](self, "source");
  return (ABRecordGetIntValue() >> 2) & 1;
}

- (void)setGuardianRestricted:(BOOL)a3
{
  -[DAABLegacyContainer source](self, "source");
  ABRecordGetIntValue();
  -[DAABLegacyContainer source](self, "source");
  ABRecordSetIntValue();
}

- (BOOL)isGuardianStateDirty
{
  -[DAABLegacyContainer source](self, "source");
  return (ABRecordGetIntValue() >> 3) & 1;
}

- (void)setGuardianStateDirty:(BOOL)a3
{
  -[DAABLegacyContainer source](self, "source");
  ABRecordGetIntValue();
  -[DAABLegacyContainer source](self, "source");
  ABRecordSetIntValue();
}

- (BOOL)isContact
{
  return 0;
}

- (BOOL)isGroup
{
  return 0;
}

- (BOOL)isContainer
{
  return 1;
}

- (BOOL)isAccount
{
  return 0;
}

- (void)updateSaveRequest:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("DAABLegacyContainer cannot update CNSaveRequest"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (id)asContainer
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("DAABLegacyContainer does not support asContainer"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)source
{
  return self->_source;
}

@end

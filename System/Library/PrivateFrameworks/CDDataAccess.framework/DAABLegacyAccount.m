@implementation DAABLegacyAccount

- (DAABLegacyAccount)initWithABAccout:(void *)a3
{
  DAABLegacyAccount *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DAABLegacyAccount;
  v4 = -[DAABLegacyAccount init](&v6, sel_init);
  if (v4)
    v4->_account = (void *)CFRetain(a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_account);
  v3.receiver = self;
  v3.super_class = (Class)DAABLegacyAccount;
  -[DAABLegacyAccount dealloc](&v3, sel_dealloc);
}

- (int)legacyIdentifier
{
  return ABRecordGetRecordID(-[DAABLegacyAccount account](self, "account"));
}

- (id)identifier
{
  -[DAABLegacyAccount account](self, "account");
  return (id)ABAccountCopyInternalUUID();
}

- (id)externalIdentifier
{
  -[DAABLegacyAccount account](self, "account");
  return (id)ABAccountCopyIdentifier();
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
  return 0;
}

- (BOOL)isAccount
{
  return 1;
}

- (void)updateSaveRequest:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("DAABLegacyAccount cannot update CNSaveRequest"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)markForDeletion
{
  const void *AddressBook;

  -[DAABLegacyAccount account](self, "account");
  AddressBook = (const void *)ABRecordGetAddressBook();
  ABAddressBookRemoveRecord(AddressBook, -[DAABLegacyAccount account](self, "account"), 0);
}

- (void)account
{
  return self->_account;
}

@end

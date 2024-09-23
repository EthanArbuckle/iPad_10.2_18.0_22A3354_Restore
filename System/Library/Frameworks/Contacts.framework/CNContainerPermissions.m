@implementation CNContainerPermissions

- (CNContainerPermissions)initWithCanCreateContacts:(BOOL)a3 canDeleteContacts:(BOOL)a4 canCreateGroups:(BOOL)a5
{
  CNContainerPermissions *v8;
  CNContainerPermissions *v9;
  CNContainerPermissions *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CNContainerPermissions;
  v8 = -[CNContainerPermissions init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_canCreateContacts = a3;
    v8->_canDeleteContacts = a4;
    v8->_canCreateGroups = a5;
    v10 = v8;
  }

  return v9;
}

- (CNContainerPermissions)init
{
  return -[CNContainerPermissions initWithCanCreateContacts:canDeleteContacts:canCreateGroups:](self, "initWithCanCreateContacts:canDeleteContacts:canCreateGroups:", 0, 0, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContainerPermissions)initWithCoder:(id)a3
{
  id v4;
  CNContainerPermissions *v5;
  CNContainerPermissions *v6;

  v4 = a3;
  v5 = -[CNContainerPermissions init](self, "init");
  if (v5)
  {
    v5->_canCreateContacts = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("canCreateContacts")) != 0;
    v5->_canDeleteContacts = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("canDeleteContacts")) != 0;
    v5->_canCreateGroups = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("canCreateGroups")) != 0;
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 canCreateContacts;
  id v5;

  canCreateContacts = self->_canCreateContacts;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", canCreateContacts, CFSTR("canCreateContacts"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canDeleteContacts, CFSTR("canDeleteContacts"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canCreateGroups, CFSTR("canCreateGroups"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  _QWORD aBlock[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __34__CNContainerPermissions_isEqual___block_invoke;
  v17[3] = &unk_1E29F7D70;
  v17[4] = self;
  v18 = v4;
  aBlock[0] = v7;
  aBlock[1] = 3221225472;
  aBlock[2] = __34__CNContainerPermissions_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E29F7D70;
  aBlock[4] = self;
  v8 = v18;
  v16 = v8;
  v9 = _Block_copy(aBlock);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __34__CNContainerPermissions_isEqual___block_invoke_3;
  v13[3] = &unk_1E29F7D70;
  v13[4] = self;
  v14 = v8;
  v10 = v8;
  v11 = _Block_copy(v13);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v10, v6, self, v17, v9, v11, 0);

  return (char)self;
}

uint64_t __34__CNContainerPermissions_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isBool:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "canCreateContacts"), objc_msgSend(*(id *)(a1 + 40), "canCreateContacts"));
}

uint64_t __34__CNContainerPermissions_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isBool:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "canDeleteContacts"), objc_msgSend(*(id *)(a1 + 40), "canCreateGroups"));
}

uint64_t __34__CNContainerPermissions_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A40], "isBool:equalToOther:", objc_msgSend(*(id *)(a1 + 32), "canCreateGroups"), objc_msgSend(*(id *)(a1 + 40), "canCreateGroups"));
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD v9[5];
  _QWORD aBlock[5];
  _QWORD v11[5];

  v3 = (void *)MEMORY[0x1E0D13A78];
  v4 = MEMORY[0x1E0C809B0];
  aBlock[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __30__CNContainerPermissions_hash__block_invoke;
  v11[3] = &unk_1E29F7D98;
  v11[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__CNContainerPermissions_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v5 = _Block_copy(aBlock);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __30__CNContainerPermissions_hash__block_invoke_3;
  v9[3] = &unk_1E29F7D98;
  v9[4] = self;
  v6 = _Block_copy(v9);
  v7 = objc_msgSend(v3, "hashWithBlocks:", v11, v5, v6, 0);

  return v7;
}

uint64_t __30__CNContainerPermissions_hash__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "BOOLHash:", objc_msgSend(*(id *)(a1 + 32), "canCreateContacts"));
}

uint64_t __30__CNContainerPermissions_hash__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "BOOLHash:", objc_msgSend(*(id *)(a1 + 32), "canDeleteContacts"));
}

uint64_t __30__CNContainerPermissions_hash__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "BOOLHash:", objc_msgSend(*(id *)(a1 + 32), "canCreateGroups"));
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("canCreateContacts"), self->_canCreateContacts);
  v5 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("canDeleteContacts"), self->_canDeleteContacts);
  v6 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("canCreateGroups"), self->_canCreateGroups);
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)canCreateContacts
{
  return self->_canCreateContacts;
}

- (BOOL)canDeleteContacts
{
  return self->_canDeleteContacts;
}

- (BOOL)canCreateGroups
{
  return self->_canCreateGroups;
}

@end

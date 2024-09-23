@implementation CNiOSABGroupsWithMembersPredicate

- (CNiOSABGroupsWithMembersPredicate)initWithGroup:(id)a3 includeAllParentGroups:(BOOL)a4
{
  id v6;
  CNiOSABGroupsWithMembersPredicate *v7;
  void *v8;
  NSArray *v9;
  NSArray *recordIdentifiers;
  CNiOSABGroupsWithMembersPredicate *v11;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6
    && (v13.receiver = self,
        v13.super_class = (Class)CNiOSABGroupsWithMembersPredicate,
        v7 = -[CNPredicate initWithPredicate:](&v13, sel_initWithPredicate_, 0),
        (self = v7) != 0))
  {
    v7->_recordType = 1;
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    recordIdentifiers = self->_recordIdentifiers;
    self->_recordIdentifiers = v9;

    self->_includeAllParentGroups = a4;
    self = self;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (CNiOSABGroupsWithMembersPredicate)initWithContact:(id)a3 includeAllParentGroups:(BOOL)a4
{
  id v6;
  CNiOSABGroupsWithMembersPredicate *v7;
  void *v8;
  NSArray *v9;
  NSArray *recordIdentifiers;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6
    && (v12.receiver = self,
        v12.super_class = (Class)CNiOSABGroupsWithMembersPredicate,
        (self = -[CNPredicate initWithPredicate:](&v12, sel_initWithPredicate_, 0)) != 0))
  {
    if ((objc_msgSend(v6, "isUnified") & 1) != 0)
    {
      objc_msgSend(v6, "linkedContacts");
    }
    else
    {
      v13[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_cn_map:", &__block_literal_global_35);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    self->_recordType = 0;
    recordIdentifiers = self->_recordIdentifiers;
    self->_recordIdentifiers = v9;

    self->_includeAllParentGroups = a4;
    self = self;

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __76__CNiOSABGroupsWithMembersPredicate_initWithContact_includeAllParentGroups___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABGroupsWithMembersPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABGroupsWithMembersPredicate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *recordIdentifiers;
  unsigned int v12;
  CNiOSABGroupsWithMembersPredicate *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CNiOSABGroupsWithMembersPredicate;
  v5 = -[CNPredicate initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_recordIdentifiers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    recordIdentifiers = v5->_recordIdentifiers;
    v5->_recordIdentifiers = (NSArray *)v10;

    v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_recordType"));
    v13 = 0;
    v5->_recordType = v12;
    if (v12 <= 1)
    {
      v5->_includeAllParentGroups = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_includeAllParentGroups"));
      v13 = v5;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABGroupsWithMembersPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_recordIdentifiers, CFSTR("_recordIdentifiers"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_includeAllParentGroups, CFSTR("_includeAllParentGroups"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_recordType, CFSTR("_recordType"));

}

- (__CFArray)cn_copyGroupsInAddressBook:(void *)a3 error:(__CFError *)a4
{
  void *v5;
  __CFArray *v6;

  -[CNiOSABGroupsWithMembersPredicate recordType](self, "recordType");
  -[CNiOSABGroupsWithMembersPredicate includeAllParentGroups](self, "includeAllParentGroups");
  -[CNiOSABGroupsWithMembersPredicate recordIdentifiers](self, "recordIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFArray *)ABGroupCopyArrayOfAllGroupsWithMembersOfTypeWithUUIDs();

  return v6;
}

- (NSArray)recordIdentifiers
{
  return self->_recordIdentifiers;
}

- (unsigned)recordType
{
  return self->_recordType;
}

- (BOOL)includeAllParentGroups
{
  return self->_includeAllParentGroups;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIdentifiers, 0);
}

@end

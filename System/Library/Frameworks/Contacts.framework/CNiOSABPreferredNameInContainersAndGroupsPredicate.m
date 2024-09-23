@implementation CNiOSABPreferredNameInContainersAndGroupsPredicate

- (CNiOSABPreferredNameInContainersAndGroupsPredicate)initWithContainerIdentifiers:(id)a3 groupIdentifiers:(id)a4
{
  id v6;
  id v7;
  CNiOSABPreferredNameInContainersAndGroupsPredicate *v8;
  uint64_t v9;
  NSArray *containerIdentifiers;
  uint64_t v11;
  NSArray *groupIdentifiers;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CNiOSABPreferredNameInContainersAndGroupsPredicate;
  v8 = -[CNPredicate init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    containerIdentifiers = v8->_containerIdentifiers;
    v8->_containerIdentifiers = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    groupIdentifiers = v8->_groupIdentifiers;
    v8->_groupIdentifiers = (NSArray *)v11;

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABPreferredNameInContainersAndGroupsPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABPreferredNameInContainersAndGroupsPredicate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *containerIdentifiers;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *groupIdentifiers;
  CNiOSABPreferredNameInContainersAndGroupsPredicate *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CNiOSABPreferredNameInContainersAndGroupsPredicate;
  v5 = -[CNPredicate initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_containerIdentifiers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    containerIdentifiers = v5->_containerIdentifiers;
    v5->_containerIdentifiers = (NSArray *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("_groupIdentifiers"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    groupIdentifiers = v5->_groupIdentifiers;
    v5->_groupIdentifiers = (NSArray *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABPreferredNameInContainersAndGroupsPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_containerIdentifiers, CFSTR("_containerIdentifiers"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_groupIdentifiers, CFSTR("_groupIdentifiers"));

}

- (BOOL)cn_supportsNativeSorting
{
  return 1;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (BOOL)cn_supportsEncodedFetching
{
  return 0;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const void *v13;
  BOOL v14;
  BOOL v15;
  uint64_t v16;
  __CFArray *v17;

  v8 = a4;
  -[CNiOSABPreferredNameInContainersAndGroupsPredicate groupIdentifiers](self, "groupIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CNiOSABPreferredNameInContainersAndGroupsPredicate groupIdentifiers](self, "groupIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)ABAddressBookCopyGroupsWithUUIDs();

    if (!v9)
      v9 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B378]);
  }
  -[CNiOSABPreferredNameInContainersAndGroupsPredicate containerIdentifiers](self, "containerIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CNiOSABPreferredNameInContainersAndGroupsPredicate containerIdentifiers](self, "containerIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (const void *)ABAddressBookCopySourcesWithUUIDs();

    if (!v13)
      v13 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B378]);
    v14 = v13 == 0;
    v15 = v9 == 0;
    if (v13 && v9)
    {
      if (CFArrayGetCount((CFArrayRef)v13) <= 0 && CFArrayGetCount((CFArrayRef)v9) <= 0)
      {
        v17 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B378]);
        CFRelease(v9);
LABEL_18:
        CFRelease(v13);
        goto LABEL_19;
      }
      v15 = 0;
      v14 = 0;
    }
  }
  else
  {
    v13 = 0;
    v15 = v9 == 0;
    v14 = 1;
  }
  objc_msgSend(v8, "sortOrder");
  v16 = ABAddressBookCopyArrayOfPreferredNamePeopleForGroupsAndSourcesWithSortOrdering();
  if (!v16)
    v16 = (uint64_t)CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B378]);
  v17 = (__CFArray *)v16;
  if (!v15)
    CFRelease(v9);
  if (!v14)
    goto LABEL_18;
LABEL_19:

  return v17;
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  return 0;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForPreferredNameInContainersWithIdentifiers:groupsWithIdentifiers:]"));
  -[CNiOSABPreferredNameInContainersAndGroupsPredicate containerIdentifiers](self, "containerIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("containerIdentifiers"), v5);

  -[CNiOSABPreferredNameInContainersAndGroupsPredicate groupIdentifiers](self, "groupIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("groupIdentifiers"), v7);

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSArray)containerIdentifiers
{
  return self->_containerIdentifiers;
}

- (NSArray)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);
  objc_storeStrong((id *)&self->_containerIdentifiers, 0);
}

@end

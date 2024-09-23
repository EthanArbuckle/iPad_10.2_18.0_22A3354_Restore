@implementation CNiOSABGroupsInGroupPredicate

- (CNiOSABGroupsInGroupPredicate)initWithParentGroupIdentifier:(id)a3
{
  id v4;
  void *v5;
  CNiOSABGroupsInGroupPredicate *v6;
  uint64_t v7;
  NSString *parentGroupIdentifier;
  objc_super v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("parentGroup.identifier == %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABGroupsInGroupPredicate;
  v6 = -[CNPredicate initWithPredicate:](&v10, sel_initWithPredicate_, v5);

  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    parentGroupIdentifier = v6->_parentGroupIdentifier;
    v6->_parentGroupIdentifier = (NSString *)v7;

  }
  return v6;
}

- (__CFArray)cn_copyGroupsInAddressBook:(void *)a3 error:(__CFError *)a4
{
  void *v4;
  const __CFArray *v5;
  __ABGroup *ValueAtIndex;
  CFArrayRef v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[CNiOSABGroupsInGroupPredicate parentGroupIdentifier](self, "parentGroupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (const __CFArray *)ABAddressBookCopyGroupsWithUUIDs();

  if (v5)
  {
    if (CFArrayGetCount(v5))
    {
      ValueAtIndex = (__ABGroup *)CFArrayGetValueAtIndex(v5, 0);
      v7 = ABGroupCopyArrayOfAllSubgroups(ValueAtIndex);
      CFRelease(v5);
      v5 = v7;
      if (!v7)
        return CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B378]);
    }
  }
  return v5;
}

- (NSString)parentGroupIdentifier
{
  return self->_parentGroupIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentGroupIdentifier, 0);
}

@end

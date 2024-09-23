@implementation CNiOSABContainerOfGroupPredicate

- (CNiOSABContainerOfGroupPredicate)initWithPredicate:(id)a3
{
  return -[CNiOSABContainerOfGroupPredicate initWithGroupIdentifier:](self, "initWithGroupIdentifier:", 0);
}

- (CNiOSABContainerOfGroupPredicate)initWithGroupIdentifier:(id)a3
{
  id v4;
  void *v5;
  CNiOSABContainerOfGroupPredicate *v6;
  uint64_t v7;
  NSString *groupIdentifier;
  objc_super v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY groups.identifier == %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABContainerOfGroupPredicate;
  v6 = -[CNPredicate initWithPredicate:](&v10, sel_initWithPredicate_, v5);

  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    groupIdentifier = v6->_groupIdentifier;
    v6->_groupIdentifier = (NSString *)v7;

  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContainerOfGroupPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABContainerOfGroupPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *groupIdentifier;
  CNiOSABContainerOfGroupPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABContainerOfGroupPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_groupIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContainerOfGroupPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_groupIdentifier, CFSTR("_groupIdentifier"), v5.receiver, v5.super_class);

}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFAllocator *v9;
  CFArrayRef v10;
  const __CFArray *v11;
  const __CFArray *v12;
  const void *ValueAtIndex;
  __CFArray *v14;
  CFTypeRef cf;
  void *values;

  -[CNiOSABContainerOfGroupPredicate groupIdentifier](self, "groupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[CNiOSABContainerOfGroupPredicate groupIdentifier](self, "groupIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    values = v8;
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v10 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&values, 1, MEMORY[0x1E0C9B378]);
    v11 = (const __CFArray *)ABAddressBookCopyGroupsWithUUIDs();
    if (!v11)
    {
      v14 = 0;
      if (!v10)
        return v14;
      goto LABEL_14;
    }
    v12 = v11;
    if (CFArrayGetCount(v11) == 1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v12, 0);
      cf = ABGroupCopySource(ValueAtIndex);
      if (cf)
      {
        v14 = CFArrayCreate(v9, &cf, 1, MEMORY[0x1E0C9B378]);
        CFRelease(cf);
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = CFArrayCreate(v9, 0, 0, MEMORY[0x1E0C9B378]);
    }
    CFRelease(v12);
    if (v10)
LABEL_14:
      CFRelease(v10);
  }
  else if (a4)
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    v14 = 0;
    *a4 = (__CFError *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v14;
}

- (BOOL)includesDisabledContainers
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

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContainer predicateForContainerOfGroupWithIdentifier:]"));
  -[CNiOSABContainerOfGroupPredicate groupIdentifier](self, "groupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifier"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end

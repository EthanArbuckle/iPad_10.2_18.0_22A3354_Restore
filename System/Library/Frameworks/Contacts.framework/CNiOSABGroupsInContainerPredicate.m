@implementation CNiOSABGroupsInContainerPredicate

- (CNiOSABGroupsInContainerPredicate)initWithContainerIdentifier:(id)a3
{
  id v4;
  void *v5;
  CNiOSABGroupsInContainerPredicate *v6;
  uint64_t v7;
  NSString *containerIdentifier;
  objc_super v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("parentContainer.identifier == %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABGroupsInContainerPredicate;
  v6 = -[CNPredicate initWithPredicate:](&v10, sel_initWithPredicate_, v5);

  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    containerIdentifier = v6->_containerIdentifier;
    v6->_containerIdentifier = (NSString *)v7;

  }
  return v6;
}

- (CNiOSABGroupsInContainerPredicate)initWithPredicate:(id)a3
{
  return -[CNiOSABGroupsInContainerPredicate initWithContainerIdentifier:](self, "initWithContainerIdentifier:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABGroupsInContainerPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABGroupsInContainerPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *containerIdentifier;
  CNiOSABGroupsInContainerPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABGroupsInContainerPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_containerIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABGroupsInContainerPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_containerIdentifier, CFSTR("_containerIdentifier"), v5.receiver, v5.super_class);

}

- (__CFArray)cn_copyGroupsInAddressBook:(void *)a3 error:(__CFError *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  const void *ValueAtIndex;
  __CFArray *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[CNiOSABGroupsInContainerPredicate containerIdentifier](self, "containerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (!v8)
  {
    if (!a4)
      return 0;
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    v12 = 0;
    *a4 = (__CFError *)objc_claimAutoreleasedReturnValue();
    return v12;
  }
  -[CNiOSABGroupsInContainerPredicate containerIdentifier](self, "containerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v10 = (const void *)ABAddressBookCopySourcesWithUUIDs();

  if (!v10)
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
  if (CFArrayGetCount((CFArrayRef)v10) <= 0)
  {
    CFRelease(v10);
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
  }
  ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v10, 0);
  v12 = ABAddressBookCopyArrayOfAllGroupsInSource(a3, ValueAtIndex);
  CFRelease(v10);
  if (!v12)
    return CFArrayCreate(0, 0, 0, MEMORY[0x1E0C9B378]);
  return v12;
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
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContact predicateForGroupsInContainerWithIdentifier:]"));
  -[CNiOSABGroupsInContainerPredicate containerIdentifier](self, "containerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifier"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end

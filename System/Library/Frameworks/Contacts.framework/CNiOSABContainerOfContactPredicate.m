@implementation CNiOSABContainerOfContactPredicate

- (BOOL)includesDisabledContainers
{
  return 0;
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

  -[CNiOSABContainerOfContactPredicate contactIdentifier](self, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[CNiOSABContainerOfContactPredicate contactIdentifier](self, "contactIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    values = v8;
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v10 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&values, 1, MEMORY[0x1E0C9B378]);
    v11 = (const __CFArray *)ABAddressBookCopyPeopleWithUUIDs();
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
      cf = ABPersonCopySource(ValueAtIndex);
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

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

- (CNiOSABContainerOfContactPredicate)initWithContactIdentifier:(id)a3
{
  id v4;
  void *v5;
  CNiOSABContainerOfContactPredicate *v6;
  uint64_t v7;
  NSString *contactIdentifier;
  objc_super v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY contacts.identifier == %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABContainerOfContactPredicate;
  v6 = -[CNPredicate initWithPredicate:](&v10, sel_initWithPredicate_, v5);

  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    contactIdentifier = v6->_contactIdentifier;
    v6->_contactIdentifier = (NSString *)v7;

  }
  return v6;
}

- (CNiOSABContainerOfContactPredicate)initWithPredicate:(id)a3
{
  return -[CNiOSABContainerOfContactPredicate initWithContactIdentifier:](self, "initWithContactIdentifier:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContainerOfContactPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABContainerOfContactPredicate *v5;
  void *v6;
  uint64_t v7;
  NSString *contactIdentifier;
  CNiOSABContainerOfContactPredicate *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABContainerOfContactPredicate;
  v5 = -[CNPredicate initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_contactIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContainerOfContactPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_contactIdentifier, CFSTR("_contactIdentifier"), v5.receiver, v5.super_class);

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
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContainer predicateForContainerOfContactWithIdentifier:]"));
  -[CNiOSABContainerOfContactPredicate contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifier"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

@end

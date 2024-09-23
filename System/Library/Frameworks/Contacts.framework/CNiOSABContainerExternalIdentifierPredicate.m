@implementation CNiOSABContainerExternalIdentifierPredicate

- (CNiOSABContainerExternalIdentifierPredicate)initWithExternalIdentifier:(id)a3
{
  id v5;
  void *v6;
  CNiOSABContainerExternalIdentifierPredicate *v7;
  CNiOSABContainerExternalIdentifierPredicate *v8;
  CNiOSABContainerExternalIdentifierPredicate *v9;
  objc_super v11;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("externalIdentifier == %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABContainerExternalIdentifierPredicate;
  v7 = -[CNPredicate initWithPredicate:](&v11, sel_initWithPredicate_, v6);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_externalIdentifier, a3);
    v9 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABContainerExternalIdentifierPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABContainerExternalIdentifierPredicate *v5;
  uint64_t v6;
  NSString *externalIdentifier;
  CNiOSABContainerExternalIdentifierPredicate *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABContainerExternalIdentifierPredicate;
  v5 = -[CNPredicate initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("externalIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    externalIdentifier = v5->_externalIdentifier;
    v5->_externalIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABContainerExternalIdentifierPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_externalIdentifier, CFSTR("externalIdentifier"), v5.receiver, v5.super_class);

}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFAllocator *v10;
  const CFArrayCallBacks *v11;
  const void **v12;
  CFIndex v13;
  __CFError *v14;
  __CFArray *result;
  uint64_t v16;

  v6 = *MEMORY[0x1E0D13850];
  -[CNiOSABContainerExternalIdentifierPredicate externalIdentifier](self, "externalIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  if ((_DWORD)v6)
  {
    -[CNiOSABContainerExternalIdentifierPredicate externalIdentifier](self, "externalIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = ABAddressBookCopySourceWithAccountAndExternalIdentifiers();

    v16 = v9;
    if (v9)
    {
      v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v11 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
      v12 = (const void **)&v16;
      v13 = 1;
    }
    else
    {
      v11 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
      v10 = 0;
      v12 = 0;
      v13 = 0;
    }
    return CFArrayCreate(v10, v12, v13, v11);
  }
  else if (a4)
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    v14 = (__CFError *)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a4 = v14;
  }
  else
  {
    return 0;
  }
  return result;
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
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContainer predicateForContainerWithExternalIdentifier:]"));
  -[CNiOSABContainerExternalIdentifierPredicate externalIdentifier](self, "externalIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("externalIdentifier"));

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
}

@end

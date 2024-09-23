@implementation CNiOSABLocalContainerPredicate

- (CNiOSABLocalContainerPredicate)init
{
  return -[CNiOSABLocalContainerPredicate initWithDisabledContainerIncluded:](self, "initWithDisabledContainerIncluded:", 0);
}

- (CNiOSABLocalContainerPredicate)initWithDisabledContainerIncluded:(BOOL)a3
{
  void *v5;
  CNiOSABLocalContainerPredicate *v6;
  CNiOSABLocalContainerPredicate *v7;
  CNiOSABLocalContainerPredicate *v8;
  objc_super v10;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type == %@"), &unk_1E2A40170);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)CNiOSABLocalContainerPredicate;
  v6 = -[CNPredicate initWithPredicate:](&v10, sel_initWithPredicate_, v5);
  v7 = v6;
  if (v6)
  {
    v6->_includesDisabledContainer = a3;
    v8 = v6;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABLocalContainerPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABLocalContainerPredicate *v5;
  CNiOSABLocalContainerPredicate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABLocalContainerPredicate;
  v5 = -[CNPredicate initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_includesDisabledContainer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_includesDisabledContainer"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABLocalContainerPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_includesDisabledContainer, CFSTR("_includesDisabledContainer"), v5.receiver, v5.super_class);

}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  __CFArray *v4;
  void *values;

  values = (void *)ABAddressBookCopyLocalSource();
  if (!values)
    return 0;
  v4 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&values, 1, MEMORY[0x1E0C9B378]);
  CFRelease(values);
  return v4;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContainer predicateForLocalContainer]"));
  v5 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("includesDisabledContainers"), -[CNiOSABLocalContainerPredicate includesDisabledContainer](self, "includesDisabledContainer"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)includesDisabledContainer
{
  return self->_includesDisabledContainer;
}

@end

@implementation CNiOSABDisabledContainersPredicate

- (CNiOSABDisabledContainersPredicate)initWithPredicate:(id)a3
{
  return -[CNiOSABDisabledContainersPredicate initWithDisabledContainersIncluded:](self, "initWithDisabledContainersIncluded:", 0);
}

- (CNiOSABDisabledContainersPredicate)initWithDisabledContainersIncluded:(BOOL)a3
{
  __CFString *v5;
  void *v6;
  CNiOSABDisabledContainersPredicate *v7;
  objc_super v9;

  if (a3)
  {
    objc_msgSend(CFSTR("enabled == YES"), "stringByAppendingString:", CFSTR(" || enabled == NO"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("enabled == YES");
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)CNiOSABDisabledContainersPredicate;
  v7 = -[CNPredicate initWithPredicate:](&v9, sel_initWithPredicate_, v6);

  if (v7)
    v7->_includesDisabledContainers = a3;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABDisabledContainersPredicate)initWithCoder:(id)a3
{
  id v4;
  CNiOSABDisabledContainersPredicate *v5;
  CNiOSABDisabledContainersPredicate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNiOSABDisabledContainersPredicate;
  v5 = -[CNPredicate initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_includesDisabledContainers = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_includesDisabledContainers"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNiOSABDisabledContainersPredicate;
  v4 = a3;
  -[CNPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_includesDisabledContainers, CFSTR("_includesDisabledContainers"), v5.receiver, v5.super_class);

}

- (__CFArray)cn_copyContainersInAddressBook:(void *)a3 error:(__CFError *)a4
{
  -[CNiOSABDisabledContainersPredicate includesDisabledContainers](self, "includesDisabledContainers");
  return (__CFArray *)ABAddressBookCopyArrayOfAllSourcesIncludingDisabledSources();
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
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("kind"), CFSTR("-[CNContainer predicateForContainersIncludingDisabled:]"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[CNiOSABDisabledContainersPredicate includesDisabledContainers](self, "includesDisabledContainers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("includingDisabled"), v5);

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)includesDisabledContainers
{
  return self->_includesDisabledContainers;
}

@end

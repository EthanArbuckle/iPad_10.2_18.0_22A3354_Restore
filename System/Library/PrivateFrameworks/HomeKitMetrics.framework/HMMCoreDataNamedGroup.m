@implementation HMMCoreDataNamedGroup

- (HMMGroupSpecifier)groupSpecifier
{
  uint64_t v4;
  HMMNamedGroupSpecifier *v5;
  void *v6;
  HMMNamedGroupSpecifier *v7;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99768];
    v11 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v13, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v14);
  }
  v5 = [HMMNamedGroupSpecifier alloc];
  -[HMMCoreDataNamedGroup name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMMNamedGroupSpecifier initWithGroupName:](v5, "initWithGroupName:", v6);

  return (HMMGroupSpecifier *)v7;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("NamedGroup"));
}

@end

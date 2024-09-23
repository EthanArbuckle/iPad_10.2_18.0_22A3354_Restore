@implementation HMMCoreDataHomeGroup

- (id)groupSpecifier
{
  uint64_t v4;
  HMMHomeGroupSpecifier *v5;
  void *v6;
  void *v7;
  HMMHomeGroupSpecifier *v8;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99768];
    v12 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v14, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }
  v5 = [HMMHomeGroupSpecifier alloc];
  -[HMMCoreDataHomeGroup homeUUID](self, "homeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMCoreDataHomeGroup name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMMHomeGroupSpecifier initWithHomeUUID:groupName:](v5, "initWithHomeUUID:groupName:", v6, v7);

  return v8;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("HomeGroup"));
}

@end

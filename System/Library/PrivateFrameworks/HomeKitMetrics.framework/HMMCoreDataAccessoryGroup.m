@implementation HMMCoreDataAccessoryGroup

- (id)groupSpecifier
{
  uint64_t v4;
  HMMAccessoryGroupSpecifier *v5;
  void *v6;
  void *v7;
  void *v8;
  HMMAccessoryGroupSpecifier *v9;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = objc_opt_class();
  if (v4 != objc_opt_class())
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99768];
    v13 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v15, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v16);
  }
  v5 = [HMMAccessoryGroupSpecifier alloc];
  -[HMMCoreDataAccessoryGroup accessoryUUID](self, "accessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMCoreDataAccessoryGroup homeUUID](self, "homeUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMCoreDataAccessoryGroup name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMMAccessoryGroupSpecifier initWithAccessoryUUID:homeUUID:groupName:](v5, "initWithAccessoryUUID:homeUUID:groupName:", v6, v7, v8);

  return v9;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("AccessoryGroup"));
}

@end

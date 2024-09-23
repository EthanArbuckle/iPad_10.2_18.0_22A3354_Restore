@implementation APKActivityProgressTasksSpecifier

- (APKActivityProgressTasksSpecifier)initWithTaskIdentifiers:(id)a3
{
  id v5;
  APKActivityProgressTasksSpecifier *v6;
  APKActivityProgressTasksSpecifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APKActivityProgressTasksSpecifier;
  v6 = -[APKActivityProgressTasksSpecifier init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_taskIdentifiers, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[APKActivityProgressTasksSpecifier taskIdentifiers](self, "taskIdentifiers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("taskIdentifiers"));

}

- (APKActivityProgressTasksSpecifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  APKActivityProgressTasksSpecifier *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("taskIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[APKActivityProgressTasksSpecifier initWithTaskIdentifiers:](self, "initWithTaskIdentifiers:", v5);
  return v6;
}

- (NSArray)taskIdentifiers
{
  return self->_taskIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskIdentifiers, 0);
}

@end

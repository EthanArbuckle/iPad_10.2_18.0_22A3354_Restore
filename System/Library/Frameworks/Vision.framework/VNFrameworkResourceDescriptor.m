@implementation VNFrameworkResourceDescriptor

- (VNFrameworkResourceDescriptor)initWithBundle:(id)a3
{
  id v5;
  id *v6;
  VNFrameworkResourceDescriptor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNFrameworkResourceDescriptor;
  v6 = -[VNResourceDescriptor _init](&v9, sel__init);
  v7 = (VNFrameworkResourceDescriptor *)v6;
  if (v6)
    objc_storeStrong(v6 + 1, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNFrameworkResourceDescriptor;
  -[VNFrameworkResourceDescriptor description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VNFrameworkResourceDescriptor frameworkBundle](self, "frameworkBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VNFrameworkResourceDescriptor frameworkBundle](self, "frameworkBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  VNFrameworkResourceDescriptor *v4;
  VNFrameworkResourceDescriptor *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (VNFrameworkResourceDescriptor *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNFrameworkResourceDescriptor frameworkBundle](self, "frameworkBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFrameworkResourceDescriptor frameworkBundle](v5, "frameworkBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSBundle)frameworkBundle
{
  return (NSBundle *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameworkBundle, 0);
}

+ (id)descriptorForFrameworkIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    a4 = (id *)objc_msgSend(objc_alloc((Class)a1), "initWithBundle:", v7);
  }
  else if (a4)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Could not locate framework with identifier \"%@\"), v6);
    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

+ (id)descriptorForFrameworkContainingClass:(Class)a3 error:(id *)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    a4 = (id *)objc_msgSend(objc_alloc((Class)a1), "initWithBundle:", v7);
  }
  else if (a4)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    NSStringFromClass(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("Could not locate framework containing %@"), v9);

    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

+ (id)descriptorForFrameworkContainingClassNamed:(id)a3 error:(id *)a4
{
  NSString *v6;
  Class v7;
  void *v8;

  v6 = (NSString *)a3;
  v7 = NSClassFromString(v6);
  if (v7)
  {
    objc_msgSend(a1, "descriptorForFrameworkContainingClass:error:", v7, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The class %@ could not be resolved at runtime"), v6);
    +[VNError errorForDataUnavailableWithLocalizedDescription:](VNError, "errorForDataUnavailableWithLocalizedDescription:", v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

@end

@implementation FPFlattenedPackageSandboxingURLWrapper

- (FPFlattenedPackageSandboxingURLWrapper)initWithURL:(id)a3 packageURL:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  FPFlattenedPackageSandboxingURLWrapper *v10;
  FPSandboxingURLWrapper *v11;
  FPSandboxingURLWrapper *packageWrapper;
  FPFlattenedPackageSandboxingURLWrapper *v13;
  objc_super v15;

  v8 = a4;
  v9 = *MEMORY[0x1E0C80008];
  v15.receiver = self;
  v15.super_class = (Class)FPFlattenedPackageSandboxingURLWrapper;
  v10 = -[FPSandboxingURLWrapper initWithURL:extensionClass:report:error:](&v15, sel_initWithURL_extensionClass_report_error_, a3, v9, 1, a5);
  if (v10
    && (v11 = -[FPSandboxingURLWrapper initWithURL:extensionClass:report:error:]([FPSandboxingURLWrapper alloc], "initWithURL:extensionClass:report:error:", v8, v9, 0, a5), packageWrapper = v10->_packageWrapper, v10->_packageWrapper = v11, packageWrapper, !v10->_packageWrapper))
  {
    v13 = 0;
  }
  else
  {
    v13 = v10;
  }

  return v13;
}

- (FPFlattenedPackageSandboxingURLWrapper)initWithCoder:(id)a3
{
  id v4;
  FPFlattenedPackageSandboxingURLWrapper *v5;
  uint64_t v6;
  FPSandboxingURLWrapper *packageWrapper;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPFlattenedPackageSandboxingURLWrapper;
  v5 = -[FPSandboxingURLWrapper initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pkg"));
    v6 = objc_claimAutoreleasedReturnValue();
    packageWrapper = v5->_packageWrapper;
    v5->_packageWrapper = (FPSandboxingURLWrapper *)v6;

    -[FPSandboxingURLWrapper url](v5, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPSandboxingURLWrapper url](v5->_packageWrapper, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTemporaryResourceValue:forKey:", v9, CFSTR("FPUnflattenedPackageURL"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FPFlattenedPackageSandboxingURLWrapper;
  v4 = a3;
  -[FPSandboxingURLWrapper encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_packageWrapper, CFSTR("pkg"), v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packageWrapper, 0);
}

@end

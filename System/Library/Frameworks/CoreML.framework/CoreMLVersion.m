@implementation CoreMLVersion

- (CoreMLVersion)init
{
  CoreMLVersion *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CoreMLVersion;
  v2 = -[CoreMLVersion init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CoreMLVersion setFrameworkVersionNumber:](v2, "setFrameworkVersionNumber:", v3);

  }
  return v2;
}

- (NSNumber)frameworkVersionNumber
{
  return self->_frameworkVersionNumber;
}

- (void)setFrameworkVersionNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameworkVersionNumber, 0);
}

+ (id)getInternalFrameworkVersion
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v2, "frameworkVersionNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

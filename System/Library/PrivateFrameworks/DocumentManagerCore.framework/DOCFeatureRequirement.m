@implementation DOCFeatureRequirement

- (DOCFeatureRequirement)initWithName:(id)a3 requirementValidationBlock:(id)a4
{
  id v7;
  id v8;
  DOCFeatureRequirement *v9;
  DOCFeatureRequirement *v10;
  uint64_t v11;
  id requirementValidationBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DOCFeatureRequirement;
  v9 = -[DOCFeatureRequirement init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v11 = MEMORY[0x20BD0D5D4](v8);
    requirementValidationBlock = v10->_requirementValidationBlock;
    v10->_requirementValidationBlock = (id)v11;

  }
  return v10;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)requirementValidationBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requirementValidationBlock, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

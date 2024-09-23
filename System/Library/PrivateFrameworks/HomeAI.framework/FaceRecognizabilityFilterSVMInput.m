@implementation FaceRecognizabilityFilterSVMInput

- (FaceRecognizabilityFilterSVMInput)initWithInput:(id)a3
{
  id v5;
  FaceRecognizabilityFilterSVMInput *v6;
  FaceRecognizabilityFilterSVMInput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FaceRecognizabilityFilterSVMInput;
  v6 = -[FaceRecognizabilityFilterSVMInput init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_input, a3);

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24DC152F0);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("input")))
  {
    v4 = (void *)MEMORY[0x24BDBFF98];
    -[FaceRecognizabilityFilterSVMInput input](self, "input");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featureValueWithMultiArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MLMultiArray)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_storeStrong((id *)&self->_input, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input, 0);
}

@end

@implementation FaceRecognizabilityFilterSVMDataScalerOutput

- (FaceRecognizabilityFilterSVMDataScalerOutput)initWithTransformed_features:(id)a3
{
  id v5;
  FaceRecognizabilityFilterSVMDataScalerOutput *v6;
  FaceRecognizabilityFilterSVMDataScalerOutput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FaceRecognizabilityFilterSVMDataScalerOutput;
  v6 = -[FaceRecognizabilityFilterSVMDataScalerOutput init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_transformed_features, a3);

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24DC15338);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("transformed_features")))
  {
    v4 = (void *)MEMORY[0x24BDBFF98];
    -[FaceRecognizabilityFilterSVMDataScalerOutput transformed_features](self, "transformed_features");
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

- (MLMultiArray)transformed_features
{
  return self->_transformed_features;
}

- (void)setTransformed_features:(id)a3
{
  objc_storeStrong((id *)&self->_transformed_features, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformed_features, 0);
}

@end

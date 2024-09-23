@implementation FaceAestheticQualityFilterSVMOutput

- (FaceAestheticQualityFilterSVMOutput)initWithClassLabel:(int64_t)a3 classProbability:(id)a4
{
  id v7;
  FaceAestheticQualityFilterSVMOutput *v8;
  FaceAestheticQualityFilterSVMOutput *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FaceAestheticQualityFilterSVMOutput;
  v8 = -[FaceAestheticQualityFilterSVMOutput init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_classLabel = a3;
    objc_storeStrong((id *)&v8->_classProbability, a4);
  }

  return v9;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24DC15398);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("classLabel")))
  {
    objc_msgSend(MEMORY[0x24BDBFF98], "featureValueWithInt64:", -[FaceAestheticQualityFilterSVMOutput classLabel](self, "classLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("classProbability")))
  {
    v6 = (void *)MEMORY[0x24BDBFF98];
    -[FaceAestheticQualityFilterSVMOutput classProbability](self, "classProbability");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "featureValueWithDictionary:error:", v7, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)classLabel
{
  return self->_classLabel;
}

- (void)setClassLabel:(int64_t)a3
{
  self->_classLabel = a3;
}

- (NSDictionary)classProbability
{
  return self->_classProbability;
}

- (void)setClassProbability:(id)a3
{
  objc_storeStrong((id *)&self->_classProbability, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classProbability, 0);
}

@end

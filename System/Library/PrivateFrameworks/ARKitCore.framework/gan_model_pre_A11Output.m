@implementation gan_model_pre_A11Output

- (gan_model_pre_A11Output)initWithOutput:(id)a3
{
  id v5;
  gan_model_pre_A11Output *v6;
  gan_model_pre_A11Output *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)gan_model_pre_A11Output;
  v6 = -[gan_model_pre_A11Output init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_output, a3);

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E66CEE38);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("output")))
  {
    v4 = (void *)MEMORY[0x1E0C9E918];
    -[gan_model_pre_A11Output output](self, "output");
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

- (MLMultiArray)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_storeStrong((id *)&self->_output, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
}

@end

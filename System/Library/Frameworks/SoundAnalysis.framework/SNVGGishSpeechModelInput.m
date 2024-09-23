@implementation SNVGGishSpeechModelInput

- (SNVGGishSpeechModelInput)initWithInput1:(id)a3
{
  id v5;
  SNVGGishSpeechModelInput *v6;
  SNVGGishSpeechModelInput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNVGGishSpeechModelInput;
  v6 = -[SNVGGishSpeechModelInput init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_input1, a3);

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E97DA938);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("input1")))
  {
    v4 = (void *)MEMORY[0x1E0C9E918];
    -[SNVGGishSpeechModelInput input1](self, "input1");
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

- (MLMultiArray)input1
{
  return self->_input1;
}

- (void)setInput1:(id)a3
{
  objc_storeStrong((id *)&self->_input1, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input1, 0);
}

@end

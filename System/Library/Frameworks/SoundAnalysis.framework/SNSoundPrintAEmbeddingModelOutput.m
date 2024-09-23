@implementation SNSoundPrintAEmbeddingModelOutput

- (SNSoundPrintAEmbeddingModelOutput)initWith_637:(id)a3
{
  id v5;
  SNSoundPrintAEmbeddingModelOutput *v6;
  SNSoundPrintAEmbeddingModelOutput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNSoundPrintAEmbeddingModelOutput;
  v6 = -[SNSoundPrintAEmbeddingModelOutput init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->__637, a3);

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E97DA7D0);
}

- (id)featureValueForName:(id)a3
{
  const char *v4;
  void *v5;
  void *v6;
  void *v7;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("637")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    objc_msgSend__637(self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "featureValueWithMultiArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (MLMultiArray)_637
{
  return self->__637;
}

- (void)set_637:(id)a3
{
  objc_storeStrong((id *)&self->__637, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__637, 0);
}

@end

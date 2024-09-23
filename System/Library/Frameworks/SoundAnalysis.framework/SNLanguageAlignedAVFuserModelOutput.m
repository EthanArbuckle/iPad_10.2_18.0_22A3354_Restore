@implementation SNLanguageAlignedAVFuserModelOutput

- (SNLanguageAlignedAVFuserModelOutput)initWithFused_embedding:(id)a3
{
  id v5;
  SNLanguageAlignedAVFuserModelOutput *v6;
  SNLanguageAlignedAVFuserModelOutput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNLanguageAlignedAVFuserModelOutput;
  v6 = -[SNLanguageAlignedAVFuserModelOutput init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fused_embedding, a3);

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E97DA8F0);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("fused_embedding")))
  {
    v4 = (void *)MEMORY[0x1E0C9E918];
    -[SNLanguageAlignedAVFuserModelOutput fused_embedding](self, "fused_embedding");
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

- (MLMultiArray)fused_embedding
{
  return self->_fused_embedding;
}

- (void)setFused_embedding:(id)a3
{
  objc_storeStrong((id *)&self->_fused_embedding, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fused_embedding, 0);
}

@end

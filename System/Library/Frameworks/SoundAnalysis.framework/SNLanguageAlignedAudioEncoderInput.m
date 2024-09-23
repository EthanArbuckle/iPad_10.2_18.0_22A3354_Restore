@implementation SNLanguageAlignedAudioEncoderInput

- (SNLanguageAlignedAudioEncoderInput)initWithSpecgram:(id)a3
{
  id v5;
  SNLanguageAlignedAudioEncoderInput *v6;
  SNLanguageAlignedAudioEncoderInput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNLanguageAlignedAudioEncoderInput;
  v6 = -[SNLanguageAlignedAudioEncoderInput init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_specgram, a3);

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E97DA818);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("specgram")))
  {
    v4 = (void *)MEMORY[0x1E0C9E918];
    -[SNLanguageAlignedAudioEncoderInput specgram](self, "specgram");
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

- (MLMultiArray)specgram
{
  return self->_specgram;
}

- (void)setSpecgram:(id)a3
{
  objc_storeStrong((id *)&self->_specgram, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specgram, 0);
}

@end

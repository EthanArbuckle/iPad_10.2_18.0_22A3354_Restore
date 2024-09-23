@implementation SNLanguageAlignedAVFuserModelInput

- (SNLanguageAlignedAVFuserModelInput)initWithVision_embedding:(id)a3 audio_embedding:(id)a4
{
  id v7;
  id v8;
  SNLanguageAlignedAVFuserModelInput *v9;
  SNLanguageAlignedAVFuserModelInput *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SNLanguageAlignedAVFuserModelInput;
  v9 = -[SNLanguageAlignedAVFuserModelInput init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_vision_embedding, a3);
    objc_storeStrong((id *)&v10->_audio_embedding, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E97DA8D8);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("vision_embedding")))
  {
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[SNLanguageAlignedAVFuserModelInput vision_embedding](self, "vision_embedding");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("audio_embedding")))
    {
      v8 = 0;
      goto LABEL_7;
    }
    v5 = (void *)MEMORY[0x1E0C9E918];
    -[SNLanguageAlignedAVFuserModelInput audio_embedding](self, "audio_embedding");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "featureValueWithMultiArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v8;
}

- (MLMultiArray)vision_embedding
{
  return self->_vision_embedding;
}

- (void)setVision_embedding:(id)a3
{
  objc_storeStrong((id *)&self->_vision_embedding, a3);
}

- (MLMultiArray)audio_embedding
{
  return self->_audio_embedding;
}

- (void)setAudio_embedding:(id)a3
{
  objc_storeStrong((id *)&self->_audio_embedding, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audio_embedding, 0);
  objc_storeStrong((id *)&self->_vision_embedding, 0);
}

@end

@implementation SFSpeechLanguageModelConfiguration

- (SFSpeechLanguageModelConfiguration)initWithLanguageModel:(NSURL *)languageModel
{
  return -[SFSpeechLanguageModelConfiguration initWithLanguageModel:vocabulary:](self, "initWithLanguageModel:vocabulary:", languageModel, 0);
}

- (SFSpeechLanguageModelConfiguration)initWithLanguageModel:(NSURL *)languageModel vocabulary:(NSURL *)vocabulary
{
  NSURL *v6;
  NSURL *v7;
  SFSpeechLanguageModelConfiguration *v8;
  uint64_t v9;
  NSURL *v10;
  uint64_t v11;
  NSURL *v12;
  objc_super v14;

  v6 = languageModel;
  v7 = vocabulary;
  v14.receiver = self;
  v14.super_class = (Class)SFSpeechLanguageModelConfiguration;
  v8 = -[SFSpeechLanguageModelConfiguration init](&v14, sel_init);
  if (v8)
  {
    v9 = -[NSURL copy](v6, "copy");
    v10 = v8->_languageModel;
    v8->_languageModel = (NSURL *)v9;

    v11 = -[NSURL copy](v7, "copy");
    v12 = v8->_vocabulary;
    v8->_vocabulary = (NSURL *)v11;

  }
  return v8;
}

- (NSURL)languageModel
{
  return self->_languageModel;
}

- (NSURL)vocabulary
{
  return self->_vocabulary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocabulary, 0);
  objc_storeStrong((id *)&self->_languageModel, 0);
}

@end

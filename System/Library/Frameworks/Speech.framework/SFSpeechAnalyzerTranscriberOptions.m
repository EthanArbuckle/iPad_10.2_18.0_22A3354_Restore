@implementation SFSpeechAnalyzerTranscriberOptions

- (SFSpeechAnalyzerTranscriberOptions)init
{
  SFSpeechAnalyzerTranscriberOptions *v2;
  uint64_t v3;
  NSLocale *locale;
  SFTranscriberModelOptions *modelOptions;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFSpeechAnalyzerTranscriberOptions;
  v2 = -[SFSpeechAnalyzerTranscriberOptions init](&v7, sel_init);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = objc_claimAutoreleasedReturnValue();
  locale = v2->_locale;
  v2->_locale = (NSLocale *)v3;

  modelOptions = v2->_modelOptions;
  v2->_taskHint = 0;
  v2->_modelOptions = 0;

  v2->_transcriptionOptions = 0;
  return v2;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)taskHint
{
  return self->_taskHint;
}

- (void)setTaskHint:(int64_t)a3
{
  self->_taskHint = a3;
}

- (SFTranscriberModelOptions)modelOptions
{
  return self->_modelOptions;
}

- (void)setModelOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)transcriptionOptions
{
  return self->_transcriptionOptions;
}

- (void)setTranscriptionOptions:(unint64_t)a3
{
  self->_transcriptionOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelOptions, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end

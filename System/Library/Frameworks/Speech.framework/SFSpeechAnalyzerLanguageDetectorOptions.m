@implementation SFSpeechAnalyzerLanguageDetectorOptions

- (SFSpeechAnalyzerLanguageDetectorOptions)init
{
  SFSpeechAnalyzerLanguageDetectorOptions *v2;
  SFSpeechAnalyzerLanguageDetectorOptions *v3;
  NSArray *languageConstraints;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFSpeechAnalyzerLanguageDetectorOptions;
  v2 = -[SFSpeechAnalyzerLanguageDetectorOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    languageConstraints = v2->_languageConstraints;
    v2->_languageConstraints = 0;

    v3->_alternativeCount = 5;
  }
  return v3;
}

- (NSArray)languageConstraints
{
  return self->_languageConstraints;
}

- (void)setLanguageConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)alternativeCount
{
  return self->_alternativeCount;
}

- (void)setAlternativeCount:(unint64_t)a3
{
  self->_alternativeCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageConstraints, 0);
}

@end

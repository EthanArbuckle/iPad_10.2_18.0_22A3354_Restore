@implementation _EARLanguageDetectorV2Result

- (NSDictionary)confidences
{
  return self->_confidences;
}

- (void)setConfidences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)detectedLanguage
{
  return self->_detectedLanguage;
}

- (void)setDetectedLanguage:(unint64_t)a3
{
  self->_detectedLanguage = a3;
}

- (NSString)dominantLocale
{
  return self->_dominantLocale;
}

- (void)setDominantLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominantLocale, 0);
  objc_storeStrong((id *)&self->_confidences, 0);
}

@end

@implementation EARLanguageDetectorV2Result

- (EARLanguageDetectorV2Result)initWithLanguageDetectorV2Result:(id)a3
{
  id v4;
  EARLanguageDetectorV2Result *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *confidences;
  void *v9;
  uint64_t v10;
  NSString *dominantLocale;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EARLanguageDetectorV2Result;
  v5 = -[EARLanguageDetectorV2Result init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "confidences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    confidences = v5->_confidences;
    v5->_confidences = (NSDictionary *)v7;

    v5->_detectedLangauge = objc_msgSend(v4, "detectedLanguage");
    objc_msgSend(v4, "dominantLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    dominantLocale = v5->_dominantLocale;
    v5->_dominantLocale = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *confidences;
  id v5;

  confidences = self->_confidences;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", confidences, CFSTR("_confidences"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_detectedLangauge, CFSTR("_detectedLangauge"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dominantLocale, CFSTR("_dominantLocale"));

}

- (EARLanguageDetectorV2Result)initWithCoder:(id)a3
{
  id v4;
  EARLanguageDetectorV2Result *v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *confidences;
  uint64_t v9;
  NSString *dominantLocale;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EARLanguageDetectorV2Result;
  v5 = -[EARLanguageDetectorV2Result init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), CFSTR("_confidences"));
    v7 = objc_claimAutoreleasedReturnValue();
    confidences = v5->_confidences;
    v5->_confidences = (NSDictionary *)v7;

    v5->_detectedLangauge = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_detectedLangauge"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_dominantLocale"));
    v9 = objc_claimAutoreleasedReturnValue();
    dominantLocale = v5->_dominantLocale;
    v5->_dominantLocale = (NSString *)v9;

  }
  return v5;
}

- (NSDictionary)confidences
{
  return self->_confidences;
}

- (void)setConfidences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)detectedLangauge
{
  return self->_detectedLangauge;
}

- (void)setDetectedLangauge:(unint64_t)a3
{
  self->_detectedLangauge = a3;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

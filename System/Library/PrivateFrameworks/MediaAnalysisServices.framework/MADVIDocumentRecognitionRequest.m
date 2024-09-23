@implementation MADVIDocumentRecognitionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)targetResolution
{
  return 3048192;
}

- (MADVIDocumentRecognitionRequest)init
{
  return -[MADVIDocumentRecognitionRequest initWithLanguages:](self, "initWithLanguages:", MEMORY[0x1E0C9AA60]);
}

- (MADVIDocumentRecognitionRequest)initWithLanguages:(id)a3
{
  id v4;
  MADVIDocumentRecognitionRequest *v5;
  uint64_t v6;
  NSArray *languages;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADVIDocumentRecognitionRequest;
  v5 = -[MADVIDocumentRecognitionRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    languages = v5->_languages;
    v5->_languages = (NSArray *)v6;

    v5->_maximumCandidateCount = 3;
    v5->_usesLanguageDetection = 1;
    v5->_usesLanguageCorrection = 1;
    v5->_usesFormFieldDetection = 0;
    v5->_recognitionLevel = 0;
    v5->_minimumTextHeight = 0.0;
  }

  return v5;
}

- (MADVIDocumentRecognitionRequest)initWithCoder:(id)a3
{
  id v4;
  MADVIDocumentRecognitionRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *languages;
  float v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MADVIDocumentRecognitionRequest;
  v5 = -[MADRequest initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Languages"));
    v9 = objc_claimAutoreleasedReturnValue();
    languages = v5->_languages;
    v5->_languages = (NSArray *)v9;

    v5->_maximumCandidateCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MaximumCandidateCount"));
    v5->_usesLanguageDetection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UsesLanguageDetection"));
    v5->_usesLanguageCorrection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UsesLanguageCorrection"));
    v5->_usesFormFieldDetection = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UsesFormFieldDetection"));
    v5->_recognitionLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("RecognitionLevel"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("MinimumTextHeight"));
    v5->_minimumTextHeight = v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MADVIDocumentRecognitionRequest;
  v4 = a3;
  -[MADRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_languages, CFSTR("Languages"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_maximumCandidateCount, CFSTR("MaximumCandidateCount"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_usesLanguageDetection, CFSTR("UsesLanguageDetection"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_usesLanguageCorrection, CFSTR("UsesLanguageCorrection"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_usesFormFieldDetection, CFSTR("UsesFormFieldDetection"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_recognitionLevel, CFSTR("RecognitionLevel"));
  *(float *)&v5 = self->_minimumTextHeight;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("MinimumTextHeight"), v5);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("languages: %@, "), self->_languages);
  objc_msgSend(v3, "appendFormat:", CFSTR("maximumCandidateCount: %lu, "), self->_maximumCandidateCount);
  objc_msgSend(v3, "appendFormat:", CFSTR("usesLanguageDetection: %d, "), self->_usesLanguageDetection);
  objc_msgSend(v3, "appendFormat:", CFSTR("usesLanguageCorrection: %d, "), self->_usesLanguageCorrection);
  objc_msgSend(v3, "appendFormat:", CFSTR("usesFormFieldDetection: %d, "), self->_usesFormFieldDetection);
  objc_msgSend(v3, "appendFormat:", CFSTR("recognitionLevel: %ld, "), self->_recognitionLevel);
  objc_msgSend(v3, "appendFormat:", CFSTR("minimumTextHeight: %f, "), self->_minimumTextHeight);
  -[MADRequest results](self, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("results: %@, "), v6);

  -[MADRequest error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("error: %@>"), v7);

  return v3;
}

- (NSArray)languages
{
  return self->_languages;
}

- (void)setLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)maximumCandidateCount
{
  return self->_maximumCandidateCount;
}

- (void)setMaximumCandidateCount:(unint64_t)a3
{
  self->_maximumCandidateCount = a3;
}

- (BOOL)usesLanguageDetection
{
  return self->_usesLanguageDetection;
}

- (void)setUsesLanguageDetection:(BOOL)a3
{
  self->_usesLanguageDetection = a3;
}

- (BOOL)usesLanguageCorrection
{
  return self->_usesLanguageCorrection;
}

- (void)setUsesLanguageCorrection:(BOOL)a3
{
  self->_usesLanguageCorrection = a3;
}

- (BOOL)usesFormFieldDetection
{
  return self->_usesFormFieldDetection;
}

- (void)setUsesFormFieldDetection:(BOOL)a3
{
  self->_usesFormFieldDetection = a3;
}

- (int64_t)recognitionLevel
{
  return self->_recognitionLevel;
}

- (void)setRecognitionLevel:(int64_t)a3
{
  self->_recognitionLevel = a3;
}

- (float)minimumTextHeight
{
  return self->_minimumTextHeight;
}

- (void)setMinimumTextHeight:(float)a3
{
  self->_minimumTextHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languages, 0);
}

@end

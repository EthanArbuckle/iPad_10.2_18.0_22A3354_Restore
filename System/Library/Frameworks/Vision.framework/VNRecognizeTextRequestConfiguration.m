@implementation VNRecognizeTextRequestConfiguration

- (VNRecognizeTextRequestConfiguration)initWithRequestClass:(Class)a3
{
  VNRecognizeTextRequestConfiguration *v3;
  uint64_t v4;
  NSArray *recognitionLanguages;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VNRecognizeTextRequestConfiguration;
  v3 = -[VNStatefulRequestConfiguration initWithRequestClass:](&v7, sel_initWithRequestClass_, a3);
  if (v3)
  {
    v8[0] = CFSTR("en_US");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    recognitionLanguages = v3->_recognitionLanguages;
    v3->_recognitionLanguages = (NSArray *)v4;

    v3->_recognitionLevel = 0;
    v3->_usesLanguageCorrection = 1;
    v3->_automaticallyDetectsLanguage = 0;
    v3->_minimumTextHeight = 0.0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNRecognizeTextRequestConfiguration;
  v4 = -[VNStatefulRequestConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRecognitionLanguages:", self->_recognitionLanguages);
    objc_msgSend(v5, "setRecognitionLevel:", self->_recognitionLevel);
    objc_msgSend(v5, "setUsesLanguageCorrection:", self->_usesLanguageCorrection);
    objc_msgSend(v5, "setAutomaticallyDetectsLanguage:", self->_automaticallyDetectsLanguage);
    *(float *)&v6 = self->_minimumTextHeight;
    objc_msgSend(v5, "setMinimumTextHeight:", v6);
  }
  return v5;
}

- (NSArray)recognitionLanguages
{
  return self->_recognitionLanguages;
}

- (void)setRecognitionLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSArray)customWords
{
  return self->_customWords;
}

- (void)setCustomWords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (int64_t)recognitionLevel
{
  return self->_recognitionLevel;
}

- (void)setRecognitionLevel:(int64_t)a3
{
  self->_recognitionLevel = a3;
}

- (BOOL)usesLanguageCorrection
{
  return self->_usesLanguageCorrection;
}

- (void)setUsesLanguageCorrection:(BOOL)a3
{
  self->_usesLanguageCorrection = a3;
}

- (BOOL)automaticallyDetectsLanguage
{
  return self->_automaticallyDetectsLanguage;
}

- (void)setAutomaticallyDetectsLanguage:(BOOL)a3
{
  self->_automaticallyDetectsLanguage = a3;
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
  objc_storeStrong((id *)&self->_customWords, 0);
  objc_storeStrong((id *)&self->_recognitionLanguages, 0);
}

@end

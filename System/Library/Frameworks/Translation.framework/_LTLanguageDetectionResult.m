@implementation _LTLanguageDetectionResult

- (_LTLanguageDetectionResult)initWithCoder:(id)a3
{
  id v4;
  _LTLanguageDetectionResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _LTLanguageDetectionResult *v11;
  objc_super v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LTLanguageDetectionResult;
  v5 = -[_LTLanguageDetectionResult init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dominantLanguage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTLanguageDetectionResult setDominantLanguage:](v5, "setDominantLanguage:", v6);

    v7 = (void *)MEMORY[0x24BDBCF20];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v14[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("confidences"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTLanguageDetectionResult setConfidences:](v5, "setConfidences:", v10);

    v5->_isConfident = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isConfident"));
    v5->_isFinal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFinal"));
    v11 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_LTLanguageDetectionResult dominantLanguage](self, "dominantLanguage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("dominantLanguage"));

  -[_LTLanguageDetectionResult confidences](self, "confidences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("confidences"));

  objc_msgSend(v6, "encodeBool:forKey:", -[_LTLanguageDetectionResult isConfident](self, "isConfident"), CFSTR("isConfident"));
  objc_msgSend(v6, "encodeBool:forKey:", -[_LTLanguageDetectionResult isFinal](self, "isFinal"), CFSTR("isFinal"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSLocale)dominantLanguage
{
  return self->_dominantLanguage;
}

- (void)setDominantLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)confidences
{
  return self->_confidences;
}

- (void)setConfidences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isConfident
{
  return self->_isConfident;
}

- (void)setIsConfident:(BOOL)a3
{
  self->_isConfident = a3;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (void)setIsFinal:(BOOL)a3
{
  self->_isFinal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confidences, 0);
  objc_storeStrong((id *)&self->_dominantLanguage, 0);
}

@end

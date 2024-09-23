@implementation AFPhonemeTranscription

- (AFPhonemeTranscription)initWithCoder:(id)a3
{
  id v4;
  AFPhonemeTranscription *v5;
  uint64_t v6;
  NSString *orthography;
  uint64_t v8;
  NSString *language;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *phonemeSuggestions;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AFPhonemeTranscription;
  v5 = -[AFPhonemeTranscription init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_orthography"));
    v6 = objc_claimAutoreleasedReturnValue();
    orthography = v5->_orthography;
    v5->_orthography = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_language"));
    v8 = objc_claimAutoreleasedReturnValue();
    language = v5->_language;
    v5->_language = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_phonemeSuggestions"));
    v13 = objc_claimAutoreleasedReturnValue();
    phonemeSuggestions = v5->_phonemeSuggestions;
    v5->_phonemeSuggestions = (NSArray *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *language;
  id v5;

  language = self->_language;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", language, CFSTR("_language"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_orthography, CFSTR("_orthography"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_phonemeSuggestions, CFSTR("_phonemeSuggestions"));

}

- (NSString)orthography
{
  return self->_orthography;
}

- (void)setOrthography:(id)a3
{
  objc_storeStrong((id *)&self->_orthography, a3);
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_language, a3);
}

- (NSArray)phonemeSuggestions
{
  return self->_phonemeSuggestions;
}

- (void)setPhonemeSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_phonemeSuggestions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phonemeSuggestions, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_orthography, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

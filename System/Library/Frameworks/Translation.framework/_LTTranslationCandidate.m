@implementation _LTTranslationCandidate

- (_LTTranslationCandidate)initWithCoder:(id)a3
{
  id v4;
  _LTTranslationCandidate *v5;
  uint64_t v6;
  NSString *formattedString;
  uint64_t v8;
  NSString *sanitizedFormattedString;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *tokens;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *senses;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *genderAlternatives;
  uint64_t v26;
  _LTTranslationStatistics *statistics;
  uint64_t v28;
  NSString *romanization;
  _LTTranslationCandidate *v30;
  objc_super v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)_LTTranslationCandidate;
  v5 = -[_LTTranslationCandidate init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("formattedString"));
    v6 = objc_claimAutoreleasedReturnValue();
    formattedString = v5->_formattedString;
    v5->_formattedString = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sanitizedFormattedString"));
    v8 = objc_claimAutoreleasedReturnValue();
    sanitizedFormattedString = v5->_sanitizedFormattedString;
    v5->_sanitizedFormattedString = (NSString *)v8;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("confidence"));
    v5->_confidence = v10;
    v5->_lowConfidence = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lowConfidence"));
    v11 = (void *)MEMORY[0x24BDBCF20];
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("tokens"));
    v14 = objc_claimAutoreleasedReturnValue();
    tokens = v5->_tokens;
    v5->_tokens = (NSArray *)v14;

    v16 = (void *)MEMORY[0x24BDBCF20];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("senses"));
    v19 = objc_claimAutoreleasedReturnValue();
    senses = v5->_senses;
    v5->_senses = (NSArray *)v19;

    v21 = (void *)MEMORY[0x24BDBCF20];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("genders"));
    v24 = objc_claimAutoreleasedReturnValue();
    genderAlternatives = v5->_genderAlternatives;
    v5->_genderAlternatives = (NSArray *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statistics"));
    v26 = objc_claimAutoreleasedReturnValue();
    statistics = v5->_statistics;
    v5->_statistics = (_LTTranslationStatistics *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("romanization"));
    v28 = objc_claimAutoreleasedReturnValue();
    romanization = v5->_romanization;
    v5->_romanization = (NSString *)v28;

    v30 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *formattedString;
  id v5;

  formattedString = self->_formattedString;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", formattedString, CFSTR("formattedString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sanitizedFormattedString, CFSTR("sanitizedFormattedString"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("confidence"), self->_confidence);
  objc_msgSend(v5, "encodeBool:forKey:", self->_lowConfidence, CFSTR("lowConfidence"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tokens, CFSTR("tokens"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senses, CFSTR("senses"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_genderAlternatives, CFSTR("genders"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_statistics, CFSTR("statistics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_romanization, CFSTR("romanization"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)formattedString
{
  return self->_formattedString;
}

- (void)setFormattedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)sanitizedFormattedString
{
  return self->_sanitizedFormattedString;
}

- (void)setSanitizedFormattedString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (BOOL)isLowConfidence
{
  return self->_lowConfidence;
}

- (void)setLowConfidence:(BOOL)a3
{
  self->_lowConfidence = a3;
}

- (NSArray)preToPostITN
{
  return self->_preToPostITN;
}

- (void)setPreToPostITN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)senses
{
  return self->_senses;
}

- (void)setSenses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)genderAlternatives
{
  return self->_genderAlternatives;
}

- (void)setGenderAlternatives:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (_LTTranslationStatistics)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)romanization
{
  return self->_romanization;
}

- (void)setRomanization:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_romanization, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_genderAlternatives, 0);
  objc_storeStrong((id *)&self->_senses, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_preToPostITN, 0);
  objc_storeStrong((id *)&self->_sanitizedFormattedString, 0);
  objc_storeStrong((id *)&self->_formattedString, 0);
}

@end

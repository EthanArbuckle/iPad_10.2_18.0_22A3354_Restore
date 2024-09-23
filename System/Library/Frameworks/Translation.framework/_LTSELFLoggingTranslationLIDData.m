@implementation _LTSELFLoggingTranslationLIDData

- (_LTSELFLoggingTranslationLIDData)initWithInvocationId:(id)a3 inputSource:(int64_t)a4 topLocale:(id)a5 lowConfidenceLocales:(id)a6
{
  id v11;
  id v12;
  id v13;
  _LTSELFLoggingTranslationLIDData *v14;
  _LTSELFLoggingTranslationLIDData *v15;
  _LTSELFLoggingTranslationLIDData *v16;
  objc_super v18;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_LTSELFLoggingTranslationLIDData;
  v14 = -[_LTSELFLoggingTranslationLIDData init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_invocationId, a3);
    v15->_inputSource = a4;
    objc_storeStrong((id *)&v15->_topLocale, a5);
    objc_storeStrong((id *)&v15->_lowConfidenceLocales, a6);
    v16 = v15;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _LTSELFLoggingTranslationLIDData *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  _LTSELFLoggingTranslationLIDData *v9;

  v4 = [_LTSELFLoggingTranslationLIDData alloc];
  -[_LTSELFLoggingTranslationLIDData invocationId](self, "invocationId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_LTSELFLoggingTranslationLIDData inputSource](self, "inputSource");
  -[_LTSELFLoggingTranslationLIDData topLocale](self, "topLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTSELFLoggingTranslationLIDData lowConfidenceLocales](self, "lowConfidenceLocales");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_LTSELFLoggingTranslationLIDData initWithInvocationId:inputSource:topLocale:lowConfidenceLocales:](v4, "initWithInvocationId:inputSource:topLocale:lowConfidenceLocales:", v5, v6, v7, v8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *invocationId;
  id v5;

  invocationId = self->_invocationId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", invocationId, CFSTR("invocationId"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_inputSource, CFSTR("inputSource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_topLocale, CFSTR("topLocale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lowConfidenceLocales, CFSTR("lowConfidenceLocales"));

}

- (_LTSELFLoggingTranslationLIDData)initWithCoder:(id)a3
{
  id v4;
  _LTSELFLoggingTranslationLIDData *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSUUID *invocationId;
  uint64_t v11;
  NSLocale *topLocale;
  uint64_t v13;
  NSArray *lowConfidenceLocales;
  _LTSELFLoggingTranslationLIDData *v15;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_LTSELFLoggingTranslationLIDData;
  v5 = -[_LTSELFLoggingTranslationLIDData init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("invocationId"));
    v9 = objc_claimAutoreleasedReturnValue();
    invocationId = v5->_invocationId;
    v5->_invocationId = (NSUUID *)v9;

    v5->_inputSource = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("inputSource"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topLocale"));
    v11 = objc_claimAutoreleasedReturnValue();
    topLocale = v5->_topLocale;
    v5->_topLocale = (NSLocale *)v11;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("lowConfidenceLocales"));
    v13 = objc_claimAutoreleasedReturnValue();
    lowConfidenceLocales = v5->_lowConfidenceLocales;
    v5->_lowConfidenceLocales = (NSArray *)v13;

    v15 = v5;
  }

  return v5;
}

- (NSUUID)invocationId
{
  return self->_invocationId;
}

- (int64_t)inputSource
{
  return self->_inputSource;
}

- (void)setInputSource:(int64_t)a3
{
  self->_inputSource = a3;
}

- (NSLocale)topLocale
{
  return self->_topLocale;
}

- (void)setTopLocale:(id)a3
{
  objc_storeStrong((id *)&self->_topLocale, a3);
}

- (NSArray)lowConfidenceLocales
{
  return self->_lowConfidenceLocales;
}

- (void)setLowConfidenceLocales:(id)a3
{
  objc_storeStrong((id *)&self->_lowConfidenceLocales, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowConfidenceLocales, 0);
  objc_storeStrong((id *)&self->_topLocale, 0);
  objc_storeStrong((id *)&self->_invocationId, 0);
}

@end

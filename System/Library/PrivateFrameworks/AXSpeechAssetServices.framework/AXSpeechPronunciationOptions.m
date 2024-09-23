@implementation AXSpeechPronunciationOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXSpeechPronunciationOptions)initWithCoder:(id)a3
{
  id v4;
  AXSpeechPronunciationOptions *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXSpeechPronunciationOptions;
  v5 = -[AXSpeechPronunciationOptions init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("orthograpy"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpeechPronunciationOptions setOrthography:](v5, "setOrthography:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("language"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSpeechPronunciationOptions setLanguage:](v5, "setLanguage:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AXSpeechPronunciationOptions orthography](self, "orthography");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("orthograpy"));

  -[AXSpeechPronunciationOptions language](self, "language");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("language"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[AXSpeechPronunciationOptions orthography](self, "orthography");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSpeechPronunciationOptions language](self, "language");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXSpeechPronunciationOptions: %@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_orthography, 0);
}

@end

@implementation INFPartOfSpeech

- (INFPartOfSpeech)init
{
  INFPartOfSpeech *v2;
  uint64_t v3;
  NSMutableDictionary *variants;
  NSString *identifier;
  NSString *language;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)INFPartOfSpeech;
  v2 = -[INFPartOfSpeech init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    variants = v2->_variants;
    v2->_variants = (NSMutableDictionary *)v3;

    identifier = v2->_identifier;
    v2->_identifier = (NSString *)&stru_1E9778A78;

    v2->_partOfSpeechType = 0;
    v2->_gender = 0;
    language = v2->_language;
    v2->_language = (NSString *)&stru_1E9778A78;

  }
  return v2;
}

- (INFPartOfSpeech)initWithPartOfSpeechType:(unint64_t)a3 identifier:(id)a4 language:(id)a5
{
  id v9;
  id v10;
  INFPartOfSpeech *v11;
  INFPartOfSpeech *v12;
  uint64_t v13;
  NSString *language;

  v9 = a4;
  v10 = a5;
  v11 = -[INFPartOfSpeech init](self, "init");
  v12 = v11;
  if (v11)
  {
    v11->_partOfSpeechType = a3;
    objc_storeStrong((id *)&v11->_identifier, a4);
    v13 = objc_msgSend(v10, "copy");
    language = v12->_language;
    v12->_language = (NSString *)v13;

  }
  return v12;
}

- (INFPartOfSpeech)initWithDictionary:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  INFPartOfSpeech *v8;
  void *v9;
  uint64_t v10;
  NSString *language;
  uint64_t v12;
  NSMutableDictionary *variants;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v8 = -[INFPartOfSpeech init](self, "init");
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LOCLanguageIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    language = v8->_language;
    v8->_language = (NSString *)v10;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LOCVariants"));
    v12 = objc_claimAutoreleasedReturnValue();
    variants = v8->_variants;
    v8->_variants = (NSMutableDictionary *)v12;

    objc_storeStrong((id *)&v8->_identifier, a4);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LOCPartOfSpeechType"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("LOCPartOfSpeechTypeNoun")) & 1) != 0)
    {
      v15 = 1;
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("LOCPartOfSpeechTypeAdjective")))
    {
      v15 = 2;
    }
    else
    {
      v15 = 0;
    }

    v8->_partOfSpeechType = v15;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LOCGender"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("LOCGenderFeminine")) & 1) != 0)
    {
      v17 = 1;
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("LOCGenderMasculine")))
    {
      v17 = 2;
    }
    else
    {
      v17 = 0;
    }

    v8->_gender = v17;
  }

  return v8;
}

- (unint64_t)gender
{
  -[INFPartOfSpeech validateSelf](self, "validateSelf");
  return self->_gender;
}

- (void)setGender:(unint64_t)a3
{
  self->_gender = a3;
  -[INFPartOfSpeech validateSelf](self, "validateSelf");
}

- (void)validateSelf
{
  if (self->_partOfSpeechType == 2)
    self->_gender = 0;
}

- (void)setString:(id)a3 forVariants:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[INFVariantsDescriptor variantWithVariants:](INFVariantsDescriptor, "variantWithVariants:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[INFPartOfSpeech setString:forVariantsDescriptor:](self, "setString:forVariantsDescriptor:", v6, v7);

}

- (id)stringForVariants:(unint64_t)a3
{
  void *v4;
  void *v5;

  +[INFVariantsDescriptor variantWithVariants:](INFVariantsDescriptor, "variantWithVariants:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFPartOfSpeech stringForVariantsDescriptor:](self, "stringForVariantsDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setString:(id)a3 forVariantsDescriptor:(id)a4
{
  NSMutableDictionary *variants;
  id v6;
  id v7;

  variants = self->_variants;
  v6 = a3;
  objc_msgSend(a4, "dictionaryKey");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](variants, "setObject:forKeyedSubscript:", v6, v7);

}

- (id)stringForVariantsDescriptor:(id)a3
{
  NSMutableDictionary *variants;
  void *v4;
  void *v5;

  variants = self->_variants;
  objc_msgSend(a3, "dictionaryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](variants, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contributingSentenceContext
{
  void *v3;
  void *v4;

  +[INFSentenceContext sentenceContext](INFSentenceContext, "sentenceContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_gender)
    objc_msgSend(v3, "setGender:");
  return v4;
}

- (id)stringForContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 == 1)
    v7 = 1;
  else
    v7 = 2;
  +[INFVariantsDescriptor variant](INFVariantsDescriptor, "variant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlurality:", v7);
  objc_msgSend(v8, "setGender:", objc_msgSend(v4, "gender"));
  -[INFPartOfSpeech stringForVariantsDescriptor:](self, "stringForVariantsDescriptor:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
  }
  else
  {
    do
    {
      objc_msgSend(v8, "variantByRemovingOneAttribute");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v8, "isEqual:", v13);

      if ((v14 & 1) != 0)
      {
        v10 = 0;
        goto LABEL_10;
      }
      objc_msgSend(v8, "variantByRemovingOneAttribute");
      v11 = objc_claimAutoreleasedReturnValue();

      -[INFPartOfSpeech stringForVariantsDescriptor:](self, "stringForVariantsDescriptor:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v11;
    }
    while (!v12);
    v10 = (void *)v12;
    v8 = (void *)v11;
  }
LABEL_10:
  -[INFPartOfSpeech stringForVariantsDescriptor:](self, "stringForVariantsDescriptor:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unint64_t partOfSpeechType;
  const __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  unint64_t gender;
  const __CFString *v9;
  __CFString *v10;
  __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  partOfSpeechType = self->_partOfSpeechType;
  if (partOfSpeechType)
  {
    v5 = CFSTR("LOCPartOfSpeechTypeNone");
    if (partOfSpeechType == 1)
      v5 = CFSTR("LOCPartOfSpeechTypeNoun");
    if (partOfSpeechType == 2)
      v6 = CFSTR("LOCPartOfSpeechTypeAdjective");
    else
      v6 = (__CFString *)v5;
    v7 = v6;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("LOCPartOfSpeechType"));

  }
  gender = self->_gender;
  if (gender)
  {
    v9 = CFSTR("LOCGenderNone");
    if (gender == 1)
      v9 = CFSTR("LOCGenderFeminine");
    if (gender == 2)
      v10 = CFSTR("LOCGenderMasculine");
    else
      v10 = (__CFString *)v9;
    v11 = v10;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("LOCGender"));

  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_variants, CFSTR("LOCVariants"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_language, CFSTR("LOCLanguageIdentifier"));
  return v3;
}

- (id)identifier
{
  return self->_identifier;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)partOfSpeechType
{
  return self->_partOfSpeechType;
}

- (void)setPartOfSpeechType:(unint64_t)a3
{
  self->_partOfSpeechType = a3;
}

- (NSMutableDictionary)variants
{
  return self->_variants;
}

- (void)setVariants:(id)a3
{
  objc_storeStrong((id *)&self->_variants, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variants, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)nounWithIdentifier:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPartOfSpeechType:identifier:language:", 1, v7, v6);

  return v8;
}

+ (id)nounWithGender:(unint64_t)a3 identifier:(id)a4 language:(id)a5
{
  void *v6;

  objc_msgSend(a1, "nounWithIdentifier:language:", a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGender:", a3);
  return v6;
}

+ (id)adjectiveWithIdentifier:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPartOfSpeechType:identifier:language:", 2, v7, v6);

  return v8;
}

@end

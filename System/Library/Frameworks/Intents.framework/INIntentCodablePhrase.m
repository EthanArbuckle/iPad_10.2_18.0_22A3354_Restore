@implementation INIntentCodablePhrase

- (id)copyWithZone:(_NSZone *)a3
{
  INIntentCodablePhrase *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[INIntentCodablePhrase init](+[INIntentCodablePhrase allocWithZone:](INIntentCodablePhrase, "allocWithZone:", a3), "init");
  -[INIntentCodablePhrase pronunciationHint](self, "pronunciationHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodablePhrase setPronunciationHint:](v4, "setPronunciationHint:", v5);

  -[INIntentCodablePhrase pronunciationHintLocID](self, "pronunciationHintLocID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodablePhrase setPronunciationHintLocID:](v4, "setPronunciationHintLocID:", v6);

  -[INIntentCodablePhrase phrase](self, "phrase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodablePhrase setPhrase:](v4, "setPhrase:", v7);

  -[INIntentCodablePhrase phraseLocID](self, "phraseLocID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodablePhrase setPhraseLocID:](v4, "setPhraseLocID:", v8);

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[INIntentCodablePhrase phrase](self, "phrase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[INIntentCodablePhrase phraseLocID](self, "phraseLocID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[INIntentCodablePhrase pronunciationHint](self, "pronunciationHint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[INIntentCodablePhrase pronunciationHintLocID](self, "pronunciationHintLocID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  void *v30;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[INIntentCodablePhrase phrase](self, "phrase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phrase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {

    }
    else
    {
      v10 = 0;
      v11 = v8;
      v12 = v7;
      if (!v7 || !v8)
        goto LABEL_31;
      v13 = objc_msgSend(v7, "isEqualToString:", v8);

      if (!v13)
      {
        v10 = 0;
LABEL_32:

        goto LABEL_33;
      }
    }
    -[INIntentCodablePhrase pronunciationHint](self, "pronunciationHint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pronunciationHint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;
    v16 = v15;
    v11 = v16;
    if (v12 == v16)
    {

    }
    else
    {
      v10 = 0;
      v17 = v16;
      v18 = v12;
      if (!v12 || !v16)
        goto LABEL_30;
      v19 = objc_msgSend(v12, "isEqualToString:", v16);

      if (!v19)
      {
        v10 = 0;
LABEL_31:

        goto LABEL_32;
      }
    }
    -[INIntentCodablePhrase phraseLocID](self, "phraseLocID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phraseLocID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v20;
    v22 = v21;
    v30 = v22;
    if (v18 != v22)
    {
      v10 = 0;
      if (v18)
      {
        v23 = v22;
        v24 = v18;
        if (v22)
        {
          v25 = objc_msgSend(v18, "isEqualToString:", v22);

          if (!v25)
          {
            v10 = 0;
LABEL_29:
            v17 = v30;
LABEL_30:

            goto LABEL_31;
          }
          goto LABEL_21;
        }
      }
      else
      {
        v23 = v22;
        v24 = 0;
      }
LABEL_28:

      goto LABEL_29;
    }

LABEL_21:
    -[INIntentCodablePhrase pronunciationHintLocID](self, "pronunciationHintLocID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pronunciationHintLocID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v26;
    v28 = v27;
    v23 = v28;
    if (v24 == v28)
    {
      v10 = 1;
    }
    else
    {
      v10 = 0;
      if (v24 && v28)
        v10 = objc_msgSend(v24, "isEqualToString:", v28);
    }

    goto LABEL_28;
  }
  v10 = 0;
LABEL_33:

  return v10;
}

- (NSString)localizedPhrase
{
  return (NSString *)-[INIntentCodablePhrase localizedPhraseForLanguage:](self, "localizedPhraseForLanguage:", 0);
}

- (id)localizedPhraseForLanguage:(id)a3
{
  void *v4;
  void *v5;

  +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodablePhrase localizedPhraseWithLocalizer:](self, "localizedPhraseWithLocalizer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedPhraseWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[INIntentCodablePhrase phraseLocID](self, "phraseLocID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodablePhrase phrase](self, "phrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodablePhrase _codableDescription](self, "_codableDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_localizationTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  INLocalizedStringFromCodable(v5, v6, v8, v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)localizedPronunciationHint
{
  return (NSString *)-[INIntentCodablePhrase localizedPronunciationHintForLanguage:](self, "localizedPronunciationHintForLanguage:", 0);
}

- (id)localizedPronunciationHintForLanguage:(id)a3
{
  void *v4;
  void *v5;

  +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodablePhrase localizedPronunciationHintWithLocalizer:](self, "localizedPronunciationHintWithLocalizer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedPronunciationHintWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[INIntentCodablePhrase pronunciationHintLocID](self, "pronunciationHintLocID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodablePhrase pronunciationHint](self, "pronunciationHint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodablePhrase _codableDescription](self, "_codableDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_localizationTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  INLocalizedStringFromCodable(v5, v6, v8, v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *phrase;
  void *v8;
  NSString *v9;
  NSString *phraseLocID;
  void *v11;
  NSString *v12;
  NSString *pronunciationHint;
  NSString *v14;
  NSString *pronunciationHintLocID;
  id v16;

  v4 = a3;
  -[INIntentCodablePhrase __INCodableDescriptionPhraseKey](self, "__INCodableDescriptionPhraseKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  phrase = self->_phrase;
  self->_phrase = v6;

  -[INIntentCodablePhrase __INCodableDescriptionPhraseIDKey](self, "__INCodableDescriptionPhraseIDKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v8);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  phraseLocID = self->_phraseLocID;
  self->_phraseLocID = v9;

  -[INIntentCodablePhrase __INCodableDescriptionPronunciationHintKey](self, "__INCodableDescriptionPronunciationHintKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v11);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  pronunciationHint = self->_pronunciationHint;
  self->_pronunciationHint = v12;

  -[INIntentCodablePhrase __INCodableDescriptionPronunciationHintIDKey](self, "__INCodableDescriptionPronunciationHintIDKey");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v16);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();

  pronunciationHintLocID = self->_pronunciationHintLocID;
  self->_pronunciationHintLocID = v14;

}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INIntentCodablePhrase dictionaryRepresentationWithLocalizer:](self, "dictionaryRepresentationWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INIntentCodablePhrase __INCodableDescriptionPhraseKey](self, "__INCodableDescriptionPhraseKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  -[INIntentCodablePhrase localizedPhraseWithLocalizer:](self, "localizedPhraseWithLocalizer:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v5;
  v23[0] = v5;
  -[INIntentCodablePhrase __INCodableDescriptionPhraseIDKey](self, "__INCodableDescriptionPhraseIDKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v19;
  -[INIntentCodablePhrase phraseLocID](self, "phraseLocID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[1] = v8;
  -[INIntentCodablePhrase __INCodableDescriptionPronunciationHintKey](self, "__INCodableDescriptionPronunciationHintKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v9;
  v21 = v4;
  -[INIntentCodablePhrase localizedPronunciationHintWithLocalizer:](self, "localizedPronunciationHintWithLocalizer:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[2] = v11;
  -[INIntentCodablePhrase __INCodableDescriptionPronunciationHintIDKey](self, "__INCodableDescriptionPronunciationHintIDKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v12;
  -[INIntentCodablePhrase pronunciationHintLocID](self, "pronunciationHintLocID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)

  if (!v10)
  if (!v7)

  if (!v6)
  objc_msgSend(v15, "if_dictionaryWithNonEmptyValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[INIntentCodablePhrase phrase](self, "phrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("phrase"));

  -[INIntentCodablePhrase phraseLocID](self, "phraseLocID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("phraseLocID"));

  -[INIntentCodablePhrase pronunciationHint](self, "pronunciationHint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("pronunciationHint"));

  -[INIntentCodablePhrase pronunciationHintLocID](self, "pronunciationHintLocID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("pronunciationHintLocID"));

  -[INIntentCodablePhrase _codableDescription](self, "_codableDescription");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v9, CFSTR("_codableDescription"));

}

- (INIntentCodablePhrase)initWithCoder:(id)a3
{
  id v4;
  INIntentCodablePhrase *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSString *phrase;
  uint64_t v11;
  NSString *phraseLocID;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *pronunciationHint;
  uint64_t v18;
  NSString *pronunciationHintLocID;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)INIntentCodablePhrase;
  v5 = -[INIntentCodablePhrase init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("phrase"));
    v9 = objc_claimAutoreleasedReturnValue();
    phrase = v5->_phrase;
    v5->_phrase = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("phraseLocID"));
    v11 = objc_claimAutoreleasedReturnValue();
    phraseLocID = v5->_phraseLocID;
    v5->_phraseLocID = (NSString *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("pronunciationHint"));
    v16 = objc_claimAutoreleasedReturnValue();
    pronunciationHint = v5->_pronunciationHint;
    v5->_pronunciationHint = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pronunciationHintLocID"));
    v18 = objc_claimAutoreleasedReturnValue();
    pronunciationHintLocID = v5->_pronunciationHintLocID;
    v5->_pronunciationHintLocID = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_codableDescription"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_codableDescription, v20);

  }
  return v5;
}

- (INIntentCodableDescription)_codableDescription
{
  return (INIntentCodableDescription *)objc_loadWeakRetained((id *)&self->_codableDescription);
}

- (void)_setCodableDescription:(id)a3
{
  objc_storeWeak((id *)&self->_codableDescription, a3);
}

- (NSString)pronunciationHint
{
  return self->_pronunciationHint;
}

- (void)setPronunciationHint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)pronunciationHintLocID
{
  return self->_pronunciationHintLocID;
}

- (void)setPronunciationHintLocID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)phrase
{
  return self->_phrase;
}

- (void)setPhrase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)phraseLocID
{
  return self->_phraseLocID;
}

- (void)setPhraseLocID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phraseLocID, 0);
  objc_storeStrong((id *)&self->_phrase, 0);
  objc_storeStrong((id *)&self->_pronunciationHintLocID, 0);
  objc_storeStrong((id *)&self->_pronunciationHint, 0);
  objc_destroyWeak((id *)&self->_codableDescription);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)__INCodableDescriptionPronunciationHintIDKey
{
  void *v2;
  void *v3;

  -[INIntentCodablePhrase _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INIntentCodablePhrasePronunciationHintIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionPronunciationHintKey
{
  void *v2;
  void *v3;

  -[INIntentCodablePhrase _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INIntentCodablePhrasePronunciationHintKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionPhraseIDKey
{
  void *v2;
  void *v3;

  -[INIntentCodablePhrase _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INIntentCodablePhrasePhraseIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionPhraseKey
{
  void *v2;
  void *v3;

  -[INIntentCodablePhrase _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INIntentCodablePhrasePhraseKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

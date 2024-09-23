@implementation INCodableEnumValueSynonym

- (id)copyWithZone:(_NSZone *)a3
{
  INCodableEnumValueSynonym *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[INCodableEnumValueSynonym init](+[INCodableEnumValueSynonym allocWithZone:](INCodableEnumValueSynonym, "allocWithZone:", a3), "init");
  -[INCodableEnumValueSynonym pronunciationHint](self, "pronunciationHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValueSynonym setPronunciationHint:](v4, "setPronunciationHint:", v5);

  -[INCodableEnumValueSynonym pronunciationHintLocID](self, "pronunciationHintLocID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValueSynonym setPronunciationHintLocID:](v4, "setPronunciationHintLocID:", v6);

  -[INCodableEnumValueSynonym synonym](self, "synonym");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValueSynonym setSynonym:](v4, "setSynonym:", v7);

  -[INCodableEnumValueSynonym synonymLocID](self, "synonymLocID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValueSynonym setSynonymLocID:](v4, "setSynonymLocID:", v8);

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

  -[INCodableEnumValueSynonym synonym](self, "synonym");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[INCodableEnumValueSynonym synonymLocID](self, "synonymLocID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[INCodableEnumValueSynonym pronunciationHint](self, "pronunciationHint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[INCodableEnumValueSynonym pronunciationHintLocID](self, "pronunciationHintLocID");
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
    -[INCodableEnumValueSynonym synonym](self, "synonym");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synonym");
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
    -[INCodableEnumValueSynonym pronunciationHint](self, "pronunciationHint");
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
    -[INCodableEnumValueSynonym synonymLocID](self, "synonymLocID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synonymLocID");
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
    -[INCodableEnumValueSynonym pronunciationHintLocID](self, "pronunciationHintLocID");
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

- (NSString)localizedSynonym
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INCodableEnumValueSynonym localizedSynonymWithLocalizer:](self, "localizedSynonymWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedSynonymForLanguage:(id)a3
{
  void *v4;
  void *v5;

  +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValueSynonym localizedSynonymWithLocalizer:](self, "localizedSynonymWithLocalizer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedSynonymWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[INCodableEnumValueSynonym _codableEnumValue](self, "_codableEnumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_codableEnum");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValueSynonym synonymLocID](self, "synonymLocID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValueSynonym synonym](self, "synonym");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_localizationTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INLocalizedStringFromCodable(v7, v8, v9, v4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)localizedPronunciationHint
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INCodableEnumValueSynonym localizedPronunciationHintWithLocalizer:](self, "localizedPronunciationHintWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedPronunciationHintForLanguage:(id)a3
{
  void *v4;
  void *v5;

  +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValueSynonym localizedPronunciationHintWithLocalizer:](self, "localizedPronunciationHintWithLocalizer:", v4);
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
  void *v10;

  v4 = a3;
  -[INCodableEnumValueSynonym _codableEnumValue](self, "_codableEnumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_codableEnum");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValueSynonym pronunciationHintLocID](self, "pronunciationHintLocID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValueSynonym pronunciationHint](self, "pronunciationHint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_localizationTable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  INLocalizedStringFromCodable(v7, v8, v9, v4, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[INCodableEnumValueSynonym __INCodableEnumSynonymKey](self, "__INCodableEnumSynonymKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValueSynonym setSynonym:](self, "setSynonym:", v6);

  -[INCodableEnumValueSynonym __INCodableEnumSynonymIDKey](self, "__INCodableEnumSynonymIDKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValueSynonym setSynonymLocID:](self, "setSynonymLocID:", v8);

  -[INCodableEnumValueSynonym __INCodableEnumPronunciationHintKey](self, "__INCodableEnumPronunciationHintKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValueSynonym setPronunciationHint:](self, "setPronunciationHint:", v10);

  -[INCodableEnumValueSynonym __INCodableEnumPronunciationHintIDKey](self, "__INCodableEnumPronunciationHintIDKey");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[INCodableEnumValueSynonym setPronunciationHintLocID:](self, "setPronunciationHintLocID:", v11);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INCodableEnumValueSynonym dictionaryRepresentationWithLocalizer:](self, "dictionaryRepresentationWithLocalizer:", v3);
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
  -[INCodableEnumValueSynonym __INCodableEnumSynonymKey](self, "__INCodableEnumSynonymKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  -[INCodableEnumValueSynonym localizedSynonymWithLocalizer:](self, "localizedSynonymWithLocalizer:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v5;
  v23[0] = v5;
  -[INCodableEnumValueSynonym __INCodableEnumSynonymIDKey](self, "__INCodableEnumSynonymIDKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v19;
  -[INCodableEnumValueSynonym synonymLocID](self, "synonymLocID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[1] = v8;
  -[INCodableEnumValueSynonym __INCodableEnumPronunciationHintKey](self, "__INCodableEnumPronunciationHintKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v9;
  v21 = v4;
  -[INCodableEnumValueSynonym localizedPronunciationHintWithLocalizer:](self, "localizedPronunciationHintWithLocalizer:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[2] = v11;
  -[INCodableEnumValueSynonym __INCodableEnumPronunciationHintIDKey](self, "__INCodableEnumPronunciationHintIDKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v12;
  -[INCodableEnumValueSynonym pronunciationHintLocID](self, "pronunciationHintLocID");
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

- (INCodableEnum)_codableEnum
{
  void *v2;
  void *v3;

  -[INCodableEnumValueSynonym _codableEnumValue](self, "_codableEnumValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_codableEnum");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (INCodableEnum *)v3;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValueSynonym synonym](self, "synonym");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intents_encodeForPlistRepresentationWithParameters:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v9, CFSTR("synonym"));

  -[INCodableEnumValueSynonym synonymLocID](self, "synonymLocID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v10, CFSTR("synonymLocID"));

  -[INCodableEnumValueSynonym pronunciationHint](self, "pronunciationHint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "intents_encodeForPlistRepresentationWithParameters:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v12, CFSTR("pronunciationHint"));
  -[INCodableEnumValueSynonym pronunciationHintLocID](self, "pronunciationHintLocID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v13, CFSTR("pronunciationHintLocID"));

  v14 = (void *)objc_msgSend(v7, "copy");
  return v14;
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
  -[INCodableEnumValueSynonym synonym](self, "synonym");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("synonym"));

  -[INCodableEnumValueSynonym synonymLocID](self, "synonymLocID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("synonymLocID"));

  -[INCodableEnumValueSynonym pronunciationHint](self, "pronunciationHint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("pronunciationHint"));

  -[INCodableEnumValueSynonym pronunciationHintLocID](self, "pronunciationHintLocID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("pronunciationHintLocID"));

  -[INCodableEnumValueSynonym _codableEnumValue](self, "_codableEnumValue");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v9, CFSTR("_codableEnumValue"));

}

- (INCodableEnumValueSynonym)initWithCoder:(id)a3
{
  id v4;
  INCodableEnumValueSynonym *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)INCodableEnumValueSynonym;
  v5 = -[INCodableEnumValueSynonym init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("synonym"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableEnumValueSynonym setSynonym:](v5, "setSynonym:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("synonymLocID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableEnumValueSynonym setSynonymLocID:](v5, "setSynonymLocID:", v10);

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("pronunciationHint"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableEnumValueSynonym setPronunciationHint:](v5, "setPronunciationHint:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pronunciationHintLocID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableEnumValueSynonym setPronunciationHintLocID:](v5, "setPronunciationHintLocID:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_codableEnumValue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableEnumValueSynonym _setCodableEnumValue:](v5, "_setCodableEnumValue:", v16);

  }
  return v5;
}

- (INCodableEnumValue)_codableEnumValue
{
  return (INCodableEnumValue *)objc_loadWeakRetained((id *)&self->_codableEnumValue);
}

- (void)_setCodableEnumValue:(id)a3
{
  objc_storeWeak((id *)&self->_codableEnumValue, a3);
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

- (NSString)synonym
{
  return self->_synonym;
}

- (void)setSynonym:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)synonymLocID
{
  return self->_synonymLocID;
}

- (void)setSynonymLocID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonymLocID, 0);
  objc_storeStrong((id *)&self->_synonym, 0);
  objc_storeStrong((id *)&self->_pronunciationHintLocID, 0);
  objc_storeStrong((id *)&self->_pronunciationHint, 0);
  objc_destroyWeak((id *)&self->_codableEnumValue);
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v4;
  INCodableEnumValueSynonym *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init(INCodableEnumValueSynonym);
  objc_msgSend(v4, "intents_stringForKey:", CFSTR("synonymLocID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValueSynonym setSynonymLocID:](v5, "setSynonymLocID:", v6);

  objc_msgSend(v4, "intents_stringForKey:", CFSTR("pronunciationHintLocID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValueSynonym setPronunciationHintLocID:](v5, "setPronunciationHintLocID:", v7);

  objc_msgSend(v4, "intents_stringForKey:", CFSTR("synonym"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableEnumValueSynonym setSynonym:](v5, "setSynonym:", v8);

  objc_msgSend(v4, "intents_stringForKey:", CFSTR("pronunciationHint"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[INCodableEnumValueSynonym setPronunciationHint:](v5, "setPronunciationHint:", v9);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)__INCodableEnumSynonymIDKey
{
  void *v2;
  void *v3;

  -[INCodableEnumValueSynonym _codableEnum](self, "_codableEnum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumValueSynonymSynonymIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableEnumSynonymKey
{
  void *v2;
  void *v3;

  -[INCodableEnumValueSynonym _codableEnum](self, "_codableEnum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumValueSynonymSynonymKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableEnumPronunciationHintIDKey
{
  void *v2;
  void *v3;

  -[INCodableEnumValueSynonym _codableEnum](self, "_codableEnum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumValueSynonymPronunciationHintIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableEnumPronunciationHintKey
{
  void *v2;
  void *v3;

  -[INCodableEnumValueSynonym _codableEnum](self, "_codableEnum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableEnumValueSynonymPronunciationHintKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

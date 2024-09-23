@implementation INSpeakableString

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  -[INSpeakableString spokenPhrase](self, "spokenPhrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizeForLanguage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_intents_localizedCopyWithLocalizer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[INSpeakableString vocabularyIdentifier](self, "vocabularyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSpeakableString spokenPhrase](self, "spokenPhrase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localizeForLanguage:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INSpeakableString pronunciationHint](self, "pronunciationHint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v6, v9, v10);

  return v11;
}

- (INSpeakableString)initWithVocabularyIdentifier:(NSString *)vocabularyIdentifier spokenPhrase:(NSString *)spokenPhrase pronunciationHint:(NSString *)pronunciationHint
{
  NSString *v8;
  NSString *v9;
  NSString *v10;
  INSpeakableString *v11;
  uint64_t v12;
  NSString *v13;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;
  NSString *v17;
  objc_super v19;

  v8 = vocabularyIdentifier;
  v9 = spokenPhrase;
  v10 = pronunciationHint;
  v19.receiver = self;
  v19.super_class = (Class)INSpeakableString;
  v11 = -[INSpeakableString init](&v19, sel_init);
  if (v11)
  {
    v12 = -[NSString copy](v8, "copy");
    v13 = v11->_vocabularyIdentifier;
    v11->_vocabularyIdentifier = (NSString *)v12;

    v14 = -[NSString copy](v9, "copy");
    v15 = v11->_spokenPhrase;
    v11->_spokenPhrase = (NSString *)v14;

    v16 = -[NSString copy](v10, "copy");
    v17 = v11->_pronunciationHint;
    v11->_pronunciationHint = (NSString *)v16;

  }
  return v11;
}

- (INSpeakableString)initWithSpokenPhrase:(NSString *)spokenPhrase
{
  return -[INSpeakableString initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:](self, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", spokenPhrase, spokenPhrase, 0);
}

- (id)_initWithVocabularyIdentifier:(id)a3 spokenPhrase:(id)a4 pronunciationHint:(id)a5 alternativeMatches:(id)a6
{
  id v11;
  INSpeakableString *v12;
  INSpeakableString *v13;

  v11 = a6;
  v12 = -[INSpeakableString initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:](self, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", a3, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_alternativeSpeakableMatches, a6);

  return v13;
}

- (id)_effectiveNSStringValue
{
  NSString *vocabularyIdentifier;

  vocabularyIdentifier = self->_vocabularyIdentifier;
  if (!vocabularyIdentifier)
    vocabularyIdentifier = self->_spokenPhrase;
  return vocabularyIdentifier;
}

- (unint64_t)length
{
  void *v2;
  unint64_t v3;

  -[INSpeakableString _effectiveNSStringValue](self, "_effectiveNSStringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  void *v4;

  -[INSpeakableString _effectiveNSStringValue](self, "_effectiveNSStringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(a3) = objc_msgSend(v4, "characterAtIndex:", a3);

  return a3;
}

- (unint64_t)hash
{
  __int128 v3;

  *((_QWORD *)&v3 + 1) = -[NSString hash](self->_vocabularyIdentifier, "hash");
  *(_QWORD *)&v3 = -[NSString hash](self->_vocabularyIdentifier, "hash");
  return -[NSString hash](self->_spokenPhrase, "hash") ^ (v3 >> 32);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  NSString *vocabularyIdentifier;
  void *v8;
  int v9;
  NSString *spokenPhrase;
  NSString *pronunciationHint;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    vocabularyIdentifier = self->_vocabularyIdentifier;
    v12 = 0;
    if (vocabularyIdentifier == (NSString *)v5[3]
      || (objc_msgSend(v5, "vocabularyIdentifier"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = -[NSString isEqual:](vocabularyIdentifier, "isEqual:", v8),
          v8,
          v9))
    {
      spokenPhrase = self->_spokenPhrase;
      if (spokenPhrase == (NSString *)v6[1] || -[NSString isEqual:](spokenPhrase, "isEqual:"))
      {
        pronunciationHint = self->_pronunciationHint;
        if (pronunciationHint == (NSString *)v6[2] || -[NSString isEqual:](pronunciationHint, "isEqual:"))
          v12 = 1;
      }
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSString *vocabularyIdentifier;
  NSString *v6;
  NSString *v7;
  void *v8;

  vocabularyIdentifier = self->_vocabularyIdentifier;
  v6 = self->_spokenPhrase;
  v7 = vocabularyIdentifier;
  v8 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v7, v6, self->_pronunciationHint);

  return v8;
}

- (INSpeakableString)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  INSpeakableString *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vocabularyIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("spokenPhrase"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("pronunciationHint"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[INSpeakableString initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:](self, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v5, v9, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *vocabularyIdentifier;
  id v5;

  vocabularyIdentifier = self->_vocabularyIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", vocabularyIdentifier, CFSTR("vocabularyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_spokenPhrase, CFSTR("spokenPhrase"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pronunciationHint, CFSTR("pronunciationHint"));

}

- (NSString)description
{
  NSString *spokenPhrase;

  spokenPhrase = self->_spokenPhrase;
  if (!spokenPhrase)
    spokenPhrase = self->_vocabularyIdentifier;
  return spokenPhrase;
}

- (id)spokenPhrases
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[INSpeakableString spokenPhrase](self, "spokenPhrase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (INSpeakableString)initWithIdentifier:(id)a3 string:(id)a4
{
  return -[INSpeakableString initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:](self, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", a3, a4, 0);
}

- (NSString)spokenPhrase
{
  return self->_spokenPhrase;
}

- (void)setSpokenPhrase:(id)a3
{
  objc_storeStrong((id *)&self->_spokenPhrase, a3);
}

- (NSString)pronunciationHint
{
  return self->_pronunciationHint;
}

- (void)setPronunciationHint:(id)a3
{
  objc_storeStrong((id *)&self->_pronunciationHint, a3);
}

- (NSString)vocabularyIdentifier
{
  return self->_vocabularyIdentifier;
}

- (void)setVocabularyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_vocabularyIdentifier, a3);
}

- (NSArray)alternativeSpeakableMatches
{
  return self->_alternativeSpeakableMatches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeSpeakableMatches, 0);
  objc_storeStrong((id *)&self->_vocabularyIdentifier, 0);
  objc_storeStrong((id *)&self->_pronunciationHint, 0);
  objc_storeStrong((id *)&self->_spokenPhrase, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

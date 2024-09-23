@implementation _INVocabularyItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__siriID, 0);
  objc_storeStrong((id *)&self->_vocabularyIdentifier, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

- (_INVocabularyItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _INVocabularyItem *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_string"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_vocabularyIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_siriID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requiresUserIdentification"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "BOOLValue");
  v10 = -[_INVocabularyItem initWithString:vocabularyIdentifier:requiresUserIdentification:](self, "initWithString:vocabularyIdentifier:requiresUserIdentification:", v5, v6, v9);
  -[_INVocabularyItem _setSiriID:](v10, "_setSiriID:", v7);

  return v10;
}

- (_INVocabularyItem)initWithString:(id)a3 vocabularyIdentifier:(id)a4 requiresUserIdentification:(BOOL)a5
{
  id v8;
  id v9;
  _INVocabularyItem *v10;
  uint64_t v11;
  NSString *string;
  uint64_t v13;
  NSString *vocabularyIdentifier;
  _INVocabularyItem *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_INVocabularyItem;
  v10 = -[_INVocabularyItem init](&v17, sel_init);
  if (!v10)
    goto LABEL_4;
  v11 = objc_msgSend(v8, "copy");
  string = v10->_string;
  v10->_string = (NSString *)v11;

  v13 = objc_msgSend(v9, "copy");
  vocabularyIdentifier = v10->_vocabularyIdentifier;
  v10->_vocabularyIdentifier = (NSString *)v13;

  v10->_requiresUserIdentification = a5;
  if (-[_INVocabularyItem validate](v10, "validate") == 1)
    v15 = v10;
  else
LABEL_4:
    v15 = 0;

  return v15;
}

- (unint64_t)validate
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v8;
  unint64_t v9;

  -[_INVocabularyItem string](self, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 2;
  -[_INVocabularyItem string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "lengthOfBytesUsingEncoding:", 10);

  if (v6 > 0x400)
    return 3;
  -[_INVocabularyItem vocabularyIdentifier](self, "vocabularyIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "lengthOfBytesUsingEncoding:", 10);

  if (v9 <= 0x400)
    return 1;
  else
    return 4;
}

- (NSString)string
{
  return self->_string;
}

- (NSString)vocabularyIdentifier
{
  return self->_vocabularyIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *string;
  id v5;
  void *v6;
  id v7;

  string = self->_string;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", string, CFSTR("_string"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vocabularyIdentifier, CFSTR("_vocabularyIdentifier"));
  -[_INVocabularyItem _siriID](self, "_siriID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_siriID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresUserIdentification);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("requiresUserIdentification"));

}

- (id)_dictionaryForSaving
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;

  -[_INVocabularyItem _siriID](self, "_siriID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_INVocabularyItem string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INVocabularyItem vocabularyIdentifier](self, "vocabularyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_INVocabularyItem requiresUserIdentification](self, "requiresUserIdentification");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("string"));
  if (v4)
    objc_msgSend(v8, "setObject:forKey:", v4, CFSTR("_siriID"));
  if (v6)
    objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("vocabularyIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("requiresUserIdentification"));

  return v8;
}

- (id)_initWithVocabularyItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vocabularyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_INVocabularyItem _initWithUncheckedString:vocabularyIdentifier:requiresUserIdentification:](self, "_initWithUncheckedString:vocabularyIdentifier:requiresUserIdentification:", v5, v6, objc_msgSend(v4, "requiresUserIdentification"));

  if (v7 && objc_msgSend(v7, "validate") == 1)
  {
    objc_msgSend(v4, "_siriID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setSiriID:", v8);

    v9 = v7;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSUUID)_siriID
{
  return self->__siriID;
}

- (void)_setSiriID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)requiresUserIdentification
{
  return self->_requiresUserIdentification;
}

- (id)_initWithUncheckedString:(id)a3 vocabularyIdentifier:(id)a4 requiresUserIdentification:(BOOL)a5
{
  id v8;
  id v9;
  _INVocabularyItem *v10;
  uint64_t v11;
  NSString *string;
  uint64_t v13;
  NSString *vocabularyIdentifier;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_INVocabularyItem;
  v10 = -[_INVocabularyItem init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    string = v10->_string;
    v10->_string = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    vocabularyIdentifier = v10->_vocabularyIdentifier;
    v10->_vocabularyIdentifier = (NSString *)v13;

    v10->_requiresUserIdentification = a5;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithVocabularyItem:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_initWithUncheckedSpeakable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "spokenPhrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vocabularyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_INVocabularyItem _initWithUncheckedString:vocabularyIdentifier:requiresUserIdentification:](self, "_initWithUncheckedString:vocabularyIdentifier:requiresUserIdentification:", v5, v6, 0);
  return v7;
}

- (_INVocabularyItem)initWithString:(id)a3 vocabularyIdentifier:(id)a4
{
  return -[_INVocabularyItem initWithString:vocabularyIdentifier:requiresUserIdentification:](self, "initWithString:vocabularyIdentifier:requiresUserIdentification:", a3, a4, 0);
}

- (_INVocabularyItem)initWithSpeakable:(id)a3
{
  id v4;
  _INVocabularyItem *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "spokenPhrase");
  v5 = (_INVocabularyItem *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "spokenPhrase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      objc_msgSend(v4, "spokenPhrase");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "vocabularyIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[_INVocabularyItem initWithString:vocabularyIdentifier:](self, "initWithString:vocabularyIdentifier:", v8, v9);

      v5 = self;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (_INVocabularyItem)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("You must use -initWithString:, with a non-empty string, to create an _INVocabularyItem"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  const __CFString *v12;
  void *v13;

  -[_INVocabularyItem _siriID](self, "_siriID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v5 = &stru_1E2295770;
  if (v4)
    v5 = v4;
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_opt_class();
  -[_INVocabularyItem string](self, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INVocabularyItem vocabularyIdentifier](self, "vocabularyIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_INVocabularyItem requiresUserIdentification](self, "requiresUserIdentification");
  v12 = CFSTR("NO");
  if (v11)
    v12 = CFSTR("YES");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%p %@:%@>{string='%@', vocabularyIdentifier='%@', requiresUserIdentification='%@'}"), self, v8, v6, v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)_isSimilarEnoughToNotSync:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  char v10;
  char v11;

  v4 = a3;
  -[_INVocabularyItem string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INVocabularyItem vocabularyIdentifier](self, "vocabularyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vocabularyIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_INVocabularyItem requiresUserIdentification](self, "requiresUserIdentification");
  v10 = objc_msgSend(v4, "requiresUserIdentification");

  if ((v5 == v6 || objc_msgSend(v5, "isEqual:", v6))
    && (v7 == v8 || objc_msgSend(v7, "isEqual:", v8)))
  {
    v11 = v9 ^ v10 ^ 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end

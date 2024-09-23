@implementation _INPBIntentTypePhrases

- (void)setIntentType:(id)a3
{
  objc_storeStrong((id *)&self->_intentType, a3);
}

- (BOOL)hasIntentType
{
  return self->_intentType != 0;
}

- (void)setIntentVocabularyExamples:(id)a3
{
  NSArray *v4;
  NSArray *intentVocabularyExamples;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  intentVocabularyExamples = self->_intentVocabularyExamples;
  self->_intentVocabularyExamples = v4;

}

- (void)clearIntentVocabularyExamples
{
  -[NSArray removeAllObjects](self->_intentVocabularyExamples, "removeAllObjects");
}

- (void)addIntentVocabularyExamples:(id)a3
{
  id v4;
  NSArray *intentVocabularyExamples;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  intentVocabularyExamples = self->_intentVocabularyExamples;
  v8 = v4;
  if (!intentVocabularyExamples)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_intentVocabularyExamples;
    self->_intentVocabularyExamples = v6;

    v4 = v8;
    intentVocabularyExamples = self->_intentVocabularyExamples;
  }
  -[NSArray addObject:](intentVocabularyExamples, "addObject:", v4);

}

- (unint64_t)intentVocabularyExamplesCount
{
  return -[NSArray count](self->_intentVocabularyExamples, "count");
}

- (id)intentVocabularyExamplesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_intentVocabularyExamples, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentTypePhrasesReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBIntentTypePhrases intentType](self, "intentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBIntentTypePhrases intentType](self, "intentType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_intentVocabularyExamples;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (_INPBIntentTypePhrases)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBIntentTypePhrases *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBIntentTypePhrases *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBIntentTypePhrases *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBIntentTypePhrases initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBIntentTypePhrases data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBIntentTypePhrases *v5;
  id v6;
  void *v7;

  v5 = -[_INPBIntentTypePhrases init](+[_INPBIntentTypePhrases allocWithZone:](_INPBIntentTypePhrases, "allocWithZone:"), "init");
  v6 = -[_INPBIntentType copyWithZone:](self->_intentType, "copyWithZone:", a3);
  -[_INPBIntentTypePhrases setIntentType:](v5, "setIntentType:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_intentVocabularyExamples, "copyWithZone:", a3);
  -[_INPBIntentTypePhrases setIntentVocabularyExamples:](v5, "setIntentVocabularyExamples:", v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBIntentTypePhrases intentType](self, "intentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBIntentTypePhrases intentType](self, "intentType");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBIntentTypePhrases intentType](self, "intentType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBIntentTypePhrases intentVocabularyExamples](self, "intentVocabularyExamples");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentVocabularyExamples");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBIntentTypePhrases intentVocabularyExamples](self, "intentVocabularyExamples");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBIntentTypePhrases intentVocabularyExamples](self, "intentVocabularyExamples");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentVocabularyExamples");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[_INPBIntentType hash](self->_intentType, "hash");
  return -[NSArray hash](self->_intentVocabularyExamples, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBIntentTypePhrases intentType](self, "intentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("intent_type"));

  if (self->_intentVocabularyExamples)
  {
    -[_INPBIntentTypePhrases intentVocabularyExamples](self, "intentVocabularyExamples");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intent_vocabulary_examples"));

  }
  return v3;
}

- (_INPBIntentType)intentType
{
  return self->_intentType;
}

- (NSArray)intentVocabularyExamples
{
  return self->_intentVocabularyExamples;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentVocabularyExamples, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

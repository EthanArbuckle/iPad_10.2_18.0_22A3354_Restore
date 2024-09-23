@implementation _INPBIntentSlotVocabularyValue

- (void)setExamples:(id)a3
{
  NSArray *v4;
  NSArray *examples;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  examples = self->_examples;
  self->_examples = v4;

}

- (void)clearExamples
{
  -[NSArray removeAllObjects](self->_examples, "removeAllObjects");
}

- (void)addExamples:(id)a3
{
  id v4;
  NSArray *examples;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  examples = self->_examples;
  v8 = v4;
  if (!examples)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_examples;
    self->_examples = v6;

    v4 = v8;
    examples = self->_examples;
  }
  -[NSArray addObject:](examples, "addObject:", v4);

}

- (unint64_t)examplesCount
{
  return -[NSArray count](self->_examples, "count");
}

- (id)examplesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_examples, "objectAtIndexedSubscript:", a3);
}

- (void)setPhrase:(id)a3
{
  NSString *v4;
  NSString *phrase;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  phrase = self->_phrase;
  self->_phrase = v4;

}

- (BOOL)hasPhrase
{
  return self->_phrase != 0;
}

- (void)setPronunciation:(id)a3
{
  NSString *v4;
  NSString *pronunciation;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  pronunciation = self->_pronunciation;
  self->_pronunciation = v4;

}

- (BOOL)hasPronunciation
{
  return self->_pronunciation != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentSlotVocabularyValueReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_examples;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[_INPBIntentSlotVocabularyValue phrase](self, "phrase", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  -[_INPBIntentSlotVocabularyValue pronunciation](self, "pronunciation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();

}

- (_INPBIntentSlotVocabularyValue)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBIntentSlotVocabularyValue *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBIntentSlotVocabularyValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBIntentSlotVocabularyValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBIntentSlotVocabularyValue initWithData:](self, "initWithData:", v6);

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
  -[_INPBIntentSlotVocabularyValue data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBIntentSlotVocabularyValue *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = -[_INPBIntentSlotVocabularyValue init](+[_INPBIntentSlotVocabularyValue allocWithZone:](_INPBIntentSlotVocabularyValue, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_examples, "copyWithZone:", a3);
  -[_INPBIntentSlotVocabularyValue setExamples:](v5, "setExamples:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_phrase, "copyWithZone:", a3);
  -[_INPBIntentSlotVocabularyValue setPhrase:](v5, "setPhrase:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_pronunciation, "copyWithZone:", a3);
  -[_INPBIntentSlotVocabularyValue setPronunciation:](v5, "setPronunciation:", v8);

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
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBIntentSlotVocabularyValue examples](self, "examples");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "examples");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBIntentSlotVocabularyValue examples](self, "examples");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBIntentSlotVocabularyValue examples](self, "examples");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "examples");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBIntentSlotVocabularyValue phrase](self, "phrase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBIntentSlotVocabularyValue phrase](self, "phrase");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBIntentSlotVocabularyValue phrase](self, "phrase");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phrase");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBIntentSlotVocabularyValue pronunciation](self, "pronunciation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pronunciation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBIntentSlotVocabularyValue pronunciation](self, "pronunciation");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBIntentSlotVocabularyValue pronunciation](self, "pronunciation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pronunciation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  v3 = -[NSArray hash](self->_examples, "hash");
  v4 = -[NSString hash](self->_phrase, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_pronunciation, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_examples)
  {
    -[_INPBIntentSlotVocabularyValue examples](self, "examples");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("examples"));

  }
  if (self->_phrase)
  {
    -[_INPBIntentSlotVocabularyValue phrase](self, "phrase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("phrase"));

  }
  if (self->_pronunciation)
  {
    -[_INPBIntentSlotVocabularyValue pronunciation](self, "pronunciation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("pronunciation"));

  }
  return v3;
}

- (NSArray)examples
{
  return self->_examples;
}

- (NSString)phrase
{
  return self->_phrase;
}

- (NSString)pronunciation
{
  return self->_pronunciation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pronunciation, 0);
  objc_storeStrong((id *)&self->_phrase, 0);
  objc_storeStrong((id *)&self->_examples, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

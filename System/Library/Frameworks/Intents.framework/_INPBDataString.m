@implementation _INPBDataString

- (void)setAlternatives:(id)a3
{
  NSArray *v4;
  NSArray *alternatives;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  alternatives = self->_alternatives;
  self->_alternatives = v4;

}

- (void)clearAlternatives
{
  -[NSArray removeAllObjects](self->_alternatives, "removeAllObjects");
}

- (void)addAlternatives:(id)a3
{
  id v4;
  NSArray *alternatives;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  alternatives = self->_alternatives;
  v8 = v4;
  if (!alternatives)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_alternatives;
    self->_alternatives = v6;

    v4 = v8;
    alternatives = self->_alternatives;
  }
  -[NSArray addObject:](alternatives, "addObject:", v4);

}

- (unint64_t)alternativesCount
{
  return -[NSArray count](self->_alternatives, "count");
}

- (id)alternativesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_alternatives, "objectAtIndexedSubscript:", a3);
}

- (void)setLocalizedValue:(id)a3
{
  NSString *v4;
  NSString *localizedValue;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  localizedValue = self->_localizedValue;
  self->_localizedValue = v4;

}

- (BOOL)hasLocalizedValue
{
  return self->_localizedValue != 0;
}

- (void)setPronunciationHint:(id)a3
{
  NSString *v4;
  NSString *pronunciationHint;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  pronunciationHint = self->_pronunciationHint;
  self->_pronunciationHint = v4;

}

- (BOOL)hasPronunciationHint
{
  return self->_pronunciationHint != 0;
}

- (void)setVocabularyIdentifier:(id)a3
{
  NSString *v4;
  NSString *vocabularyIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  vocabularyIdentifier = self->_vocabularyIdentifier;
  self->_vocabularyIdentifier = v4;

}

- (BOOL)hasVocabularyIdentifier
{
  return self->_vocabularyIdentifier != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDataStringReadFrom(self, (uint64_t)a3);
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
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_alternatives;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[_INPBDataString localizedValue](self, "localizedValue", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    PBDataWriterWriteStringField();
  -[_INPBDataString pronunciationHint](self, "pronunciationHint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    PBDataWriterWriteStringField();
  -[_INPBDataString vocabularyIdentifier](self, "vocabularyIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    PBDataWriterWriteStringField();

}

- (_INPBDataString)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBDataString *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBDataString *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBDataString *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBDataString initWithData:](self, "initWithData:", v6);

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
  -[_INPBDataString data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBDataString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = -[_INPBDataString init](+[_INPBDataString allocWithZone:](_INPBDataString, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_alternatives, "copyWithZone:", a3);
  -[_INPBDataString setAlternatives:](v5, "setAlternatives:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_localizedValue, "copyWithZone:", a3);
  -[_INPBDataString setLocalizedValue:](v5, "setLocalizedValue:", v7);

  v8 = (void *)-[NSString copyWithZone:](self->_pronunciationHint, "copyWithZone:", a3);
  -[_INPBDataString setPronunciationHint:](v5, "setPronunciationHint:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_vocabularyIdentifier, "copyWithZone:", a3);
  -[_INPBDataString setVocabularyIdentifier:](v5, "setVocabularyIdentifier:", v9);

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
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_INPBDataString alternatives](self, "alternatives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternatives");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBDataString alternatives](self, "alternatives");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBDataString alternatives](self, "alternatives");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alternatives");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBDataString localizedValue](self, "localizedValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBDataString localizedValue](self, "localizedValue");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBDataString localizedValue](self, "localizedValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBDataString pronunciationHint](self, "pronunciationHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pronunciationHint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_INPBDataString pronunciationHint](self, "pronunciationHint");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBDataString pronunciationHint](self, "pronunciationHint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pronunciationHint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_INPBDataString vocabularyIdentifier](self, "vocabularyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vocabularyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBDataString vocabularyIdentifier](self, "vocabularyIdentifier");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_INPBDataString vocabularyIdentifier](self, "vocabularyIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vocabularyIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSArray hash](self->_alternatives, "hash");
  v4 = -[NSString hash](self->_localizedValue, "hash") ^ v3;
  v5 = -[NSString hash](self->_pronunciationHint, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_vocabularyIdentifier, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_alternatives, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = self->_alternatives;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "dictionaryRepresentation", (_QWORD)v18);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("alternatives"));
  }
  if (self->_localizedValue)
  {
    -[_INPBDataString localizedValue](self, "localizedValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("localizedValue"));

  }
  if (self->_pronunciationHint)
  {
    -[_INPBDataString pronunciationHint](self, "pronunciationHint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("pronunciationHint"));

  }
  if (self->_vocabularyIdentifier)
  {
    -[_INPBDataString vocabularyIdentifier](self, "vocabularyIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("vocabularyIdentifier"));

  }
  return v3;
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (NSString)localizedValue
{
  return self->_localizedValue;
}

- (NSString)pronunciationHint
{
  return self->_pronunciationHint;
}

- (NSString)vocabularyIdentifier
{
  return self->_vocabularyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocabularyIdentifier, 0);
  objc_storeStrong((id *)&self->_pronunciationHint, 0);
  objc_storeStrong((id *)&self->_localizedValue, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
}

+ (Class)alternativesType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

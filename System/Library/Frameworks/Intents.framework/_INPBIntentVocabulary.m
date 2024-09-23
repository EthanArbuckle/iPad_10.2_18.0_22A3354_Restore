@implementation _INPBIntentVocabulary

- (void)setIntentSlotVocabularyPolicies:(id)a3
{
  NSArray *v4;
  NSArray *intentSlotVocabularyPolicies;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  intentSlotVocabularyPolicies = self->_intentSlotVocabularyPolicies;
  self->_intentSlotVocabularyPolicies = v4;

}

- (void)clearIntentSlotVocabularyPolicies
{
  -[NSArray removeAllObjects](self->_intentSlotVocabularyPolicies, "removeAllObjects");
}

- (void)addIntentSlotVocabularyPolicies:(id)a3
{
  id v4;
  NSArray *intentSlotVocabularyPolicies;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  intentSlotVocabularyPolicies = self->_intentSlotVocabularyPolicies;
  v8 = v4;
  if (!intentSlotVocabularyPolicies)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_intentSlotVocabularyPolicies;
    self->_intentSlotVocabularyPolicies = v6;

    v4 = v8;
    intentSlotVocabularyPolicies = self->_intentSlotVocabularyPolicies;
  }
  -[NSArray addObject:](intentSlotVocabularyPolicies, "addObject:", v4);

}

- (unint64_t)intentSlotVocabularyPoliciesCount
{
  return -[NSArray count](self->_intentSlotVocabularyPolicies, "count");
}

- (id)intentSlotVocabularyPoliciesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_intentSlotVocabularyPolicies, "objectAtIndexedSubscript:", a3);
}

- (void)setIntentTypePhrases:(id)a3
{
  NSArray *v4;
  NSArray *intentTypePhrases;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  intentTypePhrases = self->_intentTypePhrases;
  self->_intentTypePhrases = v4;

}

- (void)clearIntentTypePhrases
{
  -[NSArray removeAllObjects](self->_intentTypePhrases, "removeAllObjects");
}

- (void)addIntentTypePhrases:(id)a3
{
  id v4;
  NSArray *intentTypePhrases;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  intentTypePhrases = self->_intentTypePhrases;
  v8 = v4;
  if (!intentTypePhrases)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_intentTypePhrases;
    self->_intentTypePhrases = v6;

    v4 = v8;
    intentTypePhrases = self->_intentTypePhrases;
  }
  -[NSArray addObject:](intentTypePhrases, "addObject:", v4);

}

- (unint64_t)intentTypePhrasesCount
{
  return -[NSArray count](self->_intentTypePhrases, "count");
}

- (id)intentTypePhrasesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_intentTypePhrases, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentVocabularyReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_intentSlotVocabularyPolicies;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_intentTypePhrases;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (_INPBIntentVocabulary)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBIntentVocabulary *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBIntentVocabulary *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBIntentVocabulary *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBIntentVocabulary initWithData:](self, "initWithData:", v6);

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
  -[_INPBIntentVocabulary data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBIntentVocabulary *v5;
  void *v6;
  void *v7;

  v5 = -[_INPBIntentVocabulary init](+[_INPBIntentVocabulary allocWithZone:](_INPBIntentVocabulary, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_intentSlotVocabularyPolicies, "copyWithZone:", a3);
  -[_INPBIntentVocabulary setIntentSlotVocabularyPolicies:](v5, "setIntentSlotVocabularyPolicies:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_intentTypePhrases, "copyWithZone:", a3);
  -[_INPBIntentVocabulary setIntentTypePhrases:](v5, "setIntentTypePhrases:", v7);

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
  -[_INPBIntentVocabulary intentSlotVocabularyPolicies](self, "intentSlotVocabularyPolicies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentSlotVocabularyPolicies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBIntentVocabulary intentSlotVocabularyPolicies](self, "intentSlotVocabularyPolicies");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBIntentVocabulary intentSlotVocabularyPolicies](self, "intentSlotVocabularyPolicies");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentSlotVocabularyPolicies");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBIntentVocabulary intentTypePhrases](self, "intentTypePhrases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentTypePhrases");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBIntentVocabulary intentTypePhrases](self, "intentTypePhrases");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBIntentVocabulary intentTypePhrases](self, "intentTypePhrases");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentTypePhrases");
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
  uint64_t v3;

  v3 = -[NSArray hash](self->_intentSlotVocabularyPolicies, "hash");
  return -[NSArray hash](self->_intentTypePhrases, "hash") ^ v3;
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
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_intentSlotVocabularyPolicies, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v5 = self->_intentSlotVocabularyPolicies;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v9), "dictionaryRepresentation");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("intent_slot_vocabulary_policies"));
  }
  if (-[NSArray count](self->_intentTypePhrases, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = self->_intentTypePhrases;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "dictionaryRepresentation", (_QWORD)v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v14);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("intent_type_phrases"));
  }
  return v3;
}

- (NSArray)intentSlotVocabularyPolicies
{
  return self->_intentSlotVocabularyPolicies;
}

- (NSArray)intentTypePhrases
{
  return self->_intentTypePhrases;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentTypePhrases, 0);
  objc_storeStrong((id *)&self->_intentSlotVocabularyPolicies, 0);
}

+ (Class)intentSlotVocabularyPoliciesType
{
  return (Class)objc_opt_class();
}

+ (Class)intentTypePhrasesType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

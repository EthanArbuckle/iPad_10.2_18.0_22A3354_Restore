@implementation _INPBIntentSlotVocabularyPolicy

- (void)setIntentSlotNames:(id)a3
{
  NSArray *v4;
  NSArray *intentSlotNames;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  intentSlotNames = self->_intentSlotNames;
  self->_intentSlotNames = v4;

}

- (void)clearIntentSlotNames
{
  -[NSArray removeAllObjects](self->_intentSlotNames, "removeAllObjects");
}

- (void)addIntentSlotNames:(id)a3
{
  id v4;
  NSArray *intentSlotNames;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  intentSlotNames = self->_intentSlotNames;
  v8 = v4;
  if (!intentSlotNames)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_intentSlotNames;
    self->_intentSlotNames = v6;

    v4 = v8;
    intentSlotNames = self->_intentSlotNames;
  }
  -[NSArray addObject:](intentSlotNames, "addObject:", v4);

}

- (unint64_t)intentSlotNamesCount
{
  return -[NSArray count](self->_intentSlotNames, "count");
}

- (id)intentSlotNamesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_intentSlotNames, "objectAtIndexedSubscript:", a3);
}

- (void)setIntentSlotVocabularyConcepts:(id)a3
{
  NSArray *v4;
  NSArray *intentSlotVocabularyConcepts;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  intentSlotVocabularyConcepts = self->_intentSlotVocabularyConcepts;
  self->_intentSlotVocabularyConcepts = v4;

}

- (void)clearIntentSlotVocabularyConcepts
{
  -[NSArray removeAllObjects](self->_intentSlotVocabularyConcepts, "removeAllObjects");
}

- (void)addIntentSlotVocabularyConcepts:(id)a3
{
  id v4;
  NSArray *intentSlotVocabularyConcepts;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  intentSlotVocabularyConcepts = self->_intentSlotVocabularyConcepts;
  v8 = v4;
  if (!intentSlotVocabularyConcepts)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_intentSlotVocabularyConcepts;
    self->_intentSlotVocabularyConcepts = v6;

    v4 = v8;
    intentSlotVocabularyConcepts = self->_intentSlotVocabularyConcepts;
  }
  -[NSArray addObject:](intentSlotVocabularyConcepts, "addObject:", v4);

}

- (unint64_t)intentSlotVocabularyConceptsCount
{
  return -[NSArray count](self->_intentSlotVocabularyConcepts, "count");
}

- (id)intentSlotVocabularyConceptsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_intentSlotVocabularyConcepts, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentSlotVocabularyPolicyReadFrom(self, (uint64_t)a3);
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
  v5 = self->_intentSlotNames;
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
        PBDataWriterWriteStringField();
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
  v10 = self->_intentSlotVocabularyConcepts;
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

- (_INPBIntentSlotVocabularyPolicy)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBIntentSlotVocabularyPolicy *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBIntentSlotVocabularyPolicy *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBIntentSlotVocabularyPolicy *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBIntentSlotVocabularyPolicy initWithData:](self, "initWithData:", v6);

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
  -[_INPBIntentSlotVocabularyPolicy data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBIntentSlotVocabularyPolicy *v5;
  void *v6;
  void *v7;

  v5 = -[_INPBIntentSlotVocabularyPolicy init](+[_INPBIntentSlotVocabularyPolicy allocWithZone:](_INPBIntentSlotVocabularyPolicy, "allocWithZone:"), "init");
  v6 = (void *)-[NSArray copyWithZone:](self->_intentSlotNames, "copyWithZone:", a3);
  -[_INPBIntentSlotVocabularyPolicy setIntentSlotNames:](v5, "setIntentSlotNames:", v6);

  v7 = (void *)-[NSArray copyWithZone:](self->_intentSlotVocabularyConcepts, "copyWithZone:", a3);
  -[_INPBIntentSlotVocabularyPolicy setIntentSlotVocabularyConcepts:](v5, "setIntentSlotVocabularyConcepts:", v7);

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
  -[_INPBIntentSlotVocabularyPolicy intentSlotNames](self, "intentSlotNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentSlotNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBIntentSlotVocabularyPolicy intentSlotNames](self, "intentSlotNames");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBIntentSlotVocabularyPolicy intentSlotNames](self, "intentSlotNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentSlotNames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBIntentSlotVocabularyPolicy intentSlotVocabularyConcepts](self, "intentSlotVocabularyConcepts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentSlotVocabularyConcepts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBIntentSlotVocabularyPolicy intentSlotVocabularyConcepts](self, "intentSlotVocabularyConcepts");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBIntentSlotVocabularyPolicy intentSlotVocabularyConcepts](self, "intentSlotVocabularyConcepts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentSlotVocabularyConcepts");
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

  v3 = -[NSArray hash](self->_intentSlotNames, "hash");
  return -[NSArray hash](self->_intentSlotVocabularyConcepts, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_intentSlotNames)
  {
    -[_INPBIntentSlotVocabularyPolicy intentSlotNames](self, "intentSlotNames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("intent_slot_names"));

  }
  if (-[NSArray count](self->_intentSlotVocabularyConcepts, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = self->_intentSlotVocabularyConcepts;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "dictionaryRepresentation", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("intent_slot_vocabulary_concepts"));
  }
  return v3;
}

- (NSArray)intentSlotNames
{
  return self->_intentSlotNames;
}

- (NSArray)intentSlotVocabularyConcepts
{
  return self->_intentSlotVocabularyConcepts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentSlotVocabularyConcepts, 0);
  objc_storeStrong((id *)&self->_intentSlotNames, 0);
}

+ (Class)intentSlotVocabularyConceptsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

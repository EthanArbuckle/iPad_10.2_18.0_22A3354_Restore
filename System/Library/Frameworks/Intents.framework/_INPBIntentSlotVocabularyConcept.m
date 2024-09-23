@implementation _INPBIntentSlotVocabularyConcept

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setRequiresUserIdentification:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_requiresUserIdentification = a3;
}

- (BOOL)hasRequiresUserIdentification
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasRequiresUserIdentification:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setSynonyms:(id)a3
{
  NSArray *v4;
  NSArray *synonyms;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  synonyms = self->_synonyms;
  self->_synonyms = v4;

}

- (void)clearSynonyms
{
  -[NSArray removeAllObjects](self->_synonyms, "removeAllObjects");
}

- (void)addSynonyms:(id)a3
{
  id v4;
  NSArray *synonyms;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  synonyms = self->_synonyms;
  v8 = v4;
  if (!synonyms)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_synonyms;
    self->_synonyms = v6;

    v4 = v8;
    synonyms = self->_synonyms;
  }
  -[NSArray addObject:](synonyms, "addObject:", v4);

}

- (unint64_t)synonymsCount
{
  return -[NSArray count](self->_synonyms, "count");
}

- (id)synonymsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_synonyms, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentSlotVocabularyConceptReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBIntentSlotVocabularyConcept identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  if (-[_INPBIntentSlotVocabularyConcept hasRequiresUserIdentification](self, "hasRequiresUserIdentification"))
    PBDataWriterWriteBOOLField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_synonyms;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (_INPBIntentSlotVocabularyConcept)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBIntentSlotVocabularyConcept *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBIntentSlotVocabularyConcept *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBIntentSlotVocabularyConcept *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBIntentSlotVocabularyConcept initWithData:](self, "initWithData:", v6);

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
  -[_INPBIntentSlotVocabularyConcept data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBIntentSlotVocabularyConcept *v5;
  void *v6;
  void *v7;

  v5 = -[_INPBIntentSlotVocabularyConcept init](+[_INPBIntentSlotVocabularyConcept allocWithZone:](_INPBIntentSlotVocabularyConcept, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  -[_INPBIntentSlotVocabularyConcept setIdentifier:](v5, "setIdentifier:", v6);

  if (-[_INPBIntentSlotVocabularyConcept hasRequiresUserIdentification](self, "hasRequiresUserIdentification"))
    -[_INPBIntentSlotVocabularyConcept setRequiresUserIdentification:](v5, "setRequiresUserIdentification:", -[_INPBIntentSlotVocabularyConcept requiresUserIdentification](self, "requiresUserIdentification"));
  v7 = (void *)-[NSArray copyWithZone:](self->_synonyms, "copyWithZone:", a3);
  -[_INPBIntentSlotVocabularyConcept setSynonyms:](v5, "setSynonyms:", v7);

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
  int v12;
  int requiresUserIdentification;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[_INPBIntentSlotVocabularyConcept identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_15;
  -[_INPBIntentSlotVocabularyConcept identifier](self, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBIntentSlotVocabularyConcept identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_16;
  }
  else
  {

  }
  v12 = -[_INPBIntentSlotVocabularyConcept hasRequiresUserIdentification](self, "hasRequiresUserIdentification");
  if (v12 != objc_msgSend(v4, "hasRequiresUserIdentification"))
    goto LABEL_16;
  if (-[_INPBIntentSlotVocabularyConcept hasRequiresUserIdentification](self, "hasRequiresUserIdentification"))
  {
    if (objc_msgSend(v4, "hasRequiresUserIdentification"))
    {
      requiresUserIdentification = self->_requiresUserIdentification;
      if (requiresUserIdentification != objc_msgSend(v4, "requiresUserIdentification"))
        goto LABEL_16;
    }
  }
  -[_INPBIntentSlotVocabularyConcept synonyms](self, "synonyms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "synonyms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBIntentSlotVocabularyConcept synonyms](self, "synonyms");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {

LABEL_19:
      v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    -[_INPBIntentSlotVocabularyConcept synonyms](self, "synonyms");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synonyms");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_19;
  }
  else
  {
LABEL_15:

  }
LABEL_16:
  v19 = 0;
LABEL_17:

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  v3 = -[NSString hash](self->_identifier, "hash");
  if (-[_INPBIntentSlotVocabularyConcept hasRequiresUserIdentification](self, "hasRequiresUserIdentification"))
    v4 = 2654435761 * self->_requiresUserIdentification;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[NSArray hash](self->_synonyms, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_identifier)
  {
    -[_INPBIntentSlotVocabularyConcept identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("identifier"));

  }
  if (-[_INPBIntentSlotVocabularyConcept hasRequiresUserIdentification](self, "hasRequiresUserIdentification"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBIntentSlotVocabularyConcept requiresUserIdentification](self, "requiresUserIdentification"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("requires_user_identification"));

  }
  if (-[NSArray count](self->_synonyms, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = self->_synonyms;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "dictionaryRepresentation", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("synonyms"));
  }
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)requiresUserIdentification
{
  return self->_requiresUserIdentification;
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (Class)synonymsType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

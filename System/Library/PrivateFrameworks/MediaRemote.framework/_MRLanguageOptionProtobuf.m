@implementation _MRLanguageOptionProtobuf

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasLanguageTag
{
  return self->_languageTag != 0;
}

- (void)clearCharacteristics
{
  -[NSMutableArray removeAllObjects](self->_characteristics, "removeAllObjects");
}

- (void)addCharacteristics:(id)a3
{
  id v4;
  NSMutableArray *characteristics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  characteristics = self->_characteristics;
  v8 = v4;
  if (!characteristics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_characteristics;
    self->_characteristics = v6;

    v4 = v8;
    characteristics = self->_characteristics;
  }
  -[NSMutableArray addObject:](characteristics, "addObject:", v4);

}

- (unint64_t)characteristicsCount
{
  return -[NSMutableArray count](self->_characteristics, "count");
}

- (id)characteristicsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_characteristics, "objectAtIndex:", a3);
}

+ (Class)characteristicsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_MRLanguageOptionProtobuf;
  -[_MRLanguageOptionProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRLanguageOptionProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *languageTag;
  NSMutableArray *characteristics;
  NSString *displayName;
  NSString *identifier;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_type);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  }
  languageTag = self->_languageTag;
  if (languageTag)
    objc_msgSend(v3, "setObject:forKey:", languageTag, CFSTR("languageTag"));
  characteristics = self->_characteristics;
  if (characteristics)
    objc_msgSend(v3, "setObject:forKey:", characteristics, CFSTR("characteristics"));
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v3, "setObject:forKey:", displayName, CFSTR("displayName"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRLanguageOptionProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_languageTag)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_characteristics;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_displayName)
    PBDataWriterWriteStringField();
  if (self->_identifier)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[10] = self->_type;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  v10 = v4;
  if (self->_languageTag)
    objc_msgSend(v4, "setLanguageTag:");
  if (-[_MRLanguageOptionProtobuf characteristicsCount](self, "characteristicsCount"))
  {
    objc_msgSend(v10, "clearCharacteristics");
    v5 = -[_MRLanguageOptionProtobuf characteristicsCount](self, "characteristicsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[_MRLanguageOptionProtobuf characteristicsAtIndex:](self, "characteristicsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addCharacteristics:", v8);

      }
    }
  }
  if (self->_displayName)
    objc_msgSend(v10, "setDisplayName:");
  v9 = v10;
  if (self->_identifier)
  {
    objc_msgSend(v10, "setIdentifier:");
    v9 = v10;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_type;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_languageTag, "copyWithZone:", a3);
  v8 = (void *)v6[4];
  v6[4] = v7;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = self->_characteristics;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend(v6, "addCharacteristics:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  v15 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v16 = (void *)v6[2];
  v6[2] = v15;

  v17 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v18 = (void *)v6[3];
  v6[3] = v17;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *languageTag;
  NSMutableArray *characteristics;
  NSString *displayName;
  NSString *identifier;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_type != *((_DWORD *)v4 + 10))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  languageTag = self->_languageTag;
  if ((unint64_t)languageTag | *((_QWORD *)v4 + 4)
    && !-[NSString isEqual:](languageTag, "isEqual:"))
  {
    goto LABEL_15;
  }
  characteristics = self->_characteristics;
  if ((unint64_t)characteristics | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](characteristics, "isEqual:"))
      goto LABEL_15;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_15;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 3))
    v9 = -[NSString isEqual:](identifier, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_languageTag, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_characteristics, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_displayName, "hash");
  return v6 ^ -[NSString hash](self->_identifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
  id *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[4])
    -[_MRLanguageOptionProtobuf setLanguageTag:](self, "setLanguageTag:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5[1];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[_MRLanguageOptionProtobuf addCharacteristics:](self, "addCharacteristics:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  if (v5[2])
    -[_MRLanguageOptionProtobuf setDisplayName:](self, "setDisplayName:");
  if (v5[3])
    -[_MRLanguageOptionProtobuf setIdentifier:](self, "setIdentifier:");

}

- (int)type
{
  return self->_type;
}

- (NSString)languageTag
{
  return self->_languageTag;
}

- (void)setLanguageTag:(id)a3
{
  objc_storeStrong((id *)&self->_languageTag, a3);
}

- (NSMutableArray)characteristics
{
  return self->_characteristics;
}

- (void)setCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_characteristics, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageTag, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
}

@end

@implementation MXWordWithPronunciations

- (BOOL)hasOrthography
{
  return self->_orthography != 0;
}

- (void)clearPronunciations
{
  -[NSMutableArray removeAllObjects](self->_pronunciations, "removeAllObjects");
}

- (void)addPronunciations:(id)a3
{
  id v4;
  NSMutableArray *pronunciations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  pronunciations = self->_pronunciations;
  v8 = v4;
  if (!pronunciations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_pronunciations;
    self->_pronunciations = v6;

    v4 = v8;
    pronunciations = self->_pronunciations;
  }
  -[NSMutableArray addObject:](pronunciations, "addObject:", v4);

}

- (unint64_t)pronunciationsCount
{
  return -[NSMutableArray count](self->_pronunciations, "count");
}

- (id)pronunciationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_pronunciations, "objectAtIndex:", a3);
}

+ (Class)pronunciationsType
{
  return (Class)objc_opt_class();
}

- (void)setFrequency:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_frequency = a3;
}

- (void)setHasFrequency:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFrequency
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasTag
{
  return self->_tag != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)MXWordWithPronunciations;
  -[MXWordWithPronunciations description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXWordWithPronunciations dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *orthography;
  NSMutableArray *pronunciations;
  void *v7;
  NSString *tag;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  orthography = self->_orthography;
  if (orthography)
    objc_msgSend(v3, "setObject:forKey:", orthography, CFSTR("orthography"));
  pronunciations = self->_pronunciations;
  if (pronunciations)
    objc_msgSend(v4, "setObject:forKey:", pronunciations, CFSTR("pronunciations"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_frequency);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("frequency"));

  }
  tag = self->_tag;
  if (tag)
    objc_msgSend(v4, "setObject:forKey:", tag, CFSTR("tag"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MXWordWithPronunciationsReadFrom((uint64_t)self, (uint64_t)a3);
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

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_orthography)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_pronunciations;
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
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_tag)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (self->_orthography)
    objc_msgSend(v9, "setOrthography:");
  if (-[MXWordWithPronunciations pronunciationsCount](self, "pronunciationsCount"))
  {
    objc_msgSend(v9, "clearPronunciations");
    v4 = -[MXWordWithPronunciations pronunciationsCount](self, "pronunciationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[MXWordWithPronunciations pronunciationsAtIndex:](self, "pronunciationsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addPronunciations:", v7);

      }
    }
  }
  v8 = v9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v9 + 2) = self->_frequency;
    *((_BYTE *)v9 + 40) |= 1u;
  }
  if (self->_tag)
  {
    objc_msgSend(v9, "setTag:");
    v8 = v9;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_orthography, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_pronunciations;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend((id)v5, "addPronunciations:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_frequency;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  v14 = -[NSString copyWithZone:](self->_tag, "copyWithZone:", a3, (_QWORD)v17);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *orthography;
  NSMutableArray *pronunciations;
  NSString *tag;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  orthography = self->_orthography;
  if ((unint64_t)orthography | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](orthography, "isEqual:"))
      goto LABEL_13;
  }
  pronunciations = self->_pronunciations;
  if ((unint64_t)pronunciations | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](pronunciations, "isEqual:"))
      goto LABEL_13;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_frequency != *((_DWORD *)v4 + 2))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  tag = self->_tag;
  if ((unint64_t)tag | *((_QWORD *)v4 + 4))
    v8 = -[NSString isEqual:](tag, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_orthography, "hash");
  v4 = -[NSMutableArray hash](self->_pronunciations, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_frequency;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5 ^ -[NSString hash](self->_tag, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 2))
    -[MXWordWithPronunciations setOrthography:](self, "setOrthography:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[MXWordWithPronunciations addPronunciations:](self, "addPronunciations:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
    self->_frequency = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
    -[MXWordWithPronunciations setTag:](self, "setTag:");

}

- (NSString)orthography
{
  return self->_orthography;
}

- (void)setOrthography:(id)a3
{
  objc_storeStrong((id *)&self->_orthography, a3);
}

- (NSMutableArray)pronunciations
{
  return self->_pronunciations;
}

- (void)setPronunciations:(id)a3
{
  objc_storeStrong((id *)&self->_pronunciations, a3);
}

- (int)frequency
{
  return self->_frequency;
}

- (NSString)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  objc_storeStrong((id *)&self->_tag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_pronunciations, 0);
  objc_storeStrong((id *)&self->_orthography, 0);
}

@end

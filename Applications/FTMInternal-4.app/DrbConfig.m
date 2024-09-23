@implementation DrbConfig

- (int)integrityAlgo
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_integrityAlgo;
  else
    return 0;
}

- (void)setIntegrityAlgo:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_integrityAlgo = a3;
}

- (void)setHasIntegrityAlgo:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIntegrityAlgo
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)integrityAlgoAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025EBB8 + a3);
}

- (int)StringAsIntegrityAlgo:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALGO_NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALGO_SNOW3G")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALGO_AES")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALGO_ZUC")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ALGO_MAX")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)cipheringAlgo
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_cipheringAlgo;
  else
    return 0;
}

- (void)setCipheringAlgo:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_cipheringAlgo = a3;
}

- (void)setHasCipheringAlgo:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCipheringAlgo
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)cipheringAlgoAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_10025EBB8 + a3);
}

- (int)StringAsCipheringAlgo:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALGO_NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALGO_SNOW3G")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALGO_AES")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALGO_ZUC")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ALGO_MAX")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearPerDrbConfigs
{
  -[NSMutableArray removeAllObjects](self->_perDrbConfigs, "removeAllObjects");
}

- (void)addPerDrbConfig:(id)a3
{
  id v4;
  NSMutableArray *perDrbConfigs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  perDrbConfigs = self->_perDrbConfigs;
  v8 = v4;
  if (!perDrbConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_perDrbConfigs;
    self->_perDrbConfigs = v6;

    v4 = v8;
    perDrbConfigs = self->_perDrbConfigs;
  }
  -[NSMutableArray addObject:](perDrbConfigs, "addObject:", v4);

}

- (unint64_t)perDrbConfigsCount
{
  return (unint64_t)-[NSMutableArray count](self->_perDrbConfigs, "count");
}

- (id)perDrbConfigAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_perDrbConfigs, "objectAtIndex:", a3);
}

+ (Class)perDrbConfigType
{
  return (Class)objc_opt_class(PerDrbConfig, a2);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DrbConfig;
  v3 = -[DrbConfig description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DrbConfig dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  uint64_t integrityAlgo;
  void *v6;
  uint64_t cipheringAlgo;
  void *v8;
  id v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    integrityAlgo = self->_integrityAlgo;
    if (integrityAlgo >= 5)
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_integrityAlgo));
    else
      v6 = *(&off_10025EBB8 + integrityAlgo);
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("integrity_algo"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    cipheringAlgo = self->_cipheringAlgo;
    if (cipheringAlgo >= 5)
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cipheringAlgo));
    else
      v8 = *(&off_10025EBB8 + cipheringAlgo);
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("ciphering_algo"));

  }
  if (-[NSMutableArray count](self->_perDrbConfigs, "count"))
  {
    v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_perDrbConfigs, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = self->_perDrbConfigs;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("per_drb_config"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10003F270(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  char has;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = v4;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_integrityAlgo, 1);
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt32Field(v5, self->_cipheringAlgo, 2);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_perDrbConfigs;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), 3);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_integrityAlgo;
    *((_BYTE *)v4 + 24) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[2] = self->_cipheringAlgo;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  v10 = v4;
  if (-[DrbConfig perDrbConfigsCount](self, "perDrbConfigsCount"))
  {
    objc_msgSend(v10, "clearPerDrbConfigs");
    v6 = -[DrbConfig perDrbConfigsCount](self, "perDrbConfigsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[DrbConfig perDrbConfigAtIndex:](self, "perDrbConfigAtIndex:", i));
        objc_msgSend(v10, "addPerDrbConfig:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  char has;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 3) = self->_integrityAlgo;
    *((_BYTE *)v5 + 24) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_cipheringAlgo;
    *((_BYTE *)v5 + 24) |= 1u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_perDrbConfigs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend(v6, "addPerDrbConfig:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableArray *perDrbConfigs;
  unsigned __int8 v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_14;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_integrityAlgo != *((_DWORD *)v4 + 3))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
LABEL_14:
    v7 = 0;
    goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_cipheringAlgo != *((_DWORD *)v4 + 2))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_14;
  }
  perDrbConfigs = self->_perDrbConfigs;
  if ((unint64_t)perDrbConfigs | *((_QWORD *)v4 + 2))
    v7 = -[NSMutableArray isEqual:](perDrbConfigs, "isEqual:");
  else
    v7 = 1;
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_integrityAlgo;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ (unint64_t)-[NSMutableArray hash](self->_perDrbConfigs, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_cipheringAlgo;
  return v3 ^ v2 ^ (unint64_t)-[NSMutableArray hash](self->_perDrbConfigs, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 24);
  if ((v6 & 2) != 0)
  {
    self->_integrityAlgo = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v6 = *((_BYTE *)v4 + 24);
  }
  if ((v6 & 1) != 0)
  {
    self->_cipheringAlgo = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[DrbConfig addPerDrbConfig:](self, "addPerDrbConfig:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (NSMutableArray)perDrbConfigs
{
  return self->_perDrbConfigs;
}

- (void)setPerDrbConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_perDrbConfigs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perDrbConfigs, 0);
}

@end

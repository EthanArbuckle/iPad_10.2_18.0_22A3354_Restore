@implementation NSSLegalDocumentsReqMsg

- (void)clearLegacyPreferredLanguages
{
  -[NSMutableArray removeAllObjects](self->_legacyPreferredLanguages, "removeAllObjects");
}

- (void)addLegacyPreferredLanguages:(id)a3
{
  id v4;
  NSMutableArray *legacyPreferredLanguages;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  legacyPreferredLanguages = self->_legacyPreferredLanguages;
  v8 = v4;
  if (!legacyPreferredLanguages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_legacyPreferredLanguages;
    self->_legacyPreferredLanguages = v6;

    v4 = v8;
    legacyPreferredLanguages = self->_legacyPreferredLanguages;
  }
  -[NSMutableArray addObject:](legacyPreferredLanguages, "addObject:", v4);

}

- (unint64_t)legacyPreferredLanguagesCount
{
  return -[NSMutableArray count](self->_legacyPreferredLanguages, "count");
}

- (id)legacyPreferredLanguagesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_legacyPreferredLanguages, "objectAtIndex:", a3);
}

+ (Class)legacyPreferredLanguagesType
{
  return (Class)objc_opt_class();
}

- (void)clearPreferredLanguages
{
  -[NSMutableArray removeAllObjects](self->_preferredLanguages, "removeAllObjects");
}

- (void)addPreferredLanguages:(id)a3
{
  id v4;
  NSMutableArray *preferredLanguages;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  preferredLanguages = self->_preferredLanguages;
  v8 = v4;
  if (!preferredLanguages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_preferredLanguages;
    self->_preferredLanguages = v6;

    v4 = v8;
    preferredLanguages = self->_preferredLanguages;
  }
  -[NSMutableArray addObject:](preferredLanguages, "addObject:", v4);

}

- (unint64_t)preferredLanguagesCount
{
  return -[NSMutableArray count](self->_preferredLanguages, "count");
}

- (id)preferredLanguagesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_preferredLanguages, "objectAtIndex:", a3);
}

+ (Class)preferredLanguagesType
{
  return (Class)objc_opt_class();
}

- (void)setAddUrlToSAR:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_addUrlToSAR = a3;
}

- (void)setHasAddUrlToSAR:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAddUrlToSAR
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setFetchBuiltinApps:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_fetchBuiltinApps = a3;
}

- (void)setHasFetchBuiltinApps:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFetchBuiltinApps
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)NSSLegalDocumentsReqMsg;
  -[NSSLegalDocumentsReqMsg description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSLegalDocumentsReqMsg dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *legacyPreferredLanguages;
  NSMutableArray *preferredLanguages;
  char has;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  legacyPreferredLanguages = self->_legacyPreferredLanguages;
  if (legacyPreferredLanguages)
    objc_msgSend(v3, "setObject:forKey:", legacyPreferredLanguages, CFSTR("legacyPreferredLanguages"));
  preferredLanguages = self->_preferredLanguages;
  if (preferredLanguages)
    objc_msgSend(v4, "setObject:forKey:", preferredLanguages, CFSTR("preferredLanguages"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_addUrlToSAR);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("addUrlToSAR"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_fetchBuiltinApps);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("fetchBuiltinApps"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSLegalDocumentsReqMsgReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  char has;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = self->_legacyPreferredLanguages;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_preferredLanguages;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  char has;
  _BYTE *v13;

  v13 = a3;
  if (-[NSSLegalDocumentsReqMsg legacyPreferredLanguagesCount](self, "legacyPreferredLanguagesCount"))
  {
    objc_msgSend(v13, "clearLegacyPreferredLanguages");
    v4 = -[NSSLegalDocumentsReqMsg legacyPreferredLanguagesCount](self, "legacyPreferredLanguagesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[NSSLegalDocumentsReqMsg legacyPreferredLanguagesAtIndex:](self, "legacyPreferredLanguagesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addLegacyPreferredLanguages:", v7);

      }
    }
  }
  if (-[NSSLegalDocumentsReqMsg preferredLanguagesCount](self, "preferredLanguagesCount"))
  {
    objc_msgSend(v13, "clearPreferredLanguages");
    v8 = -[NSSLegalDocumentsReqMsg preferredLanguagesCount](self, "preferredLanguagesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[NSSLegalDocumentsReqMsg preferredLanguagesAtIndex:](self, "preferredLanguagesAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addPreferredLanguages:", v11);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v13[24] = self->_addUrlToSAR;
    v13[28] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v13[25] = self->_fetchBuiltinApps;
    v13[28] |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  char has;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = self->_legacyPreferredLanguages;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v5, "addLegacyPreferredLanguages:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = self->_preferredLanguages;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend(v5, "addPreferredLanguages:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v14);
  }

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v5[24] = self->_addUrlToSAR;
    v5[28] |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[25] = self->_fetchBuiltinApps;
    v5[28] |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *legacyPreferredLanguages;
  NSMutableArray *preferredLanguages;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  legacyPreferredLanguages = self->_legacyPreferredLanguages;
  if ((unint64_t)legacyPreferredLanguages | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](legacyPreferredLanguages, "isEqual:"))
      goto LABEL_16;
  }
  preferredLanguages = self->_preferredLanguages;
  if ((unint64_t)preferredLanguages | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](preferredLanguages, "isEqual:"))
      goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
      goto LABEL_16;
    if (self->_addUrlToSAR)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_16;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_16;
  }
  v7 = (*((_BYTE *)v4 + 28) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) != 0)
    {
      if (self->_fetchBuiltinApps)
      {
        if (!*((_BYTE *)v4 + 25))
          goto LABEL_16;
      }
      else if (*((_BYTE *)v4 + 25))
      {
        goto LABEL_16;
      }
      v7 = 1;
      goto LABEL_17;
    }
LABEL_16:
    v7 = 0;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSMutableArray hash](self->_legacyPreferredLanguages, "hash");
  v4 = -[NSMutableArray hash](self->_preferredLanguages, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_addUrlToSAR;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_fetchBuiltinApps;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        -[NSSLegalDocumentsReqMsg addLegacyPreferredLanguages:](self, "addLegacyPreferredLanguages:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = *((id *)v4 + 2);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        -[NSSLegalDocumentsReqMsg addPreferredLanguages:](self, "addPreferredLanguages:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v12);
  }

  v15 = *((_BYTE *)v4 + 28);
  if ((v15 & 1) != 0)
  {
    self->_addUrlToSAR = *((_BYTE *)v4 + 24);
    *(_BYTE *)&self->_has |= 1u;
    v15 = *((_BYTE *)v4 + 28);
  }
  if ((v15 & 2) != 0)
  {
    self->_fetchBuiltinApps = *((_BYTE *)v4 + 25);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSMutableArray)legacyPreferredLanguages
{
  return self->_legacyPreferredLanguages;
}

- (void)setLegacyPreferredLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_legacyPreferredLanguages, a3);
}

- (NSMutableArray)preferredLanguages
{
  return self->_preferredLanguages;
}

- (void)setPreferredLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_preferredLanguages, a3);
}

- (BOOL)addUrlToSAR
{
  return self->_addUrlToSAR;
}

- (BOOL)fetchBuiltinApps
{
  return self->_fetchBuiltinApps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_legacyPreferredLanguages, 0);
}

@end

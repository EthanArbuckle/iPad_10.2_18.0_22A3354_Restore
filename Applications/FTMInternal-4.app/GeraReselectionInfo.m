@implementation GeraReselectionInfo

- (void)setTReselection:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_tReselection = a3;
}

- (void)setHasTReselection:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTReselection
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSfMedium:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_sfMedium = a3;
}

- (void)setHasSfMedium:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSfMedium
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSfHigh:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sfHigh = a3;
}

- (void)setHasSfHigh:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSfHigh
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearGeraNcells
{
  -[NSMutableArray removeAllObjects](self->_geraNcells, "removeAllObjects");
}

- (void)addGeraNcell:(id)a3
{
  id v4;
  NSMutableArray *geraNcells;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  geraNcells = self->_geraNcells;
  v8 = v4;
  if (!geraNcells)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_geraNcells;
    self->_geraNcells = v6;

    v4 = v8;
    geraNcells = self->_geraNcells;
  }
  -[NSMutableArray addObject:](geraNcells, "addObject:", v4);

}

- (unint64_t)geraNcellsCount
{
  return (unint64_t)-[NSMutableArray count](self->_geraNcells, "count");
}

- (id)geraNcellAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_geraNcells, "objectAtIndex:", a3);
}

+ (Class)geraNcellType
{
  return (Class)objc_opt_class(GeraNeighborCell, a2);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GeraReselectionInfo;
  v3 = -[GeraReselectionInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GeraReselectionInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  id v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_tReselection));
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("t_reselection"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sfMedium));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("sf_medium"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_sfHigh));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sf_high"));

  }
LABEL_5:
  if (-[NSMutableArray count](self->_geraNcells, "count"))
  {
    v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_geraNcells, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = self->_geraNcells;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation", (_QWORD)v16));
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("gera_ncell"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10002EBD8(self, (uint64_t)a3);
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
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_tReselection, 1);
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field(v5, self->_sfMedium, 2);
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_4:
    PBDataWriterWriteUint32Field(v5, self->_sfHigh, 3);
LABEL_5:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_geraNcells;
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
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), 4);
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
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_11:
    v4[5] = self->_sfMedium;
    *((_BYTE *)v4 + 28) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v4[6] = self->_tReselection;
  *((_BYTE *)v4 + 28) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    v4[4] = self->_sfHigh;
    *((_BYTE *)v4 + 28) |= 1u;
  }
LABEL_5:
  v10 = v4;
  if (-[GeraReselectionInfo geraNcellsCount](self, "geraNcellsCount"))
  {
    objc_msgSend(v10, "clearGeraNcells");
    v6 = -[GeraReselectionInfo geraNcellsCount](self, "geraNcellsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[GeraReselectionInfo geraNcellAtIndex:](self, "geraNcellAtIndex:", i));
        objc_msgSend(v10, "addGeraNcell:", v9);

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
  if ((has & 4) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_tReselection;
    *((_BYTE *)v5 + 28) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 5) = self->_sfMedium;
  *((_BYTE *)v5 + 28) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 4) = self->_sfHigh;
    *((_BYTE *)v5 + 28) |= 1u;
  }
LABEL_5:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_geraNcells;
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
        objc_msgSend(v6, "addGeraNcell:", v13);

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
  NSMutableArray *geraNcells;
  unsigned __int8 v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) == 0 || self->_tReselection != *((_DWORD *)v4 + 6))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 4) != 0)
  {
LABEL_19:
    v7 = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_sfMedium != *((_DWORD *)v4 + 5))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_sfHigh != *((_DWORD *)v4 + 4))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_19;
  }
  geraNcells = self->_geraNcells;
  if ((unint64_t)geraNcells | *((_QWORD *)v4 + 1))
    v7 = -[NSMutableArray isEqual:](geraNcells, "isEqual:");
  else
    v7 = 1;
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4 ^ (unint64_t)-[NSMutableArray hash](self->_geraNcells, "hash");
  }
  v2 = 2654435761 * self->_tReselection;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_sfMedium;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_sfHigh;
  return v3 ^ v2 ^ v4 ^ (unint64_t)-[NSMutableArray hash](self->_geraNcells, "hash");
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
  v6 = *((_BYTE *)v4 + 28);
  if ((v6 & 4) != 0)
  {
    self->_tReselection = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 4u;
    v6 = *((_BYTE *)v4 + 28);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_sfMedium = *((_DWORD *)v4 + 5);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_4:
    self->_sfHigh = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 1);
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
        -[GeraReselectionInfo addGeraNcell:](self, "addGeraNcell:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (unsigned)tReselection
{
  return self->_tReselection;
}

- (unsigned)sfMedium
{
  return self->_sfMedium;
}

- (unsigned)sfHigh
{
  return self->_sfHigh;
}

- (NSMutableArray)geraNcells
{
  return self->_geraNcells;
}

- (void)setGeraNcells:(id)a3
{
  objc_storeStrong((id *)&self->_geraNcells, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geraNcells, 0);
}

@end

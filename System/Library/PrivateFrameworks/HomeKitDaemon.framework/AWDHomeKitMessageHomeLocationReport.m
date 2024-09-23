@implementation AWDHomeKitMessageHomeLocationReport

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearRawLocations
{
  -[NSMutableArray removeAllObjects](self->_rawLocations, "removeAllObjects");
}

- (void)addRawLocations:(id)a3
{
  id v4;
  NSMutableArray *rawLocations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  rawLocations = self->_rawLocations;
  v8 = v4;
  if (!rawLocations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_rawLocations;
    self->_rawLocations = v6;

    v4 = v8;
    rawLocations = self->_rawLocations;
  }
  -[NSMutableArray addObject:](rawLocations, "addObject:", v4);

}

- (unint64_t)rawLocationsCount
{
  return -[NSMutableArray count](self->_rawLocations, "count");
}

- (id)rawLocationsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rawLocations, "objectAtIndex:", a3);
}

- (BOOL)hasSelectedHomeLocation
{
  return self->_selectedHomeLocation != 0;
}

- (void)setNumIterationToConverge:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numIterationToConverge = a3;
}

- (void)setHasNumIterationToConverge:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumIterationToConverge
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasNearestLOI
{
  return self->_nearestLOI != 0;
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
  v8.super_class = (Class)AWDHomeKitMessageHomeLocationReport;
  -[AWDHomeKitMessageHomeLocationReport description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDHomeKitMessageHomeLocationReport dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  AWDHomeKitMessageLocation *selectedHomeLocation;
  void *v13;
  void *v14;
  AWDHomeKitMessageLocation *nearestLOI;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  }
  if (-[NSMutableArray count](self->_rawLocations, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_rawLocations, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_rawLocations;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v18);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }

    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("rawLocations"));
  }
  selectedHomeLocation = self->_selectedHomeLocation;
  if (selectedHomeLocation)
  {
    -[AWDHomeKitMessageLocation dictionaryRepresentation](selectedHomeLocation, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("selectedHomeLocation"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numIterationToConverge);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("numIterationToConverge"));

  }
  nearestLOI = self->_nearestLOI;
  if (nearestLOI)
  {
    -[AWDHomeKitMessageLocation dictionaryRepresentation](nearestLOI, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("nearestLOI"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v24;
  AWDHomeKitMessageLocation *v25;
  uint64_t v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;

  v4 = (int *)MEMORY[0x24BE7AF60];
  v5 = (int *)MEMORY[0x24BE7AF50];
  v6 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x24BE7AF50]))
  {
    v8 = (int *)MEMORY[0x24BE7AF30];
    while (!*((_BYTE *)a3 + *v6))
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        v15 = v10++ >= 9;
        if (v15)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        break;
      switch((v11 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)&self->_has |= 1u;
          while (1)
          {
            v21 = *v4;
            v22 = *(_QWORD *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + *v5))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v22);
            *(_QWORD *)((char *)a3 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_43;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_45;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_43:
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_45:
          self->_timestamp = v20;
          goto LABEL_50;
        case 2u:
          v25 = objc_alloc_init(AWDHomeKitMessageLocation);
          -[AWDHomeKitMessageHomeLocationReport addRawLocations:](self, "addRawLocations:", v25);
          goto LABEL_39;
        case 3u:
          v25 = objc_alloc_init(AWDHomeKitMessageLocation);
          v26 = 40;
          goto LABEL_38;
        case 4u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          *(_BYTE *)&self->_has |= 2u;
          while (2)
          {
            v30 = *v4;
            v31 = *(_QWORD *)((char *)a3 + v30);
            if (v31 == -1 || v31 >= *(_QWORD *)((char *)a3 + *v5))
            {
              *((_BYTE *)a3 + *v6) = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v31);
              *(_QWORD *)((char *)a3 + v30) = v31 + 1;
              v29 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                v15 = v28++ >= 9;
                if (v15)
                {
                  LODWORD(v29) = 0;
                  goto LABEL_49;
                }
                continue;
              }
            }
            break;
          }
          if (*((_BYTE *)a3 + *v6))
            LODWORD(v29) = 0;
LABEL_49:
          self->_numIterationToConverge = v29;
          goto LABEL_50;
        case 5u:
          v25 = objc_alloc_init(AWDHomeKitMessageLocation);
          v26 = 16;
LABEL_38:
          objc_storeStrong((id *)((char *)&self->super.super.isa + v26), v25);
LABEL_39:
          if (!PBReaderPlaceMark()
            || (AWDHomeKitMessageLocationReadFrom((uint64_t)v25, (uint64_t)a3) & 1) == 0)
          {

            LOBYTE(v24) = 0;
            return v24;
          }
          PBReaderRecallMark();

LABEL_50:
          if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
            goto LABEL_51;
          break;
        default:
          v24 = PBReaderSkipValueWithTag();
          if (!v24)
            return v24;
          goto LABEL_50;
      }
    }
  }
LABEL_51:
  LOBYTE(v24) = *((_BYTE *)a3 + *v6) == 0;
  return v24;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_rawLocations;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  if (self->_selectedHomeLocation)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_nearestLOI)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_timestamp;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  v10 = v4;
  if (-[AWDHomeKitMessageHomeLocationReport rawLocationsCount](self, "rawLocationsCount"))
  {
    objc_msgSend(v10, "clearRawLocations");
    v5 = -[AWDHomeKitMessageHomeLocationReport rawLocationsCount](self, "rawLocationsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[AWDHomeKitMessageHomeLocationReport rawLocationsAtIndex:](self, "rawLocationsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addRawLocations:", v8);

      }
    }
  }
  if (self->_selectedHomeLocation)
    objc_msgSend(v10, "setSelectedHomeLocation:");
  v9 = v10;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v10 + 6) = self->_numIterationToConverge;
    *((_BYTE *)v10 + 48) |= 2u;
  }
  if (self->_nearestLOI)
  {
    objc_msgSend(v10, "setNearestLOI:");
    v9 = v10;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_rawLocations;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v6, "addRawLocations:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v13 = -[AWDHomeKitMessageLocation copyWithZone:](self->_selectedHomeLocation, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v13;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_numIterationToConverge;
    *(_BYTE *)(v6 + 48) |= 2u;
  }
  v15 = -[AWDHomeKitMessageLocation copyWithZone:](self->_nearestLOI, "copyWithZone:", a3, (_QWORD)v18);
  v16 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v15;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *rawLocations;
  AWDHomeKitMessageLocation *selectedHomeLocation;
  AWDHomeKitMessageLocation *nearestLOI;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_timestamp != *((_QWORD *)v4 + 1))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  rawLocations = self->_rawLocations;
  if ((unint64_t)rawLocations | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](rawLocations, "isEqual:"))
  {
    goto LABEL_18;
  }
  selectedHomeLocation = self->_selectedHomeLocation;
  if ((unint64_t)selectedHomeLocation | *((_QWORD *)v4 + 5))
  {
    if (!-[AWDHomeKitMessageLocation isEqual:](selectedHomeLocation, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_numIterationToConverge != *((_DWORD *)v4 + 6))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
    goto LABEL_18;
  }
  nearestLOI = self->_nearestLOI;
  if ((unint64_t)nearestLOI | *((_QWORD *)v4 + 2))
    v8 = -[AWDHomeKitMessageLocation isEqual:](nearestLOI, "isEqual:");
  else
    v8 = 1;
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_rawLocations, "hash");
  v5 = -[AWDHomeKitMessageLocation hash](self->_selectedHomeLocation, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_numIterationToConverge;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[AWDHomeKitMessageLocation hash](self->_nearestLOI, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  AWDHomeKitMessageLocation *selectedHomeLocation;
  uint64_t v12;
  AWDHomeKitMessageLocation *nearestLOI;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = *((id *)v4 + 4);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        -[AWDHomeKitMessageHomeLocationReport addRawLocations:](self, "addRawLocations:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  selectedHomeLocation = self->_selectedHomeLocation;
  v12 = *((_QWORD *)v5 + 5);
  if (selectedHomeLocation)
  {
    if (v12)
      -[AWDHomeKitMessageLocation mergeFrom:](selectedHomeLocation, "mergeFrom:");
  }
  else if (v12)
  {
    -[AWDHomeKitMessageHomeLocationReport setSelectedHomeLocation:](self, "setSelectedHomeLocation:");
  }
  if ((*((_BYTE *)v5 + 48) & 2) != 0)
  {
    self->_numIterationToConverge = *((_DWORD *)v5 + 6);
    *(_BYTE *)&self->_has |= 2u;
  }
  nearestLOI = self->_nearestLOI;
  v14 = *((_QWORD *)v5 + 2);
  if (nearestLOI)
  {
    if (v14)
      -[AWDHomeKitMessageLocation mergeFrom:](nearestLOI, "mergeFrom:");
  }
  else if (v14)
  {
    -[AWDHomeKitMessageHomeLocationReport setNearestLOI:](self, "setNearestLOI:");
  }

}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)rawLocations
{
  return self->_rawLocations;
}

- (void)setRawLocations:(id)a3
{
  objc_storeStrong((id *)&self->_rawLocations, a3);
}

- (AWDHomeKitMessageLocation)selectedHomeLocation
{
  return self->_selectedHomeLocation;
}

- (void)setSelectedHomeLocation:(id)a3
{
  objc_storeStrong((id *)&self->_selectedHomeLocation, a3);
}

- (unsigned)numIterationToConverge
{
  return self->_numIterationToConverge;
}

- (AWDHomeKitMessageLocation)nearestLOI
{
  return self->_nearestLOI;
}

- (void)setNearestLOI:(id)a3
{
  objc_storeStrong((id *)&self->_nearestLOI, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedHomeLocation, 0);
  objc_storeStrong((id *)&self->_rawLocations, 0);
  objc_storeStrong((id *)&self->_nearestLOI, 0);
}

+ (Class)rawLocationsType
{
  return (Class)objc_opt_class();
}

@end

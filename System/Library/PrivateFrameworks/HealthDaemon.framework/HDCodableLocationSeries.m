@implementation HDCodableLocationSeries

- (BOOL)applyToObject:(id)a3
{
  id v4;
  void *v5;
  int v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[HDCodableLocationSeries sample](self, "sample"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "applyToObject:", v4),
        v5,
        v6))
  {
    objc_msgSend(v4, "_setFrozen:", -[HDCodableLocationSeries frozen](self, "frozen"));
    objc_msgSend(v4, "_setCodableWorkoutRoute:", self);
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setFrozen:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_frozen = a3;
}

- (void)setHasFrozen:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFrozen
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasContinuationUUID
{
  return self->_continuationUUID != 0;
}

- (void)setFinal:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_final = a3;
}

- (void)setHasFinal:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFinal
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearLocationDatas
{
  -[NSMutableArray removeAllObjects](self->_locationDatas, "removeAllObjects");
}

- (void)addLocationData:(id)a3
{
  id v4;
  NSMutableArray *locationDatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  locationDatas = self->_locationDatas;
  v8 = v4;
  if (!locationDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_locationDatas;
    self->_locationDatas = v6;

    v4 = v8;
    locationDatas = self->_locationDatas;
  }
  -[NSMutableArray addObject:](locationDatas, "addObject:", v4);

}

- (unint64_t)locationDatasCount
{
  return -[NSMutableArray count](self->_locationDatas, "count");
}

- (id)locationDataAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_locationDatas, "objectAtIndex:", a3);
}

+ (Class)locationDataType
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableLocationSeries;
  -[HDCodableLocationSeries description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableLocationSeries dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HDCodableSample *sample;
  void *v5;
  void *v6;
  NSData *continuationUUID;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  if (sample)
  {
    -[HDCodableSample dictionaryRepresentation](sample, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sample"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_frozen);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("frozen"));

  }
  continuationUUID = self->_continuationUUID;
  if (continuationUUID)
    objc_msgSend(v3, "setObject:forKey:", continuationUUID, CFSTR("continuationUUID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_final);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("final"));

  }
  if (-[NSMutableArray count](self->_locationDatas, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_locationDatas, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = self->_locationDatas;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("locationData"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableLocationSeriesReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_sample)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_continuationUUID)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_locationDatas;
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

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  _BYTE *v9;

  v4 = a3;
  v9 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[33] = self->_frozen;
    v4[36] |= 2u;
  }
  if (self->_continuationUUID)
  {
    objc_msgSend(v9, "setContinuationUUID:");
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[32] = self->_final;
    v4[36] |= 1u;
  }
  if (-[HDCodableLocationSeries locationDatasCount](self, "locationDatasCount"))
  {
    objc_msgSend(v9, "clearLocationDatas");
    v5 = -[HDCodableLocationSeries locationDatasCount](self, "locationDatasCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[HDCodableLocationSeries locationDataAtIndex:](self, "locationDataAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addLocationData:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 33) = self->_frozen;
    *(_BYTE *)(v5 + 36) |= 2u;
  }
  v8 = -[NSData copyWithZone:](self->_continuationUUID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_final;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_locationDatas;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend((id)v5, "addLocationData:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSample *sample;
  char has;
  char v7;
  NSData *continuationUUID;
  char v9;
  NSMutableArray *locationDatas;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  sample = self->_sample;
  if ((unint64_t)sample | *((_QWORD *)v4 + 3))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:"))
      goto LABEL_19;
  }
  has = (char)self->_has;
  v7 = *((_BYTE *)v4 + 36);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 2) == 0)
      goto LABEL_19;
    if (self->_frozen)
    {
      if (!*((_BYTE *)v4 + 33))
        goto LABEL_19;
    }
    else if (*((_BYTE *)v4 + 33))
    {
      goto LABEL_19;
    }
  }
  else if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    goto LABEL_19;
  }
  continuationUUID = self->_continuationUUID;
  if ((unint64_t)continuationUUID | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](continuationUUID, "isEqual:"))
      goto LABEL_19;
    has = (char)self->_has;
    v7 = *((_BYTE *)v4 + 36);
  }
  if ((has & 1) == 0)
  {
    if ((v7 & 1) == 0)
      goto LABEL_25;
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  if ((v7 & 1) == 0)
    goto LABEL_19;
  if (!self->_final)
  {
    if (!*((_BYTE *)v4 + 32))
      goto LABEL_25;
    goto LABEL_19;
  }
  if (!*((_BYTE *)v4 + 32))
    goto LABEL_19;
LABEL_25:
  locationDatas = self->_locationDatas;
  if ((unint64_t)locationDatas | *((_QWORD *)v4 + 2))
    v9 = -[NSMutableArray isEqual:](locationDatas, "isEqual:");
  else
    v9 = 1;
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[HDCodableSample hash](self->_sample, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_frozen;
  else
    v4 = 0;
  v5 = -[NSData hash](self->_continuationUUID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_final;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSMutableArray hash](self->_locationDatas, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableSample *sample;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sample = self->_sample;
  v6 = *((_QWORD *)v4 + 3);
  if (sample)
  {
    if (v6)
      -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else if (v6)
  {
    -[HDCodableLocationSeries setSample:](self, "setSample:");
  }
  if ((*((_BYTE *)v4 + 36) & 2) != 0)
  {
    self->_frozen = *((_BYTE *)v4 + 33);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 1))
    -[HDCodableLocationSeries setContinuationUUID:](self, "setContinuationUUID:");
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_final = *((_BYTE *)v4 + 32);
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
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[HDCodableLocationSeries addLocationData:](self, "addLocationData:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (BOOL)frozen
{
  return self->_frozen;
}

- (NSData)continuationUUID
{
  return self->_continuationUUID;
}

- (void)setContinuationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_continuationUUID, a3);
}

- (BOOL)final
{
  return self->_final;
}

- (NSMutableArray)locationDatas
{
  return self->_locationDatas;
}

- (void)setLocationDatas:(id)a3
{
  objc_storeStrong((id *)&self->_locationDatas, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_locationDatas, 0);
  objc_storeStrong((id *)&self->_continuationUUID, 0);
}

@end

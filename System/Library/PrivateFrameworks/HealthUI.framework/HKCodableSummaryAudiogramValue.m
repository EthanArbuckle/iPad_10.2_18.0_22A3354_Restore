@implementation HKCodableSummaryAudiogramValue

- (BOOL)hasAverageLeftEarSensitivity
{
  return self->_averageLeftEarSensitivity != 0;
}

- (BOOL)hasAverageRightEarSensitivity
{
  return self->_averageRightEarSensitivity != 0;
}

- (BOOL)hasMinimumSensitivity
{
  return self->_minimumSensitivity != 0;
}

- (BOOL)hasMaximumSensitivity
{
  return self->_maximumSensitivity != 0;
}

- (void)setTimestampData:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestampData = a3;
}

- (void)setHasTimestampData:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampData
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearSensitivityPoints
{
  -[NSMutableArray removeAllObjects](self->_sensitivityPoints, "removeAllObjects");
}

- (void)addSensitivityPoints:(id)a3
{
  id v4;
  NSMutableArray *sensitivityPoints;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  sensitivityPoints = self->_sensitivityPoints;
  v8 = v4;
  if (!sensitivityPoints)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_sensitivityPoints;
    self->_sensitivityPoints = v6;

    v4 = v8;
    sensitivityPoints = self->_sensitivityPoints;
  }
  -[NSMutableArray addObject:](sensitivityPoints, "addObject:", v4);

}

- (unint64_t)sensitivityPointsCount
{
  return -[NSMutableArray count](self->_sensitivityPoints, "count");
}

- (id)sensitivityPointsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_sensitivityPoints, "objectAtIndex:", a3);
}

+ (Class)sensitivityPointsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)HKCodableSummaryAudiogramValue;
  -[HKCodableSummaryAudiogramValue description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSummaryAudiogramValue dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HKCodableQuantity *averageLeftEarSensitivity;
  void *v5;
  HKCodableQuantity *averageRightEarSensitivity;
  void *v7;
  HKCodableQuantity *minimumSensitivity;
  void *v9;
  HKCodableQuantity *maximumSensitivity;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  averageLeftEarSensitivity = self->_averageLeftEarSensitivity;
  if (averageLeftEarSensitivity)
  {
    -[HKCodableQuantity dictionaryRepresentation](averageLeftEarSensitivity, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("averageLeftEarSensitivity"));

  }
  averageRightEarSensitivity = self->_averageRightEarSensitivity;
  if (averageRightEarSensitivity)
  {
    -[HKCodableQuantity dictionaryRepresentation](averageRightEarSensitivity, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("averageRightEarSensitivity"));

  }
  minimumSensitivity = self->_minimumSensitivity;
  if (minimumSensitivity)
  {
    -[HKCodableQuantity dictionaryRepresentation](minimumSensitivity, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("minimumSensitivity"));

  }
  maximumSensitivity = self->_maximumSensitivity;
  if (maximumSensitivity)
  {
    -[HKCodableQuantity dictionaryRepresentation](maximumSensitivity, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("maximumSensitivity"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestampData);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("timestampData"));

  }
  if (-[NSMutableArray count](self->_sensitivityPoints, "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_sensitivityPoints, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = self->_sensitivityPoints;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v16);
    }

    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("sensitivityPoints"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryAudiogramValueReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_averageLeftEarSensitivity)
    PBDataWriterWriteSubmessage();
  if (self->_averageRightEarSensitivity)
    PBDataWriterWriteSubmessage();
  if (self->_minimumSensitivity)
    PBDataWriterWriteSubmessage();
  if (self->_maximumSensitivity)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_sensitivityPoints;
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
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_averageLeftEarSensitivity)
  {
    objc_msgSend(v4, "setAverageLeftEarSensitivity:");
    v4 = v9;
  }
  if (self->_averageRightEarSensitivity)
  {
    objc_msgSend(v9, "setAverageRightEarSensitivity:");
    v4 = v9;
  }
  if (self->_minimumSensitivity)
  {
    objc_msgSend(v9, "setMinimumSensitivity:");
    v4 = v9;
  }
  if (self->_maximumSensitivity)
  {
    objc_msgSend(v9, "setMaximumSensitivity:");
    v4 = v9;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_timestampData;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  if (-[HKCodableSummaryAudiogramValue sensitivityPointsCount](self, "sensitivityPointsCount"))
  {
    objc_msgSend(v9, "clearSensitivityPoints");
    v5 = -[HKCodableSummaryAudiogramValue sensitivityPointsCount](self, "sensitivityPointsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[HKCodableSummaryAudiogramValue sensitivityPointsAtIndex:](self, "sensitivityPointsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addSensitivityPoints:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HKCodableQuantity copyWithZone:](self->_averageLeftEarSensitivity, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[HKCodableQuantity copyWithZone:](self->_averageRightEarSensitivity, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[HKCodableQuantity copyWithZone:](self->_minimumSensitivity, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[HKCodableQuantity copyWithZone:](self->_maximumSensitivity, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_timestampData;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_sensitivityPoints;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend((id)v5, "addSensitivityPoints:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v16);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableQuantity *averageLeftEarSensitivity;
  HKCodableQuantity *averageRightEarSensitivity;
  HKCodableQuantity *minimumSensitivity;
  HKCodableQuantity *maximumSensitivity;
  NSMutableArray *sensitivityPoints;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  averageLeftEarSensitivity = self->_averageLeftEarSensitivity;
  if ((unint64_t)averageLeftEarSensitivity | *((_QWORD *)v4 + 2))
  {
    if (!-[HKCodableQuantity isEqual:](averageLeftEarSensitivity, "isEqual:"))
      goto LABEL_17;
  }
  averageRightEarSensitivity = self->_averageRightEarSensitivity;
  if ((unint64_t)averageRightEarSensitivity | *((_QWORD *)v4 + 3))
  {
    if (!-[HKCodableQuantity isEqual:](averageRightEarSensitivity, "isEqual:"))
      goto LABEL_17;
  }
  minimumSensitivity = self->_minimumSensitivity;
  if ((unint64_t)minimumSensitivity | *((_QWORD *)v4 + 5))
  {
    if (!-[HKCodableQuantity isEqual:](minimumSensitivity, "isEqual:"))
      goto LABEL_17;
  }
  maximumSensitivity = self->_maximumSensitivity;
  if ((unint64_t)maximumSensitivity | *((_QWORD *)v4 + 4))
  {
    if (!-[HKCodableQuantity isEqual:](maximumSensitivity, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_timestampData != *((double *)v4 + 1))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  sensitivityPoints = self->_sensitivityPoints;
  if ((unint64_t)sensitivityPoints | *((_QWORD *)v4 + 6))
    v10 = -[NSMutableArray isEqual:](sensitivityPoints, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  double timestampData;
  double v9;
  long double v10;
  double v11;

  v3 = -[HKCodableQuantity hash](self->_averageLeftEarSensitivity, "hash");
  v4 = -[HKCodableQuantity hash](self->_averageRightEarSensitivity, "hash");
  v5 = -[HKCodableQuantity hash](self->_minimumSensitivity, "hash");
  v6 = -[HKCodableQuantity hash](self->_maximumSensitivity, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    timestampData = self->_timestampData;
    v9 = -timestampData;
    if (timestampData >= 0.0)
      v9 = self->_timestampData;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSMutableArray hash](self->_sensitivityPoints, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HKCodableQuantity *averageLeftEarSensitivity;
  uint64_t v6;
  HKCodableQuantity *averageRightEarSensitivity;
  uint64_t v8;
  HKCodableQuantity *minimumSensitivity;
  uint64_t v10;
  HKCodableQuantity *maximumSensitivity;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  averageLeftEarSensitivity = self->_averageLeftEarSensitivity;
  v6 = *((_QWORD *)v4 + 2);
  if (averageLeftEarSensitivity)
  {
    if (v6)
      -[HKCodableQuantity mergeFrom:](averageLeftEarSensitivity, "mergeFrom:");
  }
  else if (v6)
  {
    -[HKCodableSummaryAudiogramValue setAverageLeftEarSensitivity:](self, "setAverageLeftEarSensitivity:");
  }
  averageRightEarSensitivity = self->_averageRightEarSensitivity;
  v8 = *((_QWORD *)v4 + 3);
  if (averageRightEarSensitivity)
  {
    if (v8)
      -[HKCodableQuantity mergeFrom:](averageRightEarSensitivity, "mergeFrom:");
  }
  else if (v8)
  {
    -[HKCodableSummaryAudiogramValue setAverageRightEarSensitivity:](self, "setAverageRightEarSensitivity:");
  }
  minimumSensitivity = self->_minimumSensitivity;
  v10 = *((_QWORD *)v4 + 5);
  if (minimumSensitivity)
  {
    if (v10)
      -[HKCodableQuantity mergeFrom:](minimumSensitivity, "mergeFrom:");
  }
  else if (v10)
  {
    -[HKCodableSummaryAudiogramValue setMinimumSensitivity:](self, "setMinimumSensitivity:");
  }
  maximumSensitivity = self->_maximumSensitivity;
  v12 = *((_QWORD *)v4 + 4);
  if (maximumSensitivity)
  {
    if (v12)
      -[HKCodableQuantity mergeFrom:](maximumSensitivity, "mergeFrom:");
  }
  else if (v12)
  {
    -[HKCodableSummaryAudiogramValue setMaximumSensitivity:](self, "setMaximumSensitivity:");
  }
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_timestampData = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = *((id *)v4 + 6);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[HKCodableSummaryAudiogramValue addSensitivityPoints:](self, "addSensitivityPoints:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

}

- (HKCodableQuantity)averageLeftEarSensitivity
{
  return self->_averageLeftEarSensitivity;
}

- (void)setAverageLeftEarSensitivity:(id)a3
{
  objc_storeStrong((id *)&self->_averageLeftEarSensitivity, a3);
}

- (HKCodableQuantity)averageRightEarSensitivity
{
  return self->_averageRightEarSensitivity;
}

- (void)setAverageRightEarSensitivity:(id)a3
{
  objc_storeStrong((id *)&self->_averageRightEarSensitivity, a3);
}

- (HKCodableQuantity)minimumSensitivity
{
  return self->_minimumSensitivity;
}

- (void)setMinimumSensitivity:(id)a3
{
  objc_storeStrong((id *)&self->_minimumSensitivity, a3);
}

- (HKCodableQuantity)maximumSensitivity
{
  return self->_maximumSensitivity;
}

- (void)setMaximumSensitivity:(id)a3
{
  objc_storeStrong((id *)&self->_maximumSensitivity, a3);
}

- (double)timestampData
{
  return self->_timestampData;
}

- (NSMutableArray)sensitivityPoints
{
  return self->_sensitivityPoints;
}

- (void)setSensitivityPoints:(id)a3
{
  objc_storeStrong((id *)&self->_sensitivityPoints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensitivityPoints, 0);
  objc_storeStrong((id *)&self->_minimumSensitivity, 0);
  objc_storeStrong((id *)&self->_maximumSensitivity, 0);
  objc_storeStrong((id *)&self->_averageRightEarSensitivity, 0);
  objc_storeStrong((id *)&self->_averageLeftEarSensitivity, 0);
}

@end

@implementation BMPBMicroLocationRestrictedLocalizationEvent

- (void)setAbsoluteTimeStamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_absoluteTimeStamp = a3;
}

- (void)setHasAbsoluteTimeStamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimeStamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasClientBundleId
{
  return self->_clientBundleId != 0;
}

- (BOOL)hasMaxProbabilityLabel
{
  return self->_maxProbabilityLabel != 0;
}

- (void)setMaxProbability:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_maxProbability = a3;
}

- (void)setHasMaxProbability:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMaxProbability
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearProbabilityVectors
{
  -[NSMutableArray removeAllObjects](self->_probabilityVectors, "removeAllObjects");
}

- (void)addProbabilityVector:(id)a3
{
  id v4;
  NSMutableArray *probabilityVectors;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  probabilityVectors = self->_probabilityVectors;
  v8 = v4;
  if (!probabilityVectors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_probabilityVectors;
    self->_probabilityVectors = v6;

    v4 = v8;
    probabilityVectors = self->_probabilityVectors;
  }
  -[NSMutableArray addObject:](probabilityVectors, "addObject:", v4);

}

- (unint64_t)probabilityVectorsCount
{
  return -[NSMutableArray count](self->_probabilityVectors, "count");
}

- (id)probabilityVectorAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_probabilityVectors, "objectAtIndex:", a3);
}

+ (Class)probabilityVectorType
{
  return (Class)objc_opt_class();
}

- (void)clearNumDevicesVectors
{
  -[NSMutableArray removeAllObjects](self->_numDevicesVectors, "removeAllObjects");
}

- (void)addNumDevicesVector:(id)a3
{
  id v4;
  NSMutableArray *numDevicesVectors;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  numDevicesVectors = self->_numDevicesVectors;
  v8 = v4;
  if (!numDevicesVectors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_numDevicesVectors;
    self->_numDevicesVectors = v6;

    v4 = v8;
    numDevicesVectors = self->_numDevicesVectors;
  }
  -[NSMutableArray addObject:](numDevicesVectors, "addObject:", v4);

}

- (unint64_t)numDevicesVectorsCount
{
  return -[NSMutableArray count](self->_numDevicesVectors, "count");
}

- (id)numDevicesVectorAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_numDevicesVectors, "objectAtIndex:", a3);
}

+ (Class)numDevicesVectorType
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
  v8.super_class = (Class)BMPBMicroLocationRestrictedLocalizationEvent;
  -[BMPBMicroLocationRestrictedLocalizationEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBMicroLocationRestrictedLocalizationEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clientBundleId;
  NSString *maxProbabilityLabel;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimeStamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("absoluteTimeStamp"));

  }
  clientBundleId = self->_clientBundleId;
  if (clientBundleId)
    objc_msgSend(v3, "setObject:forKey:", clientBundleId, CFSTR("clientBundleId"));
  maxProbabilityLabel = self->_maxProbabilityLabel;
  if (maxProbabilityLabel)
    objc_msgSend(v3, "setObject:forKey:", maxProbabilityLabel, CFSTR("maxProbabilityLabel"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maxProbability);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("maxProbability"));

  }
  if (-[NSMutableArray count](self->_probabilityVectors, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_probabilityVectors, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = self->_probabilityVectors;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v11);
    }

    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("probabilityVector"));
  }
  if (-[NSMutableArray count](self->_numDevicesVectors, "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_numDevicesVectors, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = self->_numDevicesVectors;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v23);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("numDevicesVector"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBMicroLocationRestrictedLocalizationEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_clientBundleId)
    PBDataWriterWriteStringField();
  if (self->_maxProbabilityLabel)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteDoubleField();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_probabilityVectors;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_numDevicesVectors;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
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
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  _QWORD *v13;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_absoluteTimeStamp;
    *((_BYTE *)v4 + 56) |= 1u;
  }
  v13 = v4;
  if (self->_clientBundleId)
  {
    objc_msgSend(v4, "setClientBundleId:");
    v4 = v13;
  }
  if (self->_maxProbabilityLabel)
  {
    objc_msgSend(v13, "setMaxProbabilityLabel:");
    v4 = v13;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[2] = *(_QWORD *)&self->_maxProbability;
    *((_BYTE *)v4 + 56) |= 2u;
  }
  if (-[BMPBMicroLocationRestrictedLocalizationEvent probabilityVectorsCount](self, "probabilityVectorsCount"))
  {
    objc_msgSend(v13, "clearProbabilityVectors");
    v5 = -[BMPBMicroLocationRestrictedLocalizationEvent probabilityVectorsCount](self, "probabilityVectorsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[BMPBMicroLocationRestrictedLocalizationEvent probabilityVectorAtIndex:](self, "probabilityVectorAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addProbabilityVector:", v8);

      }
    }
  }
  if (-[BMPBMicroLocationRestrictedLocalizationEvent numDevicesVectorsCount](self, "numDevicesVectorsCount"))
  {
    objc_msgSend(v13, "clearNumDevicesVectors");
    v9 = -[BMPBMicroLocationRestrictedLocalizationEvent numDevicesVectorsCount](self, "numDevicesVectorsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[BMPBMicroLocationRestrictedLocalizationEvent numDevicesVectorAtIndex:](self, "numDevicesVectorAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addNumDevicesVector:", v12);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_absoluteTimeStamp;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_clientBundleId, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  v9 = -[NSString copyWithZone:](self->_maxProbabilityLabel, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v9;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(double *)(v6 + 16) = self->_maxProbability;
    *(_BYTE *)(v6 + 56) |= 2u;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = self->_probabilityVectors;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v29;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v15), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addProbabilityVector:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v13);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = self->_numDevicesVectors;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend((id)v6, "addNumDevicesVector:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v19);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientBundleId;
  NSString *maxProbabilityLabel;
  NSMutableArray *probabilityVectors;
  NSMutableArray *numDevicesVectors;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_absoluteTimeStamp != *((double *)v4 + 1))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_20:
    v9 = 0;
    goto LABEL_21;
  }
  clientBundleId = self->_clientBundleId;
  if ((unint64_t)clientBundleId | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](clientBundleId, "isEqual:"))
  {
    goto LABEL_20;
  }
  maxProbabilityLabel = self->_maxProbabilityLabel;
  if ((unint64_t)maxProbabilityLabel | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](maxProbabilityLabel, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_maxProbability != *((double *)v4 + 2))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_20;
  }
  probabilityVectors = self->_probabilityVectors;
  if ((unint64_t)probabilityVectors | *((_QWORD *)v4 + 6)
    && !-[NSMutableArray isEqual:](probabilityVectors, "isEqual:"))
  {
    goto LABEL_20;
  }
  numDevicesVectors = self->_numDevicesVectors;
  if ((unint64_t)numDevicesVectors | *((_QWORD *)v4 + 5))
    v9 = -[NSMutableArray isEqual:](numDevicesVectors, "isEqual:");
  else
    v9 = 1;
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  double absoluteTimeStamp;
  double v5;
  long double v6;
  double v7;
  NSUInteger v8;
  NSUInteger v9;
  unint64_t v10;
  double maxProbability;
  double v12;
  long double v13;
  double v14;
  NSUInteger v15;
  uint64_t v16;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    absoluteTimeStamp = self->_absoluteTimeStamp;
    v5 = -absoluteTimeStamp;
    if (absoluteTimeStamp >= 0.0)
      v5 = self->_absoluteTimeStamp;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSString hash](self->_clientBundleId, "hash");
  v9 = -[NSString hash](self->_maxProbabilityLabel, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    maxProbability = self->_maxProbability;
    v12 = -maxProbability;
    if (maxProbability >= 0.0)
      v12 = self->_maxProbability;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  v15 = v8 ^ v3 ^ v9 ^ v10;
  v16 = -[NSMutableArray hash](self->_probabilityVectors, "hash");
  return v15 ^ v16 ^ -[NSMutableArray hash](self->_numDevicesVectors, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
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

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (double *)a3;
  v5 = v4;
  if (((_BYTE)v4[7] & 1) != 0)
  {
    self->_absoluteTimeStamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 3))
    -[BMPBMicroLocationRestrictedLocalizationEvent setClientBundleId:](self, "setClientBundleId:");
  if (*((_QWORD *)v5 + 4))
    -[BMPBMicroLocationRestrictedLocalizationEvent setMaxProbabilityLabel:](self, "setMaxProbabilityLabel:");
  if (((_BYTE)v5[7] & 2) != 0)
  {
    self->_maxProbability = v5[2];
    *(_BYTE *)&self->_has |= 2u;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = *((id *)v5 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        -[BMPBMicroLocationRestrictedLocalizationEvent addProbabilityVector:](self, "addProbabilityVector:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = *((id *)v5 + 5);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[BMPBMicroLocationRestrictedLocalizationEvent addNumDevicesVector:](self, "addNumDevicesVector:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (double)absoluteTimeStamp
{
  return self->_absoluteTimeStamp;
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (void)setClientBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_clientBundleId, a3);
}

- (NSString)maxProbabilityLabel
{
  return self->_maxProbabilityLabel;
}

- (void)setMaxProbabilityLabel:(id)a3
{
  objc_storeStrong((id *)&self->_maxProbabilityLabel, a3);
}

- (double)maxProbability
{
  return self->_maxProbability;
}

- (NSMutableArray)probabilityVectors
{
  return self->_probabilityVectors;
}

- (void)setProbabilityVectors:(id)a3
{
  objc_storeStrong((id *)&self->_probabilityVectors, a3);
}

- (NSMutableArray)numDevicesVectors
{
  return self->_numDevicesVectors;
}

- (void)setNumDevicesVectors:(id)a3
{
  objc_storeStrong((id *)&self->_numDevicesVectors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probabilityVectors, 0);
  objc_storeStrong((id *)&self->_numDevicesVectors, 0);
  objc_storeStrong((id *)&self->_maxProbabilityLabel, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
}

@end

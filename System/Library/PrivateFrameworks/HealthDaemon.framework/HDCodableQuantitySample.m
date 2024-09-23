@implementation HDCodableQuantitySample

- (void)setSample:(id)a3
{
  objc_storeStrong((id *)&self->_sample, a3);
}

- (void)setOriginalUnitString:(id)a3
{
  objc_storeStrong((id *)&self->_originalUnitString, a3);
}

- (void)setValueInOriginalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_valueInOriginalUnit = a3;
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  NSMutableArray *v7;
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
  if (self->_sample)
    PBDataWriterWriteSubmessage();
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_originalUnitString)
    PBDataWriterWriteStringField();
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v6 = (__int16)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_11:
      if ((v6 & 0x100) == 0)
        goto LABEL_12;
      goto LABEL_29;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt64Field();
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_12:
    if ((v6 & 4) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_13:
    if ((v6 & 2) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_14:
    if ((v6 & 8) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_15:
    if ((v6 & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x10) != 0)
LABEL_16:
    PBDataWriterWriteDoubleField();
LABEL_17:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_quantitySeriesDatas;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        PBDataWriterWriteSubmessage();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if ((*(_WORD *)&self->_has & 0x20) != 0)
    PBDataWriterWriteDoubleField();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_quantitySeriesDatas, 0);
  objc_storeStrong((id *)&self->_originalUnitString, 0);
}

- (void)setValueInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_valueInCanonicalUnit = a3;
}

- (BOOL)applyToObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int *v9;
  BOOL v10;
  void *v11;
  _BOOL8 v12;
  id v13;
  void *v14;
  void *v15;
  __int16 has;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double mostRecentDuration;
  void *v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HDCodableQuantitySample sample](self, "sample");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "applyToObject:", v4))
    {
      v10 = 0;
LABEL_33:

      goto LABEL_34;
    }
    objc_msgSend(v4, "quantityType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = 0;
LABEL_32:

      goto LABEL_33;
    }
    v7 = (void *)MEMORY[0x1E0CB6A28];
    if ((*(_WORD *)&self->_has & 0x40) != 0)
    {
      objc_msgSend(v6, "canonicalUnit");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = &OBJC_IVAR___HDCodableQuantitySample__valueInCanonicalUnit;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", self->_originalUnitString);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = &OBJC_IVAR___HDCodableQuantitySample__valueInOriginalUnit;
    }
    objc_msgSend(v7, "quantityWithUnit:doubleValue:", v8, *(double *)((char *)&self->super.super.isa + *v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v11 != 0;
    if (!v11)
    {
LABEL_31:

      goto LABEL_32;
    }
    objc_msgSend(v4, "_setQuantity:", v11);
    v12 = (*(_WORD *)&self->_has & 0x200) == 0 || self->_frozen;
    objc_msgSend(v4, "_setFrozen:", v12);
    if ((*(_WORD *)&self->_has & 1) != 0)
      objc_msgSend(v4, "_setCount:", self->_count);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_29:
      if (self->_quantitySeriesDatas)
        objc_msgSend(v4, "_setCodableQuantitySample:", self);
      goto LABEL_31;
    }
    v13 = v4;
    objc_msgSend(v13, "quantity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_unit");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    has = (__int16)self->_has;
    if ((has & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v15, self->_min);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_setMinimumQuantity:", v17);

      has = (__int16)self->_has;
      if ((has & 2) == 0)
      {
LABEL_19:
        if ((has & 8) == 0)
          goto LABEL_20;
        goto LABEL_24;
      }
    }
    else if ((has & 2) == 0)
    {
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v15, self->_max);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setMaximumQuantity:", v18);

    has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_20:
      if ((has & 0x10) == 0)
        goto LABEL_28;
      goto LABEL_25;
    }
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v15, self->_mostRecent);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setMostRecentQuantity:", v19);

    if ((*(_WORD *)&self->_has & 0x10) == 0)
    {
LABEL_28:

      goto LABEL_29;
    }
LABEL_25:
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_mostRecentDate);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    mostRecentDuration = 0.0;
    if ((*(_WORD *)&self->_has & 0x20) != 0)
      mostRecentDuration = self->_mostRecentDuration;
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v20, mostRecentDuration);
    objc_msgSend(v13, "_setMostRecentQuantityDateInterval:", v22);

    goto LABEL_28;
  }
  v10 = 0;
LABEL_34:

  return v10;
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setHasValueInCanonicalUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasValueInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHasValueInOriginalUnit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasValueInOriginalUnit
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasOriginalUnitString
{
  return self->_originalUnitString != 0;
}

- (void)setFrozen:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_frozen = a3;
}

- (void)setHasFrozen:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasFrozen
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setCount:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCount
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setFinal:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_final = a3;
}

- (void)setHasFinal:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasFinal
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setMin:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_min = a3;
}

- (void)setHasMin:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMin
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setMax:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_max = a3;
}

- (void)setHasMax:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasMax
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setMostRecent:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_mostRecent = a3;
}

- (void)setHasMostRecent:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMostRecent
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setMostRecentDate:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_mostRecentDate = a3;
}

- (void)setHasMostRecentDate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMostRecentDate
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)clearQuantitySeriesDatas
{
  -[NSMutableArray removeAllObjects](self->_quantitySeriesDatas, "removeAllObjects");
}

- (void)addQuantitySeriesData:(id)a3
{
  id v4;
  NSMutableArray *quantitySeriesDatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  quantitySeriesDatas = self->_quantitySeriesDatas;
  v8 = v4;
  if (!quantitySeriesDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_quantitySeriesDatas;
    self->_quantitySeriesDatas = v6;

    v4 = v8;
    quantitySeriesDatas = self->_quantitySeriesDatas;
  }
  -[NSMutableArray addObject:](quantitySeriesDatas, "addObject:", v4);

}

- (unint64_t)quantitySeriesDatasCount
{
  return -[NSMutableArray count](self->_quantitySeriesDatas, "count");
}

- (id)quantitySeriesDataAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_quantitySeriesDatas, "objectAtIndex:", a3);
}

+ (Class)quantitySeriesDataType
{
  return (Class)objc_opt_class();
}

- (void)setMostRecentDuration:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_mostRecentDuration = a3;
}

- (void)setHasMostRecentDuration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasMostRecentDuration
{
  return (*(_WORD *)&self->_has >> 5) & 1;
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
  v8.super_class = (Class)HDCodableQuantitySample;
  -[HDCodableQuantitySample description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableQuantitySample dictionaryRepresentation](self, "dictionaryRepresentation");
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
  __int16 has;
  void *v7;
  void *v8;
  NSString *originalUnitString;
  __int16 v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sample = self->_sample;
  if (sample)
  {
    -[HDCodableSample dictionaryRepresentation](sample, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("sample"));

  }
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_valueInCanonicalUnit);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("valueInCanonicalUnit"));

    has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_valueInOriginalUnit);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("valueInOriginalUnit"));

  }
  originalUnitString = self->_originalUnitString;
  if (originalUnitString)
    objc_msgSend(v3, "setObject:forKey:", originalUnitString, CFSTR("originalUnitString"));
  v10 = (__int16)self->_has;
  if ((v10 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_frozen);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("frozen"));

    v10 = (__int16)self->_has;
    if ((v10 & 1) == 0)
    {
LABEL_11:
      if ((v10 & 0x100) == 0)
        goto LABEL_12;
      goto LABEL_31;
    }
  }
  else if ((v10 & 1) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_count);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("count"));

  v10 = (__int16)self->_has;
  if ((v10 & 0x100) == 0)
  {
LABEL_12:
    if ((v10 & 4) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_final);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("final"));

  v10 = (__int16)self->_has;
  if ((v10 & 4) == 0)
  {
LABEL_13:
    if ((v10 & 2) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_min);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("min"));

  v10 = (__int16)self->_has;
  if ((v10 & 2) == 0)
  {
LABEL_14:
    if ((v10 & 8) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_max);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("max"));

  v10 = (__int16)self->_has;
  if ((v10 & 8) == 0)
  {
LABEL_15:
    if ((v10 & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mostRecent);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("mostRecent"));

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mostRecentDate);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("mostRecentDate"));

  }
LABEL_17:
  if (-[NSMutableArray count](self->_quantitySeriesDatas, "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_quantitySeriesDatas, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = self->_quantitySeriesDatas;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v27);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v15);
    }

    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("quantitySeriesData"));
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_mostRecentDuration);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("mostRecentDuration"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableQuantitySampleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  __int16 v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;
  void *v10;
  id v11;

  v4 = a3;
  v11 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    v4 = v11;
  }
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_valueInCanonicalUnit;
    *((_WORD *)v4 + 50) |= 0x40u;
    has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    *((_QWORD *)v4 + 8) = *(_QWORD *)&self->_valueInOriginalUnit;
    *((_WORD *)v4 + 50) |= 0x80u;
  }
  if (self->_originalUnitString)
  {
    objc_msgSend(v11, "setOriginalUnitString:");
    v4 = v11;
  }
  v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
  {
    *((_BYTE *)v4 + 97) = self->_frozen;
    *((_WORD *)v4 + 50) |= 0x200u;
    v6 = (__int16)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_11:
      if ((v6 & 0x100) == 0)
        goto LABEL_12;
      goto LABEL_26;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_11;
  }
  *((_QWORD *)v4 + 1) = self->_count;
  *((_WORD *)v4 + 50) |= 1u;
  v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_12:
    if ((v6 & 4) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  *((_BYTE *)v4 + 96) = self->_final;
  *((_WORD *)v4 + 50) |= 0x100u;
  v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_13:
    if ((v6 & 2) == 0)
      goto LABEL_14;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)v4 + 3) = *(_QWORD *)&self->_min;
  *((_WORD *)v4 + 50) |= 4u;
  v6 = (__int16)self->_has;
  if ((v6 & 2) == 0)
  {
LABEL_14:
    if ((v6 & 8) == 0)
      goto LABEL_15;
LABEL_29:
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_mostRecent;
    *((_WORD *)v4 + 50) |= 8u;
    if ((*(_WORD *)&self->_has & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_28:
  *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_max;
  *((_WORD *)v4 + 50) |= 2u;
  v6 = (__int16)self->_has;
  if ((v6 & 8) != 0)
    goto LABEL_29;
LABEL_15:
  if ((v6 & 0x10) != 0)
  {
LABEL_16:
    *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_mostRecentDate;
    *((_WORD *)v4 + 50) |= 0x10u;
  }
LABEL_17:
  if (-[HDCodableQuantitySample quantitySeriesDatasCount](self, "quantitySeriesDatasCount"))
  {
    objc_msgSend(v11, "clearQuantitySeriesDatas");
    v7 = -[HDCodableQuantitySample quantitySeriesDatasCount](self, "quantitySeriesDatasCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        -[HDCodableQuantitySample quantitySeriesDataAtIndex:](self, "quantitySeriesDataAtIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addQuantitySeriesData:", v10);

      }
    }
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *((_QWORD *)v11 + 6) = *(_QWORD *)&self->_mostRecentDuration;
    *((_WORD *)v11 + 50) |= 0x20u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  __int16 has;
  uint64_t v9;
  void *v10;
  __int16 v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HDCodableSample copyWithZone:](self->_sample, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v6;

  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *(double *)(v5 + 56) = self->_valueInCanonicalUnit;
    *(_WORD *)(v5 + 100) |= 0x40u;
    has = (__int16)self->_has;
  }
  if ((has & 0x80) != 0)
  {
    *(double *)(v5 + 64) = self->_valueInOriginalUnit;
    *(_WORD *)(v5 + 100) |= 0x80u;
  }
  v9 = -[NSString copyWithZone:](self->_originalUnitString, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v9;

  v11 = (__int16)self->_has;
  if ((v11 & 0x200) != 0)
  {
    *(_BYTE *)(v5 + 97) = self->_frozen;
    *(_WORD *)(v5 + 100) |= 0x200u;
    v11 = (__int16)self->_has;
    if ((v11 & 1) == 0)
    {
LABEL_7:
      if ((v11 & 0x100) == 0)
        goto LABEL_8;
      goto LABEL_25;
    }
  }
  else if ((v11 & 1) == 0)
  {
    goto LABEL_7;
  }
  *(_QWORD *)(v5 + 8) = self->_count;
  *(_WORD *)(v5 + 100) |= 1u;
  v11 = (__int16)self->_has;
  if ((v11 & 0x100) == 0)
  {
LABEL_8:
    if ((v11 & 4) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  *(_BYTE *)(v5 + 96) = self->_final;
  *(_WORD *)(v5 + 100) |= 0x100u;
  v11 = (__int16)self->_has;
  if ((v11 & 4) == 0)
  {
LABEL_9:
    if ((v11 & 2) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  *(double *)(v5 + 24) = self->_min;
  *(_WORD *)(v5 + 100) |= 4u;
  v11 = (__int16)self->_has;
  if ((v11 & 2) == 0)
  {
LABEL_10:
    if ((v11 & 8) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  *(double *)(v5 + 16) = self->_max;
  *(_WORD *)(v5 + 100) |= 2u;
  v11 = (__int16)self->_has;
  if ((v11 & 8) == 0)
  {
LABEL_11:
    if ((v11 & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_28:
  *(double *)(v5 + 32) = self->_mostRecent;
  *(_WORD *)(v5 + 100) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_12:
    *(double *)(v5 + 40) = self->_mostRecentDate;
    *(_WORD *)(v5 + 100) |= 0x10u;
  }
LABEL_13:
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_quantitySeriesDatas;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend((id)v5, "addQuantitySeriesData:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(double *)(v5 + 48) = self->_mostRecentDuration;
    *(_WORD *)(v5 + 100) |= 0x20u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HDCodableSample *sample;
  __int16 has;
  __int16 v7;
  NSString *originalUnitString;
  NSMutableArray *quantitySeriesDatas;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_66;
  sample = self->_sample;
  if ((unint64_t)sample | *((_QWORD *)v4 + 11))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:"))
      goto LABEL_66;
  }
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 50);
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_valueInCanonicalUnit != *((double *)v4 + 7))
      goto LABEL_66;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_66;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_valueInOriginalUnit != *((double *)v4 + 8))
      goto LABEL_66;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_66;
  }
  originalUnitString = self->_originalUnitString;
  if ((unint64_t)originalUnitString | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](originalUnitString, "isEqual:"))
      goto LABEL_66;
    has = (__int16)self->_has;
    v7 = *((_WORD *)v4 + 50);
  }
  if ((has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0)
      goto LABEL_66;
    if (self->_frozen)
    {
      if (!*((_BYTE *)v4 + 97))
        goto LABEL_66;
    }
    else if (*((_BYTE *)v4 + 97))
    {
      goto LABEL_66;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_66;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_count != *((_QWORD *)v4 + 1))
      goto LABEL_66;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_66;
  }
  if ((has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0)
      goto LABEL_66;
    if (self->_final)
    {
      if (!*((_BYTE *)v4 + 96))
        goto LABEL_66;
    }
    else if (*((_BYTE *)v4 + 96))
    {
      goto LABEL_66;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_66;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_min != *((double *)v4 + 3))
      goto LABEL_66;
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_66;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_max != *((double *)v4 + 2))
      goto LABEL_66;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_66;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_mostRecent != *((double *)v4 + 4))
      goto LABEL_66;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_66;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_mostRecentDate != *((double *)v4 + 5))
      goto LABEL_66;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_66;
  }
  quantitySeriesDatas = self->_quantitySeriesDatas;
  if ((unint64_t)quantitySeriesDatas | *((_QWORD *)v4 + 10))
  {
    if (-[NSMutableArray isEqual:](quantitySeriesDatas, "isEqual:"))
    {
      has = (__int16)self->_has;
      v7 = *((_WORD *)v4 + 50);
      goto LABEL_61;
    }
LABEL_66:
    v10 = 0;
    goto LABEL_67;
  }
LABEL_61:
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_mostRecentDuration != *((double *)v4 + 6))
      goto LABEL_66;
    v10 = 1;
  }
  else
  {
    v10 = (v7 & 0x20) == 0;
  }
LABEL_67:

  return v10;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  double valueInCanonicalUnit;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double valueInOriginalUnit;
  double v11;
  long double v12;
  double v13;
  __int16 v14;
  uint64_t v15;
  double min;
  double v17;
  long double v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  double max;
  double v23;
  long double v24;
  double v25;
  unint64_t v26;
  double mostRecent;
  double v28;
  long double v29;
  double v30;
  unint64_t v31;
  double mostRecentDate;
  double v33;
  long double v34;
  double v35;
  uint64_t v36;
  unint64_t v37;
  double mostRecentDuration;
  double v39;
  long double v40;
  double v41;
  uint64_t v43;
  uint64_t v44;
  NSUInteger v45;
  unint64_t v46;
  unint64_t v47;

  v47 = -[HDCodableSample hash](self->_sample, "hash");
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    valueInCanonicalUnit = self->_valueInCanonicalUnit;
    v6 = -valueInCanonicalUnit;
    if (valueInCanonicalUnit >= 0.0)
      v6 = self->_valueInCanonicalUnit;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  v46 = v4;
  if ((has & 0x80) != 0)
  {
    valueInOriginalUnit = self->_valueInOriginalUnit;
    v11 = -valueInOriginalUnit;
    if (valueInOriginalUnit >= 0.0)
      v11 = self->_valueInOriginalUnit;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v45 = -[NSString hash](self->_originalUnitString, "hash");
  v14 = (__int16)self->_has;
  if ((v14 & 0x200) != 0)
  {
    v44 = 2654435761 * self->_frozen;
    if ((v14 & 1) != 0)
    {
LABEL_19:
      v43 = 2654435761 * self->_count;
      if ((*(_WORD *)&self->_has & 0x100) != 0)
        goto LABEL_20;
LABEL_27:
      v15 = 0;
      if ((v14 & 4) != 0)
        goto LABEL_21;
LABEL_28:
      v20 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    v44 = 0;
    if ((v14 & 1) != 0)
      goto LABEL_19;
  }
  v43 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0)
    goto LABEL_27;
LABEL_20:
  v15 = 2654435761 * self->_final;
  if ((v14 & 4) == 0)
    goto LABEL_28;
LABEL_21:
  min = self->_min;
  v17 = -min;
  if (min >= 0.0)
    v17 = self->_min;
  v18 = floor(v17 + 0.5);
  v19 = (v17 - v18) * 1.84467441e19;
  v20 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
  if (v19 >= 0.0)
  {
    if (v19 > 0.0)
      v20 += (unint64_t)v19;
  }
  else
  {
    v20 -= (unint64_t)fabs(v19);
  }
LABEL_31:
  if ((v14 & 2) != 0)
  {
    max = self->_max;
    v23 = -max;
    if (max >= 0.0)
      v23 = self->_max;
    v24 = floor(v23 + 0.5);
    v25 = (v23 - v24) * 1.84467441e19;
    v21 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
    if (v25 >= 0.0)
    {
      if (v25 > 0.0)
        v21 += (unint64_t)v25;
    }
    else
    {
      v21 -= (unint64_t)fabs(v25);
    }
  }
  else
  {
    v21 = 0;
  }
  if ((v14 & 8) != 0)
  {
    mostRecent = self->_mostRecent;
    v28 = -mostRecent;
    if (mostRecent >= 0.0)
      v28 = self->_mostRecent;
    v29 = floor(v28 + 0.5);
    v30 = (v28 - v29) * 1.84467441e19;
    v26 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
    if (v30 >= 0.0)
    {
      if (v30 > 0.0)
        v26 += (unint64_t)v30;
    }
    else
    {
      v26 -= (unint64_t)fabs(v30);
    }
  }
  else
  {
    v26 = 0;
  }
  if ((v14 & 0x10) != 0)
  {
    mostRecentDate = self->_mostRecentDate;
    v33 = -mostRecentDate;
    if (mostRecentDate >= 0.0)
      v33 = self->_mostRecentDate;
    v34 = floor(v33 + 0.5);
    v35 = (v33 - v34) * 1.84467441e19;
    v31 = 2654435761u * (unint64_t)fmod(v34, 1.84467441e19);
    if (v35 >= 0.0)
    {
      if (v35 > 0.0)
        v31 += (unint64_t)v35;
    }
    else
    {
      v31 -= (unint64_t)fabs(v35);
    }
  }
  else
  {
    v31 = 0;
  }
  v36 = -[NSMutableArray hash](self->_quantitySeriesDatas, "hash");
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    mostRecentDuration = self->_mostRecentDuration;
    v39 = -mostRecentDuration;
    if (mostRecentDuration >= 0.0)
      v39 = self->_mostRecentDuration;
    v40 = floor(v39 + 0.5);
    v41 = (v39 - v40) * 1.84467441e19;
    v37 = 2654435761u * (unint64_t)fmod(v40, 1.84467441e19);
    if (v41 >= 0.0)
    {
      if (v41 > 0.0)
        v37 += (unint64_t)v41;
    }
    else
    {
      v37 -= (unint64_t)fabs(v41);
    }
  }
  else
  {
    v37 = 0;
  }
  return v46 ^ v47 ^ v9 ^ v45 ^ v44 ^ v43 ^ v15 ^ v20 ^ v21 ^ v26 ^ v31 ^ v36 ^ v37;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HDCodableSample *sample;
  uint64_t v6;
  __int16 v7;
  __int16 v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sample = self->_sample;
  v6 = *((_QWORD *)v4 + 11);
  if (sample)
  {
    if (v6)
      -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else if (v6)
  {
    -[HDCodableQuantitySample setSample:](self, "setSample:");
  }
  v7 = *((_WORD *)v4 + 50);
  if ((v7 & 0x40) != 0)
  {
    self->_valueInCanonicalUnit = *((double *)v4 + 7);
    *(_WORD *)&self->_has |= 0x40u;
    v7 = *((_WORD *)v4 + 50);
  }
  if ((v7 & 0x80) != 0)
  {
    self->_valueInOriginalUnit = *((double *)v4 + 8);
    *(_WORD *)&self->_has |= 0x80u;
  }
  if (*((_QWORD *)v4 + 9))
    -[HDCodableQuantitySample setOriginalUnitString:](self, "setOriginalUnitString:");
  v8 = *((_WORD *)v4 + 50);
  if ((v8 & 0x200) != 0)
  {
    self->_frozen = *((_BYTE *)v4 + 97);
    *(_WORD *)&self->_has |= 0x200u;
    v8 = *((_WORD *)v4 + 50);
    if ((v8 & 1) == 0)
    {
LABEL_14:
      if ((v8 & 0x100) == 0)
        goto LABEL_15;
      goto LABEL_32;
    }
  }
  else if ((v8 & 1) == 0)
  {
    goto LABEL_14;
  }
  self->_count = *((_QWORD *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  v8 = *((_WORD *)v4 + 50);
  if ((v8 & 0x100) == 0)
  {
LABEL_15:
    if ((v8 & 4) == 0)
      goto LABEL_16;
    goto LABEL_33;
  }
LABEL_32:
  self->_final = *((_BYTE *)v4 + 96);
  *(_WORD *)&self->_has |= 0x100u;
  v8 = *((_WORD *)v4 + 50);
  if ((v8 & 4) == 0)
  {
LABEL_16:
    if ((v8 & 2) == 0)
      goto LABEL_17;
    goto LABEL_34;
  }
LABEL_33:
  self->_min = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  v8 = *((_WORD *)v4 + 50);
  if ((v8 & 2) == 0)
  {
LABEL_17:
    if ((v8 & 8) == 0)
      goto LABEL_18;
    goto LABEL_35;
  }
LABEL_34:
  self->_max = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v8 = *((_WORD *)v4 + 50);
  if ((v8 & 8) == 0)
  {
LABEL_18:
    if ((v8 & 0x10) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_35:
  self->_mostRecent = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 50) & 0x10) != 0)
  {
LABEL_19:
    self->_mostRecentDate = *((double *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_20:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *((id *)v4 + 10);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[HDCodableQuantitySample addQuantitySeriesData:](self, "addQuantitySeriesData:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  if ((*((_WORD *)v4 + 50) & 0x20) != 0)
  {
    self->_mostRecentDuration = *((double *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
  }

}

- (double)valueInCanonicalUnit
{
  return self->_valueInCanonicalUnit;
}

- (double)valueInOriginalUnit
{
  return self->_valueInOriginalUnit;
}

- (NSString)originalUnitString
{
  return self->_originalUnitString;
}

- (BOOL)frozen
{
  return self->_frozen;
}

- (int64_t)count
{
  return self->_count;
}

- (BOOL)final
{
  return self->_final;
}

- (double)min
{
  return self->_min;
}

- (double)max
{
  return self->_max;
}

- (double)mostRecent
{
  return self->_mostRecent;
}

- (double)mostRecentDate
{
  return self->_mostRecentDate;
}

- (NSMutableArray)quantitySeriesDatas
{
  return self->_quantitySeriesDatas;
}

- (void)setQuantitySeriesDatas:(id)a3
{
  objc_storeStrong((id *)&self->_quantitySeriesDatas, a3);
}

- (double)mostRecentDuration
{
  return self->_mostRecentDuration;
}

- (BOOL)isSeries
{
  return !self->_frozen || self->_count > 1 || self->_quantitySeriesDatas != 0;
}

@end

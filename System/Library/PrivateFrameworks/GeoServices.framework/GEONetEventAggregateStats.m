@implementation GEONetEventAggregateStats

- (unint64_t)min
{
  return self->_min;
}

- (void)setMin:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 4u;
  self->_min = a3;
}

- (void)setHasMin:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasMin
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unint64_t)max
{
  return self->_max;
}

- (void)setMax:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 2u;
  self->_max = a3;
}

- (void)setHasMax:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasMax
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (unint64_t)p10
{
  return self->_p10;
}

- (void)setP10:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 8u;
  self->_p10 = a3;
}

- (void)setHasP10:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasP10
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unint64_t)p25
{
  return self->_p25;
}

- (void)setP25:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x10u;
  self->_p25 = a3;
}

- (void)setHasP25:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasP25
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unint64_t)p50
{
  return self->_p50;
}

- (void)setP50:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x20u;
  self->_p50 = a3;
}

- (void)setHasP50:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasP50
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (unint64_t)p75
{
  return self->_p75;
}

- (void)setP75:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x40u;
  self->_p75 = a3;
}

- (void)setHasP75:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasP75
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (unint64_t)p90
{
  return self->_p90;
}

- (void)setP90:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x80u;
  self->_p90 = a3;
}

- (void)setHasP90:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasP90
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (unint64_t)p99
{
  return self->_p99;
}

- (void)setP99:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x100u;
  self->_p99 = a3;
}

- (void)setHasP99:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasP99
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (unint64_t)algMean
{
  return self->_algMean;
}

- (void)setAlgMean:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 1u;
  self->_algMean = a3;
}

- (void)setHasAlgMean:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

- (BOOL)hasAlgMean
{
  return *(_WORD *)&self->_flags & 1;
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
  v8.super_class = (Class)GEONetEventAggregateStats;
  -[GEONetEventAggregateStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONetEventAggregateStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONetEventAggregateStats _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 80);
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("min"));

    v5 = *(_WORD *)(a1 + 80);
  }
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("max"));

    v5 = *(_WORD *)(a1 + 80);
    if ((v5 & 8) == 0)
    {
LABEL_6:
      if ((v5 & 0x10) == 0)
        goto LABEL_7;
      goto LABEL_15;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("p10"));

  v5 = *(_WORD *)(a1 + 80);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("p25"));

  v5 = *(_WORD *)(a1 + 80);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_17;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("p50"));

  v5 = *(_WORD *)(a1 + 80);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("p75"));

  v5 = *(_WORD *)(a1 + 80);
  if ((v5 & 0x80) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0)
      goto LABEL_11;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 72));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("p99"));

    if ((*(_WORD *)(a1 + 80) & 1) == 0)
      return v4;
    goto LABEL_20;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 64));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("p90"));

  v5 = *(_WORD *)(a1 + 80);
  if ((v5 & 0x100) != 0)
    goto LABEL_19;
LABEL_11:
  if ((v5 & 1) == 0)
    return v4;
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 8));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v15 = CFSTR("algMean");
  else
    v15 = CFSTR("alg_mean");
  objc_msgSend(v4, "setObject:forKey:", v14, v15);

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEONetEventAggregateStats _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEONetEventAggregateStats)initWithDictionary:(id)a3
{
  return (GEONetEventAggregateStats *)-[GEONetEventAggregateStats _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("min"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMin:", objc_msgSend(v6, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("max"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMax:", objc_msgSend(v7, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("p10"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setP10:", objc_msgSend(v8, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("p25"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setP25:", objc_msgSend(v9, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("p50"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setP50:", objc_msgSend(v10, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("p75"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setP75:", objc_msgSend(v11, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("p90"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setP90:", objc_msgSend(v12, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("p99"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setP99:", objc_msgSend(v13, "unsignedLongLongValue"));

      if (a3)
        v14 = CFSTR("algMean");
      else
        v14 = CFSTR("alg_mean");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAlgMean:", objc_msgSend(v15, "unsignedLongLongValue"));

    }
  }

  return a1;
}

- (GEONetEventAggregateStats)initWithJSON:(id)a3
{
  return (GEONetEventAggregateStats *)-[GEONetEventAggregateStats _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEONetEventAggregateStatsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONetEventAggregateStatsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  __int16 flags;
  id v5;

  v5 = a3;
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint64Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteUint64Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_8:
    if ((flags & 0x100) == 0)
      goto LABEL_9;
LABEL_19:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_flags & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x100) != 0)
    goto LABEL_19;
LABEL_9:
  if ((flags & 1) != 0)
LABEL_10:
    PBDataWriterWriteUint64Field();
LABEL_11:

}

- (void)copyTo:(id)a3
{
  __int16 flags;
  _QWORD *v5;

  v5 = a3;
  -[GEONetEventAggregateStats readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[3] = self->_min;
    *((_WORD *)v5 + 40) |= 4u;
    flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[2] = self->_max;
  *((_WORD *)v5 + 40) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v5[4] = self->_p10;
  *((_WORD *)v5 + 40) |= 8u;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v5[5] = self->_p25;
  *((_WORD *)v5 + 40) |= 0x10u;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v5[6] = self->_p50;
  *((_WORD *)v5 + 40) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v5[7] = self->_p75;
  *((_WORD *)v5 + 40) |= 0x40u;
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_8:
    if ((flags & 0x100) == 0)
      goto LABEL_9;
LABEL_19:
    v5[9] = self->_p99;
    *((_WORD *)v5 + 40) |= 0x100u;
    if ((*(_WORD *)&self->_flags & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  v5[8] = self->_p90;
  *((_WORD *)v5 + 40) |= 0x80u;
  flags = (__int16)self->_flags;
  if ((flags & 0x100) != 0)
    goto LABEL_19;
LABEL_9:
  if ((flags & 1) != 0)
  {
LABEL_10:
    v5[1] = self->_algMean;
    *((_WORD *)v5 + 40) |= 1u;
  }
LABEL_11:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_QWORD *)result + 3) = self->_min;
    *((_WORD *)result + 40) |= 4u;
    flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 2) = self->_max;
  *((_WORD *)result + 40) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  *((_QWORD *)result + 4) = self->_p10;
  *((_WORD *)result + 40) |= 8u;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)result + 5) = self->_p25;
  *((_WORD *)result + 40) |= 0x10u;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)result + 6) = self->_p50;
  *((_WORD *)result + 40) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_7:
    if ((flags & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  *((_QWORD *)result + 7) = self->_p75;
  *((_WORD *)result + 40) |= 0x40u;
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_8:
    if ((flags & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  *((_QWORD *)result + 8) = self->_p90;
  *((_WORD *)result + 40) |= 0x80u;
  flags = (__int16)self->_flags;
  if ((flags & 0x100) == 0)
  {
LABEL_9:
    if ((flags & 1) == 0)
      return result;
    goto LABEL_10;
  }
LABEL_19:
  *((_QWORD *)result + 9) = self->_p99;
  *((_WORD *)result + 40) |= 0x100u;
  if ((*(_WORD *)&self->_flags & 1) == 0)
    return result;
LABEL_10:
  *((_QWORD *)result + 1) = self->_algMean;
  *((_WORD *)result + 40) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_47;
  -[GEONetEventAggregateStats readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 40);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_min != *((_QWORD *)v4 + 3))
      goto LABEL_47;
  }
  else if ((v6 & 4) != 0)
  {
LABEL_47:
    v7 = 0;
    goto LABEL_48;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_max != *((_QWORD *)v4 + 2))
      goto LABEL_47;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_p10 != *((_QWORD *)v4 + 4))
      goto LABEL_47;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_p25 != *((_QWORD *)v4 + 5))
      goto LABEL_47;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_p50 != *((_QWORD *)v4 + 6))
      goto LABEL_47;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_p75 != *((_QWORD *)v4 + 7))
      goto LABEL_47;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_p90 != *((_QWORD *)v4 + 8))
      goto LABEL_47;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_47;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x100) == 0 || self->_p99 != *((_QWORD *)v4 + 9))
      goto LABEL_47;
  }
  else if ((*((_WORD *)v4 + 40) & 0x100) != 0)
  {
    goto LABEL_47;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_algMean != *((_QWORD *)v4 + 1))
      goto LABEL_47;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 1) == 0;
  }
LABEL_48:

  return v7;
}

- (unint64_t)hash
{
  __int16 flags;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  -[GEONetEventAggregateStats readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v4 = 2654435761u * self->_min;
    if ((flags & 2) != 0)
    {
LABEL_3:
      v5 = 2654435761u * self->_max;
      if ((flags & 8) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v4 = 0;
    if ((flags & 2) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((flags & 8) != 0)
  {
LABEL_4:
    v6 = 2654435761u * self->_p10;
    if ((flags & 0x10) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v6 = 0;
  if ((flags & 0x10) != 0)
  {
LABEL_5:
    v7 = 2654435761u * self->_p25;
    if ((flags & 0x20) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v7 = 0;
  if ((flags & 0x20) != 0)
  {
LABEL_6:
    v8 = 2654435761u * self->_p50;
    if ((flags & 0x40) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v8 = 0;
  if ((flags & 0x40) != 0)
  {
LABEL_7:
    v9 = 2654435761u * self->_p75;
    if ((flags & 0x80) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v9 = 0;
  if ((flags & 0x80) != 0)
  {
LABEL_8:
    v10 = 2654435761u * self->_p90;
    if ((*(_WORD *)&self->_flags & 0x100) != 0)
      goto LABEL_9;
LABEL_18:
    v11 = 0;
    if ((flags & 1) != 0)
      goto LABEL_10;
LABEL_19:
    v12 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
LABEL_17:
  v10 = 0;
  if ((*(_WORD *)&self->_flags & 0x100) == 0)
    goto LABEL_18;
LABEL_9:
  v11 = 2654435761u * self->_p99;
  if ((flags & 1) == 0)
    goto LABEL_19;
LABEL_10:
  v12 = 2654435761u * self->_algMean;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  __int16 v4;
  unint64_t *v5;

  v5 = (unint64_t *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_WORD *)v5 + 40);
  if ((v4 & 4) != 0)
  {
    self->_min = v5[3];
    *(_WORD *)&self->_flags |= 4u;
    v4 = *((_WORD *)v5 + 40);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_max = v5[2];
  *(_WORD *)&self->_flags |= 2u;
  v4 = *((_WORD *)v5 + 40);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  self->_p10 = v5[4];
  *(_WORD *)&self->_flags |= 8u;
  v4 = *((_WORD *)v5 + 40);
  if ((v4 & 0x10) == 0)
  {
LABEL_5:
    if ((v4 & 0x20) == 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  self->_p25 = v5[5];
  *(_WORD *)&self->_flags |= 0x10u;
  v4 = *((_WORD *)v5 + 40);
  if ((v4 & 0x20) == 0)
  {
LABEL_6:
    if ((v4 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  self->_p50 = v5[6];
  *(_WORD *)&self->_flags |= 0x20u;
  v4 = *((_WORD *)v5 + 40);
  if ((v4 & 0x40) == 0)
  {
LABEL_7:
    if ((v4 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  self->_p75 = v5[7];
  *(_WORD *)&self->_flags |= 0x40u;
  v4 = *((_WORD *)v5 + 40);
  if ((v4 & 0x80) == 0)
  {
LABEL_8:
    if ((v4 & 0x100) == 0)
      goto LABEL_9;
LABEL_19:
    self->_p99 = v5[9];
    *(_WORD *)&self->_flags |= 0x100u;
    if ((v5[10] & 1) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_18:
  self->_p90 = v5[8];
  *(_WORD *)&self->_flags |= 0x80u;
  v4 = *((_WORD *)v5 + 40);
  if ((v4 & 0x100) != 0)
    goto LABEL_19;
LABEL_9:
  if ((v4 & 1) != 0)
  {
LABEL_10:
    self->_algMean = v5[1];
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_11:

}

@end

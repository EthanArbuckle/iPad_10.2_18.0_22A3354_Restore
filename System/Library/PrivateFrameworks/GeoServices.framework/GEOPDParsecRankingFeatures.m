@implementation GEOPDParsecRankingFeatures

- (double)expectedCtr
{
  return self->_expectedCtr;
}

- (void)setExpectedCtr:(double)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_expectedCtr = a3;
}

- (void)setHasExpectedCtr:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasExpectedCtr
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (double)distanceFromDeviceLocation
{
  return self->_distanceFromDeviceLocation;
}

- (void)setDistanceFromDeviceLocation:(double)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_distanceFromDeviceLocation = a3;
}

- (void)setHasDistanceFromDeviceLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDistanceFromDeviceLocation
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)distanceFromContainment
{
  return self->_distanceFromContainment;
}

- (void)setDistanceFromContainment:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_distanceFromContainment = a3;
}

- (void)setHasDistanceFromContainment:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDistanceFromContainment
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)isSpellCorrected
{
  return self->_isSpellCorrected;
}

- (void)setIsSpellCorrected:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_isSpellCorrected = a3;
}

- (void)setHasIsSpellCorrected:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIsSpellCorrected
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (BOOL)isRecallMismatch
{
  return self->_isRecallMismatch;
}

- (void)setIsRecallMismatch:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_isRecallMismatch = a3;
}

- (void)setHasIsRecallMismatch:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIsRecallMismatch
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
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
  v8.super_class = (Class)GEOPDParsecRankingFeatures;
  -[GEOPDParsecRankingFeatures description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDParsecRankingFeatures dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDParsecRankingFeatures _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[4];
  id v24;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 44);
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("expectedCtr");
    else
      v16 = CFSTR("expected_ctr");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v5 = *(_BYTE *)(a1 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_25;
    }
  }
  else if ((*(_BYTE *)(a1 + 44) & 2) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v18 = CFSTR("distanceFromDeviceLocation");
  else
    v18 = CFSTR("distance_from_device_location");
  objc_msgSend(v4, "setObject:forKey:", v17, v18);

  v5 = *(_BYTE *)(a1 + 44);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0)
      goto LABEL_6;
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 41));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("isSpellCorrected");
    else
      v22 = CFSTR("is_spell_corrected");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

    if ((*(_BYTE *)(a1 + 44) & 8) == 0)
      goto LABEL_11;
    goto LABEL_7;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v20 = CFSTR("distanceFromContainment");
  else
    v20 = CFSTR("distance_from_containment");
  objc_msgSend(v4, "setObject:forKey:", v19, v20);

  v5 = *(_BYTE *)(a1 + 44);
  if ((v5 & 0x10) != 0)
    goto LABEL_29;
LABEL_6:
  if ((v5 & 8) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("isRecallMismatch");
    else
      v7 = CFSTR("is_recall_mismatch");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_11:
  v8 = *(void **)(a1 + 8);
  if (v8)
  {
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __56__GEOPDParsecRankingFeatures__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E1C00600;
      v12 = v11;
      v24 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v23);
      v13 = v12;

      v10 = v13;
    }
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDParsecRankingFeatures _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOPDParsecRankingFeatures__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOPDParsecRankingFeatures)initWithDictionary:(id)a3
{
  return (GEOPDParsecRankingFeatures *)-[GEOPDParsecRankingFeatures _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("expectedCtr");
      else
        v6 = CFSTR("expected_ctr");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(a1, "setExpectedCtr:");
      }

      if (a3)
        v8 = CFSTR("distanceFromDeviceLocation");
      else
        v8 = CFSTR("distance_from_device_location");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(a1, "setDistanceFromDeviceLocation:");
      }

      if (a3)
        v10 = CFSTR("distanceFromContainment");
      else
        v10 = CFSTR("distance_from_containment");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "doubleValue");
        objc_msgSend(a1, "setDistanceFromContainment:");
      }

      if (a3)
        v12 = CFSTR("isSpellCorrected");
      else
        v12 = CFSTR("is_spell_corrected");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsSpellCorrected:", objc_msgSend(v13, "BOOLValue"));

      if (a3)
        v14 = CFSTR("isRecallMismatch");
      else
        v14 = CFSTR("is_recall_mismatch");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsRecallMismatch:", objc_msgSend(v15, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOPDParsecRankingFeatures)initWithJSON:(id)a3
{
  return (GEOPDParsecRankingFeatures *)-[GEOPDParsecRankingFeatures _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDParsecRankingFeaturesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDParsecRankingFeaturesReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_flags & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_11;
LABEL_5:
  if ((flags & 8) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField();
LABEL_7:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (void)copyTo:(id)a3
{
  char flags;
  _QWORD *v5;

  v5 = a3;
  -[GEOPDParsecRankingFeatures readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[4] = *(_QWORD *)&self->_expectedCtr;
    *((_BYTE *)v5 + 44) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[3] = *(_QWORD *)&self->_distanceFromDeviceLocation;
  *((_BYTE *)v5 + 44) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0)
      goto LABEL_5;
LABEL_11:
    *((_BYTE *)v5 + 41) = self->_isSpellCorrected;
    *((_BYTE *)v5 + 44) |= 0x10u;
    if ((*(_BYTE *)&self->_flags & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  v5[2] = *(_QWORD *)&self->_distanceFromContainment;
  *((_BYTE *)v5 + 44) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_11;
LABEL_5:
  if ((flags & 8) != 0)
  {
LABEL_6:
    *((_BYTE *)v5 + 40) = self->_isRecallMismatch;
    *((_BYTE *)v5 + 44) |= 8u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char flags;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(double *)(v4 + 32) = self->_expectedCtr;
    *(_BYTE *)(v4 + 44) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v4 + 24) = self->_distanceFromDeviceLocation;
  *(_BYTE *)(v4 + 44) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0)
      goto LABEL_5;
LABEL_11:
    *(_BYTE *)(v4 + 41) = self->_isSpellCorrected;
    *(_BYTE *)(v4 + 44) |= 0x10u;
    if ((*(_BYTE *)&self->_flags & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  *(double *)(v4 + 16) = self->_distanceFromContainment;
  *(_BYTE *)(v4 + 44) |= 1u;
  flags = (char)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_11;
LABEL_5:
  if ((flags & 8) != 0)
  {
LABEL_6:
    *(_BYTE *)(v4 + 40) = self->_isRecallMismatch;
    *(_BYTE *)(v4 + 44) |= 8u;
  }
LABEL_7:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  -[GEOPDParsecRankingFeatures readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_expectedCtr != *((double *)v4 + 4))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_distanceFromDeviceLocation != *((double *)v4 + 3))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_distanceFromContainment != *((double *)v4 + 2))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 0x10) == 0)
      goto LABEL_27;
    if (self->_isSpellCorrected)
    {
      if (!*((_BYTE *)v4 + 41))
        goto LABEL_27;
    }
    else if (*((_BYTE *)v4 + 41))
    {
      goto LABEL_27;
    }
  }
  else if ((*((_BYTE *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_27;
  }
  v5 = (*((_BYTE *)v4 + 44) & 8) == 0;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 8) != 0)
    {
      if (self->_isRecallMismatch)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_27;
      }
      else if (*((_BYTE *)v4 + 40))
      {
        goto LABEL_27;
      }
      v5 = 1;
      goto LABEL_28;
    }
LABEL_27:
    v5 = 0;
  }
LABEL_28:

  return v5;
}

- (unint64_t)hash
{
  char flags;
  unint64_t v4;
  double expectedCtr;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double distanceFromDeviceLocation;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double distanceFromContainment;
  double v16;
  long double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;

  -[GEOPDParsecRankingFeatures readAll:](self, "readAll:", 1);
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    expectedCtr = self->_expectedCtr;
    v6 = -expectedCtr;
    if (expectedCtr >= 0.0)
      v6 = self->_expectedCtr;
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
  if ((flags & 2) != 0)
  {
    distanceFromDeviceLocation = self->_distanceFromDeviceLocation;
    v11 = -distanceFromDeviceLocation;
    if (distanceFromDeviceLocation >= 0.0)
      v11 = self->_distanceFromDeviceLocation;
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
  if ((flags & 1) != 0)
  {
    distanceFromContainment = self->_distanceFromContainment;
    v16 = -distanceFromContainment;
    if (distanceFromContainment >= 0.0)
      v16 = self->_distanceFromContainment;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((flags & 0x10) != 0)
  {
    v19 = 2654435761 * self->_isSpellCorrected;
    if ((flags & 8) != 0)
      goto LABEL_27;
LABEL_29:
    v20 = 0;
    return v9 ^ v4 ^ v14 ^ v19 ^ v20;
  }
  v19 = 0;
  if ((flags & 8) == 0)
    goto LABEL_29;
LABEL_27:
  v20 = 2654435761 * self->_isRecallMismatch;
  return v9 ^ v4 ^ v14 ^ v19 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 44);
  if ((v4 & 4) != 0)
  {
    self->_expectedCtr = *((double *)v5 + 4);
    *(_BYTE *)&self->_flags |= 4u;
    v4 = *((_BYTE *)v5 + 44);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v5 + 44) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_distanceFromDeviceLocation = *((double *)v5 + 3);
  *(_BYTE *)&self->_flags |= 2u;
  v4 = *((_BYTE *)v5 + 44);
  if ((v4 & 1) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0)
      goto LABEL_5;
LABEL_11:
    self->_isSpellCorrected = *((_BYTE *)v5 + 41);
    *(_BYTE *)&self->_flags |= 0x10u;
    if ((*((_BYTE *)v5 + 44) & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_distanceFromContainment = *((double *)v5 + 2);
  *(_BYTE *)&self->_flags |= 1u;
  v4 = *((_BYTE *)v5 + 44);
  if ((v4 & 0x10) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v4 & 8) != 0)
  {
LABEL_6:
    self->_isRecallMismatch = *((_BYTE *)v5 + 40);
    *(_BYTE *)&self->_flags |= 8u;
  }
LABEL_7:

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  PBUnknownFields *unknownFields;

  v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOPDParsecRankingFeatures readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end

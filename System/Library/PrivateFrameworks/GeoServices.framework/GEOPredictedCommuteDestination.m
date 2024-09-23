@implementation GEOPredictedCommuteDestination

- (int)destinationType
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_destinationType;
  else
    return 0;
}

- (void)setDestinationType:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_destinationType = a3;
}

- (void)setHasDestinationType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDestinationType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)destinationTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C23650[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDestinationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_COMMUTE_LOCATION_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMMUTE_WINDOW_LOCATION_OTHER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMMUTE_WINDOW_LOCATION_HOME")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMMUTE_WINDOW_LOCATION_WORK")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("COMMUTE_WINDOW_LOCATION_SCHOOL")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

- (void)setConfidenceScore:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_confidenceScore = a3;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasConfidenceScore
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)chosen
{
  return self->_chosen;
}

- (void)setChosen:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_chosen = a3;
}

- (void)setHasChosen:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasChosen
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEOPredictedCommuteDestination;
  -[GEOPredictedCommuteDestination description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPredictedCommuteDestination dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPredictedCommuteDestination _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_BYTE *)(a1 + 24);
    if ((v5 & 2) != 0)
    {
      v6 = *(int *)(a1 + 16);
      if (v6 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E1C23650[v6];
      }
      if (a2)
        v8 = CFSTR("destinationType");
      else
        v8 = CFSTR("destination_type");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

      v5 = *(_BYTE *)(a1 + 24);
    }
    if ((v5 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v10 = CFSTR("confidenceScore");
      else
        v10 = CFSTR("confidence_score");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

      v5 = *(_BYTE *)(a1 + 24);
    }
    if ((v5 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 20));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("chosen"));

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPredictedCommuteDestination _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPredictedCommuteDestination)initWithDictionary:(id)a3
{
  return (GEOPredictedCommuteDestination *)-[GEOPredictedCommuteDestination _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v5 = a2;
  if (!a1)
    goto LABEL_30;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_30;
  if (a3)
    v6 = CFSTR("destinationType");
  else
    v6 = CFSTR("destination_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UNKNOWN_COMMUTE_LOCATION_TYPE")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMMUTE_WINDOW_LOCATION_OTHER")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMMUTE_WINDOW_LOCATION_HOME")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("COMMUTE_WINDOW_LOCATION_WORK")) & 1) != 0)
    {
      v9 = 3;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("COMMUTE_WINDOW_LOCATION_SCHOOL")))
    {
      v9 = 4;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_21:
    objc_msgSend(a1, "setDestinationType:", v9);
  }

  if (a3)
    v10 = CFSTR("confidenceScore");
  else
    v10 = CFSTR("confidence_score");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(a1, "setConfidenceScore:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("chosen"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setChosen:", objc_msgSend(v12, "BOOLValue"));

LABEL_30:
  return a1;
}

- (GEOPredictedCommuteDestination)initWithJSON:(id)a3
{
  return (GEOPredictedCommuteDestination *)-[GEOPredictedCommuteDestination _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPredictedCommuteDestinationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPredictedCommuteDestinationReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteDoubleField();
    v4 = v6;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_5:

}

- (void)copyTo:(id)a3
{
  char flags;
  _QWORD *v5;

  v5 = a3;
  -[GEOPredictedCommuteDestination readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_3;
LABEL_7:
    v5[1] = *(_QWORD *)&self->_confidenceScore;
    *((_BYTE *)v5 + 24) |= 1u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)v5 + 4) = self->_destinationType;
  *((_BYTE *)v5 + 24) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    *((_BYTE *)v5 + 20) = self->_chosen;
    *((_BYTE *)v5 + 24) |= 4u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_destinationType;
    *((_BYTE *)result + 24) |= 2u;
    flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0)
        return result;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_confidenceScore;
  *((_BYTE *)result + 24) |= 1u;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    return result;
LABEL_4:
  *((_BYTE *)result + 20) = self->_chosen;
  *((_BYTE *)result + 24) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  -[GEOPredictedCommuteDestination readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_destinationType != *((_DWORD *)v4 + 4))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    goto LABEL_14;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_confidenceScore != *((double *)v4 + 1))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_14;
  }
  v5 = (*((_BYTE *)v4 + 24) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0)
    {
LABEL_14:
      v5 = 0;
      goto LABEL_15;
    }
    if (self->_chosen)
    {
      if (!*((_BYTE *)v4 + 20))
        goto LABEL_14;
    }
    else if (*((_BYTE *)v4 + 20))
    {
      goto LABEL_14;
    }
    v5 = 1;
  }
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  char flags;
  uint64_t v4;
  double confidenceScore;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;

  -[GEOPredictedCommuteDestination readAll:](self, "readAll:", 1);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v4 = 2654435761 * self->_destinationType;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_8;
LABEL_3:
  confidenceScore = self->_confidenceScore;
  v6 = -confidenceScore;
  if (confidenceScore >= 0.0)
    v6 = self->_confidenceScore;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((flags & 4) != 0)
    v10 = 2654435761 * self->_chosen;
  else
    v10 = 0;
  return v9 ^ v4 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 2) == 0)
  {
    if ((*((_BYTE *)v5 + 24) & 1) == 0)
      goto LABEL_3;
LABEL_7:
    self->_confidenceScore = *((double *)v5 + 1);
    *(_BYTE *)&self->_flags |= 1u;
    if ((*((_BYTE *)v5 + 24) & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  self->_destinationType = *((_DWORD *)v5 + 4);
  *(_BYTE *)&self->_flags |= 2u;
  v4 = *((_BYTE *)v5 + 24);
  if ((v4 & 1) != 0)
    goto LABEL_7;
LABEL_3:
  if ((v4 & 4) != 0)
  {
LABEL_4:
    self->_chosen = *((_BYTE *)v5 + 20);
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_5:

}

@end

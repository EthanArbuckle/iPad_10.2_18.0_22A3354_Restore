@implementation GEORPScorecardUpdate

- (BOOL)hasScorecard
{
  return self->_scorecard != 0;
}

- (GEORPScorecard)scorecard
{
  return self->_scorecard;
}

- (void)setScorecard:(id)a3
{
  objc_storeStrong((id *)&self->_scorecard, a3);
}

- (int)action
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_action;
  else
    return 1;
}

- (void)setAction:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_action = a3;
}

- (void)setHasAction:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasAction
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)actionAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C071F0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAction:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_ADD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_REMOVE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_UNMODIFIED")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)GEORPScorecardUpdate;
  -[GEORPScorecardUpdate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPScorecardUpdate dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPScorecardUpdate _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "scorecard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v5, "jsonRepresentation");
      else
        objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("scorecard"));

    }
    if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    {
      v8 = *(int *)(a1 + 16);
      if (v8 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = off_1E1C071F0[v8];
      }
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("action"));

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
  return -[GEORPScorecardUpdate _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPScorecardUpdate)initWithDictionary:(id)a3
{
  return (GEORPScorecardUpdate *)-[GEORPScorecardUpdate _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  GEORPScorecard *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("scorecard"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = [GEORPScorecard alloc];
        if ((a3 & 1) != 0)
          v8 = -[GEORPScorecard initWithJSON:](v7, "initWithJSON:", v6);
        else
          v8 = -[GEORPScorecard initWithDictionary:](v7, "initWithDictionary:", v6);
        v9 = (void *)v8;
        objc_msgSend(a1, "setScorecard:", v8);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("action"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_UNKNOWN")) & 1) != 0)
        {
          v12 = 0;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_ADD")) & 1) != 0)
        {
          v12 = 1;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_REMOVE")) & 1) != 0)
        {
          v12 = 2;
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("POI_ENRICHMENT_UPDATE_ACTION_UNMODIFIED")))
        {
          v12 = 3;
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_22:

          goto LABEL_23;
        }
        v12 = objc_msgSend(v10, "intValue");
      }
      objc_msgSend(a1, "setAction:", v12);
      goto LABEL_22;
    }
  }
LABEL_23:

  return a1;
}

- (GEORPScorecardUpdate)initWithJSON:(id)a3
{
  return (GEORPScorecardUpdate *)-[GEORPScorecardUpdate _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPScorecardUpdateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPScorecardUpdateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_scorecard)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPScorecardUpdate readAll:](self, "readAll:", 0);
  if (self->_scorecard)
    objc_msgSend(v4, "setScorecard:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_action;
    *((_BYTE *)v4 + 20) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[GEORPScorecard copyWithZone:](self->_scorecard, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_action;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEORPScorecard *scorecard;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  -[GEORPScorecardUpdate readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  scorecard = self->_scorecard;
  if ((unint64_t)scorecard | *((_QWORD *)v4 + 1))
  {
    if (!-[GEORPScorecard isEqual:](scorecard, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_action == *((_DWORD *)v4 + 4))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  -[GEORPScorecardUpdate readAll:](self, "readAll:", 1);
  v3 = -[GEORPScorecard hash](self->_scorecard, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_action;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  GEORPScorecard *scorecard;
  uint64_t v5;
  int *v6;

  v6 = (int *)a3;
  objc_msgSend(v6, "readAll:", 0);
  scorecard = self->_scorecard;
  v5 = *((_QWORD *)v6 + 1);
  if (scorecard)
  {
    if (v5)
      -[GEORPScorecard mergeFrom:](scorecard, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPScorecardUpdate setScorecard:](self, "setScorecard:");
  }
  if ((v6[5] & 1) != 0)
  {
    self->_action = v6[4];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scorecard, 0);
}

@end

@implementation GEOLogMsgStateSummaryLookAroundLog

- (unsigned)durationSec
{
  return self->_durationSec;
}

- (void)setDurationSec:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_durationSec = a3;
}

- (void)setHasDurationSec:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDurationSec
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)hadPanActions
{
  return self->_hadPanActions;
}

- (void)setHadPanActions:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_hadPanActions = a3;
}

- (void)setHasHadPanActions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasHadPanActions
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)hadZoomActions
{
  return self->_hadZoomActions;
}

- (void)setHadZoomActions:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_hadZoomActions = a3;
}

- (void)setHasHadZoomActions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasHadZoomActions
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (BOOL)hadMoveActions
{
  return self->_hadMoveActions;
}

- (void)setHadMoveActions:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_hadMoveActions = a3;
}

- (void)setHasHadMoveActions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasHadMoveActions
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)hadPoiTapActions
{
  return self->_hadPoiTapActions;
}

- (void)setHadPoiTapActions:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_hadPoiTapActions = a3;
}

- (void)setHasHadPoiTapActions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasHadPoiTapActions
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)hadShareActions
{
  return self->_hadShareActions;
}

- (void)setHadShareActions:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_hadShareActions = a3;
}

- (void)setHasHadShareActions:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasHadShareActions
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
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
  v8.super_class = (Class)GEOLogMsgStateSummaryLookAroundLog;
  -[GEOLogMsgStateSummaryLookAroundLog description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateSummaryLookAroundLog dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateSummaryLookAroundLog _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 20);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 8));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("durationSec");
    else
      v7 = CFSTR("duration_sec");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_BYTE *)(a1 + 20);
  }
  if ((v5 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 13));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("hadPanActions");
    else
      v9 = CFSTR("had_pan_actions");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v5 = *(_BYTE *)(a1 + 20);
    if ((v5 & 0x20) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0)
        goto LABEL_10;
      goto LABEL_21;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 16));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v11 = CFSTR("hadZoomActions");
  else
    v11 = CFSTR("had_zoom_actions");
  objc_msgSend(v4, "setObject:forKey:", v10, v11);

  v5 = *(_BYTE *)(a1 + 20);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 8) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 12));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v13 = CFSTR("hadMoveActions");
  else
    v13 = CFSTR("had_move_actions");
  objc_msgSend(v4, "setObject:forKey:", v12, v13);

  v5 = *(_BYTE *)(a1 + 20);
  if ((v5 & 8) == 0)
  {
LABEL_11:
    if ((v5 & 0x10) == 0)
      return v4;
    goto LABEL_29;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 14));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v15 = CFSTR("hadPoiTapActions");
  else
    v15 = CFSTR("had_poi_tap_actions");
  objc_msgSend(v4, "setObject:forKey:", v14, v15);

  if ((*(_BYTE *)(a1 + 20) & 0x10) != 0)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 15));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("hadShareActions");
    else
      v17 = CFSTR("had_share_actions");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateSummaryLookAroundLog _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateSummaryLookAroundLog)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateSummaryLookAroundLog *)-[GEOLogMsgStateSummaryLookAroundLog _initWithDictionary:isJSON:](self, a3, 0);
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
  const __CFString *v16;
  void *v17;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("durationSec");
      else
        v6 = CFSTR("duration_sec");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDurationSec:", objc_msgSend(v7, "unsignedIntValue"));

      if (a3)
        v8 = CFSTR("hadPanActions");
      else
        v8 = CFSTR("had_pan_actions");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHadPanActions:", objc_msgSend(v9, "BOOLValue"));

      if (a3)
        v10 = CFSTR("hadZoomActions");
      else
        v10 = CFSTR("had_zoom_actions");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHadZoomActions:", objc_msgSend(v11, "BOOLValue"));

      if (a3)
        v12 = CFSTR("hadMoveActions");
      else
        v12 = CFSTR("had_move_actions");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHadMoveActions:", objc_msgSend(v13, "BOOLValue"));

      if (a3)
        v14 = CFSTR("hadPoiTapActions");
      else
        v14 = CFSTR("had_poi_tap_actions");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHadPoiTapActions:", objc_msgSend(v15, "BOOLValue"));

      if (a3)
        v16 = CFSTR("hadShareActions");
      else
        v16 = CFSTR("had_share_actions");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHadShareActions:", objc_msgSend(v17, "BOOLValue"));

    }
  }

  return a1;
}

- (GEOLogMsgStateSummaryLookAroundLog)initWithJSON:(id)a3
{
  return (GEOLogMsgStateSummaryLookAroundLog *)-[GEOLogMsgStateSummaryLookAroundLog _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateSummaryLookAroundLogIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateSummaryLookAroundLogReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 8) == 0)
      goto LABEL_6;
LABEL_13:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 0x10) != 0)
LABEL_7:
    PBDataWriterWriteBOOLField();
LABEL_8:

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOLogMsgStateSummaryLookAroundLog readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v5[2] = self->_durationSec;
    *((_BYTE *)v5 + 20) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v5 + 13) = self->_hadPanActions;
  *((_BYTE *)v5 + 20) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_BYTE *)v5 + 16) = self->_hadZoomActions;
  *((_BYTE *)v5 + 20) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 8) == 0)
      goto LABEL_6;
LABEL_13:
    *((_BYTE *)v5 + 14) = self->_hadPoiTapActions;
    *((_BYTE *)v5 + 20) |= 8u;
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  *((_BYTE *)v5 + 12) = self->_hadMoveActions;
  *((_BYTE *)v5 + 20) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_13;
LABEL_6:
  if ((flags & 0x10) != 0)
  {
LABEL_7:
    *((_BYTE *)v5 + 15) = self->_hadShareActions;
    *((_BYTE *)v5 + 20) |= 0x10u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_durationSec;
    *((_BYTE *)result + 20) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 13) = self->_hadPanActions;
  *((_BYTE *)result + 20) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  *((_BYTE *)result + 16) = self->_hadZoomActions;
  *((_BYTE *)result + 20) |= 0x20u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_5:
    if ((flags & 8) == 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  *((_BYTE *)result + 12) = self->_hadMoveActions;
  *((_BYTE *)result + 20) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 0x10) == 0)
      return result;
    goto LABEL_7;
  }
LABEL_13:
  *((_BYTE *)result + 14) = self->_hadPoiTapActions;
  *((_BYTE *)result + 20) |= 8u;
  if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    return result;
LABEL_7:
  *((_BYTE *)result + 15) = self->_hadShareActions;
  *((_BYTE *)result + 20) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  -[GEOLogMsgStateSummaryLookAroundLog readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_durationSec != *((_DWORD *)v4 + 2))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) == 0)
      goto LABEL_41;
    if (self->_hadPanActions)
    {
      if (!*((_BYTE *)v4 + 13))
        goto LABEL_41;
    }
    else if (*((_BYTE *)v4 + 13))
    {
      goto LABEL_41;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 4) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 0x20) == 0)
      goto LABEL_41;
    if (self->_hadZoomActions)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_41;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_41;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 0x20) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0)
      goto LABEL_41;
    if (self->_hadMoveActions)
    {
      if (!*((_BYTE *)v4 + 12))
        goto LABEL_41;
    }
    else if (*((_BYTE *)v4 + 12))
    {
      goto LABEL_41;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 8) == 0)
      goto LABEL_41;
    if (self->_hadPoiTapActions)
    {
      if (!*((_BYTE *)v4 + 14))
        goto LABEL_41;
    }
    else if (*((_BYTE *)v4 + 14))
    {
      goto LABEL_41;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 8) != 0)
  {
    goto LABEL_41;
  }
  v5 = (*((_BYTE *)v4 + 20) & 0x10) == 0;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 0x10) != 0)
    {
      if (self->_hadShareActions)
      {
        if (!*((_BYTE *)v4 + 15))
          goto LABEL_41;
      }
      else if (*((_BYTE *)v4 + 15))
      {
        goto LABEL_41;
      }
      v5 = 1;
      goto LABEL_42;
    }
LABEL_41:
    v5 = 0;
  }
LABEL_42:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[GEOLogMsgStateSummaryLookAroundLog readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761 * self->_durationSec;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_hadPanActions;
      if ((*(_BYTE *)&self->_flags & 0x20) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_hadZoomActions;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_hadMoveActions;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_6;
LABEL_12:
    v7 = 0;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_7;
LABEL_13:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_11:
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_12;
LABEL_6:
  v7 = 2654435761 * self->_hadPoiTapActions;
  if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    goto LABEL_13;
LABEL_7:
  v8 = 2654435761 * self->_hadShareActions;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 20);
  if ((v4 & 1) != 0)
  {
    self->_durationSec = *((_DWORD *)v5 + 2);
    *(_BYTE *)&self->_flags |= 1u;
    v4 = *((_BYTE *)v5 + 20);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((*((_BYTE *)v5 + 20) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_hadPanActions = *((_BYTE *)v5 + 13);
  *(_BYTE *)&self->_flags |= 4u;
  v4 = *((_BYTE *)v5 + 20);
  if ((v4 & 0x20) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  self->_hadZoomActions = *((_BYTE *)v5 + 16);
  *(_BYTE *)&self->_flags |= 0x20u;
  v4 = *((_BYTE *)v5 + 20);
  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 8) == 0)
      goto LABEL_6;
LABEL_13:
    self->_hadPoiTapActions = *((_BYTE *)v5 + 14);
    *(_BYTE *)&self->_flags |= 8u;
    if ((*((_BYTE *)v5 + 20) & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_12:
  self->_hadMoveActions = *((_BYTE *)v5 + 12);
  *(_BYTE *)&self->_flags |= 2u;
  v4 = *((_BYTE *)v5 + 20);
  if ((v4 & 8) != 0)
    goto LABEL_13;
LABEL_6:
  if ((v4 & 0x10) != 0)
  {
LABEL_7:
    self->_hadShareActions = *((_BYTE *)v5 + 15);
    *(_BYTE *)&self->_flags |= 0x10u;
  }
LABEL_8:

}

@end

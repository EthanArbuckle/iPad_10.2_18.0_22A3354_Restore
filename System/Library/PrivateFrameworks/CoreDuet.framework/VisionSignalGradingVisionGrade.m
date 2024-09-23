@implementation VisionSignalGradingVisionGrade

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setImageGrade:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_imageGrade = a3;
}

- (void)setHasImageGrade:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasImageGrade
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setNumPeople:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_numPeople = a3;
}

- (void)setHasNumPeople:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumPeople
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setCameraRollGrade:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_cameraRollGrade = a3;
}

- (void)setHasCameraRollGrade:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCameraRollGrade
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)clearExtractedSignals
{
  -[NSMutableArray removeAllObjects](self->_extractedSignals, "removeAllObjects");
}

- (void)addExtractedSignals:(id)a3
{
  id v4;
  NSMutableArray *extractedSignals;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  extractedSignals = self->_extractedSignals;
  v8 = v4;
  if (!extractedSignals)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_extractedSignals;
    self->_extractedSignals = v6;

    v4 = v8;
    extractedSignals = self->_extractedSignals;
  }
  -[NSMutableArray addObject:](extractedSignals, "addObject:", v4);

}

- (unint64_t)extractedSignalsCount
{
  return -[NSMutableArray count](self->_extractedSignals, "count");
}

- (id)extractedSignalsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_extractedSignals, "objectAtIndex:", a3);
}

+ (Class)extractedSignalsType
{
  return (Class)objc_opt_class();
}

- (void)setExtractedGrade:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_extractedGrade = a3;
}

- (void)setHasExtractedGrade:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasExtractedGrade
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setChildGrade:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_childGrade = a3;
}

- (void)setHasChildGrade:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasChildGrade
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setChildAge:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_childAge = a3;
}

- (void)setHasChildAge:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChildAge
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)VisionSignalGradingVisionGrade;
  -[VisionSignalGradingVisionGrade description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VisionSignalGradingVisionGrade dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  char has;
  void *v7;
  NSMutableArray *extractedSignals;
  char v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_imageGrade);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("imageGrade"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numPeople);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("numPeople"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cameraRollGrade);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("cameraRollGrade"));

  }
LABEL_7:
  extractedSignals = self->_extractedSignals;
  if (extractedSignals)
    objc_msgSend(v4, "setObject:forKey:", extractedSignals, CFSTR("extractedSignals"));
  v9 = (char)self->_has;
  if ((v9 & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_11;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_childGrade);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("childGrade"));

    if ((*(_BYTE *)&self->_has & 1) == 0)
      return v4;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_extractedGrade);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("extractedGrade"));

  v9 = (char)self->_has;
  if ((v9 & 8) != 0)
    goto LABEL_18;
LABEL_11:
  if ((v9 & 1) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_childAge);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("childAge"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return VisionSignalGradingVisionGradeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_identifier)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField();
LABEL_7:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_extractedSignals;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = (char)self->_has;
  if ((v11 & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_16;
LABEL_23:
    PBDataWriterWriteBOOLField();
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  PBDataWriterWriteBOOLField();
  v11 = (char)self->_has;
  if ((v11 & 8) != 0)
    goto LABEL_23;
LABEL_16:
  if ((v11 & 1) != 0)
LABEL_17:
    PBDataWriterWriteInt32Field();
LABEL_18:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  id v11;

  v4 = a3;
  v11 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v11;
  }
  has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
LABEL_17:
    *((_DWORD *)v4 + 8) = self->_numPeople;
    *((_BYTE *)v4 + 40) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *((_BYTE *)v4 + 39) = self->_imageGrade;
  *((_BYTE *)v4 + 40) |= 0x20u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_17;
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    *((_BYTE *)v4 + 36) = self->_cameraRollGrade;
    *((_BYTE *)v4 + 40) |= 4u;
  }
LABEL_7:
  if (-[VisionSignalGradingVisionGrade extractedSignalsCount](self, "extractedSignalsCount"))
  {
    objc_msgSend(v11, "clearExtractedSignals");
    v6 = -[VisionSignalGradingVisionGrade extractedSignalsCount](self, "extractedSignalsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[VisionSignalGradingVisionGrade extractedSignalsAtIndex:](self, "extractedSignalsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addExtractedSignals:", v9);

      }
    }
  }
  v10 = (char)self->_has;
  if ((v10 & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_13;
LABEL_20:
    *((_BYTE *)v11 + 37) = self->_childGrade;
    *((_BYTE *)v11 + 40) |= 8u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  *((_BYTE *)v11 + 38) = self->_extractedGrade;
  *((_BYTE *)v11 + 40) |= 0x10u;
  v10 = (char)self->_has;
  if ((v10 & 8) != 0)
    goto LABEL_20;
LABEL_13:
  if ((v10 & 1) != 0)
  {
LABEL_14:
    *((_DWORD *)v11 + 2) = self->_childAge;
    *((_BYTE *)v11 + 40) |= 1u;
  }
LABEL_15:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 39) = self->_imageGrade;
    *(_BYTE *)(v5 + 40) |= 0x20u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 32) = self->_numPeople;
  *(_BYTE *)(v5 + 40) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 36) = self->_cameraRollGrade;
    *(_BYTE *)(v5 + 40) |= 4u;
  }
LABEL_5:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = self->_extractedSignals;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend((id)v5, "addExtractedSignals:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v15 = (char)self->_has;
  if ((v15 & 0x10) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_14;
LABEL_21:
    *(_BYTE *)(v5 + 37) = self->_childGrade;
    *(_BYTE *)(v5 + 40) |= 8u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      return (id)v5;
    goto LABEL_15;
  }
  *(_BYTE *)(v5 + 38) = self->_extractedGrade;
  *(_BYTE *)(v5 + 40) |= 0x10u;
  v15 = (char)self->_has;
  if ((v15 & 8) != 0)
    goto LABEL_21;
LABEL_14:
  if ((v15 & 1) != 0)
  {
LABEL_15:
    *(_DWORD *)(v5 + 8) = self->_childAge;
    *(_BYTE *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  char has;
  NSMutableArray *extractedSignals;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_48;
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_48;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x20) == 0)
      goto LABEL_48;
    if (self->_imageGrade)
    {
      if (!*((_BYTE *)v4 + 39))
        goto LABEL_48;
    }
    else if (*((_BYTE *)v4 + 39))
    {
      goto LABEL_48;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 0x20) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_numPeople != *((_DWORD *)v4 + 8))
      goto LABEL_48;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
    goto LABEL_48;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 4) == 0)
      goto LABEL_48;
    if (self->_cameraRollGrade)
    {
      if (!*((_BYTE *)v4 + 36))
        goto LABEL_48;
    }
    else if (*((_BYTE *)v4 + 36))
    {
      goto LABEL_48;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
    goto LABEL_48;
  }
  extractedSignals = self->_extractedSignals;
  if ((unint64_t)extractedSignals | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](extractedSignals, "isEqual:"))
      goto LABEL_48;
    has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 0x10) == 0)
      goto LABEL_48;
    if (self->_extractedGrade)
    {
      if (!*((_BYTE *)v4 + 38))
        goto LABEL_48;
    }
    else if (*((_BYTE *)v4 + 38))
    {
      goto LABEL_48;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) != 0)
    {
      if (self->_childGrade)
      {
        if (!*((_BYTE *)v4 + 37))
          goto LABEL_48;
        goto LABEL_44;
      }
      if (!*((_BYTE *)v4 + 37))
        goto LABEL_44;
    }
LABEL_48:
    v8 = 0;
    goto LABEL_49;
  }
  if ((*((_BYTE *)v4 + 40) & 8) != 0)
    goto LABEL_48;
LABEL_44:
  v8 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_childAge != *((_DWORD *)v4 + 2))
      goto LABEL_48;
    v8 = 1;
  }
LABEL_49:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[NSString hash](self->_identifier, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v4 = 2654435761 * self->_imageGrade;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_numPeople;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_cameraRollGrade;
    goto LABEL_8;
  }
LABEL_7:
  v6 = 0;
LABEL_8:
  v7 = -[NSMutableArray hash](self->_extractedSignals, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
  {
    v8 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_10;
LABEL_13:
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_11;
LABEL_14:
    v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  }
  v8 = 2654435761 * self->_extractedGrade;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_13;
LABEL_10:
  v9 = 2654435761 * self->_childGrade;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_14;
LABEL_11:
  v10 = 2654435761 * self->_childAge;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 3))
    -[VisionSignalGradingVisionGrade setIdentifier:](self, "setIdentifier:");
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 0x20) != 0)
  {
    self->_imageGrade = *((_BYTE *)v4 + 39);
    *(_BYTE *)&self->_has |= 0x20u;
    v5 = *((_BYTE *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)v4 + 40) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_numPeople = *((_DWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 40) & 4) != 0)
  {
LABEL_6:
    self->_cameraRollGrade = *((_BYTE *)v4 + 36);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_7:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *((id *)v4 + 2);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[VisionSignalGradingVisionGrade addExtractedSignals:](self, "addExtractedSignals:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = *((_BYTE *)v4 + 40);
  if ((v11 & 0x10) == 0)
  {
    if ((*((_BYTE *)v4 + 40) & 8) == 0)
      goto LABEL_16;
LABEL_23:
    self->_childGrade = *((_BYTE *)v4 + 37);
    *(_BYTE *)&self->_has |= 8u;
    if ((*((_BYTE *)v4 + 40) & 1) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  self->_extractedGrade = *((_BYTE *)v4 + 38);
  *(_BYTE *)&self->_has |= 0x10u;
  v11 = *((_BYTE *)v4 + 40);
  if ((v11 & 8) != 0)
    goto LABEL_23;
LABEL_16:
  if ((v11 & 1) != 0)
  {
LABEL_17:
    self->_childAge = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_18:

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)imageGrade
{
  return self->_imageGrade;
}

- (int)numPeople
{
  return self->_numPeople;
}

- (BOOL)cameraRollGrade
{
  return self->_cameraRollGrade;
}

- (NSMutableArray)extractedSignals
{
  return self->_extractedSignals;
}

- (void)setExtractedSignals:(id)a3
{
  objc_storeStrong((id *)&self->_extractedSignals, a3);
}

- (BOOL)extractedGrade
{
  return self->_extractedGrade;
}

- (BOOL)childGrade
{
  return self->_childGrade;
}

- (int)childAge
{
  return self->_childAge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_extractedSignals, 0);
}

@end

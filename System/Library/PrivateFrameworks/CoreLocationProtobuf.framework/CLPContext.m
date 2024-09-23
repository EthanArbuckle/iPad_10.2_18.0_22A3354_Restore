@implementation CLPContext

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsDriving:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isDriving = a3;
}

- (void)setHasIsDriving:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsDriving
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setWorkoutType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_workoutType = a3;
}

- (void)setHasWorkoutType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWorkoutType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasBundleCategory
{
  return self->_bundleCategory != 0;
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
  v8.super_class = (Class)CLPContext;
  -[CLPContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSString *bundleCategory;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_type);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("type"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDriving);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("isDriving"));

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_workoutType);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("workoutType"));

  }
LABEL_5:
  bundleCategory = self->_bundleCategory;
  if (bundleCategory)
    objc_msgSend(v3, "setObject:forKey:", bundleCategory, CFSTR("bundleCategory"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_5:
  if (self->_bundleCategory)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[4] = self->_type;
    *((_BYTE *)v4 + 28) |= 1u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v4 + 24) = self->_isDriving;
  *((_BYTE *)v4 + 28) |= 4u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4[5] = self->_workoutType;
    *((_BYTE *)v4 + 28) |= 2u;
  }
LABEL_5:
  if (self->_bundleCategory)
  {
    v6 = v4;
    objc_msgSend(v4, "setBundleCategory:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_3;
LABEL_7:
    *(_BYTE *)(v5 + 24) = self->_isDriving;
    *(_BYTE *)(v5 + 28) |= 4u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 16) = self->_type;
  *(_BYTE *)(v5 + 28) |= 1u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 20) = self->_workoutType;
    *(_BYTE *)(v5 + 28) |= 2u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_bundleCategory, "copyWithZone:", a3);
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bundleCategory;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 4) != 0)
    {
      if (self->_isDriving)
      {
        if (!*((_BYTE *)v4 + 24))
          goto LABEL_22;
        goto LABEL_15;
      }
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_15;
    }
LABEL_22:
    v6 = 0;
    goto LABEL_23;
  }
  if ((*((_BYTE *)v4 + 28) & 4) != 0)
    goto LABEL_22;
LABEL_15:
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 2) == 0 || self->_workoutType != *((_DWORD *)v4 + 5))
      goto LABEL_22;
  }
  else if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
    goto LABEL_22;
  }
  bundleCategory = self->_bundleCategory;
  if ((unint64_t)bundleCategory | *((_QWORD *)v4 + 1))
    v6 = -[NSString isEqual:](bundleCategory, "isEqual:");
  else
    v6 = 1;
LABEL_23:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v2 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_7:
    v4 = 0;
    return v3 ^ v2 ^ v4 ^ -[NSString hash](self->_bundleCategory, "hash");
  }
  v2 = 2654435761 * self->_type;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_6;
LABEL_3:
  v3 = 2654435761 * self->_isDriving;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_7;
LABEL_4:
  v4 = 2654435761 * self->_workoutType;
  return v3 ^ v2 ^ v4 ^ -[NSString hash](self->_bundleCategory, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 28);
  if ((v5 & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 28);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 28) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_isDriving = *((_BYTE *)v4 + 24);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 28) & 2) != 0)
  {
LABEL_4:
    self->_workoutType = *((_DWORD *)v4 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[CLPContext setBundleCategory:](self, "setBundleCategory:");
    v4 = v6;
  }

}

- (int)type
{
  return self->_type;
}

- (BOOL)isDriving
{
  return self->_isDriving;
}

- (int)workoutType
{
  return self->_workoutType;
}

- (NSString)bundleCategory
{
  return self->_bundleCategory;
}

- (void)setBundleCategory:(id)a3
{
  objc_storeStrong((id *)&self->_bundleCategory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleCategory, 0);
}

@end

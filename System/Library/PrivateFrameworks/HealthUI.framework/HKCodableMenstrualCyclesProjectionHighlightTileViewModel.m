@implementation HKCodableMenstrualCyclesProjectionHighlightTileViewModel

- (HKCodableMenstrualCyclesProjection)projection
{
  return self->_projection;
}

- (void)setProjectionKind:(id)a3
{
  objc_storeStrong((id *)&self->_projectionKind, a3);
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_minimumSupportedVersion = a3;
}

- (void)setLatestSupportedVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_latestSupportedVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_projectionKind, 0);
  objc_storeStrong((id *)&self->_projection, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_projection)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_projectionKind)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }

}

- (BOOL)hasProjection
{
  return self->_projection != 0;
}

- (BOOL)hasProjectionKind
{
  return self->_projectionKind != 0;
}

- (void)setHasLatestSupportedVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLatestSupportedVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasMinimumSupportedVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinimumSupportedVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)HKCodableMenstrualCyclesProjectionHighlightTileViewModel;
  -[HKCodableMenstrualCyclesProjectionHighlightTileViewModel description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableMenstrualCyclesProjectionHighlightTileViewModel dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HKCodableMenstrualCyclesProjection *projection;
  void *v5;
  HKCodableMenstrualCyclesProjectionKind *projectionKind;
  void *v7;
  char has;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  projection = self->_projection;
  if (projection)
  {
    -[HKCodableMenstrualCyclesProjection dictionaryRepresentation](projection, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("projection"));

  }
  projectionKind = self->_projectionKind;
  if (projectionKind)
  {
    -[HKCodableMenstrualCyclesProjectionKind dictionaryRepresentation](projectionKind, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("projectionKind"));

  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_latestSupportedVersion);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("latestSupportedVersion"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_minimumSupportedVersion);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("minimumSupportedVersion"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableMenstrualCyclesProjectionHighlightTileViewModelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_projection)
  {
    objc_msgSend(v4, "setProjection:");
    v4 = v6;
  }
  if (self->_projectionKind)
  {
    objc_msgSend(v6, "setProjectionKind:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_latestSupportedVersion;
    *((_BYTE *)v4 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_minimumSupportedVersion;
    *((_BYTE *)v4 + 40) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HKCodableMenstrualCyclesProjection copyWithZone:](self->_projection, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[HKCodableMenstrualCyclesProjectionKind copyWithZone:](self->_projectionKind, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_latestSupportedVersion;
    *(_BYTE *)(v5 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_minimumSupportedVersion;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HKCodableMenstrualCyclesProjection *projection;
  HKCodableMenstrualCyclesProjectionKind *projectionKind;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  projection = self->_projection;
  if ((unint64_t)projection | *((_QWORD *)v4 + 3))
  {
    if (!-[HKCodableMenstrualCyclesProjection isEqual:](projection, "isEqual:"))
      goto LABEL_15;
  }
  projectionKind = self->_projectionKind;
  if ((unint64_t)projectionKind | *((_QWORD *)v4 + 4))
  {
    if (!-[HKCodableMenstrualCyclesProjectionKind isEqual:](projectionKind, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_latestSupportedVersion != *((_QWORD *)v4 + 1))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  v7 = (*((_BYTE *)v4 + 40) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_minimumSupportedVersion != *((_QWORD *)v4 + 2))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[HKCodableMenstrualCyclesProjection hash](self->_projection, "hash");
  v4 = -[HKCodableMenstrualCyclesProjectionKind hash](self->_projectionKind, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5 = 2654435761 * self->_latestSupportedVersion;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_minimumSupportedVersion;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HKCodableMenstrualCyclesProjection *projection;
  uint64_t v6;
  HKCodableMenstrualCyclesProjectionKind *projectionKind;
  uint64_t v8;
  char v9;
  _QWORD *v10;

  v4 = a3;
  projection = self->_projection;
  v6 = v4[3];
  v10 = v4;
  if (projection)
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableMenstrualCyclesProjection mergeFrom:](projection, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[HKCodableMenstrualCyclesProjectionHighlightTileViewModel setProjection:](self, "setProjection:");
  }
  v4 = v10;
LABEL_7:
  projectionKind = self->_projectionKind;
  v8 = v4[4];
  if (projectionKind)
  {
    if (!v8)
      goto LABEL_13;
    -[HKCodableMenstrualCyclesProjectionKind mergeFrom:](projectionKind, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[HKCodableMenstrualCyclesProjectionHighlightTileViewModel setProjectionKind:](self, "setProjectionKind:");
  }
  v4 = v10;
LABEL_13:
  v9 = *((_BYTE *)v4 + 40);
  if ((v9 & 1) != 0)
  {
    self->_latestSupportedVersion = v4[1];
    *(_BYTE *)&self->_has |= 1u;
    v9 = *((_BYTE *)v4 + 40);
  }
  if ((v9 & 2) != 0)
  {
    self->_minimumSupportedVersion = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (void)setProjection:(id)a3
{
  objc_storeStrong((id *)&self->_projection, a3);
}

- (HKCodableMenstrualCyclesProjectionKind)projectionKind
{
  return self->_projectionKind;
}

- (int64_t)latestSupportedVersion
{
  return self->_latestSupportedVersion;
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

@end

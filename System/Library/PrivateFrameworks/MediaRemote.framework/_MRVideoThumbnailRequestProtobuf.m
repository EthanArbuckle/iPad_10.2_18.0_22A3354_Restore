@implementation _MRVideoThumbnailRequestProtobuf

- (void)dealloc
{
  objc_super v3;

  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)_MRVideoThumbnailRequestProtobuf;
  -[_MRVideoThumbnailRequestProtobuf dealloc](&v3, sel_dealloc);
}

- (unint64_t)timeIntervalsCount
{
  return self->_timeIntervals.count;
}

- (double)timeIntervals
{
  return self->_timeIntervals.list;
}

- (void)clearTimeIntervals
{
  PBRepeatedDoubleClear();
}

- (void)addTimeIntervals:(double)a3
{
  PBRepeatedDoubleAdd();
}

- (double)timeIntervalsAtIndex:(unint64_t)a3
{
  $A57E80F8F7F5C5FFA4899556F12E1D96 *p_timeIntervals;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_timeIntervals = &self->_timeIntervals;
  count = self->_timeIntervals.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_timeIntervals->list[a3];
}

- (void)setTimeIntervals:(double *)a3 count:(unint64_t)a4
{
  PBRepeatedDoubleSet();
}

- (void)setThumbnailsWidth:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_thumbnailsWidth = a3;
}

- (void)setHasThumbnailsWidth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasThumbnailsWidth
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setThumbnailsHeight:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_thumbnailsHeight = a3;
}

- (void)setHasThumbnailsHeight:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasThumbnailsHeight
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
  v8.super_class = (Class)_MRVideoThumbnailRequestProtobuf;
  -[_MRVideoThumbnailRequestProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRVideoThumbnailRequestProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  double v5;
  char has;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedDoubleNSArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timeIntervals"));

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)&v5 = self->_thumbnailsWidth;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("thumbnailsWidth"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(float *)&v5 = self->_thumbnailsHeight;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("thumbnailsHeight"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRVideoThumbnailRequestProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  char has;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_timeIntervals.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      v4 = v7;
      ++v5;
    }
    while (v5 < self->_timeIntervals.count);
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v7;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  char has;
  id v8;

  v8 = a3;
  if (-[_MRVideoThumbnailRequestProtobuf timeIntervalsCount](self, "timeIntervalsCount"))
  {
    objc_msgSend(v8, "clearTimeIntervals");
    v4 = -[_MRVideoThumbnailRequestProtobuf timeIntervalsCount](self, "timeIntervalsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[_MRVideoThumbnailRequestProtobuf timeIntervalsAtIndex:](self, "timeIntervalsAtIndex:", i);
        objc_msgSend(v8, "addTimeIntervals:");
      }
    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v8 + 9) = LODWORD(self->_thumbnailsWidth);
    *((_BYTE *)v8 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v8 + 8) = LODWORD(self->_thumbnailsHeight);
    *((_BYTE *)v8 + 40) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  char has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedDoubleCopy();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)(v4 + 36) = self->_thumbnailsWidth;
    *(_BYTE *)(v4 + 40) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(float *)(v4 + 32) = self->_thumbnailsHeight;
    *(_BYTE *)(v4 + 40) |= 1u;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || !PBRepeatedDoubleIsEqual())
    goto LABEL_12;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_thumbnailsWidth != *((float *)v4 + 9))
      goto LABEL_12;
  }
  else if ((*((_BYTE *)v4 + 40) & 2) != 0)
  {
LABEL_12:
    v5 = 0;
    goto LABEL_13;
  }
  v5 = (*((_BYTE *)v4 + 40) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_thumbnailsHeight != *((float *)v4 + 8))
      goto LABEL_12;
    v5 = 1;
  }
LABEL_13:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  char has;
  unint64_t v5;
  float thumbnailsWidth;
  float v7;
  float v8;
  float v9;
  unint64_t v10;
  float thumbnailsHeight;
  float v12;
  float v13;
  float v14;

  v3 = PBRepeatedDoubleHash();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    thumbnailsWidth = self->_thumbnailsWidth;
    v7 = -thumbnailsWidth;
    if (thumbnailsWidth >= 0.0)
      v7 = self->_thumbnailsWidth;
    v8 = floorf(v7 + 0.5);
    v9 = (float)(v7 - v8) * 1.8447e19;
    v5 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabsf(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 1) != 0)
  {
    thumbnailsHeight = self->_thumbnailsHeight;
    v12 = -thumbnailsHeight;
    if (thumbnailsHeight >= 0.0)
      v12 = self->_thumbnailsHeight;
    v13 = floorf(v12 + 0.5);
    v14 = (float)(v12 - v13) * 1.8447e19;
    v10 = 2654435761u * (unint64_t)fmodf(v13, 1.8447e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabsf(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  return v5 ^ v3 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  char v7;
  float *v8;

  v8 = (float *)a3;
  v4 = objc_msgSend(v8, "timeIntervalsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v8, "timeIntervalsAtIndex:", i);
      -[_MRVideoThumbnailRequestProtobuf addTimeIntervals:](self, "addTimeIntervals:");
    }
  }
  v7 = *((_BYTE *)v8 + 40);
  if ((v7 & 2) != 0)
  {
    self->_thumbnailsWidth = v8[9];
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v8 + 40);
  }
  if ((v7 & 1) != 0)
  {
    self->_thumbnailsHeight = v8[8];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (float)thumbnailsWidth
{
  return self->_thumbnailsWidth;
}

- (float)thumbnailsHeight
{
  return self->_thumbnailsHeight;
}

@end

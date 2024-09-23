@implementation BPSPBApproxPercentileDigest

- (void)dealloc
{
  objc_super v3;

  PBRepeatedFloatClear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)BPSPBApproxPercentileDigest;
  -[BPSPBApproxPercentileDigest dealloc](&v3, sel_dealloc);
}

- (void)setMin:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_min = a3;
}

- (void)setHasMin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMin
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setMax:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_max = a3;
}

- (void)setHasMax:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMax
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCentroidCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_centroidCount = a3;
}

- (void)setHasCentroidCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCentroidCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setBufferMultiplier:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_bufferMultiplier = a3;
}

- (void)setHasBufferMultiplier:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBufferMultiplier
{
  return *(_BYTE *)&self->_has & 1;
}

- (unint64_t)centroidMeansCount
{
  return self->_centroidMeans.count;
}

- (float)centroidMeans
{
  return self->_centroidMeans.list;
}

- (void)clearCentroidMeans
{
  PBRepeatedFloatClear();
}

- (void)addCentroidMeans:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)centroidMeansAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_centroidMeans;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_centroidMeans = &self->_centroidMeans;
  count = self->_centroidMeans.count;
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
  return p_centroidMeans->list[a3];
}

- (void)setCentroidMeans:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (unint64_t)centroidWeightsCount
{
  return self->_centroidWeights.count;
}

- (unsigned)centroidWeights
{
  return self->_centroidWeights.list;
}

- (void)clearCentroidWeights
{
  PBRepeatedUInt32Clear();
}

- (void)addCentroidWeights:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)centroidWeightsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_centroidWeights;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_centroidWeights = &self->_centroidWeights;
  count = self->_centroidWeights.count;
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
  return p_centroidWeights->list[a3];
}

- (void)setCentroidWeights:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
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
  v8.super_class = (Class)BPSPBApproxPercentileDigest;
  -[BPSPBApproxPercentileDigest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSPBApproxPercentileDigest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  char has;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(float *)&v4 = self->_min;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("min"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_centroidCount);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("centroidCount"));

      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&v4 = self->_max;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("max"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_bufferMultiplier);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("bufferMultiplier"));

  }
LABEL_6:
  PBRepeatedFloatNSArray();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("centroidMeans"));

  PBRepeatedUInt32NSArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("centroidWeights"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BPSPBApproxPercentileDigestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_centroidWeights;
  unint64_t v8;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_5:
    PBDataWriterWriteUint32Field();
LABEL_6:
  if (self->_centroidMeans.count)
  {
    PBDataWriterPlaceMark();
    if (self->_centroidMeans.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteFloatField();
        ++v6;
      }
      while (v6 < self->_centroidMeans.count);
    }
    PBDataWriterRecallMark();
  }
  p_centroidWeights = &self->_centroidWeights;
  if (p_centroidWeights->count)
  {
    PBDataWriterPlaceMark();
    if (p_centroidWeights->count)
    {
      v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v8;
      }
      while (v8 < p_centroidWeights->count);
    }
    PBDataWriterRecallMark();
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  id v12;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[17] = LODWORD(self->_min);
    *((_BYTE *)v4 + 72) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_17:
      v4[15] = self->_centroidCount;
      *((_BYTE *)v4 + 72) |= 2u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[16] = LODWORD(self->_max);
  *((_BYTE *)v4 + 72) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_17;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    v4[14] = self->_bufferMultiplier;
    *((_BYTE *)v4 + 72) |= 1u;
  }
LABEL_6:
  v12 = v4;
  if (-[BPSPBApproxPercentileDigest centroidMeansCount](self, "centroidMeansCount"))
  {
    objc_msgSend(v12, "clearCentroidMeans");
    v6 = -[BPSPBApproxPercentileDigest centroidMeansCount](self, "centroidMeansCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[BPSPBApproxPercentileDigest centroidMeansAtIndex:](self, "centroidMeansAtIndex:", i);
        objc_msgSend(v12, "addCentroidMeans:");
      }
    }
  }
  if (-[BPSPBApproxPercentileDigest centroidWeightsCount](self, "centroidWeightsCount"))
  {
    objc_msgSend(v12, "clearCentroidWeights");
    v9 = -[BPSPBApproxPercentileDigest centroidWeightsCount](self, "centroidWeightsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v12, "addCentroidWeights:", -[BPSPBApproxPercentileDigest centroidWeightsAtIndex:](self, "centroidWeightsAtIndex:", j));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  char has;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(float *)(v4 + 68) = self->_min;
    *(_BYTE *)(v4 + 72) |= 8u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      *(_DWORD *)(v4 + 60) = self->_centroidCount;
      *(_BYTE *)(v4 + 72) |= 2u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v4 + 64) = self->_max;
  *(_BYTE *)(v4 + 72) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    *(_DWORD *)(v4 + 56) = self->_bufferMultiplier;
    *(_BYTE *)(v4 + 72) |= 1u;
  }
LABEL_6:
  PBRepeatedFloatCopy();
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 8) == 0 || self->_min != *((float *)v4 + 17))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 72) & 8) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0 || self->_max != *((float *)v4 + 16))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_centroidCount != *((_DWORD *)v4 + 15))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_bufferMultiplier != *((_DWORD *)v4 + 14))
      goto LABEL_24;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_24;
  }
  if (!PBRepeatedFloatIsEqual())
  {
LABEL_24:
    IsEqual = 0;
    goto LABEL_25;
  }
  IsEqual = PBRepeatedUInt32IsEqual();
LABEL_25:

  return IsEqual;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  float min;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  float max;
  float v11;
  float v12;
  float v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    min = self->_min;
    v6 = -min;
    if (min >= 0.0)
      v6 = self->_min;
    v7 = floorf(v6 + 0.5);
    v8 = (float)(v6 - v7) * 1.8447e19;
    v4 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabsf(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 4) != 0)
  {
    max = self->_max;
    v11 = -max;
    if (max >= 0.0)
      v11 = self->_max;
    v12 = floorf(v11 + 0.5);
    v13 = (float)(v11 - v12) * 1.8447e19;
    v9 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabsf(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 2) != 0)
  {
    v14 = 2654435761 * self->_centroidCount;
    if ((has & 1) != 0)
      goto LABEL_19;
LABEL_21:
    v15 = 0;
    goto LABEL_22;
  }
  v14 = 0;
  if ((has & 1) == 0)
    goto LABEL_21;
LABEL_19:
  v15 = 2654435761 * self->_bufferMultiplier;
LABEL_22:
  v16 = v9 ^ v4 ^ v14 ^ v15 ^ PBRepeatedFloatHash();
  return v16 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  id v12;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 8) != 0)
  {
    self->_min = *((float *)v4 + 17);
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 72);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((*((_BYTE *)v4 + 72) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_max = *((float *)v4 + 16);
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_15:
  self->_centroidCount = *((_DWORD *)v4 + 15);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_5:
    self->_bufferMultiplier = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_6:
  v12 = v4;
  v6 = objc_msgSend(v4, "centroidMeansCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v12, "centroidMeansAtIndex:", i);
      -[BPSPBApproxPercentileDigest addCentroidMeans:](self, "addCentroidMeans:");
    }
  }
  v9 = objc_msgSend(v12, "centroidWeightsCount");
  if (v9)
  {
    v10 = v9;
    for (j = 0; j != v10; ++j)
      -[BPSPBApproxPercentileDigest addCentroidWeights:](self, "addCentroidWeights:", objc_msgSend(v12, "centroidWeightsAtIndex:", j));
  }

}

- (float)min
{
  return self->_min;
}

- (float)max
{
  return self->_max;
}

- (unsigned)centroidCount
{
  return self->_centroidCount;
}

- (unsigned)bufferMultiplier
{
  return self->_bufferMultiplier;
}

@end

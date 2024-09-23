@implementation MXAcousticFeature

- (void)dealloc
{
  objc_super v3;

  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)MXAcousticFeature;
  -[MXAcousticFeature dealloc](&v3, sel_dealloc);
}

- (unint64_t)acousticFeaturePerFramesCount
{
  return self->_acousticFeaturePerFrames.count;
}

- (float)acousticFeaturePerFrames
{
  return self->_acousticFeaturePerFrames.list;
}

- (void)clearAcousticFeaturePerFrames
{
  PBRepeatedFloatClear();
}

- (void)addAcousticFeaturePerFrame:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)acousticFeaturePerFrameAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_acousticFeaturePerFrames;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_acousticFeaturePerFrames = &self->_acousticFeaturePerFrames;
  count = self->_acousticFeaturePerFrames.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_acousticFeaturePerFrames->list[a3];
}

- (void)setAcousticFeaturePerFrames:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
}

- (void)setFrameDuration:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_frameDuration = a3;
}

- (void)setHasFrameDuration:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFrameDuration
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)MXAcousticFeature;
  -[MXAcousticFeature description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXAcousticFeature dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedFloatNSArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("acoustic_feature_per_frame"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)&v5 = self->_frameDuration;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("frame_duration"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXAcousticFeatureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_acousticFeaturePerFrames.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v4 = v6;
      ++v5;
    }
    while (v5 < self->_acousticFeaturePerFrames.count);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  if (-[MXAcousticFeature acousticFeaturePerFramesCount](self, "acousticFeaturePerFramesCount"))
  {
    objc_msgSend(v7, "clearAcousticFeaturePerFrames");
    v4 = -[MXAcousticFeature acousticFeaturePerFramesCount](self, "acousticFeaturePerFramesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[MXAcousticFeature acousticFeaturePerFrameAtIndex:](self, "acousticFeaturePerFrameAtIndex:", i);
        objc_msgSend(v7, "addAcousticFeaturePerFrame:");
      }
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v7 + 8) = LODWORD(self->_frameDuration);
    *((_BYTE *)v7 + 36) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedFloatCopy();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)(v4 + 32) = self->_frameDuration;
    *(_BYTE *)(v4 + 36) |= 1u;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || !PBRepeatedFloatIsEqual())
    goto LABEL_7;
  v5 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) != 0 && self->_frameDuration == *((float *)v4 + 8))
    {
      v5 = 1;
      goto LABEL_8;
    }
LABEL_7:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  float frameDuration;
  float v6;
  float v7;
  float v8;

  v3 = PBRepeatedFloatHash();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    frameDuration = self->_frameDuration;
    v6 = -frameDuration;
    if (frameDuration >= 0.0)
      v6 = self->_frameDuration;
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
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  float *v7;

  v7 = (float *)a3;
  v4 = objc_msgSend(v7, "acousticFeaturePerFramesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v7, "acousticFeaturePerFrameAtIndex:", i);
      -[MXAcousticFeature addAcousticFeaturePerFrame:](self, "addAcousticFeaturePerFrame:");
    }
  }
  if (((_BYTE)v7[9] & 1) != 0)
  {
    self->_frameDuration = v7[8];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (float)frameDuration
{
  return self->_frameDuration;
}

@end

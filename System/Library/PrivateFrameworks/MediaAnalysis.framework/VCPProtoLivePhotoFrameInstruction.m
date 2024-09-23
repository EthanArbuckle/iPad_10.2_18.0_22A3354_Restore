@implementation VCPProtoLivePhotoFrameInstruction

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3;
  VCPProtoLivePhotoFrameInstruction *v4;
  void *v5;
  const __CFDictionary *v6;
  VCPProtoLivePhotoFrameInstruction *v7;
  uint64_t i;
  void *v9;
  CMTime v11;

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(VCPProtoLivePhotoFrameInstruction);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("homography"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v11, 0, sizeof(v11));
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rawTime"));
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary(&v11, v6);

    if ((unint64_t)objc_msgSend(v5, "count") >= 8 && (unint64_t)objc_msgSend(v5, "count") <= 9)
    {
      -[VCPProtoLivePhotoFrameInstruction setTimeValue:](v4, "setTimeValue:", v11.value);
      -[VCPProtoLivePhotoFrameInstruction setTimeScale:](v4, "setTimeScale:", v11.timescale);
      -[VCPProtoLivePhotoFrameInstruction setEpoch:](v4, "setEpoch:", v11.epoch);
      -[VCPProtoLivePhotoFrameInstruction setFlags:](v4, "setFlags:", v11.flags);
      for (i = 0; i != 8; ++i)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "floatValue");
        -[VCPProtoLivePhotoFrameInstruction addHomographyParam:](v4, "addHomographyParam:");

      }
      v7 = v4;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  unint64_t i;
  void *v6;
  void *v7;
  CFDictionaryRef v8;
  CMTime v10;
  CMTime time;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; -[VCPProtoLivePhotoFrameInstruction homographyParamsCount](self, "homographyParamsCount") > i; ++i)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoLivePhotoFrameInstruction homographyParamAtIndex:](self, "homographyParamAtIndex:", i);
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  objc_msgSend(v4, "addObject:", &unk_1E6B71E90);
  memset(&v10, 0, sizeof(v10));
  CMTimeMake(&v10, -[VCPProtoLivePhotoFrameInstruction timeValue](self, "timeValue"), -[VCPProtoLivePhotoFrameInstruction timeScale](self, "timeScale"));
  v10.epoch = -[VCPProtoLivePhotoFrameInstruction epoch](self, "epoch");
  v10.flags = -[VCPProtoLivePhotoFrameInstruction flags](self, "flags");
  time = v10;
  v8 = CMTimeCopyAsDictionary(&time, 0);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("rawTime"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("homography"));
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)VCPProtoLivePhotoFrameInstruction;
  -[VCPProtoLivePhotoFrameInstruction dealloc](&v3, sel_dealloc);
}

- (unint64_t)homographyParamsCount
{
  return self->_homographyParams.count;
}

- (float)homographyParams
{
  return self->_homographyParams.list;
}

- (void)clearHomographyParams
{
  PBRepeatedFloatClear();
}

- (void)addHomographyParam:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)homographyParamAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_homographyParams;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_homographyParams = &self->_homographyParams;
  count = self->_homographyParams.count;
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
  return p_homographyParams->list[a3];
}

- (void)setHomographyParams:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
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
  v8.super_class = (Class)VCPProtoLivePhotoFrameInstruction;
  -[VCPProtoLivePhotoFrameInstruction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoLivePhotoFrameInstruction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_timeValue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timeValue"));

  PBRepeatedFloatNSArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("homographyParam"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_timeScale);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("timeScale"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_epoch);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("epoch"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_flags);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("flags"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLivePhotoFrameInstructionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteInt64Field();
  if (self->_homographyParams.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      ++v4;
    }
    while (v4 < self->_homographyParams.count);
  }
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  _QWORD *v7;

  v7 = a3;
  v7[5] = self->_timeValue;
  if (-[VCPProtoLivePhotoFrameInstruction homographyParamsCount](self, "homographyParamsCount"))
  {
    objc_msgSend(v7, "clearHomographyParams");
    v4 = -[VCPProtoLivePhotoFrameInstruction homographyParamsCount](self, "homographyParamsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[VCPProtoLivePhotoFrameInstruction homographyParamAtIndex:](self, "homographyParamAtIndex:", i);
        objc_msgSend(v7, "addHomographyParam:");
      }
    }
  }
  *((_DWORD *)v7 + 13) = self->_timeScale;
  v7[4] = self->_epoch;
  *((_DWORD *)v7 + 12) = self->_flags;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 40) = self->_timeValue;
  PBRepeatedFloatCopy();
  *(_DWORD *)(v4 + 52) = self->_timeScale;
  *(_QWORD *)(v4 + 32) = self->_epoch;
  *(_DWORD *)(v4 + 48) = self->_flags;
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_timeValue == *((_QWORD *)v4 + 5)
    && PBRepeatedFloatIsEqual()
    && self->_timeScale == *((_DWORD *)v4 + 13)
    && self->_epoch == *((_QWORD *)v4 + 4)
    && self->_flags == *((_DWORD *)v4 + 12);

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = 2654435761 * self->_timeValue;
  return PBRepeatedFloatHash() ^ v2 ^ (2654435761 * self->_timeScale) ^ (2654435761 * self->_epoch) ^ (2654435761 * self->_flags);
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;

  v4 = a3;
  self->_timeValue = v4[5];
  v8 = v4;
  v5 = objc_msgSend(v4, "homographyParamsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v8, "homographyParamAtIndex:", i);
      -[VCPProtoLivePhotoFrameInstruction addHomographyParam:](self, "addHomographyParam:");
    }
  }
  self->_timeScale = *((_DWORD *)v8 + 13);
  self->_epoch = *((_QWORD *)v8 + 4);
  self->_flags = *((_DWORD *)v8 + 12);

}

- (int64_t)timeValue
{
  return self->_timeValue;
}

- (void)setTimeValue:(int64_t)a3
{
  self->_timeValue = a3;
}

- (int)timeScale
{
  return self->_timeScale;
}

- (void)setTimeScale:(int)a3
{
  self->_timeScale = a3;
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (void)setEpoch:(int64_t)a3
{
  self->_epoch = a3;
}

- (int)flags
{
  return self->_flags;
}

- (void)setFlags:(int)a3
{
  self->_flags = a3;
}

@end

@implementation VCPProtoFilesystemMovieHumanActionClassificationResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  VCPProtoFilesystemMovieHumanActionClassificationResult *v6;
  Float64 Seconds;
  Float64 v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  _QWORD v18[2];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CMTime v23;
  CMTime v24;
  CMTime duration;
  CMTime start;
  CMTimeRange v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("humanActions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v27, 0, sizeof(v27));
  CMTimeRangeMakeFromDictionary(&v27, (CFDictionaryRef)v3);
  start = v27.start;
  duration = v27.duration;
  if ((v27.start.flags & 1) == 0)
    goto LABEL_2;
  v6 = 0;
  if ((v27.duration.flags & 1) != 0 && !v27.duration.epoch && (v27.duration.value & 0x8000000000000000) == 0)
  {
    if (!objc_msgSend(v5, "count"))
    {
LABEL_2:
      v6 = 0;
      goto LABEL_16;
    }
    v6 = objc_alloc_init(VCPProtoFilesystemMovieHumanActionClassificationResult);
    v24 = start;
    Seconds = CMTimeGetSeconds(&v24);
    *(float *)&Seconds = Seconds;
    -[VCPProtoFilesystemMovieHumanActionClassificationResult setStart:](v6, "setStart:", Seconds);
    v23 = duration;
    v8 = CMTimeGetSeconds(&v23);
    *(float *)&v8 = v8;
    -[VCPProtoFilesystemMovieHumanActionClassificationResult setDuration:](v6, "setDuration:", v8);
    objc_msgSend(v5, "count");
    MEMORY[0x1E0C80A78]();
    v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v5, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    if (v12)
    {
      v18[1] = v18;
      v13 = 0;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        v16 = v13;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          *(_DWORD *)&v10[4 * (v16 + v15)] = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "longLongValue");
          ++v15;
        }
        while (v12 != v15);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
        v13 = v16 + v15;
      }
      while (v12);
      v12 = (v16 + v15);
    }

    -[VCPProtoFilesystemMovieHumanActionClassificationResult setIdentifiers:count:](v6, "setIdentifiers:count:", v10, v12);
  }
LABEL_16:

  return v6;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  unint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  CFDictionaryRef v10;
  void *v11;
  void *v12;
  CMTime v14;
  CMTime start;
  CMTimeRange v16;
  CMTime v17;
  CMTime v18;
  CMTimeRange range;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[VCPProtoFilesystemMovieHumanActionClassificationResult identifiersCount](self, "identifiersCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0;
        i < -[VCPProtoFilesystemMovieHumanActionClassificationResult identifiersCount](self, "identifiersCount");
        ++i)
  {
    v5 = -[VCPProtoFilesystemMovieHumanActionClassificationResult identifierAtIndex:](self, "identifierAtIndex:", i);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", &unk_1E6B71E40, v7);

  }
  memset(&v18, 0, sizeof(v18));
  -[VCPProtoFilesystemMovieHumanActionClassificationResult start](self, "start");
  CMTimeMakeWithSeconds(&v18, v8, 600);
  memset(&v17, 0, sizeof(v17));
  -[VCPProtoFilesystemMovieHumanActionClassificationResult duration](self, "duration");
  CMTimeMakeWithSeconds(&v17, v9, 600);
  memset(&v16, 0, sizeof(v16));
  start = v18;
  v14 = v17;
  CMTimeRangeMake(&v16, &start, &v14);
  range = v16;
  v10 = CMTimeRangeCopyAsDictionary(&range, 0);
  v11 = (void *)-[__CFDictionary mutableCopy](v10, "mutableCopy");

  v20 = CFSTR("humanActions");
  v21[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("attributes"));

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)VCPProtoFilesystemMovieHumanActionClassificationResult;
  -[VCPProtoFilesystemMovieHumanActionClassificationResult dealloc](&v3, sel_dealloc);
}

- (unint64_t)identifiersCount
{
  return self->_identifiers.count;
}

- (unsigned)identifiers
{
  return self->_identifiers.list;
}

- (void)clearIdentifiers
{
  PBRepeatedUInt32Clear();
}

- (void)addIdentifier:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)identifierAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_identifiers;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_identifiers = &self->_identifiers;
  count = self->_identifiers.count;
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
  return p_identifiers->list[a3];
}

- (void)setIdentifiers:(unsigned int *)a3 count:(unint64_t)a4
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
  v8.super_class = (Class)VCPProtoFilesystemMovieHumanActionClassificationResult;
  -[VCPProtoFilesystemMovieHumanActionClassificationResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoFilesystemMovieHumanActionClassificationResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = self->_start;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("start"));

  *(float *)&v6 = self->_duration;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("duration"));

  PBRepeatedUInt32NSArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("identifier"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoFilesystemMovieHumanActionClassificationResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_identifiers;
  unint64_t v5;
  id v6;

  v6 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  p_identifiers = &self->_identifiers;
  if (p_identifiers->count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < p_identifiers->count);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  id v8;

  v4 = a3;
  v4[9] = LODWORD(self->_start);
  v8 = v4;
  v4[8] = LODWORD(self->_duration);
  if (-[VCPProtoFilesystemMovieHumanActionClassificationResult identifiersCount](self, "identifiersCount"))
  {
    objc_msgSend(v8, "clearIdentifiers");
    v5 = -[VCPProtoFilesystemMovieHumanActionClassificationResult identifiersCount](self, "identifiersCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v8, "addIdentifier:", -[VCPProtoFilesystemMovieHumanActionClassificationResult identifierAtIndex:](self, "identifierAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  float *v4;

  v4 = (float *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[9] = self->_start;
  v4[8] = self->_duration;
  PBRepeatedUInt32Copy();
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  float *v4;
  char IsEqual;

  v4 = (float *)a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_start == v4[9]
    && self->_duration == v4[8])
  {
    IsEqual = PBRepeatedUInt32IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  float start;
  float v4;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  float duration;
  float v13;
  float v14;
  float v15;
  float v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;

  start = self->_start;
  v4 = -start;
  if (start >= 0.0)
    v4 = self->_start;
  v5 = floorf(v4 + 0.5);
  v6 = (float)(v4 - v5) * 1.8447e19;
  v7 = fmodf(v5, 1.8447e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  duration = self->_duration;
  v13 = -duration;
  if (duration >= 0.0)
    v13 = self->_duration;
  v14 = floorf(v13 + 0.5);
  v15 = (float)(v13 - v14) * 1.8447e19;
  v16 = fmodf(v14, 1.8447e19);
  v17 = 2654435761u * (unint64_t)v16;
  v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0)
    v18 = 2654435761u * (unint64_t)v16;
  v19 = v17 - (unint64_t)fabsf(v15);
  if (v15 < 0.0)
    v20 = v19;
  else
    v20 = v18;
  return v20 ^ v11 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  float *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  float *v8;

  v4 = (float *)a3;
  self->_start = v4[9];
  self->_duration = v4[8];
  v8 = v4;
  v5 = objc_msgSend(v4, "identifiersCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[VCPProtoFilesystemMovieHumanActionClassificationResult addIdentifier:](self, "addIdentifier:", objc_msgSend(v8, "identifierAtIndex:", i));
  }

}

- (float)start
{
  return self->_start;
}

- (void)setStart:(float)a3
{
  self->_start = a3;
}

- (float)duration
{
  return self->_duration;
}

- (void)setDuration:(float)a3
{
  self->_duration = a3;
}

@end

@implementation VCPProtoFilesystemMovieClassificationResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3;
  void *v4;
  VCPProtoFilesystemMovieClassificationResult *v5;
  Float64 Seconds;
  Float64 v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  _QWORD v17[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CMTime v22;
  CMTime v23;
  CMTime duration;
  CMTime start;
  CMTimeRange v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v26, 0, sizeof(v26));
  CMTimeRangeMakeFromDictionary(&v26, (CFDictionaryRef)v3);
  start = v26.start;
  duration = v26.duration;
  if ((v26.start.flags & 1) == 0)
    goto LABEL_2;
  v5 = 0;
  if ((v26.duration.flags & 1) != 0 && !v26.duration.epoch && (v26.duration.value & 0x8000000000000000) == 0)
  {
    if (!objc_msgSend(v4, "count"))
    {
LABEL_2:
      v5 = 0;
      goto LABEL_16;
    }
    v5 = objc_alloc_init(VCPProtoFilesystemMovieClassificationResult);
    v23 = start;
    Seconds = CMTimeGetSeconds(&v23);
    *(float *)&Seconds = Seconds;
    -[VCPProtoFilesystemMovieClassificationResult setStart:](v5, "setStart:", Seconds);
    v22 = duration;
    v7 = CMTimeGetSeconds(&v22);
    *(float *)&v7 = v7;
    -[VCPProtoFilesystemMovieClassificationResult setDuration:](v5, "setDuration:", v7);
    objc_msgSend(v4, "count");
    MEMORY[0x1E0C80A78]();
    v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    if (v11)
    {
      v17[1] = v17;
      v12 = 0;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        v15 = v12;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          *(_DWORD *)&v9[4 * (v15 + v14)] = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "longLongValue");
          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
        v12 = v15 + v14;
      }
      while (v11);
      v11 = (v15 + v14);
    }

    -[VCPProtoFilesystemMovieClassificationResult setIdentifiers:count:](v5, "setIdentifiers:count:", v9, v11);
  }
LABEL_16:

  return v5;
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
  CMTime v13;
  CMTime start;
  CMTimeRange v15;
  CMTime v16;
  CMTime v17;
  CMTimeRange range;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[VCPProtoFilesystemMovieClassificationResult identifiersCount](self, "identifiersCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < -[VCPProtoFilesystemMovieClassificationResult identifiersCount](self, "identifiersCount"); ++i)
  {
    v5 = -[VCPProtoFilesystemMovieClassificationResult identifierAtIndex:](self, "identifierAtIndex:", i);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", &unk_1E6B71EC0, v7);

  }
  memset(&v17, 0, sizeof(v17));
  -[VCPProtoFilesystemMovieClassificationResult start](self, "start");
  CMTimeMakeWithSeconds(&v17, v8, 600);
  memset(&v16, 0, sizeof(v16));
  -[VCPProtoFilesystemMovieClassificationResult duration](self, "duration");
  CMTimeMakeWithSeconds(&v16, v9, 600);
  memset(&v15, 0, sizeof(v15));
  start = v17;
  v13 = v16;
  CMTimeRangeMake(&v15, &start, &v13);
  range = v15;
  v10 = CMTimeRangeCopyAsDictionary(&range, 0);
  v11 = (void *)-[__CFDictionary mutableCopy](v10, "mutableCopy");

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v3, CFSTR("attributes"));
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)VCPProtoFilesystemMovieClassificationResult;
  -[VCPProtoFilesystemMovieClassificationResult dealloc](&v3, sel_dealloc);
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
  v8.super_class = (Class)VCPProtoFilesystemMovieClassificationResult;
  -[VCPProtoFilesystemMovieClassificationResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoFilesystemMovieClassificationResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  return VCPProtoFilesystemMovieClassificationResultReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (-[VCPProtoFilesystemMovieClassificationResult identifiersCount](self, "identifiersCount"))
  {
    objc_msgSend(v8, "clearIdentifiers");
    v5 = -[VCPProtoFilesystemMovieClassificationResult identifiersCount](self, "identifiersCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v8, "addIdentifier:", -[VCPProtoFilesystemMovieClassificationResult identifierAtIndex:](self, "identifierAtIndex:", i));
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
      -[VCPProtoFilesystemMovieClassificationResult addIdentifier:](self, "addIdentifier:", objc_msgSend(v8, "identifierAtIndex:", i));
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

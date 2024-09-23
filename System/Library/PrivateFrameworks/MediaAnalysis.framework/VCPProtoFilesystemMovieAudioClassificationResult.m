@implementation VCPProtoFilesystemMovieAudioClassificationResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v3;
  uint64_t v4;
  void *v5;
  VCPProtoFilesystemMovieAudioClassificationResult *v6;
  Float64 Seconds;
  Float64 v8;
  CMTime v10;
  CMTime time;
  CMTime duration;
  CMTime start;
  CMTimeRange v14;

  v3 = (const __CFDictionary *)a3;
  memset(&v14, 0, sizeof(v14));
  CMTimeRangeMakeFromDictionary(&v14, v3);
  start = v14.start;
  duration = v14.duration;
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("quality"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if ((v14.start.flags & 1) != 0)
  {
    v6 = 0;
    if ((v14.duration.flags & 1) != 0 && !v14.duration.epoch)
    {
      v6 = 0;
      if ((v14.duration.value & 0x8000000000000000) == 0)
      {
        if (v4)
        {
          v6 = objc_alloc_init(VCPProtoFilesystemMovieAudioClassificationResult);
          time = start;
          Seconds = CMTimeGetSeconds(&time);
          *(float *)&Seconds = Seconds;
          -[VCPProtoFilesystemMovieAudioClassificationResult setStart:](v6, "setStart:", Seconds);
          v10 = duration;
          v8 = CMTimeGetSeconds(&v10);
          *(float *)&v8 = v8;
          -[VCPProtoFilesystemMovieAudioClassificationResult setDuration:](v6, "setDuration:", v8);
        }
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)exportToLegacyDictionary
{
  float v3;
  float v4;
  CFDictionaryRef v5;
  void *v6;
  CMTime v8;
  CMTime start;
  CMTimeRange v10;
  CMTime v11;
  CMTime v12;
  CMTimeRange range;

  memset(&v12, 0, sizeof(v12));
  -[VCPProtoFilesystemMovieAudioClassificationResult start](self, "start");
  CMTimeMakeWithSeconds(&v12, v3, 600);
  memset(&v11, 0, sizeof(v11));
  -[VCPProtoFilesystemMovieAudioClassificationResult duration](self, "duration");
  CMTimeMakeWithSeconds(&v11, v4, 600);
  memset(&v10, 0, sizeof(v10));
  start = v12;
  v8 = v11;
  CMTimeRangeMake(&v10, &start, &v8);
  range = v10;
  v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)-[__CFDictionary mutableCopy](v5, "mutableCopy");

  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E6B71EA0, CFSTR("quality"));
  return v6;
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
  v8.super_class = (Class)VCPProtoFilesystemMovieAudioClassificationResult;
  -[VCPProtoFilesystemMovieAudioClassificationResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoFilesystemMovieAudioClassificationResult dictionaryRepresentation](self, "dictionaryRepresentation");
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

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoFilesystemMovieAudioClassificationResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();

}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 3) = LODWORD(self->_start);
  *((_DWORD *)a3 + 2) = LODWORD(self->_duration);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 3) = LODWORD(self->_start);
  *((_DWORD *)result + 2) = LODWORD(self->_duration);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  float *v4;
  BOOL v5;

  v4 = (float *)a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_start == v4[3]
    && self->_duration == v4[2];

  return v5;
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
  unint64_t v16;
  unint64_t v17;
  float v18;
  unint64_t v19;

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
  v16 = 2654435761u * (unint64_t)fmodf(v14, 1.8447e19);
  v17 = v16 + (unint64_t)v15;
  v18 = fabsf(v15);
  if (v15 <= 0.0)
    v17 = v16;
  v19 = v16 - (unint64_t)v18;
  if (v15 >= 0.0)
    v19 = v17;
  return v19 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  self->_start = *((float *)a3 + 3);
  self->_duration = *((float *)a3 + 2);
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

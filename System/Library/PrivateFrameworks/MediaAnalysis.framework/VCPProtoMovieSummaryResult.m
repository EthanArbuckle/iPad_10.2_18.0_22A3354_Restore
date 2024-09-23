@implementation VCPProtoMovieSummaryResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  VCPProtoMovieSummaryResult *v7;
  void *v9;
  void *v10;
  VCPProtoVideoKeyFrame *v11;
  const __CFDictionary *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSString *v16;
  NSString *v17;
  void *v18;
  CMTime v20;
  CMTime v21;
  CMTimeRange v22;
  CMTimeRange v23;
  NSRect v24;

  v3 = (const __CFDictionary *)a3;
  memset(&v23, 0, sizeof(v23));
  CMTimeRangeMakeFromDictionary(&v23, v3);
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("quality"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("flags"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if ((v23.start.flags & 1) != 0)
  {
    v7 = 0;
    if ((v23.duration.flags & 1) != 0 && !v23.duration.epoch)
    {
      v7 = 0;
      if ((v23.duration.value & 0x8000000000000000) == 0 && v5 && v4 != 0)
      {
        v7 = objc_alloc_init(VCPProtoMovieSummaryResult);
        v22 = v23;
        +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v22);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPProtoMovieSummaryResult setTimeRange:](v7, "setTimeRange:", v9);

        objc_msgSend(v4, "floatValue");
        -[VCPProtoMovieSummaryResult setCurationScore:](v7, "setCurationScore:");
        -[VCPProtoMovieSummaryResult setAutoPlayable:](v7, "setAutoPlayable:", ((unint64_t)objc_msgSend(v6, "unsignedIntegerValue") >> 19) & 1);
        -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("attributes"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = objc_alloc_init(VCPProtoVideoKeyFrame);
          memset(&v21, 0, sizeof(v21));
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("keyFrameTime"));
          v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CMTimeMakeFromDictionary(&v21, v12);

          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("keyFrameScore"));
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)v13;
          if ((v21.flags & 1) != 0 && v13)
          {
            v20 = v21;
            +[VCPProtoTime timeWithCMTime:](VCPProtoTime, "timeWithCMTime:", &v20);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCPProtoVideoKeyFrame setTimestamp:](v11, "setTimestamp:", v15);

            objc_msgSend(v14, "floatValue");
            -[VCPProtoVideoKeyFrame setCurationScore:](v11, "setCurationScore:");
            -[VCPProtoMovieSummaryResult setKeyFrame:](v7, "setKeyFrame:", v11);
          }
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bestPlaybackCrop"));
          v16 = (NSString *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            v24 = NSRectFromString(v16);
            +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[VCPProtoMovieSummaryResult setPlaybackCrop:](v7, "setPlaybackCrop:", v18);

          }
        }

      }
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
  CFDictionaryRef v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  CFDictionaryRef v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  CMTimeEpoch v23;
  CMTimeRange v24;
  CMTimeRange range;
  NSRect v26;

  -[VCPProtoMovieSummaryResult timeRange](self, "timeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "timeRangeValue");
  else
    memset(&v24, 0, sizeof(v24));
  range = v24;
  v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)-[__CFDictionary mutableCopy](v5, "mutableCopy");

  if (-[VCPProtoMovieSummaryResult autoPlayable](self, "autoPlayable"))
    v7 = 0x80000;
  else
    v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("flags"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoMovieSummaryResult curationScore](self, "curationScore");
  objc_msgSend(v9, "numberWithFloat:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("quality"));

  -[VCPProtoMovieSummaryResult keyFrame](self, "keyFrame");
  v11 = objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieSummaryResult playbackCrop](self, "playbackCrop");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 | v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend((id)v11, "timestamp");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "timeValue");
      }
      else
      {
        v22 = 0uLL;
        v23 = 0;
      }
      *(_OWORD *)&range.start.value = v22;
      range.start.epoch = v23;
      v16 = CMTimeCopyAsDictionary(&range.start, 0);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("keyFrameTime"));

      v17 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend((id)v11, "curationScore");
      objc_msgSend(v17, "numberWithFloat:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("keyFrameScore"));

    }
    if (v12)
    {
      -[VCPProtoMovieSummaryResult playbackCrop](self, "playbackCrop");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "rectValue");
      NSStringFromRect(v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, CFSTR("bestPlaybackCrop"));

    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("attributes"));

  }
  return v6;
}

- (BOOL)hasKeyFrame
{
  return self->_keyFrame != 0;
}

- (BOOL)hasPlaybackCrop
{
  return self->_playbackCrop != 0;
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
  v8.super_class = (Class)VCPProtoMovieSummaryResult;
  -[VCPProtoMovieSummaryResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieSummaryResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  VCPProtoTimeRange *timeRange;
  void *v6;
  void *v7;
  VCPProtoVideoKeyFrame *keyFrame;
  void *v9;
  void *v10;
  VCPProtoBounds *playbackCrop;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timeRange = self->_timeRange;
  if (timeRange)
  {
    -[VCPProtoTimeRange dictionaryRepresentation](timeRange, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("timeRange"));

  }
  *(float *)&v4 = self->_curationScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("curationScore"));

  keyFrame = self->_keyFrame;
  if (keyFrame)
  {
    -[VCPProtoVideoKeyFrame dictionaryRepresentation](keyFrame, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("keyFrame"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_autoPlayable);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("autoPlayable"));

  playbackCrop = self->_playbackCrop;
  if (playbackCrop)
  {
    -[VCPProtoBounds dictionaryRepresentation](playbackCrop, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("playbackCrop"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieSummaryResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteFloatField();
  if (self->_keyFrame)
    PBDataWriterWriteSubmessage();
  PBDataWriterWriteBOOLField();
  if (self->_playbackCrop)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  float *v4;
  float *v5;

  v5 = (float *)a3;
  objc_msgSend(v5, "setTimeRange:", self->_timeRange);
  v4 = v5;
  v5[2] = self->_curationScore;
  if (self->_keyFrame)
  {
    objc_msgSend(v5, "setKeyFrame:");
    v4 = v5;
  }
  *((_BYTE *)v4 + 40) = self->_autoPlayable;
  if (self->_playbackCrop)
  {
    objc_msgSend(v5, "setPlaybackCrop:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoTimeRange copyWithZone:](self->_timeRange, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  *(float *)(v5 + 8) = self->_curationScore;
  v8 = -[VCPProtoVideoKeyFrame copyWithZone:](self->_keyFrame, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  *(_BYTE *)(v5 + 40) = self->_autoPlayable;
  v10 = -[VCPProtoBounds copyWithZone:](self->_playbackCrop, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  VCPProtoTimeRange *timeRange;
  VCPProtoVideoKeyFrame *keyFrame;
  VCPProtoBounds *playbackCrop;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  timeRange = self->_timeRange;
  if ((unint64_t)timeRange | *((_QWORD *)v4 + 4))
  {
    if (!-[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
      goto LABEL_12;
  }
  if (self->_curationScore != *((float *)v4 + 2))
    goto LABEL_12;
  keyFrame = self->_keyFrame;
  if ((unint64_t)keyFrame | *((_QWORD *)v4 + 2))
  {
    if (!-[VCPProtoVideoKeyFrame isEqual:](keyFrame, "isEqual:"))
      goto LABEL_12;
  }
  if (self->_autoPlayable)
  {
    if (*((_BYTE *)v4 + 40))
      goto LABEL_9;
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  if (*((_BYTE *)v4 + 40))
    goto LABEL_12;
LABEL_9:
  playbackCrop = self->_playbackCrop;
  if ((unint64_t)playbackCrop | *((_QWORD *)v4 + 3))
    v8 = -[VCPProtoBounds isEqual:](playbackCrop, "isEqual:");
  else
    v8 = 1;
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  float curationScore;
  float v5;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = -[VCPProtoTimeRange hash](self->_timeRange, "hash");
  curationScore = self->_curationScore;
  v5 = -curationScore;
  if (curationScore >= 0.0)
    v5 = self->_curationScore;
  v6 = floorf(v5 + 0.5);
  v7 = (float)(v5 - v6) * 1.8447e19;
  v8 = fmodf(v6, 1.8447e19);
  v9 = 2654435761u * (unint64_t)v8;
  v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0)
    v10 = 2654435761u * (unint64_t)v8;
  v11 = v9 - (unint64_t)fabsf(v7);
  if (v7 < 0.0)
    v12 = v11;
  else
    v12 = v10;
  v13 = v3 ^ -[VCPProtoVideoKeyFrame hash](self->_keyFrame, "hash") ^ (2654435761 * self->_autoPlayable);
  return v12 ^ v13 ^ -[VCPProtoBounds hash](self->_playbackCrop, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  VCPProtoTimeRange *timeRange;
  uint64_t v6;
  VCPProtoVideoKeyFrame *keyFrame;
  uint64_t v8;
  VCPProtoBounds *playbackCrop;
  uint64_t v10;
  id v11;

  v4 = a3;
  timeRange = self->_timeRange;
  v6 = *((_QWORD *)v4 + 4);
  v11 = v4;
  if (timeRange)
  {
    if (!v6)
      goto LABEL_7;
    -[VCPProtoTimeRange mergeFrom:](timeRange, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[VCPProtoMovieSummaryResult setTimeRange:](self, "setTimeRange:");
  }
  v4 = v11;
LABEL_7:
  self->_curationScore = *((float *)v4 + 2);
  keyFrame = self->_keyFrame;
  v8 = *((_QWORD *)v4 + 2);
  if (keyFrame)
  {
    if (!v8)
      goto LABEL_13;
    -[VCPProtoVideoKeyFrame mergeFrom:](keyFrame, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[VCPProtoMovieSummaryResult setKeyFrame:](self, "setKeyFrame:");
  }
  v4 = v11;
LABEL_13:
  self->_autoPlayable = *((_BYTE *)v4 + 40);
  playbackCrop = self->_playbackCrop;
  v10 = *((_QWORD *)v4 + 3);
  if (playbackCrop)
  {
    if (v10)
    {
      -[VCPProtoBounds mergeFrom:](playbackCrop, "mergeFrom:");
LABEL_18:
      v4 = v11;
    }
  }
  else if (v10)
  {
    -[VCPProtoMovieSummaryResult setPlaybackCrop:](self, "setPlaybackCrop:");
    goto LABEL_18;
  }

}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_timeRange, a3);
}

- (float)curationScore
{
  return self->_curationScore;
}

- (void)setCurationScore:(float)a3
{
  self->_curationScore = a3;
}

- (VCPProtoVideoKeyFrame)keyFrame
{
  return self->_keyFrame;
}

- (void)setKeyFrame:(id)a3
{
  objc_storeStrong((id *)&self->_keyFrame, a3);
}

- (BOOL)autoPlayable
{
  return self->_autoPlayable;
}

- (void)setAutoPlayable:(BOOL)a3
{
  self->_autoPlayable = a3;
}

- (VCPProtoBounds)playbackCrop
{
  return self->_playbackCrop;
}

- (void)setPlaybackCrop:(id)a3
{
  objc_storeStrong((id *)&self->_playbackCrop, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_playbackCrop, 0);
  objc_storeStrong((id *)&self->_keyFrame, 0);
}

@end

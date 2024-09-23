@implementation VCPProtoMovieHighlightResult

- (BOOL)hasColorNormalizationBlob
{
  return self->_colorNormalizationBlob != 0;
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
  v8.super_class = (Class)VCPProtoMovieHighlightResult;
  -[VCPProtoMovieHighlightResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieHighlightResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  VCPProtoBounds *playbackCrop;
  void *v11;
  NSData *colorNormalizationBlob;

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
  playbackCrop = self->_playbackCrop;
  if (playbackCrop)
  {
    -[VCPProtoBounds dictionaryRepresentation](playbackCrop, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("playbackCrop"));

  }
  colorNormalizationBlob = self->_colorNormalizationBlob;
  if (colorNormalizationBlob)
    objc_msgSend(v3, "setObject:forKey:", colorNormalizationBlob, CFSTR("colorNormalizationBlob"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieHighlightResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();
  if (self->_colorNormalizationBlob)
    PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  float *v4;

  v4 = (float *)a3;
  objc_msgSend(v4, "setTimeRange:", self->_timeRange);
  v4[4] = self->_curationScore;
  objc_msgSend(v4, "setKeyFrame:", self->_keyFrame);
  objc_msgSend(v4, "setPlaybackCrop:", self->_playbackCrop);
  if (self->_colorNormalizationBlob)
    objc_msgSend(v4, "setColorNormalizationBlob:");

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
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoTimeRange copyWithZone:](self->_timeRange, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  *(float *)(v5 + 16) = self->_curationScore;
  v8 = -[VCPProtoVideoKeyFrame copyWithZone:](self->_keyFrame, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[VCPProtoBounds copyWithZone:](self->_playbackCrop, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  v12 = -[NSData copyWithZone:](self->_colorNormalizationBlob, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  VCPProtoTimeRange *timeRange;
  VCPProtoVideoKeyFrame *keyFrame;
  VCPProtoBounds *playbackCrop;
  NSData *colorNormalizationBlob;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((timeRange = self->_timeRange, !((unint64_t)timeRange | v4[5]))
     || -[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
    && self->_curationScore == *((float *)v4 + 4)
    && ((keyFrame = self->_keyFrame, !((unint64_t)keyFrame | v4[3]))
     || -[VCPProtoVideoKeyFrame isEqual:](keyFrame, "isEqual:"))
    && ((playbackCrop = self->_playbackCrop, !((unint64_t)playbackCrop | v4[4]))
     || -[VCPProtoBounds isEqual:](playbackCrop, "isEqual:")))
  {
    colorNormalizationBlob = self->_colorNormalizationBlob;
    if ((unint64_t)colorNormalizationBlob | v4[1])
      v9 = -[NSData isEqual:](colorNormalizationBlob, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
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
  unint64_t v14;

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
  v13 = v3 ^ -[VCPProtoVideoKeyFrame hash](self->_keyFrame, "hash");
  v14 = v13 ^ -[VCPProtoBounds hash](self->_playbackCrop, "hash");
  return v12 ^ v14 ^ -[NSData hash](self->_colorNormalizationBlob, "hash");
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
  v6 = *((_QWORD *)v4 + 5);
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
    -[VCPProtoMovieHighlightResult setTimeRange:](self, "setTimeRange:");
  }
  v4 = v11;
LABEL_7:
  self->_curationScore = *((float *)v4 + 4);
  keyFrame = self->_keyFrame;
  v8 = *((_QWORD *)v4 + 3);
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
    -[VCPProtoMovieHighlightResult setKeyFrame:](self, "setKeyFrame:");
  }
  v4 = v11;
LABEL_13:
  playbackCrop = self->_playbackCrop;
  v10 = *((_QWORD *)v4 + 4);
  if (playbackCrop)
  {
    if (!v10)
      goto LABEL_19;
    -[VCPProtoBounds mergeFrom:](playbackCrop, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[VCPProtoMovieHighlightResult setPlaybackCrop:](self, "setPlaybackCrop:");
  }
  v4 = v11;
LABEL_19:
  if (*((_QWORD *)v4 + 1))
  {
    -[VCPProtoMovieHighlightResult setColorNormalizationBlob:](self, "setColorNormalizationBlob:");
    v4 = v11;
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

- (VCPProtoBounds)playbackCrop
{
  return self->_playbackCrop;
}

- (void)setPlaybackCrop:(id)a3
{
  objc_storeStrong((id *)&self->_playbackCrop, a3);
}

- (NSData)colorNormalizationBlob
{
  return self->_colorNormalizationBlob;
}

- (void)setColorNormalizationBlob:(id)a3
{
  objc_storeStrong((id *)&self->_colorNormalizationBlob, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
  objc_storeStrong((id *)&self->_playbackCrop, 0);
  objc_storeStrong((id *)&self->_keyFrame, 0);
  objc_storeStrong((id *)&self->_colorNormalizationBlob, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  const __CFDictionary *v3;
  uint64_t v4;
  void *v5;
  VCPProtoMovieHighlightResult *v6;
  VCPProtoMovieHighlightResult *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  void *v14;
  VCPProtoVideoKeyFrame *v15;
  const __CFDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  CMTime v20;
  CMTime v21;
  CMTimeRange v22;
  CMTimeRange v23;
  NSRect v24;

  v3 = (const __CFDictionary *)a3;
  memset(&v23, 0, sizeof(v23));
  CMTimeRangeMakeFromDictionary(&v23, v3);
  -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("quality"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if ((v23.start.flags & 1) == 0)
  {
    v6 = 0;
    goto LABEL_3;
  }
  v6 = 0;
  if ((v23.duration.flags & 1) != 0 && !v23.duration.epoch)
  {
    v6 = 0;
    if ((v23.duration.value & 0x8000000000000000) == 0)
    {
      if (v4)
      {
        v8 = objc_alloc_init(VCPProtoMovieHighlightResult);
        v22 = v23;
        +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v22);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPProtoMovieHighlightResult setTimeRange:](v8, "setTimeRange:", v9);

        objc_msgSend(v5, "floatValue");
        -[VCPProtoMovieHighlightResult setCurationScore:](v8, "setCurationScore:");
        -[__CFDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("attributes"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bestPlaybackCrop"));
          v12 = (NSString *)objc_claimAutoreleasedReturnValue();
          v6 = (VCPProtoMovieHighlightResult *)v12;
          if (!v12)
          {
LABEL_17:

            goto LABEL_3;
          }
          v24 = NSRectFromString(v12);
          +[VCPProtoBounds boundsWithCGRect:](VCPProtoBounds, "boundsWithCGRect:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPProtoMovieHighlightResult setPlaybackCrop:](v8, "setPlaybackCrop:", v13);

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("colorNormalizationData"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            -[VCPProtoMovieHighlightResult setColorNormalizationBlob:](v8, "setColorNormalizationBlob:", v14);
          v15 = objc_alloc_init(VCPProtoVideoKeyFrame);
          memset(&v21, 0, sizeof(v21));
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("keyFrameTime"));
          v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CMTimeMakeFromDictionary(&v21, v16);

          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("keyFrameScore"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if ((v21.flags & 1) == 0 || !v17)
          {

            v6 = 0;
            goto LABEL_17;
          }
          v20 = v21;
          +[VCPProtoTime timeWithCMTime:](VCPProtoTime, "timeWithCMTime:", &v20);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPProtoVideoKeyFrame setTimestamp:](v15, "setTimestamp:", v19);

          objc_msgSend(v18, "floatValue");
          -[VCPProtoVideoKeyFrame setCurationScore:](v15, "setCurationScore:");
          -[VCPProtoMovieHighlightResult setKeyFrame:](v8, "setKeyFrame:", v15);

        }
        v6 = v8;
        goto LABEL_17;
      }
    }
  }
LABEL_3:

  return v6;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  CFDictionaryRef v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CFDictionaryRef v17;
  void *v18;
  void *v19;
  __int128 v21;
  CMTimeEpoch v22;
  CMTimeRange v23;
  CMTimeRange range;
  NSRect v25;

  -[VCPProtoMovieHighlightResult timeRange](self, "timeRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "timeRangeValue");
  else
    memset(&v23, 0, sizeof(v23));
  range = v23;
  v5 = CMTimeRangeCopyAsDictionary(&range, 0);
  v6 = (void *)-[__CFDictionary mutableCopy](v5, "mutableCopy");

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoMovieHighlightResult curationScore](self, "curationScore");
  objc_msgSend(v7, "numberWithFloat:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("quality"));

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieHighlightResult playbackCrop](self, "playbackCrop");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rectValue");
  NSStringFromRect(v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("bestPlaybackCrop"));

  if (-[VCPProtoMovieHighlightResult hasColorNormalizationBlob](self, "hasColorNormalizationBlob"))
  {
    -[VCPProtoMovieHighlightResult colorNormalizationBlob](self, "colorNormalizationBlob");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("colorNormalizationData"));

  }
  -[VCPProtoMovieHighlightResult keyFrame](self, "keyFrame");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "timestamp");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "timeValue");
    }
    else
    {
      v21 = 0uLL;
      v22 = 0;
    }
    *(_OWORD *)&range.start.value = v21;
    range.start.epoch = v22;
    v17 = CMTimeCopyAsDictionary(&range.start, 0);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("keyFrameTime"));

    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v14, "curationScore");
    objc_msgSend(v18, "numberWithFloat:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("keyFrameScore"));

  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("attributes"));

  return v6;
}

@end

@implementation VCPProtoMovieSceneResult

- (void)setDistanceToPreviousScene:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_distanceToPreviousScene = a3;
}

- (void)setHasDistanceToPreviousScene:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDistanceToPreviousScene
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setFlickerScore:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_flickerScore = a3;
}

- (void)setHasFlickerScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFlickerScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSceneprintDistanceToPreviousScene:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_sceneprintDistanceToPreviousScene = a3;
}

- (void)setHasSceneprintDistanceToPreviousScene:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSceneprintDistanceToPreviousScene
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)VCPProtoMovieSceneResult;
  -[VCPProtoMovieSceneResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieSceneResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  double v8;
  char has;
  void *v10;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  timeRange = self->_timeRange;
  if (timeRange)
  {
    -[VCPProtoTimeRange dictionaryRepresentation](timeRange, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("timeRange"));

  }
  *(float *)&v4 = self->_qualityScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("qualityScore"));

  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
LABEL_9:
    *(float *)&v8 = self->_flickerScore;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("flickerScore"));

    if ((*(_BYTE *)&self->_has & 4) == 0)
      return v3;
    goto LABEL_6;
  }
  *(float *)&v8 = self->_distanceToPreviousScene;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("distanceToPreviousScene"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    *(float *)&v8 = self->_sceneprintDistanceToPreviousScene;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("sceneprintDistanceToPreviousScene"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieSceneResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    PBDataWriterWriteFloatField();
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  PBDataWriterWriteFloatField();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
LABEL_4:
    PBDataWriterWriteFloatField();
LABEL_5:

}

- (void)copyTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setTimeRange:", self->_timeRange);
  *((_DWORD *)v5 + 4) = LODWORD(self->_qualityScore);
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *((_DWORD *)v5 + 3) = LODWORD(self->_flickerScore);
    *((_BYTE *)v5 + 32) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)v5 + 2) = LODWORD(self->_distanceToPreviousScene);
  *((_BYTE *)v5 + 32) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 5) = LODWORD(self->_sceneprintDistanceToPreviousScene);
    *((_BYTE *)v5 + 32) |= 4u;
  }
LABEL_5:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoTimeRange copyWithZone:](self->_timeRange, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  *(float *)(v5 + 16) = self->_qualityScore;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(float *)(v5 + 12) = self->_flickerScore;
    *(_BYTE *)(v5 + 32) |= 2u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_4;
  }
  *(float *)(v5 + 8) = self->_distanceToPreviousScene;
  *(_BYTE *)(v5 + 32) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(float *)(v5 + 20) = self->_sceneprintDistanceToPreviousScene;
    *(_BYTE *)(v5 + 32) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  VCPProtoTimeRange *timeRange;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  timeRange = self->_timeRange;
  if ((unint64_t)timeRange | *((_QWORD *)v4 + 3))
  {
    if (!-[VCPProtoTimeRange isEqual:](timeRange, "isEqual:"))
      goto LABEL_19;
  }
  if (self->_qualityScore != *((float *)v4 + 4))
    goto LABEL_19;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_distanceToPreviousScene != *((float *)v4 + 2))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_19:
    v6 = 0;
    goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_flickerScore != *((float *)v4 + 3))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }
  v6 = (*((_BYTE *)v4 + 32) & 4) == 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_sceneprintDistanceToPreviousScene != *((float *)v4 + 5))
      goto LABEL_19;
    v6 = 1;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  float qualityScore;
  float v5;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char has;
  unint64_t v14;
  float distanceToPreviousScene;
  float v16;
  float v17;
  float v18;
  unint64_t v19;
  float flickerScore;
  float v21;
  float v22;
  float v23;
  float v24;
  unint64_t v25;
  float sceneprintDistanceToPreviousScene;
  float v27;
  float v28;
  float v29;
  float v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;

  v3 = -[VCPProtoTimeRange hash](self->_timeRange, "hash");
  qualityScore = self->_qualityScore;
  v5 = -qualityScore;
  if (qualityScore >= 0.0)
    v5 = self->_qualityScore;
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
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    distanceToPreviousScene = self->_distanceToPreviousScene;
    v16 = -distanceToPreviousScene;
    if (distanceToPreviousScene >= 0.0)
      v16 = self->_distanceToPreviousScene;
    v17 = floorf(v16 + 0.5);
    v18 = (float)(v16 - v17) * 1.8447e19;
    v14 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabsf(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((has & 2) != 0)
  {
    flickerScore = self->_flickerScore;
    v21 = -flickerScore;
    if (flickerScore >= 0.0)
      v21 = self->_flickerScore;
    v22 = floorf(v21 + 0.5);
    v23 = (float)(v21 - v22) * 1.8447e19;
    v24 = fmodf(v22, 1.8447e19);
    v25 = 2654435761u * (unint64_t)v24;
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 = v25 + (unint64_t)v23;
      else
        v19 = 2654435761u * (unint64_t)v24;
      if ((has & 4) == 0)
        goto LABEL_34;
    }
    else
    {
      v19 = v25 - (unint64_t)fabsf(v23);
      if ((has & 4) == 0)
      {
LABEL_34:
        v33 = 0;
        return v12 ^ v3 ^ v14 ^ v19 ^ v33;
      }
    }
  }
  else
  {
    v19 = 0;
    if ((has & 4) == 0)
      goto LABEL_34;
  }
  sceneprintDistanceToPreviousScene = self->_sceneprintDistanceToPreviousScene;
  v27 = -sceneprintDistanceToPreviousScene;
  if (sceneprintDistanceToPreviousScene >= 0.0)
    v27 = self->_sceneprintDistanceToPreviousScene;
  v28 = floorf(v27 + 0.5);
  v29 = (float)(v27 - v28) * 1.8447e19;
  v30 = fmodf(v28, 1.8447e19);
  v31 = 2654435761u * (unint64_t)v30;
  v32 = v31 + (unint64_t)v29;
  if (v29 <= 0.0)
    v32 = 2654435761u * (unint64_t)v30;
  v33 = v31 - (unint64_t)fabsf(v29);
  if (v29 >= 0.0)
    v33 = v32;
  return v12 ^ v3 ^ v14 ^ v19 ^ v33;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  VCPProtoTimeRange *timeRange;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  timeRange = self->_timeRange;
  v6 = *((_QWORD *)v4 + 3);
  if (timeRange)
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[VCPProtoTimeRange mergeFrom:](timeRange, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    v8 = v4;
    -[VCPProtoMovieSceneResult setTimeRange:](self, "setTimeRange:");
  }
  v4 = v8;
LABEL_7:
  self->_qualityScore = *((float *)v4 + 4);
  v7 = *((_BYTE *)v4 + 32);
  if ((v7 & 1) == 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0)
      goto LABEL_9;
LABEL_13:
    self->_flickerScore = *((float *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    if ((*((_BYTE *)v4 + 32) & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  self->_distanceToPreviousScene = *((float *)v4 + 2);
  *(_BYTE *)&self->_has |= 1u;
  v7 = *((_BYTE *)v4 + 32);
  if ((v7 & 2) != 0)
    goto LABEL_13;
LABEL_9:
  if ((v7 & 4) != 0)
  {
LABEL_10:
    self->_sceneprintDistanceToPreviousScene = *((float *)v4 + 5);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_11:

}

- (VCPProtoTimeRange)timeRange
{
  return self->_timeRange;
}

- (void)setTimeRange:(id)a3
{
  objc_storeStrong((id *)&self->_timeRange, a3);
}

- (float)qualityScore
{
  return self->_qualityScore;
}

- (void)setQualityScore:(float)a3
{
  self->_qualityScore = a3;
}

- (float)distanceToPreviousScene
{
  return self->_distanceToPreviousScene;
}

- (float)flickerScore
{
  return self->_flickerScore;
}

- (float)sceneprintDistanceToPreviousScene
{
  return self->_sceneprintDistanceToPreviousScene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRange, 0);
}

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VCPProtoMovieSceneResult *v9;
  void *v10;
  CMTimeRange v12;
  CMTimeRange v13;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attributes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v13, 0, sizeof(v13));
  CMTimeRangeMakeFromDictionary(&v13, (CFDictionaryRef)v3);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("quality"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("distance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("slowMoFlicker"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sceneprintDistance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v13.start.flags & 1) != 0)
  {
    v9 = 0;
    if ((v13.duration.flags & 1) != 0 && !v13.duration.epoch)
    {
      v9 = 0;
      if ((v13.duration.value & 0x8000000000000000) == 0)
      {
        if (v5)
        {
          v9 = objc_alloc_init(VCPProtoMovieSceneResult);
          v12 = v13;
          +[VCPProtoTimeRange timeRangeWithCMTimeRange:](VCPProtoTimeRange, "timeRangeWithCMTimeRange:", &v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[VCPProtoMovieSceneResult setTimeRange:](v9, "setTimeRange:", v10);

          objc_msgSend(v5, "floatValue");
          -[VCPProtoMovieSceneResult setQualityScore:](v9, "setQualityScore:");
          if (v6)
          {
            objc_msgSend(v6, "floatValue");
            -[VCPProtoMovieSceneResult setDistanceToPreviousScene:](v9, "setDistanceToPreviousScene:");
          }
          if (v8)
          {
            objc_msgSend(v8, "floatValue");
            -[VCPProtoMovieSceneResult setSceneprintDistanceToPreviousScene:](v9, "setSceneprintDistanceToPreviousScene:");
          }
          if (v7)
          {
            objc_msgSend(v7, "floatValue");
            -[VCPProtoMovieSceneResult setFlickerScore:](v9, "setFlickerScore:");
          }
        }
      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CFDictionaryRef v12;
  void *v13;
  void *v14;
  void *v15;
  CMTimeRange v17;
  CMTimeRange range;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VCPProtoMovieSceneResult hasDistanceToPreviousScene](self, "hasDistanceToPreviousScene"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoMovieSceneResult distanceToPreviousScene](self, "distanceToPreviousScene");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("distance"));

  }
  if (-[VCPProtoMovieSceneResult hasSceneprintDistanceToPreviousScene](self, "hasSceneprintDistanceToPreviousScene"))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoMovieSceneResult sceneprintDistanceToPreviousScene](self, "sceneprintDistanceToPreviousScene");
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("sceneprintDistance"));

  }
  if (-[VCPProtoMovieSceneResult hasFlickerScore](self, "hasFlickerScore"))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoMovieSceneResult flickerScore](self, "flickerScore");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("slowMoFlicker"));

  }
  -[VCPProtoMovieSceneResult timeRange](self, "timeRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "timeRangeValue");
  else
    memset(&v17, 0, sizeof(v17));
  range = v17;
  v12 = CMTimeRangeCopyAsDictionary(&range, 0);
  v13 = (void *)-[__CFDictionary mutableCopy](v12, "mutableCopy");

  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoMovieSceneResult qualityScore](self, "qualityScore");
  objc_msgSend(v14, "numberWithFloat:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("quality"));

  if (objc_msgSend(v3, "count"))
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v3, CFSTR("attributes"));

  return v13;
}

@end

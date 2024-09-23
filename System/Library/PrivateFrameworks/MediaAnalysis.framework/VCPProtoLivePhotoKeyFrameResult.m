@implementation VCPProtoLivePhotoKeyFrameResult

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  VCPProtoLivePhotoKeyFrameResult *v6;
  void *v7;
  void *v8;
  VCPProtoLivePhotoKeyFrameResult *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("attributes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v9 = 0;
      goto LABEL_28;
    }
    v6 = objc_alloc_init(VCPProtoLivePhotoKeyFrameResult);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "doubleValue");
      -[VCPProtoLivePhotoKeyFrameResult setTimestamp:](v6, "setTimestamp:");
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("frameQualityScore"));
      v9 = (VCPProtoLivePhotoKeyFrameResult *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_26;
      -[VCPProtoLivePhotoKeyFrameResult floatValue](v9, "floatValue");
      -[VCPProtoLivePhotoKeyFrameResult setQualityScoreForLivePhoto:](v6, "setQualityScoreForLivePhoto:");
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("visualPleasingScore"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v10, "floatValue");
        -[VCPProtoLivePhotoKeyFrameResult setVisualPleasingScore:](v6, "setVisualPleasingScore:");
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("faceQualityScore"));
        v9 = (VCPProtoLivePhotoKeyFrameResult *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          goto LABEL_26;
        -[VCPProtoLivePhotoKeyFrameResult floatValue](v9, "floatValue");
        -[VCPProtoLivePhotoKeyFrameResult setOverallFaceQualityScore:](v6, "setOverallFaceQualityScore:");
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("exposureScore"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v11, "floatValue");
          -[VCPProtoLivePhotoKeyFrameResult setExposureScore:](v6, "setExposureScore:");
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("penaltyScore"));
          v9 = (VCPProtoLivePhotoKeyFrameResult *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            -[VCPProtoLivePhotoKeyFrameResult floatValue](v9, "floatValue");
            -[VCPProtoLivePhotoKeyFrameResult setPenaltyScore:](v6, "setPenaltyScore:");
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("textureScore"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
            {
              objc_msgSend(v12, "floatValue");
              -[VCPProtoLivePhotoKeyFrameResult setTextureScore:](v6, "setTextureScore:");
              objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sharpnessScore"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (v13)
              {
                objc_msgSend(v13, "floatValue");
                -[VCPProtoLivePhotoKeyFrameResult setSharpness:](v6, "setSharpness:");
                objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("expressionChangeScore"));
                v9 = (VCPProtoLivePhotoKeyFrameResult *)objc_claimAutoreleasedReturnValue();

                if (v9)
                {
                  -[VCPProtoLivePhotoKeyFrameResult floatValue](v9, "floatValue");
                  -[VCPProtoLivePhotoKeyFrameResult setExpressionChangeScore:](v6, "setExpressionChangeScore:");
                  v25 = 0u;
                  v26 = 0u;
                  v23 = 0u;
                  v24 = 0u;
                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FaceResults"), 0);
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
                  if (v15)
                  {
                    v16 = *(_QWORD *)v24;
                    do
                    {
                      for (i = 0; i != v15; ++i)
                      {
                        if (*(_QWORD *)v24 != v16)
                          objc_enumerationMutation(v14);
                        +[VCPProtoLivePhotoKeyFrameFaceResult resultFromLegacyDictionary:](VCPProtoLivePhotoKeyFrameFaceResult, "resultFromLegacyDictionary:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
                        v18 = (void *)objc_claimAutoreleasedReturnValue();
                        -[VCPProtoLivePhotoKeyFrameResult addFaceResults:](v6, "addFaceResults:", v18);

                      }
                      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
                    }
                    while (v15);
                  }

                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("globalQualityScore"));
                  v19 = (void *)objc_claimAutoreleasedReturnValue();

                  v20 = v19;
                  if (v19)
                  {
                    objc_msgSend(v19, "floatValue");
                    -[VCPProtoLivePhotoKeyFrameResult setGlobalQualityScore:](v6, "setGlobalQualityScore:");
                  }
                  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contentScore"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v21)
                  {
                    objc_msgSend(v21, "floatValue");
                    -[VCPProtoLivePhotoKeyFrameResult setContentScore:](v6, "setContentScore:");
                  }
                  v9 = v6;

                }
                goto LABEL_26;
              }
            }
            goto LABEL_25;
          }
LABEL_26:

LABEL_28:
          goto LABEL_29;
        }
      }
    }
LABEL_25:
    v9 = 0;
    goto LABEL_26;
  }
  v9 = 0;
LABEL_29:

  return v9;
}

- (id)exportToLegacyDictionary
{
  void *v3;
  unint64_t i;
  void *v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  _QWORD v37[10];
  _QWORD v38[12];

  v38[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; -[VCPProtoLivePhotoKeyFrameResult faceResultsCount](self, "faceResultsCount") > i; ++i)
  {
    -[VCPProtoLivePhotoKeyFrameResult faceResults](self, "faceResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "exportToLegacyDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  v8 = (void *)MEMORY[0x1E0C99E08];
  v37[0] = CFSTR("timestamp");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoLivePhotoKeyFrameResult timestamp](self, "timestamp");
  objc_msgSend(v9, "numberWithDouble:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v34;
  v37[1] = CFSTR("frameQualityScore");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoLivePhotoKeyFrameResult qualityScoreForLivePhoto](self, "qualityScoreForLivePhoto");
  objc_msgSend(v10, "numberWithFloat:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v33;
  v37[2] = CFSTR("visualPleasingScore");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoLivePhotoKeyFrameResult visualPleasingScore](self, "visualPleasingScore");
  objc_msgSend(v11, "numberWithFloat:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v32;
  v37[3] = CFSTR("faceQualityScore");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoLivePhotoKeyFrameResult overallFaceQualityScore](self, "overallFaceQualityScore");
  objc_msgSend(v12, "numberWithFloat:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v31;
  v37[4] = CFSTR("exposureScore");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoLivePhotoKeyFrameResult exposureScore](self, "exposureScore");
  objc_msgSend(v13, "numberWithFloat:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v14;
  v37[5] = CFSTR("penaltyScore");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoLivePhotoKeyFrameResult penaltyScore](self, "penaltyScore");
  objc_msgSend(v15, "numberWithFloat:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[5] = v16;
  v37[6] = CFSTR("textureScore");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoLivePhotoKeyFrameResult textureScore](self, "textureScore");
  objc_msgSend(v17, "numberWithFloat:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[6] = v18;
  v37[7] = CFSTR("sharpnessScore");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoLivePhotoKeyFrameResult sharpness](self, "sharpness");
  objc_msgSend(v19, "numberWithFloat:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[7] = v20;
  v37[8] = CFSTR("expressionChangeScore");
  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[VCPProtoLivePhotoKeyFrameResult expressionChangeScore](self, "expressionChangeScore");
  objc_msgSend(v21, "numberWithFloat:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[9] = CFSTR("FaceResults");
  v38[8] = v22;
  v38[9] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithDictionary:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[VCPProtoLivePhotoKeyFrameResult hasGlobalQualityScore](self, "hasGlobalQualityScore"))
  {
    v25 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoLivePhotoKeyFrameResult globalQualityScore](self, "globalQualityScore");
    objc_msgSend(v25, "numberWithFloat:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("globalQualityScore"));

  }
  if (-[VCPProtoLivePhotoKeyFrameResult hasContentScore](self, "hasContentScore"))
  {
    v27 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoLivePhotoKeyFrameResult contentScore](self, "contentScore");
    objc_msgSend(v27, "numberWithFloat:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v28, CFSTR("contentScore"));

  }
  v35 = CFSTR("attributes");
  v36 = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (void)clearFaceResults
{
  -[NSMutableArray removeAllObjects](self->_faceResults, "removeAllObjects");
}

- (void)addFaceResults:(id)a3
{
  id v4;
  NSMutableArray *faceResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  faceResults = self->_faceResults;
  v8 = v4;
  if (!faceResults)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_faceResults;
    self->_faceResults = v6;

    v4 = v8;
    faceResults = self->_faceResults;
  }
  -[NSMutableArray addObject:](faceResults, "addObject:", v4);

}

- (unint64_t)faceResultsCount
{
  return -[NSMutableArray count](self->_faceResults, "count");
}

- (id)faceResultsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_faceResults, "objectAtIndex:", a3);
}

+ (Class)faceResultsType
{
  return (Class)objc_opt_class();
}

- (void)setGlobalQualityScore:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_globalQualityScore = a3;
}

- (void)setHasGlobalQualityScore:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGlobalQualityScore
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setContentScore:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_contentScore = a3;
}

- (void)setHasContentScore:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContentScore
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
  v8.super_class = (Class)VCPProtoLivePhotoKeyFrameResult;
  -[VCPProtoLivePhotoKeyFrameResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoLivePhotoKeyFrameResult dictionaryRepresentation](self, "dictionaryRepresentation");
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
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  char has;
  void *v28;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  *(float *)&v5 = self->_qualityScoreForLivePhoto;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("qualityScoreForLivePhoto"));

  *(float *)&v7 = self->_visualPleasingScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("visualPleasingScore"));

  *(float *)&v9 = self->_overallFaceQualityScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("overallFaceQualityScore"));

  *(float *)&v11 = self->_exposureScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("exposureScore"));

  *(float *)&v13 = self->_penaltyScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("penaltyScore"));

  *(float *)&v15 = self->_textureScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("textureScore"));

  *(float *)&v17 = self->_sharpness;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("sharpness"));

  if (-[NSMutableArray count](self->_faceResults, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_faceResults, "count"));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v21 = self->_faceResults;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v33 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v32);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("faceResults"));
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)&v19 = self->_globalQualityScore;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("globalQualityScore"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(float *)&v19 = self->_contentScore;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("contentScore"));

  }
  *(float *)&v19 = self->_expressionChangeScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19, (_QWORD)v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("expressionChangeScore"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLivePhotoKeyFrameResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char has;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_faceResults;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  char has;
  id v10;

  v4 = a3;
  v4[1] = *(_QWORD *)&self->_timestamp;
  *((_DWORD *)v4 + 13) = LODWORD(self->_qualityScoreForLivePhoto);
  *((_DWORD *)v4 + 16) = LODWORD(self->_visualPleasingScore);
  *((_DWORD *)v4 + 11) = LODWORD(self->_overallFaceQualityScore);
  *((_DWORD *)v4 + 5) = LODWORD(self->_exposureScore);
  *((_DWORD *)v4 + 12) = LODWORD(self->_penaltyScore);
  *((_DWORD *)v4 + 15) = LODWORD(self->_textureScore);
  v10 = v4;
  *((_DWORD *)v4 + 14) = LODWORD(self->_sharpness);
  if (-[VCPProtoLivePhotoKeyFrameResult faceResultsCount](self, "faceResultsCount"))
  {
    objc_msgSend(v10, "clearFaceResults");
    v5 = -[VCPProtoLivePhotoKeyFrameResult faceResultsCount](self, "faceResultsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[VCPProtoLivePhotoKeyFrameResult faceResultsAtIndex:](self, "faceResultsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addFaceResults:", v8);

      }
    }
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v10 + 10) = LODWORD(self->_globalQualityScore);
    *((_BYTE *)v10 + 68) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)v10 + 4) = LODWORD(self->_contentScore);
    *((_BYTE *)v10 + 68) |= 1u;
  }
  *((_DWORD *)v10 + 6) = LODWORD(self->_expressionChangeScore);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char has;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v5 + 8) = self->_timestamp;
  *(float *)(v5 + 52) = self->_qualityScoreForLivePhoto;
  *(float *)(v5 + 64) = self->_visualPleasingScore;
  *(float *)(v5 + 44) = self->_overallFaceQualityScore;
  *(float *)(v5 + 20) = self->_exposureScore;
  *(float *)(v5 + 48) = self->_penaltyScore;
  *(float *)(v5 + 60) = self->_textureScore;
  *(float *)(v5 + 56) = self->_sharpness;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_faceResults;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v14);
        objc_msgSend((id)v5, "addFaceResults:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)(v5 + 40) = self->_globalQualityScore;
    *(_BYTE *)(v5 + 68) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(float *)(v5 + 16) = self->_contentScore;
    *(_BYTE *)(v5 + 68) |= 1u;
  }
  *(float *)(v5 + 24) = self->_expressionChangeScore;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *faceResults;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  if (self->_timestamp != *((double *)v4 + 1))
    goto LABEL_23;
  if (self->_qualityScoreForLivePhoto != *((float *)v4 + 13))
    goto LABEL_23;
  if (self->_visualPleasingScore != *((float *)v4 + 16))
    goto LABEL_23;
  if (self->_overallFaceQualityScore != *((float *)v4 + 11))
    goto LABEL_23;
  if (self->_exposureScore != *((float *)v4 + 5))
    goto LABEL_23;
  if (self->_penaltyScore != *((float *)v4 + 12))
    goto LABEL_23;
  if (self->_textureScore != *((float *)v4 + 15))
    goto LABEL_23;
  if (self->_sharpness != *((float *)v4 + 14))
    goto LABEL_23;
  faceResults = self->_faceResults;
  if ((unint64_t)faceResults | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](faceResults, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_globalQualityScore != *((float *)v4 + 10))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
LABEL_23:
    v6 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_contentScore != *((float *)v4 + 4))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
    goto LABEL_23;
  }
  v6 = self->_expressionChangeScore == *((float *)v4 + 6);
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  double timestamp;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  unint64_t v10;
  float qualityScoreForLivePhoto;
  float v12;
  float v13;
  float v14;
  float v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  float visualPleasingScore;
  float v20;
  float v21;
  float v22;
  float v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  float overallFaceQualityScore;
  float v28;
  float v29;
  float v30;
  float v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  float exposureScore;
  float v37;
  float v38;
  float v39;
  float v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  float penaltyScore;
  float v46;
  float v47;
  float v48;
  float v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  float textureScore;
  float v55;
  float v56;
  float v57;
  float v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  float sharpness;
  float v64;
  float v65;
  float v66;
  float v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  char has;
  unint64_t v74;
  float globalQualityScore;
  float v76;
  float v77;
  float v78;
  float v79;
  unint64_t v80;
  float contentScore;
  float v82;
  float v83;
  float v84;
  float v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  float expressionChangeScore;
  float v91;
  float v92;
  float v93;
  float v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;

  timestamp = self->_timestamp;
  v4 = -timestamp;
  if (timestamp >= 0.0)
    v4 = self->_timestamp;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  v8 = v7 + (unint64_t)v6;
  v9 = fabs(v6);
  if (v6 <= 0.0)
    v8 = v7;
  v10 = v7 - (unint64_t)v9;
  if (v6 >= 0.0)
    v10 = v8;
  v101 = v10;
  qualityScoreForLivePhoto = self->_qualityScoreForLivePhoto;
  v12 = -qualityScoreForLivePhoto;
  if (qualityScoreForLivePhoto >= 0.0)
    v12 = self->_qualityScoreForLivePhoto;
  v13 = floorf(v12 + 0.5);
  v14 = (float)(v12 - v13) * 1.8447e19;
  v15 = fmodf(v13, 1.8447e19);
  v16 = 2654435761u * (unint64_t)v15;
  v17 = v16 + (unint64_t)v14;
  if (v14 <= 0.0)
    v17 = 2654435761u * (unint64_t)v15;
  v18 = v16 - (unint64_t)fabsf(v14);
  if (v14 >= 0.0)
    v18 = v17;
  v100 = v18;
  visualPleasingScore = self->_visualPleasingScore;
  v20 = -visualPleasingScore;
  if (visualPleasingScore >= 0.0)
    v20 = self->_visualPleasingScore;
  v21 = floorf(v20 + 0.5);
  v22 = (float)(v20 - v21) * 1.8447e19;
  v23 = fmodf(v21, 1.8447e19);
  v24 = 2654435761u * (unint64_t)v23;
  v25 = v24 + (unint64_t)v22;
  if (v22 <= 0.0)
    v25 = 2654435761u * (unint64_t)v23;
  v26 = v24 - (unint64_t)fabsf(v22);
  if (v22 >= 0.0)
    v26 = v25;
  v99 = v26;
  overallFaceQualityScore = self->_overallFaceQualityScore;
  v28 = -overallFaceQualityScore;
  if (overallFaceQualityScore >= 0.0)
    v28 = self->_overallFaceQualityScore;
  v29 = floorf(v28 + 0.5);
  v30 = (float)(v28 - v29) * 1.8447e19;
  v31 = fmodf(v29, 1.8447e19);
  v32 = 2654435761u * (unint64_t)v31;
  v33 = v32 + (unint64_t)v30;
  if (v30 <= 0.0)
    v33 = 2654435761u * (unint64_t)v31;
  v34 = v32 - (unint64_t)fabsf(v30);
  if (v30 < 0.0)
    v35 = v34;
  else
    v35 = v33;
  exposureScore = self->_exposureScore;
  v37 = -exposureScore;
  if (exposureScore >= 0.0)
    v37 = self->_exposureScore;
  v38 = floorf(v37 + 0.5);
  v39 = (float)(v37 - v38) * 1.8447e19;
  v40 = fmodf(v38, 1.8447e19);
  v41 = 2654435761u * (unint64_t)v40;
  v42 = v41 + (unint64_t)v39;
  if (v39 <= 0.0)
    v42 = 2654435761u * (unint64_t)v40;
  v43 = v41 - (unint64_t)fabsf(v39);
  if (v39 < 0.0)
    v44 = v43;
  else
    v44 = v42;
  penaltyScore = self->_penaltyScore;
  v46 = -penaltyScore;
  if (penaltyScore >= 0.0)
    v46 = self->_penaltyScore;
  v47 = floorf(v46 + 0.5);
  v48 = (float)(v46 - v47) * 1.8447e19;
  v49 = fmodf(v47, 1.8447e19);
  v50 = 2654435761u * (unint64_t)v49;
  v51 = v50 + (unint64_t)v48;
  if (v48 <= 0.0)
    v51 = 2654435761u * (unint64_t)v49;
  v52 = v50 - (unint64_t)fabsf(v48);
  if (v48 < 0.0)
    v53 = v52;
  else
    v53 = v51;
  textureScore = self->_textureScore;
  v55 = -textureScore;
  if (textureScore >= 0.0)
    v55 = self->_textureScore;
  v56 = floorf(v55 + 0.5);
  v57 = (float)(v55 - v56) * 1.8447e19;
  v58 = fmodf(v56, 1.8447e19);
  v59 = 2654435761u * (unint64_t)v58;
  v60 = v59 + (unint64_t)v57;
  if (v57 <= 0.0)
    v60 = 2654435761u * (unint64_t)v58;
  v61 = v59 - (unint64_t)fabsf(v57);
  if (v57 < 0.0)
    v62 = v61;
  else
    v62 = v60;
  sharpness = self->_sharpness;
  v64 = -sharpness;
  if (sharpness >= 0.0)
    v64 = self->_sharpness;
  v65 = floorf(v64 + 0.5);
  v66 = (float)(v64 - v65) * 1.8447e19;
  v67 = fmodf(v65, 1.8447e19);
  v68 = 2654435761u * (unint64_t)v67;
  v69 = v68 + (unint64_t)v66;
  if (v66 <= 0.0)
    v69 = 2654435761u * (unint64_t)v67;
  v70 = v68 - (unint64_t)fabsf(v66);
  if (v66 < 0.0)
    v71 = v70;
  else
    v71 = v69;
  v72 = -[NSMutableArray hash](self->_faceResults, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    globalQualityScore = self->_globalQualityScore;
    v76 = -globalQualityScore;
    if (globalQualityScore >= 0.0)
      v76 = self->_globalQualityScore;
    v77 = floorf(v76 + 0.5);
    v78 = (float)(v76 - v77) * 1.8447e19;
    v79 = fmodf(v77, 1.8447e19);
    v80 = 2654435761u * (unint64_t)v79;
    if (v78 >= 0.0)
    {
      if (v78 > 0.0)
        v74 = v80 + (unint64_t)v78;
      else
        v74 = 2654435761u * (unint64_t)v79;
      if ((has & 1) == 0)
        goto LABEL_72;
    }
    else
    {
      v74 = v80 - (unint64_t)fabsf(v78);
      if ((has & 1) == 0)
      {
LABEL_72:
        v89 = 0;
        goto LABEL_73;
      }
    }
  }
  else
  {
    v74 = 0;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_72;
  }
  contentScore = self->_contentScore;
  v82 = -contentScore;
  if (contentScore >= 0.0)
    v82 = self->_contentScore;
  v83 = floorf(v82 + 0.5);
  v84 = (float)(v82 - v83) * 1.8447e19;
  v85 = fmodf(v83, 1.8447e19);
  v86 = 2654435761u * (unint64_t)v85;
  v87 = v86 + (unint64_t)v84;
  if (v84 <= 0.0)
    v87 = 2654435761u * (unint64_t)v85;
  v88 = v86 - (unint64_t)fabsf(v84);
  if (v84 < 0.0)
    v89 = v88;
  else
    v89 = v87;
LABEL_73:
  expressionChangeScore = self->_expressionChangeScore;
  v91 = -expressionChangeScore;
  if (expressionChangeScore >= 0.0)
    v91 = self->_expressionChangeScore;
  v92 = floorf(v91 + 0.5);
  v93 = (float)(v91 - v92) * 1.8447e19;
  v94 = fmodf(v92, 1.8447e19);
  v95 = 2654435761u * (unint64_t)v94;
  v96 = v95 + (unint64_t)v93;
  if (v93 <= 0.0)
    v96 = 2654435761u * (unint64_t)v94;
  v97 = v95 - (unint64_t)fabsf(v93);
  if (v93 >= 0.0)
    v97 = v96;
  return v100 ^ v101 ^ v99 ^ v35 ^ v44 ^ v53 ^ v62 ^ v71 ^ v72 ^ v74 ^ v89 ^ v97;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_timestamp = *((double *)v4 + 1);
  self->_qualityScoreForLivePhoto = *((float *)v4 + 13);
  self->_visualPleasingScore = *((float *)v4 + 16);
  self->_overallFaceQualityScore = *((float *)v4 + 11);
  self->_exposureScore = *((float *)v4 + 5);
  self->_penaltyScore = *((float *)v4 + 12);
  self->_textureScore = *((float *)v4 + 15);
  self->_sharpness = *((float *)v4 + 14);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[VCPProtoLivePhotoKeyFrameResult addFaceResults:](self, "addFaceResults:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 68);
  if ((v10 & 2) != 0)
  {
    self->_globalQualityScore = *((float *)v4 + 10);
    *(_BYTE *)&self->_has |= 2u;
    v10 = *((_BYTE *)v4 + 68);
  }
  if ((v10 & 1) != 0)
  {
    self->_contentScore = *((float *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  self->_expressionChangeScore = *((float *)v4 + 6);

}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (float)qualityScoreForLivePhoto
{
  return self->_qualityScoreForLivePhoto;
}

- (void)setQualityScoreForLivePhoto:(float)a3
{
  self->_qualityScoreForLivePhoto = a3;
}

- (float)visualPleasingScore
{
  return self->_visualPleasingScore;
}

- (void)setVisualPleasingScore:(float)a3
{
  self->_visualPleasingScore = a3;
}

- (float)overallFaceQualityScore
{
  return self->_overallFaceQualityScore;
}

- (void)setOverallFaceQualityScore:(float)a3
{
  self->_overallFaceQualityScore = a3;
}

- (float)exposureScore
{
  return self->_exposureScore;
}

- (void)setExposureScore:(float)a3
{
  self->_exposureScore = a3;
}

- (float)penaltyScore
{
  return self->_penaltyScore;
}

- (void)setPenaltyScore:(float)a3
{
  self->_penaltyScore = a3;
}

- (float)textureScore
{
  return self->_textureScore;
}

- (void)setTextureScore:(float)a3
{
  self->_textureScore = a3;
}

- (float)sharpness
{
  return self->_sharpness;
}

- (void)setSharpness:(float)a3
{
  self->_sharpness = a3;
}

- (NSMutableArray)faceResults
{
  return self->_faceResults;
}

- (void)setFaceResults:(id)a3
{
  objc_storeStrong((id *)&self->_faceResults, a3);
}

- (float)globalQualityScore
{
  return self->_globalQualityScore;
}

- (float)contentScore
{
  return self->_contentScore;
}

- (float)expressionChangeScore
{
  return self->_expressionChangeScore;
}

- (void)setExpressionChangeScore:(float)a3
{
  self->_expressionChangeScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceResults, 0);
}

@end

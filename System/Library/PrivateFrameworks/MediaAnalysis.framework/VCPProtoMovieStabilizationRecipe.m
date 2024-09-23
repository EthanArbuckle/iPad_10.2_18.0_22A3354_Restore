@implementation VCPProtoMovieStabilizationRecipe

+ (id)resultFromLegacyDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  VCPProtoMovieStabilizationRecipe *v6;
  void *v7;
  uint64_t v8;
  VCPProtoMovieStabilizationRecipe *v9;
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
  const __CFDictionary *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  const __CFDictionary *v27;
  void *v28;
  uint64_t j;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  CMTime v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CMTime v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v36 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("stabCropRect"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_17;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("inputBounds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {

LABEL_17:
    v6 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sourceSize"));
  v6 = (VCPProtoMovieStabilizationRecipe *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

    goto LABEL_18;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("frameInstructions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
    goto LABEL_17;
  v9 = objc_alloc_init(VCPProtoMovieStabilizationRecipe);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("frameInstructions"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("stabCropRect"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("inputBounds"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sourceSize"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("X"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  -[VCPProtoMovieStabilizationRecipe setCropRectX:](v9, "setCropRectX:");

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Y"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  -[VCPProtoMovieStabilizationRecipe setCropRectY:](v9, "setCropRectY:");

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Width"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  -[VCPProtoMovieStabilizationRecipe setCropRectWidth:](v9, "setCropRectWidth:");

  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Height"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");
  -[VCPProtoMovieStabilizationRecipe setCropRectHeight:](v9, "setCropRectHeight:");

  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("X"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  -[VCPProtoMovieStabilizationRecipe setInputBoundsX:](v9, "setInputBoundsX:");

  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("Y"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  -[VCPProtoMovieStabilizationRecipe setInputBoundsY:](v9, "setInputBoundsY:");

  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("Width"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  -[VCPProtoMovieStabilizationRecipe setInputBoundsWidth:](v9, "setInputBoundsWidth:");

  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("Height"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  -[VCPProtoMovieStabilizationRecipe setInputBoundsHeight:](v9, "setInputBoundsHeight:");

  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Width"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  -[VCPProtoMovieStabilizationRecipe setSourceSizeWidth:](v9, "setSourceSizeWidth:");

  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("Height"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  -[VCPProtoMovieStabilizationRecipe setSourceSizeHeight:](v9, "setSourceSizeHeight:");

  memset(&v42, 0, sizeof(v42));
  objc_msgSend(v34, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("rawTime"));
  v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeFromDictionary(&v42, v21);

  -[VCPProtoMovieStabilizationRecipe setTimeScale:](v9, "setTimeScale:", v42.timescale);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v22 = v34;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v39 != v24)
          objc_enumerationMutation(v22);
        v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        memset(&v37, 0, sizeof(v37));
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("rawTime"));
        v27 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CMTimeMakeFromDictionary(&v37, v27);

        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("homography"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "count") != 9)
        {

          v6 = 0;
          goto LABEL_21;
        }
        -[VCPProtoMovieStabilizationRecipe addTimeValue:](v9, "addTimeValue:", v37.value);
        for (j = 0; j != 9; ++j)
        {
          objc_msgSend(v28, "objectAtIndexedSubscript:", j);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "floatValue");
          -[VCPProtoMovieStabilizationRecipe addHomographyParams:](v9, "addHomographyParams:");

        }
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v23)
        continue;
      break;
    }
  }

  v6 = v9;
LABEL_21:

LABEL_18:
  return v6;
}

- (id)exportToLegacyDictionary
{
  unint64_t v3;
  void *v4;
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
  unsigned int v25;
  unint64_t i;
  void *v27;
  void *v28;
  uint64_t j;
  void *v30;
  double v31;
  void *v32;
  CFDictionaryRef v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  CMTime v41;
  CMTime time;
  _QWORD v43[4];
  _QWORD v44[4];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[4];
  _QWORD v50[4];
  _QWORD v51[4];
  _QWORD v52[6];

  v52[4] = *MEMORY[0x1E0C80C00];
  if (-[VCPProtoMovieStabilizationRecipe homographyParamsCount](self, "homographyParamsCount")
    && -[VCPProtoMovieStabilizationRecipe timeValuesCount](self, "timeValuesCount")
    && (v3 = -[VCPProtoMovieStabilizationRecipe homographyParamsCount](self, "homographyParamsCount"),
        v3 == 9 * -[VCPProtoMovieStabilizationRecipe timeValuesCount](self, "timeValuesCount")))
  {
    v51[0] = CFSTR("X");
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoMovieStabilizationRecipe cropRectX](self, "cropRectX");
    objc_msgSend(v4, "numberWithFloat:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v5;
    v51[1] = CFSTR("Y");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoMovieStabilizationRecipe cropRectY](self, "cropRectY");
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v7;
    v51[2] = CFSTR("Width");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoMovieStabilizationRecipe cropRectWidth](self, "cropRectWidth");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2] = v9;
    v51[3] = CFSTR("Height");
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoMovieStabilizationRecipe cropRectHeight](self, "cropRectHeight");
    objc_msgSend(v10, "numberWithFloat:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v52[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v49[0] = CFSTR("X");
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoMovieStabilizationRecipe inputBoundsX](self, "inputBoundsX");
    objc_msgSend(v12, "numberWithFloat:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v13;
    v49[1] = CFSTR("Y");
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoMovieStabilizationRecipe inputBoundsY](self, "inputBoundsY");
    objc_msgSend(v14, "numberWithFloat:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v15;
    v49[2] = CFSTR("Width");
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoMovieStabilizationRecipe inputBoundsWidth](self, "inputBoundsWidth");
    objc_msgSend(v16, "numberWithFloat:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v17;
    v49[3] = CFSTR("Height");
    v18 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoMovieStabilizationRecipe inputBoundsHeight](self, "inputBoundsHeight");
    objc_msgSend(v18, "numberWithFloat:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v47[0] = CFSTR("Width");
    v20 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoMovieStabilizationRecipe sourceSizeWidth](self, "sourceSizeWidth");
    objc_msgSend(v20, "numberWithFloat:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = CFSTR("Height");
    v48[0] = v21;
    v22 = (void *)MEMORY[0x1E0CB37E8];
    -[VCPProtoMovieStabilizationRecipe sourceSizeHeight](self, "sourceSizeHeight");
    objc_msgSend(v22, "numberWithFloat:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    for (i = 0; -[VCPProtoMovieStabilizationRecipe timeValuesCount](self, "timeValuesCount", v38) > i; ++i)
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      memset(&v41, 0, sizeof(v41));
      CMTimeMake(&v41, -[VCPProtoMovieStabilizationRecipe timeValues](self, "timeValues")[8 * i], -[VCPProtoMovieStabilizationRecipe timeScale](self, "timeScale"));
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      for (j = 0; j != 36; j += 4)
      {
        v30 = (void *)MEMORY[0x1E0CB37E8];
        LODWORD(v31) = (_DWORD)(-[VCPProtoMovieStabilizationRecipe homographyParams](self, "homographyParams")
                              + 4 * v25)[j];
        objc_msgSend(v30, "numberWithFloat:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v32);

      }
      v45[0] = CFSTR("rawTime");
      time = v41;
      v33 = CMTimeCopyAsDictionary(&time, 0);
      v45[1] = CFSTR("homography");
      v46[0] = v33;
      v46[1] = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "addObject:", v34);
      v25 += 9;
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = CFSTR("stabCropRect");
    v43[1] = CFSTR("inputBounds");
    v44[0] = v38;
    v44[1] = v39;
    v43[2] = CFSTR("sourceSize");
    v43[3] = CFSTR("frameInstructions");
    v44[2] = v40;
    v44[3] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v35 = 0;
  }
  return v35;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)VCPProtoMovieStabilizationRecipe;
  -[VCPProtoMovieStabilizationRecipe dealloc](&v3, sel_dealloc);
}

- (unint64_t)timeValuesCount
{
  return self->_timeValues.count;
}

- (int64_t)timeValues
{
  return self->_timeValues.list;
}

- (void)clearTimeValues
{
  PBRepeatedInt64Clear();
}

- (void)addTimeValue:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)timeValueAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_timeValues;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_timeValues = &self->_timeValues;
  count = self->_timeValues.count;
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
  return p_timeValues->list[a3];
}

- (void)setTimeValues:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
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

- (void)addHomographyParams:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)homographyParamsAtIndex:(unint64_t)a3
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
  v8.super_class = (Class)VCPProtoMovieStabilizationRecipe;
  -[VCPProtoMovieStabilizationRecipe description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoMovieStabilizationRecipe dictionaryRepresentation](self, "dictionaryRepresentation");
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
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = self->_cropRectX;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("cropRectX"));

  *(float *)&v6 = self->_cropRectY;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("cropRectY"));

  *(float *)&v8 = self->_cropRectHeight;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("cropRectHeight"));

  *(float *)&v10 = self->_cropRectWidth;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("cropRectWidth"));

  *(float *)&v12 = self->_inputBoundsX;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("inputBoundsX"));

  *(float *)&v14 = self->_inputBoundsY;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("inputBoundsY"));

  *(float *)&v16 = self->_inputBoundsHeight;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("inputBoundsHeight"));

  *(float *)&v18 = self->_inputBoundsWidth;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("inputBoundsWidth"));

  *(float *)&v20 = self->_sourceSizeHeight;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("sourceSizeHeight"));

  *(float *)&v22 = self->_sourceSizeWidth;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("sourceSizeWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_timeScale);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("timeScale"));

  PBRepeatedInt64NSArray();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("timeValue"));

  PBRepeatedFloatNSArray();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("homographyParams"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoMovieStabilizationRecipeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  $7401700F6E393C0442CED440453508D3 *p_homographyParams;
  unint64_t v7;

  v4 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteInt32Field();
  if (self->_timeValues.count)
  {
    PBDataWriterPlaceMark();
    if (self->_timeValues.count)
    {
      v5 = 0;
      do
      {
        PBDataWriterWriteInt64Field();
        ++v5;
      }
      while (v5 < self->_timeValues.count);
    }
    PBDataWriterRecallMark();
  }
  p_homographyParams = &self->_homographyParams;
  if (p_homographyParams->count)
  {
    PBDataWriterPlaceMark();
    if (p_homographyParams->count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteFloatField();
        ++v7;
      }
      while (v7 < p_homographyParams->count);
    }
    PBDataWriterRecallMark();
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  id v11;

  v4 = a3;
  v4[16] = LODWORD(self->_cropRectX);
  v4[17] = LODWORD(self->_cropRectY);
  v4[14] = LODWORD(self->_cropRectHeight);
  v4[15] = LODWORD(self->_cropRectWidth);
  v4[20] = LODWORD(self->_inputBoundsX);
  v4[21] = LODWORD(self->_inputBoundsY);
  v4[18] = LODWORD(self->_inputBoundsHeight);
  v4[19] = LODWORD(self->_inputBoundsWidth);
  v4[22] = LODWORD(self->_sourceSizeHeight);
  v4[23] = LODWORD(self->_sourceSizeWidth);
  v11 = v4;
  v4[24] = self->_timeScale;
  if (-[VCPProtoMovieStabilizationRecipe timeValuesCount](self, "timeValuesCount"))
  {
    objc_msgSend(v11, "clearTimeValues");
    v5 = -[VCPProtoMovieStabilizationRecipe timeValuesCount](self, "timeValuesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v11, "addTimeValue:", -[VCPProtoMovieStabilizationRecipe timeValueAtIndex:](self, "timeValueAtIndex:", i));
    }
  }
  if (-[VCPProtoMovieStabilizationRecipe homographyParamsCount](self, "homographyParamsCount"))
  {
    objc_msgSend(v11, "clearHomographyParams");
    v8 = -[VCPProtoMovieStabilizationRecipe homographyParamsCount](self, "homographyParamsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[VCPProtoMovieStabilizationRecipe homographyParamsAtIndex:](self, "homographyParamsAtIndex:", j);
        objc_msgSend(v11, "addHomographyParams:");
      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(float *)(v4 + 64) = self->_cropRectX;
  *(float *)(v4 + 68) = self->_cropRectY;
  *(float *)(v4 + 56) = self->_cropRectHeight;
  *(float *)(v4 + 60) = self->_cropRectWidth;
  *(float *)(v4 + 80) = self->_inputBoundsX;
  *(float *)(v4 + 84) = self->_inputBoundsY;
  *(float *)(v4 + 72) = self->_inputBoundsHeight;
  *(float *)(v4 + 76) = self->_inputBoundsWidth;
  *(float *)(v4 + 88) = self->_sourceSizeHeight;
  *(float *)(v4 + 92) = self->_sourceSizeWidth;
  *(_DWORD *)(v4 + 96) = self->_timeScale;
  PBRepeatedInt64Copy();
  PBRepeatedFloatCopy();
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_cropRectX == *((float *)v4 + 16)
    && self->_cropRectY == *((float *)v4 + 17)
    && self->_cropRectHeight == *((float *)v4 + 14)
    && self->_cropRectWidth == *((float *)v4 + 15)
    && self->_inputBoundsX == *((float *)v4 + 20)
    && self->_inputBoundsY == *((float *)v4 + 21)
    && self->_inputBoundsHeight == *((float *)v4 + 18)
    && self->_inputBoundsWidth == *((float *)v4 + 19)
    && self->_sourceSizeHeight == *((float *)v4 + 22)
    && self->_sourceSizeWidth == *((float *)v4 + 23)
    && self->_timeScale == *((_DWORD *)v4 + 24)
    && PBRepeatedInt64IsEqual())
  {
    IsEqual = PBRepeatedFloatIsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  float cropRectX;
  float v4;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  float cropRectY;
  float v12;
  float v13;
  float v14;
  float v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  float cropRectHeight;
  float v21;
  float v22;
  float v23;
  float v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  float cropRectWidth;
  float v30;
  float v31;
  float v32;
  float v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  float inputBoundsX;
  float v39;
  float v40;
  float v41;
  float v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  float inputBoundsY;
  float v48;
  float v49;
  float v50;
  float v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  float inputBoundsHeight;
  float v57;
  float v58;
  float v59;
  float v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  float inputBoundsWidth;
  float v66;
  float v67;
  float v68;
  float v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  float sourceSizeHeight;
  float v75;
  float v76;
  float v77;
  float v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  float sourceSizeWidth;
  float v84;
  float v85;
  float v86;
  float v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v94;

  cropRectX = self->_cropRectX;
  v4 = -cropRectX;
  if (cropRectX >= 0.0)
    v4 = self->_cropRectX;
  v5 = floorf(v4 + 0.5);
  v6 = (float)(v4 - v5) * 1.8447e19;
  v7 = fmodf(v5, 1.8447e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 >= 0.0)
    v10 = v9;
  v94 = v10;
  cropRectY = self->_cropRectY;
  v12 = -cropRectY;
  if (cropRectY >= 0.0)
    v12 = self->_cropRectY;
  v13 = floorf(v12 + 0.5);
  v14 = (float)(v12 - v13) * 1.8447e19;
  v15 = fmodf(v13, 1.8447e19);
  v16 = 2654435761u * (unint64_t)v15;
  v17 = v16 + (unint64_t)v14;
  if (v14 <= 0.0)
    v17 = 2654435761u * (unint64_t)v15;
  v18 = v16 - (unint64_t)fabsf(v14);
  if (v14 < 0.0)
    v19 = v18;
  else
    v19 = v17;
  cropRectHeight = self->_cropRectHeight;
  v21 = -cropRectHeight;
  if (cropRectHeight >= 0.0)
    v21 = self->_cropRectHeight;
  v22 = floorf(v21 + 0.5);
  v23 = (float)(v21 - v22) * 1.8447e19;
  v24 = fmodf(v22, 1.8447e19);
  v25 = 2654435761u * (unint64_t)v24;
  v26 = v25 + (unint64_t)v23;
  if (v23 <= 0.0)
    v26 = 2654435761u * (unint64_t)v24;
  v27 = v25 - (unint64_t)fabsf(v23);
  if (v23 < 0.0)
    v28 = v27;
  else
    v28 = v26;
  cropRectWidth = self->_cropRectWidth;
  v30 = -cropRectWidth;
  if (cropRectWidth >= 0.0)
    v30 = self->_cropRectWidth;
  v31 = floorf(v30 + 0.5);
  v32 = (float)(v30 - v31) * 1.8447e19;
  v33 = fmodf(v31, 1.8447e19);
  v34 = 2654435761u * (unint64_t)v33;
  v35 = v34 + (unint64_t)v32;
  if (v32 <= 0.0)
    v35 = 2654435761u * (unint64_t)v33;
  v36 = v34 - (unint64_t)fabsf(v32);
  if (v32 < 0.0)
    v37 = v36;
  else
    v37 = v35;
  inputBoundsX = self->_inputBoundsX;
  v39 = -inputBoundsX;
  if (inputBoundsX >= 0.0)
    v39 = self->_inputBoundsX;
  v40 = floorf(v39 + 0.5);
  v41 = (float)(v39 - v40) * 1.8447e19;
  v42 = fmodf(v40, 1.8447e19);
  v43 = 2654435761u * (unint64_t)v42;
  v44 = v43 + (unint64_t)v41;
  if (v41 <= 0.0)
    v44 = 2654435761u * (unint64_t)v42;
  v45 = v43 - (unint64_t)fabsf(v41);
  if (v41 < 0.0)
    v46 = v45;
  else
    v46 = v44;
  inputBoundsY = self->_inputBoundsY;
  v48 = -inputBoundsY;
  if (inputBoundsY >= 0.0)
    v48 = self->_inputBoundsY;
  v49 = floorf(v48 + 0.5);
  v50 = (float)(v48 - v49) * 1.8447e19;
  v51 = fmodf(v49, 1.8447e19);
  v52 = 2654435761u * (unint64_t)v51;
  v53 = v52 + (unint64_t)v50;
  if (v50 <= 0.0)
    v53 = 2654435761u * (unint64_t)v51;
  v54 = v52 - (unint64_t)fabsf(v50);
  if (v50 < 0.0)
    v55 = v54;
  else
    v55 = v53;
  inputBoundsHeight = self->_inputBoundsHeight;
  v57 = -inputBoundsHeight;
  if (inputBoundsHeight >= 0.0)
    v57 = self->_inputBoundsHeight;
  v58 = floorf(v57 + 0.5);
  v59 = (float)(v57 - v58) * 1.8447e19;
  v60 = fmodf(v58, 1.8447e19);
  v61 = 2654435761u * (unint64_t)v60;
  v62 = v61 + (unint64_t)v59;
  if (v59 <= 0.0)
    v62 = 2654435761u * (unint64_t)v60;
  v63 = v61 - (unint64_t)fabsf(v59);
  if (v59 < 0.0)
    v64 = v63;
  else
    v64 = v62;
  inputBoundsWidth = self->_inputBoundsWidth;
  v66 = -inputBoundsWidth;
  if (inputBoundsWidth >= 0.0)
    v66 = self->_inputBoundsWidth;
  v67 = floorf(v66 + 0.5);
  v68 = (float)(v66 - v67) * 1.8447e19;
  v69 = fmodf(v67, 1.8447e19);
  v70 = 2654435761u * (unint64_t)v69;
  v71 = v70 + (unint64_t)v68;
  if (v68 <= 0.0)
    v71 = 2654435761u * (unint64_t)v69;
  v72 = v70 - (unint64_t)fabsf(v68);
  if (v68 < 0.0)
    v73 = v72;
  else
    v73 = v71;
  sourceSizeHeight = self->_sourceSizeHeight;
  v75 = -sourceSizeHeight;
  if (sourceSizeHeight >= 0.0)
    v75 = self->_sourceSizeHeight;
  v76 = floorf(v75 + 0.5);
  v77 = (float)(v75 - v76) * 1.8447e19;
  v78 = fmodf(v76, 1.8447e19);
  v79 = 2654435761u * (unint64_t)v78;
  v80 = v79 + (unint64_t)v77;
  if (v77 <= 0.0)
    v80 = 2654435761u * (unint64_t)v78;
  v81 = v79 - (unint64_t)fabsf(v77);
  if (v77 < 0.0)
    v82 = v81;
  else
    v82 = v80;
  sourceSizeWidth = self->_sourceSizeWidth;
  v84 = -sourceSizeWidth;
  if (sourceSizeWidth >= 0.0)
    v84 = self->_sourceSizeWidth;
  v85 = floorf(v84 + 0.5);
  v86 = (float)(v84 - v85) * 1.8447e19;
  v87 = fmodf(v85, 1.8447e19);
  v88 = 2654435761u * (unint64_t)v87;
  v89 = v88 + (unint64_t)v86;
  if (v86 <= 0.0)
    v89 = 2654435761u * (unint64_t)v87;
  v90 = v88 - (unint64_t)fabsf(v86);
  if (v86 >= 0.0)
    v90 = v89;
  v91 = v19 ^ v94 ^ v28 ^ v37 ^ v46 ^ v55 ^ v64 ^ v73 ^ v82 ^ v90 ^ (2654435761 * self->_timeScale);
  v92 = PBRepeatedInt64Hash();
  return v91 ^ v92 ^ PBRepeatedFloatHash();
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  id v11;

  v4 = a3;
  self->_cropRectX = *((float *)v4 + 16);
  self->_cropRectY = *((float *)v4 + 17);
  self->_cropRectHeight = *((float *)v4 + 14);
  self->_cropRectWidth = *((float *)v4 + 15);
  self->_inputBoundsX = *((float *)v4 + 20);
  self->_inputBoundsY = *((float *)v4 + 21);
  self->_inputBoundsHeight = *((float *)v4 + 18);
  self->_inputBoundsWidth = *((float *)v4 + 19);
  self->_sourceSizeHeight = *((float *)v4 + 22);
  self->_sourceSizeWidth = *((float *)v4 + 23);
  self->_timeScale = *((_DWORD *)v4 + 24);
  v11 = v4;
  v5 = objc_msgSend(v4, "timeValuesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[VCPProtoMovieStabilizationRecipe addTimeValue:](self, "addTimeValue:", objc_msgSend(v11, "timeValueAtIndex:", i));
  }
  v8 = objc_msgSend(v11, "homographyParamsCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
    {
      objc_msgSend(v11, "homographyParamsAtIndex:", j);
      -[VCPProtoMovieStabilizationRecipe addHomographyParams:](self, "addHomographyParams:");
    }
  }

}

- (float)cropRectX
{
  return self->_cropRectX;
}

- (void)setCropRectX:(float)a3
{
  self->_cropRectX = a3;
}

- (float)cropRectY
{
  return self->_cropRectY;
}

- (void)setCropRectY:(float)a3
{
  self->_cropRectY = a3;
}

- (float)cropRectHeight
{
  return self->_cropRectHeight;
}

- (void)setCropRectHeight:(float)a3
{
  self->_cropRectHeight = a3;
}

- (float)cropRectWidth
{
  return self->_cropRectWidth;
}

- (void)setCropRectWidth:(float)a3
{
  self->_cropRectWidth = a3;
}

- (float)inputBoundsX
{
  return self->_inputBoundsX;
}

- (void)setInputBoundsX:(float)a3
{
  self->_inputBoundsX = a3;
}

- (float)inputBoundsY
{
  return self->_inputBoundsY;
}

- (void)setInputBoundsY:(float)a3
{
  self->_inputBoundsY = a3;
}

- (float)inputBoundsHeight
{
  return self->_inputBoundsHeight;
}

- (void)setInputBoundsHeight:(float)a3
{
  self->_inputBoundsHeight = a3;
}

- (float)inputBoundsWidth
{
  return self->_inputBoundsWidth;
}

- (void)setInputBoundsWidth:(float)a3
{
  self->_inputBoundsWidth = a3;
}

- (float)sourceSizeHeight
{
  return self->_sourceSizeHeight;
}

- (void)setSourceSizeHeight:(float)a3
{
  self->_sourceSizeHeight = a3;
}

- (float)sourceSizeWidth
{
  return self->_sourceSizeWidth;
}

- (void)setSourceSizeWidth:(float)a3
{
  self->_sourceSizeWidth = a3;
}

- (int)timeScale
{
  return self->_timeScale;
}

- (void)setTimeScale:(int)a3
{
  self->_timeScale = a3;
}

@end

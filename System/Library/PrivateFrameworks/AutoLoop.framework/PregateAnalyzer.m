@implementation PregateAnalyzer

- (PregateAnalyzer)init
{
  char *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 *v9;
  __int128 v10;
  _OWORD *v11;
  __int128 *v12;
  uint64_t v13;
  __int128 v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  const __CFAllocator *v21;
  CFDictionaryRef v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  CFDictionaryRef v32;
  uint64_t v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  CMTime v39;
  CMTime time;
  objc_super v41;
  _QWORD v42[12];
  _QWORD v43[14];

  v43[12] = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)PregateAnalyzer;
  v2 = -[PregateAnalyzer init](&v41, sel_init);
  v3 = MEMORY[0x1E0CA2E10];
  v4 = *MEMORY[0x1E0CA2E10];
  *((_OWORD *)v2 + 6) = *MEMORY[0x1E0CA2E10];
  v5 = *(_QWORD *)(v3 + 16);
  *((_QWORD *)v2 + 14) = v5;
  *(_OWORD *)(v2 + 120) = v4;
  *((_QWORD *)v2 + 17) = v5;
  v6 = MEMORY[0x1E0CA2E40];
  v7 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *((_OWORD *)v2 + 9) = *MEMORY[0x1E0CA2E40];
  *((_OWORD *)v2 + 10) = v7;
  v8 = *(_OWORD *)(v6 + 32);
  v9 = (__int128 *)MEMORY[0x1E0CA2E28];
  *((_QWORD *)v2 + 26) = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
  v10 = *v9;
  *((_OWORD *)v2 + 11) = v8;
  *((_OWORD *)v2 + 12) = v10;
  v11 = (_OWORD *)MEMORY[0x1E0CA2E30];
  *((_QWORD *)v2 + 29) = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
  *(_OWORD *)(v2 + 216) = *v11;
  v12 = (__int128 *)MEMORY[0x1E0CA2E18];
  v13 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  *((_QWORD *)v2 + 32) = v13;
  v14 = *v12;
  *((_OWORD *)v2 + 15) = *v12;
  *((_QWORD *)v2 + 35) = v13;
  *(_OWORD *)(v2 + 264) = v14;
  v42[0] = CFSTR("maxPanX");
  LODWORD(v14) = 1051931443;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)&v14);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v38;
  v42[1] = CFSTR("maxPanY");
  LODWORD(v15) = 1051931443;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v37;
  v42[2] = CFSTR("maxFaceSize");
  LODWORD(v16) = 1020054733;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v36;
  v42[3] = CFSTR("maxBlurMagnitude");
  LODWORD(v17) = 7.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v18;
  v42[4] = CFSTR("maxPerFrameMotion");
  LODWORD(v19) = 1028443341;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v20;
  v42[5] = CFSTR("maxFrameDuration");
  CMTimeMake(&time, 45, 600);
  v21 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v22 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  v43[5] = v22;
  v42[6] = CFSTR("maxFrameExposureTime");
  LODWORD(v23) = 1032358025;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v24;
  v42[7] = CFSTR("maxFrameGain");
  LODWORD(v25) = 1108082688;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[7] = v26;
  v42[8] = CFSTR("maxExposureChangeFrac");
  LODWORD(v27) = 1051931443;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v43[8] = v28;
  v42[9] = CFSTR("maxZoomFactor");
  LODWORD(v29) = 1232348158;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v43[9] = v30;
  v42[10] = CFSTR("maxInterpCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[10] = v31;
  v42[11] = CFSTR("maxInterpTime");
  CMTimeMake(&v39, 80, 600);
  v32 = CMTimeCopyAsDictionary(&v39, v21);
  v43[11] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 12);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)*((_QWORD *)v2 + 6);
  *((_QWORD *)v2 + 6) = v33;

  return (PregateAnalyzer *)v2;
}

- (int)fetchVideoDimensionsFromMetadata
{
  int v2;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  float v14;
  float v15;
  float v16;
  float v17;

  if (!self->_haveInputVideoSize)
  {
    -[PregateFeatureBuilder irisVideoExtractor](self->featureBuilder, "irisVideoExtractor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoTrackMetadataDict");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vidTrackCleanH"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vidTrackCleanW"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6)
      v9 = v7 == 0;
    else
      v9 = 1;
    if (v9)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vidTrackNaturalH"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vidTrackNaturalW"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10)
        v13 = v11 == 0;
      else
        v13 = 1;
      if (v13)
      {

        v2 = -1;
LABEL_15:

        return v2;
      }
      objc_msgSend(v10, "floatValue");
      self->_inputVideoSize.height = v16;
      objc_msgSend(v12, "floatValue");
      self->_inputVideoSize.width = v17;

    }
    else
    {
      objc_msgSend(v6, "floatValue");
      self->_inputVideoSize.height = v14;
      objc_msgSend(v8, "floatValue");
      self->_inputVideoSize.width = v15;
    }
    v2 = 0;
    self->_haveInputVideoSize = 1;
    goto LABEL_15;
  }
  return 0;
}

- (int)getFrameMetadataArray:(id *)a3
{
  PregateFeatureBuilder *featureBuilder;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  int v10;
  id v11;

  featureBuilder = self->featureBuilder;
  if (!featureBuilder)
  {
    v9 = 0;
    v8 = 0;
    goto LABEL_11;
  }
  -[PregateFeatureBuilder irisVideoExtractor](featureBuilder, "irisVideoExtractor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v9 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(v5, "processedFile") & 1) != 0 || (v7 = objc_msgSend(v6, "processFile")) == 0)
  {
    objc_msgSend(v6, "framesMetadataArray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v8 = v7;
  v9 = 0;
LABEL_10:

LABEL_11:
  if (v9)
    v10 = v8;
  else
    v10 = -1;
  v11 = objc_retainAutorelease(v9);
  *a3 = v11;

  return v10;
}

- (id)paramValueForKey:(id)a3
{
  id v4;
  NSDictionary *pregateParameters;
  void *v6;

  v4 = a3;
  pregateParameters = self->pregateParameters;
  if (!pregateParameters
    || (-[NSDictionary valueForKey:](pregateParameters, "valueForKey:", v4),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[NSDictionary valueForKey:](self->_defaultParameters, "valueForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)getParamForKey:(id)a3 toFloat:(float *)a4
{
  void *v5;
  void *v6;
  int v7;

  -[PregateAnalyzer paramValueForKey:](self, "paramValueForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "floatValue");
    *(_DWORD *)a4 = v7;
  }

  return v6 != 0;
}

- (BOOL)getParamForKey:(id)a3 toInt:(int64_t *)a4
{
  void *v5;
  void *v6;

  -[PregateAnalyzer paramValueForKey:](self, "paramValueForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    *a4 = objc_msgSend(v5, "integerValue");

  return v6 != 0;
}

- (BOOL)getParamForKey:(id)a3 toCMTime:(id *)a4
{
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  CMTime v8;

  -[PregateAnalyzer paramValueForKey:](self, "paramValueForKey:", a3);
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    CMTimeMakeFromDictionary(&v8, v5);
    *(CMTime *)a4 = v8;
  }

  return v6 != 0;
}

+ (id)pregateFailureReasonsToString:(int)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[15];
  _QWORD v12[16];

  v12[15] = *MEMORY[0x1E0C80C00];
  v11[0] = &unk_1E986CF08;
  v11[1] = &unk_1E986CF20;
  v12[0] = CFSTR("[pregate_vid motion blur]");
  v12[1] = CFSTR("[pregate_vid panning]");
  v11[2] = &unk_1E986CF38;
  v11[3] = &unk_1E986CF50;
  v12[2] = CFSTR("[pregate_vid face]");
  v12[3] = CFSTR("[pregate_vid camera motion]");
  v11[4] = &unk_1E986CF68;
  v11[5] = &unk_1E986CF80;
  v12[4] = CFSTR("[pregate_vid focus]");
  v12[5] = CFSTR("[pregate_vid frame duration too long]");
  v11[6] = &unk_1E986CF98;
  v11[7] = &unk_1E986CFB0;
  v12[6] = CFSTR("[pregate_vid frame exposure too long]");
  v12[7] = CFSTR("[pregate_vid exposure gain change too large]");
  v11[8] = &unk_1E986CFC8;
  v11[9] = &unk_1E986CFE0;
  v12[8] = CFSTR("[pregate_vid zoom]");
  v12[9] = CFSTR("[pregate_vid trimming error]");
  v11[10] = &unk_1E986CFF8;
  v11[11] = &unk_1E986D010;
  v12[10] = CFSTR("[pregate_vid parameter error]");
  v12[11] = CFSTR("[pregate_vid missing metadata]");
  v11[12] = &unk_1E986D028;
  v11[13] = &unk_1E986D040;
  v12[12] = CFSTR("[pregate_vid outside-trim internal error]");
  v12[13] = CFSTR("[pregate_vid internal error]");
  v11[14] = &unk_1E986D058;
  v12[14] = CFSTR("[pregate_vid interpolated frames]");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  if (a3)
  {
    v6 = 1;
    do
    {
      if ((a3 & v6) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          if (v5)
          {
            objc_msgSend(v5, "stringByAppendingString:", CFSTR(", "));
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v9, "stringByAppendingString:", v8);
            v5 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v5 = v8;
          }
        }

      }
      a3 &= ~(_DWORD)v6;
      v6 = (2 * v6);
    }
    while (a3);
  }

  return v5;
}

- (MetadataFloatVector)cumulativePanForStartIndex:(int64_t)a3 lastIndex:(int64_t)a4
{
  NSUInteger v7;
  char *v8;
  float32x2_t v9;
  uint64_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float v15;
  MetadataFloatVector result;

  v7 = -[NSData length](self->_perFrameTranslationVecs, "length");
  v8 = -[NSData bytes](self->_perFrameTranslationVecs, "bytes");
  v9 = 0;
  if (v7 >= 8 && a3 <= a4)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    do
    {
      if (v11)
      {
        v14 = *(float32x2_t *)&v8[8 * a3 + 8 * v11];
        v13 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v14, v13), (int8x8_t)v13, (int8x8_t)v14);
        v12 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v12, v14), (int8x8_t)v12, (int8x8_t)v14);
      }
      else
      {
        v12 = *(float32x2_t *)&v8[8 * a3];
        v13 = v12;
      }
      ++v11;
    }
    while (a4 - a3 + 1 != v11);
    v9 = vsub_f32(v12, v13);
  }
  v15 = v9.f32[1];
  result.var0 = v9.f32[0];
  result.var1 = v15;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeForFrameFromArray:(SEL)a3 frameIndex:(id)a4
{
  void *v6;
  const __CFDictionary *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v9;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  objc_msgSend(a4, "objectAtIndexedSubscript:", a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PresentationTime"));
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    CMTimeMakeFromDictionary(&v9, v7);
    *(CMTime *)retstr = v9;
  }

  return result;
}

- (BOOL)findNextNonInterpFrameFromIndex:(int64_t)a3 backwards:(BOOL)a4 inFrameInfoArray:(id)a5 toValue:(int64_t *)a6
{
  _BOOL4 v7;
  id v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v7 = a4;
  v9 = a5;
  if (v7)
    v10 = -1;
  else
    v10 = 1;
  v11 = v10 + a3;
  if (v10 + a3 >= 0)
  {
    while (v11 < (unint64_t)objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("InterpolatedFrame"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (!v13 || (objc_msgSend(v13, "BOOLValue") & 1) == 0)
      {
        *a6 = v11;

        v15 = 1;
        goto LABEL_11;
      }

      v11 += v10;
      if (v11 < 0)
        break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)findSurroundingNonInterpForIndex:(int64_t)a3 inFrameInfoArray:(id)a4 prevIndex:(int64_t *)a5 nextIndex:(int64_t *)a6
{
  id v10;

  v10 = a4;
  LOBYTE(a5) = -[PregateAnalyzer findNextNonInterpFrameFromIndex:backwards:inFrameInfoArray:toValue:](self, "findNextNonInterpFrameFromIndex:backwards:inFrameInfoArray:toValue:", a3, 1, v10, a5);
  LOBYTE(a6) = -[PregateAnalyzer findNextNonInterpFrameFromIndex:backwards:inFrameInfoArray:toValue:](self, "findNextNonInterpFrameFromIndex:backwards:inFrameInfoArray:toValue:", a3, 0, v10, a6);

  return a5 & a6;
}

- (BOOL)frameIndexIsFocusing:(int64_t)a3 inFrameData:(id)a4 failureReason:(int *)a5
{
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  unsigned int v16;

  v7 = a4;
  *a5 = 0;
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("InterpolatedFrame"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "BOOLValue"))
  {
    v10 = 0;
    *a5 = 0x2000;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("privAFSt"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("privFM"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && v14)
    {
      v15 = objc_msgSend(v12, "intValue");
      v16 = objc_msgSend(v14, "intValue") - 1;
      v10 = v15 == 2 && v16 < 2;
    }
    else
    {
      v10 = 0;
      *a5 = 2048;
    }

  }
  return v10;
}

- (int)getFocusDataFromFrameData:(id)a3 toFocusingFlags:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  int v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL8 v16;
  _BOOL8 v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  int v22;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  if (!objc_msgSend(v6, "count"))
  {
LABEL_12:
    v13 = v22;
    goto LABEL_15;
  }
  v8 = 0;
  while (1)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("InterpolatedFrame"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10 || !objc_msgSend(v10, "BOOLValue"))
    {
      v17 = -[PregateAnalyzer frameIndexIsFocusing:inFrameData:failureReason:](self, "frameIndexIsFocusing:inFrameData:failureReason:", v8, v6, &v22);
      v13 = v22;
      if (v22)
        goto LABEL_14;
      v16 = v17;
      goto LABEL_11;
    }
    v20 = 0;
    v21 = 0;
    if (!-[PregateAnalyzer findSurroundingNonInterpForIndex:inFrameInfoArray:prevIndex:nextIndex:](self, "findSurroundingNonInterpForIndex:inFrameInfoArray:prevIndex:nextIndex:", v8, v6, &v21, &v20))break;
    v12 = -[PregateAnalyzer frameIndexIsFocusing:inFrameData:failureReason:](self, "frameIndexIsFocusing:inFrameData:failureReason:", v21, v6, &v22);
    v13 = v22;
    if (v22)
      goto LABEL_14;
    v14 = v12;
    v15 = -[PregateAnalyzer frameIndexIsFocusing:inFrameData:failureReason:](self, "frameIndexIsFocusing:inFrameData:failureReason:", v20, v6, &v22);
    v13 = v22;
    if (v22)
      goto LABEL_14;
    v16 = v15 | v14;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v18);

    if (objc_msgSend(v6, "count") <= (unint64_t)++v8)
      goto LABEL_12;
  }
  v13 = 0x2000;
  v22 = 0x2000;
LABEL_14:

LABEL_15:
  return v13;
}

- (int)getZoomFlagsFromFrameData:(id)a3 toArray:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v23;
  uint64_t v24;
  int v25;

  v6 = a3;
  v7 = a4;
  v25 = 0;
  if (-[PregateAnalyzer getParamForKey:toFloat:](self, "getParamForKey:toFloat:", CFSTR("maxZoomFactor"), &v25))
  {
    if (objc_msgSend(v6, "count"))
    {
      v8 = 0;
      v9 = 0x1E0CB3000uLL;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("InterpolatedFrame"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "BOOLValue");

        if (v12)
        {
          v23 = 0;
          v24 = 0;
          if (!-[PregateAnalyzer findSurroundingNonInterpForIndex:inFrameInfoArray:prevIndex:nextIndex:](self, "findSurroundingNonInterpForIndex:inFrameInfoArray:prevIndex:nextIndex:", v8, v6, &v24, &v23))
          {

            v21 = 0x2000;
            goto LABEL_11;
          }
          objc_msgSend(v6, "objectAtIndexedSubscript:", v24);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("privTZF"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "floatValue");
          objc_msgSend(v6, "objectAtIndexedSubscript:", v23);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("privTZF"));
          v16 = v9;
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "floatValue");
          v9 = v16;
        }
        else
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("privTZF"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "floatValue");
        }
        objc_msgSend(*(id *)(v9 + 2024), "numberWithUnsignedInteger:", 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v20);

        ++v8;
      }
      while (objc_msgSend(v6, "count") > v8);
    }
    v21 = 0;
  }
  else
  {
    v21 = 1024;
  }
LABEL_11:

  return v21;
}

- (int)processMotionVectorsFromFrameData:(id)a3 toVectorArray:(MetadataFloatVector *)a4
{
  id v5;
  unint64_t v6;
  MetadataFloatVector v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  MetadataFloatVector v16;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    v7 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("InterpolatedFrame"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
        v11 = objc_msgSend(v9, "BOOLValue");
      else
        v11 = 0;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("privECMVct"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v16 = 0;
      if (v12)
      {
        objc_msgSend(v12, "getBytes:length:", &v16, 8);
        v7 = v16;
      }
      else if ((v11 & 1) == 0)
      {

        v14 = 2048;
        goto LABEL_11;
      }
      a4[v6] = v7;

      ++v6;
    }
    while (objc_msgSend(v5, "count") > v6);
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (int)processPresentationTimesFromData:(id)a3 toBadFrameFlags:(id)a4 withMaxDuration:(id *)a5 maxInterpGapTime:(id *)a6 maxInterpFrameCount:(int64_t)a7 firstIndex:(int64_t)a8 lastIndex:(int64_t)a9
{
  id v14;
  id v15;
  unint64_t v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  int64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const __CFDictionary *v29;
  const __CFDictionary *v30;
  int64_t v31;
  void *v32;
  const __CFDictionary *v33;
  void *v34;
  PregateAnalyzer *v35;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v36;
  id v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  int v42;
  int64_t v45;
  int v46;
  void *v47;
  CMTime rhs;
  CMTime lhs;
  CMTime v50;
  CMTime v51;
  CMTime v52;
  uint64_t v53;
  uint64_t v54;

  v14 = a3;
  v15 = a4;
  if (a8 > a9)
  {
LABEL_21:
    v42 = 0;
    goto LABEL_24;
  }
  v46 = 0;
  v16 = 0x1E0CB3000uLL;
  while (1)
  {
    objc_msgSend(v14, "objectAtIndexedSubscript:", a8);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("InterpolatedFrame"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (v18)
    {
      v53 = 0;
      v54 = 0;
      if (!-[PregateAnalyzer findSurroundingNonInterpForIndex:inFrameInfoArray:prevIndex:nextIndex:](self, "findSurroundingNonInterpForIndex:inFrameInfoArray:prevIndex:nextIndex:", a8, v14, &v54, &v53))goto LABEL_6;
      memset(&v52, 0, sizeof(v52));
      -[PregateAnalyzer timeForFrameFromArray:frameIndex:](self, "timeForFrameFromArray:frameIndex:", v14, v54);
      memset(&v51, 0, sizeof(v51));
      -[PregateAnalyzer timeForFrameFromArray:frameIndex:](self, "timeForFrameFromArray:frameIndex:", v14, v53);
      memset(&v50, 0, sizeof(v50));
      lhs = v51;
      rhs = v52;
      CMTimeSubtract(&v50, &lhs, &rhs);
      lhs = v50;
      rhs = (CMTime)*a6;
      if (CMTimeCompare(&lhs, &rhs) >= 1)
      {
LABEL_6:
        objc_msgSend(v15, "objectAtIndexedSubscript:", a8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "unsignedIntegerValue");

        objc_msgSend(*(id *)(v16 + 2024), "numberWithUnsignedInteger:", v20 | 0x4000);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:atIndexedSubscript:", v21, a8);

      }
      v22 = v46 + 1;
    }
    else
    {
      v23 = v46;
      if (v46 > a7)
      {
        v22 = 0;
        if (v46 < 1)
          goto LABEL_13;
        v24 = a8 - 1;
        do
        {
          objc_msgSend(v15, "objectAtIndexedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "unsignedIntegerValue");

          v27 = v26 | 0x4000;
          v16 = 0x1E0CB3000uLL;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:atIndexedSubscript:", v28, v24);

          --v24;
          --v23;
        }
        while (v23);
      }
      v22 = 0;
    }
LABEL_13:
    v46 = v22;
    if (a8 < (unint64_t)(objc_msgSend(v14, "count") - 1))
      break;
    ++a8;
LABEL_20:

    if (a8 == a9 + 1)
      goto LABEL_21;
  }
  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("PresentationTime"));
  v29 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (!v29)
    goto LABEL_23;
  v30 = v29;
  memset(&v52, 0, sizeof(v52));
  CMTimeMakeFromDictionary(&v52, v29);
  v31 = a8 + 1;
  objc_msgSend(v14, "objectAtIndexedSubscript:", a8 + 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("PresentationTime"));
  v33 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    memset(&v51, 0, sizeof(v51));
    CMTimeMakeFromDictionary(&v51, v33);
    memset(&v50, 0, sizeof(v50));
    lhs = v51;
    rhs = v52;
    CMTimeSubtract(&v50, &lhs, &rhs);
    lhs = v50;
    rhs = (CMTime)*a5;
    if (CMTimeCompare(&lhs, &rhs) >= 1)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", a8);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = a8;
      v35 = self;
      v36 = a5;
      v37 = v14;
      v38 = a7;
      v39 = objc_msgSend(v34, "unsignedIntegerValue");

      v40 = v39 | 0x20;
      a7 = v38;
      v14 = v37;
      a5 = v36;
      self = v35;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:atIndexedSubscript:", v41, v45);

    }
    a8 = v31;
    v16 = 0x1E0CB3000;
    goto LABEL_20;
  }

LABEL_23:
  v42 = 2048;
LABEL_24:

  return v42;
}

- (BOOL)exposuresViolateThresholdFraction:(float)a3 exposure1:(float)a4 exposure2:(float)a5
{
  float v5;

  if (a4 >= a5)
    v5 = a5;
  else
    v5 = a4;
  return vabds_f32(a4, a5) > (float)(v5 * a3);
}

- (int)processGainAndExposureData:(id)a3 intoFlagsArray:(id)a4 firstIndex:(int64_t)a5 lastIndex:(int64_t)a6
{
  id v8;
  id v9;
  _BOOL4 v10;
  _BOOL4 v11;
  int v12;
  uint64_t v13;
  PregateAnalyzer *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  BOOL v27;
  int v28;
  void *v29;
  float v30;
  float v31;
  void *v32;
  float v33;
  float v34;
  void *v35;
  float v36;
  float v37;
  void *v38;
  float v39;
  float v40;
  double v41;
  double v42;
  double v43;
  _BOOL4 v44;
  int v45;
  unsigned int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  BOOL v58;
  BOOL v61;
  int v63;
  void *v64;
  float v65;
  float v66;
  void *v67;
  float v68;
  float v69;
  void *v70;
  float v71;
  float v72;
  void *v73;
  float v74;
  float v75;
  void *v76;
  float v77;
  float v78;
  void *v79;
  float v80;
  float v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  int v88;
  void *v89;
  float v90;
  float v91;
  float v92;
  void *v93;
  float v94;
  float v95;
  float v96;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v103;
  void *v104;
  int v105;
  id v106;
  id v107;
  int64_t v110;
  int64_t v111;
  float v112;
  uint64_t v113;

  v8 = a3;
  v9 = a4;
  v113 = 0;
  v112 = 0.0;
  v10 = -[PregateAnalyzer getParamForKey:toFloat:](self, "getParamForKey:toFloat:", CFSTR("maxExposureChangeFrac"), (char *)&v113 + 4);
  v11 = -[PregateAnalyzer getParamForKey:toFloat:](self, "getParamForKey:toFloat:", CFSTR("maxFrameGain"), &v112);
  v12 = 1024;
  if (-[PregateAnalyzer getParamForKey:toFloat:](self, "getParamForKey:toFloat:", CFSTR("maxFrameExposureTime"), &v113)
    && v11
    && v10)
  {
    if (a6 < a5)
    {
      v12 = 0;
      goto LABEL_77;
    }
    v13 = 0;
    v12 = 0;
    v106 = v9;
    v107 = v8;
    do
    {
      v14 = self;
      v15 = a5 + v13;
      objc_msgSend(v8, "objectAtIndexedSubscript:", a5 + v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("InterpolatedFrame"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "BOOLValue");

      if (v18)
      {
        v110 = 0;
        v111 = 0;
        self = v14;
        if (-[PregateAnalyzer findSurroundingNonInterpForIndex:inFrameInfoArray:prevIndex:nextIndex:](v14, "findSurroundingNonInterpForIndex:inFrameInfoArray:prevIndex:nextIndex:", v15, v8, &v111, &v110))
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", v111);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectAtIndexedSubscript:", v110);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("privImgG"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("privImgG"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("privET"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("privET"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = v21 == 0;
          self = v14;
          v25 = v25 || v22 == 0;
          v27 = v25 || v23 == 0 || v24 == 0;
          v9 = v106;
          v8 = v107;
          if (v27)
            v28 = 2048;
          else
            v28 = 0;
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("privImgG"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "floatValue");
          v31 = v30;

          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("privImgG"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "floatValue");
          v34 = v33;

          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("privET"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "floatValue");
          v37 = v36;

          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("privET"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "floatValue");
          v40 = v39;

          *(float *)&v41 = v31 * v37;
          *(float *)&v42 = v34 * v40;
          LODWORD(v43) = HIDWORD(v113);
          v44 = -[PregateAnalyzer exposuresViolateThresholdFraction:exposure1:exposure2:](v14, "exposuresViolateThresholdFraction:exposure1:exposure2:", v43, v41, v42);
          v45 = v28 | 0x80;
          if (!v44)
            v45 = v28;
          v15 = a5 + v13;
          if (v34 <= v112 && v31 <= v112 && v40 <= *(float *)&v113 && v37 <= *(float *)&v113)
            v49 = v45;
          else
            v49 = v45 | 0x40;

          goto LABEL_76;
        }
      }
      else
      {
        v110 = 0;
        v111 = 0;
        if (v13)
        {
          self = v14;
          if (-[PregateAnalyzer findNextNonInterpFrameFromIndex:backwards:inFrameInfoArray:toValue:](v14, "findNextNonInterpFrameFromIndex:backwards:inFrameInfoArray:toValue:", v15, 1, v8, &v111))
          {
            v49 = 0;
          }
          else
          {
            v49 = 0x2000;
          }
        }
        else
        {
          v49 = 0;
          v111 = a5;
          self = v14;
        }
        if (a6 - a5 == v13)
        {
          v110 = a6;
LABEL_44:
          if (!v49)
          {
            objc_msgSend(v8, "objectAtIndexedSubscript:", v111);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectAtIndexedSubscript:", v15);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectAtIndexedSubscript:", v110);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = v50;
            objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("privImgG"));
            v104 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("privImgG"));
            v53 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("privImgG"));
            v54 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("privET"));
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("privET"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("privET"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            if (v104)
              v58 = v53 == 0;
            else
              v58 = 1;
            v61 = v58 || v54 == 0 || v55 == 0 || v56 == 0;
            self = v14;
            if (v61 || v57 == 0)
              v63 = 2048;
            else
              v63 = 0;
            v105 = v63;
            objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("privImgG"));
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "floatValue");
            v66 = v65;
            objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("privET"));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "floatValue");
            v69 = v66 * v68;

            objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("privImgG"));
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "floatValue");
            v72 = v71;
            objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("privET"));
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "floatValue");
            v75 = v72 * v74;

            objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("privImgG"));
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "floatValue");
            v78 = v77;
            objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("privET"));
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "floatValue");
            v81 = v80;

            LODWORD(v82) = HIDWORD(v113);
            *(float *)&v83 = v69;
            *(float *)&v84 = v75;
            if (-[PregateAnalyzer exposuresViolateThresholdFraction:exposure1:exposure2:](v14, "exposuresViolateThresholdFraction:exposure1:exposure2:", v82, v83, v84))
            {
              v88 = v105 | 0x80;
            }
            else
            {
              *(float *)&v87 = v78 * v81;
              LODWORD(v85) = HIDWORD(v113);
              *(float *)&v86 = v75;
              if (-[PregateAnalyzer exposuresViolateThresholdFraction:exposure1:exposure2:](v14, "exposuresViolateThresholdFraction:exposure1:exposure2:", v85, v86, v87))
              {
                v88 = v105 | 0x80;
              }
              else
              {
                v88 = v105;
              }
            }
            objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("privImgG"));
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "floatValue");
            v91 = v90;
            v92 = v112;

            objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("privET"));
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "floatValue");
            v95 = v94;
            v96 = *(float *)&v113;

            if (v91 <= v92 && v95 <= v96)
              v49 = v88;
            else
              v49 = v88 | 0x40;

            v9 = v106;
            v8 = v107;
            v15 = a5 + v13;
          }
          goto LABEL_76;
        }
        if (-[PregateAnalyzer findNextNonInterpFrameFromIndex:backwards:inFrameInfoArray:toValue:](self, "findNextNonInterpFrameFromIndex:backwards:inFrameInfoArray:toValue:", v15, 0, v8, &v110))
        {
          goto LABEL_44;
        }
      }
      v49 = 0x2000;
LABEL_76:
      objc_msgSend(v9, "objectAtIndexedSubscript:", v15);
      v98 = v15;
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = objc_msgSend(v99, "unsignedIntegerValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v100 | v49);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:atIndexedSubscript:", v101, v98);

      v12 |= v49;
      ++v13;
    }
    while (a6 - a5 + 1 != v13);
  }
LABEL_77:

  return v12;
}

- (int)getPerFrameGatingData:(id)a3 firstIndex:(int64_t)a4 lastIndex:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  int64_t v11;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  BOOL v23;
  _BOOL4 v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  int v28;
  int64_t v29;
  int64_t v30;
  int v31;
  double width;
  float v33;
  float v34;
  void *v35;
  void *v36;
  float *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  int v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  float v53;
  float v54;
  void *v55;
  float v56;
  float v57;
  void *v58;
  int v59;
  int v60;
  void *v61;
  int v62;
  void *v63;
  int v64;
  int v65;
  void *v66;
  int v67;
  void *v68;
  __int16 v69;
  int v70;
  id obj;
  int v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  int64_t v78;
  int64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  int64_t v84;
  int v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  __int128 v92;
  uint64_t v93;
  __int128 v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v97;
  uint64_t v98;
  float v99;
  uint64_t v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (a5 < a4 || objc_msgSend(v8, "count") <= (unint64_t)a5)
  {
    v17 = 0x2000;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v11 = 0;
      do
      {
        if (v11 > a5 || v11 < a4)
          v13 = 4096;
        else
          v13 = 0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v14);

        ++v11;
      }
      while (objc_msgSend(v9, "count") > (unint64_t)v11);
    }
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 8 * objc_msgSend(v9, "count"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend(v15, "mutableBytes");
    v17 = -[PregateAnalyzer processMotionVectorsFromFrameData:toVectorArray:](self, "processMotionVectorsFromFrameData:toVectorArray:", v9, v16);
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[PregateAnalyzer getFocusDataFromFrameData:toFocusingFlags:](self, "getFocusDataFromFrameData:toFocusingFlags:", v9, v18);
      if (!v17)
      {
        v74 = v16;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[PregateAnalyzer getZoomFlagsFromFrameData:toArray:](self, "getZoomFlagsFromFrameData:toArray:", v9, v19);
        if (!v17)
        {
          v82 = v19;
          obj = v15;
          v78 = a5;
          v79 = a4;
          v77 = v10;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "count"))
          {
            v21 = 0;
            do
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "addObject:", v22);

              ++v21;
            }
            while (objc_msgSend(v9, "count") > v21);
          }
          v75 = v9;
          v100 = 0;
          v99 = 0.0;
          v97 = *MEMORY[0x1E0CA2E10];
          v98 = *(_QWORD *)(MEMORY[0x1E0CA2E10] + 16);
          v95 = 0;
          v96 = 0;
          v94 = 0uLL;
          v23 = -[PregateAnalyzer getParamForKey:toFloat:](self, "getParamForKey:toFloat:", CFSTR("maxFaceSize"), (char *)&v100 + 4);
          v24 = -[PregateAnalyzer getParamForKey:toFloat:](self, "getParamForKey:toFloat:", CFSTR("maxBlurMagnitude"), &v100);
          v25 = -[PregateAnalyzer getParamForKey:toFloat:](self, "getParamForKey:toFloat:", CFSTR("maxPerFrameMotion"), &v99);
          v26 = -[PregateAnalyzer getParamForKey:toInt:](self, "getParamForKey:toInt:", CFSTR("maxInterpCount"), &v96);
          v27 = -[PregateAnalyzer getParamForKey:toCMTime:](self, "getParamForKey:toCMTime:", CFSTR("maxFrameDuration"), &v97);
          LOWORD(v28) = 1024;
          v73 = 0;
          if (-[PregateAnalyzer getParamForKey:toCMTime:](self, "getParamForKey:toCMTime:", CFSTR("maxInterpTime"), &v94)&& v27&& v26&& v25)
          {
            v29 = v79;
            if (v24)
            {
              v9 = v75;
              v30 = v78;
              if (v23)
              {
                v81 = v18;
                v92 = v97;
                v93 = v98;
                v90 = v94;
                v91 = v95;
                v31 = -[PregateAnalyzer processPresentationTimesFromData:toBadFrameFlags:withMaxDuration:maxInterpGapTime:maxInterpFrameCount:firstIndex:lastIndex:](self, "processPresentationTimesFromData:toBadFrameFlags:withMaxDuration:maxInterpGapTime:maxInterpFrameCount:firstIndex:lastIndex:", v75, v20, &v92, &v90, v96, v79, v78);
                width = self->_inputVideoSize.width;
                if (width <= self->_inputVideoSize.height)
                  width = self->_inputVideoSize.height;
                v33 = width;
                v34 = (float)(v99 * v33) * (float)(v99 * v33);
                v73 = v31;
                v28 = v31;
                v76 = v20;
                do
                {
                  v85 = v28;
                  objc_msgSend(v9, "objectAtIndexedSubscript:", v29);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = v35;
                  v84 = v29;
                  if (v29 <= v79)
                  {
                    v38 = 0;
                  }
                  else
                  {
                    v37 = (float *)(v74 + 8 * v29);
                    v38 = 8
                        * ((float)((float)((float)(v37[1] - *(v37 - 1)) * (float)(v37[1] - *(v37 - 1)))
                                 + (float)((float)(*v37 - *(v37 - 2)) * (float)(*v37 - *(v37 - 2)))) > v34);
                  }
                  v40 = v81;
                  v39 = v82;
                  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("privEMBVct"));
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v42 = v41;
                  if (v41)
                  {
                    *(_QWORD *)&v92 = 0;
                    objc_msgSend(v41, "getBytes:length:", &v92, 8);
                    v43 = (float)((float)(*((float *)&v92 + 1) * *((float *)&v92 + 1))
                                + (float)(*(float *)&v92 * *(float *)&v92)) > (float)(*(float *)&v100 * *(float *)&v100);
                  }
                  else
                  {
                    v43 = 2048;
                  }
                  v44 = v43 | v38;

                  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("privDFArray"));
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v83 = v36;
                  if (objc_msgSend(v45, "count"))
                  {
                    v88 = 0u;
                    v89 = 0u;
                    v86 = 0u;
                    v87 = 0u;
                    v80 = v45;
                    v46 = v45;
                    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
                    if (v47)
                    {
                      v48 = v47;
                      v49 = *(_QWORD *)v87;
                      do
                      {
                        for (i = 0; i != v48; ++i)
                        {
                          if (*(_QWORD *)v87 != v49)
                            objc_enumerationMutation(v46);
                          objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("Rect"));
                          v51 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("Width"));
                          v52 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v52, "floatValue");
                          v54 = v53;

                          objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("Height"));
                          v55 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v55, "floatValue");
                          v57 = v56;

                          if ((float)(v54 * v57) > *((float *)&v100 + 1))
                            v44 |= 4u;

                        }
                        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v86, v101, 16);
                      }
                      while (v48);
                    }

                    v9 = v75;
                    v40 = v81;
                    v39 = v82;
                    v45 = v80;
                  }

                  objc_msgSend(v39, "objectAtIndexedSubscript:", v84);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = objc_msgSend(v58, "unsignedIntValue");

                  v60 = v59 | v44;
                  objc_msgSend(v40, "objectAtIndexedSubscript:", v84);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  v62 = objc_msgSend(v61, "BOOLValue");

                  if (v62)
                    v60 |= 0x10u;
                  objc_msgSend(v76, "objectAtIndexedSubscript:", v84);
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  v64 = objc_msgSend(v63, "unsignedIntValue");

                  v65 = v64 | v60;
                  objc_msgSend(v77, "objectAtIndexedSubscript:", v84);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  v67 = objc_msgSend(v66, "unsignedIntValue");

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v67 | v65);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "replaceObjectAtIndex:withObject:", v84, v68);

                  v28 = v65 | v85;
                  v29 = v84 + 1;
                }
                while (v84 != v78);
                v30 = v78;
                v29 = v79;
                v18 = v81;
                v20 = v76;
              }
            }
            else
            {
              v9 = v75;
              v30 = v78;
            }
          }
          else
          {
            v9 = v75;
            v30 = v78;
            v29 = v79;
          }
          v69 = -[PregateAnalyzer processGainAndExposureData:intoFlagsArray:firstIndex:lastIndex:](self, "processGainAndExposureData:intoFlagsArray:firstIndex:lastIndex:", v9, v77, v29, v30) | v28;
          objc_storeStrong((id *)&self->_badFrameFlags, v77);
          objc_storeStrong((id *)&self->_perFrameTranslationVecs, obj);
          v70 = v69 & 0x2C00;
          v15 = obj;
          v17 = v70 | v73;

          v10 = v77;
          v19 = v82;
        }

      }
    }

  }
  return v17;
}

- (int)isCumulativePanAcceptableForFrames:(id)a3 firstIndex:(int64_t)a4 lastIndex:(int64_t)a5
{
  id v8;
  void *v9;
  int v10;
  NSUInteger v11;
  NSUInteger v12;
  float v13;
  float v14;
  float v15;
  float v16;
  _BOOL4 v17;
  float v18;
  float v19;
  BOOL v20;
  uint64_t v22;

  v8 = a3;
  v9 = v8;
  v10 = 0x2000;
  if ((a4 & 0x8000000000000000) == 0 && a4 <= a5 && objc_msgSend(v8, "count") > (unint64_t)a5)
  {
    v11 = -[NSArray count](self->_badFrameFlags, "count");
    if (v11 == objc_msgSend(v9, "count")
      && (v12 = -[NSData length](self->_perFrameTranslationVecs, "length"), objc_msgSend(v9, "count") == v12 >> 3))
    {
      -[PregateAnalyzer cumulativePanForStartIndex:lastIndex:](self, "cumulativePanForStartIndex:lastIndex:", a4, a5);
      v14 = v13;
      v16 = v15;
      v22 = 0;
      v17 = -[PregateAnalyzer getParamForKey:toFloat:](self, "getParamForKey:toFloat:", CFSTR("maxPanX"), (char *)&v22 + 4);
      v10 = 1024;
      if (-[PregateAnalyzer getParamForKey:toFloat:](self, "getParamForKey:toFloat:", CFSTR("maxPanY"), &v22) && v17)
      {
        v18 = self->_inputVideoSize.width * *((float *)&v22 + 1);
        if (v14 <= v18)
        {
          v19 = self->_inputVideoSize.height * *(float *)&v22;
          v20 = v16 <= v19;
        }
        else
        {
          v20 = 0;
        }
        if (v20)
          v10 = 0;
        else
          v10 = 2;
      }
    }
    else
    {
      v10 = 0x2000;
    }
  }

  return v10;
}

- (BOOL)subsegmentMeetsTrimCriteriaForFrames:(id)a3 firstFrame:(int64_t)a4 lastFrame:(int64_t)a5 firstFrameTimeOut:(id *)a6 lastFrameTimeOut:(id *)a7 preciseTrimTimeOut:(id *)a8
{
  id v14;
  void *v15;
  BOOL v16;
  unint64_t v17;
  void *v18;
  void *v19;
  const __CFDictionary *v20;
  const __CFDictionary *v21;
  void *v22;
  const __CFDictionary *v23;
  CMTimeEpoch epoch;
  const __CFDictionary *v25;
  int32_t v26;
  int32_t v27;
  int32_t v29;
  CMTimeRange range;
  CMTime v33;
  CMTime v34;
  CMTime v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  CMTime v40;
  CMTime v41;
  int v42;
  CMTime v43;
  CMTime time1;
  CMTime v45;
  CMTime v46;
  CMTime time2;
  CMTime rhs;
  CMTime lhs;
  CMTime v50;
  int v51;
  CMTime v52;
  CMTime v53;

  v14 = a3;
  v15 = v14;
  if (a5 < a4)
  {
    v16 = 0;
    goto LABEL_42;
  }
  v17 = objc_msgSend(v14, "count");
  v16 = 0;
  if ((a4 & 0x8000000000000000) == 0 && v17 > a5)
  {
    objc_msgSend(v15, "objectAtIndex:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndex:", a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v53, 0, sizeof(v53));
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PresentationTime"));
    v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary(&v53, v20);

    memset(&v52, 0, sizeof(v52));
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("PresentationTime"));
    v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary(&v52, v21);

    if (a6)
      *(CMTime *)a6 = v53;
    if (a7)
      *(CMTime *)a7 = v52;
    -[PregateAnalyzer minimumRequiredTrimLength](self, "minimumRequiredTrimLength");
    if ((v51 & 0x1D) != 1)
      goto LABEL_22;
    memset(&v50, 0, sizeof(v50));
    lhs = v52;
    rhs = v53;
    CMTimeSubtract(&v50, &lhs, &rhs);
    if (a8)
      *(CMTime *)a8 = v50;
    -[PregateAnalyzer minimumRequiredTrimLength](self, "minimumRequiredTrimLength");
    lhs = v50;
    if ((CMTimeCompare(&lhs, &time2) & 0x80000000) == 0)
      goto LABEL_22;
    lhs = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    if (objc_msgSend(v15, "count") - 1 <= (unint64_t)a5)
    {
      if (a5 < 1)
      {
LABEL_18:
        rhs = v50;
        v46 = lhs;
        CMTimeAdd(&time1, &rhs, &v46);
        -[PregateAnalyzer minimumRequiredTrimLength](self, "minimumRequiredTrimLength");
        v26 = CMTimeCompare(&time1, &v43);
        if (!a8 || v26 < 0)
        {
          if (v26 < 0)
          {
            v16 = 0;
LABEL_41:

            goto LABEL_42;
          }
        }
        else
        {
          -[PregateAnalyzer minimumRequiredTrimLength](self, "minimumRequiredTrimLength");
          *(CMTime *)a8 = rhs;
        }
LABEL_22:
        -[PregateAnalyzer requiredFrameTime](self, "requiredFrameTime");
        if ((v42 & 0x1D) == 1)
        {
          -[PregateAnalyzer requiredFrameTime](self, "requiredFrameTime");
          v50 = v53;
          v27 = CMTimeCompare(&v41, &v50);
          -[PregateAnalyzer requiredFrameTime](self, "requiredFrameTime");
          v50 = v52;
          v16 = CMTimeCompare(&v40, &v50) < 1 && v27 >= 0;
        }
        else
        {
          v16 = 1;
        }
        -[PregateAnalyzer requiredTimeRange](self, "requiredTimeRange");
        if ((v39 & 1) != 0)
        {
          -[PregateAnalyzer requiredTimeRange](self, "requiredTimeRange");
          if ((v38 & 1) != 0)
          {
            -[PregateAnalyzer requiredTimeRange](self, "requiredTimeRange");
            if (!v37)
            {
              -[PregateAnalyzer requiredTimeRange](self, "requiredTimeRange");
              if ((v36 & 0x8000000000000000) == 0)
              {
                -[PregateAnalyzer requiredTimeRange](self, "requiredTimeRange");
                v35 = v34;
                v50 = v53;
                v29 = CMTimeCompare(&v35, &v50);
                -[PregateAnalyzer requiredTimeRange](self, "requiredTimeRange");
                CMTimeRangeGetEnd(&v33, &range);
                v50 = v52;
                if (CMTimeCompare(&v33, &v50) >= 1 || v29 < 0)
                  v16 = 0;
              }
            }
          }
        }
        goto LABEL_41;
      }
      objc_msgSend(v15, "objectAtIndexedSubscript:", a5 - 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      memset(&rhs, 0, sizeof(rhs));
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PresentationTime"));
      v25 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&rhs, v25);

      v46 = v52;
      *(_OWORD *)&v45.value = *(_OWORD *)&rhs.value;
      epoch = rhs.epoch;
    }
    else
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", a5 + 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      memset(&rhs, 0, sizeof(rhs));
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PresentationTime"));
      v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&rhs, v23);

      v46 = rhs;
      *(_OWORD *)&v45.value = *(_OWORD *)&v52.value;
      epoch = v52.epoch;
    }
    v45.epoch = epoch;
    CMTimeSubtract(&lhs, &v46, &v45);

    goto LABEL_18;
  }
LABEL_42:

  return v16;
}

- (int64_t)findLongestPassingSegmentInFrameFlags:(id)a3 startIndex:(int64_t)a4 endIndex:(int64_t)a5 startOfRun:(int64_t *)a6 gatingFailures:(int *)a7
{
  id v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int v13;
  int64_t v14;
  int64_t v15;
  void *v16;
  int v17;
  int64_t v18;
  int64_t v19;
  int64_t v20;
  int64_t v21;
  int64_t v22;
  int64_t *v24;

  v24 = a6;
  v9 = a3;
  if (a4 <= a5)
  {
    v14 = 0;
    v13 = 0;
    v12 = 0;
    v11 = 0;
    v10 = 0;
    v15 = a5 + 1;
    do
    {
      objc_msgSend(v9, "objectAtIndex:", a4, v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntegerValue");

      v13 |= v17;
      if (v10 <= v12)
        v18 = v11;
      else
        v18 = v14;
      if (v10 <= v12)
        v19 = v12;
      else
        v19 = v10;
      if (v10)
      {
        v20 = v14;
      }
      else
      {
        v18 = v11;
        v19 = v12;
        v20 = a4;
      }
      if (v17)
        v10 = 0;
      else
        ++v10;
      if (v17)
      {
        v11 = v18;
        v12 = v19;
      }
      else
      {
        v14 = v20;
      }
      ++a4;
    }
    while (v15 != a4);
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
  }
  if (v10 <= v12)
    v21 = v11;
  else
    v21 = v14;
  *v24 = v21;
  if (a7)
    *a7 = v13;
  if (v10 <= v12)
    v22 = v12;
  else
    v22 = v10;

  return v22;
}

- (BOOL)findFrameIndicesInFrameArray:(id)a3 forTimeRange:(id *)a4 startIndex:(int *)a5 endIndex:(int *)a6
{
  id v10;
  unint64_t v11;
  CMTime *p_inputTrimTime;
  void *v13;
  const __CFDictionary *v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  void *v19;
  const __CFDictionary *v20;
  BOOL v21;
  int *v23;
  PregateAnalyzer *v24;
  CMTime rhs;
  CMTime time2;
  CMTime time1;
  CMTime v28;
  CMTime v29;

  v10 = a3;
  if (!objc_msgSend(v10, "count"))
    goto LABEL_24;
  if ((a4->var0.var2 & 0x1D) == 1 || (a4->var1.var2 & 0x1D) == 1)
  {
    v29 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    v24 = self;
    if (objc_msgSend(v10, "count"))
    {
      v11 = 0;
      p_inputTrimTime = (CMTime *)&self->inputTrimTime;
      while (1)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PresentationTime"));
        v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          memset(&v28, 0, sizeof(v28));
          CMTimeMakeFromDictionary(&v28, v14);
          time1 = v28;
          time2 = *p_inputTrimTime;
          if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
            break;
        }

        if (objc_msgSend(v10, "count") <= ++v11)
          goto LABEL_13;
      }
      v29 = v28;

LABEL_13:
      v15 = v11;
    }
    else
    {
      v15 = 0;
      v11 = 0;
    }
    if (objc_msgSend(v10, "count") <= v11)
      goto LABEL_24;
    v23 = a5;
    v17 = objc_msgSend(v10, "count");
    v18 = v17;
    if (v17 <= (uint64_t)v15)
      goto LABEL_24;
    v16 = v17 - 1;
    while (1)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", --v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("PresentationTime"));
      v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        memset(&v28, 0, sizeof(v28));
        CMTimeMakeFromDictionary(&v28, v20);
        memset(&time1, 0, sizeof(time1));
        time2 = v28;
        rhs = v29;
        CMTimeSubtract(&time1, &time2, &rhs);
        time2 = time1;
        rhs = (CMTime)v24->inputTrimTime.duration;
        if (CMTimeCompare(&time2, &rhs) <= 0)
          break;
      }

      --v16;
      if (v18 <= v15)
        goto LABEL_24;
    }

    self = v24;
  }
  else
  {
    v23 = a5;
    v15 = 0;
    v16 = objc_msgSend(v10, "count") - 1;
  }
  if (!-[PregateAnalyzer subsegmentMeetsTrimCriteriaForFrames:firstFrame:lastFrame:firstFrameTimeOut:lastFrameTimeOut:preciseTrimTimeOut:](self, "subsegmentMeetsTrimCriteriaForFrames:firstFrame:lastFrame:firstFrameTimeOut:lastFrameTimeOut:preciseTrimTimeOut:", v10, v15, v16, 0, 0, 0))
  {
LABEL_24:
    v21 = 0;
    goto LABEL_25;
  }
  *v23 = v15;
  *a6 = v16;
  v21 = 1;
LABEL_25:

  return v21;
}

- (int)findGatingPassViaTrimming:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;
  int v7;
  int v9;
  uint64_t v10;

  v4 = a3;
  v10 = 0;
  v9 = 0;
  v5 = -[PregateAnalyzer findLongestPassingSegmentInFrameFlags:startIndex:endIndex:startOfRun:gatingFailures:](self, "findLongestPassingSegmentInFrameFlags:startIndex:endIndex:startOfRun:gatingFailures:", self->_badFrameFlags, self->_trimInput_firstIndex, self->_trimInput_lastIndex, &v10, &v9);
  if (v5)
  {
    v6 = v5 + v10 - 1;
    if (-[PregateAnalyzer subsegmentMeetsTrimCriteriaForFrames:firstFrame:lastFrame:firstFrameTimeOut:lastFrameTimeOut:preciseTrimTimeOut:](self, "subsegmentMeetsTrimCriteriaForFrames:firstFrame:lastFrame:firstFrameTimeOut:lastFrameTimeOut:preciseTrimTimeOut:", v4))
    {
      v7 = -[PregateAnalyzer isCumulativePanAcceptableForFrames:firstIndex:lastIndex:](self, "isCumulativePanAcceptableForFrames:firstIndex:lastIndex:", v4, v10, v6);
      if (!v7)
      {
        *(_OWORD *)&self->outputTrimTime.start.value = 0uLL;
        self->outputTrimTime.start.epoch = 0;
        self->outputTrimTime.duration.epoch = 0;
        *(_OWORD *)&self->outputTrimTime.duration.value = 0uLL;
      }
    }
    else
    {
      v7 = v9;
      if (!v9)
      {
        v7 = 512;
        v9 = 512;
      }
    }
  }
  else if (v9)
  {
    v7 = v9;
  }
  else
  {
    v7 = 512;
  }

  return v7;
}

- (int)processPregateSuccess:(int *)a3
{
  uint64_t v5;
  __int128 v6;
  int64_t v7;
  $95D729B680665BEAEFA1D6FCA8238556 *p_duration;
  int v9;
  id v10;
  __int128 v11;
  int v12;
  Float64 Seconds;
  Float64 v14;
  Float64 v15;
  Float64 v17;
  _BYTE time[32];
  __int128 v19;
  id v20;

  v5 = MEMORY[0x1E0CA2E18];
  v6 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)&self->outputTrimTime.start.value = *MEMORY[0x1E0CA2E18];
  v7 = *(_QWORD *)(v5 + 16);
  self->outputTrimTime.start.epoch = v7;
  p_duration = &self->outputTrimTime.duration;
  *(_OWORD *)&self->outputTrimTime.duration.value = v6;
  self->outputTrimTime.duration.epoch = v7;
  v9 = -[PregateAnalyzer fetchVideoDimensionsFromMetadata](self, "fetchVideoDimensionsFromMetadata");
  if (!v9)
  {
    v20 = 0;
    v9 = -[PregateAnalyzer getFrameMetadataArray:](self, "getFrameMetadataArray:", &v20);
    v10 = v20;
    if (objc_msgSend(v10, "count"))
    {
      if (v9 || !v10)
        goto LABEL_11;
      v11 = *(_OWORD *)&self->inputTrimTime.start.epoch;
      *(_OWORD *)time = *(_OWORD *)&self->inputTrimTime.start.value;
      *(_OWORD *)&time[16] = v11;
      v19 = *(_OWORD *)&self->inputTrimTime.duration.timescale;
      if (-[PregateAnalyzer findFrameIndicesInFrameArray:forTimeRange:startIndex:endIndex:](self, "findFrameIndicesInFrameArray:forTimeRange:startIndex:endIndex:", v10, time, &self->_trimInput_firstIndex, &self->_trimInput_lastIndex))
      {
        v12 = -[PregateAnalyzer getPerFrameGatingData:firstIndex:lastIndex:](self, "getPerFrameGatingData:firstIndex:lastIndex:", v10, self->_trimInput_firstIndex, self->_trimInput_lastIndex);
        if (!v12)
          v12 = -[PregateAnalyzer findGatingPassViaTrimming:](self, "findGatingPassViaTrimming:", v10);
      }
      else
      {
        v12 = 512;
      }
    }
    else
    {
      v12 = 2048;
    }
    *a3 = v12;
LABEL_11:

  }
  if (!*a3)
  {
    if ((self->outputTrimTime.start.flags & 1) != 0 && (self->outputTrimTime.duration.flags & 1) != 0)
    {
      *(_OWORD *)time = *(_OWORD *)&self->outputTrimTime.start.value;
      *(_QWORD *)&time[16] = self->outputTrimTime.start.epoch;
      Seconds = CMTimeGetSeconds((CMTime *)time);
      *(_OWORD *)time = *(_OWORD *)&p_duration->value;
      *(_QWORD *)&time[16] = p_duration->epoch;
      v14 = CMTimeGetSeconds((CMTime *)time);
      *(_OWORD *)time = *(_OWORD *)&self->inputTrimTime.start.value;
      *(_QWORD *)&time[16] = self->inputTrimTime.start.epoch;
      v15 = CMTimeGetSeconds((CMTime *)time);
      *(_OWORD *)time = *(_OWORD *)&self->inputTrimTime.duration.value;
      *(_QWORD *)&time[16] = self->inputTrimTime.duration.epoch;
      v17 = CMTimeGetSeconds((CMTime *)time);
      NSLog(CFSTR("video gating trim success, [start:%f duration:%f] input was [start:%f duration:%f]\n"), *(_QWORD *)&Seconds, *(_QWORD *)&v14, *(_QWORD *)&v15, *(_QWORD *)&v17);
    }
    else
    {
      NSLog(CFSTR("video gating success, invalid trim\n"));
    }
  }
  return v9;
}

- (PregateFeatureBuilder)featureBuilder
{
  return (PregateFeatureBuilder *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFeatureBuilder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumRequiredTrimLength
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->minimumRequiredTrimLength, 24, 1, 0);
  return result;
}

- (void)setMinimumRequiredTrimLength:(id *)a3
{
  objc_copyStruct(&self->minimumRequiredTrimLength, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)requiredFrameTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->requiredFrameTime, 24, 1, 0);
  return result;
}

- (void)setRequiredFrameTime:(id *)a3
{
  objc_copyStruct(&self->requiredFrameTime, a3, 24, 1, 0);
}

- ($4C6D1E162277694FB76656457146213A)requiredTimeRange
{
  $4C6D1E162277694FB76656457146213A *result;

  objc_copyStruct(retstr, &self->requiredTimeRange, 48, 1, 0);
  return result;
}

- (void)setRequiredTimeRange:(id *)a3
{
  objc_copyStruct(&self->requiredTimeRange, a3, 48, 1, 0);
}

- (NSDictionary)pregateParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPregateParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- ($4C6D1E162277694FB76656457146213A)inputTrimTime
{
  $4C6D1E162277694FB76656457146213A *result;

  objc_copyStruct(retstr, &self->inputTrimTime, 48, 1, 0);
  return result;
}

- (void)setInputTrimTime:(id *)a3
{
  objc_copyStruct(&self->inputTrimTime, a3, 48, 1, 0);
}

- ($4C6D1E162277694FB76656457146213A)outputTrimTime
{
  $4C6D1E162277694FB76656457146213A *result;

  objc_copyStruct(retstr, &self->outputTrimTime, 48, 1, 0);
  return result;
}

- (NSDictionary)defaultParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDefaultParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (CGSize)inputVideoSize
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGSize result;

  objc_copyStruct(v4, &self->_inputVideoSize, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setInputVideoSize:(CGSize)a3
{
  CGSize v3;

  v3 = a3;
  objc_copyStruct(&self->_inputVideoSize, &v3, 16, 1, 0);
}

- (BOOL)haveInputVideoSize
{
  return self->_haveInputVideoSize;
}

- (void)setHaveInputVideoSize:(BOOL)a3
{
  self->_haveInputVideoSize = a3;
}

- (int)trimInput_firstIndex
{
  return self->_trimInput_firstIndex;
}

- (void)setTrimInput_firstIndex:(int)a3
{
  self->_trimInput_firstIndex = a3;
}

- (int)trimInput_lastIndex
{
  return self->_trimInput_lastIndex;
}

- (void)setTrimInput_lastIndex:(int)a3
{
  self->_trimInput_lastIndex = a3;
}

- (int)gatingPassTrimResult_firstIndex
{
  return self->_gatingPassTrimResult_firstIndex;
}

- (void)setGatingPassTrimResult_firstIndex:(int)a3
{
  self->_gatingPassTrimResult_firstIndex = a3;
}

- (int)gatingPassTrimResult_lastIndex
{
  return self->_gatingPassTrimResult_lastIndex;
}

- (void)setGatingPassTrimResult_lastIndex:(int)a3
{
  self->_gatingPassTrimResult_lastIndex = a3;
}

- (NSData)perFrameTranslationVecs
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPerFrameTranslationVecs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)badFrameFlags
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBadFrameFlags:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSArray)focusScores
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFocusScores:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusScores, 0);
  objc_storeStrong((id *)&self->_badFrameFlags, 0);
  objc_storeStrong((id *)&self->_perFrameTranslationVecs, 0);
  objc_storeStrong((id *)&self->_defaultParameters, 0);
  objc_storeStrong((id *)&self->pregateParameters, 0);
  objc_storeStrong((id *)&self->featureBuilder, 0);
}

@end

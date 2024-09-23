@implementation VCPVideoMetaLivePhotoMetaAnalyzer

+ (id)defaultDesiredKeys
{
  if (+[VCPVideoMetaLivePhotoMetaAnalyzer defaultDesiredKeys]::onceToken != -1)
    dispatch_once(&+[VCPVideoMetaLivePhotoMetaAnalyzer defaultDesiredKeys]::onceToken, &__block_literal_global_66);
  return (id)+[VCPVideoMetaLivePhotoMetaAnalyzer defaultDesiredKeys]::keys;
}

void __55__VCPVideoMetaLivePhotoMetaAnalyzer_defaultDesiredKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[16];

  v2[15] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("privECMVct");
  v2[1] = CFSTR("privEMBVct");
  v2[2] = CFSTR("privDFArray");
  v2[3] = CFSTR("privET");
  v2[4] = CFSTR("privTZF");
  v2[5] = CFSTR("privImgG");
  v2[6] = CFSTR("privAFS");
  v2[7] = CFSTR("privAFSt");
  v2[8] = CFSTR("privFM");
  v2[9] = CFSTR("trajectoryHomography");
  v2[10] = CFSTR("presentingTimestampInNanos");
  v2[11] = CFSTR("originalPresentingTimestampInNanos");
  v2[12] = CFSTR("sequenceAdjusterRecipe");
  v2[13] = CFSTR("sequenceAdjusterDisplacement");
  v2[14] = CFSTR("interpolatedFrame");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[VCPVideoMetaLivePhotoMetaAnalyzer defaultDesiredKeys]::keys;
  +[VCPVideoMetaLivePhotoMetaAnalyzer defaultDesiredKeys]::keys = v0;

}

+ (id)referenceSoftwareStackVersion
{
  unsigned __int8 v2;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  if ((v2 & 1) == 0
  {
    v8[0] = &unk_1E6B74A80;
    v7[0] = CFSTR("LivePhotoMetadataSetupDataVersion");
    v7[1] = CFSTR("FrameworkVersions");
    v5 = CFSTR("CMCaptureCore");
    v6 = CFSTR("45.1");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    +[VCPVideoMetaLivePhotoMetaAnalyzer referenceSoftwareStackVersion]::referenceSoftwareStackVersion = objc_claimAutoreleasedReturnValue();

  }
  return (id)+[VCPVideoMetaLivePhotoMetaAnalyzer referenceSoftwareStackVersion]::referenceSoftwareStackVersion;
}

- (VCPVideoMetaLivePhotoMetaAnalyzer)init
{

  return 0;
}

- (VCPVideoMetaLivePhotoMetaAnalyzer)initWithRequestAnalyses:(unint64_t)a3 formatDescription:(opaqueCMFormatDescription *)a4
{
  VCPVideoMetaLivePhotoMetaAnalyzer *v6;
  NSMutableData *v7;
  NSMutableData *deSerializedMetaBuffer;
  VCPVideoMetaFocusAnalyzer *v9;
  VCPVideoMetaFocusAnalyzer *metaFocusAnalyzer;
  VCPVideoMetaMotionAnalyzer *v11;
  VCPVideoMetaMotionAnalyzer *metaMotionAnalyzer;
  VCPVideoMetaLensSwitchAnalyzer *v13;
  VCPVideoMetaLensSwitchAnalyzer *metaLensSwitchAnalzer;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *metadataStabilizationArray;
  NSMutableArray *v18;
  NSMutableArray *frameTimestampArray;
  NSMutableArray *v20;
  NSMutableArray *originalFrameTimestampArray;
  NSMutableArray *v22;
  NSMutableArray *metadataItemTimestampArray;
  NSMutableArray *v24;
  NSMutableArray *adjusterArray;
  NSMutableArray *v26;
  NSMutableArray *interpolatedFrameArray;
  CGFloat v28;
  CGFloat v29;
  BOOL v30;
  VCPVideoMetaLivePhotoMetaAnalyzer *v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)VCPVideoMetaLivePhotoMetaAnalyzer;
  v6 = -[VCPVideoMetaLivePhotoMetaAnalyzer init](&v33, sel_init);
  if (v6)
  {
    v7 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    deSerializedMetaBuffer = v6->_deSerializedMetaBuffer;
    v6->_deSerializedMetaBuffer = v7;

    v9 = objc_alloc_init(VCPVideoMetaFocusAnalyzer);
    metaFocusAnalyzer = v6->_metaFocusAnalyzer;
    v6->_metaFocusAnalyzer = v9;

    v11 = objc_alloc_init(VCPVideoMetaMotionAnalyzer);
    metaMotionAnalyzer = v6->_metaMotionAnalyzer;
    v6->_metaMotionAnalyzer = v11;

    v13 = objc_alloc_init(VCPVideoMetaLensSwitchAnalyzer);
    metaLensSwitchAnalzer = v6->_metaLensSwitchAnalzer;
    v6->_metaLensSwitchAnalzer = v13;

    v15 = v6->_metaFocusAnalyzer;
    if (v15)
    {
      v15 = v6->_metaMotionAnalyzer;
      if (v15)
      {
        v6->_requestAnalyses = a3;
        v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        metadataStabilizationArray = v6->_metadataStabilizationArray;
        v6->_metadataStabilizationArray = v16;

        v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        frameTimestampArray = v6->_frameTimestampArray;
        v6->_frameTimestampArray = v18;

        v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        originalFrameTimestampArray = v6->_originalFrameTimestampArray;
        v6->_originalFrameTimestampArray = v20;

        v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        metadataItemTimestampArray = v6->_metadataItemTimestampArray;
        v6->_metadataItemTimestampArray = v22;

        v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        adjusterArray = v6->_adjusterArray;
        v6->_adjusterArray = v24;

        v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        interpolatedFrameArray = v6->_interpolatedFrameArray;
        v6->_interpolatedFrameArray = v26;

        v6->_prevEstimatedCenterMv.dx = 0.0;
        v6->_prevEstimatedCenterMv.dy = 0.0;
        -[VCPVideoMetaLivePhotoMetaAnalyzer readGyroHomographyDimension:](v6, "readGyroHomographyDimension:", a4);
        v6->_gyroHomographyDimension.width = v28;
        v6->_gyroHomographyDimension.height = v29;
        if (-[VCPVideoMetaLivePhotoMetaAnalyzer gyroHomographyVersionIsValid:](v6, "gyroHomographyVersionIsValid:", a4))
        {
          v30 = v6->_gyroHomographyDimension.width != *MEMORY[0x1E0C9D820];
          if (v6->_gyroHomographyDimension.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
            v30 = 1;
        }
        else
        {
          v30 = 0;
        }
        v6->_gyroHomographyIsValid = v30;
        v15 = v6;
      }
    }
    v31 = v15;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (BOOL)gyroHomographyVersionIsValid:(opaqueCMFormatDescription *)a3
{
  void *v4;
  void *v5;
  float v6;
  float v7;
  BOOL v8;

  -[VCPVideoMetaLivePhotoMetaAnalyzer readSoftwareStackVersion:](self, "readSoftwareStackVersion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "referenceSoftwareStackVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VCPVideoMetaLivePhotoMetaAnalyzer compareSoftwareStackVersion:withReferenceVersion:](self, "compareSoftwareStackVersion:withReferenceVersion:", v4, v5);
    v7 = v6;

    v8 = v7 != -1.0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGSize)readGyroHomographyDimension:(opaqueCMFormatDescription *)a3
{
  double v4;
  double v5;
  __CFData *v6;
  __CFData *v7;
  const __CFData *v8;
  int v9;
  double v10;
  double v11;
  UInt8 buffer[4];
  CFRange v13;
  CFRange v14;
  CGSize result;

  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v6 = -[VCPVideoMetaLivePhotoMetaAnalyzer getSetupDataFrom:](self, "getSetupDataFrom:", a3);
  if (v6)
  {
    v7 = -[VCPVideoMetaLivePhotoMetaAnalyzer getFirstAtomWithFourCharCode:fromSetupData:](self, "getFirstAtomWithFourCharCode:fromSetupData:", 1684630899, v6);
    if (v7)
    {
      v8 = v7;
      if (CFDataGetLength(v7) >= 8)
      {
        v13.location = 0;
        v13.length = 4;
        CFDataGetBytes(v8, v13, buffer);
        v9 = bswap32(*(unsigned int *)buffer);
        v14.location = 4;
        v14.length = 4;
        CFDataGetBytes(v8, v14, buffer);
        v4 = (double)v9;
        v5 = (double)(int)bswap32(*(unsigned int *)buffer);
        CFRelease(v8);
      }
    }
  }
  v10 = v4;
  v11 = v5;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)readSoftwareStackVersion:(opaqueCMFormatDescription *)a3
{
  __CFData *v4;
  const __CFData *v5;
  const __CFData *v6;
  void *v7;

  v4 = -[VCPVideoMetaLivePhotoMetaAnalyzer getSetupDataFrom:](self, "getSetupDataFrom:", a3);
  if (v4
    && (v5 = -[VCPVideoMetaLivePhotoMetaAnalyzer getFirstAtomWithFourCharCode:fromSetupData:](self, "getFirstAtomWithFourCharCode:fromSetupData:", 1667655542, v4)) != 0)
  {
    v6 = v5;
    if (CFDataGetLength(v5))
      v7 = (void *)CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, 0, 0, 0);
    else
      v7 = (void *)MEMORY[0x1E0C9AA70];
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (__CFData)getSetupDataFrom:(opaqueCMFormatDescription *)a3
{
  if (FigMetadataFormatDescriptionGetLocalIDForMetadataIdentifyingFactors())
    return (__CFData *)FigMetadataFormatDescriptionGetSetupDataForLocalID();
  else
    return 0;
}

- (__CFData)getFirstAtomWithFourCharCode:(unsigned int)a3 fromSetupData:(__CFData *)a4
{
  unint64_t Length;
  const UInt8 *BytePtr;
  const UInt8 *v8;
  __CFData *result;
  unint64_t v10;
  const __CFAllocator *v11;
  const UInt8 *v12;
  uint64_t v13;

  Length = CFDataGetLength(a4);
  BytePtr = CFDataGetBytePtr(a4);
  if (Length < 8)
    return 0;
  v8 = BytePtr;
  result = 0;
  v10 = 0;
  v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  do
  {
    v12 = &v8[v10];
    v13 = bswap32(*(_DWORD *)&v8[v10]);
    v10 += v13;
    if (v13 < 8 || v10 > Length)
      break;
    if (bswap32(*((_DWORD *)v12 + 1)) == a3 && result == 0)
      result = CFDataCreate(v11, v12 + 8, v13 - 8);
  }
  while (v10 + 8 <= Length);
  return result;
}

- (float)compareSoftwareStackVersion:(id)a3 withReferenceVersion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  float v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  float v17;
  _QWORD v19[4];
  id v20;
  VCPVideoMetaLivePhotoMetaAnalyzer *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = NAN;
  if (v6)
  {
    if (v7)
    {
      if (objc_msgSend(v6, "count") || (v9 = 1.0, !objc_msgSend(v8, "count")))
      {
        if (objc_msgSend(v6, "count") && !objc_msgSend(v8, "count"))
        {
          v9 = -1.0;
        }
        else if (objc_msgSend(v6, "count") || objc_msgSend(v8, "count"))
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LivePhotoMetadataSetupDataVersion"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("LivePhotoMetadataSetupDataVersion"));
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)v11;
          v9 = NAN;
          if (v10 && v11)
          {
            v13 = objc_msgSend(v10, "intValue");
            if (v13 == objc_msgSend(v12, "intValue") && (int)objc_msgSend(v10, "intValue") <= 1)
            {
              objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FrameworkVersions"));
              v14 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("FrameworkVersions"));
              v15 = objc_claimAutoreleasedReturnValue();
              v16 = (void *)v15;
              v17 = 1.0;
              if (!(v14 | v15))
                v17 = 0.0;
              if (v14)
                v9 = -1.0;
              else
                v9 = v17;
              if (v14 && v15)
              {
                if (objc_msgSend((id)v14, "count") && objc_msgSend(v16, "count"))
                {
                  v38 = 0;
                  v39 = &v38;
                  v40 = 0x2020000000;
                  v41 = 0;
                  v34 = 0;
                  v35 = &v34;
                  v36 = 0x2020000000;
                  v37 = 0;
                  v30 = 0;
                  v31 = &v30;
                  v32 = 0x2020000000;
                  v33 = 0;
                  v26 = 0;
                  v27 = &v26;
                  v28 = 0x2020000000;
                  v29 = 0;
                  v19[0] = MEMORY[0x1E0C809B0];
                  v19[1] = 3221225472;
                  v19[2] = __86__VCPVideoMetaLivePhotoMetaAnalyzer_compareSoftwareStackVersion_withReferenceVersion___block_invoke;
                  v19[3] = &unk_1E6B1A420;
                  v20 = (id)v14;
                  v21 = self;
                  v22 = &v26;
                  v23 = &v38;
                  v24 = &v34;
                  v25 = &v30;
                  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v19);
                  if (*((_BYTE *)v27 + 24))
                  {
                    v9 = NAN;
                  }
                  else if (*((_BYTE *)v39 + 24))
                  {
                    if (*((_BYTE *)v35 + 24))
                      v9 = NAN;
                    else
                      v9 = 1.0;
                  }
                  else
                  {
                    v9 = -1.0;
                    if (!*((_BYTE *)v35 + 24))
                    {
                      if (*((_BYTE *)v31 + 24))
                        v9 = 0.0;
                      else
                        v9 = NAN;
                    }
                  }

                  _Block_object_dispose(&v26, 8);
                  _Block_object_dispose(&v30, 8);
                  _Block_object_dispose(&v34, 8);
                  _Block_object_dispose(&v38, 8);
                }
                else
                {
                  v9 = NAN;
                }
              }

            }
            else
            {
              v9 = NAN;
            }
          }

        }
        else
        {
          v9 = 0.0;
        }
      }
    }
  }

  return v9;
}

void __86__VCPVideoMetaLivePhotoMetaAnalyzer_compareSoftwareStackVersion_withReferenceVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  float v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "compareNumericVersion:withReferenceVersion:", v7, v5);
    if (v8 == 1.0)
    {
      v9 = *(_QWORD *)(a1 + 56);
    }
    else if (v8 == -1.0)
    {
      v9 = *(_QWORD *)(a1 + 64);
    }
    else
    {
      if (v8 != 0.0)
      {
LABEL_9:

        goto LABEL_10;
      }
      v9 = *(_QWORD *)(a1 + 72);
    }
    *(_BYTE *)(*(_QWORD *)(v9 + 8) + 24) = 1;
    goto LABEL_9;
  }
LABEL_10:

}

- (float)compareNumericVersion:(id)a3 withReferenceVersion:(id)a4
{
  id v5;
  id v6;
  float v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  float v23;
  unint64_t v24;
  unint64_t v25;
  id v27;
  id v28;

  v5 = a3;
  v6 = a4;
  v7 = 0.0;
  if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
  {
    v27 = v6;
    v28 = v5;
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "count");
    v11 = objc_msgSend(v9, "count");
    if (v10 >= v11)
      v12 = v11;
    else
      v12 = v10;
    if (v12)
    {
      v13 = 0;
      while (1)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqualToString:", v15) & 1) == 0)
        {
          v16 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
          objc_msgSend(v16, "numberFromString:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v17
            || (objc_msgSend(v16, "numberFromString:", v15),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                v18,
                v17,
                !v18))
          {
            v23 = NAN;
LABEL_17:

            goto LABEL_19;
          }
          objc_msgSend(v16, "numberFromString:", v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "intValue");

          objc_msgSend(v16, "numberFromString:", v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "intValue");

          if (v20 > v22)
          {
            v23 = 1.0;
            goto LABEL_17;
          }

          if (v20 < v22)
            break;
        }

        if (v12 == ++v13)
        {
          v23 = 0.0;
          goto LABEL_20;
        }
      }
      v23 = -1.0;
LABEL_19:

LABEL_20:
      v7 = v23;
      if (v23 != 0.0)
        goto LABEL_25;
    }
    else
    {
      v23 = 0.0;
    }
    v24 = objc_msgSend(v8, "count");
    v7 = 1.0;
    if (v24 <= objc_msgSend(v9, "count"))
    {
      v25 = objc_msgSend(v8, "count");
      if (v25 >= objc_msgSend(v9, "count"))
        v7 = v23;
      else
        v7 = -1.0;
    }
LABEL_25:

    v6 = v27;
    v5 = v28;
  }

  return v7;
}

- (int)convertLivePhotoStruct:(FigLivePhotoMetadata *)a3 toDictionary:(id)a4
{
  id v6;
  CGVector v7;
  __int16 var6_high;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  char *p_var8;
  void *v20;
  __int16 v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t var7_low;
  uint64_t v26;
  uint64_t i64;
  int32x4_t *v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  double v32;
  uint64_t v33;
  float *p_var2;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  VCPVideoMetaLivePhotoMetaAnalyzer *v43;
  NSPoint v44;
  NSPoint v45;
  NSRect v46;

  v6 = a4;
  if (v6)
  {
    if (a3->var0 - 4 >= 0xFFFFFFFD)
    {
      var6_high = HIWORD(a3->var1.var6);
      if ((var6_high & 1) != 0)
      {
        LODWORD(v7.dx) = *(&a3->var0 + 1);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7.dx);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("privET"));

        var6_high = HIWORD(a3->var1.var6);
      }
      if ((var6_high & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)&a3->var1.var0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("privAFS"));

        var6_high = HIWORD(a3->var1.var6);
      }
      if ((var6_high & 4) != 0)
      {
        v44.x = *(float *)&a3->var1.var1 - self->_prevEstimatedCenterMv.dx;
        v44.y = *((float *)&a3->var1.var1 + 1) - self->_prevEstimatedCenterMv.dy;
        NSStringFromPoint(v44);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("privECMVct"));

        v7 = (CGVector)vcvtq_f64_f32((float32x2_t)a3->var1.var1);
        self->_prevEstimatedCenterMv = v7;
        var6_high = HIWORD(a3->var1.var6);
      }
      if ((var6_high & 8) != 0)
      {
        v45.x = a3->var1.var2;
        v45.y = a3->var1.var3;
        NSStringFromPoint(v45);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("privEMBVct"));

        var6_high = HIWORD(a3->var1.var6);
      }
      if ((var6_high & 0x10) != 0)
      {
        *(float *)&v7.dx = a3->var1.var4;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7.dx);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("privTZF"));

        var6_high = HIWORD(a3->var1.var6);
      }
      if ((var6_high & 0x20) != 0)
      {
        *(float *)&v7.dx = a3->var1.var5;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7.dx);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("privImgG"));

        var6_high = HIWORD(a3->var1.var6);
      }
      if ((var6_high & 0x40) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", SLOBYTE(a3->var1.var6));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("privAFSt"));

        var6_high = HIWORD(a3->var1.var6);
      }
      if ((var6_high & 0x80) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", SBYTE1(a3->var1.var6));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("privFM"));

      }
      if (LODWORD(a3->var1.var7))
      {
        v43 = self;
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (LODWORD(a3->var1.var7))
        {
          v18 = 0;
          p_var8 = &a3->var1.var8;
          do
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = *((_WORD *)p_var8 + 15);
            if ((v21 & 2) != 0)
            {
              v46.origin.x = *((float *)p_var8 + 2);
              v46.origin.y = *((float *)p_var8 + 3);
              v46.size.width = *((float *)p_var8 + 4);
              v46.size.height = *((float *)p_var8 + 5);
              NSStringFromRect(v46);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("faceBounds"));

              v21 = *((_WORD *)p_var8 + 15);
            }
            if ((v21 & 4) != 0)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)p_var8 + 6));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("faceId"));

              v21 = *((_WORD *)p_var8 + 15);
            }
            if ((v21 & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)p_var8);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, CFSTR("relSampleTime"));

            }
            objc_msgSend(v17, "addObject:", v20);

            ++v18;
            p_var8 += 32;
          }
          while (v18 < LODWORD(a3->var1.var7));
        }
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("privDFArray"));

        self = v43;
      }
      if (a3->var0 == 3)
      {
        var7_low = LODWORD(a3->var1.var7);
        v28 = (int32x4_t *)((char *)a3 + 32 * var7_low);
        v26 = vaddvq_s32(v28[3]);
        i64 = (uint64_t)v28[2 * v26 + 3].i64;
        v30 = *(_WORD *)(i64 + 16);
        v29 = i64 + 16;
        LOBYTE(v28) = v30;
        if ((v30 & 1) != 0 && self->_gyroHomographyIsValid)
        {
          v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v33 = 0;
          p_var2 = &a3->var1.var12[var7_low + v26].var2;
          do
          {
            *(float *)&v32 = p_var2[v33];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addObject:", v35);

            ++v33;
          }
          while (v33 != 9);
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, CFSTR("trajectoryHomography"));

          LOWORD(v28) = *(_WORD *)v29;
        }
        if ((v28 & 2) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v29 + 40));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v36, CFSTR("presentingTimestampInNanos"));

          LOWORD(v28) = *(_WORD *)v29;
        }
        if ((v28 & 4) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v29 + 48));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, CFSTR("originalPresentingTimestampInNanos"));

          LOWORD(v28) = *(_WORD *)v29;
        }
        if ((v28 & 8) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v29 + 56));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, CFSTR("sequenceAdjusterRecipe"));

        }
        else
        {
          objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E6B74A98, CFSTR("sequenceAdjusterRecipe"));
        }
        if ((*(_WORD *)v29 & 0x10) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", *(char *)(v29 + 57));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v40, CFSTR("sequenceAdjusterDisplacement"));

        }
        else
        {
          objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E6B74A98, CFSTR("sequenceAdjusterDisplacement"));
        }
        if ((*(_WORD *)v29 & 0x20) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v29 + 58));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v41, CFSTR("interpolatedFrame"));

        }
      }
    }
    v38 = 0;
  }
  else
  {
    v38 = -50;
  }

  return v38;
}

- (int)convertLivePhotoBinary:(id)a3 toDictionary:(id)a4
{
  id v6;
  id v7;
  id v8;
  int v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "bytes");
  objc_msgSend(v8, "length");
  v9 = FigLivePhotoMetadataComputeDeserializationSize();
  if (!v9)
  {
    -[NSMutableData length](self->_deSerializedMetaBuffer, "length");
    -[NSMutableData resetBytesInRange:](self->_deSerializedMetaBuffer, "resetBytesInRange:", 0, -[NSMutableData length](self->_deSerializedMetaBuffer, "length", 0));
    v10 = -[NSMutableData mutableBytes](self->_deSerializedMetaBuffer, "mutableBytes");
    v9 = FigLivePhotoMetadataDeserializeIntoBuffer();
    if (!v9)
      v9 = -[VCPVideoMetaLivePhotoMetaAnalyzer convertLivePhotoStruct:toDictionary:](self, "convertLivePhotoStruct:toDictionary:", v10, v7);
  }

  return v9;
}

- (int)processMetadataGroup:(id)a3 flags:(unint64_t *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  CFDictionaryRef v14;
  CFDictionaryRef v15;
  double Seconds;
  void *v17;
  uint64_t v18;
  float v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  float v25;
  float v26;
  float v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  float v31;
  float v32;
  float v33;
  _BOOL4 v34;
  void *v35;
  float v36;
  float v37;
  void *v38;
  float v39;
  float v40;
  float v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  float v45;
  float v46;
  float v47;
  _BOOL4 v48;
  void *v49;
  VCPVideoMetaLivePhotoMetaAnalyzer *v50;
  void *v51;
  void *v52;
  BOOL v53;
  NSMutableArray *metadataStabilizationArray;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  BOOL v61;
  NSMutableArray *frameTimestampArray;
  void *v63;
  NSMutableArray *originalFrameTimestampArray;
  void *v65;
  NSMutableArray *metadataItemTimestampArray;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  BOOL v71;
  NSMutableArray *adjusterArray;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  BOOL v78;
  NSMutableArray *interpolatedFrameArray;
  void *v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  void *v87;
  int v88;
  void *v90;
  id obj;
  uint64_t v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  uint64_t i;
  id v97;
  VCPVideoMetaLivePhotoMetaAnalyzer *v98;
  void *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  CMTime v104;
  CMTime v105[2];
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  CMTime time;
  _QWORD v111[5];
  _QWORD v112[5];
  const __CFString *v113;
  void *v114;
  _QWORD v115[3];
  _QWORD v116[3];
  const __CFString *v117;
  void *v118;
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v90 = v5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v12 = -50;
LABEL_81:
    v87 = v99;
    goto LABEL_82;
  }
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  objc_msgSend(v5, "items");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v120, 16);
  v98 = self;
  if (v6)
  {
    v94 = 0;
    v93 = *(_QWORD *)v107;
    v92 = *MEMORY[0x1E0D053A8];
    while (2)
    {
      v95 = v6;
      for (i = 0; i != v95; ++i)
      {
        if (*(_QWORD *)v107 != v93)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
        objc_msgSend(v7, "dataType");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", v92);

        if (v9)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "dataValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[VCPVideoMetaLivePhotoMetaAnalyzer convertLivePhotoBinary:toDictionary:](v98, "convertLivePhotoBinary:toDictionary:", v11, v10);

          if (v12)
            v13 = v12;
          else
            v13 = v94;
          if (v12)
          {

            goto LABEL_81;
          }
          v94 = v13;
          if (objc_msgSend(v10, "count"))
          {
            if (v7)
              objc_msgSend(v7, "time");
            else
              memset(&v105[1], 0, sizeof(CMTime));
            time = v105[1];
            v14 = CMTimeCopyAsDictionary(&time, 0);
            objc_msgSend(v99, "setObject:forKeyedSubscript:", v14, CFSTR("start"));

            if (v7)
              objc_msgSend(v7, "duration");
            else
              memset(v105, 0, 24);
            time = v105[0];
            v15 = CMTimeCopyAsDictionary(&time, 0);
            objc_msgSend(v99, "setObject:forKeyedSubscript:", v15, CFSTR("duration"));

            if (v7)
              objc_msgSend(v7, "time");
            else
              memset(&v104, 0, sizeof(v104));
            Seconds = CMTimeGetSeconds(&v104);
            v102 = 0u;
            v103 = 0u;
            v100 = 0u;
            v101 = 0u;
            objc_msgSend((id)objc_opt_class(), "defaultDesiredKeys");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v100, v119, 16);
            if (v18)
            {
              v19 = Seconds;
              v20 = *(_QWORD *)v101;
              v97 = v17;
              do
              {
                for (j = 0; j != v18; ++j)
                {
                  if (*(_QWORD *)v101 != v20)
                    objc_enumerationMutation(v97);
                  v22 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * j);
                  objc_msgSend(v10, "objectForKeyedSubscript:", v22);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v23)
                  {
                    objc_msgSend(v99, "setObject:forKeyedSubscript:", v23, v22);
                    if (objc_msgSend(v22, "isEqualToString:", CFSTR("privTZF")))
                    {
                      objc_msgSend(v99, "objectForKeyedSubscript:", v22);
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v24, "floatValue");
                      v26 = v25;
                      -[VCPVideoMetaLensSwitchAnalyzer minZoom](v98->_metaLensSwitchAnalzer, "minZoom");
                      v28 = v26 < v27;

                      if (v28)
                      {
                        objc_msgSend(v99, "objectForKeyedSubscript:", v22);
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v29, "floatValue");
                        -[VCPVideoMetaLensSwitchAnalyzer setMinZoom:](v98->_metaLensSwitchAnalzer, "setMinZoom:");

                      }
                      objc_msgSend(v99, "objectForKeyedSubscript:", v22);
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v30, "floatValue");
                      v32 = v31;
                      -[VCPVideoMetaLensSwitchAnalyzer maxZoom](v98->_metaLensSwitchAnalzer, "maxZoom");
                      v34 = v32 > v33;

                      if (v34)
                      {
                        objc_msgSend(v99, "objectForKeyedSubscript:", v22);
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v35, "floatValue");
                        -[VCPVideoMetaLensSwitchAnalyzer setMaxZoom:](v98->_metaLensSwitchAnalzer, "setMaxZoom:");

                      }
                    }
                    if (objc_msgSend(v22, "isEqualToString:", CFSTR("privTZF")))
                    {
                      -[VCPVideoMetaAnalyzer photoOffset](v98, "photoOffset");
                      if (v36 > v19)
                      {
                        -[VCPVideoMetaAnalyzer photoOffset](v98, "photoOffset");
                        if ((float)(v37 + -0.5) < v19)
                        {
                          objc_msgSend(v99, "objectForKeyedSubscript:", v22);
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v38, "floatValue");
                          v40 = v39;
                          -[VCPVideoMetaLensSwitchAnalyzer settlingMinZoom](v98->_metaLensSwitchAnalzer, "settlingMinZoom");
                          v42 = v40 < v41;

                          if (v42)
                          {
                            objc_msgSend(v99, "objectForKeyedSubscript:", v22);
                            v43 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v43, "floatValue");
                            -[VCPVideoMetaLensSwitchAnalyzer setSettlingMinZoom:](v98->_metaLensSwitchAnalzer, "setSettlingMinZoom:");

                          }
                          objc_msgSend(v99, "objectForKeyedSubscript:", v22);
                          v44 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v44, "floatValue");
                          v46 = v45;
                          -[VCPVideoMetaLensSwitchAnalyzer settlingMaxZoom](v98->_metaLensSwitchAnalzer, "settlingMaxZoom");
                          v48 = v46 > v47;

                          if (v48)
                          {
                            objc_msgSend(v99, "objectForKeyedSubscript:", v22);
                            v49 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v49, "floatValue");
                            -[VCPVideoMetaLensSwitchAnalyzer setSettlingMaxZoom:](v98->_metaLensSwitchAnalzer, "setSettlingMaxZoom:");

                          }
                        }
                      }
                    }
                  }

                }
                v17 = v97;
                v18 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v100, v119, 16);
              }
              while (v18);
            }

          }
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v106, v120, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v94 = 0;
  }

  objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("trajectoryHomography"));
  v50 = v98;
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("privEMBVct"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      v53 = (v98->_requestAnalyses & 0x4000010010000200) == 0;

      v50 = v98;
      if (v53)
        goto LABEL_55;
      metadataStabilizationArray = v98->_metadataStabilizationArray;
      v117 = CFSTR("attributes");
      v115[0] = CFSTR("MetaHomographyResults");
      objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("trajectoryHomography"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v116[0] = v51;
      v115[1] = CFSTR("MetaPresentationTimeResults");
      objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("start"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v116[1] = v55;
      v115[2] = CFSTR("MetaMotionBlurResults");
      objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("privEMBVct"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v116[2] = v56;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 3);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = v57;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](metadataStabilizationArray, "addObject:", v58);

    }
    v50 = v98;
  }
LABEL_55:
  objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("presentingTimestampInNanos"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v59)
    goto LABEL_60;
  objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("originalPresentingTimestampInNanos"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    v61 = (v50->_requestAnalyses & 0x200) == 0;

    v50 = v98;
    if (v61)
      goto LABEL_60;
    frameTimestampArray = v98->_frameTimestampArray;
    objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("presentingTimestampInNanos"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](frameTimestampArray, "addObject:", v63);

    originalFrameTimestampArray = v98->_originalFrameTimestampArray;
    objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("originalPresentingTimestampInNanos"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](originalFrameTimestampArray, "addObject:", v65);

    metadataItemTimestampArray = v98->_metadataItemTimestampArray;
    objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("start"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](metadataItemTimestampArray, "addObject:", v59);
  }

  v50 = v98;
LABEL_60:
  objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("sequenceAdjusterRecipe"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v67)
    goto LABEL_69;
  objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("sequenceAdjusterDisplacement"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("presentingTimestampInNanos"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (v69)
    {
      objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("originalPresentingTimestampInNanos"));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (v70)
      {
        v71 = (v50->_requestAnalyses & 0x4020000000) == 0;

        if (v71)
          goto LABEL_69;
        adjusterArray = v98->_adjusterArray;
        v113 = CFSTR("attributes");
        v111[0] = CFSTR("MetaAdjusterRecipeResults");
        objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("sequenceAdjusterRecipe"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v112[0] = v67;
        v111[1] = CFSTR("MetaAdjusterDisplacementKey");
        objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("sequenceAdjusterDisplacement"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v112[1] = v68;
        v111[2] = CFSTR("MetaItemPTSResultsKey");
        objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("start"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v112[2] = v69;
        v111[3] = CFSTR("MetaOriginalPTSInNanosResults");
        objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("originalPresentingTimestampInNanos"));
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v112[3] = v73;
        v111[4] = CFSTR("MetaPTSInNanosResults");
        objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("originalPresentingTimestampInNanos"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v112[4] = v74;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 5);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = v75;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](adjusterArray, "addObject:", v76);

      }
    }

  }
LABEL_69:
  objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("interpolatedFrame"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v77 == 0;

  if (!v78)
  {
    interpolatedFrameArray = v98->_interpolatedFrameArray;
    objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("interpolatedFrame"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](interpolatedFrameArray, "addObject:", v80);

  }
  -[VCPVideoMetaLensSwitchAnalyzer maxZoom](v98->_metaLensSwitchAnalzer, "maxZoom");
  v82 = v81;
  -[VCPVideoMetaLensSwitchAnalyzer minZoom](v98->_metaLensSwitchAnalzer, "minZoom");
  if ((float)(v82 - v83) > 0.5)
    -[VCPVideoMetaLensSwitchAnalyzer setHadZoom:](v98->_metaLensSwitchAnalzer, "setHadZoom:", 1);
  -[VCPVideoMetaLensSwitchAnalyzer settlingMaxZoom](v98->_metaLensSwitchAnalzer, "settlingMaxZoom");
  v85 = v84;
  -[VCPVideoMetaLensSwitchAnalyzer settlingMinZoom](v98->_metaLensSwitchAnalzer, "settlingMinZoom");
  if ((float)(v85 - v86) > 0.5)
    -[VCPVideoMetaLensSwitchAnalyzer setSettlingHadZoom:](v98->_metaLensSwitchAnalzer, "setSettlingHadZoom:", 1);
  if ((v98->_requestAnalyses & 0xC0) == 0)
  {
    v12 = v94;
    goto LABEL_81;
  }
  v87 = v99;
  v12 = -[VCPVideoMetaFocusAnalyzer processFrameMetadata:](v98->_metaFocusAnalyzer, "processFrameMetadata:", v99);
  if (!v12)
  {
    v88 = -[VCPVideoMetaMotionAnalyzer processFrameMetadata:](v98->_metaMotionAnalyzer, "processFrameMetadata:", v99);
    if (v88)
      v12 = v88;
    else
      v12 = v94;
  }
LABEL_82:

  return v12;
}

- (int)finalizeAnalysis
{
  int result;

  if ((self->_requestAnalyses & 0xC0) == 0)
    return 0;
  result = -[VCPVideoMetaFocusAnalyzer finalizeAnalysis](self->_metaFocusAnalyzer, "finalizeAnalysis");
  if (!result)
    return -[VCPVideoMetaMotionAnalyzer finalizeAnalysis](self->_metaMotionAnalyzer, "finalizeAnalysis");
  return result;
}

- (id)privateResults
{
  id v3;
  void *v4;
  unint64_t requestAnalyses;
  void *v6;
  void *v7;
  CGFloat width;
  double height;
  void *v11;
  void *v12;
  unint64_t v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[VCPVideoMetaLensSwitchAnalyzer results](self->_metaLensSwitchAnalzer, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("MetaLensSwitchResults"));

  requestAnalyses = self->_requestAnalyses;
  if ((requestAnalyses & 0xC0) != 0)
  {
    -[VCPVideoMetaFocusAnalyzer results](self->_metaFocusAnalyzer, "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("MetaFocusResults"));

    -[VCPVideoMetaMotionAnalyzer results](self->_metaMotionAnalyzer, "results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("MetaMotionResults"));

    requestAnalyses = self->_requestAnalyses;
  }
  if ((requestAnalyses & 0x4000010010000200) != 0
    && -[NSMutableArray count](self->_metadataStabilizationArray, "count"))
  {
    width = self->_gyroHomographyDimension.width;
    height = self->_gyroHomographyDimension.height;
    if (width != *MEMORY[0x1E0C9D820] || height != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      v16[0] = self->_metadataStabilizationArray;
      v15[0] = CFSTR("MetaStabilizationFrameResults");
      v15[1] = CFSTR("MetaHomographyDimensionResults");
      NSStringFromSize(*(NSSize *)&width);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("MetaStabilizationResults"));

    }
  }
  v13 = self->_requestAnalyses;
  if ((v13 & 0x200) != 0)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_frameTimestampArray, CFSTR("MetaPTSInNanosResults"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_originalFrameTimestampArray, CFSTR("MetaOriginalPTSInNanosResults"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_metadataItemTimestampArray, CFSTR("MetaItemPTSResultsKey"));
    v13 = self->_requestAnalyses;
  }
  if ((v13 & 0x4020000000) != 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_adjusterArray, CFSTR("MetaAdjusterResults"));
  if (-[NSMutableArray count](self->_interpolatedFrameArray, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_interpolatedFrameArray, CFSTR("MetaInterpolatedFrameKey"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaLensSwitchAnalzer, 0);
  objc_storeStrong((id *)&self->_interpolatedFrameArray, 0);
  objc_storeStrong((id *)&self->_adjusterArray, 0);
  objc_storeStrong((id *)&self->_metadataItemTimestampArray, 0);
  objc_storeStrong((id *)&self->_originalFrameTimestampArray, 0);
  objc_storeStrong((id *)&self->_frameTimestampArray, 0);
  objc_storeStrong((id *)&self->_metadataStabilizationArray, 0);
  objc_storeStrong((id *)&self->_metaMotionAnalyzer, 0);
  objc_storeStrong((id *)&self->_metaFocusAnalyzer, 0);
  objc_storeStrong((id *)&self->_deSerializedMetaBuffer, 0);
}

@end

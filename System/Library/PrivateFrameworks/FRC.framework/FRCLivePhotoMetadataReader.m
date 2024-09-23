@implementation FRCLivePhotoMetadataReader

- (FRCLivePhotoMetadataReader)init
{
  FRCLivePhotoMetadataReader *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FRCLivePhotoMetadataReader;
  result = -[FRCLivePhotoMetadataReader init](&v3, sel_init);
  result->_printMetadata = 1;
  return result;
}

- (unint64_t)preParseMetadata
{
  $95D729B680665BEAEFA1D6FCA8238556 *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  const __CFData *v9;
  unsigned __int16 *FigLivePhotoMetadataV3;
  unint64_t v11;
  uint64_t v12;
  CMTimeEpoch epoch;
  CMTime v15;
  CMTime time2;
  CMTime v17;
  CMTime v18;

  memset(&v18, 0, sizeof(v18));
  CMTimeMakeWithSeconds(&v18, 1.0, 600);
  self->_totalFrames = 0;
  v3 = ($95D729B680665BEAEFA1D6FCA8238556 *)MEMORY[0x1E0CA2E18];
  self->_numberOfInterpolatedFrames = 0;
  self->_burstDropTime = *v3;
  -[AVAssetReaderOutputMetadataAdaptor nextTimedMetadataGroup](self->_metadataOutputAdaptor, "nextTimedMetadataGroup");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = 0;
    while (1)
    {
      objc_msgSend(v5, "items");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        objc_msgSend(v8, "duration");
      else
        memset(&time2, 0, sizeof(time2));
      v15 = v18;
      CMTimeMinimum(&v17, &v15, &time2);
      v18 = v17;
      v17.value = 0;
      objc_msgSend(v8, "value", 0);
      v9 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      deserializeLivePhotoMetadata(v9, &v17, &v15);

      if (!v17.value)
        break;
      FigLivePhotoMetadataV3 = (unsigned __int16 *)getFigLivePhotoMetadataV3(v17.value);
      if (!FigLivePhotoMetadataV3)
        break;
      v11 = *FigLivePhotoMetadataV3;
      if ((v11 & 0x20) != 0)
        self->_numberOfInterpolatedFrames += *((unsigned __int8 *)FigLivePhotoMetadataV3 + 58);
      v6 += (v11 >> 3) & 1;
      free((void *)v17.value);
      ++self->_totalFrames;

      -[AVAssetReaderOutputMetadataAdaptor nextTimedMetadataGroup](self->_metadataOutputAdaptor, "nextTimedMetadataGroup");
      v12 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v12;
      if (!v12)
        goto LABEL_14;
    }

  }
  else
  {
    v6 = 0;
  }
LABEL_14:
  v15 = v18;
  CMTimeMultiplyByRatio(&v17, &v15, 19, 10);
  *(_OWORD *)&self->_droppingThreshold.value = *(_OWORD *)&v17.value;
  epoch = v17.epoch;
  self->_droppingThreshold.epoch = v17.epoch;
  *(_OWORD *)&v15.value = *(_OWORD *)&self->_droppingThreshold.value;
  v15.epoch = epoch;
  CMTimeConvertScale(&v17, &v15, v18.timescale, kCMTimeRoundingMethod_QuickTime);
  self->_droppingThreshold = ($95D729B680665BEAEFA1D6FCA8238556)v17;
  return v6;
}

- (void)parseStillImageMetadata:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  opaqueCMSampleBuffer *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  $95D729B680665BEAEFA1D6FCA8238556 *p_stillImageTime;
  FRCLivePhotoMetadataReader *v26;
  id obj;
  __int128 v28;
  int64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_stillImageTime = *($95D729B680665BEAEFA1D6FCA8238556 *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  *(_WORD *)&self->_stillImageTransformAvailble = 0;
  v23 = v4;
  objc_msgSend(v4, "tracksWithMediaType:", *MEMORY[0x1E0C8A7D0]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v5)
  {
    v6 = v5;
    p_stillImageTime = &self->_stillImageTime;
    v26 = self;
    v7 = *(_QWORD *)v31;
    v24 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v9, "formatDescriptions");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "containsObject:", CFSTR("mdta/com.apple.quicktime.still-image-time")))
          {
            v13 = v9;
            objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v13, 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)MEMORY[0x1E0C8AFD0];
            objc_msgSend(v13, "asset");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "assetReaderWithAsset:error:", v16, 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "addOutput:", v14);
            objc_msgSend(v17, "startReading");
            v18 = objc_msgSend(v14, "copyNextSampleBuffer");
            if (v18)
            {
              v19 = (opaqueCMSampleBuffer *)v18;
              v20 = 0;
              do
              {
                if (CMSampleBufferGetNumSamples(v19))
                {
                  v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C8B3B0]), "initWithSampleBuffer:", v19);

                  v20 = (void *)v21;
                }
                CFRelease(v19);
                v19 = (opaqueCMSampleBuffer *)objc_msgSend(v14, "copyNextSampleBuffer");
              }
              while (v19);
            }
            else
            {
              v20 = 0;
            }
            objc_msgSend(v17, "cancelReading");
            v22 = v20;

            if (v22)
            {
              objc_msgSend(v22, "timeRange");
            }
            else
            {
              v29 = 0;
              v28 = 0u;
            }
            self = v26;
            v7 = v24;
            *(_OWORD *)&p_stillImageTime->value = v28;
            p_stillImageTime->epoch = v29;

          }
          if (objc_msgSend(v12, "containsObject:", CFSTR("mdta/com.apple.quicktime.live-photo-still-image-transform")))self->_stillImageTransformAvailble = 1;
          if (objc_msgSend(v12, "containsObject:", CFSTR("mdta/com.apple.quicktime.live-photo-still-image-transform-reference-dimensions")))self->_stillImageTransformReferenceDimensionsAvailable = 1;

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v6);
  }

}

- (void)readLivePhotoMetadataFromAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSMutableArray *v18;
  NSMutableArray *metadataList;
  AVAssetReaderOutputMetadataAdaptor *v20;
  AVAssetReaderOutputMetadataAdaptor *metadataOutputAdaptor;
  unint64_t v22;
  AVAssetReaderOutputMetadataAdaptor *v23;
  AVAssetReaderOutputMetadataAdaptor *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int32_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  CMTime time2;
  CMTime v35;
  CMTime time1;

  v4 = a3;
  findIRAPs(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C8B220];
  objc_msgSend(v4, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadataItemsFromArray:filteredByIdentifier:", v7, CFSTR("mdta/com.apple.quicktime.software"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  v13 = (void *)MEMORY[0x1E0C8B220];
  objc_msgSend(v4, "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "metadataItemsFromArray:filteredByIdentifier:", v14, CFSTR("mdta/com.apple.quicktime.model"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_printMetadata)
  {
    printf("OS Version : %.1f\n", v12);
    objc_msgSend(v16, "value");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    printf("Model      : %s\n", (const char *)objc_msgSend(v17, "UTF8String"));

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    metadataList = self->_metadataList;
    self->_metadataList = v18;

  }
  -[FRCLivePhotoMetadataReader parseStillImageMetadata:](self, "parseStillImageMetadata:", v4);
  -[FRCLivePhotoMetadataReader createMetadataAdaptorForAsset:](self, "createMetadataAdaptorForAsset:", v4);
  v20 = (AVAssetReaderOutputMetadataAdaptor *)objc_claimAutoreleasedReturnValue();
  metadataOutputAdaptor = self->_metadataOutputAdaptor;
  self->_metadataOutputAdaptor = v20;

  if (self->_metadataOutputAdaptor)
  {
    v22 = -[FRCLivePhotoMetadataReader preParseMetadata](self, "preParseMetadata");
    -[FRCLivePhotoMetadataReader createMetadataAdaptorForAsset:](self, "createMetadataAdaptorForAsset:", v4);
    v23 = (AVAssetReaderOutputMetadataAdaptor *)objc_claimAutoreleasedReturnValue();
    v24 = self->_metadataOutputAdaptor;
    self->_metadataOutputAdaptor = v23;

    self->_frameIndex = 0;
    self->_recipe = 0;
    self->_numberOfDroppedFrames = 0;
    -[AVAssetReaderOutputMetadataAdaptor nextTimedMetadataGroup](self->_metadataOutputAdaptor, "nextTimedMetadataGroup");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      while (1)
      {
        if (!objc_msgSend(v5, "count"))
          goto LABEL_11;
        objc_msgSend(v26, "timeRange");
        time1 = v35;
        objc_msgSend(v5, "firstObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
          objc_msgSend(v27, "time");
        else
          memset(&time2, 0, sizeof(time2));
        v29 = CMTimeCompare(&time1, &time2);

        if (!v29)
        {
          objc_msgSend(v5, "removeObjectAtIndex:", 0);
          v30 = 1;
        }
        else
        {
LABEL_11:
          v30 = 0;
        }
        objc_msgSend(v26, "items");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!-[FRCLivePhotoMetadataReader processLivePhotoMetadataItem:isIDR:recipeAvailable:](self, "processLivePhotoMetadataItem:isIDR:recipeAvailable:", v32, v30, v22 != 0))break;
        ++self->_frameIndex;

        -[AVAssetReaderOutputMetadataAdaptor nextTimedMetadataGroup](self->_metadataOutputAdaptor, "nextTimedMetadataGroup");
        v33 = objc_claimAutoreleasedReturnValue();

        v26 = (void *)v33;
        if (!v33)
          goto LABEL_15;
      }

    }
    else
    {
LABEL_15:
      self->_numberOfMetadataFrames = self->_frameIndex;
    }
  }

}

- (BOOL)processLivePhotoMetadataItem:(id)a3 isIDR:(BOOL)a4 recipeAvailable:(BOOL)a5
{
  _BOOL8 v6;
  id v8;
  unint64_t numberOfInterpolatedFrames;
  const __CFData *v10;
  unsigned int *v11;
  uint64_t FigLivePhotoMetadataV3;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  int64_t v16;
  uint64_t v17;
  unint64_t frameIndex;
  void *v19;
  _QWORD v21[3];
  CMTime time1;
  CMTime time2;
  uint64_t v24;
  unsigned int *v25;

  v6 = a4;
  v8 = a3;
  v24 = 0;
  v25 = 0;
  numberOfInterpolatedFrames = self->_numberOfInterpolatedFrames;
  objc_msgSend(v8, "value");
  v10 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  deserializeLivePhotoMetadata(v10, &v25, &v24);

  v11 = v25;
  if (!v25)
    goto LABEL_10;
  self->_metadataVersion = *v25;
  FigLivePhotoMetadataV3 = getFigLivePhotoMetadataV3(v11);
  if (!FigLivePhotoMetadataV3)
  {
    free(v25);
    printf("No LivePhotoMetadataV3 in this movie. Metadata verison is %d\n", self->_metadataVersion);
LABEL_10:
    v15 = 0;
    goto LABEL_34;
  }
  v13 = FigLivePhotoMetadataV3;
  if ((*(_WORD *)FigLivePhotoMetadataV3 & 0x10) != 0)
  {
    v16 = *(char *)(FigLivePhotoMetadataV3 + 57);
    if (self->_recipe)
    {
      v17 = v16 - self->_previousDisplacement;
      if (v17 >= 2)
        self->_numberOfDroppedFrames = v17 + self->_numberOfDroppedFrames - 1;
    }
    else
    {
      self->_recipe = *(unsigned __int8 *)(FigLivePhotoMetadataV3 + 56);
    }
    self->_previousDisplacement = v16;
    if (!(_DWORD)v16 && (self->_burstDropTime.flags & 1) == 0)
    {
      if (v8)
        objc_msgSend(v8, "time");
      else
        memset(&time2, 0, sizeof(time2));
      v14 = 0;
      self->_burstDropTime = ($95D729B680665BEAEFA1D6FCA8238556)time2;
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (a5 || self->_frameIndex >= self->_totalFrames - 1)
  {
LABEL_27:
    v14 = 0;
    goto LABEL_28;
  }
  if ((*(_WORD *)FigLivePhotoMetadataV3 & 0x20) == 0 || !*(_BYTE *)(FigLivePhotoMetadataV3 + 58))
  {
    if (!numberOfInterpolatedFrames)
    {
      if (v8)
        objc_msgSend(v8, "duration");
      else
        memset(&time1, 0, sizeof(time1));
      time2 = (CMTime)self->_droppingThreshold;
      if (CMTimeCompare(&time1, &time2) == 1)
      {
        ++self->_numberOfDroppedFrames;
        v14 = 1;
        goto LABEL_28;
      }
    }
    goto LABEL_27;
  }
  v14 = 0;
  ++self->_numberOfDroppedFrames;
LABEL_28:
  if (self->_printMetadata)
  {
    frameIndex = self->_frameIndex;
    if (v8)
      objc_msgSend(v8, "time");
    else
      memset(v21, 0, sizeof(v21));
    -[FRCLivePhotoMetadataReader createMetadataEntryForV3Metadata:frameIndex:time:isIDR:noRecipeGap:](self, "createMetadataEntryForV3Metadata:frameIndex:time:isIDR:noRecipeGap:", v13, frameIndex, v21, v6, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](self->_metadataList, "addObject:", v19);

  }
  free(v25);
  v15 = 1;
LABEL_34:

  return v15;
}

- (id)createMetadataAdaptorForAsset:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "tracksWithMediaType:", *MEMORY[0x1E0C8A7D0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v5)
    goto LABEL_15;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v23;
  v9 = *MEMORY[0x1E0D053E0];
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v23 != v8)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      objc_msgSend(v11, "formatDescriptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "containsObject:", v9))
        {
          v15 = v11;

          v7 = v15;
        }

      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v6);
  if (v7)
  {
    v16 = objc_alloc(MEMORY[0x1E0C8AFD0]);
    objc_msgSend(v7, "asset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithAsset:error:", v17, 0);

    objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v7, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "canAddOutput:", v19))
    {
      objc_msgSend(v18, "addOutput:", v19);
      objc_msgSend(MEMORY[0x1E0C8AFF0], "assetReaderOutputMetadataAdaptorWithAssetReaderTrackOutput:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "startReading");
    }
    else
    {
      puts("Error: cannot add metadata output");
      v20 = 0;
    }

  }
  else
  {
LABEL_15:
    puts("Error : No LivePhoto metadata track");
    v20 = 0;
  }

  return v20;
}

- (id)createMetadataEntryForV3Metadata:(id *)a3 frameIndex:(unint64_t)a4 time:(id *)a5 isIDR:(BOOL)a6 noRecipeGap:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  unsigned __int16 var0;
  FRCLivePhotoMetadata *v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;

  v7 = a7;
  v8 = a6;
  var0 = a3->var0;
  v13 = objc_alloc_init(FRCLivePhotoMetadata);
  -[FRCLivePhotoMetadata setNoRecipeGap:](v13, "setNoRecipeGap:", v7);
  -[FRCLivePhotoMetadata setIsIDR:](v13, "setIsIDR:", v8);
  v15 = *a5;
  -[FRCLivePhotoMetadata setTime:](v13, "setTime:", &v15);
  -[FRCLivePhotoMetadata setFrameIndex:](v13, "setFrameIndex:", a4);
  if ((var0 & 0x20) == 0)
  {
    if ((var0 & 4) == 0)
      goto LABEL_3;
LABEL_7:
    -[FRCLivePhotoMetadata setPtsInNanos:](v13, "setPtsInNanos:", a3->var2);
    -[FRCLivePhotoMetadata setOriginalPTSInNanos:](v13, "setOriginalPTSInNanos:", a3->var3);
    if ((var0 & 8) == 0)
      return v13;
    goto LABEL_4;
  }
  -[FRCLivePhotoMetadata setInterpolated:](v13, "setInterpolated:", a3->var6 != 0);
  if ((var0 & 4) != 0)
    goto LABEL_7;
LABEL_3:
  if ((var0 & 8) != 0)
  {
LABEL_4:
    -[FRCLivePhotoMetadata setSequenceAdjusterRecipe:](v13, "setSequenceAdjusterRecipe:", a3->var4);
    -[FRCLivePhotoMetadata setSequenceAdjusterDisplacement:](v13, "setSequenceAdjusterDisplacement:", a3->var5);
  }
  return v13;
}

- (void)printMetadata:(id)a3 withVideoFrame:(id)a4
{
  id v6;
  id v7;
  double v8;
  int32_t v9;
  uint64_t v10;
  CMTime time2;
  CMTime time1;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CMTime v16;

  v6 = a3;
  v7 = a4;
  memset(&v16, 0, sizeof(v16));
  v8 = (double)(unint64_t)objc_msgSend(v6, "ptsInNanos") / 1000000000.0;
  if (v6)
  {
    objc_msgSend(v6, "time");
    v9 = v14;
  }
  else
  {
    v9 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
  }
  CMTimeMakeWithSeconds(&v16, v8, v9);
  if (!objc_msgSend(v6, "frameIndex"))
  {
    self->_initialOriginalPTS = objc_msgSend(v6, "ptsInNanos");
    self->_initialTime = ($95D729B680665BEAEFA1D6FCA8238556)v16;
  }
  if (self->_verbose)
  {
    if (v7)
    {
      objc_msgSend(v7, "presentationTimeStamp");
      printf("Video: %4lld");
    }
    else
    {
      printf("            ");
    }
  }
  if (v6)
  {
    if (self->_verbose)
    {
      if (v7)
        objc_msgSend(v7, "presentationTimeStamp");
      else
        memset(&time1, 0, sizeof(time1));
      objc_msgSend(v6, "time");
      if (CMTimeCompare(&time1, &time2))
      {
        printf(" != ");
        ++self->_ptsMismatches;
      }
      else
      {
        printf("    ");
      }
      objc_msgSend(v6, "time");
      printf("Metadata: %4lld ", v10);
      objc_msgSend(v6, "ptsInNanos");
      objc_msgSend(v6, "originalPTSInNanos");
      printf("\tPTSinNanos: %-15lld \tOriginalPTSinNanos: %-15lld ");
    }
    else
    {
      objc_msgSend(v6, "time");
      printf("Time %4lld:");
    }
    printf("\tinterpolated:%d", objc_msgSend(v6, "interpolated"));
    if (objc_msgSend(v6, "sequenceAdjusterRecipe"))
      printf("\trecipe:%ld  displacement:%ld", objc_msgSend(v6, "sequenceAdjusterRecipe"), objc_msgSend(v6, "sequenceAdjusterDisplacement"));
    if (objc_msgSend(v6, "noRecipeGap"))
      printf("\t*");
    if (objc_msgSend(v6, "isIDR"))
      printf("\tIDR");
  }
  putchar(10);

}

- (void)printMetadataListWithVideoTimingInfo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  NSMutableArray *metadataList;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void *v10;
  void *v11;
  NSMutableArray *v12;

  v12 = (NSMutableArray *)a3;
  if (-[NSMutableArray count](self->_metadataList, "count"))
  {
    v4 = -[NSMutableArray count](self->_metadataList, "count");
    v5 = -[NSMutableArray count](v12, "count");
    metadataList = v12;
    if (v4 > v5)
      metadataList = self->_metadataList;
    v7 = -[NSMutableArray count](metadataList, "count");
    if (v7 >= 1)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        printf("[%3ld] ", i);
        if (i >= -[NSMutableArray count](v12, "count"))
        {
          v10 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndex:](v12, "objectAtIndex:", i);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (i >= -[NSMutableArray count](self->_metadataList, "count"))
        {
          v11 = 0;
        }
        else
        {
          -[NSMutableArray objectAtIndex:](self->_metadataList, "objectAtIndex:", i);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[FRCLivePhotoMetadataReader printMetadata:withVideoFrame:](self, "printMetadata:withVideoFrame:", v11, v10);

      }
    }
  }

}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (BOOL)printMetadata
{
  return self->_printMetadata;
}

- (void)setPrintMetadata:(BOOL)a3
{
  self->_printMetadata = a3;
}

- (unint64_t)numberOfMetadataFrames
{
  return self->_numberOfMetadataFrames;
}

- (unint64_t)numberOfDroppedFrames
{
  return self->_numberOfDroppedFrames;
}

- (unint64_t)numberOfInterpolatedFrames
{
  return self->_numberOfInterpolatedFrames;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)burstDropTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 184);
  return self;
}

- (int64_t)ptsMismatches
{
  return self->_ptsMismatches;
}

- (BOOL)stillImageTransformAvailble
{
  return self->_stillImageTransformAvailble;
}

- (BOOL)stillImageTransformReferenceDimensionsAvailable
{
  return self->_stillImageTransformReferenceDimensionsAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataList, 0);
  objc_storeStrong((id *)&self->_metadataOutputAdaptor, 0);
}

@end

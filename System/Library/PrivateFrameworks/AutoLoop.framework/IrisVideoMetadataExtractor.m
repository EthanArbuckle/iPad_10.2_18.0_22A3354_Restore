@implementation IrisVideoMetadataExtractor

- (IrisVideoMetadataExtractor)init
{
  IrisVideoMetadataExtractor *v2;
  void *v3;
  uint64_t v4;
  NSMutableArray *desiredIrisKeysArray;
  objc_super v7;
  _QWORD v8[21];

  v8[20] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)IrisVideoMetadataExtractor;
  v2 = -[IrisVideoMetadataExtractor init](&v7, sel_init);
  v8[0] = CFSTR("privDFArray");
  v8[1] = CFSTR("privECMVct");
  v8[2] = CFSTR("privEMBVct");
  v8[3] = CFSTR("privDFArray");
  v8[4] = CFSTR("privET");
  v8[5] = CFSTR("privTZF");
  v8[6] = CFSTR("privImgG");
  v8[7] = CFSTR("privAFS");
  v8[8] = CFSTR("privAFSt");
  v8[9] = CFSTR("privFM");
  v8[10] = CFSTR("privRefHom");
  v8[11] = CFSTR("catBodies");
  v8[12] = CFSTR("dogBodies");
  v8[13] = CFSTR("humanBodies");
  v8[14] = CFSTR("salientObjects");
  v8[15] = CFSTR("originalPTSInNanos");
  v8[16] = CFSTR("ptsInNanos");
  v8[17] = CFSTR("IrisSequenceAdjusterRecipe");
  v8[18] = CFSTR("IrisSequenceAdjusterDisplacement");
  v8[19] = CFSTR("InterpolatedFrame");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mutableCopy");
  desiredIrisKeysArray = v2->desiredIrisKeysArray;
  v2->desiredIrisKeysArray = (NSMutableArray *)v4;

  v2->processedFile = 0;
  if (qword_1ED9A5838 != -1)
    dispatch_once(&qword_1ED9A5838, &unk_1E9863E30);

  return v2;
}

- (void)AddFrameDictionary:(id)a3 withCMTime:(id *)a4 toArray:(id)a5
{
  id v7;
  void *v8;
  CFDictionaryRef v9;
  void *v10;
  Float64 Seconds;
  void *v12;
  CMTime v13;

  v7 = a5;
  v8 = (void *)objc_msgSend(a3, "mutableCopy");
  v13 = *(CMTime *)a4;
  v9 = CMTimeCopyAsDictionary(&v13, 0);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("PresentationTime"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  v13 = *(CMTime *)a4;
  Seconds = CMTimeGetSeconds(&v13);
  *(float *)&Seconds = Seconds;
  objc_msgSend(v10, "numberWithFloat:", Seconds);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("PresentationTimeSeconds"));

  objc_msgSend(v7, "addObject:", v8);
}

- (int)AddInfoFromMetadata:(id)a3 withTimeStamp:(id *)a4 toArray:(id)a5
{
  id v8;
  id v9;
  void *v10;
  CFDictionaryRef v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CMTime time;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  time = *(CMTime *)a4;
  v11 = CMTimeCopyAsDictionary(&time, 0);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("PresentationTime"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = self->desiredIrisKeysArray;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", v17, (_QWORD)v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v14);
  }

  objc_msgSend(v9, "addObject:", v10);
  return 0;
}

- (int)processVideoTrack:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  const opaqueCMFormatDescription *v7;
  const opaqueCMFormatDescription *v8;
  CGSize PresentationDimensions;
  double width;
  double height;
  double v12;
  double v13;
  const __CFDictionary *Extension;
  const __CFDictionary *v15;
  const __CFNumber *Value;
  const __CFNumber *v17;
  BOOL v18;
  double v19;
  double v20;
  const __CFNumber *v21;
  void *v22;
  Float64 Seconds;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  NSMutableDictionary *videoTrackMetadataDict;
  CMTime v35;
  uint64_t valuePtr;
  __int128 v37;
  _OWORD v38[2];
  CMTime v39;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "timeRange");
  }
  else
  {
    memset(v38, 0, sizeof(v38));
    v37 = 0u;
  }
  v39 = *(CMTime *)((char *)v38 + 8);
  objc_msgSend(v4, "formatDescriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count")
    && (v7 = (const opaqueCMFormatDescription *)objc_msgSend(v6, "objectAtIndex:", 0)) != 0)
  {
    v8 = v7;
    PresentationDimensions = CMVideoFormatDescriptionGetPresentationDimensions(v7, 0, 0);
    width = PresentationDimensions.width;
    height = PresentationDimensions.height;
  }
  else
  {
    objc_msgSend(v4, "naturalSize");
    width = v12;
    height = v13;
    v8 = 0;
  }
  Extension = (const __CFDictionary *)CMFormatDescriptionGetExtension(v8, (CFStringRef)*MEMORY[0x1E0CA8D50]);
  if (Extension)
  {
    v15 = Extension;
    Value = (const __CFNumber *)CFDictionaryGetValue(Extension, (const void *)*MEMORY[0x1E0CA8D60]);
    v17 = (const __CFNumber *)CFDictionaryGetValue(v15, (const void *)*MEMORY[0x1E0CA8D40]);
    if (v17)
      v18 = Value == 0;
    else
      v18 = 1;
    v19 = height;
    v20 = width;
    if (!v18)
    {
      v21 = v17;
      v35.value = 0;
      valuePtr = 0;
      CFNumberGetValue(Value, kCFNumberNSIntegerType, &v35);
      CFNumberGetValue(v21, kCFNumberNSIntegerType, &valuePtr);
      v20 = (double)v35.value;
      v19 = (double)valuePtr;
    }
  }
  else
  {
    v19 = height;
    v20 = width;
  }
  v22 = (void *)MEMORY[0x1E0CB37E8];
  v35 = v39;
  Seconds = CMTimeGetSeconds(&v35);
  *(float *)&Seconds = Seconds;
  objc_msgSend(v22, "numberWithFloat:", Seconds);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v24, CFSTR("vidTrackTotalDur"));

  *(float *)&v25 = width;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v26, CFSTR("vidTrackNaturalW"));

  *(float *)&v27 = height;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v28, CFSTR("vidTrackNaturalH"));

  *(float *)&v29 = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v30, CFSTR("vidTrackCleanW"));

  *(float *)&v31 = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v32, CFSTR("vidTrackCleanH"));

  videoTrackMetadataDict = self->videoTrackMetadataDict;
  self->videoTrackMetadataDict = v5;

  return 0;
}

- (int)processStillFrameTimeForAsset:(id)a3 toDictionary:(id)a4
{
  id v5;
  id v6;
  id v7;
  CMTimeFlags flags;
  CMTimeEpoch v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const opaqueCMFormatDescription *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  opaqueCMSampleBuffer *v24;
  opaqueCMSampleBuffer *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFAllocator *v31;
  CFDictionaryRef v32;
  id v34;
  id v35;
  CMTimeEpoch epoch;
  CMTime v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CMTimeValue value;
  CMTimeScale timescale;
  CMTime time;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  value = *MEMORY[0x1E0CA2E18];
  flags = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 12);
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  v9 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(v7, "tracksWithMediaType:", *MEMORY[0x1E0C8A7D0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, &time, 16);
  if (!v11)
  {
    v20 = v10;
LABEL_25:

    goto LABEL_27;
  }
  v12 = v11;
  v35 = v7;
  epoch = v9;
  v34 = v6;
  v13 = *(_QWORD *)v40;
  v14 = *MEMORY[0x1E0CA4CC0];
LABEL_3:
  v15 = 0;
  while (1)
  {
    if (*(_QWORD *)v40 != v13)
      objc_enumerationMutation(v10);
    v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v15);
    objc_msgSend(v16, "formatDescriptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (const opaqueCMFormatDescription *)objc_msgSend(v17, "firstObject");

    if (!v18)
      goto LABEL_9;
    CMMetadataFormatDescriptionGetIdentifiers(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "containsObject:", v14) & 1) != 0)
      break;

LABEL_9:
    if (v12 == ++v15)
    {
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, &time, 16);
      if (v12)
        goto LABEL_3;
      v20 = v10;
      v6 = v34;
      v7 = v35;
      goto LABEL_23;
    }
  }
  v20 = v16;

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v7 = v35;
    objc_msgSend(MEMORY[0x1E0C8AFD0], "assetReaderWithAsset:error:", v35, &v38);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      objc_msgSend(v22, "addOutput:", v21);
      objc_msgSend(v23, "startReading");
      do
      {
        v24 = (opaqueCMSampleBuffer *)objc_msgSend(v21, "copyNextSampleBuffer");
        if (!v24)
          break;
        v25 = v24;
        if (CMSampleBufferGetNumSamples(v24))
        {
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B3B0]), "initWithSampleBuffer:", v25);
          v27 = (void *)MEMORY[0x1E0C8B220];
          objc_msgSend(v26, "items");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "metadataItemsFromArray:filteredByIdentifier:", v28, v14);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "firstObject");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            CMSampleBufferGetOutputPresentationTimeStamp(&v37, v25);
            value = v37.value;
            flags = v37.flags;
            timescale = v37.timescale;
            epoch = v37.epoch;
          }

        }
        CFRelease(v25);
      }
      while ((flags & 1) == 0);
      objc_msgSend(v23, "cancelReading");
      v7 = v35;
    }

    v6 = v34;
LABEL_23:
    v9 = epoch;
    goto LABEL_25;
  }
  v6 = v34;
  v7 = v35;
  v9 = epoch;
LABEL_27:

  if ((flags & 1) != 0)
  {
    v31 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    time.value = value;
    time.timescale = timescale;
    time.flags = flags;
    time.epoch = v9;
    v32 = CMTimeCopyAsDictionary(&time, v31);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v32, CFSTR("vidTrackStillFrameTime"));

  }
  return 0;
}

- (int)processFile
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  AVAsset *inMovieAsset;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int Code;
  NSDictionary *v12;
  NSDictionary *allMetadata;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const opaqueCMFormatDescription *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  const __CFData *v40;
  CFPropertyListRef v41;
  void *v42;
  int v43;
  void *v44;
  int v45;
  const __CFData *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *context;
  const __CFAllocator *allocator;
  void *v59;
  void *v60;
  id obj;
  uint64_t v62;
  uint64_t v63;
  IrisVideoMetadataExtractor *v64;
  __int128 v65;
  uint64_t v66;
  const void *v67;
  __int128 v68;
  uint64_t v69;
  CFErrorRef error;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v3 = qword_1ED9A5858;
  v4 = qword_1ED9A5850;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (self->saveAllMetadata)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
    v60 = 0;
  }
  inMovieAsset = self->inMovieAsset;
  if (!inMovieAsset)
  {
    Code = -6000;
    goto LABEL_14;
  }
  -[AVAsset tracksWithMediaType:](inMovieAsset, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    NSLog(CFSTR("asset has no video tracks"));
    v9 = 0;
    Code = -6100;
    goto LABEL_13;
  }
  if (!objc_msgSend(v7, "count"))
  {
    v9 = 0;
    Code = -6101;
    goto LABEL_13;
  }
  objc_msgSend(v8, "objectAtIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[IrisVideoMetadataExtractor processVideoTrack:](self, "processVideoTrack:", v9);
  if (!v10)
  {
    v10 = -[IrisVideoMetadataExtractor processStillFrameTimeForAsset:toDictionary:](self, "processStillFrameTimeForAsset:toDictionary:", self->inMovieAsset, self->videoTrackMetadataDict);
    if (!v10)
    {
      v54 = v8;
      v55 = v9;
      v59 = v5;
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v64 = self;
      v62 = *MEMORY[0x1E0C8A7D0];
      -[AVAsset tracksWithMediaType:](self->inMovieAsset, "tracksWithMediaType:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
      if (!v16)
        goto LABEL_31;
      v17 = v16;
      v18 = *(_QWORD *)v76;
LABEL_23:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v76 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v19);
        objc_msgSend(v20, "formatDescriptions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (const opaqueCMFormatDescription *)objc_msgSend(v21, "firstObject");

        if (!v22)
          goto LABEL_29;
        CMMetadataFormatDescriptionGetIdentifiers(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v23, "containsObject:", qword_1ED9A5858) & 1) != 0)
          break;

LABEL_29:
        if (v17 == ++v19)
        {
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
          if (!v17)
          {
LABEL_31:

            goto LABEL_61;
          }
          goto LABEL_23;
        }
      }
      v24 = v20;

      if (!v24)
      {
LABEL_61:
        NSLog(CFSTR("asset has no 'live-photo-info' metadata track"));
        self = v64;
        -[AVAsset tracksWithMediaType:](v64->inMovieAsset, "tracksWithMediaType:", v62);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "count");

        if (v49)
          Code = 0;
        else
          Code = -6001;
        v5 = v59;
        v8 = v54;
        v9 = v55;
        goto LABEL_13;
      }
      self = v64;
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFD0]), "initWithAsset:error:", v64->inMovieAsset, 0);
      objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v24, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAlwaysCopiesSampleData:", 0);
      v5 = v59;
      v9 = v55;
      if ((objc_msgSend(v25, "canAddOutput:", v26) & 1) != 0)
      {
        objc_msgSend(v25, "addOutput:", v26);
        objc_msgSend(MEMORY[0x1E0C8AFF0], "assetReaderOutputMetadataAdaptorWithAssetReaderTrackOutput:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "startReading"))
        {
          v50 = v26;
          v51 = v25;
          v52 = v24;
          v28 = (void *)MEMORY[0x1D82662EC]();
          objc_msgSend(v27, "nextTimedMetadataGroup");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          Code = 0;
          if (!v29)
            goto LABEL_60;
          v63 = *MEMORY[0x1E0CA2440];
          allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          v53 = v27;
          while (1)
          {
            v56 = v29;
            context = v28;
            v73 = 0u;
            v74 = 0u;
            v71 = 0u;
            v72 = 0u;
            objc_msgSend(v29, "items");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
            if (!v31)
              goto LABEL_59;
            v32 = v31;
            v33 = *(_QWORD *)v72;
            do
            {
              for (i = 0; i != v32; ++i)
              {
                if (*(_QWORD *)v72 != v33)
                  objc_enumerationMutation(v30);
                v35 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
                v69 = 0;
                error = 0;
                v68 = 0uLL;
                if (v35)
                  objc_msgSend(v35, "time");
                objc_msgSend(v35, "identifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(v36, "isEqualToString:", v3);

                if (v37)
                {
                  v67 = 0;
                  objc_msgSend(v35, "dataType");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = objc_msgSend(v38, "isEqualToString:", v4);

                  if (v39)
                  {
                    objc_msgSend(v35, "value");
                    v40 = (const __CFData *)objc_claimAutoreleasedReturnValue();
                    Code = sub_1D4C6ED04(v40, &v67);

                    v41 = v67;
                    if (v67)
                    {
                      if (v60)
                      {
                        v65 = v68;
                        v66 = v69;
                        -[IrisVideoMetadataExtractor AddFrameDictionary:withCMTime:toArray:](v64, "AddFrameDictionary:withCMTime:toArray:", v67, &v65);
                      }
                      v65 = v68;
                      v66 = v69;
                      -[IrisVideoMetadataExtractor AddInfoFromMetadata:withTimeStamp:toArray:](v64, "AddInfoFromMetadata:withTimeStamp:toArray:", v41, &v65, obj);
                      goto LABEL_54;
                    }
                  }
                }
                else
                {
                  objc_msgSend(v35, "identifier");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("mdta/com.apple.quicktime.camera-debug-info"));

                  if (v43)
                  {
                    objc_msgSend(v35, "dataType");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v45 = objc_msgSend(v44, "isEqualToString:", v63);

                    if (v45)
                    {
                      if (v59)
                      {
                        objc_msgSend(v35, "value");
                        v46 = (const __CFData *)objc_claimAutoreleasedReturnValue();
                        v41 = CFPropertyListCreateWithData(allocator, v46, 0, 0, &error);

                        v65 = v68;
                        v66 = v69;
                        -[IrisVideoMetadataExtractor AddFrameDictionary:withCMTime:toArray:](v64, "AddFrameDictionary:withCMTime:toArray:", v41, &v65, v59);
LABEL_54:
                        CFRelease(v41);
                      }
                    }
                  }
                }
                if (error)
                {
                  Code = CFErrorGetCode(error);
                  CFRelease(error);
                }
              }
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
            }
            while (v32);
LABEL_59:

            objc_autoreleasePoolPop(context);
            v28 = (void *)MEMORY[0x1D82662EC]();
            v27 = v53;
            objc_msgSend(v53, "nextTimedMetadataGroup");
            v47 = objc_claimAutoreleasedReturnValue();

            v29 = (void *)v47;
            if (!v47)
            {
LABEL_60:
              objc_autoreleasePoolPop(v28);
              v25 = v51;
              objc_msgSend(v51, "cancelReading");
              self = v64;
              v5 = v59;
              v9 = v55;
              v24 = v52;
              v26 = v50;
              goto LABEL_67;
            }
          }
        }
        NSLog(CFSTR("AVAssetReader failed to start"));
        Code = -6003;
LABEL_67:

      }
      else
      {
        NSLog(CFSTR("AVAssetReader could not add metadata output"));
        Code = -6002;
      }
      v8 = v54;

      goto LABEL_13;
    }
  }
  Code = v10;
LABEL_13:

LABEL_14:
  objc_storeStrong((id *)&self->_framesMetadataArray, obj);
  if (self->saveAllMetadata)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", self->videoTrackMetadataDict, CFSTR("VideoTrackMetadata"));
    -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v60, CFSTR("PerFrameMetadataPrivate"));
    if (objc_msgSend(v5, "count"))
      -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v5, CFSTR("PerFrameMetadataDebug"));
    allMetadata = self->allMetadata;
    self->allMetadata = v12;

  }
  if (!Code)
    self->processedFile = 1;

  return Code;
}

- (NSMutableDictionary)videoTrackMetadataDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (AVAsset)inMovieAsset
{
  return (AVAsset *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInMovieAsset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)desiredIrisKeysArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDesiredIrisKeysArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)saveAllMetadata
{
  return self->saveAllMetadata;
}

- (void)setSaveAllMetadata:(BOOL)a3
{
  self->saveAllMetadata = a3;
}

- (NSDictionary)allMetadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)processedFile
{
  return self->processedFile;
}

- (void)setProcessedFile:(BOOL)a3
{
  self->processedFile = a3;
}

- (NSArray)framesMetadataArray
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->allMetadata, 0);
  objc_storeStrong((id *)&self->desiredIrisKeysArray, 0);
  objc_storeStrong((id *)&self->inMovieAsset, 0);
  objc_storeStrong((id *)&self->videoTrackMetadataDict, 0);
  objc_storeStrong((id *)&self->_framesMetadataArray, 0);
}

@end

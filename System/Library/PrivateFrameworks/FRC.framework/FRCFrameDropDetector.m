@implementation FRCFrameDropDetector

- (FRCFrameDropDetector)init
{
  FRCFrameDropDetector *v2;
  FRCFrameDropDetector *v3;
  __int128 v4;
  os_log_t v5;
  OS_os_log *logger;
  CMTime v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FRCFrameDropDetector;
  v2 = -[FRCFrameDropDetector init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FRCFrameDropDetector setDebugPrint:](v2, "setDebugPrint:", 0);
    *(_WORD *)&v3->_gatingEnabled = 257;
    -[FRCFrameDropDetector setPropertiesFromDefaults](v3, "setPropertiesFromDefaults");
    CMTimeMake(&v8, 600, 600);
    v4 = *(_OWORD *)&v8.value;
    v3->minDuration.epoch = v8.epoch;
    *(_OWORD *)&v3->minDuration.value = v4;
    v5 = os_log_create("com.apple.FRC", "FrameDropDetector");
    logger = v3->_logger;
    v3->_logger = (OS_os_log *)v5;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FRCFrameDropDetector;
  -[FRCFrameDropDetector dealloc](&v2, sel_dealloc);
}

- (void)setPropertiesFromDefaults
{
  int AppBooleanValue;
  int v4;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 1;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("FrameDropDetectorDebug"), CFSTR("com.apple.FRC"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    -[FRCFrameDropDetector setDebugPrint:](self, "setDebugPrint:", AppBooleanValue != 0);
  v4 = CFPreferencesGetAppBooleanValue(CFSTR("SingleDropRecovery"), CFSTR("com.apple.FRC"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    self->_singleDropRecoveryEnabled = v4 != 0;
}

- (void)debugPrintFRCFrameMetadataInfo:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id obj;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  puts("[Frame] Curated Time, Original Time, Recipe, Displacement");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(obj);
        printf("[%3ld] %ld, %ld, %ld, %3ld\n", v6 + i, objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "ptsInNanos"), objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "originalPTSInNanos"), objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "sequenceAdjusterRecipe"), objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "sequenceAdjusterDisplacement"));
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 += i;
    }
    while (v5);
  }

}

- (void)debugPrintFRCFrameTimingInfo:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (v9)
          objc_msgSend(v9, "presentationTimeStamp");
        NSLog(CFSTR("[%3ld]\tPTS = %.4f (%4lld / %d)\n"), v6 + i, (float)((float)0 / (float)0), 0, 0);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 += i;
    }
    while (v5);
  }

}

- (void)debugPrintFRCFrameInternalTimingInfo:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (v9)
        {
          objc_msgSend(v9, "presentationTimeStamp");
          objc_msgSend(v9, "frameDuration");
          objc_msgSend(v9, "interpolatedFrameDuration");
        }
        NSLog(CFSTR("[%3ld]\tPTS = %.4f (%4lld/%d) Dur = (%4lld/%d) Interpolated_Dur = (%4lld/%d) Dup = %ld AtBigGap = %ld\n"), v6 + i, (float)((float)0 / (float)0), 0, 0, 0, 0, 0, 0, objc_msgSend(v9, "framesToBeDuplicated"), objc_msgSend(v9, "frameIsAtBigGap"));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 += i;
    }
    while (v5);
  }

}

- (void)debugPrintFRCFRCFrameBurstyDropInfo:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "burstyIdx");
        v11 = objc_msgSend(v9, "burstyStart");
        v12 = objc_msgSend(v9, "burstyLen");
        if (v9)
          objc_msgSend(v9, "burstyBaseDuration");
        NSLog(CFSTR("[%3ld]\tBursty Drop Info Idx = %ld Start = %ld Len = %ld BaseDur = (%4lld/%d)\n"), v6 + i, v10, v11, v12, 0, 0);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v6 += i;
    }
    while (v5);
  }

}

- (id)sortFrameMetadataListInDisplayOrderFromMetadataList:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *sortedMetadataList;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;

  v4 = a3;
  v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
  sortedMetadataList = self->sortedMetadataList;
  self->sortedMetadataList = v5;

  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v8 = self->sortedMetadataList;
  self->sortedMetadataList = v7;

  if (self->_debugPrint)
  {
    NSLog(CFSTR("FRAME_DROP_DETECTION: input metadata list...\n"));
    -[FRCFrameDropDetector debugPrintFRCFrameMetadataInfo:](self, "debugPrintFRCFrameMetadataInfo:", v4);
    NSLog(CFSTR("FRAME_DROP_DETECTION: sorted metadata list...\n"));
    -[FRCFrameDropDetector debugPrintFRCFrameMetadataInfo:](self, "debugPrintFRCFrameMetadataInfo:", self->sortedMetadataList);
  }
  v9 = self->sortedMetadataList;

  return v9;
}

uint64_t __76__FRCFrameDropDetector_sortFrameMetadataListInDisplayOrderFromMetadataList___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "ptsInNanos");
  v6 = objc_msgSend(v4, "ptsInNanos");

  if (v5 > v6)
    return 1;
  else
    return -1;
}

- (id)calculateFrameDropInfoFromSortedMetadataList:(id)a3 sortedTimingList:(id)a4
{
  id v6;
  NSMutableArray *v7;
  NSMutableArray *frameInternalPTSList;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL8 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  FRCFrameInternalTimingInfo *v33;
  NSMutableArray *v34;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  CMTime v42;
  CMTime v43;
  CMTime v44;
  CMTime v45;
  CMTime v46;
  CMTime v47;
  CMTime time;
  CMTime v49;
  CMTime v50;
  CMTime v51;
  CMTime rhs;
  CMTime lhs;
  CMTime v54;
  CMTime v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  CMTime v60;
  CMTime v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v6 = a4;
  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  frameInternalPTSList = self->frameInternalPTSList;
  self->frameInternalPTSList = v7;

  memset(&v61, 0, sizeof(v61));
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "presentationTimeStamp");
  else
    memset(&v61, 0, sizeof(v61));

  memset(&v60, 0, sizeof(v60));
  CMTimeMake(&v60, 0, v61.timescale);
  v11 = objc_msgSend(v6, "count");
  v40 = objc_msgSend(v36, "count");
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v12 = v6;
  v13 = v36;
  v14 = v12;
  v41 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v41)
  {
    v15 = 0;
    v38 = v11 - 1;
    v39 = *(_QWORD *)v57;
    do
    {
      v16 = 0;
      v37 = v15;
      do
      {
        if (*(_QWORD *)v57 != v39)
          objc_enumerationMutation(v14);
        v17 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v16);
        if (v17)
          objc_msgSend(v17, "presentationTimeStamp");
        else
          memset(&v55, 0, sizeof(v55));
        v18 = v15 + v16;
        v61 = v55;
        if (v15 + v16 >= v40)
        {
          v20 = 0;
          v21 = 0;
        }
        else
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", v15 + v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "sequenceAdjusterRecipe");
          v21 = objc_msgSend(v19, "sequenceAdjusterDisplacement");

        }
        if (v18 >= v38)
        {
          v29 = 0;
          v30 = 0;
        }
        else
        {
          v22 = v15 + v16 + 1;
          v23 = v14;
          objc_msgSend(v14, "objectAtIndexedSubscript:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          memset(&v55, 0, sizeof(v55));
          if (v24)
            objc_msgSend(v24, "presentationTimeStamp");
          lhs = v55;
          rhs = v61;
          CMTimeSubtract(&v54, &lhs, &rhs);
          v60 = v54;
          if (v18 >= v40 - 1)
          {
            v29 = 0;
            v30 = 0;
          }
          else
          {
            objc_msgSend(v13, "objectAtIndexedSubscript:", v22);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "sequenceAdjusterRecipe");
            v28 = objc_msgSend(v26, "sequenceAdjusterDisplacement");
            v29 = 0;
            v30 = 0;
            if (v20 && v27)
            {
              v31 = v28 - v21;
              v32 = 3;
              if (v21)
                v32 = 0;
              v29 = v31 < 2 && v21 == 0;
              if (v31 >= 2)
                v30 = v28 - v21 - 1;
              else
                v30 = v32;
              self->_retimingRecipe = v20;
            }

            v13 = v36;
          }

          v14 = v23;
          v15 = v37;
        }
        v33 = objc_alloc_init(FRCFrameInternalTimingInfo);
        v51 = v61;
        -[FRCFrameInternalTimingInfo setPresentationTimeStamp:](v33, "setPresentationTimeStamp:", &v51);
        v50 = v60;
        -[FRCFrameInternalTimingInfo setFrameDuration:](v33, "setFrameDuration:", &v50);
        -[FRCFrameInternalTimingInfo setFramesToBeDuplicated:](v33, "setFramesToBeDuplicated:", v30);
        -[FRCFrameInternalTimingInfo setFrameIsAtBigGap:](v33, "setFrameIsAtBigGap:", v29);
        if (v30 < 1)
        {
          v42 = v60;
          -[FRCFrameInternalTimingInfo setInterpolatedFrameDuration:](v33, "setInterpolatedFrameDuration:", &v42);
        }
        else
        {
          CMTimeMake(&v47, 1, v60.timescale);
          v55 = v60;
          CMTimeAdd(&time, &v55, &v47);
          CMTimeMultiplyByRatio(&v49, &time, 1, 2);
          v46 = v49;
          -[FRCFrameInternalTimingInfo setInterpolatedFrameDuration:](v33, "setInterpolatedFrameDuration:", &v46);
          if (v33)
            -[FRCFrameInternalTimingInfo interpolatedFrameDuration](v33, "interpolatedFrameDuration");
          else
            memset(&v44, 0, sizeof(v44));
          CMTimeConvertScale(&v45, &v44, v60.timescale, kCMTimeRoundingMethod_QuickTime);
          v43 = v45;
          -[FRCFrameInternalTimingInfo setInterpolatedFrameDuration:](v33, "setInterpolatedFrameDuration:", &v43);
          ++self->_numberOfInsertionPoints;
        }
        -[NSMutableArray addObject:](self->frameInternalPTSList, "addObject:", v33);

        ++v16;
      }
      while (v41 != v16);
      v15 += v16;
      v41 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v41);
  }

  if (self->_debugPrint)
  {
    NSLog(CFSTR("FRAME_DROP_DETECTION: frame duration...\n"));
    -[FRCFrameDropDetector debugPrintFRCFrameInternalTimingInfo:](self, "debugPrintFRCFrameInternalTimingInfo:", self->frameInternalPTSList);
  }
  v34 = self->frameInternalPTSList;

  return v34;
}

- (id)sortFrameTimingListInDisplayOrderFromTimingList:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *sortedTimingList;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;

  v4 = a3;
  v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
  sortedTimingList = self->sortedTimingList;
  self->sortedTimingList = v5;

  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_77);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v8 = self->sortedTimingList;
  self->sortedTimingList = v7;

  if (self->_debugPrint)
  {
    NSLog(CFSTR("FRAME_DROP_DETECTION: input timing list...\n"));
    -[FRCFrameDropDetector debugPrintFRCFrameTimingInfo:](self, "debugPrintFRCFrameTimingInfo:", v4);
    NSLog(CFSTR("FRAME_DROP_DETECTION: sorted timing list...\n"));
    -[FRCFrameDropDetector debugPrintFRCFrameTimingInfo:](self, "debugPrintFRCFrameTimingInfo:", self->sortedTimingList);
  }
  v9 = self->sortedTimingList;

  return v9;
}

uint64_t __72__FRCFrameDropDetector_sortFrameTimingListInDisplayOrderFromTimingList___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v4, "presentationTimeStamp");
    v7 = v12;
    if (v6)
    {
LABEL_3:
      objc_msgSend(v6, "presentationTimeStamp");
      v8 = v11;
      goto LABEL_6;
    }
  }
  else
  {
    v7 = 0;
    if (v5)
      goto LABEL_3;
  }
  v8 = 0;
LABEL_6:
  if (v7 > v8)
    v9 = 1;
  else
    v9 = -1;

  return v9;
}

- (id)calculateFrameDurationFromSortedTimingList:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *frameInternalPTSList;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  $95D729B680665BEAEFA1D6FCA8238556 *p_minDuration;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  FRCFrameInternalTimingInfo *v21;
  NSMutableArray *v22;
  CMTime v24;
  CMTime v25;
  CMTime v26;
  CMTime rhs;
  CMTime lhs;
  CMTime time1;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CMTime v34;
  CMTime v35;
  CMTime v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  frameInternalPTSList = self->frameInternalPTSList;
  self->frameInternalPTSList = v5;

  memset(&v36, 0, sizeof(v36));
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "presentationTimeStamp");
  else
    memset(&v36, 0, sizeof(v36));

  memset(&v35, 0, sizeof(v35));
  CMTimeMake(&v35, 0, v36.timescale);
  CMTimeMake(&v34, v36.timescale, v36.timescale);
  self->minDuration = ($95D729B680665BEAEFA1D6FCA8238556)v34;
  v9 = objc_msgSend(v4, "count");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    p_minDuration = &self->minDuration;
    v15 = *(_QWORD *)v31;
    v16 = v9 - 1;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v10);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (v18)
          objc_msgSend(v18, "presentationTimeStamp");
        else
          memset(&v34, 0, sizeof(v34));
        v36 = v34;
        if (v13 + i < v16)
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v13 + i + 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          memset(&v34, 0, sizeof(v34));
          if (v19)
            objc_msgSend(v19, "presentationTimeStamp");
          lhs = v34;
          rhs = v36;
          CMTimeSubtract(&time1, &lhs, &rhs);
          v35 = time1;
          *(_OWORD *)&lhs.value = *(_OWORD *)&p_minDuration->value;
          lhs.epoch = self->minDuration.epoch;
          if (CMTimeCompare(&time1, &lhs) == -1)
          {
            *(_OWORD *)&p_minDuration->value = *(_OWORD *)&v35.value;
            self->minDuration.epoch = v35.epoch;
          }

        }
        v21 = objc_alloc_init(FRCFrameInternalTimingInfo);
        v26 = v36;
        -[FRCFrameInternalTimingInfo setPresentationTimeStamp:](v21, "setPresentationTimeStamp:", &v26);
        v25 = v35;
        -[FRCFrameInternalTimingInfo setFrameDuration:](v21, "setFrameDuration:", &v25);
        v24 = v35;
        -[FRCFrameInternalTimingInfo setInterpolatedFrameDuration:](v21, "setInterpolatedFrameDuration:", &v24);
        -[NSMutableArray addObject:](self->frameInternalPTSList, "addObject:", v21);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      v13 += i;
    }
    while (v12);
  }

  if (self->_debugPrint)
  {
    NSLog(CFSTR("FRAME_DROP_DETECTION: frame duration...\n"));
    -[FRCFrameDropDetector debugPrintFRCFrameInternalTimingInfo:](self, "debugPrintFRCFrameInternalTimingInfo:", self->frameInternalPTSList);
  }
  v22 = self->frameInternalPTSList;

  return v22;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)droppingThreshold
{
  int32_t timescale;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime v7;
  CMTime time;

  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  time = (CMTime)self->minDuration;
  CMTimeMultiplyByRatio((CMTime *)retstr, &time, 19, 10);
  timescale = self->minDuration.timescale;
  v7 = *(CMTime *)retstr;
  CMTimeConvertScale(&time, &v7, timescale, kCMTimeRoundingMethod_QuickTime);
  *(CMTime *)retstr = time;
  NSLog(CFSTR("[FRAME_DROP_DETECTION] min frame duration: (%4lld/%d) dropping threshold:(%4lld/%d)\n"), self->minDuration.value, self->minDuration.timescale, retstr->var0, retstr->var1);
  return result;
}

- (id)detectFrameDropsFromInternalTimingList:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *frameBurstyDropInfoList;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t i;
  void *v15;
  int32_t v16;
  FRCFrameBurstyDropInfo *v17;
  int32_t v18;
  NSMutableArray *v19;
  uint64_t v21;
  uint64_t v22;
  id obj;
  CMTime v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CMTime v28;
  CMTime v29;
  CMTime v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  CMTime v37;
  CMTime v38;
  CMTime time2;
  CMTime time1;
  CMTime v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  CMTime v46;
  CMTime v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  frameBurstyDropInfoList = self->frameBurstyDropInfoList;
  self->frameBurstyDropInfoList = v5;

  memset(&v47, 0, sizeof(v47));
  CMTimeMake(&v47, 0, self->minDuration.timescale);
  memset(&v46, 0, sizeof(v46));
  -[FRCFrameDropDetector droppingThreshold](self, "droppingThreshold");
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (!v7)
  {
    v11 = 0;
    goto LABEL_25;
  }
  v8 = v7;
  v9 = 0;
  v21 = 0;
  v22 = 0;
  v10 = 0;
  v11 = 0;
  v12 = *(_QWORD *)v43;
  v13 = 1;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v43 != v12)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      memset(&v41, 0, sizeof(v41));
      if (v15)
        objc_msgSend(v15, "frameDuration");
      time1 = v41;
      time2 = v46;
      if (CMTimeCompare(&time1, &time2) != -1)
      {
        if (v10)
        {
          if (v15)
            goto LABEL_11;
LABEL_16:
          v16 = 0;
          memset(&lhs, 0, sizeof(lhs));
          v32 = 0;
          v33 = 0;
          v31 = 0;
        }
        else
        {
          v22 = v21 + i;
          ++v11;
          v47 = v41;
          if (!v15)
            goto LABEL_16;
LABEL_11:
          objc_msgSend(v15, "frameDuration");
          objc_msgSend(v15, "frameDuration");
          v16 = v32;
        }
        CMTimeMake(&rhs, 1, v16);
        CMTimeAdd(&time, &lhs, &rhs);
        CMTimeMultiplyByRatio(&v37, &time, 1, 2);
        v30 = v37;
        objc_msgSend(v15, "setInterpolatedFrameDuration:", &v30);
        if (v15)
        {
          objc_msgSend(v15, "interpolatedFrameDuration");
          objc_msgSend(v15, "frameDuration");
          v18 = v26;
        }
        else
        {
          v18 = 0;
          memset(&v28, 0, sizeof(v28));
          v26 = 0;
          v27 = 0;
          v25 = 0;
        }
        ++v9;
        CMTimeConvertScale(&v29, &v28, v18, kCMTimeRoundingMethod_QuickTime);
        v24 = v29;
        objc_msgSend(v15, "setInterpolatedFrameDuration:", &v24);
        ++self->_numberOfInsertionPoints;
        v10 = 1;
        goto LABEL_21;
      }
      if (!(v13 & 1 | (v10 == 0)))
      {
        v17 = objc_alloc_init(FRCFrameBurstyDropInfo);
        -[FRCFrameBurstyDropInfo setBurstyIdx:](v17, "setBurstyIdx:", v11);
        -[FRCFrameBurstyDropInfo setBurstyStart:](v17, "setBurstyStart:", v22);
        -[FRCFrameBurstyDropInfo setBurstyLen:](v17, "setBurstyLen:", v9);
        v38 = v47;
        -[FRCFrameBurstyDropInfo setBurstyBaseDuration:](v17, "setBurstyBaseDuration:", &v38);
        -[NSMutableArray addObject:](self->frameBurstyDropInfoList, "addObject:", v17);

      }
      v10 = 0;
      v13 = 0;
      v9 = 0;
LABEL_21:
      objc_msgSend(v15, "setFramesToBeDuplicated:", v10);
      objc_msgSend(v15, "setFrameIsAtBigGap:", 0);
    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    v21 += i;
  }
  while (v8);
LABEL_25:

  if (self->_debugPrint)
  {
    NSLog(CFSTR("FRAME_DROP_DETECTION: frame dropping detection...\n"));
    -[FRCFrameDropDetector debugPrintFRCFrameInternalTimingInfo:](self, "debugPrintFRCFrameInternalTimingInfo:", obj);
    NSLog(CFSTR("FRAME_DROP_DETECTION: bursty drop info...: total cnt=%ld\n"), v11);
    -[FRCFrameDropDetector debugPrintFRCFRCFrameBurstyDropInfo:](self, "debugPrintFRCFRCFrameBurstyDropInfo:", self->frameBurstyDropInfoList);
  }
  v19 = self->frameBurstyDropInfoList;

  return v19;
}

- (void)detectLocationOfBurstyGapsFromBurstyDropList:(id)a3 frameInternalTimingList:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  CMTimeValue value;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  CMTime time;
  CMTime v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v5;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        memset(&v29, 0, sizeof(v29));
        if (v11)
          objc_msgSend(v11, "burstyBaseDuration");
        else
          memset(&time, 0, sizeof(time));
        CMTimeConvertScale(&v29, &time, 600, kCMTimeRoundingMethod_QuickTime);
        value = v29.value;
        v13 = objc_msgSend(v11, "burstyStart");
        v14 = objc_msgSend(v11, "burstyLen");
        v15 = v14;
        v16 = v14 - 3;
        if ((unint64_t)(v14 - 3) > 0xC)
        {
          v17 = 0;
          v18 = -99;
          goto LABEL_25;
        }
        if (value == 64)
          v17 = 70;
        else
          v17 = 10 * (int)(((float)value + 5.0) / 10.0);
        v18 = -99;
        if (v17 <= 59)
        {
          v19 = &gap_offset_base40;
          if (v17 != 40)
          {
            if (v17 != 50)
              goto LABEL_25;
            v19 = &gap_offset_base50;
          }
        }
        else
        {
          switch(v17)
          {
            case '<':
              v19 = &gap_offset_base60;
              break;
            case 'F':
              v19 = &gap_offset_base70;
              break;
            case 'P':
              v19 = &gap_offset_base80;
              break;
            default:
              goto LABEL_25;
          }
        }
        v18 = v19[v14];
LABEL_25:
        if ((unint64_t)(v14 - 1) >= 2)
          v20 = v18;
        else
          v20 = 0;
        NSLog(CFSTR("[FRAME_DROP_DETECTION] baseDuration=%ld burstyStart=%ld burstyLen=%ld gapOffset=%ld\n"), v17, v13, v14, v20);
        if (v20 != -99)
        {
          v21 = v20 + v13;
          objc_msgSend(v6, "objectAtIndexedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setFramesToBeDuplicated:", 3);
          objc_msgSend(v22, "setFrameIsAtBigGap:", v15);
          if (v15 == 2)
          {
            objc_msgSend(v6, "objectAtIndexedSubscript:", v21 + 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v23, "setFramesToBeDuplicated:", 2);
            objc_msgSend(v23, "setFrameIsAtBigGap:", 2);
            v22 = v23;
          }
          else if (v15 == 1)
          {
            objc_msgSend(v22, "setFramesToBeDuplicated:", 2);
          }
          else if (v17 == 80)
          {
            if (v16 > 1)
            {
              if (v15 == 7)
              {
                objc_msgSend(v6, "objectAtIndexedSubscript:", v21 - 1);
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v25, "setFramesToBeDuplicated:", 2);
                objc_msgSend(v25, "setFrameIsAtBigGap:", 7);
                objc_msgSend(v6, "objectAtIndexedSubscript:", v21 + 1);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v22, "setFramesToBeDuplicated:", 2);
                objc_msgSend(v22, "setFrameIsAtBigGap:", 7);
              }
            }
            else
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", v21 + 1);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v24, "setFramesToBeDuplicated:", 2);
              objc_msgSend(v24, "setFrameIsAtBigGap:", v15);
              v22 = v24;
            }
          }

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v8);
  }
  if (self->_debugPrint)
  {
    NSLog(CFSTR("FRAME_DROP_DETECTION: frame dropping gap location..\n"));
    -[FRCFrameDropDetector debugPrintFRCFrameInternalTimingInfo:](self, "debugPrintFRCFrameInternalTimingInfo:", v6);
  }

}

- (id)detectFrameDropsFromFrameMetadataList:(id)a3 frameTimingList:(id)a4
{
  id v6;
  NSArray *v7;
  NSArray *sortedTimingList;
  NSArray *v9;
  NSArray *sortedMetadataList;
  NSMutableArray *v11;
  NSMutableArray *frameInternalPTSList;

  v6 = a3;
  -[FRCFrameDropDetector sortFrameTimingListInDisplayOrderFromTimingList:](self, "sortFrameTimingListInDisplayOrderFromTimingList:", a4);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sortedTimingList = self->sortedTimingList;
  self->sortedTimingList = v7;

  -[FRCFrameDropDetector sortFrameMetadataListInDisplayOrderFromMetadataList:](self, "sortFrameMetadataListInDisplayOrderFromMetadataList:", v6);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();

  sortedMetadataList = self->sortedMetadataList;
  self->sortedMetadataList = v9;

  -[FRCFrameDropDetector calculateFrameDropInfoFromSortedMetadataList:sortedTimingList:](self, "calculateFrameDropInfoFromSortedMetadataList:sortedTimingList:", self->sortedMetadataList, self->sortedTimingList);
  v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  frameInternalPTSList = self->frameInternalPTSList;
  self->frameInternalPTSList = v11;

  return self->frameInternalPTSList;
}

- (id)detectFrameDropsFromFrameTimingList:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *sortedTimingList;
  NSMutableArray *v7;
  NSMutableArray *frameInternalPTSList;
  NSMutableArray *v9;
  NSMutableArray *frameBurstyDropInfoList;
  NSMutableArray *v11;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[FRCFrameDropDetector sortFrameTimingListInDisplayOrderFromTimingList:](self, "sortFrameTimingListInDisplayOrderFromTimingList:", v4);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    sortedTimingList = self->sortedTimingList;
    self->sortedTimingList = v5;

    -[FRCFrameDropDetector calculateFrameDurationFromSortedTimingList:](self, "calculateFrameDurationFromSortedTimingList:", self->sortedTimingList);
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    frameInternalPTSList = self->frameInternalPTSList;
    self->frameInternalPTSList = v7;

    -[FRCFrameDropDetector detectFrameDropsFromInternalTimingList:](self, "detectFrameDropsFromInternalTimingList:", self->frameInternalPTSList);
    v9 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    frameBurstyDropInfoList = self->frameBurstyDropInfoList;
    self->frameBurstyDropInfoList = v9;

    -[FRCFrameDropDetector detectLocationOfBurstyGapsFromBurstyDropList:frameInternalTimingList:](self, "detectLocationOfBurstyGapsFromBurstyDropList:frameInternalTimingList:", self->frameBurstyDropInfoList, self->frameInternalPTSList);
    v11 = self->frameInternalPTSList;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)detectSingleFrameDropsFromInternalTimingList:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  $95D729B680665BEAEFA1D6FCA8238556 *p_maximumDuration;
  uint64_t i;
  void *v11;
  int32_t v12;
  int32_t v13;
  CMTime v14;
  CMTime v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CMTime v19;
  CMTime v20;
  CMTime v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  CMTime v28;
  CMTime time2;
  CMTime time1;
  CMTime v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CMTime v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(&v36, 0, sizeof(v36));
  -[FRCFrameDropDetector droppingThreshold](self, "droppingThreshold");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    p_maximumDuration = &self->_maximumDuration;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        memset(&v31, 0, sizeof(v31));
        if (v11)
          objc_msgSend(v11, "frameDuration");
        time1 = v31;
        time2 = v36;
        if (CMTimeCompare(&time1, &time2) == 1)
        {
          if (v11)
          {
            objc_msgSend(v11, "frameDuration");
            objc_msgSend(v11, "frameDuration");
            v12 = v23;
          }
          else
          {
            v12 = 0;
            memset(&lhs, 0, sizeof(lhs));
            v23 = 0;
            v24 = 0;
            v22 = 0;
          }
          CMTimeMake(&rhs, 1, v12);
          CMTimeAdd(&time, &lhs, &rhs);
          CMTimeMultiplyByRatio(&v28, &time, 1, 2);
          v21 = v28;
          objc_msgSend(v11, "setInterpolatedFrameDuration:", &v21);
          if (v11)
          {
            objc_msgSend(v11, "interpolatedFrameDuration");
            objc_msgSend(v11, "frameDuration");
            v13 = v17;
          }
          else
          {
            v13 = 0;
            memset(&v19, 0, sizeof(v19));
            v17 = 0;
            v18 = 0;
            v16 = 0;
          }
          CMTimeConvertScale(&v20, &v19, v13, kCMTimeRoundingMethod_QuickTime);
          v15 = v20;
          objc_msgSend(v11, "setInterpolatedFrameDuration:", &v15);
          objc_msgSend(v11, "setFramesToBeDuplicated:", 1);
          ++self->_numberOfInsertionPoints;
          if (v11)
            objc_msgSend(v11, "frameDuration");
          else
            memset(&v14, 0, sizeof(v14));
          *(_OWORD *)&time2.value = *(_OWORD *)&p_maximumDuration->value;
          time2.epoch = self->_maximumDuration.epoch;
          CMTimeMaximum(&time1, &time2, &v14);
          *(_OWORD *)&p_maximumDuration->value = *(_OWORD *)&time1.value;
          self->_maximumDuration.epoch = time1.epoch;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v7);
  }

  if (self->_debugPrint)
  {
    NSLog(CFSTR("FRAME_DROP_DETECTION: frame dropping detection...\n"));
    -[FRCFrameDropDetector debugPrintFRCFrameInternalTimingInfo:](self, "debugPrintFRCFrameInternalTimingInfo:", v5);
  }

}

- (id)detectSingleFrameDropsFromFrameTimingList:(id)a3
{
  NSArray *v4;
  NSArray *sortedTimingList;
  NSMutableArray *v6;
  NSMutableArray *frameInternalPTSList;

  -[FRCFrameDropDetector sortFrameTimingListInDisplayOrderFromTimingList:](self, "sortFrameTimingListInDisplayOrderFromTimingList:", a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sortedTimingList = self->sortedTimingList;
  self->sortedTimingList = v4;

  -[FRCFrameDropDetector calculateFrameDurationFromSortedTimingList:](self, "calculateFrameDurationFromSortedTimingList:", self->sortedTimingList);
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  frameInternalPTSList = self->frameInternalPTSList;
  self->frameInternalPTSList = v6;

  -[FRCFrameDropDetector detectSingleFrameDropsFromInternalTimingList:](self, "detectSingleFrameDropsFromInternalTimingList:", self->frameInternalPTSList);
  return self->frameInternalPTSList;
}

- (id)buildInsertionPointListFromInternalTimingList:(id)a3 bailOutCode:(int64_t *)a4
{
  id v6;
  NSMutableArray *v7;
  NSMutableArray *insertionPointList;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  FRCFrameInsertionPoint *v17;
  uint64_t v18;
  NSMutableArray *v19;
  int64_t v20;
  int64_t retimingRecipe;
  int64_t v22;
  void *v23;
  uint64_t v24;
  NSMutableArray *v25;
  NSMutableArray *v26;
  id v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    insertionPointList = self->insertionPointList;
    self->insertionPointList = v7;

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v10)
    {
      v11 = v10;
      v28 = v6;
      v12 = 0;
      v13 = 0;
      v14 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v38 != v14)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          v35 = 0uLL;
          v36 = 0;
          if (v16)
            objc_msgSend(v16, "presentationTimeStamp");
          v17 = objc_alloc_init(FRCFrameInsertionPoint);
          -[FRCFrameInsertionPoint setNumberOfFramesToInsert:](v17, "setNumberOfFramesToInsert:", objc_msgSend(v16, "framesToBeDuplicated"));
          if (v16)
          {
            objc_msgSend(v16, "interpolatedFrameDuration");
          }
          else
          {
            v33 = 0uLL;
            v34 = 0;
          }
          v31 = v33;
          v32 = v34;
          -[FRCFrameInsertionPoint setInterpolatedFrameDuration:](v17, "setInterpolatedFrameDuration:", &v31);
          v29 = v35;
          v30 = v36;
          -[FRCFrameInsertionPoint setPresentationTimeStamp:](v17, "setPresentationTimeStamp:", &v29);
          -[NSMutableArray addObject:](self->insertionPointList, "addObject:", v17);
          v12 += objc_msgSend(v16, "framesToBeDuplicated");

        }
        v13 += v11;
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v11);
      v18 = v13 - 2;
      v6 = v28;
    }
    else
    {
      v12 = 0;
      v18 = -2;
    }

    if (self->_debugPrint)
      NSLog(CFSTR("FRAME_DROP_DETECTION: total frames to be interpolated: %3ld\n"), v12);
    *a4 = 0;
    if (!self->_gatingEnabled)
      goto LABEL_28;
    if (v12 > 17)
    {
      v20 = 2;
      goto LABEL_30;
    }
    retimingRecipe = self->_retimingRecipe;
    if (retimingRecipe == 1000 || retimingRecipe <= 3)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->insertionPointList, "objectAtIndexedSubscript:", v18);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "numberOfFramesToInsert");

      if (v24 < 2)
      {
LABEL_28:
        if (v12)
        {
LABEL_31:
          v19 = self->insertionPointList;
          goto LABEL_32;
        }
        v20 = 1;
LABEL_30:
        *a4 = v20;
        v26 = self->insertionPointList;
        self->insertionPointList = 0;

        goto LABEL_31;
      }
      v22 = 4;
    }
    else
    {
      v22 = 3;
    }
    *a4 = v22;
    v25 = self->insertionPointList;
    self->insertionPointList = 0;

    goto LABEL_28;
  }
  v19 = 0;
  *a4 = 1;
LABEL_32:

  return v19;
}

- (void)scaleNumberOfFramesToInsertFor2xSloMo:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "setNumberOfFramesToInsert:", (2 * objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "numberOfFramesToInsert")) | 1);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (unint64_t)countNumberOfFramesWithRecipeInMetadataList:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "sequenceAdjusterRecipe"))
          ++v6;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)selectFrameInsertionPointsFromTimingList:(id)a3 metadataList:(id)a4 sloMo:(BOOL)a5 withError:(id *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  $95D729B680665BEAEFA1D6FCA8238556 *v12;
  uint64_t v13;
  unint64_t v14;
  NSMutableArray *v15;
  NSMutableArray *frameInternalPTSList;
  NSMutableArray *v17;
  NSMutableArray *insertionPointList;
  NSMutableArray *v19;
  unint64_t v20;
  const __CFString *v21;
  void *v22;
  NSObject *logger;
  id v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  NSMutableArray *v28;
  unint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v7 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = ($95D729B680665BEAEFA1D6FCA8238556 *)MEMORY[0x1E0CA2E68];
  self->_numberOfInsertionPoints = 0;
  self->_maximumDuration = *v12;
  v30 = 0;
  v13 = objc_msgSend(v11, "count");
  v14 = -[FRCFrameDropDetector countNumberOfFramesWithRecipeInMetadataList:](self, "countNumberOfFramesWithRecipeInMetadataList:", v11);
  if (v13 < 1)
  {
    self->_retimingRecipe = 1000;
    -[FRCFrameDropDetector detectFrameDropsFromFrameTimingList:](self, "detectFrameDropsFromFrameTimingList:", v10);
    v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  else if (v14 || !self->_singleDropRecoveryEnabled)
  {
    -[FRCFrameDropDetector detectFrameDropsFromFrameMetadataList:frameTimingList:](self, "detectFrameDropsFromFrameMetadataList:frameTimingList:", v11, v10);
    v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FRCFrameDropDetector detectSingleFrameDropsFromFrameTimingList:](self, "detectSingleFrameDropsFromFrameTimingList:", v10);
    v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  frameInternalPTSList = self->frameInternalPTSList;
  self->frameInternalPTSList = v15;

  -[FRCFrameDropDetector buildInsertionPointListFromInternalTimingList:bailOutCode:](self, "buildInsertionPointListFromInternalTimingList:bailOutCode:", self->frameInternalPTSList, &v30);
  v17 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  insertionPointList = self->insertionPointList;
  self->insertionPointList = v17;

  v19 = self->insertionPointList;
  if (v7 && v19)
  {
    -[FRCFrameDropDetector scaleNumberOfFramesToInsertFor2xSloMo:](self, "scaleNumberOfFramesToInsertFor2xSloMo:");
    v19 = self->insertionPointList;
  }
  self->_gatingCause = 0;
  if (a6 && !v19)
  {
    v20 = v30;
    switch(v30)
    {
      case 1uLL:
        v21 = CFSTR("Bail out at frame drop detection (reason: no drops detected)");
        goto LABEL_17;
      case 2uLL:
        v21 = CFSTR("Bail out at frame drop detection (reason: too many drops detected)");
        goto LABEL_17;
      case 3uLL:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bail out at frame drop detection (reason: very low frame rate. recipe=%ld)"), self->_retimingRecipe);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[FRCFrameDropDetector errorWithDescription:](self, "errorWithDescription:", v22);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_18;
      case 4uLL:
        v21 = CFSTR("Bail out at frame drop detection (reason: burst drop in the end)");
LABEL_17:
        -[FRCFrameDropDetector errorWithDescription:](self, "errorWithDescription:", v21);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
        self->_gatingCause = v20;
        break;
      default:
        break;
    }
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *a6;
      v25 = logger;
      objc_msgSend(v24, "localizedDescription");
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v27 = objc_msgSend(v26, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v32 = v27;
      _os_log_impl(&dword_1D425A000, v25, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);

    }
    v19 = self->insertionPointList;
  }
  v28 = v19;

  return v28;
}

- (id)errorWithDescription:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a3, *MEMORY[0x1E0CB2D50]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.FRC"), -22006, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)debugPrint
{
  return self->_debugPrint;
}

- (void)setDebugPrint:(BOOL)a3
{
  self->_debugPrint = a3;
}

- (BOOL)gatingEnabled
{
  return self->_gatingEnabled;
}

- (void)setGatingEnabled:(BOOL)a3
{
  self->_gatingEnabled = a3;
}

- (BOOL)singleDropRecoveryEnabled
{
  return self->_singleDropRecoveryEnabled;
}

- (void)setSingleDropRecoveryEnabled:(BOOL)a3
{
  self->_singleDropRecoveryEnabled = a3;
}

- (int64_t)retimingRecipe
{
  return self->_retimingRecipe;
}

- (unint64_t)numberOfInsertionPoints
{
  return self->_numberOfInsertionPoints;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 112);
  return self;
}

- (unint64_t)gatingCause
{
  return self->_gatingCause;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->insertionPointList, 0);
  objc_storeStrong((id *)&self->frameBurstyDropInfoList, 0);
  objc_storeStrong((id *)&self->frameInternalPTSList, 0);
  objc_storeStrong((id *)&self->sortedMetadataList, 0);
  objc_storeStrong((id *)&self->sortedTimingList, 0);
}

@end

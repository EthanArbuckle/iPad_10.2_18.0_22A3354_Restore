@implementation NUVideoCompositionInstruction

- (NSString)description
{
  void *v3;
  const __CFAllocator *v4;
  __CFString *v5;
  void *v6;
  CMTimeRange v8;
  CMTimeRange range;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NUVideoCompositionInstruction timeRange](self, "timeRange");
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  range = v8;
  v5 = (__CFString *)CMTimeRangeCopyDescription(v4, &range);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("NUVideoCompositionInstruction <%p>:\ntimeRange:%@\nsourceIdentifiersByTrackID: %@\nsourceIdentifiersByMetadataTrackID:%@"), self, v5, self->_sourceIdentifiersByTrackID, self->_sourceIdentifiersByMetadataTrackID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NUVideoCompositionInstruction)init
{
  NUVideoCompositionInstruction *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *sourceIdentifiersByTrackID;
  NSMutableDictionary *v5;
  NSMutableDictionary *sourceIdentifiersByMetadataTrackID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUVideoCompositionInstruction;
  v2 = -[NUVideoCompositionInstruction init](&v8, sel_init);
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  sourceIdentifiersByTrackID = v2->_sourceIdentifiersByTrackID;
  v2->_sourceIdentifiersByTrackID = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  sourceIdentifiersByMetadataTrackID = v2->_sourceIdentifiersByMetadataTrackID;
  v2->_sourceIdentifiersByMetadataTrackID = v5;

  v2->_renderScale = ($F9703ADC4DD3124DE91DE417D7636CC9)NUScaleOne;
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NUVideoCompositionInstruction *v5;
  __int128 v6;
  void *v7;
  id WeakRetained;
  id v9;
  void *v10;
  double v11;
  uint64_t v12;
  NSMutableDictionary *sourceIdentifiersByTrackID;
  uint64_t v14;
  NSMutableDictionary *sourceIdentifiersByMetadataTrackID;
  _OWORD v17[3];

  v5 = objc_alloc_init(NUVideoCompositionInstruction);
  v6 = *(_OWORD *)&self->_timeRange.start.epoch;
  v17[0] = *(_OWORD *)&self->_timeRange.start.value;
  v17[1] = v6;
  v17[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  -[NUVideoCompositionInstruction setTimeRange:](v5, "setTimeRange:", v17);
  v7 = (void *)-[NSArray copyWithZone:](self->_requiredSourceTrackIDs, "copyWithZone:", a3);
  -[NUVideoCompositionInstruction setRequiredSourceTrackIDs:](v5, "setRequiredSourceTrackIDs:", v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_renderJob);
  -[NUVideoCompositionInstruction setRenderJob:](v5, "setRenderJob:", WeakRetained);

  v9 = -[NUComposition copyWithZone:](self->_adjustmentComposition, "copyWithZone:", a3);
  -[NUVideoCompositionInstruction setAdjustmentComposition:](v5, "setAdjustmentComposition:", v9);

  v10 = (void *)-[NSArray copyWithZone:](self->_pipelineFilters, "copyWithZone:", a3);
  -[NUVideoCompositionInstruction setPipelineFilters:](v5, "setPipelineFilters:", v10);

  -[NUVideoCompositionInstruction setRenderScale:](v5, "setRenderScale:", self->_renderScale.numerator, self->_renderScale.denominator);
  -[NUVideoCompositionInstruction setColorSpace:](v5, "setColorSpace:", self->_colorSpace);
  -[NUVideoCompositionInstruction setIsDolbyVision:](v5, "setIsDolbyVision:", self->_isDolbyVision);
  *(float *)&v11 = self->_playbackRate;
  -[NUVideoCompositionInstruction setPlaybackRate:](v5, "setPlaybackRate:", v11);
  -[NUVideoCompositionInstruction setName:](v5, "setName:", self->_name);
  v12 = -[NSMutableDictionary mutableCopyWithZone:](self->_sourceIdentifiersByTrackID, "mutableCopyWithZone:", a3);
  sourceIdentifiersByTrackID = v5->_sourceIdentifiersByTrackID;
  v5->_sourceIdentifiersByTrackID = (NSMutableDictionary *)v12;

  v14 = -[NSMutableDictionary mutableCopyWithZone:](self->_sourceIdentifiersByMetadataTrackID, "mutableCopyWithZone:", a3);
  sourceIdentifiersByMetadataTrackID = v5->_sourceIdentifiersByMetadataTrackID;
  v5->_sourceIdentifiersByMetadataTrackID = (NSMutableDictionary *)v14;

  -[NUVideoCompositionInstruction setSampleMode:](v5, "setSampleMode:", self->_sampleMode);
  -[NUVideoCompositionInstruction setVideoRenderPrepareNode:](v5, "setVideoRenderPrepareNode:", self->_videoRenderPrepareNode);
  -[NUVideoCompositionInstruction setRequestedWindowOfSamples:](v5, "setRequestedWindowOfSamples:", self->_requestedWindowOfSamples);
  -[NUVideoCompositionInstruction setMainTrackSourceIdentifier:](v5, "setMainTrackSourceIdentifier:", self->_mainTrackSourceIdentifier);
  return v5;
}

- (BOOL)enablePostProcessing
{
  return 0;
}

- (BOOL)containsTweening
{
  return 1;
}

- (int)passthroughTrackID
{
  return 0;
}

- (NSArray)requiredSourceSampleDataTrackIDs
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_sourceIdentifiersByMetadataTrackID, "allKeys");
}

- (void)setSourceIdentifier:(id)a3 forTrackID:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sourceIdentifiersByTrackID, "setObject:forKeyedSubscript:", a3, a4);
}

- (id)sourceIdentifierForTrackID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sourceIdentifiersByTrackID, "objectForKeyedSubscript:", a3);
}

- (id)trackIDForSourceIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary allKeys](self->_sourceIdentifiersByTrackID, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_sourceIdentifiersByTrackID, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v13 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (void)setSourceIdentifier:(id)a3 forMetadataTrackID:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sourceIdentifiersByMetadataTrackID, "setObject:forKeyedSubscript:", a3, a4);
}

- (id)sourceIdentifierForMetadataTrackID:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sourceIdentifiersByMetadataTrackID, "objectForKeyedSubscript:", a3);
}

- (id)metadataTrackIDForSourceIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary allKeys](self->_sourceIdentifiersByMetadataTrackID, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_sourceIdentifiersByMetadataTrackID, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v13 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  NUVideoCompositionInstruction *v4;
  BOOL v5;

  v4 = (NUVideoCompositionInstruction *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NUVideoCompositionInstruction isEqualToInstruction:](self, "isEqualToInstruction:", v4);
  }

  return v5;
}

- (BOOL)isEqualToInstruction:(id)a3
{
  id *v4;
  id *v5;
  id v6;
  id WeakRetained;
  char v8;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  CMTimeRange v18;
  CMTimeRange range1;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_3;
  objc_msgSend(v4, "renderJob");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_renderJob);

  if (v6 != WeakRetained)
    goto LABEL_3;
  objc_msgSend(v5, "timeRange");
  v10 = *(_OWORD *)&self->_timeRange.start.epoch;
  *(_OWORD *)&v18.start.value = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)&v18.start.epoch = v10;
  *(_OWORD *)&v18.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
  if (!CMTimeRangeEqual(&range1, &v18))
    goto LABEL_3;
  v11 = objc_msgSend(v5, "renderScale");
  if (!NUScaleEqual(v11, v12, self->_renderScale.numerator, self->_renderScale.denominator))
    goto LABEL_3;
  objc_msgSend(v5, "requiredSourceTrackIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToArray:", self->_requiredSourceTrackIDs);

  if (v14
    && (v15 = objc_msgSend(v5, "containsTweening"),
        v15 == -[NUVideoCompositionInstruction containsTweening](self, "containsTweening"))
    && (v16 = objc_msgSend(v5, "passthroughTrackID"),
        v16 == -[NUVideoCompositionInstruction passthroughTrackID](self, "passthroughTrackID"))
    && (v17 = objc_msgSend(v5, "enablePostProcessing"),
        v17 == -[NUVideoCompositionInstruction enablePostProcessing](self, "enablePostProcessing")))
  {
    v8 = objc_msgSend(v5[1], "isEqual:", self->_sourceIdentifiersByTrackID);
  }
  else
  {
LABEL_3:
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUVideoCompositionInstruction;
  return -[NUVideoCompositionInstruction hash](&v3, sel_hash);
}

- ($D3A4C128BFADF90F63068A1E85A19F01)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var0.var3;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- (NSArray)requiredSourceTrackIDs
{
  return self->_requiredSourceTrackIDs;
}

- (void)setRequiredSourceTrackIDs:(id)a3
{
  objc_storeStrong((id *)&self->_requiredSourceTrackIDs, a3);
}

- (NURenderJob)renderJob
{
  return (NURenderJob *)objc_loadWeakRetained((id *)&self->_renderJob);
}

- (void)setRenderJob:(id)a3
{
  objc_storeWeak((id *)&self->_renderJob, a3);
}

- (NURenderNode)videoRenderPrepareNode
{
  return (NURenderNode *)objc_getProperty(self, a2, 48, 1);
}

- (void)setVideoRenderPrepareNode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NURenderContext)renderContext
{
  return (NURenderContext *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRenderContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NUComposition)adjustmentComposition
{
  return self->_adjustmentComposition;
}

- (void)setAdjustmentComposition:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentComposition, a3);
}

- (NSArray)pipelineFilters
{
  return self->_pipelineFilters;
}

- (void)setPipelineFilters:(id)a3
{
  objc_storeStrong((id *)&self->_pipelineFilters, a3);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)renderScale
{
  int64_t denominator;
  int64_t numerator;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  denominator = self->_renderScale.denominator;
  numerator = self->_renderScale.numerator;
  result.var1 = denominator;
  result.var0 = numerator;
  return result;
}

- (void)setRenderScale:(id)a3
{
  self->_renderScale = ($F9703ADC4DD3124DE91DE417D7636CC9)a3;
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_colorSpace, a3);
}

- (BOOL)isDolbyVision
{
  return self->_isDolbyVision;
}

- (void)setIsDolbyVision:(BOOL)a3
{
  self->_isDolbyVision = a3;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (void)setPlaybackRate:(float)a3
{
  self->_playbackRate = a3;
}

- (int64_t)sampleMode
{
  return self->_sampleMode;
}

- (void)setSampleMode:(int64_t)a3
{
  self->_sampleMode = a3;
}

- (BOOL)requestedWindowOfSamples
{
  return self->_requestedWindowOfSamples;
}

- (void)setRequestedWindowOfSamples:(BOOL)a3
{
  self->_requestedWindowOfSamples = a3;
}

- (NSString)mainTrackSourceIdentifier
{
  return self->_mainTrackSourceIdentifier;
}

- (void)setMainTrackSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainTrackSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
  objc_storeStrong((id *)&self->_pipelineFilters, 0);
  objc_storeStrong((id *)&self->_adjustmentComposition, 0);
  objc_storeStrong((id *)&self->_renderContext, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_videoRenderPrepareNode, 0);
  objc_destroyWeak((id *)&self->_renderJob);
  objc_storeStrong((id *)&self->_requiredSourceTrackIDs, 0);
  objc_storeStrong((id *)&self->_sourceIdentifiersByMetadataTrackID, 0);
  objc_storeStrong((id *)&self->_sourceIdentifiersByTrackID, 0);
}

+ (id)defaultInstructionForAsset:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v20;
  void *v21;
  void *specific;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    NUAssertLogger_22640();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "asset != nil");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v21;
      _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_22640();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v24)
      {
        v27 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v28 = (void *)MEMORY[0x1E0CB3978];
        v29 = v27;
        objc_msgSend(v28, "callStackSymbols");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "componentsJoinedByString:", CFSTR("\n"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v27;
        v38 = 2114;
        v39 = v31;
        _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v26;
      _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoCompositionInstruction defaultInstructionForAsset:error:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoCompositionInstruction.m", 32, CFSTR("Invalid parameter not satisfying: %s"), v32, v33, v34, v35, (uint64_t)"asset != nil");
  }
  v7 = v6;
  +[NUVideoUtilities firstEnabledVideoTrackInAsset:error:](NUVideoUtilities, "firstEnabledVideoTrackInAsset:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "instructionForVideoTrack:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUVideoUtilities auxiliaryTrackInAsset:ofType:error:](NUVideoUtilities, "auxiliaryTrackInAsset:ofType:error:", v7, 2, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v9, "requiredSourceTrackIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "trackID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "arrayByAddingObject:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRequiredSourceTrackIDs:", v13);

      v14 = CFSTR("Disparity");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "trackID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSourceIdentifier:forTrackID:", CFSTR("Disparity"), v15);

    }
    +[NUVideoUtilities metadataTrackWithPortraitVideoDataInAsset:](NUVideoUtilities, "metadataTrackWithPortraitVideoDataInAsset:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v16, "trackID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSourceIdentifier:forMetadataTrackID:", CFSTR("portraitVideoMetadata"), v18);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)instructionForVideoTrack:(id)a3
{
  id v3;
  void *v4;
  NUVideoCompositionInstruction *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[13];
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    NUAssertLogger_22640();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "videoTrack != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_22640();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E0CB3978];
        v19 = v17;
        objc_msgSend(v18, "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v17;
        v30 = 2114;
        v31 = v21;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUVideoCompositionInstruction instructionForVideoTrack:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoCompositionInstruction.m", 61, CFSTR("Invalid parameter not satisfying: %s"), v22, v23, v24, v25, (uint64_t)"videoTrack != nil");
  }
  v4 = v3;
  v5 = objc_alloc_init(NUVideoCompositionInstruction);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "trackID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUVideoCompositionInstruction setRequiredSourceTrackIDs:](v5, "setRequiredSourceTrackIDs:", v7);

  objc_msgSend(v4, "timeRange");
  *(_OWORD *)v26 = *(_OWORD *)&v26[7];
  *(_OWORD *)&v26[2] = *(_OWORD *)&v26[9];
  *(_OWORD *)&v26[4] = *(_OWORD *)&v26[11];
  -[NUVideoCompositionInstruction setTimeRange:](v5, "setTimeRange:", v26);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "trackID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUVideoCompositionInstruction setSourceIdentifier:forTrackID:](v5, "setSourceIdentifier:forTrackID:", CFSTR("video"), v8);

  return v5;
}

@end

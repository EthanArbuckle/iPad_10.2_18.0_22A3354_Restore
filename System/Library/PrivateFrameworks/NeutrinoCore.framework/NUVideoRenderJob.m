@implementation NUVideoRenderJob

- (BOOL)wantsRenderStage
{
  return 0;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (BOOL)wantsOutputVideo
{
  return 1;
}

- (BOOL)wantsOutputGeometry
{
  return 1;
}

- (id)scalePolicy
{
  void *v2;
  void *v3;

  -[NUVideoRenderJob videoRenderRequest](self, "videoRenderRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scalePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)prepare:(id *)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  NUImageGeometry *v7;
  uint64_t v8;
  void *v9;
  NUImageGeometry *v10;
  __int128 v12;
  __int128 v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)NUVideoRenderJob;
  v4 = -[NURenderJob prepare:](&v14, sel_prepare_, a3);
  if (v4 && !-[NURenderJob _shouldWaitForDependentJobs](self, "_shouldWaitForDependentJobs"))
  {
    -[NURenderJob outputVideoComposition](self, "outputVideoComposition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[NURenderJob outputGeometry](self, "outputGeometry");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = [NUImageGeometry alloc];
      if (v6)
      {
        objc_msgSend(v6, "extent");
      }
      else
      {
        v12 = 0u;
        v13 = 0u;
      }
      v8 = objc_msgSend(v6, "orientation", v12, v13);
      objc_msgSend(v6, "spaceMap");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NUImageGeometry initWithExtent:renderScale:orientation:spaceMap:](v7, "initWithExtent:renderScale:orientation:spaceMap:", &v12, NUScaleOne, v8, v9);
      -[NURenderJob setOutputGeometry:](self, "setOutputGeometry:", v10);

    }
  }
  return v4;
}

- (BOOL)requiresVideoComposition
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NUVideoRenderJob;
  return -[NURenderJob requiresVideoComposition](&v3, sel_requiresVideoComposition);
}

- (id)generateVideoComposition:(id *)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v49.receiver = self;
  v49.super_class = (Class)NUVideoRenderJob;
  -[NURenderJob generateVideoComposition:](&v49, sel_generateVideoComposition_);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUVideoUtilities deepMutableCopyVideoComposition:](NUVideoUtilities, "deepMutableCopyVideoComposition:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderJob composition](self, "composition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[NUCompositionUtilities isHDRComposition:](NUCompositionUtilities, "isHDRComposition:", v6);

  if (!v7)
  {
    -[NURenderJob composition](self, "composition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("semanticStyle"));

  }
  objc_msgSend(v5, "setCustomVideoCompositorClass:", objc_opt_class());
  -[NURenderJob outputVideo](self, "outputVideo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSourceTrackIDForFrameTiming:", objc_msgSend(v11, "trackID"));

  }
  v41 = v10;
  +[NUVideoUtilities firstEnabledVideoTrackInAsset:error:](NUVideoUtilities, "firstEnabledVideoTrackInAsset:error:", v9, a3);
  v12 = objc_claimAutoreleasedReturnValue();
  v42 = v9;
  v40 = (void *)v12;
  if (v12)
    v13 = +[NUVideoUtilities videoTrackContainsDolbyVisionMetadata:](NUVideoUtilities, "videoTrackContainsDolbyVisionMetadata:", v12);
  else
    v13 = 0;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = v5;
  objc_msgSend(v5, "instructions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v46 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        -[NURenderJob request](self, "request");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "composition");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setAdjustmentComposition:", v21);

        -[NURenderJob request](self, "request");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "pipelineFilters");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setPipelineFilters:", v23);

        v24 = -[NURenderJob renderScale](self, "renderScale");
        objc_msgSend(v19, "setRenderScale:", v24, v25);
        -[NUVideoRenderJob videoRenderRequest](self, "videoRenderRequest");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "colorSpace");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setColorSpace:", v27);

        objc_msgSend(v19, "setIsDolbyVision:", v13);
        -[NURenderJob request](self, "request");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "renderContext");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setRenderContext:", v29);

        -[NURenderJob prepareNode](self, "prepareNode");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setVideoRenderPrepareNode:", v30);

        -[NURenderJob request](self, "request");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setSampleMode:", objc_msgSend(v31, "sampleMode"));

        -[NURenderJob request](self, "request");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "name");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-NUVideoRenderRequest"), &stru_1E5068958);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setName:", v34);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v16);
  }

  if (v13)
    objc_msgSend(v43, "setPerFrameHDRDisplayMetadataPolicy:", *MEMORY[0x1E0C8AEB0]);
  objc_msgSend(v43, "instructions");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "firstObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "requiredSourceSampleDataTrackIDs");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setSourceSampleDataTrackIDs:", v37);

  v38 = (void *)objc_msgSend(v43, "copy");
  return v38;
}

- (id)result
{
  _NUVideoRenderResult *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(_NUVideoRenderResult);
  -[NURenderJob outputVideo](self, "outputVideo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUVideoRenderResult setVideo:](v3, "setVideo:", v4);

  -[NURenderJob outputVideoComposition](self, "outputVideoComposition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUVideoRenderResult setVideoComposition:](v3, "setVideoComposition:", v5);

  -[NURenderJob outputAudioMix](self, "outputAudioMix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUVideoRenderResult setAudioMix:](v3, "setAudioMix:", v6);

  -[NURenderJob outputGeometry](self, "outputGeometry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUVideoRenderResult setGeometry:](v3, "setGeometry:", v7);

  return v3;
}

@end

@implementation HFCameraTimelapsePosterFrameGenerator

- (HFCameraTimelapsePosterFrameGenerator)initWithTimelapseClipInfoProvider:(id)a3 andDelegate:(id)a4
{
  id v6;
  id v7;
  HFCameraTimelapsePosterFrameGenerator *v8;
  HFCameraTimelapsePosterFrameGenerator *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *generationQueue;
  uint64_t v12;
  NSMutableDictionary *posterFrameGenerationRequests;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HFCameraTimelapsePosterFrameGenerator;
  v8 = -[HFCameraTimelapsePosterFrameGenerator init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_timelapseClipInfoProvider, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    v10 = dispatch_queue_create("com.apple.home.HFCameraTimelapsePosterFrameGenerator.generationQueue", MEMORY[0x1E0C80D50]);
    generationQueue = v9->_generationQueue;
    v9->_generationQueue = (OS_dispatch_queue *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    posterFrameGenerationRequests = v9->_posterFrameGenerationRequests;
    v9->_posterFrameGenerationRequests = (NSMutableDictionary *)v12;

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HFCameraTimelapsePosterFrameGenerator posterFrameGenerationRequests](self, "posterFrameGenerationRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v4.receiver = self;
  v4.super_class = (Class)HFCameraTimelapsePosterFrameGenerator;
  -[HFCameraTimelapsePosterFrameGenerator dealloc](&v4, sel_dealloc);
}

- (id)generatePosterFramesForHighQualityClip:(id)a3 withStep:(unint64_t)a4 atSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25[3];
  id location[4];

  height = a5.height;
  width = a5.width;
  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v9 = a3;
  -[HFCameraTimelapsePosterFrameGenerator timelapseClipInfoProvider](self, "timelapseClipInfoProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timelapseClipPositionForDate:inHighQualityClip:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HFCameraTimelapsePosterFrameGenerator _generateOffsetsForHighQualityClip:withStep:](self, "_generateOffsetsForHighQualityClip:withStep:", v9, a4);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
    {
      objc_msgSend(v12, "clip");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraTimelapsePosterFrameGenerator _generatePosterFramesForTimelapseClip:withHighQualityClip:forOffsets:atSize:](self, "_generatePosterFramesForTimelapseClip:withHighQualityClip:forOffsets:atSize:", v14, v9, v13, width, height);

    }
    else
    {
      objc_initWeak(location, self);
      -[HFCameraTimelapsePosterFrameGenerator generationQueue](self, "generationQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __96__HFCameraTimelapsePosterFrameGenerator_generatePosterFramesForHighQualityClip_withStep_atSize___block_invoke;
      v21[3] = &unk_1EA73A8E0;
      objc_copyWeak(v25, location);
      v22 = v12;
      v23 = v9;
      v18 = v13;
      v24 = v18;
      v25[1] = *(id *)&width;
      v25[2] = *(id *)&height;
      dispatch_async(v17, v21);

      v19 = v24;
      v13 = v18;

      objc_destroyWeak(v25);
      objc_destroyWeak(location);
    }
  }
  else
  {
    HFLogForCategory(0x19uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v9;
      _os_log_error_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_ERROR, "Error: Poster generator missing timelapse for clip %@", (uint8_t *)location, 0xCu);
    }

    -[HFCameraTimelapsePosterFrameGenerator delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "failedToFindTimelapseClipForHighQualityClip:", v9);

    v13 = (id)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

void __96__HFCameraTimelapsePosterFrameGenerator_generatePosterFramesForHighQualityClip_withStep_atSize___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "clip");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_generatePosterFramesForTimelapseClip:withHighQualityClip:forOffsets:atSize:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 72));

}

- (void)_generatePosterFramesForTimelapseClip:(id)a3 withHighQualityClip:(id)a4 forOffsets:(id)a5 atSize:(CGSize)a6
{
  double height;
  double width;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  height = a6.height;
  width = a6.width;
  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  -[HFCameraTimelapsePosterFrameGenerator timelapseClipInfoProvider](self, "timelapseClipInfoProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timelapseURLForTimelapseClip:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceDate:", v17);
  v19 = v18;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "fileExistsAtPath:", v21);

  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraTimelapsePosterFrameGenerator _generatePosterFramesForAsset:forOffsets:atSize:withHighQualityClip:andTimelapseOffset:](self, "_generatePosterFramesForAsset:forOffsets:atSize:withHighQualityClip:andTimelapseOffset:", v23, v13, v12, width, height, v19);

  }
  else
  {
    HFLogForCategory(0x19uLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v26 = 138412546;
      v27 = v11;
      v28 = 2112;
      v29 = v12;
      _os_log_error_impl(&dword_1DD34E000, v24, OS_LOG_TYPE_ERROR, "Error: No file for timelapse clip %@ for clip %@", (uint8_t *)&v26, 0x16u);
    }

    -[HFCameraTimelapsePosterFrameGenerator delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "failedToFindTimelapseClipForHighQualityClip:", v12);

  }
}

- (void)_generatePosterFramesForAsset:(id)a3 forOffsets:(id)a4 atSize:(CGSize)a5 withHighQualityClip:(id)a6 andTimelapseOffset:(double)a7
{
  double height;
  double width;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  HFCameraImageGenerator *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  HFCameraImageGenerator *v22;
  id v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[5];
  id v27;
  HFCameraImageGenerator *v28;
  id v29;
  id v30;
  double v31;
  double v32;
  double v33;
  _QWORD block[4];
  id v35;
  HFCameraImageGenerator *v36;
  id v37;
  id v38[2];
  id location;

  height = a5.height;
  width = a5.width;
  v13 = a3;
  v14 = a4;
  v15 = a6;
  objc_msgSend(v15, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[HFCameraImageGenerator initWithDelegate:]([HFCameraImageGenerator alloc], "initWithDelegate:", self);
  objc_initWeak(&location, self);
  -[HFCameraTimelapsePosterFrameGenerator generationQueue](self, "generationQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __128__HFCameraTimelapsePosterFrameGenerator__generatePosterFramesForAsset_forOffsets_atSize_withHighQualityClip_andTimelapseOffset___block_invoke;
  block[3] = &unk_1EA73A908;
  objc_copyWeak(v38, &location);
  v21 = v15;
  v35 = v21;
  v38[1] = *(id *)&a7;
  v22 = v18;
  v36 = v22;
  v23 = v17;
  v37 = v23;
  dispatch_barrier_async(v19, block);

  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    -[HFCameraTimelapsePosterFrameGenerator _generateTimelapseOffsetsFromOffsets:forTimelapseDiff:](self, "_generateTimelapseOffsetsFromOffsets:forTimelapseDiff:", v14, a7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCameraImageGenerator generateImagesFromAsset:forOffsets:atSize:withKey:](v22, "generateImagesFromAsset:forOffsets:atSize:withKey:", v13, v24, v23, width, height);

  }
  else
  {
    -[HFCameraTimelapsePosterFrameGenerator generationQueue](self, "generationQueue");
    v25 = objc_claimAutoreleasedReturnValue();
    v26[0] = v20;
    v26[1] = 3221225472;
    v26[2] = __128__HFCameraTimelapsePosterFrameGenerator__generatePosterFramesForAsset_forOffsets_atSize_withHighQualityClip_andTimelapseOffset___block_invoke_2;
    v26[3] = &unk_1EA73A930;
    v26[4] = self;
    v27 = v14;
    v31 = a7;
    v28 = v22;
    v29 = v13;
    v32 = width;
    v33 = height;
    v30 = v23;
    dispatch_async(v25, v26);

  }
  objc_destroyWeak(v38);
  objc_destroyWeak(&location);

}

void __128__HFCameraTimelapsePosterFrameGenerator__generatePosterFramesForAsset_forOffsets_atSize_withHighQualityClip_andTimelapseOffset___block_invoke(uint64_t a1)
{
  HFCameraTimelapsePosterFrameGenerationRequest *v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = objc_alloc_init(HFCameraTimelapsePosterFrameGenerationRequest);
  -[HFCameraTimelapsePosterFrameGenerationRequest setClip:](v2, "setClip:", *(_QWORD *)(a1 + 32));
  -[HFCameraTimelapsePosterFrameGenerationRequest setTimelapseOffset:](v2, "setTimelapseOffset:", *(double *)(a1 + 64));
  -[HFCameraTimelapsePosterFrameGenerationRequest setImageGenerator:](v2, "setImageGenerator:", *(_QWORD *)(a1 + 40));
  objc_msgSend(WeakRetained, "posterFrameGenerationRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "addObject:", v2);
  objc_msgSend(WeakRetained, "posterFrameGenerationRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, *(_QWORD *)(a1 + 48));

}

void __128__HFCameraTimelapsePosterFrameGenerator__generatePosterFramesForAsset_forOffsets_atSize_withHighQualityClip_andTimelapseOffset___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_generateTimelapseOffsetsFromOffsets:forTimelapseDiff:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 72));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "generateImagesFromAsset:forOffsets:atSize:withKey:", *(_QWORD *)(a1 + 56), v2, *(_QWORD *)(a1 + 64), *(double *)(a1 + 80), *(double *)(a1 + 88));

}

- (id)_generateOffsetsForHighQualityClip:(id)a3 withStep:(unint64_t)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;
  double v11;
  void *v12;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(v5, "duration");
    if (v7 > 0.0)
    {
      v8 = 0.0;
      v9 = a4;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v10);

        v8 = (double)v9;
        objc_msgSend(v5, "duration");
        v9 += a4;
      }
      while (v11 > v8);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v12);

  }
  return v6;
}

- (id)_generateTimelapseOffsetsFromOffsets:(id)a3 forTimelapseDiff:(double)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "doubleValue", (_QWORD)v15);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12 - a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)imageGenerator:(id)a3 didGenerateImage:(id)a4 requestedTime:(id *)a5 actualTime:(id *)a6 forKey:(id)a7
{
  id v11;
  void *v12;
  double Seconds;
  double v14;
  double v15;
  void *v16;
  void *v17;
  CMTime v18;

  v11 = a4;
  -[HFCameraTimelapsePosterFrameGenerator _generationRequestForImageGenerator:withKey:](self, "_generationRequestForImageGenerator:withKey:", a3, a7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(CMTime *)a5;
  Seconds = CMTimeGetSeconds(&v18);
  objc_msgSend(v12, "timelapseOffset");
  *(float *)&v14 = Seconds + v14;
  v15 = roundf(*(float *)&v14);
  -[HFCameraTimelapsePosterFrameGenerator delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clip");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "didGeneratePosterFrame:forHighQualityClip:atOffset:withTimelapseOffset:", v11, v17, v15, Seconds);

}

- (void)imageGenerator:(id)a3 failedToGenerateImageForRequestedTime:(id *)a4 actualTime:(id *)a5 forKey:(id)a6
{
  void *v8;
  double Seconds;
  double v10;
  double v11;
  void *v12;
  void *v13;
  CMTime v14;

  -[HFCameraTimelapsePosterFrameGenerator _generationRequestForImageGenerator:withKey:](self, "_generationRequestForImageGenerator:withKey:", a3, a6, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(CMTime *)a4;
  Seconds = CMTimeGetSeconds(&v14);
  objc_msgSend(v8, "timelapseOffset");
  v11 = Seconds + v10;
  -[HFCameraTimelapsePosterFrameGenerator delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clip");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "failedToGeneratePosterFrameForHighQualityClip:atOffset:", v13, v11);

}

- (void)imageGenerator:(id)a3 finishedGeneratingImagesForKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HFCameraTimelapsePosterFrameGenerator generationQueue](self, "generationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__HFCameraTimelapsePosterFrameGenerator_imageGenerator_finishedGeneratingImagesForKey___block_invoke;
  v11[3] = &unk_1EA72BE50;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __87__HFCameraTimelapsePosterFrameGenerator_imageGenerator_finishedGeneratingImagesForKey___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_removeGenerationRequestForImageGenerator:withKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)_generationRequestForImageGenerator:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  -[HFCameraTimelapsePosterFrameGenerator posterFrameGenerationRequests](self, "posterFrameGenerationRequests");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__HFCameraTimelapsePosterFrameGenerator__generationRequestForImageGenerator_withKey___block_invoke;
    v12[3] = &unk_1EA73A958;
    v13 = v6;
    objc_msgSend(v9, "na_firstObjectPassingTest:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __85__HFCameraTimelapsePosterFrameGenerator__generationRequestForImageGenerator_withKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "imageGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_removeGenerationRequestForImageGenerator:(id)a3 withKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v12 = a4;
  -[HFCameraTimelapsePosterFrameGenerator posterFrameGenerationRequests](self, "posterFrameGenerationRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__HFCameraTimelapsePosterFrameGenerator__removeGenerationRequestForImageGenerator_withKey___block_invoke;
  v13[3] = &unk_1EA73A958;
  v14 = v6;
  v9 = v6;
  objc_msgSend(v8, "na_firstObjectPassingTest:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v8, "removeObject:", v10);
  if (!objc_msgSend(v8, "count"))
  {
    -[HFCameraTimelapsePosterFrameGenerator posterFrameGenerationRequests](self, "posterFrameGenerationRequests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v12);

  }
}

uint64_t __91__HFCameraTimelapsePosterFrameGenerator__removeGenerationRequestForImageGenerator_withKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "imageGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (HFCameraTimelapsePosterFrameGeneratorDelegate)delegate
{
  return (HFCameraTimelapsePosterFrameGeneratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HFCameraTimelapseClipInfoProvider)timelapseClipInfoProvider
{
  return (HFCameraTimelapseClipInfoProvider *)objc_loadWeakRetained((id *)&self->_timelapseClipInfoProvider);
}

- (void)setTimelapseClipInfoProvider:(id)a3
{
  objc_storeWeak((id *)&self->_timelapseClipInfoProvider, a3);
}

- (OS_dispatch_queue)generationQueue
{
  return self->_generationQueue;
}

- (void)setGenerationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_generationQueue, a3);
}

- (NSMutableDictionary)posterFrameGenerationRequests
{
  return self->_posterFrameGenerationRequests;
}

- (void)setPosterFrameGenerationRequests:(id)a3
{
  objc_storeStrong((id *)&self->_posterFrameGenerationRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterFrameGenerationRequests, 0);
  objc_storeStrong((id *)&self->_generationQueue, 0);
  objc_destroyWeak((id *)&self->_timelapseClipInfoProvider);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

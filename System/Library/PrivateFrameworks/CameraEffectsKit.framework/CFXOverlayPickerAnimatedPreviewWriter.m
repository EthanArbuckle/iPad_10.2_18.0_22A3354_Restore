@implementation CFXOverlayPickerAnimatedPreviewWriter

- (CFXOverlayPickerAnimatedPreviewWriter)initWithOverlayEffectId:(id)a3 previewSizeInPixels:(CGSize)a4 previewDuration:(double)a5 previewFrameRate:(unint64_t)a6 previewStartFrameIndex:(unint64_t)a7
{
  CGFloat height;
  CGFloat width;
  id v13;
  CFXOverlayPickerAnimatedPreviewWriter *v14;
  void *v15;
  uint64_t v16;
  JFXOverlayEffect *overlay;
  void *v18;
  uint64_t v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *writerQueue;
  CFXOverlayPickerAnimatedPreviewWriter *v22;
  NSObject *v23;
  objc_super v25;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CFXOverlayPickerAnimatedPreviewWriter;
  v14 = -[CFXOverlayPickerAnimatedPreviewWriter init](&v25, sel_init);
  if (!v14)
    goto LABEL_4;
  +[JFXEffectFactory sharedInstance](JFXEffectFactory, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createEffectForType:fromID:withProperties:", 2, v13, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  overlay = v14->_overlay;
  v14->_overlay = (JFXOverlayEffect *)v16;

  -[JFXEffect renderEffect](v14->_overlay, "renderEffect");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v14->_previewSizeInPixels.width = width;
    v14->_previewSizeInPixels.height = height;
    v19 = MEMORY[0x24BDC0D88];
    *(_OWORD *)&v14->_currentRenderTime.value = *MEMORY[0x24BDC0D88];
    v14->_currentRenderTime.epoch = *(_QWORD *)(v19 + 16);
    v14->_previewDuration = a5;
    v14->_previewFrameRate = a6;
    v14->_previewStartFrameIndex = a7;
    v14->_targetFrameCount = (unint64_t)-((double)a7 - (double)a6 * a5);
    -[CFXOverlayPickerAnimatedPreviewWriter CFX_initializeEffectForPreviewing](v14, "CFX_initializeEffectForPreviewing");
    v20 = dispatch_queue_create("OverlayPickerAnimatedPreviewWriter.writerQ", 0);
    writerQueue = v14->_writerQueue;
    v14->_writerQueue = (OS_dispatch_queue *)v20;

    v14->_currentFrameCount = 0;
    v14->_imageDestination = 0;
    ++s_PreviewRequestParentCodeCounter;
LABEL_4:
    v22 = v14;
    goto LABEL_8;
  }
  JFXLog_core();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    -[CFXOverlayPickerAnimatedPreviewWriter initWithOverlayEffectId:previewSizeInPixels:previewDuration:previewFrameRate:previewStartFrameIndex:].cold.1((uint64_t)v13, v23);

  v22 = 0;
LABEL_8:

  return v22;
}

- (void)CFX_initializeEffectForPreviewing
{
  void *v3;
  Float64 v4;
  CMTimeEpoch epoch;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  CMTimeEpoch v21;
  CMTime start;
  CGAffineTransform v23;
  CMTimeRange v24;
  CMTime duration;
  CMTimeRange v26;

  -[CFXOverlayPickerAnimatedPreviewWriter overlay](self, "overlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImageSequencePathToBundledAssets");

  -[CFXOverlayPickerAnimatedPreviewWriter previewDuration](self, "previewDuration");
  CMTimeMakeWithSeconds(&duration, v4, -[CFXOverlayPickerAnimatedPreviewWriter previewFrameRate](self, "previewFrameRate"));
  start = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  v19 = *(_OWORD *)&start.value;
  epoch = start.epoch;
  CMTimeRangeMake(&v26, &start, &duration);
  -[CFXOverlayPickerAnimatedPreviewWriter overlay](self, "overlay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "renderEffect");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v26;
  objc_msgSend(v7, "setEffectRange:", &v24);

  -[CFXOverlayPickerAnimatedPreviewWriter overlay](self, "overlay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXOverlayPickerAnimatedPreviewWriter previewSizeInPixels](self, "previewSizeInPixels");
  objc_msgSend(v8, "setRenderSize:");

  -[CFXOverlayPickerAnimatedPreviewWriter overlay](self, "overlay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enablePresentationState:", 1);

  -[CFXOverlayPickerAnimatedPreviewWriter previewSizeInPixels](self, "previewSizeInPixels");
  v11 = v10;
  -[CFXOverlayPickerAnimatedPreviewWriter previewSizeInPixels](self, "previewSizeInPixels");
  v13 = v12;
  -[CFXOverlayPickerAnimatedPreviewWriter overlay](self, "overlay");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&start.value = v19;
  start.epoch = epoch;
  objc_msgSend(v14, "applyScaleToFitFrame:withComponentTime:relativeRect:", &start, 0.0, 0.0, v11, v13, 0.0, 0.0, v11, v13);

  -[CFXOverlayPickerAnimatedPreviewWriter overlay](self, "overlay");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "pickerScale");
  v17 = v16;

  if (v17 != 1.0)
  {
    -[CFXOverlayPickerAnimatedPreviewWriter overlay](self, "overlay");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeScale(&v23, v17, v17);
    v20 = v19;
    v21 = epoch;
    objc_msgSend(v18, "addTransform:withComponentTime:relativeTo:basisOrigin:", &v23, &v20, 1, 0.0, 0.0, v11, v13);

  }
}

- (void)writeAnimatedPreviewToPath:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CFXOverlayPickerAnimatedPreviewWriter writerQueue](self, "writerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__CFXOverlayPickerAnimatedPreviewWriter_writeAnimatedPreviewToPath_completion___block_invoke;
  block[3] = &unk_24EE580F0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __79__CFXOverlayPickerAnimatedPreviewWriter_writeAnimatedPreviewToPath_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDestinationPath:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "CFX_beginWriting");
}

- (void)CFX_beginWriting
{
  NSObject *v3;
  _QWORD block[5];

  -[CFXOverlayPickerAnimatedPreviewWriter writerQueue](self, "writerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__CFXOverlayPickerAnimatedPreviewWriter_CFX_beginWriting__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(v3, block);

}

void __57__CFXOverlayPickerAnimatedPreviewWriter_CFX_beginWriting__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  __CFString *v3;
  const __CFURL *v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  JFXEffectsPreviewGenerator *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  uint64_t v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[2];
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[1])
    objc_msgSend(v2, "CFX_finishWriting");
  objc_msgSend((id)*MEMORY[0x24BDF84F8], "identifier");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = CGImageDestinationCreateWithURL(v4, v3, objc_msgSend(*(id *)(a1 + 32), "targetFrameCount"), 0);

  v5 = 1.0 / (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "previewFrameRate");
  v24 = *MEMORY[0x24BDD96B0];
  v6 = v24;
  v7 = *MEMORY[0x24BDD9290];
  v23[0] = &unk_24EE9BC90;
  v8 = *MEMORY[0x24BDD9298];
  v22[0] = v7;
  v22[1] = v8;
  v9 = v5;
  *(float *)&v5 = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  CGImageDestinationSetProperties(*(CGImageDestinationRef *)(*(_QWORD *)(a1 + 32) + 8), v12);
  v20 = v6;
  v18[0] = *MEMORY[0x24BDD9280];
  *(float *)&v13 = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = *MEMORY[0x24BDD9220];
  v19[0] = v14;
  v19[1] = &unk_24EE9C140;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setFrameProperties:", v16);

  v17 = objc_alloc_init(JFXEffectsPreviewGenerator);
  objc_msgSend(*(id *)(a1 + 32), "setPreviewGenerator:", v17);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setName:", CFSTR("AnimatedPreviewWriter"));
  if (objc_msgSend(*(id *)(a1 + 32), "targetFrameCount") != 1)
    objc_msgSend(*(id *)(a1 + 32), "setIsFirstAnimatedFrame:", 1);
  objc_msgSend(*(id *)(a1 + 32), "CFX_writeNextEffectFrame");

}

- (void)CFX_writeNextEffectFrame
{
  NSObject *v3;
  _QWORD block[5];

  -[CFXOverlayPickerAnimatedPreviewWriter writerQueue](self, "writerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__CFXOverlayPickerAnimatedPreviewWriter_CFX_writeNextEffectFrame__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(v3, block);

}

void __65__CFXOverlayPickerAnimatedPreviewWriter_CFX_writeNextEffectFrame__block_invoke(uint64_t a1)
{
  JFXEffectsPreviewGenerationRequest *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  JFXEffectsPreviewGenerationRequest *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id location;
  _QWORD v14[3];

  v2 = [JFXEffectsPreviewGenerationRequest alloc];
  objc_msgSend(*(id *)(a1 + 32), "overlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "previewSizeInPixels");
  v5 = v4;
  v7 = v6;
  v8 = *(void **)(a1 + 32);
  if (v8)
    objc_msgSend(v8, "currentRenderTime");
  else
    memset(v14, 0, sizeof(v14));
  v9 = -[JFXEffectsPreviewGenerationRequest initWithInputGenerator:effectStack:outputSize:renderTime:](v2, "initWithInputGenerator:effectStack:outputSize:renderTime:", v3, 0, v14, v5, v7);

  -[JFXEffectsPreviewGenerationRequest setParentCode:](v9, "setParentCode:", s_PreviewRequestParentCodeCounter);
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "previewGenerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__CFXOverlayPickerAnimatedPreviewWriter_CFX_writeNextEffectFrame__block_invoke_2;
  v11[3] = &unk_24EE5A888;
  objc_copyWeak(&v12, &location);
  v11[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v10, "generatePreviewRequest:completionHandler:", v9, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __65__CFXOverlayPickerAnimatedPreviewWriter_CFX_writeNextEffectFrame__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  JTImage *v7;
  CGImageDestination *v8;
  id v9;
  CGImage *v10;
  const __CFDictionary *v11;
  unint64_t v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int32_t v18;
  void *v19;
  CMTime *v20;
  CMTime v21;
  CMTime lhs;
  CMTime v23;
  CMTime v24;
  CMTime time;
  CMTime v26;
  __int128 v27;
  uint64_t v28;
  CMTime v29;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      objc_msgSend(v3, "objectEnumerator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nextObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = -[JTImage initWithPVImage:]([JTImage alloc], "initWithPVImage:", v6);

        if (v7)
        {
          v8 = *(CGImageDestination **)(*(_QWORD *)(a1 + 32) + 8);
          -[JTImage image](v7, "image");
          v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v10 = (CGImage *)objc_msgSend(v9, "CGImage");
          objc_msgSend(*(id *)(a1 + 32), "frameProperties");
          v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CGImageDestinationAddImage(v8, v10, v11);

          objc_msgSend(*(id *)(a1 + 32), "setCurrentFrameCount:", objc_msgSend(*(id *)(a1 + 32), "currentFrameCount") + 1);
          v12 = objc_msgSend(*(id *)(a1 + 32), "currentFrameCount");
          if (v12 >= objc_msgSend(*(id *)(a1 + 32), "targetFrameCount"))
          {
            objc_msgSend(*(id *)(a1 + 32), "CFX_finishWriting");
          }
          else
          {
            memset(&v29, 0, sizeof(v29));
            CMTimeMake(&v29, 1, objc_msgSend(*(id *)(a1 + 32), "previewFrameRate"));
            v13 = objc_msgSend(*(id *)(a1 + 32), "isFirstAnimatedFrame");
            v14 = *(void **)(a1 + 32);
            if (v13)
            {
              objc_msgSend(v14, "overlay");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "enablePresentationState:", 0);

              objc_msgSend(*(id *)(a1 + 32), "overlay");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setBuildInAnimation:", 1);

              v17 = *(void **)(a1 + 32);
              v27 = *MEMORY[0x24BDC0D88];
              v28 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
              objc_msgSend(v17, "setCurrentRenderTime:", &v27);
              objc_msgSend(*(id *)(a1 + 32), "setIsFirstAnimatedFrame:", 0);
              v18 = objc_msgSend(*(id *)(a1 + 32), "previewStartFrameIndex");
              time = v29;
              CMTimeMultiply(&v26, &time, v18);
              v19 = *(void **)(a1 + 32);
              v24 = v26;
              v20 = &v24;
            }
            else
            {
              if (v14)
                objc_msgSend(v14, "currentRenderTime");
              else
                memset(&lhs, 0, sizeof(lhs));
              time = v29;
              CMTimeAdd(&v23, &lhs, &time);
              v19 = *(void **)(a1 + 32);
              v21 = v23;
              v20 = &v21;
            }
            objc_msgSend(v19, "setCurrentRenderTime:", v20, *(_OWORD *)&v21.value, v21.epoch);
            objc_msgSend(WeakRetained, "CFX_writeNextEffectFrame");
          }

        }
      }
    }
  }

}

- (void)CFX_finishWriting
{
  NSObject *v3;
  _QWORD block[5];

  -[CFXOverlayPickerAnimatedPreviewWriter writerQueue](self, "writerQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CFXOverlayPickerAnimatedPreviewWriter_CFX_finishWriting__block_invoke;
  block[3] = &unk_24EE57B60;
  block[4] = self;
  dispatch_async(v3, block);

}

void __58__CFXOverlayPickerAnimatedPreviewWriter_CFX_finishWriting__block_invoke(uint64_t a1)
{
  CGImageDestination *v2;
  _BOOL8 v3;
  void *v4;
  void (**v5)(id, _BOOL8);

  v2 = *(CGImageDestination **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    v3 = CGImageDestinationFinalize(v2);
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 8));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setPreviewGenerator:", 0);
    objc_msgSend(*(id *)(a1 + 32), "completionBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "completionBlock");
      v5 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue();
      v5[2](v5, v3);

    }
  }
}

- (JFXOverlayEffect)overlay
{
  return self->_overlay;
}

- (void)setOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_overlay, a3);
}

- (CGSize)previewSizeInPixels
{
  double width;
  double height;
  CGSize result;

  width = self->_previewSizeInPixels.width;
  height = self->_previewSizeInPixels.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (void)setDestinationPath:(id)a3
{
  objc_storeStrong((id *)&self->_destinationPath, a3);
}

- (NSDictionary)frameProperties
{
  return self->_frameProperties;
}

- (void)setFrameProperties:(id)a3
{
  objc_storeStrong((id *)&self->_frameProperties, a3);
}

- (unint64_t)currentFrameCount
{
  return self->_currentFrameCount;
}

- (void)setCurrentFrameCount:(unint64_t)a3
{
  self->_currentFrameCount = a3;
}

- (unint64_t)previewFrameRate
{
  return self->_previewFrameRate;
}

- (void)setPreviewFrameRate:(unint64_t)a3
{
  self->_previewFrameRate = a3;
}

- (double)previewDuration
{
  return self->_previewDuration;
}

- (void)setPreviewDuration:(double)a3
{
  self->_previewDuration = a3;
}

- (unint64_t)previewStartFrameIndex
{
  return self->_previewStartFrameIndex;
}

- (void)setPreviewStartFrameIndex:(unint64_t)a3
{
  self->_previewStartFrameIndex = a3;
}

- (unint64_t)targetFrameCount
{
  return self->_targetFrameCount;
}

- (void)setTargetFrameCount:(unint64_t)a3
{
  self->_targetFrameCount = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentRenderTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 128);
  return self;
}

- (void)setCurrentRenderTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_currentRenderTime.epoch = a3->var3;
  *(_OWORD *)&self->_currentRenderTime.value = v3;
}

- (JFXEffectsPreviewGenerator)previewGenerator
{
  return self->_previewGenerator;
}

- (void)setPreviewGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_previewGenerator, a3);
}

- (OS_dispatch_queue)writerQueue
{
  return self->_writerQueue;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)isFirstAnimatedFrame
{
  return self->_isFirstAnimatedFrame;
}

- (void)setIsFirstAnimatedFrame:(BOOL)a3
{
  self->_isFirstAnimatedFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_writerQueue, 0);
  objc_storeStrong((id *)&self->_previewGenerator, 0);
  objc_storeStrong((id *)&self->_frameProperties, 0);
  objc_storeStrong((id *)&self->_destinationPath, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
}

- (void)initWithOverlayEffectId:(uint64_t)a1 previewSizeInPixels:(NSObject *)a2 previewDuration:previewFrameRate:previewStartFrameIndex:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2269A9000, a2, OS_LOG_TYPE_ERROR, "could not load effect id %@", (uint8_t *)&v2, 0xCu);
}

@end

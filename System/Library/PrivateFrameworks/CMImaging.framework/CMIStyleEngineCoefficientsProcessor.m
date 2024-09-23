@implementation CMIStyleEngineCoefficientsProcessor

- (CMIStyleEngineCoefficientsProcessor)initWithBufferCount:(unint64_t)a3 coefficientsSynchronization:(BOOL)a4 andOptionalMetalCommandQueue:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  CMIStyleEngineCoefficientsProcessor *v10;
  FigMetalContext *v11;
  void *v12;
  uint64_t v13;
  FigMetalContext *metalContext;
  void *v15;
  int v16;
  CMIStyleEngineCoefficientsFilter *v17;
  CMIStyleEngineCoefficientsFilter *coefficientsFilter;
  uint64_t v19;
  CMIMetalEventSynchronizer *metalSynchronizer;
  CMIStyleEngineCoefficientsRingBuffer *v21;
  CMIStyleEngineCoefficientsRingBuffer *inputCoefficientsRing;
  double v23;
  double v24;
  CMIStyleEngineCoefficientsProcessor *v25;
  objc_super v27;
  uint64_t v28;
  _QWORD v29[2];

  v5 = a4;
  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  +[CMISmartStyleCommonSettings tuningParametersForVariant:](CMISmartStyleCommonSettings, "tuningParametersForVariant:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)CMIStyleEngineCoefficientsProcessor;
  v10 = -[CMIStyleEngineCoefficientsProcessor init](&v27, sel_init);
  if (!v10)
    goto LABEL_11;
  v11 = [FigMetalContext alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:](v11, "initWithbundle:andOptionalCommandQueue:", v12, v8);
  metalContext = v10->_metalContext;
  v10->_metalContext = (FigMetalContext *)v13;

  if (!v10->_metalContext)
    goto LABEL_11;
  v28 = *MEMORY[0x1E0CA8F38];
  v29[0] = &unk_1E9513A38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  -[FigMetalContext device](v10->_metalContext, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CVMetalBufferCacheCreate();

  if (v16)
    goto LABEL_11;
  v17 = -[CMIStyleEngineCoefficientsFilter initWithMetalContext:]([CMIStyleEngineCoefficientsFilter alloc], "initWithMetalContext:", v10->_metalContext);
  coefficientsFilter = v10->_coefficientsFilter;
  v10->_coefficientsFilter = v17;

  if (!v10->_coefficientsFilter)
    goto LABEL_11;
  if (v5)
  {
    +[CMIMetalEventSynchronizer getSharedInstance](CMIMetalEventSynchronizer, "getSharedInstance");
    v19 = objc_claimAutoreleasedReturnValue();
    metalSynchronizer = v10->_metalSynchronizer;
    v10->_metalSynchronizer = (CMIMetalEventSynchronizer *)v19;

    if (!v10->_metalSynchronizer)
      goto LABEL_11;
  }
  v21 = -[CMIStyleEngineCoefficientsRingBuffer initWithCapacity:]([CMIStyleEngineCoefficientsRingBuffer alloc], "initWithCapacity:", a3);
  inputCoefficientsRing = v10->_inputCoefficientsRing;
  v10->_inputCoefficientsRing = v21;

  if (!v10->_inputCoefficientsRing)
    goto LABEL_11;
  objc_msgSend(v9, "coefficientsFilteringHalfWindowTime");
  FigGetCFPreferenceDoubleWithDefault();
  v24 = v23 + 2.22044605e-16;
  v10->_filterTimeWindow = v24;
  if (v24 >= 0.0)
  {
    v25 = v10;
  }
  else
  {
LABEL_11:
    FigDebugAssert3();
    v25 = 0;
  }

  return v25;
}

- (int)enqueueCoefficientsForFiltering:(__CVBuffer *)a3 withMetadata:(id)a4 pts:(id *)a5
{
  id v8;
  CGSize v9;
  CoefficientsRingData *v10;
  int v11;
  CMIMetalEventSynchronizer *metalSynchronizer;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  CMTime time;
  CGRect rect;
  id v20;

  v8 = a4;
  v20 = 0;
  v9 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  rect.size = v9;
  v10 = objc_alloc_init(CoefficientsRingData);
  if (!v10)
    goto LABEL_9;
  v11 = -[CMIStyleEngineCoefficientsProcessor _bindPixelBuffer:toBuffer:](self, "_bindPixelBuffer:toBuffer:", a3, &v20);
  if (v11)
  {
    v16 = v11;
    FigDebugAssert3();
    goto LABEL_6;
  }
  metalSynchronizer = self->_metalSynchronizer;
  -[FigMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMIMetalEventSynchronizer waitForEventOnCommandBuffer:forResource:](metalSynchronizer, "waitForEventOnCommandBuffer:forResource:", v13, v20);

  -[CoefficientsRingData setCoefficients:](v10, "setCoefficients:", v20);
  -[CoefficientsRingData setCoefficientsPixelBuffer:](v10, "setCoefficientsPixelBuffer:", a3);
  time = (CMTime)*a5;
  -[CoefficientsRingData setPts:](v10, "setPts:", CMTimeGetSeconds(&time));
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06DE8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoefficientsRingData setSensorID:](v10, "setSensorID:", objc_msgSend(v14, "intValue"));

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D060D8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (!CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v15, &rect))
    {
LABEL_9:
      FigDebugAssert3();
      v16 = -12780;
      goto LABEL_6;
    }
  }
  -[CoefficientsRingData setLearnedRect:](v10, "setLearnedRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
  -[CMIStyleEngineCoefficientsRingBuffer add:](self->_inputCoefficientsRing, "add:", v10);
  v16 = 0;
LABEL_6:

  return v16;
}

- (int)filterCoefficientsForFrameWithMetadata:(id)a3 pts:(id *)a4 filterType:(unint64_t)a5 toPixelBuffer:(__CVBuffer *)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7;

  v7 = *a4;
  return -[CMIStyleEngineCoefficientsProcessor filterCoefficientsForFrameWithMetadata:pts:filterType:toPixelBuffer:toGlobalRemixFactor:](self, "filterCoefficientsForFrameWithMetadata:pts:filterType:toPixelBuffer:toGlobalRemixFactor:", a3, &v7, a5, a6, 0);
}

- (int)filterCoefficientsForFrameWithMetadata:(id)a3 pts:(id *)a4 filterType:(unint64_t)a5 toPixelBuffer:(__CVBuffer *)a6 toGlobalRemixFactor:(float *)a7
{
  id v12;
  double Seconds;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  CMIStyleEngineCoefficientsRingBuffer *filteredCoefficientsRing;
  CMIStyleEngineCoefficientsRingBuffer *v24;
  uint64_t v25;
  CMIStyleEngineCoefficientsRingBuffer *v26;
  CMIStyleEngineCoefficientsRingBuffer *v27;
  uint64_t v28;
  void *v29;
  int v30;
  int v31;
  CoefficientsRingData *v32;
  CoefficientsRingData *v33;
  void *v34;
  double v35;
  CMTime time;
  id v38;

  v12 = a3;
  time = *(CMTime *)a4;
  v38 = 0;
  Seconds = CMTimeGetSeconds(&time);
  v14 = -[CMIStyleEngineCoefficientsProcessor _bindPixelBuffer:toBuffer:](self, "_bindPixelBuffer:toBuffer:", a6, &v38);
  if (v14)
  {
    v19 = v14;
    FigDebugAssert3();
    goto LABEL_27;
  }
  if (a5 - 1 <= 1)
  {
    -[CMIStyleEngineCoefficientsRingBuffer getFramesDataWindowFrom:to:shouldRemoveOldData:](self->_inputCoefficientsRing, "getFramesDataWindowFrom:to:shouldRemoveOldData:", 0, Seconds - self->_filterTimeWindow, Seconds + self->_filterTimeWindow);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "window");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
      {
        v19 = -[CMIStyleEngineCoefficientsFilter filterCoefficientsFIR:forPts:to:](self->_coefficientsFilter, "filterCoefficientsFIR:forPts:to:", v16, v38, Seconds);
        if (v19)
          FigDebugAssert3();
        goto LABEL_26;
      }
    }
    goto LABEL_29;
  }
  if (a5 - 3 <= 1)
  {
    -[CMIStyleEngineCoefficientsRingBuffer getFramesDataWindowFrom:to:shouldRemoveOldData:](self->_inputCoefficientsRing, "getFramesDataWindowFrom:to:shouldRemoveOldData:", 1, Seconds - self->_filterTimeWindow, Seconds + self->_filterTimeWindow);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v20;
    if (v20)
    {
      objc_msgSend(v20, "window");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

      if (v22)
      {
        filteredCoefficientsRing = self->_filteredCoefficientsRing;
        if (!filteredCoefficientsRing)
        {
          v24 = [CMIStyleEngineCoefficientsRingBuffer alloc];
          v25 = a5 == 3 ? 1 : 2;
          v26 = -[CMIStyleEngineCoefficientsRingBuffer initWithCapacity:](v24, "initWithCapacity:", v25);
          v27 = self->_filteredCoefficientsRing;
          self->_filteredCoefficientsRing = v26;

          filteredCoefficientsRing = self->_filteredCoefficientsRing;
          if (!filteredCoefficientsRing)
          {
            FigDebugAssert3();
LABEL_25:
            v19 = 0;
LABEL_26:

            goto LABEL_27;
          }
        }
        -[CMIStyleEngineCoefficientsRingBuffer getFramesDataWindowFrom:to:shouldRemoveOldData:](filteredCoefficientsRing, "getFramesDataWindowFrom:to:shouldRemoveOldData:", 1, 0.0, Seconds);
        v28 = objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v29 = (void *)v28;
          v30 = -[CMIStyleEngineCoefficientsFilter filterCoefficientsIIR:filteredDataWindow:filterType:to:](self->_coefficientsFilter, "filterCoefficientsIIR:filteredDataWindow:filterType:to:", v16, v28, a5, v38);
          if (v30)
          {
            v19 = v30;
          }
          else
          {
            if (!a7
              || (v31 = -[CMIStyleEngineCoefficientsFilter _calculateGlobalRemixFactorForWindow:filteredWindow:remixFactor:](self->_coefficientsFilter, "_calculateGlobalRemixFactorForWindow:filteredWindow:remixFactor:", v16, v29, a7)) == 0)
            {
              v32 = objc_alloc_init(CoefficientsRingData);
              if (!v32)
              {
                FigDebugAssert3();

                v19 = -12780;
                goto LABEL_26;
              }
              v33 = v32;
              -[CoefficientsRingData setCoefficients:](v32, "setCoefficients:", v38);
              -[CoefficientsRingData setCoefficientsPixelBuffer:](v33, "setCoefficientsPixelBuffer:", a6);
              -[CoefficientsRingData setPts:](v33, "setPts:", Seconds);
              objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D06DE8]);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              -[CoefficientsRingData setSensorID:](v33, "setSensorID:", objc_msgSend(v34, "intValue"));

              if (a7)
                v35 = *a7;
              else
                v35 = 0.0;
              -[CoefficientsRingData setGlobalRemixFactor:](v33, "setGlobalRemixFactor:", v35);
              -[CMIStyleEngineCoefficientsRingBuffer add:](self->_filteredCoefficientsRing, "add:", v33);

              goto LABEL_25;
            }
            v19 = v31;
          }
          FigDebugAssert3();

          goto LABEL_26;
        }
      }
    }
LABEL_29:
    FigDebugAssert3();
    v19 = FigSignalErrorAt();
    goto LABEL_26;
  }
  FigDebugAssert3();
  v19 = FigSignalErrorAt();
LABEL_27:

  return v19;
}

- (int)finishProcessing
{
  -[FigMetalContext waitForIdle](self->_metalContext, "waitForIdle");
  return 0;
}

- (int)purgeResources
{
  -[CMIStyleEngineCoefficientsRingBuffer releaseResources](self->_inputCoefficientsRing, "releaseResources");
  -[CMIStyleEngineCoefficientsRingBuffer releaseResources](self->_filteredCoefficientsRing, "releaseResources");
  CVMetalBufferCacheFlush();
  return 0;
}

- (void)reset
{
  -[CMIStyleEngineCoefficientsFilter reset](self->_coefficientsFilter, "reset");
  -[CMIStyleEngineCoefficientsProcessor purgeResources](self, "purgeResources");
}

- (void)dealloc
{
  __CVMetalBufferCache *bufferCache;
  objc_super v4;

  -[CMIStyleEngineCoefficientsProcessor purgeResources](self, "purgeResources");
  bufferCache = self->_bufferCache;
  if (bufferCache)
    CFRelease(bufferCache);
  v4.receiver = self;
  v4.super_class = (Class)CMIStyleEngineCoefficientsProcessor;
  -[CMIStyleEngineCoefficientsProcessor dealloc](&v4, sel_dealloc);
}

- (int)_bindPixelBuffer:(__CVBuffer *)a3 toBuffer:(id *)a4
{
  void *v5;
  id v6;

  CVMetalBufferCacheFlush();
  if (!CVMetalBufferCacheCreateBufferFromImage())
  {
    CVMetalBufferGetBuffer();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *a4;
    *a4 = v5;

    if (*a4)
    {
      if ((IOSurfaceGetBytesPerRow((IOSurfaceRef)objc_msgSend(*a4, "iosurface")) & 0x3F) == 0)
        return 0;
    }
  }
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (BOOL)shouldShutdown
{
  return self->_shouldShutdown;
}

- (void)setShouldShutdown:(BOOL)a3
{
  self->_shouldShutdown = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalSynchronizer, 0);
  objc_storeStrong((id *)&self->_coefficientsFilter, 0);
  objc_storeStrong((id *)&self->_filteredCoefficientsRing, 0);
  objc_storeStrong((id *)&self->_inputCoefficientsRing, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end

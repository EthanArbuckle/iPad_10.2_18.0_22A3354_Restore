@implementation AXMAVCaptureSessionNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)title
{
  return CFSTR("Capture Session");
}

- (void)setShouldProcessRemotely:(BOOL)a3
{
  objc_super v3;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("AXMAVCaptureSessionNode does not support remote triggering"));
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)AXMAVCaptureSessionNode;
    -[AXMSourceNode setShouldProcessRemotely:](&v3, sel_setShouldProcessRemotely_);
  }
}

- (void)produceImage:(id)a3
{
  objc_msgSend(a3, "produceImage:", &__block_literal_global_8);
}

uint64_t __40__AXMAVCaptureSessionNode_produceImage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("input"));
}

- (void)nodeInitialize
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AXMAVCaptureSessionNode;
  -[AXMSourceNode nodeInitialize](&v2, sel_nodeInitialize);
}

- (void)autoTriggerVideoFrameEventsWithAVCaptureSession:(id)a3 options:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *autotrigger_queue;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (!self->_autotrigger_queue)
  {
    v10 = (OS_dispatch_queue *)dispatch_queue_create("AXMAVCaptureSessionNode-avkit-queue", 0);
    autotrigger_queue = self->_autotrigger_queue;
    self->_autotrigger_queue = v10;

  }
  -[AXMAVCaptureSessionNode setCaptureSessionNodeDelegate:](self, "setCaptureSessionNodeDelegate:", v9);
  -[AXMAVCaptureSessionNode setAnalysisOptions:](self, "setAnalysisOptions:", v8);
  -[AXMAVCaptureSessionNode beginFrameEventsWithAVCaptureSession:delegate:queue:](self, "beginFrameEventsWithAVCaptureSession:delegate:queue:", v12, self, self->_autotrigger_queue);

}

- (AXMCaptureVideoDataOutput)axVideoDataOutput
{
  AXMCaptureVideoDataOutput *axVideoDataOutput;
  AXMCaptureVideoDataOutput *v4;
  AXMCaptureVideoDataOutput *v5;

  axVideoDataOutput = self->_axVideoDataOutput;
  if (!axVideoDataOutput)
  {
    v4 = objc_alloc_init(AXMCaptureVideoDataOutput);
    v5 = self->_axVideoDataOutput;
    self->_axVideoDataOutput = v4;

    -[AVCaptureVideoDataOutput setAutomaticallyConfiguresOutputBufferDimensions:](self->_axVideoDataOutput, "setAutomaticallyConfiguresOutputBufferDimensions:", 0);
    -[AVCaptureVideoDataOutput setDeliversPreviewSizedOutputBuffers:](self->_axVideoDataOutput, "setDeliversPreviewSizedOutputBuffers:", 1);
    axVideoDataOutput = self->_axVideoDataOutput;
  }
  return axVideoDataOutput;
}

- (void)addVideoDataOutputWithAVCaptureSession:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v6 = a3;
  v7 = a4;
  -[AXMAVCaptureSessionNode axVideoDataOutput](self, "axVideoDataOutput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSampleBufferDelegate:queue:", self, v7);

  -[AXMAVCaptureSessionNode axVideoDataOutput](self, "axVideoDataOutput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v6, "canAddOutput:", v9);

  if ((_DWORD)v8)
  {
    -[AXMAVCaptureSessionNode axVideoDataOutput](self, "axVideoDataOutput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addOutput:", v10);

    -[AXMAVCaptureSessionNode setCaptureSession:](self, "setCaptureSession:", v6);
    -[AXMVisionEngineNode delegate](self, "delegate");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject captureSessionNodeDidBeginProcessingFrames:](v11, "captureSessionNodeDidBeginProcessingFrames:", self);
  }
  else
  {
    AXMediaLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AXMAVCaptureSessionNode addVideoDataOutputWithAVCaptureSession:queue:].cold.1((id *)&self->super.super.super.isa, v11);
  }

}

- (void)beginFrameEventsWithAVCaptureSession:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id WeakRetained;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    -[AXMAVCaptureSessionNode captureSession](self, "captureSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      AXMediaLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[AXMAVCaptureSessionNode beginFrameEventsWithAVCaptureSession:delegate:queue:].cold.1(v12);
    }
    else
    {
      -[AXMAVCaptureSessionNode setFrameDelegate:](self, "setFrameDelegate:", v9);
      objc_msgSend(v8, "outputs");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject ax_filteredArrayUsingBlock:](v12, "ax_filteredArrayUsingBlock:", &__block_literal_global_27_1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {
        AXMediaLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_captureSession);
          objc_msgSend(v13, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412546;
          v18 = WeakRetained;
          v19 = 2112;
          v20 = v16;
          _os_log_impl(&dword_1B0E3B000, v14, OS_LOG_TYPE_DEFAULT, "Capture session '%@' already has output '%@'", (uint8_t *)&v17, 0x16u);

        }
      }
      else
      {
        -[AXMAVCaptureSessionNode addVideoDataOutputWithAVCaptureSession:queue:](self, "addVideoDataOutputWithAVCaptureSession:queue:", v8, v10);
      }

    }
  }

}

uint64_t __79__AXMAVCaptureSessionNode_beginFrameEventsWithAVCaptureSession_delegate_queue___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)endAutoTriggerOfVideoFrameEvents
{
  -[AXMAVCaptureSessionNode endVideoFrameEvents](self, "endVideoFrameEvents");
  -[AXMAVCaptureSessionNode setCaptureSessionNodeDelegate:](self, "setCaptureSessionNodeDelegate:", 0);
}

- (void)endVideoFrameEvents
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[AXMAVCaptureSessionNode captureSession](self, "captureSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v3, "outputs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
        objc_msgSend(v16, "setSampleBufferDelegate:queue:", 0, 0, (_QWORD)v18);
        objc_msgSend(v3, "removeOutput:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v13);
  }

  -[AXMAVCaptureSessionNode setFrameDelegate:](self, "setFrameDelegate:", 0);
  -[AXMAVCaptureSessionNode setCaptureSession:](self, "setCaptureSession:", 0);
  -[AXMVisionEngineNode delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "captureSessionNodeDidEndProcessingFrames:", self);

}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a5;
  if (a4)
  {
    -[AXMVisionEngineNode delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "engineWillAcceptTiggerWithSource:", self);

    if (v10)
    {
      if (CMSampleBufferGetImageBuffer(a4))
      {
        -[AXMAVCaptureSessionNode frameDelegate](self, "frameDelegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "captureSessionNode:didOutputSampleBuffer:fromConnection:", self, a4, v8);

      }
    }
  }

}

- (void)triggerWithSampleBuffer:(opaqueCMSampleBuffer *)a3 interfaceOrientation:(int64_t)a4 mirrored:(BOOL)a5 options:(id)a6 userContext:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  CVImageBufferRef ImageBuffer;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v8 = a5;
  v22[2] = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (ImageBuffer)
  {
    +[AXMPixelBufferWrapper wrapperWithPixelBuffer:orientation:](AXMPixelBufferWrapper, "wrapperWithPixelBuffer:orientation:", ImageBuffer, AXMEXIFOrientationFromInterfaceOrientation(a4, v8));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXMPipelineContextInput inputWithPixelBuffer:](AXMPipelineContextInput, "inputWithPixelBuffer:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = CFSTR("input");
    v21[1] = CFSTR("diagnosticsEnabled");
    v22[0] = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXMVisionEngineNode areDiagnosticsEnabled](self, "areDiagnosticsEnabled"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXMVisionPipelineContext contextWithSourceParameters:options:](AXMVisionPipelineContext, "contextWithSourceParameters:options:", v18, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setShouldCallCompletionHandlersForEmptyResultSet:", 1);
    objc_msgSend(v19, "setUserContext:", v13);
    -[AXMSourceNode triggerWithContext:cacheKey:resultHandler:](self, "triggerWithContext:cacheKey:resultHandler:", v19, 0, 0);
    -[AXMVisionEngineNode delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "captureSessionNodeWillProcessFrame:", self);

  }
}

- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v6;

  -[AXMVisionEngineNode delegate](self, "delegate", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "captureSessionNodeDidDropFrame:", self);

}

- (void)captureSessionNode:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  _BOOL8 v10;
  void *v11;
  id v12;

  v7 = a5;
  -[AXMAVCaptureSessionNode captureSessionNodeDelegate](self, "captureSessionNodeDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "interfaceOrientationForCaptureSessionNode:", self);

  +[AXMAVUtilities videoDeviceFromConnection:](AXMAVUtilities, "videoDeviceFromConnection:", v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v10 = +[AXMAVUtilities isMirroredVideoDevice:](AXMAVUtilities, "isMirroredVideoDevice:", v12);
  -[AXMAVCaptureSessionNode analysisOptions](self, "analysisOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMAVCaptureSessionNode triggerWithSampleBuffer:interfaceOrientation:mirrored:options:userContext:](self, "triggerWithSampleBuffer:interfaceOrientation:mirrored:options:userContext:", a4, v9, v10, v11, 0);

}

- (void)setAxVideoDataOutput:(id)a3
{
  objc_storeStrong((id *)&self->_axVideoDataOutput, a3);
}

- (AXMAVCaptureSessionNodeDelegate)captureSessionNodeDelegate
{
  return (AXMAVCaptureSessionNodeDelegate *)objc_loadWeakRetained((id *)&self->_captureSessionNodeDelegate);
}

- (void)setCaptureSessionNodeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_captureSessionNodeDelegate, a3);
}

- (AXMAVCaptureSessionNodeFrameDelegate)frameDelegate
{
  return (AXMAVCaptureSessionNodeFrameDelegate *)objc_loadWeakRetained((id *)&self->_frameDelegate);
}

- (void)setFrameDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_frameDelegate, a3);
}

- (AVCaptureSession)captureSession
{
  return (AVCaptureSession *)objc_loadWeakRetained((id *)&self->_captureSession);
}

- (void)setCaptureSession:(id)a3
{
  objc_storeWeak((id *)&self->_captureSession, a3);
}

- (AXMVisionAnalysisOptions)analysisOptions
{
  return self->_analysisOptions;
}

- (void)setAnalysisOptions:(id)a3
{
  objc_storeStrong((id *)&self->_analysisOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisOptions, 0);
  objc_destroyWeak((id *)&self->_captureSession);
  objc_destroyWeak((id *)&self->_frameDelegate);
  objc_destroyWeak((id *)&self->_captureSessionNodeDelegate);
  objc_storeStrong((id *)&self->_axVideoDataOutput, 0);
  objc_storeStrong((id *)&self->_autotrigger_queue, 0);
}

- (void)addVideoDataOutputWithAVCaptureSession:(id *)a1 queue:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  void *v4;
  id WeakRetained;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "axVideoDataOutput");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained(a1 + 11);
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = WeakRetained;
  _os_log_error_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_ERROR, "Cannot add output '%@' to session '%@'", (uint8_t *)&v6, 0x16u);

}

- (void)beginFrameEventsWithAVCaptureSession:(os_log_t)log delegate:queue:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_FAULT, "AXMAVCaptureSessionNode already has a AVCaptureSession attached", v1, 2u);
}

@end

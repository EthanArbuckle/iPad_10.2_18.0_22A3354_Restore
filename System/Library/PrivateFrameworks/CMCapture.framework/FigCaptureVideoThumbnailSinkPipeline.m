@implementation FigCaptureVideoThumbnailSinkPipeline

- (uint64_t)imageQueueSinkNode
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (void)setDiscardsSampleData:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  NSObject *notificationQueue;
  objc_super v7;
  _QWORD block[5];

  v3 = a3;
  v5 = -[FigCaptureSinkPipeline discardsSampleData](self, "discardsSampleData");
  v7.receiver = self;
  v7.super_class = (Class)FigCaptureVideoThumbnailSinkPipeline;
  -[FigCaptureSinkPipeline setDiscardsSampleData:](&v7, sel_setDiscardsSampleData_, v3);
  if (!v5 && v3)
  {
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __vtsp_invalidateThumbnailSinkContentsIfNeeded_block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = self;
    dispatch_sync(notificationQueue, block);
  }
}

- (uint64_t)_buildVideoFilterThumbnailPipeline:(uint64_t)a3 videoSourceOutput:(uint64_t)a4 videoSourceTransform:(uint64_t)a5 outputTransform:(unint64_t)a6 videoThumbnailConnectionConfiguration:(uint64_t)a7 maxLossyCompressionLevel:(void *)a8 clientAuditToken:(unsigned int)a9
{
  BWPipelineStage *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  float v23;
  float v24;
  BWPixelTransferNode *v25;
  BOOL v26;
  unint64_t v27;
  int v28;
  uint64_t v29;
  BWMultiFilterThumbnailNode *v30;
  uint64_t v31;
  BWImageQueueSinkNode *v32;
  uint64_t v33;
  __int128 v34;
  BWImageQueueSinkNode *v35;
  objc_super v37;
  _QWORD v38[5];
  _OWORD v39[2];
  objc_super v40;
  objc_super v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v43 = a4;
  v44 = a5;
  if (a1)
  {
    v42 = 0;
    v16 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName((uint64_t)CFSTR("com.apple.coremedia.capture.preview.thumbnails"), (void *)objc_msgSend(a8, "sourceConfiguration")), 6);
    v17 = (void *)objc_msgSend(a8, "thumbnailSinkConfiguration");
    if (v17)
    {
      objc_msgSend(v17, "thumbnailSize");
      *(float *)&v18 = v18 * 0.5;
      v19 = (double)(uint64_t)(2 * llroundf(*(float *)&v18));
      *(float *)&v18 = v20 * 0.5;
      v21 = (double)(uint64_t)(2 * llroundf(*(float *)&v18));
    }
    else
    {
      v19 = *MEMORY[0x1E0C9D820];
      v21 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    v22 = v19;
    v23 = v21;
    v24 = v22 / v23;
    v25 = objc_alloc_init(BWPixelTransferNode);
    -[BWNode setName:](v25, "setName:", CFSTR("Video Filter Thumbs Downscaler"));
    if (v43)
      v26 = 0;
    else
      v26 = v44 == 0;
    if (v26)
    {
      v27 = HIDWORD(a6);
      v28 = FigCaptureTransformFlipAppliedBeforeRotationToAfter(a6 & 1, SHIDWORD(a6));
      -[BWPixelTransferNode setFlipHorizontal:](v25, "setFlipHorizontal:", v28 == 1);
      -[BWPixelTransferNode setFlipVertical:](v25, "setFlipVertical:", v28 == 2);
      -[BWPixelTransferNode setRotationDegrees:](v25, "setRotationDegrees:", v27);
    }
    -[BWPixelTransferNode setInputCropRect:](v25, "setInputCropRect:", FigCaptureMakeRectWithAspectRatioInsideDimensions(a7, 0, v24));
    -[BWPixelTransferNode setCropMode:](v25, "setCropMode:", 0);
    -[BWPixelTransferNode setAppliesPrimaryCaptureRect:](v25, "setAppliesPrimaryCaptureRect:", 1);
    -[BWPixelTransferNode setOutputWidth:](v25, "setOutputWidth:", (unint64_t)v19);
    -[BWPixelTransferNode setOutputHeight:](v25, "setOutputHeight:", (unint64_t)v21);
    -[BWPixelTransferNode setMaxLossyCompressionLevel:](v25, "setMaxLossyCompressionLevel:", a9);
    v41.receiver = a1;
    v41.super_class = (Class)FigCaptureVideoThumbnailSinkPipeline;
    if ((objc_msgSendSuper2(&v41, sel_addNode_error_, v25, &v42) & 1) != 0
      && (a1[6] = v25,
          (objc_msgSend(a2, "connectOutput:toInput:pipelineStage:", a3, -[BWNode input](v25, "input"), v16) & 1) != 0))
    {
      v29 = -[BWNode output](v25, "output");
      v30 = -[BWMultiFilterThumbnailNode initWithFilters:thumbnailSize:maxLossyCompressionLevel:]([BWMultiFilterThumbnailNode alloc], "initWithFilters:thumbnailSize:maxLossyCompressionLevel:", objc_msgSend((id)objc_msgSend(a8, "thumbnailSinkConfiguration"), "filters"), a9, v19, v21);
      -[BWNode setName:](v30, "setName:", CFSTR("Video Filter Thumb Render"));
      v40.receiver = a1;
      v40.super_class = (Class)FigCaptureVideoThumbnailSinkPipeline;
      if ((objc_msgSendSuper2(&v40, sel_addNode_error_, v30, &v42) & 1) != 0
        && (objc_msgSend(a2, "connectOutput:toInput:pipelineStage:", v29, -[BWNode input](v30, "input"), v16) & 1) != 0)
      {
        v31 = -[BWNode output](v30, "output");
        v32 = [BWImageQueueSinkNode alloc];
        v33 = objc_msgSend(a1, "sinkID");
        v34 = a10[1];
        v39[0] = *a10;
        v39[1] = v34;
        v35 = -[BWImageQueueSinkNode initWithHFRSupport:ispJitterCompensationEnabled:clientAuditToken:sinkID:](v32, "initWithHFRSupport:ispJitterCompensationEnabled:clientAuditToken:sinkID:", 0, 0, v39, v33);
        -[BWNode setName:](v35, "setName:", CFSTR("Video Filter Thumbs Sink"));
        -[BWImageQueueSinkNode setPreviewTapDelegate:](v35, "setPreviewTapDelegate:", a1);
        -[BWImageQueueSinkNode setMaxLossyCompressionLevel:](v35, "setMaxLossyCompressionLevel:", a9);
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __210__FigCaptureVideoThumbnailSinkPipeline__buildVideoFilterThumbnailPipeline_videoSourceOutput_videoSourceTransform_outputTransform_videoThumbnailConnectionConfiguration_maxLossyCompressionLevel_clientAuditToken___block_invoke;
        v38[3] = &unk_1E491E720;
        v38[4] = a1;
        -[BWSinkNode notifyWhenIdle:](v35, "notifyWhenIdle:", v38);
        v37.receiver = a1;
        v37.super_class = (Class)FigCaptureVideoThumbnailSinkPipeline;
        if ((objc_msgSendSuper2(&v37, sel_addNode_error_, v35, &v42) & 1) != 0)
        {
          a1[7] = v35;
          if ((objc_msgSend(a2, "connectOutput:toInput:pipelineStage:", v31, -[BWNode input](v35, "input"), v16) & 1) != 0)
            return 0;
        }
        fig_log_get_emitter();
      }
      else
      {
        fig_log_get_emitter();
      }
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
  }
  return 0;
}

void __210__FigCaptureVideoThumbnailSinkPipeline__buildVideoFilterThumbnailPipeline_videoSourceOutput_videoSourceTransform_outputTransform_videoThumbnailConnectionConfiguration_maxLossyCompressionLevel_clientAuditToken___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 64);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __vtsp_invalidateThumbnailSinkContentsIfNeeded_block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = v1;
  dispatch_sync(v2, block);
}

- (_QWORD)initWithGraph:(uint64_t)a3 name:(uint64_t)a4 videoSourceOutput:(uint64_t)a5 videoSourceTransform:(uint64_t)a6 outputTransform:(unint64_t)a7 videoThumbnailConnectionConfiguration:(uint64_t)a8 maxLossyCompressionLevel:(void *)a9 clientAuditToken:(unsigned int)a10 notificationDelegate:(_OWORD *)a11
{
  _QWORD *v17;
  __int128 v18;
  _OWORD v21[2];
  objc_super v22;
  objc_super v23;

  if (!a1)
    return 0;
  v23.receiver = a1;
  v23.super_class = (Class)FigCaptureVideoThumbnailSinkPipeline;
  v17 = objc_msgSendSuper2(&v23, sel_initWithGraph_name_sinkID_, a2, a3, objc_msgSend((id)objc_msgSend(a9, "sinkConfiguration"), "sinkID"));
  if (v17)
  {
    if (a9)
    {
      v17[8] = FigDispatchQueueCreateWithPriority();
      v17[10] = a12;
      v22.receiver = v17;
      v22.super_class = (Class)FigCaptureVideoThumbnailSinkPipeline;
      objc_msgSendSuper2(&v22, sel_setUpstreamOutput_, a4);
      v17[11] = (id)objc_msgSend((id)objc_msgSend(a9, "sourceConfiguration"), "sourceID");
      *((_DWORD *)v17 + 24) = objc_msgSend(a9, "underlyingDeviceType");
      v18 = a11[1];
      v21[0] = *a11;
      v21[1] = v18;
      -[FigCaptureVideoThumbnailSinkPipeline _buildVideoFilterThumbnailPipeline:videoSourceOutput:videoSourceTransform:outputTransform:videoThumbnailConnectionConfiguration:maxLossyCompressionLevel:clientAuditToken:](v17, a2, a4, a5, a6, a7, a8, a9, a10, v21);
      return v17;
    }
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  return v17;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  NSObject *notificationQueue;
  objc_super v4;

  notificationQueue = self->_notificationQueue;
  if (notificationQueue)
    dispatch_release(notificationQueue);

  v4.receiver = self;
  v4.super_class = (Class)FigCaptureVideoThumbnailSinkPipeline;
  -[FigCaptureSinkPipeline dealloc](&v4, sel_dealloc);
}

- (void)imageQueueSinkNode:(id)a3 didAttemptToEnqueuePreviewSampleBuffer:(opaqueCMSampleBuffer *)a4 withSuccess:(BOOL)a5
{
  NSObject *notificationQueue;
  _QWORD v6[6];

  notificationQueue = self->_notificationQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __110__FigCaptureVideoThumbnailSinkPipeline_imageQueueSinkNode_didAttemptToEnqueuePreviewSampleBuffer_withSuccess___block_invoke;
  v6[3] = &unk_1E491E748;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(notificationQueue, v6);
}

uint64_t __110__FigCaptureVideoThumbnailSinkPipeline_imageQueueSinkNode_didAttemptToEnqueuePreviewSampleBuffer_withSuccess___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 72))
  {
    v2 = result;
    result = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 48), "input"), "connection"), "output"), "discardsSampleData");
    if ((result & 1) == 0)
    {
      result = objc_msgSend(*(id *)(v2 + 40), "imageQueueSlot");
      if ((_DWORD)result)
      {
        v3 = CFSTR("ImageQueueSlot");
        v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", result);
        result = objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 80), "postNotification:notificationPayload:", CFSTR("ThumbnailImageQueueUpdated"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1));
        *(_BYTE *)(*(_QWORD *)(v2 + 32) + 72) = 1;
      }
    }
  }
  return result;
}

- (uint64_t)updateClientAuditToken:(uint64_t)result
{
  void *v2;
  __int128 v3;
  _OWORD v4[2];

  if (result)
  {
    v2 = *(void **)(result + 56);
    v3 = a2[1];
    v4[0] = *a2;
    v4[1] = v3;
    return objc_msgSend(v2, "updateClientAuditToken:", v4);
  }
  return result;
}

@end

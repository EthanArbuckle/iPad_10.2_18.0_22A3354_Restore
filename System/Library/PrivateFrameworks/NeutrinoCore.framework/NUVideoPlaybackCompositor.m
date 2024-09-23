@implementation NUVideoPlaybackCompositor

- (void)fulfillVideoCompositionRequest:(id)a3
{
  id v4;
  NUVideoPlaybackFrameRequest *v5;
  NUVideoPlaybackFrameRequest *v6;
  void *v7;
  NUVideoPlaybackFrameRequest *v8;
  NUPriority *v9;
  void *v10;
  void *v11;
  NUVideoPlaybackFrameRequest *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CVBuffer *v16;
  void *v17;
  const __CFString *v18;
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
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  __CVBuffer *cf;
  _QWORD v45[5];
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;

  v4 = a3;
  objc_msgSend(v4, "videoCompositionInstruction");
  v5 = (NUVideoPlaybackFrameRequest *)objc_claimAutoreleasedReturnValue();
  v6 = [NUVideoPlaybackFrameRequest alloc];
  -[NUVideoPlaybackFrameRequest adjustmentComposition](v5, "adjustmentComposition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NUVideoPlaybackFrameRequest initWithComposition:](v6, "initWithComposition:", v7);

  v9 = -[NUPriority initWithLevel:]([NUPriority alloc], "initWithLevel:", 0);
  -[NURenderRequest setPriority:](v8, "setPriority:", v9);

  -[NURenderRequest renderContext](v5, "renderContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NURenderRequest renderContext](v5, "renderContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
  }
  else
  {
    -[NURenderRequest renderContext](v8, "renderContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v5;
  }
  -[NURenderRequest setRenderContext:](v12, "setRenderContext:", v11);

  objc_msgSend(v4, "sourceTrackIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (!v14)
  {
    v18 = CFSTR("No sourceTrackIDs");
LABEL_12:
    +[NUError unknownError:object:](NUError, "unknownError:object:", v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUVideoCompositor failVideoCompositionRequest:error:](self, "failVideoCompositionRequest:error:", v4, v19);

    goto LABEL_25;
  }
  objc_msgSend(v4, "renderContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (__CVBuffer *)objc_msgSend(v15, "newPixelBuffer");

  if (!v16)
  {
    v18 = CFSTR("Unable to allocate destination buffer");
    goto LABEL_12;
  }
  -[NUVideoCompositor setColorSpaceOfDestinationBuffer:fromPrimarySourceBufferOfRequest:](self, "setColorSpaceOfDestinationBuffer:fromPrimarySourceBufferOfRequest:", v16, v4);
  if (+[NUGlobalSettings videoCompositorDebugMode](NUGlobalSettings, "videoCompositorDebugMode") == 2)
    NUDebugWatermarkCVPixelBuffer(v16, 2);
  -[NUVideoPlaybackFrameRequest videoRenderPrepareNode](v5, "videoRenderPrepareNode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUVideoPlaybackFrameRequest setVideoRenderPrepareNode:](v8, "setVideoRenderPrepareNode:", v17);

  -[NUVideoPlaybackFrameRequest setDestinationBuffer:](v8, "setDestinationBuffer:", v16);
  cf = v16;
  if (v4)
  {
    objc_msgSend(v4, "compositionTime");
  }
  else
  {
    v59 = 0uLL;
    v60 = 0;
  }
  v57 = v59;
  v58 = v60;
  -[NUVideoPlaybackFrameRequest setEvaluationTime:](v8, "setEvaluationTime:", &v57);
  -[NURenderRequest pipelineFilters](v5, "pipelineFilters");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderRequest setPipelineFilters:](v8, "setPipelineFilters:", v20);

  -[NUVideoCompositor videoFramesFromRequest:](self, "videoFramesFromRequest:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUVideoPlaybackFrameRequest setVideoFrames:](v8, "setVideoFrames:", v21);

  -[NUVideoCompositor videoSampleSlicesFromRequest:](self, "videoSampleSlicesFromRequest:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUVideoPlaybackFrameRequest setVideoSampleSlices:](v8, "setVideoSampleSlices:", v22);

  -[NUVideoCompositor videoMetadataSamplesFromRequest:](self, "videoMetadataSamplesFromRequest:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUVideoPlaybackFrameRequest setVideoMetadataSamples:](v8, "setVideoMetadataSamples:", v23);

  v24 = -[NUVideoPlaybackFrameRequest renderScale](v5, "renderScale");
  -[NUVideoPlaybackFrameRequest setRenderScale:](v8, "setRenderScale:", v24, v25);
  -[NUVideoPlaybackFrameRequest colorSpace](v5, "colorSpace");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUVideoPlaybackFrameRequest setColorSpace:](v8, "setColorSpace:", v26);

  -[NUVideoPlaybackFrameRequest setIsDolbyVision:](v8, "setIsDolbyVision:", -[NUVideoPlaybackFrameRequest isDolbyVision](v5, "isDolbyVision"));
  -[NUVideoPlaybackFrameRequest playbackRate](v5, "playbackRate");
  -[NUVideoPlaybackFrameRequest setPlaybackRate:](v8, "setPlaybackRate:");
  objc_msgSend(v4, "renderContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "videoComposition");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    objc_msgSend(v28, "frameDuration");
  }
  else
  {
    v55 = 0uLL;
    v56 = 0;
  }
  v53 = v55;
  v54 = v56;
  -[NUVideoPlaybackFrameRequest setFrameDuration:](v8, "setFrameDuration:", &v53);

  -[NURenderRequest setSampleMode:](v8, "setSampleMode:", -[NURenderRequest sampleMode](v5, "sampleMode"));
  -[NUVideoPlaybackFrameRequest setPlaybackDirection:](v8, "setPlaybackDirection:", -[NUVideoCompositor playbackDirection](self, "playbackDirection"));
  v42 = (void *)MEMORY[0x1E0CB3940];
  -[NUVideoPlaybackCompositor label](self, "label");
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  if (!v30)
  {
    -[NURenderRequest name](v5, "name");
    v30 = objc_claimAutoreleasedReturnValue();
  }
  v43 = (void *)v30;
  objc_msgSend(v4, "renderContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renderContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "size");
  v35 = v34;
  objc_msgSend(v4, "renderContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "size");
  v38 = v37;
  if (v4)
  {
    objc_msgSend(v4, "compositionTime");
    v39 = v50;
    objc_msgSend(v4, "compositionTime");
    v40 = v48;
  }
  else
  {
    v40 = 0;
    v39 = 0;
    v50 = 0;
    v51 = 0;
    v52 = 0;
    v48 = 0;
    v49 = 0;
    v47 = 0;
  }
  objc_msgSend(v42, "stringWithFormat:", CFSTR("%@-avcontext(%x)-%.0fx%.0f-playback-t=%lld-%d"), v43, (unsigned __int16)v32, v35, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[NURenderRequest setName:](v8, "setName:", v41);

  if (!v31)
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __60__NUVideoPlaybackCompositor_fulfillVideoCompositionRequest___block_invoke;
  v45[3] = &unk_1E5061F78;
  v45[4] = self;
  v46 = v4;
  -[NUVideoPlaybackFrameRequest submit:](v8, "submit:", v45);
  CFRelease(cf);

LABEL_25:
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

void __60__NUVideoPlaybackCompositor_fulfillVideoCompositionRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[8];
  id v10;

  v10 = 0;
  objc_msgSend(a2, "result:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  v5 = objc_msgSend(v3, "frame");
  if (objc_msgSend(*(id *)(a1 + 32), "testAndSetVideoCompositionRequestFinished:", *(_QWORD *)(a1 + 40)))
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    if (v5)
      objc_msgSend(v6, "finishCompositionRequest:withComposedVideoFrame:", v7, v5);
    else
      objc_msgSend(v6, "failVideoCompositionRequest:error:", v7, v4);
  }
  else
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_6377);
    v8 = _NURenderLogger;
    if (os_log_type_enabled((os_log_t)_NURenderLogger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1A6553000, v8, OS_LOG_TYPE_ERROR, "NUVideoPlaybackCompositor testAndSetVideoCompositionRequestFinished returned false. Skipping frame", v9, 2u);
    }
  }

}

@end

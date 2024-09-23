@implementation NUVideoFrameJobCallbackCompositor

- (void)fulfillVideoCompositionRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CVBuffer *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD v23[3];
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "videoCompositionInstruction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "renderJob");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceTrackIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[NUVideoCompositor videoFramesFromRequest:](self, "videoFramesFromRequest:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUVideoCompositor videoMetadataSamplesFromRequest:](self, "videoMetadataSamplesFromRequest:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUVideoCompositor videoSampleSlicesFromRequest:](self, "videoSampleSlicesFromRequest:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "renderContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (__CVBuffer *)objc_msgSend(v13, "newPixelBuffer");

    if (v14)
    {
      -[NUVideoCompositor setColorSpaceOfDestinationBuffer:fromPrimarySourceBufferOfRequest:](self, "setColorSpaceOfDestinationBuffer:fromPrimarySourceBufferOfRequest:", v14, v4);
      if (+[NUGlobalSettings videoCompositorDebugMode](NUGlobalSettings, "videoCompositorDebugMode") == 2)
        NUDebugWatermarkCVPixelBuffer(v14, 2);
      if (v4)
        objc_msgSend(v4, "compositionTime");
      else
        memset(v23, 0, sizeof(v23));
      v21 = v10;
      v22 = 0;
      v17 = objc_msgSend(v6, "renderVideoFrames:videoMetadataSamples:videoSampleSlices:intoPixelBuffer:time:colorSpace:playbackDirection:error:", v10, v11, v12, v14, v23, v7, -[NUVideoCompositor playbackDirection](self, "playbackDirection"), &v22);
      v18 = v22;
      if (-[NUVideoCompositor testAndSetVideoCompositionRequestFinished:](self, "testAndSetVideoCompositionRequestFinished:", v4))
      {
        if (v17)
        {
          -[NUVideoCompositor finishCompositionRequest:withComposedVideoFrame:](self, "finishCompositionRequest:withComposedVideoFrame:", v4, v14);
        }
        else
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_1201);
          v20 = _NULogger;
          if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v18;
            _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, "Failed to export video: %@", buf, 0xCu);
          }
          objc_msgSend(v4, "finishWithError:", v18);
        }
      }
      else
      {
        if (_NULogOnceToken != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_1201);
        v19 = _NULogger;
        if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "NUVideoFrameJobCallbackCompositor testAndSetVideoCompositionRequestFinished returned false. Skipping frame", buf, 2u);
        }
      }
      CFRelease(v14);

      v10 = v21;
    }
    else
    {
      +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("Unable to allocate destination buffer"), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NUVideoCompositor failVideoCompositionRequest:error:](self, "failVideoCompositionRequest:error:", v4, v16);

    }
  }
  else
  {
    +[NUError unknownError:object:](NUError, "unknownError:object:", CFSTR("No sourceTrackIDs"), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUVideoCompositor failVideoCompositionRequest:error:](self, "failVideoCompositionRequest:error:", v4, v15);

  }
}

@end

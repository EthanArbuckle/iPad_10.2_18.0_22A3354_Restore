@implementation NUVideoPlaybackFrameRequest

- (NUVideoPlaybackFrameRequest)initWithComposition:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUVideoPlaybackFrameRequest;
  return -[NURenderRequest initWithComposition:](&v4, sel_initWithComposition_, a3);
}

- (void)dealloc
{
  __CVBuffer *destinationBuffer;
  objc_super v4;

  destinationBuffer = self->_destinationBuffer;
  if (destinationBuffer)
    CFRelease(destinationBuffer);
  v4.receiver = self;
  v4.super_class = (Class)NUVideoPlaybackFrameRequest;
  -[NUVideoPlaybackFrameRequest dealloc](&v4, sel_dealloc);
}

- (id)newRenderJob
{
  return -[NUVideoPlaybackFrameJob initWithVideoFrameRequest:]([NUVideoPlaybackFrameJob alloc], "initWithVideoFrameRequest:", self);
}

- (int64_t)mediaComponentType
{
  return 2;
}

- (void)submit:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *specific;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BYTE v26[12];
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NURenderRequest renderContext](self, "renderContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "purpose") == 1)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_24021);
    v6 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = v6;
      objc_msgSend(v7, "stringWithFormat:", CFSTR("submitting a video render request on a still image purpose context"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v26 = 138543362;
      *(_QWORD *)&v26[4] = v9;
      _os_log_impl(&dword_1A6553000, v8, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", v26, 0xCu);

      v10 = _NULogOnceToken;
      if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
      {
        if (v10 != -1)
          dispatch_once(&_NULogOnceToken, &__block_literal_global_24021);
LABEL_9:
        v11 = (void *)_NUAssertLogger;
        if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
        {
          specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v17 = (void *)MEMORY[0x1E0CB3978];
          v18 = specific;
          v19 = v11;
          objc_msgSend(v17, "callStackSymbols");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v26 = 138543618;
          *(_QWORD *)&v26[4] = specific;
          v27 = 2114;
          v28 = v21;
          _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v26, 0x16u);

LABEL_17:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
      if (v10 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_24021);
    }
    else if (dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      goto LABEL_9;
    }
    v22 = (void *)_NUAssertLogger;
    if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)MEMORY[0x1E0CB3978];
      v19 = v22;
      objc_msgSend(v23, "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v26 = 138543362;
      *(_QWORD *)&v26[4] = v25;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v26, 0xCu);

      goto LABEL_17;
    }
LABEL_14:
    _NUAssertContinueHandler((uint64_t)"-[NUVideoPlaybackFrameRequest submit:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoPlaybackFrameRequest.m", 65, CFSTR("submitting a video render request on a still image purpose context"), v12, v13, v14, v15, *(uint64_t *)v26);
  }

  -[NURenderRequest submitGeneric:](self, "submitGeneric:", v4);
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(id)a3
{
  objc_storeStrong((id *)&self->_colorSpace, a3);
}

- (__CVBuffer)destinationBuffer
{
  return self->_destinationBuffer;
}

- (void)setDestinationBuffer:(__CVBuffer *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)evaluationTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 232);
  return self;
}

- (void)setEvaluationTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_evaluationTime.value = *(_OWORD *)&a3->var0;
  self->_evaluationTime.epoch = var3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)renderScale
{
  $F9703ADC4DD3124DE91DE417D7636CC9 *p_renderScale;
  int64_t numerator;
  int64_t denominator;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_renderScale = &self->_renderScale;
  numerator = self->_renderScale.numerator;
  denominator = p_renderScale->denominator;
  result.var1 = denominator;
  result.var0 = numerator;
  return result;
}

- (void)setRenderScale:(id)a3
{
  self->_renderScale = ($F9703ADC4DD3124DE91DE417D7636CC9)a3;
}

- (BOOL)isDolbyVision
{
  return self->_isDolbyVision;
}

- (void)setIsDolbyVision:(BOOL)a3
{
  self->_isDolbyVision = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 256);
  return self;
}

- (void)setFrameDuration:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_frameDuration.value = *(_OWORD *)&a3->var0;
  self->_frameDuration.epoch = var3;
}

- (float)playbackRate
{
  return self->_playbackRate;
}

- (void)setPlaybackRate:(float)a3
{
  self->_playbackRate = a3;
}

- (int64_t)playbackDirection
{
  return self->_playbackDirection;
}

- (void)setPlaybackDirection:(int64_t)a3
{
  self->_playbackDirection = a3;
}

- (NURenderNode)videoRenderPrepareNode
{
  return self->_videoRenderPrepareNode;
}

- (void)setVideoRenderPrepareNode:(id)a3
{
  objc_storeStrong((id *)&self->_videoRenderPrepareNode, a3);
}

- (NSDictionary)videoFrames
{
  return self->_videoFrames;
}

- (void)setVideoFrames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSDictionary)videoMetadataSamples
{
  return self->_videoMetadataSamples;
}

- (void)setVideoMetadataSamples:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSArray)videoSampleSlices
{
  return self->_videoSampleSlices;
}

- (void)setVideoSampleSlices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoSampleSlices, 0);
  objc_storeStrong((id *)&self->_videoMetadataSamples, 0);
  objc_storeStrong((id *)&self->_videoFrames, 0);
  objc_storeStrong((id *)&self->_videoRenderPrepareNode, 0);
  objc_storeStrong((id *)&self->_colorSpace, 0);
}

@end

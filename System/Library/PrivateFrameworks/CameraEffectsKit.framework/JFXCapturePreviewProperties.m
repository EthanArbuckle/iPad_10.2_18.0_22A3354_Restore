@implementation JFXCapturePreviewProperties

- (JFXCapturePreviewProperties)initWithCameraFrameSet:(id)a3 renderCameraMode:(int64_t)a4 renderTime:(id *)a5 renderOutputSize:(CGSize)a6 frameSize:(CGSize)a7
{
  double height;
  double width;
  double v9;
  double v10;
  id v14;
  CFTimeInterval v15;
  JFXCapturePreviewProperties *v16;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18;

  height = a7.height;
  width = a7.width;
  v9 = a6.height;
  v10 = a6.width;
  v14 = a3;
  v15 = CACurrentMediaTime();
  v18 = *a5;
  v16 = -[JFXCapturePreviewProperties initWithCameraFrameSet:renderCameraMode:renderTime:renderOutputSize:frameSize:signPostToken:displayTimestamp:frameStats:startFrameTimer:](self, "initWithCameraFrameSet:renderCameraMode:renderTime:renderOutputSize:frameSize:signPostToken:displayTimestamp:frameStats:startFrameTimer:", v14, a4, &v18, 0, 0, 0, v10, v9, width, height, v15);

  return v16;
}

- (JFXCapturePreviewProperties)initWithCameraFrameSet:(id)a3 renderCameraMode:(int64_t)a4 renderTime:(id *)a5 renderOutputSize:(CGSize)a6 frameSize:(CGSize)a7 signPostToken:(id)a8 displayTimestamp:(double)a9 frameStats:(id)a10 startFrameTimer:(id)a11
{
  CGFloat height;
  CGFloat width;
  CGFloat v17;
  CGFloat v18;
  id v22;
  id v23;
  id v24;
  id v25;
  char *v26;
  void *v27;
  id v28;
  __int128 v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  objc_super v39;

  height = a7.height;
  width = a7.width;
  v17 = a6.height;
  v18 = a6.width;
  v22 = a3;
  v23 = a8;
  v24 = a10;
  v25 = a11;
  v39.receiver = self;
  v39.super_class = (Class)JFXCapturePreviewProperties;
  v26 = -[JFXCapturePreviewProperties init](&v39, sel_init);
  v27 = (void *)*((_QWORD *)v26 + 1);
  *((_QWORD *)v26 + 1) = v22;
  v28 = v22;

  *((_QWORD *)v26 + 2) = a4;
  v29 = *(_OWORD *)&a5->var0;
  *((_QWORD *)v26 + 15) = a5->var3;
  *(_OWORD *)(v26 + 104) = v29;
  *((CGFloat *)v26 + 9) = v18;
  *((CGFloat *)v26 + 10) = v17;
  *((CGFloat *)v26 + 11) = width;
  *((CGFloat *)v26 + 12) = height;
  *((double *)v26 + 3) = a9;
  v30 = (void *)*((_QWORD *)v26 + 4);
  *((_QWORD *)v26 + 4) = v23;
  v31 = v23;

  v32 = (void *)*((_QWORD *)v26 + 5);
  *((_QWORD *)v26 + 5) = v24;
  v33 = v24;

  v34 = (void *)*((_QWORD *)v26 + 6);
  *((_QWORD *)v26 + 6) = v25;
  v35 = v25;

  *((double *)v26 + 3) = a9;
  v36 = (void *)*((_QWORD *)v26 + 8);
  *((_QWORD *)v26 + 8) = 0;

  v37 = (void *)*((_QWORD *)v26 + 7);
  *((_QWORD *)v26 + 7) = 0;

  return (JFXCapturePreviewProperties *)v26;
}

- (BOOL)renderRequiresCrop
{
  BOOL v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = JFXIsCTMCroppedCameraMode(-[JFXCapturePreviewProperties renderCameraMode](self, "renderCameraMode"));
  -[JFXCapturePreviewProperties frameSize](self, "frameSize");
  v5 = v4;
  -[JFXCapturePreviewProperties frameSize](self, "frameSize");
  v7 = v6;
  -[JFXCapturePreviewProperties renderOutputSize](self, "renderOutputSize");
  v9 = v8;
  -[JFXCapturePreviewProperties renderOutputSize](self, "renderOutputSize");
  if (v3)
    return 1;
  else
    return (v5 > v7) ^ (v9 > v10);
}

- (PVFrameSet)cameraFrameSet
{
  return self->_cameraFrameSet;
}

- (int64_t)renderCameraMode
{
  return self->_renderCameraMode;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)renderTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 104);
  return self;
}

- (CGSize)renderOutputSize
{
  double width;
  double height;
  CGSize result;

  width = self->_renderOutputSize.width;
  height = self->_renderOutputSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)frameSize
{
  double width;
  double height;
  CGSize result;

  width = self->_frameSize.width;
  height = self->_frameSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)displayTimestamp
{
  return self->_displayTimestamp;
}

- (PVTaskToken)signPostToken
{
  return self->_signPostToken;
}

- (JFXCapturePreviewFrameStats)frameStats
{
  return self->_frameStats;
}

- (JFXPerfTimer)startFrameTimer
{
  return self->_startFrameTimer;
}

- (NSDictionary)selfieBGBuffers
{
  return self->_selfieBGBuffers;
}

- (void)setSelfieBGBuffers:(id)a3
{
  objc_storeStrong((id *)&self->_selfieBGBuffers, a3);
}

- (OS_dispatch_semaphore)selfieBGBufferLoadSem
{
  return self->_selfieBGBufferLoadSem;
}

- (void)setSelfieBGBufferLoadSem:(id)a3
{
  objc_storeStrong((id *)&self->_selfieBGBufferLoadSem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfieBGBufferLoadSem, 0);
  objc_storeStrong((id *)&self->_selfieBGBuffers, 0);
  objc_storeStrong((id *)&self->_startFrameTimer, 0);
  objc_storeStrong((id *)&self->_frameStats, 0);
  objc_storeStrong((id *)&self->_signPostToken, 0);
  objc_storeStrong((id *)&self->_cameraFrameSet, 0);
}

@end

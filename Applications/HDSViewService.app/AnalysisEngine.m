@implementation AnalysisEngine

- (id)initForType:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  AnalysisEngine *v6;

  if (a3 == 1)
    v4 = objc_claimAutoreleasedReturnValue(+[Recognizer recognizer_B520](Recognizer, "recognizer_B520"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[Recognizer recognizer_B238](Recognizer, "recognizer_B238"));
  v5 = (void *)v4;
  v6 = -[AnalysisEngine initWithRecognizer:](self, "initWithRecognizer:", v4);

  return v6;
}

- (AnalysisEngine)initWithRecognizer:(id)a3
{
  id v5;
  AnalysisEngine *v6;
  AnalysisEngine *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *processingQueue;
  NSObject *v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  MotionDetector *v13;
  MotionDetector *motion;
  double v15;
  double v16;
  CMTime v18;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AnalysisEngine;
  v6 = -[AnalysisEngine init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    v6->_crop_fraction = 0.7;
    v6->_useRecognizer = 1;
    objc_storeStrong((id *)&v6->_dispatchQueue, &_dispatch_main_q);
    objc_storeStrong((id *)&v7->_recognizer, a3);
    CMTimeMakeWithSeconds(&v18, 0.0, 3000000);
    v7->_recognizerInterval = ($95D729B680665BEAEFA1D6FCA8238556)v18;
    CMTimeMakeWithSeconds(&v18, 1.0, 3000000);
    v7->_recognitionExpirationSeconds = ($95D729B680665BEAEFA1D6FCA8238556)v18;
    v8 = dispatch_queue_create("Sauron processing queue", 0);
    processingQueue = v7->_processingQueue;
    v7->_processingQueue = (OS_dispatch_queue *)v8;

    v10 = v7->_processingQueue;
    global_queue = dispatch_get_global_queue(2, 0);
    v12 = objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_set_target_queue(v10, v12);

    v13 = objc_alloc_init(MotionDetector);
    motion = v7->_motion;
    v7->_motion = v13;

    LODWORD(v15) = 1045220557;
    -[MotionDetector setRotationThreshold:](v7->_motion, "setRotationThreshold:", v15);
    LODWORD(v16) = 1024416809;
    -[MotionDetector setAccelerationThreshold:](v7->_motion, "setAccelerationThreshold:", v16);
    -[MotionDetector stop](v7->_motion, "stop");
    v7->_isDetectingMotion = 0;
    -[AnalysisEngine reset](v7, "reset");
  }

  return v7;
}

- (void)clearHistory
{
  double v3;
  double v4;

  -[Recognizer reset](self->_recognizer, "reset");
  LODWORD(v3) = dword_100098068[!self->_usingM7Motion];
  -[MotionDetector setAccelerationThreshold:](self->_motion, "setAccelerationThreshold:", v3);
  LODWORD(v4) = 1045220557;
  -[MotionDetector setRotationThreshold:](self->_motion, "setRotationThreshold:", v4);
}

- (void)reset
{
  NSObject *processingQueue;
  _QWORD block[5];

  processingQueue = self->_processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004874;
  block[3] = &unk_1000C1518;
  block[4] = self;
  dispatch_async(processingQueue, block);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AnalysisEngine;
  -[AnalysisEngine dealloc](&v2, "dealloc");
}

- (void)setMotionRotationThreshold:(float)a3
{
  -[MotionDetector setRotationThreshold:](self->_motion, "setRotationThreshold:");
}

- (float)motionRotationThreshold
{
  float result;

  -[MotionDetector rotationThreshold](self->_motion, "rotationThreshold");
  return result;
}

- (void)setMotionAccelerationThreshold:(float)a3
{
  -[MotionDetector setAccelerationThreshold:](self->_motion, "setAccelerationThreshold:");
}

- (float)motionAccelerationThreshold
{
  float result;

  -[MotionDetector accelerationThreshold](self->_motion, "accelerationThreshold");
  return result;
}

- (void)ingestVideoFrame:(opaqueCMSampleBuffer *)a3
{
  __CVBuffer *ImageBuffer;
  CVPixelBufferRef v6;
  NSObject *processingQueue;
  _QWORD block[6];
  CMTime v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_processingFrame)
  {
    self->_processingFrame = 1;
    CMSampleBufferGetPresentationTimeStamp(&v9, a3);
    self->_currentFrameTime = ($95D729B680665BEAEFA1D6FCA8238556)v9;
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    v6 = CVPixelBufferRetain(ImageBuffer);
    processingQueue = self->_processingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004980;
    block[3] = &unk_1000C1540;
    block[4] = self;
    block[5] = v6;
    dispatch_async(processingQueue, block);
  }
}

- (void)preheat
{
  NSObject *processingQueue;
  _QWORD block[5];

  processingQueue = self->_processingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004A54;
  block[3] = &unk_1000C1518;
  block[4] = self;
  dispatch_async(processingQueue, block);
}

- (void)processVideoFrame:(__CVBuffer *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_currentFrameTime;
  Recognizer *recognizer;
  Recognizer *v7;
  Recognizer *v8;
  Recognizer *v9;
  void *v10;
  NSObject *dispatchQueue;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD block[6];
  CMTime time2;
  CMTime v16;
  CMTime rhs;
  CMTime time1;
  CMTime lhs;

  if (!a3)
    goto LABEL_15;
  if (!self->_useRecognizer)
    goto LABEL_15;
  lhs = (CMTime)self->_recognitionExpirationSeconds;
  if (-[AnalysisEngine hasRecognizedDeviceInRecentPast:](self, "hasRecognizedDeviceInRecentPast:", &lhs))
    goto LABEL_15;
  p_currentFrameTime = &self->_currentFrameTime;
  recognizer = self->_recognizer;
  if (recognizer)
    -[Recognizer lastProcessedImageTime](recognizer, "lastProcessedImageTime");
  else
    memset(&rhs, 0, sizeof(rhs));
  *(_OWORD *)&lhs.value = *(_OWORD *)&p_currentFrameTime->value;
  lhs.epoch = self->_currentFrameTime.epoch;
  CMTimeSubtract(&time1, &lhs, &rhs);
  lhs = (CMTime)self->_recognizerInterval;
  if (CMTimeCompare(&time1, &lhs) < 0)
    goto LABEL_15;
  v7 = self->_recognizer;
  *(_OWORD *)&lhs.value = *(_OWORD *)&p_currentFrameTime->value;
  lhs.epoch = self->_currentFrameTime.epoch;
  -[Recognizer processImage:withTimestamp:](v7, "processImage:withTimestamp:", a3, &lhs);
  v8 = self->_recognizer;
  if (v8)
  {
    -[Recognizer recognitionTime](v8, "recognitionTime");
    v9 = self->_recognizer;
    if (v9)
    {
      -[Recognizer lastProcessedImageTime](v9, "lastProcessedImageTime");
      goto LABEL_13;
    }
  }
  else
  {
    memset(&v16, 0, sizeof(v16));
  }
  memset(&time2, 0, sizeof(time2));
LABEL_13:
  if ((CMTimeCompare(&v16, &time2) & 0x80000000) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AnalysisEngine recognizingCompletionHandlerBlock](self, "recognizingCompletionHandlerBlock"));
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004C70;
    block[3] = &unk_1000C1568;
    block[4] = self;
    block[5] = v10;
    dispatch_async(dispatchQueue, block);

    return;
  }
LABEL_15:
  v12 = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004CAC;
  v13[3] = &unk_1000C1518;
  v13[4] = self;
  dispatch_async(v12, v13);
}

- (BOOL)hasRecognizedDeviceInRecentPast:(id *)a3
{
  Recognizer *recognizer;
  CMTime time1;
  CMTime rhs;
  CMTime lhs;
  CMTime v9;

  if (!self->_useRecognizer)
    return 0;
  memset(&v9, 0, sizeof(v9));
  lhs = (CMTime)self->_currentFrameTime;
  rhs = *(CMTime *)a3;
  CMTimeSubtract(&v9, &lhs, &rhs);
  recognizer = self->_recognizer;
  if (recognizer)
    -[Recognizer recognitionTime](recognizer, "recognitionTime");
  else
    memset(&time1, 0, sizeof(time1));
  lhs = v9;
  return CMTimeCompare(&time1, &lhs) >= 0;
}

- (float)recognizerConfidence
{
  double v2;

  -[Recognizer confidence](self->_recognizer, "confidence");
  return v2;
}

- (BOOL)usingM7Motion
{
  return self->_usingM7Motion;
}

- (void)setUsingM7Motion:(BOOL)a3
{
  self->_usingM7Motion = a3;
}

- (BOOL)useRecognizer
{
  return self->_useRecognizer;
}

- (void)setUseRecognizer:(BOOL)a3
{
  self->_useRecognizer = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)recognizerInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)recognitionExpirationSeconds
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- (double)crop_fraction
{
  return self->_crop_fraction;
}

- (void)setCrop_fraction:(double)a3
{
  self->_crop_fraction = a3;
}

- (BOOL)isDetectingMotion
{
  return self->_isDetectingMotion;
}

- (id)recognizingCompletionHandlerBlock
{
  return self->_recognizingCompletionHandlerBlock;
}

- (void)setRecognizingCompletionHandlerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_recognizingCompletionHandlerBlock, 0);
  objc_storeStrong((id *)&self->_motion, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
}

@end

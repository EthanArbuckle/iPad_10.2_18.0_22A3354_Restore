@implementation AVCaptureVisionDataOutput

+ (void)initialize
{
  objc_opt_class();
}

- (AVCaptureVisionDataOutput)init
{
  AVCaptureVisionDataOutput *v2;
  AVCaptureVisionDataOutputInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureVisionDataOutput;
  v2 = -[AVCaptureOutput initSubclass](&v5, sel_initSubclass);
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureVisionDataOutputInternal);
    v2->_internal = v3;
    if (v3)
    {
      v2->_internal->weakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v2);
      -[AVCaptureVisionDataOutput _initializeClientVisiblePropertiesForSourceDevice:](v2, "_initializeClientVisiblePropertiesForSourceDevice:", 0);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureVisionDataOutput;
  -[AVCaptureOutput dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3 callbackQueue:(id)a4
{
  id v4;
  void *v7;
  uint64_t v8;

  v4 = a4;
  if (((a4 != 0) & AVCaptureIsRunningInMediaserverd()) != 0)
    v4 = 0;
  -[AVCaptureVisionDataOutput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("delegate"));
  v8 = 0;
  if (-[AVCaptureDataOutputDelegateCallbackHelper setClientDelegate:clientCallbackQueue:exceptionReason:](self->_internal->delegateCallbackHelper, "setClientDelegate:clientCallbackQueue:exceptionReason:", a3, v4, &v8))
  {
    -[AVCaptureVisionDataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("delegate"));
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    -[AVCaptureVisionDataOutput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("delegate"));
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
}

- (AVCaptureVisionDataOutputDelegate)delegate
{
  return (AVCaptureVisionDataOutputDelegate *)-[AVCaptureDataOutputDelegateCallbackHelper clientDelegate](self->_internal->delegateCallbackHelper, "clientDelegate");
}

- (OS_dispatch_queue)delegateCallbackQueue
{
  return -[AVCaptureDataOutputDelegateCallbackHelper clientCallbackQueue](self->_internal->delegateCallbackHelper, "clientCallbackQueue");
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(self->var3 + 24);
  return self;
}

- (void)setMinFrameDuration:(id *)a3
{
  id v5;
  void *v6;
  CMTimeFlags var2;
  CMTimeEpoch var3;
  void *v9;
  void *v10;
  void *v11;
  AVCaptureVisionDataOutputInternal *internal;
  AVCaptureVisionDataOutputInternal *v13;
  __int128 v14;
  CMTime time2;
  CMTime time1;
  CMTime minFrameDuration;
  CMTime v18;
  CMTimeValue var0;
  CMTimeScale var1;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", CFSTR("visn")), "sourceDevice");
  v6 = v5;
  var0 = a3->var0;
  var2 = a3->var2;
  var1 = a3->var1;
  if ((var2 & 1) != 0)
  {
    var3 = a3->var3;
  }
  else
  {
    if (!v5)
    {
      var3 = 0;
      var2 = 0;
      var1 = 0;
      var0 = 0;
      goto LABEL_17;
    }
    objc_msgSend(v5, "activeVideoMinFrameDuration");
    var3 = v18.epoch;
    var0 = v18.value;
    var2 = v18.flags;
    var1 = v18.timescale;
    if ((v18.flags & 1) == 0)
    {
LABEL_17:
      internal = self->_internal;
      v18.value = var0;
      v18.timescale = var1;
      v18.flags = var2;
      v18.epoch = var3;
      minFrameDuration = (CMTime)internal->minFrameDuration;
      if (CMTimeCompare(&v18, &minFrameDuration))
      {
        v13 = self->_internal;
        v14 = *(_OWORD *)&a3->var0;
        v13->minFrameDuration.epoch = a3->var3;
        *(_OWORD *)&v13->minFrameDuration.value = v14;
        -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
      }
      return;
    }
  }
  memset(&v18, 0, sizeof(v18));
  v9 = (void *)objc_msgSend(v6, "activeFormat");
  if (v9)
    objc_msgSend(v9, "lowestSupportedVideoFrameDuration");
  else
    memset(&v18, 0, sizeof(v18));
  memset(&minFrameDuration, 0, sizeof(minFrameDuration));
  v10 = (void *)objc_msgSend(v6, "activeFormat");
  if (v10)
    objc_msgSend(v10, "highestSupportedVideoFrameDuration");
  else
    memset(&minFrameDuration, 0, sizeof(minFrameDuration));
  time1.timescale = var1;
  time1.flags = var2;
  time1.epoch = var3;
  time2 = v18;
  time1.value = var0;
  if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
  {
    time1.timescale = var1;
    time1.flags = var2;
    time1.epoch = var3;
    time2 = minFrameDuration;
    time1.value = var0;
    if (CMTimeCompare(&time1, &time2) < 1)
      goto LABEL_17;
  }
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v11);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v11);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minBurstFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(self->var3 + 48);
  return self;
}

- (void)setMinBurstFrameDuration:(id *)a3
{
  id v5;
  void *v6;
  CMTimeFlags var2;
  CMTimeEpoch var3;
  void *v9;
  void *v10;
  void *v11;
  AVCaptureVisionDataOutputInternal *internal;
  AVCaptureVisionDataOutputInternal *v13;
  CMTime time2;
  CMTime time1;
  CMTime minBurstFrameDuration;
  CMTime v17;
  CMTimeValue var0;
  CMTimeScale var1;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = -[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", CFSTR("visn")), "sourceDevice");
  v6 = v5;
  var0 = a3->var0;
  var2 = a3->var2;
  var1 = a3->var1;
  if ((var2 & 1) != 0)
  {
    var3 = a3->var3;
  }
  else
  {
    if (!v5)
    {
      var3 = 0;
      var2 = 0;
      var1 = 0;
      var0 = 0;
      goto LABEL_17;
    }
    objc_msgSend(v5, "activeVideoMinFrameDuration");
    var3 = v17.epoch;
    var0 = v17.value;
    var2 = v17.flags;
    var1 = v17.timescale;
    if ((v17.flags & 1) == 0)
    {
LABEL_17:
      internal = self->_internal;
      v17.value = var0;
      v17.timescale = var1;
      v17.flags = var2;
      v17.epoch = var3;
      minBurstFrameDuration = (CMTime)internal->minBurstFrameDuration;
      if (CMTimeCompare(&v17, &minBurstFrameDuration))
      {
        v13 = self->_internal;
        v13->minBurstFrameDuration.value = var0;
        v13->minBurstFrameDuration.timescale = var1;
        v13->minBurstFrameDuration.flags = var2;
        v13->minBurstFrameDuration.epoch = var3;
        -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
      }
      return;
    }
  }
  memset(&v17, 0, sizeof(v17));
  v9 = (void *)objc_msgSend(v6, "activeFormat");
  if (v9)
    objc_msgSend(v9, "lowestSupportedVideoFrameDuration");
  else
    memset(&v17, 0, sizeof(v17));
  memset(&minBurstFrameDuration, 0, sizeof(minBurstFrameDuration));
  v10 = (void *)objc_msgSend(v6, "activeFormat");
  if (v10)
    objc_msgSend(v10, "highestSupportedVideoFrameDuration");
  else
    memset(&minBurstFrameDuration, 0, sizeof(minBurstFrameDuration));
  time1.timescale = var1;
  time1.flags = var2;
  time1.epoch = var3;
  time2 = v17;
  time1.value = var0;
  if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
  {
    time1.timescale = var1;
    time1.flags = var2;
    time1.epoch = var3;
    time2 = minBurstFrameDuration;
    time1.value = var0;
    if (CMTimeCompare(&time1, &time2) < 1)
      goto LABEL_17;
  }
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v11);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v11);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxBurstDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(self->var3 + 72);
  return self;
}

- (void)setMaxBurstDuration:(id *)a3
{
  CMTimeFlags var2;
  CMTimeEpoch var3;
  AVCaptureVisionDataOutputInternal *internal;
  AVCaptureVisionDataOutputInternal *v7;
  void *v8;
  CMTime time2;
  CMTime time1;
  CMTimeValue var0;
  CMTimeScale var1;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  var0 = a3->var0;
  var2 = a3->var2;
  var1 = a3->var1;
  if ((var2 & 1) != 0)
  {
    var3 = a3->var3;
  }
  else
  {
    CMTimeMake(&time1, 2, 1);
    var0 = time1.value;
    var2 = time1.flags;
    var1 = time1.timescale;
    var3 = time1.epoch;
  }
  if ((var2 & 0x1D) == 1
    && (time1.value = var0,
        time1.timescale = var1,
        time1.flags = var2,
        time1.epoch = var3,
        time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68],
        CMTimeCompare(&time1, &time2) > 0))
  {
    internal = self->_internal;
    time1.value = var0;
    time1.timescale = var1;
    time1.flags = var2;
    time1.epoch = var3;
    time2 = (CMTime)internal->maxBurstDuration;
    if (CMTimeCompare(&time1, &time2))
    {
      v7 = self->_internal;
      v7->maxBurstDuration.value = var0;
      v7->maxBurstDuration.timescale = var1;
      v7->maxBurstDuration.flags = var2;
      v7->maxBurstDuration.epoch = var3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
  else
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
}

- (unint64_t)gaussianPyramidOctavesCount
{
  return self->_internal->gaussianPyramidOctavesCount;
}

- (void)setGaussianPyramidOctavesCount:(unint64_t)a3
{
  AVCaptureVisionDataOutputInternal *internal;
  void *v4;

  if (a3)
  {
    internal = self->_internal;
    if (internal->gaussianPyramidOctavesCount != a3)
    {
      internal->gaussianPyramidOctavesCount = a3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
  else
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  }
}

- (float)gaussianPyramidBaseOctaveDownscalingFactor
{
  return self->_internal->gaussianPyramidBaseOctaveDownscalingFactor;
}

- (void)setGaussianPyramidBaseOctaveDownscalingFactor:(float)a3
{
  void *v3;
  AVCaptureVisionDataOutputInternal *internal;

  if (a3 >= 1.0)
  {
    internal = self->_internal;
    if (internal->gaussianPyramidBaseOctaveDownscalingFactor != a3)
    {
      internal->gaussianPyramidBaseOctaveDownscalingFactor = a3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
  else
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
  }
}

- (unint64_t)maxKeypointsCount
{
  return self->_internal->maxKeypointsCount;
}

- (void)setMaxKeypointsCount:(unint64_t)a3
{
  AVCaptureVisionDataOutputInternal *internal;
  void *v4;

  if (a3)
  {
    internal = self->_internal;
    if (internal->maxKeypointsCount != a3)
    {
      internal->maxKeypointsCount = a3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
  else
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  }
}

- (BOOL)isFeatureBinningEnabled
{
  return self->_internal->featureBinningEnabled;
}

- (void)setFeatureBinningEnabled:(BOOL)a3
{
  AVCaptureVisionDataOutputInternal *internal;

  internal = self->_internal;
  if (internal->featureBinningEnabled != a3)
  {
    internal->featureBinningEnabled = a3;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (BOOL)isFeatureOrientationAssignmentEnabled
{
  return self->_internal->featureOrientationAssignmentEnabled;
}

- (void)setFeatureOrientationAssignmentEnabled:(BOOL)a3
{
  AVCaptureVisionDataOutputInternal *internal;

  internal = self->_internal;
  if (internal->featureOrientationAssignmentEnabled != a3)
  {
    internal->featureOrientationAssignmentEnabled = a3;
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (BOOL)isDynamicThresholdingSupported
{
  return -[AVCaptureVisionDataOutput _isPropertySupported:](self, "_isPropertySupported:", *MEMORY[0x1E0D05140]);
}

- (BOOL)isDynamicThresholdingEnabled
{
  return self->_internal->dynamicThresholdingEnabled;
}

- (void)setDynamicThresholdingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AVCaptureVisionDataOutputInternal *internal;
  void *v6;

  v3 = a3;
  if (a3 && !-[AVCaptureVisionDataOutput isDynamicThresholdingSupported](self, "isDynamicThresholdingSupported"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->dynamicThresholdingEnabled != v3)
    {
      internal->dynamicThresholdingEnabled = v3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (BOOL)isKeypointDetectionFlowTypeSupported:(unint64_t)a3
{
  return !a3 || -[AVCaptureVisionDataOutput _isPropertySupported:](self, "_isPropertySupported:", *MEMORY[0x1E0D05158]);
}

- (unint64_t)keypointDetectionFlowType
{
  return self->_internal->keypointDetectionFlowType;
}

- (void)setKeypointDetectionFlowType:(unint64_t)a3
{
  AVCaptureVisionDataOutputInternal *internal;
  void *v6;

  if (a3
    && !-[AVCaptureVisionDataOutput isKeypointDetectionFlowTypeSupported:](self, "isKeypointDetectionFlowTypeSupported:", a3))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0, a3);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->keypointDetectionFlowType != a3)
    {
      internal->keypointDetectionFlowType = a3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (BOOL)isSubPixelThresholdSupported
{
  return -[AVCaptureVisionDataOutput _isPropertySupported:](self, "_isPropertySupported:", *MEMORY[0x1E0D05180]);
}

- (unint64_t)subPixelThreshold
{
  return self->_internal->subPixelThreshold;
}

- (void)setSubPixelThreshold:(unint64_t)a3
{
  AVCaptureVisionDataOutputInternal *internal;
  void *v6;

  if (a3 && !-[AVCaptureVisionDataOutput isSubPixelThresholdSupported](self, "isSubPixelThresholdSupported"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->subPixelThreshold != a3)
    {
      internal->subPixelThreshold = a3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (BOOL)isFeatureMatchingSupported
{
  return -[AVCaptureVisionDataOutput _isPropertySupported:](self, "_isPropertySupported:", *MEMORY[0x1E0D05148]);
}

- (BOOL)isFeatureMatchingEnabled
{
  return self->_internal->featureMatchingEnabled;
}

- (void)setFeatureMatchingEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AVCaptureVisionDataOutputInternal *internal;
  void *v6;

  v3 = a3;
  if (a3 && !-[AVCaptureVisionDataOutput isFeatureMatchingSupported](self, "isFeatureMatchingSupported"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->featureMatchingEnabled != v3)
    {
      internal->featureMatchingEnabled = v3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (unint64_t)featureMatchingDescriptorSize
{
  return self->_internal->featureMatchingDescriptorSize;
}

- (void)setFeatureMatchingDescriptorSize:(unint64_t)a3
{
  AVCaptureVisionDataOutputInternal *internal;
  void *v6;

  if (a3 && !-[AVCaptureVisionDataOutput isFeatureMatchingSupported](self, "isFeatureMatchingSupported"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->featureMatchingDescriptorSize != a3)
    {
      internal->featureMatchingDescriptorSize = a3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (BOOL)isOrientationDistanceThresholdSupported
{
  return -[AVCaptureVisionDataOutput _isPropertySupported:](self, "_isPropertySupported:", *MEMORY[0x1E0D05168]);
}

- (float)orientationDistanceThreshold
{
  return self->_internal->orientationDistanceThreshold;
}

- (void)setOrientationDistanceThreshold:(float)a3
{
  AVCaptureVisionDataOutputInternal *internal;
  void *v6;

  if (a3 == 0.0
    || -[AVCaptureVisionDataOutput isOrientationDistanceThresholdSupported](self, "isOrientationDistanceThresholdSupported"))
  {
    internal = self->_internal;
    if (internal->orientationDistanceThreshold != a3)
    {
      internal->orientationDistanceThreshold = a3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (BOOL)isSigmaDistanceThresholdSupported
{
  return -[AVCaptureVisionDataOutput _isPropertySupported:](self, "_isPropertySupported:", *MEMORY[0x1E0D05170]);
}

- (float)sigmaDistanceThreshold
{
  return self->_internal->sigmaDistanceThreshold;
}

- (void)setSigmaDistanceThreshold:(float)a3
{
  AVCaptureVisionDataOutputInternal *internal;
  void *v6;

  if (a3 == 0.0
    || -[AVCaptureVisionDataOutput isSigmaDistanceThresholdSupported](self, "isSigmaDistanceThresholdSupported"))
  {
    internal = self->_internal;
    if (internal->sigmaDistanceThreshold != a3)
    {
      internal->sigmaDistanceThreshold = a3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (BOOL)isSquareDistanceDisparityFractionSupported
{
  return -[AVCaptureVisionDataOutput _isPropertySupported:](self, "_isPropertySupported:", *MEMORY[0x1E0D05178]);
}

- (float)squareDistanceDisparityFraction
{
  return self->_internal->squareDistanceDisparityFraction;
}

- (void)setSquareDistanceDisparityFraction:(float)a3
{
  AVCaptureVisionDataOutputInternal *internal;
  void *v6;

  if (a3 == 0.0
    || -[AVCaptureVisionDataOutput isSquareDistanceDisparityFractionSupported](self, "isSquareDistanceDisparityFractionSupported"))
  {
    internal = self->_internal;
    if (internal->squareDistanceDisparityFraction != a3)
    {
      internal->squareDistanceDisparityFraction = a3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
}

- (BOOL)isHammingDistanceThresholdSupported
{
  return -[AVCaptureVisionDataOutput _isPropertySupported:](self, "_isPropertySupported:", *MEMORY[0x1E0D05150]);
}

- (unint64_t)hammingDistanceThreshold
{
  return self->_internal->hammingDistanceThreshold;
}

- (void)setHammingDistanceThreshold:(unint64_t)a3
{
  AVCaptureVisionDataOutputInternal *internal;
  void *v6;

  if (a3
    && !-[AVCaptureVisionDataOutput isHammingDistanceThresholdSupported](self, "isHammingDistanceThresholdSupported"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v6);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v6);
  }
  else
  {
    internal = self->_internal;
    if (internal->hammingDistanceThreshold != a3)
    {
      internal->hammingDistanceThreshold = a3;
      -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
    }
  }
}

- (BOOL)isLACCConfigAndMetadataSupported
{
  return -[AVCaptureVisionDataOutput _isPropertySupported:](self, "_isPropertySupported:", *MEMORY[0x1E0D05160]);
}

- (NSData)laccConfigAndMetadata
{
  return self->_internal->laccConfigAndMetadata;
}

- (void)setLaccConfigAndMetadata:(id)a3
{
  void *v5;

  if (a3 && !-[AVCaptureVisionDataOutput isLACCConfigAndMetadataSupported](self, "isLACCConfigAndMetadataSupported"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
  else if (self->_internal->laccConfigAndMetadata != a3 && (objc_msgSend(a3, "isEqualToData:") & 1) == 0)
  {

    self->_internal->laccConfigAndMetadata = (NSData *)objc_msgSend(a3, "copy");
    -[AVCaptureOutput bumpChangeSeed](self, "bumpChangeSeed");
  }
}

- (float)keypointDetectionThreshold
{
  return self->_internal->keypointDetectionThreshold;
}

- (void)setKeypointDetectionThreshold:(float)a3
{
  AVCaptureVisionDataOutputInternal *internal;
  _QWORD v4[5];
  float v5;

  internal = self->_internal;
  if (internal->keypointDetectionThreshold != a3)
  {
    internal->keypointDetectionThreshold = a3;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __59__AVCaptureVisionDataOutput_setKeypointDetectionThreshold___block_invoke;
    v4[3] = &unk_1E4216D48;
    v4[4] = self;
    v5 = a3;
    -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v4);
  }
}

uint64_t __59__AVCaptureVisionDataOutput_setKeypointDetectionThreshold___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, _QWORD, uint64_t);

  if (a2)
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(result + 32), "sinkID");
    LODWORD(v5) = *(_DWORD *)(v3 + 40);
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    result = CMBaseObjectGetVTable();
    v7 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 16) + 8);
    if (v7)
      return v7(a2, v4, *MEMORY[0x1E0D045A8], v6);
  }
  return result;
}

- (BOOL)areRuntimeUpdatesSupported
{
  return -[AVCaptureVisionDataOutput _isPropertySupported:](self, "_isPropertySupported:", *MEMORY[0x1E0D050E8]);
}

- (void)setRuntimeUpdates:(id)a3
{
  void *v5;
  _QWORD v6[6];

  if (-[AVCaptureVisionDataOutput areRuntimeUpdatesSupported](self, "areRuntimeUpdatesSupported"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__AVCaptureVisionDataOutput_setRuntimeUpdates___block_invoke;
    v6[3] = &unk_1E4216870;
    v6[4] = self;
    v6[5] = a3;
    -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v6);
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
}

uint64_t __47__AVCaptureVisionDataOutput_setRuntimeUpdates___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, _QWORD, uint64_t);

  if (a2)
  {
    v3 = result;
    v4 = objc_msgSend(*(id *)(result + 32), "sinkID");
    v5 = *(_QWORD *)(v3 + 40);
    result = CMBaseObjectGetVTable();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 16) + 8);
    if (v6)
      return v6(a2, v4, *MEMORY[0x1E0D045B0], v5);
  }
  return result;
}

- (void)triggerBurst
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41__AVCaptureVisionDataOutput_triggerBurst__block_invoke;
  v2[3] = &unk_1E4216D70;
  v2[4] = self;
  -[AVCaptureOutput performFigCaptureSessionOperationSafelyUsingBlock:](self, "performFigCaptureSessionOperationSafelyUsingBlock:", v2);
}

uint64_t __41__AVCaptureVisionDataOutput_triggerBurst__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  if (a2)
  {
    v3 = objc_msgSend(*(id *)(result + 32), "sinkID");
    result = CMBaseObjectGetVTable();
    v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(result + 16) + 152);
    if (v4)
      return v4(a2, v3);
  }
  return result;
}

- (id)connectionMediaTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("visn");
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  uint64_t v7;
  void *v8;
  BOOL result;

  if (!objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", CFSTR("visn")))
  {
    v7 = 1;
    goto LABEL_5;
  }
  if (-[NSArray count](-[AVCaptureOutput connections](self, "connections"), "count"))
  {
    v7 = 2;
LABEL_5:
    v8 = (void *)AVCaptureOutputConnectionFailureReasonString(v7, (uint64_t)self, a3);
    result = 0;
    *a4 = v8;
    return result;
  }
  return 1;
}

- (id)addConnection:(id)a3 error:(id *)a4
{
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVCaptureVisionDataOutput;
  v6 = -[AVCaptureOutput addConnection:error:](&v8, sel_addConnection_error_, a3, a4);
  if (objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", CFSTR("visn")))
    -[AVCaptureVisionDataOutput _initializeClientVisiblePropertiesForSourceDevice:](self, "_initializeClientVisiblePropertiesForSourceDevice:", objc_msgSend(v6, "sourceDevice"));
  return v6;
}

- (void)removeConnection:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVCaptureVisionDataOutput;
  -[AVCaptureOutput removeConnection:](&v4, sel_removeConnection_, a3);
  -[AVCaptureVisionDataOutput _initializeClientVisiblePropertiesForSourceDevice:](self, "_initializeClientVisiblePropertiesForSourceDevice:", 0);
}

- (BOOL)appliesOrientationWithPhysicalRotationForConnection:(id)a3
{
  return 0;
}

- (BOOL)appliesMirroringWithPhysicalFlipForConnection:(id)a3
{
  return 0;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  AVWeakReference *weakReference;
  objc_super v7;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  weakReference = self->_internal->weakReference;
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, vsndo_notificationHandler, *MEMORY[0x1E0D04548], a3, 0);
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", weakReference, vsndo_notificationHandler, *MEMORY[0x1E0D04540], a3, 0);
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureVisionDataOutput;
  -[AVCaptureOutput attachSafelyToFigCaptureSession:](&v7, sel_attachSafelyToFigCaptureSession_, a3);
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  void *v5;
  objc_super v6;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, vsndo_notificationHandler, *MEMORY[0x1E0D04548], a3);
  objc_msgSend(v5, "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, vsndo_notificationHandler, *MEMORY[0x1E0D04540], a3);
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureVisionDataOutput;
  -[AVCaptureOutput detachSafelyFromFigCaptureSession:](&v6, sel_detachSafelyFromFigCaptureSession_, a3);
}

- (id)delegateOverride
{
  return -[AVCaptureDataOutputDelegateCallbackHelper delegateOverride](self->_internal->delegateCallbackHelper, "delegateOverride");
}

- (OS_dispatch_queue)delegateOverrideCallbackQueue
{
  return -[AVCaptureDataOutputDelegateCallbackHelper delegateOverrideCallbackQueue](self->_internal->delegateCallbackHelper, "delegateOverrideCallbackQueue");
}

- (void)setDelegateOverride:(id)a3 delegateOverrideCallbackQueue:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;

  if (((a4 != 0) & AVCaptureIsRunningInMediaserverd()) != 0)
    v7 = 0;
  else
    v7 = a4;
  v9 = 0;
  if (!-[AVCaptureDataOutputDelegateCallbackHelper setDelegateOverride:delegateOverrideCallbackQueue:exceptionReason:](self->_internal->delegateCallbackHelper, "setDelegateOverride:delegateOverrideCallbackQueue:exceptionReason:", a3, v7, &v9))
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
}

- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4
{
  objc_super v7;

  if (objc_msgSend(a3, "isVisionDataDeliverySupported"))
    -[AVCaptureVisionDataOutput _initializeClientVisiblePropertiesForSourceDevice:](self, "_initializeClientVisiblePropertiesForSourceDevice:", a4);
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureVisionDataOutput;
  -[AVCaptureOutput handleChangedActiveFormat:forDevice:](&v7, sel_handleChangedActiveFormat_forDevice_, a3, a4);
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04400]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")))
  {
    if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04548]))
    {
      -[AVCaptureVisionDataOutput _updateRemoteQueue:](self, "_updateRemoteQueue:", objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04538]));
    }
    else if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04540]))
    {
      -[AVCaptureVisionDataOutput _updateLocalQueue:](self, "_updateLocalQueue:", objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D042E8]));
    }
  }
}

- (void)_initializeClientVisiblePropertiesForSourceDevice:(id)a3
{
  double v5;
  double v6;
  uint64_t v7;
  _BOOL4 v8;
  double v9;
  _BOOL4 v10;
  double v11;
  _BOOL4 v12;
  double v13;
  uint64_t v14;
  CMTime v15;
  CMTime v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;

  objc_msgSend(-[AVCaptureOutput session](self, "session"), "beginConfiguration");
  v21 = 0uLL;
  v22 = 0;
  if (a3)
    objc_msgSend(a3, "activeVideoMinFrameDuration");
  v19 = v21;
  v20 = v22;
  -[AVCaptureVisionDataOutput setMinFrameDuration:](self, "setMinFrameDuration:", &v19);
  v17 = v21;
  v18 = v22;
  -[AVCaptureVisionDataOutput setMinBurstFrameDuration:](self, "setMinBurstFrameDuration:", &v17);
  CMTimeMake(&v16, 2, 1);
  v15 = v16;
  -[AVCaptureVisionDataOutput setMaxBurstDuration:](self, "setMaxBurstDuration:", &v15);
  -[AVCaptureVisionDataOutput setGaussianPyramidOctavesCount:](self, "setGaussianPyramidOctavesCount:", 4);
  LODWORD(v5) = 2.0;
  -[AVCaptureVisionDataOutput setGaussianPyramidBaseOctaveDownscalingFactor:](self, "setGaussianPyramidBaseOctaveDownscalingFactor:", v5);
  -[AVCaptureVisionDataOutput setMaxKeypointsCount:](self, "setMaxKeypointsCount:", 5000);
  -[AVCaptureVisionDataOutput setFeatureBinningEnabled:](self, "setFeatureBinningEnabled:", 0);
  -[AVCaptureVisionDataOutput setFeatureOrientationAssignmentEnabled:](self, "setFeatureOrientationAssignmentEnabled:", 1);
  LODWORD(v6) = 1110704128;
  -[AVCaptureVisionDataOutput setKeypointDetectionThreshold:](self, "setKeypointDetectionThreshold:", v6);
  -[AVCaptureVisionDataOutput setDynamicThresholdingEnabled:](self, "setDynamicThresholdingEnabled:", 0);
  -[AVCaptureVisionDataOutput setKeypointDetectionFlowType:](self, "setKeypointDetectionFlowType:", -[AVCaptureVisionDataOutput isKeypointDetectionFlowTypeSupported:](self, "isKeypointDetectionFlowTypeSupported:", 1));
  if (-[AVCaptureVisionDataOutput isSubPixelThresholdSupported](self, "isSubPixelThresholdSupported"))
    v7 = 9;
  else
    v7 = 0;
  -[AVCaptureVisionDataOutput setSubPixelThreshold:](self, "setSubPixelThreshold:", v7);
  -[AVCaptureVisionDataOutput setFeatureMatchingEnabled:](self, "setFeatureMatchingEnabled:", 0);
  -[AVCaptureVisionDataOutput setFeatureMatchingDescriptorSize:](self, "setFeatureMatchingDescriptorSize:", -[AVCaptureVisionDataOutput isFeatureMatchingSupported](self, "isFeatureMatchingSupported"));
  v8 = -[AVCaptureVisionDataOutput isOrientationDistanceThresholdSupported](self, "isOrientationDistanceThresholdSupported");
  LODWORD(v9) = 20.0;
  if (!v8)
    *(float *)&v9 = 0.0;
  -[AVCaptureVisionDataOutput setOrientationDistanceThreshold:](self, "setOrientationDistanceThreshold:", v9);
  v10 = -[AVCaptureVisionDataOutput isSigmaDistanceThresholdSupported](self, "isSigmaDistanceThresholdSupported");
  LODWORD(v11) = 0.5;
  if (!v10)
    *(float *)&v11 = 0.0;
  -[AVCaptureVisionDataOutput setSigmaDistanceThreshold:](self, "setSigmaDistanceThreshold:", v11);
  v12 = -[AVCaptureVisionDataOutput isSquareDistanceDisparityFractionSupported](self, "isSquareDistanceDisparityFractionSupported");
  LODWORD(v13) = 1045220557;
  if (!v12)
    *(float *)&v13 = 0.0;
  -[AVCaptureVisionDataOutput setSquareDistanceDisparityFraction:](self, "setSquareDistanceDisparityFraction:", v13);
  if (-[AVCaptureVisionDataOutput isHammingDistanceThresholdSupported](self, "isHammingDistanceThresholdSupported"))
    v14 = 180;
  else
    v14 = 0;
  -[AVCaptureVisionDataOutput setHammingDistanceThreshold:](self, "setHammingDistanceThreshold:", v14);
  objc_msgSend(-[AVCaptureOutput session](self, "session"), "commitConfiguration");
}

- (void)_updateRemoteQueue:(remoteQueueReceiverOpaque *)a3
{
  AVWeakReference *v5;
  void *MessageReceiver;

  v5 = self->_internal->weakReference;
  MessageReceiver = (void *)FigRemoteOperationReceiverCreateMessageReceiver();
  -[AVCaptureDataOutputDelegateCallbackHelper updateRemoteQueueReceiver:handler:](self->_internal->delegateCallbackHelper, "updateRemoteQueueReceiver:handler:", a3, (id)objc_msgSend(MessageReceiver, "copy"));

}

void __48__AVCaptureVisionDataOutput__updateRemoteQueue___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v6;
  _QWORD *v7;
  void *v8;

  v6 = (void *)MEMORY[0x1A1AF16C4]();
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (v7)
  {
    v8 = v7;
    if (a2 == -16665)
    {
      objc_msgSend(*(id *)(v7[2] + 8), "releaseRemoteQueueReceiver");
    }
    else if (!a2)
    {
      objc_msgSend(v7, "_handleRemoteQueueOperation:", a3);
    }

  }
  objc_autoreleasePoolPop(v6);
}

- (void)_handleRemoteQueueOperation:(FigRemoteOperation *)a3
{
  if (a3->var0 == 3)
    -[AVCaptureVisionDataOutput _processSampleBuffer:](self, "_processSampleBuffer:", a3->var4.var4.var0);
}

- (void)_updateLocalQueue:(localQueueOpaque *)a3
{
  AVWeakReference *v5;
  _QWORD v6[5];

  v5 = self->_internal->weakReference;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__AVCaptureVisionDataOutput__updateLocalQueue___block_invoke;
  v6[3] = &unk_1E4216770;
  v6[4] = v5;
  -[AVCaptureDataOutputDelegateCallbackHelper updateLocalQueue:handler:](self->_internal->delegateCallbackHelper, "updateLocalQueue:handler:", a3, (id)objc_msgSend(v6, "copy"));

}

void __47__AVCaptureVisionDataOutput__updateLocalQueue___block_invoke(uint64_t a1, __int128 *a2)
{
  void *v4;
  id v5;
  void *v6;
  __int128 v7;
  int v8;

  v4 = (void *)MEMORY[0x1A1AF16C4]();
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  if (v5)
  {
    v6 = v5;
    v7 = *a2;
    v8 = *((_DWORD *)a2 + 4);
    objc_msgSend(v5, "_handleLocalQueueMessage:", &v7);

  }
  objc_autoreleasePoolPop(v4);
}

- (void)_handleLocalQueueMessage:(FigLocalQueueMessage *)a3
{
  if (a3->var0 == 3)
    -[AVCaptureVisionDataOutput _processSampleBuffer:](self, "_processSampleBuffer:", *(_QWORD *)(&a3->var0 + 1));
}

- (void)_processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  id v5;
  id v6;
  CVImageBufferRef ImageBuffer;
  int64_t v8;
  CMTime v9;
  CMTime v10;

  v5 = -[AVCaptureDataOutputDelegateCallbackHelper activeDelegate](self->_internal->delegateCallbackHelper, "activeDelegate");
  v6 = -[NSArray firstObject](-[AVCaptureOutput connections](self, "connections"), "firstObject");
  if (objc_msgSend(v6, "isLive")
    && objc_msgSend(-[AVCaptureOutput session](self, "session"), "isRunning")
    && (objc_msgSend(-[AVCaptureOutput session](self, "session"), "isInterrupted") & 1) == 0)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    memset(&v10, 0, sizeof(v10));
    CMSampleBufferGetPresentationTimeStamp(&v10, a3);
    if (ImageBuffer)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v9 = v10;
        objc_msgSend(v5, "visionDataOutput:didOutputVisionDataPixelBuffer:timestamp:connection:", self, ImageBuffer, &v9, v6);
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = +[AVCaptureOutput dataDroppedReasonFromSampleBuffer:](AVCaptureOutput, "dataDroppedReasonFromSampleBuffer:", a3);
      v9 = v10;
      objc_msgSend(v5, "visionDataOutput:didDropVisionDataPixelBufferForTimestamp:connection:reason:", self, &v9, v6, v8);
    }
  }

}

- (BOOL)_isPropertySupported:(id)a3
{
  return objc_msgSend((id)objc_msgSend(-[AVCaptureConnection sourceDevice](-[AVCaptureOutput connectionWithMediaType:](self, "connectionWithMediaType:", CFSTR("visn")), "sourceDevice"), "supportedVisionDataProperties"), "containsObject:", a3);
}

@end

@implementation Recognizer

+ (id)recognizer_B238
{
  id v2;
  HPdetector_SceneClassifier_B238 *v3;
  id v4;

  v2 = objc_alloc((Class)a1);
  v3 = objc_alloc_init(HPdetector_SceneClassifier_B238);
  v4 = objc_msgSend(v2, "initWithClassifier:", v3);

  return v4;
}

+ (id)recognizer_B520
{
  id v2;
  HPdetector_SceneClassifier_B520 *v3;
  id v4;

  v2 = objc_alloc((Class)a1);
  v3 = objc_alloc_init(HPdetector_SceneClassifier_B520);
  v4 = objc_msgSend(v2, "initWithClassifier:", v3);

  objc_msgSend(v4, "setThreshold:", 0.9);
  objc_msgSend(v4, "setDetectionOutputIsDouble:", 0);
  return v4;
}

- (Recognizer)initWithClassifier:(id)a3
{
  id v5;
  Recognizer *v6;
  Recognizer *v7;
  CGSize size;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)Recognizer;
  v6 = -[Recognizer init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    size = CGRectNull.size;
    v6->_cropRect.origin = CGRectNull.origin;
    v6->_cropRect.size = size;
    objc_storeStrong((id *)&v6->_classifier, a3);
    v7->_threshold = 0.5;
    v7->_detectionOutputIsDouble = 1;
    -[Recognizer reset](v7, "reset");
  }

  return v7;
}

- (void)reset
{
  self->_confidence = 0.0;
  self->_recognitionTime = ($95D729B680665BEAEFA1D6FCA8238556)kCMTimeZero;
}

- (void)processImage:(__CVBuffer *)a3 withTimestamp:(id *)a4
{
  int64_t var3;
  unsigned int v8;
  BOOL v9;
  __int128 v10;
  uint64_t v11;

  CVPixelBufferRetain(a3);
  var3 = a4->var3;
  *(_OWORD *)&self->_lastProcessedImageTime.value = *(_OWORD *)&a4->var0;
  self->_lastProcessedImageTime.epoch = var3;
  v11 = 0;
  v8 = -[Recognizer recognize:error:](self, "recognize:error:", a3, &v11);
  if (v11)
    v9 = 1;
  else
    v9 = v8 == 0;
  if (!v9)
  {
    v10 = *(_OWORD *)&a4->var0;
    self->_recognitionTime.epoch = a4->var3;
    *(_OWORD *)&self->_recognitionTime.value = v10;
  }
  CVPixelBufferRelease(a3);
}

- (BOOL)recognize:(__CVBuffer *)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  unsigned int v18;
  id v19;
  double *v20;
  double v21;
  double v22;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[Recognizer getSceneprintForImage:error:](self, "getSceneprintForImage:error:", a3));
  v7 = v6;
  if (v6)
  {
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "descriptorData")));
    v9 = objc_msgSend(v8, "bytes");

    v10 = objc_alloc((Class)MLMultiArray);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "elementCount")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v13));
    v15 = objc_msgSend(v10, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v9, v12, 65568, v14, 0, a4);

    if (a4 && *a4)
    {
      v16 = 0;
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RecognizerClassifier predictionFromImageDescriptors:error:](self->_classifier, "predictionFromImageDescriptors:error:", v15, a4));
      if (!a4 || !*a4)
      {
        v18 = -[Recognizer detectionOutputIsDouble](self, "detectionOutputIsDouble");
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "HomePodDetected")));
        v20 = (double *)objc_msgSend(v19, "dataPointer");

        if (v18)
          v21 = *v20;
        else
          v21 = *(float *)v20;
        self->_confidence = v21;
        -[Recognizer threshold](self, "threshold");
        v17 = v21 > v22;
        -[Recognizer threshold](self, "threshold");
        goto LABEL_13;
      }
    }
    v17 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v17 = 0;
LABEL_14:

  return v17;
}

- (id)getSceneprintForImage:(__CVBuffer *)a3 error:(id *)a4
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v7 = objc_autoreleasePoolPush();
  if (CGRectIsNull(self->_cropRect))
  {
    v8 = objc_msgSend(objc_alloc((Class)VNImageRequestHandler), "initWithCVPixelBuffer:options:", a3, &__NSDictionary0__struct);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CIImage imageWithCVPixelBuffer:](CIImage, "imageWithCVPixelBuffer:", a3));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageByCroppingToRect:", self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height));

    v8 = objc_msgSend(objc_alloc((Class)VNImageRequestHandler), "initWithCIImage:options:", v10, &__NSDictionary0__struct);
  }
  v11 = objc_alloc_init((Class)VNCreateSceneprintRequest);
  objc_msgSend(v11, "setRevision:", 2);
  -[Recognizer handleVNRequest:withHandler:error:](self, "handleVNRequest:withHandler:error:", v11, v8, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "results"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sceneprints"));
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sceneprints"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", 0));
LABEL_8:

    goto LABEL_9;
  }
  if (a4)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", CFSTR("VNObservation returned nothing."), NSLocalizedDescriptionKey));
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sauron.recognizer.ErrorDomain"), 1, v16));
    goto LABEL_8;
  }
  v17 = 0;
LABEL_9:

  objc_autoreleasePoolPop(v7);
  if (v15)
    v18 = v17;
  else
    v18 = 0;

  return v18;
}

- (BOOL)handleVNRequest:(id)a3 withHandler:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;
  NSErrorUserInfoKey v13;
  const __CFString *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v7, 0));
  v10 = objc_msgSend(v8, "performRequests:error:", v9, a5);

  if (!v10)
    goto LABEL_10;
  if (!v7)
  {
    if (!a5)
      goto LABEL_11;
    v13 = NSLocalizedDescriptionKey;
    v14 = CFSTR("VNRequest returned nil.");
    goto LABEL_9;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "results"));
  v12 = objc_msgSend(v11, "count");

  if (v12 != (id)1)
  {
    if (!a5)
      goto LABEL_11;
    v13 = NSLocalizedDescriptionKey;
    v14 = CFSTR("VNRequest returned unexpected results count.");
LABEL_9:
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v14, v13));
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sauron.recognizer.ErrorDomain"), 1, v15));

LABEL_10:
    LOBYTE(a5) = 0;
    goto LABEL_11;
  }
  LOBYTE(a5) = 1;
LABEL_11:

  return (char)a5;
}

- (id)getVisionFrameworkVersion
{
  if (qword_1000D85C0 != -1)
    dispatch_once(&qword_1000D85C0, &stru_1000C14A8);
  return off_1000D5020;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)recognitionTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastProcessedImageTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (double)confidence
{
  return self->_confidence;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_threshold = a3;
}

- (BOOL)detectionOutputIsDouble
{
  return self->_detectionOutputIsDouble;
}

- (void)setDetectionOutputIsDouble:(BOOL)a3
{
  self->_detectionOutputIsDouble = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classifier, 0);
}

@end

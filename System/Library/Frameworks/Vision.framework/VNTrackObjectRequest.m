@implementation VNTrackObjectRequest

+ (id)trackerTypeForRequestRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 2)
  {
    v4 = CFSTR("VNObjectTrackerRevision2Type");
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v4 = CFSTR("VNObjectTrackerRevision1Type");
LABEL_5:
    v5 = v4;
    return v4;
  }
  if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequestClass:](VNError, "errorForUnsupportedRevision:ofRequestClass:");
    v4 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (unsigned)frameCVPixelBufferFormatForRequestRevision:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 == 2)
    return 1111970369;
  v7 = v3;
  v8 = v4;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___VNTrackObjectRequest;
  return objc_msgSendSuper2(&v6, sel_frameCVPixelBufferFormatForRequestRevision_);
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VNTrackObjectRequest;
  v5 = -[VNTrackingRequest newDefaultDetectorOptionsForRequestRevision:session:](&v12, sel_newDefaultDetectorOptionsForRequestRevision_session_, a3, a4);
  if (-[VNRequest revision](self, "revision") == 2)
  {
    -[VNTrackObjectRequest trackingFrameSizeInPixels](self, "trackingFrameSizeInPixels");
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("VNTrackingOption_InputImageMaxWidth"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("VNTrackingOption_InputImageMaxHeight"));

  }
  return v5;
}

- (VNTrackObjectRequest)initWithDetectedObjectObservation:(VNDetectedObjectObservation *)observation
{
  return -[VNTrackObjectRequest initWithDetectedObjectObservation:completionHandler:](self, "initWithDetectedObjectObservation:completionHandler:", observation, 0);
}

- (VNTrackObjectRequest)initWithDetectedObjectObservation:(VNDetectedObjectObservation *)observation completionHandler:(VNRequestCompletionHandler)completionHandler
{
  char *v4;
  VNTrackObjectRequest *v5;
  char *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VNTrackObjectRequest;
  v4 = -[VNTrackingRequest initWithDetectedObjectObservation:completionHandler:](&v8, sel_initWithDetectedObjectObservation_completionHandler_, observation, completionHandler);
  v5 = (VNTrackObjectRequest *)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 136) = *MEMORY[0x1E0C9D820];
    v6 = v4;
  }

  return v5;
}

- (void)setTrackingLevel:(unint64_t)a3
{
  objc_super v5;

  if (-[VNRequest revision](self, "revision") != 2)
  {
    v5.receiver = self;
    v5.super_class = (Class)VNTrackObjectRequest;
    -[VNTrackingRequest setTrackingLevel:](&v5, sel_setTrackingLevel_, a3);
  }
}

- (void)setTrackingFrameSizeInPixels:(CGSize)a3
{
  CGFloat height;
  CGFloat width;

  height = a3.height;
  width = a3.width;
  if (-[VNRequest revision](self, "revision") != 1)
  {
    self->_trackingFrameSizeInPixels.width = width;
    self->_trackingFrameSizeInPixels.height = height;
  }
}

- (id)_trackingLevelOptionFromTrackingLevelEnum
{
  __CFString *v3;
  objc_super v5;

  if (-[VNRequest revision](self, "revision") == 2)
  {
    v3 = CFSTR("VNTrackingOption_TrackingLevelRPN");
    return CFSTR("VNTrackingOption_TrackingLevelRPN");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)VNTrackObjectRequest;
    -[VNTrackingRequest _trackingLevelOptionFromTrackingLevelEnum](&v5, sel__trackingLevelOptionFromTrackingLevelEnum);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (CGSize)trackingFrameSizeInPixels
{
  double width;
  double height;
  CGSize result;

  width = self->_trackingFrameSizeInPixels.width;
  height = self->_trackingFrameSizeInPixels.height;
  result.height = height;
  result.width = width;
  return result;
}

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNTrackObjectRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end

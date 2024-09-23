@implementation VNTrackRectangleRequest

- (VNTrackRectangleRequest)initWithRectangleObservation:(VNRectangleObservation *)observation
{
  return -[VNTrackRectangleRequest initWithRectangleObservation:completionHandler:](self, "initWithRectangleObservation:completionHandler:", observation, 0);
}

- (VNTrackRectangleRequest)initWithRectangleObservation:(VNRectangleObservation *)observation completionHandler:(VNRequestCompletionHandler)completionHandler
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VNTrackRectangleRequest;
  return -[VNTrackingRequest initWithDetectedObjectObservation:completionHandler:](&v5, sel_initWithDetectedObjectObservation_completionHandler_, observation, completionHandler);
}

+ (id)trackerTypeForRequestRevision:(unint64_t)a3 error:(id *)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a3 == 1)
  {
    v4 = CFSTR("VNRectangleTrackerType");
    v5 = CFSTR("VNRectangleTrackerType");
  }
  else if (a4)
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

+ (const)revisionAvailability
{
  return (const $FA132638BE9F3789EDBDEDD04080CB9E *)&+[VNTrackRectangleRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end

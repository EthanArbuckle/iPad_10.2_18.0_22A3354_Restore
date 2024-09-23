@implementation FigFaceObservation

- (FigFaceObservation)initWithFaceObservation:(id)a3 faceID:(unint64_t)a4 time:(unint64_t)a5
{
  FigFaceObservation *v8;
  objc_super v10;

  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("faceObservation must not be nil"), 0));
  v10.receiver = self;
  v10.super_class = (Class)FigFaceObservation;
  v8 = -[FigFaceObservation init](&v10, sel_init);
  if (v8)
  {
    v8->_faceObservation = (VNFaceObservation *)a3;
    v8->_faceID = a4;
    v8->_faceTrackingRequest = (VNTrackObjectRequest *)objc_msgSend(objc_alloc((Class)getVNTrackObjectRequestClass()), "initWithDetectedObjectObservation:", v8->_faceObservation);
    v8->_lastUpdatedTime = a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigFaceObservation;
  -[FigFaceObservation dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[FigFaceObservation faceID](self, "faceID");
  return v5 == objc_msgSend(a3, "faceID");
}

- (VNFaceObservation)faceObservation
{
  return self->_faceObservation;
}

- (VNTrackObjectRequest)faceTrackingRequest
{
  return self->_faceTrackingRequest;
}

- (unint64_t)faceID
{
  return self->_faceID;
}

- (unint64_t)lastUpdatedTime
{
  return self->_lastUpdatedTime;
}

- (void)setLastUpdatedTime:(unint64_t)a3
{
  self->_lastUpdatedTime = a3;
}

@end

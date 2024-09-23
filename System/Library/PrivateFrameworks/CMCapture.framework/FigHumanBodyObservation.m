@implementation FigHumanBodyObservation

- (FigHumanBodyObservation)initWithHumanObservation:(id)a3 humanBodyID:(unint64_t)a4 time:(unint64_t)a5
{
  FigHumanBodyObservation *v8;
  objc_super v10;

  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("humanObservation must not be nil"), 0));
  v10.receiver = self;
  v10.super_class = (Class)FigHumanBodyObservation;
  v8 = -[FigHumanBodyObservation init](&v10, sel_init);
  if (v8)
  {
    v8->_humanObservation = (VNHumanObservation *)a3;
    v8->_humanBodyID = a4;
    v8->_humanTrackingRequest = (VNTrackObjectRequest *)objc_msgSend(objc_alloc((Class)getVNTrackObjectRequestClass()), "initWithDetectedObjectObservation:", v8->_humanObservation);
    v8->_lastUpdatedTime = a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigHumanBodyObservation;
  -[FigHumanBodyObservation dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v5;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[FigHumanBodyObservation humanBodyID](self, "humanBodyID");
  return v5 == objc_msgSend(a3, "humanBodyID");
}

- (VNHumanObservation)humanObservation
{
  return self->_humanObservation;
}

- (VNTrackObjectRequest)humanTrackingRequest
{
  return self->_humanTrackingRequest;
}

- (unint64_t)humanBodyID
{
  return self->_humanBodyID;
}

- (unint64_t)lastUpdatedTime
{
  return self->_lastUpdatedTime;
}

@end

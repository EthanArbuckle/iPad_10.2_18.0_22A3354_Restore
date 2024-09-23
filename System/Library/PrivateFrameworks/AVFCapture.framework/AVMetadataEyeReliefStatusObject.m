@implementation AVMetadataEyeReliefStatusObject

+ (id)eyeReliefStatusObjectWithEyeReliefStatus:(unint64_t)a3 input:(id)a4 time:(id *)a5 optionalInfoDict:(id)a6
{
  id v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v10 = objc_alloc((Class)objc_opt_class());
  v12 = *a5;
  return (id)objc_msgSend(v10, "initWithEyeReliefStatus:time:sourceCaptureInput:optionalInfoDict:", a3, &v12, a4, a6);
}

- (AVMetadataEyeReliefStatusObject)initWithEyeReliefStatus:(unint64_t)a3 time:(id *)a4 sourceCaptureInput:(id)a5 optionalInfoDict:(id)a6
{
  __int128 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  AVMetadataEyeReliefStatusObject *v13;
  AVMetadataEyeReliefStatusObject *v14;
  void *v15;
  float v16;
  __int128 v18;
  uint64_t v19;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20;
  objc_super v21;

  v8 = *MEMORY[0x1E0CA2E18];
  v19 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v9 = *MEMORY[0x1E0C9D648];
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v18 = v8;
  v21.receiver = self;
  v21.super_class = (Class)AVMetadataEyeReliefStatusObject;
  v20 = *a4;
  v13 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v21, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, CFSTR("EyeReliefStatus"), &v20, &v18, 0, 0, a5, v9, v10, v11, v12);
  v14 = v13;
  if (v13)
  {
    v13->_eyeReliefStatus = a3;
    v15 = (void *)objc_msgSend(a6, "objectForKeyedSubscript:", *MEMORY[0x1E0D05130]);
    if (v15)
    {
      objc_msgSend(v15, "floatValue");
      v14->_distance = v16;
      v14->_hasDistance = 1;
    }
  }
  return v14;
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  uint64_t v8;
  AVMetadataEyeReliefStatusObject *v9;
  int v10;
  double v11;
  _QWORD v13[3];

  v8 = objc_msgSend(a3, "eyeReliefStatus", a6);
  if (a3)
    objc_msgSend(a3, "time");
  else
    memset(v13, 0, sizeof(v13));
  v9 = -[AVMetadataEyeReliefStatusObject initWithEyeReliefStatus:time:sourceCaptureInput:optionalInfoDict:](self, "initWithEyeReliefStatus:time:sourceCaptureInput:optionalInfoDict:", v8, v13, objc_msgSend(a3, "input"), 0);
  if (v9)
  {
    v10 = objc_msgSend(a3, "hasDistance");
    v9->_hasDistance = v10;
    if (v10)
    {
      objc_msgSend(a3, "distance");
      v9->_distance = v11;
    }
  }
  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  double distance;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_hasDistance)
    distance = self->_distance;
  else
    distance = -1.0;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %p eyeReliefStatus: %d, distance: %f"), v4, self, self->_eyeReliefStatus, *(_QWORD *)&distance);
}

- (unint64_t)eyeReliefStatus
{
  return self->_eyeReliefStatus;
}

- (BOOL)hasDistance
{
  return self->_hasDistance;
}

- (double)distance
{
  void *v4;

  if (-[AVMetadataEyeReliefStatusObject hasDistance](self, "hasDistance"))
    return self->_distance;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v4);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  return 0.0;
}

@end

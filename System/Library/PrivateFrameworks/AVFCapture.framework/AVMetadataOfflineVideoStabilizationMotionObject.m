@implementation AVMetadataOfflineVideoStabilizationMotionObject

- (AVMetadataOfflineVideoStabilizationMotionObject)initWithTime:(id *)a3 motionDictionary:(id)a4 input:(id)a5
{
  __int128 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  AVMetadataOfflineVideoStabilizationMotionObject *v11;
  AVMetadataOfflineVideoStabilizationMotionObjectInternal *v12;
  __int128 v14;
  uint64_t v15;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16;
  objc_super v17;

  v6 = *MEMORY[0x1E0CA2E18];
  v15 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v14 = v6;
  v17.receiver = self;
  v17.super_class = (Class)AVMetadataOfflineVideoStabilizationMotionObject;
  v16 = *a3;
  v11 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v17, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, CFSTR("offlineVideoStabilizationMotion"), &v16, &v14, 0, 0, a5, v7, v8, v9, v10);
  if (v11)
  {
    v12 = objc_alloc_init(AVMetadataOfflineVideoStabilizationMotionObjectInternal);
    v11->_offlineVISMotionObjectInternal = v12;
    if (v12)
    {
      -[AVMetadataOfflineVideoStabilizationMotionObjectInternal setPayload:](v12, "setPayload:", a4);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v11;
}

+ (id)offlineVideoStabilizationMotionObjectWithTime:(id *)a3 motionDictionary:(id)a4 input:(id)a5
{
  id v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v8 = objc_alloc((Class)objc_opt_class());
  v10 = *a3;
  return (id)objc_msgSend(v8, "initWithTime:motionDictionary:input:", &v10, a4, a5);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetadataOfflineVideoStabilizationMotionObject;
  -[AVMetadataObject dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  NSDictionary *v6;
  uint64_t v7;
  uint64_t v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[AVMetadataOfflineVideoStabilizationMotionObject payload](self, "payload");
  if (self)
  {
    -[AVMetadataObject time](self, "time");
    v7 = v9;
  }
  else
  {
    v7 = 0;
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@, time=%lld>"), v5, self, v6, v7);
}

- (NSDictionary)payload
{
  return -[AVMetadataOfflineVideoStabilizationMotionObjectInternal payload](self->_offlineVISMotionObjectInternal, "payload");
}

@end

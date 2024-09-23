@implementation AVMetadataTrackedFacesObject

- (AVMetadataTrackedFacesObject)initWithTime:(id *)a3 faceTrackingDictionary:(id)a4 input:(id)a5
{
  __int128 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  AVMetadataTrackedFacesObject *v11;
  AVMetadataTrackedFacesObjectInternal *v12;
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
  v17.super_class = (Class)AVMetadataTrackedFacesObject;
  v16 = *a3;
  v11 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v17, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, CFSTR("trackedFaces"), &v16, &v14, 0, 0, a5, v7, v8, v9, v10);
  if (v11)
  {
    v12 = objc_alloc_init(AVMetadataTrackedFacesObjectInternal);
    v11->_trackedFacesObjectInternal = v12;
    if (v12)
    {
      -[AVMetadataTrackedFacesObjectInternal setPayload:](v12, "setPayload:", a4);
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

+ (id)trackedFacesWithTime:(id *)a3 faceTrackingDictionary:(id)a4 input:(id)a5
{
  id v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  v8 = objc_alloc((Class)objc_opt_class());
  v10 = *a3;
  return (id)objc_msgSend(v8, "initWithTime:faceTrackingDictionary:input:", &v10, a4, a5);
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetadataTrackedFacesObject;
  -[AVMetadataObject dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  float v11;
  uint64_t v12;
  id obj;
  CGSize v15;
  CGPoint v16;
  uint64_t v17;
  CGRect rect;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  v5 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), NSStringFromClass(v4), self);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = -[NSDictionary objectForKeyedSubscript:](-[AVMetadataTrackedFacesObject payload](self, "payload"), "objectForKeyedSubscript:", CFSTR("tracked_faces"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    v15 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v16 = (CGPoint)*MEMORY[0x1E0C9D648];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        rect.origin = v16;
        rect.size = v15;
        CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Rect")), &rect);
        objc_msgSend(v5, "appendFormat:", CFSTR(", faceID=%@"), objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("face_id")));
        objc_msgSend(v5, "appendFormat:", CFSTR(", pos=(%.2f,%.2f)"), *(_QWORD *)&rect.origin.x, *(_QWORD *)&rect.origin.y);
        objc_msgSend(v5, "appendFormat:", CFSTR(", size=(%.2f,%.2f)"), *(_QWORD *)&rect.size.width, *(_QWORD *)&rect.size.height);
        objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AngleInfoRoll")), "floatValue");
        objc_msgSend(v5, "appendFormat:", CFSTR(", roll=%f"), v11);
        objc_msgSend(v5, "appendFormat:", CFSTR(", failure=%@"), objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("failure_type")));
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  if (self)
  {
    -[AVMetadataObject time](self, "time");
    v12 = v17;
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v5, "appendFormat:", CFSTR(", time=%lld"), v12);
  objc_msgSend(v5, "appendString:", CFSTR(">"));
  return v5;
}

- (NSDictionary)payload
{
  return -[AVMetadataTrackedFacesObjectInternal payload](self->_trackedFacesObjectInternal, "payload");
}

@end

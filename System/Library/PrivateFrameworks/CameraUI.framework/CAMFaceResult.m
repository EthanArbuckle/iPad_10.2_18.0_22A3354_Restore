@implementation CAMFaceResult

- (CAMFaceResult)initWithFaceObject:(id)a3
{
  id v5;
  CAMFaceResult *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *uniqueIdentifier;
  CAMFaceResult *v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CAMFaceResult;
  v6 = -[CAMFaceResult init](&v18, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "bounds");
    v6->_bounds.origin.x = v7;
    v6->_bounds.origin.y = v8;
    v6->_bounds.size.width = v9;
    v6->_bounds.size.height = v10;
    if (objc_msgSend(v5, "hasRollAngle"))
      objc_msgSend(v5, "rollAngle");
    else
      v11 = 0x47EFFFFFE0000000;
    *(_QWORD *)&v6->_rollAngle = v11;
    objc_storeStrong((id *)&v6->_underlyingFaceObject, a3);
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "type");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ %ld"), v13, objc_msgSend(v5, "faceID"));
    v14 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSString *)v14;

    v16 = v6;
  }

  return v6;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMFaceResult underlyingFaceObject](self, "underlyingFaceObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "faceID");
  -[CAMFaceResult rollAngle](self, "rollAngle");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p identifier: %ld roll: %f>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)metadataType
{
  void *v2;
  void *v3;

  -[CAMFaceResult underlyingFaceObject](self, "underlyingFaceObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)burstMetadataRepresentation
{
  void *v2;
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CFDictionaryRef v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CMTime time;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  -[CAMFaceResult underlyingFaceObject](self, "underlyingFaceObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (v2)
    objc_msgSend(v2, "time");
  else
    memset(&time, 0, sizeof(time));
  v12 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v2, "faceID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("FaceID"));

  v44.origin.x = v5;
  v44.origin.y = v7;
  v44.size.width = v9;
  v44.size.height = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetMidX(v44));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("X"));

  v45.origin.x = v5;
  v45.origin.y = v7;
  v45.size.width = v9;
  v45.size.height = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetMidY(v45));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("Y"));

  v46.origin.x = v5;
  v46.origin.y = v7;
  v46.size.width = v9;
  v46.size.height = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetWidth(v46));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("Width"));

  v47.origin.x = v5;
  v47.origin.y = v7;
  v47.size.width = v9;
  v47.size.height = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetHeight(v47));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("Height"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("Timestamp"));
  if (objc_msgSend(v2, "hasRollAngle"))
  {
    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v2, "rollAngle");
    objc_msgSend(v18, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("RollAngle"));

  }
  if (objc_msgSend(v2, "hasYawAngle"))
  {
    v20 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v2, "yawAngle");
    objc_msgSend(v20, "numberWithDouble:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("YawAngle"));

  }
  if (objc_msgSend(v2, "hasLeftEyeBounds"))
  {
    objc_msgSend(v2, "leftEyeBounds");
    x = v48.origin.x;
    y = v48.origin.y;
    width = v48.size.width;
    height = v48.size.height;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetMidX(v48));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("LeftEyeX"));

    v49.origin.x = x;
    v49.origin.y = y;
    v49.size.width = width;
    v49.size.height = height;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetMidY(v49));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("LeftEyeY"));

    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetWidth(v50));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("LeftEyeWidth"));

    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = width;
    v51.size.height = height;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetHeight(v51));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("LeftEyeHeight"));

    if (objc_msgSend(v2, "hasLeftEyeClosedConfidence"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v2, "leftEyeClosedConfidence"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("LeftEyeBlinkLevel"));

    }
  }
  if (objc_msgSend(v2, "hasRightEyeBounds"))
  {
    objc_msgSend(v2, "rightEyeBounds");
    v31 = v52.origin.x;
    v32 = v52.origin.y;
    v33 = v52.size.width;
    v34 = v52.size.height;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetMidX(v52));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("RightEyeX"));

    v53.origin.x = v31;
    v53.origin.y = v32;
    v53.size.width = v33;
    v53.size.height = v34;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetMidY(v53));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("RightEyeY"));

    v54.origin.x = v31;
    v54.origin.y = v32;
    v54.size.width = v33;
    v54.size.height = v34;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetWidth(v54));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("RightEyeWidth"));

    v55.origin.x = v31;
    v55.origin.y = v32;
    v55.size.width = v33;
    v55.size.height = v34;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CGRectGetHeight(v55));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("RightEyeHeight"));

    if (objc_msgSend(v2, "hasRightEyeClosedConfidence"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v2, "rightEyeClosedConfidence"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("RightEyeBlinkLevel"));

    }
  }
  if (objc_msgSend(v2, "hasSmileConfidence"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v2, "smileConfidence"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("SmileLevel"));

  }
  v41 = (void *)objc_msgSend(v3, "copy");

  return v41;
}

- (unint64_t)syntheticFocusMode
{
  void *v2;
  unint64_t v3;

  -[CAMFaceResult underlyingMetadataObject](self, "underlyingMetadataObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[CAMCaptureConversions CAMMetadataObjectSyntheticFocusModeForAVCaptureMetadataObjectSyntheticFocusMode:](CAMCaptureConversions, "CAMMetadataObjectSyntheticFocusModeForAVCaptureMetadataObjectSyntheticFocusMode:", objc_msgSend(v2, "syntheticFocusMode"));

  return v3;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)rollAngle
{
  return self->_rollAngle;
}

- (AVMetadataFaceObject)underlyingFaceObject
{
  return self->_underlyingFaceObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingFaceObject, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end

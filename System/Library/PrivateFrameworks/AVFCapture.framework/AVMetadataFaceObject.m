@implementation AVMetadataFaceObject

- (AVMetadataFaceObject)initWithType:(id)a3 time:(id *)a4 duration:(id *)a5 bounds:(CGRect)a6 optionalInfoDict:(id)a7 originalMetadataObject:(id)a8 sourceCaptureInput:(id)a9
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;

  v11 = *a4;
  v10 = *a5;
  return -[AVMetadataFaceObject initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", 0, 0, 0, 0, &v11, &v10, 0.0, 0.0, 0.0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a7, a8, a9);
}

- (AVMetadataFaceObject)initWithFaceID:(int64_t)a3 hasRollAngle:(BOOL)a4 rollAngle:(double)a5 hasYawAngle:(BOOL)a6 yawAngle:(double)a7 hasPitchAngle:(BOOL)a8 pitchAngle:(double)a9 time:(id *)a10 duration:(id *)a11 bounds:(CGRect)a12
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;

  v14 = *a10;
  v13 = *a11;
  return -[AVMetadataFaceObject initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", a3, a4, a6, a8, &v14, &v13, a5, a7, a9, a12.origin.x, a12.origin.y, a12.size.width, a12.size.height, 0, 0, 0);
}

- (AVMetadataFaceObject)initWithFaceID:(int64_t)a3 hasRollAngle:(BOOL)a4 rollAngle:(double)a5 hasYawAngle:(BOOL)a6 yawAngle:(double)a7 hasPitchAngle:(BOOL)a8 pitchAngle:(double)a9 time:(id *)a10 duration:(id *)a11 bounds:(CGRect)a12 optionalInfoDict:(id)a13 originalMetadataObject:(id)a14 sourceCaptureInput:(id)a15
{
  _BOOL8 v15;
  _BOOL8 v16;
  _BOOL8 v17;
  AVMetadataFaceObject *v22;
  AVMetadataFaceObjectInternal *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFDictionary *v30;
  uint64_t v31;
  CGSize v32;
  const __CFDictionary *v33;
  CGSize v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  CGRect v46;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v47;
  objc_super v48;

  v15 = a8;
  v16 = a6;
  v17 = a4;
  v48.receiver = self;
  v48.super_class = (Class)AVMetadataFaceObject;
  v46.origin = *(CGPoint *)&a10->var0;
  *(_QWORD *)&v46.size.width = a10->var3;
  v47 = *a11;
  v22 = -[AVMetadataObject initWithType:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](&v48, sel_initWithType_time_duration_bounds_optionalInfoDict_originalMetadataObject_sourceCaptureInput_, CFSTR("face"), &v46, &v47, a13, a14, a15, a12.origin.x, a12.origin.y, a12.size.width, a12.size.height);
  if (v22)
  {
    v23 = objc_alloc_init(AVMetadataFaceObjectInternal);
    v22->_internal = v23;
    if (v23)
    {
      -[AVMetadataFaceObjectInternal setFaceID:](v23, "setFaceID:", a3);
      -[AVMetadataFaceObjectInternal setHasRollAngle:](v22->_internal, "setHasRollAngle:", v17);
      if (v17)
        -[AVMetadataFaceObjectInternal setRollAngle:](v22->_internal, "setRollAngle:", a5);
      -[AVMetadataFaceObjectInternal setHasYawAngle:](v22->_internal, "setHasYawAngle:", v16);
      if (v16)
        -[AVMetadataFaceObjectInternal setYawAngle:](v22->_internal, "setYawAngle:", a7);
      -[AVMetadataFaceObjectInternal setHasPitchAngle:](v22->_internal, "setHasPitchAngle:", v15);
      if (v15)
        -[AVMetadataFaceObjectInternal setPitchAngle:](v22->_internal, "setPitchAngle:", a9);
      if (a13)
      {
        v24 = objc_msgSend(a13, "objectForKeyedSubscript:", *MEMORY[0x1E0D05010]);
        if (v24)
        {
          v25 = (void *)v24;
          -[AVMetadataFaceObjectInternal setHasLeftEyeClosedConfidence:](v22->_internal, "setHasLeftEyeClosedConfidence:", 1);
          -[AVMetadataFaceObjectInternal setLeftEyeClosedConfidence:](v22->_internal, "setLeftEyeClosedConfidence:", objc_msgSend(v25, "intValue"));
        }
        v26 = objc_msgSend(a13, "objectForKeyedSubscript:", *MEMORY[0x1E0D05018]);
        if (v26)
        {
          v27 = (void *)v26;
          -[AVMetadataFaceObjectInternal setHasRightEyeClosedConfidence:](v22->_internal, "setHasRightEyeClosedConfidence:", 1);
          -[AVMetadataFaceObjectInternal setRightEyeClosedConfidence:](v22->_internal, "setRightEyeClosedConfidence:", objc_msgSend(v27, "intValue"));
        }
        v28 = objc_msgSend(a13, "objectForKeyedSubscript:", *MEMORY[0x1E0D050A0]);
        if (v28)
        {
          v29 = (void *)v28;
          -[AVMetadataFaceObjectInternal setHasSmileConfidence:](v22->_internal, "setHasSmileConfidence:", 1);
          -[AVMetadataFaceObjectInternal setSmileConfidence:](v22->_internal, "setSmileConfidence:", objc_msgSend(v29, "intValue"));
        }
        v30 = (const __CFDictionary *)objc_msgSend(a13, "objectForKeyedSubscript:", *MEMORY[0x1E0D05070]);
        v31 = MEMORY[0x1E0C9D648];
        if (v30)
        {
          v32 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
          v46.origin = (CGPoint)*MEMORY[0x1E0C9D648];
          v46.size = v32;
          -[AVMetadataFaceObjectInternal setHasLeftEyeBounds:](v22->_internal, "setHasLeftEyeBounds:", CGRectMakeWithDictionaryRepresentation(v30, &v46));
          -[AVMetadataFaceObjectInternal setLeftEyeBounds:](v22->_internal, "setLeftEyeBounds:", *(_OWORD *)&v46.origin, *(_OWORD *)&v46.size);
        }
        v33 = (const __CFDictionary *)objc_msgSend(a13, "objectForKeyedSubscript:", *MEMORY[0x1E0D05090]);
        if (v33)
        {
          v34 = *(CGSize *)(v31 + 16);
          v46.origin = *(CGPoint *)v31;
          v46.size = v34;
          -[AVMetadataFaceObjectInternal setHasRightEyeBounds:](v22->_internal, "setHasRightEyeBounds:", CGRectMakeWithDictionaryRepresentation(v33, &v46));
          -[AVMetadataFaceObjectInternal setRightEyeBounds:](v22->_internal, "setRightEyeBounds:", *(_OWORD *)&v46.origin, *(_OWORD *)&v46.size);
        }
        v35 = objc_msgSend(a13, "objectForKeyedSubscript:", *MEMORY[0x1E0D05020]);
        if (v35)
        {
          v36 = (void *)v35;
          -[AVMetadataFaceObjectInternal setHasConfidence:](v22->_internal, "setHasConfidence:", 1);
          -[AVMetadataFaceObjectInternal setConfidence:](v22->_internal, "setConfidence:", (float)((float)(int)objc_msgSend(v36, "intValue") / 1000.0));
        }
        v37 = objc_msgSend(a13, "objectForKeyedSubscript:", *MEMORY[0x1E0D05000]);
        if (v37)
        {
          v38 = (void *)v37;
          -[AVMetadataFaceObjectInternal setHasPayingAttention:](v22->_internal, "setHasPayingAttention:", 1);
          -[AVMetadataFaceObjectInternal setPayingAttention:](v22->_internal, "setPayingAttention:", objc_msgSend(v38, "BOOLValue"));
          v39 = (void *)objc_msgSend(a13, "objectForKeyedSubscript:", *MEMORY[0x1E0D05008]);
          -[AVMetadataFaceObjectInternal setHasPayingAttentionConfidence:](v22->_internal, "setHasPayingAttentionConfidence:", 1);
          -[AVMetadataFaceObjectInternal setPayingAttentionConfidence:](v22->_internal, "setPayingAttentionConfidence:", (float)((float)(int)objc_msgSend(v39, "intValue") / 1000.0));
        }
        else
        {
          objc_msgSend(a13, "objectForKeyedSubscript:", *MEMORY[0x1E0D05008]);
        }
        v41 = objc_msgSend(a13, "objectForKeyedSubscript:", *MEMORY[0x1E0D05040]);
        if (v41)
        {
          v42 = (void *)v41;
          -[AVMetadataFaceObjectInternal setHasDistance:](v22->_internal, "setHasDistance:", 1);
          -[AVMetadataFaceObjectInternal setDistance:](v22->_internal, "setDistance:", (double)(int)objc_msgSend(v42, "intValue"));
        }
        v43 = objc_msgSend(a13, "objectForKeyedSubscript:", *MEMORY[0x1E0D05050]);
        if (v43)
        {
          v44 = (void *)v43;
          -[AVMetadataFaceObjectInternal setHasOrientation:](v22->_internal, "setHasOrientation:", 1);
          v40 = (int)objc_msgSend(v44, "intValue");
          goto LABEL_33;
        }
      }
      else if (a14 && objc_msgSend(a14, "isMemberOfClass:", objc_opt_class()))
      {
        -[AVMetadataFaceObjectInternal setHasLeftEyeClosedConfidence:](v22->_internal, "setHasLeftEyeClosedConfidence:", objc_msgSend(*((id *)a14 + 2), "hasLeftEyeClosedConfidence"));
        -[AVMetadataFaceObjectInternal setLeftEyeClosedConfidence:](v22->_internal, "setLeftEyeClosedConfidence:", objc_msgSend(*((id *)a14 + 2), "leftEyeClosedConfidence"));
        -[AVMetadataFaceObjectInternal setHasRightEyeClosedConfidence:](v22->_internal, "setHasRightEyeClosedConfidence:", objc_msgSend(*((id *)a14 + 2), "hasRightEyeClosedConfidence"));
        -[AVMetadataFaceObjectInternal setRightEyeClosedConfidence:](v22->_internal, "setRightEyeClosedConfidence:", objc_msgSend(*((id *)a14 + 2), "rightEyeClosedConfidence"));
        -[AVMetadataFaceObjectInternal setHasSmileConfidence:](v22->_internal, "setHasSmileConfidence:", objc_msgSend(*((id *)a14 + 2), "hasSmileConfidence"));
        -[AVMetadataFaceObjectInternal setSmileConfidence:](v22->_internal, "setSmileConfidence:", objc_msgSend(*((id *)a14 + 2), "smileConfidence"));
        -[AVMetadataFaceObjectInternal setHasLeftEyeBounds:](v22->_internal, "setHasLeftEyeBounds:", objc_msgSend(*((id *)a14 + 2), "hasLeftEyeBounds"));
        objc_msgSend(*((id *)a14 + 2), "leftEyeBounds");
        -[AVMetadataFaceObjectInternal setLeftEyeBounds:](v22->_internal, "setLeftEyeBounds:");
        -[AVMetadataFaceObjectInternal setHasRightEyeBounds:](v22->_internal, "setHasRightEyeBounds:", objc_msgSend(*((id *)a14 + 2), "hasRightEyeBounds"));
        objc_msgSend(*((id *)a14 + 2), "rightEyeBounds");
        -[AVMetadataFaceObjectInternal setRightEyeBounds:](v22->_internal, "setRightEyeBounds:");
        -[AVMetadataFaceObjectInternal setHasPayingAttention:](v22->_internal, "setHasPayingAttention:", objc_msgSend(*((id *)a14 + 2), "hasPayingAttention"));
        -[AVMetadataFaceObjectInternal setPayingAttention:](v22->_internal, "setPayingAttention:", objc_msgSend(*((id *)a14 + 2), "payingAttention"));
        -[AVMetadataFaceObjectInternal setHasPayingAttentionConfidence:](v22->_internal, "setHasPayingAttentionConfidence:", objc_msgSend(*((id *)a14 + 2), "hasPayingAttentionConfidence"));
        -[AVMetadataFaceObjectInternal setHasPayingAttention:](v22->_internal, "setHasPayingAttention:", objc_msgSend(*((id *)a14 + 2), "hasPayingAttention"));
        -[AVMetadataFaceObjectInternal setHasDistance:](v22->_internal, "setHasDistance:", objc_msgSend(*((id *)a14 + 2), "hasDistance"));
        objc_msgSend(*((id *)a14 + 2), "distance");
        -[AVMetadataFaceObjectInternal setDistance:](v22->_internal, "setDistance:");
        -[AVMetadataFaceObjectInternal setHasOrientation:](v22->_internal, "setHasOrientation:", objc_msgSend(*((id *)a14 + 2), "hasOrientation"));
        v40 = objc_msgSend(*((id *)a14 + 2), "orientation");
LABEL_33:
        -[AVMetadataFaceObjectInternal setOrientation:](v22->_internal, "setOrientation:", v40);
      }
    }
    else
    {

      return 0;
    }
  }
  return v22;
}

+ (AVMetadataFaceObject)faceObjectWithFigEmbeddedCaptureDeviceFaceDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5
{
  return (AVMetadataFaceObject *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFigEmbeddedCaptureDeviceFaceDictionary:input:timeStamp:", a3, a4, a5);
}

- (AVMetadataFaceObject)initWithFigEmbeddedCaptureDeviceFaceDictionary:(id)a3 input:(id)a4 timeStamp:(id)a5
{
  CMTimeEpoch v8;
  double *v9;
  int64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  const __CFDictionary *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  float v22;
  void *v23;
  void *v24;
  float v25;
  void *v26;
  void *v27;
  float v28;
  double v29;
  __int128 v31;
  __int128 v32;
  CMTimeEpoch v33;
  CGRect rect;
  CMTime v35;

  v31 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)&v35.value = *MEMORY[0x1E0CA2E18];
  v8 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v35.epoch = v8;
  v9 = (double *)MEMORY[0x1E0C9D648];
  if (a5)
  {
    objc_msgSend(a5, "longLongValue");
    v10 = FigHostTimeToNanoseconds();
    CMTimeMake(&v35, v10, 1000000000);
  }
  v11 = *v9;
  v12 = v9[1];
  v13 = v9[2];
  v14 = v9[3];
  v15 = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05088]);
  if (v15)
  {
    memset(&rect, 0, sizeof(rect));
    if (CGRectMakeWithDictionaryRepresentation(v15, &rect))
    {
      v11 = rect.origin.x - rect.size.width * 0.119999997 * 0.5;
      v13 = rect.size.width + rect.size.width * 0.119999997;
      v12 = rect.origin.y - rect.size.height * 0.119999997 * 0.5;
      v14 = rect.size.height + rect.size.height * 0.119999997;
    }
  }
  v16 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05048]);
  if (v16)
    v17 = objc_msgSend(v16, "integerValue");
  else
    v17 = 0;
  v18 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04FF0]);
  v19 = v18;
  v20 = 0.0;
  v21 = 0.0;
  if (v18)
  {
    objc_msgSend(v18, "floatValue");
    v21 = v22;
  }
  v23 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04FF8]);
  v24 = v23;
  if (v23)
  {
    objc_msgSend(v23, "floatValue");
    v20 = v25;
  }
  v26 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D04FE8]);
  v27 = v26;
  if (v26)
  {
    objc_msgSend(v26, "floatValue");
    v29 = v28;
  }
  else
  {
    v29 = 0.0;
  }
  rect.origin = *(CGPoint *)&v35.value;
  *(_QWORD *)&rect.size.width = v35.epoch;
  v32 = v31;
  v33 = v8;
  return -[AVMetadataFaceObject initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", v17, v19 != 0, v24 != 0, v27 != 0, &rect, &v32, v21, v20, v29, v11, v12, v13, v14, a3, 0, a4);
}

- (id)initDerivedMetadataObjectFromMetadataObject:(id)a3 withTransform:(CGAffineTransform *)a4 isVideoMirrored:(BOOL)a5 rollAdjustment:(double)a6
{
  _BOOL4 v7;
  uint64_t v11;
  CGSize v12;
  __int128 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  AVMetadataFaceObject *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  __int128 v31;
  double x;
  double y;
  double width;
  double height;
  __int128 v36;
  double v37;
  double v38;
  double v39;
  double v40;
  __int128 v42;
  uint64_t v43;
  CGAffineTransform v44;
  CGRect v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  CGFloat v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v7 = a5;
  v11 = objc_msgSend(a3, "faceID");
  v48 = 0uLL;
  v49 = 0.0;
  if (a3)
  {
    objc_msgSend(a3, "time");
    v46 = 0uLL;
    v47 = 0;
    objc_msgSend(a3, "duration");
  }
  else
  {
    v46 = 0uLL;
    v47 = 0;
  }
  v12 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v45.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v45.size = v12;
  objc_msgSend(a3, "bounds");
  v13 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v44.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v44.c = v13;
  *(_OWORD *)&v44.tx = *(_OWORD *)&a4->tx;
  if (!AVMetadataObjectAdjustBaseClassProperties((uint64_t)&v44, &v45, v14, v15, v16, v17))
  {

    return 0;
  }
  v18 = objc_msgSend(a3, "hasRollAngle");
  v19 = 0.0;
  v20 = 0.0;
  if ((_DWORD)v18)
  {
    objc_msgSend(a3, "rollAngle");
    v22 = v21 + a6;
    if (v7)
      v20 = -v22;
    else
      v20 = v22;
    v23 = 360.0;
    if (v20 >= 360.0)
    {
      v23 = -360.0;
    }
    else if (v20 >= 0.0)
    {
      goto LABEL_15;
    }
    v20 = v20 + v23;
  }
LABEL_15:
  v25 = objc_msgSend(a3, "hasYawAngle");
  if ((_DWORD)v25)
  {
    objc_msgSend(a3, "yawAngle");
    v19 = v26;
    if (v7)
    {
      if (v26 <= 0.0)
        v19 = -v26;
      else
        v19 = 360.0 - v26;
    }
  }
  v27 = objc_msgSend(a3, "hasPitchAngle");
  v28 = 0.0;
  if ((_DWORD)v27)
  {
    objc_msgSend(a3, "pitchAngle");
    v28 = v29;
  }
  v30 = objc_msgSend(a3, "input");
  *(_OWORD *)&v44.a = v48;
  v44.c = v49;
  v42 = v46;
  v43 = v47;
  v24 = -[AVMetadataFaceObject initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:](self, "initWithFaceID:hasRollAngle:rollAngle:hasYawAngle:yawAngle:hasPitchAngle:pitchAngle:time:duration:bounds:optionalInfoDict:originalMetadataObject:sourceCaptureInput:", v11, v18, v25, v27, &v44, &v42, v20, v19, v28, *(_OWORD *)&v45.origin, *(_OWORD *)&v45.size, 0, a3, v30);
  if (-[AVMetadataFaceObjectInternal hasLeftEyeBounds](v24->_internal, "hasLeftEyeBounds"))
  {
    -[AVMetadataFaceObjectInternal leftEyeBounds](v24->_internal, "leftEyeBounds");
    v31 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v44.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v44.c = v31;
    *(_OWORD *)&v44.tx = *(_OWORD *)&a4->tx;
    v51 = CGRectApplyAffineTransform(v50, &v44);
    x = v51.origin.x;
    y = v51.origin.y;
    width = v51.size.width;
    height = v51.size.height;
    if (CGRectIsEmpty(v51))
      goto LABEL_26;
    v52.origin.x = x;
    v52.origin.y = y;
    v52.size.width = width;
    v52.size.height = height;
    if (CGRectIsNull(v52)
      || (v53.origin.x = x, v53.origin.y = y, v53.size.width = width, v53.size.height = height, CGRectIsInfinite(v53)))
    {
LABEL_26:
      -[AVMetadataFaceObjectInternal setHasLeftEyeBounds:](v24->_internal, "setHasLeftEyeBounds:", 0);
    }
    else
    {
      -[AVMetadataFaceObjectInternal setLeftEyeBounds:](v24->_internal, "setLeftEyeBounds:", x, y, width, height);
    }
  }
  if (-[AVMetadataFaceObjectInternal hasRightEyeBounds](v24->_internal, "hasRightEyeBounds"))
  {
    -[AVMetadataFaceObjectInternal rightEyeBounds](v24->_internal, "rightEyeBounds");
    v36 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v44.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v44.c = v36;
    *(_OWORD *)&v44.tx = *(_OWORD *)&a4->tx;
    v55 = CGRectApplyAffineTransform(v54, &v44);
    v37 = v55.origin.x;
    v38 = v55.origin.y;
    v39 = v55.size.width;
    v40 = v55.size.height;
    if (CGRectIsEmpty(v55))
      goto LABEL_31;
    v56.origin.x = v37;
    v56.origin.y = v38;
    v56.size.width = v39;
    v56.size.height = v40;
    if (CGRectIsNull(v56)
      || (v57.origin.x = v37, v57.origin.y = v38, v57.size.width = v39, v57.size.height = v40, CGRectIsInfinite(v57)))
    {
LABEL_31:
      -[AVMetadataFaceObjectInternal setHasRightEyeBounds:](v24->_internal, "setHasRightEyeBounds:", 0);
    }
    else
    {
      -[AVMetadataFaceObjectInternal setRightEyeBounds:](v24->_internal, "setRightEyeBounds:", v37, v38, v39, v40);
    }
  }
  -[AVMetadataFaceObjectInternal setHasConfidence:](v24->_internal, "setHasConfidence:", objc_msgSend(a3, "hasConfidence"));
  if (-[AVMetadataFaceObjectInternal hasConfidence](v24->_internal, "hasConfidence"))
  {
    objc_msgSend(a3, "confidence");
    -[AVMetadataFaceObjectInternal setConfidence:](v24->_internal, "setConfidence:");
  }
  -[AVMetadataFaceObjectInternal setHasPayingAttention:](v24->_internal, "setHasPayingAttention:", objc_msgSend(a3, "hasPayingAttention"));
  if (-[AVMetadataFaceObjectInternal hasPayingAttention](v24->_internal, "hasPayingAttention"))
    -[AVMetadataFaceObjectInternal setPayingAttention:](v24->_internal, "setPayingAttention:", objc_msgSend(a3, "payingAttention"));
  -[AVMetadataFaceObjectInternal setHasPayingAttentionConfidence:](v24->_internal, "setHasPayingAttentionConfidence:", objc_msgSend(a3, "hasPayingAttentionConfidence"));
  if (-[AVMetadataFaceObjectInternal hasPayingAttentionConfidence](v24->_internal, "hasPayingAttentionConfidence"))
  {
    objc_msgSend(a3, "payingAttentionConfidence");
    -[AVMetadataFaceObjectInternal setPayingAttentionConfidence:](v24->_internal, "setPayingAttentionConfidence:");
  }
  -[AVMetadataFaceObjectInternal setHasDistance:](v24->_internal, "setHasDistance:", objc_msgSend(a3, "hasDistance"));
  if (-[AVMetadataFaceObjectInternal hasDistance](v24->_internal, "hasDistance"))
  {
    objc_msgSend(a3, "distance");
    -[AVMetadataFaceObjectInternal setDistance:](v24->_internal, "setDistance:");
  }
  -[AVMetadataFaceObjectInternal setHasOrientation:](v24->_internal, "setHasOrientation:", objc_msgSend(a3, "hasOrientation"));
  if (-[AVMetadataFaceObjectInternal hasOrientation](v24->_internal, "hasOrientation"))
    -[AVMetadataFaceObjectInternal setOrientation:](v24->_internal, "setOrientation:", objc_msgSend(a3, "orientation"));
  return v24;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetadataFaceObject;
  -[AVMetadataObject dealloc](&v3, sel_dealloc);
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  NSString *v13;
  NSInteger v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;

  -[AVMetadataObject bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)MEMORY[0x1E0CB37A0];
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = -[AVMetadataFaceObject faceID](self, "faceID");
  v15 = -1.0;
  v16 = -1.0;
  if (-[AVMetadataFaceObject hasRollAngle](self, "hasRollAngle"))
  {
    -[AVMetadataFaceObject rollAngle](self, "rollAngle");
    v16 = v17;
  }
  if (-[AVMetadataFaceObject hasYawAngle](self, "hasYawAngle"))
  {
    -[AVMetadataFaceObject yawAngle](self, "yawAngle");
    v15 = v18;
  }
  v19 = -[AVMetadataFaceObject hasPitchAngle](self, "hasPitchAngle");
  v20 = -1.0;
  if (v19)
    -[AVMetadataFaceObject pitchAngle](self, "pitchAngle", -1.0);
  v21 = (void *)objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p, faceID=%d, bounds={%.1f,%.1f %.1fx%.1f}, rollAngle=%.1f, yawAngle=%.1f, pitchAngle=%.1f"), v13, self, v14, v4, v6, v8, v10, *(_QWORD *)&v16, *(_QWORD *)&v15, *(_QWORD *)&v20);
  if (self)
  {
    -[AVMetadataObject time](self, "time");
    v22 = v24;
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(v21, "appendFormat:", CFSTR(", time=%lld"), v22);
  objc_msgSend(v21, "appendString:", CFSTR(">"));
  return v21;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSInteger v6;
  int v7;
  double v8;
  double v9;
  double v10;
  int v11;
  double v12;
  double v13;
  double v14;
  int v15;
  double v16;
  double v17;
  double v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  int v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  int v51;
  double v52;
  double v53;
  double v54;
  int v55;
  int v56;
  int v57;
  double v58;
  double v59;
  double v60;
  int v61;
  double v62;
  double v63;
  double v64;
  int v65;
  unint64_t v66;
  objc_super v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  v68.receiver = self;
  v68.super_class = (Class)AVMetadataFaceObject;
  v5 = -[AVMetadataObject isEqual:](&v68, sel_isEqual_);
  if (v5)
  {
    v6 = -[AVMetadataFaceObject faceID](self, "faceID");
    if (v6 != objc_msgSend(a3, "faceID"))
      goto LABEL_42;
    v7 = -[AVMetadataFaceObject hasRollAngle](self, "hasRollAngle");
    if (v7 != objc_msgSend(a3, "hasRollAngle"))
      goto LABEL_42;
    if (-[AVMetadataFaceObject hasRollAngle](self, "hasRollAngle"))
    {
      -[AVMetadataFaceObject rollAngle](self, "rollAngle");
      v9 = v8;
      objc_msgSend(a3, "rollAngle");
      if (v9 != v10)
        goto LABEL_42;
    }
    v11 = -[AVMetadataFaceObject hasYawAngle](self, "hasYawAngle");
    if (v11 != objc_msgSend(a3, "hasYawAngle"))
      goto LABEL_42;
    if (-[AVMetadataFaceObject hasYawAngle](self, "hasYawAngle"))
    {
      -[AVMetadataFaceObject yawAngle](self, "yawAngle");
      v13 = v12;
      objc_msgSend(a3, "yawAngle");
      if (v13 != v14)
        goto LABEL_42;
    }
    v15 = -[AVMetadataFaceObject hasPitchAngle](self, "hasPitchAngle");
    if (v15 != objc_msgSend(a3, "hasPitchAngle"))
      goto LABEL_42;
    if (-[AVMetadataFaceObject hasPitchAngle](self, "hasPitchAngle"))
    {
      -[AVMetadataFaceObject pitchAngle](self, "pitchAngle");
      v17 = v16;
      objc_msgSend(a3, "pitchAngle");
      if (v17 != v18)
        goto LABEL_42;
    }
    v19 = -[AVMetadataFaceObject hasLeftEyeClosedConfidence](self, "hasLeftEyeClosedConfidence");
    if (v19 != objc_msgSend(a3, "hasLeftEyeClosedConfidence"))
      goto LABEL_42;
    if (-[AVMetadataFaceObject hasLeftEyeClosedConfidence](self, "hasLeftEyeClosedConfidence"))
    {
      v20 = -[AVMetadataFaceObject leftEyeClosedConfidence](self, "leftEyeClosedConfidence");
      if (v20 != objc_msgSend(a3, "leftEyeClosedConfidence"))
        goto LABEL_42;
    }
    v21 = -[AVMetadataFaceObject hasRightEyeClosedConfidence](self, "hasRightEyeClosedConfidence");
    if (v21 != objc_msgSend(a3, "hasRightEyeClosedConfidence"))
      goto LABEL_42;
    if (-[AVMetadataFaceObject hasRightEyeClosedConfidence](self, "hasRightEyeClosedConfidence"))
    {
      v22 = -[AVMetadataFaceObject rightEyeClosedConfidence](self, "rightEyeClosedConfidence");
      if (v22 != objc_msgSend(a3, "rightEyeClosedConfidence"))
        goto LABEL_42;
    }
    v23 = -[AVMetadataFaceObject hasSmileConfidence](self, "hasSmileConfidence");
    if (v23 != objc_msgSend(a3, "hasSmileConfidence"))
      goto LABEL_42;
    if (-[AVMetadataFaceObject hasSmileConfidence](self, "hasSmileConfidence"))
    {
      v24 = -[AVMetadataFaceObject smileConfidence](self, "smileConfidence");
      if (v24 != objc_msgSend(a3, "smileConfidence"))
        goto LABEL_42;
    }
    v25 = -[AVMetadataFaceObject hasLeftEyeBounds](self, "hasLeftEyeBounds");
    if (v25 != objc_msgSend(a3, "hasLeftEyeBounds"))
      goto LABEL_42;
    if (!-[AVMetadataFaceObject hasLeftEyeBounds](self, "hasLeftEyeBounds"))
      goto LABEL_24;
    -[AVMetadataFaceObject leftEyeBounds](self, "leftEyeBounds");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    objc_msgSend(a3, "leftEyeBounds");
    v71.origin.x = v34;
    v71.origin.y = v35;
    v71.size.width = v36;
    v71.size.height = v37;
    v69.origin.x = v27;
    v69.origin.y = v29;
    v69.size.width = v31;
    v69.size.height = v33;
    v5 = CGRectEqualToRect(v69, v71);
    if (v5)
    {
LABEL_24:
      v38 = -[AVMetadataFaceObject hasRightEyeBounds](self, "hasRightEyeBounds");
      if (v38 != objc_msgSend(a3, "hasRightEyeBounds"))
        goto LABEL_42;
      if (!-[AVMetadataFaceObject hasRightEyeBounds](self, "hasRightEyeBounds"))
        goto LABEL_27;
      -[AVMetadataFaceObject rightEyeBounds](self, "rightEyeBounds");
      v40 = v39;
      v42 = v41;
      v44 = v43;
      v46 = v45;
      objc_msgSend(a3, "rightEyeBounds");
      v72.origin.x = v47;
      v72.origin.y = v48;
      v72.size.width = v49;
      v72.size.height = v50;
      v70.origin.x = v40;
      v70.origin.y = v42;
      v70.size.width = v44;
      v70.size.height = v46;
      v5 = CGRectEqualToRect(v70, v72);
      if (v5)
      {
LABEL_27:
        v51 = -[AVMetadataFaceObject hasConfidence](self, "hasConfidence");
        if (v51 == objc_msgSend(a3, "hasConfidence"))
        {
          -[AVMetadataFaceObject confidence](self, "confidence");
          v53 = v52;
          objc_msgSend(a3, "confidence");
          if (v53 == v54)
          {
            v55 = -[AVMetadataFaceObject hasPayingAttention](self, "hasPayingAttention");
            if (v55 == objc_msgSend(a3, "hasPayingAttention"))
            {
              if (!-[AVMetadataFaceObject hasPayingAttention](self, "hasPayingAttention")
                || (v56 = -[AVMetadataFaceObject payingAttention](self, "payingAttention"),
                    v56 == objc_msgSend(a3, "payingAttention")))
              {
                v57 = -[AVMetadataFaceObject hasPayingAttentionConfidence](self, "hasPayingAttentionConfidence");
                if (v57 == objc_msgSend(a3, "hasPayingAttentionConfidence"))
                {
                  if (!-[AVMetadataFaceObject hasPayingAttentionConfidence](self, "hasPayingAttentionConfidence")
                    || (-[AVMetadataFaceObject payingAttentionConfidence](self, "payingAttentionConfidence"),
                        v59 = v58,
                        objc_msgSend(a3, "payingAttentionConfidence"),
                        v59 == v60))
                  {
                    v61 = -[AVMetadataFaceObject hasDistance](self, "hasDistance");
                    if (v61 == objc_msgSend(a3, "hasDistance"))
                    {
                      if (!-[AVMetadataFaceObject hasDistance](self, "hasDistance")
                        || (-[AVMetadataFaceObject distance](self, "distance"),
                            v63 = v62,
                            objc_msgSend(a3, "distance"),
                            v63 == v64))
                      {
                        v65 = -[AVMetadataFaceObject hasOrientation](self, "hasOrientation");
                        if (v65 == objc_msgSend(a3, "hasOrientation"))
                        {
                          if (!-[AVMetadataFaceObject hasOrientation](self, "hasOrientation")
                            || (v66 = -[AVMetadataFaceObject orientation](self, "orientation"),
                                v66 == objc_msgSend(a3, "orientation")))
                          {
                            LOBYTE(v5) = 1;
                            return v5;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
LABEL_42:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (NSInteger)faceID
{
  return -[AVMetadataFaceObjectInternal faceID](self->_internal, "faceID");
}

- (BOOL)hasRollAngle
{
  return -[AVMetadataFaceObjectInternal hasRollAngle](self->_internal, "hasRollAngle");
}

- (CGFloat)rollAngle
{
  CGFloat result;
  void *v4;

  if (-[AVMetadataFaceObject hasRollAngle](self, "hasRollAngle"))
  {
    -[AVMetadataFaceObjectInternal rollAngle](self->_internal, "rollAngle");
  }
  else
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
    return 0.0;
  }
  return result;
}

- (BOOL)hasYawAngle
{
  return -[AVMetadataFaceObjectInternal hasYawAngle](self->_internal, "hasYawAngle");
}

- (CGFloat)yawAngle
{
  CGFloat result;
  void *v4;

  if (-[AVMetadataFaceObject hasYawAngle](self, "hasYawAngle"))
  {
    -[AVMetadataFaceObjectInternal yawAngle](self->_internal, "yawAngle");
  }
  else
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
    return 0.0;
  }
  return result;
}

- (BOOL)hasLeftEyeClosedConfidence
{
  return -[AVMetadataFaceObjectInternal hasLeftEyeClosedConfidence](self->_internal, "hasLeftEyeClosedConfidence");
}

- (BOOL)hasRightEyeClosedConfidence
{
  return -[AVMetadataFaceObjectInternal hasRightEyeClosedConfidence](self->_internal, "hasRightEyeClosedConfidence");
}

- (int)leftEyeClosedConfidence
{
  void *v4;

  if (-[AVMetadataFaceObject hasLeftEyeClosedConfidence](self, "hasLeftEyeClosedConfidence"))
    return -[AVMetadataFaceObjectInternal leftEyeClosedConfidence](self->_internal, "leftEyeClosedConfidence");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v4);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  return 0;
}

- (int)rightEyeClosedConfidence
{
  void *v4;

  if (-[AVMetadataFaceObject hasRightEyeClosedConfidence](self, "hasRightEyeClosedConfidence"))
    return -[AVMetadataFaceObjectInternal rightEyeClosedConfidence](self->_internal, "rightEyeClosedConfidence");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v4);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  return 0;
}

- (BOOL)hasSmileConfidence
{
  return -[AVMetadataFaceObjectInternal hasSmileConfidence](self->_internal, "hasSmileConfidence");
}

- (int)smileConfidence
{
  void *v4;

  if (-[AVMetadataFaceObject hasSmileConfidence](self, "hasSmileConfidence"))
    return -[AVMetadataFaceObjectInternal smileConfidence](self->_internal, "smileConfidence");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v4);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  return 0;
}

- (BOOL)hasLeftEyeBounds
{
  return -[AVMetadataFaceObjectInternal hasLeftEyeBounds](self->_internal, "hasLeftEyeBounds");
}

- (BOOL)hasRightEyeBounds
{
  return -[AVMetadataFaceObjectInternal hasRightEyeBounds](self->_internal, "hasRightEyeBounds");
}

- (CGRect)leftEyeBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  CGRect result;

  if (-[AVMetadataFaceObject hasLeftEyeBounds](self, "hasLeftEyeBounds"))
  {
    -[AVMetadataFaceObjectInternal leftEyeBounds](self->_internal, "leftEyeBounds");
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
    v3 = *MEMORY[0x1E0C9D628];
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)rightEyeBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  CGRect result;

  if (-[AVMetadataFaceObject hasRightEyeBounds](self, "hasRightEyeBounds"))
  {
    -[AVMetadataFaceObjectInternal rightEyeBounds](self->_internal, "rightEyeBounds");
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
    v3 = *MEMORY[0x1E0C9D628];
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)hasPitchAngle
{
  return -[AVMetadataFaceObjectInternal hasPitchAngle](self->_internal, "hasPitchAngle");
}

- (double)pitchAngle
{
  double result;
  void *v4;

  if (-[AVMetadataFaceObject hasPitchAngle](self, "hasPitchAngle"))
  {
    -[AVMetadataFaceObjectInternal pitchAngle](self->_internal, "pitchAngle");
  }
  else
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
    return 0.0;
  }
  return result;
}

- (BOOL)hasConfidence
{
  return -[AVMetadataFaceObjectInternal hasConfidence](self->_internal, "hasConfidence");
}

- (double)confidence
{
  double result;
  void *v4;

  if (-[AVMetadataFaceObject hasConfidence](self, "hasConfidence"))
  {
    -[AVMetadataFaceObjectInternal confidence](self->_internal, "confidence");
  }
  else
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
    return 0.0;
  }
  return result;
}

- (BOOL)hasPayingAttention
{
  return -[AVMetadataFaceObjectInternal hasPayingAttention](self->_internal, "hasPayingAttention");
}

- (BOOL)payingAttention
{
  void *v4;

  if (-[AVMetadataFaceObject hasPayingAttention](self, "hasPayingAttention"))
    return -[AVMetadataFaceObjectInternal payingAttention](self->_internal, "payingAttention");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v4);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  return 0;
}

- (BOOL)hasPayingAttentionConfidence
{
  return -[AVMetadataFaceObjectInternal hasPayingAttentionConfidence](self->_internal, "hasPayingAttentionConfidence");
}

- (double)payingAttentionConfidence
{
  double result;
  void *v4;

  if (-[AVMetadataFaceObject hasPayingAttentionConfidence](self, "hasPayingAttentionConfidence"))
  {
    -[AVMetadataFaceObjectInternal payingAttentionConfidence](self->_internal, "payingAttentionConfidence");
  }
  else
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
    return 0.0;
  }
  return result;
}

- (BOOL)hasDistance
{
  return -[AVMetadataFaceObjectInternal hasDistance](self->_internal, "hasDistance");
}

- (double)distance
{
  double result;
  void *v4;

  if (-[AVMetadataFaceObject hasDistance](self, "hasDistance"))
  {
    -[AVMetadataFaceObjectInternal distance](self->_internal, "distance");
  }
  else
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
    return 0.0;
  }
  return result;
}

- (BOOL)hasOrientation
{
  return -[AVMetadataFaceObjectInternal hasOrientation](self->_internal, "hasOrientation");
}

- (unint64_t)orientation
{
  void *v4;

  if (-[AVMetadataFaceObject hasOrientation](self, "hasOrientation"))
    return -[AVMetadataFaceObjectInternal orientation](self->_internal, "orientation");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v4);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
  return 0;
}

@end

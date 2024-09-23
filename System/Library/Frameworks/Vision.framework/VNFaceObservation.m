@implementation VNFaceObservation

- (BOOL)getFaceEXIFOrientation:(int *)a3 error:(id *)a4
{
  void *v6;
  float v7;
  double v8;

  -[VNFaceObservation roll](self, "roll");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  *(float *)&v8 = (float)(v7 * 180.0) / 3.1416;
  LOBYTE(a4) = +[VNFaceObservation _exifOrientationFromFaceRollAngle:exifOrientation:error:](VNFaceObservation, "_exifOrientationFromFaceRollAngle:exifOrientation:error:", a3, a4, v8);

  return (char)a4;
}

+ (BOOL)_exifOrientationFromFaceRollAngle:(float)a3 exifOrientation:(int *)a4 error:(id *)a5
{
  int v8;
  id v9;
  BOOL result;
  void *v11;

  if (a4)
  {
    if (a3 >= -45.0 && a3 < 45.0)
    {
      result = 1;
      *a4 = 1;
      return result;
    }
    if (a3 >= -135.0 && a3 < -45.0)
    {
      v8 = 8;
      goto LABEL_19;
    }
    if (a3 < -135.0 && a3 >= -180.0 || a3 >= 135.0 && a3 < 180.0)
    {
      v8 = 3;
LABEL_19:
      *a4 = v8;
      return 1;
    }
    if (a3 >= 45.0 && a3 < 135.0)
    {
      v8 = 6;
      goto LABEL_19;
    }
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[VNError errorForInvalidArgument:named:](VNError, "errorForInvalidArgument:named:", v11, CFSTR("face orientation"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else if (a5)
  {
    +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, CFSTR("exifOrientation cannot be null"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a5 = v9;
    return result;
  }
  return 0;
}

- (NSNumber)roll
{
  return self->_roll;
}

- (id)vn_cloneObject
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  CGSize size;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  objc_super v54;

  v54.receiver = self;
  v54.super_class = (Class)VNFaceObservation;
  -[VNDetectedObjectObservation vn_cloneObject](&v54, sel_vn_cloneObject);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[NSData copy](self->_alignedMeanShape, "copy");
    v5 = *(void **)(v3 + 440);
    *(_QWORD *)(v3 + 440) = v4;

    v6 = -[NSData copy](self->_landmarkPoints, "copy");
    v7 = *(void **)(v3 + 336);
    *(_QWORD *)(v3 + 336) = v6;

    v8 = -[NSData copy](self->_landmarkPoints65, "copy");
    v9 = *(void **)(v3 + 344);
    *(_QWORD *)(v3 + 344) = v8;

    *(_QWORD *)(v3 + 352) = self->_landmarksConstellation;
    v10 = -[NSArray copy](self->_landmarkPrecisionEstimatesPerPoint, "copy");
    v11 = *(void **)(v3 + 360);
    *(_QWORD *)(v3 + 360) = v10;

    v12 = -[NSData copy](self->_landmarkPoints3d, "copy");
    v13 = *(void **)(v3 + 368);
    *(_QWORD *)(v3 + 368) = v12;

    v14 = -[NSData copy](self->_poseData, "copy");
    v15 = *(void **)(v3 + 376);
    *(_QWORD *)(v3 + 376) = v14;

    v16 = -[VNRequestSpecifier copy](self->_poseOriginatingRequestSpecifier, "copy");
    v17 = *(void **)(v3 + 384);
    *(_QWORD *)(v3 + 384) = v16;

    v18 = -[NSDictionary copy](self->_expressionsAndScores, "copy");
    v19 = *(void **)(v3 + 272);
    *(_QWORD *)(v3 + 272) = v18;

    v20 = -[VNFaceprint copy](self->_faceprint, "copy");
    v21 = *(void **)(v3 + 224);
    *(_QWORD *)(v3 + 224) = v20;

    v22 = -[VNTorsoprint copy](self->_torsoprint, "copy");
    v23 = *(void **)(v3 + 232);
    *(_QWORD *)(v3 + 232) = v22;

    v24 = -[VNFaceTorsoprint copy](self->_faceTorsoprint, "copy");
    v25 = *(void **)(v3 + 240);
    *(_QWORD *)(v3 + 240) = v24;

    v26 = -[VNFaceRegionMap copy](self->_faceRegionMap, "copy");
    v27 = *(void **)(v3 + 208);
    *(_QWORD *)(v3 + 208) = v26;

    v28 = -[VNFaceSegments copy](self->_faceSegments, "copy");
    v29 = *(void **)(v3 + 248);
    *(_QWORD *)(v3 + 248) = v28;

    size = self->_unalignedBoundingBox.size;
    *(CGPoint *)(v3 + 304) = self->_unalignedBoundingBox.origin;
    *(CGSize *)(v3 + 320) = size;
    *(_BYTE *)(v3 + 408) = self->_boundingBoxAligned;
    *(_Geometry2D_rect2D_ *)(v3 + 288) = self->_alignedBoundingBox;
    *(float *)(v3 + 412) = self->_alignedRotationAngle;
    v31 = -[NSNumber copy](self->_roll, "copy");
    v32 = *(void **)(v3 + 416);
    *(_QWORD *)(v3 + 416) = v31;

    v33 = -[NSNumber copy](self->_yaw, "copy");
    v34 = *(void **)(v3 + 424);
    *(_QWORD *)(v3 + 424) = v33;

    v35 = -[NSNumber copy](self->_pitch, "copy");
    v36 = *(void **)(v3 + 432);
    *(_QWORD *)(v3 + 432) = v35;

    *(float *)(v3 + 256) = self->_landmarkScore;
    *(_BYTE *)(v3 + 260) = self->_isBlinking;
    *(float *)(v3 + 264) = self->_blinkScore;
    *(_QWORD *)(v3 + 400) = self->_faceId;
    *(float *)(v3 + 392) = self->_faceIdConfidence;
    v37 = -[NSNumber copy](self->_faceCaptureQuality, "copy");
    v38 = *(void **)(v3 + 448);
    *(_QWORD *)(v3 + 448) = v37;

    v39 = -[VNRequestSpecifier copy](self->_faceCaptureQualityOriginatingRequestSpecifier, "copy");
    v40 = *(void **)(v3 + 456);
    *(_QWORD *)(v3 + 456) = v39;

    *(float *)(v3 + 280) = self->_faceJunkinessIndex;
    *(float *)(v3 + 284) = self->_faceOrientationIndex;
    v41 = -[VNRequestSpecifier copy](self->_landmarksOriginatingRequestSpecifier, "copy");
    v42 = *(void **)(v3 + 464);
    *(_QWORD *)(v3 + 464) = v41;

    v43 = -[VNRequestSpecifier copy](self->_landmarks3DOriginatingRequestSpecifier, "copy");
    v44 = *(void **)(v3 + 472);
    *(_QWORD *)(v3 + 472) = v43;

    v45 = -[VNFaceLegacyFaceCore copy](self->_legacyFaceCore, "copy");
    v46 = *(void **)(v3 + 480);
    *(_QWORD *)(v3 + 480) = v45;

    v47 = -[VNFaceGaze copy](self->_gaze, "copy");
    v48 = *(void **)(v3 + 488);
    *(_QWORD *)(v3 + 488) = v47;

    v49 = -[VNFaceScreenGaze copy](self->_faceScreenGaze, "copy");
    v50 = *(void **)(v3 + 496);
    *(_QWORD *)(v3 + 496) = v49;

    v51 = -[VNFaceAttributes copy](self->_faceAttributes, "copy");
    v52 = *(void **)(v3 + 216);
    *(_QWORD *)(v3 + 216) = v51;

  }
  return (id)v3;
}

- (id)faceprint
{
  return self->_faceprint;
}

- (VNFaceAttributes)faceAttributes
{
  return self->_faceAttributes;
}

- (CGRect)unalignedBoundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_unalignedBoundingBox.origin.x;
  y = self->_unalignedBoundingBox.origin.y;
  width = self->_unalignedBoundingBox.size.width;
  height = self->_unalignedBoundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFaceprint:(id)a3
{
  objc_storeStrong((id *)&self->_faceprint, a3);
}

+ (VNFaceObservation)faceObservationWithRequestRevision:(NSUInteger)requestRevision boundingBox:(CGRect)boundingBox roll:(NSNumber *)roll yaw:(NSNumber *)yaw pitch:(NSNumber *)pitch
{
  uint64_t v8;
  uint64_t v9;

  LODWORD(v9) = 0;
  BYTE4(v8) = 0;
  LODWORD(v8) = 0;
  objc_msgSend(a1, "faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:isBoundingBoxAligned:alignedBoundingBox:landmarks:landmarks65:landmarkScore:isBlinking:blinkScore:faceOrientationIndex:faceJunkinessIndex:", requestRevision, roll, yaw, pitch, 0, 0, boundingBox.origin.x, boundingBox.origin.y, boundingBox.size.width, boundingBox.size.height, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), 0, v8,
    0,
    v9);
  return (VNFaceObservation *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setYaw:(id)a3
{
  objc_storeStrong((id *)&self->_yaw, a3);
}

- (void)setUnalignedBoundingBox:(CGRect)a3
{
  self->_unalignedBoundingBox = a3;
}

- (void)setRoll:(id)a3
{
  objc_storeStrong((id *)&self->_roll, a3);
}

- (void)setPitch:(id)a3
{
  objc_storeStrong((id *)&self->_pitch, a3);
}

- (VNFaceObservation)initWithRequestRevision:(unint64_t)a3
{
  VNFaceObservation *v3;
  VNFaceObservation *v4;
  VNFaceObservation *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VNFaceObservation;
  v3 = -[VNObservation initWithRequestRevision:](&v7, sel_initWithRequestRevision_, a3);
  v4 = v3;
  if (v3)
  {
    -[VNFaceObservation _initLocks](v3, "_initLocks");
    v5 = v4;
  }

  return v4;
}

- (void)_initLocks
{
  self->_cachedLandmarksLock._os_unfair_lock_opaque = 0;
  self->_cachedLandmarks65Lock._os_unfair_lock_opaque = 0;
  self->_cachedLandmarks3dLock._os_unfair_lock_opaque = 0;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNDetectFaceRectanglesRequest");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceScreenGaze, 0);
  objc_storeStrong((id *)&self->_gaze, 0);
  objc_storeStrong((id *)&self->_legacyFaceCore, 0);
  objc_storeStrong((id *)&self->_landmarks3DOriginatingRequestSpecifier, 0);
  objc_storeStrong((id *)&self->_landmarksOriginatingRequestSpecifier, 0);
  objc_storeStrong((id *)&self->_faceCaptureQualityOriginatingRequestSpecifier, 0);
  objc_storeStrong((id *)&self->_faceCaptureQuality, 0);
  objc_storeStrong((id *)&self->_alignedMeanShape, 0);
  objc_storeStrong((id *)&self->_pitch, 0);
  objc_storeStrong((id *)&self->_yaw, 0);
  objc_storeStrong((id *)&self->_roll, 0);
  objc_storeStrong((id *)&self->_poseOriginatingRequestSpecifier, 0);
  objc_storeStrong((id *)&self->_poseData, 0);
  objc_storeStrong((id *)&self->_landmarkPoints3d, 0);
  objc_storeStrong((id *)&self->_landmarkPrecisionEstimatesPerPoint, 0);
  objc_storeStrong((id *)&self->_landmarkPoints65, 0);
  objc_storeStrong((id *)&self->_landmarkPoints, 0);
  objc_storeStrong((id *)&self->_expressionsAndScores, 0);
  objc_storeStrong((id *)&self->_faceSegments, 0);
  objc_storeStrong((id *)&self->_faceTorsoprint, 0);
  objc_storeStrong((id *)&self->_torsoprint, 0);
  objc_storeStrong((id *)&self->_faceprint, 0);
  objc_storeStrong((id *)&self->_faceAttributes, 0);
  objc_storeStrong((id *)&self->_faceRegionMap, 0);
  objc_storeStrong((id *)&self->_cachedLandmarks3d, 0);
  objc_storeStrong((id *)&self->_cachedLandmarks65, 0);
  objc_storeStrong((id *)&self->_cachedLandmarks, 0);
}

- (id)VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v6 = a3;
  v7 = objc_msgSend(v6, "requestClassAndReturnError:", a4);
  if (!v7)
  {
    v8 = 0;
    goto LABEL_11;
  }
  if (v7 == objc_opt_class())
  {
    -[VNFaceObservation faceprint](self, "faceprint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[VNFaceObservation faceTorsoprint](self, "faceTorsoprint");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "faceprint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    _validatedEntityPrintOriginatingRequestSpecifierCompatibility(self, CFSTR("faceprint"), v9, v6, a4);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (v7 == objc_opt_class())
  {
    -[VNFaceObservation torsoprint](self, "torsoprint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _validatedEntityPrintOriginatingRequestSpecifierCompatibility(self, CFSTR("torsoprint"), v9, v6, a4);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v8 = (void *)v11;

    goto LABEL_11;
  }
  v13.receiver = self;
  v13.super_class = (Class)VNFaceObservation;
  -[VNObservation VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier:error:](&v13, sel_VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier_error_, v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v8;
}

- (id)VNPersonsModelFaceprintWithRequestRevision:(unint64_t)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  -[VNFaceObservation faceprint](self, "faceprint");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[VNFaceObservation faceTorsoprint](self, "faceTorsoprint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "faceprint");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      if (a4)
      {
        +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", CFSTR("faceprint is not available from the observation"));
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v7 = 0;
        goto LABEL_10;
      }
      v7 = 0;
LABEL_12:
      v9 = 0;
      goto LABEL_13;
    }
  }
  if (a3 && objc_msgSend(v7, "requestRevision") != a3)
  {
    if (a4)
    {
      +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, CFSTR("incompatible faceprint revision"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v9 = 0;
      *a4 = v10;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v7 = v7;
  v9 = v7;
LABEL_13:

  return v9;
}

- (VNFaceObservation)initWithCoder:(id)a3
{
  id v4;
  VNFaceObservation *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  float v10;
  float v11;
  float v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  CGRect *p_unalignedBoundingBox;
  float v23;
  float v24;
  float v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  uint64_t v34;
  NSData *landmarkPoints;
  uint64_t v36;
  NSData *landmarkPoints65;
  uint64_t v38;
  NSArray *landmarkPrecisionEstimatesPerPoint;
  unint64_t v40;
  VNRequestSpecifier *landmarksOriginatingRequestSpecifier;
  void *v42;
  VNFaceObservation *v43;
  uint64_t v45;
  NSData *landmarkPoints3d;
  uint64_t v47;
  NSData *poseData;
  NSData *v49;
  uint64_t v50;
  VNRequestSpecifier *poseOriginatingRequestSpecifier;
  uint64_t v52;
  id v53;
  VNRequestSpecifier *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  NSDictionary *expressionsAndScores;
  float v60;
  uint64_t v61;
  VNFaceprint *faceprint;
  uint64_t v63;
  VNTorsoprint *torsoprint;
  uint64_t v65;
  VNFaceTorsoprint *faceTorsoprint;
  float v67;
  uint64_t v68;
  NSNumber *roll;
  uint64_t v70;
  NSNumber *yaw;
  uint64_t v72;
  NSNumber *pitch;
  uint64_t v74;
  VNFaceRegionMap *faceRegionMap;
  uint64_t v76;
  VNFaceAttributes *faceAttributes;
  uint64_t v78;
  VNFaceSegments *faceSegments;
  float v80;
  uint64_t v81;
  NSData *alignedMeanShape;
  float v83;
  float v84;
  uint64_t v85;
  NSNumber *faceCaptureQuality;
  uint64_t v87;
  VNRequestSpecifier *faceCaptureQualityOriginatingRequestSpecifier;
  float v89;
  uint64_t v90;
  uint64_t v91;
  VNRequestSpecifier *v92;
  uint64_t v93;
  uint64_t v94;
  VNRequestSpecifier *landmarks3DOriginatingRequestSpecifier;
  uint64_t v96;
  VNFaceGaze *gaze;
  uint64_t v98;
  VNFaceScreenGaze *faceScreenGaze;
  uint64_t v100;
  id v101;
  id v102;
  id v103;
  objc_super v104;

  v4 = a3;
  v104.receiver = self;
  v104.super_class = (Class)VNFaceObservation;
  v5 = -[VNDetectedObjectObservation initWithCoder:](&v104, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_23;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  if (objc_msgSend(v4, "vn_decodeCodingVersionForKey:", CFSTR("VNFaceObservation")))
    goto LABEL_23;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("alignedBBX"));
  v5->_alignedBoundingBox.origin.x = v9;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("alignedBBY"));
  v5->_alignedBoundingBox.origin.y = v10;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("alignedBBW"));
  v5->_alignedBoundingBox.size.width = v11;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("alignedBBH"));
  v5->_alignedBoundingBox.size.height = v12;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("unalignedBBX"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("unalignedBBY"))
    && objc_msgSend(v4, "containsValueForKey:", CFSTR("unalignedBBW")))
  {
    v13 = objc_msgSend(v4, "containsValueForKey:", CFSTR("unalignedBBH"));
  }
  else
  {
    v13 = 0;
  }
  v14 = objc_msgSend(v4, "containsValueForKey:", CFSTR("unalignedBBXAsDouble"));
  if (v14)
  {
    v14 = objc_msgSend(v4, "containsValueForKey:", CFSTR("unalignedBBYAsDouble"));
    if (v14)
    {
      v14 = objc_msgSend(v4, "containsValueForKey:", CFSTR("unalignedBBWAsDouble"));
      if (v14)
        v14 = objc_msgSend(v4, "containsValueForKey:", CFSTR("unalignedBBHAsDouble"));
    }
  }
  if (v13)
  {
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("unalignedBBX"));
    p_unalignedBoundingBox = &v5->_unalignedBoundingBox;
    v5->_unalignedBoundingBox.origin.x = v21;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("unalignedBBY"));
    v5->_unalignedBoundingBox.origin.y = v23;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("unalignedBBW"));
    v5->_unalignedBoundingBox.size.width = v24;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("unalignedBBH"));
    v26 = v25;
LABEL_16:
    p_unalignedBoundingBox->size.height = v26;
    goto LABEL_18;
  }
  if (v14)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("unalignedBBXAsDouble"));
    p_unalignedBoundingBox = &v5->_unalignedBoundingBox;
    v5->_unalignedBoundingBox.origin.x = v27;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("unalignedBBYAsDouble"));
    v5->_unalignedBoundingBox.origin.y = v28;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("unalignedBBWAsDouble"));
    v5->_unalignedBoundingBox.size.width = v29;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("unalignedBBHAsDouble"));
    goto LABEL_16;
  }
  VNValidatedLog(1, (uint64_t)CFSTR("Unaligned face bounding box is not archived, initializing _unalignedBoundingBox with _boundingBox"), v15, v16, v17, v18, v19, v20, v100);
  -[VNDetectedObjectObservation boundingBox](v5, "boundingBox");
  v5->_unalignedBoundingBox.origin.x = v30;
  v5->_unalignedBoundingBox.origin.y = v31;
  v5->_unalignedBoundingBox.size.width = v32;
  v5->_unalignedBoundingBox.size.height = v33;
LABEL_18:
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("landmarks"));
  v34 = objc_claimAutoreleasedReturnValue();
  landmarkPoints = v5->_landmarkPoints;
  v5->_landmarkPoints = (NSData *)v34;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("landmarks65"));
  v36 = objc_claimAutoreleasedReturnValue();
  landmarkPoints65 = v5->_landmarkPoints65;
  v5->_landmarkPoints65 = (NSData *)v36;

  if (!v5->_landmarkPoints65)
    objc_storeStrong((id *)&v5->_landmarkPoints65, v5->_landmarkPoints);
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", v7, CFSTR("precisionEstimates"));
  v38 = objc_claimAutoreleasedReturnValue();
  landmarkPrecisionEstimatesPerPoint = v5->_landmarkPrecisionEstimatesPerPoint;
  v5->_landmarkPrecisionEstimatesPerPoint = (NSArray *)v38;

  v40 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("landmarksConstellation"));
  v5->_landmarksConstellation = v40;
  if (v40 < 3)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("landmarks3D"));
    v45 = objc_claimAutoreleasedReturnValue();
    landmarkPoints3d = v5->_landmarkPoints3d;
    v5->_landmarkPoints3d = (NSData *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("pose"));
    v47 = objc_claimAutoreleasedReturnValue();
    poseData = v5->_poseData;
    v5->_poseData = (NSData *)v47;

    v49 = v5->_poseData;
    if (v49)
    {
      if (-[NSData length](v49, "length") != 48)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("invalid pose data"));
      if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("poseOrigReq")) & 1) != 0)
      {
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("poseOrigReq"));
        v50 = objc_claimAutoreleasedReturnValue();
        poseOriginatingRequestSpecifier = v5->_poseOriginatingRequestSpecifier;
        v5->_poseOriginatingRequestSpecifier = (VNRequestSpecifier *)v50;

        if (!v5->_poseOriginatingRequestSpecifier)
          goto LABEL_23;
      }
      else
      {
        v103 = 0;
        +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", objc_opt_class(), 1, &v103);
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = v103;
        v54 = v5->_poseOriginatingRequestSpecifier;
        v5->_poseOriginatingRequestSpecifier = (VNRequestSpecifier *)v52;

        if (!v5->_poseOriginatingRequestSpecifier)
        {
          objc_msgSend(v4, "failWithError:", v53);

          goto LABEL_23;
        }

      }
    }
    v55 = (void *)MEMORY[0x1E0C99E60];
    v56 = objc_opt_class();
    objc_msgSend(v55, "setWithObjects:", v56, objc_opt_class(), v7, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v57, CFSTR("expressions"));
    v58 = objc_claimAutoreleasedReturnValue();
    expressionsAndScores = v5->_expressionsAndScores;
    v5->_expressionsAndScores = (NSDictionary *)v58;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("faceIDConfidence"));
    v5->_faceIdConfidence = v60;
    v5->_faceId = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("faceID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faceprint"));
    v61 = objc_claimAutoreleasedReturnValue();
    faceprint = v5->_faceprint;
    v5->_faceprint = (VNFaceprint *)v61;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("torsoprint"));
    v63 = objc_claimAutoreleasedReturnValue();
    torsoprint = v5->_torsoprint;
    v5->_torsoprint = (VNTorsoprint *)v63;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faceTorsoprint"));
    v65 = objc_claimAutoreleasedReturnValue();
    faceTorsoprint = v5->_faceTorsoprint;
    v5->_faceTorsoprint = (VNFaceTorsoprint *)v65;

    v5->_boundingBoxAligned = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAlignedBBox"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("alignedRotAngle"));
    v5->_alignedRotationAngle = v67;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("roll"));
    v68 = objc_claimAutoreleasedReturnValue();
    roll = v5->_roll;
    v5->_roll = (NSNumber *)v68;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("yaw"));
    v70 = objc_claimAutoreleasedReturnValue();
    yaw = v5->_yaw;
    v5->_yaw = (NSNumber *)v70;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("pitch"));
    v72 = objc_claimAutoreleasedReturnValue();
    pitch = v5->_pitch;
    v5->_pitch = (NSNumber *)v72;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faceRegionMap"));
    v74 = objc_claimAutoreleasedReturnValue();
    faceRegionMap = v5->_faceRegionMap;
    v5->_faceRegionMap = (VNFaceRegionMap *)v74;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faceAttributes"));
    v76 = objc_claimAutoreleasedReturnValue();
    faceAttributes = v5->_faceAttributes;
    v5->_faceAttributes = (VNFaceAttributes *)v76;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("faceSmntcSegments"));
    v78 = objc_claimAutoreleasedReturnValue();
    faceSegments = v5->_faceSegments;
    v5->_faceSegments = (VNFaceSegments *)v78;

    v5->_isBlinking = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blinking"));
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("blinkScore"));
    v5->_blinkScore = v80;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("alignedMeanShape"));
    v81 = objc_claimAutoreleasedReturnValue();
    alignedMeanShape = v5->_alignedMeanShape;
    v5->_alignedMeanShape = (NSData *)v81;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("landmarksScore"));
    v5->_landmarkScore = v83;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("faceJunkinessIndex"));
    v5->_faceJunkinessIndex = v84;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("faceCaptureQuality"));
    v85 = objc_claimAutoreleasedReturnValue();
    faceCaptureQuality = v5->_faceCaptureQuality;
    v5->_faceCaptureQuality = (NSNumber *)v85;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("faceCQOReq"));
    v87 = objc_claimAutoreleasedReturnValue();
    faceCaptureQualityOriginatingRequestSpecifier = v5->_faceCaptureQualityOriginatingRequestSpecifier;
    v5->_faceCaptureQualityOriginatingRequestSpecifier = (VNRequestSpecifier *)v87;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("faceOrientationIndex"));
    v5->_faceOrientationIndex = v89;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("faceLMOReq")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("faceLMOReq"));
      v90 = objc_claimAutoreleasedReturnValue();
      landmarksOriginatingRequestSpecifier = v5->_landmarksOriginatingRequestSpecifier;
      v5->_landmarksOriginatingRequestSpecifier = (VNRequestSpecifier *)v90;
    }
    else
    {
      if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("faceLMRequestRev")))
        goto LABEL_38;
      v102 = 0;
      +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", objc_opt_class(), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("faceLMRequestRev")), &v102);
      v91 = objc_claimAutoreleasedReturnValue();
      landmarksOriginatingRequestSpecifier = (VNRequestSpecifier *)v102;
      v92 = v5->_landmarksOriginatingRequestSpecifier;
      v5->_landmarksOriginatingRequestSpecifier = (VNRequestSpecifier *)v91;

      if (!v5->_landmarksOriginatingRequestSpecifier)
      {
        objc_msgSend(v4, "failWithError:", landmarksOriginatingRequestSpecifier);
        goto LABEL_22;
      }
    }

LABEL_38:
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("faceLM3DOReq")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("faceLM3DOReq"));
      v93 = objc_claimAutoreleasedReturnValue();
      landmarksOriginatingRequestSpecifier = v5->_landmarks3DOriginatingRequestSpecifier;
      v5->_landmarks3DOriginatingRequestSpecifier = (VNRequestSpecifier *)v93;
    }
    else
    {
      if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("faceLM3DRequestRev")))
      {
LABEL_43:
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("gaze"));
        v96 = objc_claimAutoreleasedReturnValue();
        gaze = v5->_gaze;
        v5->_gaze = (VNFaceGaze *)v96;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("screengaze"));
        v98 = objc_claimAutoreleasedReturnValue();
        faceScreenGaze = v5->_faceScreenGaze;
        v5->_faceScreenGaze = (VNFaceScreenGaze *)v98;

        -[VNFaceObservation _initLocks](v5, "_initLocks");
        v43 = v5;
        goto LABEL_24;
      }
      v101 = 0;
      +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", objc_opt_class(), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("faceLM3DRequestRev")), &v101);
      v94 = objc_claimAutoreleasedReturnValue();
      landmarksOriginatingRequestSpecifier = (VNRequestSpecifier *)v101;
      landmarks3DOriginatingRequestSpecifier = v5->_landmarks3DOriginatingRequestSpecifier;
      v5->_landmarks3DOriginatingRequestSpecifier = (VNRequestSpecifier *)v94;

      if (!v5->_landmarks3DOriginatingRequestSpecifier)
      {
        objc_msgSend(v4, "failWithError:", landmarksOriginatingRequestSpecifier);
        goto LABEL_22;
      }
    }

    goto LABEL_43;
  }
  landmarksOriginatingRequestSpecifier = (VNRequestSpecifier *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Data integrity check failed when un-archiving landmarks constellation. Un-archived constellation is out of range: %lu"), v5->_landmarksConstellation);
  +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", landmarksOriginatingRequestSpecifier);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failWithError:", v42);

LABEL_22:
LABEL_23:
  v43 = 0;
LABEL_24:

  return v43;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSData *v9;
  char v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VNFaceObservation;
  -[VNDetectedObjectObservation encodeWithCoder:](&v17, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", 0, CFSTR("VNFaceObservation"));
  *(float *)&v5 = self->_alignedBoundingBox.origin.x;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("alignedBBX"), v5);
  *(float *)&v6 = self->_alignedBoundingBox.origin.y;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("alignedBBY"), v6);
  *(float *)&v7 = self->_alignedBoundingBox.size.width;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("alignedBBW"), v7);
  *(float *)&v8 = self->_alignedBoundingBox.size.height;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("alignedBBH"), v8);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("unalignedBBXAsDouble"), self->_unalignedBoundingBox.origin.x);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("unalignedBBYAsDouble"), self->_unalignedBoundingBox.origin.y);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("unalignedBBWAsDouble"), self->_unalignedBoundingBox.size.width);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("unalignedBBHAsDouble"), self->_unalignedBoundingBox.size.height);
  objc_msgSend(v4, "encodeObject:forKey:", self->_landmarkPoints, CFSTR("landmarks"));
  v9 = self->_landmarkPoints;
  v10 = VisionCoreEqualOrNilObjects();

  if ((v10 & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_landmarkPoints65, CFSTR("landmarks65"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_landmarkPrecisionEstimatesPerPoint, CFSTR("precisionEstimates"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_landmarksConstellation, CFSTR("landmarksConstellation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_landmarkPoints3d, CFSTR("landmarks3D"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_poseData, CFSTR("pose"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_poseOriginatingRequestSpecifier, CFSTR("poseOrigReq"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_expressionsAndScores, CFSTR("expressions"));
  *(float *)&v11 = self->_faceIdConfidence;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("faceIDConfidence"), v11);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_faceId, CFSTR("faceID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceprint, CFSTR("faceprint"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_torsoprint, CFSTR("torsoprint"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceTorsoprint, CFSTR("faceTorsoprint"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_boundingBoxAligned, CFSTR("hasAlignedBBox"));
  *(float *)&v12 = self->_alignedRotationAngle;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("alignedRotAngle"), v12);
  objc_msgSend(v4, "encodeObject:forKey:", self->_roll, CFSTR("roll"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_yaw, CFSTR("yaw"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_pitch, CFSTR("pitch"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceRegionMap, CFSTR("faceRegionMap"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceAttributes, CFSTR("faceAttributes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceSegments, CFSTR("faceSmntcSegments"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isBlinking, CFSTR("blinking"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_alignedMeanShape, CFSTR("alignedMeanShape"));
  *(float *)&v13 = self->_blinkScore;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("blinkScore"), v13);
  *(float *)&v14 = self->_landmarkScore;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("landmarksScore"), v14);
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceCaptureQuality, CFSTR("faceCaptureQuality"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceCaptureQualityOriginatingRequestSpecifier, CFSTR("faceCQOReq"));
  *(float *)&v15 = self->_faceJunkinessIndex;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("faceJunkinessIndex"), v15);
  *(float *)&v16 = self->_faceOrientationIndex;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("faceOrientationIndex"), v16);
  objc_msgSend(v4, "encodeObject:forKey:", self->_landmarksOriginatingRequestSpecifier, CFSTR("faceLMOReq"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_landmarks3DOriginatingRequestSpecifier, CFSTR("faceLM3DOReq"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_gaze, CFSTR("gaze"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_faceScreenGaze, CFSTR("screengaze"));

}

- (unint64_t)hash
{
  id v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  float v26;
  float v27;
  void *v28;
  void *v29;
  void *v30;
  float v31;
  float v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  __int128 v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _BOOL4 v74;
  float v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _BOOL4 v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  objc_super v85;

  v85.receiver = self;
  v85.super_class = (Class)VNFaceObservation;
  v3 = -[VNDetectedObjectObservation hash](&v85, sel_hash);
  -[VNFaceObservation alignedBoundingBox](self, "alignedBoundingBox");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[VNFaceObservation landmarkPoints](self, "landmarkPoints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");

  -[VNFaceObservation landmarkPoints65](self, "landmarkPoints65");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");

  v16 = -[VNFaceObservation landmarksConstellation](self, "landmarksConstellation");
  -[VNFaceObservation landmarkPrecisionEstimatesPerPoint](self, "landmarkPrecisionEstimatesPerPoint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash");

  -[VNFaceObservation landmarkPoints3d](self, "landmarkPoints3d");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash");

  -[VNFaceObservation poseData](self, "poseData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "hash");

  -[VNFaceObservation poseOriginatingRequestSpecifier](self, "poseOriginatingRequestSpecifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "hash");

  -[VNFaceObservation expressionsAndScores](self, "expressionsAndScores");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend(v25, "hash");

  v83 = -[VNFaceObservation faceId](self, "faceId");
  -[VNFaceObservation faceIdConfidence](self, "faceIdConfidence");
  v27 = v26;
  -[VNFaceObservation faceprint](self, "faceprint");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v28, "hash");

  -[VNFaceObservation torsoprint](self, "torsoprint");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v29, "hash");

  -[VNFaceObservation faceTorsoprint](self, "faceTorsoprint");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v30, "hash");

  v79 = -[VNFaceObservation isBoundingBoxAligned](self, "isBoundingBoxAligned");
  -[VNFaceObservation alignedRotationAngle](self, "alignedRotationAngle");
  v32 = v31;
  -[VNFaceObservation faceRegionMap](self, "faceRegionMap");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v33, "hash");

  -[VNFaceObservation faceAttributes](self, "faceAttributes");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v34, "hash");

  -[VNFaceObservation faceSegments](self, "faceSegments");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v35, "hash");
  v75 = v9;

  v74 = -[VNFaceObservation isBlinking](self, "isBlinking");
  -[VNFaceObservation alignedMeanShape](self, "alignedMeanShape");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v36, "hash");
  v70 = v24;
  v71 = v22;
  v72 = v20;
  v37 = v18;
  v38 = v15;

  -[VNFaceObservation landmarkScore](self, "landmarkScore");
  v40 = v39;
  -[VNFaceObservation faceJunkinessIndex](self, "faceJunkinessIndex");
  v42 = v41;
  -[VNFaceObservation faceOrientationIndex](self, "faceOrientationIndex");
  v44 = v43;
  -[VNFaceObservation landmarksOriginatingRequestSpecifier](self, "landmarksOriginatingRequestSpecifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "hash");
  v47 = v13;

  -[VNFaceObservation landmarks3DOriginatingRequestSpecifier](self, "landmarks3DOriginatingRequestSpecifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "hash");

  -[VNFaceObservation gaze](self, "gaze");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "hash");

  -[VNFaceObservation faceScreenGaze](self, "faceScreenGaze");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "hash");
  v54 = LODWORD(v44);
  if (v44 == 0.0)
    v54 = 0;
  v55 = LODWORD(v42);
  if (v42 == 0.0)
    v55 = 0;
  v56 = LODWORD(v40);
  if (v40 == 0.0)
    v56 = 0;
  v57 = LODWORD(v32);
  if (v32 == 0.0)
    v57 = 0;
  v58 = LODWORD(v27);
  if (v27 == 0.0)
    v58 = 0;
  v59 = (unint64_t)LODWORD(v5) << 13;
  if (v5 == 0.0)
    v59 = 0;
  v60 = LODWORD(v7);
  if (v7 == 0.0)
    v60 = 0;
  v61 = v59 ^ v60;
  v62 = LODWORD(v11);
  if (v11 == 0.0)
    v62 = 0;
  v63 = v62 ^ (v61 << 13);
  v64 = LODWORD(v75);
  if (v75 == 0.0)
    v64 = 0;
  v65 = __ROR8__(v80 ^ __ROR8__(v81 ^ __ROR8__(v82 ^ __ROR8__(v58 ^ __ROR8__(v83 ^ __ROR8__(v84 ^ __ROR8__(v70 ^ __ROR8__(v71 ^ __ROR8__(v72 ^ __ROR8__(v37 ^ __ROR8__(v16 ^ __ROR8__(v38 ^ __ROR8__(v47 ^ __ROR8__(v64 ^ __ROR8__(v63, 51) ^ __ROR8__(v3, 51), 51), 51), 51), 51), 51), 51), 51), 51), 51),
                                          51),
                                  51),
                          51),
                  51),
          51);
  *((_QWORD *)&v66 + 1) = v79 ^ v65;
  *(_QWORD *)&v66 = v65;
  v67 = __ROR8__(v76 ^ __ROR8__(v77 ^ __ROR8__(v78 ^ __ROR8__((v66 >> 51) ^ v57, 51), 51), 51), 51);
  *((_QWORD *)&v66 + 1) = v74 ^ v67;
  *(_QWORD *)&v66 = v67;
  v68 = v53 ^ __ROR8__(v51 ^ __ROR8__(v49 ^ __ROR8__(v46 ^ __ROR8__(v54 ^ __ROR8__(v55 ^ __ROR8__(v56 ^ __ROR8__((v66 >> 51) ^ v73, 51), 51), 51), 51), 51), 51), 51);

  return v68;
}

- (BOOL)isEqual:(id)a3
{
  VNFaceObservation *v4;
  VNFaceObservation *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  unint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  char v40;
  unint64_t v41;
  float v42;
  float v43;
  float v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  char v53;
  _BOOL4 v54;
  float v55;
  float v56;
  float v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  void *v65;
  char v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  char v70;
  float v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  void *v80;
  void *v81;
  char v82;
  void *v83;
  void *v84;
  char v85;
  void *v86;
  void *v87;
  char v88;
  void *v89;
  void *v90;
  char v91;
  void *v92;
  void *v93;
  char v94;
  void *v95;
  void *v96;
  objc_super v98;

  v4 = (VNFaceObservation *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    v98.receiver = self;
    v98.super_class = (Class)VNFaceObservation;
    if (-[VNDetectedObjectObservation isEqual:](&v98, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[VNFaceObservation alignedBoundingBox](self, "alignedBoundingBox");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      -[VNFaceObservation alignedBoundingBox](v5, "alignedBoundingBox");
      v18 = 0;
      if (v7 == v14 && v9 == v15)
      {
        v18 = 0;
        if (v13 == v17 && v11 == v16)
        {
          if (!CGRectEqualToRect(self->_unalignedBoundingBox, v5->_unalignedBoundingBox))
            goto LABEL_42;
          -[VNFaceObservation landmarkPoints](self, "landmarkPoints");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNFaceObservation landmarkPoints](v5, "landmarkPoints");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = VisionCoreEqualOrNilObjects();

          if ((v21 & 1) == 0)
            goto LABEL_42;
          -[VNFaceObservation landmarkPoints65](self, "landmarkPoints65");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNFaceObservation landmarkPoints65](v5, "landmarkPoints65");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = VisionCoreEqualOrNilObjects();

          if ((v24 & 1) == 0)
            goto LABEL_42;
          v25 = -[VNFaceObservation landmarksConstellation](self, "landmarksConstellation");
          if (v25 != -[VNFaceObservation landmarksConstellation](v5, "landmarksConstellation"))
            goto LABEL_42;
          -[VNFaceObservation landmarkPrecisionEstimatesPerPoint](self, "landmarkPrecisionEstimatesPerPoint");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNFaceObservation landmarkPrecisionEstimatesPerPoint](v5, "landmarkPrecisionEstimatesPerPoint");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = VisionCoreEqualOrNilObjects();

          if ((v28 & 1) == 0)
            goto LABEL_42;
          -[VNFaceObservation landmarkPoints3d](self, "landmarkPoints3d");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNFaceObservation landmarkPoints3d](v5, "landmarkPoints3d");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = VisionCoreEqualOrNilObjects();

          if ((v31 & 1) == 0)
            goto LABEL_42;
          -[VNFaceObservation poseData](self, "poseData");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNFaceObservation poseData](v5, "poseData");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = VisionCoreEqualOrNilObjects();

          if ((v34 & 1) == 0)
            goto LABEL_42;
          -[VNFaceObservation poseOriginatingRequestSpecifier](self, "poseOriginatingRequestSpecifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNFaceObservation poseOriginatingRequestSpecifier](v5, "poseOriginatingRequestSpecifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = VisionCoreEqualOrNilObjects();

          if ((v37 & 1) == 0)
            goto LABEL_42;
          -[VNFaceObservation expressionsAndScores](self, "expressionsAndScores");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNFaceObservation expressionsAndScores](v5, "expressionsAndScores");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = VisionCoreEqualOrNilObjects();

          if ((v40 & 1) == 0)
            goto LABEL_42;
          v41 = -[VNFaceObservation faceId](self, "faceId");
          if (v41 != -[VNFaceObservation faceId](v5, "faceId"))
            goto LABEL_42;
          -[VNFaceObservation faceIdConfidence](self, "faceIdConfidence");
          v43 = v42;
          -[VNFaceObservation faceIdConfidence](v5, "faceIdConfidence");
          if (v43 != v44)
            goto LABEL_42;
          -[VNFaceObservation faceprint](self, "faceprint");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNFaceObservation faceprint](v5, "faceprint");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = VisionCoreEqualOrNilObjects();

          if ((v47 & 1) == 0)
            goto LABEL_42;
          -[VNFaceObservation torsoprint](self, "torsoprint");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNFaceObservation torsoprint](v5, "torsoprint");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = VisionCoreEqualOrNilObjects();

          if ((v50 & 1) == 0)
            goto LABEL_42;
          -[VNFaceObservation faceTorsoprint](self, "faceTorsoprint");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNFaceObservation faceTorsoprint](v5, "faceTorsoprint");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = VisionCoreEqualOrNilObjects();

          if ((v53 & 1) == 0)
            goto LABEL_42;
          v54 = -[VNFaceObservation isBoundingBoxAligned](self, "isBoundingBoxAligned");
          if (v54 != -[VNFaceObservation isBoundingBoxAligned](v5, "isBoundingBoxAligned"))
            goto LABEL_42;
          -[VNFaceObservation alignedRotationAngle](self, "alignedRotationAngle");
          v56 = v55;
          -[VNFaceObservation alignedRotationAngle](v5, "alignedRotationAngle");
          if (v56 != v57)
            goto LABEL_42;
          -[VNFaceObservation faceRegionMap](self, "faceRegionMap");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNFaceObservation faceRegionMap](v5, "faceRegionMap");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = VisionCoreEqualOrNilObjects();

          if ((v60 & 1) == 0)
            goto LABEL_42;
          -[VNFaceObservation faceAttributes](self, "faceAttributes");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNFaceObservation faceAttributes](v5, "faceAttributes");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = VisionCoreEqualOrNilObjects();

          if ((v63 & 1) == 0)
            goto LABEL_42;
          -[VNFaceObservation faceSegments](self, "faceSegments");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNFaceObservation faceSegments](v5, "faceSegments");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = VisionCoreEqualOrNilObjects();

          if ((v66 & 1) == 0)
            goto LABEL_42;
          v67 = -[VNFaceObservation isBlinking](self, "isBlinking");
          if (v67 != -[VNFaceObservation isBlinking](v5, "isBlinking"))
            goto LABEL_42;
          -[VNFaceObservation alignedMeanShape](self, "alignedMeanShape");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNFaceObservation alignedMeanShape](v5, "alignedMeanShape");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = VisionCoreEqualOrNilObjects();

          if ((v70 & 1) == 0)
            goto LABEL_42;
          -[VNFaceObservation landmarkScore](self, "landmarkScore");
          v72 = v71;
          -[VNFaceObservation landmarkScore](v5, "landmarkScore");
          if (v72 != v73)
            goto LABEL_42;
          -[VNFaceObservation faceJunkinessIndex](self, "faceJunkinessIndex");
          v75 = v74;
          -[VNFaceObservation faceJunkinessIndex](v5, "faceJunkinessIndex");
          if (v75 != v76)
            goto LABEL_42;
          -[VNFaceObservation faceOrientationIndex](self, "faceOrientationIndex");
          v78 = v77;
          -[VNFaceObservation faceOrientationIndex](v5, "faceOrientationIndex");
          if (v78 != v79)
            goto LABEL_42;
          -[VNFaceObservation faceCaptureQuality](self, "faceCaptureQuality");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNFaceObservation faceCaptureQuality](v5, "faceCaptureQuality");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = VisionCoreEqualOrNilObjects();

          if ((v82 & 1) == 0)
            goto LABEL_42;
          -[VNFaceObservation faceCaptureQualityOriginatingRequestSpecifier](self, "faceCaptureQualityOriginatingRequestSpecifier");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNFaceObservation faceCaptureQualityOriginatingRequestSpecifier](v5, "faceCaptureQualityOriginatingRequestSpecifier");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = VisionCoreEqualOrNilObjects();

          if ((v85 & 1) == 0)
            goto LABEL_42;
          -[VNFaceObservation landmarksOriginatingRequestSpecifier](self, "landmarksOriginatingRequestSpecifier");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNFaceObservation landmarksOriginatingRequestSpecifier](v5, "landmarksOriginatingRequestSpecifier");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = VisionCoreEqualOrNilObjects();

          if ((v88 & 1) == 0)
            goto LABEL_42;
          -[VNFaceObservation landmarks3DOriginatingRequestSpecifier](self, "landmarks3DOriginatingRequestSpecifier");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNFaceObservation landmarks3DOriginatingRequestSpecifier](v5, "landmarks3DOriginatingRequestSpecifier");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = VisionCoreEqualOrNilObjects();

          if ((v91 & 1) == 0)
            goto LABEL_42;
          -[VNFaceObservation gaze](self, "gaze");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          -[VNFaceObservation gaze](v5, "gaze");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = VisionCoreEqualOrNilObjects();

          if ((v94 & 1) != 0)
          {
            -[VNFaceObservation faceScreenGaze](self, "faceScreenGaze");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            -[VNFaceObservation faceScreenGaze](v5, "faceScreenGaze");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = VisionCoreEqualOrNilObjects();

          }
          else
          {
LABEL_42:
            v18 = 0;
          }
        }
      }

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (NSDictionary)expressionsAndConfidence
{
  void *v2;

  if (self->_expressionsAndScores)
  {
    +[VNFaceExpressionDetector createExpressionAndConfidencesDictionaryFromScores:](VNFaceExpressionDetector, "createExpressionAndConfidencesDictionaryFromScores:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (float)nameConfidence
{
  return self->_faceIdConfidence;
}

- (VNFaceLandmarks2D)landmarks
{
  os_unfair_lock_s *p_cachedLandmarksLock;
  void *v4;
  VNFaceLandmarks2D *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  double v27;
  double v28;
  double v29;
  double v30;
  VNFaceLandmarks2D *v31;
  VNFaceLandmarks2D *cachedLandmarks;
  uint64_t v34;

  p_cachedLandmarksLock = &self->_cachedLandmarksLock;
  os_unfair_lock_lock(&self->_cachedLandmarksLock);
  if (!self->_cachedLandmarks)
  {
    -[VNFaceObservation landmarkPoints](self, "landmarkPoints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = [VNFaceLandmarks2D alloc];
      -[VNFaceObservation landmarksOriginatingRequestSpecifier](self, "landmarksOriginatingRequestSpecifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "length");
      v8 = -[VNFaceObservation landmarksConstellation](self, "landmarksConstellation");
      -[VNFaceObservation landmarkPrecisionEstimatesPerPoint](self, "landmarkPrecisionEstimatesPerPoint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNDetectedObjectObservation boundingBox](self, "boundingBox");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      -[VNFaceObservation alignedBoundingBox](self, "alignedBoundingBox");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      -[VNFaceObservation landmarkScore](self, "landmarkScore");
      LODWORD(v34) = v26;
      LODWORD(v27) = v19;
      LODWORD(v28) = v21;
      LODWORD(v29) = v23;
      LODWORD(v30) = v25;
      v31 = -[VNFaceLandmarks2D initWithOriginatingRequestSpecifier:pointsData:pointCount:constellation:precisionEstimatesPerPoint:userFacingBBox:alignedBBox:landmarkScore:](v5, "initWithOriginatingRequestSpecifier:pointsData:pointCount:constellation:precisionEstimatesPerPoint:userFacingBBox:alignedBBox:landmarkScore:", v6, v4, v7 >> 3, v8, v9, v11, v13, v15, v17, v27, v28, v29, v30, v34);
      cachedLandmarks = self->_cachedLandmarks;
      self->_cachedLandmarks = v31;

    }
  }
  os_unfair_lock_unlock(p_cachedLandmarksLock);
  return self->_cachedLandmarks;
}

- (VNFaceLandmarks2D)landmarks65
{
  os_unfair_lock_s *p_cachedLandmarks65Lock;
  void *v4;
  VNFaceLandmarks2D *v5;
  void *v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  double v25;
  double v26;
  double v27;
  double v28;
  VNFaceLandmarks2D *v29;
  VNFaceLandmarks2D *cachedLandmarks65;
  uint64_t v32;

  p_cachedLandmarks65Lock = &self->_cachedLandmarks65Lock;
  os_unfair_lock_lock(&self->_cachedLandmarks65Lock);
  if (!self->_cachedLandmarks65)
  {
    -[VNFaceObservation landmarkPoints65](self, "landmarkPoints65");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = [VNFaceLandmarks2D alloc];
      -[VNFaceObservation landmarksOriginatingRequestSpecifier](self, "landmarksOriginatingRequestSpecifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "length");
      -[VNDetectedObjectObservation boundingBox](self, "boundingBox");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[VNFaceObservation alignedBoundingBox](self, "alignedBoundingBox");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      -[VNFaceObservation landmarkScore](self, "landmarkScore");
      LODWORD(v32) = v24;
      LODWORD(v25) = v17;
      LODWORD(v26) = v19;
      LODWORD(v27) = v21;
      LODWORD(v28) = v23;
      v29 = -[VNFaceLandmarks2D initWithOriginatingRequestSpecifier:pointsData:pointCount:constellation:precisionEstimatesPerPoint:userFacingBBox:alignedBBox:landmarkScore:](v5, "initWithOriginatingRequestSpecifier:pointsData:pointCount:constellation:precisionEstimatesPerPoint:userFacingBBox:alignedBBox:landmarkScore:", v6, v4, v7 >> 3, 1, 0, v9, v11, v13, v15, v25, v26, v27, v28, v32);
      cachedLandmarks65 = self->_cachedLandmarks65;
      self->_cachedLandmarks65 = v29;

    }
  }
  os_unfair_lock_unlock(p_cachedLandmarks65Lock);
  return self->_cachedLandmarks65;
}

- (VNFaceLandmarks3D)landmarks3d
{
  os_unfair_lock_s *p_cachedLandmarks3dLock;
  void *v4;
  VNFaceLandmarks3D *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  VNFaceLandmarks3D *v28;
  VNFaceLandmarks3D *cachedLandmarks3d;
  uint64_t v31;

  p_cachedLandmarks3dLock = &self->_cachedLandmarks3dLock;
  os_unfair_lock_lock(&self->_cachedLandmarks3dLock);
  if (!self->_cachedLandmarks3d)
  {
    -[VNFaceObservation landmarkPoints3d](self, "landmarkPoints3d");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = [VNFaceLandmarks3D alloc];
      -[VNFaceObservation landmarks3DOriginatingRequestSpecifier](self, "landmarks3DOriginatingRequestSpecifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNDetectedObjectObservation boundingBox](self, "boundingBox");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      -[VNFaceObservation alignedBoundingBox](self, "alignedBoundingBox");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      -[VNFaceObservation landmarkScore](self, "landmarkScore");
      LODWORD(v31) = v23;
      LODWORD(v24) = v16;
      LODWORD(v25) = v18;
      LODWORD(v26) = v20;
      LODWORD(v27) = v22;
      v28 = -[VNFaceLandmarks3D initWithOriginatingRequestSpecifier:pointsData:pointCount:userFacingBBox:alignedBBox:landmarkScore:](v5, "initWithOriginatingRequestSpecifier:pointsData:pointCount:userFacingBBox:alignedBBox:landmarkScore:", v6, v4, 63, v8, v10, v12, v14, v24, v25, v26, v27, v31);
      cachedLandmarks3d = self->_cachedLandmarks3d;
      self->_cachedLandmarks3d = v28;

    }
  }
  os_unfair_lock_unlock(p_cachedLandmarks3dLock);
  return self->_cachedLandmarks3d;
}

- (double)pose
{
  __int128 v1;
  void *v2;

  v1 = *MEMORY[0x1E0C83FF0];
  v2 = *(void **)(a1 + 376);
  if (v2)
    *(_QWORD *)&v1 = *(_QWORD *)objc_msgSend(v2, "bytes", v1, *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16), *(_OWORD *)(MEMORY[0x1E0C83FF0] + 32), *(_QWORD *)(MEMORY[0x1E0C83FF0] + 48), *(_QWORD *)(MEMORY[0x1E0C83FF0] + 56));
  return *(double *)&v1;
}

- (void)setPoseData:(id)a3 originatingRequestSpecifier:(id)a4
{
  VNRequestSpecifier *v6;
  NSData *v7;
  NSData *poseData;
  VNRequestSpecifier *poseOriginatingRequestSpecifier;
  id v10;

  v10 = a3;
  v6 = (VNRequestSpecifier *)a4;
  v7 = (NSData *)objc_msgSend(v10, "copy");
  poseData = self->_poseData;
  self->_poseData = v7;

  poseOriginatingRequestSpecifier = self->_poseOriginatingRequestSpecifier;
  self->_poseOriginatingRequestSpecifier = v6;

}

- (double)poseQuaternion
{
  int8x16_t v1;
  int8x16_t v2;
  float32x2_t v3;
  float v4;
  float v5;
  float v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float32x2_t v11;
  float32x2_t v12;
  float v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  unsigned __int32 v21;
  float32x2_t v26;
  float v27;
  unsigned int v28;
  float32x2_t v29;
  float32x2_t v30;
  float32x2_t v31;

  if (a1[47])
  {
    objc_msgSend(a1, "pose");
    v5 = v4 + (float)(*(float *)v1.i32 + *(float *)&v2.i32[1]);
    if (v5 >= 0.0)
    {
      v14 = sqrtf(v5 + 1.0);
      v15 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v14 + v14));
      v16 = vmul_f32(v15, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v14 + v14), v15));
      v26 = vmul_n_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL), (int32x2_t)v3), (float32x2_t)vext_s8((int8x8_t)v3, (int8x8_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL), 4uLL)), vmul_f32(v16, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v14 + v14), v16)).f32[0]);
    }
    else if (*(float *)v1.i32 < *(float *)&v2.i32[1] || *(float *)v1.i32 < v4)
    {
      v7 = 1.0 - *(float *)v1.i32;
      if (*(float *)&v2.i32[1] >= v4)
      {
        v27 = sqrtf(*(float *)&v2.i32[1] + (float)(v7 - v4));
        *(float *)&v28 = v27 + v27;
        v29 = vrecpe_f32((float32x2_t)v28);
        v30 = vmul_f32(v29, vrecps_f32((float32x2_t)v28, v29));
        v31.i32[0] = vmul_f32(v30, vrecps_f32((float32x2_t)v28, v30)).u32[0];
        v30.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)v1.i8, 1), *(float32x2_t *)v2.i8).u32[0];
        v30.i32[1] = v28;
        v31.i32[1] = 0.25;
        v26 = vmul_f32(v30, v31);
      }
      else
      {
        v8 = (float32x2_t)__PAIR64__(v1.u32[1], COERCE_UNSIGNED_INT(sqrtf(v4 + (float)(v7 - *(float *)&v2.i32[1]))));
        v9 = vadd_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL)), v3);
        v10 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v2.i8, 0);
        v10.i32[0] = 2.0;
        v10.i32[0] = vmul_f32(v8, v10).u32[0];
        v11 = vrecpe_f32((float32x2_t)v10.u32[0]);
        v12 = vmul_f32(v11, vrecps_f32((float32x2_t)v10.u32[0], v11));
        v26 = vmul_n_f32(v9, vmul_f32(v12, vrecps_f32((float32x2_t)v10.u32[0], v12)).f32[0]);
        __asm { FMOV            V2.2S, #0.25 }
      }
    }
    else
    {
      v17 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v2.i8, 0);
      v18 = vadd_f32(*(float32x2_t *)v1.i8, v17);
      v17.i32[0] = 2.0;
      v17.i32[0] = vmul_f32((float32x2_t)__PAIR64__(v1.u32[1], COERCE_UNSIGNED_INT(sqrtf(*(float *)v1.i32 + (float)((float)(1.0- *(float *)&v2.i32[1])- v4)))), v17).u32[0];
      v17.i32[1] = v18.i32[1];
      v19 = vrecpe_f32((float32x2_t)v17.u32[0]);
      v20 = vmul_f32(v19, vrecps_f32((float32x2_t)v17.u32[0], v19));
      v21 = vmul_f32(v20, vrecps_f32((float32x2_t)v17.u32[0], v20)).u32[0];
      __asm { FMOV            V5.2S, #0.25 }
      _D5.i32[1] = v21;
      v26 = vmul_f32(v17, _D5);
    }
  }
  else
  {
    v26 = (float32x2_t)_PromotedConst;
  }
  return *(double *)&v26;
}

- (BOOL)getComputedRectifyingTransform:(CGAffineTransform *)a3
{
  NSData *landmarkPoints65;
  NSData *v5;
  NSData *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  int v10;
  uint64_t v11;
  int *v12;
  int v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  float v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  float v22;
  float v23;
  uint64_t v24;
  unsigned __int8 v25;
  float v26;
  __float2 v27;
  char v28;
  __int128 v29;
  __int128 v30;
  CGAffineTransform v32;
  CGAffineTransform __B;
  float v34;
  float v35;
  float v36;
  float v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  float *__A[2];
  vDSP_Length __N;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  CGAffineTransform v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[28];
  CGAffineTransform v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _OWORD v78[2];
  int32x2_t v79;
  uint64_t v80;
  float v81[2];
  DSPSplitComplex __C;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  landmarkPoints65 = self->_landmarkPoints65;
  if (landmarkPoints65)
  {
    v5 = landmarkPoints65;
    v6 = v5;
    if (!a3)
    {
LABEL_42:

      return (char)a3;
    }
    v7 = -[NSData bytes](objc_retainAutorelease(v5), "bytes");
    v38 = 0;
    v39 = 0;
    v40 = 0;
    Geometry2D_mallocCart2D(&v38, 63);
    v8 = (char *)v38;
    v9 = (char *)v39;
    v10 = v40;
    if (v38 && v39 && (int)v40 >= 1)
    {
      v11 = 0;
      v12 = (int *)(v7 + 4);
      do
      {
        *(_DWORD *)&v8[v11] = *(v12 - 1);
        v13 = *v12;
        v12 += 2;
        *(_DWORD *)&v9[v11] = v13;
        v11 += 4;
      }
      while (v11 != 252);
    }
    else if (!v38)
    {
      goto LABEL_40;
    }
    if (v9 && v10 == 63)
    {
      __A[0] = 0;
      __A[1] = 0;
      __N = 0;
      v44 = 0;
      v45 = 0;
      v46 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      Geometry2D_mallocCart2D(__A, 63);
      v14 = 0;
      v15 = 1;
      if (!__A[0] || !__A[1] || (int)__N < 1)
        goto LABEL_39;
      v16 = 0;
      v76 = xmmword_1A15E4AC8;
      v77 = unk_1A15E4AD8;
      v78[0] = xmmword_1A15E4AE8;
      *(_OWORD *)((char *)v78 + 12) = *(__int128 *)((char *)&xmmword_1A15E4AE8 + 12);
      v72 = xmmword_1A15E4A88;
      v73 = unk_1A15E4A98;
      v74 = xmmword_1A15E4AA8;
      v75 = unk_1A15E4AB8;
      v68 = xmmword_1A15E4A48;
      v69 = unk_1A15E4A58;
      v70 = xmmword_1A15E4A68;
      v71 = unk_1A15E4A78;
      v66 = *(CGAffineTransform *)byte_1A15E4A08;
      v67 = unk_1A15E4A38;
      v63 = xmmword_1A15E4BC4;
      v64 = unk_1A15E4BD4;
      *(_OWORD *)v65 = xmmword_1A15E4BE4;
      *(_OWORD *)&v65[12] = *(__int128 *)((char *)&xmmword_1A15E4BE4 + 12);
      v59 = xmmword_1A15E4B84;
      v60 = unk_1A15E4B94;
      v61 = xmmword_1A15E4BA4;
      v62 = unk_1A15E4BB4;
      v55 = xmmword_1A15E4B44;
      v56 = unk_1A15E4B54;
      v57 = xmmword_1A15E4B64;
      v58 = unk_1A15E4B74;
      v53 = *(CGAffineTransform *)byte_1A15E4B04;
      v54 = unk_1A15E4B34;
      *(_QWORD *)&v51 = &v66;
      *((_QWORD *)&v51 + 1) = &v53;
      v52 = 63;
      *(_QWORD *)&__B.a = &__C;
      *(_QWORD *)&__B.b = v81;
      *(_QWORD *)&v32.a = &v80;
      *(_QWORD *)&v32.b = &v79;
      *(_QWORD *)&__B.c = 2;
      *(_QWORD *)&v32.c = 2;
      v17 = 0.0;
      v18 = 0.0;
      v49 = 0;
      v50 = 0;
      do
      {
        v19 = *(int *)((char *)&LandmarkDetector_faceMesh63Parts + v16 + 584);
        v18 = v18 + *((float *)&v66.a + v19);
        v17 = v17 + *((float *)&v53.a + v19);
        v16 += 4;
      }
      while (v16 != 32);
      v20 = 0;
      v21 = v18 * 0.125;
      v22 = 0.0;
      v23 = 0.0;
      do
      {
        v24 = *(int *)((char *)&LandmarkDetector_faceMesh63Parts + v20 + 968);
        v23 = v23 + *((float *)&v66.a + v24);
        v22 = v22 + *((float *)&v53.a + v24);
        v20 += 4;
      }
      while (v20 != 32);
      *(float *)&__C.realp = v21;
      *((float *)&__C.realp + 1) = v23 * 0.125;
      v81[0] = v17 * 0.125;
      v81[1] = v22 * 0.125;
      v79 = vdup_n_s32(0x3EA8F5C3u);
      v80 = 0x3F2B851E3EA8F5C3;
      v25 = Geometry2D_estimateRST((uint64_t)&__B, (uint64_t)&v32, (float *)&v49);
      if ((v25 & 0x80) != 0)
      {
        if (!__A[0] || !__A[1] || (_DWORD)__N != 63)
          goto LABEL_38;
        if (fabsf(*(float *)&v49) > 0.00000011921
          || fabsf(*((float *)&v49 + 1) + -1.0) > 0.00000011921
          || fabsf(*(float *)&v50) > 0.00000011921
          || fabsf(*((float *)&v50 + 1)) > 0.00000011921)
        {
          v26 = *((float *)&v49 + 1);
          v27 = __sincosf_stret(*(float *)&v49);
          v81[0] = v27.__cosval * v26;
          *(float *)&v80 = v27.__sinval * v26;
          *(_QWORD *)&__B.a = v81;
          *(_QWORD *)&__B.b = &v80;
          *(_OWORD *)&v32.a = v51;
          __C = *(DSPSplitComplex *)__A;
          vDSP_zvzsml((const DSPSplitComplex *)&v32, 1, (const DSPSplitComplex *)&__B, &__C, 1, 0x3FuLL);
          vDSP_vsadd(__A[0], 1, (const float *)&v50, __A[0], 1, (int)__N);
          vDSP_vsadd(__A[1], 1, (const float *)&v50 + 1, __A[1], 1, (int)__N);
LABEL_31:
          Geometry2D_cloneUsingIndicesCart2D((int *)&v44, (int *)&v38);
          v14 = v44;
          v15 = 1;
          if (v44)
          {
            if (v45)
            {
              if ((int)v46 >= 1)
              {
                Geometry2D_cloneUsingIndicesCart2D((int *)&v41, (int *)__A);
                if (v41)
                {
                  if (v42 && (int)v43 >= 1)
                  {
                    v28 = Geometry2D_estimateRST((uint64_t)&v41, (uint64_t)&v44, &v34);
                    v14 = v44;
                    v15 = (v28 & 0x80) == 0;
                  }
                }
              }
            }
          }
LABEL_39:
          free(v14);
          v44 = 0;
          free(v45);
          v45 = 0;
          LODWORD(v46) = 0;
          free(v41);
          v41 = 0;
          free(v42);
          v42 = 0;
          LODWORD(v43) = 0;
          free(__A[0]);
          __A[0] = 0;
          free(__A[1]);
          v8 = (char *)v38;
          if (!v15)
          {
            free(v38);
            v38 = 0;
            free(v39);
            v39 = 0;
            LODWORD(v40) = 0;
            CGAffineTransformMakeTranslation(&v66, (float)-v36, (float)-v37);
            __B = v66;
            CGAffineTransformScale(&v53, &__B, 1.0 / v35, 1.0 / v35);
            v66 = v53;
            v32 = v53;
            CGAffineTransformRotate(&v53, &v32, v34);
            v30 = *(_OWORD *)&v53.c;
            v29 = *(_OWORD *)&v53.tx;
            v66 = v53;
            *(_OWORD *)&a3->a = *(_OWORD *)&v53.a;
            *(_OWORD *)&a3->c = v30;
            *(_OWORD *)&a3->tx = v29;
            LOBYTE(a3) = 1;
            goto LABEL_42;
          }
          goto LABEL_40;
        }
        v25 = Geometry2D_copyCart2D((uint64_t)&v51, (uint64_t)__A);
      }
      if (v25 != 128)
      {
LABEL_38:
        v14 = 0;
        v15 = 1;
        goto LABEL_39;
      }
      goto LABEL_31;
    }
LABEL_40:
    free(v8);
    v38 = 0;
    free(v39);
    LOBYTE(a3) = 0;
    goto LABEL_42;
  }
  LOBYTE(a3) = 0;
  return (char)a3;
}

- (void)setIsBlinking:(BOOL)a3
{
  self->_isBlinking = a3;
}

- (void)setBlinkScore:(float)a3
{
  self->_blinkScore = a3;
}

- (BOOL)isBlinking
{
  return self->_isBlinking;
}

- (float)blinkScore
{
  return self->_blinkScore;
}

- (CGRect)alignedBoundingBoxAsCGRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_alignedBoundingBox.origin.x;
  y = self->_alignedBoundingBox.origin.y;
  width = self->_alignedBoundingBox.size.width;
  height = self->_alignedBoundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setExpressionsAndScores:(id)a3
{
  objc_storeStrong((id *)&self->_expressionsAndScores, a3);
}

- (id)expressionsAndScores
{
  return self->_expressionsAndScores;
}

- (id)expressionsAndDetections
{
  void *v2;

  if (self->_expressionsAndScores)
  {
    +[VNFaceExpressionDetector createExpressionDetectionDictionaryFromScores:](VNFaceExpressionDetector, "createExpressionDetectionDictionaryFromScores:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)setBoundingBoxAligned:(BOOL)a3
{
  self->_boundingBoxAligned = a3;
}

- (void)setFaceCaptureQuality:(float)a3 originatingRequestSpecifier:(id)a4
{
  VNRequestSpecifier *v6;
  double v7;
  NSNumber *v8;
  NSNumber *faceCaptureQuality;
  VNRequestSpecifier *faceCaptureQualityOriginatingRequestSpecifier;

  v6 = (VNRequestSpecifier *)a4;
  *(float *)&v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  faceCaptureQuality = self->_faceCaptureQuality;
  self->_faceCaptureQuality = v8;

  faceCaptureQualityOriginatingRequestSpecifier = self->_faceCaptureQualityOriginatingRequestSpecifier;
  self->_faceCaptureQualityOriginatingRequestSpecifier = v6;

}

- (void)setLandmarkPointsData:(id)a3 originatingRequestSpecifier:(id)a4
{
  VNRequestSpecifier *v6;
  NSData *v7;
  NSData *landmarkPoints;
  VNRequestSpecifier *landmarksOriginatingRequestSpecifier;
  id v10;

  v10 = a3;
  v6 = (VNRequestSpecifier *)a4;
  v7 = (NSData *)objc_msgSend(v10, "copy");
  landmarkPoints = self->_landmarkPoints;
  self->_landmarkPoints = v7;

  landmarksOriginatingRequestSpecifier = self->_landmarksOriginatingRequestSpecifier;
  self->_landmarksOriginatingRequestSpecifier = v6;

}

- (void)setLandmarkPoints65Data:(id)a3 originatingRequestSpecifier:(id)a4
{
  VNRequestSpecifier *v6;
  NSData *v7;
  NSData *landmarkPoints65;
  VNRequestSpecifier *landmarksOriginatingRequestSpecifier;
  id v10;

  v10 = a3;
  v6 = (VNRequestSpecifier *)a4;
  v7 = (NSData *)objc_msgSend(v10, "copy");
  landmarkPoints65 = self->_landmarkPoints65;
  self->_landmarkPoints65 = v7;

  objc_storeStrong((id *)&self->_landmarkPoints, self->_landmarkPoints65);
  landmarksOriginatingRequestSpecifier = self->_landmarksOriginatingRequestSpecifier;
  self->_landmarksOriginatingRequestSpecifier = v6;

}

- (void)setLandmark3DPointsData:(id)a3 originatingRequestSpecifier:(id)a4
{
  VNRequestSpecifier *v6;
  NSData *v7;
  NSData *landmarkPoints3d;
  VNRequestSpecifier *landmarks3DOriginatingRequestSpecifier;
  id v10;

  v10 = a3;
  v6 = (VNRequestSpecifier *)a4;
  v7 = (NSData *)objc_msgSend(v10, "copy");
  landmarkPoints3d = self->_landmarkPoints3d;
  self->_landmarkPoints3d = v7;

  landmarks3DOriginatingRequestSpecifier = self->_landmarks3DOriginatingRequestSpecifier;
  self->_landmarks3DOriginatingRequestSpecifier = v6;

}

- (void)setLandmarkScore:(float)a3
{
  self->_landmarkScore = a3;
}

- (float)landmarkScore
{
  void *v3;

  -[VNFaceObservation landmarkPoints](self, "landmarkPoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return self->_landmarkScore;
  else
    return -3.4028e38;
}

- (id)description
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  float v11;
  objc_super v13;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v13.receiver = self;
  v13.super_class = (Class)VNFaceObservation;
  -[VNDetectedObjectObservation description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  v5 = -[VNFaceObservation faceId](self, "faceId");
  if (v5)
    objc_msgSend(v3, "appendFormat:", CFSTR(" ID=%lu"), v5);
  -[VNFaceObservation landmarks](self, "landmarks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "constellation");
    v9 = CFSTR("VNRequestFaceLandmarksConstellationNotDefined");
    if (v8 == 1)
      v9 = CFSTR("VNRequestFaceLandmarksConstellation65Points");
    if (v8 == 2)
      v9 = CFSTR("VNRequestFaceLandmarksConstellation76Points");
    v10 = v9;
    objc_msgSend(v7, "confidence");
    objc_msgSend(v3, "appendFormat:", CFSTR(" VNFaceLandmarks2D [%@, confidence=%f]"), v10, v11);

  }
  return v3;
}

- (void)_addPointsOfNamedRegion:(id)a3 inLandmarks:(id)a4 toPath:(CGPath *)a5 applyingAffineTransform:(CGAffineTransform *)a6
{
  size_t v8;
  id v9;
  const CGPoint *v10;
  uint64_t v11;
  uint64_t v12;
  CGFloat *p_y;
  id v14;

  objc_msgSend(a4, "valueForKey:", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v8 = objc_msgSend(v14, "pointCount");
    if (v8)
    {
      v9 = objc_retainAutorelease(v14);
      v10 = (const CGPoint *)objc_msgSend(v9, "normalizedPoints");
      v11 = objc_msgSend(v9, "pointsClassification");
      v12 = v11;
      if ((unint64_t)(v11 - 1) >= 2)
      {
        if (!v11)
        {
          p_y = &v10->y;
          do
          {
            CGPathMoveToPoint(a5, a6, *(p_y - 1), *p_y);
            CGPathAddLineToPoint(a5, a6, *(p_y - 1), *p_y);
            p_y += 2;
            --v8;
          }
          while (v8);
        }
      }
      else
      {
        CGPathMoveToPoint(a5, a6, v10->x, v10->y);
        CGPathAddLines(a5, a6, v10, v8);
        if (v12 == 2)
        {
          CGPathAddLineToPoint(a5, a6, v10->x, v10->y);
          CGPathCloseSubpath(a5);
        }
      }
    }
  }

}

- (id)debugQuickLookObject
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  const CGPath *Mutable;
  __int128 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  const CGPath *v20;
  CGColor *v21;
  void *v22;
  CGAffineTransform v24;
  CGAffineTransform v25;
  objc_super v26;
  _OWORD v27[3];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CGAffineTransform v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[VNDetectedObjectObservation boundingBox](self, "boundingBox");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  Mutable = CGPathCreateMutable();
  v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v32 = *MEMORY[0x1E0C9BAA8];
  v33 = v12;
  v34 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (-[VNFaceObservation debugQuickLookObject]::onceToken != -1)
    dispatch_once(&-[VNFaceObservation debugQuickLookObject]::onceToken, &__block_literal_global_14331);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = (id)-[VNFaceObservation debugQuickLookObject]::regionNames;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        -[VNFaceObservation landmarks](self, "landmarks");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v32;
        v27[1] = v33;
        v27[2] = v34;
        -[VNFaceObservation _addPointsOfNamedRegion:inLandmarks:toPath:applyingAffineTransform:](self, "_addPointsOfNamedRegion:inLandmarks:toPath:applyingAffineTransform:", v17, v18, Mutable, v27);

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v14);
  }

  v26.receiver = self;
  v26.super_class = (Class)VNFaceObservation;
  -[VNDetectedObjectObservation debugQuickLookObject](&v26, sel_debugQuickLookObject);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    memset(&v25, 0, sizeof(v25));
    CGAffineTransformMakeTranslation(&v25, v4, v6);
    v24 = v25;
    CGAffineTransformScale(&v35, &v24, v8, v10);
    v25 = v35;
    v20 = (const CGPath *)MEMORY[0x1A1B09D7C](Mutable, &v25);
    *(_OWORD *)&v35.a = xmmword_1A15FAFA0;
    *(_OWORD *)&v35.c = unk_1A15FAFB0;
    v21 = (CGColor *)VNDebugColorFromValues(&v35.a);
    VNDebugImageRenderNormalizedCGPathOnImage((uint64_t)v20, v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    CGPathRelease(v20);
  }
  else
  {
    VNDebugPathFromNormalizedCGPath((uint64_t)Mutable, 512.0, 512.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  CGPathRelease(Mutable);
  return v22;
}

- (void)setFaceRegionMap:(id)a3
{
  objc_storeStrong((id *)&self->_faceRegionMap, a3);
}

- (void)setFaceAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_faceAttributes, a3);
}

- (void)setFaceSegments:(id)a3
{
  objc_storeStrong((id *)&self->_faceSegments, a3);
}

- (NSNumber)faceCaptureQuality
{
  return self->_faceCaptureQuality;
}

- (void)updateFaceCaptureQuality:(id)a3
{
  objc_storeStrong((id *)&self->_faceCaptureQuality, a3);
}

- (float)faceOrientationIndex
{
  return self->_faceOrientationIndex;
}

- (float)faceJunkinessIndex
{
  return self->_faceJunkinessIndex;
}

- (void)setFaceJunkinessIndex:(float)a3
{
  self->_faceJunkinessIndex = a3;
}

- (void)setFaceOrientationIndex:(float)a3
{
  self->_faceOrientationIndex = a3;
}

- (id)torsoprint
{
  return self->_torsoprint;
}

- (void)setTorsoprint:(id)a3
{
  objc_storeStrong((id *)&self->_torsoprint, a3);
}

- (id)faceTorsoprint
{
  return self->_faceTorsoprint;
}

- (void)setFaceTorsoprint:(id)a3
{
  objc_storeStrong((id *)&self->_faceTorsoprint, a3);
}

- (void)setLegacyFaceCore:(id)a3
{
  VNFaceLegacyFaceCore *v4;
  VNFaceLegacyFaceCore *legacyFaceCore;
  id v6;

  v6 = a3;
  v4 = (VNFaceLegacyFaceCore *)objc_msgSend(v6, "copy");
  legacyFaceCore = self->_legacyFaceCore;
  self->_legacyFaceCore = v4;

}

- (void)setFaceScreenGaze:(id)a3
{
  VNFaceScreenGaze *v4;
  VNFaceScreenGaze *faceScreenGaze;
  id v6;

  v6 = a3;
  v4 = (VNFaceScreenGaze *)objc_msgSend(v6, "copy");
  faceScreenGaze = self->_faceScreenGaze;
  self->_faceScreenGaze = v4;

}

- (void)setGaze:(id)a3
{
  VNFaceGaze *v4;
  VNFaceGaze *gaze;
  id v6;

  v6 = a3;
  v4 = (VNFaceGaze *)objc_msgSend(v6, "copy");
  gaze = self->_gaze;
  self->_gaze = v4;

}

- (BOOL)isRevision1DetectedRectanglesCompatible
{
  void *v3;
  double v4;
  double v5;
  void *v7;
  double v8;
  double v9;

  -[VNFaceObservation roll](self, "roll");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  if (fabs(v5) > 0.541052068)
    return 0;
  -[VNFaceObservation pitch](self, "pitch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  return fabs(v9) <= 0.436332313;
}

- (NSNumber)yaw
{
  return self->_yaw;
}

- (NSNumber)pitch
{
  return self->_pitch;
}

- (_Geometry2D_rect2D_)alignedBoundingBox
{
  float x;
  float y;
  float height;
  float width;
  _Geometry2D_rect2D_ result;

  x = self->_alignedBoundingBox.origin.x;
  y = self->_alignedBoundingBox.origin.y;
  height = self->_alignedBoundingBox.size.height;
  width = self->_alignedBoundingBox.size.width;
  result.size.width = width;
  result.size.height = height;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAlignedBoundingBox:(_Geometry2D_rect2D_)a3
{
  self->_alignedBoundingBox = a3;
}

- (float)alignedRotationAngle
{
  return self->_alignedRotationAngle;
}

- (void)setAlignedRotationAngle:(float)a3
{
  self->_alignedRotationAngle = a3;
}

- (NSData)landmarkPoints
{
  return self->_landmarkPoints;
}

- (NSData)landmarkPoints65
{
  return self->_landmarkPoints65;
}

- (unint64_t)landmarksConstellation
{
  return self->_landmarksConstellation;
}

- (void)setLandmarksConstellation:(unint64_t)a3
{
  self->_landmarksConstellation = a3;
}

- (NSArray)landmarkPrecisionEstimatesPerPoint
{
  return self->_landmarkPrecisionEstimatesPerPoint;
}

- (void)setLandmarkPrecisionEstimatesPerPoint:(id)a3
{
  objc_storeStrong((id *)&self->_landmarkPrecisionEstimatesPerPoint, a3);
}

- (NSData)landmarkPoints3d
{
  return self->_landmarkPoints3d;
}

- (NSData)poseData
{
  return self->_poseData;
}

- (float)faceIdConfidence
{
  return self->_faceIdConfidence;
}

- (void)setFaceIdConfidence:(float)a3
{
  self->_faceIdConfidence = a3;
}

- (NSData)alignedMeanShape
{
  return self->_alignedMeanShape;
}

- (void)setAlignedMeanShape:(id)a3
{
  objc_storeStrong((id *)&self->_alignedMeanShape, a3);
}

- (VNRequestSpecifier)landmarksOriginatingRequestSpecifier
{
  return self->_landmarksOriginatingRequestSpecifier;
}

- (VNRequestSpecifier)landmarks3DOriginatingRequestSpecifier
{
  return self->_landmarks3DOriginatingRequestSpecifier;
}

- (VNFaceRegionMap)faceRegionMap
{
  return self->_faceRegionMap;
}

- (VNFaceLegacyFaceCore)legacyFaceCore
{
  return self->_legacyFaceCore;
}

- (VNRequestSpecifier)poseOriginatingRequestSpecifier
{
  return self->_poseOriginatingRequestSpecifier;
}

- (unint64_t)faceId
{
  return self->_faceId;
}

- (void)setFaceId:(unint64_t)a3
{
  self->_faceId = a3;
}

- (VNFaceSegments)faceSegments
{
  return self->_faceSegments;
}

- (VNRequestSpecifier)faceCaptureQualityOriginatingRequestSpecifier
{
  return self->_faceCaptureQualityOriginatingRequestSpecifier;
}

- (VNFaceGaze)gaze
{
  return self->_gaze;
}

- (VNFaceScreenGaze)faceScreenGaze
{
  return self->_faceScreenGaze;
}

- (BOOL)isBoundingBoxAligned
{
  return self->_boundingBoxAligned;
}

void __41__VNFaceObservation_debugQuickLookObject__block_invoke()
{
  void *v0;

  v0 = (void *)-[VNFaceObservation debugQuickLookObject]::regionNames;
  -[VNFaceObservation debugQuickLookObject]::regionNames = (uint64_t)&unk_1E459E198;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (VNFaceObservation)observationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___VNFaceObservation;
  objc_msgSendSuper2(&v6, sel_observationWithRequestRevision_boundingBox_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingBox");
  objc_msgSend(v4, "setUnalignedBoundingBox:");
  return (VNFaceObservation *)v4;
}

+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 andAlignedBoundingBox:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.size.height;
  v10 = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequestRevision:boundingBox:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  objc_msgSend(v13, "setUnalignedBoundingBox:", v12, v11, v10, v9);
  *(float *)&v14 = x;
  *(float *)&v15 = y;
  *(float *)&v16 = width;
  *(float *)&v17 = height;
  objc_msgSend(v13, "setAlignedBoundingBox:", v14, v15, v17, v16);
  objc_msgSend(v13, "setBoundingBoxAligned:", 1);
  return (VNFaceObservation *)v13;
}

+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 unalignedBoundingBox:(CGRect)a4 alignedBoundingBox:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.size.height;
  v10 = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequestRevision:boundingBox:", a3, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  objc_msgSend(v13, "setUnalignedBoundingBox:", v12, v11, v10, v9);
  *(float *)&v14 = x;
  *(float *)&v15 = y;
  *(float *)&v16 = width;
  *(float *)&v17 = height;
  objc_msgSend(v13, "setAlignedBoundingBox:", v14, v15, v17, v16);
  objc_msgSend(v13, "setBoundingBoxAligned:", 1);
  return (VNFaceObservation *)v13;
}

+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 faceprint:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a5;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequestRevision:boundingBox:", a3, x, y, width, height);
  objc_msgSend(v12, "setUnalignedBoundingBox:", x, y, width, height);
  objc_msgSend(v12, "setFaceprint:", v11);

  return (VNFaceObservation *)v12;
}

+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 roll:(id)a5 yaw:(id)a6 pitch:(id)a7 isBoundingBoxAligned:(BOOL)a8 alignedBoundingBox:(CGRect)a9 landmarks:(id)a10 landmarks65:(id)a11 landmarkScore:(float)a12 isBlinking:(BOOL)a13 blinkScore:(float)a14
{
  uint64_t v15;
  uint64_t v16;

  LODWORD(v16) = 0;
  BYTE4(v15) = a13;
  *(float *)&v15 = a12;
  objc_msgSend(a1, "faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:isBoundingBoxAligned:alignedBoundingBox:landmarks:landmarks65:landmarkScore:isBlinking:blinkScore:faceOrientationIndex:faceJunkinessIndex:", a3, a5, a6, a7, a8, a10, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a9.origin.x, a9.origin.y, a9.size.width, a9.size.height, a11, v15,
    LODWORD(a14),
    v16);
  return (VNFaceObservation *)(id)objc_claimAutoreleasedReturnValue();
}

+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 roll:(id)a5 yaw:(id)a6 pitch:(id)a7 isBoundingBoxAligned:(BOOL)a8 alignedBoundingBox:(CGRect)a9 landmarks:(id)a10 landmarks65:(id)a11 landmarkScore:(float)a12 isBlinking:(BOOL)a13 blinkScore:(float)a14 faceOrientationIndex:(float)a15 faceJunkinessIndex:(float)a16
{
  _BOOL4 v17;
  double height;
  double width;
  double y;
  double x;
  double v24;
  double v25;
  double v26;
  double v27;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  float v35;
  void *v36;
  float v37;
  void *v38;
  float v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;

  v17 = a8;
  height = a9.size.height;
  width = a9.size.width;
  y = a9.origin.y;
  x = a9.origin.x;
  v24 = a4.size.height;
  v25 = a4.size.width;
  v26 = a4.origin.y;
  v27 = a4.origin.x;
  v30 = a5;
  v31 = a6;
  v32 = a7;
  v33 = a10;
  v34 = a11;
  if (v30)
  {
    objc_msgSend(v30, "floatValue");
    if (v35 >= -3.1416)
    {
      if (v35 < 3.1416)
        goto LABEL_7;
      v36 = &unk_1E459E568;
    }
    else
    {
      v36 = &unk_1E459E558;
    }

    v30 = v36;
  }
LABEL_7:
  if (!v31)
    goto LABEL_13;
  objc_msgSend(v31, "floatValue");
  if (v37 <= -1.5708)
  {
    v38 = &unk_1E459E578;
  }
  else
  {
    if (v37 < 1.5708)
      goto LABEL_13;
    v38 = &unk_1E459E588;
  }

  v31 = v38;
LABEL_13:
  if (!v32)
    goto LABEL_19;
  objc_msgSend(v32, "floatValue");
  if (v39 <= -1.5708)
  {
    v40 = &unk_1E459E578;
  }
  else
  {
    if (v39 < 1.5708)
      goto LABEL_19;
    v40 = &unk_1E459E588;
  }

  v32 = v40;
LABEL_19:
  v41 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequestRevision:boundingBox:", a3, v27, v26, v25, v24);
  objc_msgSend(v41, "setUnalignedBoundingBox:", v27, v26, v25, v24);
  objc_msgSend(v41, "setRoll:", v30);
  objc_msgSend(v41, "setYaw:", v31);
  objc_msgSend(v41, "setPitch:", v32);
  if (v17)
  {
    objc_msgSend(v41, "setBoundingBoxAligned:", 1);
    *(float *)&v43 = x;
    *(float *)&v44 = y;
    *(float *)&v45 = height;
    *(float *)&v46 = width;
    objc_msgSend(v41, "setAlignedBoundingBox:", v43, v44, v45, v46);
  }
  if (v34)
  {
    objc_msgSend(v34, "pointsData");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "originatingRequestSpecifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setLandmarkPoints65Data:originatingRequestSpecifier:", v47, v48);

  }
  if (v33)
  {
    objc_msgSend(v33, "pointsData");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "originatingRequestSpecifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setLandmarkPointsData:originatingRequestSpecifier:", v49, v50);

    objc_msgSend(v41, "setLandmarksConstellation:", objc_msgSend(v33, "constellation"));
    objc_msgSend(v33, "precisionEstimatesPerPoint");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setLandmarkPrecisionEstimatesPerPoint:", v51);

  }
  *(float *)&v42 = a12;
  objc_msgSend(v41, "setLandmarkScore:", v42);
  objc_msgSend(v41, "setIsBlinking:", a13);
  *(float *)&v52 = a14;
  objc_msgSend(v41, "setBlinkScore:", v52);
  *(float *)&v53 = a15;
  objc_msgSend(v41, "setFaceOrientationIndex:", v53);
  *(float *)&v54 = a16;
  objc_msgSend(v41, "setFaceJunkinessIndex:", v54);

  return (VNFaceObservation *)v41;
}

+ (VNFaceObservation)faceObservationWithRequestRevision:(NSUInteger)requestRevision boundingBox:(CGRect)boundingBox roll:(NSNumber *)roll yaw:(NSNumber *)yaw
{
  objc_msgSend(a1, "faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:", requestRevision, roll, yaw, 0, boundingBox.origin.x, boundingBox.origin.y, boundingBox.size.width, boundingBox.size.height);
  return (VNFaceObservation *)(id)objc_claimAutoreleasedReturnValue();
}

+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 alignedBoundingBox:(CGRect)a5 roll:(id)a6 yaw:(id)a7 pitch:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  double v14;
  double v15;
  double v16;
  double v17;
  id v19;
  id v20;
  id v21;
  void *v22;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a4.size.height;
  v15 = a4.size.width;
  v16 = a4.origin.y;
  v17 = a4.origin.x;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  objc_msgSend((id)objc_opt_class(), "faceObservationWithRequestRevision:boundingBox:andAlignedBoundingBox:", a3, v17, v16, v15, v14, x, y, width, height);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setRoll:", v19);
  objc_msgSend(v22, "setYaw:", v20);
  objc_msgSend(v22, "setPitch:", v21);

  return (VNFaceObservation *)v22;
}

+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 alignedBoundingBox:(CGRect)a5 roll:(id)a6 yaw:(id)a7
{
  objc_msgSend(a1, "faceObservationWithRequestRevision:boundingBox:alignedBoundingBox:roll:yaw:pitch:", a3, a6, a7, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  return (VNFaceObservation *)(id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)computeYawPitchRollFromPoseMatrix:(__n128)a3 outputYaw:(__n128)a4 outputPitch:(uint64_t)a5 outputRoll:(uint64_t)a6
{
  unint64_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v23;
  float v24;
  __int128 v25;
  _OWORD v26[4];
  float v27[4];
  float v28;
  float v29;
  __int128 v30;

  v12 = 0;
  v13 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
  v15 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16);
  v13.i32[0] = 1.0;
  v16 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 32);
  v14 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48);
  v15.i32[1] = -1.0;
  v16.i32[2] = -1.0;
  v26[0] = a1;
  v26[1] = a2;
  v26[2] = a3;
  v26[3] = a4;
  do
  {
    *(float32x4_t *)&v27[v12 / 4] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v13, COERCE_FLOAT(v26[v12 / 0x10])), v15, *(float32x2_t *)&v26[v12 / 0x10], 1), v16, (float32x4_t)v26[v12 / 0x10], 2), v14, (float32x4_t)v26[v12 / 0x10], 3);
    v12 += 16;
  }
  while (v12 != 64);
  if (fabsf(fabsf(*((float *)&v30 + 1)) + -1.0) <= 0.00000011921)
  {
    if (fabsf(*((float *)&v30 + 1) + -1.0) <= 0.00000011921)
    {
      v21 = atan2f(v28, v27[0]);
      v20 = 0.0;
      v18 = 1.5708;
    }
    else
    {
      v21 = atan2f(-v28, -v27[0]);
      v20 = 0.0;
      v18 = -1.5708;
    }
  }
  else
  {
    v23 = v27[1];
    v24 = v29;
    v25 = v30;
    v17 = asinf(*((float *)&v30 + 1));
    v18 = -v17;
    v19 = cosf(v17);
    v20 = atan2f(v23 / v19, v24 / v19);
    v21 = atan2f(*(float *)&v25 / v19, *((float *)&v25 + 2) / v19);
  }
  *a7 = v21;
  *a8 = v18;
  *a9 = v20;
  return 1;
}

@end

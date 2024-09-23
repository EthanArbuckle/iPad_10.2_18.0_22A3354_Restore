@implementation BKFaceDetectStateInfo

- (BKFaceDetectStateInfo)initWithPresenceState:(BOOL)a3
{
  BKFaceDetectStateInfo *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKFaceDetectStateInfo;
  result = -[BKFaceDetectStateInfo init](&v5, sel_init);
  if (result)
    result->_faceDetected = a3;
  return result;
}

- (BKFaceDetectStateInfo)initWithPresenceState:(BOOL)a3 details:(id)a4
{
  id v6;
  BKFaceDetectStateInfo *v7;
  BKFaceDetectStateInfo *v8;
  uint64_t v9;
  NSNumber *pitch;
  uint64_t v11;
  NSNumber *yaw;
  uint64_t v13;
  NSNumber *roll;
  uint64_t v15;
  NSNumber *distance;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  NSNumber *frameNumber;
  uint64_t v27;
  NSNumber *attentionScore;
  uint64_t v29;
  NSNumber *faceDetectionScore;
  uint64_t v31;
  NSNumber *isCameraObstructed;
  uint64_t v33;
  NSNumber *cameraObstructionScore;
  objc_super v36;

  v6 = a4;
  v36.receiver = self;
  v36.super_class = (Class)BKFaceDetectStateInfo;
  v7 = -[BKFaceDetectStateInfo init](&v36, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_faceDetected = a3;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BKStatusDetailFaceDetectPitch"));
    v9 = objc_claimAutoreleasedReturnValue();
    pitch = v8->_pitch;
    v8->_pitch = (NSNumber *)v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BKStatusDetailFaceDetectYaw"));
    v11 = objc_claimAutoreleasedReturnValue();
    yaw = v8->_yaw;
    v8->_yaw = (NSNumber *)v11;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BKStatusDetailFaceDetectRoll"));
    v13 = objc_claimAutoreleasedReturnValue();
    roll = v8->_roll;
    v8->_roll = (NSNumber *)v13;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BKStatusDetailFaceDistance"));
    v15 = objc_claimAutoreleasedReturnValue();
    distance = v8->_distance;
    v8->_distance = (NSNumber *)v15;

    v8->_orientation = 0;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BKStatusDetailFaceDetectOrientation"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = objc_msgSend(v17, "unsignedIntegerValue");
      if ((unint64_t)(v19 - 1) >= 4)
        v20 = 0;
      else
        v20 = v19;
      v8->_orientation = v20;
    }
    v8->_eyeReliefStatus = 0;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BKStatusDetailEyeReliefStatus"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = objc_msgSend(v21, "unsignedIntegerValue");
      if ((unint64_t)(v23 - 1) >= 5)
        v24 = 0;
      else
        v24 = v23;
      v8->_eyeReliefStatus = v24;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BKStatusDetailFrameNumber"));
    v25 = objc_claimAutoreleasedReturnValue();
    frameNumber = v8->_frameNumber;
    v8->_frameNumber = (NSNumber *)v25;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BKStatusDetailAttentionScore"));
    v27 = objc_claimAutoreleasedReturnValue();
    attentionScore = v8->_attentionScore;
    v8->_attentionScore = (NSNumber *)v27;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BKStatusDetailFaceDetectionScore"));
    v29 = objc_claimAutoreleasedReturnValue();
    faceDetectionScore = v8->_faceDetectionScore;
    v8->_faceDetectionScore = (NSNumber *)v29;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BKStatusDetailFaceOcclusionState"));
    v31 = objc_claimAutoreleasedReturnValue();
    isCameraObstructed = v8->_isCameraObstructed;
    v8->_isCameraObstructed = (NSNumber *)v31;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BKStatusDetailFaceOcclusionScore"));
    v33 = objc_claimAutoreleasedReturnValue();
    cameraObstructionScore = v8->_cameraObstructionScore;
    v8->_cameraObstructionScore = (NSNumber *)v33;

  }
  return v8;
}

- (id)initFromDictionary:(id)a3
{
  id v4;
  BKFaceDetectStateInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BKFaceDetectStateInfo;
  v5 = -[BKFaceDetectStateInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("faceDetected"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_faceDetected = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tooCloseToCamera"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_tooCloseToCamera = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tooFarFromCamera"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_tooFarFromCamera = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("multipleFaces"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_multipleFaces = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("flare"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_flare = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("occlusion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_occlusion = objc_msgSend(v11, "BOOLValue");

  }
  return v5;
}

- (id)initFromFaceInfo:(id *)a3
{
  BKFaceDetectStateInfo *v4;
  double v5;
  BKFaceDetectStateInfo *v6;
  __int16 v7;
  uint64_t v8;
  NSNumber *pitch;
  double v10;
  uint64_t v11;
  NSNumber *yaw;
  double v13;
  uint64_t v14;
  NSNumber *roll;
  unsigned int v16;
  double v17;
  uint64_t v18;
  NSNumber *distance;
  uint64_t v20;
  NSNumber *frameNumber;
  double v22;
  uint64_t v23;
  NSNumber *attentionScore;
  double v25;
  uint64_t v26;
  NSNumber *faceDetectionScore;
  uint64_t v28;
  NSNumber *isCameraObstructed;
  double v30;
  uint64_t v31;
  NSNumber *cameraObstructionScore;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)BKFaceDetectStateInfo;
  v4 = -[BKFaceDetectStateInfo init](&v34, sel_init);
  v6 = v4;
  if (v4)
  {
    v7 = *(_WORD *)(&a3->var0 + 1);
    v4->_faceDetected = (v7 & 4) == 0;
    v4->_tooCloseToCamera = (v7 & 0x20) != 0;
    v4->_tooFarFromCamera = (v7 & 0x40) != 0;
    v4->_multipleFaces = (v7 & 8) != 0;
    v4->_flare = 0;
    v4->_occlusion = (v7 & 0x200) != 0;
    v4->_unsupportedGlasses = (v7 & 0x1000) != 0;
    v4->_glassesMismatch = (v7 & 0x2000) != 0;
    LODWORD(v5) = *(unsigned int *)((char *)&a3->var5 + 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    pitch = v6->_pitch;
    v6->_pitch = (NSNumber *)v8;

    *(float *)&v10 = *(float *)((char *)&a3->var6 + 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    yaw = v6->_yaw;
    v6->_yaw = (NSNumber *)v11;

    *(float *)&v13 = *(float *)((char *)&a3->var7 + 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    roll = v6->_roll;
    v6->_roll = (NSNumber *)v14;

    LOWORD(v16) = *(unsigned __int16 *)((char *)&a3->var1 + 1);
    *(float *)&v17 = (float)v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    distance = v6->_distance;
    v6->_distance = (NSNumber *)v18;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)((char *)&a3->var8 + 1));
    v20 = objc_claimAutoreleasedReturnValue();
    frameNumber = v6->_frameNumber;
    v6->_frameNumber = (NSNumber *)v20;

    LODWORD(v22) = *(unsigned int *)((char *)&a3->var9 + 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    attentionScore = v6->_attentionScore;
    v6->_attentionScore = (NSNumber *)v23;

    *(float *)&v25 = *(float *)((char *)&a3->var10 + 1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    faceDetectionScore = v6->_faceDetectionScore;
    v6->_faceDetectionScore = (NSNumber *)v26;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", BYTE1(a3->var11));
    v28 = objc_claimAutoreleasedReturnValue();
    isCameraObstructed = v6->_isCameraObstructed;
    v6->_isCameraObstructed = (NSNumber *)v28;

    *(float *)&v30 = *(float *)((char *)&a3->var11 + 2);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
    v31 = objc_claimAutoreleasedReturnValue();
    cameraObstructionScore = v6->_cameraObstructionScore;
    v6->_cameraObstructionScore = (NSNumber *)v31;

  }
  return v6;
}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[7];
  _QWORD v12[8];

  v12[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("BKFaceDetectStateInfo");
  v11[0] = CFSTR("class");
  v11[1] = CFSTR("faceDetected");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_faceDetected);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v11[2] = CFSTR("tooCloseToCamera");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_tooCloseToCamera);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v4;
  v11[3] = CFSTR("tooFarFromCamera");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_tooFarFromCamera);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v5;
  v11[4] = CFSTR("multipleFaces");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_multipleFaces);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v6;
  v11[5] = CFSTR("flare");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_flare);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v7;
  v11[6] = CFSTR("occlusion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_occlusion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)faceDetected
{
  return self->_faceDetected;
}

- (void)setFaceDetected:(BOOL)a3
{
  self->_faceDetected = a3;
}

- (NSNumber)pitch
{
  return self->_pitch;
}

- (void)setPitch:(id)a3
{
  objc_storeStrong((id *)&self->_pitch, a3);
}

- (NSNumber)yaw
{
  return self->_yaw;
}

- (void)setYaw:(id)a3
{
  objc_storeStrong((id *)&self->_yaw, a3);
}

- (NSNumber)roll
{
  return self->_roll;
}

- (void)setRoll:(id)a3
{
  objc_storeStrong((id *)&self->_roll, a3);
}

- (NSNumber)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
  objc_storeStrong((id *)&self->_distance, a3);
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unint64_t)a3
{
  self->_orientation = a3;
}

- (unint64_t)eyeReliefStatus
{
  return self->_eyeReliefStatus;
}

- (void)setEyeReliefStatus:(unint64_t)a3
{
  self->_eyeReliefStatus = a3;
}

- (NSNumber)isCameraObstructed
{
  return self->_isCameraObstructed;
}

- (NSNumber)cameraObstructionScore
{
  return self->_cameraObstructionScore;
}

- (NSNumber)frameNumber
{
  return self->_frameNumber;
}

- (NSNumber)attentionScore
{
  return self->_attentionScore;
}

- (NSNumber)faceDetectionScore
{
  return self->_faceDetectionScore;
}

- (BOOL)tooCloseToCamera
{
  return self->_tooCloseToCamera;
}

- (void)setTooCloseToCamera:(BOOL)a3
{
  self->_tooCloseToCamera = a3;
}

- (BOOL)tooFarFromCamera
{
  return self->_tooFarFromCamera;
}

- (void)setTooFarFromCamera:(BOOL)a3
{
  self->_tooFarFromCamera = a3;
}

- (BOOL)multipleFaces
{
  return self->_multipleFaces;
}

- (void)setMultipleFaces:(BOOL)a3
{
  self->_multipleFaces = a3;
}

- (BOOL)flare
{
  return self->_flare;
}

- (void)setFlare:(BOOL)a3
{
  self->_flare = a3;
}

- (BOOL)occlusion
{
  return self->_occlusion;
}

- (void)setOcclusion:(BOOL)a3
{
  self->_occlusion = a3;
}

- (BOOL)partiallyOutOfView
{
  return self->_partiallyOutOfView;
}

- (BOOL)unsupportedGlasses
{
  return self->_unsupportedGlasses;
}

- (BOOL)glassesMismatch
{
  return self->_glassesMismatch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceDetectionScore, 0);
  objc_storeStrong((id *)&self->_attentionScore, 0);
  objc_storeStrong((id *)&self->_frameNumber, 0);
  objc_storeStrong((id *)&self->_cameraObstructionScore, 0);
  objc_storeStrong((id *)&self->_isCameraObstructed, 0);
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_roll, 0);
  objc_storeStrong((id *)&self->_yaw, 0);
  objc_storeStrong((id *)&self->_pitch, 0);
}

@end

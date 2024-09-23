@implementation HMDCameraRecordingSessionSignificantEvent

- (HMDCameraRecordingSessionSignificantEvent)initWithUUID:(id)a3
{
  id v4;
  void *v5;
  HMDCameraRecordingSessionSignificantEvent *v6;
  uint64_t v7;
  NSUUID *UUID;
  uint64_t v9;
  NSDate *dateOfOccurrence;
  uint64_t v11;
  NSSet *faceClassifications;
  HMDCameraRecordingSessionSignificantEvent *v14;
  SEL v15;
  id v16;
  objc_super v17;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v17.receiver = self;
    v17.super_class = (Class)HMDCameraRecordingSessionSignificantEvent;
    v6 = -[HMDCameraRecordingSessionSignificantEvent init](&v17, sel_init);
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
      UUID = v6->_UUID;
      v6->_UUID = (NSUUID *)v7;

      v6->_reason = 1;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = objc_claimAutoreleasedReturnValue();
      dateOfOccurrence = v6->_dateOfOccurrence;
      v6->_dateOfOccurrence = (NSDate *)v9;

      v6->_confidenceLevel = 100;
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v11 = objc_claimAutoreleasedReturnValue();
      faceClassifications = v6->_faceClassifications;
      v6->_faceClassifications = (NSSet *)v11;

    }
    return v6;
  }
  else
  {
    v14 = (HMDCameraRecordingSessionSignificantEvent *)_HMFPreconditionFailure();
    return (HMDCameraRecordingSessionSignificantEvent *)-[HMDCameraRecordingSessionSignificantEvent isEqual:](v14, v15, v16);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  void *v29;
  void *v30;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDCameraRecordingSessionSignificantEvent UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqual:", v8)
      || (v9 = -[HMDCameraRecordingSessionSignificantEvent reason](self, "reason"), v9 != objc_msgSend(v6, "reason")))
    {
      v27 = 0;
LABEL_18:

      goto LABEL_19;
    }
    -[HMDCameraRecordingSessionSignificantEvent dateOfOccurrence](self, "dateOfOccurrence");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateOfOccurrence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isEqualToDate:", v11))
      goto LABEL_16;
    v12 = -[HMDCameraRecordingSessionSignificantEvent confidenceLevel](self, "confidenceLevel");
    if (v12 != objc_msgSend(v6, "confidenceLevel")
      || (-[HMDCameraRecordingSessionSignificantEvent sessionEntityUUID](self, "sessionEntityUUID"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "sessionEntityUUID"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = HMFEqualObjects(),
          v14,
          v13,
          !v15))
    {
LABEL_16:
      v27 = 0;
LABEL_17:

      goto LABEL_18;
    }
    -[HMDCameraRecordingSessionSignificantEvent faceClassifications](self, "faceClassifications");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "faceClassifications");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v16, "isEqualToSet:", v17))
      goto LABEL_20;
    v29 = v17;
    v30 = v16;
    -[HMDCameraRecordingSessionSignificantEvent heroFrameData](self, "heroFrameData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "heroFrameData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = HMFEqualObjects();

    if (!v20)
    {
      v27 = 0;
      v17 = v29;
      v16 = v30;
      goto LABEL_22;
    }
    -[HMDCameraRecordingSessionSignificantEvent faceCropData](self, "faceCropData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "faceCropData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = HMFEqualObjects();

    v17 = v29;
    v16 = v30;
    if (v23)
    {
      -[HMDCameraRecordingSessionSignificantEvent timeOffsetWithinClip](self, "timeOffsetWithinClip");
      v25 = v24;
      objc_msgSend(v6, "timeOffsetWithinClip");
      v27 = v25 == v26;
    }
    else
    {
LABEL_20:
      v27 = 0;
    }
LABEL_22:

    goto LABEL_17;
  }
  v27 = 0;
LABEL_19:

  return v27;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDCameraRecordingSessionSignificantEvent UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMDMutableCameraRecordingSessionSignificantEvent *v4;
  void *v5;
  HMDMutableCameraRecordingSessionSignificantEvent *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = +[HMDMutableCameraRecordingSessionSignificantEvent allocWithZone:](HMDMutableCameraRecordingSessionSignificantEvent, "allocWithZone:", a3);
  -[HMDCameraRecordingSessionSignificantEvent UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDCameraRecordingSessionSignificantEvent initWithUUID:](v4, "initWithUUID:", v5);

  -[HMDCameraRecordingSessionSignificantEvent setReason:](v6, "setReason:", -[HMDCameraRecordingSessionSignificantEvent reason](self, "reason"));
  -[HMDCameraRecordingSessionSignificantEvent dateOfOccurrence](self, "dateOfOccurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSessionSignificantEvent setDateOfOccurrence:](v6, "setDateOfOccurrence:", v7);

  -[HMDCameraRecordingSessionSignificantEvent setConfidenceLevel:](v6, "setConfidenceLevel:", -[HMDCameraRecordingSessionSignificantEvent confidenceLevel](self, "confidenceLevel"));
  -[HMDCameraRecordingSessionSignificantEvent sessionEntityUUID](self, "sessionEntityUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSessionSignificantEvent setSessionEntityUUID:](v6, "setSessionEntityUUID:", v8);

  -[HMDCameraRecordingSessionSignificantEvent faceClassifications](self, "faceClassifications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSessionSignificantEvent setFaceClassifications:](v6, "setFaceClassifications:", v9);

  -[HMDCameraRecordingSessionSignificantEvent heroFrameData](self, "heroFrameData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSessionSignificantEvent setHeroFrameData:](v6, "setHeroFrameData:", v10);

  -[HMDCameraRecordingSessionSignificantEvent faceCropData](self, "faceCropData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingSessionSignificantEvent setFaceCropData:](v6, "setFaceCropData:", v11);

  -[HMDCameraRecordingSessionSignificantEvent timeOffsetWithinClip](self, "timeOffsetWithinClip");
  -[HMDCameraRecordingSessionSignificantEvent setTimeOffsetWithinClip:](v6, "setTimeOffsetWithinClip:");
  return v6;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCameraRecordingSessionSignificantEvent UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("UUID"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCameraRecordingSessionSignificantEvent reason](self, "reason");
  HMStringFromCameraSignificantEventReason();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Reason"), v8);
  objc_msgSend(v3, "addObject:", v9);

  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCameraRecordingSessionSignificantEvent dateOfOccurrence](self, "dateOfOccurrence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Date"), v11);
  objc_msgSend(v3, "addObject:", v12);

  v13 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDCameraRecordingSessionSignificantEvent confidenceLevel](self, "confidenceLevel");
  HMStringFromCameraSignificantEventConfidenceLevel();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Confidence Level"), v14);
  objc_msgSend(v3, "addObject:", v15);

  v16 = objc_alloc(MEMORY[0x1E0D28548]);
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDCameraRecordingSessionSignificantEvent timeOffsetWithinClip](self, "timeOffsetWithinClip");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("Time Offset Within Clip"), v18);
  objc_msgSend(v3, "addObject:", v19);

  -[HMDCameraRecordingSessionSignificantEvent sessionEntityUUID](self, "sessionEntityUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMDCameraRecordingSessionSignificantEvent sessionEntityUUID](self, "sessionEntityUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("Session Entity UUID"), v22);
    objc_msgSend(v3, "addObject:", v23);

  }
  -[HMDCameraRecordingSessionSignificantEvent faceClassifications](self, "faceClassifications");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    v26 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMDCameraRecordingSessionSignificantEvent faceClassifications](self, "faceClassifications");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v26, "initWithName:value:", CFSTR("Face Classifications"), v27);
    objc_msgSend(v3, "addObject:", v28);

  }
  -[HMDCameraRecordingSessionSignificantEvent heroFrameData](self, "heroFrameData");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMDCameraRecordingSessionSignificantEvent heroFrameData](self, "heroFrameData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "shortDescription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v30, "initWithName:value:", CFSTR("Hero Frame Data"), v32);
    objc_msgSend(v3, "addObject:", v33);

  }
  -[HMDCameraRecordingSessionSignificantEvent faceCropData](self, "faceCropData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    v35 = objc_alloc(MEMORY[0x1E0D28548]);
    -[HMDCameraRecordingSessionSignificantEvent faceCropData](self, "faceCropData");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "shortDescription");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v35, "initWithName:value:", CFSTR("Face Crop Data"), v37);
    objc_msgSend(v3, "addObject:", v38);

  }
  v39 = (void *)objc_msgSend(v3, "copy");

  return v39;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (NSDate)dateOfOccurrence
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDateOfOccurrence:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (unint64_t)confidenceLevel
{
  return self->_confidenceLevel;
}

- (void)setConfidenceLevel:(unint64_t)a3
{
  self->_confidenceLevel = a3;
}

- (NSUUID)sessionEntityUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSessionEntityUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSSet)faceClassifications
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setFaceClassifications:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSData)heroFrameData
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHeroFrameData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSData)faceCropData
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFaceCropData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (double)timeOffsetWithinClip
{
  return self->_timeOffsetWithinClip;
}

- (void)setTimeOffsetWithinClip:(double)a3
{
  self->_timeOffsetWithinClip = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCropData, 0);
  objc_storeStrong((id *)&self->_heroFrameData, 0);
  objc_storeStrong((id *)&self->_faceClassifications, 0);
  objc_storeStrong((id *)&self->_sessionEntityUUID, 0);
  objc_storeStrong((id *)&self->_dateOfOccurrence, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end

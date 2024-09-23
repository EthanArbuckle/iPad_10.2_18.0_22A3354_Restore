@implementation HMCameraClipSignificantEvent

- (HMCameraClipSignificantEvent)initWithUniqueIdentifier:(id)a3 reason:(unint64_t)a4 dateOfOccurrence:(id)a5 confidenceLevel:(unint64_t)a6 cameraProfileUUID:(id)a7 faceClassification:(id)a8 timeOffsetWithinClip:(double)a9 clipUUID:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  HMCameraClipSignificantEvent *v23;
  HMCameraClipSignificantEvent *v24;
  HMCameraClipSignificantEvent *v26;
  SEL v27;
  id v28;
  unint64_t v29;
  id v30;
  unint64_t v31;
  id v32;
  id v33;
  double v34;
  objc_super v35;

  v17 = a3;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v21 = a10;
  if (v21)
  {
    v22 = v21;
    v35.receiver = self;
    v35.super_class = (Class)HMCameraClipSignificantEvent;
    v23 = -[HMCameraSignificantEvent initWithUniqueIdentifier:reason:dateOfOccurrence:confidenceLevel:cameraProfileUUID:faceClassification:](&v35, sel_initWithUniqueIdentifier_reason_dateOfOccurrence_confidenceLevel_cameraProfileUUID_faceClassification_, v17, a4, v18, a6, v19, v20);
    v24 = v23;
    if (v23)
    {
      v23->_timeOffsetWithinClip = a9;
      objc_storeStrong((id *)&v23->_clipUUID, a10);
    }

    return v24;
  }
  else
  {
    v26 = (HMCameraClipSignificantEvent *)_HMFPreconditionFailure();
    return -[HMCameraClipSignificantEvent initWithUniqueIdentifier:reason:dateOfOccurrence:confidenceLevel:faceClassification:timeOffsetWithinClip:clipUUID:](v26, v27, v28, v29, v30, v31, v32, v34, v33);
  }
}

- (HMCameraClipSignificantEvent)initWithUniqueIdentifier:(id)a3 reason:(unint64_t)a4 dateOfOccurrence:(id)a5 confidenceLevel:(unint64_t)a6 faceClassification:(id)a7 timeOffsetWithinClip:(double)a8 clipUUID:(id)a9
{
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  HMCameraClipSignificantEvent *v22;

  v16 = (void *)MEMORY[0x1E0CB3A28];
  v17 = a9;
  v18 = a7;
  v19 = a5;
  v20 = a3;
  objc_msgSend(v16, "UUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HMCameraClipSignificantEvent initWithUniqueIdentifier:reason:dateOfOccurrence:confidenceLevel:cameraProfileUUID:faceClassification:timeOffsetWithinClip:clipUUID:](self, "initWithUniqueIdentifier:reason:dateOfOccurrence:confidenceLevel:cameraProfileUUID:faceClassification:timeOffsetWithinClip:clipUUID:", v20, a4, v19, a6, v21, v18, a8, v17);

  return v22;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[HMCameraClipSignificantEvent timeOffsetWithinClip](self, "timeOffsetWithinClip");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Time offset within clip"), v5);
  v15[0] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCameraClipSignificantEvent clipUUID](self, "clipUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Clip UUID"), v8);
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)HMCameraClipSignificantEvent;
  -[HMCameraSignificantEvent attributeDescriptions](&v14, sel_attributeDescriptions);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  char v12;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v14.receiver = self,
        v14.super_class = (Class)HMCameraClipSignificantEvent,
        -[HMCameraSignificantEvent isEqual:](&v14, sel_isEqual_, v6))
    && (-[HMCameraClipSignificantEvent timeOffsetWithinClip](self, "timeOffsetWithinClip"),
        v8 = v7,
        objc_msgSend(v6, "timeOffsetWithinClip"),
        v8 == v9))
  {
    -[HMCameraClipSignificantEvent clipUUID](self, "clipUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clipUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMCameraClipSignificantEvent;
  v4 = a3;
  -[HMCameraSignificantEvent encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HMCameraClipSignificantEvent timeOffsetWithinClip](self, "timeOffsetWithinClip", v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("to"));
  -[HMCameraClipSignificantEvent clipUUID](self, "clipUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("cu"));

}

- (HMCameraClipSignificantEvent)initWithCoder:(id)a3
{
  id v4;
  HMCameraSignificantEvent *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  HMCameraClipSignificantEvent *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMCameraSignificantEvent initWithCoder:]([HMCameraSignificantEvent alloc], "initWithCoder:", v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cu"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("to"));
      v8 = v7;
      -[HMCameraSignificantEvent uniqueIdentifier](v5, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[HMCameraSignificantEvent reason](v5, "reason");
      -[HMCameraSignificantEvent dateOfOccurrence](v5, "dateOfOccurrence");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HMCameraSignificantEvent confidenceLevel](v5, "confidenceLevel");
      -[HMCameraSignificantEvent cameraProfileUUID](v5, "cameraProfileUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCameraSignificantEvent faceClassification](v5, "faceClassification");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[HMCameraClipSignificantEvent initWithUniqueIdentifier:reason:dateOfOccurrence:confidenceLevel:cameraProfileUUID:faceClassification:timeOffsetWithinClip:clipUUID:](self, "initWithUniqueIdentifier:reason:dateOfOccurrence:confidenceLevel:cameraProfileUUID:faceClassification:timeOffsetWithinClip:clipUUID:", v9, v10, v11, v12, v13, v14, v8, v6);

      v15 = self;
    }
    else
    {
      v16 = (void *)MEMORY[0x1A1AC1AAC]();
      self = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v18;
        v22 = 2112;
        v23 = 0;
        _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded clipUUID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (double)timeOffsetWithinClip
{
  return self->_timeOffsetWithinClip;
}

- (NSUUID)clipUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

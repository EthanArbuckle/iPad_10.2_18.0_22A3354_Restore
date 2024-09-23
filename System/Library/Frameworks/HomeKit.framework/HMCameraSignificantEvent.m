@implementation HMCameraSignificantEvent

- (HMCameraSignificantEvent)initWithUniqueIdentifier:(id)a3 reason:(unint64_t)a4 dateOfOccurrence:(id)a5 confidenceLevel:(unint64_t)a6 cameraProfileUUID:(id)a7 faceClassification:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  HMCameraSignificantEvent *v19;
  HMCameraSignificantEvent *v20;
  HMCameraSignificantEvent *v22;
  SEL v23;
  id v24;
  unint64_t v25;
  id v26;
  unint64_t v27;
  id v28;
  objc_super v30;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v15)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v16)
  {
LABEL_9:
    v22 = (HMCameraSignificantEvent *)_HMFPreconditionFailure();
    return -[HMCameraSignificantEvent initWithUniqueIdentifier:reason:dateOfOccurrence:confidenceLevel:faceClassification:](v22, v23, v24, v25, v26, v27, v28);
  }
  v18 = v17;
  v30.receiver = self;
  v30.super_class = (Class)HMCameraSignificantEvent;
  v19 = -[HMCameraSignificantEvent init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_uniqueIdentifier, a3);
    v20->_reason = a4;
    objc_storeStrong((id *)&v20->_dateOfOccurrence, a5);
    v20->_confidenceLevel = a6;
    objc_storeStrong((id *)&v20->_cameraProfileUUID, a7);
    objc_storeStrong((id *)&v20->_faceClassification, a8);
  }

  return v20;
}

- (HMCameraSignificantEvent)initWithUniqueIdentifier:(id)a3 reason:(unint64_t)a4 dateOfOccurrence:(id)a5 confidenceLevel:(unint64_t)a6 faceClassification:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  HMCameraSignificantEvent *v17;

  v12 = (void *)MEMORY[0x1E0CB3A28];
  v13 = a7;
  v14 = a5;
  v15 = a3;
  objc_msgSend(v12, "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMCameraSignificantEvent initWithUniqueIdentifier:reason:dateOfOccurrence:confidenceLevel:cameraProfileUUID:faceClassification:](self, "initWithUniqueIdentifier:reason:dateOfOccurrence:confidenceLevel:cameraProfileUUID:faceClassification:", v15, a4, v14, a6, v16, v13);

  return v17;
}

- (BOOL)canAskForUserFeedback
{
  return -[HMCameraSignificantEvent reason](self, "reason") - 3 < 3;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];

  v23[6] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCameraSignificantEvent uniqueIdentifier](self, "uniqueIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("ID"), v22);
  v23[0] = v21;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  HMStringFromCameraSignificantEventReason(-[HMCameraSignificantEvent reason](self, "reason"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Reason"), v20);
  v23[1] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCameraSignificantEvent dateOfOccurrence](self, "dateOfOccurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Date"), v7);
  v23[2] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  HMStringFromCameraSignificantEventConfidenceLevel(-[HMCameraSignificantEvent confidenceLevel](self, "confidenceLevel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Confidence level"), v10);
  v23[3] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCameraSignificantEvent cameraProfileUUID](self, "cameraProfileUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Camera Profile UUID"), v13);
  v23[4] = v14;
  v15 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCameraSignificantEvent faceClassification](self, "faceClassification");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Face Classification"), v16);
  v23[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v18;
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
  void *v15;
  char v16;
  void *v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMCameraSignificantEvent uniqueIdentifier](self, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8)
      && (v9 = -[HMCameraSignificantEvent reason](self, "reason"), v9 == objc_msgSend(v6, "reason")))
    {
      -[HMCameraSignificantEvent dateOfOccurrence](self, "dateOfOccurrence");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dateOfOccurrence");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToDate:", v11)
        && (v12 = -[HMCameraSignificantEvent confidenceLevel](self, "confidenceLevel"),
            v12 == objc_msgSend(v6, "confidenceLevel")))
      {
        -[HMCameraSignificantEvent cameraProfileUUID](self, "cameraProfileUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "cameraProfileUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqual:", v14))
        {
          -[HMCameraSignificantEvent faceClassification](self, "faceClassification");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "faceClassification");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = HMFEqualObjects();

        }
        else
        {
          v16 = 0;
        }

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMCameraSignificantEvent uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMCameraSignificantEvent uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ui"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMCameraSignificantEvent reason](self, "reason"), CFSTR("r"));
  -[HMCameraSignificantEvent dateOfOccurrence](self, "dateOfOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("doc"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMCameraSignificantEvent confidenceLevel](self, "confidenceLevel"), CFSTR("cl"));
  -[HMCameraSignificantEvent cameraProfileUUID](self, "cameraProfileUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("cpu"));

  -[HMCameraSignificantEvent faceClassification](self, "faceClassification");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("fc"));

}

- (HMCameraSignificantEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  HMCameraSignificantEvent *v11;
  HMCameraSignificantEvent *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ui"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("r"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("doc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cl"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cpu"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fc"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v7 && v8)
  {
    v11 = -[HMCameraSignificantEvent initWithUniqueIdentifier:reason:dateOfOccurrence:confidenceLevel:cameraProfileUUID:faceClassification:](self, "initWithUniqueIdentifier:reason:dateOfOccurrence:confidenceLevel:cameraProfileUUID:faceClassification:", v5, v6, v7, v8, v9, v10);
    v12 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      HMStringFromCameraSignificantEventConfidenceLevel(v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138544130;
      v19 = v15;
      v20 = 2112;
      v21 = v5;
      v22 = 2112;
      v23 = v7;
      v24 = 2112;
      v25 = v16;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded uniqueIdentifier: %@ dateOfOccurrence: %@ confidence level: %@", (uint8_t *)&v18, 0x2Au);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)reason
{
  return self->_reason;
}

- (NSDate)dateOfOccurrence
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)confidenceLevel
{
  return self->_confidenceLevel;
}

- (NSUUID)cameraProfileUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (HMFaceClassification)faceClassification
{
  return (HMFaceClassification *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceClassification, 0);
  objc_storeStrong((id *)&self->_cameraProfileUUID, 0);
  objc_storeStrong((id *)&self->_dateOfOccurrence, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

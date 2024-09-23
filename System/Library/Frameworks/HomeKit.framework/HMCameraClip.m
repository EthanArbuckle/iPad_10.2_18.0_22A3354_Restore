@implementation HMCameraClip

- (HMCameraClip)initWithUniqueIdentifier:(id)a3 startDate:(id)a4 duration:(double)a5 targetFragmentDuration:(double)a6 isComplete:(BOOL)a7 isDonated:(BOOL)a8 quality:(int64_t)a9 streamingAssetVersion:(id)a10 encryptionContext:(id)a11 videoSegments:(id)a12 significantEvents:(id)a13
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  HMCameraClip *v26;
  uint64_t v27;
  NSUUID *uniqueIdentifier;
  uint64_t v29;
  NSString *streamingAssetVersion;
  uint64_t v31;
  HMCameraClipEncryptionContext *encryptionContext;
  uint64_t v33;
  NSArray *videoSegments;
  uint64_t v35;
  NSSet *significantEvents;
  id v38;
  objc_super v39;

  v21 = a3;
  v38 = a4;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v39.receiver = self;
  v39.super_class = (Class)HMCameraClip;
  v26 = -[HMCameraClip init](&v39, sel_init);
  if (v26)
  {
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v21);
    v27 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v26->_uniqueIdentifier;
    v26->_uniqueIdentifier = (NSUUID *)v27;

    objc_storeStrong((id *)&v26->_startDate, a4);
    v26->_duration = a5;
    v26->_targetFragmentDuration = a6;
    v26->_complete = a7;
    v26->_donated = a8;
    v26->_quality = a9;
    objc_msgSend(MEMORY[0x1E0D28630], "hmf_cachedInstanceForString:", v22);
    v29 = objc_claimAutoreleasedReturnValue();
    streamingAssetVersion = v26->_streamingAssetVersion;
    v26->_streamingAssetVersion = (NSString *)v29;

    v31 = objc_msgSend(v23, "copy");
    encryptionContext = v26->_encryptionContext;
    v26->_encryptionContext = (HMCameraClipEncryptionContext *)v31;

    v33 = objc_msgSend(v24, "copy");
    videoSegments = v26->_videoSegments;
    v26->_videoSegments = (NSArray *)v33;

    v35 = objc_msgSend(v25, "copy");
    significantEvents = v26->_significantEvents;
    v26->_significantEvents = (NSSet *)v35;

  }
  return v26;
}

- (NSDictionary)videoAssetRequiredHTTPHeaders
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[HMCameraClip streamingAssetVersion](self, "streamingAssetVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requiredHTTPHeadersForStreamingAssetVersion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (NSData)encryptionKey
{
  void *v2;
  void *v3;

  -[HMCameraClip encryptionContext](self, "encryptionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (BOOL)canAskForUserFeedback
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HMCameraClip significantEvents](self, "significantEvents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMCameraClip significantEvents](self, "significantEvents", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "canAskForUserFeedback"))
        {
          v10 = 0;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_12:

  return v10;
}

- (NSArray)videoDataSegments
{
  void *v2;
  void *v3;

  -[HMCameraClip videoSegments](self, "videoSegments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_8177);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  int v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMCameraClip uniqueIdentifier](self, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMCameraClip startDate](self, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isEqualToDate:", v10))
        goto LABEL_18;
      -[HMCameraClip duration](self, "duration");
      v12 = v11;
      objc_msgSend(v6, "duration");
      if (v12 != v13)
        goto LABEL_18;
      -[HMCameraClip targetFragmentDuration](self, "targetFragmentDuration");
      v15 = v14;
      objc_msgSend(v6, "targetFragmentDuration");
      if (v15 == v16
        && (v17 = -[HMCameraClip isComplete](self, "isComplete"), v17 == objc_msgSend(v6, "isComplete"))
        && (v18 = -[HMCameraClip isDonated](self, "isDonated"), v18 == objc_msgSend(v6, "isDonated"))
        && (v19 = -[HMCameraClip quality](self, "quality"), v19 == objc_msgSend(v6, "quality")))
      {
        -[HMCameraClip streamingAssetVersion](self, "streamingAssetVersion");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "streamingAssetVersion");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isEqualToString:", v21))
        {
          -[HMCameraClip encryptionContext](self, "encryptionContext");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "encryptionContext");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v22;
          if (objc_msgSend(v22, "isEqual:", v32))
          {
            -[HMCameraClip videoSegments](self, "videoSegments");
            v23 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "videoSegments");
            v24 = objc_claimAutoreleasedReturnValue();
            v31 = (void *)v23;
            v25 = (void *)v23;
            v26 = (void *)v24;
            if (objc_msgSend(v25, "isEqualToArray:", v24))
            {
              -[HMCameraClip significantEvents](self, "significantEvents");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "significantEvents");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v30, "isEqualToSet:", v29);

            }
            else
            {
              v27 = 0;
            }

          }
          else
          {
            v27 = 0;
          }

        }
        else
        {
          v27 = 0;
        }

      }
      else
      {
LABEL_18:
        v27 = 0;
      }

    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMCameraClip uniqueIdentifier](self, "uniqueIdentifier");
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
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[HMCameraClip uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMCC.ck.uuid"));

  -[HMCameraClip startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMCC.ck.st"));

  -[HMCameraClip duration](self, "duration");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HMCC.ck.d"));
  -[HMCameraClip targetFragmentDuration](self, "targetFragmentDuration");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("HMCC.ck.tfd"));
  objc_msgSend(v4, "encodeBool:forKey:", -[HMCameraClip isComplete](self, "isComplete"), CFSTR("HMCC.ck.ic"));
  objc_msgSend(v4, "encodeBool:forKey:", -[HMCameraClip isDonated](self, "isDonated"), CFSTR("HMCC.ck.id"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMCameraClip quality](self, "quality"), CFSTR("HMCC.ck.q"));
  -[HMCameraClip streamingAssetVersion](self, "streamingAssetVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMCC.ck.sav"));

  -[HMCameraClip encryptionContext](self, "encryptionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMCC.ck.ec"));

  -[HMCameraClip videoSegments](self, "videoSegments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HMCC.ck.vs"));

  -[HMCameraClip significantEvents](self, "significantEvents");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("HMCC.ck.se"));

}

- (HMCameraClip)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  HMCameraClip *v22;
  HMCameraClip *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  unsigned int v28;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCC.ck.uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCC.ck.st"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("HMCC.ck.d"));
  v7 = v6;
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("HMCC.ck.tfd"));
  v9 = v8;
  v28 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("HMCC.ck.ic"));
  v10 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("HMCC.ck.id"));
  v11 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("HMCC.ck.q"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCC.ck.sav"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCC.ck.ec"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v16, CFSTR("HMCC.ck.vs"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v20, CFSTR("HMCC.ck.se"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v5 && v12 && v13 && v17 && v21)
  {
    v22 = -[HMCameraClip initWithUniqueIdentifier:startDate:duration:targetFragmentDuration:isComplete:isDonated:quality:streamingAssetVersion:encryptionContext:videoSegments:significantEvents:](self, "initWithUniqueIdentifier:startDate:duration:targetFragmentDuration:isComplete:isDonated:quality:streamingAssetVersion:encryptionContext:videoSegments:significantEvents:", v4, v5, v28, v10, v11, v12, v7, v9, v13, v17, v21);
    v23 = v22;
  }
  else
  {
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v32 = v26;
      v33 = 2112;
      v34 = v4;
      v35 = 2112;
      v36 = v5;
      v37 = 2112;
      v38 = v12;
      v39 = 2112;
      v40 = v13;
      v41 = 2112;
      v42 = v17;
      v43 = 2112;
      v44 = v21;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded uuid: %@ startDate: %@ streamingAssetVersion: %@ encryptionContext: %@ videoSegments: %@ significantEvents: %@", buf, 0x48u);

      v24 = v30;
    }

    objc_autoreleasePoolPop(v24);
    v23 = 0;
  }

  return v23;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
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
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCameraClip uniqueIdentifier](self, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("ID"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCameraClip startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Start Date"), v8);
  objc_msgSend(v3, "addObject:", v9);

  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[HMCameraClip duration](self, "duration");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Duration"), v12);
  objc_msgSend(v3, "addObject:", v13);

  v14 = objc_alloc(MEMORY[0x1E0D28548]);
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[HMCameraClip targetFragmentDuration](self, "targetFragmentDuration");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("Target Fragment Duration"), v16);
  objc_msgSend(v3, "addObject:", v17);

  v18 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCameraClip isComplete](self, "isComplete");
  HMFBooleanToString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithName:value:", CFSTR("Complete"), v19);
  objc_msgSend(v3, "addObject:", v20);

  v21 = objc_alloc(MEMORY[0x1E0D28548]);
  HMStringFromCameraClipQuality(-[HMCameraClip quality](self, "quality"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithName:value:", CFSTR("Quality"), v22);
  objc_msgSend(v3, "addObject:", v23);

  v24 = objc_alloc(MEMORY[0x1E0D28548]);
  v25 = (void *)MEMORY[0x1E0CB37E8];
  -[HMCameraClip videoSegments](self, "videoSegments");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v24, "initWithName:value:", CFSTR("Video Segments Count"), v27);
  objc_msgSend(v3, "addObject:", v28);

  -[HMCameraClip significantEvents](self, "significantEvents");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "na_map:", &__block_literal_global_56);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(v30, "allObjects");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "componentsJoinedByString:", CFSTR(","));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v31, "initWithName:value:", CFSTR("Significant Events"), v33);
  objc_msgSend(v3, "addObject:", v34);

  v35 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v35;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (BOOL)isDonated
{
  return self->_donated;
}

- (int64_t)quality
{
  return self->_quality;
}

- (double)targetFragmentDuration
{
  return self->_targetFragmentDuration;
}

- (NSSet)significantEvents
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)streamingAssetVersion
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (HMCameraClipEncryptionContext)encryptionContext
{
  return (HMCameraClipEncryptionContext *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)videoSegments
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoSegments, 0);
  objc_storeStrong((id *)&self->_encryptionContext, 0);
  objc_storeStrong((id *)&self->_streamingAssetVersion, 0);
  objc_storeStrong((id *)&self->_significantEvents, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

__CFString *__37__HMCameraClip_attributeDescriptions__block_invoke(uint64_t a1, void *a2)
{
  return HMStringFromCameraSignificantEventReason(objc_msgSend(a2, "reason"));
}

id __33__HMCameraClip_videoDataSegments__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

+ (id)requiredHTTPHeadersForStreamingAssetVersion:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("x-apple-sa-version");
  v8[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end

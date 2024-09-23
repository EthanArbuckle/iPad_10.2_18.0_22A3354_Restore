@implementation MPMusicPlayerQueueDescriptor

- (id)_init
{
  MPMusicPlayerQueueDescriptor *v2;
  MPMusicPlayerQueueDescriptor *v3;
  void *v4;
  uint64_t v5;
  NSString *requestingBundleIdentifier;
  uint64_t v7;
  NSString *requestingBundleVersion;
  NSString *playActivityFeatureName;
  objc_super v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MPMusicPlayerQueueDescriptor;
  v2 = -[MPMusicPlayerQueueDescriptor init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_shuffleType = xmmword_193F0CB00;
    if (_MPMusicPlayerGetBundleInfoPair_onceToken != -1)
      dispatch_once(&_MPMusicPlayerGetBundleInfoPair_onceToken, &__block_literal_global_18745);
    objc_msgSend(MEMORY[0x1E0D4D0B8], "pairWithFirst:second:", _MPMusicPlayerGetBundleInfoPair___bundleIdentifier, _MPMusicPlayerGetBundleInfoPair___bundleVersion);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "first");
    v5 = objc_claimAutoreleasedReturnValue();
    requestingBundleIdentifier = v3->_requestingBundleIdentifier;
    v3->_requestingBundleIdentifier = (NSString *)v5;

    objc_msgSend(v4, "second");
    v7 = objc_claimAutoreleasedReturnValue();
    requestingBundleVersion = v3->_requestingBundleVersion;
    v3->_requestingBundleVersion = (NSString *)v7;

    playActivityFeatureName = v3->_playActivityFeatureName;
    v3->_playActivityFeatureName = (NSString *)CFSTR("MusicKit");

  }
  v11.receiver = v3;
  v11.super_class = (Class)MPMusicPlayerQueueDescriptor;
  return -[MPMusicPlayerQueueDescriptor init](&v11, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  int isPrivate;
  int v8;
  NSDictionary *v9;
  NSDictionary *v10;
  NSDictionary *v11;
  int v12;
  char v13;
  NSDictionary *v14;
  NSDictionary *v15;
  NSDictionary *v16;
  int v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  char v21;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  char v25;
  char v28;
  uint64_t v30;
  int64_t repeatType;
  int64_t shuffleType;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    repeatType = self->_repeatType;
    shuffleType = self->_shuffleType;
    v6 = v5[2];
    v30 = v5[3];
    isPrivate = self->_isPrivate;
    v8 = *((unsigned __int8 *)v5 + 9);
    v9 = (NSDictionary *)v5[8];
    v10 = self->_startTimes;
    v11 = v10;
    if (v10 == v9)
      LOBYTE(v12) = 0;
    else
      v12 = -[NSDictionary isEqual:](v10, "isEqual:", v9) ^ 1;

    v14 = (NSDictionary *)v5[9];
    v15 = self->_endTimes;
    v16 = v15;
    if (v15 == v14)
      LOBYTE(v17) = 0;
    else
      v17 = -[NSDictionary isEqual:](v15, "isEqual:", v14) ^ 1;

    v18 = (NSString *)v5[6];
    v19 = self->_playActivityQueueGroupingID;
    v20 = v19;
    if (v19 == v18)
      v21 = 1;
    else
      v21 = -[NSString isEqual:](v19, "isEqual:", v18);

    v22 = (NSString *)v5[7];
    v23 = self->_playActivityFeatureName;
    v24 = v23;
    if (v23 == v22)
      v25 = 1;
    else
      v25 = -[NSString isEqual:](v23, "isEqual:", v22);

    if (shuffleType == v6 && repeatType == v30 && isPrivate == v8)
      v28 = v12;
    else
      v28 = 1;
    v13 = v21 & ~(v28 | v17) & v25;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (MPMusicPlayerQueueDescriptor)initWithCoder:(id)a3
{
  id v4;
  MPMusicPlayerQueueDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *startTimes;
  uint64_t v11;
  NSDictionary *endTimes;
  uint64_t v13;
  NSString *requestingBundleIdentifier;
  uint64_t v15;
  NSString *requestingBundleVersion;
  uint64_t v17;
  NSString *playActivityQueueGroupingID;
  uint64_t v19;
  NSString *playActivityFeatureName;
  objc_super v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MPMusicPlayerQueueDescriptor;
  v5 = -[MPMusicPlayerQueueDescriptor init](&v22, sel_init);
  if (v5)
  {
    v5->_disableQueueModifications = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disableQueueModifications"));
    v5->_shuffleType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("shuffleType"));
    v5->_repeatType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("repeatType"));
    v5->_isPrivate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("private"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v23[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MPMusicPlayerQueueDescriptorStartTimes"));
    v9 = objc_claimAutoreleasedReturnValue();
    startTimes = v5->_startTimes;
    v5->_startTimes = (NSDictionary *)v9;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("MPMusicPlayerQueueDescriptorEndTimes"));
    v11 = objc_claimAutoreleasedReturnValue();
    endTimes = v5->_endTimes;
    v5->_endTimes = (NSDictionary *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v13 = objc_claimAutoreleasedReturnValue();
    requestingBundleIdentifier = v5->_requestingBundleIdentifier;
    v5->_requestingBundleIdentifier = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleVersion"));
    v15 = objc_claimAutoreleasedReturnValue();
    requestingBundleVersion = v5->_requestingBundleVersion;
    v5->_requestingBundleVersion = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("queueGroupingID"));
    v17 = objc_claimAutoreleasedReturnValue();
    playActivityQueueGroupingID = v5->_playActivityQueueGroupingID;
    v5->_playActivityQueueGroupingID = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featureName"));
    v19 = objc_claimAutoreleasedReturnValue();
    playActivityFeatureName = v5->_playActivityFeatureName;
    v5->_playActivityFeatureName = (NSString *)v19;

    v5->_prioritizeStartupOverQuality = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prioritizeStartupOverQuality"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 disableQueueModifications;
  id v5;

  disableQueueModifications = self->_disableQueueModifications;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", disableQueueModifications, CFSTR("disableQueueModifications"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_shuffleType, CFSTR("shuffleType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_repeatType, CFSTR("repeatType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPrivate, CFSTR("private"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startTimes, CFSTR("MPMusicPlayerQueueDescriptorStartTimes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endTimes, CFSTR("MPMusicPlayerQueueDescriptorEndTimes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestingBundleIdentifier, CFSTR("bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestingBundleVersion, CFSTR("bundleVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playActivityQueueGroupingID, CFSTR("queueGroupingID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playActivityFeatureName, CFSTR("featureName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_prioritizeStartupOverQuality, CFSTR("prioritizeStartupOverQuality"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  *((_BYTE *)v4 + 8) = self->_disableQueueModifications;
  *((_QWORD *)v4 + 2) = self->_shuffleType;
  *((_QWORD *)v4 + 3) = self->_repeatType;
  *((_BYTE *)v4 + 9) = self->_isPrivate;
  v5 = -[NSDictionary mutableCopy](self->_startTimes, "mutableCopy");
  v6 = (void *)*((_QWORD *)v4 + 8);
  *((_QWORD *)v4 + 8) = v5;

  v7 = -[NSDictionary mutableCopy](self->_endTimes, "mutableCopy");
  v8 = (void *)*((_QWORD *)v4 + 9);
  *((_QWORD *)v4 + 9) = v7;

  objc_storeStrong((id *)v4 + 4, self->_requestingBundleIdentifier);
  objc_storeStrong((id *)v4 + 5, self->_requestingBundleVersion);
  objc_storeStrong((id *)v4 + 6, self->_playActivityQueueGroupingID);
  objc_storeStrong((id *)v4 + 7, self->_playActivityFeatureName);
  *((_BYTE *)v4 + 10) = self->_prioritizeStartupOverQuality;
  return v4;
}

- (BOOL)isEmpty
{
  uint64_t v4;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  v4 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
  if (v4 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMusicPlayerQueueDescriptor.m"), 183, CFSTR("Subclass %@ must implement -%@ defined in %@."), v8, v9, CFSTR("[MPMusicPlayerQueueDescriptor class]"));

  }
  return 1;
}

- (void)_setStartTime:(double)a3 forIdentifiers:(id)a4
{
  NSDictionary **p_startTimes;
  NSDictionary *startTimes;
  NSDictionary *v8;
  void *v9;
  id v10;

  v10 = a4;
  startTimes = self->_startTimes;
  p_startTimes = &self->_startTimes;
  v8 = startTimes;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)p_startTimes, v8);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary setObject:forKey:](v8, "setObject:forKey:", v9, v10);

}

- (void)_setEndTime:(double)a3 forIdentifiers:(id)a4
{
  NSDictionary **p_endTimes;
  NSDictionary *endTimes;
  NSDictionary *v8;
  void *v9;
  id v10;

  v10 = a4;
  endTimes = self->_endTimes;
  p_endTimes = &self->_endTimes;
  v8 = endTimes;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)p_endTimes, v8);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary setObject:forKey:](v8, "setObject:forKey:", v9, v10);

}

- (BOOL)disableQueueModifications
{
  return self->_disableQueueModifications;
}

- (void)setDisableQueueModifications:(BOOL)a3
{
  self->_disableQueueModifications = a3;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (void)setShuffleType:(int64_t)a3
{
  self->_shuffleType = a3;
}

- (int64_t)repeatType
{
  return self->_repeatType;
}

- (void)setRepeatType:(int64_t)a3
{
  self->_repeatType = a3;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (void)setPrivate:(BOOL)a3
{
  self->_isPrivate = a3;
}

- (NSString)requestingBundleIdentifier
{
  return self->_requestingBundleIdentifier;
}

- (NSString)requestingBundleVersion
{
  return self->_requestingBundleVersion;
}

- (NSString)playActivityQueueGroupingID
{
  return self->_playActivityQueueGroupingID;
}

- (void)setPlayActivityQueueGroupingID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)playActivityFeatureName
{
  return self->_playActivityFeatureName;
}

- (void)setPlayActivityFeatureName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)startTimes
{
  return self->_startTimes;
}

- (NSDictionary)endTimes
{
  return self->_endTimes;
}

- (BOOL)prioritizeStartupOverQuality
{
  return self->_prioritizeStartupOverQuality;
}

- (void)setPrioritizeStartupOverQuality:(BOOL)a3
{
  self->_prioritizeStartupOverQuality = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimes, 0);
  objc_storeStrong((id *)&self->_startTimes, 0);
  objc_storeStrong((id *)&self->_playActivityFeatureName, 0);
  objc_storeStrong((id *)&self->_playActivityQueueGroupingID, 0);
  objc_storeStrong((id *)&self->_requestingBundleVersion, 0);
  objc_storeStrong((id *)&self->_requestingBundleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation MPPlaybackContext

- (MPPlaybackContext)initWithCoder:(id)a3
{
  id v4;
  MPPlaybackContext *v5;
  uint64_t v6;
  NSString *playActivityQueueGroupingID;
  uint64_t v8;
  NSString *playActivityFeatureName;
  uint64_t v10;
  NSData *playActivityRecommendationData;
  uint64_t v12;
  NSString *associatedParticipantIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPPlaybackContext;
  v5 = -[MPPlaybackContext init](&v15, sel_init);
  if (v5)
  {
    v5->_shuffleType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPPlaybackContextShuffleType"));
    v5->_repeatType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPPlaybackContextRepeatType"));
    v5->_queueEndAction = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPPlaybackContextQueueEndAction"));
    v5->_actionAfterQueueLoad = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MPPlaybackContextActionAfterQueueLoad"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPPlaybackContextPlayActionQueueGroupingID"));
    v6 = objc_claimAutoreleasedReturnValue();
    playActivityQueueGroupingID = v5->_playActivityQueueGroupingID;
    v5->_playActivityQueueGroupingID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPPlaybackContextPlayActivityFeatureName"));
    v8 = objc_claimAutoreleasedReturnValue();
    playActivityFeatureName = v5->_playActivityFeatureName;
    v5->_playActivityFeatureName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPPlaybackContextPlayActivityRecommendationData"));
    v10 = objc_claimAutoreleasedReturnValue();
    playActivityRecommendationData = v5->_playActivityRecommendationData;
    v5->_playActivityRecommendationData = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MPPlaybackContextAssociatedParticipantIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    associatedParticipantIdentifier = v5->_associatedParticipantIdentifier;
    v5->_associatedParticipantIdentifier = (NSString *)v12;

  }
  return v5;
}

- (NSNumber)privateListeningOverride
{
  return self->_privateListeningOverride;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_msgSend(v4, "setActionAfterQueueLoad:", -[MPPlaybackContext actionAfterQueueLoad](self, "actionAfterQueueLoad"));
  objc_msgSend(v4, "setShuffleType:", -[MPPlaybackContext shuffleType](self, "shuffleType"));
  objc_msgSend(v4, "setRepeatType:", -[MPPlaybackContext repeatType](self, "repeatType"));
  objc_msgSend(v4, "setQueueEndAction:", -[MPPlaybackContext queueEndAction](self, "queueEndAction"));
  -[MPPlaybackContext playActivityQueueGroupingID](self, "playActivityQueueGroupingID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlayActivityQueueGroupingID:", v5);

  -[MPPlaybackContext playActivityFeatureName](self, "playActivityFeatureName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlayActivityFeatureName:", v6);

  -[MPPlaybackContext playActivityRecommendationData](self, "playActivityRecommendationData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlayActivityRecommendationData:", v7);

  -[MPPlaybackContext queueDescriptor](self, "queueDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueueDescriptor:", v8);

  -[MPPlaybackContext siriAssetInfo](self, "siriAssetInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSiriAssetInfo:", v9);

  -[MPPlaybackContext siriReferenceIdentifier](self, "siriReferenceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSiriReferenceIdentifier:", v10);

  -[MPPlaybackContext siriWHAMetricsInfo](self, "siriWHAMetricsInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSiriWHAMetricsInfo:", v11);

  -[MPPlaybackContext sessionIdentifier](self, "sessionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSessionIdentifier:", v12);

  -[MPPlaybackContext overrideSILSectionID](self, "overrideSILSectionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOverrideSILSectionID:", v13);

  -[MPPlaybackContext associatedParticipantIdentifier](self, "associatedParticipantIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssociatedParticipantIdentifier:", v14);

  return v4;
}

- (MPMusicPlayerQueueDescriptor)queueDescriptor
{
  return self->_queueDescriptor;
}

- (NSString)associatedParticipantIdentifier
{
  return self->_associatedParticipantIdentifier;
}

- (id)descriptionComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t actionAfterQueueLoad;
  const __CFString *v10;
  const __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  int64_t v15;
  const __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  MPMusicPlayerQueueDescriptor *queueDescriptor;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  MPNSStringFromRepeatType(-[MPPlaybackContext repeatType](self, "repeatType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MPNSStringFromShuffleType(-[MPPlaybackContext shuffleType](self, "shuffleType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("repeat/shuffle"));

  MPNSStringFromQueueEndAction(self->_queueEndAction, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("queueEndAction"));

  actionAfterQueueLoad = self->_actionAfterQueueLoad;
  v10 = CFSTR("PrepareToPlay");
  v11 = CFSTR("None");
  if (actionAfterQueueLoad)
    v11 = 0;
  if (actionAfterQueueLoad != 10)
    v10 = v11;
  if (actionAfterQueueLoad == 20)
    v12 = CFSTR("Play");
  else
    v12 = (__CFString *)v10;
  v13 = v12;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("actionAfterQueueLoad"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_overrideSILSectionID, CFSTR("overrideSILSectionID"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'"), self->_playActivityFeatureName);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("featureName"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_associatedParticipantIdentifier, CFSTR("associatedParticipantID"));
  v15 = self->_actionAfterQueueLoad;
  if (v15)
  {
    v16 = CFSTR("PrepareToPlay");
    if (v15 != 10)
      v16 = 0;
    if (v15 == 20)
      v17 = CFSTR("Play");
    else
      v17 = (__CFString *)v16;
    v18 = v17;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("actionAfterQueueLoad"));

  }
  if (-[NSString length](self->_siriAssetInfo, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("YES"), CFSTR("siriAssetInfo"));
  if (-[NSString length](self->_sessionIdentifier, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("YES"), CFSTR("sessionIdentifier"));
  queueDescriptor = self->_queueDescriptor;
  if (queueDescriptor)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", queueDescriptor, CFSTR("queueDescriptor"));
  return v3;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (int64_t)repeatType
{
  return self->_repeatType;
}

- (NSString)siriReferenceIdentifier
{
  return self->_siriReferenceIdentifier;
}

- (NSDictionary)siriWHAMetricsInfo
{
  return self->_siriWHAMetricsInfo;
}

- (NSData)playActivityRecommendationData
{
  return self->_playActivityRecommendationData;
}

- (NSString)playActivityQueueGroupingID
{
  return self->_playActivityQueueGroupingID;
}

- (NSString)playActivityFeatureName
{
  return self->_playActivityFeatureName;
}

- (NSString)siriAssetInfo
{
  return self->_siriAssetInfo;
}

- (void)setShuffleType:(int64_t)a3
{
  self->_shuffleType = a3;
}

- (NSString)overrideSILSectionID
{
  return self->_overrideSILSectionID;
}

- (void)setSiriWHAMetricsInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)setSiriReferenceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setSiriAssetInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setRepeatType:(int64_t)a3
{
  self->_repeatType = a3;
}

- (void)setQueueEndAction:(int64_t)a3
{
  self->_queueEndAction = a3;
}

- (void)setQueueDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setPlayActivityRecommendationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setPlayActivityQueueGroupingID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setPlayActivityFeatureName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setOverrideSILSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setAssociatedParticipantIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setActionAfterQueueLoad:(int64_t)a3
{
  self->_actionAfterQueueLoad = a3;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (int64_t)queueEndAction
{
  return self->_queueEndAction;
}

- (int64_t)actionAfterQueueLoad
{
  return self->_actionAfterQueueLoad;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPPlaybackContext descriptionComponents](self, "descriptionComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15 == v16)
        {
          v17 = 0;
        }
        else
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v6, "appendFormat:", CFSTR(" %@=%@"), v14, v17);
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "appendString:", CFSTR(">"));
  v18 = (void *)objc_msgSend(v6, "copy");

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideSILSectionID, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_siriWHAMetricsInfo, 0);
  objc_storeStrong((id *)&self->_siriReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_siriAssetInfo, 0);
  objc_storeStrong((id *)&self->_queueDescriptor, 0);
  objc_storeStrong((id *)&self->_playActivityRecommendationData, 0);
  objc_storeStrong((id *)&self->_playActivityFeatureName, 0);
  objc_storeStrong((id *)&self->_playActivityQueueGroupingID, 0);
  objc_storeStrong((id *)&self->_associatedParticipantIdentifier, 0);
  objc_storeStrong((id *)&self->_privateListeningOverride, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_playerCurrentItem, 0);
}

- (Class)queueFeederClass
{
  return (Class)objc_opt_class();
}

- (MPPlaybackContext)init
{
  MPPlaybackContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPPlaybackContext;
  result = -[MPPlaybackContext init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_actionAfterQueueLoad = xmmword_193F0CAB0;
    *(_OWORD *)&result->_repeatType = xmmword_193F0CAA0;
  }
  return result;
}

- (BOOL)shouldBecomeActive
{
  int64_t actionAfterQueueLoad;

  actionAfterQueueLoad = self->_actionAfterQueueLoad;
  return actionAfterQueueLoad == 10 || actionAfterQueueLoad == 20;
}

- (void)setUserIdentity:(id)a3
{
  ICUserIdentity *v4;
  ICUserIdentity *userIdentity;

  v4 = (ICUserIdentity *)a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v4 = (ICUserIdentity *)objc_claimAutoreleasedReturnValue();
  }
  userIdentity = self->_userIdentity;
  self->_userIdentity = v4;

}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", self->_shuffleType, CFSTR("MPPlaybackContextShuffleType"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_repeatType, CFSTR("MPPlaybackContextRepeatType"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_queueEndAction, CFSTR("MPPlaybackContextQueueEndAction"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_actionAfterQueueLoad, CFSTR("MPPlaybackContextActionAfterQueueLoad"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_playActivityQueueGroupingID, CFSTR("MPPlaybackContextPlayActionQueueGroupingID"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_playActivityFeatureName, CFSTR("MPPlaybackContextPlayActivityFeatureName"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_playActivityRecommendationData, CFSTR("MPPlaybackContextPlayActivityRecommendationData"));
  objc_msgSend(v7, "msv_userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("supplementalReason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 == 1)
    objc_msgSend(v7, "encodeObject:forKey:", self->_associatedParticipantIdentifier, CFSTR("MPPlaybackContextAssociatedParticipantIdentifier"));

}

- (BOOL)containsRestorableContent
{
  return objc_msgSend((id)objc_opt_class(), "supportsSecureCoding");
}

- (BOOL)isSupported
{
  return 1;
}

- (BOOL)isReusableForPlaybackContext:(id)a3
{
  id v4;
  _BOOL4 v5;
  int64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  int64_t v9;
  int v10;
  uint64_t v11;
  int64_t v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  char v21;
  void *v23;
  void *v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_30;
  if (-[MPPlaybackContext repeatType](self, "repeatType") == 3 || objc_msgSend(v4, "repeatType") == 3)
  {
    v5 = 1;
  }
  else
  {
    v6 = -[MPPlaybackContext repeatType](self, "repeatType");
    v5 = v6 == objc_msgSend(v4, "repeatType");
  }
  if (-[MPPlaybackContext shuffleType](self, "shuffleType") == 1000)
  {
    v7 = v5;
  }
  else
  {
    v8 = objc_msgSend(v4, "shuffleType");
    v7 = v8 == 1000 && v5;
    if (v8 != 1000 && v5)
    {
      v9 = -[MPPlaybackContext shuffleType](self, "shuffleType");
      v7 = v9 == objc_msgSend(v4, "shuffleType");
    }
  }
  if (-[MPPlaybackContext queueEndAction](self, "queueEndAction") == 1000)
  {
    v10 = v7;
    goto LABEL_16;
  }
  v11 = objc_msgSend(v4, "queueEndAction");
  v10 = v11 == 1000 && v7;
  if (v11 == 1000 || !v7)
  {
LABEL_16:
    if (!v10)
      goto LABEL_30;
    goto LABEL_24;
  }
  v12 = -[MPPlaybackContext queueEndAction](self, "queueEndAction");
  if (v12 != objc_msgSend(v4, "queueEndAction"))
  {
LABEL_30:
    v21 = 0;
    goto LABEL_31;
  }
LABEL_24:
  -[MPPlaybackContext playActivityFeatureName](self, "playActivityFeatureName");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playActivityFeatureName");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 == v14)
  {

  }
  else
  {
    v15 = v14;
    v16 = objc_msgSend(v13, "isEqual:", v14);

    if ((v16 & 1) == 0)
      goto LABEL_30;
  }
  -[MPPlaybackContext sessionIdentifier](self, "sessionIdentifier");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sessionIdentifier");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (v17 == v18)
  {

  }
  else
  {
    v19 = v18;
    v20 = objc_msgSend(v17, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_30;
  }
  -[MPPlaybackContext overrideSILSectionID](self, "overrideSILSectionID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overrideSILSectionID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 == v24)
    v21 = 1;
  else
    v21 = objc_msgSend(v23, "isEqual:", v24);

LABEL_31:
  return v21;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (void)setPrivateListeningOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

+ (BOOL)supportsAutoPlay
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

@implementation HKWorkoutConfiguration

- (HKWorkoutConfiguration)init
{
  HKWorkoutConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKWorkoutConfiguration;
  result = -[HKWorkoutConfiguration init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_activityType = xmmword_19A44BBF0;
    result->_swimmingLocationType = 0;
    result->_shouldUseExtendedMode = 0;
    *(_WORD *)&result->_shouldUseLowPowerMode = 0;
    result->_fitnessPlusMediaType = 0;
  }
  return result;
}

- (void)setActivityType:(HKWorkoutActivityType)activityType
{
  self->_activityType = activityType;
}

- (void)setLocationType:(HKWorkoutSessionLocationType)locationType
{
  self->_locationType = locationType;
}

- (HKWorkoutActivityType)activityType
{
  return self->_activityType;
}

- (HKWorkoutSessionLocationType)locationType
{
  return self->_locationType;
}

- (HKWorkoutSwimmingLocationType)swimmingLocationType
{
  return self->_swimmingLocationType;
}

- (HKQuantity)lapLength
{
  return (HKQuantity *)objc_getProperty(self, a2, 40, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  HKWorkoutConfiguration *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = -[HKWorkoutConfiguration init](+[HKWorkoutConfiguration allocWithZone:](HKWorkoutConfiguration, "allocWithZone:"), "init");
  -[HKWorkoutConfiguration setActivityType:](v5, "setActivityType:", self->_activityType);
  -[HKWorkoutConfiguration setLocationType:](v5, "setLocationType:", self->_locationType);
  -[HKWorkoutConfiguration setSwimmingLocationType:](v5, "setSwimmingLocationType:", self->_swimmingLocationType);
  v6 = -[HKQuantity copyWithZone:](self->_lapLength, "copyWithZone:", a3);
  -[HKWorkoutConfiguration setLapLength:](v5, "setLapLength:", v6);

  v7 = (void *)-[NSUUID copyWithZone:](self->_predictionSessionUUID, "copyWithZone:", a3);
  -[HKWorkoutConfiguration setPredictionSessionUUID:](v5, "setPredictionSessionUUID:", v7);

  v8 = (void *)-[NSUUID copyWithZone:](self->_fitnessMachineSessionUUID, "copyWithZone:", a3);
  -[HKWorkoutConfiguration setFitnessMachineSessionUUID:](v5, "setFitnessMachineSessionUUID:", v8);

  -[HKWorkoutConfiguration setShouldDisambiguateLocation:](v5, "setShouldDisambiguateLocation:", self->_shouldDisambiguateLocation);
  -[HKWorkoutConfiguration setShouldUseExtendedMode:](v5, "setShouldUseExtendedMode:", self->_shouldUseExtendedMode);
  -[HKWorkoutConfiguration setShouldUseLowPowerMode:](v5, "setShouldUseLowPowerMode:", self->_shouldUseLowPowerMode);
  v9 = (void *)-[NSString copyWithZone:](self->_fitnessPlusCatalogWorkoutId, "copyWithZone:", a3);
  -[HKWorkoutConfiguration setFitnessPlusCatalogWorkoutId:](v5, "setFitnessPlusCatalogWorkoutId:", v9);

  -[HKWorkoutConfiguration setFitnessPlusMediaType:](v5, "setFitnessPlusMediaType:", self->_fitnessPlusMediaType);
  v10 = (void *)-[NSUUID copyWithZone:](self->_suggestedActivityUUID, "copyWithZone:", a3);
  -[HKWorkoutConfiguration setSuggestedActivityUUID:](v5, "setSuggestedActivityUUID:", v10);

  return v5;
}

- (void)setSwimmingLocationType:(HKWorkoutSwimmingLocationType)swimmingLocationType
{
  self->_swimmingLocationType = swimmingLocationType;
}

- (void)setLapLength:(HKQuantity *)lapLength
{
  objc_setProperty_atomic_copy(self, a2, lapLength, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedActivityUUID, 0);
  objc_storeStrong((id *)&self->_fitnessPlusCatalogWorkoutId, 0);
  objc_storeStrong((id *)&self->_predictionSessionUUID, 0);
  objc_storeStrong((id *)&self->_fitnessMachineSessionUUID, 0);
  objc_storeStrong((id *)&self->_lapLength, 0);
}

- (BOOL)validateIgnoringDeviceSupport:(BOOL)a3 error:(id *)a4
{
  uint64_t v7;
  int64_t locationType;
  void *v10;
  char v11;
  uint64_t v12;
  int v13;
  int64_t swimmingLocationType;
  void *v15;
  const __CFString *v16;
  HKQuantity *lapLength;
  HKQuantity *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;

  if ((_HKWorkoutActivityTypeIsValid(self->_activityType) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid workout activity type %ld"), self->_activityType);
    return 0;
  }
  locationType = self->_locationType;
  if ((unint64_t)(locationType - 1) >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid workout session location type %ld"), self->_locationType);
    return 0;
  }
  if (locationType != 2 && self->_fitnessMachineSessionUUID != 0)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = CFSTR("GymKit workout session location type should be indoor");
LABEL_17:
    objc_msgSend(v15, "hk_assignError:code:format:", a4, 3, v16, v23);
    return 0;
  }
  if (self->_activityType == 46)
  {
    if (!a3)
    {
      +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "supportsSwimmingWorkoutSessions");

      if ((v11 & 1) == 0)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = CFSTR("Swimming sessions are not supported on this device");
        goto LABEL_17;
      }
    }
    if (!_HKWorkoutSwimmingLocationTypeIsValid(self->_swimmingLocationType))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Invalid swimming location type %ld"), self->_swimmingLocationType);
      return 0;
    }
    v13 = HKProgramSDKAtLeast(0x7E10901FFFFFFFFLL, v12);
    swimmingLocationType = self->_swimmingLocationType;
    if (v13 && !swimmingLocationType)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = CFSTR("Swimming workouts should be either pool or open water workouts.");
      goto LABEL_17;
    }
    lapLength = self->_lapLength;
    if (swimmingLocationType == 2)
    {
      if (lapLength)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = CFSTR("Open water swimming should not have lap length");
        goto LABEL_17;
      }
    }
    else
    {
      if (lapLength)
      {
        if (!_HKWorkoutLapLengthIsValid(lapLength))
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Lap length is not a valid quantity type %@"), self->_lapLength);
          return 0;
        }
        swimmingLocationType = self->_swimmingLocationType;
      }
      if (swimmingLocationType == 1)
      {
        v19 = self->_lapLength;
        if (!v19
          || (+[HKUnit meterUnit](HKUnit, "meterUnit"),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              -[HKQuantity doubleValueForUnit:](v19, "doubleValueForUnit:", v20),
              v22 = v21,
              v20,
              v22 < 2.22044605e-16))
        {
          v15 = (void *)MEMORY[0x1E0CB35C8];
          v16 = CFSTR("Invalid lap length for pool swimming");
          goto LABEL_17;
        }
      }
    }
  }
  else if (HKProgramSDKAtLeast(0x7E00901FFFFFFFFLL, v7) && self->_swimmingLocationType)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = CFSTR("Swimming location should not be set for non swimming activities");
    goto LABEL_17;
  }
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  HKWorkoutConfiguration *v4;
  HKWorkoutConfiguration *v5;
  HKWorkoutConfiguration *v6;
  NSUUID *fitnessMachineSessionUUID;
  NSUUID *v8;
  HKQuantity *lapLength;
  HKQuantity *v10;
  NSUUID *suggestedActivityUUID;
  NSUUID *v12;
  NSString *fitnessPlusCatalogWorkoutId;
  NSString *v14;
  char v15;

  v4 = (HKWorkoutConfiguration *)a3;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_activityType != v5->_activityType)
        goto LABEL_21;
      if (self->_locationType != v5->_locationType)
        goto LABEL_21;
      if (self->_swimmingLocationType != v5->_swimmingLocationType)
        goto LABEL_21;
      fitnessMachineSessionUUID = self->_fitnessMachineSessionUUID;
      v8 = v6->_fitnessMachineSessionUUID;
      if (fitnessMachineSessionUUID != v8
        && (!v8 || !-[NSUUID isEqual:](fitnessMachineSessionUUID, "isEqual:")))
      {
        goto LABEL_21;
      }
      lapLength = self->_lapLength;
      v10 = v6->_lapLength;
      if (lapLength != v10 && (!v10 || !-[HKQuantity isEqual:](lapLength, "isEqual:")))
        goto LABEL_21;
      suggestedActivityUUID = self->_suggestedActivityUUID;
      v12 = v6->_suggestedActivityUUID;
      if (suggestedActivityUUID != v12
        && (!v12 || !-[NSUUID isEqual:](suggestedActivityUUID, "isEqual:")))
      {
        goto LABEL_21;
      }
      if (self->_fitnessPlusMediaType != v6->_fitnessPlusMediaType)
        goto LABEL_21;
      fitnessPlusCatalogWorkoutId = self->_fitnessPlusCatalogWorkoutId;
      v14 = v6->_fitnessPlusCatalogWorkoutId;
      if (fitnessPlusCatalogWorkoutId == v14)
      {
        v15 = 1;
        goto LABEL_22;
      }
      if (v14)
        v15 = -[NSString isEqual:](fitnessPlusCatalogWorkoutId, "isEqual:");
      else
LABEL_21:
        v15 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v15 = 0;
  }
LABEL_23:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = self->_activityType ^ (self->_locationType << 8) ^ (self->_swimmingLocationType << 16);
  v4 = -[HKQuantity hash](self->_lapLength, "hash");
  v5 = v4 ^ -[NSUUID hash](self->_fitnessMachineSessionUUID, "hash");
  v6 = v5 ^ -[NSString hash](self->_fitnessPlusCatalogWorkoutId, "hash");
  return v3 ^ v6 ^ -[NSUUID hash](self->_suggestedActivityUUID, "hash");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  NSString *fitnessPlusCatalogWorkoutId;
  unint64_t fitnessPlusMediaType;
  __CFString *v13;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  _HKWorkoutActivityNameForActivityType(self->_activityType);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = self->_locationType - 1;
  if (v7 > 2)
    v8 = CFSTR("invalid location");
  else
    v8 = off_1E37EEB58[v7];
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p activity:%@ location:%@"), v4, self, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _HKWorkoutSwimmingLocationTypeName(self->_swimmingLocationType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR(" swimming location:%@ lap length:%@"), v10, self->_lapLength);

  if (self->_shouldDisambiguateLocation)
    objc_msgSend(v9, "appendFormat:", CFSTR(" disambiguation requested:%d"), 1);
  if (self->_shouldUseExtendedMode)
    objc_msgSend(v9, "appendFormat:", CFSTR(" extended mode:%d"), 1);
  if (self->_shouldUseLowPowerMode)
    objc_msgSend(v9, "appendFormat:", CFSTR(" low power mode:%d"), 1);
  if (self->_fitnessMachineSessionUUID)
    objc_msgSend(v9, "appendFormat:", CFSTR(" fitness machine session UUID:%@"), self->_fitnessMachineSessionUUID);
  fitnessPlusCatalogWorkoutId = self->_fitnessPlusCatalogWorkoutId;
  if (fitnessPlusCatalogWorkoutId)
  {
    fitnessPlusMediaType = self->_fitnessPlusMediaType;
    if (fitnessPlusMediaType >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown(%ld)"), self->_fitnessPlusMediaType);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E37EEB38[fitnessPlusMediaType];
    }
    objc_msgSend(v9, "appendFormat:", CFSTR(" catalog id: %@, media: %@"), fitnessPlusCatalogWorkoutId, v13);

  }
  if (self->_suggestedActivityUUID)
    objc_msgSend(v9, "appendFormat:", CFSTR(" Suggested activity UUID:%@"), self->_suggestedActivityUUID);
  objc_msgSend(v9, "appendString:", CFSTR(">"));
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t activityType;
  id v5;

  activityType = self->_activityType;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", activityType, CFSTR("activityType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_locationType, CFSTR("locationType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_swimmingLocationType, CFSTR("swimmingLocationType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lapLength, CFSTR("lapLength"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fitnessMachineSessionUUID, CFSTR("ftmSessionUUIDKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_predictionSessionUUID, CFSTR("predictionSessionUUIDKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldDisambiguateLocation, CFSTR("disambiguateLocationTypeKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldUseExtendedMode, CFSTR("useExtendedModeKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldUseLowPowerMode, CFSTR("enableLowPowerModeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fitnessPlusCatalogWorkoutId, CFSTR("fpCatalogWorkoutIdString"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_fitnessPlusMediaType, CFSTR("fpMediaType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suggestedActivityUUID, CFSTR("suggestedActivityUUIDKey"));

}

- (HKWorkoutConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKWorkoutConfiguration *v5;
  uint64_t v6;
  HKQuantity *lapLength;
  uint64_t v8;
  NSUUID *fitnessMachineSessionUUID;
  uint64_t v10;
  NSUUID *predictionSessionUUID;
  uint64_t v12;
  NSString *fitnessPlusCatalogWorkoutId;
  uint64_t v14;
  NSUUID *suggestedActivityUUID;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKWorkoutConfiguration;
  v5 = -[HKWorkoutConfiguration init](&v17, sel_init);
  if (v5)
  {
    v5->_activityType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activityType"));
    v5->_locationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("locationType"));
    v5->_swimmingLocationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("swimmingLocationType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lapLength"));
    v6 = objc_claimAutoreleasedReturnValue();
    lapLength = v5->_lapLength;
    v5->_lapLength = (HKQuantity *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ftmSessionUUIDKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    fitnessMachineSessionUUID = v5->_fitnessMachineSessionUUID;
    v5->_fitnessMachineSessionUUID = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predictionSessionUUIDKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    predictionSessionUUID = v5->_predictionSessionUUID;
    v5->_predictionSessionUUID = (NSUUID *)v10;

    v5->_shouldDisambiguateLocation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disambiguateLocationTypeKey"));
    v5->_shouldUseExtendedMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useExtendedModeKey"));
    v5->_shouldUseLowPowerMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableLowPowerModeKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fpCatalogWorkoutIdString"));
    v12 = objc_claimAutoreleasedReturnValue();
    fitnessPlusCatalogWorkoutId = v5->_fitnessPlusCatalogWorkoutId;
    v5->_fitnessPlusCatalogWorkoutId = (NSString *)v12;

    v5->_fitnessPlusMediaType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fpMediaType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestedActivityUUIDKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    suggestedActivityUUID = v5->_suggestedActivityUUID;
    v5->_suggestedActivityUUID = (NSUUID *)v14;

  }
  return v5;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "encodeObject:forKey:", self, CFSTR("HKWorkoutConfigurationKey"));
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("HKWorkoutConfigurationNSDataKey");
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)

  return v6;
}

+ (id)_workoutConfigurationFromDictionary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("HKWorkoutConfigurationNSDataKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, 0);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKWorkoutConfigurationKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishDecoding");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldUseLowPowerMode
{
  return self->_shouldUseLowPowerMode;
}

- (void)setShouldUseLowPowerMode:(BOOL)a3
{
  self->_shouldUseLowPowerMode = a3;
}

- (NSUUID)fitnessMachineSessionUUID
{
  return self->_fitnessMachineSessionUUID;
}

- (void)setFitnessMachineSessionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSUUID)predictionSessionUUID
{
  return self->_predictionSessionUUID;
}

- (void)setPredictionSessionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)shouldDisambiguateLocation
{
  return self->_shouldDisambiguateLocation;
}

- (void)setShouldDisambiguateLocation:(BOOL)a3
{
  self->_shouldDisambiguateLocation = a3;
}

- (BOOL)shouldUseExtendedMode
{
  return self->_shouldUseExtendedMode;
}

- (void)setShouldUseExtendedMode:(BOOL)a3
{
  self->_shouldUseExtendedMode = a3;
}

- (NSString)fitnessPlusCatalogWorkoutId
{
  return self->_fitnessPlusCatalogWorkoutId;
}

- (void)setFitnessPlusCatalogWorkoutId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)fitnessPlusMediaType
{
  return self->_fitnessPlusMediaType;
}

- (void)setFitnessPlusMediaType:(int64_t)a3
{
  self->_fitnessPlusMediaType = a3;
}

- (NSUUID)suggestedActivityUUID
{
  return self->_suggestedActivityUUID;
}

- (void)setSuggestedActivityUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

@end

@implementation HKWorkoutSessionTaskConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  HKWorkoutSessionTaskConfiguration *v4;

  v4 = objc_alloc_init(HKWorkoutSessionTaskConfiguration);
  -[HKWorkoutSessionTaskConfiguration setSessionUUID:](v4, "setSessionUUID:", self->_sessionUUID);
  -[HKWorkoutSessionTaskConfiguration setWorkoutConfiguration:](v4, "setWorkoutConfiguration:", self->_workoutConfiguration);
  -[HKWorkoutSessionTaskConfiguration setRequiresCoreLocationAssertion:](v4, "setRequiresCoreLocationAssertion:", self->_requiresCoreLocationAssertion);
  -[HKWorkoutSessionTaskConfiguration setRequiresRecovery:](v4, "setRequiresRecovery:", self->_requiresRecovery);
  -[HKWorkoutSessionTaskConfiguration setSupportsAppRelaunchForRecovery:](v4, "setSupportsAppRelaunchForRecovery:", self->_supportsAppRelaunchForRecovery);
  -[HKWorkoutSessionTaskConfiguration setShouldStopPreviousSession:](v4, "setShouldStopPreviousSession:", self->_shouldStopPreviousSession);
  -[HKWorkoutSessionTaskConfiguration setSupports3rdPartyAOT:](v4, "setSupports3rdPartyAOT:", self->_supports3rdPartyAOT);
  -[HKWorkoutSessionTaskConfiguration setCurrentActivity:](v4, "setCurrentActivity:", self->_currentActivity);
  -[HKWorkoutSessionTaskConfiguration setActivityConfigurations:](v4, "setActivityConfigurations:", self->_activityConfigurations);
  -[HKWorkoutSessionTaskConfiguration setSessionType:](v4, "setSessionType:", self->_sessionType);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKWorkoutSessionTaskConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKWorkoutSessionTaskConfiguration *v5;
  uint64_t v6;
  NSUUID *sessionUUID;
  uint64_t v8;
  HKWorkoutConfiguration *workoutConfiguration;
  uint64_t v10;
  HKWorkoutActivity *currentActivity;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *activityConfigurations;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKWorkoutSessionTaskConfiguration;
  v5 = -[HKTaskConfiguration initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("session_uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionUUID = v5->_sessionUUID;
    v5->_sessionUUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workout_configuration"));
    v8 = objc_claimAutoreleasedReturnValue();
    workoutConfiguration = v5->_workoutConfiguration;
    v5->_workoutConfiguration = (HKWorkoutConfiguration *)v8;

    v5->_requiresCoreLocationAssertion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cl_assertion"));
    v5->_requiresRecovery = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("recovery"));
    v5->_supportsAppRelaunchForRecovery = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("recovery_relaunch_app"));
    v5->_shouldStopPreviousSession = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("stop_previous"));
    v5->_supports3rdPartyAOT = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supports_3rd_party_aot"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("current_activity"));
    v10 = objc_claimAutoreleasedReturnValue();
    currentActivity = v5->_currentActivity;
    v5->_currentActivity = (HKWorkoutActivity *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("activity_configurations"));
    v15 = objc_claimAutoreleasedReturnValue();
    activityConfigurations = v5->_activityConfigurations;
    v5->_activityConfigurations = (NSArray *)v15;

    v5->_sessionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("session_type"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutSessionTaskConfiguration;
  v4 = a3;
  -[HKTaskConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_sessionUUID, CFSTR("session_uuid"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_workoutConfiguration, CFSTR("workout_configuration"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_requiresCoreLocationAssertion, CFSTR("cl_assertion"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_requiresRecovery, CFSTR("recovery"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsAppRelaunchForRecovery, CFSTR("recovery_relaunch_app"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldStopPreviousSession, CFSTR("stop_previous"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supports3rdPartyAOT, CFSTR("supports_3rd_party_aot"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_currentActivity, CFSTR("current_activity"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_activityConfigurations, CFSTR("activity_configurations"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_sessionType, CFSTR("session_type"));

}

- (HKWorkoutConfiguration)workoutConfiguration
{
  return self->_workoutConfiguration;
}

- (void)setWorkoutConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(int64_t)a3
{
  self->_sessionType = a3;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)requiresCoreLocationAssertion
{
  return self->_requiresCoreLocationAssertion;
}

- (void)setRequiresCoreLocationAssertion:(BOOL)a3
{
  self->_requiresCoreLocationAssertion = a3;
}

- (BOOL)requiresRecovery
{
  return self->_requiresRecovery;
}

- (void)setRequiresRecovery:(BOOL)a3
{
  self->_requiresRecovery = a3;
}

- (BOOL)supportsAppRelaunchForRecovery
{
  return self->_supportsAppRelaunchForRecovery;
}

- (void)setSupportsAppRelaunchForRecovery:(BOOL)a3
{
  self->_supportsAppRelaunchForRecovery = a3;
}

- (BOOL)shouldStopPreviousSession
{
  return self->_shouldStopPreviousSession;
}

- (void)setShouldStopPreviousSession:(BOOL)a3
{
  self->_shouldStopPreviousSession = a3;
}

- (BOOL)supports3rdPartyAOT
{
  return self->_supports3rdPartyAOT;
}

- (void)setSupports3rdPartyAOT:(BOOL)a3
{
  self->_supports3rdPartyAOT = a3;
}

- (HKWorkoutActivity)currentActivity
{
  return self->_currentActivity;
}

- (void)setCurrentActivity:(id)a3
{
  objc_storeStrong((id *)&self->_currentActivity, a3);
}

- (NSArray)activityConfigurations
{
  return self->_activityConfigurations;
}

- (void)setActivityConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_activityConfigurations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityConfigurations, 0);
  objc_storeStrong((id *)&self->_currentActivity, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
}

@end

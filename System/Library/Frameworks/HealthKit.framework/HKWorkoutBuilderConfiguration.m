@implementation HKWorkoutBuilderConfiguration

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HKDevice *device;
  HKDevice *v6;
  HKWorkoutConfiguration *workoutConfiguration;
  HKWorkoutConfiguration *v8;
  HKQuantity *goal;
  HKQuantity *v10;
  NSUUID *associatedSessionUUID;
  NSUUID *v12;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_17;
  device = self->_device;
  v6 = (HKDevice *)v4[2];
  if (device != v6 && (!v6 || !-[HKDevice isEqual:](device, "isEqual:")))
    goto LABEL_17;
  if (((workoutConfiguration = self->_workoutConfiguration,
         v8 = (HKWorkoutConfiguration *)v4[3],
         workoutConfiguration == v8)
     || v8 && -[HKWorkoutConfiguration isEqual:](workoutConfiguration, "isEqual:"))
    && self->_goalType == v4[4]
    && ((goal = self->_goal, v10 = (HKQuantity *)v4[5], goal == v10) || v10 && -[HKQuantity isEqual:](goal, "isEqual:"))
    && self->_shouldCollectWorkoutEvents == *((unsigned __int8 *)v4 + 8)
    && ((associatedSessionUUID = self->_associatedSessionUUID, v12 = (NSUUID *)v4[6], associatedSessionUUID == v12)
     || v12 && -[NSUUID isEqual:](associatedSessionUUID, "isEqual:")))
  {
    v13 = self->_requiresRecovery == *((unsigned __int8 *)v4 + 9);
  }
  else
  {
LABEL_17:
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t goalType;

  v3 = -[HKDevice hash](self->_device, "hash");
  v4 = -[HKWorkoutConfiguration hash](self->_workoutConfiguration, "hash") ^ v3;
  goalType = self->_goalType;
  return v4 ^ goalType ^ -[HKQuantity hash](self->_goal, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKWorkoutBuilderConfiguration;
  v4 = -[HKTaskConfiguration copyWithZone:](&v7, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setDevice:", self->_device);
  objc_msgSend(v4, "setWorkoutConfiguration:", self->_workoutConfiguration);
  objc_msgSend(v4, "setGoalType:", self->_goalType);
  objc_msgSend(v4, "setGoal:", self->_goal);
  v5 = (void *)-[NSUUID copy](self->_associatedSessionUUID, "copy");
  objc_msgSend(v4, "setAssociatedSessionUUID:", v5);

  objc_msgSend(v4, "setShouldCollectWorkoutEvents:", self->_shouldCollectWorkoutEvents);
  objc_msgSend(v4, "setRequiresRecovery:", self->_requiresRecovery);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKWorkoutBuilderConfiguration)initWithCoder:(id)a3
{
  id v4;
  HKWorkoutBuilderConfiguration *v5;
  uint64_t v6;
  HKDevice *device;
  uint64_t v8;
  HKWorkoutConfiguration *workoutConfiguration;
  uint64_t v10;
  HKQuantity *goal;
  uint64_t v12;
  NSUUID *associatedSessionUUID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKWorkoutBuilderConfiguration;
  v5 = -[HKTaskConfiguration initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("device"));
    v6 = objc_claimAutoreleasedReturnValue();
    device = v5->_device;
    v5->_device = (HKDevice *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workoutConfig"));
    v8 = objc_claimAutoreleasedReturnValue();
    workoutConfiguration = v5->_workoutConfiguration;
    v5->_workoutConfiguration = (HKWorkoutConfiguration *)v8;

    v5->_goalType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("goalType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("goal"));
    v10 = objc_claimAutoreleasedReturnValue();
    goal = v5->_goal;
    v5->_goal = (HKQuantity *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associated_session_uuid"));
    v12 = objc_claimAutoreleasedReturnValue();
    associatedSessionUUID = v5->_associatedSessionUUID;
    v5->_associatedSessionUUID = (NSUUID *)v12;

    v5->_shouldCollectWorkoutEvents = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("should_collect_events"));
    v5->_requiresRecovery = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requires_recovery"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKWorkoutBuilderConfiguration;
  v4 = a3;
  -[HKTaskConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_device, CFSTR("device"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_workoutConfiguration, CFSTR("workoutConfig"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_goalType, CFSTR("goalType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_goal, CFSTR("goal"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_associatedSessionUUID, CFSTR("associated_session_uuid"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldCollectWorkoutEvents, CFSTR("should_collect_events"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_requiresRecovery, CFSTR("requires_recovery"));

}

- (HKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HKWorkoutConfiguration)workoutConfiguration
{
  return self->_workoutConfiguration;
}

- (void)setWorkoutConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)goalType
{
  return self->_goalType;
}

- (void)setGoalType:(unint64_t)a3
{
  self->_goalType = a3;
}

- (HKQuantity)goal
{
  return self->_goal;
}

- (void)setGoal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSUUID)associatedSessionUUID
{
  return self->_associatedSessionUUID;
}

- (void)setAssociatedSessionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)shouldCollectWorkoutEvents
{
  return self->_shouldCollectWorkoutEvents;
}

- (void)setShouldCollectWorkoutEvents:(BOOL)a3
{
  self->_shouldCollectWorkoutEvents = a3;
}

- (BOOL)requiresRecovery
{
  return self->_requiresRecovery;
}

- (void)setRequiresRecovery:(BOOL)a3
{
  self->_requiresRecovery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedSessionUUID, 0);
  objc_storeStrong((id *)&self->_goal, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end

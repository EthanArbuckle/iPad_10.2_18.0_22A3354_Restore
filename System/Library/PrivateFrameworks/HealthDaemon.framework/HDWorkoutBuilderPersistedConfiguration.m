@implementation HDWorkoutBuilderPersistedConfiguration

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  NSString *sourceVersion;
  NSString *v8;
  HKQuantity *goal;
  HKQuantity *v10;
  char v11;

  v4 = a3;
  if (!-[NSUUID isEqual:](self->_builderIdentifier, "isEqual:", *((_QWORD *)v4 + 2)))
    goto LABEL_12;
  if (!-[HKWorkoutConfiguration isEqual:](self->_workoutConfiguration, "isEqual:", *((_QWORD *)v4 + 3)))
    goto LABEL_12;
  v5 = -[HDSQLiteEntity persistentID](self->_sourceEntity, "persistentID");
  if (v5 != objc_msgSend(*((id *)v4 + 4), "persistentID"))
    goto LABEL_12;
  v6 = -[HDSQLiteEntity persistentID](self->_deviceEntity, "persistentID");
  if (v6 != objc_msgSend(*((id *)v4 + 6), "persistentID"))
    goto LABEL_12;
  sourceVersion = self->_sourceVersion;
  v8 = (NSString *)*((_QWORD *)v4 + 5);
  if (sourceVersion != v8 && (!v8 || !-[NSString isEqual:](sourceVersion, "isEqual:")))
    goto LABEL_12;
  if (self->_goalType != *((_QWORD *)v4 + 7))
    goto LABEL_12;
  goal = self->_goal;
  v10 = (HKQuantity *)*((_QWORD *)v4 + 8);
  if (goal == v10)
  {
    v11 = 1;
    goto LABEL_13;
  }
  if (v10)
    v11 = -[HKQuantity isEqual:](goal, "isEqual:");
  else
LABEL_12:
    v11 = 0;
LABEL_13:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HDWorkoutBuilderPersistedConfiguration *v4;

  v4 = objc_alloc_init(HDWorkoutBuilderPersistedConfiguration);
  -[HDWorkoutBuilderPersistedConfiguration setBuilderIdentifier:](v4, "setBuilderIdentifier:", self->_builderIdentifier);
  -[HDWorkoutBuilderPersistedConfiguration setWorkoutConfiguration:](v4, "setWorkoutConfiguration:", self->_workoutConfiguration);
  -[HDWorkoutBuilderPersistedConfiguration setSourceEntity:](v4, "setSourceEntity:", self->_sourceEntity);
  -[HDWorkoutBuilderPersistedConfiguration setSourceVersion:](v4, "setSourceVersion:", self->_sourceVersion);
  -[HDWorkoutBuilderPersistedConfiguration setDeviceEntity:](v4, "setDeviceEntity:", self->_deviceEntity);
  -[HDWorkoutBuilderPersistedConfiguration setGoalType:](v4, "setGoalType:", self->_goalType);
  -[HDWorkoutBuilderPersistedConfiguration setGoal:](v4, "setGoal:", self->_goal);
  -[HDWorkoutBuilderPersistedConfiguration setShouldCollectWorkoutEvents:](v4, "setShouldCollectWorkoutEvents:", self->_shouldCollectWorkoutEvents);
  return v4;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_builderIdentifier, "hash");
}

- (NSUUID)builderIdentifier
{
  return self->_builderIdentifier;
}

- (void)setBuilderIdentifier:(id)a3
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

- (HDSourceEntity)sourceEntity
{
  return self->_sourceEntity;
}

- (void)setSourceEntity:(id)a3
{
  objc_storeStrong((id *)&self->_sourceEntity, a3);
}

- (NSString)sourceVersion
{
  return self->_sourceVersion;
}

- (void)setSourceVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (HDDeviceEntity)deviceEntity
{
  return self->_deviceEntity;
}

- (void)setDeviceEntity:(id)a3
{
  objc_storeStrong((id *)&self->_deviceEntity, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)shouldCollectWorkoutEvents
{
  return self->_shouldCollectWorkoutEvents;
}

- (void)setShouldCollectWorkoutEvents:(BOOL)a3
{
  self->_shouldCollectWorkoutEvents = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goal, 0);
  objc_storeStrong((id *)&self->_deviceEntity, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_sourceEntity, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
  objc_storeStrong((id *)&self->_builderIdentifier, 0);
}

@end

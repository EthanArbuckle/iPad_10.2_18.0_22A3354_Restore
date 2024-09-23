@implementation FIUIWorkoutActivityType

- (FIUIWorkoutActivityType)initWithCoder:(id)a3
{
  id v4;
  FIUIWorkoutActivityType *v5;
  uint64_t v6;
  FIWorkoutActivityType *workoutActivityType;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FIUIWorkoutActivityType;
  v5 = -[FIUIWorkoutActivityType init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE32820]), "initWithCoder:", v4);
    workoutActivityType = v5->_workoutActivityType;
    v5->_workoutActivityType = (FIWorkoutActivityType *)v6;

  }
  return v5;
}

+ (FIUIWorkoutActivityType)activityTypeWithHKWorkoutActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4
{
  _BOOL8 v4;
  FIUIWorkoutActivityType *v6;

  v4 = a4;
  v6 = [FIUIWorkoutActivityType alloc];
  return -[FIUIWorkoutActivityType initWithActivityTypeIdentifier:isIndoor:metadata:](v6, "initWithActivityTypeIdentifier:isIndoor:metadata:", a3, v4, MEMORY[0x24BDBD1B8]);
}

- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 metadata:(id)a5
{
  _BOOL8 v5;
  objc_class *v8;
  id v9;
  void *v10;
  FIUIWorkoutActivityType *v11;

  v5 = a4;
  v8 = (objc_class *)MEMORY[0x24BE32820];
  v9 = a5;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithActivityTypeIdentifier:isIndoor:metadata:", a3, v5, v9);

  v11 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:](self, "initWithWorkoutActivityType:", v10);
  return v11;
}

- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 metadata:(id)a5 auxiliaryTypeIdentifier:(unint64_t)a6
{
  _BOOL8 v7;
  objc_class *v10;
  id v11;
  void *v12;
  FIUIWorkoutActivityType *v13;

  v7 = a4;
  v10 = (objc_class *)MEMORY[0x24BE32820];
  v11 = a5;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithActivityTypeIdentifier:isIndoor:metadata:auxiliaryTypeIdentifier:", a3, v7, v11, a6);

  v13 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:](self, "initWithWorkoutActivityType:", v12);
  return v13;
}

+ (FIUIWorkoutActivityType)activityTypeWithHKWorkoutActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 metadata:(id)a5
{
  _BOOL8 v5;
  id v7;
  FIUIWorkoutActivityType *v8;

  v5 = a4;
  v7 = a5;
  v8 = -[FIUIWorkoutActivityType initWithActivityTypeIdentifier:isIndoor:metadata:]([FIUIWorkoutActivityType alloc], "initWithActivityTypeIdentifier:isIndoor:metadata:", a3, v5, v7);

  return v8;
}

- (unint64_t)hash
{
  return -[FIWorkoutActivityType hash](self->_workoutActivityType, "hash");
}

- (BOOL)isEqual:(id)a3
{
  FIWorkoutActivityType *workoutActivityType;
  void *v4;

  workoutActivityType = self->_workoutActivityType;
  objc_msgSend(a3, "workoutActivityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(workoutActivityType) = -[FIWorkoutActivityType isEqual:](workoutActivityType, "isEqual:", v4);

  return (char)workoutActivityType;
}

- (unint64_t)identifier
{
  return -[FIWorkoutActivityType identifier](self->_workoutActivityType, "identifier");
}

- (unint64_t)auxiliaryTypeIdentifier
{
  return -[FIWorkoutActivityType auxiliaryTypeIdentifier](self->_workoutActivityType, "auxiliaryTypeIdentifier");
}

- (BOOL)isIndoor
{
  return -[FIWorkoutActivityType isIndoor](self->_workoutActivityType, "isIndoor");
}

- (int64_t)swimmingLocationType
{
  return -[FIWorkoutActivityType swimmingLocationType](self->_workoutActivityType, "swimmingLocationType");
}

- (NSDictionary)metadata
{
  return (NSDictionary *)-[FIWorkoutActivityType metadata](self->_workoutActivityType, "metadata");
}

+ (id)wheelchairActivityTypes
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE32820], "wheelchairActivityTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_197);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedName
{
  return (id)-[FIWorkoutActivityType localizedName](self->_workoutActivityType, "localizedName");
}

- (unint64_t)effectiveTypeIdentifier
{
  return -[FIWorkoutActivityType effectiveTypeIdentifier](self->_workoutActivityType, "effectiveTypeIdentifier");
}

- (BOOL)hasLocationTypePool
{
  return -[FIWorkoutActivityType hasLocationTypePool](self->_workoutActivityType, "hasLocationTypePool");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutActivityType, 0);
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[FIWorkoutActivityType description](self->_workoutActivityType, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("FIUIWorkoutActivityType(workoutActivityType=%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HKQuantity)lapLength
{
  return (HKQuantity *)-[FIWorkoutActivityType lapLength](self->_workoutActivityType, "lapLength");
}

- (void)encodeWithCoder:(id)a3
{
  -[FIWorkoutActivityType encodeWithCoder:](self->_workoutActivityType, "encodeWithCoder:", a3);
}

+ (FIUIWorkoutActivityType)activityTypeWithWorkout:(id)a3
{
  void *v3;
  FIUIWorkoutActivityType *v4;

  objc_msgSend(MEMORY[0x24BE32820], "activityTypeWithWorkout:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:]([FIUIWorkoutActivityType alloc], "initWithWorkoutActivityType:", v3);

  return v4;
}

+ (id)effectiveActivityTypeWithWorkout:(id)a3
{
  void *v3;
  FIUIWorkoutActivityType *v4;

  objc_msgSend(MEMORY[0x24BE32820], "effectiveActivityTypeWithWorkout:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:]([FIUIWorkoutActivityType alloc], "initWithWorkoutActivityType:", v3);

  return v4;
}

- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4
{
  void *v5;
  FIUIWorkoutActivityType *v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE32820]), "initWithActivityTypeIdentifier:isIndoor:", a3, a4);
  v6 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:](self, "initWithWorkoutActivityType:", v5);

  return v6;
}

- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  objc_class *v10;
  id v11;
  void *v12;
  FIUIWorkoutActivityType *v13;

  v6 = a5;
  v7 = a4;
  v10 = (objc_class *)MEMORY[0x24BE32820];
  v11 = a6;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithActivityTypeIdentifier:isIndoor:isPartOfMultiSport:metadata:", a3, v7, v6, v11);

  v13 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:](self, "initWithWorkoutActivityType:", v12);
  return v13;
}

- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6 auxiliaryTypeIdentifier:(unint64_t)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  objc_class *v12;
  id v13;
  void *v14;
  FIUIWorkoutActivityType *v15;

  v8 = a5;
  v9 = a4;
  v12 = (objc_class *)MEMORY[0x24BE32820];
  v13 = a6;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithActivityTypeIdentifier:isIndoor:isPartOfMultiSport:metadata:auxiliaryTypeIdentifier:", a3, v9, v8, v13, a7);

  v15 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:](self, "initWithWorkoutActivityType:", v14);
  return v15;
}

- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 location:(int64_t)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6
{
  _BOOL8 v6;
  objc_class *v10;
  id v11;
  void *v12;
  FIUIWorkoutActivityType *v13;

  v6 = a5;
  v10 = (objc_class *)MEMORY[0x24BE32820];
  v11 = a6;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithActivityTypeIdentifier:location:isPartOfMultiSport:metadata:", a3, a4, v6, v11);

  v13 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:](self, "initWithWorkoutActivityType:", v12);
  return v13;
}

- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 location:(int64_t)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6 auxiliaryTypeIdentifier:(unint64_t)a7
{
  _BOOL8 v8;
  objc_class *v12;
  id v13;
  void *v14;
  FIUIWorkoutActivityType *v15;

  v8 = a5;
  v12 = (objc_class *)MEMORY[0x24BE32820];
  v13 = a6;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithActivityTypeIdentifier:location:isPartOfMultiSport:metadata:auxiliaryTypeIdentifier:", a3, a4, v8, v13, a7);

  v15 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:](self, "initWithWorkoutActivityType:", v14);
  return v15;
}

- (FIUIWorkoutActivityType)initWithWorkoutActivityType:(id)a3
{
  id v5;
  FIUIWorkoutActivityType *v6;
  FIUIWorkoutActivityType *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FIUIWorkoutActivityType;
  v6 = -[FIUIWorkoutActivityType init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_workoutActivityType, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)location
{
  return -[FIWorkoutActivityType location](self->_workoutActivityType, "location");
}

- (BOOL)isCategorizedOtherWorkout
{
  return -[FIWorkoutActivityType isCategorizedOtherWorkout](self->_workoutActivityType, "isCategorizedOtherWorkout");
}

- (id)localizedNameComponents
{
  return (id)-[FIWorkoutActivityType localizedNameComponents](self->_workoutActivityType, "localizedNameComponents");
}

- (id)activityTypeByAddingLapLength:(double)a3
{
  void *v4;
  FIUIWorkoutActivityType *v5;

  -[FIWorkoutActivityType activityTypeByAddingLapLength:](self->_workoutActivityType, "activityTypeByAddingLapLength:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:](self, "initWithWorkoutActivityType:", v4);

  return v5;
}

- (BOOL)isWaterLockActivity
{
  return -[FIWorkoutActivityType isWaterLockActivity](self->_workoutActivityType, "isWaterLockActivity");
}

- (BOOL)isPartOfMultiSport
{
  return -[FIWorkoutActivityType isPartOfMultiSport](self->_workoutActivityType, "isPartOfMultiSport");
}

+ (id)defaultActivityTypesWithIsWheelchairUser:(BOOL)a3 isSwimmingSupported:(BOOL)a4 activityMoveMode:(int64_t)a5
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE32820], "defaultActivityTypesWithIsWheelchairUser:isSwimmingSupported:activityMoveMode:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_map:", &__block_literal_global_2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

FIUIWorkoutActivityType *__105__FIUIWorkoutActivityType_defaultActivityTypesWithIsWheelchairUser_isSwimmingSupported_activityMoveMode___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FIUIWorkoutActivityType *v3;

  v2 = a2;
  v3 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:]([FIUIWorkoutActivityType alloc], "initWithWorkoutActivityType:", v2);

  return v3;
}

+ (id)gymKitCapableActivityTypes
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE32820], "gymKitCapableActivityTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_193);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

FIUIWorkoutActivityType *__53__FIUIWorkoutActivityType_gymKitCapableActivityTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FIUIWorkoutActivityType *v3;

  v2 = a2;
  v3 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:]([FIUIWorkoutActivityType alloc], "initWithWorkoutActivityType:", v2);

  return v3;
}

+ (id)optimizedActivityTypesWithIsWheelchairUser:(BOOL)a3 isSwimmingSupported:(BOOL)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE32820], "optimizedActivityTypesWithIsWheelchairUser:isSwimmingSupported:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_map:", &__block_literal_global_194);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

FIUIWorkoutActivityType *__90__FIUIWorkoutActivityType_optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FIUIWorkoutActivityType *v3;

  v2 = a2;
  v3 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:]([FIUIWorkoutActivityType alloc], "initWithWorkoutActivityType:", v2);

  return v3;
}

+ (id)otherWorkoutActivityTypes
{
  return (id)objc_msgSend(MEMORY[0x24BE32820], "otherWorkoutActivityTypes");
}

+ (id)nonOptimizedActivityTypes
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE32820], "nonOptimizedActivityTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_195);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

FIUIWorkoutActivityType *__52__FIUIWorkoutActivityType_nonOptimizedActivityTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FIUIWorkoutActivityType *v3;

  v2 = a2;
  v3 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:]([FIUIWorkoutActivityType alloc], "initWithWorkoutActivityType:", v2);

  return v3;
}

+ (id)unsupportedActivityTypesWithIsWheelchairUser:(BOOL)a3 isSwimmingSupported:(BOOL)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE32820], "unsupportedActivityTypesWithIsWheelchairUser:isSwimmingSupported:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_map:", &__block_literal_global_196);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

FIUIWorkoutActivityType *__92__FIUIWorkoutActivityType_unsupportedActivityTypesWithIsWheelchairUser_isSwimmingSupported___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FIUIWorkoutActivityType *v3;

  v2 = a2;
  v3 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:]([FIUIWorkoutActivityType alloc], "initWithWorkoutActivityType:", v2);

  return v3;
}

FIUIWorkoutActivityType *__50__FIUIWorkoutActivityType_wheelchairActivityTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FIUIWorkoutActivityType *v3;

  v2 = a2;
  v3 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:]([FIUIWorkoutActivityType alloc], "initWithWorkoutActivityType:", v2);

  return v3;
}

+ (id)swimmingOptimizedActivityTypes
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE32820], "swimmingOptimizedActivityTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_198);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

FIUIWorkoutActivityType *__57__FIUIWorkoutActivityType_swimmingOptimizedActivityTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FIUIWorkoutActivityType *v3;

  v2 = a2;
  v3 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:]([FIUIWorkoutActivityType alloc], "initWithWorkoutActivityType:", v2);

  return v3;
}

+ (id)swimmingOtherActivityTypes
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE32820], "swimmingOtherActivityTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_199);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

FIUIWorkoutActivityType *__53__FIUIWorkoutActivityType_swimmingOtherActivityTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FIUIWorkoutActivityType *v3;

  v2 = a2;
  v3 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:]([FIUIWorkoutActivityType alloc], "initWithWorkoutActivityType:", v2);

  return v3;
}

+ (id)deprecatedActivityTypes
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE32820], "deprecatedActivityTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_200);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

FIUIWorkoutActivityType *__50__FIUIWorkoutActivityType_deprecatedActivityTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FIUIWorkoutActivityType *v3;

  v2 = a2;
  v3 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:]([FIUIWorkoutActivityType alloc], "initWithWorkoutActivityType:", v2);

  return v3;
}

- (NSString)uniqueIdentifier
{
  return (NSString *)-[FIWorkoutActivityType uniqueIdentifier](self->_workoutActivityType, "uniqueIdentifier");
}

+ (BOOL)shouldDisambiguateOnLocationType:(unint64_t)a3
{
  return objc_msgSend(MEMORY[0x24BE32820], "shouldDisambiguateOnLocationType:", a3);
}

- (BOOL)requiresDisambiguation
{
  return -[FIWorkoutActivityType requiresDisambiguation](self->_workoutActivityType, "requiresDisambiguation");
}

- (BOOL)requiresLocationDisambiguation
{
  return -[FIWorkoutActivityType requiresLocationDisambiguation](self->_workoutActivityType, "requiresLocationDisambiguation");
}

- (BOOL)requiresSwimmingLocationDisambiguation
{
  return -[FIWorkoutActivityType requiresSwimmingLocationDisambiguation](self->_workoutActivityType, "requiresSwimmingLocationDisambiguation");
}

+ (id)possibleActivityTypesForIdentifier:(unint64_t)a3 locationType:(int64_t)a4 swimmingLocationType:(int64_t)a5 wheelchairUser:(BOOL)a6
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE32820], "possibleActivityTypesForIdentifier:locationType:swimmingLocationType:wheelchairUser:", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_map:", &__block_literal_global_204);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

FIUIWorkoutActivityType *__111__FIUIWorkoutActivityType_possibleActivityTypesForIdentifier_locationType_swimmingLocationType_wheelchairUser___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  FIUIWorkoutActivityType *v3;

  v2 = a2;
  v3 = -[FIUIWorkoutActivityType initWithWorkoutActivityType:]([FIUIWorkoutActivityType alloc], "initWithWorkoutActivityType:", v2);

  return v3;
}

+ (unint64_t)mapWheelchairUserActivityType:(unint64_t)a3 isWheelchairUser:(BOOL)a4
{
  return objc_msgSend(MEMORY[0x24BE32820], "mapWheelchairUserActivityType:isWheelchairUser:", a3, a4);
}

- (BOOL)isPoolSwimming
{
  return -[FIWorkoutActivityType isPoolSwimming](self->_workoutActivityType, "isPoolSwimming");
}

- (FIWorkoutActivityType)workoutActivityType
{
  return self->_workoutActivityType;
}

- (id)activityTypePlistKey
{
  return (id)-[FIWorkoutActivityType activityTypePlistKey](self->_workoutActivityType, "activityTypePlistKey");
}

- (NSUUID)openGoalUUID
{
  return (NSUUID *)-[FIWorkoutActivityType openGoalUUID](self->_workoutActivityType, "openGoalUUID");
}

- (BOOL)supportsSafetyCheckInPrompt
{
  return -[FIWorkoutActivityType supportsSafetyCheckInPrompt](self->_workoutActivityType, "supportsSafetyCheckInPrompt");
}

@end

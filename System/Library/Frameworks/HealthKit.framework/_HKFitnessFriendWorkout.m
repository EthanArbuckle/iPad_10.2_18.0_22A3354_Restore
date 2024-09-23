@implementation _HKFitnessFriendWorkout

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKFitnessFriendWorkout;
  v4 = a3;
  -[HKSample encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_friendUUID, CFSTR("friendUUID"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_workoutActivityType, CFSTR("workoutActivityType"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("duration"), self->_duration);
  objc_msgSend(v4, "encodeObject:forKey:", self->_totalEnergyBurned, CFSTR("totalEnergyBurned"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_totalBasalEnergyBurned, CFSTR("totalBasalEnergyBurned"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_totalDistance, CFSTR("totalDistance"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_goalType, CFSTR("goalType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_goal, CFSTR("goal"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleID, CFSTR("bundle_id"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isWatchWorkout, CFSTR("is_watch_workout"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isIndoorWorkout, CFSTR("is_indoor_workout"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_deviceManufacturer, CFSTR("device_manufacturer"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_deviceModel, CFSTR("device_model"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_amm, CFSTR("activity_move_mode"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_seymourCatalogWorkoutIdentifier, CFSTR("seymourCatalogWorkoutIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_seymourMediaType, CFSTR("seymourMediaType"));

}

+ (id)fitnessFriendWorkoutFromHKWorkout:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;

  v3 = a3;
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isConnectedGymDevice");

  if (v5)
  {
    objc_msgSend(v3, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "manufacturer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "model");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v35 = 0;
    v36 = 0;
  }
  v31 = objc_msgSend(v3, "workoutActivityType");
  objc_msgSend(v3, "startDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "duration");
  v9 = v8;
  objc_msgSend(v3, "totalEnergyBurned");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_totalBasalEnergyBurned");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "totalDistance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v3, "_goalType");
  objc_msgSend(v3, "_goal");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceRevision");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "source");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bundleIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "_isWatchWorkout");
  objc_msgSend(v3, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HKIndoorWorkout"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  v14 = objc_msgSend(v3, "_activityMoveMode");
  objc_msgSend(v3, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_HKPrivateSeymourCatalogWorkoutIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("_HKPrivateSeymourMediaType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v21) = v13;
  LOBYTE(v21) = v10;
  objc_msgSend(a1, "fitnessFriendworkoutWithActivityType:friendUUID:startDate:endDate:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:goalType:goal:bundleID:isWatchWorkout:isIndoorWorkout:deviceManufacturer:deviceModel:amm:seymourCatalogWorkoutIdentifier:seymourMediaType:", v31, 0, v32, v30, v28, v27, v9, v23, v25, v22, v24, v21, v36, v35, v14,
    v16,
    v18);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_setUUID:", v19);

  return v34;
}

- (void)setIsWatchWorkout:(BOOL)a3
{
  self->_isWatchWorkout = a3;
}

- (id)hkWorkoutFromFriendWorkout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  HKDevice *v24;
  void *v26;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_HKFitnessFriendWorkout isIndoorWorkout](self, "isIndoorWorkout"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("HKIndoorWorkout"));
  if (-[_HKFitnessFriendWorkout amm](self, "amm") == 2)
    v4 = &unk_1E3895D70;
  else
    v4 = &unk_1E3895D88;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("_HKPrivateWorkoutActivityMoveMode"));
  -[_HKFitnessFriendWorkout seymourCatalogWorkoutIdentifier](self, "seymourCatalogWorkoutIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_HKFitnessFriendWorkout seymourCatalogWorkoutIdentifier](self, "seymourCatalogWorkoutIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("_HKPrivateSeymourCatalogWorkoutIdentifier"));

  }
  -[_HKFitnessFriendWorkout seymourMediaType](self, "seymourMediaType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_HKFitnessFriendWorkout seymourMediaType](self, "seymourMediaType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("_HKPrivateSeymourMediaType"));

  }
  v9 = -[_HKFitnessFriendWorkout workoutActivityType](self, "workoutActivityType");
  -[HKSample startDate](self, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSample endDate](self, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKFitnessFriendWorkout duration](self, "duration");
  v13 = v12;
  -[_HKFitnessFriendWorkout totalEnergyBurned](self, "totalEnergyBurned");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKFitnessFriendWorkout totalBasalEnergyBurned](self, "totalBasalEnergyBurned");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKFitnessFriendWorkout totalDistance](self, "totalDistance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[_HKFitnessFriendWorkout goalType](self, "goalType");
  -[_HKFitnessFriendWorkout goal](self, "goal");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v3;
  v19 = (void *)objc_msgSend(v3, "copy");
  +[HKWorkout _workoutWithActivityType:startDate:endDate:workoutEvents:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:goalType:goal:device:metadata:](HKWorkout, "_workoutWithActivityType:startDate:endDate:workoutEvents:duration:totalActiveEnergyBurned:totalBasalEnergyBurned:totalDistance:goalType:goal:device:metadata:", v9, v10, v11, 0, v14, v15, v13, v16, v17, v18, 0, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[HKSource _init]([HKSource alloc], "_init");
  -[_HKFitnessFriendWorkout bundleID](self, "bundleID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_setBundleIdentifier:", v22);

  v23 = -[HKSourceRevision _initWithSource:]([HKSourceRevision alloc], "_initWithSource:", v21);
  objc_msgSend(v20, "_setSourceRevision:", v23);
  if (self->_deviceManufacturer)
  {
    v24 = -[HKDevice initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:]([HKDevice alloc], "initWithName:manufacturer:model:hardwareVersion:firmwareVersion:softwareVersion:localIdentifier:UDIDeviceIdentifier:", 0, self->_deviceManufacturer, self->_deviceModel, 0, 0, 0, CFSTR("com.healthd.fitnessmachine"), 0);
    objc_msgSend(v20, "_setDevice:", v24);

  }
  objc_msgSend(v20, "_setIsWatchWorkout:", -[_HKFitnessFriendWorkout isWatchWorkout](self, "isWatchWorkout"));

  return v20;
}

- (BOOL)isIndoorWorkout
{
  return self->_isIndoorWorkout;
}

- (unint64_t)workoutActivityType
{
  return self->_workoutActivityType;
}

- (double)duration
{
  return self->_duration;
}

- (HKQuantity)totalEnergyBurned
{
  return self->_totalEnergyBurned;
}

- (HKQuantity)totalBasalEnergyBurned
{
  return self->_totalBasalEnergyBurned;
}

- (HKQuantity)totalDistance
{
  return self->_totalDistance;
}

- (unint64_t)goalType
{
  return self->_goalType;
}

- (HKQuantity)goal
{
  return self->_goal;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (BOOL)isWatchWorkout
{
  return self->_isWatchWorkout;
}

- (NSString)deviceManufacturer
{
  return self->_deviceManufacturer;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seymourMediaType, 0);
  objc_storeStrong((id *)&self->_seymourCatalogWorkoutIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceManufacturer, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_goal, 0);
  objc_storeStrong((id *)&self->_totalDistance, 0);
  objc_storeStrong((id *)&self->_totalBasalEnergyBurned, 0);
  objc_storeStrong((id *)&self->_totalEnergyBurned, 0);
  objc_storeStrong((id *)&self->_friendUUID, 0);
}

- (void)setFriendUUID:(id)a3
{
  objc_storeStrong((id *)&self->_friendUUID, a3);
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setTotalEnergyBurned:(id)a3
{
  objc_storeStrong((id *)&self->_totalEnergyBurned, a3);
}

- (void)setTotalBasalEnergyBurned:(id)a3
{
  objc_storeStrong((id *)&self->_totalBasalEnergyBurned, a3);
}

- (void)setWorkoutActivityType:(unint64_t)a3
{
  self->_workoutActivityType = a3;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (void)setIsIndoorWorkout:(BOOL)a3
{
  self->_isIndoorWorkout = a3;
}

- (NSUUID)friendUUID
{
  return self->_friendUUID;
}

+ (id)fitnessFriendworkoutWithActivityType:(unint64_t)a3 friendUUID:(id)a4 startDate:(id)a5 endDate:(id)a6 duration:(double)a7 totalActiveEnergyBurned:(id)a8 totalBasalEnergyBurned:(id)a9 totalDistance:(id)a10 goalType:(unint64_t)a11 goal:(id)a12 bundleID:(id)a13 isWatchWorkout:(BOOL)a14 isIndoorWorkout:(BOOL)a15 deviceManufacturer:(id)a16 deviceModel:(id)a17 amm:(int64_t)a18 seymourCatalogWorkoutIdentifier:(id)a19 seymourMediaType:(id)a20
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v48;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v55;
  objc_super v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  unint64_t v68;
  double v69;
  unint64_t v70;
  int64_t v71;
  BOOL v72;
  BOOL v73;

  v46 = a4;
  v45 = a8;
  v24 = a9;
  v44 = a10;
  v43 = a12;
  v42 = a13;
  v25 = a16;
  v26 = a17;
  v27 = a19;
  v28 = a20;
  v29 = a6;
  v30 = a5;
  +[HKObjectType fitnessFriendWorkoutType](HKObjectType, "fitnessFriendWorkoutType");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "timeIntervalSinceReferenceDate");
  v32 = v31;

  objc_msgSend(v29, "timeIntervalSinceReferenceDate");
  v34 = v33;

  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __301___HKFitnessFriendWorkout_fitnessFriendworkoutWithActivityType_friendUUID_startDate_endDate_duration_totalActiveEnergyBurned_totalBasalEnergyBurned_totalDistance_goalType_goal_bundleID_isWatchWorkout_isIndoorWorkout_deviceManufacturer_deviceModel_amm_seymourCatalogWorkoutIdentifier_seymourMediaType___block_invoke;
  v57[3] = &unk_1E37F63A8;
  v68 = a3;
  v69 = a7;
  v58 = v46;
  v59 = v45;
  v60 = v24;
  v61 = v44;
  v62 = v43;
  v63 = v42;
  v72 = a14;
  v73 = a15;
  v64 = v25;
  v65 = v26;
  v70 = a11;
  v71 = a18;
  v66 = v27;
  v67 = v28;
  v56.receiver = a1;
  v56.super_class = (Class)&OBJC_METACLASS____HKFitnessFriendWorkout;
  v55 = v28;
  v53 = v27;
  v52 = v26;
  v51 = v25;
  v48 = v42;
  v35 = v43;
  v36 = v44;
  v37 = v24;
  v38 = v45;
  v39 = v46;
  v40 = objc_msgSendSuper2(&v56, sel__newSampleWithType_startDate_endDate_device_metadata_config_, v50, 0, 0, v57, v32, v34);

  return v40;
}

+ (BOOL)_isConcreteObjectClass
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FitnessFriendWorkout(%ld friend: %@, duration: %f"), self->_workoutActivityType, self->_friendUUID, *(_QWORD *)&self->_duration);
}

- (_HKFitnessFriendWorkout)initWithCoder:(id)a3
{
  id v4;
  _HKFitnessFriendWorkout *v5;
  uint64_t v6;
  NSUUID *friendUUID;
  double v8;
  uint64_t v9;
  HKQuantity *totalEnergyBurned;
  uint64_t v11;
  HKQuantity *totalBasalEnergyBurned;
  uint64_t v13;
  HKQuantity *totalDistance;
  uint64_t v15;
  HKQuantity *goal;
  uint64_t v17;
  NSString *bundleID;
  uint64_t v19;
  NSString *deviceManufacturer;
  uint64_t v21;
  NSString *deviceModel;
  uint64_t v23;
  NSString *seymourCatalogWorkoutIdentifier;
  uint64_t v25;
  NSString *seymourMediaType;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_HKFitnessFriendWorkout;
  v5 = -[HKSample initWithCoder:](&v28, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("friendUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    friendUUID = v5->_friendUUID;
    v5->_friendUUID = (NSUUID *)v6;

    v5->_workoutActivityType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("workoutActivityType"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("duration"));
    v5->_duration = v8;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalEnergyBurned"));
    v9 = objc_claimAutoreleasedReturnValue();
    totalEnergyBurned = v5->_totalEnergyBurned;
    v5->_totalEnergyBurned = (HKQuantity *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalBasalEnergyBurned"));
    v11 = objc_claimAutoreleasedReturnValue();
    totalBasalEnergyBurned = v5->_totalBasalEnergyBurned;
    v5->_totalBasalEnergyBurned = (HKQuantity *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalDistance"));
    v13 = objc_claimAutoreleasedReturnValue();
    totalDistance = v5->_totalDistance;
    v5->_totalDistance = (HKQuantity *)v13;

    v5->_goalType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("goalType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("goal"));
    v15 = objc_claimAutoreleasedReturnValue();
    goal = v5->_goal;
    v5->_goal = (HKQuantity *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundle_id"));
    v17 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v17;

    v5->_isWatchWorkout = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("is_watch_workout"));
    v5->_isIndoorWorkout = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("is_indoor_workout"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("device_manufacturer"));
    v19 = objc_claimAutoreleasedReturnValue();
    deviceManufacturer = v5->_deviceManufacturer;
    v5->_deviceManufacturer = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("device_model"));
    v21 = objc_claimAutoreleasedReturnValue();
    deviceModel = v5->_deviceModel;
    v5->_deviceModel = (NSString *)v21;

    v5->_amm = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activity_move_mode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seymourCatalogWorkoutIdentifier"));
    v23 = objc_claimAutoreleasedReturnValue();
    seymourCatalogWorkoutIdentifier = v5->_seymourCatalogWorkoutIdentifier;
    v5->_seymourCatalogWorkoutIdentifier = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seymourMediaType"));
    v25 = objc_claimAutoreleasedReturnValue();
    seymourMediaType = v5->_seymourMediaType;
    v5->_seymourMediaType = (NSString *)v25;

  }
  return v5;
}

- (void)setTotalDistance:(id)a3
{
  objc_storeStrong((id *)&self->_totalDistance, a3);
}

- (void)setGoal:(id)a3
{
  objc_storeStrong((id *)&self->_goal, a3);
}

- (void)setGoalType:(unint64_t)a3
{
  self->_goalType = a3;
}

- (void)setDeviceManufacturer:(id)a3
{
  objc_storeStrong((id *)&self->_deviceManufacturer, a3);
}

- (void)setDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModel, a3);
}

- (int64_t)amm
{
  return self->_amm;
}

- (void)setAmm:(int64_t)a3
{
  self->_amm = a3;
}

- (NSString)seymourCatalogWorkoutIdentifier
{
  return self->_seymourCatalogWorkoutIdentifier;
}

- (void)setSeymourCatalogWorkoutIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_seymourCatalogWorkoutIdentifier, a3);
}

- (NSString)seymourMediaType
{
  return self->_seymourMediaType;
}

- (void)setSeymourMediaType:(id)a3
{
  objc_storeStrong((id *)&self->_seymourMediaType, a3);
}

@end

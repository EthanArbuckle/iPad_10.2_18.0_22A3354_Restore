@implementation HKWorkoutCluster

- (HKWorkoutCluster)initWithWorkoutUUIDs:(id)a3 lastWorkoutUUID:(id)a4 bestWorkoutUUID:(id)a5 relevanceValue:(double)a6 workoutRouteSnapshot:(id)a7 workoutRouteLabel:(id)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  HKWorkoutCluster *v21;

  v14 = (void *)MEMORY[0x1E0CB3A28];
  v15 = a8;
  v16 = a7;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  objc_msgSend(v14, "UUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HKWorkoutCluster _initWithUUID:workoutUUIDs:lastWorkoutUUID:bestWorkoutUUID:relevanceValue:workoutRouteSnapshot:workoutRouteLabel:](self, "_initWithUUID:workoutUUIDs:lastWorkoutUUID:bestWorkoutUUID:relevanceValue:workoutRouteSnapshot:workoutRouteLabel:", v20, v19, v18, v17, v16, v15, a6);

  return v21;
}

- (id)_initWithUUID:(id)a3 workoutUUIDs:(id)a4 lastWorkoutUUID:(id)a5 bestWorkoutUUID:(id)a6 relevanceValue:(double)a7 workoutRouteSnapshot:(id)a8 workoutRouteLabel:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HKWorkoutCluster *v22;
  uint64_t v23;
  NSUUID *clusterUUID;
  uint64_t v25;
  NSArray *workoutUUIDs;
  uint64_t v27;
  NSUUID *lastWorkoutUUID;
  uint64_t v29;
  NSUUID *bestWorkoutUUID;
  uint64_t v31;
  NSData *workoutRouteSnapshot;
  uint64_t v33;
  NSString *workoutRouteLabel;
  objc_super v36;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a9;
  v36.receiver = self;
  v36.super_class = (Class)HKWorkoutCluster;
  v22 = -[HKWorkoutCluster init](&v36, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v16, "copy");
    clusterUUID = v22->_clusterUUID;
    v22->_clusterUUID = (NSUUID *)v23;

    v25 = objc_msgSend(v17, "copy");
    workoutUUIDs = v22->_workoutUUIDs;
    v22->_workoutUUIDs = (NSArray *)v25;

    v27 = objc_msgSend(v18, "copy");
    lastWorkoutUUID = v22->_lastWorkoutUUID;
    v22->_lastWorkoutUUID = (NSUUID *)v27;

    v29 = objc_msgSend(v19, "copy");
    bestWorkoutUUID = v22->_bestWorkoutUUID;
    v22->_bestWorkoutUUID = (NSUUID *)v29;

    v22->_relevanceValue = a7;
    v31 = objc_msgSend(v20, "copy");
    workoutRouteSnapshot = v22->_workoutRouteSnapshot;
    v22->_workoutRouteSnapshot = (NSData *)v31;

    v33 = objc_msgSend(v21, "copy");
    workoutRouteLabel = v22->_workoutRouteLabel;
    v22->_workoutRouteLabel = (NSString *)v33;

  }
  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSData *workoutRouteSnapshot;
  int v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (double *)v4;
    if (self->_workoutUUIDs)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    if (*((_QWORD *)v5 + 2))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = 0;
      if (v6 && v8)
        v10 = objc_msgSend(v6, "isEqualToSet:", v8) ^ 1;
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
    workoutRouteSnapshot = self->_workoutRouteSnapshot;
    if (workoutRouteSnapshot && *((_QWORD *)v5 + 6))
      v12 = !-[NSData isEqualToData:](workoutRouteSnapshot, "isEqualToData:");
    else
      LOBYTE(v12) = 0;
    v7 = ((-[NSUUID isEqual:](self->_clusterUUID, "isEqual:", *((_QWORD *)v5 + 1)) ^ 1 | v10) & 1) == 0
      && -[NSUUID isEqual:](self->_lastWorkoutUUID, "isEqual:", *((_QWORD *)v5 + 3))
      && -[NSUUID isEqual:](self->_bestWorkoutUUID, "isEqual:", *((_QWORD *)v5 + 4))
      && (self->_relevanceValue != v5[5] ? (v13 = 1) : (v13 = v12), (v13 & 1) == 0)
      && -[NSString isEqualToString:](self->_workoutRouteLabel, "isEqualToString:", *((_QWORD *)v5 + 7));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double relevanceValue;
  uint64_t v8;

  v3 = -[NSUUID hash](self->_clusterUUID, "hash");
  v4 = -[NSArray hash](self->_workoutUUIDs, "hash") ^ v3;
  v5 = -[NSUUID hash](self->_lastWorkoutUUID, "hash");
  v6 = v4 ^ v5 ^ -[NSUUID hash](self->_bestWorkoutUUID, "hash");
  relevanceValue = self->_relevanceValue;
  v8 = *(_QWORD *)&relevanceValue ^ -[NSData hash](self->_workoutRouteSnapshot, "hash");
  return v6 ^ v8 ^ -[NSString hash](self->_workoutRouteLabel, "hash");
}

- (id)description
{
  unint64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;

  v3 = -[NSData length](self->_workoutRouteSnapshot, "length");
  if (self->_workoutRouteSnapshot)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("snapshot:%0.1lf kB, "), (double)v3 * 0.0009765625);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E37FD4C0;
  }
  if (self->_workoutUUIDs)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", workouts:%@"), self->_workoutUUIDs);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E37FD4C0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p uuid:%@, last:%@, best:%@, relevance:%f, %@label:'%@'%@>"), objc_opt_class(), self, self->_clusterUUID, self->_lastWorkoutUUID, self->_bestWorkoutUUID, *(_QWORD *)&self->_relevanceValue, v4, self->_workoutRouteLabel, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKWorkoutCluster)initWithCoder:(id)a3
{
  id v4;
  HKWorkoutCluster *v5;
  uint64_t v6;
  NSUUID *clusterUUID;
  uint64_t v8;
  NSUUID *lastWorkoutUUID;
  uint64_t v10;
  NSUUID *bestWorkoutUUID;
  double v12;
  uint64_t v13;
  NSData *workoutRouteSnapshot;
  uint64_t v15;
  NSString *workoutRouteLabel;
  void *v17;
  uint64_t v18;
  NSArray *workoutUUIDs;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HKWorkoutCluster;
  v5 = -[HKWorkoutCluster init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cluster_uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    clusterUUID = v5->_clusterUUID;
    v5->_clusterUUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("last_workout"));
    v8 = objc_claimAutoreleasedReturnValue();
    lastWorkoutUUID = v5->_lastWorkoutUUID;
    v5->_lastWorkoutUUID = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("best_workout"));
    v10 = objc_claimAutoreleasedReturnValue();
    bestWorkoutUUID = v5->_bestWorkoutUUID;
    v5->_bestWorkoutUUID = (NSUUID *)v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("relevance"));
    v5->_relevanceValue = v12;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("route_snapshot"));
    v13 = objc_claimAutoreleasedReturnValue();
    workoutRouteSnapshot = v5->_workoutRouteSnapshot;
    v5->_workoutRouteSnapshot = (NSData *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("route_label"));
    v15 = objc_claimAutoreleasedReturnValue();
    workoutRouteLabel = v5->_workoutRouteLabel;
    v5->_workoutRouteLabel = (NSString *)v15;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("workout_uuids"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hk_map:", &__block_literal_global_23);
    v18 = objc_claimAutoreleasedReturnValue();
    workoutUUIDs = v5->_workoutUUIDs;
    v5->_workoutUUIDs = (NSArray *)v18;

  }
  return v5;
}

id __34__HKWorkoutCluster_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *clusterUUID;
  id v5;
  id v6;

  clusterUUID = self->_clusterUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", clusterUUID, CFSTR("cluster_uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastWorkoutUUID, CFSTR("last_workout"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bestWorkoutUUID, CFSTR("best_workout"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("relevance"), self->_relevanceValue);
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutRouteSnapshot, CFSTR("route_snapshot"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutRouteLabel, CFSTR("route_label"));
  -[NSArray hk_map:](self->_workoutUUIDs, "hk_map:", &__block_literal_global_26);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("workout_uuids"));

}

uint64_t __36__HKWorkoutCluster_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

- (NSUUID)clusterUUID
{
  return self->_clusterUUID;
}

- (NSArray)workoutUUIDs
{
  return self->_workoutUUIDs;
}

- (NSUUID)lastWorkoutUUID
{
  return self->_lastWorkoutUUID;
}

- (NSUUID)bestWorkoutUUID
{
  return self->_bestWorkoutUUID;
}

- (double)relevanceValue
{
  return self->_relevanceValue;
}

- (NSData)workoutRouteSnapshot
{
  return self->_workoutRouteSnapshot;
}

- (NSString)workoutRouteLabel
{
  return self->_workoutRouteLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutRouteLabel, 0);
  objc_storeStrong((id *)&self->_workoutRouteSnapshot, 0);
  objc_storeStrong((id *)&self->_bestWorkoutUUID, 0);
  objc_storeStrong((id *)&self->_lastWorkoutUUID, 0);
  objc_storeStrong((id *)&self->_workoutUUIDs, 0);
  objc_storeStrong((id *)&self->_clusterUUID, 0);
}

@end

@implementation HKRaceRouteCluster

- (id)_initWithUUID:(id)a3 workoutClusterUUID:(id)a4 clusterSize:(unint64_t)a5 relevanceValue:(double)a6 workoutActivityType:(unint64_t)a7 lastWorkoutUUID:(id)a8 lastWorkoutDate:(id)a9 lastWorkoutDistance:(double)a10 lastWorkoutDuration:(double)a11 lastWorkoutStartingPoint:(id)a12 bestWorkoutUUID:(id)a13 bestWorkoutDate:(id)a14 bestWorkoutDistance:(double)a15 bestWorkoutDuration:(double)a16 workoutRouteSnapshot:(id)a17 workoutRouteLabel:(id)a18
{
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  HKRaceRouteCluster *v37;
  uint64_t v38;
  NSUUID *clusterUUID;
  uint64_t v40;
  NSUUID *workoutClusterUUID;
  uint64_t v42;
  NSUUID *lastWorkoutUUID;
  uint64_t v44;
  NSDate *lastWorkoutDate;
  uint64_t v46;
  CLLocation *lastWorkoutStartingPoint;
  uint64_t v48;
  NSUUID *bestWorkoutUUID;
  uint64_t v50;
  NSDate *bestWorkoutDate;
  uint64_t v52;
  NSData *workoutRouteSnapshot;
  uint64_t v54;
  NSString *workoutRouteLabel;
  objc_super v59;

  v27 = a3;
  v28 = a4;
  v29 = a8;
  v30 = a9;
  v31 = v28;
  v32 = a12;
  v33 = a13;
  v34 = a14;
  v35 = a17;
  v36 = a18;
  v59.receiver = self;
  v59.super_class = (Class)HKRaceRouteCluster;
  v37 = -[HKRaceRouteCluster init](&v59, sel_init);
  if (v37)
  {
    v38 = objc_msgSend(v27, "copy");
    clusterUUID = v37->_clusterUUID;
    v37->_clusterUUID = (NSUUID *)v38;

    v40 = objc_msgSend(v31, "copy");
    workoutClusterUUID = v37->_workoutClusterUUID;
    v37->_workoutClusterUUID = (NSUUID *)v40;

    v37->_relevanceValue = a6;
    v37->_clusterSize = a5;
    v37->_workoutActivityType = a7;
    v42 = objc_msgSend(v29, "copy");
    lastWorkoutUUID = v37->_lastWorkoutUUID;
    v37->_lastWorkoutUUID = (NSUUID *)v42;

    v44 = objc_msgSend(v30, "copy");
    lastWorkoutDate = v37->_lastWorkoutDate;
    v37->_lastWorkoutDate = (NSDate *)v44;

    v37->_lastWorkoutDistance = a10;
    v37->_lastWorkoutDuration = a11;
    v46 = objc_msgSend(v32, "copy");
    lastWorkoutStartingPoint = v37->_lastWorkoutStartingPoint;
    v37->_lastWorkoutStartingPoint = (CLLocation *)v46;

    v48 = objc_msgSend(v33, "copy");
    bestWorkoutUUID = v37->_bestWorkoutUUID;
    v37->_bestWorkoutUUID = (NSUUID *)v48;

    v50 = objc_msgSend(v34, "copy");
    bestWorkoutDate = v37->_bestWorkoutDate;
    v37->_bestWorkoutDate = (NSDate *)v50;

    v37->_bestWorkoutDistance = a15;
    v37->_bestWorkoutDuration = a16;
    v52 = objc_msgSend(v35, "copy");
    workoutRouteSnapshot = v37->_workoutRouteSnapshot;
    v37->_workoutRouteSnapshot = (NSData *)v52;

    v54 = objc_msgSend(v36, "copy");
    workoutRouteLabel = v37->_workoutRouteLabel;
    v37->_workoutRouteLabel = (NSString *)v54;

  }
  return v37;
}

- (void)_setWorkoutClusterUUID:(id)a3
{
  objc_storeStrong((id *)&self->_workoutClusterUUID, a3);
}

- (void)_setRelevanceValue:(double)a3
{
  self->_relevanceValue = a3;
}

- (void)_setWorkoutRouteSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_workoutRouteSnapshot, a3);
}

- (void)_setWorkoutRouteLabel:(id)a3
{
  objc_storeStrong((id *)&self->_workoutRouteLabel, a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v12 = -[NSUUID isEqual:](self->_clusterUUID, "isEqual:", *((_QWORD *)v5 + 1))
       && -[NSUUID isEqual:](self->_workoutClusterUUID, "isEqual:", *((_QWORD *)v5 + 2))
       && self->_relevanceValue == *((double *)v5 + 3)
       && self->_clusterSize == *((_QWORD *)v5 + 4)
       && self->_workoutActivityType == *((_QWORD *)v5 + 5)
       && -[NSUUID isEqual:](self->_lastWorkoutUUID, "isEqual:", *((_QWORD *)v5 + 6))
       && -[NSDate isEqualToDate:](self->_lastWorkoutDate, "isEqualToDate:", *((_QWORD *)v5 + 7))
       && self->_lastWorkoutDistance == *((double *)v5 + 8)
       && self->_lastWorkoutDuration == *((double *)v5 + 9)
       && (-[CLLocation coordinate](self->_lastWorkoutStartingPoint, "coordinate"),
           v7 = v6,
           objc_msgSend(*((id *)v5 + 10), "coordinate"),
           v7 == v8)
       && (-[CLLocation coordinate](self->_lastWorkoutStartingPoint, "coordinate"),
           v10 = v9,
           objc_msgSend(*((id *)v5 + 10), "coordinate"),
           v10 == v11)
       && -[NSUUID isEqual:](self->_bestWorkoutUUID, "isEqual:", *((_QWORD *)v5 + 11))
       && -[NSDate isEqualToDate:](self->_bestWorkoutDate, "isEqualToDate:", *((_QWORD *)v5 + 12))
       && self->_bestWorkoutDistance == *((double *)v5 + 13)
       && self->_bestWorkoutDuration == *((double *)v5 + 14)
       && -[NSData isEqualToData:](self->_workoutRouteSnapshot, "isEqualToData:", *((_QWORD *)v5 + 15))
       && -[NSString isEqualToString:](self->_workoutRouteLabel, "isEqualToString:", *((_QWORD *)v5 + 16));

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  double relevanceValue;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double bestWorkoutDistance;
  double bestWorkoutDuration;
  uint64_t v11;
  NSUInteger v12;
  int8x16_t v13;
  int8x16_t v15;
  int8x16_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = -[NSUUID hash](self->_clusterUUID, "hash");
  v17 = -[NSUUID hash](self->_workoutClusterUUID, "hash");
  relevanceValue = self->_relevanceValue;
  v16 = *(int8x16_t *)&self->_clusterSize;
  v4 = -[NSUUID hash](self->_lastWorkoutUUID, "hash");
  v5 = -[NSDate hash](self->_lastWorkoutDate, "hash");
  v15 = *(int8x16_t *)&self->_lastWorkoutDistance;
  v6 = -[CLLocation hash](self->_lastWorkoutStartingPoint, "hash");
  v7 = -[NSUUID hash](self->_bestWorkoutUUID, "hash");
  v8 = -[NSDate hash](self->_bestWorkoutDate, "hash");
  bestWorkoutDistance = self->_bestWorkoutDistance;
  bestWorkoutDuration = self->_bestWorkoutDuration;
  v11 = -[NSData hash](self->_workoutRouteSnapshot, "hash");
  v12 = -[NSString hash](self->_workoutRouteLabel, "hash");
  v13 = veorq_s8(v16, v15);
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v13.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL)) ^ *(_QWORD *)&relevanceValue ^ *(_QWORD *)&bestWorkoutDistance ^ *(_QWORD *)&bestWorkoutDuration ^ v12 ^ v11 ^ v8 ^ v7 ^ v6 ^ v5 ^ v4 ^ v17 ^ v18;
}

- (id)description
{
  double v3;

  v3 = (double)-[NSData length](self->_workoutRouteSnapshot, "length") * 0.0009765625;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p uuid:%@, workout-cluster:%@, relevance:%f, activity-type:%lu, frequency:%lu, age:%@, snapshot:%0.1lf kB, label:'%@'>"), objc_opt_class(), self, self->_clusterUUID, self->_workoutClusterUUID, *(_QWORD *)&self->_relevanceValue, self->_workoutActivityType, self->_clusterSize, self->_lastWorkoutDate, *(_QWORD *)&v3, self->_workoutRouteLabel, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKRaceRouteCluster)initWithCoder:(id)a3
{
  id v4;
  HKRaceRouteCluster *v5;
  uint64_t v6;
  NSUUID *clusterUUID;
  uint64_t v8;
  NSUUID *workoutClusterUUID;
  double v10;
  uint64_t v11;
  NSUUID *lastWorkoutUUID;
  uint64_t v13;
  NSDate *lastWorkoutDate;
  double v15;
  double v16;
  uint64_t v17;
  CLLocation *lastWorkoutStartingPoint;
  uint64_t v19;
  NSUUID *bestWorkoutUUID;
  uint64_t v21;
  NSDate *bestWorkoutDate;
  double v23;
  double v24;
  uint64_t v25;
  NSData *workoutRouteSnapshot;
  uint64_t v27;
  NSString *workoutRouteLabel;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HKRaceRouteCluster;
  v5 = -[HKRaceRouteCluster init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    clusterUUID = v5->_clusterUUID;
    v5->_clusterUUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cluster_uuid"));
    v8 = objc_claimAutoreleasedReturnValue();
    workoutClusterUUID = v5->_workoutClusterUUID;
    v5->_workoutClusterUUID = (NSUUID *)v8;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("relevance"));
    v5->_relevanceValue = v10;
    v5->_clusterSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("size"));
    v5->_workoutActivityType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activity_type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("last_workout_uuid"));
    v11 = objc_claimAutoreleasedReturnValue();
    lastWorkoutUUID = v5->_lastWorkoutUUID;
    v5->_lastWorkoutUUID = (NSUUID *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("last_workout_date"));
    v13 = objc_claimAutoreleasedReturnValue();
    lastWorkoutDate = v5->_lastWorkoutDate;
    v5->_lastWorkoutDate = (NSDate *)v13;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("last_workout_distance"));
    v5->_lastWorkoutDistance = v15;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("last_workout_duration"));
    v5->_lastWorkoutDuration = v16;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("last_workout_starting_point"));
    v17 = objc_claimAutoreleasedReturnValue();
    lastWorkoutStartingPoint = v5->_lastWorkoutStartingPoint;
    v5->_lastWorkoutStartingPoint = (CLLocation *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("best_workout_uuid"));
    v19 = objc_claimAutoreleasedReturnValue();
    bestWorkoutUUID = v5->_bestWorkoutUUID;
    v5->_bestWorkoutUUID = (NSUUID *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("best_workout_date"));
    v21 = objc_claimAutoreleasedReturnValue();
    bestWorkoutDate = v5->_bestWorkoutDate;
    v5->_bestWorkoutDate = (NSDate *)v21;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("best_workout_distance"));
    v5->_bestWorkoutDistance = v23;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("best_workout_duration"));
    v5->_bestWorkoutDuration = v24;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("route_snapshot"));
    v25 = objc_claimAutoreleasedReturnValue();
    workoutRouteSnapshot = v5->_workoutRouteSnapshot;
    v5->_workoutRouteSnapshot = (NSData *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("route_label"));
    v27 = objc_claimAutoreleasedReturnValue();
    workoutRouteLabel = v5->_workoutRouteLabel;
    v5->_workoutRouteLabel = (NSString *)v27;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *clusterUUID;
  id v5;

  clusterUUID = self->_clusterUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", clusterUUID, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutClusterUUID, CFSTR("cluster_uuid"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("relevance"), self->_relevanceValue);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_clusterSize, CFSTR("size"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_workoutActivityType, CFSTR("activity_type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastWorkoutUUID, CFSTR("last_workout_uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastWorkoutDate, CFSTR("last_workout_date"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("last_workout_distance"), self->_lastWorkoutDistance);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("last_workout_duration"), self->_lastWorkoutDuration);
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastWorkoutStartingPoint, CFSTR("last_workout_starting_point"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bestWorkoutUUID, CFSTR("best_workout_uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bestWorkoutDate, CFSTR("best_workout_date"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("best_workout_distance"), self->_bestWorkoutDistance);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("best_workout_duration"), self->_bestWorkoutDuration);
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutRouteSnapshot, CFSTR("route_snapshot"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_workoutRouteLabel, CFSTR("route_label"));

}

- (NSUUID)clusterUUID
{
  return self->_clusterUUID;
}

- (NSUUID)workoutClusterUUID
{
  return self->_workoutClusterUUID;
}

- (double)relevanceValue
{
  return self->_relevanceValue;
}

- (unint64_t)clusterSize
{
  return self->_clusterSize;
}

- (unint64_t)workoutActivityType
{
  return self->_workoutActivityType;
}

- (NSUUID)lastWorkoutUUID
{
  return self->_lastWorkoutUUID;
}

- (NSDate)lastWorkoutDate
{
  return self->_lastWorkoutDate;
}

- (double)lastWorkoutDistance
{
  return self->_lastWorkoutDistance;
}

- (double)lastWorkoutDuration
{
  return self->_lastWorkoutDuration;
}

- (CLLocation)lastWorkoutStartingPoint
{
  return self->_lastWorkoutStartingPoint;
}

- (NSUUID)bestWorkoutUUID
{
  return self->_bestWorkoutUUID;
}

- (NSDate)bestWorkoutDate
{
  return self->_bestWorkoutDate;
}

- (double)bestWorkoutDistance
{
  return self->_bestWorkoutDistance;
}

- (double)bestWorkoutDuration
{
  return self->_bestWorkoutDuration;
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
  objc_storeStrong((id *)&self->_bestWorkoutDate, 0);
  objc_storeStrong((id *)&self->_bestWorkoutUUID, 0);
  objc_storeStrong((id *)&self->_lastWorkoutStartingPoint, 0);
  objc_storeStrong((id *)&self->_lastWorkoutDate, 0);
  objc_storeStrong((id *)&self->_lastWorkoutUUID, 0);
  objc_storeStrong((id *)&self->_workoutClusterUUID, 0);
  objc_storeStrong((id *)&self->_clusterUUID, 0);
}

@end

@implementation _HKRaceRouteLocationSeriesQueryServerConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKRaceRouteLocationSeriesQueryServerConfiguration;
  v4 = -[HKQueryServerConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setClusterUUID:", self->_clusterUUID);
  objc_msgSend(v4, "setWorkoutSelection:", self->_workoutSelection);
  objc_msgSend(v4, "setWorkoutUUID:", self->_workoutUUID);
  objc_msgSend(v4, "setTimestampAnchor:", self->_timestampAnchor);
  objc_msgSend(v4, "setLimit:", self->_limit);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKRaceRouteLocationSeriesQueryServerConfiguration)initWithCoder:(id)a3
{
  id v4;
  _HKRaceRouteLocationSeriesQueryServerConfiguration *v5;
  uint64_t v6;
  NSUUID *clusterUUID;
  uint64_t v8;
  NSUUID *workoutUUID;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_HKRaceRouteLocationSeriesQueryServerConfiguration;
  v5 = -[HKQueryServerConfiguration initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cluster_uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    clusterUUID = v5->_clusterUUID;
    v5->_clusterUUID = (NSUUID *)v6;

    v5->_workoutSelection = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("workout_selection"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workout_uuid"));
    v8 = objc_claimAutoreleasedReturnValue();
    workoutUUID = v5->_workoutUUID;
    v5->_workoutUUID = (NSUUID *)v8;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp_anchor"));
    v5->_timestampAnchor = v10;
    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("limit"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKRaceRouteLocationSeriesQueryServerConfiguration;
  v4 = a3;
  -[HKQueryServerConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_clusterUUID, CFSTR("cluster_uuid"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_workoutSelection, CFSTR("workout_selection"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_workoutUUID, CFSTR("workout_uuid"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("timestamp_anchor"), self->_timestampAnchor);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_limit, CFSTR("limit"));

}

- (NSUUID)clusterUUID
{
  return self->_clusterUUID;
}

- (void)setClusterUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)workoutSelection
{
  return self->_workoutSelection;
}

- (void)setWorkoutSelection:(unint64_t)a3
{
  self->_workoutSelection = a3;
}

- (NSUUID)workoutUUID
{
  return self->_workoutUUID;
}

- (void)setWorkoutUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (double)timestampAnchor
{
  return self->_timestampAnchor;
}

- (void)setTimestampAnchor:(double)a3
{
  self->_timestampAnchor = a3;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutUUID, 0);
  objc_storeStrong((id *)&self->_clusterUUID, 0);
}

@end

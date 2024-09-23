@implementation ARVLStateData

- (id)init:(double)a3 timeSinceInitialization:(double)a4 trackingStatus:(id)a5 fusedReplayLocation:(id)a6 fusedReplayLocationTimestamp:(double)a7 fusedReplayHeading:(double)a8 fusedReplayHeadingTimestamp:(double)a9 hasStartedAvailabilityCheck:(BOOL)a10 hasReturnedAvailabilityCheck:(BOOL)a11 hasStartedLocalization:(BOOL)a12 hasReturnedLocalization:(BOOL)a13
{
  id v25;
  id v26;
  ARVLStateData *v27;
  ARVLStateData *v28;
  objc_super v30;

  v25 = a5;
  v26 = a6;
  v30.receiver = self;
  v30.super_class = (Class)ARVLStateData;
  v27 = -[ARVLStateData init](&v30, sel_init);
  v28 = v27;
  if (v27)
  {
    v27->_timeSinceLastLocalization = a3;
    v27->_timeSinceInitialization = a4;
    objc_storeStrong((id *)&v27->_trackingStatus, a5);
    objc_storeStrong((id *)&v28->_fusedReplayLocation, a6);
    v28->_fusedReplayLocationTimestamp = a7;
    v28->_fusedReplayHeading = a8;
    v28->_fusedReplayHeadingTimestamp = a9;
    v28->_hasStartedAvailabilityCheck = a10;
    v28->_hasReturnedAvailabilityCheck = a11;
    v28->_hasStartedLocalization = a12;
    v28->_hasReturnedLocalization = a13;
  }

  return v28;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARVLStateData)initWithCoder:(id)a3
{
  id v4;
  ARVLStateData *v5;
  double v6;
  double v7;
  uint64_t v8;
  ARGeoTrackingStatus *trackingStatus;
  uint64_t v10;
  CLLocation *fusedReplayLocation;
  double v12;
  double v13;
  double v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ARVLStateData;
  v5 = -[ARVLStateData init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeSinceLastLocalization"));
    v5->_timeSinceLastLocalization = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeSinceInitialization"));
    v5->_timeSinceInitialization = v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trackingStatus"));
    v8 = objc_claimAutoreleasedReturnValue();
    trackingStatus = v5->_trackingStatus;
    v5->_trackingStatus = (ARGeoTrackingStatus *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fusedReplayLocation"));
    v10 = objc_claimAutoreleasedReturnValue();
    fusedReplayLocation = v5->_fusedReplayLocation;
    v5->_fusedReplayLocation = (CLLocation *)v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("fusedReplayLocationTimestamp"));
    v5->_fusedReplayLocationTimestamp = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("fusedReplayHeading"));
    v5->_fusedReplayHeading = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("fusedReplayHeadingTimestamp"));
    v5->_fusedReplayHeadingTimestamp = v14;
    v5->_hasStartedAvailabilityCheck = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasStartedAvailabilityCheck"));
    v5->_hasReturnedAvailabilityCheck = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasReturnedAvailabilityCheck"));
    v5->_hasStartedLocalization = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasStartedLocalization"));
    v5->_hasReturnedLocalization = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasReturnedLocalization"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timeSinceLastLocalization;
  id v5;

  timeSinceLastLocalization = self->_timeSinceLastLocalization;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timeSinceLastLocalization"), timeSinceLastLocalization);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timeSinceInitialization"), self->_timeSinceInitialization);
  objc_msgSend(v5, "encodeObject:forKey:", self->_trackingStatus, CFSTR("trackingStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fusedReplayLocation, CFSTR("fusedReplayLocation"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("fusedReplayLocationTimestamp"), self->_fusedReplayLocationTimestamp);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("fusedReplayHeading"), self->_fusedReplayHeading);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("fusedReplayHeadingTimestamp"), self->_fusedReplayHeadingTimestamp);
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasStartedAvailabilityCheck, CFSTR("hasStartedAvailabilityCheck"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasReturnedAvailabilityCheck, CFSTR("hasReturnedAvailabilityCheck"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasStartedLocalization, CFSTR("hasStartedLocalization"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasReturnedLocalization, CFSTR("hasReturnedLocalization"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  double timeSinceLastLocalization;
  double timeSinceInitialization;
  ARGeoTrackingStatus *trackingStatus;
  id v9;
  id v10;
  void *v11;
  void *v12;

  result = (id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  if (result)
  {
    timeSinceLastLocalization = self->_timeSinceLastLocalization;
    timeSinceInitialization = self->_timeSinceInitialization;
    trackingStatus = self->_trackingStatus;
    v9 = result;
    v10 = -[ARGeoTrackingStatus copyWithZone:](trackingStatus, "copyWithZone:", a3);
    v11 = (void *)-[CLLocation copyWithZone:](self->_fusedReplayLocation, "copyWithZone:", a3);
    v12 = (void *)objc_msgSend(v9, "init:timeSinceInitialization:trackingStatus:fusedReplayLocation:fusedReplayLocationTimestamp:fusedReplayHeading:fusedReplayHeadingTimestamp:hasStartedAvailabilityCheck:hasReturnedAvailabilityCheck:hasStartedLocalization:hasReturnedLocalization:", v10, v11, self->_hasStartedAvailabilityCheck, self->_hasReturnedAvailabilityCheck, self->_hasStartedLocalization, self->_hasReturnedLocalization, timeSinceLastLocalization, timeSinceInitialization, self->_fusedReplayLocationTimestamp, self->_fusedReplayHeading, self->_fusedReplayHeadingTimestamp);

    return v12;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double timeSinceLastLocalization;
  double v7;
  double timeSinceInitialization;
  double v9;
  ARGeoTrackingStatus *trackingStatus;
  void *v11;
  double fusedReplayHeading;
  double v13;
  double fusedReplayHeadingTimestamp;
  double v15;
  CLLocation *fusedReplayLocation;
  void *v17;
  double fusedReplayLocationTimestamp;
  double v19;
  int hasStartedAvailabilityCheck;
  int hasReturnedAvailabilityCheck;
  int hasStartedLocalization;
  int hasReturnedLocalization;
  BOOL v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    timeSinceLastLocalization = self->_timeSinceLastLocalization;
    objc_msgSend(v5, "timeSinceLastLocalization");
    if (timeSinceLastLocalization == v7
      && (timeSinceInitialization = self->_timeSinceInitialization,
          objc_msgSend(v5, "timeSinceInitialization"),
          timeSinceInitialization == v9))
    {
      trackingStatus = self->_trackingStatus;
      objc_msgSend(v5, "trackingStatus");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[ARGeoTrackingStatus isEqual:](trackingStatus, "isEqual:", v11)
        && (fusedReplayHeading = self->_fusedReplayHeading,
            objc_msgSend(v5, "fusedReplayHeading"),
            fusedReplayHeading == v13)
        && (fusedReplayHeadingTimestamp = self->_fusedReplayHeadingTimestamp,
            objc_msgSend(v5, "fusedReplayHeadingTimestamp"),
            fusedReplayHeadingTimestamp == v15))
      {
        fusedReplayLocation = self->_fusedReplayLocation;
        objc_msgSend(v5, "fusedReplayLocation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[CLLocation isEqual:](fusedReplayLocation, "isEqual:", v17)
          && (fusedReplayLocationTimestamp = self->_fusedReplayLocationTimestamp,
              objc_msgSend(v5, "fusedReplayLocationTimestamp"),
              fusedReplayLocationTimestamp == v19)
          && (hasStartedAvailabilityCheck = self->_hasStartedAvailabilityCheck,
              hasStartedAvailabilityCheck == objc_msgSend(v5, "hasStartedAvailabilityCheck"))
          && (hasReturnedAvailabilityCheck = self->_hasReturnedAvailabilityCheck,
              hasReturnedAvailabilityCheck == objc_msgSend(v5, "hasReturnedAvailabilityCheck"))
          && (hasStartedLocalization = self->_hasStartedLocalization,
              hasStartedLocalization == objc_msgSend(v5, "hasStartedLocalization")))
        {
          hasReturnedLocalization = self->_hasReturnedLocalization;
          v24 = hasReturnedLocalization == objc_msgSend(v5, "hasReturnedLocalization");
        }
        else
        {
          v24 = 0;
        }

      }
      else
      {
        v24 = 0;
      }

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (double)timeSinceLastLocalization
{
  return self->_timeSinceLastLocalization;
}

- (double)timeSinceInitialization
{
  return self->_timeSinceInitialization;
}

- (ARGeoTrackingStatus)trackingStatus
{
  return self->_trackingStatus;
}

- (double)fusedReplayLocationTimestamp
{
  return self->_fusedReplayLocationTimestamp;
}

- (CLLocation)fusedReplayLocation
{
  return self->_fusedReplayLocation;
}

- (double)fusedReplayHeading
{
  return self->_fusedReplayHeading;
}

- (double)fusedReplayHeadingTimestamp
{
  return self->_fusedReplayHeadingTimestamp;
}

- (BOOL)hasStartedAvailabilityCheck
{
  return self->_hasStartedAvailabilityCheck;
}

- (BOOL)hasReturnedAvailabilityCheck
{
  return self->_hasReturnedAvailabilityCheck;
}

- (BOOL)hasStartedLocalization
{
  return self->_hasStartedLocalization;
}

- (BOOL)hasReturnedLocalization
{
  return self->_hasReturnedLocalization;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fusedReplayLocation, 0);
  objc_storeStrong((id *)&self->_trackingStatus, 0);
}

@end

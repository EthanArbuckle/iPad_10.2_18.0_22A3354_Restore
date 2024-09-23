@implementation MNTraceRecordingData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNTraceRecordingData)initWithCoder:(id)a3
{
  id v4;
  MNTraceRecordingData *v5;
  uint64_t v6;
  MNLocation *initialUserLocation;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *waypoints;
  uint64_t v13;
  GEODirectionsRequest *initialDirectionsRequest;
  uint64_t v15;
  GEODirectionsResponse *initialDirectionsResponse;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSError *initialDirectionsRequestError;
  double v22;
  double v23;
  MNTraceRecordingData *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MNTraceRecordingData;
  v5 = -[MNTraceRecordingData init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_initialUserLocation"));
    v6 = objc_claimAutoreleasedReturnValue();
    initialUserLocation = v5->_initialUserLocation;
    v5->_initialUserLocation = (MNLocation *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_waypoints"));
    v11 = objc_claimAutoreleasedReturnValue();
    waypoints = v5->_waypoints;
    v5->_waypoints = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_initialDirectionsRequest"));
    v13 = objc_claimAutoreleasedReturnValue();
    initialDirectionsRequest = v5->_initialDirectionsRequest;
    v5->_initialDirectionsRequest = (GEODirectionsRequest *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_initialDirectionsResponse"));
    v15 = objc_claimAutoreleasedReturnValue();
    initialDirectionsResponse = v5->_initialDirectionsResponse;
    v5->_initialDirectionsResponse = (GEODirectionsResponse *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("_initialDirectionsRequestError"));
    v20 = objc_claimAutoreleasedReturnValue();
    initialDirectionsRequestError = v5->_initialDirectionsRequestError;
    v5->_initialDirectionsRequestError = (NSError *)v20;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_initialDirectionsRequestTimestamp"));
    v5->_initialDirectionsRequestTimestamp = v22;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_initialDirectionsResponseTimestamp"));
    v5->_initialDirectionsResponseTimestamp = v23;
    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  MNLocation *initialUserLocation;
  id v5;

  initialUserLocation = self->_initialUserLocation;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", initialUserLocation, CFSTR("_initialUserLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_waypoints, CFSTR("_waypoints"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_initialDirectionsRequest, CFSTR("_initialDirectionsRequest"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_initialDirectionsResponse, CFSTR("_initialDirectionsResponse"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_initialDirectionsRequestError, CFSTR("_initialDirectionsRequestError"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_initialDirectionsRequestTimestamp"), self->_initialDirectionsRequestTimestamp);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_initialDirectionsResponseTimestamp"), self->_initialDirectionsResponseTimestamp);

}

- (MNLocation)initialUserLocation
{
  return self->_initialUserLocation;
}

- (void)setInitialUserLocation:(id)a3
{
  objc_storeStrong((id *)&self->_initialUserLocation, a3);
}

- (NSArray)waypoints
{
  return self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
  objc_storeStrong((id *)&self->_waypoints, a3);
}

- (GEODirectionsRequest)initialDirectionsRequest
{
  return self->_initialDirectionsRequest;
}

- (void)setInitialDirectionsRequest:(id)a3
{
  objc_storeStrong((id *)&self->_initialDirectionsRequest, a3);
}

- (GEODirectionsResponse)initialDirectionsResponse
{
  return self->_initialDirectionsResponse;
}

- (void)setInitialDirectionsResponse:(id)a3
{
  objc_storeStrong((id *)&self->_initialDirectionsResponse, a3);
}

- (NSError)initialDirectionsRequestError
{
  return self->_initialDirectionsRequestError;
}

- (void)setInitialDirectionsRequestError:(id)a3
{
  objc_storeStrong((id *)&self->_initialDirectionsRequestError, a3);
}

- (double)initialDirectionsRequestTimestamp
{
  return self->_initialDirectionsRequestTimestamp;
}

- (void)setInitialDirectionsRequestTimestamp:(double)a3
{
  self->_initialDirectionsRequestTimestamp = a3;
}

- (double)initialDirectionsResponseTimestamp
{
  return self->_initialDirectionsResponseTimestamp;
}

- (void)setInitialDirectionsResponseTimestamp:(double)a3
{
  self->_initialDirectionsResponseTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialDirectionsRequestError, 0);
  objc_storeStrong((id *)&self->_initialDirectionsResponse, 0);
  objc_storeStrong((id *)&self->_initialDirectionsRequest, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_initialUserLocation, 0);
}

@end

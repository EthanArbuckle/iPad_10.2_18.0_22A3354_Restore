@implementation ARLocationEstimationData

- (ARLocationEstimationData)initWithCoordinates:(CLLocationCoordinate2D)a3 altitude:(double)a4 heading:(double)a5
{
  double longitude;
  double latitude;
  id v10;
  void *v11;
  void *v12;
  ARLocationEstimationData *v13;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v10 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v11, latitude, longitude, a4, 0.0, 0.0);

  v13 = -[ARLocationEstimationData initWithLocation:heading:](self, "initWithLocation:heading:", v12, a5);
  return v13;
}

- (ARLocationEstimationData)initWithLocation:(id)a3 heading:(double)a4
{
  id v7;
  ARLocationEstimationData *v8;
  ARLocationEstimationData *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ARLocationEstimationData;
  v8 = -[ARLocationEstimationData init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_location, a3);
    v9->_heading = a4 + ceil(a4 / -360.0) * 360.0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ARLocationEstimationData heading](self, "heading");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("ARLocationEstimateData_headingKey"));
  -[ARLocationEstimationData location](self, "location");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ARLocationEstimateData_locationKey"));

}

- (ARLocationEstimationData)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  ARLocationEstimationData *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ARLocationEstimateData_headingKey"));
  v6 = v5;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("ARLocationEstimateData_locationKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ARLocationEstimationData initWithLocation:heading:]([ARLocationEstimationData alloc], "initWithLocation:heading:", v7, v6);
  return v8;
}

- (double)heading
{
  return self->_heading;
}

- (CLLocation)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end

@implementation HMDHomeLocationData

- (HMDHomeLocationData)initWithLocation:(id)a3 locationUpdateTimestamp:(id)a4 locationSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDHomeLocationData *v12;
  HMDHomeLocationData *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDHomeLocationData;
  v12 = -[HMDHomeLocationData init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_location, a3);
    objc_storeStrong((id *)&v13->_locationUpdateTimestamp, a4);
    objc_storeStrong((id *)&v13->_locationSource, a5);
  }

  return v13;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[HMDHomeLocationData location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  locationAsString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeLocationData locationUpdateTimestamp](self, "locationUpdateTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_localTimeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeLocationData locationSource](self, "locationSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HMDHomeLocationSourceToString((int)objc_msgSend(v8, "intValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Loc-Data: %@, Timestamp: %@, Source: %@"), v5, v7, v9);

  return v10;
}

- (HMDHomeLocationData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDHomeLocationData *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeLocation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeLocationNextUpdate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeLocationSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMDHomeLocationData initWithLocation:locationUpdateTimestamp:locationSource:](self, "initWithLocation:locationUpdateTimestamp:locationSource:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDHomeLocationData location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("homeLocation"));

  -[HMDHomeLocationData locationUpdateTimestamp](self, "locationUpdateTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("homeLocationNextUpdate"));

  -[HMDHomeLocationData locationSource](self, "locationSource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("homeLocationSource"));

}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)locationUpdateTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)locationSource
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationSource, 0);
  objc_storeStrong((id *)&self->_locationUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

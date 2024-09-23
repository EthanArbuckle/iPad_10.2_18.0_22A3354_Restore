@implementation ATXTimeEventLocation

- (ATXTimeEventLocation)initWithLocation:(id)a3 title:(id)a4 type:(int64_t)a5
{
  id v8;
  id v9;
  ATXTimeEventLocation *v10;
  uint64_t v11;
  CLLocation *geoLocation;
  uint64_t v13;
  NSString *title;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXTimeEventLocation;
  v10 = -[ATXTimeEventLocation init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    geoLocation = v10->_geoLocation;
    v10->_geoLocation = (CLLocation *)v11;

    v13 = objc_msgSend(v9, "copy");
    title = v10->_title;
    v10->_title = (NSString *)v13;

    v10->_destinationLOIType = a5;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  CLLocation *geoLocation;
  id v5;

  geoLocation = self->_geoLocation;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", geoLocation, CFSTR("geoLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("locationTitle"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_destinationLOIType, CFSTR("LOIType"));

}

- (ATXTimeEventLocation)initWithCoder:(id)a3
{
  id v4;
  ATXTimeEventLocation *v5;
  uint64_t v6;
  CLLocation *geoLocation;
  uint64_t v8;
  NSString *title;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXTimeEventLocation;
  v5 = -[ATXTimeEventLocation init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("geoLocation"));
    v6 = objc_claimAutoreleasedReturnValue();
    geoLocation = v5->_geoLocation;
    v5->_geoLocation = (CLLocation *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v5->_destinationLOIType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("LOIType"));
  }

  return v5;
}

- (BOOL)isApproximatelyEqualTo:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  BOOL v11;

  v4 = a3;
  objc_msgSend(v4, "geoLocation");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[ATXTimeEventLocation geoLocation](self, "geoLocation"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    objc_msgSend(v4, "geoLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXTimeEventLocation geoLocation](self, "geoLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "distanceFromLocation:", v9);
    v11 = v10 < 1000.0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (CLLocation)geoLocation
{
  return self->_geoLocation;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)destinationLOIType
{
  return self->_destinationLOIType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_geoLocation, 0);
}

@end

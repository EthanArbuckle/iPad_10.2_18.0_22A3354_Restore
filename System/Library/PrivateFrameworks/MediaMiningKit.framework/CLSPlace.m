@implementation CLSPlace

- (CLSPlace)initWithPlacemark:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CLSPlace *v12;

  v4 = a3;
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "coordinate");
  v8 = v7;
  objc_msgSend(v5, "coordinate");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<+%f,%f>"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "region");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CLSPlace initWithName:region:placemark:](self, "initWithName:region:placemark:", v10, v11, v4);

  return v12;
}

- (CLSPlace)initWithName:(id)a3 region:(id)a4 placemark:(id)a5
{
  id v7;
  CLSPlace *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  CLCircularRegion *region;
  objc_super v19;

  v7 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CLSPlace;
  v8 = -[CLSPlace init](&v19, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "coordinate");
    v12 = v11;
    objc_msgSend(v9, "coordinate");
    objc_msgSend(v10, "stringWithFormat:", CFSTR("<+%f,%f>"), v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    name = v8->_name;
    v8->_name = (NSString *)v14;

    objc_msgSend(v7, "region");
    v16 = objc_claimAutoreleasedReturnValue();
    region = v8->_region;
    v8->_region = (CLCircularRegion *)v16;

    objc_storeStrong((id *)&v8->_placemark, a5);
  }

  return v8;
}

- (CLLocationCoordinate2D)coordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  -[CLCircularRegion center](self->_region, "center");
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_region, CFSTR("region"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_placemark, CFSTR("placemark"));

}

- (CLSPlace)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CLSPlace *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placemark"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CLSPlace initWithName:region:placemark:](self, "initWithName:region:placemark:", v5, v6, v7);
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)CLSPlace;
  -[CLSPlace description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLCircularRegion center](self->_region, "center");
  v6 = v5;
  -[CLCircularRegion center](self->_region, "center");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: {%f, %f}"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (CLCircularRegion)region
{
  return self->_region;
}

- (CLSLitePlacemark)placemark
{
  return self->_placemark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

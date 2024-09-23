@implementation CPSPointOfInterestAnnotation

- (CPSPointOfInterestAnnotation)initWithPointOfInterest:(id)a3
{
  CPSPointOfInterestAnnotation *v3;
  CPSPointOfInterestAnnotation *v5;
  objc_super v6;
  id location[2];
  CPSPointOfInterestAnnotation *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)CPSPointOfInterestAnnotation;
  v8 = -[CPSPointOfInterestAnnotation init](&v6, sel_init);
  objc_storeStrong((id *)&v8, v8);
  if (v8)
    objc_storeStrong((id *)&v8->_pointOfInterest, location[0]);
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (CLLocationCoordinate2D)coordinate
{
  double v2;
  double v3;
  double v4;
  double v5;
  MKPlacemark *v6;
  MKMapItem *v7;
  CPPointOfInterest *v8;
  double v9;
  double v10;
  CLLocationCoordinate2D result;

  v8 = -[CPSPointOfInterestAnnotation pointOfInterest](self, "pointOfInterest");
  v7 = -[CPPointOfInterest location](v8, "location");
  v6 = -[MKMapItem placemark](v7, "placemark");
  -[MKPlacemark coordinate](v6, "coordinate");
  v9 = v2;
  v10 = v3;

  v4 = v9;
  v5 = v10;
  result.longitude = v5;
  result.latitude = v4;
  return result;
}

- (NSString)title
{
  CPPointOfInterest *v3;
  NSString *v4;

  v3 = -[CPSPointOfInterestAnnotation pointOfInterest](self, "pointOfInterest");
  v4 = -[CPPointOfInterest title](v3, "title");

  return v4;
}

- (NSString)subtitle
{
  return 0;
}

- (NSString)description
{
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;
  CPSPointOfInterestAnnotation *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  SEL v14;
  CPSPointOfInterestAnnotation *v15;
  uint64_t v16;
  uint64_t v17;

  v15 = self;
  v14 = a2;
  v6 = 0x24BDD1000uLL;
  v8 = (id)MEMORY[0x24BDD17C8];
  v2 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v2);
  v7 = v15;
  -[CPSPointOfInterestAnnotation coordinate](v15, "coordinate");
  v12 = v3;
  v13 = v4;
  v16 = v3;
  v17 = v4;
  v9 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v3, v4);
  v11 = (id)objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p %@>"), v10, v7, v9);

  return (NSString *)v11;
}

- (CPPointOfInterest)pointOfInterest
{
  return self->_pointOfInterest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointOfInterest, 0);
}

@end

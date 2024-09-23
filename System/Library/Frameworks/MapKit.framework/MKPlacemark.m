@implementation MKPlacemark

- (MKPlacemark)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
  void *v4;
  MKPlacemark *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", coordinate.latitude, coordinate.longitude);
  v5 = -[MKPlacemark initWithLocation:addressDictionary:region:areasOfInterest:](self, "initWithLocation:addressDictionary:region:areasOfInterest:", v4, 0, 0, 0);

  return v5;
}

- (MKPlacemark)initWithCoordinate:(CLLocationCoordinate2D)coordinate addressDictionary:(NSDictionary *)addressDictionary
{
  double longitude;
  double latitude;
  void *v7;
  void *v8;
  MKPlacemark *v9;

  longitude = coordinate.longitude;
  latitude = coordinate.latitude;
  MKAddressDictionaryFromContactsDictionary(addressDictionary);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", latitude, longitude);
  v9 = -[MKPlacemark initWithLocation:addressDictionary:region:areasOfInterest:](self, "initWithLocation:addressDictionary:region:areasOfInterest:", v8, v7, 0, 0);

  return v9;
}

- (MKPlacemark)initWithCoordinate:(CLLocationCoordinate2D)coordinate postalAddress:(CNPostalAddress *)postalAddress
{
  double longitude;
  double latitude;
  void *v7;
  MKPlacemark *v8;

  longitude = coordinate.longitude;
  latitude = coordinate.latitude;
  MKAddressDictionaryFromPostalAddress(postalAddress);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MKPlacemark initWithCoordinate:addressDictionary:](self, "initWithCoordinate:addressDictionary:", v7, latitude, longitude);

  return v8;
}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;

  -[MKPlacemark formattedAddressLines](self, "formattedAddressLines");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "_mapkit_joinedAddressComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MKPlacemark mkPostalAddressDictionary](self, "mkPostalAddressDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MKAddressStringForAddressDictionary(v5, 1u);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (NSString)subtitle
{
  return 0;
}

- (CLLocationCoordinate2D)coordinate
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  double v10;
  CLLocationCoordinate2D result;

  -[MKPlacemark location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MKPlacemark location](self, "location");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinate");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v8 = 0xC066800000000000;
    v6 = 0xC066800000000000;
  }

  v9 = *(double *)&v6;
  v10 = *(double *)&v8;
  result.longitude = v10;
  result.latitude = v9;
  return result;
}

- (id)thoroughfare
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MKPlacemark;
  -[MKPlacemark thoroughfare](&v8, sel_thoroughfare);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[MKPlacemark fullThoroughfare](self, "fullThoroughfare");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end

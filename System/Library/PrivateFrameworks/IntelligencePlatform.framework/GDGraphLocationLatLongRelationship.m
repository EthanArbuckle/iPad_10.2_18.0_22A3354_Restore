@implementation GDGraphLocationLatLongRelationship

- (GDGraphLocationLatLongRelationship)initWithLatitudeField:(id)a3 longitudeField:(id)a4 allLatitudeField:(id)a5 allLongitudeField:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  GDGraphLocationLatLongRelationship *v15;
  GDGraphLocationLatLongRelationship *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GDGraphLocationLatLongRelationship;
  v15 = -[GDGraphLocationLatLongRelationship init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_latitude, a3);
    objc_storeStrong((id *)&v16->_longitude, a4);
    objc_storeStrong((id *)&v16->_allLatitude, a5);
    objc_storeStrong((id *)&v16->_allLongitude, a6);
  }

  return v16;
}

- (NSNumber)latitude
{
  return self->_latitude;
}

- (NSNumber)longitude
{
  return self->_longitude;
}

- (NSArray)allLatitude
{
  return self->_allLatitude;
}

- (NSArray)allLongitude
{
  return self->_allLongitude;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allLongitude, 0);
  objc_storeStrong((id *)&self->_allLatitude, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
}

@end

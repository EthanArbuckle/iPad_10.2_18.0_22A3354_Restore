@implementation GDGraphLocation

- (GDGraphLocation)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 locationLabelField:(id)a5 latLongField:(id)a6 addressField:(id)a7 identifiersField:(id)a8 muidField:(id)a9 allNameField:(id)a10 allLocationLabelField:(id)a11 allLatLongField:(id)a12 allAddressField:(id)a13 allMuidField:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  GDGraphLocation *v24;
  GDGraphLocation *v25;
  id v28;
  id v29;
  id v30;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v38 = a3;
  v28 = a4;
  v37 = a4;
  v36 = a5;
  v35 = a6;
  v29 = a7;
  v34 = a7;
  v30 = a8;
  v33 = a8;
  v32 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  v23 = a14;
  v39.receiver = self;
  v39.super_class = (Class)GDGraphLocation;
  v24 = -[GDGraphLocation init](&v39, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_entityIdentifier, a3);
    objc_storeStrong((id *)&v25->_name, v28);
    objc_storeStrong((id *)&v25->_locationLabel, a5);
    objc_storeStrong((id *)&v25->_latLong, a6);
    objc_storeStrong((id *)&v25->_address, v29);
    objc_storeStrong((id *)&v25->_identifiers, v30);
    objc_storeStrong((id *)&v25->_muid, a9);
    objc_storeStrong((id *)&v25->_allName, a10);
    objc_storeStrong((id *)&v25->_allLocationLabel, a11);
    objc_storeStrong((id *)&v25->_allLatLong, a12);
    objc_storeStrong((id *)&v25->_allAddress, a13);
    objc_storeStrong((id *)&v25->_allMuid, a14);
  }

  return v25;
}

- (GDGraphLocationEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)locationLabel
{
  return self->_locationLabel;
}

- (GDGraphLocationLatLongRelationship)latLong
{
  return self->_latLong;
}

- (GDGraphLocationAddressRelationship)address
{
  return self->_address;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (NSString)muid
{
  return self->_muid;
}

- (NSArray)allName
{
  return self->_allName;
}

- (NSArray)allLocationLabel
{
  return self->_allLocationLabel;
}

- (NSArray)allLatLong
{
  return self->_allLatLong;
}

- (NSArray)allAddress
{
  return self->_allAddress;
}

- (NSArray)allMuid
{
  return self->_allMuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allMuid, 0);
  objc_storeStrong((id *)&self->_allAddress, 0);
  objc_storeStrong((id *)&self->_allLatLong, 0);
  objc_storeStrong((id *)&self->_allLocationLabel, 0);
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_muid, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_latLong, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

@end

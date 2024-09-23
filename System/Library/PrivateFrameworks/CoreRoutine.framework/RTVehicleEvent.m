@implementation RTVehicleEvent

- (RTVehicleEvent)init
{
  void *v3;
  RTVehicleEvent *v4;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = 0;
  v4 = -[RTVehicleEvent initWithDate:location:vehicleIdentifier:userSetLocation:notes:identifier:photo:mapItem:confirmed:](self, "initWithDate:location:vehicleIdentifier:userSetLocation:notes:identifier:photo:mapItem:confirmed:", 0, 0, 0, 0, 0, v3, 0, 0, v6);

  return v4;
}

- (RTVehicleEvent)initWithDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  RTVehicleEvent *v7;
  uint64_t v9;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = 0;
  v7 = -[RTVehicleEvent initWithDate:location:vehicleIdentifier:userSetLocation:notes:identifier:photo:mapItem:confirmed:](self, "initWithDate:location:vehicleIdentifier:userSetLocation:notes:identifier:photo:mapItem:confirmed:", v5, 0, 0, 0, 0, v6, 0, 0, v9);

  return v7;
}

- (RTVehicleEvent)initWithDate:(id)a3 location:(id)a4 vehicleIdentifier:(id)a5 userSetLocation:(BOOL)a6 notes:(id)a7 identifier:(id)a8 photo:(id)a9 mapItem:(id)a10 confirmed:(BOOL)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  RTVehicleEvent *v23;
  uint64_t v24;
  NSDate *date;
  uint64_t v26;
  RTLocation *location;
  uint64_t v28;
  NSString *vehicleIdentifier;
  uint64_t v30;
  NSString *notes;
  uint64_t v32;
  NSUUID *identifier;
  objc_super v36;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v36.receiver = self;
  v36.super_class = (Class)RTVehicleEvent;
  v23 = -[RTVehicleEvent init](&v36, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v16, "copy");
    date = v23->_date;
    v23->_date = (NSDate *)v24;

    v26 = objc_msgSend(v17, "copy");
    location = v23->_location;
    v23->_location = (RTLocation *)v26;

    v28 = objc_msgSend(v18, "copy");
    vehicleIdentifier = v23->_vehicleIdentifier;
    v23->_vehicleIdentifier = (NSString *)v28;

    v23->_userSetLocation = a6;
    v30 = objc_msgSend(v19, "copy");
    notes = v23->_notes;
    v23->_notes = (NSString *)v30;

    v32 = objc_msgSend(v20, "copy");
    identifier = v23->_identifier;
    v23->_identifier = (NSUUID *)v32;

    objc_storeStrong((id *)&v23->_photo, a9);
    objc_storeStrong((id *)&v23->_mapItem, a10);
    *(_WORD *)&v23->_confirmed = a11;
  }

  return v23;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;

  v18 = (void *)MEMORY[0x1E0CB3940];
  -[RTVehicleEvent date](self, "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleEvent location](self, "location");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleEvent vehicleIdentifier](self, "vehicleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[RTVehicleEvent userSetLocation](self, "userSetLocation");
  -[RTVehicleEvent notes](self, "notes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleEvent identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVehicleEvent mapItem](self, "mapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[RTVehicleEvent locationQuality](self, "locationQuality");
  v9 = -[RTVehicleEvent usualLocation](self, "usualLocation");
  v10 = -[RTVehicleEvent confirmed](self, "confirmed");
  v11 = -[RTVehicleEvent locationFinalized](self, "locationFinalized");
  -[RTVehicleEvent nearbyLocationOfInterest](self, "nearbyLocationOfInterest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("date, %@, location, %@, vehicleIdentifier, %@, userSetLocation, %d, notes, %@, identifier, %@, address, <%@>, quality, %lu, usualLocation, %d, confirmed, %d, locationFinalized, %d, nearbyLocationOfInterest, %@"), v17, v16, v3, v15, v4, v5, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTVehicleEvent)initWithCoder:(id)a3
{
  id v4;
  RTVehicleEvent *v5;
  uint64_t v6;
  NSDate *date;
  uint64_t v8;
  RTLocation *location;
  uint64_t v10;
  NSString *vehicleIdentifier;
  uint64_t v12;
  NSString *notes;
  uint64_t v14;
  NSUUID *identifier;
  uint64_t v16;
  NSData *photo;
  uint64_t v18;
  RTMapItem *mapItem;
  uint64_t v20;
  RTLocationOfInterest *nearbyLocationOfInterest;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RTVehicleEvent;
  v5 = -[RTVehicleEvent init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v8 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (RTLocation *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vehicleIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    vehicleIdentifier = v5->_vehicleIdentifier;
    v5->_vehicleIdentifier = (NSString *)v10;

    v5->_userSetLocation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userSetLocation"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notes"));
    v12 = objc_claimAutoreleasedReturnValue();
    notes = v5->_notes;
    v5->_notes = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photo"));
    v16 = objc_claimAutoreleasedReturnValue();
    photo = v5->_photo;
    v5->_photo = (NSData *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mapItem"));
    v18 = objc_claimAutoreleasedReturnValue();
    mapItem = v5->_mapItem;
    v5->_mapItem = (RTMapItem *)v18;

    v5->_locationQuality = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("locationQuality"));
    v5->_usualLocation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usualLocation"));
    v5->_confirmed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("confirmed"));
    v5->_locationFinalized = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("locationFinalized"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nearbyLocationOfInterest"));
    v20 = objc_claimAutoreleasedReturnValue();
    nearbyLocationOfInterest = v5->_nearbyLocationOfInterest;
    v5->_nearbyLocationOfInterest = (RTLocationOfInterest *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *date;
  id v5;

  date = self->_date;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", date, CFSTR("date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vehicleIdentifier, CFSTR("vehicleIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_userSetLocation, CFSTR("userSetLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_notes, CFSTR("notes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photo, CFSTR("photo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mapItem, CFSTR("mapItem"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_locationQuality, CFSTR("locationQuality"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_usualLocation, CFSTR("usualLocation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_confirmed, CFSTR("confirmed"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_locationFinalized, CFSTR("locationFinalized"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nearbyLocationOfInterest, CFSTR("nearbyLocationOfInterest"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  RTVehicleEvent *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;

  v4 = [RTVehicleEvent alloc];
  LOBYTE(v9) = self->_confirmed;
  v5 = -[RTVehicleEvent initWithDate:location:vehicleIdentifier:userSetLocation:notes:identifier:photo:mapItem:confirmed:](v4, "initWithDate:location:vehicleIdentifier:userSetLocation:notes:identifier:photo:mapItem:confirmed:", self->_date, self->_location, self->_vehicleIdentifier, self->_userSetLocation, self->_notes, self->_identifier, self->_photo, self->_mapItem, v9);
  *(_BYTE *)(v5 + 11) = self->_locationFinalized;
  *(_BYTE *)(v5 + 9) = self->_usualLocation;
  *(_QWORD *)(v5 + 72) = self->_locationQuality;
  v6 = -[RTLocationOfInterest copy](self->_nearbyLocationOfInterest, "copy");
  v7 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RTVehicleEvent *v5;
  RTVehicleEvent *v6;
  RTVehicleEvent *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = (RTVehicleEvent *)a3;
  v6 = v5;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        -[RTVehicleEvent identifier](self, "identifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8
          || (-[RTVehicleEvent identifier](v7, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[RTVehicleEvent identifier](self, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTVehicleEvent identifier](v7, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "isEqual:", v10);

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          v11 = 1;
        }

        goto LABEL_12;
      }
    }
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[RTVehicleEvent identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (RTLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)vehicleIdentifier
{
  return self->_vehicleIdentifier;
}

- (void)setVehicleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)userSetLocation
{
  return self->_userSetLocation;
}

- (void)setUserSetLocation:(BOOL)a3
{
  self->_userSetLocation = a3;
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)photo
{
  return self->_photo;
}

- (void)setPhoto:(id)a3
{
  objc_storeStrong((id *)&self->_photo, a3);
}

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (unint64_t)locationQuality
{
  return self->_locationQuality;
}

- (void)setLocationQuality:(unint64_t)a3
{
  self->_locationQuality = a3;
}

- (BOOL)usualLocation
{
  return self->_usualLocation;
}

- (void)setUsualLocation:(BOOL)a3
{
  self->_usualLocation = a3;
}

- (RTLocationOfInterest)nearbyLocationOfInterest
{
  return self->_nearbyLocationOfInterest;
}

- (void)setNearbyLocationOfInterest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)confirmed
{
  return self->_confirmed;
}

- (void)setConfirmed:(BOOL)a3
{
  self->_confirmed = a3;
}

- (BOOL)locationFinalized
{
  return self->_locationFinalized;
}

- (void)setLocationFinalized:(BOOL)a3
{
  self->_locationFinalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyLocationOfInterest, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_vehicleIdentifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end

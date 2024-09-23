@implementation GEOMapItemCoreRoutineEvent

- (GEOMapItemCoreRoutineEvent)initWithAddressDictionary:(id)a3 eventName:(id)a4 eventTitle:(id)a5 eventDate:(id)a6 eventIsAllDay:(BOOL)a7 coordinate:(id)a8 clientAttributes:(id)a9
{
  double var1;
  double var0;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  GEOMapItemCoreRoutineEvent *v23;
  GEOMapItemCoreRoutineEvent *v24;
  uint64_t v25;
  NSString *eventName;
  uint64_t v27;
  NSString *eventTitle;
  GEOMapItemCoreRoutineEvent *v29;
  objc_super v31;

  var1 = a8.var1;
  var0 = a8.var0;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a9;
  v31.receiver = self;
  v31.super_class = (Class)GEOMapItemCoreRoutineEvent;
  v23 = -[GEOMapItemCoreRoutineEvent init](&v31, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_addressDictionary, a3);
    v25 = objc_msgSend(v19, "copy");
    eventName = v24->_eventName;
    v24->_eventName = (NSString *)v25;

    v27 = objc_msgSend(v20, "copy");
    eventTitle = v24->_eventTitle;
    v24->_eventTitle = (NSString *)v27;

    objc_storeStrong((id *)&v24->_eventDate, a6);
    v24->_eventIsAllDay = a7;
    v24->_coordinate.latitude = var0;
    v24->_coordinate.longitude = var1;
    objc_storeStrong((id *)&v24->_clientAttributes, a9);
    v29 = v24;
  }

  return v24;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[GEOMapItemCoreRoutineEvent coordinate](self, "coordinate");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[GEOMapItemCoreRoutineEvent coordinate](self, "coordinate");
  objc_msgSend(v6, "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapItemCoreRoutineEvent addressDictionary](self, "addressDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v5, CFSTR("latitude"), v8, CFSTR("longitude"), v9, CFSTR("addressDictionary"), self->_clientAttributes, CFSTR("clientAttributes"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)GEOMapItemCoreRoutineEvent;
  -[GEOMapItemCoreRoutineEvent description](&v15, sel_description);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ <%@>"), v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isValid
{
  return 1;
}

- (id)name
{
  return self->_eventName;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (id)addressDictionary
{
  return self->_addressDictionary;
}

- (id)eventName
{
  return self->_eventTitle;
}

- (id)eventDate
{
  return self->_eventDate;
}

- (BOOL)isEventAllDay
{
  return self->_eventIsAllDay;
}

- (BOOL)_hasResolvablePartialInformation
{
  return self->_addressDictionary != 0;
}

- (BOOL)_responseStatusIsIncomplete
{
  return 0;
}

- (id)_place
{
  GEOPlace *place;
  GEOPlace *v4;
  double v5;
  double v6;
  GEOPlace *v7;
  GEOPlace *v8;
  void *v9;

  place = self->_place;
  if (!place)
  {
    v4 = [GEOPlace alloc];
    -[GEOMapItemCoreRoutineEvent coordinate](self, "coordinate");
    v6 = v5;
    -[GEOMapItemCoreRoutineEvent coordinate](self, "coordinate");
    v7 = -[GEOPlace initWithLatitude:longitude:addressDictionary:](v4, "initWithLatitude:longitude:addressDictionary:", self->_addressDictionary, v6);
    v8 = self->_place;
    self->_place = v7;

    -[GEOMapItemCoreRoutineEvent name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPlace setName:](self->_place, "setName:", v9);

    place = self->_place;
  }
  return place;
}

- (id)_clientAttributes
{
  return self->_clientAttributes;
}

- (id)geoAddress
{
  return -[GEOAddress initWithAddressDictionary:]([GEOAddress alloc], "initWithAddressDictionary:", self->_addressDictionary);
}

- (id)addressObject
{
  GEOAddressObject *addressObject;
  void *v4;
  GEOAddressObject *v5;
  GEOAddressObject *v6;

  addressObject = self->_addressObject;
  if (!addressObject)
  {
    -[GEOMapItemCoreRoutineEvent _place](self, "_place");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    GEOAddressObjectOfGEOPlace(v4);
    v5 = (GEOAddressObject *)objc_claimAutoreleasedReturnValue();
    v6 = self->_addressObject;
    self->_addressObject = v5;

    addressObject = self->_addressObject;
  }
  return addressObject;
}

- (id)weatherDisplayName
{
  void *v2;
  void *v3;

  -[GEOMapItemCoreRoutineEvent addressObject](self, "addressObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "weatherDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressObject, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_eventTitle, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_clientAttributes, 0);
  objc_storeStrong((id *)&self->_addressDictionary, 0);
}

@end

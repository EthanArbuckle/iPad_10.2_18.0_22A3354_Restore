@implementation GEOMapItemAssistant

- (GEOMapItemAssistant)initWithWithLocation:(id)a3 addressDictionary:(id)a4 name:(id)a5 businessURL:(id)a6 phoneNumber:(id)a7 sessionID:(id)a8 muid:(unint64_t)a9 attributionID:(id)a10 sampleSizeForUserRatingScore:(unsigned int)a11 normalizedUserRatingScore:(float)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  GEOMapItemAssistant *v24;
  GEOMapItemAssistant *v25;
  uint64_t v26;
  NSString *name;
  uint64_t v28;
  NSURL *businessURL;
  uint64_t v30;
  NSString *phoneNumber;
  uint64_t v32;
  NSString *attributionID;
  GEOMapItemAssistant *v34;
  id v36;
  objc_super v37;

  v19 = a3;
  v36 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a10;
  v37.receiver = self;
  v37.super_class = (Class)GEOMapItemAssistant;
  v24 = -[GEOMapItemAssistant init](&v37, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_location, a3);
    objc_storeStrong((id *)&v25->_addressDictionary, a4);
    v26 = objc_msgSend(v20, "copy");
    name = v25->_name;
    v25->_name = (NSString *)v26;

    v28 = objc_msgSend(v21, "copy");
    businessURL = v25->_businessURL;
    v25->_businessURL = (NSURL *)v28;

    v30 = objc_msgSend(v22, "copy");
    phoneNumber = v25->_phoneNumber;
    v25->_phoneNumber = (NSString *)v30;

    v25->_muid = a9;
    v32 = objc_msgSend(v23, "copy");
    attributionID = v25->_attributionID;
    v25->_attributionID = (NSString *)v32;

    v25->_sampleSizeForUserRatingScore = a11;
    v25->_normalizedUserRatingScore = a12;
    v34 = v25;
  }

  return v25;
}

- (id)description
{
  NSDictionary *addressDictionary;
  NSString *name;
  NSURL *businessURL;
  NSString *phoneNumber;
  void *v7;
  NSString *attributionID;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  GEOLocation *location;
  void *v18;
  objc_super v19;

  location = self->_location;
  v18 = (void *)MEMORY[0x1E0C99D80];
  addressDictionary = self->_addressDictionary;
  name = self->_name;
  businessURL = self->_businessURL;
  phoneNumber = self->_phoneNumber;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_muid);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  attributionID = self->_attributionID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_sampleSizeForUserRatingScore);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = self->_normalizedUserRatingScore;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryWithObjectsAndKeys:", location, CFSTR("location"), addressDictionary, CFSTR("addressDictionary"), name, CFSTR("name"), businessURL, CFSTR("businessURL"), phoneNumber, CFSTR("phoneNumber"), v7, CFSTR("muid"), attributionID, CFSTR("attributionID"), v9, CFSTR("sampleSizeForUserRatingScore"), v11,
    CFSTR("normalizedUserRatingScore"),
    0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3940];
  v19.receiver = self;
  v19.super_class = (Class)GEOMapItemAssistant;
  -[GEOMapItemAssistant description](&v19, sel_description);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ <%@>"), v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isValid
{
  return 1;
}

- (id)name
{
  return self->_name;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  GEOLocation *location;
  double v3;
  double v4;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  location = self->_location;
  if (location)
  {
    -[GEOLocation coordinate](location, "coordinate");
  }
  else
  {
    v3 = -180.0;
    v4 = -180.0;
  }
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

- (id)addressDictionary
{
  return self->_addressDictionary;
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
  GEOPlace *v6;
  GEOPlace *v7;
  uint64_t v9;

  place = self->_place;
  if (!place)
  {
    v4 = [GEOPlace alloc];
    *(float *)&v5 = self->_normalizedUserRatingScore;
    LODWORD(v9) = self->_sampleSizeForUserRatingScore;
    v6 = -[GEOPlace initWithLocation:addressDictionary:name:businessURL:phoneNumber:muid:attributionID:sampleSizeForUserRatingScore:normalizedUserRatingScore:](v4, "initWithLocation:addressDictionary:name:businessURL:phoneNumber:muid:attributionID:sampleSizeForUserRatingScore:normalizedUserRatingScore:", self->_location, self->_addressDictionary, self->_name, self->_businessURL, self->_phoneNumber, self->_muid, v5, self->_attributionID, v9);
    v7 = self->_place;
    self->_place = v6;

    place = self->_place;
  }
  return place;
}

- (id)geoAddress
{
  return -[GEOAddress initWithAddressDictionary:]([GEOAddress alloc], "initWithAddressDictionary:", self->_addressDictionary);
}

- (BOOL)_hasMUID
{
  return self->_muid != 0;
}

- (unint64_t)_muid
{
  return self->_muid;
}

- (id)_businessURL
{
  return -[NSURL absoluteString](self->_businessURL, "absoluteString");
}

- (BOOL)_hasUserRatingScore
{
  return self->_sampleSizeForUserRatingScore != 0;
}

- (unsigned)_sampleSizeForUserRatingScore
{
  return self->_sampleSizeForUserRatingScore;
}

- (float)_normalizedUserRatingScore
{
  return self->_normalizedUserRatingScore * 0.05;
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
    -[GEOMapItemAssistant _place](self, "_place");
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

  -[GEOMapItemAssistant addressObject](self, "addressObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "weatherDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressObject, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_attributionID, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_businessURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_addressDictionary, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end

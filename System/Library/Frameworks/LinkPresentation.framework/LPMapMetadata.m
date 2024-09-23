@implementation LPMapMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPMapMetadata)init
{
  char *v2;
  LPMapMetadata *v3;
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LPMapMetadata;
  v2 = -[LPMapMetadata init](&v6, sel_init);
  v3 = (LPMapMetadata *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 152) = *MEMORY[0x1E0C9E500];
    v4 = v2;
  }

  return v3;
}

- (LPMapMetadata)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  CLLocationDegrees *v11;
  double v12;
  CLLocationDegrees v13;
  CLLocationDegrees v14;
  CLLocationCoordinate2D v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  char *v57;
  objc_super v59;

  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)LPMapMetadata;
  v5 = -[LPMapMetadata init](&v59, sel_init);
  if (v5)
  {
    decodeStringForKey(v4, (uint64_t)CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v6;

    decodeNumberForKey(v4, CFSTR("locationLatitude"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    decodeNumberForKey(v4, CFSTR("locationLongitude"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = (CLLocationDegrees *)(v5 + 152);
    if (v8 && v9)
    {
      objc_msgSend(v8, "doubleValue");
      v13 = v12;
      objc_msgSend(v10, "doubleValue");
      v15 = CLLocationCoordinate2DMake(v13, v14);
      *v11 = v15.latitude;
      *((_QWORD *)v5 + 20) = *(_QWORD *)&v15.longitude;
    }
    else
    {
      *(_OWORD *)v11 = *MEMORY[0x1E0C9E500];
    }
    decodeStringForKey(v4, (uint64_t)CFSTR("address"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClasses:forKey:", v20, CFSTR("addressComponents"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v21;

    decodeStringForKey(v4, (uint64_t)CFSTR("category"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v23;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("categoryIcon"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v25;

    decodeStringForKey(v4, (uint64_t)CFSTR("searchQuery"));
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v27;

    decodeStringForKey(v4, (uint64_t)CFSTR("directionsType"));
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v29;

    decodeNumberForKey(v4, CFSTR("transportType"));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)*((_QWORD *)v5 + 9);
    *((_QWORD *)v5 + 9) = v31;

    decodeStringForKey(v4, (uint64_t)CFSTR("directionsSourceAddress"));
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v33;

    v35 = (void *)MEMORY[0x1E0C99E60];
    v36 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClasses:forKey:", v37, CFSTR("directionsSourceAddressComponents"));
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)*((_QWORD *)v5 + 11);
    *((_QWORD *)v5 + 11) = v38;

    decodeStringForKey(v4, (uint64_t)CFSTR("directionsSourceLocationName"));
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)*((_QWORD *)v5 + 12);
    *((_QWORD *)v5 + 12) = v40;

    decodeStringForKey(v4, (uint64_t)CFSTR("directionsDestinationAddress"));
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)*((_QWORD *)v5 + 13);
    *((_QWORD *)v5 + 13) = v42;

    v44 = (void *)MEMORY[0x1E0C99E60];
    v45 = objc_opt_class();
    objc_msgSend(v44, "setWithObjects:", v45, objc_opt_class(), 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClasses:forKey:", v46, CFSTR("directionsDestinationAddressComponents"));
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = (void *)*((_QWORD *)v5 + 14);
    *((_QWORD *)v5 + 14) = v47;

    decodeStringForKey(v4, (uint64_t)CFSTR("directionsDestinationLocationName"));
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)*((_QWORD *)v5 + 15);
    *((_QWORD *)v5 + 15) = v49;

    decodeNumberForKey(v4, CFSTR("distance"));
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)*((_QWORD *)v5 + 16);
    *((_QWORD *)v5 + 16) = v51;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("image"));
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = (void *)*((_QWORD *)v5 + 17);
    *((_QWORD *)v5 + 17) = v53;

    objc_msgSend(v4, "_lp_strictlyDecodeLPImageForKey:", CFSTR("darkImage"));
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = (void *)*((_QWORD *)v5 + 18);
    *((_QWORD *)v5 + 18) = v55;

    v5[11] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPointOfInterest"));
    v57 = v5;

  }
  return (LPMapMetadata *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", *(_QWORD *)&self->_isPointOfInterest, CFSTR("name"));
  if (CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&self->_darkImage))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&self->_darkImage);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", v4, CFSTR("locationLatitude"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_location.latitude);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", v5, CFSTR("locationLongitude"));

  }
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_name, CFSTR("address"));
  objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", self->_address, CFSTR("addressComponents"));
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_addressComponents, CFSTR("category"));
  objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", self->_category, CFSTR("categoryIcon"));
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_categoryIcon, CFSTR("searchQuery"));
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_searchQuery, CFSTR("directionsType"));
  objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", self->_directionsType, CFSTR("transportType"));
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_transportType, CFSTR("directionsSourceAddress"));
  objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", self->_directionsSourceAddress, CFSTR("directionsSourceAddressComponents"));
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_directionsSourceAddressComponents, CFSTR("directionsSourceLocationName"));
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_directionsSourceLocationName, CFSTR("directionsDestinationAddress"));
  objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", self->_directionsDestinationAddress, CFSTR("directionsDestinationAddressComponents"));
  objc_msgSend(v6, "_lp_encodeStringIfNotNil:forKey:", self->_directionsDestinationAddressComponents, CFSTR("directionsDestinationLocationName"));
  objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", self->_directionsDestinationLocationName, CFSTR("distance"));
  objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", self->_distance, CFSTR("image"));
  objc_msgSend(v6, "_lp_encodeObjectIfNotNil:forKey:", self->_image, CFSTR("darkImage"));
  objc_msgSend(v6, "encodeBool:forKey:", *((unsigned __int8 *)&self->super.__disallowsURLOverrideByDelegate + 1), CFSTR("isPointOfInterest"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  LPMapMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  LPMapMetadata *v22;

  v4 = +[LPMapMetadata allocWithZone:](LPMapMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[LPMapMetadata name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata setName:](v4, "setName:", v5);

    -[LPMapMetadata location](self, "location");
    -[LPMapMetadata setLocation:](v4, "setLocation:");
    -[LPMapMetadata address](self, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata setAddress:](v4, "setAddress:", v6);

    -[LPMapMetadata addressComponents](self, "addressComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata setAddressComponents:](v4, "setAddressComponents:", v7);

    -[LPMapMetadata category](self, "category");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata setCategory:](v4, "setCategory:", v8);

    -[LPMapMetadata categoryIcon](self, "categoryIcon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata setCategoryIcon:](v4, "setCategoryIcon:", v9);

    -[LPMapMetadata searchQuery](self, "searchQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata setSearchQuery:](v4, "setSearchQuery:", v10);

    -[LPMapMetadata directionsType](self, "directionsType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata setDirectionsType:](v4, "setDirectionsType:", v11);

    -[LPMapMetadata transportType](self, "transportType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata setTransportType:](v4, "setTransportType:", v12);

    -[LPMapMetadata directionsSourceAddress](self, "directionsSourceAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata setDirectionsSourceAddress:](v4, "setDirectionsSourceAddress:", v13);

    -[LPMapMetadata directionsSourceAddressComponents](self, "directionsSourceAddressComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata setDirectionsSourceAddressComponents:](v4, "setDirectionsSourceAddressComponents:", v14);

    -[LPMapMetadata directionsSourceLocationName](self, "directionsSourceLocationName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata setDirectionsSourceLocationName:](v4, "setDirectionsSourceLocationName:", v15);

    -[LPMapMetadata directionsDestinationAddress](self, "directionsDestinationAddress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata setDirectionsDestinationAddress:](v4, "setDirectionsDestinationAddress:", v16);

    -[LPMapMetadata directionsDestinationAddressComponents](self, "directionsDestinationAddressComponents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata setDirectionsDestinationAddressComponents:](v4, "setDirectionsDestinationAddressComponents:", v17);

    -[LPMapMetadata directionsDestinationLocationName](self, "directionsDestinationLocationName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata setDirectionsDestinationLocationName:](v4, "setDirectionsDestinationLocationName:", v18);

    -[LPMapMetadata distance](self, "distance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata setDistance:](v4, "setDistance:", v19);

    -[LPMapMetadata image](self, "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata setImage:](v4, "setImage:", v20);

    -[LPMapMetadata darkImage](self, "darkImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata setDarkImage:](v4, "setDarkImage:", v21);

    -[LPMapMetadata setIsPointOfInterest:](v4, "setIsPointOfInterest:", -[LPMapMetadata isPointOfInterest](self, "isPointOfInterest"));
    v22 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  void **v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPMapMetadata;
  if (-[LPMapMetadata isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (void **)v4;
      v5 = (objectsAreEqual_0(v6[2], *(void **)&self->_isPointOfInterest) & 1) != 0
        && *((double *)v6 + 20) == self->_location.latitude
        && *((double *)v6 + 19) == *(double *)&self->_darkImage
        && objectsAreEqual_0(v6[3], self->_name)
        && objectsAreEqual_0(v6[4], self->_address)
        && objectsAreEqual_0(v6[5], self->_addressComponents)
        && objectsAreEqual_0(v6[6], self->_category)
        && objectsAreEqual_0(v6[7], self->_categoryIcon)
        && objectsAreEqual_0(v6[8], self->_searchQuery)
        && objectsAreEqual_0(v6[9], self->_directionsType)
        && objectsAreEqual_0(v6[10], self->_transportType)
        && objectsAreEqual_0(v6[11], self->_directionsSourceAddress)
        && objectsAreEqual_0(v6[12], self->_directionsSourceAddressComponents)
        && objectsAreEqual_0(v6[13], self->_directionsSourceLocationName)
        && objectsAreEqual_0(v6[14], self->_directionsDestinationAddress)
        && objectsAreEqual_0(v6[15], self->_directionsDestinationAddressComponents)
        && objectsAreEqual_0(v6[16], self->_directionsDestinationLocationName)
        && objectsAreEqual_0(v6[17], self->_distance)
        && objectsAreEqual_0(v6[18], self->_image)
        && *((unsigned __int8 *)v6 + 11) == *((unsigned __int8 *)&self->super.__disallowsURLOverrideByDelegate + 1);

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_name, "hash");
}

- (void)_enumerateAsynchronousFields:(id)a3
{
  void (**v3)(id, const __CFString *);

  v3 = (void (**)(id, const __CFString *))a3;
  v3[2](v3, CFSTR("image"));
  v3[2](v3, CFSTR("darkImage"));
  v3[2](v3, CFSTR("categoryIcon"));

}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("name"), CFSTR("location"), CFSTR("address"), CFSTR("addressComponents"), CFSTR("category"), CFSTR("categoryIcon"), CFSTR("searchQuery"), CFSTR("directionsType"), CFSTR("transportType"), CFSTR("directionsSourceAddress"), CFSTR("directionsSourceAddressComponents"), CFSTR("directionsSourceLocationName"), CFSTR("directionsDestinationAddress"), CFSTR("directionsDestinationAddressComponents"), CFSTR("directionsDestinationLocationName"), CFSTR("distance"), CFSTR("image"),
               CFSTR("darkImage"),
               CFSTR("isPointOfInterest"),
               0);
}

- (NSString)name
{
  return *(NSString **)&self->_isPointOfInterest;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CLLocationCoordinate2D)location
{
  LPImage *darkImage;
  double latitude;
  CLLocationCoordinate2D result;

  darkImage = self->_darkImage;
  latitude = self->_location.latitude;
  result.longitude = latitude;
  result.latitude = *(double *)&darkImage;
  return result;
}

- (void)setLocation:(CLLocationCoordinate2D)a3
{
  *(CLLocationCoordinate2D *)&self->_darkImage = a3;
}

- (NSString)address
{
  return self->_name;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CNPostalAddress)addressComponents
{
  return (CNPostalAddress *)self->_address;
}

- (void)setAddressComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)category
{
  return (NSString *)&self->_addressComponents->super.isa;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (LPImage)categoryIcon
{
  return (LPImage *)self->_category;
}

- (void)setCategoryIcon:(id)a3
{
  objc_storeStrong((id *)&self->_category, a3);
}

- (NSString)searchQuery
{
  return (NSString *)&self->_categoryIcon->super.isa;
}

- (void)setSearchQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)directionsType
{
  return self->_searchQuery;
}

- (void)setDirectionsType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)transportType
{
  return (NSNumber *)self->_directionsType;
}

- (void)setTransportType:(id)a3
{
  objc_storeStrong((id *)&self->_directionsType, a3);
}

- (NSString)directionsSourceAddress
{
  return (NSString *)&self->_transportType->super.super.isa;
}

- (void)setDirectionsSourceAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CNPostalAddress)directionsSourceAddressComponents
{
  return (CNPostalAddress *)self->_directionsSourceAddress;
}

- (void)setDirectionsSourceAddressComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)directionsSourceLocationName
{
  return (NSString *)&self->_directionsSourceAddressComponents->super.isa;
}

- (void)setDirectionsSourceLocationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)directionsDestinationAddress
{
  return self->_directionsSourceLocationName;
}

- (void)setDirectionsDestinationAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (CNPostalAddress)directionsDestinationAddressComponents
{
  return (CNPostalAddress *)self->_directionsDestinationAddress;
}

- (void)setDirectionsDestinationAddressComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)directionsDestinationLocationName
{
  return (NSString *)&self->_directionsDestinationAddressComponents->super.isa;
}

- (void)setDirectionsDestinationLocationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)distance
{
  return (NSNumber *)self->_directionsDestinationLocationName;
}

- (void)setDistance:(id)a3
{
  objc_storeStrong((id *)&self->_directionsDestinationLocationName, a3);
}

- (LPImage)image
{
  return (LPImage *)self->_distance;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_distance, a3);
}

- (LPImage)darkImage
{
  return self->_image;
}

- (void)setDarkImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (BOOL)isPointOfInterest
{
  return *(&self->super.__disallowsURLOverrideByDelegate + 1);
}

- (void)setIsPointOfInterest:(BOOL)a3
{
  *(&self->super.__disallowsURLOverrideByDelegate + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_directionsDestinationLocationName, 0);
  objc_storeStrong((id *)&self->_directionsDestinationAddressComponents, 0);
  objc_storeStrong((id *)&self->_directionsDestinationAddress, 0);
  objc_storeStrong((id *)&self->_directionsSourceLocationName, 0);
  objc_storeStrong((id *)&self->_directionsSourceAddressComponents, 0);
  objc_storeStrong((id *)&self->_directionsSourceAddress, 0);
  objc_storeStrong((id *)&self->_transportType, 0);
  objc_storeStrong((id *)&self->_directionsType, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_categoryIcon, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_addressComponents, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_isPointOfInterest, 0);
}

- (id)_address
{
  void *v3;
  void *v4;
  void *v5;

  -[LPMapMetadata addressComponents](self, "addressComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPMapMetadata address](self, "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  formattedAddressWithFallback(v3, v4, -[LPMapMetadata isPointOfInterest](self, "isPointOfInterest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_directionsSourceAddress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[LPMapMetadata directionsSourceLocationName](self, "directionsSourceLocationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[LPMapMetadata directionsSourceLocationName](self, "directionsSourceLocationName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[LPMapMetadata directionsSourceAddressComponents](self, "directionsSourceAddressComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata directionsSourceAddress](self, "directionsSourceAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    formattedAddressWithFallback(v5, v6, -[LPMapMetadata isPointOfInterest](self, "isPointOfInterest"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_directionsDestinationAddress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[LPMapMetadata directionsDestinationLocationName](self, "directionsDestinationLocationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[LPMapMetadata directionsDestinationLocationName](self, "directionsDestinationLocationName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[LPMapMetadata directionsDestinationAddressComponents](self, "directionsDestinationAddressComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata directionsDestinationAddress](self, "directionsDestinationAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    formattedAddressWithFallback(v5, v6, -[LPMapMetadata isPointOfInterest](self, "isPointOfInterest"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)_isDirections
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;

  -[LPMapMetadata directionsSourceAddress](self, "directionsSourceAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[LPMapMetadata directionsSourceAddressComponents](self, "directionsSourceAddressComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      -[LPMapMetadata directionsDestinationAddress](self, "directionsDestinationAddress");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v4 = 1;
      }
      else
      {
        -[LPMapMetadata directionsDestinationAddressComponents](self, "directionsDestinationAddressComponents");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = v7 != 0;

      }
    }

  }
  return v4;
}

- (id)_name
{
  void *v3;
  void *v4;
  void *v5;

  -[LPMapMetadata name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[LPMapMetadata name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[LPMapMetadata addressComponents](self, "addressComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[LPMapMetadata addressComponents](self, "addressComponents");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "street");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v4;
}

- (id)_deduplicatedAddress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[LPMapMetadata _address](self, "_address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPMapMetadata _name](self, "_name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") && objc_msgSend(v3, "_lp_hasCaseInsensitivePrefix:", v4))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v4, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_singleLineShortDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;

  -[LPMapMetadata searchQuery](self, "searchQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[LPMapMetadata _directionsDestinationAddress](self, "_directionsDestinationAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      LPLocalizedString(CFSTR("Directions to %@"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPMapMetadata _directionsDestinationAddress](self, "_directionsDestinationAddress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[LPMapMetadata _directionsSourceAddress](self, "_directionsSourceAddress");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        -[LPMapMetadata _name](self, "_name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v5 = 0;
          return v5;
        }
        -[LPMapMetadata _name](self, "_name");
        v4 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      v12 = (void *)MEMORY[0x1E0CB3940];
      LPLocalizedString(CFSTR("Directions from %@"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPMapMetadata _directionsSourceAddress](self, "_directionsSourceAddress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v10;

    return v5;
  }
  -[LPMapMetadata searchQuery](self, "searchQuery");
  v4 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v5 = (void *)v4;
  return v5;
}

- (id)_singleLineVerboseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  -[LPMapMetadata searchQuery](self, "searchQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    LPLocalizedString(CFSTR("Search for “%@”"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPMapMetadata searchQuery](self, "searchQuery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[LPMapMetadata _directionsDestinationAddress](self, "_directionsDestinationAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      LPLocalizedString(CFSTR("Directions to %@"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPMapMetadata _directionsDestinationAddress](self, "_directionsDestinationAddress");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v5, v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[LPMapMetadata _directionsSourceAddress](self, "_directionsSourceAddress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        -[LPMapMetadata _name](self, "_name");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPMapMetadata _deduplicatedAddress](self, "_deduplicatedAddress");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        joinedBySpace(v5, v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }
      v11 = (void *)MEMORY[0x1E0CB3940];
      LPLocalizedString(CFSTR("Directions from %@"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPMapMetadata _directionsSourceAddress](self, "_directionsSourceAddress");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v5, v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
  }
  v12 = (void *)v7;
LABEL_8:

  return v12;
}

- (id)_topLineForTransformer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[LPMapMetadata searchQuery](self, "searchQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[LPMapMetadata searchQuery](self, "searchQuery");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v8 = (void *)v6;
    goto LABEL_9;
  }
  if (!-[LPMapMetadata _isDirections](self, "_isDirections"))
  {
    -[LPMapMetadata _name](self, "_name");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "effectiveSizeClass") == 2)
  {
    -[LPMapMetadata distance](self, "distance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[LPMapMetadata _singleLineVerboseDescription](self, "_singleLineVerboseDescription");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  -[LPMapMetadata _directionsDestinationAddress](self, "_directionsDestinationAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    -[LPMapMetadata _directionsSourceAddress](self, "_directionsSourceAddress");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v12;

LABEL_9:
  return v8;
}

- (id)_bottomLineForTwoUpForTransformer:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[LPMapMetadata category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[LPMapMetadata category](self, "category");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:", v7);

  }
  if (-[LPMapMetadata _isDirections](self, "_isDirections"))
  {
    -[LPMapMetadata distance](self, "distance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v18 = 0;
      v19 = &v18;
      v20 = 0x2050000000;
      v9 = (void *)getMKDistanceFormatterClass_softClass;
      v21 = getMKDistanceFormatterClass_softClass;
      if (!getMKDistanceFormatterClass_softClass)
      {
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __getMKDistanceFormatterClass_block_invoke;
        v17[3] = &unk_1E44A7DB0;
        v17[4] = &v18;
        __getMKDistanceFormatterClass_block_invoke((uint64_t)v17);
        v9 = (void *)v19[3];
      }
      v10 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v18, 8);
      v11 = (void *)objc_msgSend([v10 alloc], "init");
      if (objc_msgSend(v5, "length"))
        objc_msgSend(v5, "appendString:", CFSTR(" · "));
      -[LPMapMetadata distance](self, "distance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      objc_msgSend(v11, "stringFromDistance:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendString:", v13);

      goto LABEL_17;
    }
    if (!objc_msgSend(v5, "length"))
    {
      LPLocalizedString(CFSTR("Directions"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendString:", v11);
LABEL_17:

    }
  }
  else
  {
    -[LPMapMetadata addressComponents](self, "addressComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[LPMapMetadata addressComponents](self, "addressComponents");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      cityAndState(v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "length"))
      {
        if (objc_msgSend(v5, "length"))
          objc_msgSend(v5, "appendString:", CFSTR(" · "));
        objc_msgSend(v5, "appendString:", v11);
      }
      goto LABEL_17;
    }
  }

  return v5;
}

- (int64_t)_style
{
  void *v2;
  int64_t v3;

  -[LPMapMetadata searchQuery](self, "searchQuery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = 32;
  else
    v3 = 31;

  return v3;
}

- (id)_resolvedImage
{
  void *v3;
  id v4;
  LPImage *v5;
  void *v6;
  void *v7;

  -[LPMapMetadata image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "platformImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [LPImage alloc];
    -[LPMapMetadata image](self, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[LPImage _initWithImage:](v5, "_initWithImage:", v6);

    -[LPMapMetadata darkImage](self, "darkImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setDarkInterfaceAlternativeImage:", v7);

  }
  return v4;
}

- (id)_iconForTransport
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[LPMapMetadata transportType](self, "transportType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[LPMapMetadata transportType](self, "transportType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    switch(v5)
    {
      case 1:
        +[LPResources transportTransitIcon](LPResources, "transportTransitIcon");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 2:
        +[LPResources transportWalkIcon](LPResources, "transportWalkIcon");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        +[LPResources transportBicycleIcon](LPResources, "transportBicycleIcon");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_3;
    }
  }
  else
  {
LABEL_3:
    +[LPResources transportDriveIcon](LPResources, "transportDriveIcon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)presentationPropertiesForTransformer:(id)a3
{
  id v4;
  void *v5;
  LPCaptionBarPresentationProperties *v6;
  LPImagePresentationProperties *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;

  v4 = a3;
  objc_msgSend(v4, "commonPresentationPropertiesForStyle:", -[LPMapMetadata _style](self, "_style"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(LPCaptionBarPresentationProperties);
  objc_msgSend(v5, "setCaptionBar:", v6);

  if (-[LPMapMetadata _isDirections](self, "_isDirections"))
  {
    v7 = objc_alloc_init(LPImagePresentationProperties);
    if (!sizeClassRequiresLargeMedia(objc_msgSend(v4, "effectiveSizeClass"))
      && objc_msgSend(v4, "effectiveSizeClass") != 10)
    {
      -[LPImagePresentationProperties setFilter:](v7, "setFilter:", 12);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPImagePresentationProperties setBackgroundColor:](v7, "setBackgroundColor:", v8);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPImagePresentationProperties setMaskColor:](v7, "setMaskColor:", v9);

      -[LPImagePresentationProperties setShouldApplyBackground:](v7, "setShouldApplyBackground:", 1);
    }
    -[LPMapMetadata _iconForTransport](self, "_iconForTransport");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_populateProperties:withPrimaryIcon:iconProperties:", v5, v10, v7);

  }
  else
  {
    if (objc_msgSend(v4, "_prefersImageAsIconWithStyle:", -[LPMapMetadata _style](self, "_style"))
      && (-[LPMapMetadata categoryIcon](self, "categoryIcon"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v11))
    {
      -[LPMapMetadata categoryIcon](self, "categoryIcon");
      v7 = (LPImagePresentationProperties *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[LPMapMetadata _resolvedImage](self, "_resolvedImage");
      v7 = (LPImagePresentationProperties *)objc_claimAutoreleasedReturnValue();
      -[LPMapMetadata darkImage](self, "darkImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[LPMapMetadata darkImage](self, "darkImage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPImagePresentationProperties _setDarkInterfaceAlternativeImage:](v7, "_setDarkInterfaceAlternativeImage:", v13);

      }
    }
    objc_msgSend(v4, "_populateProperties:withPrimaryImage:", v5, v7);
  }

  objc_msgSend(v4, "effectiveSizeClass");
  populatePropertiesForVisualRefresh(v5);
  switch(objc_msgSend(v4, "_rowConfigurationForStyle:", objc_msgSend(v5, "style")))
  {
    case 0:
      LPLocalizedString(CFSTR(" Maps"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[LPMapMetadata _singleLineShortDescription](self, "_singleLineShortDescription");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v15)
        v17 = (void *)v15;
      else
        v17 = v14;
      objc_msgSend(v5, "captionBar");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "top");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "leading");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setText:", v17);
      goto LABEL_37;
    case 1:
      -[LPMapMetadata _topLineForTransformer:](self, "_topLineForTransformer:", v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "captionBar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "top");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "leading");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setText:", v21);

      -[LPMapMetadata _bottomLineForTwoUpForTransformer:](self, "_bottomLineForTwoUpForTransformer:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "effectiveSizeClass") != 2)
      {
        LPLocalizedString(CFSTR(" Maps"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        joinedByDot(v16, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "captionBar");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "bottom");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "leading");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setText:", v18);
        goto LABEL_36;
      }
      v16 = v14;
      if (!v14)
      {
        LPLocalizedString(CFSTR(" Maps"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v5, "captionBar");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "bottom");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "leading");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setText:", v16);

      if (!v14)
        goto LABEL_39;
      goto LABEL_40;
    case 2:
      -[LPMapMetadata _topLineForTransformer:](self, "_topLineForTransformer:", v4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "captionBar");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "top");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "leading");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setText:", v28);

      -[LPMapMetadata _bottomLineForTwoUpForTransformer:](self, "_bottomLineForTwoUpForTransformer:", v4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "captionBar");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "bottom");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "leading");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setText:", v32);

      LPLocalizedString(CFSTR(" Maps"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "captionBar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "belowBottom");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "leading");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setText:", v14);
      goto LABEL_38;
    case 3:
      -[LPMapMetadata _topLineForTransformer:](self, "_topLineForTransformer:", v4);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[LPMapMetadata _isDirections](self, "_isDirections"))
      {
        LPLocalizedString(CFSTR("Directions"));
        v37 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[LPMapMetadata searchQuery](self, "searchQuery");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          v16 = 0;
          goto LABEL_30;
        }
        -[LPMapMetadata _deduplicatedAddress](self, "_deduplicatedAddress");
        v37 = objc_claimAutoreleasedReturnValue();
      }
      v16 = (void *)v37;
LABEL_30:
      objc_msgSend(v4, "metadata");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "URL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = +[LPPresentationSpecializations isMuninURL:](LPPresentationSpecializations, "isMuninURL:", v41);

      if (v42)
      {
        LPLocalizedString(CFSTR("Look Around"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "captionBar");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "aboveTop");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "leading");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setText:", v43);

        -[LPMapMetadata _name](self, "_name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
LABEL_32:
          objc_msgSend(v5, "captionBar");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "top");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "leading");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setText:", v16);
          goto LABEL_35;
        }
      }
      else
      {
        v14 = v36;
        if (!v36)
          goto LABEL_32;
      }
      objc_msgSend(v5, "captionBar");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "top");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "leading");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setText:", v14);

      objc_msgSend(v5, "captionBar");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "bottom");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "leading");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setText:", v16);
LABEL_35:

      LPLocalizedString(CFSTR(" Maps"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "captionBar");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "belowBottom");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "leading");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setText:", v18);
LABEL_36:

LABEL_37:
LABEL_38:

LABEL_39:
LABEL_40:

LABEL_41:
      return v5;
    default:
      goto LABEL_41;
  }
}

- (BOOL)canGeneratePresentationPropertiesForURL:(id)a3
{
  return +[LPPresentationSpecializations isAppleMapsURL:](LPPresentationSpecializations, "isAppleMapsURL:", a3);
}

- (id)previewSummaryForTransformer:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  LPLocalizedString(CFSTR("Location: %@"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPMapMetadata _name](self, "_name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    -[LPMapMetadata _singleLineVerboseDescription](self, "_singleLineVerboseDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "stringWithFormat:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)

  return v8;
}

- (id)previewImageForTransformer:(id)a3
{
  -[LPMapMetadata image](self, "image", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fallbackIconForTransformer:(id)a3
{
  if (-[LPMapMetadata _isDirections](self, "_isDirections", a3))
    -[LPMapMetadata _iconForTransport](self, "_iconForTransport");
  else
    +[LPResources mapIcon](LPResources, "mapIcon");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)populateMetadataForBackwardCompatibility:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[LPMapMetadata _singleLineVerboseDescription](self, "_singleLineVerboseDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v4);

  -[LPMapMetadata image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

}

@end

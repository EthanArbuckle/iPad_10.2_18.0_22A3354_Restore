@implementation _BlastDoorLPMapMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_BlastDoorLPMapMetadata)init
{
  _BlastDoorLPMapMetadata *v2;
  _BlastDoorLPMapMetadata *v3;
  _BlastDoorLPMapMetadata *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)_BlastDoorLPMapMetadata;
  v2 = -[_BlastDoorLPMapMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_storeFrontImage = *MEMORY[0x1E0C9E500];
    v4 = v2;
  }

  return v3;
}

- (_BlastDoorLPMapMetadata)initWithCoder:(id)a3
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
  uint64_t v57;
  void *v58;
  char *v59;
  objc_super v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)_BlastDoorLPMapMetadata;
  v5 = -[_BlastDoorLPMapMetadata init](&v61, sel_init);
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
    v11 = (CLLocationDegrees *)(v5 + 160);
    if (v8 && v9)
    {
      objc_msgSend(v8, "doubleValue");
      v13 = v12;
      objc_msgSend(v10, "doubleValue");
      v15 = CLLocationCoordinate2DMake(v13, v14);
      *v11 = v15.latitude;
      *((_QWORD *)v5 + 21) = *(_QWORD *)&v15.longitude;
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
    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v20, CFSTR("addressComponents"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v21;

    decodeStringForKey(v4, (uint64_t)CFSTR("category"));
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v23;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("categoryIcon"));
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
    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v37, CFSTR("directionsSourceAddressComponents"));
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
    objc_msgSend(v4, "_bd_lp_strictlyDecodeObjectOfClasses:forKey:", v46, CFSTR("directionsDestinationAddressComponents"));
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

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("image"));
    v53 = objc_claimAutoreleasedReturnValue();
    v54 = (void *)*((_QWORD *)v5 + 17);
    *((_QWORD *)v5 + 17) = v53;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("darkImage"));
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = (void *)*((_QWORD *)v5 + 18);
    *((_QWORD *)v5 + 18) = v55;

    objc_msgSend(v4, "_bd_lp_strictlyDecodeLPImageForKey:", CFSTR("storeFront"));
    v57 = objc_claimAutoreleasedReturnValue();
    v58 = (void *)*((_QWORD *)v5 + 19);
    *((_QWORD *)v5 + 19) = v57;

    v5[9] = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPointOfInterest"));
    v59 = v5;

  }
  return (_BlastDoorLPMapMetadata *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", *(_QWORD *)&self->_isPointOfInterest, CFSTR("name"));
  if (CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&self->_storeFrontImage))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&self->_storeFrontImage);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v4, CFSTR("locationLatitude"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_location.latitude);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", v5, CFSTR("locationLongitude"));

  }
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_name, CFSTR("address"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_address, CFSTR("addressComponents"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_addressComponents, CFSTR("category"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_category, CFSTR("categoryIcon"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_categoryIcon, CFSTR("searchQuery"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_searchQuery, CFSTR("directionsType"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_directionsType, CFSTR("transportType"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_transportType, CFSTR("directionsSourceAddress"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_directionsSourceAddress, CFSTR("directionsSourceAddressComponents"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_directionsSourceAddressComponents, CFSTR("directionsSourceLocationName"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_directionsSourceLocationName, CFSTR("directionsDestinationAddress"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_directionsDestinationAddress, CFSTR("directionsDestinationAddressComponents"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_directionsDestinationAddressComponents, CFSTR("directionsDestinationLocationName"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_directionsDestinationLocationName, CFSTR("distance"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_distance, CFSTR("image"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_image, CFSTR("darkImage"));
  objc_msgSend(v6, "_bd_lp_encodeObjectIfNotNil:forKey:", self->_darkImage, CFSTR("storeFront"));
  objc_msgSend(v6, "encodeBool:forKey:", *((unsigned __int8 *)&self->super.__dummyPropertyForObservation + 1), CFSTR("isPointOfInterest"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPMapMetadata *v4;
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
  void *v22;
  _BlastDoorLPMapMetadata *v23;

  v4 = +[_BlastDoorLPMapMetadata allocWithZone:](_BlastDoorLPMapMetadata, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPMapMetadata name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapMetadata setName:](v4, "setName:", v5);

    -[_BlastDoorLPMapMetadata location](self, "location");
    -[_BlastDoorLPMapMetadata setLocation:](v4, "setLocation:");
    -[_BlastDoorLPMapMetadata address](self, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapMetadata setAddress:](v4, "setAddress:", v6);

    -[_BlastDoorLPMapMetadata addressComponents](self, "addressComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapMetadata setAddressComponents:](v4, "setAddressComponents:", v7);

    -[_BlastDoorLPMapMetadata category](self, "category");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapMetadata setCategory:](v4, "setCategory:", v8);

    -[_BlastDoorLPMapMetadata categoryIcon](self, "categoryIcon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapMetadata setCategoryIcon:](v4, "setCategoryIcon:", v9);

    -[_BlastDoorLPMapMetadata searchQuery](self, "searchQuery");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapMetadata setSearchQuery:](v4, "setSearchQuery:", v10);

    -[_BlastDoorLPMapMetadata directionsType](self, "directionsType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapMetadata setDirectionsType:](v4, "setDirectionsType:", v11);

    -[_BlastDoorLPMapMetadata transportType](self, "transportType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapMetadata setTransportType:](v4, "setTransportType:", v12);

    -[_BlastDoorLPMapMetadata directionsSourceAddress](self, "directionsSourceAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapMetadata setDirectionsSourceAddress:](v4, "setDirectionsSourceAddress:", v13);

    -[_BlastDoorLPMapMetadata directionsSourceAddressComponents](self, "directionsSourceAddressComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapMetadata setDirectionsSourceAddressComponents:](v4, "setDirectionsSourceAddressComponents:", v14);

    -[_BlastDoorLPMapMetadata directionsSourceLocationName](self, "directionsSourceLocationName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapMetadata setDirectionsSourceLocationName:](v4, "setDirectionsSourceLocationName:", v15);

    -[_BlastDoorLPMapMetadata directionsDestinationAddress](self, "directionsDestinationAddress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapMetadata setDirectionsDestinationAddress:](v4, "setDirectionsDestinationAddress:", v16);

    -[_BlastDoorLPMapMetadata directionsDestinationAddressComponents](self, "directionsDestinationAddressComponents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapMetadata setDirectionsDestinationAddressComponents:](v4, "setDirectionsDestinationAddressComponents:", v17);

    -[_BlastDoorLPMapMetadata directionsDestinationLocationName](self, "directionsDestinationLocationName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapMetadata setDirectionsDestinationLocationName:](v4, "setDirectionsDestinationLocationName:", v18);

    -[_BlastDoorLPMapMetadata distance](self, "distance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapMetadata setDistance:](v4, "setDistance:", v19);

    -[_BlastDoorLPMapMetadata image](self, "image");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapMetadata setImage:](v4, "setImage:", v20);

    -[_BlastDoorLPMapMetadata darkImage](self, "darkImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapMetadata setDarkImage:](v4, "setDarkImage:", v21);

    -[_BlastDoorLPMapMetadata storeFrontImage](self, "storeFrontImage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BlastDoorLPMapMetadata setStoreFrontImage:](v4, "setStoreFrontImage:", v22);

    -[_BlastDoorLPMapMetadata setIsPointOfInterest:](v4, "setIsPointOfInterest:", -[_BlastDoorLPMapMetadata isPointOfInterest](self, "isPointOfInterest"));
    v23 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  double *v6;
  unint64_t v7;
  double *v8;
  double v9;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  objc_super v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)_BlastDoorLPMapMetadata;
  if (-[_BlastDoorLPMapMetadata isEqual:](&v28, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (double *)v4;
      v7 = *((_QWORD *)v6 + 2);
      if (v7 | *(_QWORD *)&self->_isPointOfInterest && !objc_msgSend((id)v7, "isEqual:"))
        goto LABEL_8;
      v8 = v6 + 20;
      if (v6[21] != self->_location.latitude)
        goto LABEL_8;
      v9 = *v8;
      if (*v8 != *(double *)&self->_storeFrontImage)
        goto LABEL_8;
      v11 = *((_QWORD *)v6 + 3);
      if (v11 | (unint64_t)self->_name)
      {
        if (!objc_msgSend((id)v11, "isEqual:", v9))
          goto LABEL_8;
      }
      v12 = *((_QWORD *)v6 + 4);
      if (v12 | (unint64_t)self->_address && !objc_msgSend((id)v12, "isEqual:", v9))
        goto LABEL_8;
      v13 = *((_QWORD *)v6 + 5);
      if (v13 | (unint64_t)self->_addressComponents && !objc_msgSend((id)v13, "isEqual:", v9))
        goto LABEL_8;
      v14 = *((_QWORD *)v6 + 6);
      if (v14 | (unint64_t)self->_category && !objc_msgSend((id)v14, "isEqual:", v9))
        goto LABEL_8;
      v15 = *((_QWORD *)v6 + 7);
      if (v15 | (unint64_t)self->_categoryIcon && !objc_msgSend((id)v15, "isEqual:", v9))
        goto LABEL_8;
      v16 = *((_QWORD *)v6 + 8);
      if (v16 | (unint64_t)self->_searchQuery && !objc_msgSend((id)v16, "isEqual:", v9))
        goto LABEL_8;
      v17 = *((_QWORD *)v6 + 9);
      if (v17 | (unint64_t)self->_directionsType && !objc_msgSend((id)v17, "isEqual:", v9))
        goto LABEL_8;
      v18 = *((_QWORD *)v6 + 10);
      if (v18 | (unint64_t)self->_transportType && !objc_msgSend((id)v18, "isEqual:", v9))
        goto LABEL_8;
      v19 = *((_QWORD *)v6 + 11);
      if (v19 | (unint64_t)self->_directionsSourceAddress
        && !objc_msgSend((id)v19, "isEqual:", v9))
      {
        goto LABEL_8;
      }
      v20 = *((_QWORD *)v6 + 12);
      if (v20 | (unint64_t)self->_directionsSourceAddressComponents
        && !objc_msgSend((id)v20, "isEqual:", v9))
      {
        goto LABEL_8;
      }
      if (((v21 = *((_QWORD *)v6 + 13), !(v21 | (unint64_t)self->_directionsSourceLocationName))
         || objc_msgSend((id)v21, "isEqual:", v9))
        && ((v22 = *((_QWORD *)v6 + 14), !(v22 | (unint64_t)self->_directionsDestinationAddress))
         || objc_msgSend((id)v22, "isEqual:", v9))
        && ((v23 = *((_QWORD *)v6 + 15), !(v23 | (unint64_t)self->_directionsDestinationAddressComponents))
         || objc_msgSend((id)v23, "isEqual:", v9))
        && ((v24 = *((_QWORD *)v6 + 16), !(v24 | (unint64_t)self->_directionsDestinationLocationName))
         || objc_msgSend((id)v24, "isEqual:", v9))
        && ((v25 = *((_QWORD *)v6 + 17), !(v25 | (unint64_t)self->_distance))
         || objc_msgSend((id)v25, "isEqual:", v9))
        && ((v26 = *((_QWORD *)v6 + 18), !(v26 | (unint64_t)self->_image))
         || objc_msgSend((id)v26, "isEqual:", v9))
        && ((v27 = *((_QWORD *)v6 + 19), !(v27 | (unint64_t)self->_darkImage))
         || objc_msgSend((id)v27, "isEqual:", v9)))
      {
        v5 = *((unsigned __int8 *)v6 + 9) == *((unsigned __int8 *)&self->super.__dummyPropertyForObservation + 1);
      }
      else
      {
LABEL_8:
        v5 = 0;
      }

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
  void (*v4)(void);
  id v5;

  v4 = (void (*)(void))*((_QWORD *)a3 + 2);
  v5 = a3;
  v4();
  (*((void (**)(id, const __CFString *))a3 + 2))(v5, CFSTR("darkImage"));
  (*((void (**)(id, const __CFString *))a3 + 2))(v5, CFSTR("storeFrontImage"));
  (*((void (**)(id, const __CFString *))a3 + 2))(v5, CFSTR("categoryIcon"));

}

+ (id)keyPathsForValuesAffecting_dummyPropertyForObservation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("name"), CFSTR("location"), CFSTR("address"), CFSTR("addressComponents"), CFSTR("category"), CFSTR("categoryIcon"), CFSTR("searchQuery"), CFSTR("directionsType"), CFSTR("transportType"), CFSTR("directionsSourceAddress"), CFSTR("directionsSourceAddressComponents"), CFSTR("directionsSourceLocationName"), CFSTR("directionsDestinationAddress"), CFSTR("directionsDestinationAddressComponents"), CFSTR("directionsDestinationLocationName"), CFSTR("distance"), CFSTR("image"),
               CFSTR("darkImage"),
               CFSTR("storeFrontImage"),
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
  _BlastDoorLPImage *storeFrontImage;
  double latitude;
  CLLocationCoordinate2D result;

  storeFrontImage = self->_storeFrontImage;
  latitude = self->_location.latitude;
  result.longitude = latitude;
  result.latitude = *(double *)&storeFrontImage;
  return result;
}

- (void)setLocation:(CLLocationCoordinate2D)a3
{
  *(CLLocationCoordinate2D *)&self->_storeFrontImage = a3;
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

- (_BlastDoorLPImage)categoryIcon
{
  return (_BlastDoorLPImage *)self->_category;
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

- (_BlastDoorLPImage)image
{
  return (_BlastDoorLPImage *)self->_distance;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_distance, a3);
}

- (_BlastDoorLPImage)darkImage
{
  return self->_image;
}

- (void)setDarkImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (_BlastDoorLPImage)storeFrontImage
{
  return self->_darkImage;
}

- (void)setStoreFrontImage:(id)a3
{
  objc_storeStrong((id *)&self->_darkImage, a3);
}

- (BOOL)isPointOfInterest
{
  return *(&self->super.__dummyPropertyForObservation + 1);
}

- (void)setIsPointOfInterest:(BOOL)a3
{
  *(&self->super.__dummyPropertyForObservation + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkImage, 0);
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

@end

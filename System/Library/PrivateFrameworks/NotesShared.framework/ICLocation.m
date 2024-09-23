@implementation ICLocation

- (void)setPlacemark:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((-[CLPlacemark isEqual:](self->_placemark, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_placemark, a3);
    if (v7)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
      objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("placemark"));
      objc_msgSend(v5, "encodedData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICLocation setPlacemarkData:](self, "setPlacemarkData:", v6);

    }
    else
    {
      -[ICLocation setPlacemarkData:](self, "setPlacemarkData:", 0);
    }
  }

}

- (CLPlacemark)placemark
{
  CLPlacemark *placemark;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CLPlacemark *v14;
  CLPlacemark *v15;
  id v17;

  placemark = self->_placemark;
  if (!placemark)
  {
    -[ICLocation placemarkData](self, "placemarkData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v17 = 0;
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v4, &v17);
      v6 = v17;
      if (v6)
      {
        v7 = os_log_create("com.apple.notes", "CoreData");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[ICLocation placemark].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

      }
      objc_msgSend(v5, "decodeObjectForKey:", CFSTR("placemark"));
      v14 = (CLPlacemark *)objc_claimAutoreleasedReturnValue();
      v15 = self->_placemark;
      self->_placemark = v14;

    }
    placemark = self->_placemark;
  }
  return placemark;
}

+ (id)searchStringsForPlacemark:(id)a3
{
  id v3;
  id v4;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v3)
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

    }
    objc_msgSend(v3, "thoroughfare");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "thoroughfare");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v8);

    }
    objc_msgSend(v3, "subThoroughfare");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v3, "subThoroughfare");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v10);

    }
    objc_msgSend(v3, "locality");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v3, "locality");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v12);

    }
    objc_msgSend(v3, "subLocality");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v3, "subLocality");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v14);

    }
    objc_msgSend(v3, "administrativeArea");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v3, "administrativeArea");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v16);

    }
    objc_msgSend(v3, "subAdministrativeArea");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v3, "subAdministrativeArea");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v18);

    }
    objc_msgSend(v3, "postalCode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v3, "postalCode");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v20);

    }
    objc_msgSend(v3, "ISOcountryCode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v3, "ISOcountryCode");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v22);

    }
    objc_msgSend(v3, "country");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v3, "country");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v24);

    }
    objc_msgSend(v3, "inlandWater");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v3, "inlandWater");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v26);

    }
    objc_msgSend(v3, "ocean");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v3, "ocean");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v28);

    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v3, "areasOfInterest", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v37;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v37 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v33++));
        }
        while (v31 != v33);
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v31);
    }

  }
  v34 = (void *)objc_msgSend(v4, "copy");

  return v34;
}

- (id)searchStrings
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[ICLocation placemark](self, "placemark");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchStringsForPlacemark:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)formattedAddress
{
  void *v3;
  objc_class *v4;
  id v5;
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
  id v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v3 = (void *)getCNMutablePostalAddressClass_softClass;
  v34 = getCNMutablePostalAddressClass_softClass;
  if (!getCNMutablePostalAddressClass_softClass)
  {
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __getCNMutablePostalAddressClass_block_invoke;
    v29 = &unk_1E76C77A8;
    v30 = &v31;
    __getCNMutablePostalAddressClass_block_invoke((uint64_t)&v26);
    v3 = (void *)v32[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v31, 8);
  v5 = objc_alloc_init(v4);
  -[ICLocation placemark](self, "placemark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "thoroughfare");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStreet:", v7);

  -[ICLocation placemark](self, "placemark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subLocality");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubLocality:", v9);

  -[ICLocation placemark](self, "placemark");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "locality");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCity:", v11);

  -[ICLocation placemark](self, "placemark");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subAdministrativeArea");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubAdministrativeArea:", v13);

  -[ICLocation placemark](self, "placemark");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "administrativeArea");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", v15);

  -[ICLocation placemark](self, "placemark");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postalCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPostalCode:", v17);

  -[ICLocation placemark](self, "placemark");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "country");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCountry:", v19);

  -[ICLocation placemark](self, "placemark");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ISOcountryCode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setISOCountryCode:", v21);

  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v22 = (void *)getCNPostalAddressFormatterClass_softClass;
  v34 = getCNPostalAddressFormatterClass_softClass;
  if (!getCNPostalAddressFormatterClass_softClass)
  {
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __getCNPostalAddressFormatterClass_block_invoke;
    v29 = &unk_1E76C77A8;
    v30 = &v31;
    __getCNPostalAddressFormatterClass_block_invoke((uint64_t)&v26);
    v22 = (void *)v32[3];
  }
  v23 = objc_retainAutorelease(v22);
  _Block_object_dispose(&v31, 8);
  objc_msgSend(v23, "stringFromPostalAddress:style:", v5, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v24;
}

- (void)setLocationFromURL:(id)a3
{
  id v4;
  os_log_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  NSObject *v23;
  double v24;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D27230], "isValidMapURL:", v4) & 1) != 0)
  {
    v5 = (os_log_t)objc_msgSend(objc_alloc(MEMORY[0x1E0D27230]), "initWithURL:", v4);
    v6 = 0.0;
    v7 = 0.0;
    if (-[NSObject parseIncludingCustomParameters:](v5, "parseIncludingCustomParameters:", 1))
    {
      if (-[NSObject exactPositionSpecified](v5, "exactPositionSpecified"))
      {
        -[NSObject centerCoordinate](v5, "centerCoordinate");
      }
      else
      {
        -[NSObject directionsDestinationAddressString](v5, "directionsDestinationAddressString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = v16;
          objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("("), &stru_1E76DB108);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR(")"), &stru_1E76DB108);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "componentsSeparatedByString:", CFSTR(","));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v20, "count") < 2)
          {
            v23 = os_log_create("com.apple.notes", "CoreData");
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              -[ICLocation setLocationFromURL:].cold.1((uint64_t)v4, (uint64_t)v20, v23);
          }
          else
          {
            objc_msgSend(v20, "objectAtIndex:", 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "doubleValue");
            v7 = v22;

            objc_msgSend(v20, "objectAtIndex:", 1);
            v23 = objc_claimAutoreleasedReturnValue();
            -[NSObject doubleValue](v23, "doubleValue");
            v6 = v24;
          }

          goto LABEL_15;
        }
        -[NSObject searchCoordinate](v5, "searchCoordinate");
      }
      v7 = v8;
      v6 = v9;
    }
LABEL_15:
    -[ICLocation setLatitude:](self, "setLatitude:", v7);
    -[ICLocation setLongitude:](self, "setLongitude:", v6);
    goto LABEL_16;
  }
  v5 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[ICLocation setLocationFromURL:].cold.2((uint64_t)v4, v5, v10, v11, v12, v13, v14, v15);
LABEL_16:

}

- (void)setLocationFromPlacemark:(id)a3
{
  id v4;
  void *v5;
  double v6;
  id v7;

  v4 = a3;
  -[ICLocation setPlacemark:](self, "setPlacemark:", v4);
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinate");
  -[ICLocation setLatitude:](self, "setLatitude:");

  objc_msgSend(v4, "location");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "coordinate");
  -[ICLocation setLongitude:](self, "setLongitude:", v6);

}

- (void)didTurnIntoFault
{
  CLPlacemark *placemark;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICLocation;
  -[ICLocation didTurnIntoFault](&v4, sel_didTurnIntoFault);
  placemark = self->_placemark;
  self->_placemark = 0;

}

- (BOOL)updatingPlace
{
  return self->updatingPlace;
}

- (void)setUpdatingPlace:(BOOL)a3
{
  self->updatingPlace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placemark, 0);
}

- (void)placemark
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "Error creating unarchiver: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)setLocationFromURL:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Not enough coordinates to get directions from url %@ with coordinates: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)setLocationFromURL:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, a2, a3, "Invalid map URL: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end

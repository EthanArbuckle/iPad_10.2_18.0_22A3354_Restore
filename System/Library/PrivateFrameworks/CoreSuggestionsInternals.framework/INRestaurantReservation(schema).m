@implementation INRestaurantReservation(schema)

- (uint64_t)schema
{
  return objc_msgSend(MEMORY[0x1E0CBDB00], "schemaFromRestaurantReservation:", a1);
}

+ (id)fromSchema:()schema
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v3 = (void *)MEMORY[0x1E0CBDAE8];
  v4 = a3;
  objc_msgSend(v3, "reservationNumberFromReservationSchema:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBDAE8], "bookingTimeFromReservationSchema:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(MEMORY[0x1E0CBDAE8], "reservationStatusFromReservationSchema:", v4);
  objc_msgSend(MEMORY[0x1E0CBDAE8], "reservationHolderNameFromReservationSchema:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBDAE8], "urlFromReservationSchema:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("startTime"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endTime"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBD860], "fromStartDate:endDate:", v20, v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9E3F0], "fromSchema:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0CBDC00]);
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v12, CFSTR("Restaurant"), 0);

  v14 = objc_alloc(MEMORY[0x1E0CBDB00]);
  objc_msgSend(MEMORY[0x1E0CBDB00], "partySizeFromReservationSchema:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(v14, "initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:reservationDuration:partySize:restaurantLocation:", v13, v5, v22, v21, v19, 0, v6, v7, v15, v9);
  return v16;
}

+ (id)schemaFromRestaurantReservation:()schema
{
  id v3;
  void *v4;
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
  void *v30;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CBDAE8], "schemaFromReservation:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/FoodEstablishmentReservation"), CFSTR("@type"));
  objc_msgSend(v3, "reservationDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "reservationDuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDateComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "schema");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("startTime"));

    }
    objc_msgSend(v3, "reservationDuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDateComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "schema");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("endTime"));

    }
  }
  objc_msgSend(v3, "partySize");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v3, "partySize");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("partySize"));

  }
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/FoodEstablishment"), CFSTR("@type"));
  objc_msgSend(v3, "restaurantLocation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v3, "restaurantLocation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("name"));

  }
  objc_msgSend(v3, "restaurantLocation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v3, "restaurantLocation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "postalAddress");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v3, "restaurantLocation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "postalAddress");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "schema");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, CFSTR("address"));

    }
    objc_msgSend(v3, "restaurantLocation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "location");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v3, "restaurantLocation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "location");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "schema");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v30, CFSTR("geo"));

    }
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("reservationFor"));

  return v5;
}

+ (id)partySizeFromReservationSchema:()schema
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("partySize"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("partySize"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end

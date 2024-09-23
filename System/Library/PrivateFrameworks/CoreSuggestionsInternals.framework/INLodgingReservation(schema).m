@implementation INLodgingReservation(schema)

- (uint64_t)schema
{
  return objc_msgSend(MEMORY[0x1E0CBD9D8], "schemaFromLodgingReservation:", a1);
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
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v3 = (void *)MEMORY[0x1E0CBDAE8];
  v4 = a3;
  objc_msgSend(v3, "reservationNumberFromReservationSchema:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBDAE8], "bookingTimeFromReservationSchema:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(MEMORY[0x1E0CBDAE8], "reservationStatusFromReservationSchema:", v4);
  objc_msgSend(MEMORY[0x1E0CBDAE8], "reservationHolderNameFromReservationSchema:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBDAE8], "urlFromReservationSchema:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9E3F0], "fromSchema:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0CBDC00]);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v13, CFSTR("Train"), 0);

  v15 = objc_alloc(MEMORY[0x1E0CBD9D8]);
  objc_msgSend(MEMORY[0x1E0CBD9D8], "reservationDurationFromReservationSchema:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v15, "initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:lodgingBusinessLocation:reservationDuration:numberOfAdults:numberOfChildren:", v14, v5, v6, v19, v7, 0, v8, v10, v16, 0, 0);
  return v17;
}

+ (id)schemaFromLodgingReservation:()schema
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

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CBDAE8], "schemaFromReservation:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/LodgingReservation"), CFSTR("@type"));
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
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("checkinDate"));

    }
    objc_msgSend(v3, "reservationDuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDateComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "schema");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("checkoutDate"));

    }
  }
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/LodgingBusiness"), CFSTR("@type"));
  objc_msgSend(v3, "lodgingBusinessLocation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v3, "lodgingBusinessLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("name"));

  }
  objc_msgSend(v3, "lodgingBusinessLocation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postalAddress");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v3, "lodgingBusinessLocation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "postalAddress");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "schema");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, CFSTR("address"));

  }
  objc_msgSend(v3, "lodgingBusinessLocation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "location");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v3, "lodgingBusinessLocation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "location");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "schema");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v27, CFSTR("geo"));

  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("reservationFor"));

  return v5;
}

+ (id)reservationDurationFromReservationSchema:()schema
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("checkinDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("checkinTime"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("checkoutDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("checkoutTime"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CBD860], "fromStartDate:endDate:", v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end

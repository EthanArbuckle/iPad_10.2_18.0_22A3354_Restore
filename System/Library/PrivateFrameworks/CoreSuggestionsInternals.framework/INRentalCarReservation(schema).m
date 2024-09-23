@implementation INRentalCarReservation(schema)

- (uint64_t)schema
{
  return objc_msgSend(MEMORY[0x1E0CBDAD0], "schemaFromRentalCarReservation:", a1);
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v3 = (void *)MEMORY[0x1E0CBDAE8];
  v4 = a3;
  objc_msgSend(v3, "reservationNumberFromReservationSchema:", v4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBDAE8], "bookingTimeFromReservationSchema:", v4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(MEMORY[0x1E0CBDAE8], "reservationStatusFromReservationSchema:", v4);
  objc_msgSend(MEMORY[0x1E0CBDAE8], "reservationHolderNameFromReservationSchema:", v4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBDAE8], "urlFromReservationSchema:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pickupTime"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dropoffTime"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBD860], "fromStartDate:endDate:", v31, v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C9E3F0];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pickupLocation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromSchema:", v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C9E3F0];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dropoffLocation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "fromSchema:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("model"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("brand"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rentalCompany"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDAC8]), "initWithRentalCompanyName:type:make:model:rentalCarDescription:", v13, v22, v20, v21, 0);
  v15 = objc_alloc(MEMORY[0x1E0CBDC00]);
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v15, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v17, CFSTR("Car Rental"), 0);

  v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDAD0]), "initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:rentalCar:rentalDuration:pickupLocation:dropOffLocation:", v18, v32, v30, v27, v26, 0, v25, v14, v24, v23, v10);
  return v28;
}

+ (id)schemaFromRentalCarReservation:()schema
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CBDAE8], "schemaFromReservation:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/RentalCarReservation"), CFSTR("@type"));
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/RentalCar"), CFSTR("@type"));
  objc_msgSend(v3, "rentalCar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "rentalCar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "type");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("name"));

  }
  objc_msgSend(v3, "rentalCar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v3, "rentalCar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "model");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("model"));

  }
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/Brand"), CFSTR("@type"));
  objc_msgSend(v3, "rentalCar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "make");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("name"));

  if ((unint64_t)objc_msgSend(v15, "count") >= 2)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("brand"));
  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/Organization"), CFSTR("@type"));
  objc_msgSend(v3, "rentalCar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rentalCompanyName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("name"));

  if ((unint64_t)objc_msgSend(v18, "count") >= 2)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("rentalCompany"));
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("reservationFor"));
  objc_msgSend(v3, "rentalDuration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "startDateComponents");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v3, "rentalDuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "startDateComponents");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "schema");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("pickupTime"));

  }
  objc_msgSend(v3, "rentalDuration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "endDateComponents");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v3, "rentalDuration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "endDateComponents");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "schema");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("dropoffTime"));

  }
  objc_msgSend(v3, "dropOffLocation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v3, "dropOffLocation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "schema");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("dropoffLocation"));

  }
  objc_msgSend(v3, "pickupLocation");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v3, "pickupLocation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "schema");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, CFSTR("pickupLocation"));

  }
  return v5;
}

@end

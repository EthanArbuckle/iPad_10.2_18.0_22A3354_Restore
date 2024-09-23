@implementation INTrainReservation(schema)

- (uint64_t)schema
{
  return objc_msgSend(MEMORY[0x1E0CBDCA0], "schemaFromTrainReservation:", a1);
}

+ (id)fromSchema:()schema
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v3 = (void *)MEMORY[0x1E0CBDAE8];
  v4 = a3;
  objc_msgSend(v3, "reservationNumberFromReservationSchema:", v4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBDAE8], "bookingTimeFromReservationSchema:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(MEMORY[0x1E0CBDAE8], "reservationStatusFromReservationSchema:", v4);
  objc_msgSend(MEMORY[0x1E0CBDAE8], "reservationHolderNameFromReservationSchema:", v4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBDAE8], "urlFromReservationSchema:", v4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = CFSTR("provider");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("provider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    || (v6 = CFSTR("trainCompany"),
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trainCompany")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v39 = 0;
  }
  v12 = objc_alloc(MEMORY[0x1E0CBDCA8]);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trainName"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trainNumber"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CBD860];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("departureTime"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arrivalTime"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fromStartDate:endDate:", v33, v31);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C9E3F0];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("departureStation"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fromSchema:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("departurePlatform"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0C9E3F0];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arrivalStation"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fromSchema:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arrivalPlatform"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v12, "initWithProvider:trainName:trainNumber:tripDuration:departureStationLocation:departurePlatform:arrivalStationLocation:arrivalPlatform:", v39, v30, v29, v14, v17, v18, v21, v22);

  v23 = objc_alloc(MEMORY[0x1E0CBDC00]);
  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "UUIDString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v23, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v25, CFSTR("Train"), 0);

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDCA0]), "initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:reservedSeat:trainTrip:", v26, v38, v37, v34, v36, 0, v35, 0, v32);
  return v27;
}

+ (id)schemaFromTrainReservation:()schema
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
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
  void *v53;
  void *v54;
  void *v55;
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[3];

  v62[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CBDAE8], "schemaFromReservation:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/TrainReservation"), CFSTR("@type"));
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/TrainTrip"), CFSTR("@type"));
  objc_msgSend(v3, "trainTrip");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tripDuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDateComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "trainTrip");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tripDuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startDateComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "schema");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("departureTime"));

  }
  objc_msgSend(v3, "trainTrip");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tripDuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v3, "trainTrip");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tripDuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "endDateComponents");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "schema");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("arrivalTime"));

  }
  objc_msgSend(v3, "trainTrip");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "departurePlatform");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v3, "trainTrip");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "departurePlatform");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("departurePlatform"));

  }
  objc_msgSend(v3, "trainTrip");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "arrivalPlatform");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v3, "trainTrip");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "arrivalPlatform");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("arrivalPlatform"));

  }
  objc_msgSend(v3, "trainTrip");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trainName");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(v3, "trainTrip");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "trainName");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v32, CFSTR("trainName"));

  }
  objc_msgSend(v3, "trainTrip");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trainNumber");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v3, "trainTrip");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "trainNumber");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v36, CFSTR("trainNumber"));

  }
  objc_msgSend(v3, "trainTrip");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "departureStationLocation");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "name");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    v61[1] = CFSTR("name");
    v62[0] = CFSTR("http://schema.org/TrainStation");
    v61[0] = CFSTR("@type");
    objc_msgSend(v3, "trainTrip");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "departureStationLocation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "name");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v42;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v43, CFSTR("departureStation"));

  }
  objc_msgSend(v3, "trainTrip");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "arrivalStationLocation");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "name");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    v59[1] = CFSTR("name");
    v60[0] = CFSTR("http://schema.org/TrainStation");
    v59[0] = CFSTR("@type");
    objc_msgSend(v3, "trainTrip");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "arrivalStationLocation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "name");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = v49;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v50, CFSTR("arrivalStation"));

  }
  objc_msgSend(v3, "trainTrip");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "provider");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    v57[1] = CFSTR("name");
    v58[0] = CFSTR("http://schema.org/Organization");
    v57[0] = CFSTR("@type");
    objc_msgSend(v3, "trainTrip");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "provider");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v54;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v55, CFSTR("provider"));

  }
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("reservationFor"));

  return v5;
}

@end

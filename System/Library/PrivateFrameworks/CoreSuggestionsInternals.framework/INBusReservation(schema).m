@implementation INBusReservation(schema)

- (uint64_t)schema
{
  return objc_msgSend(MEMORY[0x1E0CBD790], "schemaFromBusReservation:", a1);
}

+ (id)fromSchema:()schema
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
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
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;

  v3 = (void *)MEMORY[0x1E0CBDAE8];
  v4 = a3;
  objc_msgSend(v3, "reservationNumberFromReservationSchema:", v4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBDAE8], "bookingTimeFromReservationSchema:", v4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(MEMORY[0x1E0CBDAE8], "reservationStatusFromReservationSchema:", v4);
  objc_msgSend(MEMORY[0x1E0CBDAE8], "reservationHolderNameFromReservationSchema:", v4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("provider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CBDAE8], "urlFromReservationSchema:", v4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0CBD798]);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("busName"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("busNumber"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CBD860];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("departureTime"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arrivalTime"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fromStartDate:endDate:", v28, v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C9E3F0];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("departureBusStop"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fromSchema:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("departurePlatform"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0C9E3F0];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arrivalBusStop"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fromSchema:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arrivalPlatform"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v7, "initWithProvider:busName:busNumber:tripDuration:departureBusStopLocation:departurePlatform:arrivalBusStopLocation:arrivalPlatform:", v34, v25, v24, v9, v12, v13, v16, v17);

  v18 = objc_alloc(MEMORY[0x1E0CBDC00]);
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v20, CFSTR("Bus Trip"), 0);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD790]), "initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:reservedSeat:busTrip:", v21, v33, v32, v31, v30, 0, v29, 0, v27);
  return v22;
}

+ (id)schemaFromBusReservation:()schema
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
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD v71[2];
  _QWORD v72[3];

  v72[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CBDAE8], "schemaFromReservation:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/BusReservation"), CFSTR("@type"));
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/BusTrip"), CFSTR("@type"));
  objc_msgSend(v3, "busTrip");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tripDuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDateComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "busTrip");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tripDuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startDateComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "schema");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("departureTime"));

  }
  objc_msgSend(v3, "busTrip");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tripDuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v3, "busTrip");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tripDuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "endDateComponents");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "schema");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("arrivalTime"));

  }
  objc_msgSend(v3, "busTrip");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "busName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v3, "busTrip");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "busName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("busName"));

  }
  objc_msgSend(v3, "busTrip");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "busNumber");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v3, "busTrip");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "busNumber");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("busNumber"));

  }
  v29 = (void *)objc_opt_new();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/BusStation"), CFSTR("@type"));
  objc_msgSend(v3, "busTrip");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "departureBusStopLocation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "name");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v3, "busTrip");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "departureBusStopLocation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "name");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v35, CFSTR("name"));

  }
  objc_msgSend(v3, "busTrip");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "departureBusStopLocation");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "postalAddress");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v3, "busTrip");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "departureBusStopLocation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "postalAddress");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "schema");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v42, CFSTR("address"));

  }
  if ((unint64_t)objc_msgSend(v29, "count") >= 2)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v29, CFSTR("departureBusStop"));
  objc_msgSend(v3, "busTrip");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "departurePlatform");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend(v3, "busTrip");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "departurePlatform");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v46, CFSTR("departurePlatform"));

  }
  v47 = (void *)objc_opt_new();
  objc_msgSend(v47, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/BusStation"), CFSTR("@type"));
  objc_msgSend(v3, "busTrip");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "arrivalBusStopLocation");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "name");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    objc_msgSend(v3, "busTrip");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "arrivalBusStopLocation");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "name");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKeyedSubscript:", v53, CFSTR("name"));

  }
  objc_msgSend(v3, "busTrip");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "arrivalBusStopLocation");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "postalAddress");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    objc_msgSend(v3, "busTrip");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "arrivalBusStopLocation");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "postalAddress");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "schema");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setObject:forKeyedSubscript:", v60, CFSTR("address"));

  }
  if ((unint64_t)objc_msgSend(v47, "count") >= 2)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v47, CFSTR("arrivalBusStop"));
  objc_msgSend(v3, "busTrip");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "arrivalPlatform");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    objc_msgSend(v3, "busTrip");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "arrivalPlatform");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v64, CFSTR("arrivalPlatform"));

  }
  objc_msgSend(v3, "busTrip");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "provider");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    v71[0] = CFSTR("@type");
    v71[1] = CFSTR("name");
    v72[0] = CFSTR("http://schema.org/Organization");
    objc_msgSend(v3, "busTrip");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "provider");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = v68;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v69, CFSTR("provider"));

  }
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("reservationFor"));

  return v5;
}

@end

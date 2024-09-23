@implementation INBoatReservation(schema)

- (uint64_t)schema
{
  return objc_msgSend(MEMORY[0x1E0CBD770], "schemaFromBoatReservation:", a1);
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
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;

  v3 = (void *)MEMORY[0x1E0CBDAE8];
  v4 = a3;
  objc_msgSend(v3, "reservationNumberFromReservationSchema:", v4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBDAE8], "bookingTimeFromReservationSchema:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(MEMORY[0x1E0CBDAE8], "reservationStatusFromReservationSchema:", v4);
  objc_msgSend(MEMORY[0x1E0CBDAE8], "reservationHolderNameFromReservationSchema:", v4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("provider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CBDAE8], "urlFromReservationSchema:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_alloc(MEMORY[0x1E0CBD778]);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CBD860];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("departureTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arrivalTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fromStartDate:endDate:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C9E3F0];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("departureBoatTerminal"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fromSchema:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0C9E3F0];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arrivalBoatTerminal"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fromSchema:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "initWithProvider:boatName:boatNumber:tripDuration:departureBoatTerminalLocation:arrivalBoatTerminalLocation:", v27, v7, v24, v11, v14, v17);

  v18 = objc_alloc(MEMORY[0x1E0CBDC00]);
  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v20, CFSTR("Boat Trip"), 0);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD770]), "initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:reservedSeat:boatTrip:", v21, v32, v31, v30, v29, 0, v28, 0, v26);
  return v22;
}

+ (id)schemaFromBoatReservation:()schema
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
  _QWORD v63[2];
  _QWORD v64[3];

  v64[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CBDAE8], "schemaFromReservation:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/BoatReservation"), CFSTR("@type"));
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/BoatTrip"), CFSTR("@type"));
  objc_msgSend(v3, "boatTrip");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tripDuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startDateComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "boatTrip");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tripDuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startDateComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "schema");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("departureTime"));

  }
  objc_msgSend(v3, "boatTrip");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tripDuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "endDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v3, "boatTrip");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tripDuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "endDateComponents");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "schema");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("arrivalTime"));

  }
  objc_msgSend(v3, "boatTrip");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "boatName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v3, "boatTrip");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "boatName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("name"));

  }
  objc_msgSend(v3, "boatTrip");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "boatNumber");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v3, "boatTrip");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "boatNumber");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("identifier"));

  }
  v29 = (void *)objc_opt_new();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/BoatTerminal"), CFSTR("@type"));
  objc_msgSend(v3, "boatTrip");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "departureBoatTerminalLocation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "name");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    objc_msgSend(v3, "boatTrip");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "departureBoatTerminalLocation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "name");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v35, CFSTR("name"));

  }
  objc_msgSend(v3, "boatTrip");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "departureBoatTerminalLocation");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "postalAddress");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v3, "boatTrip");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "departureBoatTerminalLocation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "postalAddress");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "schema");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v42, CFSTR("address"));

  }
  if ((unint64_t)objc_msgSend(v29, "count") >= 2)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v29, CFSTR("departureBoatTerminal"));
  v43 = (void *)objc_opt_new();
  objc_msgSend(v43, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/BoatTerminal"), CFSTR("@type"));
  objc_msgSend(v3, "boatTrip");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "arrivalBoatTerminalLocation");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "name");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend(v3, "boatTrip");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "arrivalBoatTerminalLocation");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "name");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v49, CFSTR("name"));

  }
  objc_msgSend(v3, "boatTrip");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "arrivalBoatTerminalLocation");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "postalAddress");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    objc_msgSend(v3, "boatTrip");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "arrivalBoatTerminalLocation");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "postalAddress");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "schema");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v56, CFSTR("address"));

  }
  if ((unint64_t)objc_msgSend(v43, "count") >= 2)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v43, CFSTR("arrivalBoatTerminal"));
  objc_msgSend(v3, "boatTrip");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "provider");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    v63[0] = CFSTR("@type");
    v63[1] = CFSTR("name");
    v64[0] = CFSTR("http://schema.org/Organization");
    objc_msgSend(v3, "boatTrip");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "provider");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v60;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v61, CFSTR("provider"));

  }
  if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("reservationFor"));

  return v5;
}

@end

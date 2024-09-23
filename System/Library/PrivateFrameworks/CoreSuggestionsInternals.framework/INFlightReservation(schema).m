@implementation INFlightReservation(schema)

- (uint64_t)schema
{
  return objc_msgSend(MEMORY[0x1E0CBD8B8], "schemaFromFlightReservation:", a1);
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
  void *v15;
  uint64_t v17;

  v3 = (void *)MEMORY[0x1E0CBDAE8];
  v4 = a3;
  objc_msgSend(v3, "reservationNumberFromReservationSchema:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBDAE8], "bookingTimeFromReservationSchema:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(MEMORY[0x1E0CBDAE8], "reservationStatusFromReservationSchema:", v4);
  objc_msgSend(MEMORY[0x1E0CBDAE8], "reservationHolderNameFromReservationSchema:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBDAE8], "urlFromReservationSchema:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBDB78], "fromSchema:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBD8B8], "flightFromReservationSchema:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0CBDC00]);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v13, CFSTR("Flight"), 0);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD8B8]), "initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:reservedSeat:flight:", v14, v5, v6, v17, v7, 0, v8, v9, v10);
  return v15;
}

+ (id)airlineFromFlightSchema:()schema
{
  id v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("airline"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = CFSTR("airline");
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("provider"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v12 = 0;
      goto LABEL_6;
    }
    v5 = CFSTR("provider");
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CBD710]);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("iataCode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("icaoCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithName:iataCode:icaoCode:", v9, v10, v11);

LABEL_6:
  return v12;
}

+ (uint64_t)flightNumberFromFlightSchema:()schema
{
  return objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("flightNumber"));
}

+ (id)airportFromAirportSchema:()schema
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0CBD718];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iataCode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("icaoCode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v5, "initWithName:iataCode:icaoCode:", v6, v7, v8);
  return v9;
}

+ (id)departureAirportGateFromFlightSchema:()schema
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("departureAirport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBD8B8], "airportFromAirportSchema:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CBD720]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("departureTerminal"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("departureGate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v6, "initWithAirport:terminal:gate:", v5, v7, v8);
  return v9;
}

+ (id)arrivalAirporGateFromFlightSchema:()schema
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBD8B8], "airportFromAirportSchema:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CBD720]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("arrivalTerminal"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("arrivalGate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v6, "initWithAirport:terminal:gate:", v5, v7, v8);
  return v9;
}

+ (id)flightFromReservationSchema:()schema
{
  void *v3;
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

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CBD8B8], "airlineFromFlightSchema:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CBD8B8], "flightNumberFromFlightSchema:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CBD860];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("boardingTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fromStartDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CBD860];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("departureTime"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("arrivalTime"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fromStartDate:endDate:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CBD8B8], "departureAirportGateFromFlightSchema:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CBD8B8], "arrivalAirporGateFromFlightSchema:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD8B0]), "initWithAirline:flightNumber:boardingTime:flightDuration:departureAirportGate:arrivalAirportGate:", v4, v5, v8, v12, v13, v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)schemaFromFlightReservation:()schema
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
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CBDAE8], "schemaFromReservation:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v3, "reservedSeat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "reservedSeat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "schema");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v14[0] = CFSTR("@type");
      v14[1] = CFSTR("ticketedSeat");
      v15[0] = CFSTR("http://schema.org/Ticket");
      v15[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("reservedTicket"));

    }
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/FlightReservation"), CFSTR("@type"));
  v10 = (void *)MEMORY[0x1E0CBD8B8];
  objc_msgSend(v3, "flight");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "schemaFromFlight:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("reservationFor"));

  return v5;
}

+ (id)schemaFromAirline:()schema
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/Airline"), CFSTR("@type"));
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("name"));

  }
  objc_msgSend(v3, "iataCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "iataCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("iataCode"));

  }
  objc_msgSend(v3, "icaoCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "icaoCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("icaoCode"));

  }
  return v4;
}

+ (id)schemaFromAirport:()schema
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/Airport"), CFSTR("@type"));
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("name"));

  }
  objc_msgSend(v3, "iataCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "iataCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("iataCode"));

  }
  objc_msgSend(v3, "icaoCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "icaoCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("icaoCode"));

  }
  return v4;
}

+ (id)schemaFromFlight:()schema
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

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/Flight"), CFSTR("@type"));
  objc_msgSend(v3, "airline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CBD8B8];
    objc_msgSend(v3, "airline");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "schemaFromAirline:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("airline"));

  }
  objc_msgSend(v3, "flightNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "flightNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("flightNumber"));

  }
  objc_msgSend(v3, "boardingTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDateComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v3, "boardingTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startDateComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "schema");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("boardingTime"));

  }
  objc_msgSend(v3, "flightDuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v3, "flightDuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "startDateComponents");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v3, "flightDuration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "startDateComponents");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "schema");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("departureTime"));

    }
    objc_msgSend(v3, "flightDuration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "endDateComponents");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v3, "flightDuration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "endDateComponents");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "schema");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("arrivalTime"));

    }
  }
  objc_msgSend(v3, "departureAirportGate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    objc_msgSend(v27, "airport");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = (void *)MEMORY[0x1E0CBD8B8];
      objc_msgSend(v28, "airport");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "schemaFromAirport:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("departureAirport"));

    }
    objc_msgSend(v28, "terminal");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v28, "terminal");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("departureTerminal"));

    }
    objc_msgSend(v28, "gate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v28, "gate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, CFSTR("departureGate"));

    }
  }
  objc_msgSend(v3, "arrivalAirportGate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    objc_msgSend(v37, "airport");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      v40 = (void *)MEMORY[0x1E0CBD8B8];
      objc_msgSend(v38, "airport");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "schemaFromAirport:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v42, CFSTR("arrivalAirport"));

    }
    objc_msgSend(v38, "terminal");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      objc_msgSend(v38, "terminal");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v44, CFSTR("arrivalTerminal"));

    }
    objc_msgSend(v38, "gate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(v38, "gate");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v46, CFSTR("arrivalGate"));

    }
  }

  return v4;
}

@end

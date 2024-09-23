@implementation INTicketedEventReservation(schema)

- (uint64_t)schema
{
  return objc_msgSend(MEMORY[0x1E0CBDC78], "schemaFromTicketedEventReservation:", a1);
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
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;

  v3 = (void *)MEMORY[0x1E0CBDAE8];
  v4 = a3;
  objc_msgSend(v3, "reservationNumberFromReservationSchema:", v4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBDAE8], "bookingTimeFromReservationSchema:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(MEMORY[0x1E0CBDAE8], "reservationStatusFromReservationSchema:", v4);
  objc_msgSend(MEMORY[0x1E0CBDAE8], "reservationHolderNameFromReservationSchema:", v4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBDAE8], "urlFromReservationSchema:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBDB78], "fromSchema:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("movie"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("movie"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name"));
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = 1;
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = 0;
  }
  v22 = (void *)v10;
  v12 = (void *)MEMORY[0x1E0C9E3F0];
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("location"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fromSchema:", v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("startDate"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("endDate"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBD860], "fromStartDate:endDate:", v25, v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDC70]), "initWithCategory:name:eventDuration:location:", v11, v10, v14, v23);
  v16 = objc_alloc(MEMORY[0x1E0CBDC00]);
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v18, CFSTR("Event"), 0);

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDC78]), "initWithItemReference:reservationNumber:bookingTime:reservationStatus:reservationHolderName:actions:URL:reservedSeat:event:", v19, v29, v28, v26, v27, 0, v5, v6, v15);
  return v20;
}

+ (id)schemaFromTicketedEventReservation:()schema
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend(v3, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "category");

  if (v5 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CBDC78], "schemaFromMovieTicketedEventReservation:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CBDC78], "schemaFromGenericTicketedEventReservation:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v4 = (void *)v6;
  }

  return v4;
}

+ (id)schemaFromGenericTicketedEventReservation:()schema
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
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CBDAE8], "schemaFromReservation:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/EventReservation"), CFSTR("@type"));
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/Event"), CFSTR("@type"));
  objc_msgSend(v3, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "event");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("name"));

  }
  objc_msgSend(v7, "eventDuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDateComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v7, "eventDuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startDateComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "schema");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("startDate"));

  }
  objc_msgSend(v7, "eventDuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "endDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v7, "eventDuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "endDateComponents");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "schema");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("endDate"));

  }
  objc_msgSend(v7, "location");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v7, "location");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "schema");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, CFSTR("location"));

  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("reservationFor"));
  objc_msgSend(v3, "reservedSeat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v3, "reservedSeat");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "schema");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v29[0] = CFSTR("@type");
      v29[1] = CFSTR("ticketedSeat");
      v30[0] = CFSTR("http://schema.org/Ticket");
      v30[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("reservedTicket"));

    }
  }

  return v5;
}

+ (id)schemaFromMovieTicketedEventReservation:()schema
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
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CBDAE8], "schemaFromReservation:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/EventReservation"), CFSTR("@type"));
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/MovieShowing"), CFSTR("@type"));
  objc_msgSend(v3, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v31[0] = CFSTR("@type");
    v31[1] = CFSTR("name");
    v32[0] = CFSTR("http://schema.org/Movie");
    objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("movie"));
  }
  objc_msgSend(v7, "eventDuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDateComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v7, "eventDuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startDateComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "schema");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("startDate"));

  }
  objc_msgSend(v7, "eventDuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "endDateComponents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v7, "eventDuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "endDateComponents");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "schema");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("endDate"));

  }
  objc_msgSend(v7, "location");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v7, "location");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "schema");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, CFSTR("location"));

  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("reservationFor"));
  objc_msgSend(v3, "reservedSeat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v3, "reservedSeat");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "schema");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v29[0] = CFSTR("@type");
      v29[1] = CFSTR("ticketedSeat");
      v30[0] = CFSTR("http://schema.org/Ticket");
      v30[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("reservedTicket"));

    }
  }

  return v5;
}

@end

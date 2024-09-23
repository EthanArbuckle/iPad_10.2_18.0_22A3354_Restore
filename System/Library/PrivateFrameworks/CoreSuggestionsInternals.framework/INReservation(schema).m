@implementation INReservation(schema)

+ (id)reservationNumberFromReservationSchema:()schema
{
  id v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = CFSTR("reservationId");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("reservationId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    || (v4 = CFSTR("reservationNumber"),
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("reservationNumber")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)bookingTimeFromReservationSchema:()schema
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bookingTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dateFromString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)reservationStatusFromReservationSchema:()schema
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("reservationStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("http://schema.org/ReservationHold")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("http://schema.org/ReservationPending")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("http://schema.org/ReservationCancelled")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("http://schema.org/ReservationConfirmed")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)reservationHolderNameFromReservationSchema:()schema
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("underName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("name"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)urlFromReservationSchema:()schema
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)schemaFromReservation:()schema
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
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("http://schema.org"), CFSTR("@context"));
  objc_msgSend(v3, "reservationNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "reservationNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("reservationId"));

  }
  objc_msgSend(MEMORY[0x1E0CBDAE8], "reservationStatusToSchema:", objc_msgSend(v3, "reservationStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("reservationStatus"));
  objc_msgSend(v3, "bookingTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "bookingTime");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("bookingTime"));

  }
  objc_msgSend(v3, "reservationHolderName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v24[0] = CFSTR("@type");
    v24[1] = CFSTR("name");
    v25[0] = CFSTR("http://schema.org/Person");
    objc_msgSend(v3, "reservationHolderName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("underName"));

  }
  objc_msgSend(v3, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v3, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "absoluteString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("url"));

  }
  objc_msgSend(v3, "itemReference");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v3, "itemReference");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "spokenPhrase");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("itemReferenceName"));

    objc_msgSend(v3, "itemReference");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "vocabularyIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("itemReferenceIdentifier"));

  }
  return v5;
}

+ (__CFString)reservationStatusToSchema:()schema
{
  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  else
    return off_1E7DB13A0[a3 - 1];
}

@end

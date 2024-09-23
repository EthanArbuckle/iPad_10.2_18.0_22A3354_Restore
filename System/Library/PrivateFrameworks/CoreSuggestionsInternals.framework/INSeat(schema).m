@implementation INSeat(schema)

- (id)schema
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("http://schema.org/Seat"), CFSTR("@type"));
  objc_msgSend(a1, "seatNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "seatNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("seatNumber"));

  }
  objc_msgSend(a1, "seatRow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "seatRow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("seatRow"));

  }
  objc_msgSend(a1, "seatSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "seatSection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("seatSection"));

  }
  objc_msgSend(a1, "seatingType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "seatingType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("seatingType"));

  }
  if ((unint64_t)objc_msgSend(v2, "count") < 2)
    v11 = 0;
  else
    v11 = v2;

  return v11;
}

+ (id)fromSchema:()schema
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

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("reservedTicket"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("reservedTicket"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ticketedSeat"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v15 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("reservedTicket"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ticketedSeat"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("seat"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("airplaneSeat"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("airplaneSeatClass"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("name"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDB78]), "initWithSeatSection:seatRow:seatNumber:seatingType:", 0, 0, v8, v12);
      goto LABEL_7;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("seat"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("seatNumber"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("seatRow"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("seatSection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("seatingType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBDB78]), "initWithSeatSection:seatRow:seatNumber:seatingType:", v13, v12, v11, v14);

LABEL_7:
LABEL_9:

  return v15;
}

@end

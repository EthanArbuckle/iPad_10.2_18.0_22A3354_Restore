@implementation GEOLogMsgEventTimeToLeaveHypothesis

- (int)departure
{
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    return self->_departure;
  else
    return 0;
}

- (void)setDeparture:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x20u;
  self->_departure = a3;
}

- (void)setHasDeparture:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xDF | v3;
}

- (BOOL)hasDeparture
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (id)departureAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C22978[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDeparture:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_TO_LEAVE_BUCKET_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EARLIER_THAN_22M")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EARLIER_THAN_7M")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ON_TIME")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATER_THAN_7M")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATER_THAN_22M")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DID_NOT_ARRIVE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DID_NOT_DEPART")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)arrival
{
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    return self->_arrival;
  else
    return 0;
}

- (void)setArrival:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x10u;
  self->_arrival = a3;
}

- (void)setHasArrival:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasArrival
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)arrivalAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C22978[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsArrival:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TIME_TO_LEAVE_BUCKET_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EARLIER_THAN_22M")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EARLIER_THAN_7M")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ON_TIME")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATER_THAN_7M")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATER_THAN_22M")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DID_NOT_ARRIVE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DID_NOT_DEPART")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)numberOfReroutes
{
  return self->_numberOfReroutes;
}

- (void)setNumberOfReroutes:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x40u;
  self->_numberOfReroutes = a3;
}

- (void)setHasNumberOfReroutes:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xBF | v3;
}

- (BOOL)hasNumberOfReroutes
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (int)ttlUiNotificationShown
{
  if ((*(_BYTE *)&self->_flags & 0x80000000) != 0)
    return self->_ttlUiNotificationShown;
  else
    return 0;
}

- (void)setTtlUiNotificationShown:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x80u;
  self->_ttlUiNotificationShown = a3;
}

- (void)setHasTtlUiNotificationShown:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = v3 & 0x80 | *(_BYTE *)&self->_flags & 0x7F;
}

- (BOOL)hasTtlUiNotificationShown
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (id)ttlUiNotificationShownAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C229B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTtlUiNotificationShown:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TTL_UI_NOTIFICATION_NONE_SHOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EARLY_SHOWN")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ON_TIME_SHOWN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BOTH_SHOWN")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (double)earliestDepartureOffset
{
  return self->_earliestDepartureOffset;
}

- (void)setEarliestDepartureOffset:(double)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_earliestDepartureOffset = a3;
}

- (void)setHasEarliestDepartureOffset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasEarliestDepartureOffset
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)latestDepartureOffset
{
  return self->_latestDepartureOffset;
}

- (void)setLatestDepartureOffset:(double)a3
{
  *(_BYTE *)&self->_flags |= 8u;
  self->_latestDepartureOffset = a3;
}

- (void)setHasLatestDepartureOffset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasLatestDepartureOffset
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (double)earliestArrivalOffset
{
  return self->_earliestArrivalOffset;
}

- (void)setEarliestArrivalOffset:(double)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_earliestArrivalOffset = a3;
}

- (void)setHasEarliestArrivalOffset:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasEarliestArrivalOffset
{
  return *(_BYTE *)&self->_flags & 1;
}

- (double)latestArrivalOffset
{
  return self->_latestArrivalOffset;
}

- (void)setLatestArrivalOffset:(double)a3
{
  *(_BYTE *)&self->_flags |= 4u;
  self->_latestArrivalOffset = a3;
}

- (void)setHasLatestArrivalOffset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasLatestArrivalOffset
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventTimeToLeaveHypothesis;
  -[GEOLogMsgEventTimeToLeaveHypothesis description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventTimeToLeaveHypothesis dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventTimeToLeaveHypothesis _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  __CFString *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 56);
  if ((v5 & 0x20) != 0)
  {
    v6 = *(int *)(a1 + 44);
    if (v6 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 44));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C22978[v6];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("departure"));

    v5 = *(_BYTE *)(a1 + 56);
  }
  if ((v5 & 0x10) != 0)
  {
    v8 = *(int *)(a1 + 40);
    if (v8 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 40));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E1C22978[v8];
    }
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("arrival"));

    v5 = *(_BYTE *)(a1 + 56);
  }
  if ((v5 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("numberOfReroutes");
    else
      v11 = CFSTR("number_of_reroutes");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

    v5 = *(_BYTE *)(a1 + 56);
    if ((v5 & 0x80) == 0)
    {
LABEL_14:
      if ((v5 & 2) == 0)
        goto LABEL_15;
      goto LABEL_30;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_14;
  }
  v12 = *(int *)(a1 + 52);
  if (v12 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 52));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E1C229B8[v12];
  }
  if (a2)
    v14 = CFSTR("ttlUiNotificationShown");
  else
    v14 = CFSTR("ttl_ui_notification_shown");
  objc_msgSend(v4, "setObject:forKey:", v13, v14);

  v5 = *(_BYTE *)(a1 + 56);
  if ((v5 & 2) == 0)
  {
LABEL_15:
    if ((v5 & 8) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_30:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v16 = CFSTR("earliestDepartureOffset");
  else
    v16 = CFSTR("earliest_departure_offset");
  objc_msgSend(v4, "setObject:forKey:", v15, v16);

  v5 = *(_BYTE *)(a1 + 56);
  if ((v5 & 8) == 0)
  {
LABEL_16:
    if ((v5 & 1) == 0)
      goto LABEL_17;
    goto LABEL_38;
  }
LABEL_34:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v18 = CFSTR("latestDepartureOffset");
  else
    v18 = CFSTR("latest_departure_offset");
  objc_msgSend(v4, "setObject:forKey:", v17, v18);

  v5 = *(_BYTE *)(a1 + 56);
  if ((v5 & 1) == 0)
  {
LABEL_17:
    if ((v5 & 4) == 0)
      return v4;
    goto LABEL_42;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 8));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v20 = CFSTR("earliestArrivalOffset");
  else
    v20 = CFSTR("earliest_arrival_offset");
  objc_msgSend(v4, "setObject:forKey:", v19, v20);

  if ((*(_BYTE *)(a1 + 56) & 4) != 0)
  {
LABEL_42:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("latestArrivalOffset");
    else
      v22 = CFSTR("latest_arrival_offset");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventTimeToLeaveHypothesis _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventTimeToLeaveHypothesis)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventTimeToLeaveHypothesis *)-[GEOLogMsgEventTimeToLeaveHypothesis _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;

  v5 = a2;
  if (!a1)
    goto LABEL_90;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_90;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("departure"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("TIME_TO_LEAVE_BUCKET_UNKNOWN")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("EARLIER_THAN_22M")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("EARLIER_THAN_7M")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ON_TIME")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("LATER_THAN_7M")) & 1) != 0)
    {
      v8 = 4;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("LATER_THAN_22M")) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("DID_NOT_ARRIVE")) & 1) != 0)
    {
      v8 = 6;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("DID_NOT_DEPART")))
    {
      v8 = 7;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_25;
    v8 = objc_msgSend(v6, "intValue");
  }
  objc_msgSend(a1, "setDeparture:", v8);
LABEL_25:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("arrival"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("TIME_TO_LEAVE_BUCKET_UNKNOWN")) & 1) != 0)
    {
      v11 = 0;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("EARLIER_THAN_22M")) & 1) != 0)
    {
      v11 = 1;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("EARLIER_THAN_7M")) & 1) != 0)
    {
      v11 = 2;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("ON_TIME")) & 1) != 0)
    {
      v11 = 3;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("LATER_THAN_7M")) & 1) != 0)
    {
      v11 = 4;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("LATER_THAN_22M")) & 1) != 0)
    {
      v11 = 5;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("DID_NOT_ARRIVE")) & 1) != 0)
    {
      v11 = 6;
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("DID_NOT_DEPART")))
    {
      v11 = 7;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_47;
    v11 = objc_msgSend(v9, "intValue");
  }
  objc_msgSend(a1, "setArrival:", v11);
LABEL_47:

  if (a3)
    v12 = CFSTR("numberOfReroutes");
  else
    v12 = CFSTR("number_of_reroutes");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setNumberOfReroutes:", objc_msgSend(v13, "unsignedIntValue"));

  if (a3)
    v14 = CFSTR("ttlUiNotificationShown");
  else
    v14 = CFSTR("ttl_ui_notification_shown");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v15;
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("TTL_UI_NOTIFICATION_NONE_SHOWN")) & 1) != 0)
    {
      v17 = 0;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("EARLY_SHOWN")) & 1) != 0)
    {
      v17 = 1;
    }
    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("ON_TIME_SHOWN")) & 1) != 0)
    {
      v17 = 2;
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("BOTH_SHOWN")))
    {
      v17 = 3;
    }
    else
    {
      v17 = 0;
    }

    goto LABEL_68;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = objc_msgSend(v15, "intValue");
LABEL_68:
    objc_msgSend(a1, "setTtlUiNotificationShown:", v17);
  }

  if (a3)
    v18 = CFSTR("earliestDepartureOffset");
  else
    v18 = CFSTR("earliest_departure_offset");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v19, "doubleValue");
    objc_msgSend(a1, "setEarliestDepartureOffset:");
  }

  if (a3)
    v20 = CFSTR("latestDepartureOffset");
  else
    v20 = CFSTR("latest_departure_offset");
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v21, "doubleValue");
    objc_msgSend(a1, "setLatestDepartureOffset:");
  }

  if (a3)
    v22 = CFSTR("earliestArrivalOffset");
  else
    v22 = CFSTR("earliest_arrival_offset");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v23, "doubleValue");
    objc_msgSend(a1, "setEarliestArrivalOffset:");
  }

  if (a3)
    v24 = CFSTR("latestArrivalOffset");
  else
    v24 = CFSTR("latest_arrival_offset");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v25, "doubleValue");
    objc_msgSend(a1, "setLatestArrivalOffset:");
  }

LABEL_90:
  return a1;
}

- (GEOLogMsgEventTimeToLeaveHypothesis)initWithJSON:(id)a3
{
  return (GEOLogMsgEventTimeToLeaveHypothesis *)-[GEOLogMsgEventTimeToLeaveHypothesis _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventTimeToLeaveHypothesisIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventTimeToLeaveHypothesisReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  char flags;
  id v5;

  v5 = a3;
  flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  flags = (char)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_7:
    if ((flags & 1) == 0)
      goto LABEL_8;
LABEL_17:
    PBDataWriterWriteDoubleField();
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_17;
LABEL_8:
  if ((flags & 4) != 0)
LABEL_9:
    PBDataWriterWriteDoubleField();
LABEL_10:

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEOLogMsgEventTimeToLeaveHypothesis readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
  {
    v5[11] = self->_departure;
    *((_BYTE *)v5 + 56) |= 0x20u;
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v5[10] = self->_arrival;
  *((_BYTE *)v5 + 56) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v5[12] = self->_numberOfReroutes;
  *((_BYTE *)v5 + 56) |= 0x40u;
  flags = (char)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v5[13] = self->_ttlUiNotificationShown;
  *((_BYTE *)v5 + 56) |= 0x80u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)v5 + 2) = *(_QWORD *)&self->_earliestDepartureOffset;
  *((_BYTE *)v5 + 56) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_7:
    if ((flags & 1) == 0)
      goto LABEL_8;
LABEL_17:
    *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_earliestArrivalOffset;
    *((_BYTE *)v5 + 56) |= 1u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  *((_QWORD *)v5 + 4) = *(_QWORD *)&self->_latestDepartureOffset;
  *((_BYTE *)v5 + 56) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_17;
LABEL_8:
  if ((flags & 4) != 0)
  {
LABEL_9:
    *((_QWORD *)v5 + 3) = *(_QWORD *)&self->_latestArrivalOffset;
    *((_BYTE *)v5 + 56) |= 4u;
  }
LABEL_10:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
  {
    *((_DWORD *)result + 11) = self->_departure;
    *((_BYTE *)result + 56) |= 0x20u;
    flags = (char)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_3:
      if ((flags & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 10) = self->_arrival;
  *((_BYTE *)result + 56) |= 0x10u;
  flags = (char)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_4:
    if ((flags & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 12) = self->_numberOfReroutes;
  *((_BYTE *)result + 56) |= 0x40u;
  flags = (char)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)result + 13) = self->_ttlUiNotificationShown;
  *((_BYTE *)result + 56) |= 0x80u;
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_earliestDepartureOffset;
  *((_BYTE *)result + 56) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_7:
    if ((flags & 1) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_latestDepartureOffset;
  *((_BYTE *)result + 56) |= 8u;
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_8:
    if ((flags & 4) == 0)
      return result;
    goto LABEL_9;
  }
LABEL_17:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_earliestArrivalOffset;
  *((_BYTE *)result + 56) |= 1u;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    return result;
LABEL_9:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_latestArrivalOffset;
  *((_BYTE *)result + 56) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  -[GEOLogMsgEventTimeToLeaveHypothesis readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x20) == 0 || self->_departure != *((_DWORD *)v4 + 11))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x20) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x10) == 0 || self->_arrival != *((_DWORD *)v4 + 10))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x40) == 0 || self->_numberOfReroutes != *((_DWORD *)v4 + 12))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x40) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 0x80) == 0 || self->_ttlUiNotificationShown != *((_DWORD *)v4 + 13))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 56) & 0x80) != 0)
  {
LABEL_41:
    v5 = 0;
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_earliestDepartureOffset != *((double *)v4 + 2))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_latestDepartureOffset != *((double *)v4 + 4))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    goto LABEL_41;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_earliestArrivalOffset != *((double *)v4 + 1))
      goto LABEL_41;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_41;
  }
  v5 = (*((_BYTE *)v4 + 56) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_latestArrivalOffset != *((double *)v4 + 3))
      goto LABEL_41;
    v5 = 1;
  }
LABEL_42:

  return v5;
}

- (unint64_t)hash
{
  char flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double earliestDepartureOffset;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  double latestDepartureOffset;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  double earliestArrivalOffset;
  double v20;
  long double v21;
  double v22;
  unint64_t v23;
  double latestArrivalOffset;
  double v25;
  long double v26;
  double v27;

  -[GEOLogMsgEventTimeToLeaveHypothesis readAll:](self, "readAll:", 1);
  flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
  {
    v4 = 2654435761 * self->_departure;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_arrival;
      if ((*(_BYTE *)&self->_flags & 0x40) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_numberOfReroutes;
    if ((*(_BYTE *)&self->_flags & 0x80) != 0)
      goto LABEL_5;
LABEL_13:
    v7 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_6;
LABEL_14:
    v12 = 0;
    goto LABEL_17;
  }
LABEL_12:
  v6 = 0;
  if ((*(_BYTE *)&self->_flags & 0x80) == 0)
    goto LABEL_13;
LABEL_5:
  v7 = 2654435761 * self->_ttlUiNotificationShown;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_14;
LABEL_6:
  earliestDepartureOffset = self->_earliestDepartureOffset;
  v9 = -earliestDepartureOffset;
  if (earliestDepartureOffset >= 0.0)
    v9 = self->_earliestDepartureOffset;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0)
      v12 += (unint64_t)v11;
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_17:
  if ((flags & 8) != 0)
  {
    latestDepartureOffset = self->_latestDepartureOffset;
    v15 = -latestDepartureOffset;
    if (latestDepartureOffset >= 0.0)
      v15 = self->_latestDepartureOffset;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 += (unint64_t)v17;
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v13 = 0;
  }
  if ((flags & 1) != 0)
  {
    earliestArrivalOffset = self->_earliestArrivalOffset;
    v20 = -earliestArrivalOffset;
    if (earliestArrivalOffset >= 0.0)
      v20 = self->_earliestArrivalOffset;
    v21 = floor(v20 + 0.5);
    v22 = (v20 - v21) * 1.84467441e19;
    v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0)
        v18 += (unint64_t)v22;
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    v18 = 0;
  }
  if ((flags & 4) != 0)
  {
    latestArrivalOffset = self->_latestArrivalOffset;
    v25 = -latestArrivalOffset;
    if (latestArrivalOffset >= 0.0)
      v25 = self->_latestArrivalOffset;
    v26 = floor(v25 + 0.5);
    v27 = (v25 - v26) * 1.84467441e19;
    v23 = 2654435761u * (unint64_t)fmod(v26, 1.84467441e19);
    if (v27 >= 0.0)
    {
      if (v27 > 0.0)
        v23 += (unint64_t)v27;
    }
    else
    {
      v23 -= (unint64_t)fabs(v27);
    }
  }
  else
  {
    v23 = 0;
  }
  return v5 ^ v4 ^ v6 ^ v7 ^ v12 ^ v13 ^ v18 ^ v23;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 56);
  if ((v4 & 0x20) != 0)
  {
    self->_departure = *((_DWORD *)v5 + 11);
    *(_BYTE *)&self->_flags |= 0x20u;
    v4 = *((_BYTE *)v5 + 56);
    if ((v4 & 0x10) == 0)
    {
LABEL_3:
      if ((v4 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else if ((*((_BYTE *)v5 + 56) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_arrival = *((_DWORD *)v5 + 10);
  *(_BYTE *)&self->_flags |= 0x10u;
  v4 = *((_BYTE *)v5 + 56);
  if ((v4 & 0x40) == 0)
  {
LABEL_4:
    if ((v4 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  self->_numberOfReroutes = *((_DWORD *)v5 + 12);
  *(_BYTE *)&self->_flags |= 0x40u;
  v4 = *((_BYTE *)v5 + 56);
  if ((v4 & 0x80) == 0)
  {
LABEL_5:
    if ((v4 & 2) == 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  self->_ttlUiNotificationShown = *((_DWORD *)v5 + 13);
  *(_BYTE *)&self->_flags |= 0x80u;
  v4 = *((_BYTE *)v5 + 56);
  if ((v4 & 2) == 0)
  {
LABEL_6:
    if ((v4 & 8) == 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  self->_earliestDepartureOffset = *((double *)v5 + 2);
  *(_BYTE *)&self->_flags |= 2u;
  v4 = *((_BYTE *)v5 + 56);
  if ((v4 & 8) == 0)
  {
LABEL_7:
    if ((v4 & 1) == 0)
      goto LABEL_8;
LABEL_17:
    self->_earliestArrivalOffset = *((double *)v5 + 1);
    *(_BYTE *)&self->_flags |= 1u;
    if ((*((_BYTE *)v5 + 56) & 4) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_16:
  self->_latestDepartureOffset = *((double *)v5 + 4);
  *(_BYTE *)&self->_flags |= 8u;
  v4 = *((_BYTE *)v5 + 56);
  if ((v4 & 1) != 0)
    goto LABEL_17;
LABEL_8:
  if ((v4 & 4) != 0)
  {
LABEL_9:
    self->_latestArrivalOffset = *((double *)v5 + 3);
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_10:

}

@end

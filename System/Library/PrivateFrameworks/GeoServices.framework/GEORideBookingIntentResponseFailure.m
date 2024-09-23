@implementation GEORideBookingIntentResponseFailure

- (int)intent
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_intent;
  else
    return 0;
}

- (void)setIntent:(int)a3
{
  *(_BYTE *)&self->_flags |= 2u;
  self->_intent = a3;
}

- (void)setHasIntent:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIntent
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)intentAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C21AB8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsIntent:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBI_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBI_HANDLE_LIST_RIDE_OPTIONS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBI_CONFIRM_REQUEST_RIDE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBI_HANDLE_REQUEST_RIDE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBI_HANDLE_GET_RIDE_STATUS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBI_CONFIRM_CANCEL")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBI_HANDLE_CANCEL")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RBI_HANDLE_SEND_FEEDBACK")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)failure
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_failure;
  else
    return 0;
}

- (void)setFailure:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_failure = a3;
}

- (void)setHasFailure:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasFailure
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)failureAsString:(int)a3
{
  if (a3 < 0x12)
    return off_1E1C21AF8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFailure:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBRF_NOT_SET")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBRF_RESPONSE_TIMEOUT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBRF_RESPONSE_NIL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBRF_RESPONSE_CODE_UNSPECIFIED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBRF_RESPONSE_CODE_GENERIC_ERROR")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBRF_RESPONSE_CODE_REQUIRES_APP_LAUNCH")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBRF_RESPONSE_CODE_REQUIRES_VERIFY_CREDENTIALS")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBRF_RESPONSE_CODE_NO_SERVICE_IN_AREA")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBRF_RESPONSE_CODE_SERVICE_TEMPORARILY_UNAVAILABLE")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBRF_RESPONSE_CODE_REQUIRES_APP_COMPLETION")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBRF_RESPONSE_CODE_REQUIRES_FEEDBACK")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBRF_RESPONSE_RIDE_OPTION_MISSING_NAME")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBRF_RESPONSE_RIDE_OPTION_MISSING_ETA")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBRF_RESPONSE_RIDE_MISSING_IDENTIFIER")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBRF_RESPONSE_RIDE_PHASE_UNKNOWN")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBRF_RESPONSE_RIDE_OPTIONS_NOT_AVAILABLE")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RBRF_RESPONSE_RIDE_PICKUP_LOCATION_INVALID")) & 1) != 0)
  {
    v4 = 16;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RBRF_RESPONSE_RIDE_VEHICLE_LOCATION_INVALID")))
  {
    v4 = 17;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)GEORideBookingIntentResponseFailure;
  -[GEORideBookingIntentResponseFailure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORideBookingIntentResponseFailure dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  char v3;
  uint64_t v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_BYTE *)(a1 + 16);
    if ((v3 & 2) != 0)
    {
      v4 = *(int *)(a1 + 12);
      if (v4 >= 8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 12));
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = off_1E1C21AB8[v4];
      }
      objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("intent"));

      v3 = *(_BYTE *)(a1 + 16);
    }
    if ((v3 & 1) != 0)
    {
      v6 = *(int *)(a1 + 8);
      if (v6 >= 0x12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 8));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E1C21AF8[v6];
      }
      objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("failure"));

    }
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (GEORideBookingIntentResponseFailure)initWithDictionary:(id)a3
{
  return (GEORideBookingIntentResponseFailure *)-[GEORideBookingIntentResponseFailure _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;

  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("intent"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v4;
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RBI_UNKNOWN")) & 1) != 0)
        {
          v6 = 0;
        }
        else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RBI_HANDLE_LIST_RIDE_OPTIONS")) & 1) != 0)
        {
          v6 = 1;
        }
        else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RBI_CONFIRM_REQUEST_RIDE")) & 1) != 0)
        {
          v6 = 2;
        }
        else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RBI_HANDLE_REQUEST_RIDE")) & 1) != 0)
        {
          v6 = 3;
        }
        else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RBI_HANDLE_GET_RIDE_STATUS")) & 1) != 0)
        {
          v6 = 4;
        }
        else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RBI_CONFIRM_CANCEL")) & 1) != 0)
        {
          v6 = 5;
        }
        else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("RBI_HANDLE_CANCEL")) & 1) != 0)
        {
          v6 = 6;
        }
        else if (objc_msgSend(v5, "isEqualToString:", CFSTR("RBI_HANDLE_SEND_FEEDBACK")))
        {
          v6 = 7;
        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_25;
        v6 = objc_msgSend(v4, "intValue");
      }
      objc_msgSend(a1, "setIntent:", v6);
LABEL_25:

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("failure"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RBRF_NOT_SET")) & 1) != 0)
        {
          v9 = 0;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RBRF_RESPONSE_TIMEOUT")) & 1) != 0)
        {
          v9 = 1;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RBRF_RESPONSE_NIL")) & 1) != 0)
        {
          v9 = 2;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RBRF_RESPONSE_CODE_UNSPECIFIED")) & 1) != 0)
        {
          v9 = 3;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RBRF_RESPONSE_CODE_GENERIC_ERROR")) & 1) != 0)
        {
          v9 = 4;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RBRF_RESPONSE_CODE_REQUIRES_APP_LAUNCH")) & 1) != 0)
        {
          v9 = 5;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RBRF_RESPONSE_CODE_REQUIRES_VERIFY_CREDENTIALS")) & 1) != 0)
        {
          v9 = 6;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RBRF_RESPONSE_CODE_NO_SERVICE_IN_AREA")) & 1) != 0)
        {
          v9 = 7;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RBRF_RESPONSE_CODE_SERVICE_TEMPORARILY_UNAVAILABLE")) & 1) != 0)
        {
          v9 = 8;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RBRF_RESPONSE_CODE_REQUIRES_APP_COMPLETION")) & 1) != 0)
        {
          v9 = 9;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RBRF_RESPONSE_CODE_REQUIRES_FEEDBACK")) & 1) != 0)
        {
          v9 = 10;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RBRF_RESPONSE_RIDE_OPTION_MISSING_NAME")) & 1) != 0)
        {
          v9 = 11;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RBRF_RESPONSE_RIDE_OPTION_MISSING_ETA")) & 1) != 0)
        {
          v9 = 12;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RBRF_RESPONSE_RIDE_MISSING_IDENTIFIER")) & 1) != 0)
        {
          v9 = 13;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RBRF_RESPONSE_RIDE_PHASE_UNKNOWN")) & 1) != 0)
        {
          v9 = 14;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RBRF_RESPONSE_RIDE_OPTIONS_NOT_AVAILABLE")) & 1) != 0)
        {
          v9 = 15;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RBRF_RESPONSE_RIDE_PICKUP_LOCATION_INVALID")) & 1) != 0)
        {
          v9 = 16;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("RBRF_RESPONSE_RIDE_VEHICLE_LOCATION_INVALID")))
        {
          v9 = 17;
        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_67:

          goto LABEL_68;
        }
        v9 = objc_msgSend(v7, "intValue");
      }
      objc_msgSend(a1, "setFailure:", v9);
      goto LABEL_67;
    }
  }
LABEL_68:

  return a1;
}

- (GEORideBookingIntentResponseFailure)initWithJSON:(id)a3
{
  return (GEORideBookingIntentResponseFailure *)-[GEORideBookingIntentResponseFailure _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEORideBookingIntentResponseFailureIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORideBookingIntentResponseFailureReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char flags;
  id v6;

  v4 = a3;
  flags = (char)self->_flags;
  v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  _DWORD *v5;

  v5 = a3;
  -[GEORideBookingIntentResponseFailure readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[3] = self->_intent;
    *((_BYTE *)v5 + 16) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v5[2] = self->_failure;
    *((_BYTE *)v5 + 16) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_intent;
    *((_BYTE *)result + 16) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_failure;
    *((_BYTE *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  -[GEORideBookingIntentResponseFailure readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0 || self->_intent != *((_DWORD *)v4 + 3))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_failure != *((_DWORD *)v4 + 2))
      goto LABEL_11;
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEORideBookingIntentResponseFailure readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v3 = 2654435761 * self->_intent;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    return v4 ^ v3;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_failure;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  char v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_BYTE *)v5 + 16);
  if ((v4 & 2) != 0)
  {
    self->_intent = v5[3];
    *(_BYTE *)&self->_flags |= 2u;
    v4 = *((_BYTE *)v5 + 16);
  }
  if ((v4 & 1) != 0)
  {
    self->_failure = v5[2];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

@end

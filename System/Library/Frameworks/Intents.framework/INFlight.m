@implementation INFlight

- (INFlight)initWithAirline:(INAirline *)airline flightNumber:(NSString *)flightNumber boardingTime:(INDateComponentsRange *)boardingTime flightDuration:(INDateComponentsRange *)flightDuration departureAirportGate:(INAirportGate *)departureAirportGate arrivalAirportGate:(INAirportGate *)arrivalAirportGate
{
  INAirline *v14;
  NSString *v15;
  INDateComponentsRange *v16;
  INDateComponentsRange *v17;
  INAirportGate *v18;
  INAirportGate *v19;
  INFlight *v20;
  uint64_t v21;
  INAirline *v22;
  uint64_t v23;
  NSString *v24;
  uint64_t v25;
  INDateComponentsRange *v26;
  uint64_t v27;
  INDateComponentsRange *v28;
  uint64_t v29;
  INAirportGate *v30;
  uint64_t v31;
  INAirportGate *v32;
  objc_super v34;

  v14 = airline;
  v15 = flightNumber;
  v16 = boardingTime;
  v17 = flightDuration;
  v18 = departureAirportGate;
  v19 = arrivalAirportGate;
  v34.receiver = self;
  v34.super_class = (Class)INFlight;
  v20 = -[INFlight init](&v34, sel_init);
  if (v20)
  {
    v21 = -[INAirline copy](v14, "copy");
    v22 = v20->_airline;
    v20->_airline = (INAirline *)v21;

    v23 = -[NSString copy](v15, "copy");
    v24 = v20->_flightNumber;
    v20->_flightNumber = (NSString *)v23;

    v25 = -[INDateComponentsRange copy](v16, "copy");
    v26 = v20->_boardingTime;
    v20->_boardingTime = (INDateComponentsRange *)v25;

    v27 = -[INDateComponentsRange copy](v17, "copy");
    v28 = v20->_flightDuration;
    v20->_flightDuration = (INDateComponentsRange *)v27;

    v29 = -[INAirportGate copy](v18, "copy");
    v30 = v20->_departureAirportGate;
    v20->_departureAirportGate = (INAirportGate *)v29;

    v31 = -[INAirportGate copy](v19, "copy");
    v32 = v20->_arrivalAirportGate;
    v20->_arrivalAirportGate = (INAirportGate *)v31;

  }
  return v20;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[INAirline hash](self->_airline, "hash");
  v4 = -[NSString hash](self->_flightNumber, "hash") ^ v3;
  v5 = -[INDateComponentsRange hash](self->_boardingTime, "hash");
  v6 = v4 ^ v5 ^ -[INDateComponentsRange hash](self->_flightDuration, "hash");
  v7 = -[INAirportGate hash](self->_departureAirportGate, "hash");
  return v6 ^ v7 ^ -[INAirportGate hash](self->_arrivalAirportGate, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INFlight *v4;
  INFlight *v5;
  INAirline *airline;
  NSString *flightNumber;
  INDateComponentsRange *boardingTime;
  INDateComponentsRange *flightDuration;
  INAirportGate *departureAirportGate;
  INAirportGate *arrivalAirportGate;
  BOOL v12;

  v4 = (INFlight *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      airline = self->_airline;
      v12 = 0;
      if (airline == v5->_airline || -[INAirline isEqual:](airline, "isEqual:"))
      {
        flightNumber = self->_flightNumber;
        if (flightNumber == v5->_flightNumber || -[NSString isEqual:](flightNumber, "isEqual:"))
        {
          boardingTime = self->_boardingTime;
          if (boardingTime == v5->_boardingTime || -[INDateComponentsRange isEqual:](boardingTime, "isEqual:"))
          {
            flightDuration = self->_flightDuration;
            if (flightDuration == v5->_flightDuration || -[INDateComponentsRange isEqual:](flightDuration, "isEqual:"))
            {
              departureAirportGate = self->_departureAirportGate;
              if (departureAirportGate == v5->_departureAirportGate
                || -[INAirportGate isEqual:](departureAirportGate, "isEqual:"))
              {
                arrivalAirportGate = self->_arrivalAirportGate;
                if (arrivalAirportGate == v5->_arrivalAirportGate
                  || -[INAirportGate isEqual:](arrivalAirportGate, "isEqual:"))
                {
                  v12 = 1;
                }
              }
            }
          }
        }
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (INFlight)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  INFlight *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("airline"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("flightNumber"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("boardingTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("flightDuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("departureAirportGate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("arrivalAirportGate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[INFlight initWithAirline:flightNumber:boardingTime:flightDuration:departureAirportGate:arrivalAirportGate:](self, "initWithAirline:flightNumber:boardingTime:flightDuration:departureAirportGate:arrivalAirportGate:", v5, v9, v10, v11, v12, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  INAirline *airline;
  id v5;

  airline = self->_airline;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", airline, CFSTR("airline"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_flightNumber, CFSTR("flightNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_boardingTime, CFSTR("boardingTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_flightDuration, CFSTR("flightDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_departureAirportGate, CFSTR("departureAirportGate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_arrivalAirportGate, CFSTR("arrivalAirportGate"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_airline);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("airline"));

  objc_msgSend(v6, "encodeObject:", self->_flightNumber);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("flightNumber"));

  objc_msgSend(v6, "encodeObject:", self->_boardingTime);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("boardingTime"));

  objc_msgSend(v6, "encodeObject:", self->_flightDuration);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("flightDuration"));

  objc_msgSend(v6, "encodeObject:", self->_departureAirportGate);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("departureAirportGate"));

  objc_msgSend(v6, "encodeObject:", self->_arrivalAirportGate);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("arrivalAirportGate"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INFlight descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INFlight;
  -[INFlight description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INFlight _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  INAirline *airline;
  uint64_t v4;
  NSString *flightNumber;
  uint64_t v6;
  INDateComponentsRange *boardingTime;
  uint64_t v8;
  INDateComponentsRange *flightDuration;
  void *v10;
  INAirportGate *departureAirportGate;
  void *v12;
  INAirportGate *arrivalAirportGate;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  _QWORD v27[7];

  v27[6] = *MEMORY[0x1E0C80C00];
  v21 = CFSTR("airline");
  airline = self->_airline;
  v4 = (uint64_t)airline;
  if (!airline)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v4;
  v27[0] = v4;
  v22 = CFSTR("flightNumber");
  flightNumber = self->_flightNumber;
  v6 = (uint64_t)flightNumber;
  if (!flightNumber)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v6;
  v27[1] = v6;
  v23 = CFSTR("boardingTime");
  boardingTime = self->_boardingTime;
  v8 = (uint64_t)boardingTime;
  if (!boardingTime)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v8;
  v27[2] = v8;
  v24 = CFSTR("flightDuration");
  flightDuration = self->_flightDuration;
  v10 = flightDuration;
  if (!flightDuration)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v8, v19, v20, v21, v22, v23, v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[3] = v10;
  v25 = CFSTR("departureAirportGate");
  departureAirportGate = self->_departureAirportGate;
  v12 = departureAirportGate;
  if (!departureAirportGate)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[4] = v12;
  v26 = CFSTR("arrivalAirportGate");
  arrivalAirportGate = self->_arrivalAirportGate;
  v14 = arrivalAirportGate;
  if (!arrivalAirportGate)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v21, 6, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (arrivalAirportGate)
  {
    if (departureAirportGate)
      goto LABEL_15;
  }
  else
  {

    if (departureAirportGate)
    {
LABEL_15:
      if (flightDuration)
        goto LABEL_16;
      goto LABEL_22;
    }
  }

  if (flightDuration)
  {
LABEL_16:
    if (boardingTime)
      goto LABEL_17;
    goto LABEL_23;
  }
LABEL_22:

  if (boardingTime)
  {
LABEL_17:
    if (flightNumber)
      goto LABEL_18;
LABEL_24:

    if (airline)
      return v15;
LABEL_25:

    return v15;
  }
LABEL_23:

  if (!flightNumber)
    goto LABEL_24;
LABEL_18:
  if (!airline)
    goto LABEL_25;
  return v15;
}

- (INAirline)airline
{
  return self->_airline;
}

- (NSString)flightNumber
{
  return self->_flightNumber;
}

- (INDateComponentsRange)boardingTime
{
  return self->_boardingTime;
}

- (INDateComponentsRange)flightDuration
{
  return self->_flightDuration;
}

- (INAirportGate)departureAirportGate
{
  return self->_departureAirportGate;
}

- (INAirportGate)arrivalAirportGate
{
  return self->_arrivalAirportGate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalAirportGate, 0);
  objc_storeStrong((id *)&self->_departureAirportGate, 0);
  objc_storeStrong((id *)&self->_flightDuration, 0);
  objc_storeStrong((id *)&self->_boardingTime, 0);
  objc_storeStrong((id *)&self->_flightNumber, 0);
  objc_storeStrong((id *)&self->_airline, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("airline"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flightNumber"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("boardingTime"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("flightDuration"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("departureAirportGate"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("arrivalAirportGate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAirline:flightNumber:boardingTime:flightDuration:departureAirportGate:arrivalAirportGate:", v11, v12, v15, v18, v21, v24);
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

@end

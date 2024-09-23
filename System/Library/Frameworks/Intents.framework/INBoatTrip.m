@implementation INBoatTrip

- (INBoatTrip)initWithProvider:(NSString *)provider boatName:(NSString *)boatName boatNumber:(NSString *)boatNumber tripDuration:(INDateComponentsRange *)tripDuration departureBoatTerminalLocation:(CLPlacemark *)departureBoatTerminalLocation arrivalBoatTerminalLocation:(CLPlacemark *)arrivalBoatTerminalLocation
{
  NSString *v14;
  NSString *v15;
  NSString *v16;
  INDateComponentsRange *v17;
  CLPlacemark *v18;
  CLPlacemark *v19;
  INBoatTrip *v20;
  uint64_t v21;
  NSString *v22;
  uint64_t v23;
  NSString *v24;
  uint64_t v25;
  NSString *v26;
  uint64_t v27;
  INDateComponentsRange *v28;
  uint64_t v29;
  CLPlacemark *v30;
  uint64_t v31;
  CLPlacemark *v32;
  objc_super v34;

  v14 = provider;
  v15 = boatName;
  v16 = boatNumber;
  v17 = tripDuration;
  v18 = departureBoatTerminalLocation;
  v19 = arrivalBoatTerminalLocation;
  v34.receiver = self;
  v34.super_class = (Class)INBoatTrip;
  v20 = -[INBoatTrip init](&v34, sel_init);
  if (v20)
  {
    v21 = -[NSString copy](v14, "copy");
    v22 = v20->_provider;
    v20->_provider = (NSString *)v21;

    v23 = -[NSString copy](v15, "copy");
    v24 = v20->_boatName;
    v20->_boatName = (NSString *)v23;

    v25 = -[NSString copy](v16, "copy");
    v26 = v20->_boatNumber;
    v20->_boatNumber = (NSString *)v25;

    v27 = -[INDateComponentsRange copy](v17, "copy");
    v28 = v20->_tripDuration;
    v20->_tripDuration = (INDateComponentsRange *)v27;

    v29 = -[CLPlacemark copy](v18, "copy");
    v30 = v20->_departureBoatTerminalLocation;
    v20->_departureBoatTerminalLocation = (CLPlacemark *)v29;

    v31 = -[CLPlacemark copy](v19, "copy");
    v32 = v20->_arrivalBoatTerminalLocation;
    v20->_arrivalBoatTerminalLocation = (CLPlacemark *)v31;

  }
  return v20;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_provider, "hash");
  v4 = -[NSString hash](self->_boatName, "hash") ^ v3;
  v5 = -[NSString hash](self->_boatNumber, "hash");
  v6 = v4 ^ v5 ^ -[INDateComponentsRange hash](self->_tripDuration, "hash");
  v7 = -[CLPlacemark hash](self->_departureBoatTerminalLocation, "hash");
  return v6 ^ v7 ^ -[CLPlacemark hash](self->_arrivalBoatTerminalLocation, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INBoatTrip *v4;
  INBoatTrip *v5;
  NSString *provider;
  NSString *boatName;
  NSString *boatNumber;
  INDateComponentsRange *tripDuration;
  CLPlacemark *departureBoatTerminalLocation;
  CLPlacemark *arrivalBoatTerminalLocation;
  BOOL v12;

  v4 = (INBoatTrip *)a3;
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
      provider = self->_provider;
      v12 = 0;
      if (provider == v5->_provider || -[NSString isEqual:](provider, "isEqual:"))
      {
        boatName = self->_boatName;
        if (boatName == v5->_boatName || -[NSString isEqual:](boatName, "isEqual:"))
        {
          boatNumber = self->_boatNumber;
          if (boatNumber == v5->_boatNumber || -[NSString isEqual:](boatNumber, "isEqual:"))
          {
            tripDuration = self->_tripDuration;
            if (tripDuration == v5->_tripDuration || -[INDateComponentsRange isEqual:](tripDuration, "isEqual:"))
            {
              departureBoatTerminalLocation = self->_departureBoatTerminalLocation;
              if (departureBoatTerminalLocation == v5->_departureBoatTerminalLocation
                || -[CLPlacemark isEqual:](departureBoatTerminalLocation, "isEqual:"))
              {
                arrivalBoatTerminalLocation = self->_arrivalBoatTerminalLocation;
                if (arrivalBoatTerminalLocation == v5->_arrivalBoatTerminalLocation
                  || -[CLPlacemark isEqual:](arrivalBoatTerminalLocation, "isEqual:"))
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

- (INBoatTrip)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  INBoatTrip *v20;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("provider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("boatName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v15, CFSTR("boatNumber"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tripDuration"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("departureBoatTerminalLocation"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("arrivalBoatTerminalLocation"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[INBoatTrip initWithProvider:boatName:boatNumber:tripDuration:departureBoatTerminalLocation:arrivalBoatTerminalLocation:](self, "initWithProvider:boatName:boatNumber:tripDuration:departureBoatTerminalLocation:arrivalBoatTerminalLocation:", v8, v12, v16, v17, v18, v19);
  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *provider;
  id v5;

  provider = self->_provider;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", provider, CFSTR("provider"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_boatName, CFSTR("boatName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_boatNumber, CFSTR("boatNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tripDuration, CFSTR("tripDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_departureBoatTerminalLocation, CFSTR("departureBoatTerminalLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_arrivalBoatTerminalLocation, CFSTR("arrivalBoatTerminalLocation"));

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
  objc_msgSend(v6, "encodeObject:", self->_provider);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("provider"));

  objc_msgSend(v6, "encodeObject:", self->_boatName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("boatName"));

  objc_msgSend(v6, "encodeObject:", self->_boatNumber);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("boatNumber"));

  objc_msgSend(v6, "encodeObject:", self->_tripDuration);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("tripDuration"));

  objc_msgSend(v6, "encodeObject:", self->_departureBoatTerminalLocation);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("departureBoatTerminalLocation"));

  objc_msgSend(v6, "encodeObject:", self->_arrivalBoatTerminalLocation);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("arrivalBoatTerminalLocation"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INBoatTrip descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INBoatTrip;
  -[INBoatTrip description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INBoatTrip _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *provider;
  uint64_t v4;
  NSString *boatName;
  uint64_t v6;
  NSString *boatNumber;
  uint64_t v8;
  INDateComponentsRange *tripDuration;
  void *v10;
  CLPlacemark *departureBoatTerminalLocation;
  void *v12;
  CLPlacemark *arrivalBoatTerminalLocation;
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
  v21 = CFSTR("provider");
  provider = self->_provider;
  v4 = (uint64_t)provider;
  if (!provider)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v4;
  v27[0] = v4;
  v22 = CFSTR("boatName");
  boatName = self->_boatName;
  v6 = (uint64_t)boatName;
  if (!boatName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v6;
  v27[1] = v6;
  v23 = CFSTR("boatNumber");
  boatNumber = self->_boatNumber;
  v8 = (uint64_t)boatNumber;
  if (!boatNumber)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v17 = v8;
  v27[2] = v8;
  v24 = CFSTR("tripDuration");
  tripDuration = self->_tripDuration;
  v10 = tripDuration;
  if (!tripDuration)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v8, v19, v20, v21, v22, v23, v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[3] = v10;
  v25 = CFSTR("departureBoatTerminalLocation");
  departureBoatTerminalLocation = self->_departureBoatTerminalLocation;
  v12 = departureBoatTerminalLocation;
  if (!departureBoatTerminalLocation)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[4] = v12;
  v26 = CFSTR("arrivalBoatTerminalLocation");
  arrivalBoatTerminalLocation = self->_arrivalBoatTerminalLocation;
  v14 = arrivalBoatTerminalLocation;
  if (!arrivalBoatTerminalLocation)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v21, 6, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (arrivalBoatTerminalLocation)
  {
    if (departureBoatTerminalLocation)
      goto LABEL_15;
  }
  else
  {

    if (departureBoatTerminalLocation)
    {
LABEL_15:
      if (tripDuration)
        goto LABEL_16;
      goto LABEL_22;
    }
  }

  if (tripDuration)
  {
LABEL_16:
    if (boatNumber)
      goto LABEL_17;
    goto LABEL_23;
  }
LABEL_22:

  if (boatNumber)
  {
LABEL_17:
    if (boatName)
      goto LABEL_18;
LABEL_24:

    if (provider)
      return v15;
LABEL_25:

    return v15;
  }
LABEL_23:

  if (!boatName)
    goto LABEL_24;
LABEL_18:
  if (!provider)
    goto LABEL_25;
  return v15;
}

- (NSString)provider
{
  return self->_provider;
}

- (NSString)boatName
{
  return self->_boatName;
}

- (NSString)boatNumber
{
  return self->_boatNumber;
}

- (INDateComponentsRange)tripDuration
{
  return self->_tripDuration;
}

- (CLPlacemark)departureBoatTerminalLocation
{
  return self->_departureBoatTerminalLocation;
}

- (CLPlacemark)arrivalBoatTerminalLocation
{
  return self->_arrivalBoatTerminalLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalBoatTerminalLocation, 0);
  objc_storeStrong((id *)&self->_departureBoatTerminalLocation, 0);
  objc_storeStrong((id *)&self->_tripDuration, 0);
  objc_storeStrong((id *)&self->_boatNumber, 0);
  objc_storeStrong((id *)&self->_boatName, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("provider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("boatName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("boatNumber"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("tripDuration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("departureBoatTerminalLocation"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("arrivalBoatTerminalLocation"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProvider:boatName:boatNumber:tripDuration:departureBoatTerminalLocation:arrivalBoatTerminalLocation:", v9, v10, v11, v14, v17, v20);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

@end

@implementation INBusTrip

- (INBusTrip)initWithProvider:(NSString *)provider busName:(NSString *)busName busNumber:(NSString *)busNumber tripDuration:(INDateComponentsRange *)tripDuration departureBusStopLocation:(CLPlacemark *)departureBusStopLocation departurePlatform:(NSString *)departurePlatform arrivalBusStopLocation:(CLPlacemark *)arrivalBusStopLocation arrivalPlatform:(NSString *)arrivalPlatform
{
  NSString *v16;
  NSString *v17;
  NSString *v18;
  INDateComponentsRange *v19;
  CLPlacemark *v20;
  NSString *v21;
  CLPlacemark *v22;
  NSString *v23;
  INBusTrip *v24;
  uint64_t v25;
  NSString *v26;
  uint64_t v27;
  NSString *v28;
  uint64_t v29;
  NSString *v30;
  uint64_t v31;
  INDateComponentsRange *v32;
  uint64_t v33;
  CLPlacemark *v34;
  uint64_t v35;
  NSString *v36;
  uint64_t v37;
  CLPlacemark *v38;
  uint64_t v39;
  NSString *v40;
  objc_super v42;

  v16 = provider;
  v17 = busName;
  v18 = busNumber;
  v19 = tripDuration;
  v20 = departureBusStopLocation;
  v21 = departurePlatform;
  v22 = arrivalBusStopLocation;
  v23 = arrivalPlatform;
  v42.receiver = self;
  v42.super_class = (Class)INBusTrip;
  v24 = -[INBusTrip init](&v42, sel_init);
  if (v24)
  {
    v25 = -[NSString copy](v16, "copy");
    v26 = v24->_provider;
    v24->_provider = (NSString *)v25;

    v27 = -[NSString copy](v17, "copy");
    v28 = v24->_busName;
    v24->_busName = (NSString *)v27;

    v29 = -[NSString copy](v18, "copy");
    v30 = v24->_busNumber;
    v24->_busNumber = (NSString *)v29;

    v31 = -[INDateComponentsRange copy](v19, "copy");
    v32 = v24->_tripDuration;
    v24->_tripDuration = (INDateComponentsRange *)v31;

    v33 = -[CLPlacemark copy](v20, "copy");
    v34 = v24->_departureBusStopLocation;
    v24->_departureBusStopLocation = (CLPlacemark *)v33;

    v35 = -[NSString copy](v21, "copy");
    v36 = v24->_departurePlatform;
    v24->_departurePlatform = (NSString *)v35;

    v37 = -[CLPlacemark copy](v22, "copy");
    v38 = v24->_arrivalBusStopLocation;
    v24->_arrivalBusStopLocation = (CLPlacemark *)v37;

    v39 = -[NSString copy](v23, "copy");
    v40 = v24->_arrivalPlatform;
    v24->_arrivalPlatform = (NSString *)v39;

  }
  return v24;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;

  v3 = -[NSString hash](self->_provider, "hash");
  v4 = -[NSString hash](self->_busName, "hash") ^ v3;
  v5 = -[NSString hash](self->_busNumber, "hash");
  v6 = v4 ^ v5 ^ -[INDateComponentsRange hash](self->_tripDuration, "hash");
  v7 = -[CLPlacemark hash](self->_departureBusStopLocation, "hash");
  v8 = v7 ^ -[NSString hash](self->_departurePlatform, "hash");
  v9 = v6 ^ v8 ^ -[CLPlacemark hash](self->_arrivalBusStopLocation, "hash");
  return v9 ^ -[NSString hash](self->_arrivalPlatform, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INBusTrip *v4;
  INBusTrip *v5;
  NSString *provider;
  NSString *busName;
  NSString *busNumber;
  INDateComponentsRange *tripDuration;
  CLPlacemark *departureBusStopLocation;
  NSString *departurePlatform;
  CLPlacemark *arrivalBusStopLocation;
  NSString *arrivalPlatform;
  BOOL v14;

  v4 = (INBusTrip *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      provider = self->_provider;
      v14 = 0;
      if (provider == v5->_provider || -[NSString isEqual:](provider, "isEqual:"))
      {
        busName = self->_busName;
        if (busName == v5->_busName || -[NSString isEqual:](busName, "isEqual:"))
        {
          busNumber = self->_busNumber;
          if (busNumber == v5->_busNumber || -[NSString isEqual:](busNumber, "isEqual:"))
          {
            tripDuration = self->_tripDuration;
            if (tripDuration == v5->_tripDuration || -[INDateComponentsRange isEqual:](tripDuration, "isEqual:"))
            {
              departureBusStopLocation = self->_departureBusStopLocation;
              if (departureBusStopLocation == v5->_departureBusStopLocation
                || -[CLPlacemark isEqual:](departureBusStopLocation, "isEqual:"))
              {
                departurePlatform = self->_departurePlatform;
                if (departurePlatform == v5->_departurePlatform
                  || -[NSString isEqual:](departurePlatform, "isEqual:"))
                {
                  arrivalBusStopLocation = self->_arrivalBusStopLocation;
                  if (arrivalBusStopLocation == v5->_arrivalBusStopLocation
                    || -[CLPlacemark isEqual:](arrivalBusStopLocation, "isEqual:"))
                  {
                    arrivalPlatform = self->_arrivalPlatform;
                    if (arrivalPlatform == v5->_arrivalPlatform
                      || -[NSString isEqual:](arrivalPlatform, "isEqual:"))
                    {
                      v14 = 1;
                    }
                  }
                }
              }
            }
          }
        }
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (INBusTrip)initWithCoder:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  INBusTrip *v25;
  void *v27;
  void *v28;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("provider"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("busName"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("busNumber"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tripDuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("departureBusStopLocation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("departurePlatform"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("arrivalBusStopLocation"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("arrivalPlatform"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[INBusTrip initWithProvider:busName:busNumber:tripDuration:departureBusStopLocation:departurePlatform:arrivalBusStopLocation:arrivalPlatform:](self, "initWithProvider:busName:busNumber:tripDuration:departureBusStopLocation:departurePlatform:arrivalBusStopLocation:arrivalPlatform:", v28, v27, v13, v14, v15, v19, v20, v24);
  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *provider;
  id v5;

  provider = self->_provider;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", provider, CFSTR("provider"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_busName, CFSTR("busName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_busNumber, CFSTR("busNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tripDuration, CFSTR("tripDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_departureBusStopLocation, CFSTR("departureBusStopLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_departurePlatform, CFSTR("departurePlatform"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_arrivalBusStopLocation, CFSTR("arrivalBusStopLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_arrivalPlatform, CFSTR("arrivalPlatform"));

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
  void *v14;
  void *v15;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_provider);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("provider"));

  objc_msgSend(v6, "encodeObject:", self->_busName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("busName"));

  objc_msgSend(v6, "encodeObject:", self->_busNumber);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("busNumber"));

  objc_msgSend(v6, "encodeObject:", self->_tripDuration);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("tripDuration"));

  objc_msgSend(v6, "encodeObject:", self->_departureBusStopLocation);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("departureBusStopLocation"));

  objc_msgSend(v6, "encodeObject:", self->_departurePlatform);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("departurePlatform"));

  objc_msgSend(v6, "encodeObject:", self->_arrivalBusStopLocation);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("arrivalBusStopLocation"));

  objc_msgSend(v6, "encodeObject:", self->_arrivalPlatform);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("arrivalPlatform"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INBusTrip descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INBusTrip;
  -[INBusTrip description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INBusTrip _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  uint64_t busName;
  NSString *busNumber;
  uint64_t v6;
  INDateComponentsRange *tripDuration;
  uint64_t v8;
  CLPlacemark *departureBusStopLocation;
  uint64_t v10;
  NSString *departurePlatform;
  void *v12;
  CLPlacemark *arrivalBusStopLocation;
  void *v14;
  NSString *arrivalPlatform;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSString *provider;
  _QWORD v26[8];
  _QWORD v27[10];

  v27[8] = *MEMORY[0x1E0C80C00];
  provider = self->_provider;
  v3 = (uint64_t)provider;
  v26[0] = CFSTR("provider");
  if (!provider)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v27[0] = v3;
  v26[1] = CFSTR("busName");
  busName = (uint64_t)self->_busName;
  v23 = busName;
  if (!busName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    busName = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)busName;
  v27[1] = busName;
  v26[2] = CFSTR("busNumber");
  busNumber = self->_busNumber;
  v6 = (uint64_t)busNumber;
  if (!busNumber)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v6;
  v27[2] = v6;
  v26[3] = CFSTR("tripDuration");
  tripDuration = self->_tripDuration;
  v8 = (uint64_t)tripDuration;
  if (!tripDuration)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v24 = (void *)v3;
  v20 = (void *)v8;
  v27[3] = v8;
  v26[4] = CFSTR("departureBusStopLocation");
  departureBusStopLocation = self->_departureBusStopLocation;
  v10 = (uint64_t)departureBusStopLocation;
  if (!departureBusStopLocation)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)v10;
  v27[4] = v10;
  v26[5] = CFSTR("departurePlatform");
  departurePlatform = self->_departurePlatform;
  v12 = departurePlatform;
  if (!departurePlatform)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[5] = v12;
  v26[6] = CFSTR("arrivalBusStopLocation");
  arrivalBusStopLocation = self->_arrivalBusStopLocation;
  v14 = arrivalBusStopLocation;
  if (!arrivalBusStopLocation)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[6] = v14;
  v26[7] = CFSTR("arrivalPlatform");
  arrivalPlatform = self->_arrivalPlatform;
  v16 = arrivalPlatform;
  if (!arrivalPlatform)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[7] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (arrivalPlatform)
  {
    if (arrivalBusStopLocation)
      goto LABEL_19;
  }
  else
  {

    if (arrivalBusStopLocation)
    {
LABEL_19:
      if (departurePlatform)
        goto LABEL_20;
LABEL_30:

      if (departureBusStopLocation)
        goto LABEL_21;
      goto LABEL_31;
    }
  }

  if (!departurePlatform)
    goto LABEL_30;
LABEL_20:
  if (departureBusStopLocation)
    goto LABEL_21;
LABEL_31:

LABEL_21:
  if (tripDuration)
  {
    if (busNumber)
      goto LABEL_23;
  }
  else
  {

    if (busNumber)
      goto LABEL_23;
  }

LABEL_23:
  if (!v23)

  if (!provider)
  return v17;
}

- (NSString)provider
{
  return self->_provider;
}

- (NSString)busName
{
  return self->_busName;
}

- (NSString)busNumber
{
  return self->_busNumber;
}

- (INDateComponentsRange)tripDuration
{
  return self->_tripDuration;
}

- (CLPlacemark)departureBusStopLocation
{
  return self->_departureBusStopLocation;
}

- (NSString)departurePlatform
{
  return self->_departurePlatform;
}

- (CLPlacemark)arrivalBusStopLocation
{
  return self->_arrivalBusStopLocation;
}

- (NSString)arrivalPlatform
{
  return self->_arrivalPlatform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalPlatform, 0);
  objc_storeStrong((id *)&self->_arrivalBusStopLocation, 0);
  objc_storeStrong((id *)&self->_departurePlatform, 0);
  objc_storeStrong((id *)&self->_departureBusStopLocation, 0);
  objc_storeStrong((id *)&self->_tripDuration, 0);
  objc_storeStrong((id *)&self->_busNumber, 0);
  objc_storeStrong((id *)&self->_busName, 0);
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
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  void *v25;
  void *v26;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("provider"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("busName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("busNumber"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("tripDuration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("departureBusStopLocation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("departurePlatform"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("arrivalBusStopLocation"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("arrivalPlatform"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v7;
    v21 = (void *)v15;
    v22 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProvider:busName:busNumber:tripDuration:departureBusStopLocation:departurePlatform:arrivalBusStopLocation:arrivalPlatform:", v26, v9, v25, v12, v15, v16, v19, v20);

    v7 = v24;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end

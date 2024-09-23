@implementation INTrainTrip

- (INTrainTrip)initWithProvider:(NSString *)provider trainName:(NSString *)trainName trainNumber:(NSString *)trainNumber tripDuration:(INDateComponentsRange *)tripDuration departureStationLocation:(CLPlacemark *)departureStationLocation departurePlatform:(NSString *)departurePlatform arrivalStationLocation:(CLPlacemark *)arrivalStationLocation arrivalPlatform:(NSString *)arrivalPlatform
{
  NSString *v16;
  NSString *v17;
  NSString *v18;
  INDateComponentsRange *v19;
  CLPlacemark *v20;
  NSString *v21;
  CLPlacemark *v22;
  NSString *v23;
  INTrainTrip *v24;
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
  v17 = trainName;
  v18 = trainNumber;
  v19 = tripDuration;
  v20 = departureStationLocation;
  v21 = departurePlatform;
  v22 = arrivalStationLocation;
  v23 = arrivalPlatform;
  v42.receiver = self;
  v42.super_class = (Class)INTrainTrip;
  v24 = -[INTrainTrip init](&v42, sel_init);
  if (v24)
  {
    v25 = -[NSString copy](v16, "copy");
    v26 = v24->_provider;
    v24->_provider = (NSString *)v25;

    v27 = -[NSString copy](v17, "copy");
    v28 = v24->_trainName;
    v24->_trainName = (NSString *)v27;

    v29 = -[NSString copy](v18, "copy");
    v30 = v24->_trainNumber;
    v24->_trainNumber = (NSString *)v29;

    v31 = -[INDateComponentsRange copy](v19, "copy");
    v32 = v24->_tripDuration;
    v24->_tripDuration = (INDateComponentsRange *)v31;

    v33 = -[CLPlacemark copy](v20, "copy");
    v34 = v24->_departureStationLocation;
    v24->_departureStationLocation = (CLPlacemark *)v33;

    v35 = -[NSString copy](v21, "copy");
    v36 = v24->_departurePlatform;
    v24->_departurePlatform = (NSString *)v35;

    v37 = -[CLPlacemark copy](v22, "copy");
    v38 = v24->_arrivalStationLocation;
    v24->_arrivalStationLocation = (CLPlacemark *)v37;

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
  v4 = -[NSString hash](self->_trainName, "hash") ^ v3;
  v5 = -[NSString hash](self->_trainNumber, "hash");
  v6 = v4 ^ v5 ^ -[INDateComponentsRange hash](self->_tripDuration, "hash");
  v7 = -[CLPlacemark hash](self->_departureStationLocation, "hash");
  v8 = v7 ^ -[NSString hash](self->_departurePlatform, "hash");
  v9 = v6 ^ v8 ^ -[CLPlacemark hash](self->_arrivalStationLocation, "hash");
  return v9 ^ -[NSString hash](self->_arrivalPlatform, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INTrainTrip *v4;
  INTrainTrip *v5;
  NSString *provider;
  NSString *trainName;
  NSString *trainNumber;
  INDateComponentsRange *tripDuration;
  CLPlacemark *departureStationLocation;
  NSString *departurePlatform;
  CLPlacemark *arrivalStationLocation;
  NSString *arrivalPlatform;
  BOOL v14;

  v4 = (INTrainTrip *)a3;
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
        trainName = self->_trainName;
        if (trainName == v5->_trainName || -[NSString isEqual:](trainName, "isEqual:"))
        {
          trainNumber = self->_trainNumber;
          if (trainNumber == v5->_trainNumber || -[NSString isEqual:](trainNumber, "isEqual:"))
          {
            tripDuration = self->_tripDuration;
            if (tripDuration == v5->_tripDuration || -[INDateComponentsRange isEqual:](tripDuration, "isEqual:"))
            {
              departureStationLocation = self->_departureStationLocation;
              if (departureStationLocation == v5->_departureStationLocation
                || -[CLPlacemark isEqual:](departureStationLocation, "isEqual:"))
              {
                departurePlatform = self->_departurePlatform;
                if (departurePlatform == v5->_departurePlatform
                  || -[NSString isEqual:](departurePlatform, "isEqual:"))
                {
                  arrivalStationLocation = self->_arrivalStationLocation;
                  if (arrivalStationLocation == v5->_arrivalStationLocation
                    || -[CLPlacemark isEqual:](arrivalStationLocation, "isEqual:"))
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

- (INTrainTrip)initWithCoder:(id)a3
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
  INTrainTrip *v25;
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
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("trainName"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("trainNumber"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tripDuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("departureStationLocation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("departurePlatform"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("arrivalStationLocation"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("arrivalPlatform"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[INTrainTrip initWithProvider:trainName:trainNumber:tripDuration:departureStationLocation:departurePlatform:arrivalStationLocation:arrivalPlatform:](self, "initWithProvider:trainName:trainNumber:tripDuration:departureStationLocation:departurePlatform:arrivalStationLocation:arrivalPlatform:", v28, v27, v13, v14, v15, v19, v20, v24);
  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *provider;
  id v5;

  provider = self->_provider;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", provider, CFSTR("provider"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trainName, CFSTR("trainName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trainNumber, CFSTR("trainNumber"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tripDuration, CFSTR("tripDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_departureStationLocation, CFSTR("departureStationLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_departurePlatform, CFSTR("departurePlatform"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_arrivalStationLocation, CFSTR("arrivalStationLocation"));
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

  objc_msgSend(v6, "encodeObject:", self->_trainName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("trainName"));

  objc_msgSend(v6, "encodeObject:", self->_trainNumber);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("trainNumber"));

  objc_msgSend(v6, "encodeObject:", self->_tripDuration);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("tripDuration"));

  objc_msgSend(v6, "encodeObject:", self->_departureStationLocation);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("departureStationLocation"));

  objc_msgSend(v6, "encodeObject:", self->_departurePlatform);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("departurePlatform"));

  objc_msgSend(v6, "encodeObject:", self->_arrivalStationLocation);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("arrivalStationLocation"));

  objc_msgSend(v6, "encodeObject:", self->_arrivalPlatform);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("arrivalPlatform"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INTrainTrip descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INTrainTrip;
  -[INTrainTrip description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INTrainTrip _dictionaryRepresentation](self, "_dictionaryRepresentation");
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
  uint64_t trainName;
  NSString *trainNumber;
  uint64_t v6;
  INDateComponentsRange *tripDuration;
  uint64_t v8;
  CLPlacemark *departureStationLocation;
  uint64_t v10;
  NSString *departurePlatform;
  void *v12;
  CLPlacemark *arrivalStationLocation;
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
  v26[1] = CFSTR("trainName");
  trainName = (uint64_t)self->_trainName;
  v23 = trainName;
  if (!trainName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    trainName = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)trainName;
  v27[1] = trainName;
  v26[2] = CFSTR("trainNumber");
  trainNumber = self->_trainNumber;
  v6 = (uint64_t)trainNumber;
  if (!trainNumber)
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
  v26[4] = CFSTR("departureStationLocation");
  departureStationLocation = self->_departureStationLocation;
  v10 = (uint64_t)departureStationLocation;
  if (!departureStationLocation)
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
  v26[6] = CFSTR("arrivalStationLocation");
  arrivalStationLocation = self->_arrivalStationLocation;
  v14 = arrivalStationLocation;
  if (!arrivalStationLocation)
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
    if (arrivalStationLocation)
      goto LABEL_19;
  }
  else
  {

    if (arrivalStationLocation)
    {
LABEL_19:
      if (departurePlatform)
        goto LABEL_20;
LABEL_30:

      if (departureStationLocation)
        goto LABEL_21;
      goto LABEL_31;
    }
  }

  if (!departurePlatform)
    goto LABEL_30;
LABEL_20:
  if (departureStationLocation)
    goto LABEL_21;
LABEL_31:

LABEL_21:
  if (tripDuration)
  {
    if (trainNumber)
      goto LABEL_23;
  }
  else
  {

    if (trainNumber)
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

- (NSString)trainName
{
  return self->_trainName;
}

- (NSString)trainNumber
{
  return self->_trainNumber;
}

- (INDateComponentsRange)tripDuration
{
  return self->_tripDuration;
}

- (CLPlacemark)departureStationLocation
{
  return self->_departureStationLocation;
}

- (NSString)departurePlatform
{
  return self->_departurePlatform;
}

- (CLPlacemark)arrivalStationLocation
{
  return self->_arrivalStationLocation;
}

- (NSString)arrivalPlatform
{
  return self->_arrivalPlatform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalPlatform, 0);
  objc_storeStrong((id *)&self->_arrivalStationLocation, 0);
  objc_storeStrong((id *)&self->_departurePlatform, 0);
  objc_storeStrong((id *)&self->_departureStationLocation, 0);
  objc_storeStrong((id *)&self->_tripDuration, 0);
  objc_storeStrong((id *)&self->_trainNumber, 0);
  objc_storeStrong((id *)&self->_trainName, 0);
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
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("trainName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("trainNumber"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("tripDuration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("departureStationLocation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("departurePlatform"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("arrivalStationLocation"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("arrivalPlatform"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v7;
    v21 = (void *)v15;
    v22 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProvider:trainName:trainNumber:tripDuration:departureStationLocation:departurePlatform:arrivalStationLocation:arrivalPlatform:", v26, v9, v25, v12, v15, v16, v19, v20);

    v7 = v24;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end

@implementation INCarChargingConnectorPower

- (INCarChargingConnectorPower)initWithChargingConnector:(id)a3 maximumPower:(id)a4
{
  id v6;
  id v7;
  INCarChargingConnectorPower *v8;
  uint64_t v9;
  NSString *chargingConnector;
  uint64_t v11;
  NSMeasurement *maximumPower;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INCarChargingConnectorPower;
  v8 = -[INCarChargingConnectorPower init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    chargingConnector = v8->_chargingConnector;
    v8->_chargingConnector = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    maximumPower = v8->_maximumPower;
    v8->_maximumPower = (NSMeasurement *)v11;

  }
  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_chargingConnector, "hash");
  return -[NSMeasurement hash](self->_maximumPower, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  INCarChargingConnectorPower *v4;
  INCarChargingConnectorPower *v5;
  NSString *chargingConnector;
  NSMeasurement *maximumPower;
  BOOL v8;

  v4 = (INCarChargingConnectorPower *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      chargingConnector = self->_chargingConnector;
      v8 = 0;
      if (chargingConnector == v5->_chargingConnector
        || -[NSString isEqual:](chargingConnector, "isEqual:"))
      {
        maximumPower = self->_maximumPower;
        if (maximumPower == v5->_maximumPower || -[NSMeasurement isEqual:](maximumPower, "isEqual:"))
          v8 = 1;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (INCarChargingConnectorPower)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  INCarChargingConnectorPower *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("chargingConnector"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maximumPower"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[INCarChargingConnectorPower initWithChargingConnector:maximumPower:](self, "initWithChargingConnector:maximumPower:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *chargingConnector;
  id v5;

  chargingConnector = self->_chargingConnector;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", chargingConnector, CFSTR("chargingConnector"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_maximumPower, CFSTR("maximumPower"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_chargingConnector);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("chargingConnector"));

  objc_msgSend(v6, "encodeObject:", self->_maximumPower);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("maximumPower"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INCarChargingConnectorPower descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INCarChargingConnectorPower;
  -[INCarChargingConnectorPower description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCarChargingConnectorPower _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  NSString *chargingConnector;
  void *v4;
  NSMeasurement *maximumPower;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("chargingConnector");
  chargingConnector = self->_chargingConnector;
  v4 = chargingConnector;
  if (!chargingConnector)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("maximumPower");
  v10[0] = v4;
  maximumPower = self->_maximumPower;
  v6 = maximumPower;
  if (!maximumPower)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!maximumPower)
  {

    if (chargingConnector)
      return v7;
LABEL_9:

    return v7;
  }
  if (!chargingConnector)
    goto LABEL_9;
  return v7;
}

- (NSString)chargingConnector
{
  return self->_chargingConnector;
}

- (NSMeasurement)maximumPower
{
  return self->_maximumPower;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumPower, 0);
  objc_storeStrong((id *)&self->_chargingConnector, 0);
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
  void *v13;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("chargingConnector"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("maximumPower"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithChargingConnector:maximumPower:", v9, v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end

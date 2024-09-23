@implementation BMHomeKitClientBase

- (BMHomeKitClientBase)initWithDateInterval:(id)a3 homeUniqueIdentifier:(id)a4 homeOccupancy:(int)a5 source:(id)a6 clientName:(id)a7 eventCorrelationIdentifier:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  BMHomeKitClientBase *v18;
  BMHomeKitClientBase *v19;
  void *v20;
  double v21;
  id v24;
  objc_super v25;

  v14 = a3;
  v24 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)BMHomeKitClientBase;
  v18 = -[BMHomeKitClientBase init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_dateInterval, a3);
    objc_msgSend(v14, "startDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19->_absoluteTimestamp = MEMORY[0x193FECB28]();

    objc_msgSend(v14, "duration");
    v19->_duration = v21;
    objc_storeStrong((id *)&v19->_homeUniqueIdentifier, a4);
    v19->_homeOccupancy = a5;
    objc_storeStrong((id *)&v19->_source, a6);
    objc_storeStrong((id *)&v19->_clientName, a7);
    objc_storeStrong((id *)&v19->_eventCorrelationIdentifier, a8);
  }

  return v19;
}

- (NSString)description
{
  void *v3;
  NSString *homeUniqueIdentifier;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  homeUniqueIdentifier = self->_homeUniqueIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_homeOccupancy);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("BMHomeKitClientBase homeUUID:%@, homeOccupancy:%@, source:%@, clientName:%@"), homeUniqueIdentifier, v5, self->_source, self->_clientName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  NSObject *v7;
  void *v8;

  v6 = a3;
  if (a4)
  {
    __biome_log_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[BMHomeKitClientBase eventWithData:dataVersion:].cold.1(v7);

    v8 = 0;
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }

  return v8;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMHomeKitClientBase proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMHomeKitClientBase)initWithProto:(id)a3
{
  id v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BMHomeKitClientBase *v16;
  NSObject *v17;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[BMHomeKitClientBase initWithProto:].cold.1((uint64_t)self, v17);

    goto LABEL_7;
  }
  v5 = (objc_class *)MEMORY[0x1E0CB3588];
  v6 = v4;
  v7 = [v5 alloc];
  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v6, "absoluteTimestamp");
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "duration");
  v10 = (void *)objc_msgSend(v7, "initWithStartDate:duration:", v9);

  objc_msgSend(v6, "homeUniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "homeOccupancy");
  objc_msgSend(v6, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventCorrelationIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  self = -[BMHomeKitClientBase initWithDateInterval:homeUniqueIdentifier:homeOccupancy:source:clientName:eventCorrelationIdentifier:](self, "initWithDateInterval:homeUniqueIdentifier:homeOccupancy:source:clientName:eventCorrelationIdentifier:", v10, v11, v12, v13, v14, v15);
  v16 = self;
LABEL_8:

  return v16;
}

- (BMHomeKitClientBase)initWithProtoData:(id)a3
{
  id v4;
  BMPBHomeKitClientBase *v5;
  BMHomeKitClientBase *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBHomeKitClientBase initWithData:]([BMPBHomeKitClientBase alloc], "initWithData:", v4);

    self = -[BMHomeKitClientBase initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setAbsoluteTimestamp:", self->_absoluteTimestamp);
  objc_msgSend(v3, "setDuration:", self->_duration);
  objc_msgSend(v3, "setHomeUniqueIdentifier:", self->_homeUniqueIdentifier);
  objc_msgSend(v3, "setHomeOccupancy:", self->_homeOccupancy);
  objc_msgSend(v3, "setSource:", self->_source);
  objc_msgSend(v3, "setClientName:", self->_clientName);
  objc_msgSend(v3, "setEventCorrelationIdentifier:", self->_eventCorrelationIdentifier);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  char v26;
  int v28;
  char v29;
  char v30;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    goto LABEL_36;
  }
  v9 = v8;
  -[BMHomeKitClientBase dateInterval](self, "dateInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v9, "dateInterval");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v30 = 1;
LABEL_8:

      goto LABEL_9;
    }
  }
  -[BMHomeKitClientBase dateInterval](self, "dateInterval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v3, "isEqual:", v5);

  if (!v10)
    goto LABEL_8;
LABEL_9:

  -[BMHomeKitClientBase homeUniqueIdentifier](self, "homeUniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v9, "homeUniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v29 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  -[BMHomeKitClientBase homeUniqueIdentifier](self, "homeUniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homeUniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v3, "isEqual:", v13);

  if (!v12)
    goto LABEL_14;
LABEL_15:

  v28 = -[BMHomeKitClientBase homeOccupancy](self, "homeOccupancy");
  v14 = objc_msgSend(v9, "homeOccupancy");
  -[BMHomeKitClientBase source](self, "source");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(v9, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v17 = 1;
LABEL_20:

      goto LABEL_21;
    }
  }
  -[BMHomeKitClientBase source](self, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "source");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v3, "isEqual:", v16);

  if (!v15)
    goto LABEL_20;
LABEL_21:

  -[BMHomeKitClientBase clientName](self, "clientName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(v9, "clientName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v21 = 1;
LABEL_26:

      goto LABEL_27;
    }
  }
  -[BMHomeKitClientBase clientName](self, "clientName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqual:", v20);

  if (!v18)
    goto LABEL_26;
LABEL_27:

  -[BMHomeKitClientBase eventCorrelationIdentifier](self, "eventCorrelationIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend(v9, "eventCorrelationIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v25 = 1;
LABEL_32:

      goto LABEL_33;
    }
  }
  -[BMHomeKitClientBase eventCorrelationIdentifier](self, "eventCorrelationIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "eventCorrelationIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "isEqual:", v24);

  if (!v22)
    goto LABEL_32;
LABEL_33:

  v26 = v30 & v29;
  if (v28 != v14)
    v26 = 0;
  v11 = v26 & v17 & v21 & v25;

LABEL_36:
  return v11;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)homeUniqueIdentifier
{
  return self->_homeUniqueIdentifier;
}

- (int)homeOccupancy
{
  return self->_homeOccupancy;
}

- (NSString)source
{
  return self->_source;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (NSString)eventCorrelationIdentifier
{
  return self->_eventCorrelationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCorrelationIdentifier, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_homeUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

+ (void)eventWithData:(os_log_t)log dataVersion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18D810000, log, OS_LOG_TYPE_ERROR, "Mismatched HomeKitClientBase data versions, cannot deserialize", v1, 2u);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBHomeKitClientBase proto", (uint8_t *)&v5, 0xCu);

}

@end

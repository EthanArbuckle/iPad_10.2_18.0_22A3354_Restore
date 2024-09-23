@implementation HDDataCollectorSensorDatum

- (HDDataCollectorSensorDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 resumeContext:(id)a5
{
  id v10;
  id v11;
  id v12;
  HDDataCollectorSensorDatum *v13;
  HDDataCollectorSensorDatum *v14;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDataAggregator.m"), 678, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dateInterval != nil"));

  }
  v17.receiver = self;
  v17.super_class = (Class)HDDataCollectorSensorDatum;
  v13 = -[HDDataCollectorSensorDatum init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_datumIdentifier, a3);
    objc_storeStrong((id *)&v14->_dateInterval, a4);
    objc_storeStrong((id *)&v14->_resumeContext, a5);
  }

  return v14;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSUUID)datumIdentifier
{
  return self->_datumIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *datumIdentifier;
  id v5;
  id v6;

  datumIdentifier = self->_datumIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", datumIdentifier, CFSTR("HDDCR_id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateInterval, CFSTR("HDDCR_ts"));
  -[HDDataCollectorSensorDatum resumeContext](self, "resumeContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("HDDCR_ctx"));

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resumeContextProvider, 0);
  objc_storeStrong((id *)&self->_resumeContext, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_datumIdentifier, 0);
}

- (HDDataCollectorSensorDatum)initWithCoder:(id)a3
{
  id v4;
  HDDataCollectorSensorDatum *v5;
  uint64_t v6;
  NSUUID *datumIdentifier;
  uint64_t v8;
  NSDateInterval *dateInterval;
  uint64_t v10;
  NSData *resumeContext;
  HDDataCollectorSensorDatum *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDDataCollectorSensorDatum;
  v5 = -[HDDataCollectorSensorDatum init](&v14, sel_init);
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDDCR_id"));
  v6 = objc_claimAutoreleasedReturnValue();
  datumIdentifier = v5->_datumIdentifier;
  v5->_datumIdentifier = (NSUUID *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDDCR_ts"));
  v8 = objc_claimAutoreleasedReturnValue();
  dateInterval = v5->_dateInterval;
  v5->_dateInterval = (NSDateInterval *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDDCR_ctx"));
  v10 = objc_claimAutoreleasedReturnValue();
  resumeContext = v5->_resumeContext;
  v5->_resumeContext = (NSData *)v10;

  if (!v5->_datumIdentifier)
    goto LABEL_5;
  if (v5->_dateInterval)
LABEL_4:
    v12 = v5;
  else
LABEL_5:
    v12 = 0;

  return v12;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %@, context: %@>"), self->_datumIdentifier, self->_dateInterval, self->_resumeContext);
}

- (NSData)resumeContext
{
  void (**resumeContextProvider)(id, SEL);
  NSData *v4;

  resumeContextProvider = (void (**)(id, SEL))self->_resumeContextProvider;
  if (resumeContextProvider)
  {
    resumeContextProvider[2](resumeContextProvider, a2);
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_resumeContext;
  }
  return v4;
}

- (HDDataCollectorSensorDatum)initWithIdentifier:(id)a3 dateInterval:(id)a4 resumeContextProvider:(id)a5
{
  id v8;
  HDDataCollectorSensorDatum *v9;
  uint64_t v10;
  id resumeContextProvider;

  v8 = a5;
  v9 = -[HDDataCollectorSensorDatum initWithIdentifier:dateInterval:resumeContext:](self, "initWithIdentifier:dateInterval:resumeContext:", a3, a4, 0);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    resumeContextProvider = v9->_resumeContextProvider;
    v9->_resumeContextProvider = (id)v10;

  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (id *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[NSUUID isEqual:](self->_datumIdentifier, "isEqual:", v4[1]))
  {
    -[NSDateInterval startDate](self->_dateInterval, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4[2], "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6)
      && (-[NSDateInterval duration](self->_dateInterval, "duration"),
          v8 = v7,
          objc_msgSend(v4[2], "duration"),
          vabdd_f64(v8, v9) <= 0.00000005))
    {
      -[HDDataCollectorSensorDatum resumeContext](self, "resumeContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "resumeContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v10 = 1;
      }
      else
      {
        objc_msgSend(v4, "resumeContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[HDDataCollectorSensorDatum resumeContext](self, "resumeContext");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "resumeContext");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v14, "isEqual:", v15);

        }
        else
        {
          v10 = 0;
        }

      }
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)resumeContextProvider
{
  return self->_resumeContextProvider;
}

@end

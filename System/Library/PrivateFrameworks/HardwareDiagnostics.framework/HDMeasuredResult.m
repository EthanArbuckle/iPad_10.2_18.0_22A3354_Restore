@implementation HDMeasuredResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDMeasuredResult)initWithName:(id)a3 measurement:(id)a4
{
  id v6;
  id v7;
  HDMeasuredResult *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSMeasurement *measurement;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDMeasuredResult;
  v8 = -[HDMeasuredResult init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    measurement = v8->_measurement;
    v8->_measurement = (NSMeasurement *)v11;

    v8->_valueWithinLimits = 1;
  }

  return v8;
}

- (HDMeasuredResult)initWithCoder:(id)a3
{
  id v4;
  HDMeasuredResult *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSMeasurement *measurement;
  uint64_t v10;
  HDLimit *limit;
  HDLimit *v12;
  char v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDMeasuredResult;
  v5 = -[HDMeasuredResult init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDMeasuredResult.name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDMeasuredResult.measurement"));
    v8 = objc_claimAutoreleasedReturnValue();
    measurement = v5->_measurement;
    v5->_measurement = (NSMeasurement *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDMeasuredResult.limit"));
    v10 = objc_claimAutoreleasedReturnValue();
    limit = v5->_limit;
    v5->_limit = (HDLimit *)v10;

    v12 = v5->_limit;
    if (v12)
      v13 = -[HDLimit measurementWithinBounds:](v12, "measurementWithinBounds:", v5->_measurement);
    else
      v13 = 1;
    v5->_valueWithinLimits = v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("HDMeasuredResult.name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_measurement, CFSTR("HDMeasuredResult.measurement"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_limit, CFSTR("HDMeasuredResult.limit"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithName:measurement:", self->_name, self->_measurement);
  objc_msgSend(v4, "setLimit:", self->_limit);
  return v4;
}

- (void)setLimit:(id)a3
{
  id v4;
  char v5;
  HDMeasuredResult *v6;
  uint64_t v7;
  HDLimit *limit;
  id v9;

  v4 = a3;
  v9 = v4;
  if (v4)
    v5 = objc_msgSend(v4, "measurementWithinBounds:", self->_measurement);
  else
    v5 = 1;
  v6 = self;
  objc_sync_enter(v6);
  v7 = objc_msgSend(v9, "copy");
  limit = v6->_limit;
  v6->_limit = (HDLimit *)v7;

  v6->_valueWithinLimits = v5;
  objc_sync_exit(v6);

}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HDLimit *limit;
  void *v10;
  void *v11;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_name, CFSTR("name"));
  v4 = (void *)objc_opt_new();
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[NSMeasurement doubleValue](self->_measurement, "doubleValue");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("value"));

  -[NSMeasurement unit](self->_measurement, "unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "symbol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("units"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("measurement"));
  limit = self->_limit;
  if (limit)
  {
    -[HDLimit dictionaryRepresentation](limit, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("limit"));

  }
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HDMeasuredResult *v4;
  BOOL v5;

  v4 = (HDMeasuredResult *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[HDMeasuredResult isEqualToMeasuredResult:](self, "isEqualToMeasuredResult:", v4);
  }

  return v5;
}

- (BOOL)isEqualToMeasuredResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMeasuredResult name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (!v7)
    goto LABEL_10;
  objc_msgSend(v4, "limit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else
  {
    -[HDMeasuredResult limit](self, "limit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_8;
  }
  objc_msgSend(v4, "limit");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_10;
  v11 = (void *)v10;
  -[HDMeasuredResult limit](self, "limit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_10;
  objc_msgSend(v4, "limit");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMeasuredResult limit](self, "limit");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToLimit:", v14);

  if (!v15)
    goto LABEL_10;
LABEL_8:
  objc_msgSend(v4, "measurement");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMeasuredResult measurement](self, "measurement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "unit");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v16, "canBeConvertedToUnit:", v18);

  if (!v19)
  {
LABEL_10:
    v25 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "measurement");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMeasuredResult measurement](self, "measurement");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "unit");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "measurementByConvertingToUnit:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDMeasuredResult measurement](self, "measurement");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "isEqual:", v24);

LABEL_11:
  return v25;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HDLimit)limit
{
  return self->_limit;
}

- (NSMeasurement)measurement
{
  return self->_measurement;
}

- (BOOL)valueWithinLimits
{
  return self->_valueWithinLimits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_measurement, 0);
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

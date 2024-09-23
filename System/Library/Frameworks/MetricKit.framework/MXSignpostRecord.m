@implementation MXSignpostRecord

- (MXSignpostRecord)initWithSubSystem:(id)a3 category:(id)a4 name:(id)a5 beginTimeStamp:(id)a6 endTimeStamp:(id)a7 duration:(id)a8 isInterval:(BOOL)a9
{
  id v16;
  id v17;
  MXSignpostRecord *v18;
  MXSignpostRecord *v19;
  MXSignpostRecord *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v16 = a5;
  v17 = a6;
  v23 = a7;
  v22 = a8;
  v26.receiver = self;
  v26.super_class = (Class)MXSignpostRecord;
  v18 = -[MXSignpostRecord init](&v26, sel_init);
  v19 = v18;
  if (!v18)
    goto LABEL_7;
  v20 = 0;
  if (v25 && v24 && v16 && v17)
  {
    objc_storeStrong((id *)&v18->_subsystem, a3);
    objc_storeStrong((id *)&v19->_category, a4);
    objc_storeStrong((id *)&v19->_name, a5);
    objc_storeStrong((id *)&v19->_beginTimeStamp, a6);
    objc_storeStrong((id *)&v19->_endTimeStamp, a7);
    objc_storeStrong((id *)&v19->_duration, a8);
    v19->_isInterval = a9;
LABEL_7:
    v20 = v19;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *subsystem;
  id v5;

  subsystem = self->_subsystem;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", subsystem, CFSTR("subsystem"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_category, CFSTR("category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beginTimeStamp, CFSTR("beginTimeStamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endTimeStamp, CFSTR("endTimeStamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_duration, CFSTR("duration"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isInterval, CFSTR("isInterval"));

}

- (MXSignpostRecord)initWithCoder:(id)a3
{
  id v4;
  MXSignpostRecord *v5;
  uint64_t v6;
  NSString *subsystem;
  uint64_t v8;
  NSString *category;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSDate *beginTimeStamp;
  uint64_t v14;
  NSDate *endTimeStamp;
  uint64_t v16;
  NSMeasurement *duration;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MXSignpostRecord;
  v5 = -[MXSignpostRecord init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subsystem"));
    v6 = objc_claimAutoreleasedReturnValue();
    subsystem = v5->_subsystem;
    v5->_subsystem = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("category"));
    v8 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("beginTimeStamp"));
    v12 = objc_claimAutoreleasedReturnValue();
    beginTimeStamp = v5->_beginTimeStamp;
    v5->_beginTimeStamp = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endTimeStamp"));
    v14 = objc_claimAutoreleasedReturnValue();
    endTimeStamp = v5->_endTimeStamp;
    v5->_endTimeStamp = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("duration"));
    v16 = objc_claimAutoreleasedReturnValue();
    duration = v5->_duration;
    v5->_duration = (NSMeasurement *)v16;

    v5->_isInterval = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isInterval"));
  }

  return v5;
}

- (id)toDictionary
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSString *subsystem;
  NSString *category;
  NSString *name;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v4, "setLocale:", v5);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  v6 = objc_alloc_init(MEMORY[0x24BDD1668]);
  objc_msgSend(v6, "setUnitOptions:", 1);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v6, "setLocale:", v7);

  objc_msgSend(v6, "setUnitStyle:", 2);
  subsystem = self->_subsystem;
  if (subsystem)
    objc_msgSend(v3, "setObject:forKey:", subsystem, CFSTR("subsystem"));
  category = self->_category;
  if (category)
    objc_msgSend(v3, "setObject:forKey:", category, CFSTR("category"));
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  if (self->_beginTimeStamp)
  {
    objc_msgSend(v4, "stringFromDate:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("beginTimeStamp"));

  }
  if (self->_endTimeStamp)
  {
    objc_msgSend(v4, "stringFromDate:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("endTimeStamp"));

  }
  if (self->_duration)
  {
    objc_msgSend(v6, "stringFromMeasurement:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("duration"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isInterval);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("isInterval"));

  return v3;
}

- (NSData)JSONRepresentation
{
  void *v2;
  void *v3;
  id v5;

  -[MXSignpostRecord toDictionary](self, "toDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    v5 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 1, &v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (NSString)subsystem
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSubsystem:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCategory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSDate)beginTimeStamp
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBeginTimeStamp:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSDate)endTimeStamp
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEndTimeStamp:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSMeasurement)duration
{
  return (NSMeasurement *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDuration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (BOOL)isInterval
{
  return self->_isInterval;
}

- (void)setIsInterval:(BOOL)a3
{
  self->_isInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_endTimeStamp, 0);
  objc_storeStrong((id *)&self->_beginTimeStamp, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
}

@end

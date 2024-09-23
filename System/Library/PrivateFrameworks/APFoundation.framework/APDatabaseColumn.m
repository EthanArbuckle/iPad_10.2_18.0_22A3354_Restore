@implementation APDatabaseColumn

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (APDatabaseColumn)initWithName:(id)a3 forColumnType:(int64_t)a4 withValue:(id)a5
{
  id v9;
  id v10;
  APDatabaseColumn *v11;
  APDatabaseColumn *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  if (!v9)
    APSimulateCrash((const char *)5, CFSTR("APDatabaseColumn initialized with name == nil."), 0);
  v14.receiver = self;
  v14.super_class = (Class)APDatabaseColumn;
  v11 = -[APDatabaseColumn init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_type = a4;
    objc_storeStrong(&v12->_value, a5);
  }

  return v12;
}

- (id)value
{
  return self->_value;
}

- (int64_t)type
{
  return self->_type;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_name(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_value(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v11, (uint64_t)CFSTR("%@: %@"), v12, v6, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

@end

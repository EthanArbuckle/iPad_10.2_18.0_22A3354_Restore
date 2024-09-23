@implementation GEODefaultsDBValue

- (int64_t)dbId
{
  return self->_dbId;
}

- (NSString)type
{
  return self->_type;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (id)value
{
  return self->_value;
}

- (GEODefaultsDBValue)initWithParent:(id)a3 type:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEODefaultsDBValue *v11;
  GEODefaultsDBValue *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)GEODefaultsDBValue;
  v11 = -[GEODefaultsDBValue init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_parent, v8);
    objc_storeStrong((id *)&v12->_type, a4);
    objc_storeStrong(&v12->_value, a5);
  }

  return v12;
}

+ (id)dbValue:(id)a3 type:(id)a4 value:(id)a5
{
  id v7;
  id v8;
  id v9;
  GEODefaultsDBValue *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[GEODefaultsDBValue initWithParent:type:value:]([GEODefaultsDBValue alloc], "initWithParent:type:value:", v9, v8, v7);

  return v10;
}

- (void)setDbId:(int64_t)a3
{
  self->_dbId = a3;
}

- (GEODefaultsDBCollection)parent
{
  return (GEODefaultsDBCollection *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end

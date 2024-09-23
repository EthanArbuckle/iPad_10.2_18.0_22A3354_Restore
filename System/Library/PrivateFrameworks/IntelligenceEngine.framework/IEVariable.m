@implementation IEVariable

- (IEVariable)initWithName:(id)a3 withType:(id)a4
{
  id v7;
  id v8;
  IEVariable *v9;
  IEVariable *v10;
  id value;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IEVariable;
  v9 = -[IEVariable init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_type, a4);
    value = v10->_value;
    v10->_value = 0;

    v10->_persistent = 0;
  }

  return v10;
}

- (IEVariable)initWithName:(id)a3 withType:(id)a4 withValue:(id)a5
{
  id v9;
  id v10;
  id v11;
  IEVariable *v12;
  IEVariable *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IEVariable;
  v12 = -[IEVariable init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_type, a4);
    objc_storeStrong(&v13->_value, a5);
    v13->_persistent = 0;
  }

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (BOOL)persistent
{
  return self->_persistent;
}

- (void)setPersistent:(BOOL)a3
{
  self->_persistent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

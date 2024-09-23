@implementation MLModelStructureProgramBinding

- (MLModelStructureProgramBinding)initWithName:(id)a3
{
  id v4;
  MLModelStructureProgramBinding *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLModelStructureProgramBinding;
  v5 = -[MLModelStructureProgramBinding init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (MLModelStructureProgramBinding)initWithValue:(id)a3
{
  id v5;
  MLModelStructureProgramBinding *v6;
  MLModelStructureProgramBinding *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLModelStructureProgramBinding;
  v6 = -[MLModelStructureProgramBinding init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_value, a3);

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (MLModelStructureProgramValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

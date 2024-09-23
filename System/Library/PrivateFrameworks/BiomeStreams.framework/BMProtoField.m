@implementation BMProtoField

- (BMProtoField)initWithName:(id)a3 number:(int64_t)a4 type:(int64_t)a5 subMessageClass:(Class)a6
{
  id v11;
  BMProtoField *v12;
  BMProtoField *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BMProtoField;
  v12 = -[BMProtoField init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    v13->_number = a4;
    v13->_type = a5;
    objc_storeStrong((id *)&v13->_subMessageClass, a6);
  }

  return v13;
}

- (id)description
{
  id v3;
  uint64_t v4;
  NSString *name;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  name = self->_name;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_number);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> name: %@, number: %@, type: %@, subMessageClass: %@"), v4, self, name, v6, v7, self->_subMessageClass);

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)number
{
  return self->_number;
}

- (int64_t)type
{
  return self->_type;
}

- (Class)subMessageClass
{
  return self->_subMessageClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subMessageClass, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

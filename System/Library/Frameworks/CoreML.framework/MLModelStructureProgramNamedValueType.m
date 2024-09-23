@implementation MLModelStructureProgramNamedValueType

- (MLModelStructureProgramNamedValueType)initWithName:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  MLModelStructureProgramNamedValueType *v8;
  uint64_t v9;
  NSString *name;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLModelStructureProgramNamedValueType;
  v8 = -[MLModelStructureProgramNamedValueType init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_type, a4);
  }

  return v8;
}

- (MLModelStructureProgramNamedValueType)initWithMILNamedValueType:(const void *)a3
{
  void *v5;
  uint64_t Name;
  uint64_t v7;
  void *v8;
  MLModelStructureProgramValueType *v9;
  MLModelStructureProgramNamedValueType *v10;

  v5 = (void *)MEMORY[0x1E0CB3940];
  Name = MIL::IRNamedValueType::GetName((MIL::IRNamedValueType *)a3);
  if (*(char *)(Name + 23) >= 0)
    v7 = Name;
  else
    v7 = *(_QWORD *)Name;
  objc_msgSend(v5, "stringWithUTF8String:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MLModelStructureProgramValueType initWithMILValueType:]([MLModelStructureProgramValueType alloc], "initWithMILValueType:", MIL::IRNamedValueType::GetType((MIL::IRNamedValueType *)a3));
  v10 = -[MLModelStructureProgramNamedValueType initWithName:type:](self, "initWithName:type:", v8, v9);

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (MLModelStructureProgramValueType)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

@implementation INIntentResponseDescription

- (INIntentResponseDescription)initWithName:(id)a3 facadeClass:(Class)a4 dataClass:(Class)a5 type:(id)a6 isPrivate:(BOOL)a7 slotsByName:(id)a8
{
  id v14;
  id v15;
  id v16;
  INIntentResponseDescription *v17;
  uint64_t v18;
  NSString *name;
  uint64_t v20;
  NSString *type;
  uint64_t v22;
  NSDictionary *slotsByName;
  objc_super v25;

  v14 = a3;
  v15 = a6;
  v16 = a8;
  v25.receiver = self;
  v25.super_class = (Class)INIntentResponseDescription;
  v17 = -[INIntentResponseDescription init](&v25, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v14, "copy");
    name = v17->_name;
    v17->_name = (NSString *)v18;

    v17->_facadeClass = a4;
    v17->_dataClass = a5;
    v20 = objc_msgSend(v15, "copy");
    type = v17->_type;
    v17->_type = (NSString *)v20;

    v17->_isPrivate = a7;
    v22 = objc_msgSend(v16, "copy");
    slotsByName = v17->_slotsByName;
    v17->_slotsByName = (NSDictionary *)v22;

  }
  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSUInteger v8;
  _BOOL8 isPrivate;
  unint64_t v10;

  v3 = -[NSString hash](self->_name, "hash");
  NSStringFromClass(self->_facadeClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  NSStringFromClass(self->_dataClass);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  v8 = v5 ^ v7 ^ -[NSString hash](self->_type, "hash");
  isPrivate = self->_isPrivate;
  v10 = v8 ^ isPrivate ^ -[NSDictionary hash](self->_slotsByName, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSDictionary **v5;
  NSString *name;
  BOOL v7;
  NSString *type;
  NSDictionary *slotsByName;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NSDictionary **)v4;
    name = self->_name;
    v7 = 0;
    if ((name == (NSString *)v5[2] || -[NSString isEqualToString:](name, "isEqualToString:"))
      && (NSDictionary *)self->_facadeClass == v5[3]
      && (NSDictionary *)self->_dataClass == v5[4])
    {
      type = self->_type;
      if ((type == (NSString *)v5[5] || -[NSString isEqualToString:](type, "isEqualToString:"))
        && self->_isPrivate == *((unsigned __int8 *)v5 + 8))
      {
        slotsByName = self->_slotsByName;
        if (slotsByName == v5[6] || -[NSDictionary isEqualToDictionary:](slotsByName, "isEqualToDictionary:"))
          v7 = 1;
      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (Class)facadeClass
{
  return self->_facadeClass;
}

- (Class)dataClass
{
  return self->_dataClass;
}

- (NSString)type
{
  return self->_type;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (NSDictionary)slotsByName
{
  return self->_slotsByName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotsByName, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

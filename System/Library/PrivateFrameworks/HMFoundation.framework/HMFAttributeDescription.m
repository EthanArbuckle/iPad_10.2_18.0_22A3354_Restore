@implementation HMFAttributeDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (HMFAttributeDescription)initWithName:(id)a3 value:(id)a4 options:(unint64_t)a5 formatter:(id)a6
{
  id v10;
  id v11;
  id v12;
  HMFAttributeDescription *v13;
  uint64_t v14;
  NSString *name;
  HMFAttributeDescription *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (objc_msgSend(v10, "length"))
  {
    v18.receiver = self;
    v18.super_class = (Class)HMFAttributeDescription;
    v13 = -[HMFAttributeDescription init](&v18, sel_init);
    if (v13)
    {
      objc_msgSend(v10, "capitalizedString");
      v14 = objc_claimAutoreleasedReturnValue();
      name = v13->_name;
      v13->_name = (NSString *)v14;

      objc_storeStrong((id *)&v13->_value, a4);
      v13->_options = a5;
      objc_storeStrong((id *)&v13->_formatter, a6);
    }
    self = v13;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSObject)value
{
  return self->_value;
}

- (NSString)name
{
  return self->_name;
}

- (NSFormatter)formatter
{
  return self->_formatter;
}

- (NSString)privateDescription
{
  return (NSString *)HMFAttributeDescriptionDescriptionWithOptions(self, -[HMFAttributeDescription options](self, "options") | 2u);
}

- (NSString)description
{
  return (NSString *)HMFAttributeDescriptionDescriptionWithOptions(self, -[HMFAttributeDescription options](self, "options"));
}

- (unint64_t)options
{
  return self->_options;
}

- (HMFAttributeDescription)initWithName:(id)a3 value:(id)a4
{
  return -[HMFAttributeDescription initWithName:value:options:formatter:](self, "initWithName:value:options:formatter:", a3, a4, 0, 0);
}

- (HMFAttributeDescription)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMFAttributeDescription name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMFAttributeDescription *v4;
  HMFAttributeDescription *v5;
  HMFAttributeDescription *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  unint64_t v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (HMFAttributeDescription *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (!v6)
      goto LABEL_10;
    -[HMFAttributeDescription name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFAttributeDescription name](v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (!v9)
      goto LABEL_10;
    -[HMFAttributeDescription value](self, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFAttributeDescription value](v6, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if ((v12 & 1) != 0)
      goto LABEL_10;
    v13 = -[HMFAttributeDescription options](self, "options");
    if (v13 == -[HMFAttributeDescription options](v6, "options"))
    {
      -[HMFAttributeDescription formatter](self, "formatter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFAttributeDescription formatter](v6, "formatter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = HMFEqualObjects(v14, v15);

    }
    else
    {
LABEL_10:
      v16 = 0;
    }

  }
  return v16;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)shortDescription
{
  return (NSString *)HMFAttributeDescriptionDescriptionWithOptions(self, -[HMFAttributeDescription options](self, "options") | 1u);
}

- (NSString)debugDescription
{
  return (NSString *)HMFAttributeDescriptionDescriptionWithOptions(self, 0);
}

@end

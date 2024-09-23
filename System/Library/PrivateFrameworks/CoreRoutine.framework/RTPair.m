@implementation RTPair

- (RTPair)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithFirstObject_secondObject_);
}

- (RTPair)initWithFirstObject:(id)a3 secondObject:(id)a4
{
  id v7;
  id v8;
  void *v9;
  RTPair *v10;
  id *p_isa;
  RTPair *v12;
  NSObject *v13;
  const char *v14;
  objc_super v16;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v12 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: firstObject";
LABEL_12:
    _os_log_error_impl(&dword_1A5E26000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: secondObject";
    goto LABEL_12;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTPair;
  v10 = -[RTPair init](&v16, sel_init);
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong(&v10->_firstObject, a3);
    objc_storeStrong(p_isa + 2, a4);
  }
  self = p_isa;
  v12 = self;
LABEL_10:

  return v12;
}

+ (Class)getClusterClassOfObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            objc_opt_isKindOfClass();
          }
        }
      }
    }
  }
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFirstObject:secondObject:", self->_firstObject, self->_secondObject);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "getClusterClassOfObject:", self->_firstObject);
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "getClusterClassOfObject:", self->_secondObject);
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE80B948)
    && objc_msgSend(v5, "conformsToProtocol:", &unk_1EE80B948))
  {
    objc_msgSend(v6, "encodeObject:forKey:", self->_firstObject, CFSTR("firstObject"));
    objc_msgSend(v6, "encodeObject:forKey:", self->_secondObject, CFSTR("secondObject"));
  }

}

- (RTPair)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  RTPair *v9;

  v4 = a3;
  objc_msgSend(v4, "allowedClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allowedClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("secondObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (v6 && v8)
  {
    self = -[RTPair initWithFirstObject:secondObject:](self, "initWithFirstObject:secondObject:", v6, v8);
    v9 = self;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(self->_firstObject, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(self->_secondObject, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("firstObject, %@, secondObject, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[RTPair firstObject](self, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[RTPair secondObject](self, "secondObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secondObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[RTPair firstObject](self, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RTPair secondObject](self, "secondObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)firstObject
{
  return self->_firstObject;
}

- (id)secondObject
{
  return self->_secondObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_secondObject, 0);
  objc_storeStrong(&self->_firstObject, 0);
}

@end

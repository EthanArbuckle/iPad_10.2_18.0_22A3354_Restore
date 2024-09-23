@implementation ULServiceQualityInfo

- (id)initServiceWithQuality:(unint64_t)a3 andReasons:(id)a4
{
  id v6;
  ULServiceQualityInfo *v7;
  ULServiceQualityInfo *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ULServiceQualityInfo;
  v7 = -[ULServiceQualityInfo init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[ULServiceQualityInfo setServiceQuality:](v7, "setServiceQuality:", a3);
    -[ULServiceQualityInfo setServiceQualityReasons:](v8, "setServiceQualityReasons:", v6);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  unint64_t serviceQuality;
  void *v7;
  void *v8;

  v5 = objc_alloc((Class)objc_opt_class());
  serviceQuality = self->_serviceQuality;
  v7 = (void *)-[NSArray copyWithZone:](self->_serviceQualityReasons, "copyWithZone:", a3);
  v8 = (void *)objc_msgSend(v5, "initServiceWithQuality:andReasons:", serviceQuality, v7);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t serviceQuality;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  serviceQuality = self->_serviceQuality;
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", serviceQuality);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("serviceQuality"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_serviceQualityReasons, CFSTR("serviceQualityReasons"));
}

- (ULServiceQualityInfo)initWithCoder:(id)a3
{
  id v4;
  ULServiceQualityInfo *v5;
  ULServiceQualityInfo *v6;
  ULServiceQualityInfo *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *serviceQualityReasons;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ULServiceQualityInfo;
  v5 = -[ULServiceQualityInfo init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceQuality"));
    v6 = (ULServiceQualityInfo *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = -[ULServiceQualityInfo unsignedIntegerValue](v6, "unsignedIntegerValue");

      v5->_serviceQuality = v8;
      objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("serviceQualityReasons"));
      v7 = (ULServiceQualityInfo *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_opt_self();
        v9 = objc_claimAutoreleasedReturnValue();

        serviceQualityReasons = v5->_serviceQualityReasons;
        v5->_serviceQualityReasons = (NSArray *)v9;

        v7 = v5;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  ULServiceQualityToString(self->_serviceQuality);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(", serviceQuality: %@"), v7);

  objc_msgSend(v6, "appendFormat:", CFSTR(", serviceQualityReasons: %@"), self->_serviceQualityReasons);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[ULServiceQualityInfo serviceQuality](self, "serviceQuality");
    if (v6 == objc_msgSend(v5, "serviceQuality"))
    {
      -[ULServiceQualityInfo serviceQualityReasons](self, "serviceQualityReasons");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serviceQualityReasons");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {

        v9 = 1;
      }
      else
      {
        -[ULServiceQualityInfo serviceQualityReasons](self, "serviceQualityReasons");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "serviceQualityReasons");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v10 != v11;

        v9 = !v12;
      }
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9 & 1;
}

- (unint64_t)hash
{
  unint64_t serviceQuality;

  serviceQuality = self->_serviceQuality;
  return -[NSArray hash](self->_serviceQualityReasons, "hash") ^ serviceQuality;
}

- (ULServiceQualityInfo)init
{
  __assert_rtn("-[ULServiceQualityInfo init]", "ULConnectionDelegateTypes.m", 312, "NO");
}

+ (id)new
{
  __assert_rtn("+[ULServiceQualityInfo new]", "ULConnectionDelegateTypes.m", 317, "NO");
}

- (unint64_t)serviceQuality
{
  return self->_serviceQuality;
}

- (void)setServiceQuality:(unint64_t)a3
{
  self->_serviceQuality = a3;
}

- (NSArray)serviceQualityReasons
{
  return self->_serviceQualityReasons;
}

- (void)setServiceQualityReasons:(id)a3
{
  objc_storeStrong((id *)&self->_serviceQualityReasons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceQualityReasons, 0);
}

@end

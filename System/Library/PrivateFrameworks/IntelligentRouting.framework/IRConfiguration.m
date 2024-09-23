@implementation IRConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceToken, 0);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (void)encodeWithCoder:(id)a3
{
  IRServiceToken *serviceToken;
  id v5;
  id v6;

  serviceToken = self->_serviceToken;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", serviceToken, CFSTR("serviceToken"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_mode);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("mode"));

}

- (IRServiceToken)serviceToken
{
  return self->_serviceToken;
}

- (IRConfiguration)initWithCoder:(id)a3
{
  id v4;
  IRConfiguration *v5;
  IRConfiguration *v6;
  uint64_t v7;
  IRServiceToken *serviceToken;
  IRConfiguration *v9;
  int64_t v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IRConfiguration;
  v5 = -[IRConfiguration init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceToken"));
    v6 = (IRConfiguration *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_self();
      v7 = objc_claimAutoreleasedReturnValue();

      serviceToken = v5->_serviceToken;
      v5->_serviceToken = (IRServiceToken *)v7;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mode"));
      v9 = (IRConfiguration *)objc_claimAutoreleasedReturnValue();
      v6 = v9;
      if (v9)
      {
        v10 = (int)-[IRConfiguration intValue](v9, "intValue");

        v5->_mode = v10;
        v6 = v5;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithServiceToken:", self->_serviceToken);
  v6 = -[IRServiceToken copyWithZone:](self->_serviceToken, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = -[IRConfiguration mode](self, "mode");
  return v5;
}

- (IRConfiguration)initWithServiceToken:(id)a3
{
  id v5;
  IRConfiguration *v6;
  IRConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IRConfiguration;
  v6 = -[IRConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serviceToken, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  objc_msgSend(v6, "appendFormat:", CFSTR(", serviceToken: %@"), self->_serviceToken);
  objc_msgSend(v6, "appendFormat:", CFSTR(", mode: %ld"), self->_mode);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  int64_t v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[IRConfiguration serviceToken](self, "serviceToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serviceToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {

    }
    else
    {
      -[IRConfiguration serviceToken](self, "serviceToken");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serviceToken");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v10)
      {
        v8 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    v11 = -[IRConfiguration mode](self, "mode");
    v8 = v11 == objc_msgSend(v5, "mode");
    goto LABEL_8;
  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (unint64_t)hash
{
  return -[IRServiceToken hash](self->_serviceToken, "hash") ^ self->_mode ^ 0x1F;
}

- (IRConfiguration)init
{
  __assert_rtn("-[IRConfiguration init]", "IRConfiguration.m", 83, "NO");
}

+ (IRConfiguration)new
{
  __assert_rtn("+[IRConfiguration new]", "IRConfiguration.m", 88, "NO");
}

@end

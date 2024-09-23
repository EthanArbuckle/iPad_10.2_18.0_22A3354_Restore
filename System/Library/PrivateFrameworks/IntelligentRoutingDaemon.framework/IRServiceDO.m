@implementation IRServiceDO

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_lastSeenDate, 0);
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (NSDate)lastSeenDate
{
  return self->_lastSeenDate;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

+ (IRServiceDO)serviceDOWithLastSeenDate:(id)a3 clientIdentifier:(id)a4 serviceIdentifier:(id)a5 servicePackage:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLastSeenDate:clientIdentifier:serviceIdentifier:servicePackage:", v12, v11, v10, a6);

  return (IRServiceDO *)v13;
}

- (id)copyWithReplacementLastSeenDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLastSeenDate:clientIdentifier:serviceIdentifier:servicePackage:", v4, self->_clientIdentifier, self->_serviceIdentifier, self->_servicePackage);

  return v5;
}

- (IRServiceDO)initWithLastSeenDate:(id)a3 clientIdentifier:(id)a4 serviceIdentifier:(id)a5 servicePackage:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  IRServiceDO *v14;
  IRServiceDO *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)IRServiceDO;
  v14 = -[IRServiceDO init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_lastSeenDate, a3);
    objc_storeStrong((id *)&v15->_clientIdentifier, a4);
    objc_storeStrong((id *)&v15->_serviceIdentifier, a5);
    v15->_servicePackage = a6;
  }

  return v15;
}

- (int64_t)servicePackage
{
  return self->_servicePackage;
}

- (id)copyWithReplacementClientIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLastSeenDate:clientIdentifier:serviceIdentifier:servicePackage:", self->_lastSeenDate, v4, self->_serviceIdentifier, self->_servicePackage);

  return v5;
}

- (id)copyWithReplacementServiceIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLastSeenDate:clientIdentifier:serviceIdentifier:servicePackage:", self->_lastSeenDate, self->_clientIdentifier, v4, self->_servicePackage);

  return v5;
}

- (id)copyWithReplacementServicePackage:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLastSeenDate:clientIdentifier:serviceIdentifier:servicePackage:", self->_lastSeenDate, self->_clientIdentifier, self->_serviceIdentifier, a3);
}

- (BOOL)isEqualToServiceDO:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSDate *lastSeenDate;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSString *clientIdentifier;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  NSString *serviceIdentifier;
  void *v22;
  int v23;
  int64_t servicePackage;
  BOOL v25;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_12;
  v6 = self->_lastSeenDate != 0;
  objc_msgSend(v4, "lastSeenDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_12;
  lastSeenDate = self->_lastSeenDate;
  if (lastSeenDate)
  {
    objc_msgSend(v5, "lastSeenDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSDate isEqual:](lastSeenDate, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  v12 = self->_clientIdentifier != 0;
  objc_msgSend(v5, "clientIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_12;
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier)
  {
    objc_msgSend(v5, "clientIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSString isEqual:](clientIdentifier, "isEqual:", v16);

    if (!v17)
      goto LABEL_12;
  }
  v18 = self->_serviceIdentifier != 0;
  objc_msgSend(v5, "serviceIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20
    || (serviceIdentifier = self->_serviceIdentifier) != 0
    && (objc_msgSend(v5, "serviceIdentifier"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = -[NSString isEqual:](serviceIdentifier, "isEqual:", v22),
        v22,
        !v23))
  {
LABEL_12:
    v25 = 0;
  }
  else
  {
    servicePackage = self->_servicePackage;
    v25 = servicePackage == objc_msgSend(v5, "servicePackage");
  }

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  IRServiceDO *v4;
  IRServiceDO *v5;
  BOOL v6;

  v4 = (IRServiceDO *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IRServiceDO isEqualToServiceDO:](self, "isEqualToServiceDO:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSDate hash](self->_lastSeenDate, "hash");
  v4 = -[NSString hash](self->_clientIdentifier, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_serviceIdentifier, "hash");
  return self->_servicePackage - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRServiceDO)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  IRServiceDO *v14;
  objc_class *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  objc_class *v20;
  void *v21;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastSeenDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRServiceDO key \"lastSeenDate\" (expected %@, decoded %@)"), v7, v9, 0);
      v32 = *MEMORY[0x24BDD0FC8];
      v33[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRServiceDOOCNTErrorDomain"), 3, v11);
      objc_msgSend(v4, "failWithError:", v12);
LABEL_15:

LABEL_16:
LABEL_17:
      v14 = 0;
LABEL_18:

      goto LABEL_19;
    }
LABEL_6:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRServiceDO key \"clientIdentifier\" (expected %@, decoded %@)"), v9, v10, 0);
        v30 = *MEMORY[0x24BDD0FC8];
        v31 = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRServiceDOOCNTErrorDomain"), 3, v12);
        objc_msgSend(v4, "failWithError:", v17);
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v14 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRServiceDO key \"serviceIdentifier\" (expected %@, decoded %@)"), v10, v11, 0);
        v28 = *MEMORY[0x24BDD0FC8];
        v29 = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRServiceDOOCNTErrorDomain"), 3, v17);
        objc_msgSend(v4, "failWithError:", v21);

        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(v4, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        goto LABEL_17;
    }
    v24 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("servicePackage"));
    if (v24)
      goto LABEL_23;
    objc_msgSend(v4, "error");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      goto LABEL_17;
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("servicePackage")) & 1) != 0)
    {
LABEL_23:
      self = -[IRServiceDO initWithLastSeenDate:clientIdentifier:serviceIdentifier:servicePackage:](self, "initWithLastSeenDate:clientIdentifier:serviceIdentifier:servicePackage:", v5, v7, v9, v24);
      v14 = self;
      goto LABEL_18;
    }
    v26 = *MEMORY[0x24BDD0FC8];
    v27 = CFSTR("Missing serialized value for IRServiceDO.servicePackage");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRServiceDOOCNTErrorDomain"), 1, v10);
    objc_msgSend(v4, "failWithError:", v11);
    goto LABEL_16;
  }
  objc_msgSend(v4, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_6;
  v14 = 0;
LABEL_20:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDate *lastSeenDate;
  NSString *clientIdentifier;
  NSString *serviceIdentifier;
  id v8;

  v4 = a3;
  lastSeenDate = self->_lastSeenDate;
  v8 = v4;
  if (lastSeenDate)
  {
    objc_msgSend(v4, "encodeObject:forKey:", lastSeenDate, CFSTR("lastSeenDate"));
    v4 = v8;
  }
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier)
  {
    objc_msgSend(v8, "encodeObject:forKey:", clientIdentifier, CFSTR("clientIdentifier"));
    v4 = v8;
  }
  serviceIdentifier = self->_serviceIdentifier;
  if (serviceIdentifier)
  {
    objc_msgSend(v8, "encodeObject:forKey:", serviceIdentifier, CFSTR("serviceIdentifier"));
    v4 = v8;
  }
  objc_msgSend(v4, "encodeInt64:forKey:", self->_servicePackage, CFSTR("servicePackage"));

}

- (id)description
{
  id v3;
  NSString *serviceIdentifier;
  void *v5;
  void *v6;
  __int128 v8;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8 = *(_OWORD *)&self->_lastSeenDate;
  serviceIdentifier = self->_serviceIdentifier;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_servicePackage);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<IRServiceDO | lastSeenDate:%@ clientIdentifier:%@ serviceIdentifier:%@ servicePackage:%@>"), v8, serviceIdentifier, v5);

  return v6;
}

@end

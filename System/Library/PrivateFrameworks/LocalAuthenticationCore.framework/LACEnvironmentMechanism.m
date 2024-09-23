@implementation LACEnvironmentMechanism

- (LACEnvironmentMechanism)initWithAvailabilityError:(id)a3 localizedName:(id)a4 iconSystemName:(id)a5
{
  id v9;
  id v10;
  id v11;
  LACEnvironmentMechanism *v12;
  LACEnvironmentMechanism *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACEnvironmentMechanism;
  v12 = -[LACEnvironmentMechanism init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_availabilityError, a3);
    objc_storeStrong((id *)&v13->_localizedName, a4);
    objc_storeStrong((id *)&v13->_iconSystemName, a5);
  }

  return v13;
}

+ (id)environmentMechanismForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6
{
  if (a6)
  {
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, CFSTR("Call must be made on a subclass"), a5);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[LACEnvironmentMechanism availabilityError](self, "availabilityError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_availabilityError);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[LACEnvironmentMechanism localizedName](self, "localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[LACEnvironmentMechanism iconSystemName](self, "iconSystemName");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_iconSystemName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

- (LACEnvironmentMechanism)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  LACEnvironmentMechanism *v11;

  v4 = a3;
  NSStringFromSelector(sel_availabilityError);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_localizedName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_iconSystemName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[LACEnvironmentMechanism initWithAvailabilityError:localizedName:iconSystemName:](self, "initWithAvailabilityError:localizedName:iconSystemName:", v6, v8, v10);
  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[LACEnvironmentMechanism descriptionDetails](self, "descriptionDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACEnvironmentMechanism availabilityError](self, "availabilityError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[LACError error:hasCode:](LACError, "error:hasCode:", v4, -1004))
  {
    v5 = CFSTR("usable");
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[LACEnvironmentMechanism availabilityError](self, "availabilityError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACEnvironmentMechanism availabilityError](self, "availabilityError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ error %d"), v8, objc_msgSend(v9, "code"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[LACEnvironmentMechanism localizedName](self, "localizedName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<'%@' %@ (%@)>"), v11, v5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)descriptionDetails
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (BOOL)isEqual:(id)a3
{
  LACEnvironmentMechanism *v4;
  LACEnvironmentMechanism *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = (LACEnvironmentMechanism *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[LACEnvironmentMechanism availabilityError](self, "availabilityError");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACEnvironmentMechanism availabilityError](v5, "availabilityError");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[LACEnvironmentMechanism availabilityError](self, "availabilityError");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[LACEnvironmentMechanism availabilityError](v5, "availabilityError");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (!v11)
          goto LABEL_11;
      }
      -[LACEnvironmentMechanism localizedName](self, "localizedName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACEnvironmentMechanism localizedName](v5, "localizedName");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v13 == (void *)v14)
      {

      }
      else
      {
        v15 = (void *)v14;
        -[LACEnvironmentMechanism localizedName](self, "localizedName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[LACEnvironmentMechanism localizedName](v5, "localizedName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToString:", v17);

        if (!v18)
        {
LABEL_11:
          v12 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      -[LACEnvironmentMechanism iconSystemName](self, "iconSystemName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACEnvironmentMechanism iconSystemName](v5, "iconSystemName");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v19 == (void *)v20)
      {
        v12 = 1;
        v21 = v19;
      }
      else
      {
        v21 = (void *)v20;
        -[LACEnvironmentMechanism iconSystemName](self, "iconSystemName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[LACEnvironmentMechanism iconSystemName](v5, "iconSystemName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v22, "isEqualToString:", v23);

      }
      goto LABEL_17;
    }
    v12 = 0;
  }
LABEL_18:

  return v12;
}

- (NSError)availabilityError
{
  return self->_availabilityError;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)iconSystemName
{
  return self->_iconSystemName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconSystemName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_availabilityError, 0);
}

@end

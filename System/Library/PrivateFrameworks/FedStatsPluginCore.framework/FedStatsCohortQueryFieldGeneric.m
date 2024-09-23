@implementation FedStatsCohortQueryFieldGeneric

- (id)initQueryFieldWithKey:(id)a3
{
  id v5;
  FedStatsCohortQueryFieldGeneric *v6;
  FedStatsCohortQueryFieldGeneric *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsCohortQueryFieldGeneric;
  v6 = -[FedStatsCohortQueryFieldGeneric init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cohortName, a3);

  return v7;
}

+ (id)cohortQueryFieldWithKey:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initQueryFieldWithKey:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  -[FedStatsCohortQueryFieldGeneric cohortName](self, "cohortName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x24BE30C80];
      v11 = (void *)MEMORY[0x24BDD17C8];
      -[FedStatsCohortQueryFieldGeneric cohortName](self, "cohortName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("The data should have a value for key \"%@\"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithCode:description:", 100, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v9 = &stru_250C58180;
  }

  return v9;
}

+ (id)cohortInstance
{
  return 0;
}

- (NSString)cohortName
{
  return self->_cohortName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cohortName, 0);
}

@end

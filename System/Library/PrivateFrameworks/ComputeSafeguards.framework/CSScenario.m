@implementation CSScenario

- (CSScenario)initWithIdentifier:(id)a3 andCriteria:(id)a4
{
  id v7;
  id v8;
  CSScenario *v9;
  CSScenario *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSScenario;
  v9 = -[CSScenario init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_scenarioCriteria, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CSScenario *v4;
  CSScenario *v5;
  NSString *identifier;
  void *v7;
  NSDictionary *scenarioCriteria;
  void *v9;
  char v10;

  v4 = (CSScenario *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else if (-[CSScenario isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    identifier = self->_identifier;
    -[CSScenario identifier](v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](identifier, "isEqualToString:", v7))
    {
      scenarioCriteria = self->_scenarioCriteria;
      -[CSScenario scenarioCriteria](v5, "scenarioCriteria");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSDictionary isEqualToDictionary:](scenarioCriteria, "isEqualToDictionary:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CSScenario: %@, %@"), self->_identifier, self->_scenarioCriteria);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)scenarioCriteria
{
  return self->_scenarioCriteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenarioCriteria, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

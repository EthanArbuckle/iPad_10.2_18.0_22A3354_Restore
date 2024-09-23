@implementation EMTMeaningDescription

- (EMTMeaningDescription)initWithDefinition:(id)a3
{
  id v5;
  EMTMeaningDescription *v6;
  EMTMeaningDescription *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMTMeaningDescription;
  v6 = -[EMTMeaningDescription init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_definition, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *definition;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    definition = self->_definition;
    objc_msgSend(v4, "definition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqual:](definition, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)definition
{
  return self->_definition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definition, 0);
}

@end

@implementation BGSystemTaskCompletionDependency

- (BGSystemTaskCompletionDependency)initWithIdentifier:(id)a3
{
  id v5;
  BGSystemTaskCompletionDependency *v6;
  BGSystemTaskCompletionDependency *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BGSystemTaskCompletionDependency;
  v6 = -[BGSystemTaskCompletionDependency init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (id)asDictionary
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("DependencyTypeCompletion"), CFSTR("DependencyType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("DependencyIdentifier"));
  return v3;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %@>"), objc_opt_class(), self->_identifier);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

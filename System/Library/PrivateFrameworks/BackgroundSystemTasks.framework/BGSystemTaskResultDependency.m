@implementation BGSystemTaskResultDependency

- (BGSystemTaskResultDependency)initWithIdentifier:(id)a3 batchSize:(unint64_t)a4
{
  id v7;
  BGSystemTaskResultDependency *v8;
  BGSystemTaskResultDependency *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BGSystemTaskResultDependency;
  v8 = -[BGSystemTaskResultDependency init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_batchSize = a4;
  }

  return v9;
}

- (id)asDictionary
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("DependencyTypeResult"), CFSTR("DependencyType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("DependencyIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_batchSize);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ResultDependencyBatchSize"));

  return v3;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %@: count: %ld>"), objc_opt_class(), self->_identifier, self->_batchSize);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

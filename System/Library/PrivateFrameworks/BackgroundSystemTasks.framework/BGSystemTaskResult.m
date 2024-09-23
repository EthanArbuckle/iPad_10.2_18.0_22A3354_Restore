@implementation BGSystemTaskResult

- (BGSystemTaskResult)initWithIdentifier:(id)a3 cumulativeProductionCount:(unint64_t)a4
{
  id v7;
  BGSystemTaskResult *v8;
  BGSystemTaskResult *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BGSystemTaskResult;
  v8 = -[BGSystemTaskResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_count = a4;
  }

  return v9;
}

- (BGSystemTaskResult)initWithIdentifier:(id)a3 consumptionCount:(unint64_t)a4
{
  id v7;
  BGSystemTaskResult *v8;
  BGSystemTaskResult *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BGSystemTaskResult;
  v8 = -[BGSystemTaskResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_count = a4;
  }

  return v9;
}

- (id)asDASActivityResult
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D918]), "initWithIdentifier:count:", self->_identifier, self->_count);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<BGSystemTaskResult: %@: count: %ld>"), self->_identifier, self->_count);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end

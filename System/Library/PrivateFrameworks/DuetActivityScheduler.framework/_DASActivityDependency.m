@implementation _DASActivityDependency

- (id)initResultDependencyWithIdentifier:(id)a3 batchSize:(int64_t)a4
{
  id v7;
  _DASActivityDependency *v8;
  _DASActivityDependency *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DASActivityDependency;
  v8 = -[_DASActivityDependency init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_batchSize = a4;
  }

  return v9;
}

- (id)initActivityCompletionDependencyWithIdentifier:(id)a3
{
  id v5;
  _DASActivityDependency *v6;
  _DASActivityDependency *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DASActivityDependency;
  v6 = -[_DASActivityDependency init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_batchSize = -1;
  }

  return v7;
}

- (BOOL)isActivityCompletionBased
{
  return self->_batchSize == -1;
}

- (BOOL)isSatisfiedByResult:(id)a3
{
  return -[_DASActivityDependency isSatisfiedByAvailableResultCount:](self, "isSatisfiedByAvailableResultCount:", objc_msgSend(a3, "count"));
}

- (BOOL)isSatisfiedByAvailableResultCount:(int64_t)a3
{
  return self->_batchSize <= a3;
}

- (BOOL)isEqual:(id)a3
{
  _DASActivityDependency *v4;
  _DASActivityDependency *v5;
  void *v6;
  BOOL v7;

  v4 = (_DASActivityDependency *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_DASActivityDependency identifier](v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", self->_identifier))
        v7 = -[_DASActivityDependency batchSize](v5, "batchSize") == self->_batchSize;
      else
        v7 = 0;

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  NSString *identifier;
  int64_t batchSize;
  _BOOL4 v7;
  const __CFString *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  identifier = self->_identifier;
  batchSize = self->_batchSize;
  v7 = -[_DASActivityDependency isActivityCompletionBased](self, "isActivityCompletionBased");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@: batchSize: %ld, isActivityCompletion: %@>"), v4, identifier, batchSize, v8);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;
  id v6;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_batchSize);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("batchSize"));

}

- (_DASActivityDependency)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  _DASActivityDependency *v8;
  int v9;
  id v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("batchSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    v9 = objc_msgSend(v6, "intValue");
    v10 = objc_alloc((Class)objc_opt_class());
    if (v9 == -1)
      v11 = objc_msgSend(v10, "initActivityCompletionDependencyWithIdentifier:", v5);
    else
      v11 = objc_msgSend(v10, "initResultDependencyWithIdentifier:batchSize:", v5, (int)objc_msgSend(v6, "intValue"));
    v8 = (_DASActivityDependency *)v11;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)dictionary
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  NSString *identifier;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (-[_DASActivityDependency isActivityCompletionBased](self, "isActivityCompletionBased"))
  {
    identifier = self->_identifier;
    v12[0] = &unk_1E62595D8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &identifier, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = self->_identifier;
    v7 = CFSTR("BatchSize");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_batchSize);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

@end

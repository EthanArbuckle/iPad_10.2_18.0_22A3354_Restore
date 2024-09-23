@implementation FHAggregateFeature

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("aggregateType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_processingWindowStartDate, CFSTR("processingWindowStartDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_processingWindowEndDate, CFSTR("processingWindowEndDate"));

}

- (FHAggregateFeature)initWithCoder:(id)a3
{
  id v4;
  FHAggregateFeature *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSDate *processingWindowStartDate;
  uint64_t v10;
  NSDate *processingWindowEndDate;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FHAggregateFeature;
  v5 = -[FHAggregateFeature init](&v13, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("aggregateType"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("processingWindowStartDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    processingWindowStartDate = v5->_processingWindowStartDate;
    v5->_processingWindowStartDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("processingWindowEndDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    processingWindowEndDate = v5->_processingWindowEndDate;
    v5->_processingWindowEndDate = (NSDate *)v10;

  }
  return v5;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%lu'; "), CFSTR("aggregateType"), self->_type);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("name"), self->_name);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "),
    CFSTR("processingWindowStartDate"),
    self->_processingWindowStartDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "),
    CFSTR("processingWindowEndDate"),
    self->_processingWindowEndDate);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[FHAggregateFeature type](self, "type");
  -[FHAggregateFeature name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") - v3 + 32 * v3;

  -[FHAggregateFeature processingWindowStartDate](self, "processingWindowStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") - v5 + 32 * v5;

  -[FHAggregateFeature processingWindowEndDate](self, "processingWindowEndDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash") - v7 + 32 * v7 + 923521;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  FHAggregateFeature *v4;
  FHAggregateFeature *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (FHAggregateFeature *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else if (v4
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && (v6 = -[FHAggregateFeature type](self, "type"), v6 == -[FHAggregateFeature type](v5, "type")))
  {
    -[FHAggregateFeature name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHAggregateFeature name](v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[FHAggregateFeature processingWindowStartDate](self, "processingWindowStartDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHAggregateFeature processingWindowStartDate](v5, "processingWindowStartDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[FHAggregateFeature processingWindowEndDate](self, "processingWindowEndDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[FHAggregateFeature processingWindowEndDate](v5, "processingWindowEndDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)processingWindowStartDate
{
  return self->_processingWindowStartDate;
}

- (void)setProcessingWindowStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)processingWindowEndDate
{
  return self->_processingWindowEndDate;
}

- (void)setProcessingWindowEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingWindowEndDate, 0);
  objc_storeStrong((id *)&self->_processingWindowStartDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

@implementation FHDateTimeAggregateFeature

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FHDateTimeAggregateFeature;
  v4 = a3;
  -[FHAggregateFeature encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[FHDateTimeAggregateFeature startDate](self, "startDate", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("startDate"));

  -[FHDateTimeAggregateFeature endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("endDate"));

}

- (FHDateTimeAggregateFeature)initWithCoder:(id)a3
{
  id v4;
  FHDateTimeAggregateFeature *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FHDateTimeAggregateFeature;
  v5 = -[FHAggregateFeature initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHDateTimeAggregateFeature setStartDate:](v5, "setStartDate:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHDateTimeAggregateFeature setEndDate:](v5, "setEndDate:", v7);

  }
  return v5;
}

- (FHDateTimeAggregateFeature)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7;
  id v8;
  FHDateTimeAggregateFeature *v9;
  FHDateTimeAggregateFeature *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FHDateTimeAggregateFeature;
  v9 = -[FHDateTimeAggregateFeature init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[FHAggregateFeature setType:](v9, "setType:", 2);
    objc_storeStrong((id *)&v10->_startDate, a3);
    objc_storeStrong((id *)&v10->_endDate, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("startDate"), self->_startDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("endDate"), self->_endDate);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FHDateTimeAggregateFeature;
  v3 = -[FHAggregateFeature hash](&v9, sel_hash);
  -[FHDateTimeAggregateFeature startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") - v3 + 32 * v3;

  -[FHDateTimeAggregateFeature endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") - v5 + 32 * v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  FHDateTimeAggregateFeature *v4;
  FHDateTimeAggregateFeature *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = (FHDateTimeAggregateFeature *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v10 = 1;
  }
  else if (v4
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && (v12.receiver = self,
             v12.super_class = (Class)FHDateTimeAggregateFeature,
             -[FHAggregateFeature isEqual:](&v12, sel_isEqual_, v5)))
  {
    -[FHDateTimeAggregateFeature startDate](self, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHDateTimeAggregateFeature startDate](v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[FHDateTimeAggregateFeature endDate](self, "endDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FHDateTimeAggregateFeature endDate](v5, "endDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

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

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end

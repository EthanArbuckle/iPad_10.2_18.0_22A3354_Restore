@implementation ATXFreeMoment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXFreeMoment)initWithDateRange:(id)a3 score:(double)a4
{
  id v7;
  ATXFreeMoment *v8;
  ATXFreeMoment *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXFreeMoment;
  v8 = -[ATXFreeMoment init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dateRange, a3);
    v9->_score = a4;
  }

  return v9;
}

- (ATXFreeMoment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  ATXFreeMoment *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateRange"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("score"));
  v7 = v6;

  v8 = -[ATXFreeMoment initWithDateRange:score:](self, "initWithDateRange:score:", v5, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ATXFreeMoment dateRange](self, "dateRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("dateRange"));

  -[ATXFreeMoment score](self, "score");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("score"));

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)MEMORY[0x1E0CB3578];
  -[ATXFreeMoment dateRange](self, "dateRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringFromDate:dateStyle:timeStyle:", v6, 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3578];
  -[ATXFreeMoment dateRange](self, "dateRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringFromDate:dateStyle:timeStyle:", v10, 1, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXFreeMoment score](self, "score");
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<Start: %@, End: %@, Score: %f>"), v7, v11, v12);

  return v13;
}

- (NSDateInterval)dateRange
{
  return self->_dateRange;
}

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRange, 0);
}

@end

@implementation _HKActivityStatisticsWorkoutInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  id v5;
  void *v6;
  NSDate *endDate;
  void *v8;
  HKSource *source;
  id v10;

  startDate = self->_startDate;
  v5 = a3;
  NSStringFromSelector(sel_startDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", startDate, v6);

  endDate = self->_endDate;
  NSStringFromSelector(sel_endDate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", endDate, v8);

  source = self->_source;
  NSStringFromSelector(sel_source);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", source, v10);

}

- (_HKActivityStatisticsWorkoutInfo)initWithStartDate:(id)a3 endDate:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  _HKActivityStatisticsWorkoutInfo *v11;
  uint64_t v12;
  NSDate *startDate;
  uint64_t v14;
  NSDate *endDate;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_HKActivityStatisticsWorkoutInfo;
  v11 = -[_HKActivityStatisticsWorkoutInfo init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v12;

    v14 = objc_msgSend(v9, "copy");
    endDate = v11->_endDate;
    v11->_endDate = (NSDate *)v14;

    objc_storeStrong((id *)&v11->_source, a5);
  }

  return v11;
}

- (_HKActivityStatisticsWorkoutInfo)initWithCoder:(id)a3
{
  id v4;
  _HKActivityStatisticsWorkoutInfo *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSDate *startDate;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDate *endDate;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  HKSource *source;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_HKActivityStatisticsWorkoutInfo;
  v5 = -[_HKActivityStatisticsWorkoutInfo init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_startDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_endDate);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_source);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (HKSource *)v16;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v5 = a3;
  if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(v5, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKActivityStatisticsWorkoutInfo startDate](self, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 != v7)
    {
      -[_HKActivityStatisticsWorkoutInfo startDate](self, "startDate");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v11 = 0;
        goto LABEL_29;
      }
      v3 = (void *)v8;
      objc_msgSend(v5, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKActivityStatisticsWorkoutInfo startDate](self, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isEqualToDate:", v10))
      {
        v11 = 0;
LABEL_28:

        goto LABEL_29;
      }
      v32 = v10;
      v33 = v9;
    }
    objc_msgSend(v5, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKActivityStatisticsWorkoutInfo endDate](self, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 != v13)
    {
      -[_HKActivityStatisticsWorkoutInfo endDate](self, "endDate");
      v14 = objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        v11 = 0;
LABEL_23:

        goto LABEL_24;
      }
      v15 = (void *)v14;
      objc_msgSend(v5, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKActivityStatisticsWorkoutInfo endDate](self, "endDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isEqualToDate:", v17) & 1) == 0)
      {

        v11 = 0;
LABEL_24:
        v25 = v6 == v7;
        goto LABEL_27;
      }
      v28 = v17;
      v29 = v16;
      v30 = v15;
    }
    objc_msgSend(v5, "source");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKActivityStatisticsWorkoutInfo source](self, "source");
    v19 = objc_claimAutoreleasedReturnValue();
    v11 = v18 == (void *)v19;
    if (v18 == (void *)v19)
    {

    }
    else
    {
      v20 = (void *)v19;
      v31 = v12;
      -[_HKActivityStatisticsWorkoutInfo source](self, "source");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = (void *)v21;
        v27 = v3;
        objc_msgSend(v5, "source");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HKActivityStatisticsWorkoutInfo source](self, "source");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v23, "isEqual:", v24);

        if (v31 == v13)
        {

        }
        else
        {

        }
        v25 = v6 == v7;
        v3 = v27;
LABEL_27:
        v10 = v32;
        v9 = v33;
        if (!v25)
          goto LABEL_28;
LABEL_29:

        goto LABEL_30;
      }

    }
    if (v12 != v13)
    {

    }
    goto LABEL_23;
  }
  v11 = 0;
LABEL_30:

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)_HKActivityStatisticsWorkoutInfo;
  -[_HKActivityStatisticsWorkoutInfo description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKActivityStatisticsWorkoutInfo startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKActivityStatisticsWorkoutInfo endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKActivityStatisticsWorkoutInfo source](self, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Start Date: %@; End Date: %@; source: %@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (HKSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end

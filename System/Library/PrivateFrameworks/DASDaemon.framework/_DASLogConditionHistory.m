@implementation _DASLogConditionHistory

- (_DASLogConditionHistory)initWithCondition:(id)a3 fromDate:(id)a4
{
  _DASLogConditionHistory *v4;
  uint64_t v5;
  NSMutableArray *conditions;
  uint64_t v7;
  NSMutableArray *intervals;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_DASLogConditionHistory;
  v4 = -[_DASLogConditionHistory init](&v10, sel_init, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    conditions = v4->_conditions;
    v4->_conditions = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    intervals = v4->_intervals;
    v4->_intervals = (NSMutableArray *)v7;

  }
  return v4;
}

+ (id)condition:(id)a3 fromDate:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCondition:fromDate:", v6, v5);

  return v7;
}

- (void)addCondition:(id)a3 atDate:(id)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSMutableArray lastObject](self->_conditions, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v9);

  if ((v8 & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_conditions, "addObject:", v9);
    -[NSMutableArray addObject:](self->_intervals, "addObject:", v6);
  }

}

- (id)idealIntervals
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_conditions, "count"))
  {
    v4 = 0;
    v5 = 0;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_conditions, "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isIdeal");

      if (v7)
      {
        if (!v5)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_intervals, "objectAtIndexedSubscript:", v4);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else if (v5)
      {
        v8 = objc_alloc(MEMORY[0x24BDD1508]);
        -[NSMutableArray objectAtIndexedSubscript:](self->_intervals, "objectAtIndexedSubscript:", v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v8, "initWithStartDate:endDate:", v5, v9);
        objc_msgSend(v3, "addObject:", v10);

        v5 = 0;
      }
      ++v4;
    }
    while (v4 < -[NSMutableArray count](self->_conditions, "count"));
    if (v5)
    {
      v11 = objc_alloc(MEMORY[0x24BDD1508]);
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v5, v12);
      objc_msgSend(v3, "addObject:", v13);

    }
  }
  else
  {
    v5 = 0;
  }
  v14 = (void *)objc_msgSend(v3, "copy");

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  unint64_t v31;
  void *v32;

  if (-[NSMutableArray count](self->_conditions, "count"))
  {
    if (description_onceToken != -1)
      dispatch_once(&description_onceToken, &__block_literal_global);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[NSMutableArray count](self->_conditions, "count");
    if (v4)
    {
      v31 = v4 - 1;
      if (v4 == 1)
      {
        v9 = 0;
      }
      else
      {
        v5 = 0;
        v6 = 1;
        do
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_intervals, "objectAtIndexedSubscript:", v5);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "components:fromDate:", 24, v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v6;
          -[NSMutableArray objectAtIndexedSubscript:](self->_intervals, "objectAtIndexedSubscript:", v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "components:fromDate:", 24, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v8, "isEqual:", v11);

          v13 = (void *)MEMORY[0x24BDD17C8];
          v14 = (void *)description_formatter;
          -[NSMutableArray objectAtIndexedSubscript:](self->_intervals, "objectAtIndexedSubscript:", v5);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringFromDate:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            v17 = (void *)description_shortFormatter;
          else
            v17 = (void *)description_formatter;
          -[NSMutableArray objectAtIndexedSubscript:](self->_intervals, "objectAtIndexedSubscript:", v9);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringFromDate:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ - %@"), v16, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = objc_retainAutorelease(v20);
          v22 = objc_msgSend(v21, "UTF8String");
          -[NSMutableArray objectAtIndexedSubscript:](self->_conditions, "objectAtIndexedSubscript:", v5);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("  %-50s %@\n"), v22, v23);

          v6 = v9 + 1;
          v5 = v9;
        }
        while (v31 > v9);
      }
      v25 = (void *)description_formatter;
      -[NSMutableArray objectAtIndexedSubscript:](self->_intervals, "objectAtIndexedSubscript:", v9);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringFromDate:", v26);
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v28 = objc_msgSend(v27, "UTF8String");
      -[NSMutableArray objectAtIndexedSubscript:](self->_conditions, "objectAtIndexedSubscript:", v9);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("  %-50s %@"), v28, v29);

    }
    v24 = (__CFString *)objc_msgSend(v3, "copy");

  }
  else
  {
    v24 = &stru_24E138A50;
  }
  return v24;
}

- (NSMutableArray)conditions
{
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
  objc_storeStrong((id *)&self->_conditions, a3);
}

- (NSMutableArray)intervals
{
  return self->_intervals;
}

- (void)setIntervals:(id)a3
{
  objc_storeStrong((id *)&self->_intervals, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervals, 0);
  objc_storeStrong((id *)&self->_conditions, 0);
}

@end

@implementation ACHDateComponentInterval

- (ACHDateComponentInterval)initWithStartDateComponents:(id)a3 endDateComponents:(id)a4
{
  id v7;
  id v8;
  ACHDateComponentInterval *v9;
  ACHDateComponentInterval *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ACHDateComponentInterval;
  v9 = -[ACHDateComponentInterval init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDateComponents, a3);
    objc_storeStrong((id *)&v10->_endDateComponents, a4);
  }

  return v10;
}

- (BOOL)containsDateComponents:(id)a3 inCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  -[ACHDateComponentInterval startDateComponents](self, "startDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHDateComponentInterval endDateComponents](self, "endDateComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dateFromComponents:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v9, v11);
  LOBYTE(v7) = objc_msgSend(v13, "containsDate:", v12);

  return (char)v7;
}

- (unint64_t)countOfDaysContainedInIntervalInCalendar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  -[ACHDateComponentInterval startDateComponents](self, "startDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHDateComponentInterval endDateComponents](self, "endDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDateComponents:toDateComponents:options:", 16, v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "day") + 1;
  return v8;
}

- (id)chunked:(int64_t)a3 calendar:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  ACHDateComponentInterval *v22;
  void *v23;
  void *v25;
  id v26;

  v6 = a4;
  -[ACHDateComponentInterval startDateComponents](self, "startDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACHDateComponentInterval endDateComponents](self, "endDateComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v8;
  v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = v11;
  v25 = v11;
  if (objc_msgSend(v11, "compare:", v10) != 1)
  {
    v13 = v11;
    do
    {
      v14 = (void *)MEMORY[0x2199C8424]();
      objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, 1, v13, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "components:fromDate:toDate:options:", 16, v11, v12, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "day");

      v17 = objc_msgSend(v12, "compare:", v10);
      v18 = v17;
      if (v16 == a3 || v17 != -1)
      {
        objc_msgSend(v6, "components:fromDate:", 28, v11, v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 == -1)
          v20 = v12;
        else
          v20 = v10;
        objc_msgSend(v6, "components:fromDate:", 28, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[ACHDateComponentInterval initWithStartDateComponents:endDateComponents:]([ACHDateComponentInterval alloc], "initWithStartDateComponents:endDateComponents:", v19, v21);
        objc_msgSend(v26, "addObject:", v22);
        objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, 1, v12, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = v23;
        v12 = v11;
      }
      objc_autoreleasePoolPop(v14);
      v13 = v12;
    }
    while (objc_msgSend(v12, "compare:", v10) != 1);
  }

  return v26;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ACHDateComponentInterval startDateComponents](self, "startDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHDateComponentInterval endDateComponents](self, "endDateComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ACHYearMonthDayStringFromDateComponents(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDateComponents)startDateComponents
{
  return self->_startDateComponents;
}

- (NSDateComponents)endDateComponents
{
  return self->_endDateComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDateComponents, 0);
  objc_storeStrong((id *)&self->_startDateComponents, 0);
}

@end

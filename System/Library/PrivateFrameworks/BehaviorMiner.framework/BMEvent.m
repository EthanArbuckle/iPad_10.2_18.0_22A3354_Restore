@implementation BMEvent

- (BMEvent)initWithStartDate:(id)a3 endDate:(id)a4 item:(id)a5
{
  id v8;
  id v9;
  id v10;
  BMEvent *v11;
  uint64_t v12;
  NSDate *startDate;
  uint64_t v14;
  NSDate *endDate;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BMEvent;
  v11 = -[BMEvent init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    startDate = v11->_startDate;
    v11->_startDate = (NSDate *)v12;

    v14 = objc_msgSend(v9, "copy");
    endDate = v11->_endDate;
    v11->_endDate = (NSDate *)v14;

    objc_storeStrong((id *)&v11->_item, a5);
  }

  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[BMEvent startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMEvent endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMEvent item](self, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> startDate: %@, endDate: %@, item: %@"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (BMItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end

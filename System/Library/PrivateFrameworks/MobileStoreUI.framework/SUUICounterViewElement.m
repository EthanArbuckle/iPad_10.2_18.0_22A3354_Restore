@implementation SUUICounterViewElement

- (SUUICounterViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUICounterViewElement *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSDate *endDate;
  void *v16;
  uint64_t v17;
  NSDate *startValueDate;
  void *v19;
  double v20;
  uint64_t v21;
  NSString *numberFormat;
  void *v23;
  void *v24;
  objc_super v26;

  v8 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SUUICounterViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v26, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (!v9)
    goto LABEL_15;
  objc_msgSend(v8, "getAttribute:", CFSTR("type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_counterType = objc_msgSend(v10, "isEqualToString:", CFSTR("timer")) ^ 1;
  objc_msgSend(v8, "getAttribute:", CFSTR("dateFormat"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "isEqualToString:", CFSTR("hm")))
  {
    v12 = 3;
LABEL_9:
    v9->_dateFormatType = v12;
    goto LABEL_10;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("hms")))
  {
    v12 = 2;
    goto LABEL_9;
  }
  if (!objc_msgSend(v11, "isEqualToString:", CFSTR("dhms")))
  {
    v12 = 1;
    goto LABEL_9;
  }
  v9->_dateFormatType = 0;
LABEL_10:
  objc_msgSend(v8, "getAttribute:", CFSTR("endDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "length"))
  {
    SUUIViewElementDateWithString(v13);
    v14 = objc_claimAutoreleasedReturnValue();
    endDate = v9->_endDate;
    v9->_endDate = (NSDate *)v14;

  }
  objc_msgSend(v8, "getAttribute:", CFSTR("timestamp"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "length"))
  {
    SUUIViewElementDateWithString(v16);
    v17 = objc_claimAutoreleasedReturnValue();
    startValueDate = v9->_startValueDate;
    v9->_startValueDate = (NSDate *)v17;

  }
  objc_msgSend(v8, "getAttribute:", CFSTR("rate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v9->_changeRatePerSecond = v20;

  objc_msgSend(v8, "getAttribute:", CFSTR("numberFormat"));
  v21 = objc_claimAutoreleasedReturnValue();
  numberFormat = v9->_numberFormat;
  v9->_numberFormat = (NSString *)v21;

  objc_msgSend(v8, "getAttribute:", CFSTR("value"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_startValue = objc_msgSend(v23, "longLongValue");

  objc_msgSend(v8, "getAttribute:", CFSTR("endValue"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v9->_stopValue = objc_msgSend(v24, "longLongValue");

LABEL_15:
  return v9;
}

- (SUUIImageViewElement)backgroundImageElement
{
  return (SUUIImageViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 49);
}

- (int64_t)currentNumberValue
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  uint64_t v11;
  int64_t v12;
  int64_t v13;

  v3 = -[SUUICounterViewElement stopValue](self, "stopValue");
  -[SUUICounterViewElement startValueDate](self, "startValueDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SUUICounterViewElement changeRatePerSecond](self, "changeRatePerSecond");
    v6 = v5;
    v7 = (double)-[SUUICounterViewElement startValue](self, "startValue");
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUICounterViewElement startValueDate](self, "startValueDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v11 = (uint64_t)(v7 + v10 * v6);

    if (v3 >= v11)
      v12 = v11;
    else
      v12 = v3;
    if (v3 <= v11)
      v13 = v11;
    else
      v13 = v3;
    if (v6 >= 0.0)
      v3 = v12;
    else
      v3 = v13;
  }

  return v3;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUICounterViewElement *v4;
  SUUICounterViewElement *v5;
  SUUICounterViewElement *v6;
  double v7;
  NSDate *v8;
  NSDate *endDate;
  NSString *v10;
  NSString *numberFormat;
  NSDate *v12;
  NSDate *startValueDate;
  objc_super v15;

  v4 = (SUUICounterViewElement *)a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUICounterViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v15, sel_applyUpdatesWithElement_, v4);
  v5 = (SUUICounterViewElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    -[SUUICounterViewElement changeRatePerSecond](v4, "changeRatePerSecond");
    self->_changeRatePerSecond = v7;
    self->_counterType = -[SUUICounterViewElement counterType](v4, "counterType");
    self->_dateFormatType = -[SUUICounterViewElement dateFormatType](v4, "dateFormatType");
    -[SUUICounterViewElement endDate](v4, "endDate");
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    endDate = self->_endDate;
    self->_endDate = v8;

    -[SUUICounterViewElement numberFormat](v4, "numberFormat");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    numberFormat = self->_numberFormat;
    self->_numberFormat = v10;

    self->_startValue = -[SUUICounterViewElement startValue](v4, "startValue");
    -[SUUICounterViewElement startValueDate](v4, "startValueDate");
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
    startValueDate = self->_startValueDate;
    self->_startValueDate = v12;

    self->_stopValue = -[SUUICounterViewElement stopValue](v4, "stopValue");
  }

  return v6;
}

- (double)changeRatePerSecond
{
  return self->_changeRatePerSecond;
}

- (int64_t)counterType
{
  return self->_counterType;
}

- (int64_t)dateFormatType
{
  return self->_dateFormatType;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)numberFormat
{
  return self->_numberFormat;
}

- (int64_t)startValue
{
  return self->_startValue;
}

- (NSDate)startValueDate
{
  return self->_startValueDate;
}

- (int64_t)stopValue
{
  return self->_stopValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startValueDate, 0);
  objc_storeStrong((id *)&self->_numberFormat, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
}

@end

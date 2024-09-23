@implementation DSThermalLogLine

- (DSThermalLogLine)initWithLogLine:(id)a3
{
  DSThermalLogLine *v3;
  DSThermalLogLine *v4;
  uint64_t v5;
  NSString *eventType;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  float v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DSThermalLogLine;
  v3 = -[DSLogLine initWithLogLine:](&v13, sel_initWithLogLine_, a3);
  v4 = v3;
  if (v3)
  {
    -[DSLogLine type](v3, "type");
    v5 = objc_claimAutoreleasedReturnValue();
    eventType = v4->_eventType;
    v4->_eventType = (NSString *)v5;

    -[DSLogLine setType:](v4, "setType:", CFSTR("Thermal"));
    -[DSLogLine fields](v4, "fields");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") - 1;

    if (-[DSThermalLogLine isTrapEvent](v4, "isTrapEvent"))
    {
      -[DSLogLine fields](v4, "fields");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10 >= 4)
        v4->_reason = (NSString *)-[DSLogLine stringFromFieldAtIndex:](v4, "stringFromFieldAtIndex:", 2);
    }
    v11 = (double)-[DSLogLine integerFromFieldAtIndex:](v4, "integerFromFieldAtIndex:", v8) / 100.0;
    v4->_maxTemp = v11;
  }
  return v4;
}

- (BOOL)isTrapEvent
{
  void *v3;
  char v4;
  void *v5;

  -[DSThermalLogLine eventType](self, "eventType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ThermalUIAlertEnter")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[DSThermalLogLine eventType](self, "eventType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("ThermalUIAlertExit"));

  }
  return v4;
}

- (BOOL)isTrapEntry
{
  void *v2;
  char v3;

  -[DSThermalLogLine eventType](self, "eventType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("ThermalUIAlertEnter"));

  return v3;
}

- (float)maxTemp
{
  return self->_maxTemp;
}

- (void)setMaxTemp:(float)a3
{
  self->_maxTemp = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (void)setEventType:(id)a3
{
  objc_storeStrong((id *)&self->_eventType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventType, 0);
}

@end

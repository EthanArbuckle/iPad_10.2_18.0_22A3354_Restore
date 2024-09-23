@implementation DADeviceStateRecord

- (DADeviceStateRecord)initWithState:(int64_t)a3 andTime:(id)a4
{
  id v7;
  DADeviceStateRecord *v8;
  DADeviceStateRecord *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DADeviceStateRecord;
  v8 = -[DADeviceStateRecord init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_state = a3;
    objc_storeStrong((id *)&v8->_time, a4);
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_state;
}

- (BOOL)isEqual:(id)a3
{
  DADeviceStateRecord *v4;
  int64_t state;
  BOOL v6;

  v4 = (DADeviceStateRecord *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else if (-[DADeviceStateRecord isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    state = self->_state;
    v6 = state == -[DADeviceStateRecord state](v4, "state");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)discoveryTimeIntervelBetweenState:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DADeviceAccessAnalytics.m"), 60, CFSTR("Other object to compare is nil"));

  }
  -[DADeviceStateRecord discoveryTime](self, "discoveryTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;
  objc_msgSend(v5, "discoveryTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = vabdd_f64(v8, v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)timeIntervelBetweenState:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DADeviceAccessAnalytics.m"), 68, CFSTR("Other object to compare is nil"));

  }
  -[DADeviceStateRecord time](self, "time");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;
  objc_msgSend(v5, "time");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = vabdd_f64(v8, v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)stateTransitionAsString:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DADeviceAccessAnalytics.m"), 76, CFSTR("Other state object is nil"));

  }
  v6 = (void *)MEMORY[0x24BDD17C8];
  DADeviceStateToString(-[DADeviceStateRecord state](self, "state"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  DADeviceStateToString(objc_msgSend(v5, "state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@->%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSNumber)discoveryTime
{
  return self->_discoveryTime;
}

- (void)setDiscoveryTime:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryTime, a3);
}

- (NSNumber)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_discoveryTime, 0);
}

@end

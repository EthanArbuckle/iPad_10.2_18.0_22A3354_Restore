@implementation LKOperation

- (LKOperation)init
{
  LKOperation *v2;
  LKOperation *v3;
  NSDate *startTime;
  NSDate *endTime;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LKOperation;
  v2 = -[LKOperation init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    startTime = v2->_startTime;
    v2->_startTime = 0;

    endTime = v3->_endTime;
    v3->_endTime = 0;

    v3->_duration = 0.0;
  }
  return v3;
}

- (void)setStartTime:(id)a3
{
  NSDate *v5;
  NSDate **p_startTime;
  NSDate *startTime;
  NSDate *v8;

  v5 = (NSDate *)a3;
  startTime = self->_startTime;
  p_startTime = &self->_startTime;
  if (startTime != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_startTime, a3);
    v5 = v8;
  }

}

- (void)setEndTime:(id)a3
{
  NSDate *v5;
  NSDate **p_endTime;
  NSDate *endTime;
  NSDate *v8;

  v5 = (NSDate *)a3;
  endTime = self->_endTime;
  p_endTime = &self->_endTime;
  if (endTime != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_endTime, a3);
    v5 = v8;
  }

}

- (void)setDuration:(double)a3
{
  if (self->_duration != a3)
    self->_duration = a3;
}

- (id)dictionary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_opt_new();
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSS"));
  -[LKOperation startTime](self, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("startTime"));
  }
  else
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("startTime"));

  }
  -[LKOperation endTime](self, "endTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("endTime"));
  }
  else
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("endTime"));

  }
  v11 = (void *)MEMORY[0x24BDD16E0];
  -[LKOperation duration](self, "duration");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1518], "notANumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToNumber:", v13);

  if ((v14 & 1) != 0)
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("duration"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("duration"));
  }
  v16 = (void *)objc_msgSend(v3, "copy");

  return v16;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end

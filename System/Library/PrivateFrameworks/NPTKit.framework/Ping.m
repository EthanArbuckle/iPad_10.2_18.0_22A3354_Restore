@implementation Ping

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Ping)init
{
  Ping *v2;
  Ping *v3;
  id v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)Ping;
  v2 = -[Ping init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[Ping setWasSuccessful:](v2, "setWasSuccessful:", 0);
    v4 = objc_alloc_init(MEMORY[0x24BDBCE60]);
    -[Ping setStartTime:](v3, "setStartTime:", v4);

    v5 = objc_alloc_init(MEMORY[0x24BDBCE60]);
    -[Ping setEndTime:](v3, "setEndTime:", v5);

  }
  return v3;
}

- (double)latency
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (!-[Ping wasSuccessful](self, "wasSuccessful"))
    return 0.0;
  -[Ping endTime](self, "endTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[Ping startTime](self, "startTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (NSDictionary)dictionary
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSxxx"));
  -[Ping startTime](self, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[Ping endTime](self, "endTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("start_time"));
  objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("end_time"));
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[Ping latency](self, "latency");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v10, CFSTR("latency"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[Ping wasSuccessful](self, "wasSuccessful"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v11, CFSTR("was_successful"));

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[Ping wasSuccessful](self, "wasSuccessful"), CFSTR("wasSuccessful"));
  -[Ping startTime](self, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("startTime"));

  -[Ping endTime](self, "endTime");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("endTime"));

}

- (Ping)initWithCoder:(id)a3
{
  id v3;
  Ping *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)Ping;
  v3 = a3;
  v4 = -[Ping init](&v8, sel_init);
  -[Ping setWasSuccessful:](v4, "setWasSuccessful:", objc_msgSend(v3, "decodeBoolForKey:", CFSTR("wasSuccessful"), v8.receiver, v8.super_class));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[Ping setStartTime:](v4, "setStartTime:", v5);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[Ping setEndTime:](v4, "setEndTime:", v6);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  Ping *v4;
  void *v5;
  void *v6;

  v4 = -[Ping init](+[Ping allocWithZone:](Ping, "allocWithZone:", a3), "init");
  -[Ping startTime](self, "startTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[Ping setStartTime:](v4, "setStartTime:", v5);

  -[Ping endTime](self, "endTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[Ping setEndTime:](v4, "setEndTime:", v6);

  -[Ping setWasSuccessful:](v4, "setWasSuccessful:", -[Ping wasSuccessful](self, "wasSuccessful"));
  return v4;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_storeStrong((id *)&self->_endTime, a3);
}

- (BOOL)wasSuccessful
{
  return self->_wasSuccessful;
}

- (void)setWasSuccessful:(BOOL)a3
{
  self->_wasSuccessful = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end

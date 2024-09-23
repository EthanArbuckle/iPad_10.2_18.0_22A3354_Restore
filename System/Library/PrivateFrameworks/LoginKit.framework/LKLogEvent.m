@implementation LKLogEvent

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_opt_new();
  -[LKLogEvent process](self, "process");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setProcess:", v6);

  -[LKLogEvent date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setDate:", v8);

  -[LKLogEvent senderImagePath](self, "senderImagePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setSenderImagePath:", v10);

  objc_msgSend(v4, "setActivityIdentifier:", -[LKLogEvent activityIdentifier](self, "activityIdentifier"));
  -[LKLogEvent composedMessage](self, "composedMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setComposedMessage:", v12);

  return v4;
}

- (void)setProcess:(id)a3
{
  NSString *v5;
  NSString **p_process;
  NSString *process;
  NSString *v8;

  v5 = (NSString *)a3;
  process = self->_process;
  p_process = &self->_process;
  if (process != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_process, a3);
    v5 = v8;
  }

}

- (void)setDate:(id)a3
{
  NSDate *v5;
  NSDate **p_date;
  NSDate *date;
  NSDate *v8;

  v5 = (NSDate *)a3;
  date = self->_date;
  p_date = &self->_date;
  if (date != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_date, a3);
    v5 = v8;
  }

}

- (void)setComposedMessage:(id)a3
{
  NSString *v5;
  NSString **p_composedMessage;
  NSString *composedMessage;
  NSString *v8;

  v5 = (NSString *)a3;
  composedMessage = self->_composedMessage;
  p_composedMessage = &self->_composedMessage;
  if (composedMessage != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_composedMessage, a3);
    v5 = v8;
  }

}

- (void)setSenderImagePath:(id)a3
{
  NSString *v5;
  NSString **p_senderImagePath;
  NSString *senderImagePath;
  NSString *v8;

  v5 = (NSString *)a3;
  senderImagePath = self->_senderImagePath;
  p_senderImagePath = &self->_senderImagePath;
  if (senderImagePath != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_senderImagePath, a3);
    v5 = v8;
  }

}

- (void)setActivityIdentifier:(unint64_t)a3
{
  if (self->_activityIdentifier != a3)
    self->_activityIdentifier = a3;
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
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_opt_new();
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSS"));
  -[LKLogEvent process](self, "process");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("process"));
  }
  else
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("process"));

  }
  -[LKLogEvent date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("date"));
  }
  else
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("date"));

  }
  -[LKLogEvent composedMessage](self, "composedMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("composedMessage"));
  }
  else
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("composedMessage"));

  }
  -[LKLogEvent senderImagePath](self, "senderImagePath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("sender"));
  }
  else
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("sender"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[LKLogEvent activityIdentifier](self, "activityIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("activityIdentifier"));
  }
  else
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("activityIdentifier"));

  }
  v16 = (void *)objc_msgSend(v3, "copy");

  return v16;
}

- (BOOL)loggedByProcess:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[LKLogEvent process](self, "process");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (BOOL)loggedByFramework:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[LKLogEvent senderImagePath](self, "senderImagePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (BOOL)containsMessage:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[LKLogEvent composedMessage](self, "composedMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsString:", v4);

  return v6;
}

- (NSString)process
{
  return self->_process;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)senderImagePath
{
  return self->_senderImagePath;
}

- (NSString)composedMessage
{
  return self->_composedMessage;
}

- (unint64_t)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composedMessage, 0);
  objc_storeStrong((id *)&self->_senderImagePath, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

@end

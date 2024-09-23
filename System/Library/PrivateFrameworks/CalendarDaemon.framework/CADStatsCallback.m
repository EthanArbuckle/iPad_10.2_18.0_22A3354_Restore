@implementation CADStatsCallback

- (CADStatsCallback)initWithEventName:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  CADStatsCallback *v8;
  uint64_t v9;
  NSString *eventName;
  uint64_t v11;
  id callback;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CADStatsCallback;
  v8 = -[CADStatsCallback init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(CFSTR("cadstats."), "stringByAppendingString:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    eventName = v8->_eventName;
    v8->_eventName = (NSString *)v9;

    v11 = MEMORY[0x1BCC9D8DC](v7);
    callback = v8->_callback;
    v8->_callback = (id)v11;

  }
  return v8;
}

- (id)eventName
{
  return self->_eventName;
}

- (id)eventDictionaries
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  (*((void (**)(void))self->_callback + 2))();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end

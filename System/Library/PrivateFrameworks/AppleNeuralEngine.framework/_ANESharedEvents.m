@implementation _ANESharedEvents

+ (_ANESharedEvents)new
{
  return 0;
}

- (_ANESharedEvents)init
{

  return 0;
}

- (_ANESharedEvents)initWithSignalEvents:(id)a3 waitEvents:(id)a4
{
  id v7;
  id v8;
  _ANESharedEvents *v9;
  _ANESharedEvents *v10;
  id *p_isa;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "count") || objc_msgSend(v8, "count"))
    && (unint64_t)objc_msgSend(v7, "count") <= 0x40
    && (unint64_t)objc_msgSend(v8, "count") <= 0x40)
  {
    v13.receiver = self;
    v13.super_class = (Class)_ANESharedEvents;
    v10 = -[_ANESharedEvents init](&v13, sel_init);
    p_isa = (id *)&v10->super.isa;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_signalEvents, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (_ANESharedEvents)sharedEventsWithSignalEvents:(id)a3 waitEvents:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSignalEvents:waitEvents:", v7, v6);

  return (_ANESharedEvents *)v8;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANESharedEvents signalEvents](self, "signalEvents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ANESharedEvents waitEvents](self, "waitEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { signalEvents=%@ : waitEvents=%@ } "), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)signalEvents
{
  return self->_signalEvents;
}

- (void)setSignalEvents:(id)a3
{
  objc_storeStrong((id *)&self->_signalEvents, a3);
}

- (NSArray)waitEvents
{
  return self->_waitEvents;
}

- (void)setWaitEvents:(id)a3
{
  objc_storeStrong((id *)&self->_waitEvents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitEvents, 0);
  objc_storeStrong((id *)&self->_signalEvents, 0);
}

@end

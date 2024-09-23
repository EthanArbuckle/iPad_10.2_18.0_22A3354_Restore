@implementation HFTimerTriggerTimeEventAdapter

+ (id)adapterWithEventBuilder:(id)a3
{
  id v3;
  __objc2_class *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = HFTimerTriggerSignificantTimeEventAdapter;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSLog(CFSTR("Unexpected eventBuilder %@"), v3);
      v5 = 0;
      goto LABEL_7;
    }
    v4 = HFTimerTriggerCalendarEventAdapter;
  }
  v5 = (void *)objc_msgSend([v4 alloc], "initWithEventBuilder:", v3);
LABEL_7:

  return v5;
}

- (HFTimerTriggerTimeEventAdapter)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithEventBuilder_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTimerTriggerTimeEventAdapter.m"), 31, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFTimerTriggerTimeEventAdapter init]",
    v5);

  return 0;
}

- (HFTimerTriggerTimeEventAdapter)initWithEventBuilder:(id)a3
{
  id v5;
  HFTimerTriggerTimeEventAdapter *v6;
  HFTimerTriggerTimeEventAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFTimerTriggerTimeEventAdapter;
  v6 = -[HFTimerTriggerTimeEventAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_eventBuilder, a3);

  return v7;
}

- (id)createTriggerWithName:(id)a3 timeZone:(id)a4 recurrences:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTimerTriggerTimeEventAdapter.m"), 44, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFTimerTriggerTimeEventAdapter createTriggerWithName:timeZone:recurrences:]", objc_opt_class());

  v8 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "na_genericError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "futureWithError:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)updateTriggerBuilder:(id)a3 recurrences:(id)a4 inHome:(id)a5
{
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTimerTriggerTimeEventAdapter.m"), 50, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFTimerTriggerTimeEventAdapter updateTriggerBuilder:recurrences:inHome:]", objc_opt_class());

}

- (id)updateTrigger:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTimerTriggerTimeEventAdapter.m"), 55, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFTimerTriggerTimeEventAdapter updateTrigger:]", objc_opt_class());

  v6 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "na_genericError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "futureWithError:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HFTimeEventBuilder)eventBuilder
{
  return self->_eventBuilder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBuilder, 0);
}

@end

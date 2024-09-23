@implementation CALNXPCActivityScheduler

- (CALNXPCActivityScheduler)initWithActivityIdentifier:(id)a3 otherCriteria:(id)a4
{
  id v7;
  id v8;
  CALNXPCActivityScheduler *v9;
  CALNXPCActivityScheduler *v10;
  OS_xpc_object *v11;
  OS_xpc_object *otherCriteria;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CALNXPCActivityScheduler;
  v9 = -[CALNXPCActivityScheduler init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activityIdentifier, a3);
    v11 = (OS_xpc_object *)xpc_copy(v8);
    otherCriteria = v10->_otherCriteria;
    v10->_otherCriteria = v11;

  }
  return v10;
}

- (void)unschedule
{
  xpc_activity_unregister(-[NSString UTF8String](self->_activityIdentifier, "UTF8String"));
}

- (void)scheduleWithTimeInterval:(int64_t)a3 gracePeriod:(int64_t)a4
{
  NSString *v7;
  xpc_object_t v8;
  NSString *v9;
  const char *v10;
  NSString *v11;
  _QWORD handler[4];
  NSString *v13;
  id v14;
  id location;

  v7 = self->_activityIdentifier;
  objc_initWeak(&location, self);
  v8 = xpc_copy(self->_otherCriteria);
  xpc_dictionary_set_int64(v8, (const char *)*MEMORY[0x24BDAC5B8], a3);
  xpc_dictionary_set_int64(v8, (const char *)*MEMORY[0x24BDAC5D8], a4);
  v9 = objc_retainAutorelease(v7);
  v10 = -[NSString UTF8String](v9, "UTF8String");
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __65__CALNXPCActivityScheduler_scheduleWithTimeInterval_gracePeriod___block_invoke;
  handler[3] = &unk_24D4846A0;
  objc_copyWeak(&v14, &location);
  v11 = v9;
  v13 = v11;
  xpc_activity_register(v10, v8, handler);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __65__CALNXPCActivityScheduler_scheduleWithTimeInterval_gracePeriod___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v3, "activityRun");
  else
    xpc_activity_unregister((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));

}

- (CALNActivitySchedulerDelegate)delegate
{
  return (CALNActivitySchedulerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_otherCriteria, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
}

@end

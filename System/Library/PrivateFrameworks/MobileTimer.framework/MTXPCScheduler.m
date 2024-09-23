@implementation MTXPCScheduler

+ (MTXPCScheduler)xpcSchedulerWithEvent:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEvent:", v4);

  return (MTXPCScheduler *)v5;
}

- (MTXPCScheduler)initWithEvent:(id)a3
{
  id v4;
  MTXPCScheduler *v5;
  uint64_t v6;
  NSString *eventName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTXPCScheduler;
  v5 = -[MTXPCScheduler init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v6;

  }
  return v5;
}

- (void)scheduleTimerForSeconds:(double)a3
{
  time_t v5;
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  v5 = time(0);
  xpc_dictionary_set_date(xdict, "Date", 1000000000 * (unint64_t)(ceil(a3) + (double)v5));
  if (MTIsHorseman())
    xpc_dictionary_set_BOOL(xdict, "UserVisible", 1);
  -[NSString UTF8String](self->_eventName, "UTF8String");
  xpc_set_event();

}

- (void)unscheduleTimer
{
  -[NSString UTF8String](self->_eventName, "UTF8String");
  xpc_set_event();
}

- (void)scheduleActivityWithCriteria:(id)a3 activityHandler:(id)a4
{
  -[MTXPCScheduler scheduleActivityWithCriteria:activityHandler:performImmediately:](self, "scheduleActivityWithCriteria:activityHandler:performImmediately:", a3, a4, 0);
}

- (void)scheduleActivityWithCriteria:(id)a3 activityHandler:(id)a4 performImmediately:(BOOL)a5
{
  _BOOL4 v5;
  NSString *eventName;
  id v9;
  xpc_activity_handler_t handler;

  v5 = a5;
  handler = a4;
  eventName = self->_eventName;
  v9 = a3;
  xpc_activity_register(-[NSString UTF8String](eventName, "UTF8String"), v9, handler);

  if (v5)
    (*((void (**)(xpc_activity_handler_t, _QWORD))handler + 2))(handler, 0);

}

- (void)unscheduleActivity
{
  xpc_activity_unregister(-[NSString UTF8String](self->_eventName, "UTF8String"));
}

- (NSString)eventName
{
  return self->_eventName;
}

- (void)setEventName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end

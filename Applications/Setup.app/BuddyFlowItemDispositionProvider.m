@implementation BuddyFlowItemDispositionProvider

- (BuddyFlowItemDispositionProvider)initWithSetupMethod:(id)a3 runState:(id)a4
{
  id v5;
  BuddyFlowItemDispositionProvider *v6;
  objc_super v8;
  id obj;
  id location[2];
  id v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = 0;
  objc_storeStrong(&obj, a4);
  v5 = v11;
  v11 = 0;
  v8.receiver = v5;
  v8.super_class = (Class)BuddyFlowItemDispositionProvider;
  v11 = -[BuddyFlowItemDispositionProvider init](&v8, "init");
  objc_storeStrong(&v11, v11);
  if (v11)
  {
    objc_storeStrong((id *)v11 + 2, location[0]);
    objc_storeStrong((id *)v11 + 3, obj);
  }
  v6 = (BuddyFlowItemDispositionProvider *)v11;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v11, 0);
  return v6;
}

- (void)setPreferredDispositions:(unint64_t)a3
{
  id v3;
  os_log_type_t v4;
  os_log_t oslog;
  unint64_t v6;
  SEL v7;
  BuddyFlowItemDispositionProvider *v8;
  uint8_t buf[24];

  v8 = self;
  v7 = a2;
  v6 = a3;
  oslog = (os_log_t)(id)_BYLoggingFacility(self);
  v4 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (id)BYStringForFlowItemDispositions(v6);
    sub_100038C28((uint64_t)buf, (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "Preferred dispositions changing to %@", buf, 0xCu);

    objc_storeStrong(&v3, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  v8->_preferredDispositions = v6;
}

- (unint64_t)dispositions
{
  BYRunState *v2;
  unsigned __int8 v3;
  BuddySetupMethod *v4;
  id v5;
  id v6;
  NSString *v8;
  unint64_t v10;

  v2 = -[BuddyFlowItemDispositionProvider runState](self, "runState");
  v3 = -[BYRunState hasCompletedInitialRun](v2, "hasCompletedInitialRun");

  if ((v3 & 1) != 0)
    return 0;
  v4 = -[BuddyFlowItemDispositionProvider setupMethod](self, "setupMethod");
  v5 = -[BuddySetupMethod intent](v4, "intent");

  if (!v5)
    return 2;
  if (v5 == (id)1)
    return 4;
  if (v5 == (id)2)
  {
    if ((-[BuddyFlowItemDispositionProvider preferredDispositions](self, "preferredDispositions") & 8) == 8)
    {
      return 8;
    }
    else
    {
      if ((-[BuddyFlowItemDispositionProvider preferredDispositions](self, "preferredDispositions") & 0x10) != 0x10)
      {
        v6 = (id)BYStringForFlowItemDispositions(-[BuddyFlowItemDispositionProvider preferredDispositions](self, "preferredDispositions"));
        v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid dispositions (%@) for setup intent"), v6);

        objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", v8, 0, 0));
      }
      return 16;
    }
  }
  return v10;
}

- (unint64_t)preferredDispositions
{
  return self->_preferredDispositions;
}

- (BuddySetupMethod)setupMethod
{
  return self->_setupMethod;
}

- (void)setSetupMethod:(id)a3
{
  objc_storeStrong((id *)&self->_setupMethod, a3);
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
  objc_storeStrong((id *)&self->_runState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runState, 0);
  objc_storeStrong((id *)&self->_setupMethod, 0);
}

@end

@implementation GCLogicalDeviceAnalytics

- (GCLogicalDeviceAnalytics)initWithAnonymousIdentifier:(id)a3 bundleIdentifier:(id)a4 productCategory:(id)a5
{
  id v9;
  id v10;
  id v11;
  GCLogicalDeviceAnalytics *v12;
  uint64_t v13;
  NSMutableArray *sessionIntervals;
  NSString **p_productCategory;
  NSObject **p_controllerID;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)GCLogicalDeviceAnalytics;
  v12 = -[GCLogicalDeviceAnalytics init](&v18, sel_init);
  if (v12)
  {
    +[NSMutableArray array](&off_254DEBB20, "array");
    v13 = objc_claimAutoreleasedReturnValue();
    sessionIntervals = v12->_sessionIntervals;
    v12->_sessionIntervals = (NSMutableArray *)v13;

    objc_storeStrong((id *)&v12->_bundleID, a4);
    p_productCategory = &v12->_productCategory;
    objc_storeStrong((id *)&v12->_productCategory, a5);
    p_controllerID = &v12->_controllerID;
    objc_storeStrong((id *)&v12->_controllerID, a3);
    if (!v12->_bundleID)
    {
      v12->_bundleID = (NSString *)CFSTR("N/A");

    }
    if (!*p_productCategory)
    {
      *p_productCategory = (NSString *)CFSTR("N/A");

    }
    if (!*p_controllerID)
    {
      *p_controllerID = CFSTR("N/A");

    }
  }

  return v12;
}

- (double)sessionActiveDuration
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_sessionIntervals;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "duration", (_QWORD)v10);
        v6 = v6 + v8;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (double)sessionTotalDuration
{
  id v3;
  NSDate *firstSessionStartTime;
  void *v5;
  void *v6;
  double v7;
  double v8;

  if (!self->_firstSessionStartTime)
    return 0.0;
  v3 = objc_alloc((Class)&off_254DF6CA0);
  firstSessionStartTime = self->_firstSessionStartTime;
  +[NSDate date](&off_254DF6DA0, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", firstSessionStartTime, v5);
  objc_msgSend(v6, "duration");
  v8 = v7;

  return v8;
}

- (void)resumeSession
{
  NSDate *v3;
  NSDate *curSessionStartTime;
  NSObject *v5;
  int v6;
  GCLogicalDeviceAnalytics *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!self->_curSessionStartTime)
  {
    +[NSDate date](&off_254DF6DA0, "date");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    curSessionStartTime = self->_curSessionStartTime;
    self->_curSessionStartTime = v3;

    if (!self->_firstSessionStartTime)
      objc_storeStrong((id *)&self->_firstSessionStartTime, self->_curSessionStartTime);
    if (gc_isInternalBuild())
    {
      getGCAnalyticsLogger();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = 138412290;
        v7 = self;
        _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_INFO, "Resume session - %@", (uint8_t *)&v6, 0xCu);
      }

    }
  }
}

- (void)pauseSession
{
  NSMutableArray *sessionIntervals;
  id v4;
  NSDate *curSessionStartTime;
  void *v6;
  void *v7;
  NSDate *v8;
  NSObject *v9;
  int v10;
  GCLogicalDeviceAnalytics *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_curSessionStartTime)
  {
    sessionIntervals = self->_sessionIntervals;
    v4 = objc_alloc((Class)&off_254DF6CA0);
    curSessionStartTime = self->_curSessionStartTime;
    +[NSDate date](&off_254DF6DA0, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithStartDate:endDate:", curSessionStartTime, v6);
    -[NSMutableArray addObject:](sessionIntervals, "addObject:", v7);

    v8 = self->_curSessionStartTime;
    self->_curSessionStartTime = 0;

    if (gc_isInternalBuild())
    {
      getGCAnalyticsLogger();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = self;
        _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_INFO, "Pause session - %@", (uint8_t *)&v10, 0xCu);
      }

    }
  }
}

- (void)flushSessionAndSendCAEvent
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_215181000, a2, OS_LOG_TYPE_ERROR, "%@ - ERROR! Attempting to flush a session that has already been flushed. Create a new devie analytics instance instead.", (uint8_t *)&v2, 0xCu);
}

id __54__GCLogicalDeviceAnalytics_flushSessionAndSendCAEvent__block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  __int128 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v12 = *(_OWORD *)(v2 + 40);
  v11[0] = CFSTR("bundleID");
  v11[1] = CFSTR("productCategory");
  v13 = *(_QWORD *)(v2 + 32);
  v11[2] = CFSTR("controllerID");
  v11[3] = CFSTR("sessionTotalDuration");
  objc_msgSend((id)v2, "sessionTotalDuration");
  LODWORD(v4) = llround(v3);
  +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  v11[4] = CFSTR("sessionActionDuration");
  objc_msgSend(*(id *)(a1 + 32), "sessionActiveDuration");
  LODWORD(v7) = llround(v6);
  +[NSNumber numberWithInt:](&off_254DED908, "numberWithInt:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", &v12, v11, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = objc_opt_class();
  -[GCLogicalDeviceAnalytics controllerID](self, "controllerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCLogicalDeviceAnalytics productCategory](self, "productCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCLogicalDeviceAnalytics bundleID](self, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCLogicalDeviceAnalytics sessionTotalDuration](self, "sessionTotalDuration");
  v8 = v7;
  -[GCLogicalDeviceAnalytics sessionActiveDuration](self, "sessionActiveDuration");
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ for %@ (%@) - %@, total = %f, active = %f>"), v3, v4, v5, v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSObject)controllerID
{
  return self->_controllerID;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)productCategory
{
  return self->_productCategory;
}

- (NSMutableArray)sessionIntervals
{
  return self->_sessionIntervals;
}

- (void)setSessionIntervals:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIntervals, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIntervals, 0);
  objc_storeStrong((id *)&self->_productCategory, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_controllerID, 0);
  objc_storeStrong((id *)&self->_firstSessionStartTime, 0);
  objc_storeStrong((id *)&self->_curSessionStartTime, 0);
}

@end

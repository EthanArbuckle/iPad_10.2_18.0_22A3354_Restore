@implementation ATXInterruptingNotificationsHelper

- (ATXInterruptingNotificationsHelper)init
{
  ATXInterruptingNotificationsHelper *v2;
  uint64_t v3;
  NSMutableDictionary *recentNotifications;
  uint64_t v5;
  NSMutableArray *potentialInterruptingAppLaunchEvents;
  uint64_t v7;
  NSMutableArray *interruptingAppSessions;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ATXInterruptingNotificationsHelper;
  v2 = -[ATXInterruptingNotificationsHelper init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    recentNotifications = v2->_recentNotifications;
    v2->_recentNotifications = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    potentialInterruptingAppLaunchEvents = v2->_potentialInterruptingAppLaunchEvents;
    v2->_potentialInterruptingAppLaunchEvents = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    interruptingAppSessions = v2->_interruptingAppSessions;
    v2->_interruptingAppSessions = (NSMutableArray *)v7;

  }
  return v2;
}

- (void)checkNotificationEvent:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  NSMutableDictionary *recentNotifications;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "bundleID");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(v9, "usageType");

    if (v6 == 17)
    {
      recentNotifications = self->_recentNotifications;
      objc_msgSend(v9, "bundleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](recentNotifications, "setObject:forKeyedSubscript:", v9, v8);

    }
  }

}

- (void)checkAppLaunchStartEvent:(id)a3
{
  id v5;
  BMAppInFocus **p_curenStartEvent;
  id v7;

  v5 = a3;
  v7 = v5;
  if (self->_previousStartEvent)
  {
    if (-[ATXInterruptingNotificationsHelper doesCurrentAppLaunchInterruptPreviousAppLaunch:](self, "doesCurrentAppLaunchInterruptPreviousAppLaunch:", v5))
    {
      -[NSMutableArray addObject:](self->_potentialInterruptingAppLaunchEvents, "addObject:", v7);
      p_curenStartEvent = &self->_curenStartEvent;
    }
    else
    {
      if (-[ATXInterruptingNotificationsHelper checkIfStartEventWasTheInterruptedEvent:](self, "checkIfStartEventWasTheInterruptedEvent:", v7))
      {
        -[ATXInterruptingNotificationsHelper recordInterruptingAppSession](self, "recordInterruptingAppSession");
LABEL_9:
        -[NSMutableDictionary removeAllObjects](self->_recentNotifications, "removeAllObjects");
        goto LABEL_10;
      }
      p_curenStartEvent = &self->_previousStartEvent;
    }
    objc_storeStrong((id *)p_curenStartEvent, a3);
    goto LABEL_9;
  }
  objc_storeStrong((id *)&self->_curenStartEvent, a3);
  objc_storeStrong((id *)&self->_previousStartEvent, a3);
LABEL_10:

}

- (void)checkAppLaunchEndEvent:(id)a3
{
  id v5;
  void *v6;
  BMAppInFocus *curenStartEvent;
  void *v8;
  void *v9;
  int v10;
  void *curenEndEvent;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  BMAppInFocus *potentialInterruptedEndEvent;
  BMAppInFocus *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  ATXInterruptingAppSessionEvent *v32;
  ATXInterruptingAppSessionEvent *interruptingAppSessionEvent;
  BMAppInFocus *v34;
  BMAppInFocus *previousEndEvent;
  uint64_t v36;

  v5 = a3;
  v6 = v5;
  if (!self->_previousEndEvent)
  {
    v21 = (BMAppInFocus *)v5;
    curenEndEvent = self->_curenEndEvent;
    self->_curenEndEvent = v21;
LABEL_10:

    goto LABEL_11;
  }
  curenStartEvent = self->_curenStartEvent;
  if (curenStartEvent)
  {
    -[BMAppInFocus bundleID](curenStartEvent, "bundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      objc_storeStrong((id *)&self->_curenEndEvent, a3);
      -[NSMutableArray lastObject](self->_potentialInterruptingAppLaunchEvents, "lastObject");
      curenEndEvent = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(curenEndEvent, "bundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bundleID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if (v14)
      {
        v15 = objc_alloc(MEMORY[0x1E0CB3588]);
        -[BMAppInFocus absoluteTimestamp](self->_curenStartEvent, "absoluteTimestamp");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMAppInFocus absoluteTimestamp](self->_curenEndEvent, "absoluteTimestamp");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v15, "initWithStartDate:endDate:", v16, v17);

        objc_msgSend(v18, "duration");
        if (v19 <= 60.0)
        {
          objc_msgSend(curenEndEvent, "bundleID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[ATXSessionTaggingAppEntity genreIdForBundleId:](ATXSessionTaggingAppEntity, "genreIdForBundleId:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v23, "unsignedIntegerValue");

          -[BMAppInFocus bundleID](self->_previousEndEvent, "bundleID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[ATXSessionTaggingAppEntity genreIdForBundleId:](ATXSessionTaggingAppEntity, "genreIdForBundleId:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "unsignedIntegerValue");

          v27 = objc_alloc(MEMORY[0x1E0CF8EE8]);
          objc_msgSend(curenEndEvent, "bundleID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[BMAppInFocus bundleID](self->_previousEndEvent, "bundleID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[BMAppInFocus absoluteTimestamp](self->_curenStartEvent, "absoluteTimestamp");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[BMAppInFocus absoluteTimestamp](self->_curenEndEvent, "absoluteTimestamp");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (ATXInterruptingAppSessionEvent *)objc_msgSend(v27, "initWithInterruptingBundleID:interruptedBundleID:eventStartTime:eventEndTime:interruptingCategory:interruptedCategory:", v28, v29, v30, v31, v36, v26);
          interruptingAppSessionEvent = self->_interruptingAppSessionEvent;
          self->_interruptingAppSessionEvent = v32;

          v34 = self->_previousEndEvent;
          potentialInterruptedEndEvent = self->_potentialInterruptedEndEvent;
          self->_potentialInterruptedEndEvent = v34;
        }
        else
        {
          potentialInterruptedEndEvent = self->_interruptingAppSessionEvent;
          self->_interruptingAppSessionEvent = 0;
        }

      }
      goto LABEL_10;
    }
  }
LABEL_11:
  previousEndEvent = self->_previousEndEvent;
  self->_previousEndEvent = (BMAppInFocus *)v6;

}

- (BOOL)doesCurrentAppLaunchInterruptPreviousAppLaunch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSMutableDictionary *recentNotifications;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  double v14;

  v4 = a3;
  -[BMAppInFocus bundleID](self->_previousStartEvent, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  recentNotifications = self->_recentNotifications;
  objc_msgSend(v4, "bundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](recentNotifications, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if ((v7 & 1) == 0 && v10)
  {
    objc_msgSend(v4, "absoluteTimestamp");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteTimestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v13);
    v11 = v14 <= 30.0;

  }
  return v11;
}

- (id)interruptingAppsessions
{
  return self->_interruptingAppSessions;
}

- (BOOL)checkIfStartEventWasTheInterruptedEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  BOOL v11;

  v4 = a3;
  -[BMAppInFocus bundleID](self->_potentialInterruptedEndEvent, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(v4, "absoluteTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMAppInFocus absoluteTimestamp](self->_curenEndEvent, "absoluteTimestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v11 = v10 <= 10.0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)recordInterruptingAppSession
{
  if (self->_interruptingAppSessionEvent)
    -[NSMutableArray addObject:](self->_interruptingAppSessions, "addObject:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptingAppSessions, 0);
  objc_storeStrong((id *)&self->_potentialInterruptingAppLaunchEvents, 0);
  objc_storeStrong((id *)&self->_recentNotifications, 0);
  objc_storeStrong((id *)&self->_interruptingAppSessionEvent, 0);
  objc_storeStrong((id *)&self->_potentialInterruptedEndEvent, 0);
  objc_storeStrong((id *)&self->_previousEndEvent, 0);
  objc_storeStrong((id *)&self->_previousStartEvent, 0);
  objc_storeStrong((id *)&self->_curenEndEvent, 0);
  objc_storeStrong((id *)&self->_curenStartEvent, 0);
}

@end

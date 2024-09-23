@implementation DAHIDEventMonitor

- (DAHIDEventMonitor)init
{
  DAHIDEventMonitor *v2;
  uint64_t v3;
  NSMutableArray *HIDEvents;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  objc_super v22;
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];

  v22.receiver = self;
  v22.super_class = (Class)DAHIDEventMonitor;
  v2 = -[DAHIDEventMonitor init](&v22, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 8));
    HIDEvents = v2->_HIDEvents;
    v2->_HIDEvents = (NSMutableArray *)v3;

    v37[0] = CFSTR("usagePage");
    v37[1] = CFSTR("usage");
    v38[0] = &off_1000043C8;
    v38[1] = &off_1000043E0;
    v37[2] = CFSTR("needServiceClient");
    v38[2] = &__kCFBooleanTrue;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 3));
    v6 = objc_msgSend(v5, "mutableCopy");
    -[NSMutableArray setObject:atIndexedSubscript:](v2->_HIDEvents, "setObject:atIndexedSubscript:", v6, 0);

    v35[0] = CFSTR("usagePage");
    v35[1] = CFSTR("usage");
    v36[0] = &off_1000043C8;
    v36[1] = &off_1000043F8;
    v35[2] = CFSTR("needServiceClient");
    v36[2] = &__kCFBooleanTrue;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 3));
    v8 = objc_msgSend(v7, "mutableCopy");
    -[NSMutableArray setObject:atIndexedSubscript:](v2->_HIDEvents, "setObject:atIndexedSubscript:", v8, 1);

    v33[0] = CFSTR("usagePage");
    v33[1] = CFSTR("usage");
    v34[0] = &off_100004410;
    v34[1] = &off_100004428;
    v33[2] = CFSTR("needServiceClient");
    v34[2] = &__kCFBooleanFalse;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 3));
    v10 = objc_msgSend(v9, "mutableCopy");
    -[NSMutableArray setObject:atIndexedSubscript:](v2->_HIDEvents, "setObject:atIndexedSubscript:", v10, 2);

    v31[0] = CFSTR("usagePage");
    v31[1] = CFSTR("usage");
    v32[0] = &off_100004440;
    v32[1] = &off_100004458;
    v31[2] = CFSTR("needServiceClient");
    v32[2] = &__kCFBooleanFalse;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 3));
    v12 = objc_msgSend(v11, "mutableCopy");
    -[NSMutableArray setObject:atIndexedSubscript:](v2->_HIDEvents, "setObject:atIndexedSubscript:", v12, 3);

    v29[0] = CFSTR("usagePage");
    v29[1] = CFSTR("usage");
    v30[0] = &off_1000043C8;
    v30[1] = &off_100004470;
    v29[2] = CFSTR("needServiceClient");
    v30[2] = &__kCFBooleanTrue;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 3));
    v14 = objc_msgSend(v13, "mutableCopy");
    -[NSMutableArray setObject:atIndexedSubscript:](v2->_HIDEvents, "setObject:atIndexedSubscript:", v14, 4);

    v27[0] = CFSTR("usagePage");
    v27[1] = CFSTR("usage");
    v28[0] = &off_100004488;
    v28[1] = &off_1000044A0;
    v27[2] = CFSTR("needServiceClient");
    v28[2] = &__kCFBooleanTrue;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 3));
    v16 = objc_msgSend(v15, "mutableCopy");
    -[NSMutableArray setObject:atIndexedSubscript:](v2->_HIDEvents, "setObject:atIndexedSubscript:", v16, 5);

    v25[0] = CFSTR("usagePage");
    v25[1] = CFSTR("usage");
    v26[0] = &off_1000043C8;
    v26[1] = &off_100004428;
    v25[2] = CFSTR("needServiceClient");
    v26[2] = &__kCFBooleanTrue;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 3));
    v18 = objc_msgSend(v17, "mutableCopy");
    -[NSMutableArray setObject:atIndexedSubscript:](v2->_HIDEvents, "setObject:atIndexedSubscript:", v18, 6);

    v23[0] = CFSTR("usagePage");
    v23[1] = CFSTR("usage");
    v24[0] = &off_1000043C8;
    v24[1] = &off_1000044B8;
    v23[2] = CFSTR("needServiceClient");
    v24[2] = &__kCFBooleanFalse;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 3));
    v20 = objc_msgSend(v19, "mutableCopy");
    -[NSMutableArray setObject:atIndexedSubscript:](v2->_HIDEvents, "setObject:atIndexedSubscript:", v20, 7);

    v2->_currentlyMonitoring = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_100008910 != -1)
    dispatch_once(&qword_100008910, &stru_100004248);
  return (id)qword_100008908;
}

- (BOOL)systemClientSetupWithHIDEvents:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  NSObject *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _BYTE v31[128];

  v4 = a3;
  if (-[DAHIDEventMonitor HIDSystemClient](self, "HIDSystemClient"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v7)
    {
      v8 = v7;
      v24 = v4;
      v9 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          v12 = objc_msgSend(v11, "unsignedIntegerValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor HIDEvents](self, "HIDEvents"));
          v14 = objc_msgSend(v13, "count");

          if (v12 >= v14)
          {
            v21 = DiagnosticLogHandleForCategory(3);
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              sub_1000028F0();

            v4 = v24;
            goto LABEL_14;
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor HIDEvents](self, "HIDEvents"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v11, "unsignedIntegerValue")));

          v29[0] = CFSTR("PrimaryUsagePage");
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("usagePage")));
          v29[1] = CFSTR("PrimaryUsage");
          v30[0] = v17;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("usage")));
          v30[1] = v18;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));
          objc_msgSend(v5, "addObject:", v19);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        if (v8)
          continue;
        break;
      }

      IOHIDEventSystemClientSetMatchingMultiple(-[DAHIDEventMonitor HIDSystemClient](self, "HIDSystemClient"), v5);
      v20 = 1;
      v4 = v24;
    }
    else
    {
LABEL_14:

      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)findServiceClientForHIDEvent:(id)a3
{
  id v4;
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex v7;
  __IOHIDServiceClient *ValueAtIndex;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  char v19;

  v4 = a3;
  v5 = IOHIDEventSystemClientCopyServices(-[DAHIDEventMonitor HIDSystemClient](self, "HIDSystemClient"));
  if (v5)
  {
    v6 = v5;
    if (CFArrayGetCount(v5) < 1)
    {
      CFRelease(v6);
    }
    else
    {
      v7 = 0;
      v19 = 0;
      do
      {
        ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v6, v7);
        v9 = (void *)IOHIDServiceClientCopyProperty(ValueAtIndex, CFSTR("PrimaryUsage"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor HIDEvents](self, "HIDEvents"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v4, "unsignedIntegerValue")));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("usage")));
        v13 = objc_msgSend(v12, "unsignedIntegerValue");

        if (v9 && objc_msgSend(v9, "unsignedIntegerValue") == v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", ValueAtIndex));
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("HIDServiceClient"));

          v19 = 1;
        }

        ++v7;
      }
      while (CFArrayGetCount(v6) > v7);
      CFRelease(v6);
      if ((v19 & 1) != 0)
      {
        v15 = 1;
        goto LABEL_14;
      }
    }
  }
  v16 = DiagnosticLogHandleForCategory(3);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_10000291C();

  v15 = 0;
LABEL_14:

  return v15;
}

- (BOOL)serviceClientSetPropertyValue:(void *)a3 forKey:(__CFString *)a4 forHIDEvent:(unint64_t)a5
{
  void *v9;
  NSObject *v10;
  char v11;
  _QWORD block[9];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor mHIDEventQueue](self, "mHIDEventQueue"));

  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor mHIDEventQueue](self, "mHIDEventQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100001CF8;
    block[3] = &unk_100004270;
    block[4] = self;
    block[5] = &v14;
    block[6] = a5;
    block[7] = a4;
    block[8] = a3;
    dispatch_sync(v10, block);

  }
  v11 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (BOOL)startMonitoringWithHIDEvents:(id)a3
{
  id v4;
  DAHIDEventMonitor *v5;
  unsigned __int8 v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  BOOL v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  dispatch_queue_t v25;
  __IOHIDEventSystemClient *v26;
  void *v27;
  DAHIDEventMonitor *v28;
  id v30;
  char v31;
  uint8_t buf;
  _BYTE v33[15];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v4 = a3;
  -[DAHIDEventMonitor setHIDSystemClient:](self, "setHIDSystemClient:", IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 1, 0));
  if (!-[DAHIDEventMonitor HIDSystemClient](self, "HIDSystemClient"))
  {
    v18 = DiagnosticLogHandleForCategory(3);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_100002974();

    CFRelease(-[DAHIDEventMonitor HIDSystemClient](self, "HIDSystemClient"));
    goto LABEL_25;
  }
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[DAHIDEventMonitor currentlyMonitoring](v5, "currentlyMonitoring");
  objc_sync_exit(v5);

  if ((v6 & 1) != 0)
  {
LABEL_25:
    v20 = 0;
    goto LABEL_35;
  }
  v30 = v4;
  if (!-[DAHIDEventMonitor systemClientSetupWithHIDEvents:](v5, "systemClientSetupWithHIDEvents:", v4))
  {
    v21 = DiagnosticLogHandleForCategory(3);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_100002A14();

    goto LABEL_29;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (!v8)
  {

    goto LABEL_33;
  }
  v9 = *(_QWORD *)v35;
  v31 = 1;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v35 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor HIDEvents](v5, "HIDEvents"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v11, "unsignedIntegerValue")));

      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("needServiceClient")));
      if (-[NSObject BOOLValue](v14, "BOOLValue"))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("HIDServiceClient")));
        v16 = v15 == 0;

        if (!v16)
          goto LABEL_18;
        if ((v31 & 1) != 0
          && -[DAHIDEventMonitor findServiceClientForHIDEvent:](v5, "findServiceClientForHIDEvent:", v11))
        {
          v31 = 1;
          goto LABEL_18;
        }
        v17 = DiagnosticLogHandleForCategory(3);
        v14 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_1000029D8(&buf, v33, v14);
        v31 = 0;
      }

LABEL_18:
    }
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  }
  while (v8);

  if ((v31 & 1) != 0)
  {
LABEL_33:
    v25 = dispatch_queue_create("com.apple.Diagnostics.hideventmonitor", 0);
    -[DAHIDEventMonitor setMHIDEventQueue:](v5, "setMHIDEventQueue:", v25);

    v26 = -[DAHIDEventMonitor HIDSystemClient](v5, "HIDSystemClient");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor mHIDEventQueue](v5, "mHIDEventQueue"));
    IOHIDEventSystemClientScheduleWithDispatchQueue(v26, v27);

    IOHIDEventSystemClientRegisterEventFilterCallback(-[DAHIDEventMonitor HIDSystemClient](v5, "HIDSystemClient"), _HIDEventFilterCallback, v5, v5);
    v28 = v5;
    objc_sync_enter(v28);
    -[DAHIDEventMonitor setCurrentlyMonitoring:](v28, "setCurrentlyMonitoring:", 1);
    objc_sync_exit(v28);

    v20 = 1;
    goto LABEL_34;
  }
LABEL_29:
  v23 = DiagnosticLogHandleForCategory(3);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    sub_1000029A0();

  -[DAHIDEventMonitor cleanUpSystemClient](v5, "cleanUpSystemClient");
  v20 = 0;
LABEL_34:
  v4 = v30;
LABEL_35:

  return v20;
}

- (void)stopMonitoring
{
  DAHIDEventMonitor *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD block[5];
  _BYTE v14[128];

  v2 = self;
  objc_sync_enter(v2);
  -[DAHIDEventMonitor setCurrentlyMonitoring:](v2, "setCurrentlyMonitoring:", 0);
  objc_sync_exit(v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor mHIDEventQueue](v2, "mHIDEventQueue"));
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor mHIDEventQueue](v2, "mHIDEventQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000235C;
    block[3] = &unk_100004298;
    block[4] = v2;
    dispatch_sync(v4, block);

  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor HIDEvents](v2, "HIDEvents", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "removeObjectForKey:", CFSTR("HIDServiceClient"));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (void)cleanUpSystemClient
{
  __IOHIDEventSystemClient *v3;
  __IOHIDEventSystemClient *v4;
  void *v5;
  void *v6;

  v3 = -[DAHIDEventMonitor HIDSystemClient](self, "HIDSystemClient");
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor mHIDEventQueue](self, "mHIDEventQueue"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DAHIDEventMonitor mHIDEventQueue](self, "mHIDEventQueue"));
      IOHIDEventSystemClientUnscheduleFromDispatchQueue(v4, v6);

    }
    IOHIDEventSystemClientUnregisterEventFilterCallback(v4, _HIDEventFilterCallback, self, self);
    CFRelease(v4);
    -[DAHIDEventMonitor setHIDSystemClient:](self, "setHIDSystemClient:", 0);
  }
}

- (DAHIDEventMonitorDelegate)delegate
{
  return (DAHIDEventMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)currentlyMonitoring
{
  return self->_currentlyMonitoring;
}

- (void)setCurrentlyMonitoring:(BOOL)a3
{
  self->_currentlyMonitoring = a3;
}

- (OS_dispatch_queue)mHIDEventQueue
{
  return self->_mHIDEventQueue;
}

- (void)setMHIDEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_mHIDEventQueue, a3);
}

- (NSMutableArray)HIDEvents
{
  return self->_HIDEvents;
}

- (void)setHIDEvents:(id)a3
{
  objc_storeStrong((id *)&self->_HIDEvents, a3);
}

- (__IOHIDEventSystemClient)HIDSystemClient
{
  return self->_HIDSystemClient;
}

- (void)setHIDSystemClient:(__IOHIDEventSystemClient *)a3
{
  self->_HIDSystemClient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_HIDEvents, 0);
  objc_storeStrong((id *)&self->_mHIDEventQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

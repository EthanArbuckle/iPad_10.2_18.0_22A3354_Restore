@implementation IOKService

- (id)addInterestNotifcationOfType:(id)a3 usingNotificationPort:(id)a4 error:(id *)a5 withHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  IOKInterestNotification *v14;
  IONotificationPort *v15;
  io_service_t v16;
  id v17;
  const char *v18;
  void *v19;
  kern_return_t v20;
  void *v21;
  NSObject *v23;
  io_object_t notification;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  notification = 0;
  if (!v11)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    *(_DWORD *)buf = 136316418;
    v26 = "notificationPort";
    v27 = 2048;
    v28 = 0;
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = &unk_21514EF3B;
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/IOKitten/IOKService.m";
    v35 = 1024;
    v36 = 304;
    v23 = MEMORY[0x24BDACB70];
LABEL_20:
    _os_log_impl(&dword_215148000, v23, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_21;
  }
  objc_msgSend(v11, "queue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    *(_DWORD *)buf = 136316418;
    v26 = "notificationPort.queue";
    v27 = 2048;
    v28 = 0;
    v29 = 2048;
    v30 = 0;
    v31 = 2080;
    v32 = &unk_21514EF3B;
    v33 = 2080;
    v34 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/IOKitten/IOKService.m";
    v35 = 1024;
    v36 = 305;
    v23 = MEMORY[0x24BDACB70];
    goto LABEL_20;
  }
  if (!v12)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v26 = "handler";
      v27 = 2048;
      v28 = 0;
      v29 = 2048;
      v30 = 0;
      v31 = 2080;
      v32 = &unk_21514EF3B;
      v33 = 2080;
      v34 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/IOKitten/IOKService.m";
      v35 = 1024;
      v36 = 306;
      v23 = MEMORY[0x24BDACB70];
      goto LABEL_20;
    }
LABEL_21:
    v14 = 0;
    goto LABEL_13;
  }
  v14 = objc_alloc_init(IOKInterestNotification);
  v15 = (IONotificationPort *)objc_msgSend(v11, "port");
  v16 = -[IOKObject object](self, "object");
  v17 = v10;
  v18 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
  -[IOKInterestNotification notificationRef](v14, "notificationRef");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = IOServiceAddInterestNotification(v15, v16, v18, (IOServiceInterestCallback)ServiceInterestCallback, v19, &notification);

  if (v20)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
    v10 = v17;
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v20, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v14;
    v14 = 0;
  }
  else
  {
    -[IOKInterestNotification setHandler:](v14, "setHandler:", v12);
    -[IOKInterestNotification setObject:](v14, "setObject:", notification);
    objc_msgSend(v11, "queue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[IOKInterestNotification setQueue:](v14, "setQueue:", v21);
    v10 = v17;
  }

  if (notification)
    IOObjectRelease(notification);
LABEL_13:

  return v14;
}

+ (id)serviceMatching:(id)a3
{
  return IOServiceMatching((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
}

+ (id)nameMatching:(id)a3
{
  return IOServiceNameMatching((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
}

+ (id)bsdNameMatching:(id)a3
{
  return IOBSDNameMatching(*MEMORY[0x24BDD8B20], 0, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
}

+ (id)entryIDMatching:(unint64_t)a3
{
  return IORegistryEntryIDMatching(a3);
}

+ (id)matchingService:(id)a3
{
  id v3;
  mach_port_t v4;
  const __CFDictionary *v5;
  uint64_t MatchingService;
  io_object_t v7;
  void *v8;

  v3 = a3;
  v4 = *MEMORY[0x24BDD8B20];
  v5 = (const __CFDictionary *)v3;
  MatchingService = IOServiceGetMatchingService(v4, v5);
  if ((_DWORD)MatchingService)
  {
    v7 = MatchingService;
    v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithServiceEntry:", MatchingService);
    IOObjectRelease(v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)matchingServices:(id)a3 error:(id *)a4
{
  id v5;
  mach_port_t v6;
  const __CFDictionary *v7;
  kern_return_t MatchingServices;
  kern_return_t v9;
  IOKIterator *v10;
  IOKIterator *v11;
  io_iterator_t existing;

  v5 = a3;
  existing = 0;
  v6 = *MEMORY[0x24BDD8B20];
  v7 = (const __CFDictionary *)v5;
  MatchingServices = IOServiceGetMatchingServices(v6, v7, &existing);
  if (MatchingServices)
  {
    v9 = MatchingServices;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (a4)
        goto LABEL_4;
    }
    else if (a4)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v9, 0);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v10 = 0;
  }
  else
  {
    v11 = [IOKIterator alloc];
    v10 = -[IOKIterator initWithIterator:](v11, "initWithIterator:", existing);
  }
LABEL_8:
  if (existing)
    IOObjectRelease(existing);

  return v10;
}

+ (id)addNotificationOfType:(id)a3 forMatching:(id)a4 usingNotificationPort:(id)a5 error:(id *)a6 withHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  IOKMatchingNotification *v16;
  IONotificationPort *v17;
  id v18;
  const char *v19;
  id v20;
  const __CFDictionary *v21;
  void *v22;
  kern_return_t v23;
  void *v24;
  IOKIterator *v25;
  IOKIterator *v26;
  NSObject *v28;
  io_iterator_t notification;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  notification = 0;
  if (!v13)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    *(_DWORD *)buf = 136316418;
    v31 = "notificationPort";
    v32 = 2048;
    v33 = 0;
    v34 = 2048;
    v35 = 0;
    v36 = 2080;
    v37 = &unk_21514EF3B;
    v38 = 2080;
    v39 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/IOKitten/IOKService.m";
    v40 = 1024;
    v41 = 184;
    v28 = MEMORY[0x24BDACB70];
LABEL_20:
    _os_log_impl(&dword_215148000, v28, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_21;
  }
  objc_msgSend(v13, "queue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    *(_DWORD *)buf = 136316418;
    v31 = "notificationPort.queue";
    v32 = 2048;
    v33 = 0;
    v34 = 2048;
    v35 = 0;
    v36 = 2080;
    v37 = &unk_21514EF3B;
    v38 = 2080;
    v39 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/IOKitten/IOKService.m";
    v40 = 1024;
    v41 = 185;
    v28 = MEMORY[0x24BDACB70];
    goto LABEL_20;
  }
  if (!v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v31 = "handler";
      v32 = 2048;
      v33 = 0;
      v34 = 2048;
      v35 = 0;
      v36 = 2080;
      v37 = &unk_21514EF3B;
      v38 = 2080;
      v39 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/IOKitten/IOKService.m";
      v40 = 1024;
      v41 = 186;
      v28 = MEMORY[0x24BDACB70];
      goto LABEL_20;
    }
LABEL_21:
    v16 = 0;
    goto LABEL_13;
  }
  v16 = objc_alloc_init(IOKMatchingNotification);
  v17 = (IONotificationPort *)objc_msgSend(v13, "port");
  v18 = v11;
  v19 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
  v20 = v12;
  v21 = (const __CFDictionary *)v12;
  -[IOKMatchingNotification notificationRef](v16, "notificationRef");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = IOServiceAddMatchingNotification(v17, v19, v21, (IOServiceMatchingCallback)ServiceMatchingCallback, v22, &notification);

  if (v23)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
    v11 = v18;
    v12 = v20;
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v23, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v16;
    v16 = 0;
  }
  else
  {
    -[IOKMatchingNotification setHandler:](v16, "setHandler:", v14);
    v25 = [IOKIterator alloc];
    v26 = -[IOKIterator initWithIterator:](v25, "initWithIterator:", notification);
    -[IOKMatchingNotification setIterator:](v16, "setIterator:", v26);

    objc_msgSend(v13, "queue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[IOKMatchingNotification setQueue:](v16, "setQueue:", v24);
    v11 = v18;
    v12 = v20;
  }

  if (notification)
    IOObjectRelease(notification);
LABEL_13:

  return v16;
}

+ (id)addNotificationOfType:(id)a3 forMatching:(id)a4 usingNotificationPort:(id)a5 error:(id *)a6 withEnumerationBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  IOKMatchingNotification *v16;
  IONotificationPort *v17;
  id v18;
  const char *v19;
  id v20;
  const __CFDictionary *v21;
  void *v22;
  kern_return_t v23;
  IOKMatchingNotification *v24;
  IOKIterator *v25;
  IOKIterator *v26;
  void *v27;
  NSObject *v29;
  _QWORD v30[4];
  IOKMatchingNotification *v31;
  io_iterator_t notification;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  notification = 0;
  if (!v13)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    *(_DWORD *)buf = 136316418;
    v34 = "notificationPort";
    v35 = 2048;
    v36 = 0;
    v37 = 2048;
    v38 = 0;
    v39 = 2080;
    v40 = &unk_21514EF3B;
    v41 = 2080;
    v42 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/IOKitten/IOKService.m";
    v43 = 1024;
    v44 = 224;
    v29 = MEMORY[0x24BDACB70];
LABEL_20:
    _os_log_impl(&dword_215148000, v29, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_21;
  }
  objc_msgSend(v13, "queue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    *(_DWORD *)buf = 136316418;
    v34 = "notificationPort.queue";
    v35 = 2048;
    v36 = 0;
    v37 = 2048;
    v38 = 0;
    v39 = 2080;
    v40 = &unk_21514EF3B;
    v41 = 2080;
    v42 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/IOKitten/IOKService.m";
    v43 = 1024;
    v44 = 225;
    v29 = MEMORY[0x24BDACB70];
    goto LABEL_20;
  }
  if (!v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v34 = "iteratorEnumerationBlock";
      v35 = 2048;
      v36 = 0;
      v37 = 2048;
      v38 = 0;
      v39 = 2080;
      v40 = &unk_21514EF3B;
      v41 = 2080;
      v42 = "/Library/Caches/com.apple.xbs/Sources/AudioTransportFrameworks/IOKitten/IOKService.m";
      v43 = 1024;
      v44 = 226;
      v29 = MEMORY[0x24BDACB70];
      goto LABEL_20;
    }
LABEL_21:
    v16 = 0;
    goto LABEL_13;
  }
  v16 = objc_alloc_init(IOKMatchingNotification);
  v17 = (IONotificationPort *)objc_msgSend(v13, "port");
  v18 = v11;
  v19 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
  v20 = v12;
  v21 = (const __CFDictionary *)v12;
  -[IOKMatchingNotification notificationRef](v16, "notificationRef");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = IOServiceAddMatchingNotification(v17, v19, v21, (IOServiceMatchingCallback)ServiceMatchingCallback, v22, &notification);

  if (v23)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
    v11 = v18;
    v12 = v20;
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v23, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v16;
    v16 = 0;
  }
  else
  {
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __97__IOKService_addNotificationOfType_forMatching_usingNotificationPort_error_withEnumerationBlock___block_invoke;
    v30[3] = &unk_24D2AA190;
    v31 = (IOKMatchingNotification *)v14;
    -[IOKMatchingNotification setHandler:](v16, "setHandler:", v30);
    v25 = [IOKIterator alloc];
    v26 = -[IOKIterator initWithIterator:](v25, "initWithIterator:", notification);
    -[IOKMatchingNotification setIterator:](v16, "setIterator:", v26);

    objc_msgSend(v13, "queue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[IOKMatchingNotification setQueue:](v16, "setQueue:", v27);

    v24 = v31;
    v11 = v18;
    v12 = v20;
  }

  if (notification)
    IOObjectRelease(notification);
LABEL_13:

  return v16;
}

void __97__IOKService_addNotificationOfType_forMatching_usingNotificationPort_error_withEnumerationBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x2199DC9EC]();
  objc_msgSend(v4, "enumerateWithBlock:", *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v3);

}

- (BOOL)matchesPropertyTable:(id)a3 error:(id *)a4
{
  const __CFDictionary *v6;
  kern_return_t matched;
  id v8;
  BOOL result;
  BOOLean_t matches;

  matches = 0;
  v6 = (const __CFDictionary *)a3;
  matched = IOServiceMatchPropertyTable(-[IOKObject object](self, "object"), v6, &matches);

  if (!matched)
    return matches != 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
    if (a4)
      goto LABEL_4;
  }
  else if (a4)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), matched, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a4 = v8;
    return result;
  }
  return 0;
}

- (unsigned)busyState
{
  uint32_t busyState;

  busyState = 0;
  IOServiceGetBusyState(-[IOKObject object](self, "object"), &busyState);
  return busyState;
}

- (id)connectToServiceOfType:(unsigned int)a3
{
  return -[IOKConnection initWithService:andType:]([IOKConnection alloc], "initWithService:andType:", self, *(_QWORD *)&a3);
}

- (BOOL)requestProbeWithOptions:(unsigned int)a3 error:(id *)a4
{
  int v5;

  v5 = MEMORY[0x2199DC968](-[IOKObject object](self, "object"), *(_QWORD *)&a3);
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKConnection setNotificationPort:ofType:withReference:error:].cold.1();
      if (!a4)
        return v5 == 0;
      goto LABEL_4;
    }
    if (a4)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v5, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5 == 0;
}

- (BOOL)isServiceAuthorizedForOpenAllowInteraction:(BOOL)a3
{
  return IOServiceAuthorize(-[IOKObject object](self, "object"), a3) == 0;
}

@end

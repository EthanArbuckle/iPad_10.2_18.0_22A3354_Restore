@implementation GCIOService

- (GCIOService)initWithPort:(unsigned int)a3 error:(id *)p_isa
{
  uint64_t v5;
  void *v7;
  uint64_t v9;
  void *v10;
  objc_super v11;
  uint64_t v12;
  _QWORD v13[2];

  v5 = *(_QWORD *)&a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_opt_class();
  if (objc_msgSend(v7, "isEqual:", objc_opt_class()) && !IOObjectConformsTo(v5, "IOService"))
  {
    if (p_isa)
    {
      v9 = *MEMORY[0x1E0CB2D98];
      v12 = *MEMORY[0x1E0CB2D68];
      v13[0] = CFSTR("Port does not reference an IOService.");
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", v9, 4, v10);
      *p_isa = (id)objc_claimAutoreleasedReturnValue();

      p_isa = 0;
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)GCIOService;
    self = -[GCIORegistryEntry initWithPort:error:](&v11, sel_initWithPort_error_, v5, p_isa);
    p_isa = (id *)&self->super.super.super.isa;
  }

  return (GCIOService *)p_isa;
}

+ (id)addMatchingNotification:(id)a3 type:(const char *)a4 matching:(id)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  IONotificationPort *v16;
  const __CFDictionary *v17;
  kern_return_t v18;
  GCIOIterator *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _GCDisposable *v24;
  _GCDisposable *v25;
  NSObject *v26;
  void *v28;
  _QWORD v29[4];
  NSObject *v30;
  id v31;
  uint64_t *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  io_iterator_t notification;
  uint8_t buf[24];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  notification = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__4;
  v41 = __Block_byref_object_dispose__4;
  v12 = MEMORY[0x1E0C809B0];
  v42 = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __61__GCIOService_addMatchingNotification_type_matching_handler___block_invoke;
  v34[3] = &unk_1EA4D3778;
  v36 = &v37;
  v13 = v11;
  v35 = v13;
  v14 = (void *)objc_msgSend(v34, "copy");
  v15 = objc_retainAutorelease(v9);
  v16 = (IONotificationPort *)-[GCIONotificationPort port]((uint64_t)v15);
  v17 = (const __CFDictionary *)v10;
  v18 = IOServiceAddMatchingNotification(v16, a4, v17, (IOServiceMatchingCallback)__IOServiceMatchingCallback, v14, &notification);
  if (v18)
  {
    _gc_log_iokit();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[GCIOService addMatchingNotification:type:matching:handler:].cold.2((uint64_t)a4, v18, v21);
    v25 = 0;
  }
  else
  {
    v19 = [GCIOIterator alloc];
    v33 = 0;
    v20 = -[GCIOIterator initWithPort:objectClass:error:](v19, "initWithPort:objectClass:error:", notification, objc_opt_class(), &v33);
    v21 = v33;
    v22 = (void *)v38[5];
    v38[5] = v20;

    if (v38[5])
    {
      IOObjectRelease(notification);
      -[GCIONotificationPort queue]((uint64_t)v15);
      v23 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v23, v14);

      v24 = [_GCDisposable alloc];
      v29[0] = v12;
      v29[1] = 3221225472;
      v29[2] = __61__GCIOService_addMatchingNotification_type_matching_handler___block_invoke_7;
      v29[3] = &unk_1EA4D37C8;
      v32 = &v37;
      v30 = v15;
      v31 = v14;
      v25 = -[_GCDisposable initWithCleanupHandler:](v24, "initWithCleanupHandler:", v29);

      v26 = v30;
    }
    else
    {
      _gc_log_iokit();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        -[NSObject localizedFailureReason](v21, "localizedFailureReason");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[GCIOService addMatchingNotification:type:matching:handler:].cold.1((uint64_t)a4, v28, buf, v26);
      }
      v25 = 0;
    }

  }
  _Block_object_dispose(&v37, 8);

  return v25;
}

uint64_t __61__GCIOService_addMatchingNotification_type_matching_handler___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __61__GCIOService_addMatchingNotification_type_matching_handler___block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  -[GCIONotificationPort queue](*(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__GCIOService_addMatchingNotification_type_matching_handler___block_invoke_2;
  block[3] = &unk_1EA4D37A0;
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, block);

}

id __61__GCIOService_addMatchingNotification_type_matching_handler___block_invoke_2()
{
  return (id)objc_opt_self();
}

- (id)addInterestNotification:(id)a3 type:(const char *)a4 handler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  IONotificationPort *v11;
  io_service_t v12;
  kern_return_t v13;
  _GCDisposable *v14;
  _GCDisposable *v15;
  NSObject *v16;
  kern_return_t v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  io_object_t v22;
  io_object_t notification;
  uint8_t buf[4];
  GCIOService *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  kern_return_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  notification = 0;
  v9 = (void *)objc_msgSend(a5, "copy");
  v10 = objc_retainAutorelease(v8);
  v11 = (IONotificationPort *)-[GCIONotificationPort port]((uint64_t)v10);
  v12 = -[GCIOObject port]((uint64_t)self);
  v13 = IOServiceAddInterestNotification(v11, v12, a4, (IOServiceInterestCallback)__IOServiceNotificationCallback, v9, &notification);
  if (v13)
  {
    v18 = v13;
    _gc_log_iokit();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v25 = self;
      v26 = 2082;
      v27 = a4;
      v28 = 1024;
      v29 = v18;
      _os_log_error_impl(&dword_1DC79E000, v16, OS_LOG_TYPE_ERROR, "%@ Error registering interest notification for '%{public}s': %{mach.errno}d", buf, 0x1Cu);
    }
    v15 = 0;
  }
  else
  {
    v14 = [_GCDisposable alloc];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __52__GCIOService_addInterestNotification_type_handler___block_invoke;
    v19[3] = &unk_1EA4D37F0;
    v22 = notification;
    v20 = v10;
    v21 = v9;
    v15 = -[_GCDisposable initWithCleanupHandler:](v14, "initWithCleanupHandler:", v19);

    v16 = v20;
  }

  return v15;
}

void __52__GCIOService_addInterestNotification_type_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  IOObjectRelease(*(_DWORD *)(a1 + 48));
  -[GCIONotificationPort queue](*(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__GCIOService_addInterestNotification_type_handler___block_invoke_2;
  block[3] = &unk_1EA4D37A0;
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

}

id __52__GCIOService_addInterestNotification_type_handler___block_invoke_2()
{
  return (id)objc_opt_self();
}

- (IOCFPlugInInterfaceStruct)createCFPlugInInterface:(__CFUUID *)a3 score:(int *)a4 error:(id *)a5
{
  io_service_t v8;
  const __CFUUID *v9;
  kern_return_t v10;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  IOCFPlugInInterface **theInterface;
  SInt32 theScore;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  theScore = 0;
  theInterface = 0;
  v8 = -[GCIOObject port]((uint64_t)self);
  v9 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  v10 = IOCreatePlugInInterfaceForService(v8, a3, v9, &theInterface, &theScore);
  if (v10)
  {
    if (a5)
    {
      v12 = *MEMORY[0x1E0CB2D98];
      v13 = v10;
      v17 = *MEMORY[0x1E0CB2D60];
      v18[0] = CFSTR("CFPlugIn instantiation failed.");
      +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", v12, v13, v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  else
  {
    if (a4)
      *a4 = theScore;
    return theInterface;
  }
}

+ (void)addMatchingNotification:(uint64_t)a1 type:(void *)a2 matching:(uint8_t *)buf handler:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136446466;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1DC79E000, log, OS_LOG_TYPE_ERROR, "<IOService> Error creating iterator for matching notification for '%{public}s': %{public}@", buf, 0x16u);

}

+ (void)addMatchingNotification:(os_log_t)log type:matching:handler:.cold.2(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136446466;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_1DC79E000, log, OS_LOG_TYPE_ERROR, "<IOService> Error registering matching notification for '%{public}s': %{mach.errno}d", (uint8_t *)&v3, 0x12u);
}

@end

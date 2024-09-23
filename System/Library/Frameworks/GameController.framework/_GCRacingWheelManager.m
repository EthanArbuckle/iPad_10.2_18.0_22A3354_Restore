@implementation _GCRacingWheelManager

- (_GCRacingWheelManager)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  IONotificationPort *v5;
  const __CFAllocator *v6;
  const __CFSet *v7;
  id v8;
  void *v9;
  _QWORD *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _GCRacingWheelManager *v24;
  NSObject *v26;
  uint8_t buf[16];
  _QWORD v28[4];
  id v29;
  const __CFSet *v30;
  CFSetCallBacks callBacks;
  objc_super v32;
  _QWORD v33[4];
  _QWORD v34[4];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[5];

  v40[3] = *MEMORY[0x24BDAC8D0];
  v32.receiver = self;
  v32.super_class = (Class)_GCRacingWheelManager;
  v2 = -[_GCRacingWheelManager init](&v32, sel_init);
  v3 = dispatch_queue_create("_GCRacingWheelManager", 0);
  v4 = (void *)*((_QWORD *)v2 + 1);
  *((_QWORD *)v2 + 1) = v3;

  v5 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
  *((_QWORD *)v2 + 2) = v5;
  if (v5)
  {
    IONotificationPortSetDispatchQueue(v5, *((dispatch_queue_t *)v2 + 1));
    callBacks.version = 0;
    memset(&callBacks.copyDescription, 0, 24);
    callBacks.retain = (CFSetRetainCallBack)_IOObjectCFRetain;
    callBacks.release = (CFSetReleaseCallBack)_IOObjectCFRelease;
    v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v7 = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &callBacks);
    *((_QWORD *)v2 + 4) = CFSetCreateMutable(v6, 0, &callBacks);
    v8 = objc_alloc_init((Class)&off_254DEBD30);
    v9 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v8;

    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __29___GCRacingWheelManager_init__block_invoke;
    v28[3] = &unk_24D2B5398;
    v10 = v2;
    v29 = v10;
    v30 = v7;
    v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199DEBB0](v28);
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215181000, v26, OS_LOG_TYPE_INFO, "Starting racing wheel support...", buf, 2u);
      }

    }
    v39[0] = CFSTR("VendorID");
    +[NSNumber numberWithUnsignedShort:](&off_254DED908, "numberWithUnsignedShort:", (unsigned __int16)GCLogitechG923VID);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v12;
    v39[1] = CFSTR("ProductID");
    +[NSNumber numberWithUnsignedShort:](&off_254DED908, "numberWithUnsignedShort:", (unsigned __int16)GCLogitechG923PID_HIDpp);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = CFSTR("PrimaryUsage");
    v40[1] = v13;
    v40[2] = &unk_24D30E1E8;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v14);

    v37[0] = CFSTR("VendorID");
    +[NSNumber numberWithUnsignedShort:](&off_254DED908, "numberWithUnsignedShort:", (unsigned __int16)GCLogitechG923VID);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v15;
    v37[1] = CFSTR("ProductID");
    +[NSNumber numberWithUnsignedShort:](&off_254DED908, "numberWithUnsignedShort:", (unsigned __int16)GCLogitechG923PID_Classic);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = CFSTR("PrimaryUsage");
    v38[1] = v16;
    v38[2] = &unk_24D30E1E8;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v17);

    v35[0] = CFSTR("VendorID");
    +[NSNumber numberWithUnsignedShort:](&off_254DED908, "numberWithUnsignedShort:", (unsigned __int16)GCLogitechG920VID);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v18;
    v35[1] = CFSTR("ProductID");
    +[NSNumber numberWithUnsignedShort:](&off_254DED908, "numberWithUnsignedShort:", (unsigned __int16)GCLogitechG920PID);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = CFSTR("PrimaryUsage");
    v36[1] = v19;
    v36[2] = &unk_24D30E1E8;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v20);

    v33[0] = CFSTR("VendorID");
    +[NSNumber numberWithUnsignedShort:](&off_254DED908, "numberWithUnsignedShort:", (unsigned __int16)GCLogitechG29VID);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v21;
    v33[1] = CFSTR("ProductID");
    +[NSNumber numberWithUnsignedShort:](&off_254DED908, "numberWithUnsignedShort:", (unsigned __int16)GCLogitechG29PID);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v22;
    v34[2] = &unk_24D30E200;
    v33[2] = CFSTR("PrimaryUsagePage");
    v33[3] = CFSTR("PrimaryUsage");
    v34[3] = &unk_24D30E1E8;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DEBCC0, "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v23);

    v10[3] = CFSetCreateCopy(v6, v7);
    CFRelease(v7);
    v24 = v10;

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)connectedRacingWheels
{
  id *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    objc_msgSend(v1[5], "allValues");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v1);

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedWheels, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

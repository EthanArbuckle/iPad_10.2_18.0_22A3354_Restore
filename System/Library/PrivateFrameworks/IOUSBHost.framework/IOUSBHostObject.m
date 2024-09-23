@implementation IOUSBHostObject

- (IOUSBHostObject)initWithIOService:(io_service_t)ioService queue:(dispatch_queue_t)queue error:(NSError *)error interestHandler:(IOUSBHostInterestHandler)interestHandler
{
  return -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:](self, "initWithIOService:options:queue:error:interestHandler:", *(_QWORD *)&ioService, 0, queue, error, interestHandler);
}

- (IOUSBHostObject)initWithIOService:(io_service_t)ioService options:(IOUSBHostObjectInitOptions)options queue:(dispatch_queue_t)queue error:(NSError *)error interestHandler:(IOUSBHostInterestHandler)interestHandler
{
  uint64_t v10;
  NSObject *v12;
  IOUSBHostInterestHandler v13;
  IOUSBHostObject *v14;
  IOUSBHostObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  IOUSBHostInterestHandler v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  const char *v29;
  IOUSBHostObject *v30;
  IOUSBHostInterestHandler v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL8 v39;
  const char *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL8 v47;
  const char *v48;
  dispatch_queue_t v49;
  void *v50;
  IONotificationPort *v51;
  NSObject *v52;
  id v53;
  void *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _BOOL8 v63;
  const char *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _BOOL8 v71;
  const char *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _BOOL8 v79;
  const char *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  const char *v96;
  IOUSBHostInterestNotifier *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  _BOOL8 v107;
  const char *v108;
  NSError **v109;
  void *v110;
  int v111;
  void *v112;
  IOUSBHostInterestHandler v113;
  IOUSBHostInterestHandler v114;
  void *v115;
  void *v116;
  void *v117;
  NSObject *v118;
  NSObject *v119;
  NSObject *v120;
  unint64_t v121;
  id v122;
  objc_super v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;

  v10 = *(_QWORD *)&ioService;
  v130 = *MEMORY[0x24BDAC8D0];
  v12 = queue;
  v13 = interestHandler;
  v123.receiver = self;
  v123.super_class = (Class)IOUSBHostObject;
  v14 = -[IOUSBHostObject init](&v123, sel_init);
  v15 = v14;
  if (!v14)
  {
    if (error)
    {
      v118 = v12;
      v20 = v13;
      v124 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostObject."), &stru_24DEDD560, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = v22;
      v125 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Failed [super init]"), &stru_24DEDD560, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = v24;
      v126 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v127, &v124, 3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870199, v27);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v28 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v28)
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.1(v28, v29);

      v13 = v20;
      v12 = v118;
    }
    goto LABEL_10;
  }
  -[IOUSBHostObject setDebugLoggingMask:](v14, "setDebugLoggingMask:", 1);
  -[IOUSBHostObject setIoService:](v15, "setIoService:", v10);
  IOObjectRetain(-[IOUSBHostObject ioService](v15, "ioService"));
  -[IOUSBHostObject setIoConnection:](v15, "setIoConnection:", 0);
  -[IOUSBHostObject setIoNotificationPortRef:](v15, "setIoNotificationPortRef:", 0);
  -[IOUSBHostObject setInvalidDescriptorCache:](v15, "setInvalidDescriptorCache:", 0);
  -[IOUSBHostObject setDescriptorCache:](v15, "setDescriptorCache:", 0);
  -[IOUSBHostObject setInterestHandler:](v15, "setInterestHandler:", 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 1);
  -[IOUSBHostObject setInvalidDescriptorCache:](v15, "setInvalidDescriptorCache:", v16);

  -[IOUSBHostObject invalidDescriptorCache](v15, "invalidDescriptorCache");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    if (error)
    {
      v119 = v12;
      v31 = v13;
      v124 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostObject."), &stru_24DEDD560, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = v33;
      v125 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("Unable to allocateNSMutableSet."), &stru_24DEDD560, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = v35;
      v126 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = v37;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v127, &v124, 3);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870211, v38);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v39 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v39)
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.2(v39, v40);
      goto LABEL_33;
    }
    goto LABEL_40;
  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
  -[IOUSBHostObject setDescriptorCache:](v15, "setDescriptorCache:", v18);

  -[IOUSBHostObject descriptorCache](v15, "descriptorCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    if (error)
    {
      v119 = v12;
      v31 = v13;
      v124 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostObject."), &stru_24DEDD560, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = v42;
      v125 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("Unable to allocate NSMutableDictionary."), &stru_24DEDD560, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = v44;
      v126 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = v46;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v127, &v124, 3);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870211, v38);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v47 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v47)
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.3(v47, v48);
      goto LABEL_33;
    }
    goto LABEL_40;
  }
  if (v12)
  {
    -[IOUSBHostObject setQueue:](v15, "setQueue:", v12);
  }
  else
  {
    v49 = dispatch_queue_create("IOUSBHostDispatchQueue", 0);
    -[IOUSBHostObject setQueue:](v15, "setQueue:", v49);

  }
  -[IOUSBHostObject queue](v15, "queue");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v50)
  {
    if (error)
    {
      v119 = v12;
      v31 = v13;
      v124 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostObject."), &stru_24DEDD560, 0);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = v66;
      v125 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("Unable to allocate dispatch queue."), &stru_24DEDD560, 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = v68;
      v126 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = v70;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v127, &v124, 3);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870211, v38);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v71 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v71)
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.4(v71, v72);
      goto LABEL_33;
    }
LABEL_40:
    v30 = 0;
    goto LABEL_41;
  }
  -[IOUSBHostObject setIoNotificationPortRef:](v15, "setIoNotificationPortRef:", IONotificationPortCreate(*MEMORY[0x24BDD8B18]));
  if (!-[IOUSBHostObject ioNotificationPortRef](v15, "ioNotificationPortRef"))
  {
    if (error)
    {
      v119 = v12;
      v31 = v13;
      v124 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostObject."), &stru_24DEDD560, 0);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = v74;
      v125 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("Unable to create IONotificationPort port."), &stru_24DEDD560, 0);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = v76;
      v126 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = v78;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v127, &v124, 3);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870211, v38);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v79 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v79)
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.5(v79, v80);
LABEL_33:

      v13 = v31;
      v12 = v119;
      goto LABEL_40;
    }
    goto LABEL_40;
  }
  v51 = -[IOUSBHostObject ioNotificationPortRef](v15, "ioNotificationPortRef");
  -[IOUSBHostObject queue](v15, "queue");
  v52 = objc_claimAutoreleasedReturnValue();
  IONotificationPortSetDispatchQueue(v51, v52);

  v122 = 0;
  LOBYTE(v51) = -[IOUSBHostObject openWithOptions:error:](v15, "openWithOptions:error:", options, &v122);
  v53 = v122;
  v54 = v53;
  if ((v51 & 1) == 0)
  {
    v111 = objc_msgSend(v53, "code");
    objc_msgSend(v54, "userInfo");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(v81, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FD8]);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "userInfo");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = *MEMORY[0x24BDD0FF0];
    v112 = v84;
    objc_msgSend(v84, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FF0]);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v83;
    if (error)
    {
      v109 = error;
      v110 = v81;
      v116 = v54;
      v120 = v12;
      v114 = v13;
      v124 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v88 = v87;
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostObject."), &stru_24DEDD560, 0);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = v90;
      v125 = v82;
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "localizedStringForKey:value:table:", v87, &stru_24DEDD560, 0);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = v92;
      v126 = v85;
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "localizedStringForKey:value:table:", v86, &stru_24DEDD560, 0);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = v94;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v127, &v124, 3);
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      v87 = v88;
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v111, v95);
      *v109 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.8(v88, v96);

      v13 = v114;
      v54 = v116;
      v12 = v120;
      v81 = v110;
    }

    goto LABEL_39;
  }
  v121 = 0;
  -[IOUSBHostObject setDeviceDescriptor:](v15, "setDeviceDescriptor:", -[IOUSBHostObject descriptorWithType:length:error:](v15, "descriptorWithType:length:error:", 1, &v121, error));
  if (!-[IOUSBHostObject deviceDescriptor](v15, "deviceDescriptor")
    || (v55 = v121, v55 < *(unsigned __int8 *)-[IOUSBHostObject deviceDescriptor](v15, "deviceDescriptor")))
  {
    if (error)
    {
      v113 = v13;
      v115 = v54;
      v124 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostObject."), &stru_24DEDD560, 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = v57;
      v125 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "localizedStringForKey:value:table:", CFSTR("Unable to obtain device descriptor."), &stru_24DEDD560, 0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = v59;
      v126 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = v61;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v127, &v124, 3);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870212, v62);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v63 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v63)
        -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.6(v63, v64);

      v13 = v113;
      v54 = v115;
    }
LABEL_39:

    goto LABEL_40;
  }
  if (v13)
  {
    -[IOUSBHostObject setInterestHandler:](v15, "setInterestHandler:", v13);

    v98 = -[IOUSBHostInterestNotifier initWithOwner:service:callback:]([IOUSBHostInterestNotifier alloc], "initWithOwner:service:callback:", v15, v10, _interestNotificationCallback);
    -[IOUSBHostObject setInterestNotifier:](v15, "setInterestNotifier:", v98);

    -[IOUSBHostObject interestNotifier](v15, "interestNotifier");
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v99)
    {
      if (error)
      {
        v117 = v54;
        v124 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostObject."), &stru_24DEDD560, 0);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = v101;
        v125 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "localizedStringForKey:value:table:", CFSTR("Unable to create IOUSBHostInterestNotifier"), &stru_24DEDD560, 0);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = v103;
        v126 = *MEMORY[0x24BDD0FF0];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = v105;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v127, &v124, 3);
        v106 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870212, v106);
        *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
        v107 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v107)
          -[IOUSBHostObject initWithIOService:options:queue:error:interestHandler:].cold.7(v107, v108);

        v54 = v117;
      }
      v13 = 0;
      goto LABEL_39;
    }
  }

  v13 = 0;
LABEL_10:
  v30 = v15;
LABEL_41:

  return v30;
}

- (void)destroy
{
  -[IOUSBHostObject destroyWithOptions:](self, "destroyWithOptions:", 0);
}

- (void)destroyWithOptions:(unint64_t)a3
{
  char v3;
  BOOL *p_destroyed;
  void *v7;
  void *v8;

  v3 = a3;
  p_destroyed = &self->destroyed;
  do
  {
    if (__ldaxr((unsigned __int8 *)p_destroyed))
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(1u, (unsigned __int8 *)p_destroyed));
  -[IOUSBHostObject interestNotifier](self, "interestNotifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[IOUSBHostObject interestNotifier](self, "interestNotifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "destroy");

    -[IOUSBHostObject setInterestNotifier:](self, "setInterestNotifier:", 0);
  }
  if (-[IOUSBHostObject ioNotificationPortRef](self, "ioNotificationPortRef"))
  {
    IONotificationPortDestroy(-[IOUSBHostObject ioNotificationPortRef](self, "ioNotificationPortRef"));
    -[IOUSBHostObject setIoNotificationPortRef:](self, "setIoNotificationPortRef:", 0);
  }
  if (-[IOUSBHostObject ioConnection](self, "ioConnection"))
    -[IOUSBHostObject closeWithOptions:](self, "closeWithOptions:", (v3 & 1) << 16);
  if (-[IOUSBHostObject ioService](self, "ioService"))
  {
    IOObjectRelease(-[IOUSBHostObject ioService](self, "ioService"));
    -[IOUSBHostObject setIoService:](self, "setIoService:", 0);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[IOUSBHostObject destroy](self, "destroy");
  v3.receiver = self;
  v3.super_class = (Class)IOUSBHostObject;
  -[IOUSBHostObject dealloc](&v3, sel_dealloc);
}

- (BOOL)openWithOptions:(unint64_t)a3 error:(id *)a4
{
  unsigned int v7;
  BOOL v8;
  io_service_t v9;
  kern_return_t v10;
  kern_return_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  const char *v20;
  uint64_t v22;
  uint64_t MachPort;
  kern_return_t v24;
  kern_return_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  const char *v34;
  io_connect_t connect;
  uint64_t input;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v7 = -[IOUSBHostObject ioConnection](self, "ioConnection");
  if (a3 || !v7)
  {
    connect = 0;
    v9 = -[IOUSBHostObject ioService](self, "ioService");
    v10 = IOServiceOpen(v9, *MEMORY[0x24BDAEC58], 0, &connect);
    if (v10)
    {
      if (a4)
      {
        v11 = v10;
        v37 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Unable to open io_service_t object and create user client."), &stru_24DEDD560, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v13;
        v38 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("IOServiceOpen failed."), &stru_24DEDD560, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v15;
        v39 = *MEMORY[0x24BDD0FF0];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v37, 3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v11, v18);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v19)
          -[IOUSBHostObject openWithOptions:error:].cold.2(v19, v20);

      }
      return 0;
    }
    else
    {
      -[IOUSBHostObject setIoConnection:](self, "setIoConnection:", connect);
      v22 = -[IOUSBHostObject ioConnection](self, "ioConnection");
      MachPort = IONotificationPortGetMachPort(-[IOUSBHostObject ioNotificationPortRef](self, "ioNotificationPortRef"));
      MEMORY[0x220763884](v22, 0, MachPort, 0);
      input = a3 & 1 | (((a3 >> 1) & 1) << 16);
      v24 = IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection"), 0, &input, 1u, 0, 0);
      v8 = v24 == 0;
      if (v24 && a4)
      {
        v25 = v24;
        v37 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Unable to open io_service_t object and create user client."), &stru_24DEDD560, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v27;
        v38 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Exclusive open of usb object failed."), &stru_24DEDD560, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v29;
        v39 = *MEMORY[0x24BDD0FF0];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Another client likely has exclusive access."), &stru_24DEDD560, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v31;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v37, 3);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v25, v32);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v33)
          -[IOUSBHostObject openWithOptions:error:].cold.1(v33, v34);

      }
    }
  }
  else
  {
    if ((-[IOUSBHostObject debugLoggingMask](self, "debugLoggingMask") & 0x80) != 0)
      NSLog(CFSTR("[Line %d of %s] %sservice is already opened"), 240, "/Library/Caches/com.apple.xbs/Sources/IOUSBHostFamily/IOUSBHostFramework/IOUSBHostObject.m", "-[IOUSBHostObject openWithOptions:error:]");
    return 1;
  }
  return v8;
}

- (void)closeWithOptions:(unsigned int)a3
{
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  if (-[IOUSBHostObject ioConnection](self, "ioConnection"))
  {
    input[0] = a3;
    IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection"), 1u, input, 1u, 0, 0);
    IOServiceClose(-[IOUSBHostObject ioConnection](self, "ioConnection"));
    -[IOUSBHostObject setIoConnection:](self, "setIoConnection:", 0);
  }
  else if ((-[IOUSBHostObject debugLoggingMask](self, "debugLoggingMask") & 1) != 0)
  {
    NSLog(CFSTR("[Line %d of %s] %sservice is not opened"), 302, "/Library/Caches/com.apple.xbs/Sources/IOUSBHostFamily/IOUSBHostFramework/IOUSBHostObject.m", "-[IOUSBHostObject closeWithOptions:]");
  }
}

- (BOOL)sendDeviceRequest:(IOUSBDeviceRequest)request error:(NSError *)error
{
  return -[IOUSBHostObject sendDeviceRequest:data:bytesTransferred:completionTimeout:error:](self, "sendDeviceRequest:data:bytesTransferred:completionTimeout:error:", request, 0, 0, error, 5.0);
}

- (BOOL)sendDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred error:(NSError *)error
{
  return -[IOUSBHostObject sendDeviceRequest:data:bytesTransferred:completionTimeout:error:](self, "sendDeviceRequest:data:bytesTransferred:completionTimeout:error:", request, data, bytesTransferred, error, 5.0);
}

- (BOOL)sendDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data bytesTransferred:(NSUInteger *)bytesTransferred completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error
{
  unint64_t wLength;
  NSMutableData *v13;
  NSMutableData *v14;
  NSError **v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  const char *v24;
  BOOL v25;
  uint64_t (*__ptr32 *v26)();
  kern_return_t v27;
  kern_return_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL8 v36;
  const char *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSError **v47;
  _QWORD *v48;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t input;
  unint64_t bRequest;
  unint64_t wValue;
  uint64_t wIndex;
  unint64_t v55;
  uint64_t (*__ptr32 *v56)();
  NSMutableData *v57;
  _QWORD v58[3];
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  wLength = request.wLength;
  v13 = data;
  v14 = v13;
  if (v13)
  {
    if (-[NSMutableData length](v13, "length") < wLength)
    {
      if (error)
      {
        v15 = error;
        v59 = (void *)*MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Unable to send device request."), &stru_24DEDD560, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        input = (uint64_t)v17;
        v60 = (void *)*MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Data buffer is smaller than request wLength."), &stru_24DEDD560, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        bRequest = (unint64_t)v19;
        v61 = (void *)*MEMORY[0x24BDD0FF0];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("The wLength field of the request must be less than or equal to the data's length"), &stru_24DEDD560, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        wValue = (unint64_t)v21;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &input, &v59, 3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v22);
        *v15 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
        v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v23)
          -[IOUSBHostObject sendDeviceRequest:data:bytesTransferred:completionTimeout:error:].cold.2(v23, v24);

      }
      v25 = 0;
      goto LABEL_21;
    }
    v47 = error;
    v13 = -[NSMutableData mutableBytes](objc_retainAutorelease(v14), "mutableBytes");
  }
  else
  {
    v47 = error;
  }
  input = request.bmRequestType;
  bRequest = request.bRequest;
  wValue = request.wValue;
  wIndex = request.wIndex;
  v26 = &off_21B5E5000;
  LODWORD(v26) = vcvtad_u64_f64(completionTimeout * 1000.0);
  v55 = wLength;
  v56 = v26;
  v57 = v13;
  outputCnt = 1;
  output = 0;
  v27 = IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection", v47), 2u, &input, 7u, &output, &outputCnt);
  v28 = v27;
  if (bytesTransferred)
    *bytesTransferred = output;
  v25 = v27 == 0;
  if (v27)
  {
    if (v48)
    {
      v58[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Unable to send device request."), &stru_24DEDD560, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v30;
      v58[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v32;
      v58[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v34;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, v58, 3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v28, v35);
      *v48 = (id)objc_claimAutoreleasedReturnValue();
      v36 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v36)
        -[IOUSBHostObject sendDeviceRequest:data:bytesTransferred:completionTimeout:error:].cold.1(v36, v37);

    }
  }
  else if (*(unsigned __int16 *)&request.bmRequestType == 1792)
  {
    -[IOUSBHostObject descriptorCache](self, "descriptorCache");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v38);
    -[IOUSBHostObject descriptorCache](self, "descriptorCache");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = HIBYTE(request.wValue) | ((unint64_t)LOBYTE(request.wValue) << 8) | (*(_DWORD *)&request.wIndex << 16);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKey:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      -[IOUSBHostObject descriptorCache](self, "descriptorCache");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v40);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "removeObjectForKey:", v44);

      -[IOUSBHostObject invalidDescriptorCache](self, "invalidDescriptorCache");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "addObject:", v42);

    }
    objc_sync_exit(v38);

  }
LABEL_21:

  return v25;
}

- (BOOL)enqueueDeviceRequest:(IOUSBDeviceRequest)request error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  return -[IOUSBHostObject enqueueDeviceRequest:data:completionTimeout:error:completionHandler:](self, "enqueueDeviceRequest:data:completionTimeout:error:completionHandler:", request, 0, error, completionHandler, 5.0);
}

- (BOOL)enqueueDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  return -[IOUSBHostObject enqueueDeviceRequest:data:completionTimeout:error:completionHandler:](self, "enqueueDeviceRequest:data:completionTimeout:error:completionHandler:", request, data, error, completionHandler, 5.0);
}

- (BOOL)enqueueDeviceRequest:(IOUSBDeviceRequest)request data:(NSMutableData *)data completionTimeout:(NSTimeInterval)completionTimeout error:(NSError *)error completionHandler:(IOUSBHostCompletionHandler)completionHandler
{
  unint64_t wLength;
  NSMutableData *v13;
  IOUSBHostCompletionHandler v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  const char *v23;
  int v24;
  uint64_t v25;
  uint64_t (*__ptr32 *v26)();
  __int128 v27;
  uint64_t v28;
  mach_port_t v29;
  mach_port_t MachPort;
  kern_return_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL8 v39;
  const char *v40;
  BOOL v41;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSMutableData *v50;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t reference[2];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t input;
  uint64_t bRequest;
  uint64_t wValue;
  uint64_t wIndex;
  unint64_t v61;
  uint64_t (*__ptr32 *v62)();
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  wLength = request.wLength;
  v13 = data;
  v14 = completionHandler;
  v50 = v13;
  if (v13)
  {
    if (-[NSMutableData length](v13, "length") < wLength)
    {
      if (error)
      {
        input = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Unable to enqueue device request."), &stru_24DEDD560, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        reference[0] = (uint64_t)v16;
        bRequest = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Data buffer is smaller than request wLength."), &stru_24DEDD560, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        reference[1] = (uint64_t)v18;
        wValue = *MEMORY[0x24BDD0FF0];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("The wLength field of the request must be less than or equal to the data's length."), &stru_24DEDD560, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v54 = v20;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", reference, &input, 3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v21);
        *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
        v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v22)
          -[IOUSBHostObject enqueueDeviceRequest:data:completionTimeout:error:completionHandler:].cold.2(v22, v23);

      }
      v24 = -536870174;
      if (!error)
        goto LABEL_20;
      goto LABEL_17;
    }
    v25 = -[NSMutableData mutableBytes](objc_retainAutorelease(v13), "mutableBytes");
  }
  else
  {
    v25 = 0;
  }
  input = request.bmRequestType;
  bRequest = request.bRequest;
  wValue = request.wValue;
  wIndex = request.wIndex;
  v26 = &off_21B5E5000;
  LODWORD(v26) = vcvtad_u64_f64(completionTimeout * 1000.0);
  v61 = wLength;
  v62 = v26;
  v63 = v25;
  outputCnt = 1;
  output = 0;
  *(_QWORD *)&v27 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v55 = v27;
  v56 = v27;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  v54 = v27;
  reference[1] = (uint64_t)_ioCompletionCallback_1;
  if (v14)
  {
    v28 = MEMORY[0x220763B3C](v14);

  }
  else
  {
    v28 = 0;
  }
  *(_QWORD *)&v54 = v28;
  v29 = -[IOUSBHostObject ioConnection](self, "ioConnection");
  MachPort = IONotificationPortGetMachPort(-[IOUSBHostObject ioNotificationPortRef](self, "ioNotificationPortRef"));
  v31 = IOConnectCallAsyncScalarMethod(v29, 2u, MachPort, reference, 3u, &input, 7u, &output, &outputCnt);
  v24 = v31;
  if (v31)
  {
    v14 = (IOUSBHostCompletionHandler)v54;
    if ((_QWORD)v54)
    {
      if (error)
      {
LABEL_17:
        input = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Unable to enqueue device request."), &stru_24DEDD560, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        reference[0] = (uint64_t)v33;
        bRequest = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        reference[1] = (uint64_t)v35;
        wValue = *MEMORY[0x24BDD0FF0];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&v54 = v37;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", reference, &input, 3);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v24, v38);
        *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
        v39 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v39)
          -[IOUSBHostObject enqueueDeviceRequest:data:completionTimeout:error:completionHandler:].cold.1(v39, v40);

      }
LABEL_20:
      v41 = 0;
      goto LABEL_21;
    }
  }
  if (v31)
  {
    v14 = 0;
    if (error)
      goto LABEL_17;
    goto LABEL_20;
  }
  if (*(unsigned __int16 *)&request.bmRequestType != 1792)
  {
    v41 = 1;
    goto LABEL_22;
  }
  -[IOUSBHostObject descriptorCache](self, "descriptorCache");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v43);
  -[IOUSBHostObject descriptorCache](self, "descriptorCache");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = HIBYTE(request.wValue) | ((unint64_t)LOBYTE(request.wValue) << 8) | (*(_DWORD *)&request.wIndex << 16);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectForKey:", v46);
  v14 = (IOUSBHostCompletionHandler)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[IOUSBHostObject descriptorCache](self, "descriptorCache");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v45);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "removeObjectForKey:", v48);

    -[IOUSBHostObject invalidDescriptorCache](self, "invalidDescriptorCache");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v14);

  }
  objc_sync_exit(v43);

  v41 = 1;
LABEL_21:

LABEL_22:
  return v41;
}

- (BOOL)abortDeviceRequestsWithError:(NSError *)error
{
  return -[IOUSBHostObject abortDeviceRequestsWithOption:error:](self, "abortDeviceRequestsWithOption:error:", 0, error);
}

- (BOOL)abortDeviceRequestsWithOption:(IOUSBHostAbortOption)option error:(NSError *)error
{
  kern_return_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  const char *v14;
  uint64_t v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v5 = IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection", option), 3u, &v16, 1u, 0, 0);
  if (v5 && error)
  {
    v17[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Failed to abort device requests."), &stru_24DEDD560, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v17[1] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v9;
    v17[2] = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v5, v12);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v13)
      -[IOUSBHostObject abortDeviceRequestsWithOption:error:].cold.1(v13, v14);

  }
  return v5 == 0;
}

- (const)descriptorWithType:(tIOUSBDescriptorType)type length:(NSUInteger *)length error:(NSError *)error
{
  return -[IOUSBHostObject descriptorWithType:length:index:languageID:requestType:requestRecipient:error:](self, "descriptorWithType:length:index:languageID:requestType:requestRecipient:error:", *(_QWORD *)&type, length, 0, 0, 0, 0, error);
}

- (const)descriptorWithType:(tIOUSBDescriptorType)type length:(NSUInteger *)length index:(NSUInteger)index languageID:(NSUInteger)languageID error:(NSError *)error
{
  return -[IOUSBHostObject descriptorWithType:length:index:languageID:requestType:requestRecipient:error:](self, "descriptorWithType:length:index:languageID:requestType:requestRecipient:error:", *(_QWORD *)&type, length, index, languageID, 0, 0, error);
}

- (const)descriptorWithType:(tIOUSBDescriptorType)type length:(NSUInteger *)length index:(NSUInteger)index languageID:(NSUInteger)languageID requestType:(tIOUSBDeviceRequestTypeValue)requestType requestRecipient:(tIOUSBDeviceRequestRecipientValue)requestRecipient error:(NSError *)error
{
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;
  const IOUSBDescriptor *v21;
  kern_return_t v22;
  kern_return_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL8 v35;
  const char *v36;
  uint32_t outputCnt;
  size_t v41;
  uint64_t outputStruct;
  uint64_t output;
  uint64_t input[5];
  _QWORD v45[3];
  _QWORD v46[5];

  v46[3] = *MEMORY[0x24BDAC8D0];
  *length = 0;
  v41 = -3;
  outputStruct = 0;
  -[IOUSBHostObject descriptorCache](self, "descriptorCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v14);
  -[IOUSBHostObject descriptorCache](self, "descriptorCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = type;
  v17 = type | ((unint64_t)index << 8) | ((_DWORD)languageID << 16);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v14);
  if (v19)
  {
    v20 = objc_retainAutorelease(v19);
    v21 = (const IOUSBDescriptor *)objc_msgSend(v20, "bytes");
    *length = objc_msgSend(v20, "length");
  }
  else
  {
    input[0] = v16;
    input[1] = index;
    input[2] = languageID;
    input[3] = requestType;
    input[4] = requestRecipient;
    output = 0;
    outputCnt = 1;
    v22 = IOConnectCallMethod(-[IOUSBHostObject ioConnection](self, "ioConnection"), 4u, input, 5u, 0, 0, &output, &outputCnt, &outputStruct, &v41);
    v23 = v22;
    if (!outputStruct)
      goto LABEL_11;
    if (v22)
    {
      v21 = 0;
    }
    else
    {
      -[IOUSBHostObject descriptorCache](self, "descriptorCache");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v24);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", outputStruct, v41);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        -[IOUSBHostObject descriptorCache](self, "descriptorCache");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v17);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKey:", v25, v27);

        v21 = (const IOUSBDescriptor *)objc_msgSend(objc_retainAutorelease(v25), "bytes");
        *length = (unsigned __int16)output;
      }
      else
      {
        v21 = 0;
      }

      objc_sync_exit(v24);
    }
    MEMORY[0x220763C74](*MEMORY[0x24BDAEC58]);
    if (!v21)
    {
LABEL_11:
      if (error)
      {
        v45[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Failed to get descriptor."), &stru_24DEDD560, 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = v29;
        v45[1] = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Requested descriptor likely does not exist."), &stru_24DEDD560, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v46[1] = v31;
        v45[2] = *MEMORY[0x24BDD0FF0];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v46[2] = v33;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v23, v34);
        *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
        v35 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v35)
          -[IOUSBHostObject descriptorWithType:length:index:languageID:requestType:requestRecipient:error:].cold.1(v35, v36);

      }
      v21 = 0;
    }
  }

  return v21;
}

- (const)capabilityDescriptors
{
  const IOUSBBOSDescriptor *result;
  unint64_t v3;

  v3 = 0;
  result = -[IOUSBHostObject descriptorWithType:length:error:](self, "descriptorWithType:length:error:", 15, &v3, 0);
  if (result)
  {
    if (v3 < result->bLength)
      return 0;
  }
  return result;
}

- (const)configurationDescriptorWithIndex:(NSUInteger)index error:(NSError *)error
{
  const IOUSBConfigurationDescriptor *result;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  const char *v14;
  unint64_t v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  result = -[IOUSBHostObject descriptorWithType:length:index:languageID:error:](self, "descriptorWithType:length:index:languageID:error:", 2, &v15, index, 0, error);
  if (result && v15 < result->wTotalLength)
  {
    if (error)
    {
      v16[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Unable to get configuration descriptor."), &stru_24DEDD560, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v7;
      v16[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("The length is less than descriptor's wTotalLength."), &stru_24DEDD560, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v9;
      v16[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870911, v12);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v13)
        -[IOUSBHostObject configurationDescriptorWithIndex:error:].cold.1(v13, v14);

    }
    return 0;
  }
  return result;
}

- (const)configurationDescriptorWithConfigurationValue:(NSUInteger)configurationValue error:(NSError *)error
{
  uint64_t v7;
  const IOUSBConfigurationDescriptor *result;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (!configurationValue)
  {
    if (error)
    {
      v26 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Failed to get configuration descriptor."), &stru_24DEDD560, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v19;
      v27 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("ConfigurationValue of 0 is invalid"), &stru_24DEDD560, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v21;
      v28 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v26, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870911, v15);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v24)
        -[IOUSBHostObject configurationDescriptorWithConfigurationValue:error:].cold.1(v24, v25);
      goto LABEL_13;
    }
    return 0;
  }
  if (!(_BYTE)-[IOUSBHostObject deviceDescriptor](self, "deviceDescriptor")[17])
  {
LABEL_7:
    if (error)
    {
      v26 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Failed to get configuration descriptor."), &stru_24DEDD560, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v10;
      v27 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Unable to find configuration descriptor with specified value"), &stru_24DEDD560, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v12;
      v28 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v26, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870160, v15);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v16)
        -[IOUSBHostObject configurationDescriptorWithConfigurationValue:error:].cold.2(v16, v17);
LABEL_13:

      return 0;
    }
    return 0;
  }
  v7 = 0;
  while (1)
  {
    result = -[IOUSBHostObject configurationDescriptorWithIndex:error:](self, "configurationDescriptorWithIndex:error:", v7, error);
    if (result)
    {
      if (result->bConfigurationValue == configurationValue)
        return result;
    }
    if (++v7 >= (unint64_t)-[IOUSBHostObject deviceDescriptor](self, "deviceDescriptor")[17])
      goto LABEL_7;
  }
}

- (const)stringWithIndex:(NSUInteger)index error:(NSError *)error
{
  return -[IOUSBHostObject stringWithIndex:languageID:error:](self, "stringWithIndex:languageID:error:", index, 1033, error);
}

- (const)stringWithIndex:(NSUInteger)index languageID:(NSUInteger)languageID error:(NSError *)error
{
  const IOUSBDescriptor *v5;
  void *v6;
  unint64_t bLength;
  unint64_t v9;

  v9 = 0;
  v5 = -[IOUSBHostObject descriptorWithType:length:index:languageID:error:](self, "descriptorWithType:length:index:languageID:error:", 3, &v9, index, languageID, error);
  v6 = 0;
  if (v5 && v9 >= 3)
  {
    bLength = v5->bLength;
    if (v9 < bLength)
      return (const NSString *)0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v5[1], (bLength - 2) >> 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (const NSString *)v6;
}

- (uint64_t)frameNumberWithTime:(IOUSBHostTime *)time
{
  kern_return_t v4;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  IOUSBHostTime v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  output = 0xAAAAAAAAAAAAAAAALL;
  v8 = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 2;
  v4 = IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection"), 7u, 0, 0, &output, &outputCnt);
  result = 0;
  if (!v4)
  {
    result = output;
    if (time)
      *time = v8;
  }
  return result;
}

- (NSMutableData)ioDataWithCapacity:(NSUInteger)capacity error:(NSError *)error
{
  kern_return_t v7;
  uint64_t v8;
  kern_return_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  const char *v18;
  IOBufferMutableData *v19;
  IOBufferMutableData *v21;
  _QWORD v22[5];
  uint32_t outputCnt;
  uint64_t v24;
  uint64_t input;
  uint64_t output;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  input = capacity;
  output = 0;
  outputCnt = 1;
  v7 = IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection"), 8u, &input, 1u, &output, &outputCnt);
  if (!v7)
  {
    v28[0] = 0xAAAAAAAAAAAAAAAALL;
    v27[0] = 0xAAAAAAAAAAAAAAAALL;
    v8 = -[IOUSBHostObject ioConnection](self, "ioConnection");
    v9 = MEMORY[0x22076386C](v8, output, *MEMORY[0x24BDAEC58], v28, v27, 1);
    if (!v9)
    {
      v21 = [IOBufferMutableData alloc];
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __44__IOUSBHostObject_ioDataWithCapacity_error___block_invoke;
      v22[3] = &unk_24DEDCBF0;
      v22[4] = self;
      v19 = -[IOBufferMutableData initWithBytesNoCopy:length:bufferID:deallocator:](v21, "initWithBytesNoCopy:length:bufferID:deallocator:", v28[0], capacity, output, v22);
      if (v19)
        return (NSMutableData *)v19;
      v7 = 0;
      if (error)
        goto LABEL_5;
      goto LABEL_8;
    }
    v7 = v9;
    v24 = output;
    IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection"), 9u, &v24, 1u, 0, 0);
  }
  if (error)
  {
LABEL_5:
    v27[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Unable to allocate IOData Buffer."), &stru_24DEDD560, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v11;
    v27[1] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v13;
    v27[2] = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v7, v16);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v17)
      -[IOUSBHostObject ioDataWithCapacity:error:].cold.1(v17, v18);

  }
LABEL_8:
  v19 = 0;
  return (NSMutableData *)v19;
}

uint64_t __44__IOUSBHostObject_ioDataWithCapacity_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "ioConnection");
  v6 = objc_msgSend(v4, "bufferID");
  v7 = *MEMORY[0x24BDAEC58];
  v8 = objc_retainAutorelease(v4);
  MEMORY[0x220763890](v5, v6, v7, objc_msgSend(v8, "bytes"));
  LODWORD(v5) = objc_msgSend(v8, "bufferID");

  return IOConnectCallScalarMethod(objc_msgSend(*(id *)(a1 + 32), "ioConnection", v5, v11), 9u, &v10, 1u, 0, 0);
}

- (NSUInteger)deviceAddress
{
  uint64_t v3;
  uint64_t v4;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  v3 = IOConnectCallScalarMethod(-[IOUSBHostObject ioConnection](self, "ioConnection"), 5u, 0, 0, &output, &outputCnt);
  if (!(_DWORD)v3)
    return (unsigned __int16)output;
  v4 = v3;
  if ((-[IOUSBHostObject debugLoggingMask](self, "debugLoggingMask") & 1) != 0)
    NSLog(CFSTR("[Line %d of %s] %sconnect call failed with 0x%x"), 931, "/Library/Caches/com.apple.xbs/Sources/IOUSBHostFamily/IOUSBHostFramework/IOUSBHostObject.m", "-[IOUSBHostObject deviceAddress]", v4);
  return 0;
}

- (io_service_t)ioService
{
  return self->_ioService;
}

- (void)setIoService:(unsigned int)a3
{
  self->_ioService = a3;
}

- (dispatch_queue_t)queue
{
  return (dispatch_queue_t)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (const)deviceDescriptor
{
  return self->_deviceDescriptor;
}

- (void)setDeviceDescriptor:(const IOUSBDeviceDescriptor *)a3
{
  self->_deviceDescriptor = a3;
}

- (unint64_t)debugLoggingMask
{
  return self->_debugLoggingMask;
}

- (void)setDebugLoggingMask:(unint64_t)a3
{
  self->_debugLoggingMask = a3;
}

- (unsigned)ioConnection
{
  return self->_ioConnection;
}

- (void)setIoConnection:(unsigned int)a3
{
  self->_ioConnection = a3;
}

- (IONotificationPort)ioNotificationPortRef
{
  return self->_ioNotificationPortRef;
}

- (void)setIoNotificationPortRef:(IONotificationPort *)a3
{
  self->_ioNotificationPortRef = a3;
}

- (IOUSBHostInterestNotifier)interestNotifier
{
  return self->_interestNotifier;
}

- (void)setInterestNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_interestNotifier, a3);
}

- (id)interestHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setInterestHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSMutableSet)invalidDescriptorCache
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInvalidDescriptorCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableDictionary)descriptorCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDescriptorCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSArray)supportedStringLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSupportedStringLanguages:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedStringLanguages, 0);
  objc_storeStrong((id *)&self->_descriptorCache, 0);
  objc_storeStrong((id *)&self->_invalidDescriptorCache, 0);
  objc_storeStrong(&self->_interestHandler, 0);
  objc_storeStrong((id *)&self->_interestNotifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostObject."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Failed [super init]"), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.2(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostObject."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Unable to allocateNSMutableSet."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.3(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostObject."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Unable to allocate NSMutableDictionary."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.4(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostObject."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Unable to allocate dispatch queue."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.5(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostObject."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Unable to create IONotificationPort port."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.6(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostObject."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Unable to obtain device descriptor."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithIOService:(uint64_t)a1 options:(const char *)a2 queue:error:interestHandler:.cold.7(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostObject."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Unable to create IOUSBHostInterestNotifier"), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithIOService:(void *)a1 options:(const char *)a2 queue:error:interestHandler:.cold.8(void *a1, const char *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostObject."), a2);
  v3 = objc_retainAutorelease(a1);
  OUTLINED_FUNCTION_2(v3, v4);
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v5, "Error:%s with reason: %s", v6, v7, v8, v9, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)openWithOptions:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Unable to open io_service_t object and create user client."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Exclusive open of usb object failed."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)openWithOptions:(uint64_t)a1 error:(const char *)a2 .cold.2(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Unable to open io_service_t object and create user client."), a2);
  OUTLINED_FUNCTION_2(CFSTR("IOServiceOpen failed."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)sendDeviceRequest:(uint64_t)a1 data:(const char *)a2 bytesTransferred:completionTimeout:error:.cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Unable to send device request."), a2);
  OUTLINED_FUNCTION_2(0, v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)sendDeviceRequest:(uint64_t)a1 data:(const char *)a2 bytesTransferred:completionTimeout:error:.cold.2(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Unable to send device request."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Data buffer is smaller than request wLength."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)enqueueDeviceRequest:(uint64_t)a1 data:(const char *)a2 completionTimeout:error:completionHandler:.cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Unable to enqueue device request."), a2);
  OUTLINED_FUNCTION_2(0, v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)enqueueDeviceRequest:(uint64_t)a1 data:(const char *)a2 completionTimeout:error:completionHandler:.cold.2(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Unable to enqueue device request."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Data buffer is smaller than request wLength."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)abortDeviceRequestsWithOption:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to abort device requests."), a2);
  OUTLINED_FUNCTION_2(0, v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)descriptorWithType:(uint64_t)a1 length:(const char *)a2 index:languageID:requestType:requestRecipient:error:.cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to get descriptor."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Requested descriptor likely does not exist."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)configurationDescriptorWithIndex:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Unable to get configuration descriptor."), a2);
  OUTLINED_FUNCTION_2(CFSTR("The length is less than descriptor's wTotalLength."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)configurationDescriptorWithConfigurationValue:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to get configuration descriptor."), a2);
  OUTLINED_FUNCTION_2(CFSTR("ConfigurationValue of 0 is invalid"), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)configurationDescriptorWithConfigurationValue:(uint64_t)a1 error:(const char *)a2 .cold.2(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to get configuration descriptor."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Unable to find configuration descriptor with specified value"), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)ioDataWithCapacity:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Unable to allocate IOData Buffer."), a2);
  OUTLINED_FUNCTION_2(0, v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

@end

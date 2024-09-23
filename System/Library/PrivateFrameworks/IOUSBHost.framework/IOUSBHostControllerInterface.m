@implementation IOUSBHostControllerInterface

- (IOUSBHostControllerInterface)initWithCapabilities:(NSData *)capabilities queue:(dispatch_queue_t)queue interruptRateHz:(NSUInteger)interruptRateHz error:(NSError *)error commandHandler:(IOUSBHostControllerInterfaceCommandHandler)commandHandler doorbellHandler:(IOUSBHostControllerInterfaceDoorbellHandler)doorbellHandler interestHandler:(IOServiceInterestCallback)interestHandler
{
  NSData *v15;
  NSObject *v16;
  IOUSBHostControllerInterfaceCommandHandler v17;
  IOUSBHostControllerInterfaceDoorbellHandler v18;
  IOUSBHostControllerInterface *v19;
  objc_class *v20;
  id v21;
  os_log_t v22;
  uint64_t v23;
  NSData *capabilitiesData;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  const char *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL8 v41;
  const char *v42;
  IOUSBHostControllerInterface *v43;
  IOUSBHostCIControllerStateMachine *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_class *v49;
  void *v50;
  id v51;
  dispatch_queue_t v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _BOOL8 v67;
  const char *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _BOOL8 v75;
  const char *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  _BOOL8 v83;
  const char *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  _BOOL8 v91;
  const char *v92;
  void *v93;
  const __CFDictionary *v94;
  io_service_t MatchingService;
  io_object_t v96;
  id v97;
  void *v98;
  void *v99;
  const void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  _BOOL8 v107;
  const char *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  _BOOL8 v115;
  const char *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  _BOOL8 v123;
  const char *v124;
  mach_port_t v125;
  NSData *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  _BOOL8 v133;
  const char *v134;
  CFMutableDictionaryRef v135;
  void *v136;
  void *v137;
  void *v138;
  IOUSBHostInterestNotifier *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  _BOOL8 v147;
  const char *v148;
  void *v149;
  objc_class *v150;
  void *v151;
  id v152;
  dispatch_queue_t v153;
  void *v154;
  IONotificationPort *v155;
  NSObject *v156;
  uint64_t v157;
  void *v158;
  uint64_t v159;
  NSObject *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  _BOOL8 v169;
  const char *v170;
  void *v171;
  void *v172;
  NSData *v173;
  NSObject *v174;
  IOUSBHostControllerInterfaceCommandHandler v175;
  void *v176;
  objc_super v177;
  const __CFString *v178;
  void *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  __int128 connect;
  void *v184;
  uint64_t v185;

  v185 = *MEMORY[0x24BDAC8D0];
  v15 = capabilities;
  v16 = queue;
  v17 = commandHandler;
  v18 = doorbellHandler;
  v177.receiver = self;
  v177.super_class = (Class)IOUSBHostControllerInterface;
  v19 = -[IOUSBHostControllerInterface init](&v177, sel_init);
  v176 = v18;
  if (!v19)
  {
    if (error)
    {
      v173 = v15;
      v175 = v17;
      v25 = v16;
      v180 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostControllerInterface."), &stru_24DEDD560, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&connect = v36;
      v181 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Unable to allocate memory."), &stru_24DEDD560, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&connect + 1) = v38;
      v182 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = v40;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &connect, &v180, 3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870211, v32);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v41 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v41)
        -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.1(v41, v42);
      goto LABEL_13;
    }
LABEL_15:
    -[IOUSBHostControllerInterface destroy](v19, "destroy");
    v43 = 0;
    goto LABEL_16;
  }
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22 = os_log_create("com.apple.iokit.usb.framework.IOUSBHost", (const char *)objc_msgSend(v21, "cStringUsingEncoding:", 4));
  -[IOUSBHostControllerInterface setLog:](v19, "setLog:", v22);

  -[IOUSBHostControllerInterface setInterruptRateHz:](v19, "setInterruptRateHz:", interruptRateHz);
  -[IOUSBHostControllerInterface setCommandHandler:](v19, "setCommandHandler:", v17);
  -[IOUSBHostControllerInterface setDoorbellHandler:](v19, "setDoorbellHandler:", v18);
  -[IOUSBHostControllerInterface setInterestHandler:](v19, "setInterestHandler:", interestHandler);
  if (-[NSData length](v15, "length") >= 0x10 && (-[NSData length](v15, "length") & 0xF) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v15);
    v23 = objc_claimAutoreleasedReturnValue();
    capabilitiesData = v19->_capabilitiesData;
    v19->_capabilitiesData = (NSData *)v23;

    -[IOUSBHostControllerInterface setCapabilities:](v19, "setCapabilities:", -[NSData bytes](v19->_capabilitiesData, "bytes"));
  }
  if (!-[IOUSBHostControllerInterface capabilities](v19, "capabilities")
    || (*(_BYTE *)-[IOUSBHostControllerInterface capabilities](v19, "capabilities") & 0x3F) != 0)
  {
    if (error)
    {
      v173 = v15;
      v175 = v17;
      v25 = v16;
      v180 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostControllerInterface."), &stru_24DEDD560, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&connect = v27;
      v181 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Capabilities are not valid."), &stru_24DEDD560, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&connect + 1) = v29;
      v182 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = v31;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &connect, &v180, 3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v32);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v33)
        -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.2(v33, v34);
LABEL_13:

      v16 = v25;
      v15 = v173;
LABEL_14:
      v17 = v175;
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  v45 = -[IOUSBHostCIControllerStateMachine initWithInterface:error:]([IOUSBHostCIControllerStateMachine alloc], "initWithInterface:error:", v19, error);
  -[IOUSBHostControllerInterface setControllerStateMachine:](v19, "setControllerStateMachine:", v45);

  -[IOUSBHostControllerInterface controllerStateMachine](v19, "controllerStateMachine");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v46)
    goto LABEL_15;
  v174 = v16;
  v175 = v17;
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 0x10000);
  -[IOUSBHostControllerInterface setInterrupts:](v19, "setInterrupts:", v47);

  v48 = (void *)MEMORY[0x24BDD17C8];
  v49 = (objc_class *)objc_opt_class();
  NSStringFromClass(v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.iokit.usb.framework.IOUSBHost"), v50);
  v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v52 = dispatch_queue_create((const char *)objc_msgSend(v51, "UTF8String"), 0);
  -[IOUSBHostControllerInterface setInterruptQueue:](v19, "setInterruptQueue:", v52);

  v53 = objc_alloc_init(MEMORY[0x24BDD1788]);
  -[IOUSBHostControllerInterface setInterruptLock:](v19, "setInterruptLock:", v53);

  -[IOUSBHostControllerInterface interrupts](v19, "interrupts");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v54)
  {
    if (error)
    {
      v180 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostControllerInterface."), &stru_24DEDD560, 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&connect = v61;
      v181 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("Failed to allocate interruptData."), &stru_24DEDD560, 0);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&connect + 1) = v63;
      v182 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = v65;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &connect, &v180, 3);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870211, v66);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v67 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v67)
        -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.3(v67, v68);
      goto LABEL_56;
    }
LABEL_57:
    v16 = v174;
    goto LABEL_14;
  }
  -[IOUSBHostControllerInterface interruptQueue](v19, "interruptQueue");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v55)
  {
    v16 = v174;
    v17 = v175;
    if (!error)
      goto LABEL_15;
    v180 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostControllerInterface."), &stru_24DEDD560, 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&connect = v70;
    v181 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "localizedStringForKey:value:table:", CFSTR("Failed to allocate interruptQueue."), &stru_24DEDD560, 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&connect + 1) = v72;
    v182 = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = v74;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &connect, &v180, 3);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870211, v66);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v75 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v75)
      -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.4(v75, v76);
    goto LABEL_56;
  }
  -[IOUSBHostControllerInterface interruptLock](v19, "interruptLock");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v174;
  v17 = v175;
  if (!v56)
  {
    if (!error)
      goto LABEL_15;
    v180 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostControllerInterface."), &stru_24DEDD560, 0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&connect = v78;
    v181 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "localizedStringForKey:value:table:", CFSTR("Failed to allocate interruptLock."), &stru_24DEDD560, 0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&connect + 1) = v80;
    v182 = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = v82;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &connect, &v180, 3);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870211, v66);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v83 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v83)
      -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.5(v83, v84);
    goto LABEL_56;
  }
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 4096);
  -[IOUSBHostControllerInterface setDoorbells:](v19, "setDoorbells:", v57);

  -[IOUSBHostControllerInterface doorbells](v19, "doorbells");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v58)
  {
    if (error)
    {
      v180 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostControllerInterface."), &stru_24DEDD560, 0);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&connect = v85;
      v181 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "localizedStringForKey:value:table:", CFSTR("Unable to allocate memory for doorbells."), &stru_24DEDD560, 0);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&connect + 1) = v87;
      v182 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = v89;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &connect, &v180, 3);
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870211, v90);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v91 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v91)
        -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.12(v91, v92);

      v16 = v174;
      v17 = v175;
    }
    -[IOUSBHostControllerInterface doorbells](v19, "doorbells");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setLength:", 4096);

    goto LABEL_15;
  }
  -[IOUSBHostControllerInterface doorbells](v19, "doorbells");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setLength:", 4096);

  v94 = IOServiceMatching("AppleUSBUserHCIResources");
  if (v94)
  {
    MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v94);
    if (MatchingService)
    {
      v96 = MatchingService;
      LODWORD(connect) = 0;
      IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, (io_connect_t *)&connect);
      -[IOUSBHostControllerInterface setIoConnect:](v19, "setIoConnect:", connect);
      IOObjectRelease(v96);
    }
  }
  if (!-[IOUSBHostControllerInterface ioConnect](v19, "ioConnect"))
  {
    if (!error)
      goto LABEL_15;
    v180 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostControllerInterface."), &stru_24DEDD560, 0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&connect = v110;
    v181 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "localizedStringForKey:value:table:", CFSTR("Unable to connect to the kernel."), &stru_24DEDD560, 0);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&connect + 1) = v112;
    v182 = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = v114;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &connect, &v180, 3);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870195, v66);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v115 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v115)
      -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.6(v115, v116);
    goto LABEL_56;
  }
  v97 = objc_alloc_init(MEMORY[0x24BDD1880]);
  -[IOUSBHostControllerInterface setUuid:](v19, "setUuid:", v97);

  -[IOUSBHostControllerInterface uuid](v19, "uuid");
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v98)
  {
    if (!error)
      goto LABEL_15;
    v180 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostControllerInterface."), &stru_24DEDD560, 0);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&connect = v118;
    v181 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "localizedStringForKey:value:table:", CFSTR("Failed to create UUID."), &stru_24DEDD560, 0);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&connect + 1) = v120;
    v182 = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = v122;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &connect, &v180, 3);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870211, v66);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v123 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v123)
      -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.7(v123, v124);
    goto LABEL_56;
  }
  -[IOUSBHostControllerInterface uuid](v19, "uuid");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "UUIDString");
  v100 = (const void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v99) = IOConnectSetCFProperty(-[IOUSBHostControllerInterface ioConnect](v19, "ioConnect"), CFSTR("IOUSBHostControllerInterfaceUUID"), v100);
  CFRelease(v100);
  if ((_DWORD)v99)
  {
    if (!error)
      goto LABEL_14;
    v180 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostControllerInterface."), &stru_24DEDD560, 0);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&connect = v102;
    v181 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "localizedStringForKey:value:table:", CFSTR("Unable to set UUID property."), &stru_24DEDD560, 0);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&connect + 1) = v104;
    v182 = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = v106;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &connect, &v180, 3);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v66);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v107 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v107)
      -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.11(v107, v108);
    goto LABEL_56;
  }
  v125 = -[IOUSBHostControllerInterface ioConnect](v19, "ioConnect");
  v126 = objc_retainAutorelease(v15);
  if (IOConnectCallStructMethod(v125, 2u, -[NSData bytes](v126, "bytes"), -[NSData length](v126, "length"), 0, 0))
  {
    if (error)
    {
      v180 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostControllerInterface."), &stru_24DEDD560, 0);
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&connect = v128;
      v181 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "localizedStringForKey:value:table:", CFSTR("Capabilities structure was rejected."), &stru_24DEDD560, 0);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&connect + 1) = v130;
      v182 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = v132;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &connect, &v180, 3);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v66);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v133 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v133)
        -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.10(v133, v134);
LABEL_56:

      goto LABEL_57;
    }
    goto LABEL_57;
  }
  v135 = IOServiceMatching("IOUserClient");
  v178 = CFSTR("IOUSBHostControllerInterfaceUUID");
  -[IOUSBHostControllerInterface uuid](v19, "uuid");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "UUIDString");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = v137;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary setObject:forKeyedSubscript:](v135, "setObject:forKeyedSubscript:", v138, CFSTR("IOPropertyMatch"));

  v139 = -[IOUSBHostInterestNotifier initWithOwner:matchingDictionary:callback:]([IOUSBHostInterestNotifier alloc], "initWithOwner:matchingDictionary:callback:", v19, v135, _internalInterestCallback);
  -[IOUSBHostControllerInterface setInterestNotifier:](v19, "setInterestNotifier:", v139);

  -[IOUSBHostControllerInterface interestNotifier](v19, "interestNotifier");
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v140)
  {
    v17 = v175;
    if (error)
    {
      v180 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostControllerInterface."), &stru_24DEDD560, 0);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&connect = v141;
      v181 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "localizedStringForKey:value:table:", CFSTR("Unable to create interest notifier."), &stru_24DEDD560, 0);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&connect + 1) = v143;
      v182 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = v145;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &connect, &v180, 3);
      v146 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870212, v146);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v147 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v147)
        -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.8(v147, v148);

      v17 = v175;
    }

    v16 = v174;
    goto LABEL_15;
  }

  v16 = v174;
  v17 = v175;
  if (v174)
  {
    -[IOUSBHostControllerInterface setQueue:](v19, "setQueue:", v174);
  }
  else
  {
    v149 = (void *)MEMORY[0x24BDD17C8];
    v150 = (objc_class *)objc_opt_class();
    NSStringFromClass(v150);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.iokit.usb.framework.IOUSBHost"), v151);
    v152 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v153 = dispatch_queue_create((const char *)objc_msgSend(v152, "UTF8String"), 0);
    -[IOUSBHostControllerInterface setQueue:](v19, "setQueue:", v153);

    v16 = 0;
    v17 = v175;
  }
  -[IOUSBHostControllerInterface queue](v19, "queue");
  v154 = (void *)objc_claimAutoreleasedReturnValue();

  if (v154)
  {
    -[IOUSBHostControllerInterface setNotificationPortRef:](v19, "setNotificationPortRef:", IONotificationPortCreate(*MEMORY[0x24BDD8B18]));
    if (-[IOUSBHostControllerInterface notificationPortRef](v19, "notificationPortRef"))
    {
      v155 = -[IOUSBHostControllerInterface notificationPortRef](v19, "notificationPortRef");
      -[IOUSBHostControllerInterface queue](v19, "queue");
      v156 = objc_claimAutoreleasedReturnValue();
      IONotificationPortSetDispatchQueue(v155, v156);

      v17 = v175;
    }
  }
  -[IOUSBHostControllerInterface queue](v19, "queue");
  v157 = objc_claimAutoreleasedReturnValue();
  if (!v157
    || (v158 = (void *)v157,
        v159 = -[IOUSBHostControllerInterface notificationPortRef](v19, "notificationPortRef"),
        v158,
        !v159))
  {
    if (!error)
      goto LABEL_15;
    v180 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostControllerInterface."), &stru_24DEDD560, 0);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&connect = v164;
    v181 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v165, "localizedStringForKey:value:table:", CFSTR("Unable to create notification port."), &stru_24DEDD560, 0);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&connect + 1) = v166;
    v182 = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = v168;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &connect, &v180, 3);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870211, v66);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v169 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v169)
      -[IOUSBHostControllerInterface initWithCapabilities:queue:interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:].cold.9(v169, v170);
    goto LABEL_56;
  }
  if (!-[IOUSBHostControllerInterface commandAsyncCallbackWithResult:error:](v19, "commandAsyncCallbackWithResult:error:", 3758096385, error)|| !-[IOUSBHostControllerInterface doorbellAsyncCallbacKWithResult:length:error:](v19, "doorbellAsyncCallbacKWithResult:length:error:", 3758096385, 0, error))
  {
    goto LABEL_15;
  }
  -[IOUSBHostControllerInterface log](v19, "log");
  v160 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v160, OS_LOG_TYPE_INFO))
  {
    -[IOUSBHostControllerInterface uuid](v19, "uuid");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "UUIDString");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(connect) = 138412290;
    *(_QWORD *)((char *)&connect + 4) = v162;
    _os_log_impl(&dword_21B5CC000, v160, OS_LOG_TYPE_INFO, "created IOUSBHostControllerInterface with UUID %@", (uint8_t *)&connect, 0xCu);

  }
  v43 = v19;
  v17 = v175;
LABEL_16:

  return v43;
}

- (void)dealloc
{
  objc_super v3;

  -[IOUSBHostControllerInterface destroy](self, "destroy");
  v3.receiver = self;
  v3.super_class = (Class)IOUSBHostControllerInterface;
  -[IOUSBHostControllerInterface dealloc](&v3, sel_dealloc);
}

- (void)destroy
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  IOUSBHostControllerInterface *v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  void *v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  BOOL v17;
  _QWORD v18[4];
  NSObject *v19;
  __int128 *p_buf;
  _QWORD block[5];
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  IOUSBHostControllerInterface *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (!-[IOUSBHostControllerInterface destroyed](self, "destroyed"))
  {
    -[IOUSBHostControllerInterface log](self, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[IOUSBHostControllerInterface uuid](self, "uuid");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUIDString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_21B5CC000, v3, OS_LOG_TYPE_INFO, "destroying IOUSBHostControllerInterface with UUID %@", (uint8_t *)&buf, 0xCu);

    }
    -[IOUSBHostControllerInterface setDestroyed:](self, "setDestroyed:", 1);
    -[IOUSBHostControllerInterface interestNotifier](self, "interestNotifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

    if (!v7)
    {
      -[IOUSBHostControllerInterface interestNotifier](self, "interestNotifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "destroy");

      -[IOUSBHostControllerInterface setInterestNotifier:](self, "setInterestNotifier:", 0);
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy_;
    v25 = __Block_byref_object_dispose_;
    v26 = (IOUSBHostControllerInterface *)0xAAAAAAAAAAAAAAAALL;
    v9 = self;
    v10 = MEMORY[0x24BDAC760];
    v26 = v9;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__IOUSBHostControllerInterface_destroy__block_invoke;
    block[3] = &unk_24DEDCB28;
    block[4] = &buf;
    v11 = (void (**)(_QWORD))dispatch_block_create((dispatch_block_flags_t)0, block);
    -[IOUSBHostControllerInterface interruptQueue](v9, "interruptQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if (v13)
    {
      -[IOUSBHostControllerInterface queue](v9, "queue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 == 0;

      if (v17)
      {
        v11[2](v11);
        goto LABEL_11;
      }
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "queue");
      v15 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v15, v11);
    }
    else
    {
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "interruptQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      v18[0] = v10;
      v18[1] = 3221225472;
      v18[2] = __39__IOUSBHostControllerInterface_destroy__block_invoke_46;
      v18[3] = &unk_24DEDCB50;
      p_buf = &buf;
      v19 = v11;
      dispatch_async(v14, v18);

      v15 = v19;
    }

LABEL_11:
    _Block_object_dispose(&buf, 8);

  }
}

void __39__IOUSBHostControllerInterface_destroy__block_invoke(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setControllerStateMachine:", 0);
  for (i = 16; i != 144; i += 8)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v4 = *(void **)(v3 + i);
    *(_QWORD *)(v3 + i) = 0;

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "notificationPortRef"))
  {
    IONotificationPortDestroy((IONotificationPortRef)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "notificationPortRef"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setNotificationPortRef:", 0);
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "ioConnect"))
  {
    IOServiceClose(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "ioConnect"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setIoConnect:", 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setInterruptQueue:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setQueue:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_21B5CC000, v5, OS_LOG_TYPE_INFO, "destroyed IOUSBHostControllerInterface with UUID %@", (uint8_t *)&v10, 0xCu);

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

void __39__IOUSBHostControllerInterface_destroy__block_invoke_46(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "queue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v3, *(dispatch_block_t *)(a1 + 32));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (BOOL)enqueueInterrupt:(const IOUSBHostCIMessage *)interrupt error:(NSError *)error
{
  return -[IOUSBHostControllerInterface enqueueInterrupts:count:expedite:error:](self, "enqueueInterrupts:count:expedite:error:", interrupt, 1, 0, error);
}

- (BOOL)enqueueInterrupt:(const IOUSBHostCIMessage *)interrupt expedite:(BOOL)expedite error:(NSError *)error
{
  return -[IOUSBHostControllerInterface enqueueInterrupts:count:expedite:error:](self, "enqueueInterrupts:count:expedite:error:", interrupt, 1, expedite, error);
}

- (BOOL)enqueueInterrupts:(const IOUSBHostCIMessage *)interrupts count:(NSUInteger)count error:(NSError *)error
{
  return -[IOUSBHostControllerInterface enqueueInterrupts:count:expedite:error:](self, "enqueueInterrupts:count:expedite:error:", interrupts, count, 0, error);
}

- (BOOL)enqueueInterrupts:(const IOUSBHostCIMessage *)interrupts count:(NSUInteger)count expedite:(BOOL)expedite error:(NSError *)error
{
  _BOOL4 v7;
  int v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  unint64_t v19;
  unint64_t v20;
  const IOUSBHostCIMessage *v21;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  unsigned int v25;
  const IOUSBHostCIMessage *v26;
  int v27;
  os_log_type_t v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  void *v35;
  _BOOL8 v36;
  _BOOL8 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL8 v45;
  const char *v46;
  dispatch_time_t v47;
  unint64_t v48;
  dispatch_time_t v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  int v54;
  NSUInteger v55;
  NSUInteger v56;
  unint64_t v58;
  _QWORD block[5];
  _QWORD v60[5];
  _QWORD v61[3];
  __int128 buf;
  void *v63;
  uint64_t v64;

  v7 = expedite;
  v64 = *MEMORY[0x24BDAC8D0];
  if (-[IOUSBHostControllerInterface interruptRateHz](self, "interruptRateHz"))
    v10 = v7;
  else
    v10 = 1;
  -[IOUSBHostControllerInterface interruptLock](self, "interruptLock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lock");

  v12 = -[IOUSBHostControllerInterface interruptConsumerIndex](self, "interruptConsumerIndex");
  v13 = -[IOUSBHostControllerInterface interruptProducerIndex](self, "interruptProducerIndex");
  if (v12 <= -[IOUSBHostControllerInterface interruptProducerIndex](self, "interruptProducerIndex"))
    v14 = v12 - v13 + 4096;
  else
    v14 = v12 - -[IOUSBHostControllerInterface interruptProducerIndex](self, "interruptProducerIndex");
  v15 = v14 != 0;
  v16 = v14 - 1;
  if (v15)
    v17 = v16;
  else
    v17 = 0;
  if (v17 < count)
  {
    if (error)
    {
      v55 = v17;
      v61[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Failed to send interrupts."), &stru_24DEDD560, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = v39;
      v61[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("Not enough space for interrupts."), &stru_24DEDD560, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *((_QWORD *)&buf + 1) = v41;
      v61[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v43;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &buf, v61, 3);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870181, v44);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v45 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v45)
        -[IOUSBHostControllerInterface enqueueInterrupts:count:expedite:error:].cold.1(v45, v46);

      v17 = v55;
    }
  }
  else
  {
    v54 = v10;
    if (count)
    {
      v18 = 0;
      v56 = count;
      do
      {
        v19 = -[IOUSBHostControllerInterface interruptProducerIndex](self, "interruptProducerIndex");
        v58 = v19;
        if (v19 + count - v18 <= 0x1000)
          v20 = count - v18;
        else
          v20 = 4096 - v19;
        v21 = &interrupts[v18];
        -[IOUSBHostControllerInterface log](self, "log");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);

        if (v23 && v20)
        {
          v24 = 0;
          v25 = 1;
          do
          {
            v26 = &v21[v24];
            v27 = v26->control & 0x3F;
            if ((v27 - 16) >= 0x28 && v27 != 61 || (v26->control & 0xF00) == 256)
              v30 = OS_LOG_TYPE_DEBUG;
            else
              v30 = OS_LOG_TYPE_ERROR;
            -[IOUSBHostControllerInterface log](self, "log");
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, v30))
            {
              -[IOUSBHostControllerInterface descriptionForMessage:](self, "descriptionForMessage:", v26);
              v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v33 = objc_msgSend(v32, "cStringUsingEncoding:", 4);
              LODWORD(buf) = 136315138;
              *(_QWORD *)((char *)&buf + 4) = v33;
              _os_log_impl(&dword_21B5CC000, v31, v30, "interrupt %s", (uint8_t *)&buf, 0xCu);

            }
            v24 = v25;
          }
          while (v20 > v25++);
        }
        -[IOUSBHostControllerInterface interrupts](self, "interrupts");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "replaceBytesInRange:withBytes:", 16 * v58, 16 * v20, v21);

        -[IOUSBHostControllerInterface setInterruptProducerIndex:](self, "setInterruptProducerIndex:", ((_WORD)v20 + (_WORD)v58) & 0xFFF);
        v18 += v20;
        count = v56;
      }
      while (v18 < v56);
    }
    v36 = -[IOUSBHostControllerInterface interruptDeliveryPending](self, "interruptDeliveryPending");
    v37 = v36;
    if (v54)
    {
      -[IOUSBHostControllerInterface deliverInterrupts](self, "deliverInterrupts");
      -[IOUSBHostControllerInterface setInterruptDeliveryPending:](self, "setInterruptDeliveryPending:", v37);
    }
    else if (!v36)
    {
      v47 = dispatch_time(0, 1000000);
      v48 = -[IOUSBHostControllerInterface nextInterruptTime](self, "nextInterruptTime");
      -[IOUSBHostControllerInterface setInterruptDeliveryPending:](self, "setInterruptDeliveryPending:", 1);
      if (v47 >= v48)
      {
        -[IOUSBHostControllerInterface interruptQueue](self, "interruptQueue");
        v51 = objc_claimAutoreleasedReturnValue();
        v60[0] = MEMORY[0x24BDAC760];
        v60[1] = 3221225472;
        v60[2] = __71__IOUSBHostControllerInterface_enqueueInterrupts_count_expedite_error___block_invoke;
        v60[3] = &unk_24DEDCB78;
        v60[4] = self;
        dispatch_async(v51, v60);

      }
      else
      {
        v49 = -[IOUSBHostControllerInterface nextInterruptTime](self, "nextInterruptTime");
        -[IOUSBHostControllerInterface interruptQueue](self, "interruptQueue");
        v50 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __71__IOUSBHostControllerInterface_enqueueInterrupts_count_expedite_error___block_invoke_2;
        block[3] = &unk_24DEDCB78;
        block[4] = self;
        dispatch_after(v49, v50, block);

      }
    }
  }
  -[IOUSBHostControllerInterface interruptLock](self, "interruptLock");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "unlock");

  return v17 >= count;
}

uint64_t __71__IOUSBHostControllerInterface_enqueueInterrupts_count_expedite_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deliverInterrupts");
}

uint64_t __71__IOUSBHostControllerInterface_enqueueInterrupts_count_expedite_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deliverInterrupts");
}

- (BOOL)deliverInterrupts
{
  BOOL v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;

  if (-[IOUSBHostControllerInterface destroyed](self, "destroyed"))
    return 1;
  -[IOUSBHostControllerInterface interruptLock](self, "interruptLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  if (-[IOUSBHostControllerInterface interruptRateHz](self, "interruptRateHz"))
    -[IOUSBHostControllerInterface setNextInterruptTime:](self, "setNextInterruptTime:", dispatch_time(0, 0x3B9ACA00 / -[IOUSBHostControllerInterface interruptRateHz](self, "interruptRateHz")));
  -[IOUSBHostControllerInterface setInterruptDeliveryPending:](self, "setInterruptDeliveryPending:", 0);
  v5 = -[IOUSBHostControllerInterface interruptProducerIndex](self, "interruptProducerIndex");
  if (v5 == -[IOUSBHostControllerInterface interruptConsumerIndex](self, "interruptConsumerIndex"))
  {
LABEL_11:
    v3 = 1;
  }
  else
  {
    while (1)
    {
      v6 = -[IOUSBHostControllerInterface interruptConsumerIndex](self, "interruptConsumerIndex");
      v7 = v5 >= v6 ? v5 : 4096;
      -[IOUSBHostControllerInterface interrupts](self, "interrupts");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = objc_msgSend(v8, "mutableBytes");

      if (IOConnectCallStructMethod(-[IOUSBHostControllerInterface ioConnect](self, "ioConnect"), 2u, (const void *)(v9 + 16 * v6), 16 * (v7 - v6), 0, 0))
      {
        break;
      }
      -[IOUSBHostControllerInterface setInterruptConsumerIndex:](self, "setInterruptConsumerIndex:", v7 & 0xFFF);
      if (v5 == -[IOUSBHostControllerInterface interruptConsumerIndex](self, "interruptConsumerIndex"))
        goto LABEL_11;
    }
    NSLog(CFSTR("Failed to send interrupts to kernel.\n"));
    v3 = 0;
  }
  -[IOUSBHostControllerInterface interruptLock](self, "interruptLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

  return v3;
}

- (void)setInterruptRateHz:(NSUInteger)interruptRateHz
{
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  self->_interruptRateHz = interruptRateHz;
  -[IOUSBHostControllerInterface interruptQueue](self, "interruptQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IOUSBHostControllerInterface interruptQueue](self, "interruptQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__IOUSBHostControllerInterface_setInterruptRateHz___block_invoke;
    block[3] = &unk_24DEDCB78;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

uint64_t __51__IOUSBHostControllerInterface_setInterruptRateHz___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deliverInterrupts");
}

- (BOOL)commandAsyncCallbackWithResult:(int)a3 error:(id *)a4
{
  BOOL v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void (**commandHandler)(id, IOUSBHostControllerInterface *, uint64_t, _QWORD);
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  mach_port_t v15;
  mach_port_t MachPort;
  kern_return_t v17;
  kern_return_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  const char *v27;
  uint32_t outputCnt;
  uint64_t input;
  uint64_t reference[2];
  IOUSBHostControllerInterface *v32;
  unint64_t v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[3];
  _QWORD v37[5];

  v37[3] = *MEMORY[0x24BDAC8D0];
  if (-[IOUSBHostControllerInterface destroyed](self, "destroyed"))
    return 1;
  if (!a3 && (-[IOUSBHostControllerInterface command](self, "command") & 0x8000) != 0)
  {
    -[IOUSBHostControllerInterface log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      -[IOUSBHostControllerInterface log](self, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[IOUSBHostControllerInterface commandAsyncCallbackWithResult:error:].cold.2((char *)self, v10);

    }
    commandHandler = (void (**)(id, IOUSBHostControllerInterface *, uint64_t, _QWORD))self->_commandHandler;
    v12 = -[IOUSBHostControllerInterface command](self, "command");
    commandHandler[2](commandHandler, self, v12, v13);
  }
  -[IOUSBHostControllerInterface setCommand:](self, "setCommand:", 0, 0);
  *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v34 = v14;
  v35 = v14;
  v33 = 0xAAAAAAAAAAAAAAAALL;
  reference[0] = 0xAAAAAAAAAAAAAAAALL;
  reference[1] = (uint64_t)_commandAsyncCallback;
  v32 = self;
  input = (uint64_t)&v32->_command;
  outputCnt = 0;
  v15 = -[IOUSBHostControllerInterface ioConnect](v32, "ioConnect");
  MachPort = IONotificationPortGetMachPort(-[IOUSBHostControllerInterface notificationPortRef](v32, "notificationPortRef"));
  v17 = IOConnectCallAsyncScalarMethod(v15, 0, MachPort, reference, 3u, &input, 1u, 0, &outputCnt);
  v7 = v17 == 0;
  if (v17)
  {
    v18 = v17;

    if (a4)
    {
      v36[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Failed to read command from kernel."), &stru_24DEDD560, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v20;
      v36[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Unable to enqueue asynchronous operation."), &stru_24DEDD560, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v22;
      v36[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v37[2] = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v18, v25);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v26)
        -[IOUSBHostControllerInterface commandAsyncCallbackWithResult:error:].cold.1(v26, v27);

    }
  }
  return v7;
}

- (BOOL)doorbellAsyncCallbacKWithResult:(int)a3 length:(unint64_t)a4 error:(id *)a5
{
  BOOL v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  int v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  void (**doorbellHandler)(id, IOUSBHostControllerInterface *, uint64_t, unint64_t);
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  IOUSBHostControllerInterface *v28;
  id v29;
  void *v30;
  mach_port_t MachPort;
  kern_return_t v32;
  kern_return_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _BOOL8 v41;
  const char *v42;
  uint32_t outputCnt;
  uint64_t input[2];
  uint8_t buf[16];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[3];
  _QWORD v51[6];

  v51[3] = *MEMORY[0x24BDAC8D0];
  if (-[IOUSBHostControllerInterface destroyed](self, "destroyed"))
    return 1;
  if (!a3 && a4)
  {
    -[IOUSBHostControllerInterface doorbells](self, "doorbells");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLength:", a4);

    -[IOUSBHostControllerInterface log](self, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);

    if (v12)
    {
      -[IOUSBHostControllerInterface doorbells](self, "doorbells");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length") & 0x3FFFFFFFCLL;

      if (v14)
      {
        v15 = 0;
        do
        {
          -[IOUSBHostControllerInterface doorbells](self, "doorbells");
          v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v17 = *(_DWORD *)(objc_msgSend(v16, "mutableBytes") + 4 * v15);

          -[IOUSBHostControllerInterface log](self, "log");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&buf[4] = v17;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = BYTE1(v17);
            _os_log_debug_impl(&dword_21B5CC000, v18, OS_LOG_TYPE_DEBUG, "doorbell Device %d Endpoint 0x%02x\n", buf, 0xEu);
          }

          ++v15;
          -[IOUSBHostControllerInterface doorbells](self, "doorbells");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (unint64_t)objc_msgSend(v19, "length") >> 2;

        }
        while (v15 < v20);
      }
    }
    doorbellHandler = (void (**)(id, IOUSBHostControllerInterface *, uint64_t, unint64_t))self->_doorbellHandler;
    -[IOUSBHostControllerInterface doorbells](self, "doorbells");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = objc_msgSend(v22, "mutableBytes");
    -[IOUSBHostControllerInterface doorbells](self, "doorbells");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    doorbellHandler[2](doorbellHandler, self, v23, (unint64_t)objc_msgSend(v24, "length") >> 2);

    -[IOUSBHostControllerInterface doorbells](self, "doorbells");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setLength:", 4096);

    -[IOUSBHostControllerInterface doorbells](self, "doorbells");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "resetBytesInRange:", 0, a4);

  }
  *(_QWORD *)&v27 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v48 = v27;
  v49 = v27;
  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  v47 = v27;
  *(_QWORD *)&buf[8] = _doorbellAsyncCallback;
  v28 = self;
  *(_QWORD *)&v47 = v28;
  -[IOUSBHostControllerInterface doorbells](v28, "doorbells");
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  input[0] = objc_msgSend(v29, "mutableBytes");

  -[IOUSBHostControllerInterface doorbells](v28, "doorbells");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  input[1] = objc_msgSend(v30, "length");

  outputCnt = 0;
  LODWORD(v30) = -[IOUSBHostControllerInterface ioConnect](v28, "ioConnect");
  MachPort = IONotificationPortGetMachPort(-[IOUSBHostControllerInterface notificationPortRef](v28, "notificationPortRef"));
  v32 = IOConnectCallAsyncScalarMethod((mach_port_t)v30, 1u, MachPort, (uint64_t *)buf, 3u, input, 2u, 0, &outputCnt);
  v9 = v32 == 0;
  if (v32)
  {
    v33 = v32;

    if (a5)
    {
      v50[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("Failed to read doorbells from kernel."), &stru_24DEDD560, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v35;
      v50[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Unable to enqueue asynchronous operation."), &stru_24DEDD560, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v51[1] = v37;
      v50[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v51[2] = v39;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 3);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), v33, v40);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      v41 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v41)
        -[IOUSBHostControllerInterface doorbellAsyncCallbacKWithResult:length:error:].cold.1(v41, v42);

    }
  }
  return v9;
}

- (IOUSBHostCIPortStateMachine)getPortStateMachineForCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  void *v4;

  if ((command->control & 0x3F) - 24 > 6)
  {
    v4 = 0;
  }
  else
  {
    -[IOUSBHostControllerInterface getPortStateMachineForPort:error:](self, "getPortStateMachineForPort:error:", command->data0 & 0xFLL, error);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (IOUSBHostCIPortStateMachine *)v4;
}

- (IOUSBHostCIPortStateMachine)getPortStateMachineForPort:(NSUInteger)port error:(NSError *)error
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  const char *v15;
  IOUSBHostCIPortStateMachine **portStateMachine;
  IOUSBHostCIPortStateMachine *v18;
  IOUSBHostCIPortStateMachine *v19;
  IOUSBHostCIPortStateMachine *v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  if (port && ((_WORD)-[IOUSBHostControllerInterface capabilities](self, "capabilities")[2] & 0xFu) >= port)
  {
    portStateMachine = self->_portStateMachine;
    v18 = self->_portStateMachine[port];
    if (!v18)
    {
      v19 = -[IOUSBHostCIPortStateMachine initWithInterface:portNumber:error:]([IOUSBHostCIPortStateMachine alloc], "initWithInterface:portNumber:error:", self, port, error);
      v20 = portStateMachine[port];
      portStateMachine[port] = v19;

      v18 = portStateMachine[port];
    }
    return v18;
  }
  else
  {
    if (error)
    {
      v21[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Failed to retrieve port state machine."), &stru_24DEDD560, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v8;
      v21[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Port number is out of range."), &stru_24DEDD560, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v10;
      v21[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v13);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v14)
        -[IOUSBHostControllerInterface getPortStateMachineForPort:error:].cold.1(v14, v15);

    }
    return (IOUSBHostCIPortStateMachine *)0;
  }
}

- (const)capabilitiesForPort:(NSUInteger)port
{
  NSUInteger v5;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  const IOUSBHostCIMessage *v9;

  v5 = -[NSData length](self->_capabilitiesData, "length");
  if (v5 < 0x20)
    return 0;
  v6 = v5 >> 4;
  v7 = 2;
  v8 = 1;
  while (1)
  {
    v9 = -[IOUSBHostControllerInterface capabilities](self, "capabilities");
    if ((v9[v8].control & 0x3F) == 1 && (((unint64_t)v9[v8].control >> 16) & 0xF) == port)
      break;
    v8 = v7;
    if (v6 <= v7++)
      return 0;
  }
  return &v9[v8];
}

- (NSString)descriptionForMessage:(const IOUSBHostCIMessage *)message
{
  void *v5;
  const __CFString *v6;
  const char *v7;
  unint64_t control;
  const char *v9;
  uint64_t v10;
  _BYTE *v11;
  unint64_t v12;
  const char *v13;
  unint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  const char *v17;
  uint64_t data1;
  uint64_t v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("0x%08x %08x %016llx"), message->control, message->data0, message->data1);
  if ((message->control & 0x8000) == 0)
  {
    v6 = CFSTR(": Invalid");
LABEL_3:
    objc_msgSend(v5, "appendString:", v6);
    return (NSString *)v5;
  }
  objc_msgSend(v5, "appendFormat:", CFSTR(": %s"), IOUSBHostCIMessageTypeToString((IOUSBHostCIMessageType)(message->control & 0x3F)));
  v7 = IOUSBHostCIMessageStatusToString((IOUSBHostCIMessageStatus)((message->control >> 8) & 0xF));
  control = message->control;
  v9 = v7;
  switch(control & 0x3F)
  {
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1EuLL:
      objc_msgSend(v5, "appendFormat:", CFSTR(" Root Port %u"), message->data0 & 0xF);
      if ((message->control & 0x4000) != 0)
      {
        objc_msgSend(v5, "appendFormat:", CFSTR(" Status %s"), v9);
        objc_msgSend(v5, "appendString:", CFSTR(" ("));
        data1 = message->data1;
        if ((data1 & 1) != 0)
        {
          objc_msgSend(v5, "appendString:", CFSTR(" Powered"));
          data1 = message->data1;
          if ((data1 & 2) == 0)
          {
LABEL_40:
            if ((data1 & 4) == 0)
              goto LABEL_42;
            goto LABEL_41;
          }
        }
        else if ((data1 & 2) == 0)
        {
          goto LABEL_40;
        }
        objc_msgSend(v5, "appendString:", CFSTR(" Overcurrent"));
        data1 = message->data1;
        if ((data1 & 4) == 0)
        {
LABEL_42:
          objc_msgSend(v5, "appendFormat:", CFSTR(" Link State %s"), IOUSBHostCILinkStateToString((IOUSBHostCILinkState)(data1 >> 4)));
          if (IOUSBHostCILinkStateEnabled((const IOUSBHostCILinkState)(LODWORD(message->data1) >> 4)))
            objc_msgSend(v5, "appendFormat:", CFSTR(" Device Speed %s"), IOUSBHostCIDeviceSpeedToString((IOUSBHostCIDeviceSpeed)((LODWORD(message->data1) >> 8) & 7)));
          v20 = message->data1;
          if ((v20 & 0x20000) != 0)
          {
            objc_msgSend(v5, "appendString:", CFSTR(" Overcurrent Change"));
            v20 = message->data1;
            if ((v20 & 0x40000) == 0)
            {
LABEL_46:
              if ((v20 & 0x100000) == 0)
              {
LABEL_48:
                v6 = CFSTR(")");
                goto LABEL_3;
              }
LABEL_47:
              objc_msgSend(v5, "appendString:", CFSTR(" Link Change"));
              goto LABEL_48;
            }
          }
          else if ((v20 & 0x40000) == 0)
          {
            goto LABEL_46;
          }
          objc_msgSend(v5, "appendString:", CFSTR(" Connect Change"));
          if ((message->data1 & 0x100000) == 0)
            goto LABEL_48;
          goto LABEL_47;
        }
LABEL_41:
        objc_msgSend(v5, "appendString:", CFSTR(" Connected"));
        data1 = message->data1;
        goto LABEL_42;
      }
      if ((message->control & 0x3F) == 0x1E && (message->data1 & 0x160000) != 0)
      {
        objc_msgSend(v5, "appendString:", CFSTR(" Clear Change Bits:"));
        v10 = message->data1;
        if ((v10 & 0x20000) != 0)
        {
          objc_msgSend(v5, "appendString:", CFSTR(" Overcurrent"));
          v10 = message->data1;
          if ((v10 & 0x40000) == 0)
          {
LABEL_10:
            if ((v10 & 0x100000) == 0)
              return (NSString *)v5;
            goto LABEL_69;
          }
        }
        else if ((v10 & 0x40000) == 0)
        {
          goto LABEL_10;
        }
        objc_msgSend(v5, "appendString:", CFSTR(" Connect"));
        if ((message->data1 & 0x100000) == 0)
          return (NSString *)v5;
LABEL_69:
        v6 = CFSTR(" Link");
        goto LABEL_3;
      }
      return (NSString *)v5;
    case 0x20uLL:
      objc_msgSend(v5, "appendFormat:", CFSTR(" Port Route 0x%08x"), message->data0 & 0xFFFFFF);
      if ((message->control & 0x4000) != 0)
        objc_msgSend(v5, "appendFormat:", CFSTR(" Device Address %llu Status %s"), LOBYTE(message->data1), v9, v24, v25, v26);
      return (NSString *)v5;
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
      objc_msgSend(v5, "appendFormat:", CFSTR(" Device Address %u"), LOBYTE(message->data0));
      if ((message->control & 0x4000) != 0)
        goto LABEL_36;
      if ((message->control & 0x3F) != 0x24)
        return (NSString *)v5;
      objc_msgSend(v5, "appendFormat:", CFSTR(" Descriptor 0x%016llx"), message->data1);
      v15 = (_BYTE *)message->data1;
      if (!v15)
        return (NSString *)v5;
      objc_msgSend(v5, "appendString:", CFSTR(" ("));
      if (!*v15)
        goto LABEL_35;
      v16 = 0;
      do
      {
        if (v16)
          v17 = " ";
        else
          v17 = "0x";
        objc_msgSend(v5, "appendFormat:", CFSTR("%s%02x"), v17, v15[v16]);
        v14 = *v15;
        if (v16 > 6)
          break;
        ++v16;
      }
      while (v16 < v14);
      goto LABEL_33;
    case 0x28uLL:
    case 0x29uLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
      objc_msgSend(v5, "appendFormat:", CFSTR(" Device %d Endpoint 0x%02x"), message->data0, BYTE1(message->data0));
      if ((message->control & 0x4000) != 0)
      {
LABEL_36:
        objc_msgSend(v5, "appendFormat:", CFSTR(" Status %s"), v9, v23, v24, v25, v26);
        return (NSString *)v5;
      }
      switch(message->control & 0x3F)
      {
        case '(':
        case ',':
          objc_msgSend(v5, "appendFormat:", CFSTR(" Descriptor 0x%016llx"), message->data1);
          v11 = (_BYTE *)message->data1;
          if (!v11)
            return (NSString *)v5;
          objc_msgSend(v5, "appendString:", CFSTR(" ("));
          if (!*v11)
            goto LABEL_35;
          v12 = 0;
          do
          {
            if (v12)
              v13 = " ";
            else
              v13 = "0x";
            objc_msgSend(v5, "appendFormat:", CFSTR("%s%02x"), v13, v11[v12]);
            v14 = *v11;
            if (v12 > 6)
              break;
            ++v12;
          }
          while (v12 < v14);
          break;
        case '-':
          if ((message->data1 & 1) != 0)
            v21 = "YES";
          else
            v21 = "NO";
          objc_msgSend(v5, "appendFormat:", CFSTR(" Clear State %s"), v21, v23, v24, v25, v26);
          return (NSString *)v5;
        case '.':
          objc_msgSend(v5, "appendFormat:", CFSTR(" Transfer Structure 0x%016llx"), message->data1, v23, v24, v25, v26);
          goto LABEL_65;
        default:
          return (NSString *)v5;
      }
LABEL_33:
      if (v14 > 7)
        objc_msgSend(v5, "appendString:", CFSTR("..."));
LABEL_35:
      v6 = CFSTR(")");
      goto LABEL_3;
    case 0x38uLL:
      objc_msgSend(v5, "appendFormat:", CFSTR(" Request 0x%02x %02x %04x %04x %04x"), LOBYTE(message->data1), BYTE1(message->data1), WORD1(message->data1), WORD2(message->data1), HIWORD(message->data1));
      return (NSString *)v5;
    case 0x39uLL:
      objc_msgSend(v5, "appendFormat:", CFSTR(" Length 0x%x Buffer 0x%016llx\n"), message->data0 & 0xFFFFFFF, message->data1, v24, v25, v26);
      return (NSString *)v5;
    case 0x3DuLL:
      objc_msgSend(v5, "appendFormat:", CFSTR(" Device %u Endpoint 0x%02lx Length %u Status %s Transfer Structure 0x%016llx"), BYTE2(control), control >> 24, message->data0 & 0xFFFFFFF, v7, message->data1);
LABEL_65:
      if (message->data1)
      {
        objc_msgSend(v5, "appendString:", CFSTR(": "));
        -[IOUSBHostControllerInterface descriptionForMessage:](self, "descriptionForMessage:", message->data1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v22);

      }
      return (NSString *)v5;
    default:
      return (NSString *)v5;
  }
}

- (dispatch_queue_t)queue
{
  return (dispatch_queue_t)self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSUInteger)interruptRateHz
{
  return self->_interruptRateHz;
}

- (IOUSBHostCIControllerStateMachine)controllerStateMachine
{
  return self->_controllerStateMachine;
}

- (void)setControllerStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_controllerStateMachine, a3);
}

- (const)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(const IOUSBHostCIMessage *)a3
{
  self->_capabilities = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (unsigned)ioConnect
{
  return self->_ioConnect;
}

- (void)setIoConnect:(unsigned int)a3
{
  self->_ioConnect = a3;
}

- (IONotificationPort)notificationPortRef
{
  return self->_notificationPortRef;
}

- (void)setNotificationPortRef:(IONotificationPort *)a3
{
  self->_notificationPortRef = a3;
}

- (id)commandHandler
{
  return self->_commandHandler;
}

- (void)setCommandHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (id)doorbellHandler
{
  return self->_doorbellHandler;
}

- (void)setDoorbellHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)interestHandler
{
  return self->_interestHandler;
}

- (void)setInterestHandler:(void *)a3
{
  self->_interestHandler = a3;
}

- (IOUSBHostInterestNotifier)interestNotifier
{
  return self->_interestNotifier;
}

- (void)setInterestNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_interestNotifier, a3);
}

- (IOUSBHostCIMessage)command
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];
  IOUSBHostCIMessage result;

  objc_copyStruct(v4, &self->_command, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.data1 = v3;
  result.control = v2;
  result.data0 = HIDWORD(v2);
  return result;
}

- (void)setCommand:(IOUSBHostCIMessage)a3
{
  IOUSBHostCIMessage v3;

  v3 = a3;
  objc_copyStruct(&self->_command, &v3, 16, 1, 0);
}

- (NSMutableData)doorbells
{
  return self->_doorbells;
}

- (void)setDoorbells:(id)a3
{
  objc_storeStrong((id *)&self->_doorbells, a3);
}

- (NSMutableData)interrupts
{
  return self->_interrupts;
}

- (void)setInterrupts:(id)a3
{
  objc_storeStrong((id *)&self->_interrupts, a3);
}

- (NSRecursiveLock)interruptLock
{
  return self->_interruptLock;
}

- (void)setInterruptLock:(id)a3
{
  objc_storeStrong((id *)&self->_interruptLock, a3);
}

- (unint64_t)interruptProducerIndex
{
  return self->_interruptProducerIndex;
}

- (void)setInterruptProducerIndex:(unint64_t)a3
{
  self->_interruptProducerIndex = a3;
}

- (unint64_t)interruptConsumerIndex
{
  return self->_interruptConsumerIndex;
}

- (void)setInterruptConsumerIndex:(unint64_t)a3
{
  self->_interruptConsumerIndex = a3;
}

- (BOOL)interruptDeliveryPending
{
  return self->_interruptDeliveryPending;
}

- (void)setInterruptDeliveryPending:(BOOL)a3
{
  self->_interruptDeliveryPending = a3;
}

- (OS_dispatch_queue)interruptQueue
{
  return self->_interruptQueue;
}

- (void)setInterruptQueue:(id)a3
{
  objc_storeStrong((id *)&self->_interruptQueue, a3);
}

- (unint64_t)nextInterruptTime
{
  return self->_nextInterruptTime;
}

- (void)setNextInterruptTime:(unint64_t)a3
{
  self->_nextInterruptTime = a3;
}

- (BOOL)destroyed
{
  return self->_destroyed;
}

- (void)setDestroyed:(BOOL)a3
{
  self->_destroyed = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_interruptQueue, 0);
  objc_storeStrong((id *)&self->_interruptLock, 0);
  objc_storeStrong((id *)&self->_interrupts, 0);
  objc_storeStrong((id *)&self->_doorbells, 0);
  objc_storeStrong((id *)&self->_interestNotifier, 0);
  objc_storeStrong(&self->_doorbellHandler, 0);
  objc_storeStrong(&self->_commandHandler, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_controllerStateMachine, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  for (i = 136; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_capabilitiesData, 0);
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostControllerInterface."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Unable to allocate memory."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.2(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostControllerInterface."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Capabilities are not valid."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.3(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostControllerInterface."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Failed to allocate interruptData."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.4(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostControllerInterface."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Failed to allocate interruptQueue."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.5(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostControllerInterface."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Failed to allocate interruptLock."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.6(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostControllerInterface."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Unable to connect to the kernel."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.7(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostControllerInterface."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Failed to create UUID."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.8(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostControllerInterface."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Unable to create interest notifier."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.9(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostControllerInterface."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Unable to create notification port."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.10(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostControllerInterface."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Capabilities structure was rejected."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.11(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostControllerInterface."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Unable to set UUID property."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithCapabilities:(uint64_t)a1 queue:(const char *)a2 interruptRateHz:error:commandHandler:doorbellHandler:interestHandler:.cold.12(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostControllerInterface."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Unable to allocate memory for doorbells."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)enqueueInterrupts:(uint64_t)a1 count:(const char *)a2 expedite:error:.cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to send interrupts."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Not enough space for interrupts."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)commandAsyncCallbackWithResult:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to read command from kernel."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Unable to enqueue asynchronous operation."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)commandAsyncCallbackWithResult:(char *)a1 error:(NSObject *)a2 .cold.2(char *a1, NSObject *a2)
{
  id v3;
  const char *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "descriptionForMessage:", a1 + 296);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = 136315138;
  v6 = OUTLINED_FUNCTION_2(v3, v4);
  _os_log_debug_impl(&dword_21B5CC000, a2, OS_LOG_TYPE_DEBUG, "command %s", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_3();
}

- (void)doorbellAsyncCallbacKWithResult:(uint64_t)a1 length:(const char *)a2 error:.cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to read doorbells from kernel."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Unable to enqueue asynchronous operation."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)getPortStateMachineForPort:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to retrieve port state machine."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Port number is out of range."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

@end

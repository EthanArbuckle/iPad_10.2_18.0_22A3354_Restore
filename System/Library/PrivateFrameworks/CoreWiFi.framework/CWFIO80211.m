@implementation CWFIO80211

- (CWFIO80211)init
{
  CWFIO80211 *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *mutexQueue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *eventQueue;
  unsigned int *v9;
  IONotificationPort *v10;
  kern_return_t v11;
  kern_return_t v12;
  IONotificationPortRef v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableDictionary *publishIO80211VirtualInterfaceMap;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableDictionary *terminatedIO80211VirtualInterfaceMap;
  kern_return_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  kern_return_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  kern_return_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  kern_return_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  kern_return_t v71;
  __uint64_t v72;
  void *v73;
  NSObject *v74;
  kern_return_t v75;
  __uint64_t v76;
  void *v77;
  kern_return_t v78;
  __uint64_t v79;
  void *v80;
  __uint64_t v81;
  void *v82;
  NSObject *v83;
  kern_return_t v84;
  __uint64_t v85;
  void *v86;
  NSObject *v87;
  __uint64_t v88;
  void *v89;
  kern_return_t v90;
  __uint64_t v91;
  void *v92;
  __uint64_t v93;
  void *v94;
  kern_return_t v95;
  __uint64_t v96;
  void *v97;
  __uint64_t v98;
  void *v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  mach_port_t v110;
  mach_port_t mainPort;
  objc_super v112;
  io_iterator_t notification;
  int v114;
  unint64_t v115;
  __int16 v116;
  unint64_t v117;
  __int16 v118;
  const char *v119;
  __int16 v120;
  const char *v121;
  __int16 v122;
  int v123;
  __int16 v124;
  _BYTE v125[24];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  notification = 0;
  v112.receiver = self;
  v112.super_class = (Class)CWFIO80211;
  v2 = -[CWFIO80211 init](&v112, sel_init);
  if (!v2)
    goto LABEL_79;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.corewifi.io80211-mutex", v3);
  mutexQueue = v2->_mutexQueue;
  v2->_mutexQueue = (OS_dispatch_queue *)v4;

  if (!v2->_mutexQueue)
    goto LABEL_79;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create("com.apple.corewifi.io80211-event", v6);
  eventQueue = v2->_eventQueue;
  v2->_eventQueue = (OS_dispatch_queue *)v7;

  if (!v2->_eventQueue)
    goto LABEL_79;
  mainPort = 0;
  v9 = (unsigned int *)MEMORY[0x1E0C81720];
  if (MEMORY[0x1B5E09CDC](*MEMORY[0x1E0C81720], &mainPort))
    goto LABEL_79;
  v10 = IONotificationPortCreate(mainPort);
  v2->_portRef = v10;
  if (!v10)
    goto LABEL_79;
  v2->_publishIO80211SkywalkInterface = 0;
  v11 = IOServiceAddMatchingNotification(v10, "IOServiceMatched", (CFDictionaryRef)&unk_1E6160AE0, (IOServiceMatchingCallback)sub_1B0654378, v2, &v2->_publishIO80211SkywalkInterface);
  if (v11)
  {
    v71 = v11;
    v72 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (v73)
    {
      CWFGetOSLog();
      v74 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v74 = MEMORY[0x1E0C81028];
      v100 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      goto LABEL_64;
    v114 = 134219778;
    v115 = v72 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v72 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 144;
    v124 = 1024;
    *(_DWORD *)v125 = v71;
    *(_WORD *)&v125[4] = 2112;
    *(_QWORD *)&v125[6] = CFSTR("IO80211InterfaceRole");
    *(_WORD *)&v125[14] = 2112;
    *(_QWORD *)&v125[16] = CFSTR("Infrastructure");
    goto LABEL_63;
  }
  v2->_terminatedIO80211SkywalkInterface = 0;
  v12 = IOServiceAddMatchingNotification(v2->_portRef, "IOServiceTerminate", (CFDictionaryRef)&unk_1E6160B30, (IOServiceMatchingCallback)sub_1B0654384, v2, &v2->_terminatedIO80211SkywalkInterface);
  if (v12)
  {
    v75 = v12;
    v76 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (v77)
    {
      CWFGetOSLog();
      v74 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v74 = MEMORY[0x1E0C81028];
      v101 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      goto LABEL_64;
    v114 = 134219778;
    v115 = v76 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v76 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 149;
    v124 = 1024;
    *(_DWORD *)v125 = v75;
    *(_WORD *)&v125[4] = 2112;
    *(_QWORD *)&v125[6] = CFSTR("IO80211InterfaceRole");
    *(_WORD *)&v125[14] = 2112;
    *(_QWORD *)&v125[16] = CFSTR("Infrastructure");
    goto LABEL_63;
  }
  sub_1B0654E28(0, v2->_publishIO80211SkywalkInterface, CFSTR("IOServiceMatched"));
  sub_1B0654E28(0, v2->_terminatedIO80211SkywalkInterface, CFSTR("IOServiceTerminate"));
  v110 = 0;
  if (MEMORY[0x1B5E09CDC](*v9, &v110))
    goto LABEL_79;
  v13 = IONotificationPortCreate(v110);
  v2->_portRefVirtual = v13;
  if (!v13)
    goto LABEL_79;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v14, v15, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  publishIO80211VirtualInterfaceMap = v2->_publishIO80211VirtualInterfaceMap;
  v2->_publishIO80211VirtualInterfaceMap = (NSMutableDictionary *)v18;

  if (!v2->_publishIO80211VirtualInterfaceMap)
    goto LABEL_79;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v20, v21, v22, v23);
  v24 = objc_claimAutoreleasedReturnValue();
  terminatedIO80211VirtualInterfaceMap = v2->_terminatedIO80211VirtualInterfaceMap;
  v2->_terminatedIO80211VirtualInterfaceMap = (NSMutableDictionary *)v24;

  if (!v2->_terminatedIO80211VirtualInterfaceMap)
    goto LABEL_79;
  notification = 0;
  v26 = IOServiceAddMatchingNotification(v2->_portRef, "IOServiceMatched", (CFDictionaryRef)&unk_1E6160B80, (IOServiceMatchingCallback)sub_1B0654390, v2, &notification);
  if (v26)
  {
    v78 = v26;
    v79 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (v80)
    {
      CWFGetOSLog();
      v74 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v74 = MEMORY[0x1E0C81028];
      v102 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      goto LABEL_64;
    v114 = 134219778;
    v115 = v79 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v79 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 173;
    v124 = 1024;
    *(_DWORD *)v125 = v78;
    *(_WORD *)&v125[4] = 2112;
    *(_QWORD *)&v125[6] = CFSTR("IO80211VirtualInterfaceRole");
    *(_WORD *)&v125[14] = 2112;
    *(_QWORD *)&v125[16] = CFSTR("WiFi-Aware Data");
    goto LABEL_63;
  }
  objc_msgSend_valueWithPointer_(MEMORY[0x1E0CB3B18], v27, notification, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v2->_publishIO80211VirtualInterfaceMap, v31, (uint64_t)v30, (uint64_t)CFSTR("WiFi-Aware Data"), v32);

  objc_msgSend_objectForKeyedSubscript_(v2->_publishIO80211VirtualInterfaceMap, v33, (uint64_t)CFSTR("WiFi-Aware Data"), v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v36)
  {
    v81 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (v82)
    {
      CWFGetOSLog();
      v83 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v83 = MEMORY[0x1E0C81028];
      v103 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      goto LABEL_77;
    v114 = 134219522;
    v115 = v81 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v81 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 176;
    v124 = 2112;
    *(_QWORD *)v125 = CFSTR("IO80211VirtualInterfaceRole");
    *(_WORD *)&v125[8] = 2112;
    *(_QWORD *)&v125[10] = CFSTR("WiFi-Aware Data");
    goto LABEL_76;
  }
  sub_1B0654E28(0, notification, CFSTR("IOServiceMatched"));
  notification = 0;
  v37 = IOServiceAddMatchingNotification(v2->_portRef, "IOServiceTerminate", (CFDictionaryRef)&unk_1E6160BD0, (IOServiceMatchingCallback)sub_1B065439C, v2, &notification);
  if (v37)
  {
    v84 = v37;
    v85 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (v86)
    {
      CWFGetOSLog();
      v87 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v87 = MEMORY[0x1E0C81028];
      v104 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    v114 = 134219778;
    v115 = v85 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v85 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 186;
    v124 = 1024;
    *(_DWORD *)v125 = v84;
    *(_WORD *)&v125[4] = 2112;
    *(_QWORD *)&v125[6] = CFSTR("IO80211VirtualInterfaceRole");
    *(_WORD *)&v125[14] = 2112;
    *(_QWORD *)&v125[16] = CFSTR("WiFi-Aware Data");
    goto LABEL_71;
  }
  objc_msgSend_valueWithPointer_(MEMORY[0x1E0CB3B18], v38, notification, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v2->_terminatedIO80211VirtualInterfaceMap, v42, (uint64_t)v41, (uint64_t)CFSTR("WiFi-Aware Data"), v43);

  objc_msgSend_objectForKeyedSubscript_(v2->_terminatedIO80211VirtualInterfaceMap, v44, (uint64_t)CFSTR("WiFi-Aware Data"), v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v47)
  {
    v88 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89)
    {
      CWFGetOSLog();
      v83 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v83 = MEMORY[0x1E0C81028];
      v105 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      goto LABEL_77;
    v114 = 134219522;
    v115 = v88 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v88 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 189;
    v124 = 2112;
    *(_QWORD *)v125 = CFSTR("IO80211VirtualInterfaceRole");
    *(_WORD *)&v125[8] = 2112;
    *(_QWORD *)&v125[10] = CFSTR("WiFi-Aware Data");
    goto LABEL_76;
  }
  sub_1B0654E28(0, notification, CFSTR("IOServiceMatched"));
  notification = 0;
  v48 = IOServiceAddMatchingNotification(v2->_portRef, "IOServiceMatched", (CFDictionaryRef)&unk_1E6160C20, (IOServiceMatchingCallback)sub_1B0654390, v2, &notification);
  if (v48)
  {
    v90 = v48;
    v91 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (v92)
    {
      CWFGetOSLog();
      v74 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v74 = MEMORY[0x1E0C81028];
      v106 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      goto LABEL_64;
    v114 = 134219778;
    v115 = v91 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v91 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 200;
    v124 = 1024;
    *(_DWORD *)v125 = v90;
    *(_WORD *)&v125[4] = 2112;
    *(_QWORD *)&v125[6] = CFSTR("IO80211VirtualInterfaceRole");
    *(_WORD *)&v125[14] = 2112;
    *(_QWORD *)&v125[16] = CFSTR("SoftAP");
LABEL_63:
    _os_log_send_and_compose_impl();
LABEL_64:

LABEL_79:
    return 0;
  }
  objc_msgSend_valueWithPointer_(MEMORY[0x1E0CB3B18], v49, notification, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v2->_publishIO80211VirtualInterfaceMap, v53, (uint64_t)v52, (uint64_t)CFSTR("SoftAP"), v54);

  objc_msgSend_objectForKeyedSubscript_(v2->_publishIO80211VirtualInterfaceMap, v55, (uint64_t)CFSTR("SoftAP"), v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v58)
  {
    v93 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (v94)
    {
      CWFGetOSLog();
      v83 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v83 = MEMORY[0x1E0C81028];
      v107 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      goto LABEL_77;
    v114 = 134219522;
    v115 = v93 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v93 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 203;
    v124 = 2112;
    *(_QWORD *)v125 = CFSTR("IO80211VirtualInterfaceRole");
    *(_WORD *)&v125[8] = 2112;
    *(_QWORD *)&v125[10] = CFSTR("SoftAP");
    goto LABEL_76;
  }
  sub_1B0654E28(0, notification, CFSTR("IOServiceMatched"));
  notification = 0;
  v59 = IOServiceAddMatchingNotification(v2->_portRef, "IOServiceTerminate", (CFDictionaryRef)&unk_1E6160C70, (IOServiceMatchingCallback)sub_1B065439C, v2, &notification);
  if (v59)
  {
    v95 = v59;
    v96 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (v97)
    {
      CWFGetOSLog();
      v87 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v87 = MEMORY[0x1E0C81028];
      v108 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    v114 = 134219778;
    v115 = v96 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v96 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 213;
    v124 = 1024;
    *(_DWORD *)v125 = v95;
    *(_WORD *)&v125[4] = 2112;
    *(_QWORD *)&v125[6] = CFSTR("IO80211VirtualInterfaceRole");
    *(_WORD *)&v125[14] = 2112;
    *(_QWORD *)&v125[16] = CFSTR("SoftAP");
LABEL_71:
    _os_log_send_and_compose_impl();
LABEL_72:

    goto LABEL_79;
  }
  objc_msgSend_valueWithPointer_(MEMORY[0x1E0CB3B18], v60, notification, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v2->_terminatedIO80211VirtualInterfaceMap, v64, (uint64_t)v63, (uint64_t)CFSTR("SoftAP"), v65);

  objc_msgSend_objectForKeyedSubscript_(v2->_terminatedIO80211VirtualInterfaceMap, v66, (uint64_t)CFSTR("SoftAP"), v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v69)
  {
    v98 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (v99)
    {
      CWFGetOSLog();
      v83 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v83 = MEMORY[0x1E0C81028];
      v109 = MEMORY[0x1E0C81028];
    }

    if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      goto LABEL_77;
    v114 = 134219522;
    v115 = v98 / 0x3B9ACA00;
    v116 = 2048;
    v117 = v98 % 0x3B9ACA00 / 0x3E8;
    v118 = 2082;
    v119 = "-[CWFIO80211 init]";
    v120 = 2082;
    v121 = "CWFIO80211.m";
    v122 = 1024;
    v123 = 216;
    v124 = 2112;
    *(_QWORD *)v125 = CFSTR("IO80211VirtualInterfaceRole");
    *(_WORD *)&v125[8] = 2112;
    *(_QWORD *)&v125[10] = CFSTR("SoftAP");
LABEL_76:
    _os_log_send_and_compose_impl();
LABEL_77:

    if (notification)
      IOObjectRelease(notification);
    goto LABEL_79;
  }
  sub_1B0654E28(0, notification, CFSTR("IOServiceMatched"));
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  io_object_t publishIO80211SkywalkInterface;
  io_object_t terminatedIO80211SkywalkInterface;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  io_object_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  io_object_t v35;
  IONotificationPort *portRef;
  objc_super v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  publishIO80211SkywalkInterface = self->_publishIO80211SkywalkInterface;
  if (publishIO80211SkywalkInterface)
    IOObjectRelease(publishIO80211SkywalkInterface);
  terminatedIO80211SkywalkInterface = self->_terminatedIO80211SkywalkInterface;
  if (terminatedIO80211SkywalkInterface)
    IOObjectRelease(terminatedIO80211SkywalkInterface);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend_allValues(self->_publishIO80211VirtualInterfaceMap, a2, v2, v3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v42, (uint64_t)v47, 16);
  if (v10)
  {
    v15 = v10;
    v16 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v43 != v16)
          objc_enumerationMutation(v8);
        v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        if (objc_msgSend_pointerValue(v18, v11, v12, v13, v14))
        {
          v19 = objc_msgSend_pointerValue(v18, v11, v12, v13, v14);
          IOObjectRelease(v19);
        }
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v42, (uint64_t)v47, 16);
    }
    while (v15);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend_allValues(self->_terminatedIO80211VirtualInterfaceMap, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v38, (uint64_t)v46, 16);
  if (v26)
  {
    v31 = v26;
    v32 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v39 != v32)
          objc_enumerationMutation(v24);
        v34 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        if (objc_msgSend_pointerValue(v34, v27, v28, v29, v30))
        {
          v35 = objc_msgSend_pointerValue(v34, v27, v28, v29, v30);
          IOObjectRelease(v35);
        }
      }
      v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v38, (uint64_t)v46, 16);
    }
    while (v31);
  }

  portRef = self->_portRef;
  if (portRef)
    IONotificationPortDestroy(portRef);
  v37.receiver = self;
  v37.super_class = (Class)CWFIO80211;
  -[CWFIO80211 dealloc](&v37, sel_dealloc);
}

- (void)startEventMonitoring
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06545F0;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)stopEventMonitoring
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B0654690;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (BOOL)isMonitoringEvents
{
  NSObject *mutexQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B0654768;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)__IO80211InfoMatchingService:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CFMutableDictionaryRef properties;

  properties = 0;
  if (a3)
  {
    IORegistryEntryCreateCFProperties(a3, &properties, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    IOObjectRelease(a3);
    v10 = objc_msgSend_copy(properties, v6, v7, v8, v9);
  }
  else
  {
    v10 = objc_msgSend_copy(0, a2, *(uint64_t *)&a3, v3, v4);
  }
  v11 = (void *)v10;
  if (properties)
    CFRelease(properties);
  return v11;
}

- (id)IO80211ControllerInfo
{
  mach_port_t v2;
  const __CFDictionary *v3;
  kern_return_t MatchingServices;
  const __CFAllocator *v5;
  io_registry_entry_t v6;
  io_object_t v7;
  void *v8;
  const __CFDictionary *v9;
  void *v10;
  io_object_t v11;
  io_object_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  kern_return_t v26;
  __uint64_t v27;
  void *v28;
  NSObject *v29;
  id v30;
  mach_port_t mainPort;
  io_iterator_t existing;
  io_iterator_t iterator[2];
  _BYTE properties[12];
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  kern_return_t v44;
  __int16 v45;
  const __CFString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  existing = 0;
  v2 = *MEMORY[0x1E0CBBAA8];
  v3 = IOServiceMatching("IOEthernetInterface");
  mainPort = v2;
  MatchingServices = IOServiceGetMatchingServices(v2, v3, &existing);
  if (MatchingServices)
  {
    v26 = MatchingServices;
    v27 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    CWFGetOSLog();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      CWFGetOSLog();
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = MEMORY[0x1E0C81028];
      v30 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)properties = 134219522;
      *(_QWORD *)&properties[4] = v27 / 0x3B9ACA00;
      v35 = 2048;
      v36 = v27 % 0x3B9ACA00 / 0x3E8;
      v37 = 2082;
      v38 = "__findWiFiController";
      v39 = 2082;
      v40 = "CWFIO80211.m";
      v41 = 1024;
      v42 = 465;
      v43 = 1024;
      v44 = v26;
      v45 = 2112;
      v46 = CFSTR("IOEthernetInterface");
      _os_log_send_and_compose_impl();
    }

    return 0;
  }
  else
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    while (1)
    {
      v6 = IOIteratorNext(existing);
      if (!v6)
        break;
      v7 = v6;
      v8 = (id)IORegistryEntryCreateCFProperty(v6, CFSTR("BSD Name"), v5, 0);
      *(_QWORD *)iterator = 0;
      *(_QWORD *)properties = 0;
      v9 = IOServiceMatching("IOSkywalkEthernetInterface");
      v10 = 0;
      if (!IOServiceGetMatchingServices(mainPort, v9, &iterator[1]) && iterator[1])
      {
        v11 = IOIteratorNext(iterator[1]);
        if (v11)
        {
          v12 = v11;
          do
          {
            if (IORegistryEntryGetParentEntry(v12, "IOService", iterator))
            {
              IOObjectRelease(v12);
            }
            else
            {
              v13 = (void *)IORegistryEntrySearchCFProperty(v12, "IOService", CFSTR("IOClassNameOverride"), v5, 1u);
              v14 = (void *)IORegistryEntrySearchCFProperty(v12, "IOService", CFSTR("BSD Name"), v5, 1u);
              if (objc_msgSend_isEqualToString_(v14, v15, (uint64_t)v8, v16, v17)
                && objc_msgSend_isEqualToString_(v13, v18, (uint64_t)CFSTR("IO80211Controller"), v19, v20))
              {
                IORegistryEntryCreateCFProperties(iterator[0], (CFMutableDictionaryRef *)properties, v5, 0);
              }
              if (v13)
                CFRelease(v13);
              if (v14)
                CFRelease(v14);
              IOObjectRelease(iterator[0]);
              IOObjectRelease(v12);
              if (*(_QWORD *)properties)
                break;
            }
            v12 = IOIteratorNext(iterator[1]);
          }
          while (v12);
        }
        IOObjectRelease(iterator[1]);
        v10 = (void *)objc_msgSend_copy(*(void **)properties, v21, v22, v23, v24);
        if (*(_QWORD *)properties)
          CFRelease(*(CFTypeRef *)properties);
      }

      if (v8)
        CFRelease(v8);
      IOObjectRelease(v7);
      if (v10)
        goto LABEL_26;
    }
    v10 = 0;
LABEL_26:
    IOObjectRelease(existing);
    return v10;
  }
}

- (id)IO80211InterfaceInfo:(id)a3 error:(id *)a4
{
  id v5;
  __CFDictionary *Mutable;
  __CFDictionary *v7;
  __CFDictionary *v8;
  const __CFDictionary *v9;
  uint64_t MatchingService;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;

  v5 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v7 = Mutable;
    CFDictionarySetValue(Mutable, CFSTR("IOInterfaceName"), v5);
    v8 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (v8)
    {
      v9 = v8;
      CFDictionarySetValue(v8, CFSTR("IOPropertyMatch"), v7);
      MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v9);
      objc_msgSend___IO80211InfoMatchingService_(self, v11, MatchingService, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CWFGetOSLog();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        CWFGetOSLog();
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = MEMORY[0x1E0C81028];
        v21 = MEMORY[0x1E0C81028];
      }

      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        _os_log_send_and_compose_impl();

      v14 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    CWFGetOSLog();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      CWFGetOSLog();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = MEMORY[0x1E0C81028];
      v20 = MEMORY[0x1E0C81028];
    }

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      _os_log_send_and_compose_impl();

    v14 = 0;
  }

  return v14;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_terminatedIO80211VirtualInterfaceMap, 0);
  objc_storeStrong((id *)&self->_publishIO80211VirtualInterfaceMap, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end

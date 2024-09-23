@implementation AOPHapticsController

- (AOPHapticsController)init
{
  AOPHapticsController *v2;
  AOPHapticsController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AOPHapticsController;
  v2 = -[AOPHapticsController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_service = 0;
    v2->_connect = 0;
    v2->_queue = 0;
    v2->_notificationPort = 0;
    v2->_arrivalNotification = 0;
    v2->_cancelHandler = 0;
    v2->_readyHandler = 0;
    *(_WORD *)&v2->_activated._Value = 0;
  }
  else
  {
    if (_AHLog_onceToken != -1)
      dispatch_once(&_AHLog_onceToken, &__block_literal_global);
    if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR))
      -[AOPHapticsController init].cold.1();
  }
  return v3;
}

- (void)dealloc
{
  io_object_t connect;
  io_object_t service;
  io_object_t arrivalNotification;
  IONotificationPort *notificationPort;
  objc_super v7;

  connect = self->_connect;
  if (connect)
    IOObjectRelease(connect);
  service = self->_service;
  if (service)
    IOObjectRelease(service);
  arrivalNotification = self->_arrivalNotification;
  if (arrivalNotification)
    IOObjectRelease(arrivalNotification);
  notificationPort = self->_notificationPort;
  if (notificationPort)
    IONotificationPortDestroy(notificationPort);
  v7.receiver = self;
  v7.super_class = (Class)AOPHapticsController;
  -[AOPHapticsController dealloc](&v7, sel_dealloc);
}

- (void)setCancelHandler:(id)a3
{
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (_AHLog_onceToken != -1)
    dispatch_once(&_AHLog_onceToken, &__block_literal_global);
  v5 = _AHLog_log;
  if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = a3;
    _os_log_impl(&dword_227C59000, v5, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v6, 0xCu);
  }
  if (self->_cancelHandler)
  {
    if (_AHLog_onceToken != -1)
      dispatch_once(&_AHLog_onceToken, &__block_literal_global);
    if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR))
      -[AOPHapticsController setCancelHandler:].cold.1();
  }
  else
  {
    self->_cancelHandler = (id)objc_msgSend(a3, "copy");
  }
}

- (void)setReadyHandler:(id)a3
{
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (_AHLog_onceToken != -1)
    dispatch_once(&_AHLog_onceToken, &__block_literal_global);
  v5 = _AHLog_log;
  if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = a3;
    _os_log_impl(&dword_227C59000, v5, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v6, 0xCu);
  }
  if (self->_readyHandler)
  {
    if (_AHLog_onceToken != -1)
      dispatch_once(&_AHLog_onceToken, &__block_literal_global);
    if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR))
      -[AOPHapticsController setReadyHandler:].cold.1();
  }
  else
  {
    self->_readyHandler = (id)objc_msgSend(a3, "copy");
  }
}

- (void)setDispatchQueue:(id)a3
{
  NSObject *v5;
  OS_dispatch_queue *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (_AHLog_onceToken != -1)
    dispatch_once(&_AHLog_onceToken, &__block_literal_global);
  v5 = _AHLog_log;
  if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = a3;
    _os_log_impl(&dword_227C59000, v5, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v7, 0xCu);
  }
  if (self->_queue)
  {
    if (_AHLog_onceToken != -1)
      dispatch_once(&_AHLog_onceToken, &__block_literal_global);
    if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR))
      -[AOPHapticsController setDispatchQueue:].cold.2();
  }
  else
  {
    v6 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("AOPHapticsDispatchQueue", 0, (dispatch_queue_t)a3);
    self->_queue = v6;
    if (!v6)
    {
      if (_AHLog_onceToken != -1)
        dispatch_once(&_AHLog_onceToken, &__block_literal_global);
      if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR))
        -[AOPHapticsController setDispatchQueue:].cold.1();
    }
  }
}

- (void)activate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_227C59000, v0, v1, "Error: activate should be called only once!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)cancel
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_227C59000, v0, v1, "Error: cancel should be called only once!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (BOOL)setMappings:(id)a3 error:(id *)a4
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  float v15;
  float v16;
  unint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  float v21;
  unsigned int v22;
  char *v23;
  __int16 v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  kern_return_t v33;
  BOOL result;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id *v46;
  AOPHapticsController *v47;
  int v48;
  uint64_t v50;
  uint64_t v51;
  int v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  _BYTE v58[10];
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  __int16 v69;
  int v70;
  _BYTE v71[128];
  _OWORD inputStruct[2];
  __int128 v73;
  uint64_t v74;
  uint64_t v75;

  v46 = a4;
  v75 = *MEMORY[0x24BDAC8D0];
  v74 = 0;
  v73 = 0u;
  memset(inputStruct, 0, sizeof(inputStruct));
  if (_AHLog_onceToken != -1)
    dispatch_once(&_AHLog_onceToken, &__block_literal_global);
  v5 = _AHLog_log;
  if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v58 = a3;
    _os_log_impl(&dword_227C59000, v5, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  if (self->_connect)
  {
    v47 = self;
    LODWORD(inputStruct[0]) = 0;
    *(_QWORD *)((char *)inputStruct + 12) = -1;
    HIDWORD(inputStruct[1]) = 1;
    *((_QWORD *)&v73 + 1) = -1;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v51 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
    if (v51)
    {
      v50 = *(_QWORD *)v54;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v54 != v50)
            objc_enumerationMutation(a3);
          v7 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v6);
          v8 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Action"), v46);
          v9 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("OutputType"));
          v10 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SlotIndex"));
          v11 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Gain"));
          v12 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PreSilenceDuration"));
          v13 = objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Priority"));
          if (!v8
            || (v14 = (void *)v13, objc_msgSend(v8, "unsignedIntValue") >= 2)
            || !v9
            || objc_msgSend(v9, "unsignedIntValue") >= 2
            || !v10
            || !v11
            || (objc_msgSend(v11, "floatValue"), v15 < 0.0)
            || (objc_msgSend(v11, "floatValue"), v16 > 1.0))
          {
            v35 = (void *)MEMORY[0x24BDD1540];
            v36 = *MEMORY[0x24BDD1100];
            v37 = -536870206;
            goto LABEL_31;
          }
          if (v14)
          {
            v17 = objc_msgSend(v14, "unsignedIntegerValue");
            if (v17 > *((unsigned int *)&inputStruct[1] + 7 * objc_msgSend(v8, "unsignedIntegerValue") + 2))
            {
              v18 = objc_msgSend(v14, "unsignedIntegerValue");
              *((_DWORD *)&inputStruct[1] + 7 * objc_msgSend(v8, "unsignedIntegerValue") + 2) = v18;
            }
          }
          v19 = objc_msgSend(v10, "unsignedCharValue");
          v20 = objc_msgSend(v8, "unsignedIntegerValue");
          *((_DWORD *)inputStruct
          + 7 * v20
          + +[AOPHapticsController AHtoHMOutputType:](AOPHapticsController, "AHtoHMOutputType:", objc_msgSend(v9, "unsignedIntValue"))+ 3) = v19;
          objc_msgSend(v11, "floatValue");
          v22 = vcvts_n_s32_f32(v21, 0x10uLL);
          v23 = (char *)inputStruct + 28 * objc_msgSend(v8, "unsignedIntegerValue");
          *(_DWORD *)&v23[4
                        * +[AOPHapticsController AHtoHMOutputType:](AOPHapticsController, "AHtoHMOutputType:", objc_msgSend(v9, "unsignedIntValue"))+ 4] = v22;
          v24 = objc_msgSend(v12, "unsignedIntegerValue");
          v25 = objc_msgSend(v8, "unsignedIntegerValue");
          *((_WORD *)&inputStruct[1]
          + 14 * v25
          + +[AOPHapticsController AHtoHMOutputType:](AOPHapticsController, "AHtoHMOutputType:", objc_msgSend(v9, "unsignedIntValue"))+ 2) = v24;
          if (_AHLog_onceToken != -1)
            dispatch_once(&_AHLog_onceToken, &__block_literal_global);
          v26 = _AHLog_log;
          if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_DEBUG))
          {
            v52 = objc_msgSend(v8, "unsignedIntValue");
            v48 = *((_DWORD *)&inputStruct[1] + 7 * objc_msgSend(v8, "unsignedIntegerValue") + 2);
            v27 = *((_DWORD *)inputStruct + 7 * objc_msgSend(v8, "unsignedIntegerValue") + 3);
            v28 = *((_DWORD *)&inputStruct[1] + 7 * objc_msgSend(v8, "unsignedIntegerValue"));
            v29 = *((_DWORD *)inputStruct + 7 * objc_msgSend(v8, "unsignedIntegerValue") + 1);
            v30 = *((_DWORD *)inputStruct + 7 * objc_msgSend(v8, "unsignedIntegerValue") + 2);
            v31 = *((unsigned __int16 *)&inputStruct[1] + 14 * objc_msgSend(v8, "unsignedIntegerValue") + 2);
            v32 = *((unsigned __int16 *)&inputStruct[1] + 14 * objc_msgSend(v8, "unsignedIntegerValue") + 3);
            *(_DWORD *)buf = 67110912;
            *(_DWORD *)v58 = v52;
            *(_WORD *)&v58[4] = 1024;
            *(_DWORD *)&v58[6] = v48;
            v59 = 1024;
            v60 = v27;
            v61 = 1024;
            v62 = v28;
            v63 = 1024;
            v64 = v29;
            v65 = 1024;
            v66 = v30;
            v67 = 1024;
            v68 = v31;
            v69 = 1024;
            v70 = v32;
            _os_log_debug_impl(&dword_227C59000, v26, OS_LOG_TYPE_DEBUG, "Action 0x%x Priority: %u Asset index[0]: %u index[1]: %u gain[0]: 0x%x gain[1]: 0x%x preSil[0]: %u preSil[1]: %u", buf, 0x32u);
          }
          ++v6;
        }
        while (v51 != v6);
        v51 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
        if (v51)
          continue;
        break;
      }
    }
    v33 = IOConnectCallStructMethod(v47->_connect, 0, inputStruct, 0x38uLL, 0, 0);
    if (!v33)
      return 1;
    v36 = *MEMORY[0x24BDD1100];
    v37 = v33;
    v35 = (void *)MEMORY[0x24BDD1540];
LABEL_31:
    v38 = objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, v37, 0, v46);
  }
  else
  {
    v38 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -536870184, 0);
    if (_AHLog_onceToken != -1)
      dispatch_once(&_AHLog_onceToken, &__block_literal_global);
    if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR))
      -[AOPHapticsController setMappings:error:].cold.2();
  }
  if (!v38)
    return 0;
  if (_AHLog_onceToken != -1)
    dispatch_once(&_AHLog_onceToken, &__block_literal_global);
  v39 = _AHLog_log;
  if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR))
    -[AOPHapticsController setMappings:error:].cold.1(v38, v39, v40, v41, v42, v43, v44, v45);
  if (!v46)
    return 0;
  result = 0;
  *v46 = (id)v38;
  return result;
}

- (BOOL)playSlotIndices:(id)a3 error:(id *)a4
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  float v18;
  float v19;
  unint64_t v20;
  int v21;
  float v22;
  __int16 v23;
  NSObject *v24;
  BOOL v25;
  kern_return_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v39;
  AOPHapticsController *v41;
  id obj;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 inputStruct;
  __int128 v50;
  uint64_t v51;
  uint8_t buf[4];
  _BYTE v53[14];
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  int v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  __int16 v64;
  int v65;
  __int16 v66;
  int v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v51 = 0;
  inputStruct = 0u;
  v50 = 0u;
  v43 = mach_continuous_time();
  if (_AHLog_onceToken != -1)
    dispatch_once(&_AHLog_onceToken, &__block_literal_global);
  v6 = _AHLog_log;
  if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v53 = a3;
    _os_log_impl(&dword_227C59000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  if (!self->_connect)
  {
    v30 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], -536870184, 0);
    if (_AHLog_onceToken != -1)
      dispatch_once(&_AHLog_onceToken, &__block_literal_global);
    if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR))
      -[AOPHapticsController setMappings:error:].cold.2();
    goto LABEL_34;
  }
  if (!a3)
    goto LABEL_32;
  v41 = self;
  v39 = (unsigned __int16)v43 | ((unsigned __int16)getpid() << 16);
  DWORD1(inputStruct) = v39;
  *((_QWORD *)&inputStruct + 1) = v43;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v45, v68, 16);
  if (v7)
  {
    v8 = v7;
    v44 = *(_QWORD *)v46;
    obj = a3;
LABEL_9:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v44)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v9);
      v11 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("OutputType"));
      v12 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SlotIndex"));
      v13 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Gain"));
      v14 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PreSilenceDuration"));
      v15 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Priority"));
      v16 = objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RequestTimestamp"));
      if (!v11)
        break;
      v17 = (void *)v16;
      if (objc_msgSend(v11, "unsignedIntValue") >= 2)
        break;
      if (!v12)
        break;
      if (!v13)
        break;
      objc_msgSend(v13, "floatValue");
      if (v18 < 0.0)
        break;
      objc_msgSend(v13, "floatValue");
      if (v19 > 1.0)
        break;
      if (v15)
      {
        v20 = objc_msgSend(v15, "unsignedIntegerValue");
        if (v20 > HIDWORD(v51))
          HIDWORD(v51) = objc_msgSend(v15, "unsignedIntegerValue");
      }
      if (v17 && objc_msgSend(v17, "unsignedLongLongValue") < v43)
      {
        v43 = objc_msgSend(v17, "unsignedLongLongValue");
        *((_QWORD *)&inputStruct + 1) = v43;
      }
      v21 = objc_msgSend(v12, "unsignedCharValue");
      *((_DWORD *)&v50
      + +[AOPHapticsController AHtoHMOutputType:](AOPHapticsController, "AHtoHMOutputType:", objc_msgSend(v11, "unsignedIntValue"))+ 2) = v21;
      objc_msgSend(v13, "floatValue");
      *((_DWORD *)&v50
      + +[AOPHapticsController AHtoHMOutputType:](AOPHapticsController, "AHtoHMOutputType:", objc_msgSend(v11, "unsignedIntValue"))) = vcvts_n_s32_f32(v22, 0x10uLL);
      v23 = objc_msgSend(v14, "unsignedIntegerValue");
      *((_WORD *)&v50
      + +[AOPHapticsController AHtoHMOutputType:](AOPHapticsController, "AHtoHMOutputType:", objc_msgSend(v11, "unsignedIntValue"))+ 8) = v23;
      if (v8 == ++v9)
      {
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v68, 16);
        if (v8)
          goto LABEL_9;
        goto LABEL_26;
      }
    }
LABEL_32:
    v29 = (void *)MEMORY[0x24BDD1540];
    v27 = *MEMORY[0x24BDD1100];
    v28 = -536870206;
    goto LABEL_33;
  }
LABEL_26:
  if (_AHLog_onceToken != -1)
    dispatch_once(&_AHLog_onceToken, &__block_literal_global);
  v24 = _AHLog_log;
  if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67111168;
    *(_DWORD *)v53 = v39;
    *(_WORD *)&v53[4] = 2048;
    *(_QWORD *)&v53[6] = v43;
    v54 = 1024;
    v55 = HIDWORD(v51);
    v56 = 1024;
    v57 = DWORD2(v50);
    v58 = 1024;
    v59 = HIDWORD(v50);
    v60 = 1024;
    v61 = v50;
    v62 = 1024;
    v63 = DWORD1(v50);
    v64 = 1024;
    v65 = (unsigned __int16)v51;
    v66 = 1024;
    v67 = WORD1(v51);
    _os_log_debug_impl(&dword_227C59000, v24, OS_LOG_TYPE_DEBUG, "RequestID: %u RequestTS: %llu Prority: %u Asset index[0]: %u index[1]: %u gain[0]: 0x%x gain[1]: 0x%x preSil[0]: %u preSil[1]: %u", buf, 0x3Cu);
  }
  v25 = 1;
  v26 = IOConnectCallStructMethod(v41->_connect, 1u, &inputStruct, 0x28uLL, 0, 0);
  if (v26)
  {
    v27 = *MEMORY[0x24BDD1100];
    v28 = v26;
    v29 = (void *)MEMORY[0x24BDD1540];
LABEL_33:
    v30 = (void *)objc_msgSend(v29, "errorWithDomain:code:userInfo:", v27, v28, 0);
    if (!v30)
      return 0;
LABEL_34:
    if (_AHLog_onceToken != -1)
      dispatch_once(&_AHLog_onceToken, &__block_literal_global);
    v31 = _AHLog_log;
    if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_ERROR))
      -[AOPHapticsController setMappings:error:].cold.1((uint64_t)v30, v31, v32, v33, v34, v35, v36, v37);
    if (a4)
    {
      v25 = 0;
      *a4 = v30;
    }
    else
    {
      return 0;
    }
  }
  return v25;
}

- (void)_findService
{
  IONotificationPort *v3;
  IONotificationPort *notificationPort;
  const __CFDictionary *v5;

  v3 = IONotificationPortCreate(*MEMORY[0x24BDD8B20]);
  self->_notificationPort = v3;
  if (v3)
  {
    IONotificationPortSetDispatchQueue(v3, (dispatch_queue_t)self->_queue);
    notificationPort = self->_notificationPort;
    v5 = IOServiceNameMatching("AppleSPUHapticsManagerDriver");
    if (!IOServiceAddMatchingNotification(notificationPort, "IOServiceMatched", v5, (IOServiceMatchingCallback)AOPMatchedCallback, self, &self->_arrivalNotification))AOPMatchedCallback(self, self->_arrivalNotification);
  }
}

- (void)signalReady
{
  NSObject *v3;
  id readyHandler;
  uint8_t v5[16];

  if (_AHLog_onceToken != -1)
    dispatch_once(&_AHLog_onceToken, &__block_literal_global);
  v3 = _AHLog_log;
  if (os_log_type_enabled((os_log_t)_AHLog_log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_227C59000, v3, OS_LOG_TYPE_INFO, "signalReady", v5, 2u);
  }
  readyHandler = self->_readyHandler;
  if (readyHandler)
  {
    dispatch_async((dispatch_queue_t)self->_queue, readyHandler);

    self->_readyHandler = 0;
  }
}

+ (int)AHtoHMOutputType:(unsigned __int8)a3
{
  int v3;

  if (a3 == 1)
    v3 = 1;
  else
    v3 = 2;
  if (a3)
    return v3;
  else
    return 0;
}

- (unsigned)service
{
  return self->_service;
}

- (void)setService:(unsigned int)a3
{
  self->_service = a3;
}

- (unsigned)connect
{
  return self->_connect;
}

- (void)setConnect:(unsigned int)a3
{
  self->_connect = a3;
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_227C59000, v0, v1, "init failed!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setCancelHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_227C59000, v0, v1, "Cancel handler already set!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setReadyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_227C59000, v0, v1, "Ready handler already set!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setDispatchQueue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_227C59000, v0, v1, "Error creating queue!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setDispatchQueue:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_227C59000, v0, v1, "Dispatch queue already set!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setMappings:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_227C59000, a2, a3, "Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)setMappings:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_227C59000, v0, v1, "Error: object not activated!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

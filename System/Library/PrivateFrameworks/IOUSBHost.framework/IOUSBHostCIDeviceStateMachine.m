@implementation IOUSBHostCIDeviceStateMachine

- (IOUSBHostCIDeviceStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface command:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  IOUSBHostControllerInterface *v8;
  IOUSBHostCIDeviceStateMachine *v9;
  IOUSBHostCIDeviceStateMachine *v10;
  IOUSBHostCIDeviceStateMachine *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  const char *v20;
  objc_super v22;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v8 = interface;
  v22.receiver = self;
  v22.super_class = (Class)IOUSBHostCIDeviceStateMachine;
  v9 = -[IOUSBHostCIDeviceStateMachine init](&v22, sel_init);
  v10 = v9;
  if (!v9)
  {
    if (error)
    {
      v23[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostCIDeviceStateMachine."), &stru_24DEDD560, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v13;
      v23[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("init failed."), &stru_24DEDD560, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v15;
      v23[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870211, v18);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v19)
        -[IOUSBHostCIDeviceStateMachine initWithInterface:command:error:].cold.1(v19, v20);

    }
    goto LABEL_8;
  }
  -[IOUSBHostCIDeviceStateMachine setControllerInterface:](v9, "setControllerInterface:", v8);
  if (-[IOUSBHostCIDeviceStateMachine inspectCommand:error:](v10, "inspectCommand:error:", command, error))
  {
LABEL_8:
    v11 = v10;
    goto LABEL_9;
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (BOOL)processCommand:(const IOUSBHostCIMessage *)a3 readonly:(BOOL)a4 error:(id *)a5
{
  IOUSBHostCIDeviceState v9;
  uint32_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL8 v27;
  const char *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL8 v35;
  const char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint32_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _BOOL8 v62;
  const char *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  IOUSBHostCIDeviceStateMachine *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  if ((a3->control & 0xC000) != 0x8000)
  {
    if (a5)
    {
      v85 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v22;
      v86 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Command failed common validation checks."), &stru_24DEDD560, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v24;
      v87 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v88, &v85, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v18);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      v27 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v27)
        -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.5(v27, v28);
      goto LABEL_50;
    }
    return 0;
  }
  if (-[IOUSBHostCIDeviceStateMachine completeRoute](self, "completeRoute") || (a3->data0 & 0xFFFFFF) == 0)
  {
    if (-[IOUSBHostCIDeviceStateMachine deviceAddress](self, "deviceAddress") != LOBYTE(a3->data0))
    {
      if (a5)
      {
        v85 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v30;
        v86 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Command does not target this state machine instance."), &stru_24DEDD560, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = v32;
        v87 = *MEMORY[0x24BDD0FF0];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = v34;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v88, &v85, 3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v18);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        v35 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v35)
          -[IOUSBHostCIEndpointStateMachine processCommand:readonly:error:].cold.12(v35, v36);
        goto LABEL_50;
      }
      return 0;
    }
    v9 = -[IOUSBHostCIDeviceStateMachine deviceState](self, "deviceState");
    if (v9)
    {
      if (v9 == IOUSBHostCIDeviceStatePaused)
      {
        v49 = (a3->control & 0x3F) - 32;
        v11 = 1;
        switch(v49)
        {
          case 0u:
          case 3u:
            if (!a5)
              return 0;
            v85 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = v51;
            v86 = *MEMORY[0x24BDD0FD8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed in the current state."), &stru_24DEDD560, 0);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = v53;
            v87 = *MEMORY[0x24BDD0FF0];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = v55;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v88, &v85, 3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v18);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v19)
              goto LABEL_29;
            goto LABEL_50;
          case 1u:
LABEL_40:
            if (a4)
              return v11;
            -[IOUSBHostCIDeviceStateMachine setDeviceAddress:](self, "setDeviceAddress:", 0);
            v70 = self;
            v71 = 0;
            break;
          case 2u:
            if (a4)
              return v11;
            v70 = self;
            v71 = 2;
            break;
          case 4u:
            return v11;
          default:
            if (!a5)
              return 0;
            v85 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = v79;
            v86 = *MEMORY[0x24BDD0FD8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("Command is not handled by the device state machine."), &stru_24DEDD560, 0);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = v81;
            v87 = *MEMORY[0x24BDD0FF0];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = v83;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v88, &v85, 3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v18);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            v62 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v62)
              goto LABEL_49;
            goto LABEL_50;
        }
      }
      else
      {
        if (v9 != IOUSBHostCIDeviceStateActive)
          return 0;
        v10 = (a3->control & 0x3F) - 32;
        v11 = 1;
        switch(v10)
        {
          case 0u:
          case 2u:
            if (!a5)
              return 0;
            v85 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = v13;
            v86 = *MEMORY[0x24BDD0FD8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed in the current state."), &stru_24DEDD560, 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = v15;
            v87 = *MEMORY[0x24BDD0FF0];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = v17;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v88, &v85, 3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v18);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v19)
              goto LABEL_29;
            goto LABEL_50;
          case 1u:
            goto LABEL_40;
          case 3u:
            if (a4)
              return v11;
            v70 = self;
            v71 = 1;
            break;
          case 4u:
            return v11;
          default:
            if (!a5)
              return 0;
            v85 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = v73;
            v86 = *MEMORY[0x24BDD0FD8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "localizedStringForKey:value:table:", CFSTR("Command is not handled by the device state machine."), &stru_24DEDD560, 0);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = v75;
            v87 = *MEMORY[0x24BDD0FF0];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = v77;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v88, &v85, 3);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v18);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            v62 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v62)
              goto LABEL_49;
            goto LABEL_50;
        }
      }
      -[IOUSBHostCIDeviceStateMachine setDeviceState:](v70, "setDeviceState:", v71);
      return v11;
    }
    if ((a3->control & 0x3F) - 32 <= 4)
    {
      if (a5)
      {
        v85 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = v44;
        v86 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed in the current state."), &stru_24DEDD560, 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = v46;
        v87 = *MEMORY[0x24BDD0FF0];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = v48;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v88, &v85, 3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v18);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v19)
          goto LABEL_29;
        goto LABEL_50;
      }
      return 0;
    }
    if (!a5)
      return 0;
    v85 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v57;
    v86 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "localizedStringForKey:value:table:", CFSTR("Command is not handled by the device state machine."), &stru_24DEDD560, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v59;
    v87 = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v61;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v88, &v85, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v18);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v62 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!v62)
      goto LABEL_50;
LABEL_49:
    -[IOUSBHostCIEndpointStateMachine processCommand:readonly:error:].cold.2(v62, v63);
    goto LABEL_50;
  }
  if ((a3->control & 0x3F) - 33 < 4)
  {
    if (a5)
    {
      v85 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v38;
      v86 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed in the current state."), &stru_24DEDD560, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = v40;
      v87 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v42;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v88, &v85, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v18);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v19)
LABEL_29:
        -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.2(v19, v20);
LABEL_50:

      return 0;
    }
    return 0;
  }
  if ((a3->control & 0x3F) != 0x20)
  {
    if (!a5)
      return 0;
    v85 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v65;
    v86 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("Command is not handled by the device state machine."), &stru_24DEDD560, 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v67;
    v87 = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v69;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v88, &v85, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v18);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v62 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!v62)
      goto LABEL_50;
    goto LABEL_49;
  }
  if (!a4)
  {
    -[IOUSBHostCIDeviceStateMachine setDeviceState:](self, "setDeviceState:", 2);
    -[IOUSBHostCIDeviceStateMachine setCompleteRoute:](self, "setCompleteRoute:", a3->data0 & 0xFFFFFF);
  }
  return 1;
}

- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  return -[IOUSBHostCIDeviceStateMachine processCommand:readonly:error:](self, "processCommand:readonly:error:", command, 1, error);
}

- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error
{
  uint32_t control;
  char v11;
  int data0_low;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  const char *v22;
  _QWORD v23[3];
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  control = command->control;
  if ((command->control & 0x3F) == 0x20)
    return -[IOUSBHostCIDeviceStateMachine respondToCommand:status:deviceAddress:error:](self, "respondToCommand:status:deviceAddress:error:", command, *(_QWORD *)&status, 0, error);
  if ((command->control & 0xC000) != 0x8000)
  {
    if (error)
    {
      v23[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Command response was not sent."), &stru_24DEDD560, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v15;
      v23[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Command failed common validation checks."), &stru_24DEDD560, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v17;
      v23[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, v23, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v20);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v21)
        -[IOUSBHostCIPortStateMachine respondToCommand:status:error:].cold.2(v21, v22);

    }
    return 0;
  }
  if (status != IOUSBHostCIMessageStatusSuccess)
    goto LABEL_7;
  v11 = 0;
  if (-[IOUSBHostCIDeviceStateMachine processCommand:readonly:error:](self, "processCommand:readonly:error:", command, 0, error))
  {
    control = command->control;
LABEL_7:
    data0_low = LOBYTE(command->data0);
    LODWORD(v24) = control & 0x3F | (status << 8) | 0xC000;
    HIDWORD(v24) = data0_low;
    v25 = 0;
    -[IOUSBHostCIDeviceStateMachine controllerInterface](self, "controllerInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v13, "enqueueInterrupt:error:", &v24, error);

  }
  return v11;
}

- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status deviceAddress:(NSUInteger)deviceAddress error:(NSError *)error
{
  uint32_t control;
  char v12;
  uint32_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  const char *v24;
  _QWORD v26[3];
  void *v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  control = command->control;
  if ((command->control & 0xC03F) == 0x8020)
  {
    if (status == IOUSBHostCIMessageStatusSuccess && deviceAddress - 1 <= 0xFE)
    {
      v12 = 0;
      if (!-[IOUSBHostCIDeviceStateMachine processCommand:readonly:error:](self, "processCommand:readonly:error:", command, 0, error))return v12;
      -[IOUSBHostCIDeviceStateMachine setDeviceAddress:](self, "setDeviceAddress:", deviceAddress);
      control = command->control;
    }
    v13 = command->data0 & 0xFFFFFF;
    LODWORD(v27) = control & 0x3F | (status << 8) | 0xC000;
    HIDWORD(v27) = v13;
    if (status == IOUSBHostCIMessageStatusSuccess)
      v14 = deviceAddress;
    else
      v14 = 0;
    v28 = v14;
    -[IOUSBHostCIDeviceStateMachine controllerInterface](self, "controllerInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v15, "enqueueInterrupt:error:", &v27, error);

  }
  else
  {
    if (error)
    {
      v26[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Command response was not sent."), &stru_24DEDD560, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v17;
      v26[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Command failed common validation checks."), &stru_24DEDD560, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (unint64_t)v19;
      v26[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v21;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, v26, 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v22);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v23)
        -[IOUSBHostCIPortStateMachine respondToCommand:status:error:].cold.2(v23, v24);

    }
    return 0;
  }
  return v12;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Device %d State %s"), (unsigned __int16)-[IOUSBHostCIDeviceStateMachine deviceAddress](self, "deviceAddress"), IOUSBHostCIDeviceStateToString(-[IOUSBHostCIDeviceStateMachine deviceState](self, "deviceState")));
}

- (IOUSBHostCIDeviceState)deviceState
{
  return self->_deviceState;
}

- (void)setDeviceState:(int)a3
{
  self->_deviceState = a3;
}

- (NSUInteger)completeRoute
{
  return self->_completeRoute;
}

- (void)setCompleteRoute:(unint64_t)a3
{
  self->_completeRoute = a3;
}

- (NSUInteger)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(unint64_t)a3
{
  self->_deviceAddress = a3;
}

- (IOUSBHostControllerInterface)controllerInterface
{
  return self->_controllerInterface;
}

- (void)setControllerInterface:(id)a3
{
  objc_storeStrong((id *)&self->_controllerInterface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerInterface, 0);
}

- (void)initWithInterface:(uint64_t)a1 command:(const char *)a2 error:.cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostCIDeviceStateMachine."), a2);
  OUTLINED_FUNCTION_2(CFSTR("init failed."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

@end

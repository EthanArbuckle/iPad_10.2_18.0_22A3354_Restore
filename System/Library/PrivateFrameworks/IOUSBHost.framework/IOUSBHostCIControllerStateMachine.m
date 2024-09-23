@implementation IOUSBHostCIControllerStateMachine

- (IOUSBHostCIControllerStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface error:(NSError *)error
{
  IOUSBHostControllerInterface *v6;
  IOUSBHostCIControllerStateMachine *v7;
  IOUSBHostCIControllerStateMachine *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  const char *v17;
  objc_super v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v6 = interface;
  v19.receiver = self;
  v19.super_class = (Class)IOUSBHostCIControllerStateMachine;
  v7 = -[IOUSBHostCIControllerStateMachine init](&v19, sel_init);
  v8 = v7;
  if (v7)
  {
    -[IOUSBHostCIControllerStateMachine setControllerState:](v7, "setControllerState:", 0);
    -[IOUSBHostCIControllerStateMachine setControllerInterface:](v8, "setControllerInterface:", v6);
  }
  else if (error)
  {
    v20[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostCIControllerStateMachine."), &stru_24DEDD560, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v20[1] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("init failed."), &stru_24DEDD560, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v12;
    v20[2] = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870211, v15);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v16)
      -[IOUSBHostCIPortStateMachine initWithInterface:portNumber:error:].cold.1(v16, v17);

  }
  return v8;
}

- (BOOL)processCommand:(const IOUSBHostCIMessage *)a3 readonly:(BOOL)a4 error:(id *)a5
{
  IOUSBHostCIControllerState v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  const char *v26;
  BOOL v27;
  uint32_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
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
  _BOOL8 v48;
  const char *v49;
  IOUSBHostCIControllerStateMachine *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  IOUSBHostCIControllerStateMachine *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  if ((a3->control & 0xC000) == 0x8000)
  {
    v9 = -[IOUSBHostCIControllerStateMachine controllerState](self, "controllerState");
    if (v9 != IOUSBHostCIControllerStateActive)
    {
      if (v9 == IOUSBHostCIControllerStatePaused)
      {
        switch(a3->control & 0x3F)
        {
          case 0x10u:
          case 0x13u:
          case 0x14u:
            if (!a5)
              return 0;
            v66 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = v37;
            v67 = *MEMORY[0x24BDD0FD8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed in the current state."), &stru_24DEDD560, 0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v39;
            v68 = *MEMORY[0x24BDD0FF0];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = v41;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v66, 3);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v16);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v17)
              goto LABEL_22;
            goto LABEL_12;
          case 0x11u:
            if (a4)
              return 1;
            -[IOUSBHostCIControllerStateMachine setLastFrameNumber:](self, "setLastFrameNumber:", 0);
            -[IOUSBHostCIControllerStateMachine setLastFrameTimestamp:](self, "setLastFrameTimestamp:", 0);
            v58 = self;
            v59 = 0;
            break;
          case 0x12u:
            if (a4)
              return 1;
            v58 = self;
            v59 = 2;
            break;
          default:
            if (!a5)
              return 0;
            v66 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = v53;
            v67 = *MEMORY[0x24BDD0FD8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("Command is not handled by the controller state machine."), &stru_24DEDD560, 0);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v55;
            v68 = *MEMORY[0x24BDD0FF0];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = v57;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v66, 3);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v16);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            v48 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v48)
              goto LABEL_45;
            goto LABEL_12;
        }
        -[IOUSBHostCIControllerStateMachine setControllerState:](v58, "setControllerState:", v59);
      }
      else
      {
        if (v9)
          return 0;
        if ((a3->control & 0x3F) - 17 < 4)
        {
          if (a5)
          {
            v66 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = v11;
            v67 = *MEMORY[0x24BDD0FD8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed in the current state."), &stru_24DEDD560, 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v13;
            v68 = *MEMORY[0x24BDD0FF0];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = v15;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v66, 3);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v16);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v17)
LABEL_22:
              -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.2(v17, v18);
LABEL_12:

            return 0;
          }
          return 0;
        }
        if ((a3->control & 0x3F) != 0x10)
        {
          if (!a5)
            return 0;
          v66 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v61;
          v67 = *MEMORY[0x24BDD0FD8];
          objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("Command is not handled by the controller state machine."), &stru_24DEDD560, 0);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v63;
          v68 = *MEMORY[0x24BDD0FF0];
          objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v65;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v66, 3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v16);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          v48 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v48)
LABEL_45:
            -[IOUSBHostCIControllerStateMachine processCommand:readonly:error:].cold.1(v48, v49);
          goto LABEL_12;
        }
        if (!a4)
        {
          v27 = 1;
LABEL_32:
          v50 = self;
          v51 = 1;
LABEL_33:
          -[IOUSBHostCIControllerStateMachine setControllerState:](v50, "setControllerState:", v51);
          return v27;
        }
      }
      return 1;
    }
    v29 = (a3->control & 0x3F) - 16;
    v27 = 1;
    switch(v29)
    {
      case 0u:
      case 2u:
        if (!a5)
          return 0;
        v66 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v31;
        v67 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed in the current state."), &stru_24DEDD560, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v33;
        v68 = *MEMORY[0x24BDD0FF0];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v35;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v66, 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v17)
          goto LABEL_22;
        goto LABEL_12;
      case 1u:
        if (a4)
          return v27;
        -[IOUSBHostCIControllerStateMachine setLastFrameNumber:](self, "setLastFrameNumber:", 0);
        -[IOUSBHostCIControllerStateMachine setLastFrameTimestamp:](self, "setLastFrameTimestamp:", 0);
        v50 = self;
        v51 = 0;
        break;
      case 3u:
        if (!a4)
          goto LABEL_32;
        return v27;
      case 4u:
        return v27;
      default:
        if (!a5)
          return 0;
        v66 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v43;
        v67 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("Command is not handled by the controller state machine."), &stru_24DEDD560, 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v45;
        v68 = *MEMORY[0x24BDD0FF0];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v47;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v66, 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v16);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        v48 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v48)
          goto LABEL_45;
        goto LABEL_12;
    }
    goto LABEL_33;
  }
  if (a5)
  {
    v66 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v20;
    v67 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Command failed common validation checks."), &stru_24DEDD560, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v22;
    v68 = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v66, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v25)
      -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.5(v25, v26);
    goto LABEL_12;
  }
  return 0;
}

- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  return -[IOUSBHostCIControllerStateMachine processCommand:readonly:error:](self, "processCommand:readonly:error:", command, 1, error);
}

- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error
{
  uint32_t control;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  const char *v20;
  _QWORD v22[3];
  unint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  control = command->control;
  if ((command->control & 0xC000) == 0x8000)
  {
    if (status != IOUSBHostCIMessageStatusSuccess)
    {
LABEL_5:
      v23 = control & 0x3F | (status << 8) | 0xC000;
      v24 = 0;
      -[IOUSBHostCIControllerStateMachine controllerInterface](self, "controllerInterface");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "enqueueInterrupt:error:", &v23, error);

      return v10;
    }
    v10 = 0;
    if (-[IOUSBHostCIControllerStateMachine processCommand:readonly:error:](self, "processCommand:readonly:error:"))
    {
      control = command->control;
      goto LABEL_5;
    }
  }
  else
  {
    if (error)
    {
      v22[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Command response was not sent."), &stru_24DEDD560, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (unint64_t)v13;
      v22[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Command failed common validation checks."), &stru_24DEDD560, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v15;
      v22[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, v22, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v18);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v19)
        -[IOUSBHostCIPortStateMachine respondToCommand:status:error:].cold.2(v19, v20);

    }
    return 0;
  }
  return v10;
}

- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status frame:(uint64_t)frame timestamp:(uint64_t)timestamp error:(NSError *)error
{
  uint32_t control;
  char v14;
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
  unint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  control = command->control;
  if ((command->control & 0xC03F) != 0x8014)
  {
    if (error)
    {
      v26[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Command response was not sent."), &stru_24DEDD560, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (unint64_t)v17;
      v26[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Command failed common validation checks."), &stru_24DEDD560, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v19;
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
  if (status != IOUSBHostCIMessageStatusSuccess)
  {
LABEL_6:
    v27 = control & 0x3F | (status << 8) | 0xC000;
    v28 = 0;
    -[IOUSBHostCIControllerStateMachine controllerInterface](self, "controllerInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "enqueueInterrupt:error:", &v27, error);

    return v14;
  }
  v14 = 0;
  if (-[IOUSBHostCIControllerStateMachine processCommand:readonly:error:](self, "processCommand:readonly:error:"))
  {
    if (-[IOUSBHostCIControllerStateMachine enqueueUpdatedFrame:timestamp:error:](self, "enqueueUpdatedFrame:timestamp:error:", frame, timestamp, error))
    {
      control = command->control;
      goto LABEL_6;
    }
    return 0;
  }
  return v14;
}

- (BOOL)enqueueUpdatedFrame:(uint64_t)frame timestamp:(uint64_t)timestamp error:(NSError *)error
{
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
  int v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (-[IOUSBHostCIControllerStateMachine controllerState](self, "controllerState") != IOUSBHostCIControllerStateActive)
  {
    if (error)
    {
      v32 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Frame update was not sent."), &stru_24DEDD560, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v19;
      v33 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Frame updates are not meaningful in the current state."), &stru_24DEDD560, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v21;
      v34 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v23;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v32, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870184, v15);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v24 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v24)
        -[IOUSBHostCIControllerStateMachine enqueueUpdatedFrame:timestamp:error:].cold.2(v24, v25);
      goto LABEL_10;
    }
LABEL_11:
    LOBYTE(v26) = 0;
    return v26;
  }
  if (-[IOUSBHostCIControllerStateMachine lastFrameNumber](self, "lastFrameNumber") > frame
    || -[IOUSBHostCIControllerStateMachine lastFrameTimestamp](self, "lastFrameTimestamp") > timestamp)
  {
    if (error)
    {
      v32 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Frame update was not sent."), &stru_24DEDD560, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v10;
      v33 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("The frame number or timestamp cannot regress."), &stru_24DEDD560, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v12;
      v34 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v32, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v15);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v16)
        -[IOUSBHostCIControllerStateMachine enqueueUpdatedFrame:timestamp:error:].cold.1(v16, v17);
LABEL_10:

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  -[IOUSBHostCIControllerStateMachine controllerInterface](self, "controllerInterface", 49161, frame, 49162, timestamp);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v28, "enqueueInterrupts:count:error:", &v29, 2, error);

  if (v26)
  {
    -[IOUSBHostCIControllerStateMachine setLastFrameNumber:](self, "setLastFrameNumber:", frame);
    -[IOUSBHostCIControllerStateMachine setLastFrameTimestamp:](self, "setLastFrameTimestamp:", timestamp);
  }
  return v26;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[IOUSBHostCIControllerStateMachine controllerInterface](self, "controllerInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Conroller %@ State %s"), v6, IOUSBHostCIControllerStateToString(-[IOUSBHostCIControllerStateMachine controllerState](self, "controllerState")));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (IOUSBHostCIControllerState)controllerState
{
  return self->_controllerState;
}

- (void)setControllerState:(int)a3
{
  self->_controllerState = a3;
}

- (IOUSBHostControllerInterface)controllerInterface
{
  return self->_controllerInterface;
}

- (void)setControllerInterface:(id)a3
{
  objc_storeStrong((id *)&self->_controllerInterface, a3);
}

- (unint64_t)lastFrameNumber
{
  return self->_lastFrameNumber;
}

- (void)setLastFrameNumber:(unint64_t)a3
{
  self->_lastFrameNumber = a3;
}

- (unint64_t)lastFrameTimestamp
{
  return self->_lastFrameTimestamp;
}

- (void)setLastFrameTimestamp:(unint64_t)a3
{
  self->_lastFrameTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerInterface, 0);
}

- (void)processCommand:(uint64_t)a1 readonly:(const char *)a2 error:.cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Command cannot be processed successfully."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Command is not handled by the controller state machine."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)enqueueUpdatedFrame:(uint64_t)a1 timestamp:(const char *)a2 error:.cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Frame update was not sent."), a2);
  OUTLINED_FUNCTION_2(CFSTR("The frame number or timestamp cannot regress."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)enqueueUpdatedFrame:(uint64_t)a1 timestamp:(const char *)a2 error:.cold.2(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Frame update was not sent."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Frame updates are not meaningful in the current state."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

@end

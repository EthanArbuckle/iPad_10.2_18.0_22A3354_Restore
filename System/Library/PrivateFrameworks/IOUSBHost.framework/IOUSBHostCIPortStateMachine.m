@implementation IOUSBHostCIPortStateMachine

- (IOUSBHostCIPortStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface portNumber:(NSUInteger)portNumber error:(NSError *)error
{
  IOUSBHostControllerInterface *v8;
  IOUSBHostCIPortStateMachine *v9;
  IOUSBHostCIPortStateMachine *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  const char *v19;
  IOUSBHostCIPortStateMachine *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  const char *v29;
  objc_super v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = interface;
  v31.receiver = self;
  v31.super_class = (Class)IOUSBHostCIPortStateMachine;
  v9 = -[IOUSBHostCIPortStateMachine init](&v31, sel_init);
  v10 = v9;
  if (!v9)
  {
    if (error)
    {
      v32 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostCIControllerStateMachine."), &stru_24DEDD560, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v22;
      v33 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("init failed."), &stru_24DEDD560, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v24;
      v34 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v32, 3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870211, v27);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v28 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v28)
        -[IOUSBHostCIPortStateMachine initWithInterface:portNumber:error:].cold.1(v28, v29);

    }
    goto LABEL_13;
  }
  -[IOUSBHostCIPortStateMachine setPortNumber:](v9, "setPortNumber:", portNumber);
  if (-[IOUSBHostCIPortStateMachine portNumber](v10, "portNumber") < 0x10)
  {
    -[IOUSBHostCIPortStateMachine setPortState:](v10, "setPortState:", 0);
    -[IOUSBHostCIPortStateMachine setControllerInterface:](v10, "setControllerInterface:", v8);
LABEL_13:
    v20 = v10;
    goto LABEL_14;
  }
  if (error)
  {
    v32 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostCIControllerStateMachine."), &stru_24DEDD560, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v12;
    v33 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Port number is too high."), &stru_24DEDD560, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v14;
    v34 = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v32, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v17);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v18)
      -[IOUSBHostCIPortStateMachine initWithInterface:portNumber:error:].cold.2(v18, v19);

  }
  v20 = 0;
LABEL_14:

  return v20;
}

- (BOOL)processCommand:(const IOUSBHostCIMessage *)a3 readonly:(BOOL)a4 commandResult:(int)a5 error:(id *)a6
{
  IOUSBHostCIPortState v11;
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
  BOOL v29;
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
  _BOOL8 v43;
  const char *v44;
  IOUSBHostCIPortStateMachine *v45;
  uint64_t v46;
  IOUSBHostCIPortState v47;
  IOUSBHostCIPortState v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  if ((a3->control & 0xC000) != 0x8000
    || -[IOUSBHostCIPortStateMachine portNumber](self, "portNumber") != (a3->data0 & 0xF))
  {
    if (!a6)
      return 0;
    v55 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v22;
    v56 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Command failed common validation checks."), &stru_24DEDD560, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v24;
    v57 = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v26;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v55, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v18);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v27)
      -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.5(v27, v28);
LABEL_11:

    return 0;
  }
  v11 = -[IOUSBHostCIPortStateMachine portState](self, "portState");
  if (v11 - 1 < 3)
  {
    switch(a3->control & 0x3F)
    {
      case 0x18u:
        if (!a6)
          return 0;
        v55 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v13;
        v56 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed in the current state."), &stru_24DEDD560, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v15;
        v57 = *MEMORY[0x24BDD0FF0];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v55, 3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v18);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v19)
          goto LABEL_7;
        goto LABEL_11;
      case 0x19u:
        if (a4)
          return 1;
        -[IOUSBHostCIPortStateMachine setPowered:](self, "setPowered:", 0);
        v45 = self;
        v46 = 0;
        goto LABEL_33;
      case 0x1Au:
        v47 = -[IOUSBHostCIPortStateMachine portState](self, "portState");
        v29 = v47 == IOUSBHostCIPortStateSuspended;
        if (v47 != IOUSBHostCIPortStateSuspended || a4)
          return v29;
        goto LABEL_32;
      case 0x1Bu:
        v48 = -[IOUSBHostCIPortStateMachine portState](self, "portState");
        v29 = v48 == IOUSBHostCIPortStateActive;
        if (v48 != IOUSBHostCIPortStateActive || a4)
          return v29;
        v45 = self;
        v46 = 2;
        goto LABEL_33;
      case 0x1Cu:
        if (a4)
          return 1;
        if (a5 != 1)
          goto LABEL_35;
LABEL_32:
        v45 = self;
        v46 = 3;
LABEL_33:
        -[IOUSBHostCIPortStateMachine setPortState:](v45, "setPortState:", v46);
        return 1;
      case 0x1Du:
        if (a4)
          return 1;
LABEL_35:
        v29 = 1;
        goto LABEL_36;
      case 0x1Eu:
        if (!a4)
          -[IOUSBHostCIPortStateMachine setPortStatus:](self, "setPortStatus:", -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & (~LODWORD(a3->data1) | 0xFFE9FFFF));
        return 1;
      default:
        if (!a6)
          return 0;
        v55 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v38;
        v56 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("Command is not handled by the port state machine."), &stru_24DEDD560, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v40;
        v57 = *MEMORY[0x24BDD0FF0];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v42;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v55, 3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v18);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        v43 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v43)
          goto LABEL_21;
        goto LABEL_11;
    }
  }
  if (v11)
    return 0;
  if ((a3->control & 0x3F) - 25 < 6)
  {
    if (!a6)
      return 0;
    v55 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v32;
    v56 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed in the current state."), &stru_24DEDD560, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v34;
    v57 = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v36;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v55, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v18);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v19)
LABEL_7:
      -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.2(v19, v20);
    goto LABEL_11;
  }
  if ((a3->control & 0x3F) != 0x18)
  {
    if (!a6)
      return 0;
    v55 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v50;
    v56 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("Command is not handled by the port state machine."), &stru_24DEDD560, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v52;
    v57 = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v54;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v55, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v18);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    v43 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v43)
LABEL_21:
      -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.1(v43, v44);
    goto LABEL_11;
  }
  if (a4)
    return 1;
  v29 = 1;
  -[IOUSBHostCIPortStateMachine setPowered:](self, "setPowered:", 1);
LABEL_36:
  -[IOUSBHostCIPortStateMachine setPortState:](self, "setPortState:", 1);
  return v29;
}

- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  return -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:](self, "processCommand:readonly:commandResult:error:", command, 1, 1, error);
}

- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error
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
  char v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if ((command->control & 0xC000) == 0x8000)
  {
    if (status == IOUSBHostCIMessageStatusSuccess)
    {
      if ((command->control & 0x3F) == 0x1C)
      {
        if ((-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 0xF0) != 0)
        {
          if (error)
          {
            v29 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Command response was not sent."), &stru_24DEDD560, 0);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = v10;
            v30 = *MEMORY[0x24BDD0FD8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("A successful IOUSBHostCIMessageTypePortReset requires a U0 link state."), &stru_24DEDD560, 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (unint64_t)v12;
            v31 = *MEMORY[0x24BDD0FF0];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v14;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v29, 3);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870184, v15);
            *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
            v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v16)
              -[IOUSBHostCIPortStateMachine respondToCommand:status:error:].cold.1(v16, v17);
LABEL_11:

            return 0;
          }
          return 0;
        }
        v26 = 0;
        if (!-[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:](self, "processCommand:readonly:commandResult:error:", command, 0, 1, error))return v26;
      }
      else
      {
        v26 = 0;
        if (!-[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:](self, "processCommand:readonly:commandResult:error:", command, 0, 1, error))return v26;
      }
    }
    LODWORD(v32) = command->control & 0x3F | (status << 8) | 0xC000;
    BYTE4(v32) = -[IOUSBHostCIPortStateMachine portNumber](self, "portNumber");
    HIDWORD(v32) = BYTE4(v32);
    v33 = -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus");
    -[IOUSBHostCIPortStateMachine controllerInterface](self, "controllerInterface");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v27, "enqueueInterrupt:error:", &v32, error);

    return v26;
  }
  if (error)
  {
    v29 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Command response was not sent."), &stru_24DEDD560, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v19;
    v30 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Command failed common validation checks."), &stru_24DEDD560, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (unint64_t)v21;
    v31 = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v29, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v15);
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v24)
      -[IOUSBHostCIPortStateMachine respondToCommand:status:error:].cold.2(v24, v25);
    goto LABEL_11;
  }
  return 0;
}

- (void)setPowered:(BOOL)powered
{
  uint64_t v5;

  if (-[IOUSBHostCIPortStateMachine powered](self, "powered") != powered)
  {
    self->_powered = powered;
    if (powered)
    {
      -[IOUSBHostCIPortStateMachine setPortStatus:](self, "setPortStatus:", -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") | 1);
      -[IOUSBHostCIPortStateMachine setPortStatus:](self, "setPortStatus:", -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 0xFFFFF80FLL);
      -[IOUSBHostCIPortStateMachine setPortStatus:](self, "setPortStatus:", -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") | 0x50);
      v5 = -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus");
    }
    else
    {
      v5 = 0;
      *(_WORD *)&self->_connected = 0;
    }
    -[IOUSBHostCIPortStateMachine setPortStatus:](self, "setPortStatus:", v5);
  }
}

- (void)setConnected:(BOOL)connected
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];

  v3 = connected;
  if (-[IOUSBHostCIPortStateMachine powered](self, "powered")
    && -[IOUSBHostCIPortStateMachine connected](self, "connected") != v3)
  {
    self->_connected = v3;
    if (v3)
    {
      v5 = -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") | 4;
      v6 = 7;
    }
    else
    {
      -[IOUSBHostCIPortStateMachine setPortState:](self, "setPortState:", 1);
      v5 = -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 0xFFFFFFFBLL;
      v6 = 5;
    }
    -[IOUSBHostCIPortStateMachine setPortStatus:](self, "setPortStatus:", v5);
    -[IOUSBHostCIPortStateMachine updateLinkState:speed:inhibitLinkStateChange:error:](self, "updateLinkState:speed:inhibitLinkStateChange:error:", v6, 0, 1, 0);
    -[IOUSBHostCIPortStateMachine setPortStatus:](self, "setPortStatus:", -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") | 0x40000);
    LODWORD(v8[0]) = 49160;
    HIDWORD(v8[0]) = -[IOUSBHostCIPortStateMachine portNumber](self, "portNumber", v8[0]);
    v8[1] = 0;
    -[IOUSBHostCIPortStateMachine controllerInterface](self, "controllerInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enqueueInterrupt:error:", v8, 0);

  }
}

- (void)setOvercurrent:(BOOL)overcurrent
{
  _BOOL4 v3;
  IOUSBHostCIPortStatus v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];

  v3 = overcurrent;
  if (-[IOUSBHostCIPortStateMachine powered](self, "powered")
    && -[IOUSBHostCIPortStateMachine overcurrent](self, "overcurrent") != v3)
  {
    self->_overcurrent = v3;
    v5 = -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus");
    if (v3)
    {
      -[IOUSBHostCIPortStateMachine setPortStatus:](self, "setPortStatus:", v5 | 2);
    }
    else
    {
      -[IOUSBHostCIPortStateMachine setPortStatus:](self, "setPortStatus:", v5 & 0xFFFFFFFD);
      if (-[IOUSBHostCIPortStateMachine connected](self, "connected"))
      {
        v6 = 7;
LABEL_9:
        -[IOUSBHostCIPortStateMachine updateLinkState:speed:inhibitLinkStateChange:error:](self, "updateLinkState:speed:inhibitLinkStateChange:error:", v6, 0, 1, 0);
        -[IOUSBHostCIPortStateMachine setPortStatus:](self, "setPortStatus:", -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") | 0x20000);
        LODWORD(v8[0]) = 49160;
        HIDWORD(v8[0]) = -[IOUSBHostCIPortStateMachine portNumber](self, "portNumber", v8[0]);
        v8[1] = 0;
        -[IOUSBHostCIPortStateMachine controllerInterface](self, "controllerInterface");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "enqueueInterrupt:error:", v8, 0);

        return;
      }
      -[IOUSBHostCIPortStateMachine setPortState:](self, "setPortState:", 1);
    }
    v6 = 5;
    goto LABEL_9;
  }
}

- (BOOL)updateLinkState:(const IOUSBHostCILinkState)linkState speed:(const IOUSBHostCIDeviceSpeed)speed inhibitLinkStateChange:(const BOOL)inhibitLinkStateChange error:(NSError *)error
{
  _BOOL4 v11;
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
  char v29;
  IOUSBHostCILinkState v30;
  IOUSBHostCIDeviceSpeed v31;
  int v32;
  int v33;
  void *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (!-[IOUSBHostCIPortStateMachine powered](self, "powered"))
  {
    if (error)
    {
      v36 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Link state cannot be updated."), &stru_24DEDD560, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v22;
      v37 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Port is not powered."), &stru_24DEDD560, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v24;
      v38 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v36, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870184, v18);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v27 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v27)
        -[IOUSBHostCIPortStateMachine updateLinkState:speed:inhibitLinkStateChange:error:].cold.2(v27, v28);
      goto LABEL_10;
    }
    return 0;
  }
  v11 = IOUSBHostCILinkStateEnabled(linkState);
  if (speed == IOUSBHostCIDeviceSpeedNone && v11)
  {
    if (error)
    {
      v36 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Link state cannot be updated."), &stru_24DEDD560, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v13;
      v37 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Link state is not compatible with speed."), &stru_24DEDD560, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v15;
      v38 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v36, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v18);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v19)
        -[IOUSBHostCIPortStateMachine updateLinkState:speed:inhibitLinkStateChange:error:].cold.1(v19, v20);
LABEL_10:

      return 0;
    }
    return 0;
  }
  v30 = -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") >> 4;
  -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus");
  -[IOUSBHostCIPortStateMachine setPortStatus:](self, "setPortStatus:", -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 0xFFFFF80FLL);
  -[IOUSBHostCIPortStateMachine setPortStatus:](self, "setPortStatus:", -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") | (16 * linkState));
  if (IOUSBHostCILinkStateEnabled(linkState))
    v31 = speed << 8;
  else
    v31 = IOUSBHostCIDeviceSpeedNone;
  -[IOUSBHostCIPortStateMachine setPortStatus:](self, "setPortStatus:", -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") | v31);
  v32 = IOUSBHostCILinkStateEnabled(v30);
  v33 = IOUSBHostCILinkStateEnabled(linkState);
  if (linkState != IOUSBHostCILinkStateResume && v32 == v33)
    return 1;
  if (IOUSBHostCILinkStateEnabled(v30) && !IOUSBHostCILinkStateEnabled(linkState))
    -[IOUSBHostCIPortStateMachine setPortState:](self, "setPortState:", 1);
  if (inhibitLinkStateChange)
    return 1;
  -[IOUSBHostCIPortStateMachine setPortStatus:](self, "setPortStatus:", -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") | 0x100000);
  LODWORD(v39) = 49160;
  BYTE4(v39) = -[IOUSBHostCIPortStateMachine portNumber](self, "portNumber");
  HIDWORD(v39) = BYTE4(v39);
  v40 = 0;
  -[IOUSBHostCIPortStateMachine controllerInterface](self, "controllerInterface");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v34, "enqueueInterrupt:error:", &v39, error);

  return v29;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("Port %d State %s Status 0x%08x"), -[IOUSBHostCIPortStateMachine portNumber](self, "portNumber"), IOUSBHostCIPortStateToString(-[IOUSBHostCIPortStateMachine portState](self, "portState")), -[IOUSBHostCIPortStateMachine portStatus](self, "portStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus"))
  {
    objc_msgSend(v3, "appendString:", CFSTR(" ("));
    if ((-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 1) != 0)
      objc_msgSend(v3, "appendString:", CFSTR(" Powered"));
    if ((-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 2) != 0)
      objc_msgSend(v3, "appendString:", CFSTR(" Overcurrent"));
    if ((-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 4) != 0)
      objc_msgSend(v3, "appendString:", CFSTR(" Connected"));
    objc_msgSend(v3, "appendFormat:", CFSTR(" Link State %s"), IOUSBHostCILinkStateToString((IOUSBHostCILinkState)(-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") >> 4)));
    if (IOUSBHostCILinkStateEnabled((const IOUSBHostCILinkState)(-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") >> 4)))objc_msgSend(v3, "appendFormat:", CFSTR(" Device Speed %s"), IOUSBHostCIDeviceSpeedToString((IOUSBHostCIDeviceSpeed)((-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") >> 8) & 7)));
    if ((-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 0x20000) != 0)
      objc_msgSend(v3, "appendString:", CFSTR(" Overcurrent Change"));
    if ((-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 0x40000) != 0)
      objc_msgSend(v3, "appendString:", CFSTR(" Connect Change"));
    if ((-[IOUSBHostCIPortStateMachine portStatus](self, "portStatus") & 0x100000) != 0)
      objc_msgSend(v3, "appendString:", CFSTR(" Link Change"));
    objc_msgSend(v3, "appendString:", CFSTR(")"));
  }
  return v3;
}

- (NSUInteger)portNumber
{
  return self->_portNumber;
}

- (void)setPortNumber:(unint64_t)a3
{
  self->_portNumber = a3;
}

- (IOUSBHostCIPortState)portState
{
  return self->_portState;
}

- (void)setPortState:(int)a3
{
  self->_portState = a3;
}

- (IOUSBHostCIPortStatus)portStatus
{
  return self->_portStatus;
}

- (void)setPortStatus:(unsigned int)a3
{
  self->_portStatus = a3;
}

- (IOUSBHostControllerInterface)controllerInterface
{
  return self->_controllerInterface;
}

- (void)setControllerInterface:(id)a3
{
  objc_storeStrong((id *)&self->_controllerInterface, a3);
}

- (BOOL)powered
{
  return self->_powered;
}

- (BOOL)connected
{
  return self->_connected;
}

- (BOOL)overcurrent
{
  return self->_overcurrent;
}

- (IOUSBHostCILinkState)linkState
{
  return self->_linkState;
}

- (IOUSBHostCIDeviceSpeed)speed
{
  return self->_speed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerInterface, 0);
}

- (void)initWithInterface:(uint64_t)a1 portNumber:(const char *)a2 error:.cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostCIControllerStateMachine."), a2);
  OUTLINED_FUNCTION_2(CFSTR("init failed."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)initWithInterface:(uint64_t)a1 portNumber:(const char *)a2 error:.cold.2(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostCIControllerStateMachine."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Port number is too high."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)processCommand:(uint64_t)a1 readonly:(const char *)a2 commandResult:error:.cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Command cannot be processed successfully."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Command is not handled by the port state machine."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)processCommand:(uint64_t)a1 readonly:(const char *)a2 commandResult:error:.cold.2(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Command cannot be processed successfully."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Command cannot be processed in the current state."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)processCommand:(uint64_t)a1 readonly:(const char *)a2 commandResult:error:.cold.5(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Command cannot be processed successfully."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Command failed common validation checks."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)respondToCommand:(uint64_t)a1 status:(const char *)a2 error:.cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Command response was not sent."), a2);
  OUTLINED_FUNCTION_2(CFSTR("A successful IOUSBHostCIMessageTypePortReset requires a U0 link state."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)respondToCommand:(uint64_t)a1 status:(const char *)a2 error:.cold.2(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Command response was not sent."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Command failed common validation checks."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)updateLinkState:(uint64_t)a1 speed:(const char *)a2 inhibitLinkStateChange:error:.cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Link state cannot be updated."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Link state is not compatible with speed."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)updateLinkState:(uint64_t)a1 speed:(const char *)a2 inhibitLinkStateChange:error:.cold.2(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Link state cannot be updated."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Port is not powered."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

@end

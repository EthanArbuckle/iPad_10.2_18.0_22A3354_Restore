@implementation IOUSBHostCIEndpointStateMachine

- (IOUSBHostCIEndpointStateMachine)initWithInterface:(IOUSBHostControllerInterface *)interface command:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  IOUSBHostControllerInterface *v8;
  IOUSBHostCIEndpointStateMachine *v9;
  IOUSBHostCIEndpointStateMachine *v10;
  IOUSBHostCIEndpointStateMachine *v11;
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
  v22.super_class = (Class)IOUSBHostCIEndpointStateMachine;
  v9 = -[IOUSBHostCIEndpointStateMachine init](&v22, sel_init);
  v10 = v9;
  if (!v9)
  {
    if (error)
    {
      v23[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Failed to create IOUSBHostCIEndpointStateMachine."), &stru_24DEDD560, 0);
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
        -[IOUSBHostCIEndpointStateMachine initWithInterface:command:error:].cold.1(v19, v20);

    }
    goto LABEL_8;
  }
  -[IOUSBHostCIEndpointStateMachine setControllerInterface:](v9, "setControllerInterface:", v8);
  if (-[IOUSBHostCIEndpointStateMachine inspectCommand:error:](v10, "inspectCommand:error:", command, error))
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
  BOOL result;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  const char *v34;
  uint32_t v35;
  const IOUSBEndpointDescriptor *DescriptorWithType;
  int bDescriptorType;
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
  void *v49;
  _BOOL8 v50;
  const char *v51;
  uint64_t v52;
  void *v53;
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
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  IOUSBHostCIEndpointStateMachine *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _BOOL8 v79;
  const char *v80;
  IOUSBHostCIEndpointStateMachine *v81;
  uint64_t data1;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  if ((a3->control & 0xC000) != 0x8000 || !LOBYTE(a3->data0))
  {
    if (!a5)
      return 0;
    v101 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v19;
    v102 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Command failed common validation checks."), &stru_24DEDD560, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v21;
    v103 = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v104, &v101, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v24)
      -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.5(v24, v25);
    goto LABEL_15;
  }
  if (-[IOUSBHostCIEndpointStateMachine deviceAddress](self, "deviceAddress"))
  {
    if (-[IOUSBHostCIEndpointStateMachine deviceAddress](self, "deviceAddress") != LOBYTE(a3->data0)
      || -[IOUSBHostCIEndpointStateMachine endpointAddress](self, "endpointAddress") != BYTE1(a3->data0))
    {
      if (!a5)
        return 0;
      v101 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = v28;
      v102 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Command does not target this state machine instance."), &stru_24DEDD560, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = v30;
      v103 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = v32;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v104, &v101, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v33)
        -[IOUSBHostCIEndpointStateMachine processCommand:readonly:error:].cold.12(v33, v34);
      goto LABEL_15;
    }
    switch(-[IOUSBHostCIEndpointStateMachine endpointState](self, "endpointState"))
    {
      case IOUSBHostCIEndpointStateDestroyed:
        if ((a3->control & 0x3F) <= 0x2E && ((1 << (a3->control & 0x3F)) & 0x7B0000000000) != 0)
        {
          if (!a5)
            return 0;
          v101 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = v10;
          v102 = *MEMORY[0x24BDD0FD8];
          objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed in the current state."), &stru_24DEDD560, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = v12;
          v103 = *MEMORY[0x24BDD0FF0];
          objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = v14;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v104, &v101, 3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v15);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (!v16)
            goto LABEL_15;
          goto LABEL_47;
        }
        if (!a5)
          return 0;
        v101 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = v74;
        v102 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("Command is not handled by the endpoint state machine."), &stru_24DEDD560, 0);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = v76;
        v103 = *MEMORY[0x24BDD0FF0];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = v78;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v104, &v101, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v15);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        v79 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (!v79)
          goto LABEL_15;
        goto LABEL_74;
      case IOUSBHostCIEndpointStateHalted:
        v52 = a3->control & 0x3F;
        if ((a3->control & 0x3F) > 0x2E)
          goto LABEL_72;
        if (((1 << v52) & 0x590000000000) == 0)
        {
          if (v52 == 41)
          {
LABEL_52:
            if (a4)
              return 1;
LABEL_58:
            v71 = self;
            v72 = 0;
          }
          else
          {
            if (v52 != 45)
            {
LABEL_72:
              if (!a5)
                return 0;
              v101 = *MEMORY[0x24BDD0FC8];
              objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              v104 = v96;
              v102 = *MEMORY[0x24BDD0FD8];
              objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "localizedStringForKey:value:table:", CFSTR("Command is not handled by the endpoint state machine."), &stru_24DEDD560, 0);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              v105 = v98;
              v103 = *MEMORY[0x24BDD0FF0];
              objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v99, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              v106 = v100;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v104, &v101, 3);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v15);
              *a5 = (id)objc_claimAutoreleasedReturnValue();
              v79 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              if (v79)
LABEL_74:
                -[IOUSBHostCIEndpointStateMachine processCommand:readonly:error:].cold.4(v79, v80);
              goto LABEL_15;
            }
            if (a4)
              return 1;
            v71 = self;
            v72 = 2;
          }
          -[IOUSBHostCIEndpointStateMachine setEndpointState:](v71, "setEndpointState:", v72);
          v81 = self;
          data1 = 0;
LABEL_60:
          -[IOUSBHostCIEndpointStateMachine setCurrentTransferMessage:](v81, "setCurrentTransferMessage:", data1);
          return 1;
        }
        if (!a5)
          return 0;
        v101 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = v54;
        v102 = *MEMORY[0x24BDD0FD8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed in the current state."), &stru_24DEDD560, 0);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = v56;
        v103 = *MEMORY[0x24BDD0FF0];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = v58;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v104, &v101, 3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v15);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v16)
          goto LABEL_47;
        goto LABEL_15;
      case IOUSBHostCIEndpointStatePaused:
        result = 1;
        switch(a3->control & 0x3F)
        {
          case '(':
          case '-':
            if (!a5)
              return 0;
            v101 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = v60;
            v102 = *MEMORY[0x24BDD0FD8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed in the current state."), &stru_24DEDD560, 0);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = v62;
            v103 = *MEMORY[0x24BDD0FF0];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = v64;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v104, &v101, 3);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v15);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v16)
              goto LABEL_47;
            goto LABEL_15;
          case ')':
            if (!a4)
              goto LABEL_58;
            return result;
          case '+':
          case ',':
            return result;
          case '.':
            if (a4)
              return result;
            data1 = a3->data1;
            v81 = self;
            break;
          default:
            if (!a5)
              return 0;
            v101 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = v84;
            v102 = *MEMORY[0x24BDD0FD8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "localizedStringForKey:value:table:", CFSTR("Command is not handled by the endpoint state machine."), &stru_24DEDD560, 0);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = v86;
            v103 = *MEMORY[0x24BDD0FF0];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = v88;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v104, &v101, 3);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v15);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            v79 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v79)
              goto LABEL_74;
            goto LABEL_15;
        }
        goto LABEL_60;
      case IOUSBHostCIEndpointStateActive:
        switch(a3->control & 0x3F)
        {
          case '(':
          case ',':
          case '-':
          case '.':
            if (!a5)
              return 0;
            v101 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = v66;
            v102 = *MEMORY[0x24BDD0FD8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed in the current state."), &stru_24DEDD560, 0);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = v68;
            v103 = *MEMORY[0x24BDD0FF0];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = v70;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v104, &v101, 3);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v15);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v16)
              goto LABEL_47;
            goto LABEL_15;
          case ')':
            goto LABEL_52;
          case '+':
            if (!a4)
              -[IOUSBHostCIEndpointStateMachine setEndpointState:](self, "setEndpointState:", 2);
            return 1;
          default:
            if (!a5)
              return 0;
            v101 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = v90;
            v102 = *MEMORY[0x24BDD0FD8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "localizedStringForKey:value:table:", CFSTR("Command is not handled by the endpoint state machine."), &stru_24DEDD560, 0);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = v92;
            v103 = *MEMORY[0x24BDD0FF0];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = v94;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v104, &v101, 3);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v15);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            v79 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v79)
              goto LABEL_74;
            goto LABEL_15;
        }
      default:
        return 0;
    }
  }
  v35 = a3->control & 0x3F;
  if (v35 - 43 < 4 || v35 == 41)
  {
    if (!a5)
      return 0;
    v101 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v39;
    v102 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed in the current state."), &stru_24DEDD560, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v41;
    v103 = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v43;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v104, &v101, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!v16)
      goto LABEL_15;
LABEL_47:
    -[IOUSBHostCIPortStateMachine processCommand:readonly:commandResult:error:].cold.2(v16, v17);
LABEL_15:

    return 0;
  }
  if (v35 != 40)
  {
    if (!a5)
      return 0;
    v101 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("Command cannot be processed successfully."), &stru_24DEDD560, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v45;
    v102 = *MEMORY[0x24BDD0FD8];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("Command is not handled by the device state machine."), &stru_24DEDD560, 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = v47;
    v103 = *MEMORY[0x24BDD0FF0];
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v49;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v104, &v101, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v50 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v50)
      -[IOUSBHostCIEndpointStateMachine processCommand:readonly:error:].cold.2(v50, v51);
    goto LABEL_15;
  }
  if (!a4)
  {
    -[IOUSBHostCIEndpointStateMachine setEndpointState:](self, "setEndpointState:", 2);
    -[IOUSBHostCIEndpointStateMachine setDeviceAddress:](self, "setDeviceAddress:", LOBYTE(a3->data0));
    -[IOUSBHostCIEndpointStateMachine setEndpointAddress:](self, "setEndpointAddress:", BYTE1(a3->data0));
    DescriptorWithType = (const IOUSBEndpointDescriptor *)a3->data1;
    bDescriptorType = DescriptorWithType->bDescriptorType;
    if (bDescriptorType == 5
      || bDescriptorType == 2
      && (DescriptorWithType = (const IOUSBEndpointDescriptor *)IOUSBGetNextDescriptorWithType((const IOUSBConfigurationDescriptor *)DescriptorWithType, 0, 5u)) != 0)
    {
      -[IOUSBHostCIEndpointStateMachine setEndpointType:](self, "setEndpointType:", IOUSBGetEndpointType(DescriptorWithType));
    }
  }
  return 1;
}

- (BOOL)inspectCommand:(const IOUSBHostCIMessage *)command error:(NSError *)error
{
  return -[IOUSBHostCIEndpointStateMachine processCommand:readonly:error:](self, "processCommand:readonly:error:", command, 1, error);
}

- (BOOL)respondToCommand:(const IOUSBHostCIMessage *)command status:(const IOUSBHostCIMessageStatus)status error:(NSError *)error
{
  uint32_t control;
  char v10;
  int data0_low;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  const char *v21;
  _QWORD v23[3];
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  control = command->control;
  if ((command->control & 0xC000) == 0x8000)
  {
    if (status != IOUSBHostCIMessageStatusSuccess)
    {
LABEL_5:
      data0_low = LOWORD(command->data0);
      LODWORD(v24) = control & 0x3F | (status << 8) | 0xC000;
      HIDWORD(v24) = data0_low;
      v25 = 0;
      -[IOUSBHostCIEndpointStateMachine controllerInterface](self, "controllerInterface");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "enqueueInterrupt:error:", &v24, error);

      return v10;
    }
    v10 = 0;
    if (-[IOUSBHostCIEndpointStateMachine processCommand:readonly:error:](self, "processCommand:readonly:error:", command, 0, error))
    {
      control = command->control;
      goto LABEL_5;
    }
  }
  else
  {
    if (error)
    {
      v23[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Command response was not sent."), &stru_24DEDD560, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v14;
      v23[1] = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Command failed common validation checks."), &stru_24DEDD560, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v16;
      v23[2] = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v18;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, v23, 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v19);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v20)
        -[IOUSBHostCIPortStateMachine respondToCommand:status:error:].cold.2(v20, v21);

    }
    return 0;
  }
  return v10;
}

- (BOOL)processDoorbell:(const IOUSBHostCIDoorbell)doorbell error:(NSError *)error
{
  uint64_t v5;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  const char *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;

  v5 = *(_QWORD *)&doorbell;
  v37 = *MEMORY[0x24BDAC8D0];
  v7 = doorbell;
  v8 = -[IOUSBHostCIEndpointStateMachine deviceAddress](self, "deviceAddress");
  v9 = v8 | (-[IOUSBHostCIEndpointStateMachine endpointAddress](self, "endpointAddress") << 8);
  if (v9 == v5)
  {
    if (-[IOUSBHostCIEndpointStateMachine currentTransferMessage](self, "currentTransferMessage")
      && (-[IOUSBHostCIEndpointStateMachine endpointState](self, "endpointState") == IOUSBHostCIEndpointStatePaused
       || -[IOUSBHostCIEndpointStateMachine endpointState](self, "endpointState") == IOUSBHostCIEndpointStateActive))
    {
      while (((_BYTE)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](self, "currentTransferMessage")[1] & 0x80) != 0
           && ((_BYTE)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](self, "currentTransferMessage")[1] & 0x40) != 0
           && (*(_DWORD *)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](self, "currentTransferMessage") & 0x3F) == 0x3C)
      {
        if (!(_QWORD)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](self, "currentTransferMessage")[8])
        {
          if (error)
          {
            v30 = v7;
            v31 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Rejected doorbell."), &stru_24DEDD560, 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v20;
            v32 = *MEMORY[0x24BDD0FD8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Found a link to an invalid transfer structure address."), &stru_24DEDD560, 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v22;
            v33 = *MEMORY[0x24BDD0FF0];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v24;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v31, 3);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870199, v25);
            *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
            v26 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v26)
              -[IOUSBHostCIEndpointStateMachine processDoorbell:error:].cold.1(v26, v27);

            v7 = v30;
          }
          break;
        }
        -[IOUSBHostCIEndpointStateMachine setCurrentTransferMessage:](self, "setCurrentTransferMessage:");
      }
      -[IOUSBHostCIEndpointStateMachine setEndpointState:](self, "setEndpointState:", 3);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%08x does not target this endpoint."), v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (error)
    {
      v29 = v7;
      v31 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Rejected doorbell."), &stru_24DEDD560, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v12;
      v32 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", v10, &stru_24DEDD560, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v14;
      v33 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v31, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v17);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[IOUSBHostCIEndpointStateMachine processDoorbell:error:].cold.2((uint64_t)v10, v18);

      v7 = v29;
    }

  }
  return v9 == v7;
}

- (BOOL)enqueueTransferCompletionForMessage:(const IOUSBHostCIMessage *)message status:(IOUSBHostCIMessageStatus)status transferLength:(NSUInteger)transferLength error:(NSError *)error
{
  IOUSBHostCIEndpointStateMachine *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  const char *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSUInteger v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL8 v45;
  const char *v46;
  int v47;
  IOUSBHostCIMessageStatus v49;
  int v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _BOOL8 v59;
  const char *v60;
  void *v61;
  void *v62;
  _DWORD v63[2];
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;

  v10 = self;
  v71 = *MEMORY[0x24BDAC8D0];
  while (-[IOUSBHostCIEndpointStateMachine endpointState](self, "endpointState") == IOUSBHostCIEndpointStateActive
       && -[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage")
       && ((_BYTE)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage")[1] & 0x80) != 0
       && ((_BYTE)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage")[1] & 0x40) != 0)
  {
    v11 = *(_DWORD *)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage") & 0x3F;
    v12 = -[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage");
    if (v11 == 60)
    {
      v13 = *(_QWORD *)(v12 + 8);
      if (!v13)
      {
        if (error)
        {
          v65 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("Transfer completion message was not sent."), &stru_24DEDD560, 0);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = v61;
          v66 = *MEMORY[0x24BDD0FD8];
          objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Found a link to an invalid transfer structure address."), &stru_24DEDD560, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v15;
          v67 = *MEMORY[0x24BDD0FF0];
          objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v17;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v68, &v65, 3);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870199, v18);
          *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
          v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v19)
            -[IOUSBHostCIEndpointStateMachine enqueueTransferCompletionForMessage:status:transferLength:error:].cold.2(v19, v20);

        }
        break;
      }
    }
    else
    {
      v13 = v12 + 16;
    }
    -[IOUSBHostCIEndpointStateMachine setCurrentTransferMessage:](v10, "setCurrentTransferMessage:", v13);
    self = v10;
  }
  if (-[IOUSBHostCIEndpointStateMachine endpointState](v10, "endpointState") != IOUSBHostCIEndpointStateActive)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The current endpoint state %s cannot generate transfer completions."), IOUSBHostCIEndpointStateToString(-[IOUSBHostCIEndpointStateMachine endpointState](v10, "endpointState")));
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (error)
    {
      v65 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Transfer completion message was not sent."), &stru_24DEDD560, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v31;
      v66 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", v21, &stru_24DEDD560, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v33;
      v67 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v35;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v68, &v65, 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870174, v28);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
LABEL_22:
        -[IOUSBHostCIEndpointStateMachine enqueueTransferCompletionForMessage:status:transferLength:error:].cold.3((uint64_t)v21, v29);
LABEL_23:

    }
LABEL_24:

    return 0;
  }
  if (-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage") != message)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The specified message %p does not match the current transfer %p."), message, -[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage"));
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (error)
    {
      v65 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Transfer completion message was not sent."), &stru_24DEDD560, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v23;
      v66 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", v21, &stru_24DEDD560, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v25;
      v67 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v27;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v68, &v65, 3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870206, v28);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_22;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (!-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage")
    || ((_BYTE)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage")[1] & 0x80) == 0
    || ((_BYTE)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage")[1] & 0x40) != 0)
  {
    if (error)
    {
      v65 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Transfer completion message was not sent."), &stru_24DEDD560, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v39;
      v66 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("The current transfer cannot generate a transfer completion."), &stru_24DEDD560, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v41;
      v67 = *MEMORY[0x24BDD0FF0];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v43;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v68, &v65, 3);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870184, v44);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      v45 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v45)
        -[IOUSBHostCIEndpointStateMachine enqueueTransferCompletionForMessage:status:transferLength:error:].cold.1(v45, v46);

    }
    return 0;
  }
  if ((*(_DWORD *)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage") & 0x3D | 2) == 0x3B)
    v37 = v10->_currentTransferMessage->data0 & 0xFFFFFFF;
  else
    v37 = 0;
  if (v37 >= transferLength)
    v47 = transferLength;
  else
    v47 = v37;
  if (v37 < transferLength && status == IOUSBHostCIMessageStatusSuccess)
    v49 = IOUSBHostCIMessageStatusOverrunError;
  else
    v49 = status;
  v50 = -[IOUSBHostCIEndpointStateMachine deviceAddress](v10, "deviceAddress");
  v63[0] = (v49 << 8) | (v50 << 16) | (-[IOUSBHostCIEndpointStateMachine endpointAddress](v10, "endpointAddress") << 24) | 0xC03D;
  v63[1] = v47;
  v64 = -[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage");
  if (v49 != IOUSBHostCIMessageStatusEndpointStopped)
  {
    if (v49 == IOUSBHostCIMessageStatusSuccess)
    {
      v51 = (uint64_t)(-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage") + 16);
      while (1)
      {
        -[IOUSBHostCIEndpointStateMachine setCurrentTransferMessage:](v10, "setCurrentTransferMessage:", v51);
        if (((_BYTE)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage")[1] & 0x80) == 0
          || ((_BYTE)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage")[1] & 0x40) == 0
          || (*(_DWORD *)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage") & 0x3F) != 0x3C)
        {
          break;
        }
        v51 = (uint64_t)-[IOUSBHostCIEndpointStateMachine currentTransferMessage](v10, "currentTransferMessage")[8];
        if (!v51)
        {
          if (error)
          {
            v65 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("Transfer completion message was not sent."), &stru_24DEDD560, 0);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = v53;
            v66 = *MEMORY[0x24BDD0FD8];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("Found a link to an invalid transfer structure address."), &stru_24DEDD560, 0);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = v55;
            v67 = *MEMORY[0x24BDD0FF0];
            objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "localizedStringForKey:value:table:", 0, &stru_24DEDD560, 0);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = v57;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v68, &v65, 3);
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOUSBHostErrorDomain"), -536870199, v58);
            *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
            v59 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v59)
              -[IOUSBHostCIEndpointStateMachine enqueueTransferCompletionForMessage:status:transferLength:error:].cold.2(v59, v60);

          }
          return -[IOUSBHostControllerInterface enqueueInterrupt:error:](v10->_controllerInterface, "enqueueInterrupt:error:", v63, error);
        }
      }
    }
    else
    {
      if (-[IOUSBHostCIEndpointStateMachine endpointType](v10, "endpointType") != 1)
        -[IOUSBHostCIEndpointStateMachine setEndpointState:](v10, "setEndpointState:", 1);
      -[IOUSBHostCIEndpointStateMachine setCurrentTransferMessage:](v10, "setCurrentTransferMessage:", 0);
    }
  }
  return -[IOUSBHostControllerInterface enqueueInterrupt:error:](v10->_controllerInterface, "enqueueInterrupt:error:", v63, error);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  const IOUSBHostCIMessage *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (unsigned __int16)-[IOUSBHostCIEndpointStateMachine deviceAddress](self, "deviceAddress");
  v5 = -[IOUSBHostCIEndpointStateMachine endpointAddress](self, "endpointAddress");
  v6 = IOUSBHostCIEndpointStateToString(-[IOUSBHostCIEndpointStateMachine endpointState](self, "endpointState"));
  v7 = -[IOUSBHostCIEndpointStateMachine currentTransferMessage](self, "currentTransferMessage");
  if (-[IOUSBHostCIEndpointStateMachine currentTransferMessage](self, "currentTransferMessage"))
  {
    -[IOUSBHostCIEndpointStateMachine controllerInterface](self, "controllerInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "descriptionForMessage:", -[IOUSBHostCIEndpointStateMachine currentTransferMessage](self, "currentTransferMessage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Device %d Endpoint 0x%02x State %s Current Transfer %p(%@)"), v4, v5, v6, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("Device %d Endpoint 0x%02x State %s Current Transfer %p(%@)"), v4, v5, v6, v7, CFSTR("None"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (IOUSBHostCIEndpointState)endpointState
{
  return self->_endpointState;
}

- (void)setEndpointState:(int)a3
{
  self->_endpointState = a3;
}

- (NSUInteger)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(unint64_t)a3
{
  self->_deviceAddress = a3;
}

- (NSUInteger)endpointAddress
{
  return self->_endpointAddress;
}

- (void)setEndpointAddress:(unint64_t)a3
{
  self->_endpointAddress = a3;
}

- (const)currentTransferMessage
{
  return self->_currentTransferMessage;
}

- (void)setCurrentTransferMessage:(const IOUSBHostCIMessage *)a3
{
  self->_currentTransferMessage = a3;
}

- (IOUSBHostControllerInterface)controllerInterface
{
  return self->_controllerInterface;
}

- (void)setControllerInterface:(id)a3
{
  objc_storeStrong((id *)&self->_controllerInterface, a3);
}

- (int)endpointType
{
  return self->_endpointType;
}

- (void)setEndpointType:(int)a3
{
  self->_endpointType = a3;
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

  OUTLINED_FUNCTION_2(CFSTR("Failed to create IOUSBHostCIEndpointStateMachine."), a2);
  OUTLINED_FUNCTION_2(CFSTR("init failed."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)processCommand:(uint64_t)a1 readonly:(const char *)a2 error:.cold.2(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Command cannot be processed successfully."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Command is not handled by the device state machine."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)processCommand:(uint64_t)a1 readonly:(const char *)a2 error:.cold.4(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Command cannot be processed successfully."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Command is not handled by the endpoint state machine."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)processCommand:(uint64_t)a1 readonly:(const char *)a2 error:.cold.12(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Command cannot be processed successfully."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Command does not target this state machine instance."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)processDoorbell:(uint64_t)a1 error:(const char *)a2 .cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Rejected doorbell."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Found a link to an invalid transfer structure address."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)processDoorbell:(uint64_t)a1 error:(const char *)a2 .cold.2(uint64_t a1, const char *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Rejected doorbell."), a2);
  v2 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(v2, v3);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v4, "Error:%s with reason: %s", v5, v6, v7, v8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)enqueueTransferCompletionForMessage:(uint64_t)a1 status:(const char *)a2 transferLength:error:.cold.1(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Transfer completion message was not sent."), a2);
  OUTLINED_FUNCTION_2(CFSTR("The current transfer cannot generate a transfer completion."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)enqueueTransferCompletionForMessage:(uint64_t)a1 status:(const char *)a2 transferLength:error:.cold.2(uint64_t a1, const char *a2)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Transfer completion message was not sent."), a2);
  OUTLINED_FUNCTION_2(CFSTR("Found a link to an invalid transfer structure address."), v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v3, "Error:%s with reason: %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3();
}

- (void)enqueueTransferCompletionForMessage:(uint64_t)a1 status:(const char *)a2 transferLength:error:.cold.3(uint64_t a1, const char *a2)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_2(CFSTR("Transfer completion message was not sent."), a2);
  v2 = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(v2, v3);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_21B5CC000, MEMORY[0x24BDACB70], v4, "Error:%s with reason: %s", v5, v6, v7, v8, 2u);
  OUTLINED_FUNCTION_3();
}

@end

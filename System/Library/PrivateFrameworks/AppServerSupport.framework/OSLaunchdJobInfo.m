@implementation OSLaunchdJobInfo

- (int)pid
{
  return self->_pid;
}

- (id)description
{
  int64_t state;
  void *v3;
  const char *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  unint64_t lastExitStatus;
  uint64_t pid;

  state = self->_state;
  switch(state)
  {
    case 4:
      v3 = (void *)MEMORY[0x24BDD17C8];
      lastExitStatus = (unint64_t)self->_lastExitStatus;
      v5 = CFSTR("exited, %@");
      break;
    case 3:
      v7 = (void *)MEMORY[0x24BDD17C8];
      lastExitStatus = self->_lastSpawnError;
      pid = xpc_strerror();
      v5 = CFSTR("spawn failed, error=%d: %s");
      v6 = v7;
      goto LABEL_10;
    case 2:
      v3 = (void *)MEMORY[0x24BDD17C8];
      v4 = "removing";
      if (!self->_removing)
        v4 = "running";
      lastExitStatus = (unint64_t)v4;
      pid = self->_pid;
      v5 = CFSTR("%s, pid=%d");
      break;
    default:
      v8 = CFSTR("never ran");
      return v8;
  }
  v6 = v3;
LABEL_10:
  objc_msgSend(v6, "stringWithFormat:", v5, lastExitStatus, pid);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_additionalPropertiesDictionary, 0);
  objc_storeStrong((id *)&self->_lastExitStatus, 0);
}

- (int64_t)state
{
  return self->_state;
}

- (OSLaunchdJobInfo)initWithState:(int64_t)a3 pid:(int)a4 lastSpawnError:(int)a5 lastExitStatus:(id)a6 additionalPropertiesDict:(id)a7 removing:(BOOL)a8 instance:(id)a9
{
  id v15;
  id v16;
  id v17;
  OSLaunchdJobInfo *v18;
  OSLaunchdJobInfo *v19;
  OSLaunchdJobInfo *v20;
  OSLaunchdJobInfo *result;
  objc_super v23;
  uint64_t v24;
  _OWORD v25[5];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v15 = a6;
  v16 = a7;
  v17 = a9;
  switch(a3)
  {
    case 1:
      if (a4)
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.3(&v24, v25);
      if (a5)
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.2(&v24, v25);
      if (v15)
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.1(&v24, v25);
      return result;
    case 2:
      if (!a4)
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.4(&v24, v25);
      if (a5)
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.2(&v24, v25);
      return result;
    case 3:
      if (a4)
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.3(&v24, v25);
      if (!a5)
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.6(&v24, v25);
      if (v15)
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.1(&v24, v25);
      return result;
    case 4:
      if (a4)
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.3(&v24, v25);
      if (a5)
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.2(&v24, v25);
      if (!v15)
        -[OSLaunchdJobInfo initWithState:pid:lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:].cold.9(&v24, v25);
      return result;
    default:
      break;
  }
  v23.receiver = self;
  v23.super_class = (Class)OSLaunchdJobInfo;
  v18 = -[OSLaunchdJobInfo init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_state = a3;
    v18->_pid = a4;
    v18->_lastSpawnError = a5;
    objc_storeStrong((id *)&v18->_lastExitStatus, a6);
    objc_storeStrong((id *)&v19->_additionalPropertiesDictionary, a7);
    v19->_removing = a8;
    objc_storeStrong((id *)&v19->_instance, a9);
    v20 = v19;
  }

  return v19;
}

- (OSLaunchdJobExitStatus)lastExitStatus
{
  return self->_lastExitStatus;
}

- (int)lastSpawnError
{
  return self->_lastSpawnError;
}

- (OS_xpc_object)additionalPropertiesDictionary
{
  return self->_additionalPropertiesDictionary;
}

- (BOOL)removing
{
  return self->_removing;
}

- (NSUUID)instance
{
  return self->_instance;
}

- (void)initWithState:(_QWORD *)a1 pid:(_OWORD *)a2 lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:.cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

- (void)initWithState:(_QWORD *)a1 pid:(_OWORD *)a2 lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:.cold.2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

- (void)initWithState:(_QWORD *)a1 pid:(_OWORD *)a2 lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:.cold.3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

- (void)initWithState:(_QWORD *)a1 pid:(_OWORD *)a2 lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:.cold.4(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

- (void)initWithState:(_QWORD *)a1 pid:(_OWORD *)a2 lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:.cold.6(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

- (void)initWithState:(_QWORD *)a1 pid:(_OWORD *)a2 lastSpawnError:lastExitStatus:additionalPropertiesDict:removing:instance:.cold.9(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
  _CFXPCCreateXPCObjectFromCFObject();
}

@end

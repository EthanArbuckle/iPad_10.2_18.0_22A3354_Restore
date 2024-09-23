@implementation LASSProperties4RB

- (NSString)label
{
  return self->_label;
}

- (BOOL)xpcBundle
{
  return self->_xpcBundle;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (NSString)program
{
  return self->_program;
}

- (NSString)path
{
  return self->_path;
}

- (NSUUID)instance
{
  return self->_instance;
}

- (OS_xpc_object)additionalProperties
{
  return self->_additionalProperties;
}

- (OS_xpc_object)endpoints
{
  return self->_endpoints;
}

- (int)hostPID
{
  return self->_hostPID;
}

+ (id)propertiesForPid:(int)a3 error:(id *)a4
{
  xpc_object_t v7;
  int v8;
  void *v9;
  void *v10;

  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v7, "pid", a3);
  v8 = _xpc_service_routine();
  if (v8)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v8, 0);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    xpc_dictionary_get_value(0, "attrs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_propertiesFromAttrs:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)propertiesForJob:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  xpc_object_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  xpc_object_t xdict;
  unsigned __int8 uuid[80];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!v6)
    +[LASSProperties4RB propertiesForJob:error:].cold.1(&xdict, uuid);
  v7 = v6;
  objc_msgSend(v6, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    +[LASSProperties4RB propertiesForJob:error:].cold.2(&xdict, uuid);
  v9 = xpc_dictionary_create(0, 0, 0);
  *(_QWORD *)uuid = 0;
  *(_QWORD *)&uuid[8] = 0;
  objc_msgSend(v7, "handle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getUUIDBytes:", uuid);

  xpc_dictionary_set_uuid(v9, "job-handle", uuid);
  xdict = 0;
  v11 = _launch_job_routine();
  if (v11)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v11, 0, xdict);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    xpc_dictionary_get_value(xdict, "attrs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_propertiesFromAttrs:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_program, 0);
  objc_storeStrong((id *)&self->_additionalProperties, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

+ (id)_propertiesFromAttrs:(id)a3
{
  id v3;
  const char *string;
  const char *v5;
  uint8_t *uuid;
  int64_t int64;
  uint64_t v8;
  const char *v9;
  const char *v10;
  void *empty;
  const char *v12;
  BOOL v13;
  int v14;
  LASSProperties4RB *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  LASSProperties4RB *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  uint64_t uint64;
  int64_t v29;
  void *v30;
  uint8_t *v31;
  uint64_t v32;
  _OWORD v33[5];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  string = xpc_dictionary_get_string(v3, "label");
  if (!string)
    +[LASSProperties4RB _propertiesFromAttrs:].cold.1(&v32, v33);
  v5 = string;
  uuid = (uint8_t *)xpc_dictionary_get_uuid(v3, "instance");
  int64 = xpc_dictionary_get_int64(v3, "jp-priority");
  xpc_dictionary_get_value(v3, "additional-properties");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = xpc_dictionary_get_string(v3, "program");
  if (!v9)
    +[LASSProperties4RB _propertiesFromAttrs:].cold.2(&v32, v33);
  v10 = v9;
  v29 = int64;
  v30 = (void *)v8;
  uint64 = xpc_dictionary_get_uint64(v3, "process-type");
  v27 = xpc_dictionary_get_BOOL(v3, "keep-alive");
  v26 = xpc_dictionary_get_BOOL(v3, "run-at-load");
  v25 = xpc_dictionary_get_BOOL(v3, "enable-transactions");
  xpc_dictionary_get_value(v3, "XPCServiceEndpoints");
  empty = (void *)objc_claimAutoreleasedReturnValue();
  if (!empty)
    empty = xpc_dictionary_create_empty();
  v24 = xpc_dictionary_get_uint64(v3, "service-type");
  v12 = xpc_dictionary_get_string(v3, "path");
  v13 = xpc_dictionary_get_BOOL(v3, "XPCExtensionXPCBundle");
  v14 = xpc_dictionary_get_int64(v3, "XPCExtensionHostPID");
  v15 = [LASSProperties4RB alloc];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = uuid;
  if (uuid)
    uuid = (uint8_t *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", uuid);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HIDWORD(v23) = v14;
    LOBYTE(v23) = v13;
    BYTE2(v22) = v25;
    BYTE1(v22) = v26;
    LOBYTE(v22) = v27;
    v19 = v30;
    v20 = -[LASSProperties4RB initWithLabel:instance:requestedJetsamPriority:additionalProperties:program:processType:keepAlive:runAtLoad:enableTransactions:endpoints:serviceType:path:xpcBundle:hostPID:](v15, "initWithLabel:instance:requestedJetsamPriority:additionalProperties:program:processType:keepAlive:runAtLoad:enableTransactions:endpoints:serviceType:path:xpcBundle:hostPID:", v16, uuid, v29, v30, v17, uint64, v22, empty, v24, v18, v23);

  }
  else
  {
    HIDWORD(v23) = v14;
    LOBYTE(v23) = v13;
    BYTE2(v22) = v25;
    BYTE1(v22) = v26;
    LOBYTE(v22) = v27;
    v19 = v30;
    v20 = -[LASSProperties4RB initWithLabel:instance:requestedJetsamPriority:additionalProperties:program:processType:keepAlive:runAtLoad:enableTransactions:endpoints:serviceType:path:xpcBundle:hostPID:](v15, "initWithLabel:instance:requestedJetsamPriority:additionalProperties:program:processType:keepAlive:runAtLoad:enableTransactions:endpoints:serviceType:path:xpcBundle:hostPID:", v16, uuid, v29, v30, v17, uint64, v22, empty, v24, 0, v23);
  }

  if (v31)
  return v20;
}

- (LASSProperties4RB)initWithLabel:(id)a3 instance:(id)a4 requestedJetsamPriority:(int)a5 additionalProperties:(id)a6 program:(id)a7 processType:(unsigned int)a8 keepAlive:(BOOL)a9 runAtLoad:(BOOL)a10 enableTransactions:(BOOL)a11 endpoints:(id)a12 serviceType:(int64_t)a13 path:(id)a14 xpcBundle:(BOOL)a15 hostPID:(int)a16
{
  id v21;
  id v22;
  id v23;
  LASSProperties4RB *v24;
  LASSProperties4RB *v25;
  LASSProperties4RB *v26;
  id v30;
  id v31;
  id v32;

  v21 = a3;
  v22 = a4;
  v23 = a6;
  v32 = a7;
  v31 = a12;
  v30 = a14;
  v24 = -[LASSProperties4RB init](self, "init");
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_label, a3);
    objc_storeStrong((id *)&v25->_instance, a4);
    v25->_requestedJetsamPriority = a5;
    objc_storeStrong((id *)&v25->_additionalProperties, a6);
    objc_storeStrong((id *)&v25->_program, a7);
    v25->_processType = a8;
    v25->_keepAlive = a9;
    v25->_runAtLoad = a10;
    v25->_enableTransactions = a11;
    objc_storeStrong((id *)&v25->_endpoints, a12);
    v25->_serviceType = a13;
    objc_storeStrong((id *)&v25->_path, a14);
    v25->_xpcBundle = a15;
    v25->_hostPID = a16;
    v26 = v25;
  }

  return v25;
}

- (BOOL)runAtLoad
{
  return self->_runAtLoad;
}

- (unsigned)processType
{
  return self->_processType;
}

- (BOOL)keepAlive
{
  return self->_keepAlive;
}

- (BOOL)enableTransactions
{
  return self->_enableTransactions;
}

- (BOOL)enablePressuredExit
{
  return self->_enablePressuredExit;
}

- (int)requestedJetsamPriority
{
  return self->_requestedJetsamPriority;
}

+ (void)_propertiesFromAttrs:(_QWORD *)a1 .cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

+ (void)_propertiesFromAttrs:(_QWORD *)a1 .cold.2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

+ (void)propertiesForJob:(_QWORD *)a1 error:(_OWORD *)a2 .cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

+ (void)propertiesForJob:(_QWORD *)a1 error:(_OWORD *)a2 .cold.2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

@end

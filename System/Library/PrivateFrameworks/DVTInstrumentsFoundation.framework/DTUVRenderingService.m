@implementation DTUVRenderingService

+ (void)registerCapabilities:(id)a3
{
  objc_msgSend(a3, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.ultraviolet.renderer"), 1, a1);
}

- (DTUVRenderingService)initWithChannel:(id)a3
{
  id v4;
  DTUVRenderingService *v5;
  DTUVRenderingService *v6;
  _QWORD v8[4];
  DTUVRenderingService *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DTUVRenderingService;
  v5 = -[DTXService initWithChannel:](&v10, sel_initWithChannel_, v4);
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = sub_222B1AD90;
    v8[3] = &unk_24EB27E30;
    v9 = v5;
    objc_msgSend(v4, "registerDisconnectHandler:", v8);

  }
  return v6;
}

- (BOOL)_launchCLIFromPath:(id)a3 message:(id)a4 arguments:(id)a5 environment:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  DTXConnection *v30;
  DTXConnection *connection;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  BOOL v37;
  void *v39;
  SEL v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = sub_222B1B0CC;
  v45 = sub_222B1B0DC;
  v46 = 0;
  objc_msgSend(v14, "stringForMessageKey:", CFSTR("stdoutPath"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringForMessageKey:", CFSTR("stderrPath"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = a2;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v17)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE2A938]);
  if (v18)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE2A930]);
  v21 = DTXSpawnSubtask();
  v28 = v21;
  if (v42[5])
  {
    v29 = objc_alloc(MEMORY[0x24BE2A948]);
    v30 = (DTXConnection *)objc_msgSend(v29, "initWithTransport:", v42[5]);
    connection = self->_connection;
    self->_connection = v30;

    -[DTXConnection resume](self->_connection, "resume");
    -[DTXService channel](self, "channel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v14, "newReplyWithObject:", v33);
    objc_msgSend(v32, "sendMessageAsync:replyHandler:", v34, 0);

LABEL_7:
    v35 = 0;
    goto LABEL_13;
  }
  if ((int)v21 >= 1)
    kill(v21, 9);
  DTUVRenderingServiceErrorWithDescription(11, CFSTR("Failed to launch CLI: %@"), v22, v23, v24, v25, v26, v27, (uint64_t)v14);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v36;
  if (!v36)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", v40, self, CFSTR("DTUVRenderingService.m"), 69, CFSTR("rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"));

    goto LABEL_7;
  }
  if (a7)
  {
    v35 = objc_retainAutorelease(v36);
    *a7 = v35;
  }
LABEL_13:
  v37 = v42[5] != 0;

  _Block_object_dispose(&v41, 8);
  return v37;
}

- (BOOL)processStartCLIFromMessage:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  char isKindOfClass;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  SEL v51;
  DTUVRenderingService *v52;
  uint64_t v53;
  void *v54;
  void *v56;
  id v57;

  v7 = a3;
  v14 = v7;
  if (!self->_connection)
  {
    objc_msgSend(v7, "stringForMessageKey:", CFSTR("launchPath"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "fileExistsAtPath:", v23);

      if (v25)
      {
        objc_msgSend(v14, "object");
        v32 = objc_claimAutoreleasedReturnValue();
        if (!v32
          || (v33 = (void *)v32,
              objc_msgSend(v14, "object"),
              v34 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              isKindOfClass = objc_opt_isKindOfClass(),
              v34,
              v33,
              (isKindOfClass & 1) != 0))
        {
          objc_msgSend(v14, "object");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "valueForKey:", CFSTR("inheritEnvironment"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v43;
          if (v43 && !objc_msgSend(v43, "BOOLValue"))
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "environment");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = (void *)objc_msgSend(v46, "mutableCopy");

          }
          objc_msgSend(v42, "valueForKey:", CFSTR("environment"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (v54)
            objc_msgSend(v47, "addEntriesFromDictionary:", v54);

          v57 = 0;
          v16 = -[DTUVRenderingService _launchCLIFromPath:message:arguments:environment:error:](self, "_launchCLIFromPath:message:arguments:environment:error:", v23, v14, 0, v47, &v57);
          v15 = v57;

LABEL_22:
          if (!a4)
            goto LABEL_25;
          goto LABEL_23;
        }
        DTUVRenderingServiceErrorWithDescription(7, CFSTR("\"startCLI\" message payload is not a dictionary: %@"), v36, v37, v38, v39, v40, v41, (uint64_t)v14);
        v48 = objc_claimAutoreleasedReturnValue();
        if (v48)
        {
LABEL_17:
          v15 = (id)v48;
          v16 = 0;
          goto LABEL_22;
        }
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v49;
        v51 = a2;
        v52 = self;
        v53 = 93;
      }
      else
      {
        DTUVRenderingServiceErrorWithDescription(10, CFSTR("\"startCLI\" \"launchPath\" does not exist: %@"), v26, v27, v28, v29, v30, v31, (uint64_t)v14);
        v48 = objc_claimAutoreleasedReturnValue();
        if (v48)
          goto LABEL_17;
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v49;
        v51 = a2;
        v52 = self;
        v53 = 97;
      }
    }
    else
    {
      DTUVRenderingServiceErrorWithDescription(5, CFSTR("No \"launchPath\" provided for \"startCLI\": %@"), v17, v18, v19, v20, v21, v22, (uint64_t)v14);
      v48 = objc_claimAutoreleasedReturnValue();
      if (v48)
        goto LABEL_17;
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v49;
      v51 = a2;
      v52 = self;
      v53 = 101;
    }
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", v51, v52, CFSTR("DTUVRenderingService.m"), v53, CFSTR("rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"));

    v16 = 0;
    v15 = 0;
    goto LABEL_22;
  }
  DTUVRenderingServiceErrorWithDescription(4, CFSTR("\"startCLI\" has already been called and a connection established (%@): %@"), v8, v9, v10, v11, v12, v13, (uint64_t)self->_connection);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DTUVRenderingService.m"), 105, CFSTR("rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"));

    v16 = 0;
    goto LABEL_25;
  }
  v16 = 0;
  if (!a4)
    goto LABEL_25;
LABEL_23:
  if (v15)
  {
    v15 = objc_retainAutorelease(v15);
    *a4 = v15;
  }
LABEL_25:

  return v16;
}

- (BOOL)processForwardMessageFromMessage:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  DTXConnection *connection;
  id v16;
  void *v18;
  _QWORD v19[4];
  id v20;
  DTUVRenderingService *v21;

  v7 = a3;
  v14 = v7;
  connection = self->_connection;
  if (connection)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = sub_222B1B5D0;
    v19[3] = &unk_24EB27E80;
    v20 = v7;
    v21 = self;
    -[DTXConnection sendControlAsync:replyHandler:](connection, "sendControlAsync:replyHandler:", v20, v19);

LABEL_3:
    v16 = 0;
    goto LABEL_7;
  }
  DTUVRenderingServiceErrorWithDescription(3, CFSTR("No connection has been established to the CLI yet for \"forwardMessage\". Make sure to pass a \"startCLI\" command first. Message was: %@"), v8, v9, v10, v11, v12, v13, (uint64_t)v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DTUVRenderingService.m"), 166, CFSTR("rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"));

    goto LABEL_3;
  }
  if (a4)
  {
    v16 = objc_retainAutorelease(v16);
    *a4 = v16;
  }
LABEL_7:

  return connection != 0;
}

- (BOOL)processConnectToPreviewHostFromMessage:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  BOOL v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  SEL v34;
  DTUVRenderingService *v35;
  uint64_t v36;
  id v38;

  v7 = a3;
  objc_msgSend(v7, "stringForMessageKey:", CFSTR("injectionPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v7, "stringForMessageKey:", CFSTR("launchedPath"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  v12 = objc_msgSend(v7, "integerForMessageKey:", CFSTR("pid"));
  if (!v11)
  {
    DTUVRenderingServiceErrorWithDescription(15, CFSTR("No \"injectionPath\" or \"launchedPath\" provided for \"connectToPreviewHost\": %@"), v13, v14, v15, v16, v17, v18, (uint64_t)v7);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    if (v31)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    v34 = a2;
    v35 = self;
    v36 = 186;
LABEL_20:
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", v34, v35, CFSTR("DTUVRenderingService.m"), v36, CFSTR("rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"));

    v28 = 0;
    goto LABEL_18;
  }
  v19 = v12;
  if ((_DWORD)v12)
  {
    v38 = 0;
    DVTIFAttachToProcess(v12, v11, CFSTR("__SERVICEHUB_ATTACH_POINT__"), &v38);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v38;
    v28 = v20 != 0;
    if (v20)
    {
      objc_msgSend(v20, "resume");
      objc_storeStrong((id *)&self->_connection, v20);
      v29 = (void *)objc_msgSend(v7, "newReply");
      objc_msgSend(v29, "setInteger:forMessageKey:", 1, CFSTR("success"));
      -[DTXService channel](self, "channel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "sendControlAsync:replyHandler:", v29, 0);

    }
    else
    {
      DTUVRenderingServiceErrorWithDescription(17, CFSTR("connectToPreviewHost: Failed to connect to %d: %@"), v21, v22, v23, v24, v25, v26, v19);
      v31 = (id)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
LABEL_15:

        if (!a4)
          goto LABEL_18;
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DTUVRenderingService.m"), 202, CFSTR("rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"));
      v27 = 0;
    }

    v31 = v27;
    goto LABEL_15;
  }
  DTUVRenderingServiceErrorWithDescription(16, CFSTR("No \"pid\" provided for \"connectToPreviewHost\": %@"), v13, v14, v15, v16, v17, v18, (uint64_t)v7);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    v34 = a2;
    v35 = self;
    v36 = 189;
    goto LABEL_20;
  }
LABEL_12:
  v28 = 0;
  if (!a4)
    goto LABEL_18;
LABEL_16:
  if (v31)
  {
    v31 = objc_retainAutorelease(v31);
    *a4 = v31;
  }
LABEL_18:

  return v28;
}

- (BOOL)processCommand:(id)a3 fromMessage:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  id *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  id v20;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("startCLI")))
  {
    v25 = 0;
    v11 = (id *)&v25;
    v12 = -[DTUVRenderingService processStartCLIFromMessage:error:](self, "processStartCLIFromMessage:error:", v10, &v25);
    goto LABEL_7;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("forwardMessage")))
  {
    v24 = 0;
    v11 = (id *)&v24;
    v12 = -[DTUVRenderingService processForwardMessageFromMessage:error:](self, "processForwardMessageFromMessage:error:", v10, &v24);
    goto LABEL_7;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("connectToPreviewHost")))
  {
    v23 = 0;
    v11 = (id *)&v23;
    v12 = -[DTUVRenderingService processConnectToPreviewHostFromMessage:error:](self, "processConnectToPreviewHostFromMessage:error:", v10, &v23);
LABEL_7:
    v19 = v12;
    v20 = *v11;
    if (!a5)
      goto LABEL_10;
    goto LABEL_8;
  }
  DTUVRenderingServiceErrorWithDescription(2, CFSTR("Unknown command \"%@\": %@"), v13, v14, v15, v16, v17, v18, (uint64_t)v9);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DTUVRenderingService.m"), 226, CFSTR("rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"));

    v19 = 0;
    v20 = 0;
    goto LABEL_10;
  }
  v19 = 0;
  if (!a5)
    goto LABEL_10;
LABEL_8:
  if (v20)
  {
    v20 = objc_retainAutorelease(v20);
    *a5 = v20;
  }
LABEL_10:

  return v19;
}

- (BOOL)processMessage:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  id v16;
  void *v18;
  id v19;

  v7 = a3;
  objc_msgSend(v7, "stringForMessageKey:", CFSTR("serviceCommand"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v19 = 0;
    v15 = -[DTUVRenderingService processCommand:fromMessage:error:](self, "processCommand:fromMessage:error:", v14, v7, &v19);

    v16 = v19;
    if (!a4)
      goto LABEL_8;
LABEL_6:
    if (v16)
    {
      v16 = objc_retainAutorelease(v16);
      *a4 = v16;
    }
    goto LABEL_8;
  }
  DTUVRenderingServiceErrorWithDescription(0, CFSTR("No \"serviceCommand\" specified for message: %@"), v8, v9, v10, v11, v12, v13, (uint64_t)v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DTUVRenderingService.m"), 244, CFSTR("rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"));

    v15 = 0;
    goto LABEL_8;
  }
  v15 = 0;
  if (a4)
    goto LABEL_6;
LABEL_8:

  return v15;
}

- (void)messageReceived:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = 0;
  v5 = -[DTUVRenderingService processMessage:error:](self, "processMessage:error:", v4, &v9);
  v6 = v9;
  if (!v5)
  {
    -[DTXService channel](self, "channel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v4, "newReplyWithError:", v6);
    objc_msgSend(v7, "sendMessage:replyHandler:", v8, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end

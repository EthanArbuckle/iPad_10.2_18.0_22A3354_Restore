@implementation DMConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v5;

  _DMLogFunc(v2, 7, CFSTR("DMConnection will dealloc %@"));
  -[DMXPCConnection invalidate](self->_connection, "invalidate", self);
  v5.receiver = self;
  v5.super_class = (Class)DMConnection;
  -[DMConnection dealloc](&v5, sel_dealloc);
}

+ (id)connection
{
  return objc_alloc_init(DMConnection);
}

- (unsigned)userDataDisposition
{
  uint64_t v2;
  xpc_object_t v4;
  void *v5;
  unsigned int uint64;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "msgID", 6);
  -[DMXPCConnection sendMessageSync:](self->_connection, "sendMessageSync:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x1D824E4C4]() == MEMORY[0x1E0C81310])
  {
    xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x1E0C81270]);
    _DMLogFunc(v2, 6, CFSTR("Data migrator -userDataDisposition: XPC error: %s"));
    uint64 = 0;
  }
  else
  {
    uint64 = xpc_dictionary_get_uint64(v5, "disposition");
  }

  return uint64;
}

- (id)previousBuildVersion
{
  uint64_t v2;
  xpc_object_t v4;
  void *v5;
  const char *string;
  void *v7;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "msgID", 7);
  -[DMXPCConnection sendMessageSync:](self->_connection, "sendMessageSync:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x1D824E4C4]() == MEMORY[0x1E0C81310])
  {
    xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x1E0C81270]);
    _DMLogFunc(v2, 6, CFSTR("Data migrator -userDataDisposition: XPC error: %s"));
    goto LABEL_5;
  }
  string = xpc_dictionary_get_string(v5, "previousBuildVersion");
  if (!string)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v7;
}

- (DMConnection)init
{
  uint64_t v2;
  DMConnection *v3;
  DMXPCConnection *v4;
  DMXPCConnection *connection;
  DMXPCConnection *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DMConnection;
  v3 = -[DMConnection init](&v8, sel_init);
  if (v3)
  {
    v4 = -[DMXPCConnection initWithServiceName:]([DMXPCConnection alloc], "initWithServiceName:", CFSTR("com.apple.datamigrator"));
    connection = v3->_connection;
    v3->_connection = v4;

    v6 = v3->_connection;
    if (v6)
    {
      -[DMXPCConnection targetForegroundUserSessionIfNecessary](v6, "targetForegroundUserSessionIfNecessary");
      -[DMXPCConnection resume](v3->_connection, "resume");
    }
    else
    {

      v3 = 0;
    }
  }
  _DMLogFunc(v2, 7, CFSTR("DMConnection did init %@"));
  return v3;
}

- (BOOL)isMigrationNeeded
{
  uint64_t v2;
  xpc_object_t v4;
  void *v5;
  BOOL v6;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "msgID", 5);
  -[DMXPCConnection sendMessageSync:](self->_connection, "sendMessageSync:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x1D824E4C4]() == MEMORY[0x1E0C81310])
  {
    xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x1E0C81270]);
    _DMLogFunc(v2, 6, CFSTR("Data migrator -isMigrationNeeded: XPC error: %s"));
    v6 = 0;
  }
  else
  {
    v6 = xpc_dictionary_get_BOOL(v5, "isMigrationNeeded");
  }

  return v6;
}

- (id)connection
{
  return self->_connection;
}

- (id)userDataDispositionAuxiliaryData
{
  uint64_t v2;
  xpc_object_t v4;
  void *v5;
  const void *data;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __CFString *v17;
  id v19;
  size_t length;
  _QWORD v21[2];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "msgID", 13);
  -[DMXPCConnection sendMessageSync:](self->_connection, "sendMessageSync:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x1D824E4C4]() == MEMORY[0x1E0C81310])
  {
    xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x1E0C81270]);
    v17 = CFSTR("Data migrator -userDataDispositionAuxiliaryData: XPC error: %s");
LABEL_6:
    _DMLogFunc(v2, 6, v17);
    v15 = 0;
    goto LABEL_7;
  }
  length = 0;
  data = xpc_dictionary_get_data(v5, "dispositionAuxiliaryData", &length);
  if (!data)
  {
    v17 = CFSTR("Data migrator -userDataDispositionAuxiliaryData: got no auxiliary data");
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3710];
  v9 = (void *)MEMORY[0x1E0C99E60];
  v22[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E60];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v8, "unarchivedDictionaryWithKeysOfClasses:objectsOfClasses:fromData:error:", v11, v14, v7, &v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v19;

  _DMLogFunc(v2, 6, CFSTR("Data migrator -userDataDispositionAuxiliaryData: did unarchive auxiliary data with success %d error %@"));
LABEL_7:

  return v15;
}

- (int64_t)migrateCheckingNecessity:(BOOL)a3 lastRelevantPlugin:(id)a4 testMigrationInfrastructureOnly:(BOOL)a5
{
  uint64_t v5;
  _BOOL4 v6;
  id v9;
  xpc_object_t v10;
  void *v11;
  int64_t int64;
  _BOOL4 v13;

  v6 = a5;
  v9 = a4;
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v10, "msgID", 0);
  xpc_dictionary_set_BOOL(v10, "checkNecessity", a3);
  if (v9)
    xpc_dictionary_set_string(v10, "lastRelevantPlugin", (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
  if (v6)
    xpc_dictionary_set_BOOL(v10, "testMigrationInfrastructureOnly", 1);
  -[DMXPCConnection sendMessageSync:](self->_connection, "sendMessageSync:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x1D824E4C4]() == MEMORY[0x1E0C81310])
  {
    v13 = v11 == (void *)MEMORY[0x1E0C81258];
    xpc_dictionary_get_string(v11, (const char *)*MEMORY[0x1E0C81270]);
    _DMLogFunc(v5, 6, CFSTR("Data migrator -migrateWithCompletion: XPC error: %s"));
    int64 = 4 * v13;
  }
  else
  {
    int64 = xpc_dictionary_get_int64(v11, "migrationResult");
  }

  return int64;
}

- (id)orderedPluginIdentifiers
{
  xpc_object_t v3;
  void *v4;
  void *v5;
  void *v6;
  size_t count;
  size_t i;
  void *v9;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "msgID", 1);
  -[DMXPCConnection sendMessageSync:](self->_connection, "sendMessageSync:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x1D824E4C4]() == MEMORY[0x1E0C81310])
  {
    v6 = 0;
  }
  else
  {
    xpc_dictionary_get_value(v4, "results");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x1D824E4C4]() == MEMORY[0x1E0C812C8])
    {
      count = xpc_array_get_count(v5);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", count);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (count)
      {
        for (i = 0; i != count; ++i)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_array_get_string(v5, i));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v9);

        }
      }
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (void)changeVisibility:(BOOL)a3 completion:(id)a4
{
  id v6;
  xpc_object_t v7;
  DMXPCConnection *connection;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  DMConnection *v14;

  v6 = a4;
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v7, "msgID", 3);
  xpc_dictionary_set_BOOL(v7, "visible", a3);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy_;
  v13[4] = __Block_byref_object_dispose_;
  v14 = self;
  connection = v14->_connection;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__DMConnection_changeVisibility_completion___block_invoke;
  v10[3] = &unk_1E951EF98;
  v9 = v6;
  v11 = v9;
  v12 = v13;
  -[DMXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", v7, v10);

  _Block_object_dispose(v13, 8);
}

void __44__DMConnection_changeVisibility_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  MEMORY[0x1D824E4C4](a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (void)testMigrationUIWithProgress:(BOOL)a3 forceInvert:(BOOL)a4
{
  id v7;
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(xdict, "msgID", 2);
  xpc_dictionary_set_BOOL(xdict, "progress", a3);
  xpc_dictionary_set_BOOL(xdict, "invert", a4);
  v7 = -[DMXPCConnection sendMessageSync:](self->_connection, "sendMessageSync:", xdict);

}

- (void)forceMigrationOnNextRebootWithUserDataDisposition:(unsigned int)a3
{
  id v5;
  xpc_object_t xdict;

  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(xdict, "msgID", 4);
  xpc_dictionary_set_uint64(xdict, "disposition", a3);
  v5 = -[DMXPCConnection sendMessageSync:](self->_connection, "sendMessageSync:", xdict);

}

- (void)reportMigrationFailure
{
  uint64_t v2;
  void *v4;
  __CFString *v5;
  id v6;

  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v6, "msgID", 8);
  -[DMXPCConnection sendMessageSync:](self->_connection, "sendMessageSync:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x1D824E4C4]() == MEMORY[0x1E0C81310])
  {
    xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81270]);
    v5 = CFSTR("Data migrator -reportMigrationFailure: XPC error: %s");
  }
  else
  {
    v5 = CFSTR("Data migrator -reportMigrationFailure: succeeded");
  }
  _DMLogFunc(v2, 6, v5);

}

- (id)migrationPhaseDescription
{
  xpc_object_t v3;
  void *v4;
  const char *string;
  void *v6;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "msgID", 9);
  -[DMXPCConnection sendMessageSync:](self->_connection, "sendMessageSync:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x1D824E4C4]() == MEMORY[0x1E0C81310] || (string = xpc_dictionary_get_string(v4, "description")) == 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)migrationPluginResults:(id)a3
{
  id v4;
  xpc_object_t v5;
  DMXPCConnection *connection;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  DMConnection *v12;

  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, "msgID", 10);
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy_;
  v11[4] = __Block_byref_object_dispose_;
  v12 = self;
  connection = v12->_connection;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__DMConnection_migrationPluginResults___block_invoke;
  v8[3] = &unk_1E951EF98;
  v7 = v4;
  v9 = v7;
  v10 = v11;
  -[DMXPCConnection sendMessage:replyHandler:](connection, "sendMessage:replyHandler:", v5, v8);

  _Block_object_dispose(v11, 8);
}

void __39__DMConnection_migrationPluginResults___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  const void *data;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  size_t length;

  v4 = a2;
  if (MEMORY[0x1D824E4C4]() == MEMORY[0x1E0C81310])
  {
    if (*(_QWORD *)(a1 + 32))
    {
      _DMLogFunc(v2, 6, CFSTR("Data migrator -migrationPluginResults: got xpc error"));
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.datamigrator"), 2, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

    }
  }
  else
  {
    length = 0;
    data = xpc_dictionary_get_data(v4, "results", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, &v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v15;
      _DMLogFunc(v2, 6, CFSTR("Data migrator -migrationPluginResults: did unarchive results with success %d error %@"));
      v9 = *(_QWORD *)(a1 + 32);
      if (v9)
        (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v7, v8);

    }
    else
    {
      _DMLogFunc(v2, 6, CFSTR("Data migrator -migrationPluginResults: got no results"));
      v12 = *(_QWORD *)(a1 + 32);
      if (v12)
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v12 + 16))(v12, 0, 0);
    }
  }
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = 0;

}

- (void)deferExit
{
  id v3;
  id v4;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "msgID", 11);
  v3 = -[DMXPCConnection sendMessageSync:](self->_connection, "sendMessageSync:", v4);

}

- (void)cancelDeferredExit
{
  id v3;
  id v4;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "msgID", 12);
  v3 = -[DMXPCConnection sendMessageSync:](self->_connection, "sendMessageSync:", v4);

}

@end

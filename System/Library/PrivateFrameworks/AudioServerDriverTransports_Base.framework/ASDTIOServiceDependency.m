@implementation ASDTIOServiceDependency

+ (id)forClassName:(id)a3 idValue:(id)a4 andConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForClassName:idValue:andConfiguration:", v10, v9, v8);

  return v11;
}

+ (id)forAnyInstanceOfClassName:(id)a3 andConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForAnyInstanceOfClassName:andConfiguration:", v7, v6);

  return v8;
}

- (id)initForClassName:(id)a3 idValue:(id)a4 andConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  ASDTIOServiceDependency *v11;
  ASDTIOServiceDependency *v12;
  ASDTIOServiceDependency *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = 0;
  if (v8 && v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)ASDTIOServiceDependency;
    v12 = -[ASDTIOServiceDependency init](&v15, sel_init);
    v13 = v12;
    if (v12)
    {
      -[ASDTIOServiceDependency setIoServiceClassName:](v12, "setIoServiceClassName:", v8);
      -[ASDTIOServiceDependency setIoServiceID:](v13, "setIoServiceID:", v9);
      -[ASDTIOServiceDependency setConfiguration:](v13, "setConfiguration:", v10);
    }
    self = v13;
    v11 = self;
  }

  return v11;
}

- (id)initForAnyInstanceOfClassName:(id)a3 andConfiguration:(id)a4
{
  id v6;
  id v7;
  ASDTIOServiceDependency *v8;
  ASDTIOServiceDependency *v9;
  ASDTIOServiceDependency *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)ASDTIOServiceDependency;
    v8 = -[ASDTIOServiceDependency init](&v12, sel_init);
    v9 = v8;
    if (v8)
    {
      -[ASDTIOServiceDependency setIoServiceClassName:](v8, "setIoServiceClassName:", v6);
      -[ASDTIOServiceDependency setConfiguration:](v9, "setConfiguration:", v7);
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)addManagerDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ASDTIOServiceDependency ioServiceManager](self, "ioServiceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[ASDTIOServiceDependency ioServiceClassName](self, "ioServiceClassName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASDTIOServiceManager forIOServiceWithClassName:](ASDTIOServiceManager, "forIOServiceWithClassName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTIOServiceDependency setIoServiceManager:](self, "setIoServiceManager:", v7);

  }
  -[ASDTIOServiceDependency ioServiceID](self, "ioServiceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[ASDTIOServiceDependency ioServiceID](self, "ioServiceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[ASDTIOServiceDependency ioServiceManager](self, "ioServiceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addDelegate:forIDValues:", v4, v8);

}

- (BOOL)ioServiceIdentifierMatches:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[ASDTIOServiceDependency ioServiceID](self, "ioServiceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ASDTIOServiceDependency ioServiceID](self, "ioServiceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", v4);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)ioServiceMatches:(id)a3 withManager:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  -[ASDTIOServiceDependency ioServiceManager](self, "ioServiceManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7
    && (objc_msgSend(v6, "idValue"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = -[ASDTIOServiceDependency ioServiceIdentifierMatches:](self, "ioServiceIdentifierMatches:", v9),
        v9,
        v10))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[ASDTIOServiceDependency ioServiceMatches:withManager:].cold.1((uint64_t)self);
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)ioServiceAvailable:(id)a3 withManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  -[ASDTIOServiceDependency ioService](self, "ioService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (!-[ASDTIOServiceDependency ioServiceMatches:withManager:](self, "ioServiceMatches:withManager:", v6, v7))
    {
      v9 = 0;
      goto LABEL_6;
    }
    -[ASDTIOServiceDependency setIoService:](self, "setIoService:", v6);
  }
  v9 = 1;
LABEL_6:

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ASDTIOServiceDependency ioServiceID](self, "ioServiceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[ASDTIOServiceDependency ioServiceID](self, "ioServiceID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("('%@')"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_250842438;
  }
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[ASDTIOServiceDependency ioServiceClassName](self, "ioServiceClassName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)ioServiceMatched:(id)a3 withClassName:(id)a4 andIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v14, "ioService", (_QWORD)v20);
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          objc_msgSend(v14, "ioServiceClassName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v17, "isEqualToString:", v8) & 1) != 0)
          {
            v18 = objc_msgSend(v14, "ioServiceIdentifierMatches:", v9);

            if ((v18 & 1) != 0)
            {
              LOBYTE(v11) = 1;
              goto LABEL_13;
            }
          }
          else
          {

          }
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }
LABEL_13:

  return v11;
}

- (NSString)ioServiceClassName
{
  return self->_ioServiceClassName;
}

- (void)setIoServiceClassName:(id)a3
{
  objc_storeStrong((id *)&self->_ioServiceClassName, a3);
}

- (ASDTIOServiceID)ioServiceID
{
  return self->_ioServiceID;
}

- (void)setIoServiceID:(id)a3
{
  objc_storeStrong((id *)&self->_ioServiceID, a3);
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (ASDTIOServiceManager)ioServiceManager
{
  return (ASDTIOServiceManager *)objc_loadWeakRetained((id *)&self->_ioServiceManager);
}

- (void)setIoServiceManager:(id)a3
{
  objc_storeWeak((id *)&self->_ioServiceManager, a3);
}

- (ASDTIOService)ioService
{
  return self->_ioService;
}

- (void)setIoService:(id)a3
{
  objc_storeStrong((id *)&self->_ioService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioService, 0);
  objc_destroyWeak((id *)&self->_ioServiceManager);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_ioServiceID, 0);
  objc_storeStrong((id *)&self->_ioServiceClassName, 0);
}

- (void)ioServiceMatches:(uint64_t)a1 withManager:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_debug_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Matched: %@", (uint8_t *)&v1, 0xCu);
}

@end

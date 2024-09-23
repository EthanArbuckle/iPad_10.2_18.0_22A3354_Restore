@implementation ACDEventLedger

+ (id)sharedLedger
{
  if (sharedLedger_onceToken != -1)
    dispatch_once(&sharedLedger_onceToken, &__block_literal_global_10);
  return (id)sharedLedger_sharedInstance;
}

void __30__ACDEventLedger_sharedLedger__block_invoke()
{
  ACDEventLedger *v0;
  void *v1;

  v0 = objc_alloc_init(ACDEventLedger);
  v1 = (void *)sharedLedger_sharedInstance;
  sharedLedger_sharedInstance = (uint64_t)v0;

}

- (ACDEventLedger)init
{
  ACDEventLedger *v2;
  uint64_t v3;
  NSMutableArray *eventLedger;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACDEventLedger;
  v2 = -[ACDEventLedger init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
    eventLedger = v2->_eventLedger;
    v2->_eventLedger = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)recordEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  char *crashInfoString;
  id v11;
  NSObject *v12;

  v4 = a3;
  -[ACDEventLedger eventLedger](self, "eventLedger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  -[ACDEventLedger eventLedger](self, "eventLedger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  -[ACDEventLedger eventLedger](self, "eventLedger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 >= 0xB)
  {
    -[ACDEventLedger eventLedger](self, "eventLedger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectAtIndex:", 0);

  }
  crashInfoString = self->_crashInfoString;
  if (crashInfoString)
  {
    free(crashInfoString);
    self->_crashInfoString = 0;
  }
  -[ACDEventLedger historyDescription](self, "historyDescription");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  self->_crashInfoString = strdup((const char *)objc_msgSend(v11, "UTF8String"));

  qword_253E54EA0 = (uint64_t)self->_crashInfoString;
  objc_sync_exit(v5);

  if (recordEvent__onceToken != -1)
    dispatch_once(&recordEvent__onceToken, &__block_literal_global_2);
  if (recordEvent__logDatabaseTransactions == 1)
  {
    _ACDSaveLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[ACDEventLedger recordEvent:].cold.1((uint64_t)v4, v12);

  }
}

uint64_t __30__ACDEventLedger_recordEvent___block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
    recordEvent__logDatabaseTransactions = 1;
  return result;
}

- (id)historyDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[ACDEventLedger eventLedger](self, "eventLedger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Event history:\n%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)simulateCrashWithMessage:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void (*v6)(uint64_t, uint64_t, id);
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v3 = a3;
  v4 = getpid();
  v5 = v3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v6 = (void (*)(uint64_t, uint64_t, id))getSimulateCrashSymbolLoc_ptr;
  v11 = getSimulateCrashSymbolLoc_ptr;
  if (!getSimulateCrashSymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getSimulateCrashSymbolLoc_block_invoke;
    v7[3] = &unk_24C7E34B8;
    v7[4] = &v8;
    __getSimulateCrashSymbolLoc_block_invoke((uint64_t)v7);
    v6 = (void (*)(uint64_t, uint64_t, id))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v6)
    -[ACDEventLedger simulateCrashWithMessage:].cold.1();
  v6(v4, 195939070, v5);

}

- (NSMutableArray)eventLedger
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEventLedger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventLedger, 0);
}

- (void)recordEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_20D8CB000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

- (void)simulateCrashWithMessage:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL soft_SimulateCrash(pid_t, mach_exception_data_type_t, NSString *__strong)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ACDEventLedger.m"), 17, CFSTR("%s"), dlerror());

  __break(1u);
}

@end

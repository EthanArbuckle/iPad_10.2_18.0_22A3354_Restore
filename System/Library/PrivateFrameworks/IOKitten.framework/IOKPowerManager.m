@implementation IOKPowerManager

+ (id)powerManager
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (IOKPowerManager)init
{
  IOKPowerManager *v2;
  io_connect_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IOKPowerManager;
  v2 = -[IOKPowerManager init](&v5, sel_init);
  if (v2)
  {
    v3 = IOPMFindPowerManagement(0);
    v2->_connection = v3;
    if (!v3)
    {

      return 0;
    }
  }
  return v2;
}

+ (BOOL)isSleepEnabled
{
  return IOPMSleepEnabled() != 0;
}

- (BOOL)sleepSystemWithError:(id *)a3
{
  IOReturn v6;

  v6 = IOPMSleepSystem(self->_connection);
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[IOKPowerManager sleepSystemWithError:].cold.1((uint64_t)self, a2, v6);
      if (!a3)
        return v6 == 0;
      goto LABEL_4;
    }
    if (a3)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("IOErrorDomain"), v6, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v6 == 0;
}

- (void)dealloc
{
  io_connect_t connection;
  objc_super v4;

  connection = self->_connection;
  if (connection)
    IOServiceClose(connection);
  v4.receiver = self;
  v4.super_class = (Class)IOKPowerManager;
  -[IOKPowerManager dealloc](&v4, sel_dealloc);
}

- (void)sleepSystemWithError:(int)a3 .cold.1(uint64_t a1, const char *a2, int a3)
{
  objc_class *v5;
  id v6;
  uint64_t v7;
  id v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "UTF8String");
  NSStringFromSelector(a2);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = 136315650;
  v10 = v7;
  v11 = 2080;
  v12 = objc_msgSend(v8, "UTF8String");
  v13 = 1024;
  v14 = a3;
  _os_log_error_impl(&dword_215148000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s %s failed with error 0x%08x", (uint8_t *)&v9, 0x1Cu);

}

@end

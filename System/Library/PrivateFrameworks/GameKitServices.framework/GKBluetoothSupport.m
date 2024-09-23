@implementation GKBluetoothSupport

+ (int)bluetoothStatus
{
  int result;
  void *v4;
  uint64_t v5;
  _QWORD block[5];

  result = __bluetoothStatus;
  if (!__bluetoothStatus)
  {
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      __bluetoothStatus = objc_msgSend(a1, "_determineBluetoothStatus");
    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __37__GKBluetoothSupport_bluetoothStatus__block_invoke;
      block[3] = &unk_24D466170;
      block[4] = a1;
      dispatch_sync(MEMORY[0x24BDAC9B8], block);
    }
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = *MEMORY[0x24BE0F9C8];
    objc_msgSend(v4, "addObserver:selector:name:object:", a1, sel__btPowerStateChanged_, *MEMORY[0x24BE0F9C8], 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", a1, sel__btPowerStateChanged_, v5, 0);
    return __bluetoothStatus;
  }
  return result;
}

uint64_t __37__GKBluetoothSupport_bluetoothStatus__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_determineBluetoothStatus");
  __bluetoothStatus = result;
  return result;
}

+ (void)cleanup
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", a1);
  __bluetoothStatus = 0;
}

+ (void)turnBluetoothOn
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_bluetoothManagerClass"), "sharedInstance"), "setPowered:", 1);
}

+ (Class)_bluetoothManagerClass
{
  return (Class)objc_opt_class();
}

+ (int)_determineBluetoothStatus
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  int ErrorLogLevelForModule;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend((id)objc_msgSend(a1, "_bluetoothManagerClass"), "sharedInstance");
  if (v3)
  {
    v4 = v3;
    if ((objc_msgSend(v3, "available") & 1) != 0)
    {
      v5 = objc_msgSend(v4, "localDeviceSupportsService:", 2048);
      if (v5 != -1)
      {
        if (v5)
        {
          v13 = objc_msgSend(v4, "powered");
          if (v13)
            v6 = 5;
          else
            v6 = 4;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v14 = VRTraceErrorLogLevelToCSTR();
            v15 = *MEMORY[0x24BDFDC28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_DEFAULT))
            {
              v16 = CFSTR("OFF");
              v18 = 136315906;
              v19 = v14;
              v20 = 2080;
              v21 = "+[GKBluetoothSupport _determineBluetoothStatus]";
              if (v13)
                v16 = CFSTR("ON");
              v22 = 1024;
              v23 = 142;
              v24 = 2112;
              v25 = v16;
              _os_log_impl(&dword_215C5C000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d determined bluetooth is %@", (uint8_t *)&v18, 0x26u);
            }
          }
        }
        else
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
              +[GKBluetoothSupport _determineBluetoothStatus].cold.4();
          }
          return 1;
        }
        return v6;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = 3;
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          +[GKBluetoothSupport _determineBluetoothStatus].cold.5();
        return v6;
      }
      return 3;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        +[GKBluetoothSupport _determineBluetoothStatus].cold.6();
    }
    return 0;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        +[GKBluetoothSupport _determineBluetoothStatus].cold.3(v7, a1, v8);
    }
    v9 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_bluetoothManagerClass"), "lastInitError");
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v9 == 9)
    {
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
          +[GKBluetoothSupport _determineBluetoothStatus].cold.1();
      }
      return 2;
    }
    else
    {
      if (ErrorLogLevelForModule < 3)
        return 3;
      v6 = 3;
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x24BDFDC28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDFDC28], OS_LOG_TYPE_ERROR))
        +[GKBluetoothSupport _determineBluetoothStatus].cold.2(v11, a1, v12);
    }
  }
  return v6;
}

+ (void)_btPowerStateChanged:(id)a3
{
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    __bluetoothStatus = objc_msgSend(a1, "_determineBluetoothStatus");
    if (!__bluetoothStatus)
      return;
    goto LABEL_3;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__GKBluetoothSupport__btPowerStateChanged___block_invoke;
  block[3] = &unk_24D466170;
  block[4] = a1;
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
  if (__bluetoothStatus)
LABEL_3:
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("GKBluetoothPowerStatusChangedNotification"), a1, objc_msgSend(a3, "userInfo"));
}

uint64_t __43__GKBluetoothSupport__btPowerStateChanged___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_determineBluetoothStatus");
  __bluetoothStatus = result;
  return result;
}

+ (int)_directBTStatus
{
  return __bluetoothStatus;
}

+ (void)_determineBluetoothStatus
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_215C5C000, v0, v1, " [%s] %s:%d BT not available - try again later.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

@end

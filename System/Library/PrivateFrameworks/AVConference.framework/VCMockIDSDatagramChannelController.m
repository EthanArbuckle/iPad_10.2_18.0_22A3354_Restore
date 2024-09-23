@implementation VCMockIDSDatagramChannelController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12 != -1)
    dispatch_once(&sharedInstance_onceToken_12, &__block_literal_global_75);
  return (id)sharedInstance_sharedDatagramChannelManager_0;
}

VCMockIDSDatagramChannelController *__52__VCMockIDSDatagramChannelController_sharedInstance__block_invoke()
{
  VCMockIDSDatagramChannelController *result;

  result = objc_alloc_init(VCMockIDSDatagramChannelController);
  sharedInstance_sharedDatagramChannelManager_0 = (uint64_t)result;
  return result;
}

- (id)datagramChannelWithDestination:(id)a3
{
  return -[VCMockIDSDatagramChannelController datagramChannelWithDestination:dataPath:](self, "datagramChannelWithDestination:dataPath:", a3, 0);
}

- (id)datagramChannelSocketForDestination:(id)a3 ipPorts:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;

  if (!a3 || !a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMockIDSDatagramChannelController datagramChannelSocketForDestination:ipPorts:].cold.1();
    }
    return 0;
  }
  v6 = objc_msgSend(a3, "hasPrefix:", CFSTR("loopback:Conference"));
  v7 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":"));
  if (!v7
    || (v8 = v7, (unint64_t)objc_msgSend(v7, "count") < 2)
    || (int)objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", 1), "intValue") < 1
    || (v9 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", 1), "intValue") << 16) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMockIDSDatagramChannelController datagramChannelSocketForDestination:ipPorts:].cold.2();
    }
    return 0;
  }
  if (v9 == 1068498944)
    v10 = CFSTR("vcDefaultMockDatagramChannelIPPortsKeyLocalIP");
  else
    v10 = CFSTR("vcDefaultMockDatagramChannelIPPortsKeyRemoteIP");
  if (v9 == 1068498944)
    v11 = CFSTR("vcDefaultMockDatagramChannelIPPortsKeyRemoteIP");
  else
    v11 = CFSTR("vcDefaultMockDatagramChannelIPPortsKeyLocalIP");
  if (v9 == 1068498944)
    v12 = CFSTR("vcDefaultMockDatagramChannelIPPortsKeyLocalPort");
  else
    v12 = CFSTR("vcDefaultMockDatagramChannelIPPortsKeyRemotePort");
  if (v9 == 1068498944)
    v13 = CFSTR("vcDefaultMockDatagramChannelIPPortsKeyRemotePort");
  else
    v13 = CFSTR("vcDefaultMockDatagramChannelIPPortsKeyLocalPort");
  return -[VCMockIDSDatagramChannelSocket initRequiresOptions:localIP:localPort:remoteIP:remotePort:]([VCMockIDSDatagramChannelSocket alloc], "initRequiresOptions:localIP:localPort:remoteIP:remotePort:", v6, objc_msgSend(a4, "objectForKeyedSubscript:", v10), objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", v12), "shortValue"), objc_msgSend(a4, "objectForKeyedSubscript:", v11), objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", v13), "shortValue"));
}

- (id)datagramChannelWithDestination:(id)a3 dataPath:(int)a4
{
  uint64_t v4;
  uint64_t v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  _BYTE v19[24];
  __int128 v20;
  id v21;
  uint64_t v22;

  v4 = *(_QWORD *)&a4;
  v22 = *MEMORY[0x1E0C80C00];
  -[VCObject lock](self, "lock");
  if (a3)
    v7 = objc_msgSend(a3, "hasPrefix:", CFSTR("loopback:Conference"));
  else
    v7 = 0;
  v8 = -[VCDatagramChannelManager destinations](+[VCDatagramChannelManager sharedInstance](VCDatagramChannelManager, "sharedInstance"), "destinations");
  if (a3)
  {
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend((id)objc_msgSend(v8, "allKeys"), "count");
      if (VCDefaults_GetBoolValueForKey(CFSTR("enableTestNetworkRouter"), 0))
      {
        if (!objc_msgSend(v9, "objectForKeyedSubscript:", a3))
        {
LABEL_10:
          v11 = (void *)VCDefaults_CopyDictionaryValueForKey(CFSTR("mockDatagramChannelIPPorts"));
          if (v11)
          {
            v12 = v11;
            v13 = -[VCMockIDSDatagramChannelController datagramChannelSocketForDestination:ipPorts:](self, "datagramChannelSocketForDestination:ipPorts:", a3, v11);

            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v14 = VRTraceErrorLogLevelToCSTR();
              v15 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v19 = 136316162;
                *(_QWORD *)&v19[4] = v14;
                *(_WORD *)&v19[12] = 2080;
                *(_QWORD *)&v19[14] = "-[VCMockIDSDatagramChannelController datagramChannelWithDestination:dataPath:]";
                *(_WORD *)&v19[22] = 1024;
                LODWORD(v20) = 1196;
                WORD2(v20) = 2048;
                *(_QWORD *)((char *)&v20 + 6) = v13;
                HIWORD(v20) = 2112;
                v21 = a3;
LABEL_17:
                _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Created datagramChannel=%p for destination=%@", v19, 0x30u);
              }
            }
          }
          else
          {
            v13 = -[VCMockIDSDatagramChannel initCreateSocketRequiresOptions:dataPath:destination:]([VCMockIDSDatagramChannel alloc], "initCreateSocketRequiresOptions:dataPath:destination:", v7, v4, a3);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v16 = VRTraceErrorLogLevelToCSTR();
              v15 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v19 = 136316162;
                *(_QWORD *)&v19[4] = v16;
                *(_WORD *)&v19[12] = 2080;
                *(_QWORD *)&v19[14] = "-[VCMockIDSDatagramChannelController datagramChannelWithDestination:dataPath:]";
                *(_WORD *)&v19[22] = 1024;
                LODWORD(v20) = 1199;
                WORD2(v20) = 2048;
                *(_QWORD *)((char *)&v20 + 6) = v13;
                HIWORD(v20) = 2112;
                v21 = a3;
                goto LABEL_17;
              }
            }
          }
          if (v13)
            goto LABEL_22;
        }
      }
      else if (!v10)
      {
        goto LABEL_10;
      }
    }
  }
  v17 = -[VCMockIDSDatagramChannelController getFirstDatagramChannelIDS](self, "getFirstDatagramChannelIDS", *(_OWORD *)v19, *(_QWORD *)&v19[16], v20, v21);
  if (v17)
    v13 = (id)objc_msgSend(v17, "idsDatagramChannel");
  else
    v13 = 0;
LABEL_22:
  objc_msgSend(v13, "setWriteCompletionHandler:", &__block_literal_global_279, *(_QWORD *)v19, *(_OWORD *)&v19[8], v20, v21);
  -[VCObject unlock](self, "unlock");
  return v13;
}

uint64_t __78__VCMockIDSDatagramChannelController_datagramChannelWithDestination_dataPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (!a2)
    return VTP_IncrementTotalBytesSent(a3);
  return result;
}

- (void)dealloc
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)VCMockIDSDatagramChannelController;
  -[VCObject dealloc](&v2, sel_dealloc);
}

- (void)setWriteDatagramsBlockForDatagram:(id)a3 block:(id)a4
{
  id v7;
  id v8;

  -[VCObject lock](self, "lock");
  if (a3)
  {
    v7 = a3;
LABEL_5:
    objc_msgSend(v7, "setWriteDatagramsBlock:", a4);
    goto LABEL_6;
  }
  v8 = -[VCMockIDSDatagramChannelController getFirstDatagramChannelIDS](self, "getFirstDatagramChannelIDS");
  if (v8)
  {
    v7 = (id)objc_msgSend(v8, "idsDatagramChannel");
    goto LABEL_5;
  }
LABEL_6:
  -[VCObject unlock](self, "unlock");
}

- (void)setWriteDatagramBlockForDatagram:(id)a3 block:(id)a4
{
  id v7;
  id v8;

  -[VCObject lock](self, "lock");
  if (a3)
  {
    v7 = a3;
LABEL_5:
    objc_msgSend(v7, "setWriteDatagramBlock:", a4);
    goto LABEL_6;
  }
  v8 = -[VCMockIDSDatagramChannelController getFirstDatagramChannelIDS](self, "getFirstDatagramChannelIDS");
  if (v8)
  {
    v7 = (id)objc_msgSend(v8, "idsDatagramChannel");
    goto LABEL_5;
  }
LABEL_6:
  -[VCObject unlock](self, "unlock");
}

- (void)setReadyToReadBlockForDatagram:(id)a3 block:(id)a4
{
  id v7;
  id v8;

  -[VCObject lock](self, "lock");
  if (a3)
  {
    v7 = a3;
LABEL_5:
    objc_msgSend(v7, "setReadyToReadBlock:", a4);
    goto LABEL_6;
  }
  v8 = -[VCMockIDSDatagramChannelController getFirstDatagramChannelIDS](self, "getFirstDatagramChannelIDS");
  if (v8)
  {
    v7 = (id)objc_msgSend(v8, "idsDatagramChannel");
    goto LABEL_5;
  }
LABEL_6:
  -[VCObject unlock](self, "unlock");
}

- (id)getFirstDatagramChannelIDS
{
  id v2;
  void *v3;

  v2 = -[VCDatagramChannelManager datagramChannels](+[VCDatagramChannelManager sharedInstance](VCDatagramChannelManager, "sharedInstance"), "datagramChannels");
  if (v2 && (v3 = v2, objc_msgSend((id)objc_msgSend(v2, "allKeys"), "count")))
    return (id)objc_msgSend((id)objc_msgSend(v3, "allValues"), "firstObject");
  else
    return 0;
}

- (void)datagramChannelSocketForDestination:ipPorts:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid parameters", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)datagramChannelSocketForDestination:ipPorts:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid local port", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end

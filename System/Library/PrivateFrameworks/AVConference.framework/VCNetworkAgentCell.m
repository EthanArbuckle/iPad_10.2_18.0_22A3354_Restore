@implementation VCNetworkAgentCell

- (VCNetworkAgentCell)init
{
  VCNetworkAgentCell *v2;
  NWNetworkAgentRegistration *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCNetworkAgentCell;
  v2 = -[VCObject init](&v5, sel_init);
  if (v2)
  {
    v2->_agentUUID = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    v2->_active = 1;
    v2->_voluntary = 1;
    v2->_wifiInterfaceName = (NSString *)-[VCNetworkAgentCell queryWifiInterfaceName](v2, "queryWifiInterfaceName");
    v3 = (NWNetworkAgentRegistration *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCEC90]), "initWithNetworkAgentClass:", objc_opt_class());
    v2->_agentRegistration = v3;
    -[NWNetworkAgentRegistration registerNetworkAgent:](v3, "registerNetworkAgent:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCNetworkAgentCell;
  -[VCObject dealloc](&v3, sel_dealloc);
}

- (id)queryWifiInterfaceName
{
  NSObject *v2;
  NSObject *v3;
  uint64_t evaluator_for_endpoint;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = nw_parameters_create();
  v3 = v2;
  if (!v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCNetworkAgentCell queryWifiInterfaceName].cold.1();
    }
    goto LABEL_15;
  }
  nw_parameters_set_required_interface_type(v2, nw_interface_type_wifi);
  evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint();
  if (!evaluator_for_endpoint)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCNetworkAgentCell queryWifiInterfaceName].cold.2();
    }
LABEL_15:
    v9 = 0;
    v7 = 0;
    v5 = 0;
LABEL_24:
    v10 = CFSTR("en0");
    goto LABEL_8;
  }
  v5 = (void *)evaluator_for_endpoint;
  v6 = nw_path_evaluator_copy_path();
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCNetworkAgentCell queryWifiInterfaceName].cold.3();
    }
    v9 = 0;
    v7 = 0;
    goto LABEL_24;
  }
  v7 = (void *)v6;
  v8 = nw_path_copy_interface();
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCNetworkAgentCell queryWifiInterfaceName].cold.4();
    }
    v9 = 0;
    goto LABEL_24;
  }
  v9 = v8;
  v10 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), nw_interface_get_name(v8));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v15 = v11;
      v16 = 2080;
      v17 = "-[VCNetworkAgentCell queryWifiInterfaceName]";
      v18 = 1024;
      v19 = 91;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Wifi interface name %@", buf, 0x26u);
    }
  }
LABEL_8:

  return (id)v10;
}

+ (id)agentDomain
{
  return CFSTR("AVConference");
}

+ (id)agentType
{
  return CFSTR("CellularFallback");
}

+ (id)agentFromData:(id)a3
{
  return 0;
}

- (id)copyAgentData
{
  return 0;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isKernelActivated
{
  return self->kernelActivated;
}

- (void)setKernelActivated:(BOOL)a3
{
  self->kernelActivated = a3;
}

- (BOOL)isUserActivated
{
  return self->userActivated;
}

- (void)setUserActivated:(BOOL)a3
{
  self->userActivated = a3;
}

- (BOOL)isVoluntary
{
  return self->_voluntary;
}

- (void)setVoluntary:(BOOL)a3
{
  self->_voluntary = a3;
}

- (NSUUID)agentUUID
{
  return self->_agentUUID;
}

- (void)setAgentUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)agentDescription
{
  return self->_agentDescription;
}

- (void)setAgentDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

VCNetworkAgentCell *___VCNetworkAgentCell_SharedInstance_block_invoke()
{
  VCNetworkAgentCell *result;

  result = objc_alloc_init(VCNetworkAgentCell);
  _VCNetworkAgentCell_SharedInstance_sharedInstance = (uint64_t)result;
  return result;
}

- (void)queryWifiInterfaceName
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d nil interface", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end

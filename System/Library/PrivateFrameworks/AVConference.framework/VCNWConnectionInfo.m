@implementation VCNWConnectionInfo

- (void)setConnection:(id)a3
{
  nw_release(self->_connection);
  self->_connection = (OS_nw_connection *)nw_retain(a3);
}

- (void)setParameters:(id)a3
{
  nw_release(self->_parameters);
  self->_parameters = (OS_nw_parameters *)nw_retain(a3);
}

- (void)setRemoteAddress:(id)a3
{

  self->_remoteAddress = (VCNetworkAddress *)objc_msgSend(a3, "copy");
}

- (VCNetworkAddress)remoteAddress
{
  VCNetworkAddress *result;

  result = self->_remoteAddress;
  if (!result)
  {
    result = -[VCNWConnectionInfo newRemoteAddressFromConnection](self, "newRemoteAddressFromConnection");
    self->_remoteAddress = result;
  }
  return result;
}

- (OS_nw_parameters)parameters
{
  OS_nw_parameters *result;

  result = self->_parameters;
  if (!result)
  {
    result = -[VCNWConnectionInfo newParametersFromConnection](self, "newParametersFromConnection");
    self->_parameters = result;
  }
  return result;
}

- (void)setConnectionID:(id)a3
{

  self->_connectionID = (NSString *)objc_msgSend(a3, "copy");
}

- (id)newRemoteAddressFromConnection
{
  NSObject *connection;
  NSObject *v3;
  NSObject *v4;
  char *v5;
  char *v6;
  const sockaddr *address;
  const sockaddr *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  connection = self->_connection;
  if (!connection)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCNWConnectionInfo newRemoteAddressFromConnection].cold.1();
    }
    goto LABEL_18;
  }
  v3 = nw_connection_copy_endpoint(connection);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCNWConnectionInfo newRemoteAddressFromConnection].cold.2();
    }
LABEL_18:
    v4 = 0;
LABEL_22:
    nw_release(v4);
    return 0;
  }
  v4 = v3;
  v5 = nw_endpoint_copy_address_string(v3);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCNWConnectionInfo newRemoteAddressFromConnection].cold.3();
    }
    goto LABEL_22;
  }
  v6 = v5;
  address = nw_endpoint_get_address(v4);
  if (address)
  {
    v8 = address;
    v9 = (void *)objc_opt_new();
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, "setIp:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6));
      objc_msgSend(v10, "setPort:", nw_endpoint_get_port(v4));
      if (v8->sa_family == 30)
        v11 = 6;
      else
        v11 = 4;
      objc_msgSend(v10, "setIpVersion:", v11);
      goto LABEL_10;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCNWConnectionInfo newRemoteAddressFromConnection].cold.5();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCNWConnectionInfo newRemoteAddressFromConnection].cold.4();
  }
  v10 = 0;
LABEL_10:
  nw_release(v4);
  free(v6);
  return v10;
}

- (id)newParametersFromConnection
{
  id result;

  result = self->_connection;
  if (result)
  {
    result = nw_connection_copy_parameters((nw_connection_t)result);
    if (!result)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCNWConnectionInfo newParametersFromConnection].cold.1();
      }
      return 0;
    }
  }
  return result;
}

- (BOOL)isSameRemoteAddress:(id)a3
{
  _BOOL4 v5;
  int v6;
  int v7;

  v5 = -[NSString isEqualToString:](-[VCNetworkAddress ip](-[VCNWConnectionInfo remoteAddress](self, "remoteAddress"), "ip"), "isEqualToString:", objc_msgSend(a3, "ip"));
  if (v5)
  {
    v6 = -[VCNetworkAddress port](-[VCNWConnectionInfo remoteAddress](self, "remoteAddress"), "port");
    if (v6 == objc_msgSend(a3, "port"))
    {
      v7 = -[VCNetworkAddress ipVersion](-[VCNWConnectionInfo remoteAddress](self, "remoteAddress"), "ipVersion");
      LOBYTE(v5) = v7 == objc_msgSend(a3, "ipVersion");
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  nw_release(self->_connection);
  nw_release(self->_parameters);

  v3.receiver = self;
  v3.super_class = (Class)VCNWConnectionInfo;
  -[VCObject dealloc](&v3, sel_dealloc);
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (NSString)connectionID
{
  return self->_connectionID;
}

- (void)newRemoteAddressFromConnection
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate networkAddress", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newParametersFromConnection
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retrieve the nw parameters", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end

@implementation VCNetworkAddress

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCNetworkAddress;
  -[VCNetworkAddress dealloc](&v3, sel_dealloc);
}

- (BOOL)isIPv6
{
  return self->_ipVersion == 6;
}

- (BOOL)isValid
{
  NSString *ip;

  ip = self->_ip;
  if (ip)
    LOBYTE(ip) = !-[NSString isEqualToString:](ip, "isEqualToString:", &stru_1E9E58EE0)
              && self->_port
              && (self->_ipVersion & 0xFFFD) == 4;
  return (char)ip;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  int port;
  int ipVersion;

  v5 = -[NSString isEqual:](self->_ip, "isEqual:", objc_msgSend(a3, "ip"));
  if (v5)
  {
    port = self->_port;
    if (port == objc_msgSend(a3, "port"))
    {
      ipVersion = self->_ipVersion;
      if (ipVersion == objc_msgSend(a3, "ipVersion"))
      {
        if ((-[NSString isEqual:](self->_interfaceName, "isEqual:", objc_msgSend(a3, "interfaceName")) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        if (!self->_interfaceName)
        {
          LOBYTE(v5) = objc_msgSend(a3, "interfaceName") == 0;
          return v5;
        }
      }
    }
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCNetworkAddress;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@:%d"), -[VCNetworkAddress description](&v3, sel_description), self->_ip, self->_port);
}

- (id)copyWithZone:(_NSZone *)a3
{
  VCNetworkAddress *v4;

  v4 = +[VCNetworkAddress allocWithZone:](VCNetworkAddress, "allocWithZone:", a3);
  -[VCNetworkAddress setIp:](v4, "setIp:", self->_ip);
  -[VCNetworkAddress setPort:](v4, "setPort:", self->_port);
  -[VCNetworkAddress setIpVersion:](v4, "setIpVersion:", self->_ipVersion);
  -[VCNetworkAddress setInterfaceName:](v4, "setInterfaceName:", self->_interfaceName);
  return v4;
}

- (int)getSockaddrStorage:(sockaddr_storage *)a3 size:(unint64_t *)a4
{
  __int128 v4;
  int v8;
  const char *v9;
  addrinfo *v10;
  unint64_t ai_addrlen;
  int v12;
  uint64_t v14;
  NSObject *v15;
  addrinfo *v16;
  addrinfo v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v17.ai_addrlen = v4;
  *(_OWORD *)&v17.ai_addr = v4;
  *(_OWORD *)&v17.ai_flags = v4;
  v16 = 0;
  if (a3)
  {
    if (a4)
    {
      memset(&v17, 0, sizeof(v17));
      if (self->_ipVersion == 6)
        v8 = 30;
      else
        v8 = 2;
      v17.ai_family = v8;
      v17.ai_socktype = 2;
      v9 = -[NSString UTF8String](self->_ip, "UTF8String");
      if (getaddrinfo(v9, (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_port), "stringValue"), "UTF8String"), &v17, &v16) == -1)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v14 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCNetworkAddress getSockaddrStorage:size:].cold.3(v14, v15);
        }
        v12 = -1;
      }
      else
      {
        v10 = v16;
        if (v16)
        {
          ai_addrlen = v16->ai_addrlen;
          if (*a4 < ai_addrlen)
          {
            *a4 = ai_addrlen;
            if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            {
              v12 = -2143879105;
            }
            else
            {
              VRTraceErrorLogLevelToCSTR();
              v12 = -2143879105;
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCNetworkAddress getSockaddrStorage:size:].cold.5();
            }
          }
          else
          {
            memcpy(a3, v16->ai_addr, ai_addrlen);
            v12 = 0;
            *a4 = v10->ai_addrlen;
          }
        }
        else
        {
          v12 = -2143879164;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              -[VCNetworkAddress getSockaddrStorage:size:].cold.4();
              v12 = -2143879164;
            }
          }
        }
      }
    }
    else
    {
      v12 = -2143879167;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCNetworkAddress getSockaddrStorage:size:].cold.2();
      }
    }
  }
  else
  {
    v12 = -2143879167;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return v12;
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCNetworkAddress getSockaddrStorage:size:].cold.1();
  }
  if (v16)
    freeaddrinfo(v16);
  return v12;
}

- (NSString)ip
{
  return self->_ip;
}

- (void)setIp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->_port = a3;
}

- (unsigned)ipVersion
{
  return self->_ipVersion;
}

- (void)setIpVersion:(unsigned __int16)a3
{
  self->_ipVersion = a3;
}

- (void)getSockaddrStorage:size:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Parameter 'storage'  must not be NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getSockaddrStorage:size:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Parameter 'size' must not be NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getSockaddrStorage:(uint64_t)a1 size:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *__error();
  v5 = 136315906;
  v6 = a1;
  v7 = 2080;
  v8 = "-[VCNetworkAddress getSockaddrStorage:size:]";
  v9 = 1024;
  v10 = 84;
  v11 = 1024;
  v12 = v4;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d getaddrinfo failed with error '%d'", (uint8_t *)&v5, 0x22u);
}

- (void)getSockaddrStorage:size:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d getaddrinfo failed to return valid data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getSockaddrStorage:size:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d getaddrinfo failed to return valid data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end

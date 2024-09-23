@implementation WFNetworkInterface

- (WFNetworkInterface)initWithInterface:(id)a3
{
  id v5;
  WFNetworkInterface *v6;
  uint64_t v7;
  NSString *interfaceName;
  WFNetworkInterface *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFNetworkInterface.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interfaceName"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFNetworkInterface;
  v6 = -[WFNetworkInterface init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    interfaceName = v6->_interfaceName;
    v6->_interfaceName = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

- (NSString)IPv4Address
{
  return (NSString *)-[WFNetworkInterface ipAddressForFamily:](self, "ipAddressForFamily:", 2);
}

- (NSString)IPv6Address
{
  return (NSString *)-[WFNetworkInterface ipAddressForFamily:](self, "ipAddressForFamily:", 30);
}

- (__WiFiNetwork)currentWiFiNetwork
{
  uint64_t v3;
  const void *v4;
  void *v5;
  __WiFiNetwork *Device;
  __WiFiNetwork *v7;

  v3 = WiFiManagerClientCreate();
  if (!v3)
    return 0;
  v4 = (const void *)v3;
  -[WFNetworkInterface interfaceName](self, "interfaceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  Device = (__WiFiNetwork *)WiFiManagerClientGetDevice();

  if (Device)
  {
    v7 = (__WiFiNetwork *)WiFiDeviceClientCopyCurrentNetwork();
    Device = v7;
    if (v7)
      CFAutorelease(v7);
  }
  CFRelease(v4);
  return Device;
}

- (id)ipAddressForFamily:(unsigned __int8)a3
{
  int v3;
  int v5;
  void (**v6)(_QWORD);
  void *v7;
  ifaddrs *v8;
  const char *ifa_name;
  id v10;
  _QWORD v12[5];
  ifaddrs *v13;

  v3 = a3;
  v13 = 0;
  v5 = getifaddrs(&v13);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __41__WFNetworkInterface_ipAddressForFamily___block_invoke;
  v12[3] = &__block_descriptor_40_e5_v8__0l;
  v12[4] = v13;
  v6 = (void (**)(_QWORD))_Block_copy(v12);
  v7 = 0;
  if (!v5)
  {
    v8 = v13;
    if (v13)
    {
      while (1)
      {
        if (v8->ifa_addr->sa_family == v3)
        {
          ifa_name = v8->ifa_name;
          -[WFNetworkInterface interfaceName](self, "interfaceName");
          v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          LODWORD(ifa_name) = strcmp(ifa_name, (const char *)objc_msgSend(v10, "UTF8String"));

          if (!(_DWORD)ifa_name)
            break;
        }
        v8 = v8->ifa_next;
        if (!v8)
        {
          v7 = 0;
          goto LABEL_8;
        }
      }
      WFStringFromIPSocketAddress(&v8->ifa_addr->sa_len);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_8:
  v6[2](v6);

  return v7;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceName, 0);
}

void __41__WFNetworkInterface_ipAddressForFamily___block_invoke()
{
  JUMPOUT(0x22E314F48);
}

+ (id)networkInterfaceWithInterface:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInterface:", v4);

  return v5;
}

+ (id)activeNetworkInterface
{
  void *v2;
  void *v3;
  void *v4;

  WFDefaultNetworkInterfaces();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[WFNetworkInterface networkInterfaceWithInterface:](WFNetworkInterface, "networkInterfaceWithInterface:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)defaultNetworkInterfaces
{
  void *v2;
  void *v3;

  WFDefaultNetworkInterfaces();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_map:", &__block_literal_global_46430);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)wifiNetworkInterfaces
{
  void *v2;
  void *v3;

  v2 = (void *)WiFiManagerClientCreate();
  if (v2)
  {
    v3 = (void *)WiFiManagerClientCopyInterfaces();
    CFRelease(v2);
    objc_msgSend(v3, "if_map:", &__block_literal_global_5_46427);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id __43__WFNetworkInterface_wifiNetworkInterfaces__block_invoke()
{
  void *v0;
  void *v1;

  WiFiDeviceClientGetInterfaceName();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFNetworkInterface networkInterfaceWithInterface:](WFNetworkInterface, "networkInterfaceWithInterface:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

WFNetworkInterface *__46__WFNetworkInterface_defaultNetworkInterfaces__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFNetworkInterface networkInterfaceWithInterface:](WFNetworkInterface, "networkInterfaceWithInterface:", a2);
}

@end

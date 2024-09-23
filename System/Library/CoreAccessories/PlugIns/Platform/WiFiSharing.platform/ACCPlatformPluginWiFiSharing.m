@implementation ACCPlatformPluginWiFiSharing

- (NSString)pluginName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)initPlugin
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21A4E5000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)startPlugin
{
  -[ACCPlatformPluginWiFiSharing setIsRunning:](self, "setIsRunning:", 1);
}

- (void)stopPlugin
{
  -[ACCPlatformPluginWiFiSharing setIsRunning:](self, "setIsRunning:", 0);
}

- (BOOL)isDeviceConnectedToWiFi
{
  uint64_t v2;
  const void *v3;
  const __CFArray *v4;
  const __CFArray *v5;
  const void *v6;
  BOOL v7;

  v2 = WiFiManagerClientCreate();
  if (!v2)
    return 0;
  v3 = (const void *)v2;
  v4 = (const __CFArray *)WiFiManagerClientCopyDevices();
  if (v4)
  {
    v5 = v4;
    if (CFArrayGetCount(v4)
      && (CFArrayGetValueAtIndex(v5, 0), (v6 = (const void *)WiFiDeviceClientCopyCurrentNetwork()) != 0))
    {
      CFRelease(v6);
      v7 = 1;
    }
    else
    {
      v7 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v3);
  return v7;
}

- (BOOL)hasWAPICapability
{
  return self->_hasWAPICapability;
}

- (id)copyDeviceWiFiNetworkInformation
{
  id v2;
  uint64_t v3;
  const void *v4;
  const __CFArray *v5;
  const __CFArray *v6;
  uint64_t v7;
  const void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void *v15;
  void *v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  int v19;
  int v20;
  unsigned int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = WiFiManagerClientCreate();
  if (!v3)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 1;
    goto LABEL_35;
  }
  v4 = (const void *)v3;
  v5 = (const __CFArray *)WiFiManagerClientCopyDevices();
  if (v5)
  {
    v6 = v5;
    if (CFArrayGetCount(v5))
    {
      CFArrayGetValueAtIndex(v6, 0);
      v7 = WiFiDeviceClientCopyCurrentNetwork();
      if (v7)
      {
        v8 = (const void *)v7;
        WiFiNetworkGetSSID();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v9;
        if (v9)
          v10 = (__CFString *)objc_msgSend(v9, "copy");
        else
          v10 = &stru_24DCCCEB0;
        if (WiFiNetworkIsWEP())
        {
          v13 = 0;
        }
        else
        {
          if (!WiFiNetworkIsWPA())
          {
            v14 = 0;
            v12 = 0;
            v13 = 1;
LABEL_17:
            v15 = (void *)WiFiNetworkCopyPassword();
            v16 = v15;
            if (v15)
            {
              v11 = (__CFString *)objc_msgSend(v15, "copy");
            }
            else
            {
              v11 = &stru_24DCCCEB0;
              if ((v14 & 1) != 0)
              {
LABEL_31:
                v12 = 2;
LABEL_32:
                CFRelease(v8);

                goto LABEL_33;
              }
            }
            if (!WiFiNetworkRequiresUsername() && !WiFiNetworkRequiresIdentity())
              goto LABEL_32;
            goto LABEL_31;
          }
          v17 = (const __CFDictionary *)WiFiNetworkCopyRecord();
          v12 = 2;
          if (!v17)
          {
            v13 = 1;
            goto LABEL_16;
          }
          v18 = v17;
          v19 = CFDictionaryContainsKey(v17, CFSTR("WPA_IE"));
          v20 = CFDictionaryContainsKey(v18, CFSTR("RSN_IE"));
          if (v19)
            v21 = 3;
          else
            v21 = 2;
          if (v20)
            v13 = v21;
          else
            v13 = 1;
          CFRelease(v18);
        }
        v12 = 0;
LABEL_16:
        v14 = 1;
        goto LABEL_17;
      }
      v10 = 0;
      v11 = 0;
      v12 = 2;
    }
    else
    {
      v10 = 0;
      v11 = 0;
      v12 = 0;
    }
    v13 = 1;
LABEL_33:
    CFRelease(v6);
    goto LABEL_34;
  }
  v12 = 0;
  v11 = 0;
  v10 = 0;
  v13 = 1;
LABEL_34:
  CFRelease(v4);
LABEL_35:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v22, CFSTR("WiFiStatus"));

  if ((_DWORD)v12 != 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKey:", v23, CFSTR("WiFiSecurityType"));

    if (v10)
      objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("WiFiSSID"));
    if (v11)
      objc_msgSend(v2, "setObject:forKey:", v11, CFSTR("WiFiPassphrase"));
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v24 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginWiFiSharing initPlugin].cold.1();
    v24 = MEMORY[0x24BDACB70];
    v25 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v2;
    _os_log_impl(&dword_21A4E5000, v24, OS_LOG_TYPE_INFO, "Returning deviceWiFiNetworkInformation %@", buf, 0xCu);
  }

  return v2;
}

- (BOOL)handleAccessoryWiFiInformationForWirelessCarPlay:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  BOOL v10;
  void *v11;
  int v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("WiFiBSSID"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("WiFiSSID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("WiFiPassphrase"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("WiFiSecurityType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("WiFiChannel"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("LegacyAccessoryExternalAccessoryConnectionID"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (v7)
    v9 = objc_msgSend(v7, "unsignedIntValue");
  else
    v9 = 0;
  if (!v5 || (v6 ? (v10 = v9 == 0) : (v10 = 0), v10))
  {
    v11 = (void *)v4;
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v13 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformPluginWiFiSharing initPlugin].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v5;
      _os_log_impl(&dword_21A4E5000, v13, OS_LOG_TYPE_DEFAULT, "ERROR: either SSID is nil (it's %@), or passphrase is present but securityType is none, not setting CarPlay WiFi params", buf, 0xCu);
    }

    v12 = 0;
  }
  else
  {
    v11 = (void *)v4;
    v12 = 1;
  }
  if (gLogObjects && gNumLogObjects >= 2)
  {
    v15 = *(id *)(gLogObjects + 8);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCPlatformPluginWiFiSharing initPlugin].cold.1();
    v15 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  v17 = v11;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v3;
    _os_log_impl(&dword_21A4E5000, v15, OS_LOG_TYPE_DEFAULT, "accessory wifi info for CarPlay is %@", buf, 0xCu);
  }

  v18 = (void *)v8;
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v17)
      objc_msgSend(v19, "setObject:forKey:", v17, CFSTR("BSSID"));
    if (v5)
      objc_msgSend(v20, "setObject:forKey:", v5, CFSTR("SSID_STR"));
    if (v28)
      objc_msgSend(v20, "setObject:forKey:", v28, CFSTR("CHANNEL"));
    if (v6)
      objc_msgSend(v20, "setObject:forKey:", v6, CFSTR("password"));
    if (v9 >= 3)
    {
      v22 = v17;
      if (gLogObjects && gNumLogObjects >= 2)
      {
        v23 = *(id *)(gLogObjects + 8);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCPlatformPluginWiFiSharing initPlugin].cold.1();
        v23 = MEMORY[0x24BDACB70];
        v24 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v30) = v9;
        _os_log_impl(&dword_21A4E5000, v23, OS_LOG_TYPE_DEFAULT, "Invalid accessory security type %d", buf, 8u);
      }

      v21 = 0;
      v17 = v22;
      v18 = (void *)v8;
    }
    else
    {
      v21 = (uint64_t)*(&off_24DCCCDB0 + (int)v9);
    }
    objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("securityType"));
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v25 = *(id *)(gLogObjects + 8);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCPlatformPluginWiFiSharing initPlugin].cold.1();
      v25 = MEMORY[0x24BDACB70];
      v26 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[ACCPlatformPluginWiFiSharing handleAccessoryWiFiInformationForWirelessCarPlay:].cold.1((uint64_t)v20, v18, v25);

    objc_msgSend(v18, "unsignedIntegerValue");
    CRSaveWiFiCredentialsForAccessoryConnectionIdentifier();

  }
  return 1;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (void)handleAccessoryWiFiInformationForWirelessCarPlay:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = 138412802;
  v6 = a1;
  v7 = 2048;
  v8 = objc_msgSend(a2, "unsignedIntegerValue");
  v9 = 2048;
  v10 = objc_msgSend(a2, "unsignedIntegerValue");
  _os_log_debug_impl(&dword_21A4E5000, a3, OS_LOG_TYPE_DEBUG, "Saving dictionary %@ to carPlay for EA connectionID %lu (0x%lX)", (uint8_t *)&v5, 0x20u);
}

@end

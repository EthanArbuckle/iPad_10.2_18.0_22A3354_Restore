@implementation SONetworkIdentity

- (id)initForRealm:(id)a3 bundleIdentifier:(id)a4 auditToken:(id)a5
{
  id v9;
  id v10;
  id v11;
  SONetworkIdentity *v12;
  id *p_isa;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SONetworkIdentity;
  v12 = -[SONetworkIdentity init](&v15, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_realm, a3);
    objc_storeStrong(p_isa + 4, a4);
    objc_storeStrong(p_isa + 6, a5);
  }

  return p_isa;
}

- (NSString)networkFingerprint
{
  SONetworkIdentity *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_networkFingerprint;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isPerAppVPN
{
  SONetworkIdentity *v2;
  BOOL perAppVPN;

  v2 = self;
  objc_sync_enter(v2);
  perAppVPN = v2->_perAppVPN;
  objc_sync_exit(v2);

  return perAppVPN;
}

- (void)setPerAppVPN:(BOOL)a3
{
  SONetworkIdentity *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_perAppVPN = a3;
  objc_sync_exit(obj);

}

- (void)evaluateVPNPathForHost:(id)a3 port:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  id v9;
  const char *v10;
  nw_endpoint_t host;

  v6 = objc_retainAutorelease(a3);
  v7 = a4;
  v8 = (const char *)objc_msgSend(v6, "UTF8String");
  v9 = objc_retainAutorelease(v7);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");

  host = nw_endpoint_create_host(v8, v10);
  -[SONetworkIdentity evaluateVPNPath:](self, "evaluateVPNPath:", host);

}

- (void)evaluateVPNPath
{
  void *v3;
  void *v4;
  id v5;
  id srv;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SONetworkIdentity realm](self, "realm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("_kerberos._tcp.%@"), v4);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "UTF8String");
  srv = (id)nw_endpoint_create_srv();

  -[SONetworkIdentity evaluateVPNPath:](self, "evaluateVPNPath:", srv);
}

- (void)evaluateVPNPath:(id)a3
{
  id v4;
  NSObject *v5;
  nw_parameters_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *evaluator_for_endpoint;
  void *v15;
  NSObject *v16;
  SONetworkIdentity *v17;
  _OWORD v18[2];

  v4 = a3;
  SO_LOG_SONetworkIdentity();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SONetworkIdentity evaluateVPNPath:].cold.3();

  v6 = nw_parameters_create();
  -[SONetworkIdentity bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SONetworkIdentity bundleIdentifier](self, "bundleIdentifier");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "UTF8String");
    nw_parameters_set_source_application_by_bundle_id();

    memset(v18, 0, sizeof(v18));
    -[SONetworkIdentity auditToken](self, "auditToken");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = (void *)MEMORY[0x24BE043A0];
      -[SONetworkIdentity auditToken](self, "auditToken");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v11) = objc_msgSend(v11, "auditTokenFromData:auditToken:", v12, v18);

      if ((_DWORD)v11)
      {
        SO_LOG_SONetworkIdentity();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[SONetworkIdentity evaluateVPNPath:].cold.2();

        nw_parameters_set_source_application();
      }
    }
  }
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  v15 = (void *)nw_path_evaluator_copy_path();
  SO_LOG_SONetworkIdentity();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[SONetworkIdentity evaluateVPNPath:].cold.1();

  v17 = self;
  objc_sync_enter(v17);
  -[SONetworkIdentity setPerAppVPN:](v17, "setPerAppVPN:", nw_path_is_per_app_vpn());
  objc_sync_exit(v17);

}

- (void)determineNetworkFingerprint
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "start of determineNetworkFingerprint", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (id)getVPNServerSignature:(id)a3
{
  const char *name;
  uint64_t v4;
  __CFString *v5;
  uint64_t vpn_server;
  in_addr v7;
  char *v8;
  NSObject *v9;

  name = nw_interface_get_name((nw_interface_t)a3);
  v4 = nwi_state_copy();
  v5 = &stru_24D3EC758;
  if (v4 && name)
  {
    if (nwi_state_get_ifstate() && (vpn_server = nwi_ifstate_get_vpn_server()) != 0)
    {
      v7.s_addr = *(_DWORD *)(vpn_server + 4);
      v8 = inet_ntoa(v7);
      SO_LOG_SONetworkIdentity();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[SONetworkIdentity getVPNServerSignature:].cold.1();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v8);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = &stru_24D3EC758;
    }
  }
  return v5;
}

- (id)getInterfaceSignature:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  const char *name;
  uint64_t v7;
  id v8;
  void *v9;

  v4 = a3;
  SO_LOG_SONetworkIdentity();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SONetworkIdentity getInterfaceSignature:].cold.3();

  name = nw_interface_get_name(v4);
  v7 = nwi_state_copy();
  if (name && v7)
  {
    if (nwi_state_get_ifstate() && (nwi_ifstate_get_flags() & 3) != 0)
    {
      v8 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      nwi_ifstate_get_signature();
      nwi_ifstate_get_signature();

    }
    nwi_state_release();
  }
  -[SONetworkIdentity getInterfaceFingerprintForDynamicInterface:](self, "getInterfaceFingerprintForDynamicInterface:", name);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)getInterfaceFingerprintForDynamicInterface:(const char *)a3
{
  NSObject *v4;
  const __CFAllocator *v5;
  const __SCDynamicStore *v6;
  const __CFString *v7;
  const __CFString *v8;
  CFStringRef NetworkServiceEntity;
  CFStringRef v10;
  const __CFArray *v11;
  CFDictionaryRef v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(_QWORD *, void *, void *, _BYTE *);
  void *v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[3];

  v39[2] = *MEMORY[0x24BDAC8D0];
  SO_LOG_SONetworkIdentity();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SONetworkIdentity getInterfaceFingerprintForDynamicInterface:].cold.3();

  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v6 = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("com.apple.KerberosExtension"), 0, 0);
  v7 = (const __CFString *)*MEMORY[0x24BDF59B0];
  v8 = (const __CFString *)*MEMORY[0x24BDF5990];
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(v5, (CFStringRef)*MEMORY[0x24BDF59B0], (CFStringRef)*MEMORY[0x24BDF5990], (CFStringRef)*MEMORY[0x24BDF59F0]);
  v10 = SCDynamicStoreKeyCreateNetworkServiceEntity(v5, v7, v8, (CFStringRef)*MEMORY[0x24BDF59F8]);
  v39[0] = NetworkServiceEntity;
  v39[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 2);
  v11 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  if (NetworkServiceEntity)
    CFRelease(NetworkServiceEntity);
  if (v10)
    CFRelease(v10);
  v12 = SCDynamicStoreCopyMultiple(v6, 0, v11);
  if (v6)
    CFRelease(v6);
  v36 = 0;
  v37[0] = &v36;
  v37[1] = 0x3032000000;
  v37[2] = __Block_byref_object_copy__1;
  v37[3] = __Block_byref_object_dispose__1;
  v38 = 0;
  v33 = 0;
  v34[0] = &v33;
  v34[1] = 0x3032000000;
  v34[2] = __Block_byref_object_copy__1;
  v34[3] = __Block_byref_object_dispose__1;
  v35 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a3, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = __64__SONetworkIdentity_getInterfaceFingerprintForDynamicInterface___block_invoke;
  v29 = &unk_24D3EC598;
  v14 = v13;
  v30 = v14;
  v31 = &v36;
  v32 = &v33;
  -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](v12, "enumerateKeysAndObjectsUsingBlock:", &v26);
  v15 = *(_QWORD *)(v37[0] + 40);
  SO_LOG_SONetworkIdentity();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
  if (v15)
  {
    if (v17)
      -[SONetworkIdentity getInterfaceFingerprintForDynamicInterface:].cold.2((uint64_t)v37, (uint64_t)v34, v16);

    v18 = objc_msgSend(*(id *)(v37[0] + 40), "length", v26, v27, v28, v29);
    v19 = *(void **)(v37[0] + 40);
    if (v18 < 0x1D)
    {
      v21 = v19;
    }
    else
    {
      v20 = objc_msgSend(v19, "length");
      objc_msgSend(*(id *)(v37[0] + 40), "substringWithRange:", 23, v20 - 28);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v16 = v21;
    if (*(_QWORD *)(v34[0] + 40))
      v23 = *(const __CFString **)(v34[0] + 40);
    else
      v23 = &stru_24D3EC758;
    -[NSObject stringByAppendingString:](v21, "stringByAppendingString:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dataUsingEncoding:", 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v17)
      -[SONetworkIdentity getInterfaceFingerprintForDynamicInterface:].cold.1();
    v22 = 0;
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v36, 8);

  return v22;
}

void __64__SONetworkIdentity_getInterfaceFingerprintForDynamicInterface___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v8 = a3;
  v9 = (void *)a1[4];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDF5A68]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v9, "isEqualToString:", v10);

  if ((_DWORD)v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDF5AF8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDF5B30]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v12);
    if (!v11)

    *a4 = 1;
  }

}

- (void)setNetworkFingerprint:(id)a3
{
  objc_storeStrong((id *)&self->_networkFingerprint, a3);
}

- (NSString)realm
{
  return self->_realm;
}

- (void)setRealm:(id)a3
{
  objc_storeStrong((id *)&self->_realm, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (OS_nw_path)lastpath
{
  return self->_lastpath;
}

- (void)setLastpath:(id)a3
{
  objc_storeStrong((id *)&self->_lastpath, a3);
}

- (NSData)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_storeStrong((id *)&self->_auditToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_lastpath, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong((id *)&self->_networkFingerprint, 0);
}

- (void)evaluateVPNPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "vpn path: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)evaluateVPNPath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "using audit token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)evaluateVPNPath:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "evaluate vpn path: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)getVPNServerSignature:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "VPN IP address: %{private}s\n", v2);
  OUTLINED_FUNCTION_2();
}

- (void)getInterfaceSignature:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "IPv6 signature", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getInterfaceSignature:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "IPv4 signature", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getInterfaceSignature:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "begin getInterfaceSignature", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getInterfaceFingerprintForDynamicInterface:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_215A1B000, v0, v1, "no matching entry found for %{public}s", v2);
  OUTLINED_FUNCTION_2();
}

- (void)getInterfaceFingerprintForDynamicInterface:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  v5 = 138543618;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_215A1B000, log, OS_LOG_TYPE_DEBUG, "Using key: %{public}@, Router: %@", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)getInterfaceFingerprintForDynamicInterface:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "Dynamic interface signature", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end

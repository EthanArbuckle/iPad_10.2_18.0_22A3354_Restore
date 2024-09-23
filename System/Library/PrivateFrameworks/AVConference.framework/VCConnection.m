@implementation VCConnection

- (void)setUpVTable
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCConnection setUpVTable]"), 0));
}

- (VCConnection)init
{
  VCConnection *v2;
  VCConnection *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCConnection;
  v2 = -[VCConnection init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VCConnection setUpVTable](v2, "setUpVTable");
    v3->_connectionSelectionPriorities = (NSDictionary *)-[VCConnection getConnectionSelectionPriorities](v3, "getConnectionSelectionPriorities");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCConnection;
  -[VCConnection dealloc](&v3, sel_dealloc);
}

- (void)setLinkFlags:(unsigned __int16)a3
{
  uint64_t v4;
  NSObject *v5;
  int linkFlags;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_linkFlags = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      linkFlags = self->_linkFlags;
      v7 = 136315906;
      v8 = v4;
      v9 = 2080;
      v10 = "-[VCConnection setLinkFlags:]";
      v11 = 1024;
      v12 = 84;
      v13 = 1024;
      v14 = linkFlags;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Set link flags='%08x'", (uint8_t *)&v7, 0x22u);
    }
  }
}

- (void)setRemoteLinkFlags:(unsigned __int16)a3
{
  uint64_t v4;
  NSObject *v5;
  int remoteLinkFlags;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_remoteLinkFlags = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      remoteLinkFlags = self->_remoteLinkFlags;
      v7 = 136315906;
      v8 = v4;
      v9 = 2080;
      v10 = "-[VCConnection setRemoteLinkFlags:]";
      v11 = 1024;
      v12 = 89;
      v13 = 1024;
      v14 = remoteLinkFlags;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Set remote link flags='%08x'", (uint8_t *)&v7, 0x22u);
    }
  }
}

- (int64_t)compare:(id)a3 isPrimary:(BOOL)a4 selectionPolicy:(id *)a5
{
  _BOOL8 v6;
  int64_t result;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 1;
  v6 = a4;
  if (!a5->var3
    || (result = -[VCConnection compareE2EPriority:selectionPolicy:](self, "compareE2EPriority:selectionPolicy:", a3, a5)) == 0)
  {
    result = -[VCConnection compareInterfacePriority:isPrimary:preferWired:](self, "compareInterfacePriority:isPrimary:preferWired:", a3, v6, a5->var5);
    if (!result)
    {
      result = -[VCConnection compareConnectionTypePriority:selectionPolicy:](self, "compareConnectionTypePriority:selectionPolicy:", a3, a5);
      if (!result)
      {
        result = -[VCConnection compareIpVersionPriority:selectionPolicy:](self, "compareIpVersionPriority:selectionPolicy:", a3, a5);
        if (!result)
        {
          result = -[VCConnection compareVpnPriority:selectionPolicy:](self, "compareVpnPriority:selectionPolicy:", a3, a5);
          if (!result)
          {
            v10 = (void *)-[VCConnection connectionUUID](self, "connectionUUID");
            v11 = (void *)objc_msgSend(a3, "connectionUUID");
            v12 = objc_msgSend((id)objc_msgSend(v10, "UUIDString"), "compare:", objc_msgSend(v11, "UUIDString"));
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v13 = VRTraceErrorLogLevelToCSTR();
              v14 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v15 = objc_msgSend(v10, "UUIDString");
                v16 = objc_msgSend(v11, "UUIDString");
                v18 = 136316418;
                v17 = "Old";
                v19 = v13;
                v21 = "-[VCConnection compare:isPrimary:selectionPolicy:]";
                v22 = 1024;
                v20 = 2080;
                if (v12 == -1)
                  v17 = "New";
                v23 = 125;
                v24 = 2112;
                v25 = v15;
                v26 = 2112;
                v27 = v16;
                v28 = 2080;
                v29 = v17;
                _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: connections %@, and %@ are identical for primary, choosing %s", (uint8_t *)&v18, 0x3Au);
              }
            }
            if (v12 == -1)
              return 1;
            else
              return -1;
          }
        }
      }
    }
  }
  return result;
}

- (int64_t)compareInterfacePriority:(id)a3 isPrimary:(BOOL)a4 preferWired:(BOOL)a5
{
  _BOOL4 v5;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  int64_t result;
  uint64_t v16;

  v5 = a5;
  if (a4)
    v8 = CFSTR("connectionPrimary");
  else
    v8 = CFSTR("connectionSecondary");
  v9 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_connectionSelectionPriorities, "objectForKeyedSubscript:", CFSTR("interfacePriority")), "objectForKeyedSubscript:", v8);
  if (v5)
  {
    if ((VCConnection_IsLocalOnWired((uint64_t)self) & 1) != 0)
    {
      v10 = CFSTR("interfaceWired");
    }
    else if (VCConnection_IsLocalOnWiFiOrWired((uint64_t)self))
    {
      v10 = CFSTR("interfaceWiFi");
    }
    else
    {
      v10 = CFSTR("interfaceCellular");
    }
    if ((VCConnection_IsRemoteOnWired((uint64_t)self) & 1) != 0)
    {
      v11 = CFSTR("interfaceWired");
    }
    else if (VCConnection_IsRemoteOnWiFiOrWired((uint64_t)self))
    {
      v11 = CFSTR("interfaceWiFi");
    }
    else
    {
      v11 = CFSTR("interfaceCellular");
    }
    if ((VCConnection_IsLocalOnWired((uint64_t)a3) & 1) != 0)
    {
      v12 = CFSTR("interfaceWired");
    }
    else if (VCConnection_IsLocalOnWiFiOrWired((uint64_t)a3))
    {
      v12 = CFSTR("interfaceWiFi");
    }
    else
    {
      v12 = CFSTR("interfaceCellular");
    }
    if ((VCConnection_IsRemoteOnWired((uint64_t)a3) & 1) != 0)
    {
      v13 = CFSTR("interfaceWired");
      goto LABEL_34;
    }
  }
  else
  {
    if (VCConnection_IsLocalOnWiFiOrWired((uint64_t)self))
      v10 = CFSTR("interfaceWiFi");
    else
      v10 = CFSTR("interfaceCellular");
    if (VCConnection_IsRemoteOnWiFiOrWired((uint64_t)self))
      v11 = CFSTR("interfaceWiFi");
    else
      v11 = CFSTR("interfaceCellular");
    if (VCConnection_IsLocalOnWiFiOrWired((uint64_t)a3))
      v12 = CFSTR("interfaceWiFi");
    else
      v12 = CFSTR("interfaceCellular");
  }
  if (VCConnection_IsRemoteOnWiFiOrWired((uint64_t)a3))
    v13 = CFSTR("interfaceWiFi");
  else
    v13 = CFSTR("interfaceCellular");
LABEL_34:
  v14 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v11), "intValue")+ objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v10), "intValue"));
  result = objc_msgSend(v14, "compare:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v13), "intValue")+ objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", v12), "intValue")));
  if (!v5 && !result)
  {
    v16 = objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    if (v16 == objc_msgSend(v9, "objectForKeyedSubscript:", v12))
      return 0;
    else
      return -1;
  }
  return result;
}

- (int64_t)compareConnectionTypePriority:(id)a3 selectionPolicy:(id *)a4
{
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;

  if (a4->var0)
    v6 = CFSTR("preferRelay");
  else
    v6 = CFSTR("preferP2P");
  v7 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_connectionSelectionPriorities, "objectForKeyedSubscript:", CFSTR("connectionTypePriority")), "objectForKeyedSubscript:", v6);
  if (VCConnection_IsRelay((uint64_t)self))
    v8 = CFSTR("connectionTypeRelay");
  else
    v8 = CFSTR("connectionTypeP2P");
  if (VCConnection_IsRelay((uint64_t)a3))
    v9 = CFSTR("connectionTypeRelay");
  else
    v9 = CFSTR("connectionTypeP2P");
  return objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", v8), "compare:", objc_msgSend(v7, "objectForKeyedSubscript:", v9));
}

- (int64_t)compareVpnPriority:(id)a3 selectionPolicy:(id *)a4
{
  if (!a4->var2)
    return 0;
  if ((-[VCConnection isVPN](self, "isVPN") & 1) == 0 && (objc_msgSend(a3, "isVPN") & 1) != 0)
    return 1;
  if (-[VCConnection isVPN](self, "isVPN") && !objc_msgSend(a3, "isVPN"))
    return -1;
  else
    return 0;
}

- (int64_t)compareE2EPriority:(id)a3 selectionPolicy:(id *)a4
{
  int IsEndToEndLink;
  int v7;
  BOOL v8;
  int64_t v9;

  IsEndToEndLink = VCConnection_IsEndToEndLink((uint64_t)self);
  v7 = VCConnection_IsEndToEndLink((uint64_t)a3);
  if (!IsEndToEndLink || (v7 & 1) != 0)
  {
    if (((IsEndToEndLink | v7 ^ 1) & 1) != 0)
      return 0;
    v8 = !a4->var4;
    v9 = 1;
  }
  else
  {
    v8 = !a4->var4;
    v9 = -1;
  }
  if (v8)
    return v9;
  else
    return -v9;
}

- (int64_t)compareIpVersionPriority:(id)a3 selectionPolicy:(id *)a4
{
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;

  if (a4->var1)
    v6 = CFSTR("preferIPv6");
  else
    v6 = CFSTR("preferIPv4");
  v7 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_connectionSelectionPriorities, "objectForKeyedSubscript:", CFSTR("networkTypePriority")), "objectForKeyedSubscript:", v6);
  if (VCConnection_IsIPv6((uint64_t)self))
    v8 = CFSTR("IPv6");
  else
    v8 = CFSTR("IPv4");
  if (VCConnection_IsIPv6((uint64_t)a3))
    v9 = CFSTR("IPv6");
  else
    v9 = CFSTR("IPv4");
  return objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", v8), "compare:", objc_msgSend(v7, "objectForKeyedSubscript:", v9));
}

- (id)getConnectionSelectionPriorities
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v24[0] = CFSTR("interfacePriority");
  v20[0] = CFSTR("interfaceWired");
  v20[1] = CFSTR("interfaceWiFi");
  v21[0] = &unk_1E9EF4C58;
  v21[1] = &unk_1E9EF4C70;
  v20[2] = CFSTR("interfaceCellular");
  v21[2] = &unk_1E9EF4C88;
  v22[0] = CFSTR("connectionPrimary");
  v2 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v22[1] = CFSTR("connectionSecondary");
  v23[0] = v2;
  v18[0] = CFSTR("interfaceWired");
  v18[1] = CFSTR("interfaceWiFi");
  v19[0] = &unk_1E9EF4CA0;
  v19[1] = &unk_1E9EF4C88;
  v18[2] = CFSTR("interfaceCellular");
  v19[2] = &unk_1E9EF4C70;
  v23[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v25[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v24[1] = CFSTR("connectionTypePriority");
  v15[1] = &unk_1E9EF4C88;
  v16[0] = CFSTR("preferP2P");
  v14[0] = CFSTR("connectionTypeP2P");
  v14[1] = CFSTR("connectionTypeRelay");
  v15[0] = &unk_1E9EF4C70;
  v3 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v16[1] = CFSTR("preferRelay");
  v17[0] = v3;
  v12[0] = CFSTR("connectionTypeP2P");
  v12[1] = CFSTR("connectionTypeRelay");
  v13[0] = &unk_1E9EF4C88;
  v13[1] = &unk_1E9EF4C70;
  v17[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v25[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v24[2] = CFSTR("networkTypePriority");
  v9[1] = &unk_1E9EF4C88;
  v10[0] = CFSTR("preferIPv4");
  v8[0] = CFSTR("IPv4");
  v8[1] = CFSTR("IPv6");
  v9[0] = &unk_1E9EF4C70;
  v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v10[1] = CFSTR("preferIPv6");
  v11[0] = v4;
  v6[0] = CFSTR("IPv4");
  v6[1] = CFSTR("IPv6");
  v7[0] = &unk_1E9EF4C88;
  v7[1] = &unk_1E9EF4C70;
  v11[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v25[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
}

@end

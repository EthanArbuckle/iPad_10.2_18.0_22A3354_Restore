@implementation NEHotspotNetwork

- (void)dealloc
{
  __CNNetwork *network;
  objc_super v4;

  if (self)
  {
    network = self->_network;
    if (network)
      CFRelease(network);
    self->_network = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NEHotspotNetwork;
  -[NEHotspotNetwork dealloc](&v4, sel_dealloc);
}

- (id)description
{
  if (self)
    self = (NEHotspotNetwork *)self->_network;
  return (id)(id)CFCopyDescription(self);
}

- (NSString)SSID
{
  return (NSString *)CNNetworkGetSSIDString();
}

- (NSString)BSSID
{
  return (NSString *)CNNetworkGetBSSID();
}

- (double)signalStrength
{
  double result;

  CNNetworkGetSignalStrength();
  return result;
}

- (void)setConfidence:(NEHotspotHelperConfidence)confidence
{
  CNNetworkSetConfidence();
  CNNetworkSetCaptive();
}

- (void)setPassword:(NSString *)password
{
  CNNetworkSetPassword();
}

- (BOOL)isSecure
{
  return CNNetworkIsProtected() != 0;
}

- (BOOL)didAutoJoin
{
  return CNNetworkWasAutoJoined() != 0;
}

- (BOOL)didJustJoin
{
  return CNNetworkWasJustJoined() != 0;
}

- (BOOL)isChosenHelper
{
  return CNNetworkIsChosenPlugin() != 0;
}

- (NEHotspotNetworkSecurityType)securityType
{
  return self->_securityType;
}

- (void)setSecurityType:(int64_t)a3
{
  self->_securityType = a3;
}

+ (void)fetchCurrentWithCompletionHandler:(void *)completionHandler
{
  void (**v4)(void *, _QWORD);
  NSObject *v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = completionHandler;
  if ((NEHelperCopyCurrentNetworkAsync() & 1) == 0)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v7 = a1;
      _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "%@ internal error", buf, 0xCu);
    }

    v4[2](v4, 0);
  }

}

void __54__NEHotspotNetwork_fetchCurrentWithCompletionHandler___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  const __CFDictionary *v10;
  CFTypeID TypeID;
  const void *Value;
  const void *v13;
  void *v14;
  void *v15;
  const void *v16;
  NEHotspotNetwork *v17;
  id v18;
  NEHotspotNetwork *v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[22];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if ((a2 & 1) == 0)
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v24 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v28 = 138412290;
      *(_QWORD *)&v28[4] = v24;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "%@ failed to communicate to helper server for Wi-Fi information request", v28, 0xCu);
    }

  }
  if (a3)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v23 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v28 = 138412546;
      *(_QWORD *)&v28[4] = v23;
      *(_WORD *)&v28[12] = 2048;
      *(_QWORD *)&v28[14] = a3;
      _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "%@ nehelper sent invalid result code [%lld] for Wi-Fi information request", v28, 0x16u);
    }

    goto LABEL_9;
  }
  if (!v7 || (a2 & 1) == 0)
  {
LABEL_9:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_10;
  }
  v10 = (const __CFDictionary *)_CFXPCCreateCFObjectFromXPCObject();
  TypeID = CFDictionaryGetTypeID();
  if (v10 && CFGetTypeID(v10) == TypeID)
  {
    Value = CFDictionaryGetValue(v10, (const void *)*MEMORY[0x1E0CE8B18]);
    v13 = CFDictionaryGetValue(v10, (const void *)*MEMORY[0x1E0CE8B10]);
    v14 = (void *)CFDictionaryGetValue(v10, CFSTR("wifi-security-type"));
    if (Value && v13 && (v15 = v14) != 0)
    {
      v16 = (const void *)CNNetworkCreateWithSSIDAndBSSID();
      v17 = [NEHotspotNetwork alloc];
      v18 = v15;
      if (v17)
      {
        *(_QWORD *)v28 = v17;
        *(_QWORD *)&v28[8] = NEHotspotNetwork;
        v19 = (NEHotspotNetwork *)objc_msgSendSuper2((objc_super *)v28, sel_init);
        v17 = v19;
        if (v19)
        {
          -[NEHotspotNetwork setNetwork:]((uint64_t)v19, v16);
          v20 = objc_msgSend(v18, "integerValue");
          if (v20 >= 4)
            v21 = 4;
          else
            v21 = v20;
          -[NEHotspotNetwork setSecurityType:](v17, "setSecurityType:", v21);
        }
      }

      if (v16)
        CFRelease(v16);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
    else
    {
      ne_log_obj();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v27 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)v28 = 138412290;
        *(_QWORD *)&v28[4] = v27;
        _os_log_error_impl(&dword_19BD16000, v25, OS_LOG_TYPE_ERROR, "%@ received nil data for Wi-Fi information request", v28, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
LABEL_34:
    CFRelease(v10);
    goto LABEL_10;
  }
  ne_log_obj();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v26 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v28 = 138412290;
    *(_QWORD *)&v28[4] = v26;
    _os_log_error_impl(&dword_19BD16000, v22, OS_LOG_TYPE_ERROR, "%@ received unexpected data for Wi-Fi information request", v28, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v10)
    goto LABEL_34;
LABEL_10:

}

- (void)setNetwork:(uint64_t)a1
{
  const void *v4;

  if (cf)
    CFRetain(cf);
  v4 = *(const void **)(a1 + 8);
  if (v4)
    CFRelease(v4);
  *(_QWORD *)(a1 + 8) = cf;
}

- (id)initWithNetwork:(void *)a1
{
  id v3;
  id v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)NEHotspotNetwork;
  v3 = objc_msgSendSuper2(&v6, sel_init);
  v4 = v3;
  if (v3)
    -[NEHotspotNetwork setNetwork:]((uint64_t)v3, a2);
  return v4;
}

@end

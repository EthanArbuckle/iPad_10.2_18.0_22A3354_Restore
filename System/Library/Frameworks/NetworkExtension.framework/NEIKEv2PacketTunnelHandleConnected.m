@implementation NEIKEv2PacketTunnelHandleConnected

void __NEIKEv2PacketTunnelHandleConnected_block_invoke(uint64_t a1)
{
  -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (const char *)7);
}

void __NEIKEv2PacketTunnelHandleConnected_block_invoke_2(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  uint64_t v5;
  NSObject *Property;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  Property = *(NSObject **)(*(_QWORD *)(v5 + 8) + 40);
  if (v4)
  {
    if (Property)
    {
      Property = objc_getProperty(Property, v3, 264, 1);
      v5 = *(_QWORD *)(a1 + 32);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __NEIKEv2PacketTunnelHandleConnected_block_invoke_3;
    block[3] = &unk_1E3CC1480;
    block[4] = v5;
    dispatch_async(Property, block);
  }
  else
  {
    -[NSObject setReasserting:](Property, "setReasserting:", 0);
    -[NEIKEv2PacketTunnelProvider invokeStartTunnelCompletionHandler:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), 0);
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = *(_QWORD *)(v9 + 40);
      if (v10)
        v11 = objc_getProperty(*(id *)(v9 + 40), v8, 208, 1);
      else
        v11 = 0;
      objc_msgSend(v11, "scopedInterface");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      if (v13)
      {
        if (v14)
          v14 = objc_getProperty(v14, v12, 208, 1);
        v15 = v14;
        objc_msgSend(v15, "scopedInterface");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v14)
          v14 = objc_getProperty(v14, v12, 208, 1);
        v15 = v14;
        objc_msgSend(v15, "interface");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v17 = v16;
      objc_msgSend(v16, "interfaceName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v10;
      v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_19BD16000, v7, OS_LOG_TYPE_DEFAULT, "%@: Tunnel Status: UP - (scoped to %@)", buf, 0x16u);

    }
  }

}

void __NEIKEv2PacketTunnelHandleConnected_block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_error_impl(&dword_19BD16000, v2, OS_LOG_TYPE_ERROR, "%@: Stopping tunnel due to set tunnel network settings failed", buf, 0xCu);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 8) + 40);
  if (v4)
  {
    *(_BYTE *)(v4 + 77) = 1;
    v3 = *(_QWORD *)(a1 + 32);
    v5 = *(_BYTE **)(*(_QWORD *)(v3 + 8) + 40);
  }
  else
  {
    v5 = 0;
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __NEIKEv2PacketTunnelHandleConnected_block_invoke_300;
  v7[3] = &unk_1E3CC1480;
  v7[4] = v3;
  -[NEIKEv2PacketTunnelProvider stopIKEv2TunnelWithReason:completionHandler:](v5, 9, v7);
}

void __NEIKEv2PacketTunnelHandleConnected_block_invoke_300(uint64_t a1)
{
  -[NEIKEv2PacketTunnelProvider invokeCancelTunnel:](*(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (const char *)0x1F);
}

@end

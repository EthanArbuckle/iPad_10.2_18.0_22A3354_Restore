@implementation NEAgentPacketTunnelExtension

- (void)handleExtensionStartedWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3CC2068;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchVirtualInterfaceTypeWithCompletionHandler:", v7);

}

- (void)extension:(id)a3 didSetTunnelConfiguration:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NEVirtualInterfaceParameters *v13;
  int64_t interfaceType;
  void *v15;
  NEVirtualInterfaceParameters *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  objc_super v28;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self && self->_interfaceType == 3 && !self->_isUserEthernetInterfaceCreated)
  {
    v11 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "ethernetAddress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      createEthernetAddressFromString(v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = [NEVirtualInterfaceParameters alloc];
      interfaceType = self->_interfaceType;
      objc_msgSend(v11, "MTU");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[NEVirtualInterfaceParameters initWithType:maxPendingPackets:ethernetAddress:mtu:](v13, "initWithType:maxPendingPackets:ethernetAddress:mtu:", interfaceType, 64, v21, v15);

      -[NEAgentExtension managerObjectFactory](self, "managerObjectFactory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __86__NEAgentPacketTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke;
      v26[3] = &unk_1E3CC4748;
      v26[4] = self;
      v19 = v10;
      v27 = v19;
      objc_msgSend(v17, "managerObjectWithErrorHandler:", v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v22[0] = v18;
      v22[1] = 3221225472;
      v22[2] = __86__NEAgentPacketTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke_9;
      v22[3] = &unk_1E3CC2090;
      v22[4] = self;
      v25 = v19;
      v23 = v8;
      v24 = v11;
      objc_msgSend(v20, "createVirtualInterfaceWithParameters:completionHandler:", v16, v22);

    }
    else
    {
      v28.receiver = self;
      v28.super_class = (Class)NEAgentPacketTunnelExtension;
      -[NEAgentTunnelExtension extension:didSetTunnelConfiguration:completionHandler:](&v28, sel_extension_didSetTunnelConfiguration_completionHandler_, v8, v11, v10);
    }

  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)NEAgentPacketTunnelExtension;
    -[NEAgentTunnelExtension extension:didSetTunnelConfiguration:completionHandler:](&v29, sel_extension_didSetTunnelConfiguration_completionHandler_, v8, v9, v10);
  }

}

- (void)setAppUUIDMap:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NEAgentExtension sessionContext](self, "sessionContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppUUIDMap:", v4);

}

void __86__NEAgentPacketTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "%@: Got an error on the XPC connection while waiting for a virtual interface: %@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEAgentErrorDomain"), 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __86__NEAgentPacketTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke_9(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(a1[4], "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__NEAgentPacketTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke_2;
  block[3] = &unk_1E3CC30F8;
  v5 = a1[4];
  v8 = v3;
  v9 = v5;
  v12 = a1[7];
  v10 = a1[5];
  v11 = a1[6];
  v6 = v3;
  dispatch_async(v4, block);

}

void __86__NEAgentPacketTunnelExtension_extension_didSetTunnelConfiguration_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
    {
      *(_BYTE *)(v2 + 128) = 1;
      v3 = *(void **)(a1 + 40);
    }
    else
    {
      v3 = 0;
    }
    objc_msgSend(v3, "sessionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setupVirtualInterface:", *(_QWORD *)(a1 + 32));

    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v11.receiver = *(id *)(a1 + 40);
    v11.super_class = (Class)NEAgentPacketTunnelExtension;
    objc_msgSendSuper2(&v11, sel_extension_didSetTunnelConfiguration_completionHandler_, v5, v6, v7);
  }
  else
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "%@: Failed to create a user ethernet virtual interface", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEAgentErrorDomain"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
}

void __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NEVirtualInterfaceParameters *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v19 = v12;
    v20 = 2048;
    v21 = a2;
    _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "%@: Fetched virtual interface type %ld", buf, 0x16u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    *(_QWORD *)(v5 + 136) = a2;
  if (a2 == 3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "managerObjectFactory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke_1;
    v16[3] = &unk_1E3CC4748;
    v8 = *(void **)(a1 + 40);
    v16[4] = *(_QWORD *)(a1 + 32);
    v17 = v8;
    objc_msgSend(v6, "managerObjectWithErrorHandler:", v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[NEVirtualInterfaceParameters initWithType:maxPendingPackets:ethernetAddress:mtu:]([NEVirtualInterfaceParameters alloc], "initWithType:maxPendingPackets:ethernetAddress:mtu:", a2, 64, 0, 0);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E3CC2040;
    v11 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v15 = a2;
    v14 = v11;
    objc_msgSend(v9, "createVirtualInterfaceWithParameters:completionHandler:", v10, v13);

  }
}

void __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke_1(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "%@: Got an error on the XPC connection while waiting for a virtual interface: %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E3CC2018;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v8[1] = 3221225472;
  v12 = *(_QWORD *)(a1 + 48);
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, v8);

}

uint64_t __76__NEAgentPacketTunnelExtension_handleExtensionStartedWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "sessionContext");
    v2 = objc_claimAutoreleasedReturnValue();
    -[NSObject setupVirtualInterface:](v2, "setupVirtualInterface:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    ne_log_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 56);
      v6 = 138412546;
      v7 = v4;
      v8 = 2048;
      v9 = v5;
      _os_log_error_impl(&dword_19BD16000, v2, OS_LOG_TYPE_ERROR, "%@: Failed to obtain a virtual interface of type %ld, aborting", (uint8_t *)&v6, 0x16u);
    }
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

@end

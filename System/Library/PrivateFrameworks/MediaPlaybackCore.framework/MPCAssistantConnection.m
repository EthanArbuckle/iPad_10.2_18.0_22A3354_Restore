@implementation MPCAssistantConnection

- (void)connectToEndpointObject:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v13 = *MEMORY[0x24BE64FC0];
  v14[0] = CFSTR("MPCAssistantConnection");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__MPCAssistantConnection_connectToEndpointObject_completion___block_invoke;
  v10[3] = &unk_24CABA438;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v9, "connectToExternalDeviceWithOptions:userInfo:completion:", 0, v7, v10);

}

- (void)connectToEndpoint:(void *)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__MPCAssistantConnection_connectToEndpoint_completion___block_invoke;
  v8[3] = &unk_24CAB76B0;
  v9 = v6;
  v7 = v6;
  -[MPCAssistantConnection connectToEndpointObject:completion:](self, "connectToEndpointObject:completion:", a3, v8);

}

uint64_t __55__MPCAssistantConnection_connectToEndpoint_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __61__MPCAssistantConnection_connectToEndpointObject_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v6;
      v14 = 2114;
      v15 = v3;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_ERROR, "Connection failed %{public}@: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEBUG, "Successfully connected to external device.", (uint8_t *)&v12, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "origin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "externalDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, _QWORD))(v8 + 16))(v8, v9, v7, 0);
    }
    else
    {
      v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = 138543362;
        v13 = v11;
        _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_ERROR, "No origin for %{public}@", (uint8_t *)&v12, 0xCu);
      }

      MPCAssistantCreateSendCommandError(6u);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(_QWORD, _QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, v9);
    }

  }
}

@end

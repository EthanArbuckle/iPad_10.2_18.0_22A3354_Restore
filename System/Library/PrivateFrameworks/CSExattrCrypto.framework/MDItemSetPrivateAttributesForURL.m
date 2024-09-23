@implementation MDItemSetPrivateAttributesForURL

void ___MDItemSetPrivateAttributesForURL_block_invoke()
{
  const __CFUUID *v0;
  uint64_t v1;
  void *v2;
  CFUUIDBytes v3;

  v0 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0xFEu, 0x65u, 0x61u, 0x5Bu, 0xFu, 0xF3u, 0x4Eu, 0x3Du, 0xBBu, 0x10u, 0xA7u, 0xACu, 0x81u, 0x62u, 0x22u, 0x6Eu);
  v3 = CFUUIDGetUUIDBytes(v0);
  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", &v3);
  v2 = (void *)_MDItemSetPrivateAttributesForURL_sMDPrivateMDAttributesXattrNSUUID;
  _MDItemSetPrivateAttributesForURL_sMDPrivateMDAttributesXattrNSUUID = v1;

}

void ___MDItemSetPrivateAttributesForURL_block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;

  v10 = a2;
  v11 = a3;
  v12 = a6;
  copyConnection();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = ___MDItemSetPrivateAttributesForURL_block_invoke_3;
  v29[3] = &unk_2508E1020;
  v15 = v12;
  v31 = v15;
  v16 = v13;
  v30 = v16;
  objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v29);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = ___MDItemSetPrivateAttributesForURL_block_invoke_4;
    v26[3] = &unk_2508E1048;
    v28 = v15;
    v27 = v16;
    objc_msgSend(v17, "computeUpdatedCryptoData:newParams:isPrivateMDAttributes:doMergeArrayValues:replyBlock:", v10, v11, a4, a5, v26);

  }
  else
  {
    v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v18)
      ___MDItemSetPrivateAttributesForURL_block_invoke_2_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v15 + 2))(v15, 0, 0, 0);
    releaseConnection(v16);
  }

}

void ___MDItemSetPrivateAttributesForURL_block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ___MDItemSetPrivateAttributesForURL_block_invoke_3_cold_1((uint64_t)v3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    releaseConnection(*(void **)(a1 + 32));
  }

}

void ___MDItemSetPrivateAttributesForURL_block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  releaseConnection(*(void **)(a1 + 32));
}

void ___MDItemSetPrivateAttributesForURL_block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_237593000, MEMORY[0x24BDACB70], a3, "Failed to connect to remote service", a5, a6, a7, a8, 0);
}

void ___MDItemSetPrivateAttributesForURL_block_invoke_3_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_237593000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error from remote service: %@", (uint8_t *)&v1, 0xCu);
}

@end

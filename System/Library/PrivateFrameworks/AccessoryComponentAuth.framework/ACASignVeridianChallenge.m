@implementation ACASignVeridianChallenge

void __ACASignVeridianChallenge_block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  if (gLogObjects)
    v9 = gNumLogObjects < 4;
  else
    v9 = 1;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v11 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  else
  {
    v11 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412802;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 1024;
    v17 = a4;
    _os_log_impl(&dword_227BD1000, v11, OS_LOG_TYPE_DEFAULT, "received response. signature=%@, deviceNonce=%@, authError=%d", (uint8_t *)&v12, 0x1Cu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

@implementation ACASignTouchControllerChallenge

void __ACASignTouchControllerChallenge_block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, int a6)
{
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  if (gLogObjects)
    v11 = gNumLogObjects < 4;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v10;
    v16 = 1024;
    v17 = a6;
    _os_log_impl(&dword_227BD1000, v13, OS_LOG_TYPE_DEFAULT, "received response. response=%@, authError=%d", (uint8_t *)&v14, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

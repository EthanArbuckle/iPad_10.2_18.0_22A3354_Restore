@implementation ACAVerifyBatteryMatch

uint64_t __ACAVerifyBatteryMatch_block_invoke(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v4 = gNumLogObjects < 4;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACASignVeridianChallenge_cold_1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl(&dword_227BD1000, v6, OS_LOG_TYPE_DEFAULT, "received response. authError=%d", (uint8_t *)v8, 8u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

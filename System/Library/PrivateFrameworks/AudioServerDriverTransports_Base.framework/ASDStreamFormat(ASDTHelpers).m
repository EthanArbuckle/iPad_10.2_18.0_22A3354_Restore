@implementation ASDStreamFormat(ASDTHelpers)

- (id)asdtEquivalentNativeFloatPacked
{
  _OWORD v2[2];
  uint64_t v3;

  v3 = 0;
  memset(v2, 0, sizeof(v2));
  objc_msgSend(a1, "audioStreamBasicDescription", 0);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[ASDStreamFormat(ASDTHelpers) asdtEquivalentNativeFloatPacked].cold.1((int *)v2 + 2);
  return 0;
}

- (void)asdtEquivalentNativeFloatPacked
{
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v2 = HIBYTE(*a1);
  if ((*a1 - 0x20000000) >> 24 >= 0x5F)
    v2 = 32;
  v3 = BYTE2(v1);
  if (BYTE2(v1) - 32 >= 0x5F)
    v3 = 32;
  v4 = BYTE1(v1);
  if (BYTE1(v1) - 32 >= 0x5F)
    v4 = 32;
  v5 = *a1;
  v6[0] = 67109888;
  v6[1] = v2;
  v7 = 1024;
  v8 = v3;
  v9 = 1024;
  v10 = v4;
  if ((v5 - 32) >= 0x5F)
    v5 = 32;
  v11 = 1024;
  v12 = v5;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Cannot convert format with ID: %c%c%c%c", (uint8_t *)v6, 0x1Au);
}

@end

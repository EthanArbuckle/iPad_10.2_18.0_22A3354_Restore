@implementation DASessionKeepAlive

uint64_t __DASessionKeepAlive_block_invoke(uint64_t a1)
{
  uint64_t result;
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2127E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "diskarbitrationd relaunched", v3, 2u);
  }
  result = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(result + 36))
    return _DASessionRecreate(result);
  return result;
}

@end

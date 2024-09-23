@implementation DASessionSetDispatchQueue

void __DASessionSetDispatchQueue_block_invoke(uint64_t a1)
{
  mach_port_mod_refs(*MEMORY[0x24BDAEC58], *(_DWORD *)(a1 + 40), 1u, -1);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __DASessionSetDispatchQueue_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  mach_port_name_t v8;
  uint8_t v9[16];
  _BYTE msg[32];

  memset(msg, 0, sizeof(msg));
  v2 = mach_msg((mach_msg_header_t *)msg, 258, 0, 0x20u, *(_DWORD *)(a1 + 40), 0, 0);
  if (*(_DWORD *)&msg[20] == 70)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2127E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "diskarbitrationd exited.", v9, 2u);
    }
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 24);
    if (v6)
    {
      free(v6);
      v5 = *(_QWORD *)(a1 + 32);
    }
    *(_QWORD *)(v5 + 24) = 0;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_DWORD *)(v7 + 36);
    if (v8)
    {
      mach_port_deallocate(*MEMORY[0x24BDAEC58], v8);
      v7 = *(_QWORD *)(a1 + 32);
    }
    *(_DWORD *)(v7 + 36) = 0;
  }
  else
  {
    _DASessionCallback(v2, v3, v4, *(int **)(a1 + 32));
  }
}

@end

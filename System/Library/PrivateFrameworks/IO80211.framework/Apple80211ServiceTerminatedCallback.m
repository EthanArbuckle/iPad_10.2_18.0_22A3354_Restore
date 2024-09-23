@implementation Apple80211ServiceTerminatedCallback

void ___Apple80211ServiceTerminatedCallback_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  void (*v6)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD);
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1816);
    v3 = *(_DWORD *)(a1 + 40);
    v4 = *(_DWORD *)(a1 + 44);
    v10 = 136315906;
    v11 = "_Apple80211ServiceTerminatedCallback_block_invoke";
    v12 = 1024;
    v13 = v3;
    v14 = 2048;
    v15 = v2;
    v16 = 1024;
    v17 = v4;
    _os_log_impl(&dword_20647D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: [%u] ioucQueue[%p], service:%u, serializing, halting ...\n", (uint8_t *)&v10, 0x22u);
  }
  _Apple80211IOUCHalt(*(_QWORD *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))(v5 + 1936);
  if (v6)
    v6(0, v5, 0, 0, *(_QWORD *)(v5 + 1944));
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1816);
    v8 = *(_DWORD *)(a1 + 40);
    v9 = *(_DWORD *)(a1 + 44);
    v10 = 136315906;
    v11 = "_Apple80211ServiceTerminatedCallback_block_invoke";
    v12 = 1024;
    v13 = v8;
    v14 = 2048;
    v15 = v7;
    v16 = 1024;
    v17 = v9;
    _os_log_impl(&dword_20647D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: [%u] ioucQueue[%p], service:%u, serializing, ... halted\n", (uint8_t *)&v10, 0x22u);
  }
}

@end

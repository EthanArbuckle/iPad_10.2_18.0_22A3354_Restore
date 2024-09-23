@implementation ZN15MIDIDestination14SendPacketsNowEPvPKN4MIDI9EventListE

_OWORD *___ZN15MIDIDestination14SendPacketsNowEPvPKN4MIDI9EventListE_block_invoke(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  const void *v10;
  unsigned int v11;
  unsigned int v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  _DWORD *v18;
  _OWORD *result;
  __int128 v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  gMIDIDeviceTableLog();
  v7 = gMIDIDeviceTableLog(void)::dtable;
  if (os_log_type_enabled((os_log_t)gMIDIDeviceTableLog(void)::dtable, OS_LOG_TYPE_DEBUG))
  {
    v8 = *((_DWORD *)a3 + 2);
    v9 = *(_QWORD *)(a1 + 40);
    v24 = 136315906;
    v25 = "DeviceTable.cpp";
    v26 = 1024;
    v27 = 1129;
    v28 = 1024;
    v29 = v8;
    v30 = 2048;
    v31 = v9;
    _os_log_impl(&dword_1D4E88000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d      !!! deferring %u word(s) from port %p", (uint8_t *)&v24, 0x22u);
  }
  v10 = (char *)a3 + 12;
  v11 = *((_DWORD *)a3 + 3);
  v12 = v11 >> 28;
  if (v11 >> 28)
    v13 = v12 == 15;
  else
    v13 = 1;
  if (v13)
    std::terminate();
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *a3;
  v16 = *((unsigned int *)a3 + 2);
  v17 = malloc_type_malloc(4 * v16 + 20, 0x53A9EFB0uLL);
  v18 = v17;
  *v17 = a2;
  v17[1] = 1;
  *((_QWORD *)v17 + 1) = v15;
  v17[4] = v16;
  if ((_DWORD)v16)
    memmove(v17 + 5, v10, 4 * v16);
  result = operator new(0x28uLL);
  *(_QWORD *)&v20 = v18;
  *((_QWORD *)&v20 + 1) = MIDI::packet_list_deleter;
  v21 = HIBYTE(v11) & 0xF;
  if (v12 == 15)
    v21 = 255;
  v22 = v6 + 24 * v21;
  result[1] = v20;
  *((_QWORD *)result + 4) = v14;
  *((_QWORD *)result + 1) = v22 + 480;
  v23 = *(_QWORD *)(v22 + 480);
  *(_QWORD *)result = v23;
  *(_QWORD *)(v23 + 8) = result;
  *(_QWORD *)(v22 + 480) = result;
  ++*(_QWORD *)(v22 + 496);
  return result;
}

@end

@implementation TPCellularConditionChangeCallback

uint64_t __TPCellularConditionChangeCallback_block_invoke()
{
  uint64_t result;
  uint64_t v1;
  unsigned int *v2;
  int LocalInterfaceListWithOptions;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int16 CellularMTU;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  unsigned int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  result = CheckInHandleDebug();
  if (result)
  {
    v1 = result;
    v2 = (unsigned int *)(result + 34472);
    LocalInterfaceListWithOptions = GetLocalInterfaceListWithOptions();
    v4 = LocalInterfaceListWithOptions;
    if (LocalInterfaceListWithOptions >= 1)
    {
      v5 = LocalInterfaceListWithOptions;
      v6 = 4;
      do
      {
        v4 = (__PAIR64__(v4, strcmp((const char *)v6, "lo0")) - 1) >> 32;
        v6 += 40;
        --v5;
      }
      while (v5);
    }
    FreeLocalInterfaceList();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *((_QWORD *)v2 + 3);
        v10 = *((_QWORD *)v2 + 4);
        *(_DWORD *)buf = 136316418;
        v13 = v7;
        v14 = 2080;
        v15 = "TPCellularConditionChangeCallback_block_invoke";
        v16 = 1024;
        v17 = 411;
        v18 = 2048;
        v19 = v9;
        v20 = 2048;
        v21 = v10;
        v22 = 1024;
        v23 = v4;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "SIP [%s] %s:%d TPCellularConditionChangeCallback... %p, %p, iNumValidInterfaces = %d", buf, 0x36u);
      }
    }
    if (*((_QWORD *)v2 + 3))
    {
      if (*((_QWORD *)v2 + 4))
      {
        CellularMTU = GetCellularMTU(v1, 1);
        (*((void (**)(_QWORD, _QWORD, _QWORD))v2 + 3))(*((_QWORD *)v2 + 4), *v2, CellularMTU);
      }
    }
    return CheckOutHandleDebug();
  }
  return result;
}

@end

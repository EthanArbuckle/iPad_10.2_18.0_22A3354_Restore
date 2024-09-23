@implementation APTransportTrafficRegistrarGetAWDLChannelSequence

uint64_t __APTransportTrafficRegistrarGetAWDLChannelSequence_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t result;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  int v13;

  v2 = a1[6];
  v3 = (_BYTE *)a1[7];
  v4 = a1[8];
  result = APSIsVirtualMachine();
  if ((_DWORD)result)
  {
    if (gLogCategory_APTransportTrafficRegistrar <= 50)
    {
      if (gLogCategory_APTransportTrafficRegistrar != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
        result = LogPrintF();
    }
    goto LABEL_20;
  }
  v6 = (void *)objc_msgSend(MEMORY[0x1E0DD99F8], "currentState");
  if (!v6 || (v7 = (void *)objc_msgSend(v6, "channelSequence")) == 0)
  {
    result = APSLogErrorAt();
LABEL_20:
    v13 = -6762;
    goto LABEL_15;
  }
  v8 = v7;
  if ((unint64_t)objc_msgSend(v7, "count") >= 0x11)
  {
    LOBYTE(result) = 16;
    *v3 = 16;
    goto LABEL_7;
  }
  result = objc_msgSend(v8, "count");
  *v3 = result;
  if ((_BYTE)result)
  {
LABEL_7:
    v9 = 0;
    v10 = result;
    do
    {
      v11 = objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", v9), "bandwidth");
      if (v11 > 4)
        v12 = 0;
      else
        v12 = dword_1C94325C8[v11];
      if (objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", v9), "extensionChannelAbove"))
        v12 |= 0x200u;
      result = objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", v9), "channelNumber");
      *(_BYTE *)(v2 + v9) = result;
      *(_DWORD *)(v4 + 4 * v9++) = v12;
    }
    while (v10 != v9);
  }
  v13 = 0;
LABEL_15:
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = v13;
  return result;
}

@end

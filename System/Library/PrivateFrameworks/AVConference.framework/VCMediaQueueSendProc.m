@implementation VCMediaQueueSendProc

uint64_t __VCMediaQueueSendProc_block_invoke(_QWORD *a1, void *element, int a3, int a4, int a5)
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v9;
  unint64_t v11;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a1[6];
  v6 = a1[8];
  if (v5 + 25736 > a1[7] || v6 > v5)
    goto LABEL_28;
  *(_DWORD *)(v5 + 428) += a3;
  v9 = a1[6];
  if (v9 + 25736 > a1[7] || v6 > v9)
    goto LABEL_28;
  *(_DWORD *)(v9 + 424) += a4 + a3;
  v11 = a1[6];
  if (v11 + 25736 > a1[7] || v6 > v11)
    goto LABEL_28;
  *(_DWORD *)(v11 + 432) += a5;
  if (!element)
    return 4294954516;
  if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    v14 = 4294954516;
  }
  else
  {
    v15 = a1[6];
    if (v15 + 25736 > a1[7] || v6 > v15)
      goto LABEL_28;
    v14 = CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(v15 + 616), element);
    if (!(_DWORD)v14)
      return v14;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v22 = 136315906;
      v23 = v16;
      v24 = 2080;
      v25 = "VCMediaQueueSendProc_block_invoke";
      v26 = 1024;
      v27 = 545;
      v28 = 1024;
      v29 = v14;
      _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VCMediaQueue [%s] %s:%d Unable to enqueue onto the main queue. Dropping the packet. status=%d", (uint8_t *)&v22, 0x22u);
    }
  }
  v18 = a1[6];
  if (v18 + 25736 > a1[7] || a1[8] > v18)
LABEL_28:
    __break(0x5519u);
  ++*(_DWORD *)(v18 + 492);
  **(_QWORD **)(*(_QWORD *)(a1[5] + 8) + 24) = element;
  v19 = *(_QWORD *)(a1[5] + 8);
  v20 = **(_QWORD **)(v19 + 24);
  do
  {
    *(_QWORD *)(v19 + 24) = v20 + 304;
    v19 = *(_QWORD *)(a1[5] + 8);
    v20 = **(_QWORD **)(v19 + 24);
  }
  while (v20);
  return v14;
}

@end

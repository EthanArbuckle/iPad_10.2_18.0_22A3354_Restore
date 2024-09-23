@implementation CFURLCreateBookmarkData

void ___CFURLCreateBookmarkData_block_invoke(uint64_t a1)
{
  NSObject *v2;
  CFDataRef v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;

  v2 = bmarkLog;
  if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_DEBUG))
    ___CFURLCreateBookmarkData_block_invoke_cold_2((_QWORD *)a1, v2);
  v3 = __CFURLCreateBookmarkData(*(const __CFAllocator **)(a1 + 72), *(const __CFURL **)(a1 + 40), *(_QWORD *)(a1 + 48), *(const __CFArray **)(a1 + 56), *(const __CFURL **)(a1 + 64), *(__CFError ***)(a1 + 80));
  v5 = *(_QWORD *)(a1 + 32);
  v4 = a1 + 32;
  *(_QWORD *)(*(_QWORD *)(v5 + 8) + 24) = v3;
  v6 = bmarkLog;
  if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_DEBUG))
    ___CFURLCreateBookmarkData_block_invoke_cold_1(v4, v6);
}

void ___CFURLCreateBookmarkData_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 24);
  v3 = 134218242;
  v4 = v2;
  v5 = 2112;
  v6 = v2;
  _os_log_debug_impl(&dword_1817A6000, a2, OS_LOG_TYPE_DEBUG, "result=<%p %@>", (uint8_t *)&v3, 0x16u);
}

void ___CFURLCreateBookmarkData_block_invoke_cold_2(_QWORD *a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = a1[5];
  v3 = a1[6];
  v4 = a1[7];
  v5 = a1[8];
  v6 = 136316418;
  v7 = "_CFURLCreateBookmarkData_block_invoke";
  v8 = 2048;
  v9 = v2;
  v10 = 2112;
  v11 = v2;
  v12 = 2048;
  v13 = v3;
  v14 = 2112;
  v15 = v4;
  v16 = 2112;
  v17 = v5;
  _os_log_debug_impl(&dword_1817A6000, a2, OS_LOG_TYPE_DEBUG, "%s: <%p: %@> options=%#lx propertiesToInclude=%@ relativeToURL=%@", (uint8_t *)&v6, 0x3Eu);
}

@end

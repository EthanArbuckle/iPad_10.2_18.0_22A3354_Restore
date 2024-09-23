@implementation LSPluginFindWithPlatformInfo

uint64_t ___LSPluginFindWithPlatformInfo_block_invoke(uint64_t result, unsigned int a2, int *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v8;
  int v9;
  int v10;
  BOOL v11;
  char v12;

  if (a3[1])
  {
    v8 = result;
    v9 = *(_DWORD *)(result + 64);
    if ((v9 + 1) < 2 || a3[5] == v9)
    {
      result = _LSContainerGet();
      if (result)
      {
        v12 = 0;
        v10 = _LSContainerCheckState(*(void **)(v8 + 32), a3[1], result, &v12, 0);
        result = _LSGetNSErrorFromOSStatusImpl(v10, 0, (uint64_t)"_LSPluginFindWithPlatformInfo_block_invoke", 593);
        if ((_DWORD)result)
          v11 = v12 == 1;
        else
          v11 = 0;
        if (v11)
        {
          result = _LSAliasMatchesPath_NoIO(*(void **)(v8 + 32), *a3, *(void **)(v8 + 40), 0);
          if ((_DWORD)result)
          {
            if (!*(_BYTE *)(v8 + 68)
              || (result = _LSPluginIsValid(*(void **)(v8 + 32), a2, (uint64_t)a3, 0, 0, 0), (_DWORD)result))
            {
              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 48) + 8) + 24) = a2;
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v8 + 56) + 8) + 24) = a3;
              *a5 = 1;
            }
          }
        }
      }
    }
  }
  return result;
}

void ___LSPluginFindWithPlatformInfo_block_invoke_2(uint64_t a1, uint64_t a2, unsigned int a3, _BYTE *a4)
{
  uint64_t v7;
  _DWORD *v8;
  int v9;
  unsigned int *v10;
  uint64_t v11;
  int v12;
  int v14;
  int v15;
  void *v16;
  uint64_t v17;
  _BOOL4 v18;
  unsigned int v19;
  int v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  id obj;
  char v25;

  v7 = _LSGetPlugin(*(_QWORD *)(a1 + 32), a3);
  if (!v7)
  {
    _LSDefaultLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      ___LSPluginFindWithPlatformInfo_block_invoke_2_cold_1();
    goto LABEL_32;
  }
  v8 = (_DWORD *)v7;
  v9 = *(_DWORD *)(a1 + 400);
  if ((v9 + 1) >= 2 && *(_DWORD *)(v7 + 20) != v9)
    return;
  v25 = 0;
  v10 = (unsigned int *)(v7 + 4);
  v11 = _LSContainerGet();
  if (!v11)
  {
    _LSDefaultLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      ___LSPluginFindWithPlatformInfo_block_invoke_2_cold_2();
LABEL_32:

    return;
  }
  v12 = _LSContainerCheckState(*(void **)(a1 + 32), *v10, v11, &v25, 0);
  if (_LSGetNSErrorFromOSStatusImpl(v12, 0, (uint64_t)"_LSPluginFindWithPlatformInfo_block_invoke_2", 623)
    && v25 == 1)
  {
    v14 = *(_DWORD *)(a1 + 404);
    if (!v14 || v14 == v8[3] || v14 == v8[43] || v14 == v8[44])
    {
      v15 = *(_DWORD *)(a1 + 408);
      if (!v15 || v15 == v8[55])
      {
        if (!*(_BYTE *)(a1 + 412)
          || (v16 = *(void **)(a1 + 32),
              v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8),
              obj = *(id *)(v17 + 40),
              v18 = _LSPluginCheckExtensionPoint(v16, a3, (uint64_t)v8, &obj),
              objc_storeStrong((id *)(v17 + 40), obj),
              v18))
        {
          if (!*(_BYTE *)(a1 + 413)
            || _LSPluginIsValid(*(void **)(a1 + 32), a3, (uint64_t)v8, 0, 0, 0))
          {
            v19 = v8[42];
            v20 = (v19 >> 2) & 1;
            v21 = *(unsigned __int8 *)(a1 + 414);
            if (*(_BYTE *)(a1 + 414) || (v19 & 4) == 0)
            {
              v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
              if (!*(_DWORD *)(v22 + 24))
              {
                *(_DWORD *)(v22 + 24) = a3;
                *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;
              }
              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a3;
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v8;
            }
            if (v20 == v21)
            {
              *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
              *a4 = 1;
            }
          }
        }
      }
    }
  }
}

void ___LSPluginFindWithPlatformInfo_block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  OUTLINED_FUNCTION_4_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_8(&dword_182882000, v0, v1, "LaunchServices: Failed to find pluginData for plugin %s <unitID:%d>", v2, v3);
  OUTLINED_FUNCTION_1();
}

void ___LSPluginFindWithPlatformInfo_block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  OUTLINED_FUNCTION_4_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_0_8(&dword_182882000, v0, v1, "LaunchServices: Failed to find containerData for plugin %s <unitID:%d>", v2, v3);
  OUTLINED_FUNCTION_1();
}

@end

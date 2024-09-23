@implementation C3DEnginePipelineGetNodesForKey

void ____C3DEnginePipelineGetNodesForKey_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t DeformerStack;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  __int128 v13;

  DeformerStack = C3DNodeGetDeformerStack(a2);
  if (!DeformerStack)
  {
    v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      ____C3DEnginePipelineGetNodesForKey_block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ____C3DEnginePipelineGetNodesForKey_block_invoke_27;
  v12[3] = &unk_1EA5A0B68;
  v13 = *(_OWORD *)(a1 + 32);
  C3DDeformerStackEnumerateDependencyStacks(DeformerStack, (uint64_t)v12);
}

void ____C3DEnginePipelineGetNodesForKey_block_invoke_27(uint64_t a1, int a2, void *value)
{
  __CFSet *v5;

  v5 = *(__CFSet **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (!v5)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFSetCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, *(CFSetRef *)(a1 + 40));
    CFAutorelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    v5 = *(__CFSet **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  CFSetAddValue(v5, value);
}

void ____C3DEnginePipelineGetNodesForKey_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1DCCB8000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end

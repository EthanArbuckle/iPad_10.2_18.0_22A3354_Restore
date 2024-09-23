@implementation OpenIndex

xpc_object_t __OpenIndex_block_invoke_2(uint64_t a1)
{
  return xpc_uint64_create(*(_QWORD *)(a1 + 32));
}

xpc_object_t __OpenIndex_block_invoke_3(uint64_t a1)
{
  return xpc_uint64_create(*(_QWORD *)(a1 + 32));
}

xpc_object_t __OpenIndex_block_invoke_5(uint64_t a1)
{
  return xpc_uint64_create(*(_QWORD *)(a1 + 32));
}

xpc_object_t __OpenIndex_block_invoke_8(uint64_t a1)
{
  return xpc_uint64_create(*(_QWORD *)(a1 + 32));
}

void __OpenIndex_block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD v6[6];

  if (a2)
  {
    v5 = *(_QWORD *)(a2 + 1096);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 0x40000000;
    v6[2] = __OpenIndex_block_invoke_7;
    v6[3] = &__block_descriptor_tmp_841;
    v6[4] = a2;
    v6[5] = a5;
    si_enqueue_block(v5, v6);
  }
}

void __OpenIndex_block_invoke_7(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1384);
  if (count_UncompactedIndexSet(v2, *(_DWORD *)(v2 + 8) - 2))
    setupAndIssueMergeCleanup(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)v2 + 8 * (*(_DWORD *)(v2 + 8) - 2)), *(NSObject **)(a1 + 40));
}

void __OpenIndex_block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned int v4;

  if (a2)
  {
    v3 = *(_QWORD *)(a2 + 1384);
    if (v3)
    {
      v4 = *(_DWORD *)(v3 + 8);
      if (v4 >= 3 && count_IndexSet(v3, v4 - 2, 1) >= 3)
        setupAndIssueMergeCleanup(a2, *(_QWORD *)(*(_QWORD *)v3 + 8 * (*(_DWORD *)(v3 + 8) - 2)), 0);
    }
  }
}

xpc_object_t __OpenIndex_block_invoke()
{
  return xpc_uint64_create(1uLL);
}

@end

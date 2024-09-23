@implementation C3DDeformerStackEnumerateDependencyStacks

uint64_t __C3DDeformerStackEnumerateDependencyStacks_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD v5[5];
  char v6;

  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ____C3DDeformerStackEnumerateDependencyStacks_block_invoke;
  v5[3] = &unk_1EA5A09C8;
  v5[4] = v3;
  v6 = 0;
  return objc_msgSend(a3, "_enumerateDependencyNodesUsingBlock:", v5);
}

uint64_t __C3DDeformerStackEnumerateDependencyStacks_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD v5[5];
  char v6;

  v3 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ____C3DDeformerStackEnumerateDependencyStacks_block_invoke;
  v5[3] = &unk_1EA5A09C8;
  v5[4] = v3;
  v6 = 0;
  return objc_msgSend(a3, "_enumerateDependencyNodesUsingBlock:", v5);
}

uint64_t ____C3DDeformerStackEnumerateDependencyStacks_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = C3DNodeGetDeformerStack(objc_msgSend(a3, "nodeRef"));
  if (result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

@end

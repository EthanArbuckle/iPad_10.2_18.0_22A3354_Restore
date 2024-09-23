@implementation C3DDeformerStackGetLocalBoundingBox

uint64_t __C3DDeformerStackGetLocalBoundingBox_block_invoke(uint64_t result, uint64_t a2, void *a3)
{
  uint64_t v3;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v3 = result;
    result = objc_msgSend(a3, "_getDeformedMeshBoundingBox:", *(_QWORD *)(result + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = result;
  }
  return result;
}

uint64_t __C3DDeformerStackGetLocalBoundingBox_block_invoke_2(uint64_t result, uint64_t a2, void *a3)
{
  uint64_t v3;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    v3 = result;
    result = objc_msgSend(a3, "_getDeformedMeshBoundingBox:", *(_QWORD *)(result + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = result;
  }
  return result;
}

@end

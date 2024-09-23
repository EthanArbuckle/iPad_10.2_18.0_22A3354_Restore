@implementation ExecuteShaderModifiersTextureProxy

CFTypeID ___ExecuteShaderModifiersTextureProxy_block_invoke(uint64_t a1, uint64_t a2, const void *a3)
{
  uint64_t TypeID;
  CFTypeID result;

  TypeID = C3DEffectSlotGetTypeID();
  result = CFGetTypeID(a3);
  if (a3)
  {
    if (TypeID == result)
    {
      result = C3DRendererContextExecuteSlotTextureProxy(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), (uint64_t)a3);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 388) |= result;
    }
  }
  return result;
}

@end

@implementation C3DMeshCreateCopyWithInterleavedSources

void __C3DMeshCreateCopyWithInterleavedSources_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t Accessor;
  uint64_t v5;
  uint64_t Count;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  Accessor = C3DMeshSourceGetAccessor(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += C3DSourceAccessorGetValueLength(Accessor);
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  Count = C3DMeshSourceGetCount(a2);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v5)
  {
    if (Count != *(_QWORD *)(v7 + 24))
    {
      v8 = scn_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1DCCB8000, v8, OS_LOG_TYPE_DEFAULT, "Warning: Cannot create an interleaved copy, count mismatch", v9, 2u);
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    }
  }
  else
  {
    *(_QWORD *)(v7 + 24) = Count;
  }
}

uint64_t __C3DMeshCreateCopyWithInterleavedSources_block_invoke_34(_QWORD *a1, uint64_t a2, __int16 a3, uint64_t a4, int a5)
{
  uint64_t Accessor;
  uint64_t v10;
  int ComponentsValueType;
  uint64_t ComponentsCountPerValue;
  const void *v13;
  const void *v14;
  const void *v15;
  int v16;
  uint64_t v17;
  uint64_t result;

  Accessor = C3DMeshSourceGetAccessor(a2);
  v10 = Accessor;
  if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    ComponentsValueType = C3DSourceAccessorGetComponentsValueType(Accessor);
    ComponentsCountPerValue = C3DSourceAccessorGetComponentsCountPerValue(v10);
    v13 = (const void *)C3DSourceAccessorCreate(ComponentsValueType, ComponentsCountPerValue, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24));
    v14 = (const void *)C3DMeshSourceCreateWithAccessor(v13, a3);
    CFRelease(v13);
    C3DSourceAccessorSetSource((uint64_t)v13, *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24));
    C3DMeshSetSourceWithInputSet(a1[9], v14, a4, a5);
    CFRelease(v14);
  }
  else
  {
    v15 = (const void *)a1[8];
    v16 = C3DSourceAccessorGetComponentsValueType(Accessor);
    v17 = C3DSourceAccessorGetComponentsCountPerValue(v10);
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = C3DMeshSourceCreateWithData(a3, v15, v16, v17, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24));
    v13 = (const void *)C3DMeshSourceGetAccessor(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24));
    C3DMeshSetSourceWithInputSet(a1[9], *(const void **)(*(_QWORD *)(a1[4] + 8) + 24), a4, a5);
  }
  C3DSourceAccessorCopyDataToAccessor(v10, (uint64_t)v13, 0);
  result = C3DSourceAccessorGetValueLength(v10);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) += result;
  return result;
}

@end

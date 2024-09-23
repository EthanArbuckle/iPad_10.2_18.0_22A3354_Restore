@implementation C3DRendererContextUnmapVolatileMesh

void __C3DRendererContextUnmapVolatileMesh_block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *Accessor;
  uint64_t VolatileValuePtrAtIndex;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[6];

  if (C3DMeshSourceIsVolatile(a2))
  {
    Accessor = (_QWORD *)C3DMeshSourceGetAccessor(a2);
    VolatileValuePtrAtIndex = C3DSourceAccessorGetVolatileValuePtrAtIndex(Accessor, 0);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(v6 + 1992);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 0x40000000;
    v8[2] = __C3DRendererContextUnmapVolatileMesh_block_invoke_2;
    v8[3] = &__block_descriptor_tmp_38;
    v8[4] = VolatileValuePtrAtIndex;
    v8[5] = v6;
    C3DArrayApply(v7, (uint64_t)v8);
    C3DMeshSourceSetVolatileData(a2, 0);
  }
}

uint64_t __C3DRendererContextUnmapVolatileMesh_block_invoke_2(uint64_t result, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v6;
  GLuint BufferID;

  v3 = *(_QWORD *)(result + 32);
  v4 = a3[3];
  if (v3 >= v4 && v3 < v4 + a3[1])
  {
    v6 = result;
    BufferID = C3DBufferObjectGetBufferID(*a3);
    glBindBuffer(0x8892u, BufferID);
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v6 + 40) + 1976))(34962);
    a3[3] = 0;
  }
  return result;
}

@end

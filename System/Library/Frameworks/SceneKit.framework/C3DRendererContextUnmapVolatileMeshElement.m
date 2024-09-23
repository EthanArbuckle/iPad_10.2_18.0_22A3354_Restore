@implementation C3DRendererContextUnmapVolatileMeshElement

uint64_t __C3DRendererContextUnmapVolatileMeshElement_block_invoke(uint64_t result, uint64_t a2, uint64_t *a3)
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
    glBindBuffer(0x8893u, BufferID);
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v6 + 40) + 1976))(34963);
    a3[3] = 0;
  }
  return result;
}

@end

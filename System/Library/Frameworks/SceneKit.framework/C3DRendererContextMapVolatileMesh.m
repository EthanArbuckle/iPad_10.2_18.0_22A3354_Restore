@implementation C3DRendererContextMapVolatileMesh

uint64_t __C3DRendererContextMapVolatileMesh_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t Accessor;

  result = C3DMeshSourceIsVolatile(a2);
  if ((_DWORD)result)
  {
    Accessor = C3DMeshSourceGetAccessor(a2);
    C3DSourceAccessorSetCount(Accessor, *(_QWORD *)(a1 + 40));
    result = C3DSourceAccessorGetLength(Accessor);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  }
  return result;
}

void __C3DRendererContextMapVolatileMesh_block_invoke_2(_QWORD *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t Accessor;
  uint64_t Length;
  uint64_t v10;

  if ((C3DMeshSourceIsVolatile(a2) & 1) != 0)
  {
    Accessor = C3DMeshSourceGetAccessor(a2);
    Length = C3DSourceAccessorGetLength(Accessor);
    C3DMeshSourceSetVolatileData(a2, a1[6] + *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24));
    C3DSourceAccessorSetOffset(Accessor, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + a1[7]);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += Length;
    v10 = a3;
    switch(a3)
    {
      case 0u:
        break;
      case 1u:
        v10 = 1;
        break;
      case 2u:
        v10 = 3;
        break;
      case 3u:
        if (a4 == -1)
          v10 = 6;
        else
          v10 = a4 + 6;
        break;
      case 4u:
        v10 = 2;
        break;
      case 5u:
        v10 = 4;
        break;
      case 6u:
        v10 = 5;
        break;
      default:
        v10 = -1;
        break;
    }
    C3DRendererContextSetupResidentMeshSourceAtLocation(a1[8], a2, a1[9], v10);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
  }
}

void __C3DRendererContextMapVolatileMesh_block_invoke_3(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  const void *MeshSourceResident;
  GLuint BufferID;
  uint64_t v10;
  uint64_t v11;

  if ((C3DMeshSourceIsVolatile(a2) & 1) == 0)
  {
    MeshSourceResident = C3DResourceManagerMakeMeshSourceResident(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
    BufferID = C3DBufferObjectGetBufferID((uint64_t)MeshSourceResident);
    glBindBuffer(0x8892u, BufferID);
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      ++*(_DWORD *)(v10 + 208);
    v11 = a3;
    switch(a3)
    {
      case 0u:
        break;
      case 1u:
        v11 = 1;
        break;
      case 2u:
        v11 = 3;
        break;
      case 3u:
        if (a4 == -1)
          v11 = 6;
        else
          v11 = a4 + 6;
        break;
      case 4u:
        v11 = 2;
        break;
      case 5u:
        v11 = 4;
        break;
      case 6u:
        v11 = 5;
        break;
      default:
        v11 = -1;
        break;
    }
    C3DRendererContextSetupResidentMeshSourceAtLocation(v10, a2, (uint64_t)MeshSourceResident, v11);
  }
}

@end

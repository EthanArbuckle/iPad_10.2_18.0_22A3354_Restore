@implementation C3DRendererContextBindMesh

void __C3DRendererContextBindMesh_block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  const void *MeshSourceResident;
  uint64_t v9;
  GLuint BufferID;
  uint64_t v11;
  uint64_t v12;

  MeshSourceResident = C3DResourceManagerMakeMeshSourceResident(*(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
  if (MeshSourceResident)
  {
    v9 = (uint64_t)MeshSourceResident;
    BufferID = C3DBufferObjectGetBufferID((uint64_t)MeshSourceResident);
    glBindBuffer(0x8892u, BufferID);
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      ++*(_DWORD *)(v11 + 208);
    v12 = a3;
    switch(a3)
    {
      case 0u:
        break;
      case 1u:
        v12 = 1;
        break;
      case 2u:
        v12 = 3;
        break;
      case 3u:
        if (a4 == -1)
          v12 = 6;
        else
          v12 = a4 + 6;
        break;
      case 4u:
        v12 = 2;
        break;
      case 5u:
        v12 = 4;
        break;
      case 6u:
        v12 = 5;
        break;
      default:
        v12 = -1;
        break;
    }
    C3DRendererContextSetupResidentMeshSourceAtLocation(v11, a2, v9, v12);
  }
}

void __C3DRendererContextBindMesh_block_invoke_2(uint64_t a1, uint64_t a2)
{
  const void *Value;
  const __CFData *Data;
  const __CFData *v6;
  CFIndex Length;
  const UInt8 *BytePtr;
  _DWORD *MeshSourceResident;
  GLuint BufferID;
  uint64_t v11;
  void *v12;

  if (C3DMeshSourceIsMutable(a2))
  {
    if (C3DGenericSourceIsPrimary(a2))
    {
      Value = CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 128), *(const void **)(a1 + 40));
      if ((const void *)C3DMeshGetMutabilityTimeStamp(*(_QWORD *)(a1 + 40)) != Value)
      {
        Data = (const __CFData *)C3DMeshSourceGetData(a2);
        if (Data)
        {
          v6 = Data;
          Length = CFDataGetLength(Data);
          BytePtr = CFDataGetBytePtr(v6);
          MeshSourceResident = C3DResourceManagerMakeMeshSourceResident(*(_QWORD *)(a1 + 48), a2, *(_QWORD *)(a1 + 32));
          BufferID = C3DBufferObjectGetBufferID((uint64_t)MeshSourceResident);
          glBindBuffer(0x8892u, BufferID);
          v11 = *(_QWORD *)(a1 + 32);
          if (v11)
            ++*(_DWORD *)(v11 + 208);
          if (Length == MeshSourceResident[17])
          {
            v12 = (void *)(*(uint64_t (**)(uint64_t, _QWORD, CFIndex, uint64_t))(v11 + 1960))(34962, 0, Length, 38);
            memcpy(v12, BytePtr, Length);
            (*(void (**)(uint64_t))(*(_QWORD *)(a1 + 32) + 1976))(34962);
          }
          else
          {
            glBufferData(0x8892u, Length, BytePtr, 0x88E8u);
            MeshSourceResident[17] = Length;
          }
        }
      }
    }
  }
}

@end

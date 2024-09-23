@implementation CreateProbeArrayResourceIfNeeded

void __CreateProbeArrayResourceIfNeeded_block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  unsigned int RadianceProbeIndex;
  NSObject *v12;
  int ProbeEnvironmentTimeStamp;
  int ProbeUpdateType;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  C3D::Pass *v20;
  uint64_t v21;
  __C3DNode *v22;
  C3D::RefCountedResource *v23;
  unint64_t v24;
  unint64_t v25;
  C3D::Pass *v26;
  uint64_t v27;
  C3D::RefCountedResource *v28;
  uint64_t ProbeEnvironment;
  __int128 v30;
  int v31;
  int v32;
  __int128 v33;
  int v34;
  int v35;
  uint8_t v36[4];
  uint64_t v37;
  uint8_t v38[4];
  uint64_t v39;
  __int128 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v40 = *(_OWORD *)(a1 + 32);
  v41 = *(_DWORD *)(a1 + 48);
  if (a2)
  {
    v7 = 0;
    v8 = a2;
    do
    {
      v9 = *(_QWORD *)(a4 + 8 * v7);
      if (C3DLightGetProbeType(v9) != 1)
      {
        v10 = scn_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          __CreateProbeArrayResourceIfNeeded_block_invoke_cold_2(v38, &v39, v10);
      }
      RadianceProbeIndex = C3DLightGetRadianceProbeIndex(v9);
      if (RadianceProbeIndex == -1)
      {
        v12 = scn_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          __CreateProbeArrayResourceIfNeeded_block_invoke_cold_1(v36, &v37, v12);
      }
      ProbeEnvironmentTimeStamp = C3DLightGetProbeEnvironmentTimeStamp(v9);
      ProbeUpdateType = C3DLightGetProbeUpdateType(v9);
      if (ProbeUpdateType == 1)
      {
        v20 = *(C3D::Pass **)(a1 + 64);
        v21 = *(_QWORD *)(a1 + 72);
        v22 = *(__C3DNode **)(a3 + 8 * v7);
        v23 = *(C3D::RefCountedResource **)(a1 + 88);
        v30 = v40;
        v31 = v41;
        v32 = 0;
        C3D::ComputeProbeFromProbeNode(v20, v21, v23, RadianceProbeIndex, v22, &v30);
      }
      else if (!ProbeUpdateType)
      {
        if (!*(_BYTE *)(a1 + 96))
          goto LABEL_24;
        v15 = *(_QWORD *)(a1 + 56);
        v16 = *(_QWORD *)(v15 + 40);
        v17 = *(unsigned int *)(v15 + 32);
        if ((_DWORD)v17)
        {
          v18 = 8 * v17;
          v19 = *(_QWORD **)(v15 + 40);
          while (*v19 != v9)
          {
            ++v19;
            v18 -= 8;
            if (!v18)
            {
              v19 = (_QWORD *)(v16 + 8 * v17);
              break;
            }
          }
        }
        else
        {
          v19 = *(_QWORD **)(v15 + 40);
        }
        v24 = (unint64_t)v19 - v16;
        if (v17 == (uint64_t)v24 >> 3
          || (v25 = v24 >> 3, (v24 >> 3) == -1)
          || *(_DWORD *)C3D::Array<unsigned int,0u,C3D::MallocAllocator>::operator[](v15 + 16, v24 >> 3) != ProbeEnvironmentTimeStamp)
        {
LABEL_24:
          if (*(_DWORD *)C3D::Array<unsigned int,0u,C3D::MallocAllocator>::operator[](*(_QWORD *)(a1 + 80) + 16, RadianceProbeIndex) != ProbeEnvironmentTimeStamp|| *(_QWORD *)C3D::Array<void const*,0u,C3D::MallocAllocator>::operator[](*(_QWORD *)(a1 + 80) + 32, RadianceProbeIndex) != v9)
          {
            *(_DWORD *)C3D::Array<unsigned int,0u,C3D::MallocAllocator>::operator[](*(_QWORD *)(a1 + 80) + 16, RadianceProbeIndex) = ProbeEnvironmentTimeStamp;
            *(_QWORD *)C3D::Array<void const*,0u,C3D::MallocAllocator>::operator[](*(_QWORD *)(a1 + 80) + 32, RadianceProbeIndex) = v9;
            v26 = *(C3D::Pass **)(a1 + 64);
            v27 = *(_QWORD *)(a1 + 72);
            v28 = *(C3D::RefCountedResource **)(a1 + 88);
            ProbeEnvironment = C3DLightGetProbeEnvironment(v9, 0);
            v33 = v40;
            v34 = v41;
            v35 = 0;
            C3D::ComputeProbeFromEnvironmentTexture(v26, v27, v28, RadianceProbeIndex, ProbeEnvironment, &v33);
          }
        }
        else
        {
          C3D::CopyProbeFromOldTextureToNewTexture(*(C3D::Pass **)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), v25, *(_QWORD *)(a1 + 80), *(C3D::RefCountedResource **)(a1 + 88), RadianceProbeIndex);
          *(_DWORD *)C3D::Array<unsigned int,0u,C3D::MallocAllocator>::operator[](*(_QWORD *)(a1 + 80) + 16, RadianceProbeIndex) = ProbeEnvironmentTimeStamp;
          *(_QWORD *)C3D::Array<void const*,0u,C3D::MallocAllocator>::operator[](*(_QWORD *)(a1 + 80) + 32, RadianceProbeIndex) = v9;
        }
      }
      ++v7;
    }
    while (v7 != v8);
  }
}

void __CreateProbeArrayResourceIfNeeded_block_invoke_cold_1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "probeIndex != (uint32_t)kProbeSliceIndexInvalid";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Bad index", a1);
}

void __CreateProbeArrayResourceIfNeeded_block_invoke_cold_2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "C3DLightGetProbeType(light) == kC3DLightProbeTypeRadiance";
  OUTLINED_FUNCTION_0_0(&dword_1DCCB8000, a3, (uint64_t)a3, "Assertion '%s' failed. Wrong probe type", a1);
}

@end

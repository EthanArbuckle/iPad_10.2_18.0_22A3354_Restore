uint64_t AGX::FramebufferCompilerConfigGen3<AGX::G10::Encoders,AGX::G10::Classes,AGX::G10::ObjClasses>::buildDrawBufferState(uint64_t result)
{
  unsigned int v1;
  uint64_t v2;
  int v3;
  char v4;
  uint64_t v5;
  _DWORD *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  int v15;
  int v16;
  unsigned __int8 v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  BOOL v24;
  int v25;
  int v26;
  int v27;

  v1 = *(unsigned __int8 *)(result + 40);
  if (*(_BYTE *)(result + 40))
  {
    LODWORD(v2) = 0;
    v3 = 0;
    v4 = 0;
    while (2)
    {
      v5 = __clz(__rbit32(v1));
      v6 = *(_DWORD **)(result + 8 * v5 + 96);
      v7 = v6[8];
      if (v7 == 18)
        v7 = 9;
      v8 = v6[7];
      switch(v7)
      {
        case 2:
        case 4:
        case 5:
          goto LABEL_10;
        case 3:
          v9 = (v6[21] != 0) << 8;
          v10 = 1;
          goto LABEL_13;
        case 6:
        case 7:
        case 8:
        case 9:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 22:
          v8 *= 2;
          goto LABEL_10;
        case 10:
        case 11:
        case 17:
          v8 *= 4;
          goto LABEL_10;
        case 18:
        case 19:
        case 20:
        case 21:
          v8 = 4;
          goto LABEL_10;
        default:
          v8 = 0;
LABEL_10:
          v9 = 0;
          v10 = 1;
          switch(v7)
          {
            case 2:
            case 4:
            case 5:
              break;
            case 6:
            case 7:
            case 8:
            case 9:
            case 12:
            case 13:
            case 14:
            case 15:
            case 16:
            case 22:
              v9 = 0;
              v10 = 2;
              break;
            case 10:
            case 11:
            case 17:
            case 18:
            case 19:
            case 20:
            case 21:
              v9 = 0;
              v10 = 4;
              break;
            default:
              v9 = 0;
              v10 = 0;
              break;
          }
LABEL_13:
          v11 = v10 - 1;
          v12 = -v10;
          v13 = (v11 + v2) & v12;
          v14 = v13 + v8;
          v4 |= (v13 + v8) > 0x40;
          v15 = (v11 + v3) & v12;
          v16 = v15 + v8;
          if ((v4 & 1) != 0)
          {
            v3 = v16;
            v17 = v15 + 64;
          }
          else
          {
            v17 = v13;
          }
          v18 = v9 & 0xFFF00FFF | *(_DWORD *)(result + 4 * v5) & 0xFFF00EE0 | v7 & 0x1F | (v17 << 12);
          *(_DWORD *)(result + 4 * v5) = v18;
          v19 = v18 & 0xFFFFF1FF | ((v6[19] & 7) << 9);
          *(_DWORD *)(result + 4 * v5) = v19;
          if ((v4 & 1) != 0)
            v2 = v2;
          else
            v2 = v14;
          *(_DWORD *)(result + 4 * v5) = v19 & 0xFFFFFF1F | (32 * (v6[7] & 7));
          v1 ^= 1 << v5;
          if (v1)
            continue;
          v20 = v2 + 7;
          v21 = v20 & 0x1FFFFFFF8;
          v24 = (v20 & 0x1FFFFFFC0) == 0;
          v22 = 64;
          if (v24)
            v22 = v21;
          if (v22 <= 8)
            LODWORD(v22) = 8;
          v23 = (_DWORD)v22 << 16;
          v24 = (v4 & 1) == 0;
          if ((v4 & 1) != 0)
            v25 = 0x400000;
          else
            v25 = v23;
          if (v24)
            v26 = 0;
          else
            v26 = 0x2000000;
          v27 = *(unsigned __int8 *)(result + 40) | v26;
          break;
      }
      break;
    }
  }
  else
  {
    v3 = 0;
    v27 = 0;
    v25 = 0x80000;
  }
  *(_DWORD *)(result + 32) = v27 | ((*(_BYTE *)(result + 84) & 0xF) << 8) | *(_DWORD *)(result + 32) & 0xFC000000 | v25 | ((*(_BYTE *)(result + 85) & 0xF) << 12);
  *(_DWORD *)(result + 88) = v3;
  *(_DWORD *)(result + 44) = 0;
  return result;
}

_QWORD *AGCTargetImpl<AGX::G10::Classes,AGX::G10::Encoders>::CreateProgramKeyFactory@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_1E7ECF2A8;
  *a1 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::G10::Classes,AGX::G10::Encoders>::CreateTGSizeToTempTable@<X0>(_DWORD *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;

  *a1 = 16;
  result = operator new[]();
  v5 = *a1;
  if ((_DWORD)v5)
  {
    v6 = 0;
    v7 = -49;
    do
    {
      if (v7 > 0xFFFFFFC7)
        v8 = 1024;
      else
        v8 = (0x1800 / (v6 & 0x1FFFFFFF)) & 0x1FE0;
      *(_DWORD *)(result + 4 * v6++) = v8;
      v7 += 8;
    }
    while (v5 != v6);
  }
  *a2 = result;
  return result;
}

_QWORD *AGCTargetImpl<AGX::G10::Classes,AGX::G10::Encoders>::GetLegalizationPasses@<X0>(_DWORD *a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *result;
  uint64_t v5;
  int v6;
  const char *v7;
  const char *v8;
  char v9;
  const char *v10;
  char v11;
  const char *v12;
  char v13;
  const char *v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = "air-degenerate-vertex-amplification-emulation";
  v9 = 1;
  v10 = "air-raytracing-emulation,indirect-acceleration-structures";
  v11 = 0;
  v12 = "mtl-fetch-all";
  v13 = 1;
  v14 = "air-bfloat-emulation";
  v15 = 1;
  result = malloc_type_malloc(0x20uLL, 0x10040436913F5uLL);
  v5 = 0;
  v6 = 0;
  *a1 = 0;
  do
  {
    if (LOBYTE((&v8)[v5 + 1]))
    {
      v7 = (&v8)[v5];
      *a1 = v6 + 1;
      result[v6++] = v7;
    }
    v5 += 2;
  }
  while (v5 != 8);
  *a2 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::G10::Classes,AGX::G10::Encoders>::requiresRayTracingEmulation()
{
  return 1;
}

uint64_t AGCTargetImpl<AGX::G10::Classes,AGX::G10::Encoders>::maxMSAASampleCount()
{
  return 4;
}

void AGX::ProgramKeyFactoryImpl<AGX::G10::Classes,AGX::G10::Encoders>::~ProgramKeyFactoryImpl()
{
  JUMPOUT(0x1CAA2D68CLL);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G10::Classes,AGX::G10::Encoders>::CreateVertexProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, int a6@<W6>, uint64_t a7@<X8>)
{
  uint64_t v14;
  int v15;
  __int16 v17;
  uint64_t v18;
  int v19;
  std::string v20;
  std::string v21;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v20 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v21, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v21 = *(std::string *)(a2 + 24);
  v14 = *(unsigned __int8 *)(a2 + 48);
  *(_DWORD *)(a7 + 8) = 3;
  *(_OWORD *)(a7 + 96) = 0u;
  *(_OWORD *)(a7 + 112) = 0u;
  *(_OWORD *)(a7 + 128) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 76) = 0u;
  *(_QWORD *)a7 = &off_1E7ED3720;
  *(std::string *)(a7 + 144) = v20;
  *(std::string *)(a7 + 168) = v21;
  *(_BYTE *)(a7 + 192) = v14;
  *(_QWORD *)(a7 + 56) = v14 << 18;
  AGX::Impl::VertexProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a7, a3);
  if (a7 + 96 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 96), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a7 + 120 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 120), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a6)
    v15 = 2;
  else
    v15 = 0;
  *(_DWORD *)(a7 + 88) = *(_DWORD *)(a7 + 88) & 0xFFFFFFFD | v15;
  v17 = 256;
  v18 = 0;
  v19 = 0;
  return AGX::GeometrySharedKey<_AGCVertexContextStateAGP,(_AGCStreamToken)3>::setDeviceOptions(a7, (unsigned __int8 *)&v17);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G10::Classes,AGX::G10::Encoders>::CreateObjectProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, int a3@<W3>, NSObject *a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  char *v11;
  int v12;
  int v13;
  __int16 v15;
  uint64_t v16;
  int v17;

  *(_DWORD *)(a7 + 8) = 9;
  *(_OWORD *)(a7 + 104) = 0u;
  v11 = (char *)(a7 + 104);
  *(_OWORD *)(a7 + 120) = 0u;
  *(_OWORD *)(a7 + 136) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 80) = 0u;
  *(_DWORD *)(a7 + 96) = 0;
  *(_QWORD *)a7 = &off_1E7ED37B0;
  if (a2)
    v12 = 2;
  else
    v12 = 0;
  if (a3)
    v13 = 4;
  else
    v13 = 0;
  *(_DWORD *)(a7 + 56) = v13 | v12;
  AGX::Impl::ObjectProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a7, a4);
  if (v11 != (char *)a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v11, *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a7 + 128 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 128), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  v15 = 256;
  v16 = 0;
  v17 = 0;
  return AGX::GeometrySharedKey<_AGCObjectContextStateAGP,(_AGCStreamToken)9>::setDeviceOptions(a7, (unsigned __int8 *)&v15);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G10::Classes,AGX::G10::Encoders>::CreateMeshProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, int a3@<W3>, int a4@<W4>, NSObject *a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, char a9)
{
  int v17;
  __int128 v18;
  int v19;
  int v20;
  int v21;
  __int16 v23;
  uint64_t v24;
  int v25;
  std::string v26;
  std::string v27;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v26, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v26 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v27, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v27 = *(std::string *)(a2 + 24);
  v17 = *(unsigned __int8 *)(a2 + 48);
  *(_OWORD *)(a8 + 104) = 0u;
  *(_DWORD *)(a8 + 8) = 10;
  *(_OWORD *)(a8 + 120) = 0u;
  *(_OWORD *)(a8 + 136) = 0u;
  *(_OWORD *)(a8 + 16) = 0u;
  *(_OWORD *)(a8 + 32) = 0u;
  *(_OWORD *)(a8 + 48) = 0u;
  *(_OWORD *)(a8 + 64) = 0u;
  *(_OWORD *)(a8 + 80) = 0u;
  *(_DWORD *)(a8 + 96) = 0;
  *(_QWORD *)a8 = &off_1E7ED3768;
  *(std::string *)(a8 + 152) = v26;
  v18 = *(_OWORD *)&v27.__r_.__value_.__l.__data_;
  *(_QWORD *)(a8 + 192) = *((_QWORD *)&v27.__r_.__value_.__l + 2);
  if (a3)
    v19 = 128;
  else
    v19 = 0;
  if (a4)
    v20 = 256;
  else
    v20 = 0;
  *(_OWORD *)(a8 + 176) = v18;
  *(_BYTE *)(a8 + 200) = v17;
  *(_DWORD *)(a8 + 56) = v20 | v19 | (16 * v17);
  AGX::Impl::MeshProgramKey::initCommon((AGX *)a8, a1);
  *(_DWORD *)(a8 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a8, a5);
  if (a8 + 104 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 104), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  if (a8 + 128 != a7)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 128), *(char **)a7, *(_QWORD *)(a7 + 8), (uint64_t)(*(_QWORD *)(a7 + 8) - *(_QWORD *)a7) >> 5);
  if (a9)
    v21 = 2;
  else
    v21 = 0;
  *(_DWORD *)(a8 + 96) = *(_DWORD *)(a8 + 96) & 0xFFFFFFFD | v21;
  v23 = 256;
  v24 = 0;
  v25 = 0;
  return AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setDeviceOptions(a8, (unsigned __int8 *)&v23);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G10::Classes,AGX::G10::Encoders>::CreateFragmentProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  char *v12;
  MTLPixelFormat v13;
  unsigned __int16 *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char v28;
  char v29;
  __int128 v30;
  int v31;
  unsigned int v32;
  int v33;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[31];
  int v43;
  __int16 v44;
  int v45;
  _OWORD v46[7];

  *(_DWORD *)(a6 + 8) = 4;
  *(_QWORD *)(a6 + 24) = 0;
  *(_QWORD *)(a6 + 32) = 0;
  *(_QWORD *)(a6 + 16) = 0;
  *(_OWORD *)(a6 + 232) = 0u;
  v12 = (char *)(a6 + 232);
  *(_QWORD *)a6 = &off_1E7ED37F8;
  *(_OWORD *)(a6 + 40) = 0u;
  *(_OWORD *)(a6 + 56) = 0u;
  *(_OWORD *)(a6 + 72) = 0u;
  *(_OWORD *)(a6 + 88) = 0u;
  *(_OWORD *)(a6 + 104) = 0u;
  *(_OWORD *)(a6 + 120) = 0u;
  *(_OWORD *)(a6 + 136) = 0u;
  *(_OWORD *)(a6 + 152) = 0u;
  *(_OWORD *)(a6 + 168) = 0u;
  *(_OWORD *)(a6 + 184) = 0u;
  *(_OWORD *)(a6 + 200) = 0u;
  *(_OWORD *)(a6 + 209) = 0u;
  *(_OWORD *)(a6 + 248) = 0u;
  *(_OWORD *)(a6 + 264) = 0u;
  v41 = 0u;
  memset(v42, 0, sizeof(v42));
  v39 = 0u;
  v40 = 0u;
  v43 = 1;
  v44 = 0;
  v45 = 0;
  memset(v46, 0, 96);
  bzero(&v39, 0x28uLL);
  if (!a1)
    goto LABEL_22;
  v38 = a2;
  v14 = (unsigned __int16 *)((char *)a1 - *(int *)a1);
  v15 = *v14;
  if (v15 >= 0x17)
  {
    v16 = v14[11];
    if (!v14[11])
      goto LABEL_14;
    v17 = *(unsigned int *)((char *)a1 + v16);
    v18 = (unsigned int *)((char *)a1 + v16 + v17);
    v19 = *v18;
    if (!(_DWORD)v19)
      goto LABEL_14;
    v35 = a3;
    v36 = a4;
    v37 = a5;
    v20 = 0;
    v21 = DWORD2(v41);
    v22 = (char *)a1 + v16 + v17;
    do
    {
      v23 = &v22[4 * v20];
      v24 = *((unsigned int *)v23 + 1);
      v25 = (char *)v18 + v24 - *(int *)&v23[v24 + 4];
      if (*((unsigned __int16 *)v25 + 2) >= 5u)
      {
        v26 = *((unsigned __int16 *)v25 + 4);
        if (v26)
        {
          v27 = (char *)v18 + v24 + v26;
          if (*((_WORD *)v27 + 2))
          {
            *((_QWORD *)v46 + v20) = AGX::G10::TextureFormatTable::chooseTextureFormatCPP((AGX::G10::TextureFormatTable *)*((unsigned __int16 *)v27 + 2), v13);
            v21 |= 1 << v20;
          }
        }
      }
      if (v20 > 6)
        break;
      ++v20;
      ++v18;
    }
    while (v20 < v19);
    DWORD2(v41) = v21;
    a4 = v36;
    a5 = v37;
    a3 = v35;
  }
  if (v15 <= 0xC)
  {
    v29 = 1;
    LOBYTE(v44) = 1;
    a2 = v38;
LABEL_21:
    HIBYTE(v44) = v29;
    goto LABEL_22;
  }
LABEL_14:
  if (v14[6])
    v28 = *((_BYTE *)a1 + v14[6]);
  else
    v28 = 1;
  a2 = v38;
  LOBYTE(v44) = v28;
  HIBYTE(v44) = v28;
  if (v15 >= 0xF)
  {
    if (v14[7])
    {
      v29 = *((_BYTE *)a1 + v14[7]);
      if (v29)
        goto LABEL_21;
    }
  }
LABEL_22:
  AGX::FramebufferCompilerConfigGen3<AGX::G10::Encoders,AGX::G10::Classes,AGX::G10::ObjClasses>::buildDrawBufferState((uint64_t)&v39);
  v30 = v40;
  *(_OWORD *)(a6 + 112) = v39;
  *(_OWORD *)(a6 + 128) = v30;
  *(_QWORD *)(a6 + 144) = v41;
  AGX::Impl::FragmentProgramKey::initCommon((AGX *)a6, a1);
  v31 = *(_DWORD *)(a6 + 104);
  v32 = *(_DWORD *)(a6 + 100) & 0xFFFFFF7F;
  *(_DWORD *)(a6 + 40) &= ~0x10u;
  if (a2)
    v33 = 256;
  else
    v33 = 0;
  *(_DWORD *)(a6 + 100) = v32;
  *(_DWORD *)(a6 + 104) = v31 & 0xFFFFFEFF | v33;
  AGX::Impl::FragmentProgramKey::setSerializedDescriptor((AGX::Impl::FragmentProgramKey *)a6, a3);
  if (v12 != (char *)a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v12, *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a6 + 256 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a6 + 256), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  LOWORD(v39) = 256;
  *(_QWORD *)((char *)&v39 + 2) = 0;
  *(_DWORD *)((char *)&v39 + 10) = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a6, (unsigned __int8 *)&v39);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G10::Classes,AGX::G10::Encoders>::CreateComputeProgramKey@<X0>(AGX *a1@<X1>, NSObject *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  __int16 v11;
  uint64_t v12;
  int v13;

  *(_DWORD *)(a5 + 8) = 6;
  *(_QWORD *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  *(_QWORD *)(a5 + 32) = 0;
  *(_QWORD *)(a5 + 40) = 0;
  *(_QWORD *)a5 = &off_1E7ED3878;
  *(_QWORD *)(a5 + 48) = 0;
  *(_QWORD *)(a5 + 56) = 0;
  std::string::basic_string[abi:nn180100]<0>((_QWORD *)(a5 + 64), (char *)&unk_1C3E4D9BB);
  *(_BYTE *)(a5 + 88) = 0;
  *(_OWORD *)(a5 + 96) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_OWORD *)(a5 + 128) = 0u;
  AGX::Impl::ComputeProgramKey::initCommon((AGX *)a5, a1);
  *(int8x8_t *)(a5 + 52) = vand_s8(*(int8x8_t *)(a5 + 52), (int8x8_t)0xFFFFFFFEFFFFFF7FLL);
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a5, a2);
  if (a5 + 96 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 96), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  if (a5 + 120 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 120), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  v11 = 256;
  v12 = 0;
  v13 = 0;
  return AGX::Impl::ComputeProgramKey::setDeviceOptions(a5, (unsigned __int8 *)&v11);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G10::Classes,AGX::G10::Encoders>::CreateTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, unint64_t a4@<X8>)
{
  MTLPixelFormat v8;
  unsigned __int16 *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char v23;
  char v24;
  __int128 v25;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[31];
  int v32;
  __int16 v33;
  int v34;
  _OWORD v35[7];

  *(_DWORD *)(a4 + 8) = 5;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)a4 = &off_1E7ED3838;
  *(_OWORD *)(a4 + 40) = 0u;
  *(_OWORD *)(a4 + 56) = 0u;
  *(_OWORD *)(a4 + 72) = 0u;
  *(_OWORD *)(a4 + 88) = 0u;
  *(_OWORD *)(a4 + 104) = 0u;
  *(_OWORD *)(a4 + 120) = 0u;
  *(_OWORD *)(a4 + 136) = 0u;
  *(_OWORD *)(a4 + 152) = 0u;
  *(_OWORD *)(a4 + 168) = 0u;
  *(_OWORD *)(a4 + 184) = 0u;
  *(_QWORD *)(a4 + 200) = 0;
  v30 = 0u;
  memset(v31, 0, sizeof(v31));
  v28 = 0u;
  v29 = 0u;
  v32 = 1;
  v33 = 0;
  v34 = 0;
  memset(v35, 0, 96);
  bzero(&v28, 0x28uLL);
  if (!a1)
    goto LABEL_22;
  v9 = (unsigned __int16 *)((char *)a1 - *a1);
  v10 = *v9;
  if (v10 < 0xF)
    goto LABEL_13;
  v11 = v9[7];
  if (v9[7])
  {
    v12 = *(unsigned int *)((char *)a1 + v11);
    v13 = (unsigned int *)((char *)a1 + v11 + v12);
    v14 = *v13;
    if ((_DWORD)v14)
    {
      v15 = 0;
      v16 = DWORD2(v30);
      v27 = a3;
      v17 = (char *)a1 + v11 + v12;
      do
      {
        v18 = &v17[4 * v15];
        v19 = *((unsigned int *)v18 + 1);
        v20 = (char *)v13 + v19 - *(int *)&v18[v19 + 4];
        if (*((unsigned __int16 *)v20 + 2) >= 5u)
        {
          v21 = *((unsigned __int16 *)v20 + 4);
          if (v21)
          {
            v22 = (char *)v13 + v19 + v21;
            if (*((_WORD *)v22 + 2))
            {
              *((_QWORD *)v35 + v15) = AGX::G10::TextureFormatTable::chooseTextureFormatCPP((AGX::G10::TextureFormatTable *)*((unsigned __int16 *)v22 + 2), v8);
              v16 |= 1 << v15;
            }
          }
        }
        if (v15 > 6)
          break;
        ++v15;
        ++v13;
      }
      while (v15 < v14);
      DWORD2(v30) = v16;
      a3 = v27;
LABEL_13:
      if (v10 <= 0xA)
      {
        v24 = 1;
        LOBYTE(v33) = 1;
LABEL_21:
        HIBYTE(v33) = v24;
        goto LABEL_22;
      }
    }
  }
  if (v9[5])
    v23 = *((_BYTE *)a1 + v9[5]);
  else
    v23 = 1;
  LOBYTE(v33) = v23;
  HIBYTE(v33) = v23;
  if (v10 >= 0xD)
  {
    if (v9[6])
    {
      v24 = *((_BYTE *)a1 + v9[6]);
      if (v24)
        goto LABEL_21;
    }
  }
LABEL_22:
  AGX::FramebufferCompilerConfigGen3<AGX::G10::Encoders,AGX::G10::Classes,AGX::G10::ObjClasses>::buildDrawBufferState((uint64_t)&v28);
  v25 = v29;
  *(_OWORD *)(a4 + 112) = v28;
  *(_OWORD *)(a4 + 128) = v25;
  *(_QWORD *)(a4 + 144) = v30;
  AGX::Impl::TileProgramKey::initCommon(a4, a1);
  *(_DWORD *)(a4 + 100) &= ~0x80u;
  if (a4 + 160 != a2)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 160), *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 5);
  if (a4 + 184 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 184), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  LOWORD(v28) = 256;
  *(_QWORD *)((char *)&v28 + 2) = 0;
  *(_DWORD *)((char *)&v28 + 10) = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a4, (unsigned __int8 *)&v28);
}

double AGX::ProgramKeyFactoryImpl<AGX::G10::Classes,AGX::G10::Encoders>::CreateBackgroundObjectProgramKey@<D0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  double result;
  __int128 v4;
  int v5;
  _OWORD v6[2];
  uint64_t v7;
  int v8;
  unsigned __int8 v9;
  unsigned __int16 v10;
  unsigned __int8 v11;

  *(_DWORD *)(a2 + 8) = 13;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFAA8;
  AGX::FramebufferCompilerConfig<AGX::G10::Encoders,AGX::G10::Classes,AGX::G10::ObjClasses>::FramebufferCompilerConfig((uint64_t)v6, a1);
  AGX::FramebufferCompilerConfigGen3<AGX::G10::Encoders,AGX::G10::Classes,AGX::G10::ObjClasses>::buildDrawBufferState((uint64_t)v6);
  result = *(double *)v6;
  v4 = v6[1];
  *(_OWORD *)(a2 + 40) = v6[0];
  *(_OWORD *)(a2 + 56) = v4;
  *(_QWORD *)(a2 + 72) = v7;
  *(_QWORD *)(a2 + 80) = 0;
  v5 = v10 | (v11 << 16) | (v8 << 24);
  *(_WORD *)(a2 + 84) = v9;
  *(_DWORD *)(a2 + 80) = v5;
  return result;
}

_OWORD *AGX::ProgramKeyFactoryImpl<AGX::G10::Classes,AGX::G10::Encoders>::CreateEndOfTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  _OWORD *result;
  unsigned int v5;
  unsigned int v6;
  int v7;
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  char *v18;
  int v19;
  int v20;
  unsigned int v22;
  unsigned int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  char *v28;
  char v29;
  int v30;
  unsigned int v31;
  int v32;
  int v33;
  int v34;
  _OWORD v35[2];
  uint64_t v36;
  _OWORD v37[2];
  uint64_t v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int8 v44;

  *(_DWORD *)(a2 + 8) = 19;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)a2 = off_1E7ECFAE8;
  *(_OWORD *)(a2 + 40) = 0u;
  v3 = a2 + 40;
  *(_QWORD *)(a2 + 16) = 0;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(_OWORD *)(a2 + 88) = 0u;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_QWORD *)(a2 + 118) = 0;
  AGX::FramebufferCompilerConfig<AGX::G10::Encoders,AGX::G10::Classes,AGX::G10::ObjClasses>::FramebufferCompilerConfig((uint64_t)v37, a1);
  result = (_OWORD *)AGX::FramebufferCompilerConfigGen3<AGX::G10::Encoders,AGX::G10::Classes,AGX::G10::ObjClasses>::buildDrawBufferState((uint64_t)v37);
  v35[0] = v37[0];
  v35[1] = v37[1];
  v5 = v38;
  v36 = v38;
  v6 = v39;
  v7 = v40;
  v8 = ((unint64_t)BYTE2(v38) << 36) | ((unint64_t)((unsigned __int16)v38 >> 12) << 32) | 0x40000000000000;
  *(_QWORD *)(a2 + 112) = v8;
  if (v6)
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = (unsigned __int16)v5 >> 12;
    v13 = HIWORD(v5) & 0x1FF;
    v14 = v43 & ~v42 | v41;
    v15 = v44;
    v16 = v42 & ~v43 | v41;
    result = v35;
    do
    {
      v17 = __clz(__rbit32(v6));
      v18 = (char *)v37 + 2 * v17;
      if ((v18[161] & 1) != 0)
      {
        v20 = 0x20000;
      }
      else
      {
        v19 = v18[160];
        if ((v18[161] & 2) != 0)
          v20 = 0x40000;
        else
          v20 = 0x20000;
        if (v19 != 2)
          v20 = 16711680;
        if ((v19 - 3) < 2 || v19 == 1)
          v20 = 0x20000;
      }
      v22 = *((_DWORD *)v35 + v17);
      v23 = (v22 >> 12) / v13;
      v24 = (v22 & 0x1F) << 8;
      v25 = (v22 << 21) & 0x1C000000;
      *(_DWORD *)(v3 + 4 * v17) = *(_DWORD *)(v3 + 4 * v17) & 0xE3000000 | v20 | v24 | v25 | v23;
      v9 |= 1 << v17;
      v10 |= (1 << v17) & v14;
      v26 = v15 & (1 << v17);
      v11 |= v26;
      if ((v7 & (1 << v17)) != 0)
      {
        if (v12 <= 1)
          v27 = 0;
        else
          v27 = (v22 << 16) & 0x1000000;
        v28 = (char *)v37 + 2 * v17;
        v29 = v28[177];
        if ((v29 & 1) != 0)
        {
          v34 = 0x20000;
        }
        else
        {
          v30 = v28[176];
          v31 = v30 - 3;
          if ((v29 & 2) != 0)
            v32 = 0x40000;
          else
            v32 = 0x20000;
          if (v30 != 2)
            v32 = 16711680;
          if (v30 == 1)
            v33 = 0x20000;
          else
            v33 = v32;
          if (v31 >= 2)
            v34 = v33;
          else
            v34 = 0x20000;
        }
        *(_DWORD *)(v3 + 4 * (v17 + 8)) = *(_DWORD *)(v3 + 4 * (v17 + 8)) & 0xE2000000 | v27 | v34 | v24 | v25 | v23;
        v9 |= 256 << v17;
        v10 |= ((v16 >> v17) & 1) << (v17 + 8);
        v11 |= (v26 != 0) << (v17 + 8);
      }
      v6 ^= 1 << v17;
    }
    while (v6);
    v8 = (unint64_t)*(unsigned int *)(a2 + 116) << 32;
  }
  else
  {
    LOWORD(v11) = 0;
    LOWORD(v10) = 0;
    LOWORD(v9) = 0;
  }
  *(_WORD *)(a2 + 120) = v9;
  *(_WORD *)(a2 + 122) = v10;
  *(_WORD *)(a2 + 124) = v11;
  *(_QWORD *)(a2 + 112) = v8 | (unsigned __int16)(v9 & ~(_WORD)v10) | ((unint64_t)(unsigned __int16)(v9 & v11) << 16);
  return result;
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G10::Classes,AGX::G10::Encoders>::CreateBVHBuilderProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 8) = 24;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFB68;
  *(_DWORD *)(a2 + 40) = 0;
  return AGX::BVHBuilderProgramKey::initializeWithDescriptor(a2, a1);
}

char *std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 5)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 59)
      abort();
    v10 = v8 >> 4;
    if (v8 >> 4 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0)
      v11 = 0x7FFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<MTLUINT256_t>::__vallocate[abi:nn180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 5;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[32 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

void AGX::Impl::ComputeProgramKey::setStageInDescriptor(AGX::Impl::ComputeProgramKey *this, dispatch_data_t data)
{
  NSObject *v3;
  size_t v4;
  void *buffer_ptr;

  if (data)
  {
    v4 = 0;
    buffer_ptr = 0;
    v3 = dispatch_data_create_map(data, (const void **)&buffer_ptr, &v4);
    std::string::append((std::string *)((char *)this + 64), (const std::string::value_type *)buffer_ptr, v4);
    dispatch_release(v3);
  }
}

void AGX::Impl::FragmentProgramKey::setSerializedDescriptor(AGX::Impl::FragmentProgramKey *this, dispatch_data_t data)
{
  NSObject *v3;
  size_t v4;
  void *buffer_ptr;

  if (data)
  {
    v4 = 0;
    buffer_ptr = 0;
    v3 = dispatch_data_create_map(data, (const void **)&buffer_ptr, &v4);
    std::string::append((std::string *)((char *)this + 200), (const std::string::value_type *)buffer_ptr, v4);
    dispatch_release(v3);
  }
}

void AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor(std::string *a1, dispatch_data_t data)
{
  NSObject *v3;
  size_t v4;
  void *buffer_ptr;

  if (data)
  {
    v4 = 0;
    buffer_ptr = 0;
    v3 = dispatch_data_create_map(data, (const void **)&buffer_ptr, &v4);
    std::string::append(a1 + 3, (const std::string::value_type *)buffer_ptr, v4);
    dispatch_release(v3);
  }
}

uint64_t AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setDeviceOptions(uint64_t result, unsigned __int8 *a2)
{
  int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;

  v2 = *(_DWORD *)(result + 56);
  v3 = *(_DWORD *)(result + 52) & 0xFBFFFFFF | (*a2 << 26);
  *(_DWORD *)(result + 52) = v3;
  v4 = v3 & 0xFFFFFEFF | (a2[1] << 8);
  *(_DWORD *)(result + 52) = v4;
  v5 = v4 & 0xEFFFFFFF | (a2[2] << 28);
  *(_DWORD *)(result + 52) = v5;
  v6 = v5 & 0xDFFFFFFF | (a2[4] << 29);
  *(_DWORD *)(result + 52) = v6;
  *(_DWORD *)(result + 52) = v6 & 0xBFFFFFFF | (a2[6] << 30);
  *(_DWORD *)(result + 56) = v2 & 0xFFFFFDFF | (a2[3] << 9);
  return result;
}

uint64_t AGX::GeometrySharedKey<_AGCObjectContextStateAGP,(_AGCStreamToken)9>::setDeviceOptions(uint64_t result, unsigned __int8 *a2)
{
  int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;

  v2 = *(_DWORD *)(result + 56);
  v3 = *(_DWORD *)(result + 52) & 0xFBFFFFFF | (*a2 << 26);
  *(_DWORD *)(result + 52) = v3;
  v4 = v3 & 0xFFFFFEFF | (a2[1] << 8);
  *(_DWORD *)(result + 52) = v4;
  v5 = v4 & 0xEFFFFFFF | (a2[2] << 28);
  *(_DWORD *)(result + 52) = v5;
  v6 = v5 & 0xDFFFFFFF | (a2[4] << 29);
  *(_DWORD *)(result + 52) = v6;
  *(_DWORD *)(result + 52) = v6 & 0xBFFFFFFF | (a2[6] << 30);
  *(_DWORD *)(result + 56) = v2 & 0xFFFFFF7F | (a2[3] << 7);
  return result;
}

uint64_t AGX::FramebufferCompilerConfig<AGX::G11::Encoders,AGX::G11::Classes,AGX::G11::ObjClasses>::FramebufferCompilerConfig(uint64_t a1, int *a2)
{
  MTLPixelFormat v4;
  uint64_t v5;
  char *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  __int32 v24;
  int v25;
  uint64_t v26;
  int v27;
  char *v28;
  uint64_t v29;
  char v30;
  int v31;
  char v32;
  uint64_t v33;
  int v34;
  int v35;
  int32x2_t v36;
  int v37;
  char *v38;
  uint64_t v39;
  char v40;
  int v41;
  char *v42;
  char v43;
  char v44;
  char v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  unsigned __int16 *v49;
  unsigned int v50;
  char v51;
  char v52;
  uint64_t v53;

  *(_OWORD *)(a1 + 63) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 80) = 1;
  *(_WORD *)(a1 + 84) = 0;
  *(_DWORD *)(a1 + 88) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  bzero((void *)a1, 0x28uLL);
  if (a2)
  {
    v5 = *a2;
    v6 = (char *)a2 - v5;
    v7 = *(unsigned __int16 *)((char *)a2 - v5);
    if (v7 < 5)
      goto LABEL_71;
    v8 = -v5;
    v9 = *((unsigned __int16 *)v6 + 2);
    if (*((_WORD *)v6 + 2))
    {
      v10 = (char *)a2 + v9;
      v11 = *(unsigned int *)((char *)a2 + v9);
      v12 = *(unsigned int *)((char *)a2 + v9 + v11);
      if ((_DWORD)v12)
      {
        v13 = 0;
        v14 = 0;
        v15 = v9 + v11;
        while (1)
        {
          v16 = *(unsigned int *)((char *)a2 + v15 + 4);
          v17 = (char *)a2 + v15 + v16;
          v18 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v18 + 2) >= 5u)
          {
            v19 = *((unsigned __int16 *)v18 + 4);
            if (v19)
            {
              v20 = (char *)a2 + v15 + v16 + v19;
              if (*((_WORD *)v20 + 2))
                break;
            }
          }
LABEL_46:
          if (v14 <= 6)
          {
            ++v14;
            v13 += 2;
            v15 += 4;
            if (v14 < v12)
              continue;
          }
          v47 = *a2;
          v8 = -v47;
          v7 = *(unsigned __int16 *)((char *)a2 - v47);
          goto LABEL_66;
        }
        *(_QWORD *)(a1 + 8 * v14 + 96) = AGX::G11::TextureFormatTable::chooseTextureFormatCPP((AGX::G11::TextureFormatTable *)*((unsigned __int16 *)v20 + 2), v4);
        v21 = 1 << v14;
        *(_DWORD *)(a1 + 40) |= 1 << v14;
        v22 = v16 - *((int *)v17 + 1);
        v23 = *(unsigned __int16 *)((char *)a2 + v15 + v22 + 4);
        if (v23 < 0x19)
        {
          v25 = 0;
          v24 = 0;
          if (v23 < 0xF)
          {
LABEL_34:
            v25 = 0;
            v34 = 1 << v14;
LABEL_35:
            *(_DWORD *)(a1 + 52) |= v34;
            v36.i32[0] = v24;
            v36.i32[1] = v25 & 0xFFFFFFFD;
            *(int8x8_t *)(a1 + 60) = vorr_s8(*(int8x8_t *)(a1 + 60), vand_s8((int8x8_t)vdup_n_s32(v21), (int8x8_t)vceq_s32(v36, (int32x2_t)0x100000001)));
            if (v25 == 4)
              v37 = 1 << v14;
            else
              v37 = 0;
            *(_DWORD *)(a1 + 72) |= v37;
            v38 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
            if (*((unsigned __int16 *)v38 + 2) >= 7u && (v39 = *((unsigned __int16 *)v38 + 5)) != 0)
            {
              v40 = 0;
              v41 = *((unsigned __int8 *)a2 + v15 + v16 + v39 + 4);
              v42 = (char *)(a1 + v13 + 160);
              v43 = 2;
              v44 = 1;
              switch(v41)
              {
                case 0:
                case 1:
                  v43 = 1;
                  v40 = v41;
                  goto LABEL_52;
                case 3:
                  goto LABEL_57;
                case 4:
                  v45 = 2;
                  goto LABEL_43;
                case 5:
                  goto LABEL_51;
                case 6:
                  v40 = 1;
LABEL_51:
                  v43 = 4;
                  goto LABEL_52;
                case 7:
                  *v42 = 3;
                  *(_BYTE *)(a1 + v13 + 161) = 0;
LABEL_55:
                  v46 = 3;
                  break;
                case 8:
                  v44 = 3;
LABEL_57:
                  *v42 = 2;
                  *(_BYTE *)(a1 + v13 + 161) = v44;
LABEL_58:
                  *(_BYTE *)(a1 + 78) |= v21;
                  goto LABEL_44;
                default:
LABEL_52:
                  *v42 = v43;
                  *(_BYTE *)(a1 + v13 + 161) = v40;
                  v46 = 1;
                  switch(v41)
                  {
                    case 0:
                      goto LABEL_45;
                    case 1:
                      *(_BYTE *)(a1 + 78) |= v21;
                      v46 = 1;
                      break;
                    case 3:
                    case 5:
                    case 6:
                    case 8:
                      goto LABEL_58;
                    case 7:
                      goto LABEL_55;
                    default:
                      goto LABEL_44;
                  }
                  break;
              }
            }
            else
            {
              v45 = 0;
              v42 = (char *)(a1 + 2 * v14 + 160);
LABEL_43:
              *v42 = 2;
              *(_BYTE *)(a1 + v13 + 161) = v45;
LABEL_44:
              v46 = 2;
            }
LABEL_45:
            *(_WORD *)(a1 + 76) |= v46 << v13;
            v12 = *(unsigned int *)&v10[v11];
            goto LABEL_46;
          }
        }
        else
        {
          if (*(_WORD *)((char *)a2 + v15 + v22 + 28))
            v24 = *((unsigned __int8 *)a2 + v15 + v16 + *(unsigned __int16 *)((char *)a2 + v15 + v22 + 28) + 4);
          else
            v24 = 0;
          if (v23 >= 0x1B && *(_WORD *)((char *)a2 + v15 + v22 + 30))
            v25 = *((unsigned __int8 *)a2 + v15 + v16 + *(unsigned __int16 *)((char *)a2 + v15 + v22 + 30) + 4);
          else
            v25 = 0;
        }
        v26 = *(unsigned __int16 *)((char *)a2 + v15 + v22 + 18);
        if (v26 && *(_WORD *)((char *)a2 + v15 + v16 + v26 + 4))
        {
          *(_DWORD *)(a1 + 48) |= v21;
          if ((v25 & 0xFE) == 2)
            v27 = 1 << v14;
          else
            v27 = 0;
          *(_DWORD *)(a1 + 68) |= v27;
          v28 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v28 + 2) >= 0x11u && (v29 = *((unsigned __int16 *)v28 + 10), *((_WORD *)v28 + 10)))
          {
            v30 = 0;
            v31 = *((unsigned __int8 *)a2 + v15 + v16 + v29 + 4);
            v32 = 2;
            switch(v31)
            {
              case 0:
              case 1:
                v32 = 1;
                v30 = v31;
                break;
              case 3:
                v30 = 1;
                break;
              case 4:
                v30 = 2;
                break;
              case 5:
                goto LABEL_61;
              case 6:
                v30 = 1;
LABEL_61:
                v32 = 4;
                break;
              case 7:
                v30 = 0;
                v32 = 3;
                break;
              case 8:
                v30 = 3;
                break;
              default:
                break;
            }
          }
          else
          {
            v30 = 0;
            v32 = 2;
          }
          v33 = a1 + v13;
          *(_BYTE *)(v33 + 176) = v32;
          *(_BYTE *)(v33 + 177) = v30;
        }
        v34 = 0;
        if (v24 == 2)
          v35 = 1 << v14;
        else
          v35 = 0;
        *(_DWORD *)(a1 + 56) |= v35;
        if (v25)
          goto LABEL_35;
        goto LABEL_34;
      }
    }
LABEL_66:
    if (v7 >= 7
      && *(_WORD *)((char *)a2 + v8 + 6)
      && (v48 = *(_QWORD *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v8 + 6)), (v48 & 0xFFFFFFFE) != 0))
    {
      if (v48 > 0x7FF)
        LODWORD(v48) = 2048;
    }
    else
    {
LABEL_71:
      LODWORD(v48) = 1;
    }
    *(_DWORD *)(a1 + 80) = v48;
    v49 = (unsigned __int16 *)((char *)a2 - *a2);
    v50 = *v49;
    if (v50 < 0xB)
    {
      v52 = 1;
      *(_BYTE *)(a1 + 84) = 1;
      if (v50 < 9)
      {
LABEL_82:
        *(_BYTE *)(a1 + 85) = v52;
        return a1;
      }
    }
    else
    {
      if (v49[5])
        v51 = *((_BYTE *)a2 + v49[5]);
      else
        v51 = 1;
      *(_BYTE *)(a1 + 84) = v51;
    }
    v53 = v49[4];
    if (v53)
      v52 = *((_BYTE *)a2 + v53);
    else
      v52 = 1;
    goto LABEL_82;
  }
  return a1;
}

void AGX::FramebufferCompilerConfigGen3<AGX::G11::Encoders,AGX::G11::Classes,AGX::G11::ObjClasses>::buildDrawBufferState(uint64_t a1)
{
  unsigned int v2;
  int v3;
  int v4;
  char v5;
  uint64_t v6;
  _DWORD *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  unsigned __int8 v18;
  unsigned int v19;
  unsigned int v20;
  BOOL v21;
  int v22;
  unint64_t v23;

  if (AGX::G11::FramebufferCompilerConfig::isLargeMRTEmulationEnabled(void)::onceToken != -1)
    dispatch_once(&AGX::G11::FramebufferCompilerConfig::isLargeMRTEmulationEnabled(void)::onceToken, &__block_literal_global_6162);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(_BYTE *)(a1 + 40))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    while (2)
    {
      v6 = __clz(__rbit32(v2));
      v7 = *(_DWORD **)(a1 + 8 * v6 + 96);
      v8 = v7[8];
      if (v8 == 18)
        v8 = 9;
      v9 = v7[7];
      switch(v8)
      {
        case 2:
        case 4:
        case 5:
          goto LABEL_12;
        case 3:
          v10 = (v7[21] != 0) << 8;
          v11 = 1;
          goto LABEL_15;
        case 6:
        case 7:
        case 8:
        case 9:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 22:
          v9 *= 2;
          goto LABEL_12;
        case 10:
        case 11:
        case 17:
          v9 *= 4;
          goto LABEL_12;
        case 18:
        case 19:
        case 20:
        case 21:
          v9 = 4;
          goto LABEL_12;
        default:
          v9 = 0;
LABEL_12:
          v10 = 0;
          v11 = 1;
          switch(v8)
          {
            case 2:
            case 4:
            case 5:
              break;
            case 6:
            case 7:
            case 8:
            case 9:
            case 12:
            case 13:
            case 14:
            case 15:
            case 16:
            case 22:
              v10 = 0;
              v11 = 2;
              break;
            case 10:
            case 11:
            case 17:
            case 18:
            case 19:
            case 20:
            case 21:
              v10 = 0;
              v11 = 4;
              break;
            default:
              v10 = 0;
              v11 = 0;
              break;
          }
LABEL_15:
          v12 = v11 - 1;
          v13 = -v11;
          v14 = (v11 - 1 + v3) & -v11;
          v15 = (v14 + v9);
          v5 |= v15 > 0x40;
          v16 = (v12 + v4) & v13;
          v17 = v16 + v9;
          if ((v5 & 1) != 0)
          {
            v4 = v17;
            v18 = v16 + 64;
          }
          else
          {
            v18 = v14;
          }
          v19 = v10 & 0xFFF00FFF | *(_DWORD *)(a1 + 4 * v6) & 0xFFF00EE0 | v8 & 0x1F | (v18 << 12);
          *(_DWORD *)(a1 + 4 * v6) = v19;
          v20 = v19 & 0xFFFFF1FF | ((v7[19] & 7) << 9);
          *(_DWORD *)(a1 + 4 * v6) = v20;
          if ((v5 & 1) == 0)
            v3 = v15;
          *(_DWORD *)(a1 + 4 * v6) = v20 & 0xFFFFFF1F | (32 * (v7[7] & 7));
          v2 ^= 1 << v6;
          if (v2)
            continue;
          v21 = (v5 & 1) == 0;
          if ((v5 & 1) != 0)
            v22 = 0x2000000;
          else
            v22 = 0;
          v2 = *(unsigned __int8 *)(a1 + 40) | v22;
          v23 = (v15 + 7) & 0x1FFFFFFF8;
          if (!v21)
            v23 = 64;
          break;
      }
      break;
    }
  }
  else
  {
    v4 = 0;
    v23 = 0;
  }
  if (v23 >= 0x40)
    v23 = 64;
  if (v23 <= 8)
    LODWORD(v23) = 8;
  *(_DWORD *)(a1 + 32) = v2 | *(_DWORD *)(a1 + 32) & 0xFC000000 | ((_DWORD)v23 << 16) | ((*(_BYTE *)(a1 + 84) & 0xF) << 8) & 0xFFF | ((*(_BYTE *)(a1 + 85) & 0xF) << 12);
  *(_DWORD *)(a1 + 88) = v4;
  *(_DWORD *)(a1 + 44) = 0;
}

_QWORD *AGCTargetImpl<AGX::G11::Classes,AGX::G11::Encoders>::CreateProgramKeyFactory@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_1E7ECF388;
  *a1 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::G11::Classes,AGX::G11::Encoders>::CreateTGSizeToTempTable@<X0>(_DWORD *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;

  *a1 = 16;
  result = operator new[]();
  v5 = *a1;
  if ((_DWORD)v5)
  {
    v6 = 0;
    v7 = -49;
    do
    {
      if (v7 > 0xFFFFFFC7)
        v8 = 1024;
      else
        v8 = (2 * (0xC00 / (v6 & 0x1FFFFFFF))) & 0x1FC0;
      *(_DWORD *)(result + 4 * v6++) = v8;
      v7 += 8;
    }
    while (v5 != v6);
  }
  *a2 = result;
  return result;
}

_QWORD *AGCTargetImpl<AGX::G11::Classes,AGX::G11::Encoders>::GetLegalizationPasses@<X0>(_DWORD *a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *result;
  uint64_t v5;
  int v6;
  const char *v7;
  const char *v8;
  char v9;
  const char *v10;
  char v11;
  const char *v12;
  char v13;
  const char *v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = "air-degenerate-vertex-amplification-emulation";
  v9 = 1;
  v10 = "air-raytracing-emulation,indirect-acceleration-structures";
  v11 = 0;
  v12 = "mtl-fetch-all-unaligned";
  v13 = 1;
  v14 = "air-bfloat-emulation";
  v15 = 1;
  result = malloc_type_malloc(0x20uLL, 0x10040436913F5uLL);
  v5 = 0;
  v6 = 0;
  *a1 = 0;
  do
  {
    if (LOBYTE((&v8)[v5 + 1]))
    {
      v7 = (&v8)[v5];
      *a1 = v6 + 1;
      result[v6++] = v7;
    }
    v5 += 2;
  }
  while (v5 != 8);
  *a2 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::G11::Classes,AGX::G11::Encoders>::requiresRayTracingEmulation()
{
  return 1;
}

uint64_t AGCTargetImpl<AGX::G11::Classes,AGX::G11::Encoders>::maxMSAASampleCount()
{
  return 4;
}

void AGX::ProgramKeyFactoryImpl<AGX::G11::Classes,AGX::G11::Encoders>::~ProgramKeyFactoryImpl()
{
  JUMPOUT(0x1CAA2D68CLL);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G11::Classes,AGX::G11::Encoders>::CreateVertexProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, int a6@<W6>, uint64_t a7@<X8>)
{
  uint64_t v14;
  int v15;
  __int16 v17;
  uint64_t v18;
  int v19;
  std::string v20;
  std::string v21;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v20 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v21, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v21 = *(std::string *)(a2 + 24);
  v14 = *(unsigned __int8 *)(a2 + 48);
  *(_DWORD *)(a7 + 8) = 3;
  *(_OWORD *)(a7 + 96) = 0u;
  *(_OWORD *)(a7 + 112) = 0u;
  *(_OWORD *)(a7 + 128) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 76) = 0u;
  *(_QWORD *)a7 = &off_1E7ED3720;
  *(std::string *)(a7 + 144) = v20;
  *(std::string *)(a7 + 168) = v21;
  *(_BYTE *)(a7 + 192) = v14;
  *(_QWORD *)(a7 + 56) = v14 << 18;
  AGX::Impl::VertexProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a7, a3);
  if (a7 + 96 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 96), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a7 + 120 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 120), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a6)
    v15 = 2;
  else
    v15 = 0;
  *(_DWORD *)(a7 + 88) = *(_DWORD *)(a7 + 88) & 0xFFFFFFFD | v15;
  v17 = 256;
  v18 = 0;
  v19 = 0;
  return AGX::GeometrySharedKey<_AGCVertexContextStateAGP,(_AGCStreamToken)3>::setDeviceOptions(a7, (unsigned __int8 *)&v17);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G11::Classes,AGX::G11::Encoders>::CreateObjectProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, int a3@<W3>, NSObject *a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  char *v11;
  int v12;
  int v13;
  __int16 v15;
  uint64_t v16;
  int v17;

  *(_DWORD *)(a7 + 8) = 9;
  *(_OWORD *)(a7 + 104) = 0u;
  v11 = (char *)(a7 + 104);
  *(_OWORD *)(a7 + 120) = 0u;
  *(_OWORD *)(a7 + 136) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 80) = 0u;
  *(_DWORD *)(a7 + 96) = 0;
  *(_QWORD *)a7 = &off_1E7ED37B0;
  if (a2)
    v12 = 2;
  else
    v12 = 0;
  if (a3)
    v13 = 4;
  else
    v13 = 0;
  *(_DWORD *)(a7 + 56) = v13 | v12;
  AGX::Impl::ObjectProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a7, a4);
  if (v11 != (char *)a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v11, *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a7 + 128 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 128), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  v15 = 256;
  v16 = 0;
  v17 = 0;
  return AGX::GeometrySharedKey<_AGCObjectContextStateAGP,(_AGCStreamToken)9>::setDeviceOptions(a7, (unsigned __int8 *)&v15);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G11::Classes,AGX::G11::Encoders>::CreateMeshProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, int a3@<W3>, int a4@<W4>, NSObject *a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, char a9)
{
  int v17;
  __int128 v18;
  int v19;
  int v20;
  int v21;
  __int16 v23;
  uint64_t v24;
  int v25;
  std::string v26;
  std::string v27;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v26, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v26 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v27, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v27 = *(std::string *)(a2 + 24);
  v17 = *(unsigned __int8 *)(a2 + 48);
  *(_OWORD *)(a8 + 104) = 0u;
  *(_DWORD *)(a8 + 8) = 10;
  *(_OWORD *)(a8 + 120) = 0u;
  *(_OWORD *)(a8 + 136) = 0u;
  *(_OWORD *)(a8 + 16) = 0u;
  *(_OWORD *)(a8 + 32) = 0u;
  *(_OWORD *)(a8 + 48) = 0u;
  *(_OWORD *)(a8 + 64) = 0u;
  *(_OWORD *)(a8 + 80) = 0u;
  *(_DWORD *)(a8 + 96) = 0;
  *(_QWORD *)a8 = &off_1E7ED3768;
  *(std::string *)(a8 + 152) = v26;
  v18 = *(_OWORD *)&v27.__r_.__value_.__l.__data_;
  *(_QWORD *)(a8 + 192) = *((_QWORD *)&v27.__r_.__value_.__l + 2);
  if (a3)
    v19 = 128;
  else
    v19 = 0;
  if (a4)
    v20 = 256;
  else
    v20 = 0;
  *(_OWORD *)(a8 + 176) = v18;
  *(_BYTE *)(a8 + 200) = v17;
  *(_DWORD *)(a8 + 56) = v20 | v19 | (16 * v17);
  AGX::Impl::MeshProgramKey::initCommon((AGX *)a8, a1);
  *(_DWORD *)(a8 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a8, a5);
  if (a8 + 104 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 104), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  if (a8 + 128 != a7)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 128), *(char **)a7, *(_QWORD *)(a7 + 8), (uint64_t)(*(_QWORD *)(a7 + 8) - *(_QWORD *)a7) >> 5);
  if (a9)
    v21 = 2;
  else
    v21 = 0;
  *(_DWORD *)(a8 + 96) = *(_DWORD *)(a8 + 96) & 0xFFFFFFFD | v21;
  v23 = 256;
  v24 = 0;
  v25 = 0;
  return AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setDeviceOptions(a8, (unsigned __int8 *)&v23);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G11::Classes,AGX::G11::Encoders>::CreateFragmentProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  char *v12;
  MTLPixelFormat v13;
  unsigned __int16 *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char v28;
  char v29;
  __int128 v30;
  int v31;
  unsigned int v32;
  int v33;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[31];
  int v43;
  __int16 v44;
  int v45;
  _OWORD v46[7];

  *(_DWORD *)(a6 + 8) = 4;
  *(_QWORD *)(a6 + 24) = 0;
  *(_QWORD *)(a6 + 32) = 0;
  *(_QWORD *)(a6 + 16) = 0;
  *(_OWORD *)(a6 + 232) = 0u;
  v12 = (char *)(a6 + 232);
  *(_QWORD *)a6 = &off_1E7ED37F8;
  *(_OWORD *)(a6 + 40) = 0u;
  *(_OWORD *)(a6 + 56) = 0u;
  *(_OWORD *)(a6 + 72) = 0u;
  *(_OWORD *)(a6 + 88) = 0u;
  *(_OWORD *)(a6 + 104) = 0u;
  *(_OWORD *)(a6 + 120) = 0u;
  *(_OWORD *)(a6 + 136) = 0u;
  *(_OWORD *)(a6 + 152) = 0u;
  *(_OWORD *)(a6 + 168) = 0u;
  *(_OWORD *)(a6 + 184) = 0u;
  *(_OWORD *)(a6 + 200) = 0u;
  *(_OWORD *)(a6 + 209) = 0u;
  *(_OWORD *)(a6 + 248) = 0u;
  *(_OWORD *)(a6 + 264) = 0u;
  v41 = 0u;
  memset(v42, 0, sizeof(v42));
  v39 = 0u;
  v40 = 0u;
  v43 = 1;
  v44 = 0;
  v45 = 0;
  memset(v46, 0, 96);
  bzero(&v39, 0x28uLL);
  if (!a1)
    goto LABEL_22;
  v38 = a2;
  v14 = (unsigned __int16 *)((char *)a1 - *(int *)a1);
  v15 = *v14;
  if (v15 >= 0x17)
  {
    v16 = v14[11];
    if (!v14[11])
      goto LABEL_14;
    v17 = *(unsigned int *)((char *)a1 + v16);
    v18 = (unsigned int *)((char *)a1 + v16 + v17);
    v19 = *v18;
    if (!(_DWORD)v19)
      goto LABEL_14;
    v35 = a3;
    v36 = a4;
    v37 = a5;
    v20 = 0;
    v21 = DWORD2(v41);
    v22 = (char *)a1 + v16 + v17;
    do
    {
      v23 = &v22[4 * v20];
      v24 = *((unsigned int *)v23 + 1);
      v25 = (char *)v18 + v24 - *(int *)&v23[v24 + 4];
      if (*((unsigned __int16 *)v25 + 2) >= 5u)
      {
        v26 = *((unsigned __int16 *)v25 + 4);
        if (v26)
        {
          v27 = (char *)v18 + v24 + v26;
          if (*((_WORD *)v27 + 2))
          {
            *((_QWORD *)v46 + v20) = AGX::G11::TextureFormatTable::chooseTextureFormatCPP((AGX::G11::TextureFormatTable *)*((unsigned __int16 *)v27 + 2), v13);
            v21 |= 1 << v20;
          }
        }
      }
      if (v20 > 6)
        break;
      ++v20;
      ++v18;
    }
    while (v20 < v19);
    DWORD2(v41) = v21;
    a4 = v36;
    a5 = v37;
    a3 = v35;
  }
  if (v15 <= 0xC)
  {
    v29 = 1;
    LOBYTE(v44) = 1;
    a2 = v38;
LABEL_21:
    HIBYTE(v44) = v29;
    goto LABEL_22;
  }
LABEL_14:
  if (v14[6])
    v28 = *((_BYTE *)a1 + v14[6]);
  else
    v28 = 1;
  a2 = v38;
  LOBYTE(v44) = v28;
  HIBYTE(v44) = v28;
  if (v15 >= 0xF)
  {
    if (v14[7])
    {
      v29 = *((_BYTE *)a1 + v14[7]);
      if (v29)
        goto LABEL_21;
    }
  }
LABEL_22:
  AGX::FramebufferCompilerConfigGen3<AGX::G11::Encoders,AGX::G11::Classes,AGX::G11::ObjClasses>::buildDrawBufferState((uint64_t)&v39);
  v30 = v40;
  *(_OWORD *)(a6 + 112) = v39;
  *(_OWORD *)(a6 + 128) = v30;
  *(_QWORD *)(a6 + 144) = v41;
  AGX::Impl::FragmentProgramKey::initCommon((AGX *)a6, a1);
  v31 = *(_DWORD *)(a6 + 104);
  v32 = *(_DWORD *)(a6 + 100) & 0xFFFFFF7F;
  *(_DWORD *)(a6 + 40) &= ~0x10u;
  if (a2)
    v33 = 256;
  else
    v33 = 0;
  *(_DWORD *)(a6 + 100) = v32;
  *(_DWORD *)(a6 + 104) = v31 & 0xFFFFFEFF | v33;
  AGX::Impl::FragmentProgramKey::setSerializedDescriptor((AGX::Impl::FragmentProgramKey *)a6, a3);
  if (v12 != (char *)a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v12, *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a6 + 256 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a6 + 256), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  LOWORD(v39) = 256;
  *(_QWORD *)((char *)&v39 + 2) = 0;
  *(_DWORD *)((char *)&v39 + 10) = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a6, (unsigned __int8 *)&v39);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G11::Classes,AGX::G11::Encoders>::CreateComputeProgramKey@<X0>(AGX *a1@<X1>, NSObject *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  __int16 v11;
  uint64_t v12;
  int v13;

  *(_DWORD *)(a5 + 8) = 6;
  *(_QWORD *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  *(_QWORD *)(a5 + 32) = 0;
  *(_QWORD *)(a5 + 40) = 0;
  *(_QWORD *)a5 = &off_1E7ED3878;
  *(_QWORD *)(a5 + 48) = 0;
  *(_QWORD *)(a5 + 56) = 0;
  std::string::basic_string[abi:nn180100]<0>((_QWORD *)(a5 + 64), (char *)&unk_1C3E4D9BB);
  *(_BYTE *)(a5 + 88) = 0;
  *(_OWORD *)(a5 + 96) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_OWORD *)(a5 + 128) = 0u;
  AGX::Impl::ComputeProgramKey::initCommon((AGX *)a5, a1);
  *(int8x8_t *)(a5 + 52) = vand_s8(*(int8x8_t *)(a5 + 52), (int8x8_t)0xFFFFFFFEFFFFFF7FLL);
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a5, a2);
  if (a5 + 96 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 96), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  if (a5 + 120 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 120), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  v11 = 256;
  v12 = 0;
  v13 = 0;
  return AGX::Impl::ComputeProgramKey::setDeviceOptions(a5, (unsigned __int8 *)&v11);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G11::Classes,AGX::G11::Encoders>::CreateTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, unint64_t a4@<X8>)
{
  MTLPixelFormat v8;
  unsigned __int16 *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char v23;
  char v24;
  __int128 v25;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[31];
  int v32;
  __int16 v33;
  int v34;
  _OWORD v35[7];

  *(_DWORD *)(a4 + 8) = 5;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)a4 = &off_1E7ED3838;
  *(_OWORD *)(a4 + 40) = 0u;
  *(_OWORD *)(a4 + 56) = 0u;
  *(_OWORD *)(a4 + 72) = 0u;
  *(_OWORD *)(a4 + 88) = 0u;
  *(_OWORD *)(a4 + 104) = 0u;
  *(_OWORD *)(a4 + 120) = 0u;
  *(_OWORD *)(a4 + 136) = 0u;
  *(_OWORD *)(a4 + 152) = 0u;
  *(_OWORD *)(a4 + 168) = 0u;
  *(_OWORD *)(a4 + 184) = 0u;
  *(_QWORD *)(a4 + 200) = 0;
  v30 = 0u;
  memset(v31, 0, sizeof(v31));
  v28 = 0u;
  v29 = 0u;
  v32 = 1;
  v33 = 0;
  v34 = 0;
  memset(v35, 0, 96);
  bzero(&v28, 0x28uLL);
  if (!a1)
    goto LABEL_22;
  v9 = (unsigned __int16 *)((char *)a1 - *a1);
  v10 = *v9;
  if (v10 < 0xF)
    goto LABEL_13;
  v11 = v9[7];
  if (v9[7])
  {
    v12 = *(unsigned int *)((char *)a1 + v11);
    v13 = (unsigned int *)((char *)a1 + v11 + v12);
    v14 = *v13;
    if ((_DWORD)v14)
    {
      v15 = 0;
      v16 = DWORD2(v30);
      v27 = a3;
      v17 = (char *)a1 + v11 + v12;
      do
      {
        v18 = &v17[4 * v15];
        v19 = *((unsigned int *)v18 + 1);
        v20 = (char *)v13 + v19 - *(int *)&v18[v19 + 4];
        if (*((unsigned __int16 *)v20 + 2) >= 5u)
        {
          v21 = *((unsigned __int16 *)v20 + 4);
          if (v21)
          {
            v22 = (char *)v13 + v19 + v21;
            if (*((_WORD *)v22 + 2))
            {
              *((_QWORD *)v35 + v15) = AGX::G11::TextureFormatTable::chooseTextureFormatCPP((AGX::G11::TextureFormatTable *)*((unsigned __int16 *)v22 + 2), v8);
              v16 |= 1 << v15;
            }
          }
        }
        if (v15 > 6)
          break;
        ++v15;
        ++v13;
      }
      while (v15 < v14);
      DWORD2(v30) = v16;
      a3 = v27;
LABEL_13:
      if (v10 <= 0xA)
      {
        v24 = 1;
        LOBYTE(v33) = 1;
LABEL_21:
        HIBYTE(v33) = v24;
        goto LABEL_22;
      }
    }
  }
  if (v9[5])
    v23 = *((_BYTE *)a1 + v9[5]);
  else
    v23 = 1;
  LOBYTE(v33) = v23;
  HIBYTE(v33) = v23;
  if (v10 >= 0xD)
  {
    if (v9[6])
    {
      v24 = *((_BYTE *)a1 + v9[6]);
      if (v24)
        goto LABEL_21;
    }
  }
LABEL_22:
  AGX::FramebufferCompilerConfigGen3<AGX::G11::Encoders,AGX::G11::Classes,AGX::G11::ObjClasses>::buildDrawBufferState((uint64_t)&v28);
  v25 = v29;
  *(_OWORD *)(a4 + 112) = v28;
  *(_OWORD *)(a4 + 128) = v25;
  *(_QWORD *)(a4 + 144) = v30;
  AGX::Impl::TileProgramKey::initCommon(a4, a1);
  *(_DWORD *)(a4 + 100) &= ~0x80u;
  if (a4 + 160 != a2)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 160), *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 5);
  if (a4 + 184 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 184), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  LOWORD(v28) = 256;
  *(_QWORD *)((char *)&v28 + 2) = 0;
  *(_DWORD *)((char *)&v28 + 10) = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a4, (unsigned __int8 *)&v28);
}

double AGX::ProgramKeyFactoryImpl<AGX::G11::Classes,AGX::G11::Encoders>::CreateBackgroundObjectProgramKey@<D0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  double result;
  __int128 v4;
  int v5;
  _OWORD v6[2];
  uint64_t v7;
  int v8;
  unsigned __int8 v9;
  unsigned __int16 v10;
  unsigned __int8 v11;

  *(_DWORD *)(a2 + 8) = 13;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFAA8;
  AGX::FramebufferCompilerConfig<AGX::G11::Encoders,AGX::G11::Classes,AGX::G11::ObjClasses>::FramebufferCompilerConfig((uint64_t)v6, a1);
  AGX::FramebufferCompilerConfigGen3<AGX::G11::Encoders,AGX::G11::Classes,AGX::G11::ObjClasses>::buildDrawBufferState((uint64_t)v6);
  result = *(double *)v6;
  v4 = v6[1];
  *(_OWORD *)(a2 + 40) = v6[0];
  *(_OWORD *)(a2 + 56) = v4;
  *(_QWORD *)(a2 + 72) = v7;
  *(_QWORD *)(a2 + 80) = 0;
  v5 = v10 | (v11 << 16) | (v8 << 24);
  *(_WORD *)(a2 + 84) = v9;
  *(_DWORD *)(a2 + 80) = v5;
  return result;
}

void AGX::ProgramKeyFactoryImpl<AGX::G11::Classes,AGX::G11::Encoders>::CreateEndOfTileProgramKey(int *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  char v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  char *v20;
  unsigned __int8 v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  char *v27;
  unsigned __int8 v28;
  _OWORD v29[2];
  uint64_t v30;
  _OWORD v31[2];
  uint64_t v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  unsigned __int8 v37;
  unsigned __int8 v38;
  unsigned int v39;

  *(_DWORD *)(a2 + 8) = 19;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)a2 = off_1E7ECFAE8;
  *(_OWORD *)(a2 + 40) = 0u;
  v3 = a2 + 40;
  *(_QWORD *)(a2 + 16) = 0;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(_OWORD *)(a2 + 88) = 0u;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_QWORD *)(a2 + 118) = 0;
  AGX::FramebufferCompilerConfig<AGX::G11::Encoders,AGX::G11::Classes,AGX::G11::ObjClasses>::FramebufferCompilerConfig((uint64_t)v31, a1);
  AGX::FramebufferCompilerConfigGen3<AGX::G11::Encoders,AGX::G11::Classes,AGX::G11::ObjClasses>::buildDrawBufferState((uint64_t)v31);
  v29[0] = v31[0];
  v29[1] = v31[1];
  v4 = v32;
  v30 = v32;
  v5 = v39;
  v6 = v33;
  v7 = v34;
  v8 = ((unint64_t)BYTE2(v32) << 36) | ((unint64_t)((unsigned __int16)v32 >> 12) << 32) | 0x40000000000000;
  *(_QWORD *)(a2 + 112) = v8;
  if (v6)
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = (unsigned __int16)v4 >> 12;
    v13 = v38;
    v14 = HIWORD(v4) & 0x1FF;
    if (v5 < 2)
      v15 = 2;
    else
      v15 = 3;
    v16 = v37 & ~v36 | v35;
    v17 = v36 & ~v37 | v35;
    do
    {
      v18 = __clz(__rbit32(v6));
      v19 = *((_DWORD *)v29 + v18);
      v20 = (char *)v31 + 2 * v18;
      v21 = v15;
      if ((v20[161] & 1) == 0)
      {
        v21 = 5;
        switch(v20[160])
        {
          case 1:
            v21 = 2;
            break;
          case 2:
            if ((v20[161] & 2) != 0)
              v21 = 4;
            else
              v21 = 2;
            break;
          case 3:
            break;
          case 4:
            v21 = v15;
            break;
          default:
            v21 = -1;
            break;
        }
      }
      v22 = (v19 >> 12) / v14;
      v23 = (*((_DWORD *)v29 + v18) & 0x1F) << 8;
      v24 = (v19 << 21) & 0x1C000000;
      *(_DWORD *)(v3 + 4 * v18) = *(_DWORD *)(v3 + 4 * v18) & 0xE3000000 | (v21 << 16) | v23 | v24 | v22;
      v9 |= 1 << v18;
      v10 |= (1 << v18) & v16;
      v25 = v13 & (1 << v18);
      v11 |= v25;
      if ((v7 & (1 << v18)) != 0)
      {
        if (v12 <= 1)
          v26 = 0;
        else
          v26 = (v19 << 16) & 0x1000000;
        v27 = (char *)v31 + 2 * v18;
        v28 = v15;
        if ((v27[177] & 1) == 0)
        {
          v28 = 5;
          switch(v27[176])
          {
            case 1:
              v28 = 2;
              break;
            case 2:
              if ((v27[177] & 2) != 0)
                v28 = 4;
              else
                v28 = 2;
              break;
            case 3:
              break;
            case 4:
              v28 = v15;
              break;
            default:
              v28 = -1;
              break;
          }
        }
        *(_DWORD *)(v3 + 4 * (v18 + 8)) = *(_DWORD *)(v3 + 4 * (v18 + 8)) & 0xE2000000 | v26 | (v28 << 16) | v23 | v24 | v22;
        v9 |= 256 << v18;
        v10 |= ((v17 >> v18) & 1) << (v18 + 8);
        v11 |= (v25 != 0) << (v18 + 8);
      }
      v6 ^= 1 << v18;
    }
    while (v6);
    v8 = (unint64_t)*(unsigned int *)(a2 + 116) << 32;
  }
  else
  {
    LOWORD(v11) = 0;
    LOWORD(v10) = 0;
    LOWORD(v9) = 0;
  }
  *(_WORD *)(a2 + 120) = v9;
  *(_WORD *)(a2 + 122) = v10;
  *(_WORD *)(a2 + 124) = v11;
  *(_QWORD *)(a2 + 112) = v8 | (unsigned __int16)(v9 & ~(_WORD)v10) | ((unint64_t)(unsigned __int16)(v9 & v11) << 16);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G11::Classes,AGX::G11::Encoders>::CreateBVHBuilderProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 8) = 24;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFB68;
  *(_DWORD *)(a2 + 40) = 0;
  return AGX::BVHBuilderProgramKey::initializeWithDescriptor(a2, a1);
}

uint64_t AGX::FramebufferCompilerConfig<AGX::G12::Encoders,AGX::G12::Classes,AGX::G12::ObjClasses>::FramebufferCompilerConfig(uint64_t a1, int *a2)
{
  MTLPixelFormat v4;
  uint64_t v5;
  char *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  __int32 v24;
  int v25;
  uint64_t v26;
  int v27;
  char *v28;
  uint64_t v29;
  char v30;
  int v31;
  char v32;
  uint64_t v33;
  int v34;
  int v35;
  int32x2_t v36;
  int v37;
  char *v38;
  uint64_t v39;
  char v40;
  int v41;
  char *v42;
  char v43;
  char v44;
  char v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  unsigned __int16 *v49;
  unsigned int v50;
  char v51;
  char v52;
  uint64_t v53;

  *(_OWORD *)(a1 + 63) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 80) = 1;
  *(_WORD *)(a1 + 84) = 0;
  *(_DWORD *)(a1 + 88) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  bzero((void *)a1, 0x28uLL);
  if (a2)
  {
    v5 = *a2;
    v6 = (char *)a2 - v5;
    v7 = *(unsigned __int16 *)((char *)a2 - v5);
    if (v7 < 5)
      goto LABEL_71;
    v8 = -v5;
    v9 = *((unsigned __int16 *)v6 + 2);
    if (*((_WORD *)v6 + 2))
    {
      v10 = (char *)a2 + v9;
      v11 = *(unsigned int *)((char *)a2 + v9);
      v12 = *(unsigned int *)((char *)a2 + v9 + v11);
      if ((_DWORD)v12)
      {
        v13 = 0;
        v14 = 0;
        v15 = v9 + v11;
        while (1)
        {
          v16 = *(unsigned int *)((char *)a2 + v15 + 4);
          v17 = (char *)a2 + v15 + v16;
          v18 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v18 + 2) >= 5u)
          {
            v19 = *((unsigned __int16 *)v18 + 4);
            if (v19)
            {
              v20 = (char *)a2 + v15 + v16 + v19;
              if (*((_WORD *)v20 + 2))
                break;
            }
          }
LABEL_46:
          if (v14 <= 6)
          {
            ++v14;
            v13 += 2;
            v15 += 4;
            if (v14 < v12)
              continue;
          }
          v47 = *a2;
          v8 = -v47;
          v7 = *(unsigned __int16 *)((char *)a2 - v47);
          goto LABEL_66;
        }
        *(_QWORD *)(a1 + 8 * v14 + 96) = AGX::G12::TextureFormatTable::chooseTextureFormatCPP((AGX::G12::TextureFormatTable *)*((unsigned __int16 *)v20 + 2), v4);
        v21 = 1 << v14;
        *(_DWORD *)(a1 + 40) |= 1 << v14;
        v22 = v16 - *((int *)v17 + 1);
        v23 = *(unsigned __int16 *)((char *)a2 + v15 + v22 + 4);
        if (v23 < 0x19)
        {
          v25 = 0;
          v24 = 0;
          if (v23 < 0xF)
          {
LABEL_34:
            v25 = 0;
            v34 = 1 << v14;
LABEL_35:
            *(_DWORD *)(a1 + 52) |= v34;
            v36.i32[0] = v24;
            v36.i32[1] = v25 & 0xFFFFFFFD;
            *(int8x8_t *)(a1 + 60) = vorr_s8(*(int8x8_t *)(a1 + 60), vand_s8((int8x8_t)vdup_n_s32(v21), (int8x8_t)vceq_s32(v36, (int32x2_t)0x100000001)));
            if (v25 == 4)
              v37 = 1 << v14;
            else
              v37 = 0;
            *(_DWORD *)(a1 + 72) |= v37;
            v38 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
            if (*((unsigned __int16 *)v38 + 2) >= 7u && (v39 = *((unsigned __int16 *)v38 + 5)) != 0)
            {
              v40 = 0;
              v41 = *((unsigned __int8 *)a2 + v15 + v16 + v39 + 4);
              v42 = (char *)(a1 + v13 + 160);
              v43 = 2;
              v44 = 1;
              switch(v41)
              {
                case 0:
                case 1:
                  v43 = 1;
                  v40 = v41;
                  goto LABEL_52;
                case 3:
                  goto LABEL_57;
                case 4:
                  v45 = 2;
                  goto LABEL_43;
                case 5:
                  goto LABEL_51;
                case 6:
                  v40 = 1;
LABEL_51:
                  v43 = 4;
                  goto LABEL_52;
                case 7:
                  *v42 = 3;
                  *(_BYTE *)(a1 + v13 + 161) = 0;
LABEL_55:
                  v46 = 3;
                  break;
                case 8:
                  v44 = 3;
LABEL_57:
                  *v42 = 2;
                  *(_BYTE *)(a1 + v13 + 161) = v44;
LABEL_58:
                  *(_BYTE *)(a1 + 78) |= v21;
                  goto LABEL_44;
                default:
LABEL_52:
                  *v42 = v43;
                  *(_BYTE *)(a1 + v13 + 161) = v40;
                  v46 = 1;
                  switch(v41)
                  {
                    case 0:
                      goto LABEL_45;
                    case 1:
                      *(_BYTE *)(a1 + 78) |= v21;
                      v46 = 1;
                      break;
                    case 3:
                    case 5:
                    case 6:
                    case 8:
                      goto LABEL_58;
                    case 7:
                      goto LABEL_55;
                    default:
                      goto LABEL_44;
                  }
                  break;
              }
            }
            else
            {
              v45 = 0;
              v42 = (char *)(a1 + 2 * v14 + 160);
LABEL_43:
              *v42 = 2;
              *(_BYTE *)(a1 + v13 + 161) = v45;
LABEL_44:
              v46 = 2;
            }
LABEL_45:
            *(_WORD *)(a1 + 76) |= v46 << v13;
            v12 = *(unsigned int *)&v10[v11];
            goto LABEL_46;
          }
        }
        else
        {
          if (*(_WORD *)((char *)a2 + v15 + v22 + 28))
            v24 = *((unsigned __int8 *)a2 + v15 + v16 + *(unsigned __int16 *)((char *)a2 + v15 + v22 + 28) + 4);
          else
            v24 = 0;
          if (v23 >= 0x1B && *(_WORD *)((char *)a2 + v15 + v22 + 30))
            v25 = *((unsigned __int8 *)a2 + v15 + v16 + *(unsigned __int16 *)((char *)a2 + v15 + v22 + 30) + 4);
          else
            v25 = 0;
        }
        v26 = *(unsigned __int16 *)((char *)a2 + v15 + v22 + 18);
        if (v26 && *(_WORD *)((char *)a2 + v15 + v16 + v26 + 4))
        {
          *(_DWORD *)(a1 + 48) |= v21;
          if ((v25 & 0xFE) == 2)
            v27 = 1 << v14;
          else
            v27 = 0;
          *(_DWORD *)(a1 + 68) |= v27;
          v28 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v28 + 2) >= 0x11u && (v29 = *((unsigned __int16 *)v28 + 10), *((_WORD *)v28 + 10)))
          {
            v30 = 0;
            v31 = *((unsigned __int8 *)a2 + v15 + v16 + v29 + 4);
            v32 = 2;
            switch(v31)
            {
              case 0:
              case 1:
                v32 = 1;
                v30 = v31;
                break;
              case 3:
                v30 = 1;
                break;
              case 4:
                v30 = 2;
                break;
              case 5:
                goto LABEL_61;
              case 6:
                v30 = 1;
LABEL_61:
                v32 = 4;
                break;
              case 7:
                v30 = 0;
                v32 = 3;
                break;
              case 8:
                v30 = 3;
                break;
              default:
                break;
            }
          }
          else
          {
            v30 = 0;
            v32 = 2;
          }
          v33 = a1 + v13;
          *(_BYTE *)(v33 + 176) = v32;
          *(_BYTE *)(v33 + 177) = v30;
        }
        v34 = 0;
        if (v24 == 2)
          v35 = 1 << v14;
        else
          v35 = 0;
        *(_DWORD *)(a1 + 56) |= v35;
        if (v25)
          goto LABEL_35;
        goto LABEL_34;
      }
    }
LABEL_66:
    if (v7 >= 7
      && *(_WORD *)((char *)a2 + v8 + 6)
      && (v48 = *(_QWORD *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v8 + 6)), (v48 & 0xFFFFFFFE) != 0))
    {
      if (v48 > 0x7FF)
        LODWORD(v48) = 2048;
    }
    else
    {
LABEL_71:
      LODWORD(v48) = 1;
    }
    *(_DWORD *)(a1 + 80) = v48;
    v49 = (unsigned __int16 *)((char *)a2 - *a2);
    v50 = *v49;
    if (v50 < 0xB)
    {
      v52 = 1;
      *(_BYTE *)(a1 + 84) = 1;
      if (v50 < 9)
      {
LABEL_82:
        *(_BYTE *)(a1 + 85) = v52;
        return a1;
      }
    }
    else
    {
      if (v49[5])
        v51 = *((_BYTE *)a2 + v49[5]);
      else
        v51 = 1;
      *(_BYTE *)(a1 + 84) = v51;
    }
    v53 = v49[4];
    if (v53)
      v52 = *((_BYTE *)a2 + v53);
    else
      v52 = 1;
    goto LABEL_82;
  }
  return a1;
}

void AGX::FramebufferCompilerConfigGen3<AGX::G12::Encoders,AGX::G12::Classes,AGX::G12::ObjClasses>::buildDrawBufferState(uint64_t a1)
{
  unsigned int v2;
  int v3;
  int v4;
  char v5;
  uint64_t v6;
  _DWORD *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  unsigned __int8 v18;
  unsigned int v19;
  unsigned int v20;
  BOOL v21;
  int v22;
  unint64_t v23;

  if (AGX::G12::FramebufferCompilerConfig::isLargeMRTEmulationEnabled(void)::onceToken != -1)
    dispatch_once(&AGX::G12::FramebufferCompilerConfig::isLargeMRTEmulationEnabled(void)::onceToken, &__block_literal_global_6172);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(_BYTE *)(a1 + 40))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    while (2)
    {
      v6 = __clz(__rbit32(v2));
      v7 = *(_DWORD **)(a1 + 8 * v6 + 96);
      v8 = v7[8];
      if (v8 == 18)
        v8 = 9;
      v9 = v7[7];
      switch(v8)
      {
        case 2:
        case 4:
        case 5:
          goto LABEL_12;
        case 3:
          v10 = (v7[21] != 0) << 8;
          v11 = 1;
          goto LABEL_15;
        case 6:
        case 7:
        case 8:
        case 9:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 22:
          v9 *= 2;
          goto LABEL_12;
        case 10:
        case 11:
        case 17:
          v9 *= 4;
          goto LABEL_12;
        case 18:
        case 19:
        case 20:
        case 21:
          v9 = 4;
          goto LABEL_12;
        default:
          v9 = 0;
LABEL_12:
          v10 = 0;
          v11 = 1;
          switch(v8)
          {
            case 2:
            case 4:
            case 5:
              break;
            case 6:
            case 7:
            case 8:
            case 9:
            case 12:
            case 13:
            case 14:
            case 15:
            case 16:
            case 22:
              v10 = 0;
              v11 = 2;
              break;
            case 10:
            case 11:
            case 17:
            case 18:
            case 19:
            case 20:
            case 21:
              v10 = 0;
              v11 = 4;
              break;
            default:
              v10 = 0;
              v11 = 0;
              break;
          }
LABEL_15:
          v12 = v11 - 1;
          v13 = -v11;
          v14 = (v11 - 1 + v3) & -v11;
          v15 = (v14 + v9);
          v5 |= v15 > 0x40;
          v16 = (v12 + v4) & v13;
          v17 = v16 + v9;
          if ((v5 & 1) != 0)
          {
            v4 = v17;
            v18 = v16 + 64;
          }
          else
          {
            v18 = v14;
          }
          v19 = v10 & 0xFFF00FFF | *(_DWORD *)(a1 + 4 * v6) & 0xFFF00EE0 | v8 & 0x1F | (v18 << 12);
          *(_DWORD *)(a1 + 4 * v6) = v19;
          v20 = v19 & 0xFFFFF1FF | ((v7[19] & 7) << 9);
          *(_DWORD *)(a1 + 4 * v6) = v20;
          if ((v5 & 1) == 0)
            v3 = v15;
          *(_DWORD *)(a1 + 4 * v6) = v20 & 0xFFFFFF1F | (32 * (v7[7] & 7));
          v2 ^= 1 << v6;
          if (v2)
            continue;
          v21 = (v5 & 1) == 0;
          if ((v5 & 1) != 0)
            v22 = 0x2000000;
          else
            v22 = 0;
          v2 = *(unsigned __int8 *)(a1 + 40) | v22;
          v23 = (v15 + 7) & 0x1FFFFFFF8;
          if (!v21)
            v23 = 64;
          break;
      }
      break;
    }
  }
  else
  {
    v4 = 0;
    v23 = 0;
  }
  if (v23 >= 0x40)
    v23 = 64;
  if (v23 <= 8)
    LODWORD(v23) = 8;
  *(_DWORD *)(a1 + 32) = v2 | *(_DWORD *)(a1 + 32) & 0xFC000000 | ((_DWORD)v23 << 16) | ((*(_BYTE *)(a1 + 84) & 0xF) << 8) & 0xFFF | ((*(_BYTE *)(a1 + 85) & 0xF) << 12);
  *(_DWORD *)(a1 + 88) = v4;
  *(_DWORD *)(a1 + 44) = 0;
}

_QWORD *AGCTargetImpl<AGX::G12::Classes,AGX::G12::Encoders>::CreateProgramKeyFactory@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_1E7ECF468;
  *a1 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::G12::Classes,AGX::G12::Encoders>::CreateTGSizeToTempTable@<X0>(_DWORD *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;

  *a1 = 32;
  result = operator new[]();
  v5 = *a1;
  if ((_DWORD)v5)
  {
    v6 = 0;
    v7 = -53;
    do
    {
      if (v7 > 0xFFFFFFC7)
        v8 = 1024;
      else
        v8 = (2 * (0x1A00 / (v6 & 0x3FFFFFFF))) & 0x3FC0;
      *(_DWORD *)(result + 4 * v6++) = v8;
      v7 += 4;
    }
    while (v5 != v6);
  }
  *a2 = result;
  return result;
}

_QWORD *AGCTargetImpl<AGX::G12::Classes,AGX::G12::Encoders>::GetLegalizationPasses@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *result;
  uint64_t v6;
  int v7;
  const char *v8;
  const char *v9;
  char v10;
  const char *v11;
  char v12;
  const char *v13;
  char v14;
  const char *v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = "air-degenerate-vertex-amplification-emulation";
  v10 = 0;
  v11 = "air-raytracing-emulation,indirect-acceleration-structures";
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  v13 = "mtl-fetch-all-unaligned";
  v14 = 1;
  v15 = "air-bfloat-emulation";
  v16 = 1;
  result = malloc_type_malloc(0x20uLL, 0x10040436913F5uLL);
  v6 = 0;
  v7 = 0;
  *a2 = 0;
  do
  {
    if (LOBYTE((&v9)[v6 + 1]))
    {
      v8 = (&v9)[v6];
      *a2 = v7 + 1;
      result[v7++] = v8;
    }
    v6 += 2;
  }
  while (v6 != 8);
  *a3 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::G12::Classes,AGX::G12::Encoders>::requiresRayTracingEmulation()
{
  return 1;
}

uint64_t AGCTargetImpl<AGX::G12::Classes,AGX::G12::Encoders>::maxMSAASampleCount()
{
  return 4;
}

void AGX::ProgramKeyFactoryImpl<AGX::G12::Classes,AGX::G12::Encoders>::~ProgramKeyFactoryImpl()
{
  JUMPOUT(0x1CAA2D68CLL);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G12::Classes,AGX::G12::Encoders>::CreateVertexProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, int a6@<W6>, uint64_t a7@<X8>)
{
  uint64_t v14;
  int v15;
  __int16 v17;
  uint64_t v18;
  int v19;
  std::string v20;
  std::string v21;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v20 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v21, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v21 = *(std::string *)(a2 + 24);
  v14 = *(unsigned __int8 *)(a2 + 48);
  *(_DWORD *)(a7 + 8) = 3;
  *(_OWORD *)(a7 + 96) = 0u;
  *(_OWORD *)(a7 + 112) = 0u;
  *(_OWORD *)(a7 + 128) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 76) = 0u;
  *(_QWORD *)a7 = &off_1E7ED3720;
  *(std::string *)(a7 + 144) = v20;
  *(std::string *)(a7 + 168) = v21;
  *(_BYTE *)(a7 + 192) = v14;
  *(_QWORD *)(a7 + 56) = v14 << 18;
  AGX::Impl::VertexProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a7, a3);
  if (a7 + 96 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 96), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a7 + 120 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 120), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a6)
    v15 = 2;
  else
    v15 = 0;
  *(_DWORD *)(a7 + 88) = *(_DWORD *)(a7 + 88) & 0xFFFFFFFD | v15;
  v17 = 256;
  v18 = 0;
  v19 = 0;
  return AGX::GeometrySharedKey<_AGCVertexContextStateAGP,(_AGCStreamToken)3>::setDeviceOptions(a7, (unsigned __int8 *)&v17);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G12::Classes,AGX::G12::Encoders>::CreateObjectProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, int a3@<W3>, NSObject *a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  char *v11;
  int v12;
  int v13;
  __int16 v15;
  uint64_t v16;
  int v17;

  *(_DWORD *)(a7 + 8) = 9;
  *(_OWORD *)(a7 + 104) = 0u;
  v11 = (char *)(a7 + 104);
  *(_OWORD *)(a7 + 120) = 0u;
  *(_OWORD *)(a7 + 136) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 80) = 0u;
  *(_DWORD *)(a7 + 96) = 0;
  *(_QWORD *)a7 = &off_1E7ED37B0;
  if (a2)
    v12 = 2;
  else
    v12 = 0;
  if (a3)
    v13 = 4;
  else
    v13 = 0;
  *(_DWORD *)(a7 + 56) = v13 | v12;
  AGX::Impl::ObjectProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a7, a4);
  if (v11 != (char *)a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v11, *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a7 + 128 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 128), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  v15 = 256;
  v16 = 0;
  v17 = 0;
  return AGX::GeometrySharedKey<_AGCObjectContextStateAGP,(_AGCStreamToken)9>::setDeviceOptions(a7, (unsigned __int8 *)&v15);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G12::Classes,AGX::G12::Encoders>::CreateMeshProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, int a3@<W3>, int a4@<W4>, NSObject *a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, char a9)
{
  int v17;
  __int128 v18;
  int v19;
  int v20;
  int v21;
  __int16 v23;
  uint64_t v24;
  int v25;
  std::string v26;
  std::string v27;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v26, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v26 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v27, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v27 = *(std::string *)(a2 + 24);
  v17 = *(unsigned __int8 *)(a2 + 48);
  *(_OWORD *)(a8 + 104) = 0u;
  *(_DWORD *)(a8 + 8) = 10;
  *(_OWORD *)(a8 + 120) = 0u;
  *(_OWORD *)(a8 + 136) = 0u;
  *(_OWORD *)(a8 + 16) = 0u;
  *(_OWORD *)(a8 + 32) = 0u;
  *(_OWORD *)(a8 + 48) = 0u;
  *(_OWORD *)(a8 + 64) = 0u;
  *(_OWORD *)(a8 + 80) = 0u;
  *(_DWORD *)(a8 + 96) = 0;
  *(_QWORD *)a8 = &off_1E7ED3768;
  *(std::string *)(a8 + 152) = v26;
  v18 = *(_OWORD *)&v27.__r_.__value_.__l.__data_;
  *(_QWORD *)(a8 + 192) = *((_QWORD *)&v27.__r_.__value_.__l + 2);
  if (a3)
    v19 = 128;
  else
    v19 = 0;
  if (a4)
    v20 = 256;
  else
    v20 = 0;
  *(_OWORD *)(a8 + 176) = v18;
  *(_BYTE *)(a8 + 200) = v17;
  *(_DWORD *)(a8 + 56) = v20 | v19 | (16 * v17);
  AGX::Impl::MeshProgramKey::initCommon((AGX *)a8, a1);
  *(_DWORD *)(a8 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a8, a5);
  if (a8 + 104 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 104), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  if (a8 + 128 != a7)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 128), *(char **)a7, *(_QWORD *)(a7 + 8), (uint64_t)(*(_QWORD *)(a7 + 8) - *(_QWORD *)a7) >> 5);
  if (a9)
    v21 = 2;
  else
    v21 = 0;
  *(_DWORD *)(a8 + 96) = *(_DWORD *)(a8 + 96) & 0xFFFFFFFD | v21;
  v23 = 256;
  v24 = 0;
  v25 = 0;
  return AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setDeviceOptions(a8, (unsigned __int8 *)&v23);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G12::Classes,AGX::G12::Encoders>::CreateFragmentProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  char *v12;
  MTLPixelFormat v13;
  unsigned __int16 *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char v28;
  char v29;
  __int128 v30;
  int v31;
  unsigned int v32;
  int v33;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[31];
  int v43;
  __int16 v44;
  int v45;
  _OWORD v46[7];

  *(_DWORD *)(a6 + 8) = 4;
  *(_QWORD *)(a6 + 24) = 0;
  *(_QWORD *)(a6 + 32) = 0;
  *(_QWORD *)(a6 + 16) = 0;
  *(_OWORD *)(a6 + 232) = 0u;
  v12 = (char *)(a6 + 232);
  *(_QWORD *)a6 = &off_1E7ED37F8;
  *(_OWORD *)(a6 + 40) = 0u;
  *(_OWORD *)(a6 + 56) = 0u;
  *(_OWORD *)(a6 + 72) = 0u;
  *(_OWORD *)(a6 + 88) = 0u;
  *(_OWORD *)(a6 + 104) = 0u;
  *(_OWORD *)(a6 + 120) = 0u;
  *(_OWORD *)(a6 + 136) = 0u;
  *(_OWORD *)(a6 + 152) = 0u;
  *(_OWORD *)(a6 + 168) = 0u;
  *(_OWORD *)(a6 + 184) = 0u;
  *(_OWORD *)(a6 + 200) = 0u;
  *(_OWORD *)(a6 + 209) = 0u;
  *(_OWORD *)(a6 + 248) = 0u;
  *(_OWORD *)(a6 + 264) = 0u;
  v41 = 0u;
  memset(v42, 0, sizeof(v42));
  v39 = 0u;
  v40 = 0u;
  v43 = 1;
  v44 = 0;
  v45 = 0;
  memset(v46, 0, 96);
  bzero(&v39, 0x28uLL);
  if (!a1)
    goto LABEL_22;
  v38 = a2;
  v14 = (unsigned __int16 *)((char *)a1 - *(int *)a1);
  v15 = *v14;
  if (v15 >= 0x17)
  {
    v16 = v14[11];
    if (!v14[11])
      goto LABEL_14;
    v17 = *(unsigned int *)((char *)a1 + v16);
    v18 = (unsigned int *)((char *)a1 + v16 + v17);
    v19 = *v18;
    if (!(_DWORD)v19)
      goto LABEL_14;
    v35 = a3;
    v36 = a4;
    v37 = a5;
    v20 = 0;
    v21 = DWORD2(v41);
    v22 = (char *)a1 + v16 + v17;
    do
    {
      v23 = &v22[4 * v20];
      v24 = *((unsigned int *)v23 + 1);
      v25 = (char *)v18 + v24 - *(int *)&v23[v24 + 4];
      if (*((unsigned __int16 *)v25 + 2) >= 5u)
      {
        v26 = *((unsigned __int16 *)v25 + 4);
        if (v26)
        {
          v27 = (char *)v18 + v24 + v26;
          if (*((_WORD *)v27 + 2))
          {
            *((_QWORD *)v46 + v20) = AGX::G12::TextureFormatTable::chooseTextureFormatCPP((AGX::G12::TextureFormatTable *)*((unsigned __int16 *)v27 + 2), v13);
            v21 |= 1 << v20;
          }
        }
      }
      if (v20 > 6)
        break;
      ++v20;
      ++v18;
    }
    while (v20 < v19);
    DWORD2(v41) = v21;
    a4 = v36;
    a5 = v37;
    a3 = v35;
  }
  if (v15 <= 0xC)
  {
    v29 = 1;
    LOBYTE(v44) = 1;
    a2 = v38;
LABEL_21:
    HIBYTE(v44) = v29;
    goto LABEL_22;
  }
LABEL_14:
  if (v14[6])
    v28 = *((_BYTE *)a1 + v14[6]);
  else
    v28 = 1;
  a2 = v38;
  LOBYTE(v44) = v28;
  HIBYTE(v44) = v28;
  if (v15 >= 0xF)
  {
    if (v14[7])
    {
      v29 = *((_BYTE *)a1 + v14[7]);
      if (v29)
        goto LABEL_21;
    }
  }
LABEL_22:
  AGX::FramebufferCompilerConfigGen3<AGX::G12::Encoders,AGX::G12::Classes,AGX::G12::ObjClasses>::buildDrawBufferState((uint64_t)&v39);
  v30 = v40;
  *(_OWORD *)(a6 + 112) = v39;
  *(_OWORD *)(a6 + 128) = v30;
  *(_QWORD *)(a6 + 144) = v41;
  AGX::Impl::FragmentProgramKey::initCommon((AGX *)a6, a1);
  v31 = *(_DWORD *)(a6 + 104);
  v32 = *(_DWORD *)(a6 + 100) & 0xFFFFFF7F;
  *(_DWORD *)(a6 + 40) &= ~0x10u;
  if (a2)
    v33 = 256;
  else
    v33 = 0;
  *(_DWORD *)(a6 + 100) = v32;
  *(_DWORD *)(a6 + 104) = v31 & 0xFFFFFEFF | v33;
  AGX::Impl::FragmentProgramKey::setSerializedDescriptor((AGX::Impl::FragmentProgramKey *)a6, a3);
  if (v12 != (char *)a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v12, *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a6 + 256 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a6 + 256), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  LOWORD(v39) = 256;
  *(_QWORD *)((char *)&v39 + 2) = 0;
  *(_DWORD *)((char *)&v39 + 10) = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a6, (unsigned __int8 *)&v39);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G12::Classes,AGX::G12::Encoders>::CreateComputeProgramKey@<X0>(AGX *a1@<X1>, NSObject *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  __int16 v11;
  uint64_t v12;
  int v13;

  *(_DWORD *)(a5 + 8) = 6;
  *(_QWORD *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  *(_QWORD *)(a5 + 32) = 0;
  *(_QWORD *)(a5 + 40) = 0;
  *(_QWORD *)a5 = &off_1E7ED3878;
  *(_QWORD *)(a5 + 48) = 0;
  *(_QWORD *)(a5 + 56) = 0;
  std::string::basic_string[abi:nn180100]<0>((_QWORD *)(a5 + 64), (char *)&unk_1C3E4D9BB);
  *(_BYTE *)(a5 + 88) = 0;
  *(_OWORD *)(a5 + 96) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_OWORD *)(a5 + 128) = 0u;
  AGX::Impl::ComputeProgramKey::initCommon((AGX *)a5, a1);
  *(int8x8_t *)(a5 + 52) = vand_s8(*(int8x8_t *)(a5 + 52), (int8x8_t)0xFFFFFFFEFFFFFF7FLL);
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a5, a2);
  if (a5 + 96 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 96), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  if (a5 + 120 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 120), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  v11 = 256;
  v12 = 0;
  v13 = 0;
  return AGX::Impl::ComputeProgramKey::setDeviceOptions(a5, (unsigned __int8 *)&v11);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G12::Classes,AGX::G12::Encoders>::CreateTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, unint64_t a4@<X8>)
{
  MTLPixelFormat v8;
  unsigned __int16 *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char v23;
  char v24;
  __int128 v25;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[31];
  int v32;
  __int16 v33;
  int v34;
  _OWORD v35[7];

  *(_DWORD *)(a4 + 8) = 5;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)a4 = &off_1E7ED3838;
  *(_OWORD *)(a4 + 40) = 0u;
  *(_OWORD *)(a4 + 56) = 0u;
  *(_OWORD *)(a4 + 72) = 0u;
  *(_OWORD *)(a4 + 88) = 0u;
  *(_OWORD *)(a4 + 104) = 0u;
  *(_OWORD *)(a4 + 120) = 0u;
  *(_OWORD *)(a4 + 136) = 0u;
  *(_OWORD *)(a4 + 152) = 0u;
  *(_OWORD *)(a4 + 168) = 0u;
  *(_OWORD *)(a4 + 184) = 0u;
  *(_QWORD *)(a4 + 200) = 0;
  v30 = 0u;
  memset(v31, 0, sizeof(v31));
  v28 = 0u;
  v29 = 0u;
  v32 = 1;
  v33 = 0;
  v34 = 0;
  memset(v35, 0, 96);
  bzero(&v28, 0x28uLL);
  if (!a1)
    goto LABEL_22;
  v9 = (unsigned __int16 *)((char *)a1 - *a1);
  v10 = *v9;
  if (v10 < 0xF)
    goto LABEL_13;
  v11 = v9[7];
  if (v9[7])
  {
    v12 = *(unsigned int *)((char *)a1 + v11);
    v13 = (unsigned int *)((char *)a1 + v11 + v12);
    v14 = *v13;
    if ((_DWORD)v14)
    {
      v15 = 0;
      v16 = DWORD2(v30);
      v27 = a3;
      v17 = (char *)a1 + v11 + v12;
      do
      {
        v18 = &v17[4 * v15];
        v19 = *((unsigned int *)v18 + 1);
        v20 = (char *)v13 + v19 - *(int *)&v18[v19 + 4];
        if (*((unsigned __int16 *)v20 + 2) >= 5u)
        {
          v21 = *((unsigned __int16 *)v20 + 4);
          if (v21)
          {
            v22 = (char *)v13 + v19 + v21;
            if (*((_WORD *)v22 + 2))
            {
              *((_QWORD *)v35 + v15) = AGX::G12::TextureFormatTable::chooseTextureFormatCPP((AGX::G12::TextureFormatTable *)*((unsigned __int16 *)v22 + 2), v8);
              v16 |= 1 << v15;
            }
          }
        }
        if (v15 > 6)
          break;
        ++v15;
        ++v13;
      }
      while (v15 < v14);
      DWORD2(v30) = v16;
      a3 = v27;
LABEL_13:
      if (v10 <= 0xA)
      {
        v24 = 1;
        LOBYTE(v33) = 1;
LABEL_21:
        HIBYTE(v33) = v24;
        goto LABEL_22;
      }
    }
  }
  if (v9[5])
    v23 = *((_BYTE *)a1 + v9[5]);
  else
    v23 = 1;
  LOBYTE(v33) = v23;
  HIBYTE(v33) = v23;
  if (v10 >= 0xD)
  {
    if (v9[6])
    {
      v24 = *((_BYTE *)a1 + v9[6]);
      if (v24)
        goto LABEL_21;
    }
  }
LABEL_22:
  AGX::FramebufferCompilerConfigGen3<AGX::G12::Encoders,AGX::G12::Classes,AGX::G12::ObjClasses>::buildDrawBufferState((uint64_t)&v28);
  v25 = v29;
  *(_OWORD *)(a4 + 112) = v28;
  *(_OWORD *)(a4 + 128) = v25;
  *(_QWORD *)(a4 + 144) = v30;
  AGX::Impl::TileProgramKey::initCommon(a4, a1);
  *(_DWORD *)(a4 + 100) &= ~0x80u;
  if (a4 + 160 != a2)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 160), *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 5);
  if (a4 + 184 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 184), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  LOWORD(v28) = 256;
  *(_QWORD *)((char *)&v28 + 2) = 0;
  *(_DWORD *)((char *)&v28 + 10) = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a4, (unsigned __int8 *)&v28);
}

double AGX::ProgramKeyFactoryImpl<AGX::G12::Classes,AGX::G12::Encoders>::CreateBackgroundObjectProgramKey@<D0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  double result;
  __int128 v4;
  int v5;
  _OWORD v6[2];
  uint64_t v7;
  int v8;
  unsigned __int8 v9;
  unsigned __int16 v10;
  unsigned __int8 v11;

  *(_DWORD *)(a2 + 8) = 13;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFAA8;
  AGX::FramebufferCompilerConfig<AGX::G12::Encoders,AGX::G12::Classes,AGX::G12::ObjClasses>::FramebufferCompilerConfig((uint64_t)v6, a1);
  AGX::FramebufferCompilerConfigGen3<AGX::G12::Encoders,AGX::G12::Classes,AGX::G12::ObjClasses>::buildDrawBufferState((uint64_t)v6);
  result = *(double *)v6;
  v4 = v6[1];
  *(_OWORD *)(a2 + 40) = v6[0];
  *(_OWORD *)(a2 + 56) = v4;
  *(_QWORD *)(a2 + 72) = v7;
  *(_QWORD *)(a2 + 80) = 0;
  v5 = v10 | (v11 << 16) | (v8 << 24);
  *(_WORD *)(a2 + 84) = v9;
  *(_DWORD *)(a2 + 80) = v5;
  return result;
}

void AGX::ProgramKeyFactoryImpl<AGX::G12::Classes,AGX::G12::Encoders>::CreateEndOfTileProgramKey(int *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  char v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  char *v20;
  unsigned __int8 v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  char *v27;
  unsigned __int8 v28;
  _OWORD v29[2];
  uint64_t v30;
  _OWORD v31[2];
  uint64_t v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  unsigned __int8 v37;
  unsigned __int8 v38;
  unsigned int v39;

  *(_DWORD *)(a2 + 8) = 19;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)a2 = off_1E7ECFAE8;
  *(_OWORD *)(a2 + 40) = 0u;
  v3 = a2 + 40;
  *(_QWORD *)(a2 + 16) = 0;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(_OWORD *)(a2 + 88) = 0u;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_QWORD *)(a2 + 118) = 0;
  AGX::FramebufferCompilerConfig<AGX::G12::Encoders,AGX::G12::Classes,AGX::G12::ObjClasses>::FramebufferCompilerConfig((uint64_t)v31, a1);
  AGX::FramebufferCompilerConfigGen3<AGX::G12::Encoders,AGX::G12::Classes,AGX::G12::ObjClasses>::buildDrawBufferState((uint64_t)v31);
  v29[0] = v31[0];
  v29[1] = v31[1];
  v4 = v32;
  v30 = v32;
  v5 = v39;
  v6 = v33;
  v7 = v34;
  v8 = ((unint64_t)BYTE2(v32) << 36) | ((unint64_t)((unsigned __int16)v32 >> 12) << 32) | 0x40000000000000;
  *(_QWORD *)(a2 + 112) = v8;
  if (v6)
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = (unsigned __int16)v4 >> 12;
    v13 = v38;
    v14 = HIWORD(v4) & 0x1FF;
    if (v5 < 2)
      v15 = 2;
    else
      v15 = 3;
    v16 = v37 & ~v36 | v35;
    v17 = v36 & ~v37 | v35;
    do
    {
      v18 = __clz(__rbit32(v6));
      v19 = *((_DWORD *)v29 + v18);
      v20 = (char *)v31 + 2 * v18;
      v21 = v15;
      if ((v20[161] & 1) == 0)
      {
        v21 = 5;
        switch(v20[160])
        {
          case 1:
            v21 = 2;
            break;
          case 2:
            if ((v20[161] & 2) != 0)
              v21 = 4;
            else
              v21 = 2;
            break;
          case 3:
            break;
          case 4:
            v21 = v15;
            break;
          default:
            v21 = -1;
            break;
        }
      }
      v22 = (v19 >> 12) / v14;
      v23 = (*((_DWORD *)v29 + v18) & 0x1F) << 8;
      v24 = (v19 << 21) & 0x1C000000;
      *(_DWORD *)(v3 + 4 * v18) = *(_DWORD *)(v3 + 4 * v18) & 0xE3000000 | (v21 << 16) | v23 | v24 | v22;
      v9 |= 1 << v18;
      v10 |= (1 << v18) & v16;
      v25 = v13 & (1 << v18);
      v11 |= v25;
      if ((v7 & (1 << v18)) != 0)
      {
        if (v12 <= 1)
          v26 = 0;
        else
          v26 = (v19 << 16) & 0x1000000;
        v27 = (char *)v31 + 2 * v18;
        v28 = v15;
        if ((v27[177] & 1) == 0)
        {
          v28 = 5;
          switch(v27[176])
          {
            case 1:
              v28 = 2;
              break;
            case 2:
              if ((v27[177] & 2) != 0)
                v28 = 4;
              else
                v28 = 2;
              break;
            case 3:
              break;
            case 4:
              v28 = v15;
              break;
            default:
              v28 = -1;
              break;
          }
        }
        *(_DWORD *)(v3 + 4 * (v18 + 8)) = *(_DWORD *)(v3 + 4 * (v18 + 8)) & 0xE2000000 | v26 | (v28 << 16) | v23 | v24 | v22;
        v9 |= 256 << v18;
        v10 |= ((v17 >> v18) & 1) << (v18 + 8);
        v11 |= (v25 != 0) << (v18 + 8);
      }
      v6 ^= 1 << v18;
    }
    while (v6);
    v8 = (unint64_t)*(unsigned int *)(a2 + 116) << 32;
  }
  else
  {
    LOWORD(v11) = 0;
    LOWORD(v10) = 0;
    LOWORD(v9) = 0;
  }
  *(_WORD *)(a2 + 120) = v9;
  *(_WORD *)(a2 + 122) = v10;
  *(_WORD *)(a2 + 124) = v11;
  *(_QWORD *)(a2 + 112) = v8 | (unsigned __int16)(v9 & ~(_WORD)v10) | ((unint64_t)(unsigned __int16)(v9 & v11) << 16);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G12::Classes,AGX::G12::Encoders>::CreateBVHBuilderProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 8) = 24;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFB68;
  *(_DWORD *)(a2 + 40) = 0;
  return AGX::BVHBuilderProgramKey::initializeWithDescriptor(a2, a1);
}

uint64_t AGX::FramebufferCompilerConfig<AGX::G13::Encoders,AGX::G13::Classes,AGX::G13::ObjClasses>::FramebufferCompilerConfig(uint64_t a1, int *a2)
{
  MTLPixelFormat v4;
  uint64_t v5;
  char *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  __int32 v24;
  int v25;
  uint64_t v26;
  int v27;
  char *v28;
  uint64_t v29;
  char v30;
  int v31;
  char v32;
  uint64_t v33;
  int v34;
  int v35;
  int32x2_t v36;
  int v37;
  char *v38;
  uint64_t v39;
  char v40;
  int v41;
  char *v42;
  char v43;
  char v44;
  char v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  unsigned __int16 *v49;
  unsigned int v50;
  char v51;
  char v52;
  uint64_t v53;

  *(_OWORD *)(a1 + 63) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 80) = 1;
  *(_WORD *)(a1 + 84) = 0;
  *(_DWORD *)(a1 + 88) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  bzero((void *)a1, 0x28uLL);
  if (a2)
  {
    v5 = *a2;
    v6 = (char *)a2 - v5;
    v7 = *(unsigned __int16 *)((char *)a2 - v5);
    if (v7 < 5)
      goto LABEL_71;
    v8 = -v5;
    v9 = *((unsigned __int16 *)v6 + 2);
    if (*((_WORD *)v6 + 2))
    {
      v10 = (char *)a2 + v9;
      v11 = *(unsigned int *)((char *)a2 + v9);
      v12 = *(unsigned int *)((char *)a2 + v9 + v11);
      if ((_DWORD)v12)
      {
        v13 = 0;
        v14 = 0;
        v15 = v9 + v11;
        while (1)
        {
          v16 = *(unsigned int *)((char *)a2 + v15 + 4);
          v17 = (char *)a2 + v15 + v16;
          v18 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v18 + 2) >= 5u)
          {
            v19 = *((unsigned __int16 *)v18 + 4);
            if (v19)
            {
              v20 = (char *)a2 + v15 + v16 + v19;
              if (*((_WORD *)v20 + 2))
                break;
            }
          }
LABEL_46:
          if (v14 <= 6)
          {
            ++v14;
            v13 += 2;
            v15 += 4;
            if (v14 < v12)
              continue;
          }
          v47 = *a2;
          v8 = -v47;
          v7 = *(unsigned __int16 *)((char *)a2 - v47);
          goto LABEL_66;
        }
        *(_QWORD *)(a1 + 8 * v14 + 96) = AGX::G13::TextureFormatTable::chooseTextureFormatCPP((AGX::G13::TextureFormatTable *)*((unsigned __int16 *)v20 + 2), v4);
        v21 = 1 << v14;
        *(_DWORD *)(a1 + 40) |= 1 << v14;
        v22 = v16 - *((int *)v17 + 1);
        v23 = *(unsigned __int16 *)((char *)a2 + v15 + v22 + 4);
        if (v23 < 0x19)
        {
          v25 = 0;
          v24 = 0;
          if (v23 < 0xF)
          {
LABEL_34:
            v25 = 0;
            v34 = 1 << v14;
LABEL_35:
            *(_DWORD *)(a1 + 52) |= v34;
            v36.i32[0] = v24;
            v36.i32[1] = v25 & 0xFFFFFFFD;
            *(int8x8_t *)(a1 + 60) = vorr_s8(*(int8x8_t *)(a1 + 60), vand_s8((int8x8_t)vdup_n_s32(v21), (int8x8_t)vceq_s32(v36, (int32x2_t)0x100000001)));
            if (v25 == 4)
              v37 = 1 << v14;
            else
              v37 = 0;
            *(_DWORD *)(a1 + 72) |= v37;
            v38 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
            if (*((unsigned __int16 *)v38 + 2) >= 7u && (v39 = *((unsigned __int16 *)v38 + 5)) != 0)
            {
              v40 = 0;
              v41 = *((unsigned __int8 *)a2 + v15 + v16 + v39 + 4);
              v42 = (char *)(a1 + v13 + 160);
              v43 = 2;
              v44 = 1;
              switch(v41)
              {
                case 0:
                case 1:
                  v43 = 1;
                  v40 = v41;
                  goto LABEL_52;
                case 3:
                  goto LABEL_57;
                case 4:
                  v45 = 2;
                  goto LABEL_43;
                case 5:
                  goto LABEL_51;
                case 6:
                  v40 = 1;
LABEL_51:
                  v43 = 4;
                  goto LABEL_52;
                case 7:
                  *v42 = 3;
                  *(_BYTE *)(a1 + v13 + 161) = 0;
LABEL_55:
                  v46 = 3;
                  break;
                case 8:
                  v44 = 3;
LABEL_57:
                  *v42 = 2;
                  *(_BYTE *)(a1 + v13 + 161) = v44;
LABEL_58:
                  *(_BYTE *)(a1 + 78) |= v21;
                  goto LABEL_44;
                default:
LABEL_52:
                  *v42 = v43;
                  *(_BYTE *)(a1 + v13 + 161) = v40;
                  v46 = 1;
                  switch(v41)
                  {
                    case 0:
                      goto LABEL_45;
                    case 1:
                      *(_BYTE *)(a1 + 78) |= v21;
                      v46 = 1;
                      break;
                    case 3:
                    case 5:
                    case 6:
                    case 8:
                      goto LABEL_58;
                    case 7:
                      goto LABEL_55;
                    default:
                      goto LABEL_44;
                  }
                  break;
              }
            }
            else
            {
              v45 = 0;
              v42 = (char *)(a1 + 2 * v14 + 160);
LABEL_43:
              *v42 = 2;
              *(_BYTE *)(a1 + v13 + 161) = v45;
LABEL_44:
              v46 = 2;
            }
LABEL_45:
            *(_WORD *)(a1 + 76) |= v46 << v13;
            v12 = *(unsigned int *)&v10[v11];
            goto LABEL_46;
          }
        }
        else
        {
          if (*(_WORD *)((char *)a2 + v15 + v22 + 28))
            v24 = *((unsigned __int8 *)a2 + v15 + v16 + *(unsigned __int16 *)((char *)a2 + v15 + v22 + 28) + 4);
          else
            v24 = 0;
          if (v23 >= 0x1B && *(_WORD *)((char *)a2 + v15 + v22 + 30))
            v25 = *((unsigned __int8 *)a2 + v15 + v16 + *(unsigned __int16 *)((char *)a2 + v15 + v22 + 30) + 4);
          else
            v25 = 0;
        }
        v26 = *(unsigned __int16 *)((char *)a2 + v15 + v22 + 18);
        if (v26 && *(_WORD *)((char *)a2 + v15 + v16 + v26 + 4))
        {
          *(_DWORD *)(a1 + 48) |= v21;
          if ((v25 & 0xFE) == 2)
            v27 = 1 << v14;
          else
            v27 = 0;
          *(_DWORD *)(a1 + 68) |= v27;
          v28 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v28 + 2) >= 0x11u && (v29 = *((unsigned __int16 *)v28 + 10), *((_WORD *)v28 + 10)))
          {
            v30 = 0;
            v31 = *((unsigned __int8 *)a2 + v15 + v16 + v29 + 4);
            v32 = 2;
            switch(v31)
            {
              case 0:
              case 1:
                v32 = 1;
                v30 = v31;
                break;
              case 3:
                v30 = 1;
                break;
              case 4:
                v30 = 2;
                break;
              case 5:
                goto LABEL_61;
              case 6:
                v30 = 1;
LABEL_61:
                v32 = 4;
                break;
              case 7:
                v30 = 0;
                v32 = 3;
                break;
              case 8:
                v30 = 3;
                break;
              default:
                break;
            }
          }
          else
          {
            v30 = 0;
            v32 = 2;
          }
          v33 = a1 + v13;
          *(_BYTE *)(v33 + 176) = v32;
          *(_BYTE *)(v33 + 177) = v30;
        }
        v34 = 0;
        if (v24 == 2)
          v35 = 1 << v14;
        else
          v35 = 0;
        *(_DWORD *)(a1 + 56) |= v35;
        if (v25)
          goto LABEL_35;
        goto LABEL_34;
      }
    }
LABEL_66:
    if (v7 >= 7
      && *(_WORD *)((char *)a2 + v8 + 6)
      && (v48 = *(_QWORD *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v8 + 6)), (v48 & 0xFFFFFFFE) != 0))
    {
      if (v48 > 0x7FF)
        LODWORD(v48) = 2048;
    }
    else
    {
LABEL_71:
      LODWORD(v48) = 1;
    }
    *(_DWORD *)(a1 + 80) = v48;
    v49 = (unsigned __int16 *)((char *)a2 - *a2);
    v50 = *v49;
    if (v50 < 0xB)
    {
      v52 = 1;
      *(_BYTE *)(a1 + 84) = 1;
      if (v50 < 9)
      {
LABEL_82:
        *(_BYTE *)(a1 + 85) = v52;
        return a1;
      }
    }
    else
    {
      if (v49[5])
        v51 = *((_BYTE *)a2 + v49[5]);
      else
        v51 = 1;
      *(_BYTE *)(a1 + 84) = v51;
    }
    v53 = v49[4];
    if (v53)
      v52 = *((_BYTE *)a2 + v53);
    else
      v52 = 1;
    goto LABEL_82;
  }
  return a1;
}

uint64_t AGX::FramebufferCompilerConfig<AGX::G13::Encoders,AGX::G13::Classes,AGX::G13::ObjClasses>::partitionSizeFromFormatAndCompCount(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 2:
    case 3:
    case 4:
    case 5:
      return a2;
    case 6:
    case 7:
    case 8:
    case 9:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 22:
      a2 = (2 * a2);
      break;
    case 10:
    case 11:
    case 17:
      a2 = (4 * a2);
      break;
    case 18:
    case 19:
    case 20:
    case 21:
      a2 = 4;
      break;
    default:
      a2 = 0;
      break;
  }
  return a2;
}

uint64_t AGX::FramebufferCompilerConfigGen3<AGX::G13::Encoders,AGX::G13::Classes,AGX::G13::ObjClasses>::buildDrawBufferState(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  char v12;
  uint64_t result;
  uint64_t v14;
  unsigned int *v15;
  uint64_t v16;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  unsigned __int8 v28;
  int v29;
  unsigned int v30;
  unsigned int v31;
  unint64_t v32;
  int v33;
  int v34;
  int v35;
  unsigned int v36;
  int v37;

  v2 = 0;
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = v3;
  do
  {
    v5 = v4;
    if (!v4)
      break;
    v6 = __clz(__rbit32(v4));
    v7 = *(_QWORD *)(a1 + 8 * v6 + 96);
    if (*(_DWORD *)(v7 + 32) == 18)
      v8 = 9;
    else
      v8 = *(_DWORD *)(v7 + 32);
    v2 += AGX::FramebufferCompilerConfig<AGX::G13::Encoders,AGX::G13::Classes,AGX::G13::ObjClasses>::partitionSizeFromFormatAndCompCount(v8, *(unsigned int *)(v7 + 28));
    v9 = 1 << v6;
    if (v2 > 0x40)
      v9 = 0;
    v4 = v9 ^ v5;
  }
  while (v2 < 0x41);
  if (v3)
  {
    LODWORD(v10) = 0;
    v11 = 0;
    v12 = 0;
    LODWORD(result) = 0;
    v36 = v5;
    do
    {
      v14 = __clz(__rbit32(v3));
      v15 = *(unsigned int **)(a1 + 8 * v14 + 96);
      v16 = v15[7];
      if (v15[8] == 18 && v5 == 0)
        v18 = 9;
      else
        v18 = v15[8];
      v19 = 1 << v14;
      if (v18 == 18)
        v20 = 1 << v14;
      else
        v20 = 0;
      if (v18 == 3)
      {
        v21 = (v15[21] != 0) << 8;
        v22 = 1;
      }
      else
      {
        v37 = result;
        v23 = v20;
        LODWORD(result) = AGX::FramebufferCompilerConfig<AGX::G13::Encoders,AGX::G13::Classes,AGX::G13::ObjClasses>::partitionSizeFromFormatAndCompCount(v18, v16);
        v20 = v23;
        v19 = 1 << v14;
        LODWORD(v16) = result;
        v5 = v36;
        LODWORD(result) = v37;
        v21 = 0;
        v22 = 1;
        switch(v18)
        {
          case 2:
          case 4:
          case 5:
            break;
          case 6:
          case 7:
          case 8:
          case 9:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 22:
            v21 = 0;
            v22 = 2;
            break;
          case 10:
          case 11:
          case 17:
          case 18:
          case 19:
          case 20:
          case 21:
            v21 = 0;
            v22 = 4;
            break;
          default:
            v21 = 0;
            v22 = 0;
            break;
        }
      }
      result = v20 | result;
      v24 = v22 - 1;
      v25 = -v22;
      v26 = (v24 + v10) & v25;
      v12 |= (v26 + v16) > 0x40;
      v27 = (v24 + v11) & v25;
      v28 = v27 + 64;
      v29 = v27 + v16;
      if ((v12 & 1) != 0)
        v11 = v29;
      else
        v28 = v26;
      v30 = v21 & 0xFFF00FFF | *(_DWORD *)(a1 + 4 * v14) & 0xFFF00EE0 | v18 & 0x1F | (v28 << 12);
      *(_DWORD *)(a1 + 4 * v14) = v30;
      v31 = v30 & 0xFFFFF1FF | ((v15[19] & 7) << 9);
      *(_DWORD *)(a1 + 4 * v14) = v31;
      if ((v12 & 1) != 0)
        v10 = v10;
      else
        v10 = (v26 + v16);
      *(_DWORD *)(a1 + 4 * v14) = v31 & 0xFFFFFF1F | (32 * (v15[7] & 7));
      v3 ^= v19;
    }
    while (v3);
    v32 = 64;
    if (((v10 + 7) & 0x1FFFFFFC0) == 0)
      v32 = (v10 + 7) & 0x1FFFFFFF8;
    if (v32 <= 8)
      LODWORD(v32) = 8;
    v33 = (_DWORD)v32 << 16;
    if ((v12 & 1) != 0)
    {
      v33 = 0x400000;
      v34 = 0x2000000;
    }
    else
    {
      v34 = 0;
    }
    v35 = *(unsigned __int8 *)(a1 + 40) | v34;
  }
  else
  {
    v11 = 0;
    result = 0;
    v35 = 0;
    v33 = 0x80000;
  }
  *(_DWORD *)(a1 + 32) = v35 | ((*(_BYTE *)(a1 + 84) & 0xF) << 8) | *(_DWORD *)(a1 + 32) & 0xFC000000 | v33 | ((*(_BYTE *)(a1 + 85) & 0xF) << 12);
  *(_DWORD *)(a1 + 88) = v11;
  *(_DWORD *)(a1 + 44) = result;
  return result;
}

uint64_t AGX::PBEStateEncoderGen7<kAGXRevG13>::StateFields::getDimensionality(int a1, char a2, unsigned int a3)
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  BOOL v5;

  if (a3 < 2)
    v3 = 2;
  else
    v3 = 3;
  if ((a2 & 1) != 0)
  {
    if ((a2 & 2) != 0)
      v4 = 8;
    else
      v4 = v3;
    v5 = a1 == 4;
LABEL_11:
    if (v5)
      return v3;
  }
  else
  {
    v4 = 5;
    switch(a1)
    {
      case 1:
        v4 = 2;
        break;
      case 2:
        v5 = (a2 & 2) == 0;
        v4 = 4;
        v3 = 2;
        goto LABEL_11;
      case 3:
        return v4;
      case 4:
        v4 = v3;
        break;
      default:
        v4 = -1;
        break;
    }
  }
  return v4;
}

_QWORD *AGCTargetImpl<AGX::G13::Classes,AGX::G13::Encoders>::CreateProgramKeyFactory@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_1E7ECF508;
  *a1 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::G13::Classes,AGX::G13::Encoders>::CreateTGSizeToTempTable@<X0>(_DWORD *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;

  *a1 = 32;
  result = operator new[]();
  v5 = *a1;
  if ((_DWORD)v5)
  {
    v6 = 0;
    v7 = -53;
    do
    {
      if (v7 > 0xFFFFFFC7)
        v8 = 1024;
      else
        v8 = (2 * (0x1A00 / (v6 & 0x3FFFFFFF))) & 0x3FC0;
      *(_DWORD *)(result + 4 * v6++) = v8;
      v7 += 4;
    }
    while (v5 != v6);
  }
  *a2 = result;
  return result;
}

_QWORD *AGCTargetImpl<AGX::G13::Classes,AGX::G13::Encoders>::GetLegalizationPasses@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *result;
  uint64_t v6;
  int v7;
  const char *v8;
  const char *v9;
  char v10;
  const char *v11;
  char v12;
  const char *v13;
  char v14;
  const char *v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = "air-degenerate-vertex-amplification-emulation";
  v10 = 0;
  v11 = "air-raytracing-emulation,indirect-acceleration-structures";
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  v13 = "mtl-fetch-all-unaligned";
  v14 = 1;
  v15 = "air-bfloat-emulation";
  v16 = 1;
  result = malloc_type_malloc(0x20uLL, 0x10040436913F5uLL);
  v6 = 0;
  v7 = 0;
  *a2 = 0;
  do
  {
    if (LOBYTE((&v9)[v6 + 1]))
    {
      v8 = (&v9)[v6];
      *a2 = v7 + 1;
      result[v7++] = v8;
    }
    v6 += 2;
  }
  while (v6 != 8);
  *a3 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::G13::Classes,AGX::G13::Encoders>::requiresRayTracingEmulation()
{
  return 1;
}

uint64_t AGCTargetImpl<AGX::G13::Classes,AGX::G13::Encoders>::maxMSAASampleCount()
{
  return 4;
}

void AGX::ProgramKeyFactoryImpl<AGX::G13::Classes,AGX::G13::Encoders>::~ProgramKeyFactoryImpl()
{
  JUMPOUT(0x1CAA2D68CLL);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G13::Classes,AGX::G13::Encoders>::CreateVertexProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, int a6@<W6>, uint64_t a7@<X8>)
{
  uint64_t v14;
  int v15;
  __int16 v17;
  uint64_t v18;
  int v19;
  std::string v20;
  std::string v21;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v20 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v21, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v21 = *(std::string *)(a2 + 24);
  v14 = *(unsigned __int8 *)(a2 + 48);
  *(_DWORD *)(a7 + 8) = 3;
  *(_OWORD *)(a7 + 96) = 0u;
  *(_OWORD *)(a7 + 112) = 0u;
  *(_OWORD *)(a7 + 128) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 76) = 0u;
  *(_QWORD *)a7 = &off_1E7ED3720;
  *(std::string *)(a7 + 144) = v20;
  *(std::string *)(a7 + 168) = v21;
  *(_BYTE *)(a7 + 192) = v14;
  *(_QWORD *)(a7 + 56) = v14 << 18;
  AGX::Impl::VertexProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a7, a3);
  if (a7 + 96 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 96), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a7 + 120 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 120), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a6)
    v15 = 2;
  else
    v15 = 0;
  *(_DWORD *)(a7 + 88) = *(_DWORD *)(a7 + 88) & 0xFFFFFFFD | v15;
  v17 = 256;
  v18 = 0;
  v19 = 0;
  return AGX::GeometrySharedKey<_AGCVertexContextStateAGP,(_AGCStreamToken)3>::setDeviceOptions(a7, (unsigned __int8 *)&v17);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G13::Classes,AGX::G13::Encoders>::CreateObjectProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, int a3@<W3>, NSObject *a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  char *v11;
  int v12;
  int v13;
  __int16 v15;
  uint64_t v16;
  int v17;

  *(_DWORD *)(a7 + 8) = 9;
  *(_OWORD *)(a7 + 104) = 0u;
  v11 = (char *)(a7 + 104);
  *(_OWORD *)(a7 + 120) = 0u;
  *(_OWORD *)(a7 + 136) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 80) = 0u;
  *(_DWORD *)(a7 + 96) = 0;
  *(_QWORD *)a7 = &off_1E7ED37B0;
  if (a2)
    v12 = 2;
  else
    v12 = 0;
  if (a3)
    v13 = 4;
  else
    v13 = 0;
  *(_DWORD *)(a7 + 56) = v13 | v12;
  AGX::Impl::ObjectProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a7, a4);
  if (v11 != (char *)a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v11, *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a7 + 128 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 128), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  v15 = 256;
  v16 = 0;
  v17 = 0;
  return AGX::GeometrySharedKey<_AGCObjectContextStateAGP,(_AGCStreamToken)9>::setDeviceOptions(a7, (unsigned __int8 *)&v15);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G13::Classes,AGX::G13::Encoders>::CreateMeshProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, int a3@<W3>, int a4@<W4>, NSObject *a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, char a9)
{
  int v17;
  __int128 v18;
  int v19;
  int v20;
  int v21;
  __int16 v23;
  uint64_t v24;
  int v25;
  std::string v26;
  std::string v27;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v26, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v26 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v27, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v27 = *(std::string *)(a2 + 24);
  v17 = *(unsigned __int8 *)(a2 + 48);
  *(_OWORD *)(a8 + 104) = 0u;
  *(_DWORD *)(a8 + 8) = 10;
  *(_OWORD *)(a8 + 120) = 0u;
  *(_OWORD *)(a8 + 136) = 0u;
  *(_OWORD *)(a8 + 16) = 0u;
  *(_OWORD *)(a8 + 32) = 0u;
  *(_OWORD *)(a8 + 48) = 0u;
  *(_OWORD *)(a8 + 64) = 0u;
  *(_OWORD *)(a8 + 80) = 0u;
  *(_DWORD *)(a8 + 96) = 0;
  *(_QWORD *)a8 = &off_1E7ED3768;
  *(std::string *)(a8 + 152) = v26;
  v18 = *(_OWORD *)&v27.__r_.__value_.__l.__data_;
  *(_QWORD *)(a8 + 192) = *((_QWORD *)&v27.__r_.__value_.__l + 2);
  if (a3)
    v19 = 128;
  else
    v19 = 0;
  if (a4)
    v20 = 256;
  else
    v20 = 0;
  *(_OWORD *)(a8 + 176) = v18;
  *(_BYTE *)(a8 + 200) = v17;
  *(_DWORD *)(a8 + 56) = v20 | v19 | (16 * v17);
  AGX::Impl::MeshProgramKey::initCommon((AGX *)a8, a1);
  *(_DWORD *)(a8 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a8, a5);
  if (a8 + 104 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 104), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  if (a8 + 128 != a7)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 128), *(char **)a7, *(_QWORD *)(a7 + 8), (uint64_t)(*(_QWORD *)(a7 + 8) - *(_QWORD *)a7) >> 5);
  if (a9)
    v21 = 2;
  else
    v21 = 0;
  *(_DWORD *)(a8 + 96) = *(_DWORD *)(a8 + 96) & 0xFFFFFFFD | v21;
  v23 = 256;
  v24 = 0;
  v25 = 0;
  return AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setDeviceOptions(a8, (unsigned __int8 *)&v23);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G13::Classes,AGX::G13::Encoders>::CreateFragmentProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  char *v12;
  MTLPixelFormat v13;
  unsigned __int16 *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char v28;
  char v29;
  __int128 v30;
  int v31;
  unsigned int v32;
  int v33;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[31];
  int v43;
  __int16 v44;
  int v45;
  _OWORD v46[7];

  *(_DWORD *)(a6 + 8) = 4;
  *(_QWORD *)(a6 + 24) = 0;
  *(_QWORD *)(a6 + 32) = 0;
  *(_QWORD *)(a6 + 16) = 0;
  *(_OWORD *)(a6 + 232) = 0u;
  v12 = (char *)(a6 + 232);
  *(_QWORD *)a6 = &off_1E7ED37F8;
  *(_OWORD *)(a6 + 40) = 0u;
  *(_OWORD *)(a6 + 56) = 0u;
  *(_OWORD *)(a6 + 72) = 0u;
  *(_OWORD *)(a6 + 88) = 0u;
  *(_OWORD *)(a6 + 104) = 0u;
  *(_OWORD *)(a6 + 120) = 0u;
  *(_OWORD *)(a6 + 136) = 0u;
  *(_OWORD *)(a6 + 152) = 0u;
  *(_OWORD *)(a6 + 168) = 0u;
  *(_OWORD *)(a6 + 184) = 0u;
  *(_OWORD *)(a6 + 200) = 0u;
  *(_OWORD *)(a6 + 209) = 0u;
  *(_OWORD *)(a6 + 248) = 0u;
  *(_OWORD *)(a6 + 264) = 0u;
  v41 = 0u;
  memset(v42, 0, sizeof(v42));
  v39 = 0u;
  v40 = 0u;
  v43 = 1;
  v44 = 0;
  v45 = 0;
  memset(v46, 0, 96);
  bzero(&v39, 0x28uLL);
  if (!a1)
    goto LABEL_22;
  v38 = a2;
  v14 = (unsigned __int16 *)((char *)a1 - *(int *)a1);
  v15 = *v14;
  if (v15 >= 0x17)
  {
    v16 = v14[11];
    if (!v14[11])
      goto LABEL_14;
    v17 = *(unsigned int *)((char *)a1 + v16);
    v18 = (unsigned int *)((char *)a1 + v16 + v17);
    v19 = *v18;
    if (!(_DWORD)v19)
      goto LABEL_14;
    v35 = a3;
    v36 = a4;
    v37 = a5;
    v20 = 0;
    v21 = DWORD2(v41);
    v22 = (char *)a1 + v16 + v17;
    do
    {
      v23 = &v22[4 * v20];
      v24 = *((unsigned int *)v23 + 1);
      v25 = (char *)v18 + v24 - *(int *)&v23[v24 + 4];
      if (*((unsigned __int16 *)v25 + 2) >= 5u)
      {
        v26 = *((unsigned __int16 *)v25 + 4);
        if (v26)
        {
          v27 = (char *)v18 + v24 + v26;
          if (*((_WORD *)v27 + 2))
          {
            *((_QWORD *)v46 + v20) = AGX::G13::TextureFormatTable::chooseTextureFormatCPP((AGX::G13::TextureFormatTable *)*((unsigned __int16 *)v27 + 2), v13);
            v21 |= 1 << v20;
          }
        }
      }
      if (v20 > 6)
        break;
      ++v20;
      ++v18;
    }
    while (v20 < v19);
    DWORD2(v41) = v21;
    a4 = v36;
    a5 = v37;
    a3 = v35;
  }
  if (v15 <= 0xC)
  {
    v29 = 1;
    LOBYTE(v44) = 1;
    a2 = v38;
LABEL_21:
    HIBYTE(v44) = v29;
    goto LABEL_22;
  }
LABEL_14:
  if (v14[6])
    v28 = *((_BYTE *)a1 + v14[6]);
  else
    v28 = 1;
  a2 = v38;
  LOBYTE(v44) = v28;
  HIBYTE(v44) = v28;
  if (v15 >= 0xF)
  {
    if (v14[7])
    {
      v29 = *((_BYTE *)a1 + v14[7]);
      if (v29)
        goto LABEL_21;
    }
  }
LABEL_22:
  AGX::FramebufferCompilerConfigGen3<AGX::G13::Encoders,AGX::G13::Classes,AGX::G13::ObjClasses>::buildDrawBufferState((uint64_t)&v39);
  v30 = v40;
  *(_OWORD *)(a6 + 112) = v39;
  *(_OWORD *)(a6 + 128) = v30;
  *(_QWORD *)(a6 + 144) = v41;
  AGX::Impl::FragmentProgramKey::initCommon((AGX *)a6, a1);
  v31 = *(_DWORD *)(a6 + 104);
  v32 = *(_DWORD *)(a6 + 100) & 0xFFFFFF7F;
  *(_DWORD *)(a6 + 40) &= ~0x10u;
  if (a2)
    v33 = 256;
  else
    v33 = 0;
  *(_DWORD *)(a6 + 100) = v32;
  *(_DWORD *)(a6 + 104) = v31 & 0xFFFFFEFF | v33;
  AGX::Impl::FragmentProgramKey::setSerializedDescriptor((AGX::Impl::FragmentProgramKey *)a6, a3);
  if (v12 != (char *)a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v12, *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a6 + 256 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a6 + 256), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  LOWORD(v39) = 256;
  *(_QWORD *)((char *)&v39 + 2) = 0;
  *(_DWORD *)((char *)&v39 + 10) = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a6, (unsigned __int8 *)&v39);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G13::Classes,AGX::G13::Encoders>::CreateComputeProgramKey@<X0>(AGX *a1@<X1>, NSObject *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  __int16 v11;
  uint64_t v12;
  int v13;

  *(_DWORD *)(a5 + 8) = 6;
  *(_QWORD *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  *(_QWORD *)(a5 + 32) = 0;
  *(_QWORD *)(a5 + 40) = 0;
  *(_QWORD *)a5 = &off_1E7ED3878;
  *(_QWORD *)(a5 + 48) = 0;
  *(_QWORD *)(a5 + 56) = 0;
  std::string::basic_string[abi:nn180100]<0>((_QWORD *)(a5 + 64), (char *)&unk_1C3E4D9BB);
  *(_BYTE *)(a5 + 88) = 0;
  *(_OWORD *)(a5 + 96) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_OWORD *)(a5 + 128) = 0u;
  AGX::Impl::ComputeProgramKey::initCommon((AGX *)a5, a1);
  *(int8x8_t *)(a5 + 52) = vand_s8(*(int8x8_t *)(a5 + 52), (int8x8_t)0xFFFFFFFEFFFFFF7FLL);
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a5, a2);
  if (a5 + 96 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 96), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  if (a5 + 120 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 120), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  v11 = 256;
  v12 = 0;
  v13 = 0;
  return AGX::Impl::ComputeProgramKey::setDeviceOptions(a5, (unsigned __int8 *)&v11);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G13::Classes,AGX::G13::Encoders>::CreateTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, unint64_t a4@<X8>)
{
  MTLPixelFormat v8;
  unsigned __int16 *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char v23;
  char v24;
  __int128 v25;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[31];
  int v32;
  __int16 v33;
  int v34;
  _OWORD v35[7];

  *(_DWORD *)(a4 + 8) = 5;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)a4 = &off_1E7ED3838;
  *(_OWORD *)(a4 + 40) = 0u;
  *(_OWORD *)(a4 + 56) = 0u;
  *(_OWORD *)(a4 + 72) = 0u;
  *(_OWORD *)(a4 + 88) = 0u;
  *(_OWORD *)(a4 + 104) = 0u;
  *(_OWORD *)(a4 + 120) = 0u;
  *(_OWORD *)(a4 + 136) = 0u;
  *(_OWORD *)(a4 + 152) = 0u;
  *(_OWORD *)(a4 + 168) = 0u;
  *(_OWORD *)(a4 + 184) = 0u;
  *(_QWORD *)(a4 + 200) = 0;
  v30 = 0u;
  memset(v31, 0, sizeof(v31));
  v28 = 0u;
  v29 = 0u;
  v32 = 1;
  v33 = 0;
  v34 = 0;
  memset(v35, 0, 96);
  bzero(&v28, 0x28uLL);
  if (!a1)
    goto LABEL_22;
  v9 = (unsigned __int16 *)((char *)a1 - *a1);
  v10 = *v9;
  if (v10 < 0xF)
    goto LABEL_13;
  v11 = v9[7];
  if (v9[7])
  {
    v12 = *(unsigned int *)((char *)a1 + v11);
    v13 = (unsigned int *)((char *)a1 + v11 + v12);
    v14 = *v13;
    if ((_DWORD)v14)
    {
      v15 = 0;
      v16 = DWORD2(v30);
      v27 = a3;
      v17 = (char *)a1 + v11 + v12;
      do
      {
        v18 = &v17[4 * v15];
        v19 = *((unsigned int *)v18 + 1);
        v20 = (char *)v13 + v19 - *(int *)&v18[v19 + 4];
        if (*((unsigned __int16 *)v20 + 2) >= 5u)
        {
          v21 = *((unsigned __int16 *)v20 + 4);
          if (v21)
          {
            v22 = (char *)v13 + v19 + v21;
            if (*((_WORD *)v22 + 2))
            {
              *((_QWORD *)v35 + v15) = AGX::G13::TextureFormatTable::chooseTextureFormatCPP((AGX::G13::TextureFormatTable *)*((unsigned __int16 *)v22 + 2), v8);
              v16 |= 1 << v15;
            }
          }
        }
        if (v15 > 6)
          break;
        ++v15;
        ++v13;
      }
      while (v15 < v14);
      DWORD2(v30) = v16;
      a3 = v27;
LABEL_13:
      if (v10 <= 0xA)
      {
        v24 = 1;
        LOBYTE(v33) = 1;
LABEL_21:
        HIBYTE(v33) = v24;
        goto LABEL_22;
      }
    }
  }
  if (v9[5])
    v23 = *((_BYTE *)a1 + v9[5]);
  else
    v23 = 1;
  LOBYTE(v33) = v23;
  HIBYTE(v33) = v23;
  if (v10 >= 0xD)
  {
    if (v9[6])
    {
      v24 = *((_BYTE *)a1 + v9[6]);
      if (v24)
        goto LABEL_21;
    }
  }
LABEL_22:
  AGX::FramebufferCompilerConfigGen3<AGX::G13::Encoders,AGX::G13::Classes,AGX::G13::ObjClasses>::buildDrawBufferState((uint64_t)&v28);
  v25 = v29;
  *(_OWORD *)(a4 + 112) = v28;
  *(_OWORD *)(a4 + 128) = v25;
  *(_QWORD *)(a4 + 144) = v30;
  AGX::Impl::TileProgramKey::initCommon(a4, a1);
  *(_DWORD *)(a4 + 100) &= ~0x80u;
  if (a4 + 160 != a2)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 160), *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 5);
  if (a4 + 184 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 184), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  LOWORD(v28) = 256;
  *(_QWORD *)((char *)&v28 + 2) = 0;
  *(_DWORD *)((char *)&v28 + 10) = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a4, (unsigned __int8 *)&v28);
}

double AGX::ProgramKeyFactoryImpl<AGX::G13::Classes,AGX::G13::Encoders>::CreateBackgroundObjectProgramKey@<D0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  double result;
  __int128 v4;
  int v5;
  _OWORD v6[2];
  uint64_t v7;
  int v8;
  unsigned __int8 v9;
  unsigned __int16 v10;
  unsigned __int8 v11;

  *(_DWORD *)(a2 + 8) = 13;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFAA8;
  AGX::FramebufferCompilerConfig<AGX::G13::Encoders,AGX::G13::Classes,AGX::G13::ObjClasses>::FramebufferCompilerConfig((uint64_t)v6, a1);
  AGX::FramebufferCompilerConfigGen3<AGX::G13::Encoders,AGX::G13::Classes,AGX::G13::ObjClasses>::buildDrawBufferState((uint64_t)v6);
  result = *(double *)v6;
  v4 = v6[1];
  *(_OWORD *)(a2 + 40) = v6[0];
  *(_OWORD *)(a2 + 56) = v4;
  *(_QWORD *)(a2 + 72) = v7;
  *(_QWORD *)(a2 + 80) = 0;
  v5 = v10 | (v11 << 16) | (v8 << 24);
  *(_WORD *)(a2 + 84) = v9;
  *(_DWORD *)(a2 + 80) = v5;
  return result;
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G13::Classes,AGX::G13::Encoders>::CreateEndOfTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;
  int v28;
  _OWORD v29[2];
  uint64_t v30;
  _OWORD v31[2];
  uint64_t v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  unsigned __int8 v37;
  unsigned __int8 v38;
  unsigned int v39;
  _BYTE v40[40];

  *(_DWORD *)(a2 + 8) = 19;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)a2 = off_1E7ECFAE8;
  *(_OWORD *)(a2 + 40) = 0u;
  v3 = a2 + 40;
  *(_QWORD *)(a2 + 16) = 0;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(_OWORD *)(a2 + 88) = 0u;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_QWORD *)(a2 + 118) = 0;
  AGX::FramebufferCompilerConfig<AGX::G13::Encoders,AGX::G13::Classes,AGX::G13::ObjClasses>::FramebufferCompilerConfig((uint64_t)v31, a1);
  result = AGX::FramebufferCompilerConfigGen3<AGX::G13::Encoders,AGX::G13::Classes,AGX::G13::ObjClasses>::buildDrawBufferState((uint64_t)v31);
  v29[0] = v31[0];
  v29[1] = v31[1];
  v5 = v32;
  v30 = v32;
  v6 = v39;
  v7 = v33;
  v24 = v34;
  v8 = ((unint64_t)BYTE2(v32) << 36) | ((unint64_t)((unsigned __int16)v32 >> 12) << 32) | 0x40000000000000;
  *(_QWORD *)(a2 + 112) = v8;
  if (v7)
  {
    v9 = 0;
    v28 = 0;
    v10 = 0;
    v20 = (unsigned __int16)v5 >> 12;
    v23 = v38;
    v22 = HIWORD(v5) & 0x1FF;
    v21 = v37 & ~v36 | v35;
    v19 = v36 & ~v37 | v35;
    do
    {
      v11 = __clz(__rbit32(v7));
      v12 = *((_DWORD *)v29 + v11);
      v13 = *(_DWORD *)(v3 + 4 * v11) & 0xE3000000;
      result = AGX::PBEStateEncoderGen7<kAGXRevG13>::StateFields::getDimensionality(v40[2 * v11], v40[2 * v11 + 1], v6);
      *(_DWORD *)(v3 + 4 * v11) = v13 & 0xE3FFE0FF | ((_DWORD)result << 16) & 0xE3FFFFFF | ((v12 & 0x1F) << 8) | (v12 >> 5 << 26) | ((v12 >> 12) / v22);
      v9 |= 1 << v11;
      v27 = (v12 >> 12) / v22;
      v28 |= (1 << v11) & v21;
      v14 = v23 & (1 << v11);
      v10 |= v14;
      if ((v24 & (1 << v11)) != 0)
      {
        v26 = v10;
        v15 = (v12 & 0x1F) << 8;
        v25 = (v12 << 21) & 0x1C000000;
        v16 = v11 + 8;
        v17 = (v12 << 16) & 0x1000000;
        if (v20 <= 1)
          v17 = 0;
        v18 = *(_DWORD *)(v3 + 4 * (v11 + 8)) & 0xE2000000 | v17;
        result = AGX::PBEStateEncoderGen7<kAGXRevG13>::StateFields::getDimensionality(v40[2 * v11 + 16], v40[2 * v11 + 17], v6);
        *(_DWORD *)(v3 + 4 * v16) = v18 | ((_DWORD)result << 16) | v15 | v25 | v27;
        v9 |= 256 << v11;
        v28 |= ((v19 >> v11) & 1) << v16;
        v10 = ((v14 != 0) << v16) | v26;
      }
      v7 ^= 1 << v11;
    }
    while (v7);
    v8 = (unint64_t)*(unsigned int *)(a2 + 116) << 32;
  }
  else
  {
    LOWORD(v10) = 0;
    LOWORD(v28) = 0;
    LOWORD(v9) = 0;
  }
  *(_WORD *)(a2 + 120) = v9;
  *(_WORD *)(a2 + 122) = v28;
  *(_WORD *)(a2 + 124) = v10;
  *(_QWORD *)(a2 + 112) = v8 | (unsigned __int16)(v9 & ~(_WORD)v28) | ((unint64_t)(unsigned __int16)(v9 & v10) << 16);
  return result;
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G13::Classes,AGX::G13::Encoders>::CreateBVHBuilderProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 8) = 24;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFB68;
  *(_DWORD *)(a2 + 40) = 0;
  return AGX::BVHBuilderProgramKey::initializeWithDescriptor(a2, a1);
}

uint64_t AGX::FramebufferCompilerConfig<AGX::G14::Encoders,AGX::G14::Classes,AGX::G14::ObjClasses>::FramebufferCompilerConfig(uint64_t a1, int *a2)
{
  MTLPixelFormat v4;
  uint64_t v5;
  char *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  __int32 v24;
  int v25;
  uint64_t v26;
  int v27;
  char *v28;
  uint64_t v29;
  char v30;
  int v31;
  char v32;
  uint64_t v33;
  int v34;
  int v35;
  int32x2_t v36;
  int v37;
  char *v38;
  uint64_t v39;
  char v40;
  int v41;
  char *v42;
  char v43;
  char v44;
  char v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  unsigned __int16 *v49;
  unsigned int v50;
  char v51;
  char v52;
  uint64_t v53;

  *(_OWORD *)(a1 + 63) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 80) = 1;
  *(_WORD *)(a1 + 84) = 0;
  *(_DWORD *)(a1 + 88) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  bzero((void *)a1, 0x28uLL);
  if (a2)
  {
    v5 = *a2;
    v6 = (char *)a2 - v5;
    v7 = *(unsigned __int16 *)((char *)a2 - v5);
    if (v7 < 5)
      goto LABEL_71;
    v8 = -v5;
    v9 = *((unsigned __int16 *)v6 + 2);
    if (*((_WORD *)v6 + 2))
    {
      v10 = (char *)a2 + v9;
      v11 = *(unsigned int *)((char *)a2 + v9);
      v12 = *(unsigned int *)((char *)a2 + v9 + v11);
      if ((_DWORD)v12)
      {
        v13 = 0;
        v14 = 0;
        v15 = v9 + v11;
        while (1)
        {
          v16 = *(unsigned int *)((char *)a2 + v15 + 4);
          v17 = (char *)a2 + v15 + v16;
          v18 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v18 + 2) >= 5u)
          {
            v19 = *((unsigned __int16 *)v18 + 4);
            if (v19)
            {
              v20 = (char *)a2 + v15 + v16 + v19;
              if (*((_WORD *)v20 + 2))
                break;
            }
          }
LABEL_46:
          if (v14 <= 6)
          {
            ++v14;
            v13 += 2;
            v15 += 4;
            if (v14 < v12)
              continue;
          }
          v47 = *a2;
          v8 = -v47;
          v7 = *(unsigned __int16 *)((char *)a2 - v47);
          goto LABEL_66;
        }
        *(_QWORD *)(a1 + 8 * v14 + 96) = AGX::G14::TextureFormatTable::chooseTextureFormatCPP((AGX::G14::TextureFormatTable *)*((unsigned __int16 *)v20 + 2), v4);
        v21 = 1 << v14;
        *(_DWORD *)(a1 + 40) |= 1 << v14;
        v22 = v16 - *((int *)v17 + 1);
        v23 = *(unsigned __int16 *)((char *)a2 + v15 + v22 + 4);
        if (v23 < 0x19)
        {
          v25 = 0;
          v24 = 0;
          if (v23 < 0xF)
          {
LABEL_34:
            v25 = 0;
            v34 = 1 << v14;
LABEL_35:
            *(_DWORD *)(a1 + 52) |= v34;
            v36.i32[0] = v24;
            v36.i32[1] = v25 & 0xFFFFFFFD;
            *(int8x8_t *)(a1 + 60) = vorr_s8(*(int8x8_t *)(a1 + 60), vand_s8((int8x8_t)vdup_n_s32(v21), (int8x8_t)vceq_s32(v36, (int32x2_t)0x100000001)));
            if (v25 == 4)
              v37 = 1 << v14;
            else
              v37 = 0;
            *(_DWORD *)(a1 + 72) |= v37;
            v38 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
            if (*((unsigned __int16 *)v38 + 2) >= 7u && (v39 = *((unsigned __int16 *)v38 + 5)) != 0)
            {
              v40 = 0;
              v41 = *((unsigned __int8 *)a2 + v15 + v16 + v39 + 4);
              v42 = (char *)(a1 + v13 + 160);
              v43 = 2;
              v44 = 1;
              switch(v41)
              {
                case 0:
                case 1:
                  v43 = 1;
                  v40 = v41;
                  goto LABEL_52;
                case 3:
                  goto LABEL_57;
                case 4:
                  v45 = 2;
                  goto LABEL_43;
                case 5:
                  goto LABEL_51;
                case 6:
                  v40 = 1;
LABEL_51:
                  v43 = 4;
                  goto LABEL_52;
                case 7:
                  *v42 = 3;
                  *(_BYTE *)(a1 + v13 + 161) = 0;
LABEL_55:
                  v46 = 3;
                  break;
                case 8:
                  v44 = 3;
LABEL_57:
                  *v42 = 2;
                  *(_BYTE *)(a1 + v13 + 161) = v44;
LABEL_58:
                  *(_BYTE *)(a1 + 78) |= v21;
                  goto LABEL_44;
                default:
LABEL_52:
                  *v42 = v43;
                  *(_BYTE *)(a1 + v13 + 161) = v40;
                  v46 = 1;
                  switch(v41)
                  {
                    case 0:
                      goto LABEL_45;
                    case 1:
                      *(_BYTE *)(a1 + 78) |= v21;
                      v46 = 1;
                      break;
                    case 3:
                    case 5:
                    case 6:
                    case 8:
                      goto LABEL_58;
                    case 7:
                      goto LABEL_55;
                    default:
                      goto LABEL_44;
                  }
                  break;
              }
            }
            else
            {
              v45 = 0;
              v42 = (char *)(a1 + 2 * v14 + 160);
LABEL_43:
              *v42 = 2;
              *(_BYTE *)(a1 + v13 + 161) = v45;
LABEL_44:
              v46 = 2;
            }
LABEL_45:
            *(_WORD *)(a1 + 76) |= v46 << v13;
            v12 = *(unsigned int *)&v10[v11];
            goto LABEL_46;
          }
        }
        else
        {
          if (*(_WORD *)((char *)a2 + v15 + v22 + 28))
            v24 = *((unsigned __int8 *)a2 + v15 + v16 + *(unsigned __int16 *)((char *)a2 + v15 + v22 + 28) + 4);
          else
            v24 = 0;
          if (v23 >= 0x1B && *(_WORD *)((char *)a2 + v15 + v22 + 30))
            v25 = *((unsigned __int8 *)a2 + v15 + v16 + *(unsigned __int16 *)((char *)a2 + v15 + v22 + 30) + 4);
          else
            v25 = 0;
        }
        v26 = *(unsigned __int16 *)((char *)a2 + v15 + v22 + 18);
        if (v26 && *(_WORD *)((char *)a2 + v15 + v16 + v26 + 4))
        {
          *(_DWORD *)(a1 + 48) |= v21;
          if ((v25 & 0xFE) == 2)
            v27 = 1 << v14;
          else
            v27 = 0;
          *(_DWORD *)(a1 + 68) |= v27;
          v28 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v28 + 2) >= 0x11u && (v29 = *((unsigned __int16 *)v28 + 10), *((_WORD *)v28 + 10)))
          {
            v30 = 0;
            v31 = *((unsigned __int8 *)a2 + v15 + v16 + v29 + 4);
            v32 = 2;
            switch(v31)
            {
              case 0:
              case 1:
                v32 = 1;
                v30 = v31;
                break;
              case 3:
                v30 = 1;
                break;
              case 4:
                v30 = 2;
                break;
              case 5:
                goto LABEL_61;
              case 6:
                v30 = 1;
LABEL_61:
                v32 = 4;
                break;
              case 7:
                v30 = 0;
                v32 = 3;
                break;
              case 8:
                v30 = 3;
                break;
              default:
                break;
            }
          }
          else
          {
            v30 = 0;
            v32 = 2;
          }
          v33 = a1 + v13;
          *(_BYTE *)(v33 + 176) = v32;
          *(_BYTE *)(v33 + 177) = v30;
        }
        v34 = 0;
        if (v24 == 2)
          v35 = 1 << v14;
        else
          v35 = 0;
        *(_DWORD *)(a1 + 56) |= v35;
        if (v25)
          goto LABEL_35;
        goto LABEL_34;
      }
    }
LABEL_66:
    if (v7 >= 7
      && *(_WORD *)((char *)a2 + v8 + 6)
      && (v48 = *(_QWORD *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v8 + 6)), (v48 & 0xFFFFFFFE) != 0))
    {
      if (v48 > 0x7FF)
        LODWORD(v48) = 2048;
    }
    else
    {
LABEL_71:
      LODWORD(v48) = 1;
    }
    *(_DWORD *)(a1 + 80) = v48;
    v49 = (unsigned __int16 *)((char *)a2 - *a2);
    v50 = *v49;
    if (v50 < 0xB)
    {
      v52 = 1;
      *(_BYTE *)(a1 + 84) = 1;
      if (v50 < 9)
      {
LABEL_82:
        *(_BYTE *)(a1 + 85) = v52;
        return a1;
      }
    }
    else
    {
      if (v49[5])
        v51 = *((_BYTE *)a2 + v49[5]);
      else
        v51 = 1;
      *(_BYTE *)(a1 + 84) = v51;
    }
    v53 = v49[4];
    if (v53)
      v52 = *((_BYTE *)a2 + v53);
    else
      v52 = 1;
    goto LABEL_82;
  }
  return a1;
}

uint64_t AGX::FramebufferCompilerConfig<AGX::G14::Encoders,AGX::G14::Classes,AGX::G14::ObjClasses>::partitionSizeFromFormatAndCompCount(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 2:
    case 3:
    case 4:
    case 5:
      return a2;
    case 6:
    case 7:
    case 8:
    case 9:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 22:
      a2 = (2 * a2);
      break;
    case 10:
    case 11:
    case 17:
      a2 = (4 * a2);
      break;
    case 18:
    case 19:
    case 20:
    case 21:
      a2 = 4;
      break;
    default:
      a2 = 0;
      break;
  }
  return a2;
}

uint64_t AGX::FramebufferCompilerConfigGen3<AGX::G14::Encoders,AGX::G14::Classes,AGX::G14::ObjClasses>::buildDrawBufferState(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  char v12;
  uint64_t result;
  uint64_t v14;
  unsigned int *v15;
  uint64_t v16;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  unsigned __int8 v28;
  int v29;
  unsigned int v30;
  unsigned int v31;
  unint64_t v32;
  int v33;
  int v34;
  int v35;
  unsigned int v36;
  int v37;

  v2 = 0;
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = v3;
  do
  {
    v5 = v4;
    if (!v4)
      break;
    v6 = __clz(__rbit32(v4));
    v7 = *(_QWORD *)(a1 + 8 * v6 + 96);
    if (*(_DWORD *)(v7 + 32) == 18)
      v8 = 9;
    else
      v8 = *(_DWORD *)(v7 + 32);
    v2 += AGX::FramebufferCompilerConfig<AGX::G14::Encoders,AGX::G14::Classes,AGX::G14::ObjClasses>::partitionSizeFromFormatAndCompCount(v8, *(unsigned int *)(v7 + 28));
    v9 = 1 << v6;
    if (v2 > 0x40)
      v9 = 0;
    v4 = v9 ^ v5;
  }
  while (v2 < 0x41);
  if (v3)
  {
    LODWORD(v10) = 0;
    v11 = 0;
    v12 = 0;
    LODWORD(result) = 0;
    v36 = v5;
    do
    {
      v14 = __clz(__rbit32(v3));
      v15 = *(unsigned int **)(a1 + 8 * v14 + 96);
      v16 = v15[7];
      if (v15[8] == 18 && v5 == 0)
        v18 = 9;
      else
        v18 = v15[8];
      v19 = 1 << v14;
      if (v18 == 18)
        v20 = 1 << v14;
      else
        v20 = 0;
      if (v18 == 3)
      {
        v21 = (v15[21] != 0) << 8;
        v22 = 1;
      }
      else
      {
        v37 = result;
        v23 = v20;
        LODWORD(result) = AGX::FramebufferCompilerConfig<AGX::G14::Encoders,AGX::G14::Classes,AGX::G14::ObjClasses>::partitionSizeFromFormatAndCompCount(v18, v16);
        v20 = v23;
        v19 = 1 << v14;
        LODWORD(v16) = result;
        v5 = v36;
        LODWORD(result) = v37;
        v21 = 0;
        v22 = 1;
        switch(v18)
        {
          case 2:
          case 4:
          case 5:
            break;
          case 6:
          case 7:
          case 8:
          case 9:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 22:
            v21 = 0;
            v22 = 2;
            break;
          case 10:
          case 11:
          case 17:
          case 18:
          case 19:
          case 20:
          case 21:
            v21 = 0;
            v22 = 4;
            break;
          default:
            v21 = 0;
            v22 = 0;
            break;
        }
      }
      result = v20 | result;
      v24 = v22 - 1;
      v25 = -v22;
      v26 = (v24 + v10) & v25;
      v12 |= (v26 + v16) > 0x40;
      v27 = (v24 + v11) & v25;
      v28 = v27 + 64;
      v29 = v27 + v16;
      if ((v12 & 1) != 0)
        v11 = v29;
      else
        v28 = v26;
      v30 = v21 & 0xFFF00FFF | *(_DWORD *)(a1 + 4 * v14) & 0xFFF00EE0 | v18 & 0x1F | (v28 << 12);
      *(_DWORD *)(a1 + 4 * v14) = v30;
      v31 = v30 & 0xFFFFF1FF | ((v15[19] & 7) << 9);
      *(_DWORD *)(a1 + 4 * v14) = v31;
      if ((v12 & 1) != 0)
        v10 = v10;
      else
        v10 = (v26 + v16);
      *(_DWORD *)(a1 + 4 * v14) = v31 & 0xFFFFFF1F | (32 * (v15[7] & 7));
      v3 ^= v19;
    }
    while (v3);
    v32 = 64;
    if (((v10 + 7) & 0x1FFFFFFC0) == 0)
      v32 = (v10 + 7) & 0x1FFFFFFF8;
    if (v32 <= 8)
      LODWORD(v32) = 8;
    v33 = (_DWORD)v32 << 16;
    if ((v12 & 1) != 0)
    {
      v33 = 0x400000;
      v34 = 0x2000000;
    }
    else
    {
      v34 = 0;
    }
    v35 = *(unsigned __int8 *)(a1 + 40) | v34;
  }
  else
  {
    v11 = 0;
    result = 0;
    v35 = 0;
    v33 = 0x80000;
  }
  *(_DWORD *)(a1 + 32) = v35 | ((*(_BYTE *)(a1 + 84) & 0xF) << 8) | *(_DWORD *)(a1 + 32) & 0xFC000000 | v33 | ((*(_BYTE *)(a1 + 85) & 0xF) << 12);
  *(_DWORD *)(a1 + 88) = v11;
  *(_DWORD *)(a1 + 44) = result;
  return result;
}

uint64_t AGX::PBEStateEncoderGen8<kAGXRevG14>::StateFields::getDimensionality(int a1, char a2, unsigned int a3)
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  BOOL v5;

  if (a3 < 2)
    v3 = 2;
  else
    v3 = 3;
  if ((a2 & 1) != 0)
  {
    if ((a2 & 2) != 0)
      v4 = 8;
    else
      v4 = v3;
    v5 = a1 == 4;
LABEL_11:
    if (v5)
      return v3;
  }
  else
  {
    v4 = 5;
    switch(a1)
    {
      case 1:
        v4 = 2;
        break;
      case 2:
        v5 = (a2 & 2) == 0;
        v4 = 4;
        v3 = 2;
        goto LABEL_11;
      case 3:
        return v4;
      case 4:
        v4 = v3;
        break;
      default:
        v4 = -1;
        break;
    }
  }
  return v4;
}

_QWORD *AGCTargetImpl<AGX::G14::Classes,AGX::G14::Encoders>::CreateProgramKeyFactory@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_1E7ECF5A8;
  *a1 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::G14::Classes,AGX::G14::Encoders>::CreateTGSizeToTempTable@<X0>(_DWORD *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;

  *a1 = 32;
  result = operator new[]();
  v5 = *a1;
  if ((_DWORD)v5)
  {
    v6 = 0;
    v7 = -53;
    do
    {
      if (v7 > 0xFFFFFFC7)
        v8 = 1024;
      else
        v8 = (2 * (0x1A00 / (v6 & 0x3FFFFFFF))) & 0x3FC0;
      *(_DWORD *)(result + 4 * v6++) = v8;
      v7 += 4;
    }
    while (v5 != v6);
  }
  *a2 = result;
  return result;
}

_QWORD *AGCTargetImpl<AGX::G14::Classes,AGX::G14::Encoders>::GetLegalizationPasses@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *result;
  uint64_t v6;
  int v7;
  const char *v8;
  const char *v9;
  char v10;
  const char *v11;
  char v12;
  const char *v13;
  char v14;
  const char *v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = "air-degenerate-vertex-amplification-emulation";
  v10 = 0;
  v11 = "air-raytracing-emulation,indirect-acceleration-structures";
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  v13 = "mtl-fetch-all-unaligned";
  v14 = 1;
  v15 = "air-bfloat-emulation";
  v16 = 1;
  result = malloc_type_malloc(0x20uLL, 0x10040436913F5uLL);
  v6 = 0;
  v7 = 0;
  *a2 = 0;
  do
  {
    if (LOBYTE((&v9)[v6 + 1]))
    {
      v8 = (&v9)[v6];
      *a2 = v7 + 1;
      result[v7++] = v8;
    }
    v6 += 2;
  }
  while (v6 != 8);
  *a3 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::G14::Classes,AGX::G14::Encoders>::requiresRayTracingEmulation()
{
  return 1;
}

uint64_t AGCTargetImpl<AGX::G14::Classes,AGX::G14::Encoders>::maxMSAASampleCount()
{
  return 4;
}

void AGX::ProgramKeyFactoryImpl<AGX::G14::Classes,AGX::G14::Encoders>::~ProgramKeyFactoryImpl()
{
  JUMPOUT(0x1CAA2D68CLL);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G14::Classes,AGX::G14::Encoders>::CreateVertexProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, int a6@<W6>, uint64_t a7@<X8>)
{
  uint64_t v14;
  int v15;
  __int16 v17;
  uint64_t v18;
  int v19;
  std::string v20;
  std::string v21;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v20 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v21, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v21 = *(std::string *)(a2 + 24);
  v14 = *(unsigned __int8 *)(a2 + 48);
  *(_DWORD *)(a7 + 8) = 3;
  *(_OWORD *)(a7 + 96) = 0u;
  *(_OWORD *)(a7 + 112) = 0u;
  *(_OWORD *)(a7 + 128) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 76) = 0u;
  *(_QWORD *)a7 = &off_1E7ED3720;
  *(std::string *)(a7 + 144) = v20;
  *(std::string *)(a7 + 168) = v21;
  *(_BYTE *)(a7 + 192) = v14;
  *(_QWORD *)(a7 + 56) = v14 << 18;
  AGX::Impl::VertexProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a7, a3);
  if (a7 + 96 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 96), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a7 + 120 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 120), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a6)
    v15 = 2;
  else
    v15 = 0;
  *(_DWORD *)(a7 + 88) = *(_DWORD *)(a7 + 88) & 0xFFFFFFFD | v15;
  v17 = 256;
  v18 = 0;
  v19 = 0;
  return AGX::GeometrySharedKey<_AGCVertexContextStateAGP,(_AGCStreamToken)3>::setDeviceOptions(a7, (unsigned __int8 *)&v17);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G14::Classes,AGX::G14::Encoders>::CreateObjectProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, int a3@<W3>, NSObject *a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  char *v11;
  int v12;
  int v13;
  __int16 v15;
  uint64_t v16;
  int v17;

  *(_DWORD *)(a7 + 8) = 9;
  *(_OWORD *)(a7 + 104) = 0u;
  v11 = (char *)(a7 + 104);
  *(_OWORD *)(a7 + 120) = 0u;
  *(_OWORD *)(a7 + 136) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 80) = 0u;
  *(_DWORD *)(a7 + 96) = 0;
  *(_QWORD *)a7 = &off_1E7ED37B0;
  if (a2)
    v12 = 2;
  else
    v12 = 0;
  if (a3)
    v13 = 4;
  else
    v13 = 0;
  *(_DWORD *)(a7 + 56) = v13 | v12;
  AGX::Impl::ObjectProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a7, a4);
  if (v11 != (char *)a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v11, *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a7 + 128 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 128), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  v15 = 256;
  v16 = 0;
  v17 = 0;
  return AGX::GeometrySharedKey<_AGCObjectContextStateAGP,(_AGCStreamToken)9>::setDeviceOptions(a7, (unsigned __int8 *)&v15);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G14::Classes,AGX::G14::Encoders>::CreateMeshProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, int a3@<W3>, int a4@<W4>, NSObject *a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, char a9)
{
  int v17;
  __int128 v18;
  int v19;
  int v20;
  int v21;
  __int16 v23;
  uint64_t v24;
  int v25;
  std::string v26;
  std::string v27;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v26, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v26 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v27, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v27 = *(std::string *)(a2 + 24);
  v17 = *(unsigned __int8 *)(a2 + 48);
  *(_OWORD *)(a8 + 104) = 0u;
  *(_DWORD *)(a8 + 8) = 10;
  *(_OWORD *)(a8 + 120) = 0u;
  *(_OWORD *)(a8 + 136) = 0u;
  *(_OWORD *)(a8 + 16) = 0u;
  *(_OWORD *)(a8 + 32) = 0u;
  *(_OWORD *)(a8 + 48) = 0u;
  *(_OWORD *)(a8 + 64) = 0u;
  *(_OWORD *)(a8 + 80) = 0u;
  *(_DWORD *)(a8 + 96) = 0;
  *(_QWORD *)a8 = &off_1E7ED3768;
  *(std::string *)(a8 + 152) = v26;
  v18 = *(_OWORD *)&v27.__r_.__value_.__l.__data_;
  *(_QWORD *)(a8 + 192) = *((_QWORD *)&v27.__r_.__value_.__l + 2);
  if (a3)
    v19 = 128;
  else
    v19 = 0;
  if (a4)
    v20 = 256;
  else
    v20 = 0;
  *(_OWORD *)(a8 + 176) = v18;
  *(_BYTE *)(a8 + 200) = v17;
  *(_DWORD *)(a8 + 56) = v20 | v19 | (16 * v17);
  AGX::Impl::MeshProgramKey::initCommon((AGX *)a8, a1);
  *(_DWORD *)(a8 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a8, a5);
  if (a8 + 104 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 104), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  if (a8 + 128 != a7)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 128), *(char **)a7, *(_QWORD *)(a7 + 8), (uint64_t)(*(_QWORD *)(a7 + 8) - *(_QWORD *)a7) >> 5);
  if (a9)
    v21 = 2;
  else
    v21 = 0;
  *(_DWORD *)(a8 + 96) = *(_DWORD *)(a8 + 96) & 0xFFFFFFFD | v21;
  v23 = 256;
  v24 = 0;
  v25 = 0;
  return AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setDeviceOptions(a8, (unsigned __int8 *)&v23);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G14::Classes,AGX::G14::Encoders>::CreateFragmentProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  char *v12;
  MTLPixelFormat v13;
  unsigned __int16 *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char v28;
  char v29;
  __int128 v30;
  int v31;
  unsigned int v32;
  int v33;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[31];
  int v43;
  __int16 v44;
  int v45;
  _OWORD v46[7];

  *(_DWORD *)(a6 + 8) = 4;
  *(_QWORD *)(a6 + 24) = 0;
  *(_QWORD *)(a6 + 32) = 0;
  *(_QWORD *)(a6 + 16) = 0;
  *(_OWORD *)(a6 + 232) = 0u;
  v12 = (char *)(a6 + 232);
  *(_QWORD *)a6 = &off_1E7ED37F8;
  *(_OWORD *)(a6 + 40) = 0u;
  *(_OWORD *)(a6 + 56) = 0u;
  *(_OWORD *)(a6 + 72) = 0u;
  *(_OWORD *)(a6 + 88) = 0u;
  *(_OWORD *)(a6 + 104) = 0u;
  *(_OWORD *)(a6 + 120) = 0u;
  *(_OWORD *)(a6 + 136) = 0u;
  *(_OWORD *)(a6 + 152) = 0u;
  *(_OWORD *)(a6 + 168) = 0u;
  *(_OWORD *)(a6 + 184) = 0u;
  *(_OWORD *)(a6 + 200) = 0u;
  *(_OWORD *)(a6 + 209) = 0u;
  *(_OWORD *)(a6 + 248) = 0u;
  *(_OWORD *)(a6 + 264) = 0u;
  v41 = 0u;
  memset(v42, 0, sizeof(v42));
  v39 = 0u;
  v40 = 0u;
  v43 = 1;
  v44 = 0;
  v45 = 0;
  memset(v46, 0, 96);
  bzero(&v39, 0x28uLL);
  if (!a1)
    goto LABEL_22;
  v38 = a2;
  v14 = (unsigned __int16 *)((char *)a1 - *(int *)a1);
  v15 = *v14;
  if (v15 >= 0x17)
  {
    v16 = v14[11];
    if (!v14[11])
      goto LABEL_14;
    v17 = *(unsigned int *)((char *)a1 + v16);
    v18 = (unsigned int *)((char *)a1 + v16 + v17);
    v19 = *v18;
    if (!(_DWORD)v19)
      goto LABEL_14;
    v35 = a3;
    v36 = a4;
    v37 = a5;
    v20 = 0;
    v21 = DWORD2(v41);
    v22 = (char *)a1 + v16 + v17;
    do
    {
      v23 = &v22[4 * v20];
      v24 = *((unsigned int *)v23 + 1);
      v25 = (char *)v18 + v24 - *(int *)&v23[v24 + 4];
      if (*((unsigned __int16 *)v25 + 2) >= 5u)
      {
        v26 = *((unsigned __int16 *)v25 + 4);
        if (v26)
        {
          v27 = (char *)v18 + v24 + v26;
          if (*((_WORD *)v27 + 2))
          {
            *((_QWORD *)v46 + v20) = AGX::G14::TextureFormatTable::chooseTextureFormatCPP((AGX::G14::TextureFormatTable *)*((unsigned __int16 *)v27 + 2), v13);
            v21 |= 1 << v20;
          }
        }
      }
      if (v20 > 6)
        break;
      ++v20;
      ++v18;
    }
    while (v20 < v19);
    DWORD2(v41) = v21;
    a4 = v36;
    a5 = v37;
    a3 = v35;
  }
  if (v15 <= 0xC)
  {
    v29 = 1;
    LOBYTE(v44) = 1;
    a2 = v38;
LABEL_21:
    HIBYTE(v44) = v29;
    goto LABEL_22;
  }
LABEL_14:
  if (v14[6])
    v28 = *((_BYTE *)a1 + v14[6]);
  else
    v28 = 1;
  a2 = v38;
  LOBYTE(v44) = v28;
  HIBYTE(v44) = v28;
  if (v15 >= 0xF)
  {
    if (v14[7])
    {
      v29 = *((_BYTE *)a1 + v14[7]);
      if (v29)
        goto LABEL_21;
    }
  }
LABEL_22:
  AGX::FramebufferCompilerConfigGen3<AGX::G14::Encoders,AGX::G14::Classes,AGX::G14::ObjClasses>::buildDrawBufferState((uint64_t)&v39);
  v30 = v40;
  *(_OWORD *)(a6 + 112) = v39;
  *(_OWORD *)(a6 + 128) = v30;
  *(_QWORD *)(a6 + 144) = v41;
  AGX::Impl::FragmentProgramKey::initCommon((AGX *)a6, a1);
  v31 = *(_DWORD *)(a6 + 104);
  v32 = *(_DWORD *)(a6 + 100) & 0xFFFFFF7F;
  *(_DWORD *)(a6 + 40) &= ~0x10u;
  if (a2)
    v33 = 256;
  else
    v33 = 0;
  *(_DWORD *)(a6 + 100) = v32;
  *(_DWORD *)(a6 + 104) = v31 & 0xFFFFFEFF | v33;
  AGX::Impl::FragmentProgramKey::setSerializedDescriptor((AGX::Impl::FragmentProgramKey *)a6, a3);
  if (v12 != (char *)a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v12, *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a6 + 256 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a6 + 256), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  LOWORD(v39) = 256;
  *(_QWORD *)((char *)&v39 + 2) = 0;
  *(_DWORD *)((char *)&v39 + 10) = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a6, (unsigned __int8 *)&v39);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G14::Classes,AGX::G14::Encoders>::CreateComputeProgramKey@<X0>(AGX *a1@<X1>, NSObject *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  __int16 v11;
  uint64_t v12;
  int v13;

  *(_DWORD *)(a5 + 8) = 6;
  *(_QWORD *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  *(_QWORD *)(a5 + 32) = 0;
  *(_QWORD *)(a5 + 40) = 0;
  *(_QWORD *)a5 = &off_1E7ED3878;
  *(_QWORD *)(a5 + 48) = 0;
  *(_QWORD *)(a5 + 56) = 0;
  std::string::basic_string[abi:nn180100]<0>((_QWORD *)(a5 + 64), (char *)&unk_1C3E4D9BB);
  *(_BYTE *)(a5 + 88) = 0;
  *(_OWORD *)(a5 + 96) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_OWORD *)(a5 + 128) = 0u;
  AGX::Impl::ComputeProgramKey::initCommon((AGX *)a5, a1);
  *(int8x8_t *)(a5 + 52) = vand_s8(*(int8x8_t *)(a5 + 52), (int8x8_t)0xFFFFFFFEFFFFFF7FLL);
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a5, a2);
  if (a5 + 96 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 96), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  if (a5 + 120 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 120), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  v11 = 256;
  v12 = 0;
  v13 = 0;
  return AGX::Impl::ComputeProgramKey::setDeviceOptions(a5, (unsigned __int8 *)&v11);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G14::Classes,AGX::G14::Encoders>::CreateTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, unint64_t a4@<X8>)
{
  MTLPixelFormat v8;
  unsigned __int16 *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char v23;
  char v24;
  __int128 v25;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[31];
  int v32;
  __int16 v33;
  int v34;
  _OWORD v35[7];

  *(_DWORD *)(a4 + 8) = 5;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)a4 = &off_1E7ED3838;
  *(_OWORD *)(a4 + 40) = 0u;
  *(_OWORD *)(a4 + 56) = 0u;
  *(_OWORD *)(a4 + 72) = 0u;
  *(_OWORD *)(a4 + 88) = 0u;
  *(_OWORD *)(a4 + 104) = 0u;
  *(_OWORD *)(a4 + 120) = 0u;
  *(_OWORD *)(a4 + 136) = 0u;
  *(_OWORD *)(a4 + 152) = 0u;
  *(_OWORD *)(a4 + 168) = 0u;
  *(_OWORD *)(a4 + 184) = 0u;
  *(_QWORD *)(a4 + 200) = 0;
  v30 = 0u;
  memset(v31, 0, sizeof(v31));
  v28 = 0u;
  v29 = 0u;
  v32 = 1;
  v33 = 0;
  v34 = 0;
  memset(v35, 0, 96);
  bzero(&v28, 0x28uLL);
  if (!a1)
    goto LABEL_22;
  v9 = (unsigned __int16 *)((char *)a1 - *a1);
  v10 = *v9;
  if (v10 < 0xF)
    goto LABEL_13;
  v11 = v9[7];
  if (v9[7])
  {
    v12 = *(unsigned int *)((char *)a1 + v11);
    v13 = (unsigned int *)((char *)a1 + v11 + v12);
    v14 = *v13;
    if ((_DWORD)v14)
    {
      v15 = 0;
      v16 = DWORD2(v30);
      v27 = a3;
      v17 = (char *)a1 + v11 + v12;
      do
      {
        v18 = &v17[4 * v15];
        v19 = *((unsigned int *)v18 + 1);
        v20 = (char *)v13 + v19 - *(int *)&v18[v19 + 4];
        if (*((unsigned __int16 *)v20 + 2) >= 5u)
        {
          v21 = *((unsigned __int16 *)v20 + 4);
          if (v21)
          {
            v22 = (char *)v13 + v19 + v21;
            if (*((_WORD *)v22 + 2))
            {
              *((_QWORD *)v35 + v15) = AGX::G14::TextureFormatTable::chooseTextureFormatCPP((AGX::G14::TextureFormatTable *)*((unsigned __int16 *)v22 + 2), v8);
              v16 |= 1 << v15;
            }
          }
        }
        if (v15 > 6)
          break;
        ++v15;
        ++v13;
      }
      while (v15 < v14);
      DWORD2(v30) = v16;
      a3 = v27;
LABEL_13:
      if (v10 <= 0xA)
      {
        v24 = 1;
        LOBYTE(v33) = 1;
LABEL_21:
        HIBYTE(v33) = v24;
        goto LABEL_22;
      }
    }
  }
  if (v9[5])
    v23 = *((_BYTE *)a1 + v9[5]);
  else
    v23 = 1;
  LOBYTE(v33) = v23;
  HIBYTE(v33) = v23;
  if (v10 >= 0xD)
  {
    if (v9[6])
    {
      v24 = *((_BYTE *)a1 + v9[6]);
      if (v24)
        goto LABEL_21;
    }
  }
LABEL_22:
  AGX::FramebufferCompilerConfigGen3<AGX::G14::Encoders,AGX::G14::Classes,AGX::G14::ObjClasses>::buildDrawBufferState((uint64_t)&v28);
  v25 = v29;
  *(_OWORD *)(a4 + 112) = v28;
  *(_OWORD *)(a4 + 128) = v25;
  *(_QWORD *)(a4 + 144) = v30;
  AGX::Impl::TileProgramKey::initCommon(a4, a1);
  *(_DWORD *)(a4 + 100) &= ~0x80u;
  if (a4 + 160 != a2)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 160), *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 5);
  if (a4 + 184 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 184), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  LOWORD(v28) = 256;
  *(_QWORD *)((char *)&v28 + 2) = 0;
  *(_DWORD *)((char *)&v28 + 10) = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a4, (unsigned __int8 *)&v28);
}

double AGX::ProgramKeyFactoryImpl<AGX::G14::Classes,AGX::G14::Encoders>::CreateBackgroundObjectProgramKey@<D0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  double result;
  __int128 v4;
  int v5;
  _OWORD v6[2];
  uint64_t v7;
  int v8;
  unsigned __int8 v9;
  unsigned __int16 v10;
  unsigned __int8 v11;

  *(_DWORD *)(a2 + 8) = 13;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFAA8;
  AGX::FramebufferCompilerConfig<AGX::G14::Encoders,AGX::G14::Classes,AGX::G14::ObjClasses>::FramebufferCompilerConfig((uint64_t)v6, a1);
  AGX::FramebufferCompilerConfigGen3<AGX::G14::Encoders,AGX::G14::Classes,AGX::G14::ObjClasses>::buildDrawBufferState((uint64_t)v6);
  result = *(double *)v6;
  v4 = v6[1];
  *(_OWORD *)(a2 + 40) = v6[0];
  *(_OWORD *)(a2 + 56) = v4;
  *(_QWORD *)(a2 + 72) = v7;
  *(_QWORD *)(a2 + 80) = 0;
  v5 = v10 | (v11 << 16) | (v8 << 24);
  *(_WORD *)(a2 + 84) = v9;
  *(_DWORD *)(a2 + 80) = v5;
  return result;
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G14::Classes,AGX::G14::Encoders>::CreateEndOfTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;
  int v28;
  _OWORD v29[2];
  uint64_t v30;
  _OWORD v31[2];
  uint64_t v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  unsigned __int8 v37;
  unsigned __int8 v38;
  unsigned int v39;
  _BYTE v40[40];

  *(_DWORD *)(a2 + 8) = 19;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)a2 = off_1E7ECFAE8;
  *(_OWORD *)(a2 + 40) = 0u;
  v3 = a2 + 40;
  *(_QWORD *)(a2 + 16) = 0;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(_OWORD *)(a2 + 88) = 0u;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_QWORD *)(a2 + 118) = 0;
  AGX::FramebufferCompilerConfig<AGX::G14::Encoders,AGX::G14::Classes,AGX::G14::ObjClasses>::FramebufferCompilerConfig((uint64_t)v31, a1);
  result = AGX::FramebufferCompilerConfigGen3<AGX::G14::Encoders,AGX::G14::Classes,AGX::G14::ObjClasses>::buildDrawBufferState((uint64_t)v31);
  v29[0] = v31[0];
  v29[1] = v31[1];
  v5 = v32;
  v30 = v32;
  v6 = v39;
  v7 = v33;
  v24 = v34;
  v8 = ((unint64_t)BYTE2(v32) << 36) | ((unint64_t)((unsigned __int16)v32 >> 12) << 32) | 0x40000000000000;
  *(_QWORD *)(a2 + 112) = v8;
  if (v7)
  {
    v9 = 0;
    v28 = 0;
    v10 = 0;
    v20 = (unsigned __int16)v5 >> 12;
    v23 = v38;
    v22 = HIWORD(v5) & 0x1FF;
    v21 = v37 & ~v36 | v35;
    v19 = v36 & ~v37 | v35;
    do
    {
      v11 = __clz(__rbit32(v7));
      v12 = *((_DWORD *)v29 + v11);
      v13 = *(_DWORD *)(v3 + 4 * v11) & 0xE3000000;
      result = AGX::PBEStateEncoderGen8<kAGXRevG14>::StateFields::getDimensionality(v40[2 * v11], v40[2 * v11 + 1], v6);
      *(_DWORD *)(v3 + 4 * v11) = v13 & 0xE3FFE0FF | ((_DWORD)result << 16) & 0xE3FFFFFF | ((v12 & 0x1F) << 8) | (v12 >> 5 << 26) | ((v12 >> 12) / v22);
      v9 |= 1 << v11;
      v27 = (v12 >> 12) / v22;
      v28 |= (1 << v11) & v21;
      v14 = v23 & (1 << v11);
      v10 |= v14;
      if ((v24 & (1 << v11)) != 0)
      {
        v26 = v10;
        v15 = (v12 & 0x1F) << 8;
        v25 = (v12 << 21) & 0x1C000000;
        v16 = v11 + 8;
        v17 = (v12 << 16) & 0x1000000;
        if (v20 <= 1)
          v17 = 0;
        v18 = *(_DWORD *)(v3 + 4 * (v11 + 8)) & 0xE2000000 | v17;
        result = AGX::PBEStateEncoderGen8<kAGXRevG14>::StateFields::getDimensionality(v40[2 * v11 + 16], v40[2 * v11 + 17], v6);
        *(_DWORD *)(v3 + 4 * v16) = v18 | ((_DWORD)result << 16) | v15 | v25 | v27;
        v9 |= 256 << v11;
        v28 |= ((v19 >> v11) & 1) << v16;
        v10 = ((v14 != 0) << v16) | v26;
      }
      v7 ^= 1 << v11;
    }
    while (v7);
    v8 = (unint64_t)*(unsigned int *)(a2 + 116) << 32;
  }
  else
  {
    LOWORD(v10) = 0;
    LOWORD(v28) = 0;
    LOWORD(v9) = 0;
  }
  *(_WORD *)(a2 + 120) = v9;
  *(_WORD *)(a2 + 122) = v28;
  *(_WORD *)(a2 + 124) = v10;
  *(_QWORD *)(a2 + 112) = v8 | (unsigned __int16)(v9 & ~(_WORD)v28) | ((unint64_t)(unsigned __int16)(v9 & v10) << 16);
  return result;
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G14::Classes,AGX::G14::Encoders>::CreateBVHBuilderProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 8) = 24;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFB68;
  *(_DWORD *)(a2 + 40) = 0;
  return AGX::BVHBuilderProgramKey::initializeWithDescriptor(a2, a1);
}

uint64_t AGX::FramebufferCompilerConfig<AGX::G14X::Encoders,AGX::G14X::Classes,AGX::G14X::ObjClasses>::FramebufferCompilerConfig(uint64_t a1, int *a2)
{
  MTLPixelFormat v4;
  uint64_t v5;
  char *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  __int32 v24;
  int v25;
  uint64_t v26;
  int v27;
  char *v28;
  uint64_t v29;
  char v30;
  int v31;
  char v32;
  uint64_t v33;
  int v34;
  int v35;
  int32x2_t v36;
  int v37;
  char *v38;
  uint64_t v39;
  char v40;
  int v41;
  char *v42;
  char v43;
  char v44;
  char v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  unsigned __int16 *v49;
  unsigned int v50;
  char v51;
  char v52;
  uint64_t v53;

  *(_OWORD *)(a1 + 63) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 80) = 1;
  *(_WORD *)(a1 + 84) = 0;
  *(_DWORD *)(a1 + 88) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  bzero((void *)a1, 0x28uLL);
  if (a2)
  {
    v5 = *a2;
    v6 = (char *)a2 - v5;
    v7 = *(unsigned __int16 *)((char *)a2 - v5);
    if (v7 < 5)
      goto LABEL_71;
    v8 = -v5;
    v9 = *((unsigned __int16 *)v6 + 2);
    if (*((_WORD *)v6 + 2))
    {
      v10 = (char *)a2 + v9;
      v11 = *(unsigned int *)((char *)a2 + v9);
      v12 = *(unsigned int *)((char *)a2 + v9 + v11);
      if ((_DWORD)v12)
      {
        v13 = 0;
        v14 = 0;
        v15 = v9 + v11;
        while (1)
        {
          v16 = *(unsigned int *)((char *)a2 + v15 + 4);
          v17 = (char *)a2 + v15 + v16;
          v18 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v18 + 2) >= 5u)
          {
            v19 = *((unsigned __int16 *)v18 + 4);
            if (v19)
            {
              v20 = (char *)a2 + v15 + v16 + v19;
              if (*((_WORD *)v20 + 2))
                break;
            }
          }
LABEL_46:
          if (v14 <= 6)
          {
            ++v14;
            v13 += 2;
            v15 += 4;
            if (v14 < v12)
              continue;
          }
          v47 = *a2;
          v8 = -v47;
          v7 = *(unsigned __int16 *)((char *)a2 - v47);
          goto LABEL_66;
        }
        *(_QWORD *)(a1 + 8 * v14 + 96) = AGX::G14X::TextureFormatTable::chooseTextureFormatCPP((AGX::G14X::TextureFormatTable *)*((unsigned __int16 *)v20 + 2), v4);
        v21 = 1 << v14;
        *(_DWORD *)(a1 + 40) |= 1 << v14;
        v22 = v16 - *((int *)v17 + 1);
        v23 = *(unsigned __int16 *)((char *)a2 + v15 + v22 + 4);
        if (v23 < 0x19)
        {
          v25 = 0;
          v24 = 0;
          if (v23 < 0xF)
          {
LABEL_34:
            v25 = 0;
            v34 = 1 << v14;
LABEL_35:
            *(_DWORD *)(a1 + 52) |= v34;
            v36.i32[0] = v24;
            v36.i32[1] = v25 & 0xFFFFFFFD;
            *(int8x8_t *)(a1 + 60) = vorr_s8(*(int8x8_t *)(a1 + 60), vand_s8((int8x8_t)vdup_n_s32(v21), (int8x8_t)vceq_s32(v36, (int32x2_t)0x100000001)));
            if (v25 == 4)
              v37 = 1 << v14;
            else
              v37 = 0;
            *(_DWORD *)(a1 + 72) |= v37;
            v38 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
            if (*((unsigned __int16 *)v38 + 2) >= 7u && (v39 = *((unsigned __int16 *)v38 + 5)) != 0)
            {
              v40 = 0;
              v41 = *((unsigned __int8 *)a2 + v15 + v16 + v39 + 4);
              v42 = (char *)(a1 + v13 + 160);
              v43 = 2;
              v44 = 1;
              switch(v41)
              {
                case 0:
                case 1:
                  v43 = 1;
                  v40 = v41;
                  goto LABEL_52;
                case 3:
                  goto LABEL_57;
                case 4:
                  v45 = 2;
                  goto LABEL_43;
                case 5:
                  goto LABEL_51;
                case 6:
                  v40 = 1;
LABEL_51:
                  v43 = 4;
                  goto LABEL_52;
                case 7:
                  *v42 = 3;
                  *(_BYTE *)(a1 + v13 + 161) = 0;
LABEL_55:
                  v46 = 3;
                  break;
                case 8:
                  v44 = 3;
LABEL_57:
                  *v42 = 2;
                  *(_BYTE *)(a1 + v13 + 161) = v44;
LABEL_58:
                  *(_BYTE *)(a1 + 78) |= v21;
                  goto LABEL_44;
                default:
LABEL_52:
                  *v42 = v43;
                  *(_BYTE *)(a1 + v13 + 161) = v40;
                  v46 = 1;
                  switch(v41)
                  {
                    case 0:
                      goto LABEL_45;
                    case 1:
                      *(_BYTE *)(a1 + 78) |= v21;
                      v46 = 1;
                      break;
                    case 3:
                    case 5:
                    case 6:
                    case 8:
                      goto LABEL_58;
                    case 7:
                      goto LABEL_55;
                    default:
                      goto LABEL_44;
                  }
                  break;
              }
            }
            else
            {
              v45 = 0;
              v42 = (char *)(a1 + 2 * v14 + 160);
LABEL_43:
              *v42 = 2;
              *(_BYTE *)(a1 + v13 + 161) = v45;
LABEL_44:
              v46 = 2;
            }
LABEL_45:
            *(_WORD *)(a1 + 76) |= v46 << v13;
            v12 = *(unsigned int *)&v10[v11];
            goto LABEL_46;
          }
        }
        else
        {
          if (*(_WORD *)((char *)a2 + v15 + v22 + 28))
            v24 = *((unsigned __int8 *)a2 + v15 + v16 + *(unsigned __int16 *)((char *)a2 + v15 + v22 + 28) + 4);
          else
            v24 = 0;
          if (v23 >= 0x1B && *(_WORD *)((char *)a2 + v15 + v22 + 30))
            v25 = *((unsigned __int8 *)a2 + v15 + v16 + *(unsigned __int16 *)((char *)a2 + v15 + v22 + 30) + 4);
          else
            v25 = 0;
        }
        v26 = *(unsigned __int16 *)((char *)a2 + v15 + v22 + 18);
        if (v26 && *(_WORD *)((char *)a2 + v15 + v16 + v26 + 4))
        {
          *(_DWORD *)(a1 + 48) |= v21;
          if ((v25 & 0xFE) == 2)
            v27 = 1 << v14;
          else
            v27 = 0;
          *(_DWORD *)(a1 + 68) |= v27;
          v28 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v28 + 2) >= 0x11u && (v29 = *((unsigned __int16 *)v28 + 10), *((_WORD *)v28 + 10)))
          {
            v30 = 0;
            v31 = *((unsigned __int8 *)a2 + v15 + v16 + v29 + 4);
            v32 = 2;
            switch(v31)
            {
              case 0:
              case 1:
                v32 = 1;
                v30 = v31;
                break;
              case 3:
                v30 = 1;
                break;
              case 4:
                v30 = 2;
                break;
              case 5:
                goto LABEL_61;
              case 6:
                v30 = 1;
LABEL_61:
                v32 = 4;
                break;
              case 7:
                v30 = 0;
                v32 = 3;
                break;
              case 8:
                v30 = 3;
                break;
              default:
                break;
            }
          }
          else
          {
            v30 = 0;
            v32 = 2;
          }
          v33 = a1 + v13;
          *(_BYTE *)(v33 + 176) = v32;
          *(_BYTE *)(v33 + 177) = v30;
        }
        v34 = 0;
        if (v24 == 2)
          v35 = 1 << v14;
        else
          v35 = 0;
        *(_DWORD *)(a1 + 56) |= v35;
        if (v25)
          goto LABEL_35;
        goto LABEL_34;
      }
    }
LABEL_66:
    if (v7 >= 7
      && *(_WORD *)((char *)a2 + v8 + 6)
      && (v48 = *(_QWORD *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v8 + 6)), (v48 & 0xFFFFFFFE) != 0))
    {
      if (v48 > 0x7FF)
        LODWORD(v48) = 2048;
    }
    else
    {
LABEL_71:
      LODWORD(v48) = 1;
    }
    *(_DWORD *)(a1 + 80) = v48;
    v49 = (unsigned __int16 *)((char *)a2 - *a2);
    v50 = *v49;
    if (v50 < 0xB)
    {
      v52 = 1;
      *(_BYTE *)(a1 + 84) = 1;
      if (v50 < 9)
      {
LABEL_82:
        *(_BYTE *)(a1 + 85) = v52;
        return a1;
      }
    }
    else
    {
      if (v49[5])
        v51 = *((_BYTE *)a2 + v49[5]);
      else
        v51 = 1;
      *(_BYTE *)(a1 + 84) = v51;
    }
    v53 = v49[4];
    if (v53)
      v52 = *((_BYTE *)a2 + v53);
    else
      v52 = 1;
    goto LABEL_82;
  }
  return a1;
}

uint64_t AGX::FramebufferCompilerConfig<AGX::G14X::Encoders,AGX::G14X::Classes,AGX::G14X::ObjClasses>::partitionSizeFromFormatAndCompCount(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 2:
    case 3:
    case 4:
    case 5:
      return a2;
    case 6:
    case 7:
    case 8:
    case 9:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 22:
      a2 = (2 * a2);
      break;
    case 10:
    case 11:
    case 17:
      a2 = (4 * a2);
      break;
    case 18:
    case 19:
    case 20:
    case 21:
      a2 = 4;
      break;
    default:
      a2 = 0;
      break;
  }
  return a2;
}

uint64_t AGX::FramebufferCompilerConfigGen3<AGX::G14X::Encoders,AGX::G14X::Classes,AGX::G14X::ObjClasses>::buildDrawBufferState(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  char v12;
  uint64_t result;
  uint64_t v14;
  unsigned int *v15;
  uint64_t v16;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  unsigned __int8 v28;
  int v29;
  unsigned int v30;
  unsigned int v31;
  unint64_t v32;
  int v33;
  int v34;
  int v35;
  unsigned int v36;
  int v37;

  v2 = 0;
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = v3;
  do
  {
    v5 = v4;
    if (!v4)
      break;
    v6 = __clz(__rbit32(v4));
    v7 = *(_QWORD *)(a1 + 8 * v6 + 96);
    if (*(_DWORD *)(v7 + 32) == 18)
      v8 = 9;
    else
      v8 = *(_DWORD *)(v7 + 32);
    v2 += AGX::FramebufferCompilerConfig<AGX::G14X::Encoders,AGX::G14X::Classes,AGX::G14X::ObjClasses>::partitionSizeFromFormatAndCompCount(v8, *(unsigned int *)(v7 + 28));
    v9 = 1 << v6;
    if (v2 > 0x40)
      v9 = 0;
    v4 = v9 ^ v5;
  }
  while (v2 < 0x41);
  if (v3)
  {
    LODWORD(v10) = 0;
    v11 = 0;
    v12 = 0;
    LODWORD(result) = 0;
    v36 = v5;
    do
    {
      v14 = __clz(__rbit32(v3));
      v15 = *(unsigned int **)(a1 + 8 * v14 + 96);
      v16 = v15[7];
      if (v15[8] == 18 && v5 == 0)
        v18 = 9;
      else
        v18 = v15[8];
      v19 = 1 << v14;
      if (v18 == 18)
        v20 = 1 << v14;
      else
        v20 = 0;
      if (v18 == 3)
      {
        v21 = (v15[21] != 0) << 8;
        v22 = 1;
      }
      else
      {
        v37 = result;
        v23 = v20;
        LODWORD(result) = AGX::FramebufferCompilerConfig<AGX::G14X::Encoders,AGX::G14X::Classes,AGX::G14X::ObjClasses>::partitionSizeFromFormatAndCompCount(v18, v16);
        v20 = v23;
        v19 = 1 << v14;
        LODWORD(v16) = result;
        v5 = v36;
        LODWORD(result) = v37;
        v21 = 0;
        v22 = 1;
        switch(v18)
        {
          case 2:
          case 4:
          case 5:
            break;
          case 6:
          case 7:
          case 8:
          case 9:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 22:
            v21 = 0;
            v22 = 2;
            break;
          case 10:
          case 11:
          case 17:
          case 18:
          case 19:
          case 20:
          case 21:
            v21 = 0;
            v22 = 4;
            break;
          default:
            v21 = 0;
            v22 = 0;
            break;
        }
      }
      result = v20 | result;
      v24 = v22 - 1;
      v25 = -v22;
      v26 = (v24 + v10) & v25;
      v12 |= (v26 + v16) > 0x40;
      v27 = (v24 + v11) & v25;
      v28 = v27 + 64;
      v29 = v27 + v16;
      if ((v12 & 1) != 0)
        v11 = v29;
      else
        v28 = v26;
      v30 = v21 & 0xFFF00FFF | *(_DWORD *)(a1 + 4 * v14) & 0xFFF00EE0 | v18 & 0x1F | (v28 << 12);
      *(_DWORD *)(a1 + 4 * v14) = v30;
      v31 = v30 & 0xFFFFF1FF | ((v15[19] & 7) << 9);
      *(_DWORD *)(a1 + 4 * v14) = v31;
      if ((v12 & 1) != 0)
        v10 = v10;
      else
        v10 = (v26 + v16);
      *(_DWORD *)(a1 + 4 * v14) = v31 & 0xFFFFFF1F | (32 * (v15[7] & 7));
      v3 ^= v19;
    }
    while (v3);
    v32 = 64;
    if (((v10 + 7) & 0x1FFFFFFC0) == 0)
      v32 = (v10 + 7) & 0x1FFFFFFF8;
    if (v32 <= 8)
      LODWORD(v32) = 8;
    v33 = (_DWORD)v32 << 16;
    if ((v12 & 1) != 0)
    {
      v33 = 0x400000;
      v34 = 0x2000000;
    }
    else
    {
      v34 = 0;
    }
    v35 = *(unsigned __int8 *)(a1 + 40) | v34;
  }
  else
  {
    v11 = 0;
    result = 0;
    v35 = 0;
    v33 = 0x80000;
  }
  *(_DWORD *)(a1 + 32) = v35 | ((*(_BYTE *)(a1 + 84) & 0xF) << 8) | *(_DWORD *)(a1 + 32) & 0xFC000000 | v33 | ((*(_BYTE *)(a1 + 85) & 0xF) << 12);
  *(_DWORD *)(a1 + 88) = v11;
  *(_DWORD *)(a1 + 44) = result;
  return result;
}

uint64_t AGX::PBEStateEncoderGen8<kAGXRevG14X>::StateFields::getDimensionality(int a1, char a2, unsigned int a3)
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  BOOL v5;

  if (a3 < 2)
    v3 = 2;
  else
    v3 = 3;
  if ((a2 & 1) != 0)
  {
    if ((a2 & 2) != 0)
      v4 = 8;
    else
      v4 = v3;
    v5 = a1 == 4;
LABEL_11:
    if (v5)
      return v3;
  }
  else
  {
    v4 = 5;
    switch(a1)
    {
      case 1:
        v4 = 2;
        break;
      case 2:
        v5 = (a2 & 2) == 0;
        v4 = 4;
        v3 = 2;
        goto LABEL_11;
      case 3:
        return v4;
      case 4:
        v4 = v3;
        break;
      default:
        v4 = -1;
        break;
    }
  }
  return v4;
}

_QWORD *AGCTargetImpl<AGX::G14X::Classes,AGX::G14X::Encoders>::CreateProgramKeyFactory@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_1E7ECF648;
  *a1 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::G14X::Classes,AGX::G14X::Encoders>::CreateTGSizeToTempTable@<X0>(_DWORD *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;

  *a1 = 32;
  result = operator new[]();
  v5 = *a1;
  if ((_DWORD)v5)
  {
    v6 = 0;
    v7 = -53;
    do
    {
      if (v7 > 0xFFFFFFC7)
        v8 = 1024;
      else
        v8 = (2 * (0x1A00 / (v6 & 0x3FFFFFFF))) & 0x3FC0;
      *(_DWORD *)(result + 4 * v6++) = v8;
      v7 += 4;
    }
    while (v5 != v6);
  }
  *a2 = result;
  return result;
}

_QWORD *AGCTargetImpl<AGX::G14X::Classes,AGX::G14X::Encoders>::GetLegalizationPasses@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *result;
  uint64_t v6;
  int v7;
  const char *v8;
  const char *v9;
  char v10;
  const char *v11;
  char v12;
  const char *v13;
  char v14;
  const char *v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = "air-degenerate-vertex-amplification-emulation";
  v10 = 0;
  v11 = "air-raytracing-emulation,indirect-acceleration-structures";
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  v13 = "mtl-fetch-all-unaligned";
  v14 = 1;
  v15 = "air-bfloat-emulation";
  v16 = 1;
  result = malloc_type_malloc(0x20uLL, 0x10040436913F5uLL);
  v6 = 0;
  v7 = 0;
  *a2 = 0;
  do
  {
    if (LOBYTE((&v9)[v6 + 1]))
    {
      v8 = (&v9)[v6];
      *a2 = v7 + 1;
      result[v7++] = v8;
    }
    v6 += 2;
  }
  while (v6 != 8);
  *a3 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::G14X::Classes,AGX::G14X::Encoders>::requiresRayTracingEmulation()
{
  return 1;
}

uint64_t AGCTargetImpl<AGX::G14X::Classes,AGX::G14X::Encoders>::maxMSAASampleCount()
{
  return 4;
}

void AGX::ProgramKeyFactoryImpl<AGX::G14X::Classes,AGX::G14X::Encoders>::~ProgramKeyFactoryImpl()
{
  JUMPOUT(0x1CAA2D68CLL);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G14X::Classes,AGX::G14X::Encoders>::CreateVertexProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, int a6@<W6>, uint64_t a7@<X8>)
{
  uint64_t v14;
  int v15;
  __int16 v17;
  uint64_t v18;
  int v19;
  std::string v20;
  std::string v21;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v20 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v21, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v21 = *(std::string *)(a2 + 24);
  v14 = *(unsigned __int8 *)(a2 + 48);
  *(_DWORD *)(a7 + 8) = 3;
  *(_OWORD *)(a7 + 96) = 0u;
  *(_OWORD *)(a7 + 112) = 0u;
  *(_OWORD *)(a7 + 128) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 76) = 0u;
  *(_QWORD *)a7 = &off_1E7ED3720;
  *(std::string *)(a7 + 144) = v20;
  *(std::string *)(a7 + 168) = v21;
  *(_BYTE *)(a7 + 192) = v14;
  *(_QWORD *)(a7 + 56) = v14 << 18;
  AGX::Impl::VertexProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a7, a3);
  if (a7 + 96 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 96), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a7 + 120 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 120), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a6)
    v15 = 2;
  else
    v15 = 0;
  *(_DWORD *)(a7 + 88) = *(_DWORD *)(a7 + 88) & 0xFFFFFFFD | v15;
  v17 = 256;
  v18 = 0;
  v19 = 0;
  return AGX::GeometrySharedKey<_AGCVertexContextStateAGP,(_AGCStreamToken)3>::setDeviceOptions(a7, (unsigned __int8 *)&v17);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G14X::Classes,AGX::G14X::Encoders>::CreateObjectProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, int a3@<W3>, NSObject *a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  char *v11;
  int v12;
  int v13;
  __int16 v15;
  uint64_t v16;
  int v17;

  *(_DWORD *)(a7 + 8) = 9;
  *(_OWORD *)(a7 + 104) = 0u;
  v11 = (char *)(a7 + 104);
  *(_OWORD *)(a7 + 120) = 0u;
  *(_OWORD *)(a7 + 136) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 80) = 0u;
  *(_DWORD *)(a7 + 96) = 0;
  *(_QWORD *)a7 = &off_1E7ED37B0;
  if (a2)
    v12 = 2;
  else
    v12 = 0;
  if (a3)
    v13 = 4;
  else
    v13 = 0;
  *(_DWORD *)(a7 + 56) = v13 | v12;
  AGX::Impl::ObjectProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a7, a4);
  if (v11 != (char *)a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v11, *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a7 + 128 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 128), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  v15 = 256;
  v16 = 0;
  v17 = 0;
  return AGX::GeometrySharedKey<_AGCObjectContextStateAGP,(_AGCStreamToken)9>::setDeviceOptions(a7, (unsigned __int8 *)&v15);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G14X::Classes,AGX::G14X::Encoders>::CreateMeshProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, int a3@<W3>, int a4@<W4>, NSObject *a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, char a9)
{
  int v17;
  __int128 v18;
  int v19;
  int v20;
  int v21;
  __int16 v23;
  uint64_t v24;
  int v25;
  std::string v26;
  std::string v27;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v26, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v26 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v27, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v27 = *(std::string *)(a2 + 24);
  v17 = *(unsigned __int8 *)(a2 + 48);
  *(_OWORD *)(a8 + 104) = 0u;
  *(_DWORD *)(a8 + 8) = 10;
  *(_OWORD *)(a8 + 120) = 0u;
  *(_OWORD *)(a8 + 136) = 0u;
  *(_OWORD *)(a8 + 16) = 0u;
  *(_OWORD *)(a8 + 32) = 0u;
  *(_OWORD *)(a8 + 48) = 0u;
  *(_OWORD *)(a8 + 64) = 0u;
  *(_OWORD *)(a8 + 80) = 0u;
  *(_DWORD *)(a8 + 96) = 0;
  *(_QWORD *)a8 = &off_1E7ED3768;
  *(std::string *)(a8 + 152) = v26;
  v18 = *(_OWORD *)&v27.__r_.__value_.__l.__data_;
  *(_QWORD *)(a8 + 192) = *((_QWORD *)&v27.__r_.__value_.__l + 2);
  if (a3)
    v19 = 128;
  else
    v19 = 0;
  if (a4)
    v20 = 256;
  else
    v20 = 0;
  *(_OWORD *)(a8 + 176) = v18;
  *(_BYTE *)(a8 + 200) = v17;
  *(_DWORD *)(a8 + 56) = v20 | v19 | (16 * v17);
  AGX::Impl::MeshProgramKey::initCommon((AGX *)a8, a1);
  *(_DWORD *)(a8 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a8, a5);
  if (a8 + 104 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 104), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  if (a8 + 128 != a7)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 128), *(char **)a7, *(_QWORD *)(a7 + 8), (uint64_t)(*(_QWORD *)(a7 + 8) - *(_QWORD *)a7) >> 5);
  if (a9)
    v21 = 2;
  else
    v21 = 0;
  *(_DWORD *)(a8 + 96) = *(_DWORD *)(a8 + 96) & 0xFFFFFFFD | v21;
  v23 = 256;
  v24 = 0;
  v25 = 0;
  return AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setDeviceOptions(a8, (unsigned __int8 *)&v23);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G14X::Classes,AGX::G14X::Encoders>::CreateFragmentProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  char *v12;
  MTLPixelFormat v13;
  unsigned __int16 *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char v28;
  char v29;
  __int128 v30;
  int v31;
  unsigned int v32;
  int v33;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[31];
  int v43;
  __int16 v44;
  int v45;
  _OWORD v46[7];

  *(_DWORD *)(a6 + 8) = 4;
  *(_QWORD *)(a6 + 24) = 0;
  *(_QWORD *)(a6 + 32) = 0;
  *(_QWORD *)(a6 + 16) = 0;
  *(_OWORD *)(a6 + 232) = 0u;
  v12 = (char *)(a6 + 232);
  *(_QWORD *)a6 = &off_1E7ED37F8;
  *(_OWORD *)(a6 + 40) = 0u;
  *(_OWORD *)(a6 + 56) = 0u;
  *(_OWORD *)(a6 + 72) = 0u;
  *(_OWORD *)(a6 + 88) = 0u;
  *(_OWORD *)(a6 + 104) = 0u;
  *(_OWORD *)(a6 + 120) = 0u;
  *(_OWORD *)(a6 + 136) = 0u;
  *(_OWORD *)(a6 + 152) = 0u;
  *(_OWORD *)(a6 + 168) = 0u;
  *(_OWORD *)(a6 + 184) = 0u;
  *(_OWORD *)(a6 + 200) = 0u;
  *(_OWORD *)(a6 + 209) = 0u;
  *(_OWORD *)(a6 + 248) = 0u;
  *(_OWORD *)(a6 + 264) = 0u;
  v41 = 0u;
  memset(v42, 0, sizeof(v42));
  v39 = 0u;
  v40 = 0u;
  v43 = 1;
  v44 = 0;
  v45 = 0;
  memset(v46, 0, 96);
  bzero(&v39, 0x28uLL);
  if (!a1)
    goto LABEL_22;
  v38 = a2;
  v14 = (unsigned __int16 *)((char *)a1 - *(int *)a1);
  v15 = *v14;
  if (v15 >= 0x17)
  {
    v16 = v14[11];
    if (!v14[11])
      goto LABEL_14;
    v17 = *(unsigned int *)((char *)a1 + v16);
    v18 = (unsigned int *)((char *)a1 + v16 + v17);
    v19 = *v18;
    if (!(_DWORD)v19)
      goto LABEL_14;
    v35 = a3;
    v36 = a4;
    v37 = a5;
    v20 = 0;
    v21 = DWORD2(v41);
    v22 = (char *)a1 + v16 + v17;
    do
    {
      v23 = &v22[4 * v20];
      v24 = *((unsigned int *)v23 + 1);
      v25 = (char *)v18 + v24 - *(int *)&v23[v24 + 4];
      if (*((unsigned __int16 *)v25 + 2) >= 5u)
      {
        v26 = *((unsigned __int16 *)v25 + 4);
        if (v26)
        {
          v27 = (char *)v18 + v24 + v26;
          if (*((_WORD *)v27 + 2))
          {
            *((_QWORD *)v46 + v20) = AGX::G14X::TextureFormatTable::chooseTextureFormatCPP((AGX::G14X::TextureFormatTable *)*((unsigned __int16 *)v27 + 2), v13);
            v21 |= 1 << v20;
          }
        }
      }
      if (v20 > 6)
        break;
      ++v20;
      ++v18;
    }
    while (v20 < v19);
    DWORD2(v41) = v21;
    a4 = v36;
    a5 = v37;
    a3 = v35;
  }
  if (v15 <= 0xC)
  {
    v29 = 1;
    LOBYTE(v44) = 1;
    a2 = v38;
LABEL_21:
    HIBYTE(v44) = v29;
    goto LABEL_22;
  }
LABEL_14:
  if (v14[6])
    v28 = *((_BYTE *)a1 + v14[6]);
  else
    v28 = 1;
  a2 = v38;
  LOBYTE(v44) = v28;
  HIBYTE(v44) = v28;
  if (v15 >= 0xF)
  {
    if (v14[7])
    {
      v29 = *((_BYTE *)a1 + v14[7]);
      if (v29)
        goto LABEL_21;
    }
  }
LABEL_22:
  AGX::FramebufferCompilerConfigGen3<AGX::G14X::Encoders,AGX::G14X::Classes,AGX::G14X::ObjClasses>::buildDrawBufferState((uint64_t)&v39);
  v30 = v40;
  *(_OWORD *)(a6 + 112) = v39;
  *(_OWORD *)(a6 + 128) = v30;
  *(_QWORD *)(a6 + 144) = v41;
  AGX::Impl::FragmentProgramKey::initCommon((AGX *)a6, a1);
  v31 = *(_DWORD *)(a6 + 104);
  v32 = *(_DWORD *)(a6 + 100) & 0xFFFFFF7F;
  *(_DWORD *)(a6 + 40) &= ~0x10u;
  if (a2)
    v33 = 256;
  else
    v33 = 0;
  *(_DWORD *)(a6 + 100) = v32;
  *(_DWORD *)(a6 + 104) = v31 & 0xFFFFFEFF | v33;
  AGX::Impl::FragmentProgramKey::setSerializedDescriptor((AGX::Impl::FragmentProgramKey *)a6, a3);
  if (v12 != (char *)a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v12, *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a6 + 256 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a6 + 256), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  LOWORD(v39) = 256;
  *(_QWORD *)((char *)&v39 + 2) = 0;
  *(_DWORD *)((char *)&v39 + 10) = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a6, (unsigned __int8 *)&v39);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G14X::Classes,AGX::G14X::Encoders>::CreateComputeProgramKey@<X0>(AGX *a1@<X1>, NSObject *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  __int16 v11;
  uint64_t v12;
  int v13;

  *(_DWORD *)(a5 + 8) = 6;
  *(_QWORD *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  *(_QWORD *)(a5 + 32) = 0;
  *(_QWORD *)(a5 + 40) = 0;
  *(_QWORD *)a5 = &off_1E7ED3878;
  *(_QWORD *)(a5 + 48) = 0;
  *(_QWORD *)(a5 + 56) = 0;
  std::string::basic_string[abi:nn180100]<0>((_QWORD *)(a5 + 64), (char *)&unk_1C3E4D9BB);
  *(_BYTE *)(a5 + 88) = 0;
  *(_OWORD *)(a5 + 96) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_OWORD *)(a5 + 128) = 0u;
  AGX::Impl::ComputeProgramKey::initCommon((AGX *)a5, a1);
  *(int8x8_t *)(a5 + 52) = vand_s8(*(int8x8_t *)(a5 + 52), (int8x8_t)0xFFFFFFFEFFFFFF7FLL);
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a5, a2);
  if (a5 + 96 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 96), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  if (a5 + 120 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 120), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  v11 = 256;
  v12 = 0;
  v13 = 0;
  return AGX::Impl::ComputeProgramKey::setDeviceOptions(a5, (unsigned __int8 *)&v11);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G14X::Classes,AGX::G14X::Encoders>::CreateTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, unint64_t a4@<X8>)
{
  MTLPixelFormat v8;
  unsigned __int16 *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char v23;
  char v24;
  __int128 v25;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[31];
  int v32;
  __int16 v33;
  int v34;
  _OWORD v35[7];

  *(_DWORD *)(a4 + 8) = 5;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)a4 = &off_1E7ED3838;
  *(_OWORD *)(a4 + 40) = 0u;
  *(_OWORD *)(a4 + 56) = 0u;
  *(_OWORD *)(a4 + 72) = 0u;
  *(_OWORD *)(a4 + 88) = 0u;
  *(_OWORD *)(a4 + 104) = 0u;
  *(_OWORD *)(a4 + 120) = 0u;
  *(_OWORD *)(a4 + 136) = 0u;
  *(_OWORD *)(a4 + 152) = 0u;
  *(_OWORD *)(a4 + 168) = 0u;
  *(_OWORD *)(a4 + 184) = 0u;
  *(_QWORD *)(a4 + 200) = 0;
  v30 = 0u;
  memset(v31, 0, sizeof(v31));
  v28 = 0u;
  v29 = 0u;
  v32 = 1;
  v33 = 0;
  v34 = 0;
  memset(v35, 0, 96);
  bzero(&v28, 0x28uLL);
  if (!a1)
    goto LABEL_22;
  v9 = (unsigned __int16 *)((char *)a1 - *a1);
  v10 = *v9;
  if (v10 < 0xF)
    goto LABEL_13;
  v11 = v9[7];
  if (v9[7])
  {
    v12 = *(unsigned int *)((char *)a1 + v11);
    v13 = (unsigned int *)((char *)a1 + v11 + v12);
    v14 = *v13;
    if ((_DWORD)v14)
    {
      v15 = 0;
      v16 = DWORD2(v30);
      v27 = a3;
      v17 = (char *)a1 + v11 + v12;
      do
      {
        v18 = &v17[4 * v15];
        v19 = *((unsigned int *)v18 + 1);
        v20 = (char *)v13 + v19 - *(int *)&v18[v19 + 4];
        if (*((unsigned __int16 *)v20 + 2) >= 5u)
        {
          v21 = *((unsigned __int16 *)v20 + 4);
          if (v21)
          {
            v22 = (char *)v13 + v19 + v21;
            if (*((_WORD *)v22 + 2))
            {
              *((_QWORD *)v35 + v15) = AGX::G14X::TextureFormatTable::chooseTextureFormatCPP((AGX::G14X::TextureFormatTable *)*((unsigned __int16 *)v22 + 2), v8);
              v16 |= 1 << v15;
            }
          }
        }
        if (v15 > 6)
          break;
        ++v15;
        ++v13;
      }
      while (v15 < v14);
      DWORD2(v30) = v16;
      a3 = v27;
LABEL_13:
      if (v10 <= 0xA)
      {
        v24 = 1;
        LOBYTE(v33) = 1;
LABEL_21:
        HIBYTE(v33) = v24;
        goto LABEL_22;
      }
    }
  }
  if (v9[5])
    v23 = *((_BYTE *)a1 + v9[5]);
  else
    v23 = 1;
  LOBYTE(v33) = v23;
  HIBYTE(v33) = v23;
  if (v10 >= 0xD)
  {
    if (v9[6])
    {
      v24 = *((_BYTE *)a1 + v9[6]);
      if (v24)
        goto LABEL_21;
    }
  }
LABEL_22:
  AGX::FramebufferCompilerConfigGen3<AGX::G14X::Encoders,AGX::G14X::Classes,AGX::G14X::ObjClasses>::buildDrawBufferState((uint64_t)&v28);
  v25 = v29;
  *(_OWORD *)(a4 + 112) = v28;
  *(_OWORD *)(a4 + 128) = v25;
  *(_QWORD *)(a4 + 144) = v30;
  AGX::Impl::TileProgramKey::initCommon(a4, a1);
  *(_DWORD *)(a4 + 100) &= ~0x80u;
  if (a4 + 160 != a2)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 160), *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 5);
  if (a4 + 184 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 184), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  LOWORD(v28) = 256;
  *(_QWORD *)((char *)&v28 + 2) = 0;
  *(_DWORD *)((char *)&v28 + 10) = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a4, (unsigned __int8 *)&v28);
}

double AGX::ProgramKeyFactoryImpl<AGX::G14X::Classes,AGX::G14X::Encoders>::CreateBackgroundObjectProgramKey@<D0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  double result;
  __int128 v4;
  int v5;
  _OWORD v6[2];
  uint64_t v7;
  int v8;
  unsigned __int8 v9;
  unsigned __int16 v10;
  unsigned __int8 v11;

  *(_DWORD *)(a2 + 8) = 13;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFAA8;
  AGX::FramebufferCompilerConfig<AGX::G14X::Encoders,AGX::G14X::Classes,AGX::G14X::ObjClasses>::FramebufferCompilerConfig((uint64_t)v6, a1);
  AGX::FramebufferCompilerConfigGen3<AGX::G14X::Encoders,AGX::G14X::Classes,AGX::G14X::ObjClasses>::buildDrawBufferState((uint64_t)v6);
  result = *(double *)v6;
  v4 = v6[1];
  *(_OWORD *)(a2 + 40) = v6[0];
  *(_OWORD *)(a2 + 56) = v4;
  *(_QWORD *)(a2 + 72) = v7;
  *(_QWORD *)(a2 + 80) = 0;
  v5 = v10 | (v11 << 16) | (v8 << 24);
  *(_WORD *)(a2 + 84) = v9;
  *(_DWORD *)(a2 + 80) = v5;
  return result;
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G14X::Classes,AGX::G14X::Encoders>::CreateEndOfTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;
  int v28;
  _OWORD v29[2];
  uint64_t v30;
  _OWORD v31[2];
  uint64_t v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  unsigned __int8 v37;
  unsigned __int8 v38;
  unsigned int v39;
  _BYTE v40[40];

  *(_DWORD *)(a2 + 8) = 19;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)a2 = off_1E7ECFAE8;
  *(_OWORD *)(a2 + 40) = 0u;
  v3 = a2 + 40;
  *(_QWORD *)(a2 + 16) = 0;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(_OWORD *)(a2 + 88) = 0u;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_QWORD *)(a2 + 118) = 0;
  AGX::FramebufferCompilerConfig<AGX::G14X::Encoders,AGX::G14X::Classes,AGX::G14X::ObjClasses>::FramebufferCompilerConfig((uint64_t)v31, a1);
  result = AGX::FramebufferCompilerConfigGen3<AGX::G14X::Encoders,AGX::G14X::Classes,AGX::G14X::ObjClasses>::buildDrawBufferState((uint64_t)v31);
  v29[0] = v31[0];
  v29[1] = v31[1];
  v5 = v32;
  v30 = v32;
  v6 = v39;
  v7 = v33;
  v24 = v34;
  v8 = ((unint64_t)BYTE2(v32) << 36) | ((unint64_t)((unsigned __int16)v32 >> 12) << 32) | 0x40000000000000;
  *(_QWORD *)(a2 + 112) = v8;
  if (v7)
  {
    v9 = 0;
    v28 = 0;
    v10 = 0;
    v20 = (unsigned __int16)v5 >> 12;
    v23 = v38;
    v22 = HIWORD(v5) & 0x1FF;
    v21 = v37 & ~v36 | v35;
    v19 = v36 & ~v37 | v35;
    do
    {
      v11 = __clz(__rbit32(v7));
      v12 = *((_DWORD *)v29 + v11);
      v13 = *(_DWORD *)(v3 + 4 * v11) & 0xE3000000;
      result = AGX::PBEStateEncoderGen8<kAGXRevG14X>::StateFields::getDimensionality(v40[2 * v11], v40[2 * v11 + 1], v6);
      *(_DWORD *)(v3 + 4 * v11) = v13 & 0xE3FFE0FF | ((_DWORD)result << 16) & 0xE3FFFFFF | ((v12 & 0x1F) << 8) | (v12 >> 5 << 26) | ((v12 >> 12) / v22);
      v9 |= 1 << v11;
      v27 = (v12 >> 12) / v22;
      v28 |= (1 << v11) & v21;
      v14 = v23 & (1 << v11);
      v10 |= v14;
      if ((v24 & (1 << v11)) != 0)
      {
        v26 = v10;
        v15 = (v12 & 0x1F) << 8;
        v25 = (v12 << 21) & 0x1C000000;
        v16 = v11 + 8;
        v17 = (v12 << 16) & 0x1000000;
        if (v20 <= 1)
          v17 = 0;
        v18 = *(_DWORD *)(v3 + 4 * (v11 + 8)) & 0xE2000000 | v17;
        result = AGX::PBEStateEncoderGen8<kAGXRevG14X>::StateFields::getDimensionality(v40[2 * v11 + 16], v40[2 * v11 + 17], v6);
        *(_DWORD *)(v3 + 4 * v16) = v18 | ((_DWORD)result << 16) | v15 | v25 | v27;
        v9 |= 256 << v11;
        v28 |= ((v19 >> v11) & 1) << v16;
        v10 = ((v14 != 0) << v16) | v26;
      }
      v7 ^= 1 << v11;
    }
    while (v7);
    v8 = (unint64_t)*(unsigned int *)(a2 + 116) << 32;
  }
  else
  {
    LOWORD(v10) = 0;
    LOWORD(v28) = 0;
    LOWORD(v9) = 0;
  }
  *(_WORD *)(a2 + 120) = v9;
  *(_WORD *)(a2 + 122) = v28;
  *(_WORD *)(a2 + 124) = v10;
  *(_QWORD *)(a2 + 112) = v8 | (unsigned __int16)(v9 & ~(_WORD)v28) | ((unint64_t)(unsigned __int16)(v9 & v10) << 16);
  return result;
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G14X::Classes,AGX::G14X::Encoders>::CreateBVHBuilderProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 8) = 24;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFB68;
  *(_DWORD *)(a2 + 40) = 0;
  return AGX::BVHBuilderProgramKey::initializeWithDescriptor(a2, a1);
}

uint64_t AGX::FramebufferCompilerConfig<AGX::G15::Encoders,AGX::G15::Classes,AGX::G15::ObjClasses>::FramebufferCompilerConfig(uint64_t a1, int *a2)
{
  uint64_t v4;
  char *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  char *v23;
  unsigned int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  char *v29;
  uint64_t v30;
  char v31;
  int v32;
  char v33;
  uint64_t v34;
  int v35;
  int v36;
  int32x2_t v37;
  int v38;
  char *v39;
  uint64_t v40;
  char v41;
  int v42;
  char *v43;
  char v44;
  char v45;
  char v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  unsigned __int16 *v50;
  unsigned int v51;
  char v52;
  char v53;
  uint64_t v54;

  *(_OWORD *)(a1 + 63) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 80) = 1;
  *(_WORD *)(a1 + 84) = 0;
  *(_DWORD *)(a1 + 88) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  bzero((void *)a1, 0x28uLL);
  if (a2)
  {
    v4 = *a2;
    v5 = (char *)a2 - v4;
    v6 = *(unsigned __int16 *)((char *)a2 - v4);
    if (v6 < 5)
      goto LABEL_72;
    v7 = -v4;
    v8 = *((unsigned __int16 *)v5 + 2);
    if (*((_WORD *)v5 + 2))
    {
      v9 = (char *)a2 + v8;
      v10 = *(unsigned int *)((char *)a2 + v8);
      v11 = *(unsigned int *)((char *)a2 + v8 + v10);
      if ((_DWORD)v11)
      {
        v12 = 0;
        v13 = 0;
        v14 = v8 + v10;
        while (1)
        {
          v15 = *(unsigned int *)((char *)a2 + v14 + 4);
          v16 = (char *)a2 + v14 + v15;
          v17 = (char *)a2 + v14 + v15 - *((int *)v16 + 1);
          if (*((unsigned __int16 *)v17 + 2) >= 5u)
          {
            v18 = *((unsigned __int16 *)v17 + 4);
            if (v18)
            {
              v19 = *(unsigned __int16 *)((char *)a2 + v14 + v15 + v18 + 4);
              if (v19)
                break;
            }
          }
LABEL_47:
          if (v13 <= 6)
          {
            ++v13;
            v12 += 2;
            v14 += 4;
            if (v13 < v11)
              continue;
          }
          v48 = *a2;
          v7 = -v48;
          v6 = *(unsigned __int16 *)((char *)a2 - v48);
          goto LABEL_67;
        }
        v20 = &texFormatUnsupported;
        if (v19 <= 0x275)
          v20 = *(&off_1E7ECFB98 + v19 - 1);
        *(_QWORD *)(a1 + 8 * v13 + 96) = v20;
        v21 = 1 << v13;
        *(_DWORD *)(a1 + 40) |= 1 << v13;
        v22 = v15 - *((int *)v16 + 1);
        v23 = (char *)a2 + v14 + v22;
        v24 = *((unsigned __int16 *)v23 + 2);
        if (v24 < 0x19)
        {
          v26 = 0;
          LODWORD(v25) = 0;
          if (v24 < 0xF)
          {
LABEL_35:
            v26 = 0;
            v35 = 1 << v13;
LABEL_36:
            *(_DWORD *)(a1 + 52) |= v35;
            v37.i32[0] = v25;
            v37.i32[1] = v26 & 0xFFFFFFFD;
            *(int8x8_t *)(a1 + 60) = vorr_s8(*(int8x8_t *)(a1 + 60), vand_s8((int8x8_t)vdup_n_s32(v21), (int8x8_t)vceq_s32(v37, (int32x2_t)0x100000001)));
            if (v26 == 4)
              v38 = 1 << v13;
            else
              v38 = 0;
            *(_DWORD *)(a1 + 72) |= v38;
            v39 = (char *)a2 + v14 + v15 - *((int *)v16 + 1);
            if (*((unsigned __int16 *)v39 + 2) >= 7u && (v40 = *((unsigned __int16 *)v39 + 5)) != 0)
            {
              v41 = 0;
              v42 = *((unsigned __int8 *)a2 + v14 + v15 + v40 + 4);
              v43 = (char *)(a1 + v12 + 160);
              v44 = 2;
              v45 = 1;
              switch(v42)
              {
                case 0:
                case 1:
                  v44 = 1;
                  v41 = v42;
                  goto LABEL_53;
                case 3:
                  goto LABEL_58;
                case 4:
                  v46 = 2;
                  goto LABEL_44;
                case 5:
                  goto LABEL_52;
                case 6:
                  v41 = 1;
LABEL_52:
                  v44 = 4;
                  goto LABEL_53;
                case 7:
                  *v43 = 3;
                  *(_BYTE *)(a1 + v12 + 161) = 0;
LABEL_56:
                  v47 = 3;
                  break;
                case 8:
                  v45 = 3;
LABEL_58:
                  *v43 = 2;
                  *(_BYTE *)(a1 + v12 + 161) = v45;
LABEL_59:
                  *(_BYTE *)(a1 + 78) |= v21;
                  goto LABEL_45;
                default:
LABEL_53:
                  *v43 = v44;
                  *(_BYTE *)(a1 + v12 + 161) = v41;
                  v47 = 1;
                  switch(v42)
                  {
                    case 0:
                      goto LABEL_46;
                    case 1:
                      *(_BYTE *)(a1 + 78) |= v21;
                      v47 = 1;
                      break;
                    case 3:
                    case 5:
                    case 6:
                    case 8:
                      goto LABEL_59;
                    case 7:
                      goto LABEL_56;
                    default:
                      goto LABEL_45;
                  }
                  break;
              }
            }
            else
            {
              v46 = 0;
              v43 = (char *)(a1 + 2 * v13 + 160);
LABEL_44:
              *v43 = 2;
              *(_BYTE *)(a1 + v12 + 161) = v46;
LABEL_45:
              v47 = 2;
            }
LABEL_46:
            *(_WORD *)(a1 + 76) |= v47 << v12;
            v11 = *(unsigned int *)&v9[v10];
            goto LABEL_47;
          }
        }
        else
        {
          v25 = *((unsigned __int16 *)v23 + 14);
          if (v25)
            LODWORD(v25) = *((unsigned __int8 *)a2 + v14 + v15 + v25 + 4);
          if (v24 >= 0x1B && *(_WORD *)((char *)a2 + v14 + v22 + 30))
            v26 = *((unsigned __int8 *)a2 + v14 + v15 + *(unsigned __int16 *)((char *)a2 + v14 + v22 + 30) + 4);
          else
            v26 = 0;
        }
        v27 = *(unsigned __int16 *)((char *)a2 + v14 + v22 + 18);
        if (v27 && *(_WORD *)((char *)a2 + v14 + v15 + v27 + 4))
        {
          *(_DWORD *)(a1 + 48) |= v21;
          if ((v26 & 0xFE) == 2)
            v28 = 1 << v13;
          else
            v28 = 0;
          *(_DWORD *)(a1 + 68) |= v28;
          v29 = (char *)a2 + v14 + v15 - *((int *)v16 + 1);
          if (*((unsigned __int16 *)v29 + 2) >= 0x11u && (v30 = *((unsigned __int16 *)v29 + 10), *((_WORD *)v29 + 10)))
          {
            v31 = 0;
            v32 = *((unsigned __int8 *)a2 + v14 + v15 + v30 + 4);
            v33 = 2;
            switch(v32)
            {
              case 0:
              case 1:
                v33 = 1;
                v31 = v32;
                break;
              case 3:
                v31 = 1;
                break;
              case 4:
                v31 = 2;
                break;
              case 5:
                goto LABEL_62;
              case 6:
                v31 = 1;
LABEL_62:
                v33 = 4;
                break;
              case 7:
                v31 = 0;
                v33 = 3;
                break;
              case 8:
                v31 = 3;
                break;
              default:
                break;
            }
          }
          else
          {
            v31 = 0;
            v33 = 2;
          }
          v34 = a1 + v12;
          *(_BYTE *)(v34 + 176) = v33;
          *(_BYTE *)(v34 + 177) = v31;
        }
        v35 = 0;
        if ((_DWORD)v25 == 2)
          v36 = 1 << v13;
        else
          v36 = 0;
        *(_DWORD *)(a1 + 56) |= v36;
        if (v26)
          goto LABEL_36;
        goto LABEL_35;
      }
    }
LABEL_67:
    if (v6 >= 7
      && *(_WORD *)((char *)a2 + v7 + 6)
      && (v49 = *(_QWORD *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v7 + 6)), (v49 & 0xFFFFFFFE) != 0))
    {
      if (v49 > 0x7FF)
        LODWORD(v49) = 2048;
    }
    else
    {
LABEL_72:
      LODWORD(v49) = 1;
    }
    *(_DWORD *)(a1 + 80) = v49;
    v50 = (unsigned __int16 *)((char *)a2 - *a2);
    v51 = *v50;
    if (v51 < 0xB)
    {
      v53 = 1;
      *(_BYTE *)(a1 + 84) = 1;
      if (v51 < 9)
      {
LABEL_83:
        *(_BYTE *)(a1 + 85) = v53;
        return a1;
      }
    }
    else
    {
      if (v50[5])
        v52 = *((_BYTE *)a2 + v50[5]);
      else
        v52 = 1;
      *(_BYTE *)(a1 + 84) = v52;
    }
    v54 = v50[4];
    if (v54)
      v53 = *((_BYTE *)a2 + v54);
    else
      v53 = 1;
    goto LABEL_83;
  }
  return a1;
}

uint64_t AGX::FramebufferCompilerConfig<AGX::G15::Encoders,AGX::G15::Classes,AGX::G15::ObjClasses>::partitionSizeFromFormatAndCompCount(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 2:
    case 3:
    case 4:
    case 5:
      return a2;
    case 6:
    case 7:
    case 8:
    case 9:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 22:
      a2 = (2 * a2);
      break;
    case 10:
    case 11:
    case 17:
      a2 = (4 * a2);
      break;
    case 18:
    case 19:
    case 20:
    case 21:
      a2 = 4;
      break;
    default:
      a2 = 0;
      break;
  }
  return a2;
}

uint64_t AGX::FramebufferCompilerConfigGen3<AGX::G15::Encoders,AGX::G15::Classes,AGX::G15::ObjClasses>::buildDrawBufferState(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  char v12;
  uint64_t result;
  uint64_t v14;
  unsigned int *v15;
  uint64_t v16;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  unint64_t v30;
  int v31;
  int v32;
  int v33;
  unsigned int v34;
  int v35;

  v2 = 0;
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = v3;
  do
  {
    v5 = v4;
    if (!v4)
      break;
    v6 = __clz(__rbit32(v4));
    v7 = *(_QWORD *)(a1 + 8 * v6 + 96);
    if (*(_DWORD *)(v7 + 32) == 18)
      v8 = 9;
    else
      v8 = *(_DWORD *)(v7 + 32);
    v2 += AGX::FramebufferCompilerConfig<AGX::G15::Encoders,AGX::G15::Classes,AGX::G15::ObjClasses>::partitionSizeFromFormatAndCompCount(v8, *(unsigned int *)(v7 + 28));
    v9 = 1 << v6;
    if (v2 > 0x100)
      v9 = 0;
    v4 = v9 ^ v5;
  }
  while (v2 < 0x101);
  if (v3)
  {
    LODWORD(v10) = 0;
    v11 = 0;
    v12 = 0;
    LODWORD(result) = 0;
    v34 = v5;
    do
    {
      v14 = __clz(__rbit32(v3));
      v15 = *(unsigned int **)(a1 + 8 * v14 + 96);
      v16 = v15[7];
      if (v15[8] == 18 && v5 == 0)
        v18 = 9;
      else
        v18 = v15[8];
      v19 = 1 << v14;
      if (v18 == 18)
        v20 = 1 << v14;
      else
        v20 = 0;
      if (v18 == 3)
      {
        v21 = (v15[21] != 0) << 8;
        v22 = 1;
      }
      else
      {
        v35 = result;
        v23 = v20;
        LODWORD(result) = AGX::FramebufferCompilerConfig<AGX::G15::Encoders,AGX::G15::Classes,AGX::G15::ObjClasses>::partitionSizeFromFormatAndCompCount(v18, v16);
        v20 = v23;
        v19 = 1 << v14;
        LODWORD(v16) = result;
        v5 = v34;
        LODWORD(result) = v35;
        v21 = 0;
        v22 = 1;
        switch(v18)
        {
          case 2:
          case 4:
          case 5:
            break;
          case 6:
          case 7:
          case 8:
          case 9:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 22:
            v21 = 0;
            v22 = 2;
            break;
          case 10:
          case 11:
          case 17:
          case 18:
          case 19:
          case 20:
          case 21:
            v21 = 0;
            v22 = 4;
            break;
          default:
            v21 = 0;
            v22 = 0;
            break;
        }
      }
      result = v20 | result;
      v24 = v22 - 1;
      v25 = -v22;
      v26 = (v24 + v10) & v25;
      v12 |= (v26 + v16) > 0x100;
      v27 = (v24 + v11) & v25;
      if ((v12 & 1) != 0)
        v11 = v27 + v16;
      else
        LOBYTE(v27) = v26;
      v28 = v21 & 0xFFF00FFF | *(_DWORD *)(a1 + 4 * v14) & 0xFFF00EE0 | v18 & 0x1F | (v27 << 12);
      *(_DWORD *)(a1 + 4 * v14) = v28;
      v29 = v28 & 0xFFFFF1FF | ((v15[19] & 7) << 9);
      *(_DWORD *)(a1 + 4 * v14) = v29;
      if ((v12 & 1) != 0)
        v10 = v10;
      else
        v10 = (v26 + v16);
      *(_DWORD *)(a1 + 4 * v14) = v29 & 0xFFFFFF1F | (32 * (v15[7] & 7));
      v3 ^= v19;
    }
    while (v3);
    v30 = 256;
    if (((v10 + 7) & 0x1FFFFFF00) == 0)
      v30 = (v10 + 7) & 0x1FFFFFFF8;
    if (v30 <= 8)
      LODWORD(v30) = 8;
    v31 = (_DWORD)v30 << 16;
    if ((v12 & 1) != 0)
    {
      v31 = 0x1000000;
      v32 = 0x2000000;
    }
    else
    {
      v32 = 0;
    }
    v33 = *(unsigned __int8 *)(a1 + 40) | v32;
  }
  else
  {
    v11 = 0;
    result = 0;
    v33 = 0;
    v31 = 0x80000;
  }
  *(_DWORD *)(a1 + 32) = v33 | ((*(_BYTE *)(a1 + 84) & 0xF) << 8) | *(_DWORD *)(a1 + 32) & 0xFC000000 | v31 | ((*(_BYTE *)(a1 + 85) & 0xF) << 12);
  *(_DWORD *)(a1 + 88) = v11;
  *(_DWORD *)(a1 + 44) = result;
  return result;
}

uint64_t AGX::PBEStateEncoderGen9<kAGXRevG15>::StateFields::getDimensionality(int a1, char a2, unsigned int a3)
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  BOOL v5;

  if (a3 < 2)
    v3 = 2;
  else
    v3 = 3;
  if ((a2 & 1) != 0)
  {
    if ((a2 & 2) != 0)
      v4 = 8;
    else
      v4 = v3;
    v5 = a1 == 4;
LABEL_11:
    if (v5)
      return v3;
  }
  else
  {
    v4 = 5;
    switch(a1)
    {
      case 1:
        v4 = 2;
        break;
      case 2:
        v5 = (a2 & 2) == 0;
        v4 = 4;
        v3 = 2;
        goto LABEL_11;
      case 3:
        return v4;
      case 4:
        v4 = v3;
        break;
      default:
        v4 = -1;
        break;
    }
  }
  return v4;
}

_QWORD *AGCTargetImpl<AGX::G15::Classes,AGX::G15::Encoders>::CreateProgramKeyFactory@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_1E7ECF720;
  *a1 = result;
  return result;
}

void AGCTargetImpl<AGX::G15::Classes,AGX::G15::Encoders>::CreateTGSizeToTempTable(_DWORD *a1@<X1>, _QWORD *a2@<X8>)
{
  void *v4;
  void *v5;
  uint64_t v6;

  *a1 = 15;
  v4 = (void *)operator new[]();
  v5 = v4;
  v6 = *a1;
  if ((_DWORD)v6)
    memset_pattern16(v4, &unk_1C3E386C0, 4 * v6);
  *a2 = v5;
}

_QWORD *AGCTargetImpl<AGX::G15::Classes,AGX::G15::Encoders>::GetLegalizationPasses@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *result;
  uint64_t v6;
  int v7;
  const char *v8;
  const char *v9;
  char v10;
  const char *v11;
  char v12;
  const char *v13;
  char v14;
  const char *v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = "air-degenerate-vertex-amplification-emulation";
  v10 = 0;
  v11 = "air-raytracing-emulation,indirect-acceleration-structures";
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  v13 = "mtl-fetch-all-unaligned";
  v14 = 1;
  v15 = "air-bfloat-emulation";
  v16 = 0;
  result = malloc_type_malloc(0x20uLL, 0x10040436913F5uLL);
  v6 = 0;
  v7 = 0;
  *a2 = 0;
  do
  {
    if (LOBYTE((&v9)[v6 + 1]))
    {
      v8 = (&v9)[v6];
      *a2 = v7 + 1;
      result[v7++] = v8;
    }
    v6 += 2;
  }
  while (v6 != 8);
  *a3 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::G15::Classes,AGX::G15::Encoders>::requiresRayTracingEmulation()
{
  return 0;
}

uint64_t AGCTargetImpl<AGX::G15::Classes,AGX::G15::Encoders>::maxMSAASampleCount()
{
  return 4;
}

void AGX::ProgramKeyFactoryImpl<AGX::G15::Classes,AGX::G15::Encoders>::~ProgramKeyFactoryImpl()
{
  JUMPOUT(0x1CAA2D68CLL);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G15::Classes,AGX::G15::Encoders>::CreateVertexProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, int a6@<W6>, uint64_t a7@<X8>)
{
  uint64_t v14;
  int v15;
  _WORD v17[8];
  std::string v18;
  std::string v19;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v18, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v18 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v19, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v19 = *(std::string *)(a2 + 24);
  v14 = *(unsigned __int8 *)(a2 + 48);
  *(_DWORD *)(a7 + 8) = 3;
  *(_OWORD *)(a7 + 96) = 0u;
  *(_OWORD *)(a7 + 112) = 0u;
  *(_OWORD *)(a7 + 128) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 76) = 0u;
  *(_QWORD *)a7 = &off_1E7ED3720;
  *(std::string *)(a7 + 144) = v18;
  *(std::string *)(a7 + 168) = v19;
  *(_BYTE *)(a7 + 192) = v14;
  *(_QWORD *)(a7 + 56) = v14 << 18;
  AGX::Impl::VertexProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a7, a3);
  if (a7 + 96 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 96), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a7 + 120 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 120), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a6)
    v15 = 2;
  else
    v15 = 0;
  *(_DWORD *)(a7 + 88) = *(_DWORD *)(a7 + 88) & 0xFFFFFFFD | v15;
  memset(v17, 0, 14);
  return AGX::GeometrySharedKey<_AGCVertexContextStateAGP,(_AGCStreamToken)3>::setDeviceOptions(a7, (unsigned __int8 *)v17);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G15::Classes,AGX::G15::Encoders>::CreateObjectProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, int a3@<W3>, NSObject *a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  char *v11;
  int v12;
  int v13;
  _WORD v15[8];

  *(_DWORD *)(a7 + 8) = 9;
  *(_OWORD *)(a7 + 104) = 0u;
  v11 = (char *)(a7 + 104);
  *(_OWORD *)(a7 + 120) = 0u;
  *(_OWORD *)(a7 + 136) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 80) = 0u;
  *(_DWORD *)(a7 + 96) = 0;
  *(_QWORD *)a7 = &off_1E7ED37B0;
  if (a2)
    v12 = 2;
  else
    v12 = 0;
  if (a3)
    v13 = 4;
  else
    v13 = 0;
  *(_DWORD *)(a7 + 56) = v13 | v12;
  AGX::Impl::ObjectProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a7, a4);
  if (v11 != (char *)a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v11, *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a7 + 128 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 128), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  memset(v15, 0, 14);
  return AGX::GeometrySharedKey<_AGCObjectContextStateAGP,(_AGCStreamToken)9>::setDeviceOptions(a7, (unsigned __int8 *)v15);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G15::Classes,AGX::G15::Encoders>::CreateMeshProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, int a3@<W3>, int a4@<W4>, NSObject *a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, char a9)
{
  int v17;
  __int128 v18;
  int v19;
  int v20;
  int v21;
  _WORD v23[8];
  std::string v24;
  std::string v25;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v24, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v24 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v25, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v25 = *(std::string *)(a2 + 24);
  v17 = *(unsigned __int8 *)(a2 + 48);
  *(_OWORD *)(a8 + 104) = 0u;
  *(_DWORD *)(a8 + 8) = 10;
  *(_OWORD *)(a8 + 120) = 0u;
  *(_OWORD *)(a8 + 136) = 0u;
  *(_OWORD *)(a8 + 16) = 0u;
  *(_OWORD *)(a8 + 32) = 0u;
  *(_OWORD *)(a8 + 48) = 0u;
  *(_OWORD *)(a8 + 64) = 0u;
  *(_OWORD *)(a8 + 80) = 0u;
  *(_DWORD *)(a8 + 96) = 0;
  *(_QWORD *)a8 = &off_1E7ED3768;
  *(std::string *)(a8 + 152) = v24;
  v18 = *(_OWORD *)&v25.__r_.__value_.__l.__data_;
  *(_QWORD *)(a8 + 192) = *((_QWORD *)&v25.__r_.__value_.__l + 2);
  if (a3)
    v19 = 128;
  else
    v19 = 0;
  if (a4)
    v20 = 256;
  else
    v20 = 0;
  *(_OWORD *)(a8 + 176) = v18;
  *(_BYTE *)(a8 + 200) = v17;
  *(_DWORD *)(a8 + 56) = v20 | v19 | (16 * v17);
  AGX::Impl::MeshProgramKey::initCommon((AGX *)a8, a1);
  *(_DWORD *)(a8 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a8, a5);
  if (a8 + 104 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 104), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  if (a8 + 128 != a7)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 128), *(char **)a7, *(_QWORD *)(a7 + 8), (uint64_t)(*(_QWORD *)(a7 + 8) - *(_QWORD *)a7) >> 5);
  if (a9)
    v21 = 2;
  else
    v21 = 0;
  *(_DWORD *)(a8 + 96) = *(_DWORD *)(a8 + 96) & 0xFFFFFFFD | v21;
  memset(v23, 0, 14);
  return AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setDeviceOptions(a8, (unsigned __int8 *)v23);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G15::Classes,AGX::G15::Encoders>::CreateFragmentProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  char *v12;
  unsigned __int16 *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unsigned int v26;
  void *v27;
  char v28;
  int v29;
  uint64_t v30;
  __int128 v31;
  int v32;
  unsigned int v33;
  int v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[31];
  int v40;
  __int16 v41;
  int v42;
  _OWORD v43[6];

  *(_DWORD *)(a6 + 8) = 4;
  *(_QWORD *)(a6 + 24) = 0;
  *(_QWORD *)(a6 + 32) = 0;
  *(_QWORD *)(a6 + 16) = 0;
  *(_OWORD *)(a6 + 232) = 0u;
  v12 = (char *)(a6 + 232);
  *(_QWORD *)a6 = &off_1E7ED37F8;
  *(_OWORD *)(a6 + 40) = 0u;
  *(_OWORD *)(a6 + 56) = 0u;
  *(_OWORD *)(a6 + 72) = 0u;
  *(_OWORD *)(a6 + 88) = 0u;
  *(_OWORD *)(a6 + 104) = 0u;
  *(_OWORD *)(a6 + 120) = 0u;
  *(_OWORD *)(a6 + 136) = 0u;
  *(_OWORD *)(a6 + 152) = 0u;
  *(_OWORD *)(a6 + 168) = 0u;
  *(_OWORD *)(a6 + 184) = 0u;
  *(_OWORD *)(a6 + 200) = 0u;
  *(_OWORD *)(a6 + 209) = 0u;
  *(_OWORD *)(a6 + 248) = 0u;
  *(_OWORD *)(a6 + 264) = 0u;
  v38 = 0u;
  memset(v39, 0, sizeof(v39));
  v36 = 0u;
  v37 = 0u;
  v40 = 1;
  v41 = 0;
  v42 = 0;
  memset(v43, 0, sizeof(v43));
  bzero(&v36, 0x28uLL);
  if (!a1)
    goto LABEL_24;
  v13 = (unsigned __int16 *)((char *)a1 - *(int *)a1);
  v14 = *v13;
  if (v14 >= 0x17)
  {
    v15 = v13[11];
    if (!v13[11])
      goto LABEL_16;
    v16 = *(unsigned int *)((char *)a1 + v15);
    v17 = (unsigned int *)((char *)a1 + v15 + v16);
    v18 = *v17;
    if (!(_DWORD)v18)
      goto LABEL_16;
    v19 = 0;
    v20 = DWORD2(v38);
    v21 = (char *)a1 + v15 + v16;
    do
    {
      v22 = &v21[4 * v19];
      v23 = *((unsigned int *)v22 + 1);
      v24 = (char *)v17 + v23 - *(int *)&v22[v23 + 4];
      if (*((unsigned __int16 *)v24 + 2) >= 5u)
      {
        v25 = *((unsigned __int16 *)v24 + 4);
        if (v25)
        {
          v26 = *(unsigned __int16 *)((char *)v17 + v23 + v25 + 4);
          if (v26)
          {
            v27 = &texFormatUnsupported;
            if (v26 <= 0x275)
              v27 = *(&off_1E7ECFB98 + v26 - 1);
            *((_QWORD *)v43 + v19) = v27;
            v20 |= 1 << v19;
          }
        }
      }
      if (v19 > 6)
        break;
      ++v19;
      ++v17;
    }
    while (v19 < v18);
    DWORD2(v38) = v20;
  }
  if (v14 <= 0xC)
  {
    LOBYTE(v29) = 1;
    LOBYTE(v41) = 1;
LABEL_23:
    HIBYTE(v41) = v29;
    goto LABEL_24;
  }
LABEL_16:
  if (v13[6])
    v28 = *((_BYTE *)a1 + v13[6]);
  else
    v28 = 1;
  LOBYTE(v41) = v28;
  HIBYTE(v41) = v28;
  if (v14 >= 0xF)
  {
    v30 = v13[7];
    if (v30)
    {
      v29 = *((unsigned __int8 *)a1 + v30);
      if (v29)
        goto LABEL_23;
    }
  }
LABEL_24:
  AGX::FramebufferCompilerConfigGen3<AGX::G15::Encoders,AGX::G15::Classes,AGX::G15::ObjClasses>::buildDrawBufferState((uint64_t)&v36);
  v31 = v37;
  *(_OWORD *)(a6 + 112) = v36;
  *(_OWORD *)(a6 + 128) = v31;
  *(_QWORD *)(a6 + 144) = v38;
  AGX::Impl::FragmentProgramKey::initCommon((AGX *)a6, a1);
  v32 = *(_DWORD *)(a6 + 104);
  v33 = *(_DWORD *)(a6 + 100) & 0xFFFFFF7F;
  *(_DWORD *)(a6 + 40) &= ~0x10u;
  if (a2)
    v34 = 256;
  else
    v34 = 0;
  *(_DWORD *)(a6 + 100) = v33;
  *(_DWORD *)(a6 + 104) = v32 & 0xFFFFFEFF | v34;
  AGX::Impl::FragmentProgramKey::setSerializedDescriptor((AGX::Impl::FragmentProgramKey *)a6, a3);
  if (v12 != (char *)a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v12, *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a6 + 256 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a6 + 256), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  *(_QWORD *)((char *)&v36 + 6) = 0;
  *(_QWORD *)&v36 = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a6, (unsigned __int8 *)&v36);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G15::Classes,AGX::G15::Encoders>::CreateComputeProgramKey@<X0>(AGX *a1@<X1>, NSObject *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  _WORD v11[8];

  *(_DWORD *)(a5 + 8) = 6;
  *(_QWORD *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  *(_QWORD *)(a5 + 32) = 0;
  *(_QWORD *)(a5 + 40) = 0;
  *(_QWORD *)a5 = &off_1E7ED3878;
  *(_QWORD *)(a5 + 48) = 0;
  *(_QWORD *)(a5 + 56) = 0;
  std::string::basic_string[abi:nn180100]<0>((_QWORD *)(a5 + 64), (char *)&unk_1C3E4D9BB);
  *(_BYTE *)(a5 + 88) = 0;
  *(_OWORD *)(a5 + 96) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_OWORD *)(a5 + 128) = 0u;
  AGX::Impl::ComputeProgramKey::initCommon((AGX *)a5, a1);
  *(int8x8_t *)(a5 + 52) = vand_s8(*(int8x8_t *)(a5 + 52), (int8x8_t)0xFFFFFFFEFFFFFF7FLL);
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a5, a2);
  if (a5 + 96 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 96), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  if (a5 + 120 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 120), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  memset(v11, 0, 14);
  return AGX::Impl::ComputeProgramKey::setDeviceOptions(a5, (unsigned __int8 *)v11);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G15::Classes,AGX::G15::Encoders>::CreateTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, unint64_t a4@<X8>)
{
  unsigned __int16 *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unsigned int v21;
  void *v22;
  char v23;
  int v24;
  uint64_t v25;
  __int128 v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[31];
  int v32;
  __int16 v33;
  int v34;
  _OWORD v35[6];

  *(_DWORD *)(a4 + 8) = 5;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)a4 = &off_1E7ED3838;
  *(_OWORD *)(a4 + 40) = 0u;
  *(_OWORD *)(a4 + 56) = 0u;
  *(_OWORD *)(a4 + 72) = 0u;
  *(_OWORD *)(a4 + 88) = 0u;
  *(_OWORD *)(a4 + 104) = 0u;
  *(_OWORD *)(a4 + 120) = 0u;
  *(_OWORD *)(a4 + 136) = 0u;
  *(_OWORD *)(a4 + 152) = 0u;
  *(_OWORD *)(a4 + 168) = 0u;
  *(_OWORD *)(a4 + 184) = 0u;
  *(_QWORD *)(a4 + 200) = 0;
  v30 = 0u;
  memset(v31, 0, sizeof(v31));
  v28 = 0u;
  v29 = 0u;
  v32 = 1;
  v33 = 0;
  v34 = 0;
  memset(v35, 0, sizeof(v35));
  bzero(&v28, 0x28uLL);
  if (!a1)
    goto LABEL_24;
  v8 = (unsigned __int16 *)((char *)a1 - *a1);
  v9 = *v8;
  if (v9 < 0xF)
    goto LABEL_15;
  v10 = v8[7];
  if (v8[7])
  {
    v11 = *(unsigned int *)((char *)a1 + v10);
    v12 = (unsigned int *)((char *)a1 + v10 + v11);
    v13 = *v12;
    if ((_DWORD)v13)
    {
      v14 = 0;
      v15 = DWORD2(v30);
      v16 = (char *)a1 + v10 + v11;
      do
      {
        v17 = &v16[4 * v14];
        v18 = *((unsigned int *)v17 + 1);
        v19 = (char *)v12 + v18 - *(int *)&v17[v18 + 4];
        if (*((unsigned __int16 *)v19 + 2) >= 5u)
        {
          v20 = *((unsigned __int16 *)v19 + 4);
          if (v20)
          {
            v21 = *(unsigned __int16 *)((char *)v12 + v18 + v20 + 4);
            if (v21)
            {
              v22 = &texFormatUnsupported;
              if (v21 <= 0x275)
                v22 = *(&off_1E7ECFB98 + v21 - 1);
              *((_QWORD *)v35 + v14) = v22;
              v15 |= 1 << v14;
            }
          }
        }
        if (v14 > 6)
          break;
        ++v14;
        ++v12;
      }
      while (v14 < v13);
      DWORD2(v30) = v15;
LABEL_15:
      if (v9 <= 0xA)
      {
        LOBYTE(v24) = 1;
        LOBYTE(v33) = 1;
LABEL_23:
        HIBYTE(v33) = v24;
        goto LABEL_24;
      }
    }
  }
  if (v8[5])
    v23 = *((_BYTE *)a1 + v8[5]);
  else
    v23 = 1;
  LOBYTE(v33) = v23;
  HIBYTE(v33) = v23;
  if (v9 >= 0xD)
  {
    v25 = v8[6];
    if (v25)
    {
      v24 = *((unsigned __int8 *)a1 + v25);
      if (v24)
        goto LABEL_23;
    }
  }
LABEL_24:
  AGX::FramebufferCompilerConfigGen3<AGX::G15::Encoders,AGX::G15::Classes,AGX::G15::ObjClasses>::buildDrawBufferState((uint64_t)&v28);
  v26 = v29;
  *(_OWORD *)(a4 + 112) = v28;
  *(_OWORD *)(a4 + 128) = v26;
  *(_QWORD *)(a4 + 144) = v30;
  AGX::Impl::TileProgramKey::initCommon(a4, a1);
  *(_DWORD *)(a4 + 100) &= ~0x80u;
  if (a4 + 160 != a2)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 160), *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 5);
  if (a4 + 184 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 184), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  *(_QWORD *)((char *)&v28 + 6) = 0;
  *(_QWORD *)&v28 = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a4, (unsigned __int8 *)&v28);
}

double AGX::ProgramKeyFactoryImpl<AGX::G15::Classes,AGX::G15::Encoders>::CreateBackgroundObjectProgramKey@<D0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  double result;
  __int128 v4;
  int v5;
  _OWORD v6[2];
  uint64_t v7;
  int v8;
  unsigned __int8 v9;
  unsigned __int16 v10;
  unsigned __int8 v11;

  *(_DWORD *)(a2 + 8) = 13;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFAA8;
  AGX::FramebufferCompilerConfig<AGX::G15::Encoders,AGX::G15::Classes,AGX::G15::ObjClasses>::FramebufferCompilerConfig((uint64_t)v6, a1);
  AGX::FramebufferCompilerConfigGen3<AGX::G15::Encoders,AGX::G15::Classes,AGX::G15::ObjClasses>::buildDrawBufferState((uint64_t)v6);
  result = *(double *)v6;
  v4 = v6[1];
  *(_OWORD *)(a2 + 40) = v6[0];
  *(_OWORD *)(a2 + 56) = v4;
  *(_QWORD *)(a2 + 72) = v7;
  *(_QWORD *)(a2 + 80) = 0;
  v5 = v10 | (v11 << 16) | (v8 << 24);
  *(_WORD *)(a2 + 84) = v9;
  *(_DWORD *)(a2 + 80) = v5;
  return result;
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G15::Classes,AGX::G15::Encoders>::CreateEndOfTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;
  int v28;
  _OWORD v29[2];
  uint64_t v30;
  _OWORD v31[2];
  uint64_t v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  unsigned __int8 v37;
  unsigned __int8 v38;
  unsigned int v39;
  _BYTE v40[40];

  *(_DWORD *)(a2 + 8) = 19;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)a2 = off_1E7ECFAE8;
  *(_OWORD *)(a2 + 40) = 0u;
  v3 = a2 + 40;
  *(_QWORD *)(a2 + 16) = 0;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(_OWORD *)(a2 + 88) = 0u;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_QWORD *)(a2 + 118) = 0;
  AGX::FramebufferCompilerConfig<AGX::G15::Encoders,AGX::G15::Classes,AGX::G15::ObjClasses>::FramebufferCompilerConfig((uint64_t)v31, a1);
  result = AGX::FramebufferCompilerConfigGen3<AGX::G15::Encoders,AGX::G15::Classes,AGX::G15::ObjClasses>::buildDrawBufferState((uint64_t)v31);
  v29[0] = v31[0];
  v29[1] = v31[1];
  v5 = v32;
  v30 = v32;
  v6 = v39;
  v7 = v33;
  v24 = v34;
  v8 = ((unint64_t)BYTE2(v32) << 36) | ((unint64_t)((unsigned __int16)v32 >> 12) << 32) | 0x40000000000000;
  *(_QWORD *)(a2 + 112) = v8;
  if (v7)
  {
    v9 = 0;
    v28 = 0;
    v10 = 0;
    v20 = (unsigned __int16)v5 >> 12;
    v23 = v38;
    v22 = HIWORD(v5) & 0x1FF;
    v21 = v37 & ~v36 | v35;
    v19 = v36 & ~v37 | v35;
    do
    {
      v11 = __clz(__rbit32(v7));
      v12 = *((_DWORD *)v29 + v11);
      v13 = *(_DWORD *)(v3 + 4 * v11) & 0xE3000000;
      result = AGX::PBEStateEncoderGen9<kAGXRevG15>::StateFields::getDimensionality(v40[2 * v11], v40[2 * v11 + 1], v6);
      *(_DWORD *)(v3 + 4 * v11) = v13 & 0xE3FFE0FF | ((_DWORD)result << 16) & 0xE3FFFFFF | ((v12 & 0x1F) << 8) | (v12 >> 5 << 26) | ((v12 >> 12) / v22);
      v9 |= 1 << v11;
      v27 = (v12 >> 12) / v22;
      v28 |= (1 << v11) & v21;
      v14 = v23 & (1 << v11);
      v10 |= v14;
      if ((v24 & (1 << v11)) != 0)
      {
        v26 = v10;
        v15 = (v12 & 0x1F) << 8;
        v25 = (v12 << 21) & 0x1C000000;
        v16 = v11 + 8;
        v17 = (v12 << 16) & 0x1000000;
        if (v20 <= 1)
          v17 = 0;
        v18 = *(_DWORD *)(v3 + 4 * (v11 + 8)) & 0xE2000000 | v17;
        result = AGX::PBEStateEncoderGen9<kAGXRevG15>::StateFields::getDimensionality(v40[2 * v11 + 16], v40[2 * v11 + 17], v6);
        *(_DWORD *)(v3 + 4 * v16) = v18 | ((_DWORD)result << 16) | v15 | v25 | v27;
        v9 |= 256 << v11;
        v28 |= ((v19 >> v11) & 1) << v16;
        v10 = ((v14 != 0) << v16) | v26;
      }
      v7 ^= 1 << v11;
    }
    while (v7);
    v8 = (unint64_t)*(unsigned int *)(a2 + 116) << 32;
  }
  else
  {
    LOWORD(v10) = 0;
    LOWORD(v28) = 0;
    LOWORD(v9) = 0;
  }
  *(_WORD *)(a2 + 120) = v9;
  *(_WORD *)(a2 + 122) = v28;
  *(_WORD *)(a2 + 124) = v10;
  *(_QWORD *)(a2 + 112) = v8 | (unsigned __int16)(v9 & ~(_WORD)v28) | ((unint64_t)(unsigned __int16)(v9 & v10) << 16);
  return result;
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G15::Classes,AGX::G15::Encoders>::CreateBVHBuilderProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 8) = 24;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFB68;
  *(_DWORD *)(a2 + 40) = 0;
  return AGX::BVHBuilderProgramKey::initializeWithDescriptor(a2, a1);
}

uint64_t AGCTargetImplG15P::requiresRayTracingEmulation(AGCTargetImplG15P *this)
{
  return 1;
}

uint64_t AGX::FramebufferCompilerConfig<AGX::G15_AGX2::Encoders,AGX::G15_AGX2::Classes,AGX::G15_AGX2::ObjClasses>::FramebufferCompilerConfig(uint64_t a1, int *a2)
{
  MTLPixelFormat v4;
  uint64_t v5;
  char *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  __int32 v24;
  int v25;
  uint64_t v26;
  int v27;
  char *v28;
  uint64_t v29;
  char v30;
  int v31;
  char v32;
  uint64_t v33;
  int v34;
  int v35;
  int32x2_t v36;
  int v37;
  char *v38;
  uint64_t v39;
  char v40;
  int v41;
  char *v42;
  char v43;
  char v44;
  char v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  unsigned __int16 *v49;
  unsigned int v50;
  char v51;
  char v52;
  uint64_t v53;

  *(_OWORD *)(a1 + 63) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 80) = 1;
  *(_WORD *)(a1 + 84) = 0;
  *(_DWORD *)(a1 + 88) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  bzero((void *)a1, 0x28uLL);
  if (a2)
  {
    v5 = *a2;
    v6 = (char *)a2 - v5;
    v7 = *(unsigned __int16 *)((char *)a2 - v5);
    if (v7 < 5)
      goto LABEL_71;
    v8 = -v5;
    v9 = *((unsigned __int16 *)v6 + 2);
    if (*((_WORD *)v6 + 2))
    {
      v10 = (char *)a2 + v9;
      v11 = *(unsigned int *)((char *)a2 + v9);
      v12 = *(unsigned int *)((char *)a2 + v9 + v11);
      if ((_DWORD)v12)
      {
        v13 = 0;
        v14 = 0;
        v15 = v9 + v11;
        while (1)
        {
          v16 = *(unsigned int *)((char *)a2 + v15 + 4);
          v17 = (char *)a2 + v15 + v16;
          v18 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v18 + 2) >= 5u)
          {
            v19 = *((unsigned __int16 *)v18 + 4);
            if (v19)
            {
              v20 = (char *)a2 + v15 + v16 + v19;
              if (*((_WORD *)v20 + 2))
                break;
            }
          }
LABEL_46:
          if (v14 <= 6)
          {
            ++v14;
            v13 += 2;
            v15 += 4;
            if (v14 < v12)
              continue;
          }
          v47 = *a2;
          v8 = -v47;
          v7 = *(unsigned __int16 *)((char *)a2 - v47);
          goto LABEL_66;
        }
        *(_QWORD *)(a1 + 8 * v14 + 96) = AGX::G15_AGX2::TextureFormatTable::chooseTextureFormatCPP((AGX::G15_AGX2::TextureFormatTable *)*((unsigned __int16 *)v20 + 2), v4);
        v21 = 1 << v14;
        *(_DWORD *)(a1 + 40) |= 1 << v14;
        v22 = v16 - *((int *)v17 + 1);
        v23 = *(unsigned __int16 *)((char *)a2 + v15 + v22 + 4);
        if (v23 < 0x19)
        {
          v25 = 0;
          v24 = 0;
          if (v23 < 0xF)
          {
LABEL_34:
            v25 = 0;
            v34 = 1 << v14;
LABEL_35:
            *(_DWORD *)(a1 + 52) |= v34;
            v36.i32[0] = v24;
            v36.i32[1] = v25 & 0xFFFFFFFD;
            *(int8x8_t *)(a1 + 60) = vorr_s8(*(int8x8_t *)(a1 + 60), vand_s8((int8x8_t)vdup_n_s32(v21), (int8x8_t)vceq_s32(v36, (int32x2_t)0x100000001)));
            if (v25 == 4)
              v37 = 1 << v14;
            else
              v37 = 0;
            *(_DWORD *)(a1 + 72) |= v37;
            v38 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
            if (*((unsigned __int16 *)v38 + 2) >= 7u && (v39 = *((unsigned __int16 *)v38 + 5)) != 0)
            {
              v40 = 0;
              v41 = *((unsigned __int8 *)a2 + v15 + v16 + v39 + 4);
              v42 = (char *)(a1 + v13 + 160);
              v43 = 2;
              v44 = 1;
              switch(v41)
              {
                case 0:
                case 1:
                  v43 = 1;
                  v40 = v41;
                  goto LABEL_52;
                case 3:
                  goto LABEL_57;
                case 4:
                  v45 = 2;
                  goto LABEL_43;
                case 5:
                  goto LABEL_51;
                case 6:
                  v40 = 1;
LABEL_51:
                  v43 = 4;
                  goto LABEL_52;
                case 7:
                  *v42 = 3;
                  *(_BYTE *)(a1 + v13 + 161) = 0;
LABEL_55:
                  v46 = 3;
                  break;
                case 8:
                  v44 = 3;
LABEL_57:
                  *v42 = 2;
                  *(_BYTE *)(a1 + v13 + 161) = v44;
LABEL_58:
                  *(_BYTE *)(a1 + 78) |= v21;
                  goto LABEL_44;
                default:
LABEL_52:
                  *v42 = v43;
                  *(_BYTE *)(a1 + v13 + 161) = v40;
                  v46 = 1;
                  switch(v41)
                  {
                    case 0:
                      goto LABEL_45;
                    case 1:
                      *(_BYTE *)(a1 + 78) |= v21;
                      v46 = 1;
                      break;
                    case 3:
                    case 5:
                    case 6:
                    case 8:
                      goto LABEL_58;
                    case 7:
                      goto LABEL_55;
                    default:
                      goto LABEL_44;
                  }
                  break;
              }
            }
            else
            {
              v45 = 0;
              v42 = (char *)(a1 + 2 * v14 + 160);
LABEL_43:
              *v42 = 2;
              *(_BYTE *)(a1 + v13 + 161) = v45;
LABEL_44:
              v46 = 2;
            }
LABEL_45:
            *(_WORD *)(a1 + 76) |= v46 << v13;
            v12 = *(unsigned int *)&v10[v11];
            goto LABEL_46;
          }
        }
        else
        {
          if (*(_WORD *)((char *)a2 + v15 + v22 + 28))
            v24 = *((unsigned __int8 *)a2 + v15 + v16 + *(unsigned __int16 *)((char *)a2 + v15 + v22 + 28) + 4);
          else
            v24 = 0;
          if (v23 >= 0x1B && *(_WORD *)((char *)a2 + v15 + v22 + 30))
            v25 = *((unsigned __int8 *)a2 + v15 + v16 + *(unsigned __int16 *)((char *)a2 + v15 + v22 + 30) + 4);
          else
            v25 = 0;
        }
        v26 = *(unsigned __int16 *)((char *)a2 + v15 + v22 + 18);
        if (v26 && *(_WORD *)((char *)a2 + v15 + v16 + v26 + 4))
        {
          *(_DWORD *)(a1 + 48) |= v21;
          if ((v25 & 0xFE) == 2)
            v27 = 1 << v14;
          else
            v27 = 0;
          *(_DWORD *)(a1 + 68) |= v27;
          v28 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v28 + 2) >= 0x11u && (v29 = *((unsigned __int16 *)v28 + 10), *((_WORD *)v28 + 10)))
          {
            v30 = 0;
            v31 = *((unsigned __int8 *)a2 + v15 + v16 + v29 + 4);
            v32 = 2;
            switch(v31)
            {
              case 0:
              case 1:
                v32 = 1;
                v30 = v31;
                break;
              case 3:
                v30 = 1;
                break;
              case 4:
                v30 = 2;
                break;
              case 5:
                goto LABEL_61;
              case 6:
                v30 = 1;
LABEL_61:
                v32 = 4;
                break;
              case 7:
                v30 = 0;
                v32 = 3;
                break;
              case 8:
                v30 = 3;
                break;
              default:
                break;
            }
          }
          else
          {
            v30 = 0;
            v32 = 2;
          }
          v33 = a1 + v13;
          *(_BYTE *)(v33 + 176) = v32;
          *(_BYTE *)(v33 + 177) = v30;
        }
        v34 = 0;
        if (v24 == 2)
          v35 = 1 << v14;
        else
          v35 = 0;
        *(_DWORD *)(a1 + 56) |= v35;
        if (v25)
          goto LABEL_35;
        goto LABEL_34;
      }
    }
LABEL_66:
    if (v7 >= 7
      && *(_WORD *)((char *)a2 + v8 + 6)
      && (v48 = *(_QWORD *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v8 + 6)), (v48 & 0xFFFFFFFE) != 0))
    {
      if (v48 > 0x7FF)
        LODWORD(v48) = 2048;
    }
    else
    {
LABEL_71:
      LODWORD(v48) = 1;
    }
    *(_DWORD *)(a1 + 80) = v48;
    v49 = (unsigned __int16 *)((char *)a2 - *a2);
    v50 = *v49;
    if (v50 < 0xB)
    {
      v52 = 1;
      *(_BYTE *)(a1 + 84) = 1;
      if (v50 < 9)
      {
LABEL_82:
        *(_BYTE *)(a1 + 85) = v52;
        return a1;
      }
    }
    else
    {
      if (v49[5])
        v51 = *((_BYTE *)a2 + v49[5]);
      else
        v51 = 1;
      *(_BYTE *)(a1 + 84) = v51;
    }
    v53 = v49[4];
    if (v53)
      v52 = *((_BYTE *)a2 + v53);
    else
      v52 = 1;
    goto LABEL_82;
  }
  return a1;
}

uint64_t AGX::FramebufferCompilerConfig<AGX::G15_AGX2::Encoders,AGX::G15_AGX2::Classes,AGX::G15_AGX2::ObjClasses>::partitionSizeFromFormatAndCompCount(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 2:
    case 3:
    case 4:
    case 5:
      return a2;
    case 6:
    case 7:
    case 8:
    case 9:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 22:
      a2 = (2 * a2);
      break;
    case 10:
    case 11:
    case 17:
      a2 = (4 * a2);
      break;
    case 18:
    case 19:
    case 20:
    case 21:
      a2 = 4;
      break;
    default:
      a2 = 0;
      break;
  }
  return a2;
}

uint64_t AGX::FramebufferCompilerConfigGen3<AGX::G15_AGX2::Encoders,AGX::G15_AGX2::Classes,AGX::G15_AGX2::ObjClasses>::buildDrawBufferState(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  char v12;
  uint64_t result;
  uint64_t v14;
  unsigned int *v15;
  uint64_t v16;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  unsigned __int8 v28;
  int v29;
  unsigned int v30;
  unsigned int v31;
  unint64_t v32;
  int v33;
  int v34;
  int v35;
  unsigned int v36;
  int v37;

  v2 = 0;
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = v3;
  do
  {
    v5 = v4;
    if (!v4)
      break;
    v6 = __clz(__rbit32(v4));
    v7 = *(_QWORD *)(a1 + 8 * v6 + 96);
    if (*(_DWORD *)(v7 + 32) == 18)
      v8 = 9;
    else
      v8 = *(_DWORD *)(v7 + 32);
    v2 += AGX::FramebufferCompilerConfig<AGX::G15_AGX2::Encoders,AGX::G15_AGX2::Classes,AGX::G15_AGX2::ObjClasses>::partitionSizeFromFormatAndCompCount(v8, *(unsigned int *)(v7 + 28));
    v9 = 1 << v6;
    if (v2 > 0x40)
      v9 = 0;
    v4 = v9 ^ v5;
  }
  while (v2 < 0x41);
  if (v3)
  {
    LODWORD(v10) = 0;
    v11 = 0;
    v12 = 0;
    LODWORD(result) = 0;
    v36 = v5;
    do
    {
      v14 = __clz(__rbit32(v3));
      v15 = *(unsigned int **)(a1 + 8 * v14 + 96);
      v16 = v15[7];
      if (v15[8] == 18 && v5 == 0)
        v18 = 9;
      else
        v18 = v15[8];
      v19 = 1 << v14;
      if (v18 == 18)
        v20 = 1 << v14;
      else
        v20 = 0;
      if (v18 == 3)
      {
        v21 = (v15[21] != 0) << 8;
        v22 = 1;
      }
      else
      {
        v37 = result;
        v23 = v20;
        LODWORD(result) = AGX::FramebufferCompilerConfig<AGX::G15_AGX2::Encoders,AGX::G15_AGX2::Classes,AGX::G15_AGX2::ObjClasses>::partitionSizeFromFormatAndCompCount(v18, v16);
        v20 = v23;
        v19 = 1 << v14;
        LODWORD(v16) = result;
        v5 = v36;
        LODWORD(result) = v37;
        v21 = 0;
        v22 = 1;
        switch(v18)
        {
          case 2:
          case 4:
          case 5:
            break;
          case 6:
          case 7:
          case 8:
          case 9:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 22:
            v21 = 0;
            v22 = 2;
            break;
          case 10:
          case 11:
          case 17:
          case 18:
          case 19:
          case 20:
          case 21:
            v21 = 0;
            v22 = 4;
            break;
          default:
            v21 = 0;
            v22 = 0;
            break;
        }
      }
      result = v20 | result;
      v24 = v22 - 1;
      v25 = -v22;
      v26 = (v24 + v10) & v25;
      v12 |= (v26 + v16) > 0x40;
      v27 = (v24 + v11) & v25;
      v28 = v27 + 64;
      v29 = v27 + v16;
      if ((v12 & 1) != 0)
        v11 = v29;
      else
        v28 = v26;
      v30 = v21 & 0xFFF00FFF | *(_DWORD *)(a1 + 4 * v14) & 0xFFF00EE0 | v18 & 0x1F | (v28 << 12);
      *(_DWORD *)(a1 + 4 * v14) = v30;
      v31 = v30 & 0xFFFFF1FF | ((v15[19] & 7) << 9);
      *(_DWORD *)(a1 + 4 * v14) = v31;
      if ((v12 & 1) != 0)
        v10 = v10;
      else
        v10 = (v26 + v16);
      *(_DWORD *)(a1 + 4 * v14) = v31 & 0xFFFFFF1F | (32 * (v15[7] & 7));
      v3 ^= v19;
    }
    while (v3);
    v32 = 64;
    if (((v10 + 7) & 0x1FFFFFFC0) == 0)
      v32 = (v10 + 7) & 0x1FFFFFFF8;
    if (v32 <= 8)
      LODWORD(v32) = 8;
    v33 = (_DWORD)v32 << 16;
    if ((v12 & 1) != 0)
    {
      v33 = 0x400000;
      v34 = 0x2000000;
    }
    else
    {
      v34 = 0;
    }
    v35 = *(unsigned __int8 *)(a1 + 40) | v34;
  }
  else
  {
    v11 = 0;
    result = 0;
    v35 = 0;
    v33 = 0x80000;
  }
  *(_DWORD *)(a1 + 32) = v35 | ((*(_BYTE *)(a1 + 84) & 0xF) << 8) | *(_DWORD *)(a1 + 32) & 0xFC000000 | v33 | ((*(_BYTE *)(a1 + 85) & 0xF) << 12);
  *(_DWORD *)(a1 + 88) = v11;
  *(_DWORD *)(a1 + 44) = result;
  return result;
}

uint64_t AGX::PBEStateEncoderGen8<kAGXRevG15_AGX2>::StateFields::getDimensionality(int a1, char a2, unsigned int a3)
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  BOOL v5;

  if (a3 < 2)
    v3 = 2;
  else
    v3 = 3;
  if ((a2 & 1) != 0)
  {
    if ((a2 & 2) != 0)
      v4 = 8;
    else
      v4 = v3;
    v5 = a1 == 4;
LABEL_11:
    if (v5)
      return v3;
  }
  else
  {
    v4 = 5;
    switch(a1)
    {
      case 1:
        v4 = 2;
        break;
      case 2:
        v5 = (a2 & 2) == 0;
        v4 = 4;
        v3 = 2;
        goto LABEL_11;
      case 3:
        return v4;
      case 4:
        v4 = v3;
        break;
      default:
        v4 = -1;
        break;
    }
  }
  return v4;
}

_QWORD *AGCTargetImpl<AGX::G15_AGX2::Classes,AGX::G15_AGX2::Encoders>::CreateProgramKeyFactory@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_1E7ECF7C0;
  *a1 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::G15_AGX2::Classes,AGX::G15_AGX2::Encoders>::CreateTGSizeToTempTable@<X0>(_DWORD *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;

  *a1 = 32;
  result = operator new[]();
  v5 = *a1;
  if ((_DWORD)v5)
  {
    v6 = 0;
    v7 = -53;
    do
    {
      if (v7 > 0xFFFFFFC7)
        v8 = 1024;
      else
        v8 = (2 * (0x1A00 / (v6 & 0x3FFFFFFF))) & 0x3FC0;
      *(_DWORD *)(result + 4 * v6++) = v8;
      v7 += 4;
    }
    while (v5 != v6);
  }
  *a2 = result;
  return result;
}

_QWORD *AGCTargetImpl<AGX::G15_AGX2::Classes,AGX::G15_AGX2::Encoders>::GetLegalizationPasses@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *result;
  uint64_t v6;
  int v7;
  const char *v8;
  const char *v9;
  char v10;
  const char *v11;
  char v12;
  const char *v13;
  char v14;
  const char *v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = "air-degenerate-vertex-amplification-emulation";
  v10 = 0;
  v11 = "air-raytracing-emulation,indirect-acceleration-structures";
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  v13 = "mtl-fetch-all-unaligned";
  v14 = 1;
  v15 = "air-bfloat-emulation";
  v16 = 1;
  result = malloc_type_malloc(0x20uLL, 0x10040436913F5uLL);
  v6 = 0;
  v7 = 0;
  *a2 = 0;
  do
  {
    if (LOBYTE((&v9)[v6 + 1]))
    {
      v8 = (&v9)[v6];
      *a2 = v7 + 1;
      result[v7++] = v8;
    }
    v6 += 2;
  }
  while (v6 != 8);
  *a3 = result;
  return result;
}

uint64_t AGCTargetImplG15_AGX2::requiresRayTracingEmulation(AGCTargetImplG15_AGX2 *this)
{
  return 1;
}

uint64_t AGCTargetImpl<AGX::G15_AGX2::Classes,AGX::G15_AGX2::Encoders>::maxMSAASampleCount()
{
  return 4;
}

void AGX::ProgramKeyFactoryImpl<AGX::G15_AGX2::Classes,AGX::G15_AGX2::Encoders>::~ProgramKeyFactoryImpl()
{
  JUMPOUT(0x1CAA2D68CLL);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G15_AGX2::Classes,AGX::G15_AGX2::Encoders>::CreateVertexProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, int a6@<W6>, uint64_t a7@<X8>)
{
  uint64_t v14;
  int v15;
  __int16 v17;
  uint64_t v18;
  int v19;
  std::string v20;
  std::string v21;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v20 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v21, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v21 = *(std::string *)(a2 + 24);
  v14 = *(unsigned __int8 *)(a2 + 48);
  *(_DWORD *)(a7 + 8) = 3;
  *(_OWORD *)(a7 + 96) = 0u;
  *(_OWORD *)(a7 + 112) = 0u;
  *(_OWORD *)(a7 + 128) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 76) = 0u;
  *(_QWORD *)a7 = &off_1E7ED3720;
  *(std::string *)(a7 + 144) = v20;
  *(std::string *)(a7 + 168) = v21;
  *(_BYTE *)(a7 + 192) = v14;
  *(_QWORD *)(a7 + 56) = v14 << 18;
  AGX::Impl::VertexProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a7, a3);
  if (a7 + 96 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 96), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a7 + 120 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 120), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a6)
    v15 = 2;
  else
    v15 = 0;
  *(_DWORD *)(a7 + 88) = *(_DWORD *)(a7 + 88) & 0xFFFFFFFD | v15;
  v17 = 256;
  v18 = 0;
  v19 = 0;
  return AGX::GeometrySharedKey<_AGCVertexContextStateAGP,(_AGCStreamToken)3>::setDeviceOptions(a7, (unsigned __int8 *)&v17);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G15_AGX2::Classes,AGX::G15_AGX2::Encoders>::CreateObjectProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, int a3@<W3>, NSObject *a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  char *v11;
  int v12;
  int v13;
  __int16 v15;
  uint64_t v16;
  int v17;

  *(_DWORD *)(a7 + 8) = 9;
  *(_OWORD *)(a7 + 104) = 0u;
  v11 = (char *)(a7 + 104);
  *(_OWORD *)(a7 + 120) = 0u;
  *(_OWORD *)(a7 + 136) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 80) = 0u;
  *(_DWORD *)(a7 + 96) = 0;
  *(_QWORD *)a7 = &off_1E7ED37B0;
  if (a2)
    v12 = 2;
  else
    v12 = 0;
  if (a3)
    v13 = 4;
  else
    v13 = 0;
  *(_DWORD *)(a7 + 56) = v13 | v12;
  AGX::Impl::ObjectProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a7, a4);
  if (v11 != (char *)a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v11, *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a7 + 128 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 128), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  v15 = 256;
  v16 = 0;
  v17 = 0;
  return AGX::GeometrySharedKey<_AGCObjectContextStateAGP,(_AGCStreamToken)9>::setDeviceOptions(a7, (unsigned __int8 *)&v15);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G15_AGX2::Classes,AGX::G15_AGX2::Encoders>::CreateMeshProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, int a3@<W3>, int a4@<W4>, NSObject *a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, char a9)
{
  int v17;
  __int128 v18;
  int v19;
  int v20;
  int v21;
  __int16 v23;
  uint64_t v24;
  int v25;
  std::string v26;
  std::string v27;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v26, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v26 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v27, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v27 = *(std::string *)(a2 + 24);
  v17 = *(unsigned __int8 *)(a2 + 48);
  *(_OWORD *)(a8 + 104) = 0u;
  *(_DWORD *)(a8 + 8) = 10;
  *(_OWORD *)(a8 + 120) = 0u;
  *(_OWORD *)(a8 + 136) = 0u;
  *(_OWORD *)(a8 + 16) = 0u;
  *(_OWORD *)(a8 + 32) = 0u;
  *(_OWORD *)(a8 + 48) = 0u;
  *(_OWORD *)(a8 + 64) = 0u;
  *(_OWORD *)(a8 + 80) = 0u;
  *(_DWORD *)(a8 + 96) = 0;
  *(_QWORD *)a8 = &off_1E7ED3768;
  *(std::string *)(a8 + 152) = v26;
  v18 = *(_OWORD *)&v27.__r_.__value_.__l.__data_;
  *(_QWORD *)(a8 + 192) = *((_QWORD *)&v27.__r_.__value_.__l + 2);
  if (a3)
    v19 = 128;
  else
    v19 = 0;
  if (a4)
    v20 = 256;
  else
    v20 = 0;
  *(_OWORD *)(a8 + 176) = v18;
  *(_BYTE *)(a8 + 200) = v17;
  *(_DWORD *)(a8 + 56) = v20 | v19 | (16 * v17);
  AGX::Impl::MeshProgramKey::initCommon((AGX *)a8, a1);
  *(_DWORD *)(a8 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a8, a5);
  if (a8 + 104 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 104), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  if (a8 + 128 != a7)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 128), *(char **)a7, *(_QWORD *)(a7 + 8), (uint64_t)(*(_QWORD *)(a7 + 8) - *(_QWORD *)a7) >> 5);
  if (a9)
    v21 = 2;
  else
    v21 = 0;
  *(_DWORD *)(a8 + 96) = *(_DWORD *)(a8 + 96) & 0xFFFFFFFD | v21;
  v23 = 256;
  v24 = 0;
  v25 = 0;
  return AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setDeviceOptions(a8, (unsigned __int8 *)&v23);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G15_AGX2::Classes,AGX::G15_AGX2::Encoders>::CreateFragmentProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  char *v12;
  MTLPixelFormat v13;
  unsigned __int16 *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char v28;
  char v29;
  __int128 v30;
  int v31;
  unsigned int v32;
  int v33;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[31];
  int v43;
  __int16 v44;
  int v45;
  _OWORD v46[7];

  *(_DWORD *)(a6 + 8) = 4;
  *(_QWORD *)(a6 + 24) = 0;
  *(_QWORD *)(a6 + 32) = 0;
  *(_QWORD *)(a6 + 16) = 0;
  *(_OWORD *)(a6 + 232) = 0u;
  v12 = (char *)(a6 + 232);
  *(_QWORD *)a6 = &off_1E7ED37F8;
  *(_OWORD *)(a6 + 40) = 0u;
  *(_OWORD *)(a6 + 56) = 0u;
  *(_OWORD *)(a6 + 72) = 0u;
  *(_OWORD *)(a6 + 88) = 0u;
  *(_OWORD *)(a6 + 104) = 0u;
  *(_OWORD *)(a6 + 120) = 0u;
  *(_OWORD *)(a6 + 136) = 0u;
  *(_OWORD *)(a6 + 152) = 0u;
  *(_OWORD *)(a6 + 168) = 0u;
  *(_OWORD *)(a6 + 184) = 0u;
  *(_OWORD *)(a6 + 200) = 0u;
  *(_OWORD *)(a6 + 209) = 0u;
  *(_OWORD *)(a6 + 248) = 0u;
  *(_OWORD *)(a6 + 264) = 0u;
  v41 = 0u;
  memset(v42, 0, sizeof(v42));
  v39 = 0u;
  v40 = 0u;
  v43 = 1;
  v44 = 0;
  v45 = 0;
  memset(v46, 0, 96);
  bzero(&v39, 0x28uLL);
  if (!a1)
    goto LABEL_22;
  v38 = a2;
  v14 = (unsigned __int16 *)((char *)a1 - *(int *)a1);
  v15 = *v14;
  if (v15 >= 0x17)
  {
    v16 = v14[11];
    if (!v14[11])
      goto LABEL_14;
    v17 = *(unsigned int *)((char *)a1 + v16);
    v18 = (unsigned int *)((char *)a1 + v16 + v17);
    v19 = *v18;
    if (!(_DWORD)v19)
      goto LABEL_14;
    v35 = a3;
    v36 = a4;
    v37 = a5;
    v20 = 0;
    v21 = DWORD2(v41);
    v22 = (char *)a1 + v16 + v17;
    do
    {
      v23 = &v22[4 * v20];
      v24 = *((unsigned int *)v23 + 1);
      v25 = (char *)v18 + v24 - *(int *)&v23[v24 + 4];
      if (*((unsigned __int16 *)v25 + 2) >= 5u)
      {
        v26 = *((unsigned __int16 *)v25 + 4);
        if (v26)
        {
          v27 = (char *)v18 + v24 + v26;
          if (*((_WORD *)v27 + 2))
          {
            *((_QWORD *)v46 + v20) = AGX::G15_AGX2::TextureFormatTable::chooseTextureFormatCPP((AGX::G15_AGX2::TextureFormatTable *)*((unsigned __int16 *)v27 + 2), v13);
            v21 |= 1 << v20;
          }
        }
      }
      if (v20 > 6)
        break;
      ++v20;
      ++v18;
    }
    while (v20 < v19);
    DWORD2(v41) = v21;
    a4 = v36;
    a5 = v37;
    a3 = v35;
  }
  if (v15 <= 0xC)
  {
    v29 = 1;
    LOBYTE(v44) = 1;
    a2 = v38;
LABEL_21:
    HIBYTE(v44) = v29;
    goto LABEL_22;
  }
LABEL_14:
  if (v14[6])
    v28 = *((_BYTE *)a1 + v14[6]);
  else
    v28 = 1;
  a2 = v38;
  LOBYTE(v44) = v28;
  HIBYTE(v44) = v28;
  if (v15 >= 0xF)
  {
    if (v14[7])
    {
      v29 = *((_BYTE *)a1 + v14[7]);
      if (v29)
        goto LABEL_21;
    }
  }
LABEL_22:
  AGX::FramebufferCompilerConfigGen3<AGX::G15_AGX2::Encoders,AGX::G15_AGX2::Classes,AGX::G15_AGX2::ObjClasses>::buildDrawBufferState((uint64_t)&v39);
  v30 = v40;
  *(_OWORD *)(a6 + 112) = v39;
  *(_OWORD *)(a6 + 128) = v30;
  *(_QWORD *)(a6 + 144) = v41;
  AGX::Impl::FragmentProgramKey::initCommon((AGX *)a6, a1);
  v31 = *(_DWORD *)(a6 + 104);
  v32 = *(_DWORD *)(a6 + 100) & 0xFFFFFF7F;
  *(_DWORD *)(a6 + 40) &= ~0x10u;
  if (a2)
    v33 = 256;
  else
    v33 = 0;
  *(_DWORD *)(a6 + 100) = v32;
  *(_DWORD *)(a6 + 104) = v31 & 0xFFFFFEFF | v33;
  AGX::Impl::FragmentProgramKey::setSerializedDescriptor((AGX::Impl::FragmentProgramKey *)a6, a3);
  if (v12 != (char *)a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v12, *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a6 + 256 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a6 + 256), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  LOWORD(v39) = 256;
  *(_QWORD *)((char *)&v39 + 2) = 0;
  *(_DWORD *)((char *)&v39 + 10) = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a6, (unsigned __int8 *)&v39);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G15_AGX2::Classes,AGX::G15_AGX2::Encoders>::CreateComputeProgramKey@<X0>(AGX *a1@<X1>, NSObject *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  __int16 v11;
  uint64_t v12;
  int v13;

  *(_DWORD *)(a5 + 8) = 6;
  *(_QWORD *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  *(_QWORD *)(a5 + 32) = 0;
  *(_QWORD *)(a5 + 40) = 0;
  *(_QWORD *)a5 = &off_1E7ED3878;
  *(_QWORD *)(a5 + 48) = 0;
  *(_QWORD *)(a5 + 56) = 0;
  std::string::basic_string[abi:nn180100]<0>((_QWORD *)(a5 + 64), (char *)&unk_1C3E4D9BB);
  *(_BYTE *)(a5 + 88) = 0;
  *(_OWORD *)(a5 + 96) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_OWORD *)(a5 + 128) = 0u;
  AGX::Impl::ComputeProgramKey::initCommon((AGX *)a5, a1);
  *(int8x8_t *)(a5 + 52) = vand_s8(*(int8x8_t *)(a5 + 52), (int8x8_t)0xFFFFFFFEFFFFFF7FLL);
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a5, a2);
  if (a5 + 96 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 96), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  if (a5 + 120 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 120), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  v11 = 256;
  v12 = 0;
  v13 = 0;
  return AGX::Impl::ComputeProgramKey::setDeviceOptions(a5, (unsigned __int8 *)&v11);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G15_AGX2::Classes,AGX::G15_AGX2::Encoders>::CreateTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, unint64_t a4@<X8>)
{
  MTLPixelFormat v8;
  unsigned __int16 *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char v23;
  char v24;
  __int128 v25;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[31];
  int v32;
  __int16 v33;
  int v34;
  _OWORD v35[7];

  *(_DWORD *)(a4 + 8) = 5;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)a4 = &off_1E7ED3838;
  *(_OWORD *)(a4 + 40) = 0u;
  *(_OWORD *)(a4 + 56) = 0u;
  *(_OWORD *)(a4 + 72) = 0u;
  *(_OWORD *)(a4 + 88) = 0u;
  *(_OWORD *)(a4 + 104) = 0u;
  *(_OWORD *)(a4 + 120) = 0u;
  *(_OWORD *)(a4 + 136) = 0u;
  *(_OWORD *)(a4 + 152) = 0u;
  *(_OWORD *)(a4 + 168) = 0u;
  *(_OWORD *)(a4 + 184) = 0u;
  *(_QWORD *)(a4 + 200) = 0;
  v30 = 0u;
  memset(v31, 0, sizeof(v31));
  v28 = 0u;
  v29 = 0u;
  v32 = 1;
  v33 = 0;
  v34 = 0;
  memset(v35, 0, 96);
  bzero(&v28, 0x28uLL);
  if (!a1)
    goto LABEL_22;
  v9 = (unsigned __int16 *)((char *)a1 - *a1);
  v10 = *v9;
  if (v10 < 0xF)
    goto LABEL_13;
  v11 = v9[7];
  if (v9[7])
  {
    v12 = *(unsigned int *)((char *)a1 + v11);
    v13 = (unsigned int *)((char *)a1 + v11 + v12);
    v14 = *v13;
    if ((_DWORD)v14)
    {
      v15 = 0;
      v16 = DWORD2(v30);
      v27 = a3;
      v17 = (char *)a1 + v11 + v12;
      do
      {
        v18 = &v17[4 * v15];
        v19 = *((unsigned int *)v18 + 1);
        v20 = (char *)v13 + v19 - *(int *)&v18[v19 + 4];
        if (*((unsigned __int16 *)v20 + 2) >= 5u)
        {
          v21 = *((unsigned __int16 *)v20 + 4);
          if (v21)
          {
            v22 = (char *)v13 + v19 + v21;
            if (*((_WORD *)v22 + 2))
            {
              *((_QWORD *)v35 + v15) = AGX::G15_AGX2::TextureFormatTable::chooseTextureFormatCPP((AGX::G15_AGX2::TextureFormatTable *)*((unsigned __int16 *)v22 + 2), v8);
              v16 |= 1 << v15;
            }
          }
        }
        if (v15 > 6)
          break;
        ++v15;
        ++v13;
      }
      while (v15 < v14);
      DWORD2(v30) = v16;
      a3 = v27;
LABEL_13:
      if (v10 <= 0xA)
      {
        v24 = 1;
        LOBYTE(v33) = 1;
LABEL_21:
        HIBYTE(v33) = v24;
        goto LABEL_22;
      }
    }
  }
  if (v9[5])
    v23 = *((_BYTE *)a1 + v9[5]);
  else
    v23 = 1;
  LOBYTE(v33) = v23;
  HIBYTE(v33) = v23;
  if (v10 >= 0xD)
  {
    if (v9[6])
    {
      v24 = *((_BYTE *)a1 + v9[6]);
      if (v24)
        goto LABEL_21;
    }
  }
LABEL_22:
  AGX::FramebufferCompilerConfigGen3<AGX::G15_AGX2::Encoders,AGX::G15_AGX2::Classes,AGX::G15_AGX2::ObjClasses>::buildDrawBufferState((uint64_t)&v28);
  v25 = v29;
  *(_OWORD *)(a4 + 112) = v28;
  *(_OWORD *)(a4 + 128) = v25;
  *(_QWORD *)(a4 + 144) = v30;
  AGX::Impl::TileProgramKey::initCommon(a4, a1);
  *(_DWORD *)(a4 + 100) &= ~0x80u;
  if (a4 + 160 != a2)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 160), *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 5);
  if (a4 + 184 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 184), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  LOWORD(v28) = 256;
  *(_QWORD *)((char *)&v28 + 2) = 0;
  *(_DWORD *)((char *)&v28 + 10) = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a4, (unsigned __int8 *)&v28);
}

double AGX::ProgramKeyFactoryImpl<AGX::G15_AGX2::Classes,AGX::G15_AGX2::Encoders>::CreateBackgroundObjectProgramKey@<D0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  double result;
  __int128 v4;
  int v5;
  _OWORD v6[2];
  uint64_t v7;
  int v8;
  unsigned __int8 v9;
  unsigned __int16 v10;
  unsigned __int8 v11;

  *(_DWORD *)(a2 + 8) = 13;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFAA8;
  AGX::FramebufferCompilerConfig<AGX::G15_AGX2::Encoders,AGX::G15_AGX2::Classes,AGX::G15_AGX2::ObjClasses>::FramebufferCompilerConfig((uint64_t)v6, a1);
  AGX::FramebufferCompilerConfigGen3<AGX::G15_AGX2::Encoders,AGX::G15_AGX2::Classes,AGX::G15_AGX2::ObjClasses>::buildDrawBufferState((uint64_t)v6);
  result = *(double *)v6;
  v4 = v6[1];
  *(_OWORD *)(a2 + 40) = v6[0];
  *(_OWORD *)(a2 + 56) = v4;
  *(_QWORD *)(a2 + 72) = v7;
  *(_QWORD *)(a2 + 80) = 0;
  v5 = v10 | (v11 << 16) | (v8 << 24);
  *(_WORD *)(a2 + 84) = v9;
  *(_DWORD *)(a2 + 80) = v5;
  return result;
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G15_AGX2::Classes,AGX::G15_AGX2::Encoders>::CreateEndOfTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;
  int v28;
  _OWORD v29[2];
  uint64_t v30;
  _OWORD v31[2];
  uint64_t v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  unsigned __int8 v37;
  unsigned __int8 v38;
  unsigned int v39;
  _BYTE v40[40];

  *(_DWORD *)(a2 + 8) = 19;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)a2 = off_1E7ECFAE8;
  *(_OWORD *)(a2 + 40) = 0u;
  v3 = a2 + 40;
  *(_QWORD *)(a2 + 16) = 0;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(_OWORD *)(a2 + 88) = 0u;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_QWORD *)(a2 + 118) = 0;
  AGX::FramebufferCompilerConfig<AGX::G15_AGX2::Encoders,AGX::G15_AGX2::Classes,AGX::G15_AGX2::ObjClasses>::FramebufferCompilerConfig((uint64_t)v31, a1);
  result = AGX::FramebufferCompilerConfigGen3<AGX::G15_AGX2::Encoders,AGX::G15_AGX2::Classes,AGX::G15_AGX2::ObjClasses>::buildDrawBufferState((uint64_t)v31);
  v29[0] = v31[0];
  v29[1] = v31[1];
  v5 = v32;
  v30 = v32;
  v6 = v39;
  v7 = v33;
  v24 = v34;
  v8 = ((unint64_t)BYTE2(v32) << 36) | ((unint64_t)((unsigned __int16)v32 >> 12) << 32) | 0x40000000000000;
  *(_QWORD *)(a2 + 112) = v8;
  if (v7)
  {
    v9 = 0;
    v28 = 0;
    v10 = 0;
    v20 = (unsigned __int16)v5 >> 12;
    v23 = v38;
    v22 = HIWORD(v5) & 0x1FF;
    v21 = v37 & ~v36 | v35;
    v19 = v36 & ~v37 | v35;
    do
    {
      v11 = __clz(__rbit32(v7));
      v12 = *((_DWORD *)v29 + v11);
      v13 = *(_DWORD *)(v3 + 4 * v11) & 0xE3000000;
      result = AGX::PBEStateEncoderGen8<kAGXRevG15_AGX2>::StateFields::getDimensionality(v40[2 * v11], v40[2 * v11 + 1], v6);
      *(_DWORD *)(v3 + 4 * v11) = v13 & 0xE3FFE0FF | ((_DWORD)result << 16) & 0xE3FFFFFF | ((v12 & 0x1F) << 8) | (v12 >> 5 << 26) | ((v12 >> 12) / v22);
      v9 |= 1 << v11;
      v27 = (v12 >> 12) / v22;
      v28 |= (1 << v11) & v21;
      v14 = v23 & (1 << v11);
      v10 |= v14;
      if ((v24 & (1 << v11)) != 0)
      {
        v26 = v10;
        v15 = (v12 & 0x1F) << 8;
        v25 = (v12 << 21) & 0x1C000000;
        v16 = v11 + 8;
        v17 = (v12 << 16) & 0x1000000;
        if (v20 <= 1)
          v17 = 0;
        v18 = *(_DWORD *)(v3 + 4 * (v11 + 8)) & 0xE2000000 | v17;
        result = AGX::PBEStateEncoderGen8<kAGXRevG15_AGX2>::StateFields::getDimensionality(v40[2 * v11 + 16], v40[2 * v11 + 17], v6);
        *(_DWORD *)(v3 + 4 * v16) = v18 | ((_DWORD)result << 16) | v15 | v25 | v27;
        v9 |= 256 << v11;
        v28 |= ((v19 >> v11) & 1) << v16;
        v10 = ((v14 != 0) << v16) | v26;
      }
      v7 ^= 1 << v11;
    }
    while (v7);
    v8 = (unint64_t)*(unsigned int *)(a2 + 116) << 32;
  }
  else
  {
    LOWORD(v10) = 0;
    LOWORD(v28) = 0;
    LOWORD(v9) = 0;
  }
  *(_WORD *)(a2 + 120) = v9;
  *(_WORD *)(a2 + 122) = v28;
  *(_WORD *)(a2 + 124) = v10;
  *(_QWORD *)(a2 + 112) = v8 | (unsigned __int16)(v9 & ~(_WORD)v28) | ((unint64_t)(unsigned __int16)(v9 & v10) << 16);
  return result;
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G15_AGX2::Classes,AGX::G15_AGX2::Encoders>::CreateBVHBuilderProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 8) = 24;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFB68;
  *(_DWORD *)(a2 + 40) = 0;
  return AGX::BVHBuilderProgramKey::initializeWithDescriptor(a2, a1);
}

uint64_t AGX::FramebufferCompilerConfig<AGX::G16::Encoders,AGX::G16::Classes,AGX::G16::ObjClasses>::FramebufferCompilerConfig(uint64_t a1, int *a2)
{
  uint64_t v4;
  char *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  char *v23;
  unsigned int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  char *v29;
  uint64_t v30;
  char v31;
  int v32;
  char v33;
  uint64_t v34;
  int v35;
  int v36;
  int32x2_t v37;
  int v38;
  char *v39;
  uint64_t v40;
  char v41;
  int v42;
  char *v43;
  char v44;
  char v45;
  char v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  unsigned __int16 *v50;
  unsigned int v51;
  char v52;
  char v53;
  uint64_t v54;

  *(_OWORD *)(a1 + 63) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 80) = 1;
  *(_WORD *)(a1 + 84) = 0;
  *(_DWORD *)(a1 + 88) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  bzero((void *)a1, 0x28uLL);
  if (a2)
  {
    v4 = *a2;
    v5 = (char *)a2 - v4;
    v6 = *(unsigned __int16 *)((char *)a2 - v4);
    if (v6 < 5)
      goto LABEL_72;
    v7 = -v4;
    v8 = *((unsigned __int16 *)v5 + 2);
    if (*((_WORD *)v5 + 2))
    {
      v9 = (char *)a2 + v8;
      v10 = *(unsigned int *)((char *)a2 + v8);
      v11 = *(unsigned int *)((char *)a2 + v8 + v10);
      if ((_DWORD)v11)
      {
        v12 = 0;
        v13 = 0;
        v14 = v8 + v10;
        while (1)
        {
          v15 = *(unsigned int *)((char *)a2 + v14 + 4);
          v16 = (char *)a2 + v14 + v15;
          v17 = (char *)a2 + v14 + v15 - *((int *)v16 + 1);
          if (*((unsigned __int16 *)v17 + 2) >= 5u)
          {
            v18 = *((unsigned __int16 *)v17 + 4);
            if (v18)
            {
              v19 = *(unsigned __int16 *)((char *)a2 + v14 + v15 + v18 + 4);
              if (v19)
                break;
            }
          }
LABEL_47:
          if (v13 <= 6)
          {
            ++v13;
            v12 += 2;
            v14 += 4;
            if (v13 < v11)
              continue;
          }
          v48 = *a2;
          v7 = -v48;
          v6 = *(unsigned __int16 *)((char *)a2 - v48);
          goto LABEL_67;
        }
        v20 = &texFormatUnsupported;
        if (v19 <= 0x275)
          v20 = *(&off_1E7ED0F40 + v19 - 1);
        *(_QWORD *)(a1 + 8 * v13 + 96) = v20;
        v21 = 1 << v13;
        *(_DWORD *)(a1 + 40) |= 1 << v13;
        v22 = v15 - *((int *)v16 + 1);
        v23 = (char *)a2 + v14 + v22;
        v24 = *((unsigned __int16 *)v23 + 2);
        if (v24 < 0x19)
        {
          v26 = 0;
          LODWORD(v25) = 0;
          if (v24 < 0xF)
          {
LABEL_35:
            v26 = 0;
            v35 = 1 << v13;
LABEL_36:
            *(_DWORD *)(a1 + 52) |= v35;
            v37.i32[0] = v25;
            v37.i32[1] = v26 & 0xFFFFFFFD;
            *(int8x8_t *)(a1 + 60) = vorr_s8(*(int8x8_t *)(a1 + 60), vand_s8((int8x8_t)vdup_n_s32(v21), (int8x8_t)vceq_s32(v37, (int32x2_t)0x100000001)));
            if (v26 == 4)
              v38 = 1 << v13;
            else
              v38 = 0;
            *(_DWORD *)(a1 + 72) |= v38;
            v39 = (char *)a2 + v14 + v15 - *((int *)v16 + 1);
            if (*((unsigned __int16 *)v39 + 2) >= 7u && (v40 = *((unsigned __int16 *)v39 + 5)) != 0)
            {
              v41 = 0;
              v42 = *((unsigned __int8 *)a2 + v14 + v15 + v40 + 4);
              v43 = (char *)(a1 + v12 + 160);
              v44 = 2;
              v45 = 1;
              switch(v42)
              {
                case 0:
                case 1:
                  v44 = 1;
                  v41 = v42;
                  goto LABEL_53;
                case 3:
                  goto LABEL_58;
                case 4:
                  v46 = 2;
                  goto LABEL_44;
                case 5:
                  goto LABEL_52;
                case 6:
                  v41 = 1;
LABEL_52:
                  v44 = 4;
                  goto LABEL_53;
                case 7:
                  *v43 = 3;
                  *(_BYTE *)(a1 + v12 + 161) = 0;
LABEL_56:
                  v47 = 3;
                  break;
                case 8:
                  v45 = 3;
LABEL_58:
                  *v43 = 2;
                  *(_BYTE *)(a1 + v12 + 161) = v45;
LABEL_59:
                  *(_BYTE *)(a1 + 78) |= v21;
                  goto LABEL_45;
                default:
LABEL_53:
                  *v43 = v44;
                  *(_BYTE *)(a1 + v12 + 161) = v41;
                  v47 = 1;
                  switch(v42)
                  {
                    case 0:
                      goto LABEL_46;
                    case 1:
                      *(_BYTE *)(a1 + 78) |= v21;
                      v47 = 1;
                      break;
                    case 3:
                    case 5:
                    case 6:
                    case 8:
                      goto LABEL_59;
                    case 7:
                      goto LABEL_56;
                    default:
                      goto LABEL_45;
                  }
                  break;
              }
            }
            else
            {
              v46 = 0;
              v43 = (char *)(a1 + 2 * v13 + 160);
LABEL_44:
              *v43 = 2;
              *(_BYTE *)(a1 + v12 + 161) = v46;
LABEL_45:
              v47 = 2;
            }
LABEL_46:
            *(_WORD *)(a1 + 76) |= v47 << v12;
            v11 = *(unsigned int *)&v9[v10];
            goto LABEL_47;
          }
        }
        else
        {
          v25 = *((unsigned __int16 *)v23 + 14);
          if (v25)
            LODWORD(v25) = *((unsigned __int8 *)a2 + v14 + v15 + v25 + 4);
          if (v24 >= 0x1B && *(_WORD *)((char *)a2 + v14 + v22 + 30))
            v26 = *((unsigned __int8 *)a2 + v14 + v15 + *(unsigned __int16 *)((char *)a2 + v14 + v22 + 30) + 4);
          else
            v26 = 0;
        }
        v27 = *(unsigned __int16 *)((char *)a2 + v14 + v22 + 18);
        if (v27 && *(_WORD *)((char *)a2 + v14 + v15 + v27 + 4))
        {
          *(_DWORD *)(a1 + 48) |= v21;
          if ((v26 & 0xFE) == 2)
            v28 = 1 << v13;
          else
            v28 = 0;
          *(_DWORD *)(a1 + 68) |= v28;
          v29 = (char *)a2 + v14 + v15 - *((int *)v16 + 1);
          if (*((unsigned __int16 *)v29 + 2) >= 0x11u && (v30 = *((unsigned __int16 *)v29 + 10), *((_WORD *)v29 + 10)))
          {
            v31 = 0;
            v32 = *((unsigned __int8 *)a2 + v14 + v15 + v30 + 4);
            v33 = 2;
            switch(v32)
            {
              case 0:
              case 1:
                v33 = 1;
                v31 = v32;
                break;
              case 3:
                v31 = 1;
                break;
              case 4:
                v31 = 2;
                break;
              case 5:
                goto LABEL_62;
              case 6:
                v31 = 1;
LABEL_62:
                v33 = 4;
                break;
              case 7:
                v31 = 0;
                v33 = 3;
                break;
              case 8:
                v31 = 3;
                break;
              default:
                break;
            }
          }
          else
          {
            v31 = 0;
            v33 = 2;
          }
          v34 = a1 + v12;
          *(_BYTE *)(v34 + 176) = v33;
          *(_BYTE *)(v34 + 177) = v31;
        }
        v35 = 0;
        if ((_DWORD)v25 == 2)
          v36 = 1 << v13;
        else
          v36 = 0;
        *(_DWORD *)(a1 + 56) |= v36;
        if (v26)
          goto LABEL_36;
        goto LABEL_35;
      }
    }
LABEL_67:
    if (v6 >= 7
      && *(_WORD *)((char *)a2 + v7 + 6)
      && (v49 = *(_QWORD *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v7 + 6)), (v49 & 0xFFFFFFFE) != 0))
    {
      if (v49 > 0x7FF)
        LODWORD(v49) = 2048;
    }
    else
    {
LABEL_72:
      LODWORD(v49) = 1;
    }
    *(_DWORD *)(a1 + 80) = v49;
    v50 = (unsigned __int16 *)((char *)a2 - *a2);
    v51 = *v50;
    if (v51 < 0xB)
    {
      v53 = 1;
      *(_BYTE *)(a1 + 84) = 1;
      if (v51 < 9)
      {
LABEL_83:
        *(_BYTE *)(a1 + 85) = v53;
        return a1;
      }
    }
    else
    {
      if (v50[5])
        v52 = *((_BYTE *)a2 + v50[5]);
      else
        v52 = 1;
      *(_BYTE *)(a1 + 84) = v52;
    }
    v54 = v50[4];
    if (v54)
      v53 = *((_BYTE *)a2 + v54);
    else
      v53 = 1;
    goto LABEL_83;
  }
  return a1;
}

uint64_t AGX::FramebufferCompilerConfig<AGX::G16::Encoders,AGX::G16::Classes,AGX::G16::ObjClasses>::partitionSizeFromFormatAndCompCount(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 2:
    case 3:
    case 4:
    case 5:
      return a2;
    case 6:
    case 7:
    case 8:
    case 9:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 22:
      a2 = (2 * a2);
      break;
    case 10:
    case 11:
    case 17:
      a2 = (4 * a2);
      break;
    case 18:
    case 19:
    case 20:
    case 21:
      a2 = 4;
      break;
    default:
      a2 = 0;
      break;
  }
  return a2;
}

uint64_t AGX::FramebufferCompilerConfigGen3<AGX::G16::Encoders,AGX::G16::Classes,AGX::G16::ObjClasses>::buildDrawBufferState(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  char v12;
  uint64_t result;
  uint64_t v14;
  unsigned int *v15;
  uint64_t v16;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  unint64_t v30;
  int v31;
  int v32;
  int v33;
  unsigned int v34;
  int v35;

  v2 = 0;
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = v3;
  do
  {
    v5 = v4;
    if (!v4)
      break;
    v6 = __clz(__rbit32(v4));
    v7 = *(_QWORD *)(a1 + 8 * v6 + 96);
    if (*(_DWORD *)(v7 + 32) == 18)
      v8 = 9;
    else
      v8 = *(_DWORD *)(v7 + 32);
    v2 += AGX::FramebufferCompilerConfig<AGX::G16::Encoders,AGX::G16::Classes,AGX::G16::ObjClasses>::partitionSizeFromFormatAndCompCount(v8, *(unsigned int *)(v7 + 28));
    v9 = 1 << v6;
    if (v2 > 0x100)
      v9 = 0;
    v4 = v9 ^ v5;
  }
  while (v2 < 0x101);
  if (v3)
  {
    LODWORD(v10) = 0;
    v11 = 0;
    v12 = 0;
    LODWORD(result) = 0;
    v34 = v5;
    do
    {
      v14 = __clz(__rbit32(v3));
      v15 = *(unsigned int **)(a1 + 8 * v14 + 96);
      v16 = v15[7];
      if (v15[8] == 18 && v5 == 0)
        v18 = 9;
      else
        v18 = v15[8];
      v19 = 1 << v14;
      if (v18 == 18)
        v20 = 1 << v14;
      else
        v20 = 0;
      if (v18 == 3)
      {
        v21 = (v15[21] != 0) << 8;
        v22 = 1;
      }
      else
      {
        v35 = result;
        v23 = v20;
        LODWORD(result) = AGX::FramebufferCompilerConfig<AGX::G16::Encoders,AGX::G16::Classes,AGX::G16::ObjClasses>::partitionSizeFromFormatAndCompCount(v18, v16);
        v20 = v23;
        v19 = 1 << v14;
        LODWORD(v16) = result;
        v5 = v34;
        LODWORD(result) = v35;
        v21 = 0;
        v22 = 1;
        switch(v18)
        {
          case 2:
          case 4:
          case 5:
            break;
          case 6:
          case 7:
          case 8:
          case 9:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 22:
            v21 = 0;
            v22 = 2;
            break;
          case 10:
          case 11:
          case 17:
          case 18:
          case 19:
          case 20:
          case 21:
            v21 = 0;
            v22 = 4;
            break;
          default:
            v21 = 0;
            v22 = 0;
            break;
        }
      }
      result = v20 | result;
      v24 = v22 - 1;
      v25 = -v22;
      v26 = (v24 + v10) & v25;
      v12 |= (v26 + v16) > 0x100;
      v27 = (v24 + v11) & v25;
      if ((v12 & 1) != 0)
        v11 = v27 + v16;
      else
        LOBYTE(v27) = v26;
      v28 = v21 & 0xFFF00FFF | *(_DWORD *)(a1 + 4 * v14) & 0xFFF00EE0 | v18 & 0x1F | (v27 << 12);
      *(_DWORD *)(a1 + 4 * v14) = v28;
      v29 = v28 & 0xFFFFF1FF | ((v15[19] & 7) << 9);
      *(_DWORD *)(a1 + 4 * v14) = v29;
      if ((v12 & 1) != 0)
        v10 = v10;
      else
        v10 = (v26 + v16);
      *(_DWORD *)(a1 + 4 * v14) = v29 & 0xFFFFFF1F | (32 * (v15[7] & 7));
      v3 ^= v19;
    }
    while (v3);
    v30 = 256;
    if (((v10 + 7) & 0x1FFFFFF00) == 0)
      v30 = (v10 + 7) & 0x1FFFFFFF8;
    if (v30 <= 8)
      LODWORD(v30) = 8;
    v31 = (_DWORD)v30 << 16;
    if ((v12 & 1) != 0)
    {
      v31 = 0x1000000;
      v32 = 0x2000000;
    }
    else
    {
      v32 = 0;
    }
    v33 = *(unsigned __int8 *)(a1 + 40) | v32;
  }
  else
  {
    v11 = 0;
    result = 0;
    v33 = 0;
    v31 = 0x80000;
  }
  *(_DWORD *)(a1 + 32) = v33 | ((*(_BYTE *)(a1 + 84) & 0xF) << 8) | *(_DWORD *)(a1 + 32) & 0xFC000000 | v31 | ((*(_BYTE *)(a1 + 85) & 0xF) << 12);
  *(_DWORD *)(a1 + 88) = v11;
  *(_DWORD *)(a1 + 44) = result;
  return result;
}

uint64_t AGX::PBEStateEncoderGen9<kAGXRevG16>::StateFields::getDimensionality(int a1, char a2, unsigned int a3)
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  BOOL v5;

  if (a3 < 2)
    v3 = 2;
  else
    v3 = 3;
  if ((a2 & 1) != 0)
  {
    if ((a2 & 2) != 0)
      v4 = 8;
    else
      v4 = v3;
    v5 = a1 == 4;
LABEL_11:
    if (v5)
      return v3;
  }
  else
  {
    v4 = 5;
    switch(a1)
    {
      case 1:
        v4 = 2;
        break;
      case 2:
        v5 = (a2 & 2) == 0;
        v4 = 4;
        v3 = 2;
        goto LABEL_11;
      case 3:
        return v4;
      case 4:
        v4 = v3;
        break;
      default:
        v4 = -1;
        break;
    }
  }
  return v4;
}

_QWORD *AGCTargetImpl<AGX::G16::Classes,AGX::G16::Encoders>::CreateProgramKeyFactory@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_1E7ECF860;
  *a1 = result;
  return result;
}

void AGCTargetImpl<AGX::G16::Classes,AGX::G16::Encoders>::CreateTGSizeToTempTable(_DWORD *a1@<X1>, _QWORD *a2@<X8>)
{
  void *v4;
  void *v5;
  uint64_t v6;

  *a1 = 24;
  v4 = (void *)operator new[]();
  v5 = v4;
  v6 = *a1;
  if ((_DWORD)v6)
    memset_pattern16(v4, &unk_1C3E386C0, 4 * v6);
  *a2 = v5;
}

_QWORD *AGCTargetImpl<AGX::G16::Classes,AGX::G16::Encoders>::GetLegalizationPasses@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *result;
  uint64_t v6;
  int v7;
  const char *v8;
  const char *v9;
  char v10;
  const char *v11;
  char v12;
  const char *v13;
  char v14;
  const char *v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = "air-degenerate-vertex-amplification-emulation";
  v10 = 0;
  v11 = "air-raytracing-emulation,indirect-acceleration-structures";
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  v13 = "mtl-fetch-all-unaligned";
  v14 = 1;
  v15 = "air-bfloat-emulation";
  v16 = 0;
  result = malloc_type_malloc(0x20uLL, 0x10040436913F5uLL);
  v6 = 0;
  v7 = 0;
  *a2 = 0;
  do
  {
    if (LOBYTE((&v9)[v6 + 1]))
    {
      v8 = (&v9)[v6];
      *a2 = v7 + 1;
      result[v7++] = v8;
    }
    v6 += 2;
  }
  while (v6 != 8);
  *a3 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::G16::Classes,AGX::G16::Encoders>::requiresRayTracingEmulation()
{
  return 0;
}

uint64_t AGCTargetImpl<AGX::G16::Classes,AGX::G16::Encoders>::maxMSAASampleCount()
{
  return 4;
}

void AGX::ProgramKeyFactoryImpl<AGX::G16::Classes,AGX::G16::Encoders>::~ProgramKeyFactoryImpl()
{
  JUMPOUT(0x1CAA2D68CLL);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G16::Classes,AGX::G16::Encoders>::CreateVertexProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, int a6@<W6>, uint64_t a7@<X8>)
{
  uint64_t v14;
  int v15;
  _WORD v17[8];
  std::string v18;
  std::string v19;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v18, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v18 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v19, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v19 = *(std::string *)(a2 + 24);
  v14 = *(unsigned __int8 *)(a2 + 48);
  *(_DWORD *)(a7 + 8) = 3;
  *(_OWORD *)(a7 + 96) = 0u;
  *(_OWORD *)(a7 + 112) = 0u;
  *(_OWORD *)(a7 + 128) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 76) = 0u;
  *(_QWORD *)a7 = &off_1E7ED3720;
  *(std::string *)(a7 + 144) = v18;
  *(std::string *)(a7 + 168) = v19;
  *(_BYTE *)(a7 + 192) = v14;
  *(_QWORD *)(a7 + 56) = v14 << 18;
  AGX::Impl::VertexProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a7, a3);
  if (a7 + 96 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 96), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a7 + 120 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 120), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a6)
    v15 = 2;
  else
    v15 = 0;
  *(_DWORD *)(a7 + 88) = *(_DWORD *)(a7 + 88) & 0xFFFFFFFD | v15;
  memset(v17, 0, 14);
  return AGX::GeometrySharedKey<_AGCVertexContextStateAGP,(_AGCStreamToken)3>::setDeviceOptions(a7, (unsigned __int8 *)v17);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G16::Classes,AGX::G16::Encoders>::CreateObjectProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, int a3@<W3>, NSObject *a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  char *v11;
  int v12;
  int v13;
  _WORD v15[8];

  *(_DWORD *)(a7 + 8) = 9;
  *(_OWORD *)(a7 + 104) = 0u;
  v11 = (char *)(a7 + 104);
  *(_OWORD *)(a7 + 120) = 0u;
  *(_OWORD *)(a7 + 136) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 80) = 0u;
  *(_DWORD *)(a7 + 96) = 0;
  *(_QWORD *)a7 = &off_1E7ED37B0;
  if (a2)
    v12 = 2;
  else
    v12 = 0;
  if (a3)
    v13 = 4;
  else
    v13 = 0;
  *(_DWORD *)(a7 + 56) = v13 | v12;
  AGX::Impl::ObjectProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a7, a4);
  if (v11 != (char *)a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v11, *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a7 + 128 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 128), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  memset(v15, 0, 14);
  return AGX::GeometrySharedKey<_AGCObjectContextStateAGP,(_AGCStreamToken)9>::setDeviceOptions(a7, (unsigned __int8 *)v15);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G16::Classes,AGX::G16::Encoders>::CreateMeshProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, int a3@<W3>, int a4@<W4>, NSObject *a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, char a9)
{
  int v17;
  __int128 v18;
  int v19;
  int v20;
  int v21;
  _WORD v23[8];
  std::string v24;
  std::string v25;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v24, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v24 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v25, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v25 = *(std::string *)(a2 + 24);
  v17 = *(unsigned __int8 *)(a2 + 48);
  *(_OWORD *)(a8 + 104) = 0u;
  *(_DWORD *)(a8 + 8) = 10;
  *(_OWORD *)(a8 + 120) = 0u;
  *(_OWORD *)(a8 + 136) = 0u;
  *(_OWORD *)(a8 + 16) = 0u;
  *(_OWORD *)(a8 + 32) = 0u;
  *(_OWORD *)(a8 + 48) = 0u;
  *(_OWORD *)(a8 + 64) = 0u;
  *(_OWORD *)(a8 + 80) = 0u;
  *(_DWORD *)(a8 + 96) = 0;
  *(_QWORD *)a8 = &off_1E7ED3768;
  *(std::string *)(a8 + 152) = v24;
  v18 = *(_OWORD *)&v25.__r_.__value_.__l.__data_;
  *(_QWORD *)(a8 + 192) = *((_QWORD *)&v25.__r_.__value_.__l + 2);
  if (a3)
    v19 = 128;
  else
    v19 = 0;
  if (a4)
    v20 = 256;
  else
    v20 = 0;
  *(_OWORD *)(a8 + 176) = v18;
  *(_BYTE *)(a8 + 200) = v17;
  *(_DWORD *)(a8 + 56) = v20 | v19 | (16 * v17);
  AGX::Impl::MeshProgramKey::initCommon((AGX *)a8, a1);
  *(_DWORD *)(a8 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a8, a5);
  if (a8 + 104 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 104), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  if (a8 + 128 != a7)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 128), *(char **)a7, *(_QWORD *)(a7 + 8), (uint64_t)(*(_QWORD *)(a7 + 8) - *(_QWORD *)a7) >> 5);
  if (a9)
    v21 = 2;
  else
    v21 = 0;
  *(_DWORD *)(a8 + 96) = *(_DWORD *)(a8 + 96) & 0xFFFFFFFD | v21;
  memset(v23, 0, 14);
  return AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setDeviceOptions(a8, (unsigned __int8 *)v23);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G16::Classes,AGX::G16::Encoders>::CreateFragmentProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  char *v12;
  unsigned __int16 *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unsigned int v26;
  void *v27;
  char v28;
  int v29;
  uint64_t v30;
  __int128 v31;
  int v32;
  unsigned int v33;
  int v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[31];
  int v40;
  __int16 v41;
  int v42;
  _OWORD v43[6];

  *(_DWORD *)(a6 + 8) = 4;
  *(_QWORD *)(a6 + 24) = 0;
  *(_QWORD *)(a6 + 32) = 0;
  *(_QWORD *)(a6 + 16) = 0;
  *(_OWORD *)(a6 + 232) = 0u;
  v12 = (char *)(a6 + 232);
  *(_QWORD *)a6 = &off_1E7ED37F8;
  *(_OWORD *)(a6 + 40) = 0u;
  *(_OWORD *)(a6 + 56) = 0u;
  *(_OWORD *)(a6 + 72) = 0u;
  *(_OWORD *)(a6 + 88) = 0u;
  *(_OWORD *)(a6 + 104) = 0u;
  *(_OWORD *)(a6 + 120) = 0u;
  *(_OWORD *)(a6 + 136) = 0u;
  *(_OWORD *)(a6 + 152) = 0u;
  *(_OWORD *)(a6 + 168) = 0u;
  *(_OWORD *)(a6 + 184) = 0u;
  *(_OWORD *)(a6 + 200) = 0u;
  *(_OWORD *)(a6 + 209) = 0u;
  *(_OWORD *)(a6 + 248) = 0u;
  *(_OWORD *)(a6 + 264) = 0u;
  v38 = 0u;
  memset(v39, 0, sizeof(v39));
  v36 = 0u;
  v37 = 0u;
  v40 = 1;
  v41 = 0;
  v42 = 0;
  memset(v43, 0, sizeof(v43));
  bzero(&v36, 0x28uLL);
  if (!a1)
    goto LABEL_24;
  v13 = (unsigned __int16 *)((char *)a1 - *(int *)a1);
  v14 = *v13;
  if (v14 >= 0x17)
  {
    v15 = v13[11];
    if (!v13[11])
      goto LABEL_16;
    v16 = *(unsigned int *)((char *)a1 + v15);
    v17 = (unsigned int *)((char *)a1 + v15 + v16);
    v18 = *v17;
    if (!(_DWORD)v18)
      goto LABEL_16;
    v19 = 0;
    v20 = DWORD2(v38);
    v21 = (char *)a1 + v15 + v16;
    do
    {
      v22 = &v21[4 * v19];
      v23 = *((unsigned int *)v22 + 1);
      v24 = (char *)v17 + v23 - *(int *)&v22[v23 + 4];
      if (*((unsigned __int16 *)v24 + 2) >= 5u)
      {
        v25 = *((unsigned __int16 *)v24 + 4);
        if (v25)
        {
          v26 = *(unsigned __int16 *)((char *)v17 + v23 + v25 + 4);
          if (v26)
          {
            v27 = &texFormatUnsupported;
            if (v26 <= 0x275)
              v27 = *(&off_1E7ED0F40 + v26 - 1);
            *((_QWORD *)v43 + v19) = v27;
            v20 |= 1 << v19;
          }
        }
      }
      if (v19 > 6)
        break;
      ++v19;
      ++v17;
    }
    while (v19 < v18);
    DWORD2(v38) = v20;
  }
  if (v14 <= 0xC)
  {
    LOBYTE(v29) = 1;
    LOBYTE(v41) = 1;
LABEL_23:
    HIBYTE(v41) = v29;
    goto LABEL_24;
  }
LABEL_16:
  if (v13[6])
    v28 = *((_BYTE *)a1 + v13[6]);
  else
    v28 = 1;
  LOBYTE(v41) = v28;
  HIBYTE(v41) = v28;
  if (v14 >= 0xF)
  {
    v30 = v13[7];
    if (v30)
    {
      v29 = *((unsigned __int8 *)a1 + v30);
      if (v29)
        goto LABEL_23;
    }
  }
LABEL_24:
  AGX::FramebufferCompilerConfigGen3<AGX::G16::Encoders,AGX::G16::Classes,AGX::G16::ObjClasses>::buildDrawBufferState((uint64_t)&v36);
  v31 = v37;
  *(_OWORD *)(a6 + 112) = v36;
  *(_OWORD *)(a6 + 128) = v31;
  *(_QWORD *)(a6 + 144) = v38;
  AGX::Impl::FragmentProgramKey::initCommon((AGX *)a6, a1);
  v32 = *(_DWORD *)(a6 + 104);
  v33 = *(_DWORD *)(a6 + 100) & 0xFFFFFF7F;
  *(_DWORD *)(a6 + 40) &= ~0x10u;
  if (a2)
    v34 = 256;
  else
    v34 = 0;
  *(_DWORD *)(a6 + 100) = v33;
  *(_DWORD *)(a6 + 104) = v32 & 0xFFFFFEFF | v34;
  AGX::Impl::FragmentProgramKey::setSerializedDescriptor((AGX::Impl::FragmentProgramKey *)a6, a3);
  if (v12 != (char *)a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v12, *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a6 + 256 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a6 + 256), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  *(_QWORD *)((char *)&v36 + 6) = 0;
  *(_QWORD *)&v36 = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a6, (unsigned __int8 *)&v36);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G16::Classes,AGX::G16::Encoders>::CreateComputeProgramKey@<X0>(AGX *a1@<X1>, NSObject *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  _WORD v11[8];

  *(_DWORD *)(a5 + 8) = 6;
  *(_QWORD *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  *(_QWORD *)(a5 + 32) = 0;
  *(_QWORD *)(a5 + 40) = 0;
  *(_QWORD *)a5 = &off_1E7ED3878;
  *(_QWORD *)(a5 + 48) = 0;
  *(_QWORD *)(a5 + 56) = 0;
  std::string::basic_string[abi:nn180100]<0>((_QWORD *)(a5 + 64), (char *)&unk_1C3E4D9BB);
  *(_BYTE *)(a5 + 88) = 0;
  *(_OWORD *)(a5 + 96) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_OWORD *)(a5 + 128) = 0u;
  AGX::Impl::ComputeProgramKey::initCommon((AGX *)a5, a1);
  *(int8x8_t *)(a5 + 52) = vand_s8(*(int8x8_t *)(a5 + 52), (int8x8_t)0xFFFFFFFEFFFFFF7FLL);
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a5, a2);
  if (a5 + 96 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 96), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  if (a5 + 120 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 120), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  memset(v11, 0, 14);
  return AGX::Impl::ComputeProgramKey::setDeviceOptions(a5, (unsigned __int8 *)v11);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G16::Classes,AGX::G16::Encoders>::CreateTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, unint64_t a4@<X8>)
{
  unsigned __int16 *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unsigned int v21;
  void *v22;
  char v23;
  int v24;
  uint64_t v25;
  __int128 v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[31];
  int v32;
  __int16 v33;
  int v34;
  _OWORD v35[6];

  *(_DWORD *)(a4 + 8) = 5;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)a4 = &off_1E7ED3838;
  *(_OWORD *)(a4 + 40) = 0u;
  *(_OWORD *)(a4 + 56) = 0u;
  *(_OWORD *)(a4 + 72) = 0u;
  *(_OWORD *)(a4 + 88) = 0u;
  *(_OWORD *)(a4 + 104) = 0u;
  *(_OWORD *)(a4 + 120) = 0u;
  *(_OWORD *)(a4 + 136) = 0u;
  *(_OWORD *)(a4 + 152) = 0u;
  *(_OWORD *)(a4 + 168) = 0u;
  *(_OWORD *)(a4 + 184) = 0u;
  *(_QWORD *)(a4 + 200) = 0;
  v30 = 0u;
  memset(v31, 0, sizeof(v31));
  v28 = 0u;
  v29 = 0u;
  v32 = 1;
  v33 = 0;
  v34 = 0;
  memset(v35, 0, sizeof(v35));
  bzero(&v28, 0x28uLL);
  if (!a1)
    goto LABEL_24;
  v8 = (unsigned __int16 *)((char *)a1 - *a1);
  v9 = *v8;
  if (v9 < 0xF)
    goto LABEL_15;
  v10 = v8[7];
  if (v8[7])
  {
    v11 = *(unsigned int *)((char *)a1 + v10);
    v12 = (unsigned int *)((char *)a1 + v10 + v11);
    v13 = *v12;
    if ((_DWORD)v13)
    {
      v14 = 0;
      v15 = DWORD2(v30);
      v16 = (char *)a1 + v10 + v11;
      do
      {
        v17 = &v16[4 * v14];
        v18 = *((unsigned int *)v17 + 1);
        v19 = (char *)v12 + v18 - *(int *)&v17[v18 + 4];
        if (*((unsigned __int16 *)v19 + 2) >= 5u)
        {
          v20 = *((unsigned __int16 *)v19 + 4);
          if (v20)
          {
            v21 = *(unsigned __int16 *)((char *)v12 + v18 + v20 + 4);
            if (v21)
            {
              v22 = &texFormatUnsupported;
              if (v21 <= 0x275)
                v22 = *(&off_1E7ED0F40 + v21 - 1);
              *((_QWORD *)v35 + v14) = v22;
              v15 |= 1 << v14;
            }
          }
        }
        if (v14 > 6)
          break;
        ++v14;
        ++v12;
      }
      while (v14 < v13);
      DWORD2(v30) = v15;
LABEL_15:
      if (v9 <= 0xA)
      {
        LOBYTE(v24) = 1;
        LOBYTE(v33) = 1;
LABEL_23:
        HIBYTE(v33) = v24;
        goto LABEL_24;
      }
    }
  }
  if (v8[5])
    v23 = *((_BYTE *)a1 + v8[5]);
  else
    v23 = 1;
  LOBYTE(v33) = v23;
  HIBYTE(v33) = v23;
  if (v9 >= 0xD)
  {
    v25 = v8[6];
    if (v25)
    {
      v24 = *((unsigned __int8 *)a1 + v25);
      if (v24)
        goto LABEL_23;
    }
  }
LABEL_24:
  AGX::FramebufferCompilerConfigGen3<AGX::G16::Encoders,AGX::G16::Classes,AGX::G16::ObjClasses>::buildDrawBufferState((uint64_t)&v28);
  v26 = v29;
  *(_OWORD *)(a4 + 112) = v28;
  *(_OWORD *)(a4 + 128) = v26;
  *(_QWORD *)(a4 + 144) = v30;
  AGX::Impl::TileProgramKey::initCommon(a4, a1);
  *(_DWORD *)(a4 + 100) &= ~0x80u;
  if (a4 + 160 != a2)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 160), *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 5);
  if (a4 + 184 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 184), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  *(_QWORD *)((char *)&v28 + 6) = 0;
  *(_QWORD *)&v28 = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a4, (unsigned __int8 *)&v28);
}

double AGX::ProgramKeyFactoryImpl<AGX::G16::Classes,AGX::G16::Encoders>::CreateBackgroundObjectProgramKey@<D0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  double result;
  __int128 v4;
  int v5;
  _OWORD v6[2];
  uint64_t v7;
  int v8;
  unsigned __int8 v9;
  unsigned __int16 v10;
  unsigned __int8 v11;

  *(_DWORD *)(a2 + 8) = 13;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFAA8;
  AGX::FramebufferCompilerConfig<AGX::G16::Encoders,AGX::G16::Classes,AGX::G16::ObjClasses>::FramebufferCompilerConfig((uint64_t)v6, a1);
  AGX::FramebufferCompilerConfigGen3<AGX::G16::Encoders,AGX::G16::Classes,AGX::G16::ObjClasses>::buildDrawBufferState((uint64_t)v6);
  result = *(double *)v6;
  v4 = v6[1];
  *(_OWORD *)(a2 + 40) = v6[0];
  *(_OWORD *)(a2 + 56) = v4;
  *(_QWORD *)(a2 + 72) = v7;
  *(_QWORD *)(a2 + 80) = 0;
  v5 = v10 | (v11 << 16) | (v8 << 24);
  *(_WORD *)(a2 + 84) = v9;
  *(_DWORD *)(a2 + 80) = v5;
  return result;
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G16::Classes,AGX::G16::Encoders>::CreateEndOfTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;
  int v28;
  _OWORD v29[2];
  uint64_t v30;
  _OWORD v31[2];
  uint64_t v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  unsigned __int8 v37;
  unsigned __int8 v38;
  unsigned int v39;
  _BYTE v40[40];

  *(_DWORD *)(a2 + 8) = 19;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)a2 = off_1E7ECFAE8;
  *(_OWORD *)(a2 + 40) = 0u;
  v3 = a2 + 40;
  *(_QWORD *)(a2 + 16) = 0;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(_OWORD *)(a2 + 88) = 0u;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_QWORD *)(a2 + 118) = 0;
  AGX::FramebufferCompilerConfig<AGX::G16::Encoders,AGX::G16::Classes,AGX::G16::ObjClasses>::FramebufferCompilerConfig((uint64_t)v31, a1);
  result = AGX::FramebufferCompilerConfigGen3<AGX::G16::Encoders,AGX::G16::Classes,AGX::G16::ObjClasses>::buildDrawBufferState((uint64_t)v31);
  v29[0] = v31[0];
  v29[1] = v31[1];
  v5 = v32;
  v30 = v32;
  v6 = v39;
  v7 = v33;
  v24 = v34;
  v8 = ((unint64_t)BYTE2(v32) << 36) | ((unint64_t)((unsigned __int16)v32 >> 12) << 32) | 0x40000000000000;
  *(_QWORD *)(a2 + 112) = v8;
  if (v7)
  {
    v9 = 0;
    v28 = 0;
    v10 = 0;
    v20 = (unsigned __int16)v5 >> 12;
    v23 = v38;
    v22 = HIWORD(v5) & 0x1FF;
    v21 = v37 & ~v36 | v35;
    v19 = v36 & ~v37 | v35;
    do
    {
      v11 = __clz(__rbit32(v7));
      v12 = *((_DWORD *)v29 + v11);
      v13 = *(_DWORD *)(v3 + 4 * v11) & 0xE3000000;
      result = AGX::PBEStateEncoderGen9<kAGXRevG16>::StateFields::getDimensionality(v40[2 * v11], v40[2 * v11 + 1], v6);
      *(_DWORD *)(v3 + 4 * v11) = v13 & 0xE3FFE0FF | ((_DWORD)result << 16) & 0xE3FFFFFF | ((v12 & 0x1F) << 8) | (v12 >> 5 << 26) | ((v12 >> 12) / v22);
      v9 |= 1 << v11;
      v27 = (v12 >> 12) / v22;
      v28 |= (1 << v11) & v21;
      v14 = v23 & (1 << v11);
      v10 |= v14;
      if ((v24 & (1 << v11)) != 0)
      {
        v26 = v10;
        v15 = (v12 & 0x1F) << 8;
        v25 = (v12 << 21) & 0x1C000000;
        v16 = v11 + 8;
        v17 = (v12 << 16) & 0x1000000;
        if (v20 <= 1)
          v17 = 0;
        v18 = *(_DWORD *)(v3 + 4 * (v11 + 8)) & 0xE2000000 | v17;
        result = AGX::PBEStateEncoderGen9<kAGXRevG16>::StateFields::getDimensionality(v40[2 * v11 + 16], v40[2 * v11 + 17], v6);
        *(_DWORD *)(v3 + 4 * v16) = v18 | ((_DWORD)result << 16) | v15 | v25 | v27;
        v9 |= 256 << v11;
        v28 |= ((v19 >> v11) & 1) << v16;
        v10 = ((v14 != 0) << v16) | v26;
      }
      v7 ^= 1 << v11;
    }
    while (v7);
    v8 = (unint64_t)*(unsigned int *)(a2 + 116) << 32;
  }
  else
  {
    LOWORD(v10) = 0;
    LOWORD(v28) = 0;
    LOWORD(v9) = 0;
  }
  *(_WORD *)(a2 + 120) = v9;
  *(_WORD *)(a2 + 122) = v28;
  *(_WORD *)(a2 + 124) = v10;
  *(_QWORD *)(a2 + 112) = v8 | (unsigned __int16)(v9 & ~(_WORD)v28) | ((unint64_t)(unsigned __int16)(v9 & v10) << 16);
  return result;
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G16::Classes,AGX::G16::Encoders>::CreateBVHBuilderProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 8) = 24;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFB68;
  *(_DWORD *)(a2 + 40) = 0;
  return AGX::BVHBuilderProgramKey::initializeWithDescriptor(a2, a1);
}

uint64_t AGX::FramebufferCompilerConfig<AGX::G5::Encoders,AGX::G5::Classes,AGX::G5::ObjClasses>::FramebufferCompilerConfig(uint64_t a1, int *a2)
{
  MTLPixelFormat v4;
  uint64_t v5;
  char *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  __int32 v24;
  int v25;
  uint64_t v26;
  int v27;
  char *v28;
  uint64_t v29;
  char v30;
  int v31;
  char v32;
  uint64_t v33;
  int v34;
  int v35;
  int32x2_t v36;
  int v37;
  char *v38;
  uint64_t v39;
  char v40;
  int v41;
  char *v42;
  char v43;
  char v44;
  char v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  unsigned __int16 *v49;
  unsigned int v50;
  char v51;
  char v52;
  uint64_t v53;

  *(_OWORD *)(a1 + 63) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 80) = 1;
  *(_WORD *)(a1 + 84) = 0;
  *(_DWORD *)(a1 + 88) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  bzero((void *)a1, 0x28uLL);
  if (a2)
  {
    v5 = *a2;
    v6 = (char *)a2 - v5;
    v7 = *(unsigned __int16 *)((char *)a2 - v5);
    if (v7 < 5)
      goto LABEL_71;
    v8 = -v5;
    v9 = *((unsigned __int16 *)v6 + 2);
    if (*((_WORD *)v6 + 2))
    {
      v10 = (char *)a2 + v9;
      v11 = *(unsigned int *)((char *)a2 + v9);
      v12 = *(unsigned int *)((char *)a2 + v9 + v11);
      if ((_DWORD)v12)
      {
        v13 = 0;
        v14 = 0;
        v15 = v9 + v11;
        while (1)
        {
          v16 = *(unsigned int *)((char *)a2 + v15 + 4);
          v17 = (char *)a2 + v15 + v16;
          v18 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v18 + 2) >= 5u)
          {
            v19 = *((unsigned __int16 *)v18 + 4);
            if (v19)
            {
              v20 = (char *)a2 + v15 + v16 + v19;
              if (*((_WORD *)v20 + 2))
                break;
            }
          }
LABEL_46:
          if (v14 <= 6)
          {
            ++v14;
            v13 += 2;
            v15 += 4;
            if (v14 < v12)
              continue;
          }
          v47 = *a2;
          v8 = -v47;
          v7 = *(unsigned __int16 *)((char *)a2 - v47);
          goto LABEL_66;
        }
        *(_QWORD *)(a1 + 8 * v14 + 96) = AGX::G5::TextureFormatTable::chooseTextureFormatCPP((AGX::G5::TextureFormatTable *)*((unsigned __int16 *)v20 + 2), v4);
        v21 = 1 << v14;
        *(_DWORD *)(a1 + 40) |= 1 << v14;
        v22 = v16 - *((int *)v17 + 1);
        v23 = *(unsigned __int16 *)((char *)a2 + v15 + v22 + 4);
        if (v23 < 0x19)
        {
          v25 = 0;
          v24 = 0;
          if (v23 < 0xF)
          {
LABEL_34:
            v25 = 0;
            v34 = 1 << v14;
LABEL_35:
            *(_DWORD *)(a1 + 52) |= v34;
            v36.i32[0] = v24;
            v36.i32[1] = v25 & 0xFFFFFFFD;
            *(int8x8_t *)(a1 + 60) = vorr_s8(*(int8x8_t *)(a1 + 60), vand_s8((int8x8_t)vdup_n_s32(v21), (int8x8_t)vceq_s32(v36, (int32x2_t)0x100000001)));
            if (v25 == 4)
              v37 = 1 << v14;
            else
              v37 = 0;
            *(_DWORD *)(a1 + 72) |= v37;
            v38 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
            if (*((unsigned __int16 *)v38 + 2) >= 7u && (v39 = *((unsigned __int16 *)v38 + 5)) != 0)
            {
              v40 = 0;
              v41 = *((unsigned __int8 *)a2 + v15 + v16 + v39 + 4);
              v42 = (char *)(a1 + v13 + 160);
              v43 = 2;
              v44 = 1;
              switch(v41)
              {
                case 0:
                case 1:
                  v43 = 1;
                  v40 = v41;
                  goto LABEL_52;
                case 3:
                  goto LABEL_57;
                case 4:
                  v45 = 2;
                  goto LABEL_43;
                case 5:
                  goto LABEL_51;
                case 6:
                  v40 = 1;
LABEL_51:
                  v43 = 4;
                  goto LABEL_52;
                case 7:
                  *v42 = 3;
                  *(_BYTE *)(a1 + v13 + 161) = 0;
LABEL_55:
                  v46 = 3;
                  break;
                case 8:
                  v44 = 3;
LABEL_57:
                  *v42 = 2;
                  *(_BYTE *)(a1 + v13 + 161) = v44;
LABEL_58:
                  *(_BYTE *)(a1 + 78) |= v21;
                  goto LABEL_44;
                default:
LABEL_52:
                  *v42 = v43;
                  *(_BYTE *)(a1 + v13 + 161) = v40;
                  v46 = 1;
                  switch(v41)
                  {
                    case 0:
                      goto LABEL_45;
                    case 1:
                      *(_BYTE *)(a1 + 78) |= v21;
                      v46 = 1;
                      break;
                    case 3:
                    case 5:
                    case 6:
                    case 8:
                      goto LABEL_58;
                    case 7:
                      goto LABEL_55;
                    default:
                      goto LABEL_44;
                  }
                  break;
              }
            }
            else
            {
              v45 = 0;
              v42 = (char *)(a1 + 2 * v14 + 160);
LABEL_43:
              *v42 = 2;
              *(_BYTE *)(a1 + v13 + 161) = v45;
LABEL_44:
              v46 = 2;
            }
LABEL_45:
            *(_WORD *)(a1 + 76) |= v46 << v13;
            v12 = *(unsigned int *)&v10[v11];
            goto LABEL_46;
          }
        }
        else
        {
          if (*(_WORD *)((char *)a2 + v15 + v22 + 28))
            v24 = *((unsigned __int8 *)a2 + v15 + v16 + *(unsigned __int16 *)((char *)a2 + v15 + v22 + 28) + 4);
          else
            v24 = 0;
          if (v23 >= 0x1B && *(_WORD *)((char *)a2 + v15 + v22 + 30))
            v25 = *((unsigned __int8 *)a2 + v15 + v16 + *(unsigned __int16 *)((char *)a2 + v15 + v22 + 30) + 4);
          else
            v25 = 0;
        }
        v26 = *(unsigned __int16 *)((char *)a2 + v15 + v22 + 18);
        if (v26 && *(_WORD *)((char *)a2 + v15 + v16 + v26 + 4))
        {
          *(_DWORD *)(a1 + 48) |= v21;
          if ((v25 & 0xFE) == 2)
            v27 = 1 << v14;
          else
            v27 = 0;
          *(_DWORD *)(a1 + 68) |= v27;
          v28 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v28 + 2) >= 0x11u && (v29 = *((unsigned __int16 *)v28 + 10), *((_WORD *)v28 + 10)))
          {
            v30 = 0;
            v31 = *((unsigned __int8 *)a2 + v15 + v16 + v29 + 4);
            v32 = 2;
            switch(v31)
            {
              case 0:
              case 1:
                v32 = 1;
                v30 = v31;
                break;
              case 3:
                v30 = 1;
                break;
              case 4:
                v30 = 2;
                break;
              case 5:
                goto LABEL_61;
              case 6:
                v30 = 1;
LABEL_61:
                v32 = 4;
                break;
              case 7:
                v30 = 0;
                v32 = 3;
                break;
              case 8:
                v30 = 3;
                break;
              default:
                break;
            }
          }
          else
          {
            v30 = 0;
            v32 = 2;
          }
          v33 = a1 + v13;
          *(_BYTE *)(v33 + 176) = v32;
          *(_BYTE *)(v33 + 177) = v30;
        }
        v34 = 0;
        if (v24 == 2)
          v35 = 1 << v14;
        else
          v35 = 0;
        *(_DWORD *)(a1 + 56) |= v35;
        if (v25)
          goto LABEL_35;
        goto LABEL_34;
      }
    }
LABEL_66:
    if (v7 >= 7
      && *(_WORD *)((char *)a2 + v8 + 6)
      && (v48 = *(_QWORD *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v8 + 6)), (v48 & 0xFFFFFFFE) != 0))
    {
      if (v48 > 0x7FF)
        LODWORD(v48) = 2048;
    }
    else
    {
LABEL_71:
      LODWORD(v48) = 1;
    }
    *(_DWORD *)(a1 + 80) = v48;
    v49 = (unsigned __int16 *)((char *)a2 - *a2);
    v50 = *v49;
    if (v50 < 0xB)
    {
      v52 = 1;
      *(_BYTE *)(a1 + 84) = 1;
      if (v50 < 9)
      {
LABEL_82:
        *(_BYTE *)(a1 + 85) = v52;
        return a1;
      }
    }
    else
    {
      if (v49[5])
        v51 = *((_BYTE *)a2 + v49[5]);
      else
        v51 = 1;
      *(_BYTE *)(a1 + 84) = v51;
    }
    v53 = v49[4];
    if (v53)
      v52 = *((_BYTE *)a2 + v53);
    else
      v52 = 1;
    goto LABEL_82;
  }
  return a1;
}

unint64_t AGX::FramebufferCompilerConfig<AGX::G5::Encoders,AGX::G5::Classes,AGX::G5::ObjClasses>::partitionSizeFromFormatAndCompCount(int a1, unsigned int a2)
{
  switch(a1)
  {
    case 2:
    case 3:
    case 4:
    case 5:
      return ((unint64_t)a2 + 3) >> 2;
    case 6:
    case 7:
    case 8:
    case 9:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 22:
      a2 *= 2;
      break;
    case 10:
    case 11:
    case 17:
      a2 *= 4;
      break;
    case 18:
    case 19:
    case 20:
    case 21:
      a2 = 4;
      break;
    default:
      a2 = 0;
      break;
  }
  return ((unint64_t)a2 + 3) >> 2;
}

uint64_t AGX::FramebufferCompilerConfigGen2<AGX::G5::Encoders,AGX::G5::Classes,AGX::G5::ObjClasses>::promotedPBESourceFormat(_DWORD *a1, unsigned int a2, char a3)
{
  uint64_t result;
  _BOOL4 v6;
  _BOOL4 v7;
  unsigned int v8;
  BOOL v9;

  result = a1[8];
  v6 = a2 > 1 && (_DWORD)result == 2;
  if (a2 < 2)
  {
    v7 = 0;
  }
  else
  {
    v7 = a1[21] != 0;
    if ((_DWORD)result == 3)
      return 14;
  }
  v8 = a1[7];
  v9 = !v6 && !v7 && v8 >= 3;
  if (!v9 || (a3 & 1) == 0)
  {
    switch((int)result)
    {
      case 18:
        return 9;
      case 19:
        return 14;
      case 20:
      case 21:
        return 12;
      default:
        if ((_DWORD)result == 2)
        {
          result = 13;
        }
        else if ((_DWORD)result == 3)
        {
          return 14;
        }
        break;
    }
  }
  return result;
}

unint64_t AGX::FramebufferCompilerConfigGen2<AGX::G5::Encoders,AGX::G5::Classes,AGX::G5::ObjClasses>::buildDrawBufferState(unint64_t result)
{
  unint64_t v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  _DWORD *v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  _DWORD *v13;
  unsigned int v14;
  char v15;
  int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;

  v1 = result;
  v2 = 0;
  v3 = *(unsigned __int8 *)(result + 40);
  v4 = v3;
  do
  {
    v5 = v4;
    if (!v4)
      break;
    v6 = __clz(__rbit32(v4));
    v7 = *(_DWORD **)(v1 + 8 * v6 + 96);
    v8 = AGX::FramebufferCompilerConfigGen2<AGX::G5::Encoders,AGX::G5::Classes,AGX::G5::ObjClasses>::promotedPBESourceFormat(v7, *(unsigned __int8 *)(v1 + 84), 0);
    result = AGX::FramebufferCompilerConfig<AGX::G5::Encoders,AGX::G5::Classes,AGX::G5::ObjClasses>::partitionSizeFromFormatAndCompCount(v8, v7[7]);
    v2 += result;
    v4 = (1 << v6) ^ v5;
  }
  while (v2 < 9);
  v9 = 1;
  if (v3)
  {
    v10 = 0;
    v11 = 0;
    do
    {
      v12 = __clz(__rbit32(v3));
      v13 = *(_DWORD **)(v1 + 8 * v12 + 96);
      v23 = v13[7];
      v14 = AGX::FramebufferCompilerConfigGen2<AGX::G5::Encoders,AGX::G5::Classes,AGX::G5::ObjClasses>::promotedPBESourceFormat(v13, *(unsigned __int8 *)(v1 + 84), v5 != 0);
      v15 = v14;
      if (v14 > 0x12 || ((1 << v14) & 0x4000C) == 0)
      {
        v18 = 0;
        v17 = 1 << v12;
      }
      else
      {
        v17 = 1 << v12;
        v11 |= 1 << v12;
        v18 = (v13[21] != 0) << 8;
      }
      result = AGX::FramebufferCompilerConfig<AGX::G5::Encoders,AGX::G5::Classes,AGX::G5::ObjClasses>::partitionSizeFromFormatAndCompCount(v14, v23);
      v19 = v15 & 0x1F | (v10 << 12) | v18 | *(_DWORD *)(v1 + 4 * v12) & 0xFFF00EE0;
      *(_DWORD *)(v1 + 4 * v12) = v19;
      v20 = v19 & 0xFFFFF1FF | ((v13[19] & 7) << 9);
      *(_DWORD *)(v1 + 4 * v12) = v20;
      v21 = v20 & 0xFFFFFF1F | (32 * (v13[7] & 7));
      *(_DWORD *)(v1 + 4 * v12) = v21;
      if ((v11 & v17) != 0)
        *(_DWORD *)(v1 + 4 * v12) = v21 & 0xFFFFF1FF | ((v13[17] == 173824) << 9);
      v10 += result;
      v3 ^= v17;
      v9 = 1;
    }
    while (v3);
    if (v10 >= 2)
    {
      if (v10 >= 5)
        v9 = 8;
      else
        v9 = 1 << -__clz(v10 - 1);
    }
  }
  else
  {
    v11 = 0;
  }
  if (v9 <= 2)
    v22 = 2;
  else
    v22 = v9;
  *(_DWORD *)(v1 + 32) = *(_DWORD *)(v1 + 32) & 0xFE000000 | ((v22 & 0x1FF) << 16) | ((*(_BYTE *)(v1 + 84) & 0xF) << 8) & 0xFFF | ((*(_BYTE *)(v1 + 85) & 0xF) << 12) | *(unsigned __int8 *)(v1 + 40);
  *(_DWORD *)(v1 + 44) = v11;
  return result;
}

_QWORD *AGCTargetImpl<AGX::G5::Classes,AGX::G5::Encoders>::CreateProgramKeyFactory@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_1E7ECF900;
  *a1 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::G5::Classes,AGX::G5::Encoders>::CreateTGSizeToTempTable@<X0>(_DWORD *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;

  *a1 = 31;
  result = operator new[]();
  v5 = *a1;
  if ((_DWORD)v5)
  {
    v6 = 0;
    v7 = 0;
    v8 = 3329;
    do
    {
      if ((v7 & 0x1FFFFFFF) != 0)
      {
        v9 = 32 * (v8 / v6);
        if (v9 >= 0x300)
          v10 = 768;
        else
          v10 = 32 * (v8 / v6);
        if (v9 >= 0x200)
          v9 = 512;
        if (v10 >= 0x200)
          v9 = 512;
      }
      else
      {
        v9 = 512;
      }
      *(_DWORD *)(result + 4 * v7++) = v9;
      v8 -= 32;
      v6 += 32;
    }
    while (v5 != v7);
  }
  *a2 = result;
  return result;
}

_QWORD *AGCTargetImpl<AGX::G5::Classes,AGX::G5::Encoders>::GetLegalizationPasses@<X0>(_DWORD *a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *result;
  uint64_t v5;
  int v6;
  const char *v7;
  const char *v8;
  char v9;
  const char *v10;
  char v11;
  const char *v12;
  char v13;
  const char *v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = "air-degenerate-vertex-amplification-emulation";
  v9 = 1;
  v10 = "air-raytracing-emulation,indirect-acceleration-structures";
  v11 = 0;
  v12 = "mtl-fetch-all";
  v13 = 1;
  v14 = "air-bfloat-emulation";
  v15 = 1;
  result = malloc_type_malloc(0x20uLL, 0x10040436913F5uLL);
  v5 = 0;
  v6 = 0;
  *a1 = 0;
  do
  {
    if (LOBYTE((&v8)[v5 + 1]))
    {
      v7 = (&v8)[v5];
      *a1 = v6 + 1;
      result[v6++] = v7;
    }
    v5 += 2;
  }
  while (v5 != 8);
  *a2 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::G5::Classes,AGX::G5::Encoders>::requiresRayTracingEmulation()
{
  return 1;
}

uint64_t AGCTargetImpl<AGX::G5::Classes,AGX::G5::Encoders>::maxMSAASampleCount()
{
  return 4;
}

void AGX::ProgramKeyFactoryImpl<AGX::G5::Classes,AGX::G5::Encoders>::~ProgramKeyFactoryImpl()
{
  JUMPOUT(0x1CAA2D68CLL);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G5::Classes,AGX::G5::Encoders>::CreateVertexProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, int a6@<W6>, uint64_t a7@<X8>)
{
  uint64_t v14;
  int v15;
  __int16 v17;
  uint64_t v18;
  int v19;
  std::string v20;
  std::string v21;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v20 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v21, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v21 = *(std::string *)(a2 + 24);
  v14 = *(unsigned __int8 *)(a2 + 48);
  *(_DWORD *)(a7 + 8) = 3;
  *(_OWORD *)(a7 + 96) = 0u;
  *(_OWORD *)(a7 + 112) = 0u;
  *(_OWORD *)(a7 + 128) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 76) = 0u;
  *(_QWORD *)a7 = &off_1E7ED3720;
  *(std::string *)(a7 + 144) = v20;
  *(std::string *)(a7 + 168) = v21;
  *(_BYTE *)(a7 + 192) = v14;
  *(_QWORD *)(a7 + 56) = v14 << 18;
  AGX::Impl::VertexProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a7, a3);
  if (a7 + 96 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 96), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a7 + 120 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 120), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a6)
    v15 = 2;
  else
    v15 = 0;
  *(_DWORD *)(a7 + 88) = *(_DWORD *)(a7 + 88) & 0xFFFFFFFD | v15;
  v17 = 256;
  v18 = 0;
  v19 = 0;
  return AGX::GeometrySharedKey<_AGCVertexContextStateAGP,(_AGCStreamToken)3>::setDeviceOptions(a7, (unsigned __int8 *)&v17);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G5::Classes,AGX::G5::Encoders>::CreateObjectProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, int a3@<W3>, NSObject *a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  char *v11;
  int v12;
  int v13;
  __int16 v15;
  uint64_t v16;
  int v17;

  *(_DWORD *)(a7 + 8) = 9;
  *(_OWORD *)(a7 + 104) = 0u;
  v11 = (char *)(a7 + 104);
  *(_OWORD *)(a7 + 120) = 0u;
  *(_OWORD *)(a7 + 136) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 80) = 0u;
  *(_DWORD *)(a7 + 96) = 0;
  *(_QWORD *)a7 = &off_1E7ED37B0;
  if (a2)
    v12 = 2;
  else
    v12 = 0;
  if (a3)
    v13 = 4;
  else
    v13 = 0;
  *(_DWORD *)(a7 + 56) = v13 | v12;
  AGX::Impl::ObjectProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a7, a4);
  if (v11 != (char *)a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v11, *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a7 + 128 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 128), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  v15 = 256;
  v16 = 0;
  v17 = 0;
  return AGX::GeometrySharedKey<_AGCObjectContextStateAGP,(_AGCStreamToken)9>::setDeviceOptions(a7, (unsigned __int8 *)&v15);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G5::Classes,AGX::G5::Encoders>::CreateMeshProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, int a3@<W3>, int a4@<W4>, NSObject *a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, char a9)
{
  int v17;
  __int128 v18;
  int v19;
  int v20;
  int v21;
  __int16 v23;
  uint64_t v24;
  int v25;
  std::string v26;
  std::string v27;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v26, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v26 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v27, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v27 = *(std::string *)(a2 + 24);
  v17 = *(unsigned __int8 *)(a2 + 48);
  *(_OWORD *)(a8 + 104) = 0u;
  *(_DWORD *)(a8 + 8) = 10;
  *(_OWORD *)(a8 + 120) = 0u;
  *(_OWORD *)(a8 + 136) = 0u;
  *(_OWORD *)(a8 + 16) = 0u;
  *(_OWORD *)(a8 + 32) = 0u;
  *(_OWORD *)(a8 + 48) = 0u;
  *(_OWORD *)(a8 + 64) = 0u;
  *(_OWORD *)(a8 + 80) = 0u;
  *(_DWORD *)(a8 + 96) = 0;
  *(_QWORD *)a8 = &off_1E7ED3768;
  *(std::string *)(a8 + 152) = v26;
  v18 = *(_OWORD *)&v27.__r_.__value_.__l.__data_;
  *(_QWORD *)(a8 + 192) = *((_QWORD *)&v27.__r_.__value_.__l + 2);
  if (a3)
    v19 = 128;
  else
    v19 = 0;
  if (a4)
    v20 = 256;
  else
    v20 = 0;
  *(_OWORD *)(a8 + 176) = v18;
  *(_BYTE *)(a8 + 200) = v17;
  *(_DWORD *)(a8 + 56) = v20 | v19 | (16 * v17);
  AGX::Impl::MeshProgramKey::initCommon((AGX *)a8, a1);
  *(_DWORD *)(a8 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a8, a5);
  if (a8 + 104 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 104), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  if (a8 + 128 != a7)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 128), *(char **)a7, *(_QWORD *)(a7 + 8), (uint64_t)(*(_QWORD *)(a7 + 8) - *(_QWORD *)a7) >> 5);
  if (a9)
    v21 = 2;
  else
    v21 = 0;
  *(_DWORD *)(a8 + 96) = *(_DWORD *)(a8 + 96) & 0xFFFFFFFD | v21;
  v23 = 256;
  v24 = 0;
  v25 = 0;
  return AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setDeviceOptions(a8, (unsigned __int8 *)&v23);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G5::Classes,AGX::G5::Encoders>::CreateFragmentProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  char *v12;
  MTLPixelFormat v13;
  unsigned __int16 *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char v28;
  char v29;
  __int128 v30;
  int v31;
  int v32;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[31];
  int v42;
  __int16 v43;
  int v44;
  _OWORD v45[7];

  *(_DWORD *)(a6 + 8) = 4;
  *(_QWORD *)(a6 + 24) = 0;
  *(_QWORD *)(a6 + 32) = 0;
  *(_QWORD *)(a6 + 16) = 0;
  *(_OWORD *)(a6 + 232) = 0u;
  v12 = (char *)(a6 + 232);
  *(_QWORD *)a6 = &off_1E7ED37F8;
  *(_OWORD *)(a6 + 40) = 0u;
  *(_OWORD *)(a6 + 56) = 0u;
  *(_OWORD *)(a6 + 72) = 0u;
  *(_OWORD *)(a6 + 88) = 0u;
  *(_OWORD *)(a6 + 104) = 0u;
  *(_OWORD *)(a6 + 120) = 0u;
  *(_OWORD *)(a6 + 136) = 0u;
  *(_OWORD *)(a6 + 152) = 0u;
  *(_OWORD *)(a6 + 168) = 0u;
  *(_OWORD *)(a6 + 184) = 0u;
  *(_OWORD *)(a6 + 200) = 0u;
  *(_OWORD *)(a6 + 209) = 0u;
  *(_OWORD *)(a6 + 248) = 0u;
  *(_OWORD *)(a6 + 264) = 0u;
  v40 = 0u;
  memset(v41, 0, sizeof(v41));
  v38 = 0u;
  v39 = 0u;
  v42 = 1;
  v43 = 0;
  v44 = 0;
  memset(v45, 0, 96);
  bzero(&v38, 0x28uLL);
  if (!a1)
    goto LABEL_22;
  v37 = a2;
  v14 = (unsigned __int16 *)((char *)a1 - *(int *)a1);
  v15 = *v14;
  if (v15 >= 0x17)
  {
    v16 = v14[11];
    if (!v14[11])
      goto LABEL_14;
    v17 = *(unsigned int *)((char *)a1 + v16);
    v18 = (unsigned int *)((char *)a1 + v16 + v17);
    v19 = *v18;
    if (!(_DWORD)v19)
      goto LABEL_14;
    v34 = a3;
    v35 = a4;
    v36 = a5;
    v20 = 0;
    v21 = DWORD2(v40);
    v22 = (char *)a1 + v16 + v17;
    do
    {
      v23 = &v22[4 * v20];
      v24 = *((unsigned int *)v23 + 1);
      v25 = (char *)v18 + v24 - *(int *)&v23[v24 + 4];
      if (*((unsigned __int16 *)v25 + 2) >= 5u)
      {
        v26 = *((unsigned __int16 *)v25 + 4);
        if (v26)
        {
          v27 = (char *)v18 + v24 + v26;
          if (*((_WORD *)v27 + 2))
          {
            *((_QWORD *)v45 + v20) = AGX::G5::TextureFormatTable::chooseTextureFormatCPP((AGX::G5::TextureFormatTable *)*((unsigned __int16 *)v27 + 2), v13);
            v21 |= 1 << v20;
          }
        }
      }
      if (v20 > 6)
        break;
      ++v20;
      ++v18;
    }
    while (v20 < v19);
    DWORD2(v40) = v21;
    a4 = v35;
    a5 = v36;
    a3 = v34;
  }
  if (v15 <= 0xC)
  {
    v29 = 1;
    LOBYTE(v43) = 1;
    a2 = v37;
LABEL_21:
    HIBYTE(v43) = v29;
    goto LABEL_22;
  }
LABEL_14:
  if (v14[6])
    v28 = *((_BYTE *)a1 + v14[6]);
  else
    v28 = 1;
  a2 = v37;
  LOBYTE(v43) = v28;
  HIBYTE(v43) = v28;
  if (v15 >= 0xF)
  {
    if (v14[7])
    {
      v29 = *((_BYTE *)a1 + v14[7]);
      if (v29)
        goto LABEL_21;
    }
  }
LABEL_22:
  AGX::FramebufferCompilerConfigGen2<AGX::G5::Encoders,AGX::G5::Classes,AGX::G5::ObjClasses>::buildDrawBufferState((unint64_t)&v38);
  v30 = v39;
  *(_OWORD *)(a6 + 112) = v38;
  *(_OWORD *)(a6 + 128) = v30;
  *(_QWORD *)(a6 + 144) = v40;
  AGX::Impl::FragmentProgramKey::initCommon((AGX *)a6, a1);
  v31 = *(_DWORD *)(a6 + 104);
  if (a2)
    v32 = 256;
  else
    v32 = 0;
  *(_DWORD *)(a6 + 100) &= ~0x80u;
  *(_DWORD *)(a6 + 104) = v31 & 0xFFFFFEFF | v32;
  AGX::Impl::FragmentProgramKey::setSerializedDescriptor((AGX::Impl::FragmentProgramKey *)a6, a3);
  if (v12 != (char *)a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v12, *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a6 + 256 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a6 + 256), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  LOWORD(v38) = 256;
  *(_QWORD *)((char *)&v38 + 2) = 0;
  *(_DWORD *)((char *)&v38 + 10) = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a6, (unsigned __int8 *)&v38);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G5::Classes,AGX::G5::Encoders>::CreateComputeProgramKey@<X0>(AGX *a1@<X1>, NSObject *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  __int16 v11;
  uint64_t v12;
  int v13;

  *(_DWORD *)(a5 + 8) = 6;
  *(_QWORD *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  *(_QWORD *)(a5 + 32) = 0;
  *(_QWORD *)(a5 + 40) = 0;
  *(_QWORD *)a5 = &off_1E7ED3878;
  *(_QWORD *)(a5 + 48) = 0;
  *(_QWORD *)(a5 + 56) = 0;
  std::string::basic_string[abi:nn180100]<0>((_QWORD *)(a5 + 64), (char *)&unk_1C3E4D9BB);
  *(_BYTE *)(a5 + 88) = 0;
  *(_OWORD *)(a5 + 96) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_OWORD *)(a5 + 128) = 0u;
  AGX::Impl::ComputeProgramKey::initCommon((AGX *)a5, a1);
  *(_DWORD *)(a5 + 52) &= ~0x80u;
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a5, a2);
  if (a5 + 96 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 96), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  if (a5 + 120 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 120), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  v11 = 256;
  v12 = 0;
  v13 = 0;
  return AGX::Impl::ComputeProgramKey::setDeviceOptions(a5, (unsigned __int8 *)&v11);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G5::Classes,AGX::G5::Encoders>::CreateTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, unint64_t a4@<X8>)
{
  MTLPixelFormat v8;
  unsigned __int16 *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char v23;
  char v24;
  __int128 v25;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[31];
  int v32;
  __int16 v33;
  int v34;
  _OWORD v35[7];

  *(_DWORD *)(a4 + 8) = 5;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)a4 = &off_1E7ED3838;
  *(_OWORD *)(a4 + 40) = 0u;
  *(_OWORD *)(a4 + 56) = 0u;
  *(_OWORD *)(a4 + 72) = 0u;
  *(_OWORD *)(a4 + 88) = 0u;
  *(_OWORD *)(a4 + 104) = 0u;
  *(_OWORD *)(a4 + 120) = 0u;
  *(_OWORD *)(a4 + 136) = 0u;
  *(_OWORD *)(a4 + 152) = 0u;
  *(_OWORD *)(a4 + 168) = 0u;
  *(_OWORD *)(a4 + 184) = 0u;
  *(_QWORD *)(a4 + 200) = 0;
  v30 = 0u;
  memset(v31, 0, sizeof(v31));
  v28 = 0u;
  v29 = 0u;
  v32 = 1;
  v33 = 0;
  v34 = 0;
  memset(v35, 0, 96);
  bzero(&v28, 0x28uLL);
  if (!a1)
    goto LABEL_22;
  v9 = (unsigned __int16 *)((char *)a1 - *a1);
  v10 = *v9;
  if (v10 < 0xF)
    goto LABEL_13;
  v11 = v9[7];
  if (v9[7])
  {
    v12 = *(unsigned int *)((char *)a1 + v11);
    v13 = (unsigned int *)((char *)a1 + v11 + v12);
    v14 = *v13;
    if ((_DWORD)v14)
    {
      v15 = 0;
      v16 = DWORD2(v30);
      v27 = a3;
      v17 = (char *)a1 + v11 + v12;
      do
      {
        v18 = &v17[4 * v15];
        v19 = *((unsigned int *)v18 + 1);
        v20 = (char *)v13 + v19 - *(int *)&v18[v19 + 4];
        if (*((unsigned __int16 *)v20 + 2) >= 5u)
        {
          v21 = *((unsigned __int16 *)v20 + 4);
          if (v21)
          {
            v22 = (char *)v13 + v19 + v21;
            if (*((_WORD *)v22 + 2))
            {
              *((_QWORD *)v35 + v15) = AGX::G5::TextureFormatTable::chooseTextureFormatCPP((AGX::G5::TextureFormatTable *)*((unsigned __int16 *)v22 + 2), v8);
              v16 |= 1 << v15;
            }
          }
        }
        if (v15 > 6)
          break;
        ++v15;
        ++v13;
      }
      while (v15 < v14);
      DWORD2(v30) = v16;
      a3 = v27;
LABEL_13:
      if (v10 <= 0xA)
      {
        v24 = 1;
        LOBYTE(v33) = 1;
LABEL_21:
        HIBYTE(v33) = v24;
        goto LABEL_22;
      }
    }
  }
  if (v9[5])
    v23 = *((_BYTE *)a1 + v9[5]);
  else
    v23 = 1;
  LOBYTE(v33) = v23;
  HIBYTE(v33) = v23;
  if (v10 >= 0xD)
  {
    if (v9[6])
    {
      v24 = *((_BYTE *)a1 + v9[6]);
      if (v24)
        goto LABEL_21;
    }
  }
LABEL_22:
  AGX::FramebufferCompilerConfigGen2<AGX::G5::Encoders,AGX::G5::Classes,AGX::G5::ObjClasses>::buildDrawBufferState((unint64_t)&v28);
  v25 = v29;
  *(_OWORD *)(a4 + 112) = v28;
  *(_OWORD *)(a4 + 128) = v25;
  *(_QWORD *)(a4 + 144) = v30;
  AGX::Impl::TileProgramKey::initCommon(a4, a1);
  *(_DWORD *)(a4 + 100) &= ~0x80u;
  if (a4 + 160 != a2)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 160), *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 5);
  if (a4 + 184 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 184), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  LOWORD(v28) = 256;
  *(_QWORD *)((char *)&v28 + 2) = 0;
  *(_DWORD *)((char *)&v28 + 10) = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a4, (unsigned __int8 *)&v28);
}

double AGX::ProgramKeyFactoryImpl<AGX::G5::Classes,AGX::G5::Encoders>::CreateBackgroundObjectProgramKey@<D0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  double result;
  __int128 v4;
  int v5;
  _OWORD v6[2];
  uint64_t v7;
  int v8;
  unsigned __int8 v9;
  unsigned __int16 v10;
  unsigned __int8 v11;

  *(_DWORD *)(a2 + 8) = 13;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFAA8;
  AGX::FramebufferCompilerConfig<AGX::G5::Encoders,AGX::G5::Classes,AGX::G5::ObjClasses>::FramebufferCompilerConfig((uint64_t)v6, a1);
  AGX::FramebufferCompilerConfigGen2<AGX::G5::Encoders,AGX::G5::Classes,AGX::G5::ObjClasses>::buildDrawBufferState((unint64_t)v6);
  result = *(double *)v6;
  v4 = v6[1];
  *(_OWORD *)(a2 + 40) = v6[0];
  *(_OWORD *)(a2 + 56) = v4;
  *(_QWORD *)(a2 + 72) = v7;
  *(_QWORD *)(a2 + 80) = 0;
  v5 = v10 | (v11 << 16) | (v8 << 24);
  *(_WORD *)(a2 + 84) = v9;
  *(_DWORD *)(a2 + 80) = v5;
  return result;
}

_OWORD *AGX::ProgramKeyFactoryImpl<AGX::G5::Classes,AGX::G5::Encoders>::CreateEndOfTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  _OWORD *result;
  unsigned int v5;
  unsigned int v6;
  int v7;
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  char *v18;
  int v19;
  int v20;
  unsigned int v22;
  unsigned int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  char *v28;
  char v29;
  int v30;
  unsigned int v31;
  int v32;
  int v33;
  int v34;
  _OWORD v35[2];
  uint64_t v36;
  _OWORD v37[2];
  uint64_t v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int8 v44;

  *(_DWORD *)(a2 + 8) = 19;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)a2 = off_1E7ECFAE8;
  *(_OWORD *)(a2 + 40) = 0u;
  v3 = a2 + 40;
  *(_QWORD *)(a2 + 16) = 0;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(_OWORD *)(a2 + 88) = 0u;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_QWORD *)(a2 + 118) = 0;
  AGX::FramebufferCompilerConfig<AGX::G5::Encoders,AGX::G5::Classes,AGX::G5::ObjClasses>::FramebufferCompilerConfig((uint64_t)v37, a1);
  result = (_OWORD *)AGX::FramebufferCompilerConfigGen2<AGX::G5::Encoders,AGX::G5::Classes,AGX::G5::ObjClasses>::buildDrawBufferState((unint64_t)v37);
  v35[0] = v37[0];
  v35[1] = v37[1];
  v5 = v38;
  v36 = v38;
  v6 = v39;
  v7 = v40;
  v8 = ((unint64_t)BYTE2(v38) << 36) | ((unint64_t)((unsigned __int16)v38 >> 12) << 32) | 0x40000000000000;
  *(_QWORD *)(a2 + 112) = v8;
  if (v6)
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = (unsigned __int16)v5 >> 12;
    v13 = HIWORD(v5) & 0x1FF;
    v14 = v43 & ~v42 | v41;
    v15 = v44;
    v16 = v42 & ~v43 | v41;
    result = v35;
    do
    {
      v17 = __clz(__rbit32(v6));
      v18 = (char *)v37 + 2 * v17;
      if ((v18[161] & 1) != 0)
      {
        v20 = 0x20000;
      }
      else
      {
        v19 = v18[160];
        if ((v18[161] & 2) != 0)
          v20 = 0x40000;
        else
          v20 = 0x20000;
        if (v19 != 2)
          v20 = 16711680;
        if ((v19 - 3) < 2 || v19 == 1)
          v20 = 0x20000;
      }
      v22 = *((_DWORD *)v35 + v17);
      v23 = (v22 >> 12) / v13;
      v24 = (v22 & 0x1F) << 8;
      v25 = (v22 << 21) & 0x1C000000;
      *(_DWORD *)(v3 + 4 * v17) = *(_DWORD *)(v3 + 4 * v17) & 0xE3000000 | v20 | v24 | v25 | v23;
      v9 |= 1 << v17;
      v10 |= (1 << v17) & v14;
      v26 = v15 & (1 << v17);
      v11 |= v26;
      if ((v7 & (1 << v17)) != 0)
      {
        if (v12 <= 1)
          v27 = 0;
        else
          v27 = (v22 << 16) & 0x1000000;
        v28 = (char *)v37 + 2 * v17;
        v29 = v28[177];
        if ((v29 & 1) != 0)
        {
          v34 = 0x20000;
        }
        else
        {
          v30 = v28[176];
          v31 = v30 - 3;
          if ((v29 & 2) != 0)
            v32 = 0x40000;
          else
            v32 = 0x20000;
          if (v30 != 2)
            v32 = 16711680;
          if (v30 == 1)
            v33 = 0x20000;
          else
            v33 = v32;
          if (v31 >= 2)
            v34 = v33;
          else
            v34 = 0x20000;
        }
        *(_DWORD *)(v3 + 4 * (v17 + 8)) = *(_DWORD *)(v3 + 4 * (v17 + 8)) & 0xE2000000 | v27 | v34 | v24 | v25 | v23;
        v9 |= 256 << v17;
        v10 |= ((v16 >> v17) & 1) << (v17 + 8);
        v11 |= (v26 != 0) << (v17 + 8);
      }
      v6 ^= 1 << v17;
    }
    while (v6);
    v8 = (unint64_t)*(unsigned int *)(a2 + 116) << 32;
  }
  else
  {
    LOWORD(v11) = 0;
    LOWORD(v10) = 0;
    LOWORD(v9) = 0;
  }
  *(_WORD *)(a2 + 120) = v9;
  *(_WORD *)(a2 + 122) = v10;
  *(_WORD *)(a2 + 124) = v11;
  *(_QWORD *)(a2 + 112) = v8 | (unsigned __int16)(v9 & ~(_WORD)v10) | ((unint64_t)(unsigned __int16)(v9 & v11) << 16);
  return result;
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G5::Classes,AGX::G5::Encoders>::CreateBVHBuilderProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 8) = 24;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFB68;
  *(_DWORD *)(a2 + 40) = 0;
  return AGX::BVHBuilderProgramKey::initializeWithDescriptor(a2, a1);
}

uint64_t AGX::FramebufferCompilerConfig<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::FramebufferCompilerConfig(uint64_t a1, int *a2)
{
  MTLPixelFormat v4;
  uint64_t v5;
  char *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  __int32 v24;
  int v25;
  uint64_t v26;
  int v27;
  char *v28;
  uint64_t v29;
  char v30;
  int v31;
  char v32;
  uint64_t v33;
  int v34;
  int v35;
  int32x2_t v36;
  int v37;
  char *v38;
  uint64_t v39;
  char v40;
  int v41;
  char *v42;
  char v43;
  char v44;
  char v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  unsigned __int16 *v49;
  unsigned int v50;
  char v51;
  char v52;
  uint64_t v53;

  *(_OWORD *)(a1 + 63) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 80) = 1;
  *(_WORD *)(a1 + 84) = 0;
  *(_DWORD *)(a1 + 88) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  bzero((void *)a1, 0x28uLL);
  if (a2)
  {
    v5 = *a2;
    v6 = (char *)a2 - v5;
    v7 = *(unsigned __int16 *)((char *)a2 - v5);
    if (v7 < 5)
      goto LABEL_71;
    v8 = -v5;
    v9 = *((unsigned __int16 *)v6 + 2);
    if (*((_WORD *)v6 + 2))
    {
      v10 = (char *)a2 + v9;
      v11 = *(unsigned int *)((char *)a2 + v9);
      v12 = *(unsigned int *)((char *)a2 + v9 + v11);
      if ((_DWORD)v12)
      {
        v13 = 0;
        v14 = 0;
        v15 = v9 + v11;
        while (1)
        {
          v16 = *(unsigned int *)((char *)a2 + v15 + 4);
          v17 = (char *)a2 + v15 + v16;
          v18 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v18 + 2) >= 5u)
          {
            v19 = *((unsigned __int16 *)v18 + 4);
            if (v19)
            {
              v20 = (char *)a2 + v15 + v16 + v19;
              if (*((_WORD *)v20 + 2))
                break;
            }
          }
LABEL_46:
          if (v14 <= 6)
          {
            ++v14;
            v13 += 2;
            v15 += 4;
            if (v14 < v12)
              continue;
          }
          v47 = *a2;
          v8 = -v47;
          v7 = *(unsigned __int16 *)((char *)a2 - v47);
          goto LABEL_66;
        }
        *(_QWORD *)(a1 + 8 * v14 + 96) = AGX::G9::TextureFormatTable::chooseTextureFormatCPP((AGX::G9::TextureFormatTable *)*((unsigned __int16 *)v20 + 2), v4);
        v21 = 1 << v14;
        *(_DWORD *)(a1 + 40) |= 1 << v14;
        v22 = v16 - *((int *)v17 + 1);
        v23 = *(unsigned __int16 *)((char *)a2 + v15 + v22 + 4);
        if (v23 < 0x19)
        {
          v25 = 0;
          v24 = 0;
          if (v23 < 0xF)
          {
LABEL_34:
            v25 = 0;
            v34 = 1 << v14;
LABEL_35:
            *(_DWORD *)(a1 + 52) |= v34;
            v36.i32[0] = v24;
            v36.i32[1] = v25 & 0xFFFFFFFD;
            *(int8x8_t *)(a1 + 60) = vorr_s8(*(int8x8_t *)(a1 + 60), vand_s8((int8x8_t)vdup_n_s32(v21), (int8x8_t)vceq_s32(v36, (int32x2_t)0x100000001)));
            if (v25 == 4)
              v37 = 1 << v14;
            else
              v37 = 0;
            *(_DWORD *)(a1 + 72) |= v37;
            v38 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
            if (*((unsigned __int16 *)v38 + 2) >= 7u && (v39 = *((unsigned __int16 *)v38 + 5)) != 0)
            {
              v40 = 0;
              v41 = *((unsigned __int8 *)a2 + v15 + v16 + v39 + 4);
              v42 = (char *)(a1 + v13 + 160);
              v43 = 2;
              v44 = 1;
              switch(v41)
              {
                case 0:
                case 1:
                  v43 = 1;
                  v40 = v41;
                  goto LABEL_52;
                case 3:
                  goto LABEL_57;
                case 4:
                  v45 = 2;
                  goto LABEL_43;
                case 5:
                  goto LABEL_51;
                case 6:
                  v40 = 1;
LABEL_51:
                  v43 = 4;
                  goto LABEL_52;
                case 7:
                  *v42 = 3;
                  *(_BYTE *)(a1 + v13 + 161) = 0;
LABEL_55:
                  v46 = 3;
                  break;
                case 8:
                  v44 = 3;
LABEL_57:
                  *v42 = 2;
                  *(_BYTE *)(a1 + v13 + 161) = v44;
LABEL_58:
                  *(_BYTE *)(a1 + 78) |= v21;
                  goto LABEL_44;
                default:
LABEL_52:
                  *v42 = v43;
                  *(_BYTE *)(a1 + v13 + 161) = v40;
                  v46 = 1;
                  switch(v41)
                  {
                    case 0:
                      goto LABEL_45;
                    case 1:
                      *(_BYTE *)(a1 + 78) |= v21;
                      v46 = 1;
                      break;
                    case 3:
                    case 5:
                    case 6:
                    case 8:
                      goto LABEL_58;
                    case 7:
                      goto LABEL_55;
                    default:
                      goto LABEL_44;
                  }
                  break;
              }
            }
            else
            {
              v45 = 0;
              v42 = (char *)(a1 + 2 * v14 + 160);
LABEL_43:
              *v42 = 2;
              *(_BYTE *)(a1 + v13 + 161) = v45;
LABEL_44:
              v46 = 2;
            }
LABEL_45:
            *(_WORD *)(a1 + 76) |= v46 << v13;
            v12 = *(unsigned int *)&v10[v11];
            goto LABEL_46;
          }
        }
        else
        {
          if (*(_WORD *)((char *)a2 + v15 + v22 + 28))
            v24 = *((unsigned __int8 *)a2 + v15 + v16 + *(unsigned __int16 *)((char *)a2 + v15 + v22 + 28) + 4);
          else
            v24 = 0;
          if (v23 >= 0x1B && *(_WORD *)((char *)a2 + v15 + v22 + 30))
            v25 = *((unsigned __int8 *)a2 + v15 + v16 + *(unsigned __int16 *)((char *)a2 + v15 + v22 + 30) + 4);
          else
            v25 = 0;
        }
        v26 = *(unsigned __int16 *)((char *)a2 + v15 + v22 + 18);
        if (v26 && *(_WORD *)((char *)a2 + v15 + v16 + v26 + 4))
        {
          *(_DWORD *)(a1 + 48) |= v21;
          if ((v25 & 0xFE) == 2)
            v27 = 1 << v14;
          else
            v27 = 0;
          *(_DWORD *)(a1 + 68) |= v27;
          v28 = (char *)a2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v28 + 2) >= 0x11u && (v29 = *((unsigned __int16 *)v28 + 10), *((_WORD *)v28 + 10)))
          {
            v30 = 0;
            v31 = *((unsigned __int8 *)a2 + v15 + v16 + v29 + 4);
            v32 = 2;
            switch(v31)
            {
              case 0:
              case 1:
                v32 = 1;
                v30 = v31;
                break;
              case 3:
                v30 = 1;
                break;
              case 4:
                v30 = 2;
                break;
              case 5:
                goto LABEL_61;
              case 6:
                v30 = 1;
LABEL_61:
                v32 = 4;
                break;
              case 7:
                v30 = 0;
                v32 = 3;
                break;
              case 8:
                v30 = 3;
                break;
              default:
                break;
            }
          }
          else
          {
            v30 = 0;
            v32 = 2;
          }
          v33 = a1 + v13;
          *(_BYTE *)(v33 + 176) = v32;
          *(_BYTE *)(v33 + 177) = v30;
        }
        v34 = 0;
        if (v24 == 2)
          v35 = 1 << v14;
        else
          v35 = 0;
        *(_DWORD *)(a1 + 56) |= v35;
        if (v25)
          goto LABEL_35;
        goto LABEL_34;
      }
    }
LABEL_66:
    if (v7 >= 7
      && *(_WORD *)((char *)a2 + v8 + 6)
      && (v48 = *(_QWORD *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v8 + 6)), (v48 & 0xFFFFFFFE) != 0))
    {
      if (v48 > 0x7FF)
        LODWORD(v48) = 2048;
    }
    else
    {
LABEL_71:
      LODWORD(v48) = 1;
    }
    *(_DWORD *)(a1 + 80) = v48;
    v49 = (unsigned __int16 *)((char *)a2 - *a2);
    v50 = *v49;
    if (v50 < 0xB)
    {
      v52 = 1;
      *(_BYTE *)(a1 + 84) = 1;
      if (v50 < 9)
      {
LABEL_82:
        *(_BYTE *)(a1 + 85) = v52;
        return a1;
      }
    }
    else
    {
      if (v49[5])
        v51 = *((_BYTE *)a2 + v49[5]);
      else
        v51 = 1;
      *(_BYTE *)(a1 + 84) = v51;
    }
    v53 = v49[4];
    if (v53)
      v52 = *((_BYTE *)a2 + v53);
    else
      v52 = 1;
    goto LABEL_82;
  }
  return a1;
}

unint64_t AGX::FramebufferCompilerConfig<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::partitionSizeFromFormatAndCompCount(int a1, unsigned int a2)
{
  switch(a1)
  {
    case 2:
    case 3:
    case 4:
    case 5:
      return ((unint64_t)a2 + 3) >> 2;
    case 6:
    case 7:
    case 8:
    case 9:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 22:
      a2 *= 2;
      break;
    case 10:
    case 11:
    case 17:
      a2 *= 4;
      break;
    case 18:
    case 19:
    case 20:
    case 21:
      a2 = 4;
      break;
    default:
      a2 = 0;
      break;
  }
  return ((unint64_t)a2 + 3) >> 2;
}

uint64_t AGX::FramebufferCompilerConfigGen2<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::promotedPBESourceFormat(_DWORD *a1, unsigned int a2, char a3)
{
  uint64_t result;
  _BOOL4 v6;
  _BOOL4 v7;
  unsigned int v8;
  BOOL v9;

  result = a1[8];
  v6 = a2 > 1 && (_DWORD)result == 2;
  if (a2 < 2)
  {
    v7 = 0;
  }
  else
  {
    v7 = a1[21] != 0;
    if ((_DWORD)result == 3)
      return 14;
  }
  v8 = a1[7];
  v9 = !v6 && !v7 && v8 >= 3;
  if (!v9 || (a3 & 1) == 0)
  {
    switch((int)result)
    {
      case 18:
        return 9;
      case 19:
        return 14;
      case 20:
      case 21:
        return 12;
      default:
        if ((_DWORD)result == 2)
        {
          result = 13;
        }
        else if ((_DWORD)result == 3)
        {
          return 14;
        }
        break;
    }
  }
  return result;
}

unint64_t AGX::FramebufferCompilerConfigGen2<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::buildDrawBufferState(unint64_t result)
{
  unint64_t v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  _DWORD *v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  uint64_t v12;
  _DWORD *v13;
  unsigned int v14;
  char v15;
  int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;

  v1 = result;
  v2 = 0;
  v3 = *(unsigned __int8 *)(result + 40);
  v4 = v3;
  do
  {
    v5 = v4;
    if (!v4)
      break;
    v6 = __clz(__rbit32(v4));
    v7 = *(_DWORD **)(v1 + 8 * v6 + 96);
    v8 = AGX::FramebufferCompilerConfigGen2<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::promotedPBESourceFormat(v7, *(unsigned __int8 *)(v1 + 84), 0);
    result = AGX::FramebufferCompilerConfig<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::partitionSizeFromFormatAndCompCount(v8, v7[7]);
    v2 += result;
    v4 = (1 << v6) ^ v5;
  }
  while (v2 < 9);
  v9 = 1;
  if (v3)
  {
    v10 = 0;
    v11 = 0;
    do
    {
      v12 = __clz(__rbit32(v3));
      v13 = *(_DWORD **)(v1 + 8 * v12 + 96);
      v23 = v13[7];
      v14 = AGX::FramebufferCompilerConfigGen2<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::promotedPBESourceFormat(v13, *(unsigned __int8 *)(v1 + 84), v5 != 0);
      v15 = v14;
      if (v14 > 0x12 || ((1 << v14) & 0x4000C) == 0)
      {
        v18 = 0;
        v17 = 1 << v12;
      }
      else
      {
        v17 = 1 << v12;
        v11 |= 1 << v12;
        v18 = (v13[21] != 0) << 8;
      }
      result = AGX::FramebufferCompilerConfig<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::partitionSizeFromFormatAndCompCount(v14, v23);
      v19 = v15 & 0x1F | (v10 << 12) | v18 | *(_DWORD *)(v1 + 4 * v12) & 0xFFF00EE0;
      *(_DWORD *)(v1 + 4 * v12) = v19;
      v20 = v19 & 0xFFFFF1FF | ((v13[19] & 7) << 9);
      *(_DWORD *)(v1 + 4 * v12) = v20;
      v21 = v20 & 0xFFFFFF1F | (32 * (v13[7] & 7));
      *(_DWORD *)(v1 + 4 * v12) = v21;
      if ((v11 & v17) != 0)
        *(_DWORD *)(v1 + 4 * v12) = v21 & 0xFFFFF1FF | ((v13[17] == 173824) << 9);
      v10 += result;
      v3 ^= v17;
      v9 = 1;
    }
    while (v3);
    if (v10 >= 2)
    {
      if (v10 >= 5)
        v9 = 8;
      else
        v9 = 1 << -__clz(v10 - 1);
    }
  }
  else
  {
    v11 = 0;
  }
  if (v9 <= 2)
    v22 = 2;
  else
    v22 = v9;
  *(_DWORD *)(v1 + 32) = *(_DWORD *)(v1 + 32) & 0xFE000000 | ((v22 & 0x1FF) << 16) | ((*(_BYTE *)(v1 + 84) & 0xF) << 8) & 0xFFF | ((*(_BYTE *)(v1 + 85) & 0xF) << 12) | *(unsigned __int8 *)(v1 + 40);
  *(_DWORD *)(v1 + 44) = v11;
  return result;
}

_QWORD *AGCTargetImpl<AGX::G9::Classes,AGX::G9::Encoders>::CreateProgramKeyFactory@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_1E7ECF9A0;
  *a1 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::G9::Classes,AGX::G9::Encoders>::CreateTGSizeToTempTable@<X0>(_DWORD *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;

  *a1 = 31;
  result = operator new[]();
  v5 = *a1;
  if ((_DWORD)v5)
  {
    v6 = 0;
    v7 = 0;
    v8 = 3329;
    do
    {
      if ((v7 & 0x1FFFFFFF) != 0)
      {
        v9 = 32 * (v8 / v6);
        if (v9 >= 0x300)
          v10 = 768;
        else
          v10 = 32 * (v8 / v6);
        if (v9 >= 0x200)
          v9 = 512;
        if (v10 >= 0x200)
          v9 = 512;
      }
      else
      {
        v9 = 512;
      }
      *(_DWORD *)(result + 4 * v7++) = v9;
      v8 -= 32;
      v6 += 32;
    }
    while (v5 != v7);
  }
  *a2 = result;
  return result;
}

_QWORD *AGCTargetImpl<AGX::G9::Classes,AGX::G9::Encoders>::GetLegalizationPasses@<X0>(_DWORD *a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *result;
  uint64_t v5;
  int v6;
  const char *v7;
  const char *v8;
  char v9;
  const char *v10;
  char v11;
  const char *v12;
  char v13;
  const char *v14;
  char v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = "air-degenerate-vertex-amplification-emulation";
  v9 = 1;
  v10 = "air-raytracing-emulation,indirect-acceleration-structures";
  v11 = 0;
  v12 = "mtl-fetch-all";
  v13 = 1;
  v14 = "air-bfloat-emulation";
  v15 = 1;
  result = malloc_type_malloc(0x20uLL, 0x10040436913F5uLL);
  v5 = 0;
  v6 = 0;
  *a1 = 0;
  do
  {
    if (LOBYTE((&v8)[v5 + 1]))
    {
      v7 = (&v8)[v5];
      *a1 = v6 + 1;
      result[v6++] = v7;
    }
    v5 += 2;
  }
  while (v5 != 8);
  *a2 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::G9::Classes,AGX::G9::Encoders>::requiresRayTracingEmulation()
{
  return 1;
}

uint64_t AGCTargetImpl<AGX::G9::Classes,AGX::G9::Encoders>::maxMSAASampleCount()
{
  return 4;
}

void AGX::ProgramKeyFactoryImpl<AGX::G9::Classes,AGX::G9::Encoders>::~ProgramKeyFactoryImpl()
{
  JUMPOUT(0x1CAA2D68CLL);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G9::Classes,AGX::G9::Encoders>::CreateVertexProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, int a6@<W6>, uint64_t a7@<X8>)
{
  uint64_t v14;
  int v15;
  __int16 v17;
  uint64_t v18;
  int v19;
  std::string v20;
  std::string v21;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v20 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v21, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v21 = *(std::string *)(a2 + 24);
  v14 = *(unsigned __int8 *)(a2 + 48);
  *(_DWORD *)(a7 + 8) = 3;
  *(_OWORD *)(a7 + 96) = 0u;
  *(_OWORD *)(a7 + 112) = 0u;
  *(_OWORD *)(a7 + 128) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 76) = 0u;
  *(_QWORD *)a7 = &off_1E7ED3720;
  *(std::string *)(a7 + 144) = v20;
  *(std::string *)(a7 + 168) = v21;
  *(_BYTE *)(a7 + 192) = v14;
  *(_QWORD *)(a7 + 56) = v14 << 18;
  AGX::Impl::VertexProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a7, a3);
  if (a7 + 96 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 96), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a7 + 120 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 120), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a6)
    v15 = 2;
  else
    v15 = 0;
  *(_DWORD *)(a7 + 88) = *(_DWORD *)(a7 + 88) & 0xFFFFFFFD | v15;
  v17 = 256;
  v18 = 0;
  v19 = 0;
  return AGX::GeometrySharedKey<_AGCVertexContextStateAGP,(_AGCStreamToken)3>::setDeviceOptions(a7, (unsigned __int8 *)&v17);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G9::Classes,AGX::G9::Encoders>::CreateObjectProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, int a3@<W3>, NSObject *a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  char *v11;
  int v12;
  int v13;
  __int16 v15;
  uint64_t v16;
  int v17;

  *(_DWORD *)(a7 + 8) = 9;
  *(_OWORD *)(a7 + 104) = 0u;
  v11 = (char *)(a7 + 104);
  *(_OWORD *)(a7 + 120) = 0u;
  *(_OWORD *)(a7 + 136) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 80) = 0u;
  *(_DWORD *)(a7 + 96) = 0;
  *(_QWORD *)a7 = &off_1E7ED37B0;
  if (a2)
    v12 = 2;
  else
    v12 = 0;
  if (a3)
    v13 = 4;
  else
    v13 = 0;
  *(_DWORD *)(a7 + 56) = v13 | v12;
  AGX::Impl::ObjectProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a7, a4);
  if (v11 != (char *)a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v11, *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a7 + 128 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 128), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  v15 = 256;
  v16 = 0;
  v17 = 0;
  return AGX::GeometrySharedKey<_AGCObjectContextStateAGP,(_AGCStreamToken)9>::setDeviceOptions(a7, (unsigned __int8 *)&v15);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G9::Classes,AGX::G9::Encoders>::CreateMeshProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, int a3@<W3>, int a4@<W4>, NSObject *a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, char a9)
{
  int v17;
  __int128 v18;
  int v19;
  int v20;
  int v21;
  __int16 v23;
  uint64_t v24;
  int v25;
  std::string v26;
  std::string v27;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v26, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v26 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v27, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v27 = *(std::string *)(a2 + 24);
  v17 = *(unsigned __int8 *)(a2 + 48);
  *(_OWORD *)(a8 + 104) = 0u;
  *(_DWORD *)(a8 + 8) = 10;
  *(_OWORD *)(a8 + 120) = 0u;
  *(_OWORD *)(a8 + 136) = 0u;
  *(_OWORD *)(a8 + 16) = 0u;
  *(_OWORD *)(a8 + 32) = 0u;
  *(_OWORD *)(a8 + 48) = 0u;
  *(_OWORD *)(a8 + 64) = 0u;
  *(_OWORD *)(a8 + 80) = 0u;
  *(_DWORD *)(a8 + 96) = 0;
  *(_QWORD *)a8 = &off_1E7ED3768;
  *(std::string *)(a8 + 152) = v26;
  v18 = *(_OWORD *)&v27.__r_.__value_.__l.__data_;
  *(_QWORD *)(a8 + 192) = *((_QWORD *)&v27.__r_.__value_.__l + 2);
  if (a3)
    v19 = 128;
  else
    v19 = 0;
  if (a4)
    v20 = 256;
  else
    v20 = 0;
  *(_OWORD *)(a8 + 176) = v18;
  *(_BYTE *)(a8 + 200) = v17;
  *(_DWORD *)(a8 + 56) = v20 | v19 | (16 * v17);
  AGX::Impl::MeshProgramKey::initCommon((AGX *)a8, a1);
  *(_DWORD *)(a8 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a8, a5);
  if (a8 + 104 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 104), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  if (a8 + 128 != a7)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 128), *(char **)a7, *(_QWORD *)(a7 + 8), (uint64_t)(*(_QWORD *)(a7 + 8) - *(_QWORD *)a7) >> 5);
  if (a9)
    v21 = 2;
  else
    v21 = 0;
  *(_DWORD *)(a8 + 96) = *(_DWORD *)(a8 + 96) & 0xFFFFFFFD | v21;
  v23 = 256;
  v24 = 0;
  v25 = 0;
  return AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setDeviceOptions(a8, (unsigned __int8 *)&v23);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G9::Classes,AGX::G9::Encoders>::CreateFragmentProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  char *v12;
  MTLPixelFormat v13;
  unsigned __int16 *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char v28;
  char v29;
  __int128 v30;
  int v31;
  int v32;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[31];
  int v42;
  __int16 v43;
  int v44;
  _OWORD v45[7];

  *(_DWORD *)(a6 + 8) = 4;
  *(_QWORD *)(a6 + 24) = 0;
  *(_QWORD *)(a6 + 32) = 0;
  *(_QWORD *)(a6 + 16) = 0;
  *(_OWORD *)(a6 + 232) = 0u;
  v12 = (char *)(a6 + 232);
  *(_QWORD *)a6 = &off_1E7ED37F8;
  *(_OWORD *)(a6 + 40) = 0u;
  *(_OWORD *)(a6 + 56) = 0u;
  *(_OWORD *)(a6 + 72) = 0u;
  *(_OWORD *)(a6 + 88) = 0u;
  *(_OWORD *)(a6 + 104) = 0u;
  *(_OWORD *)(a6 + 120) = 0u;
  *(_OWORD *)(a6 + 136) = 0u;
  *(_OWORD *)(a6 + 152) = 0u;
  *(_OWORD *)(a6 + 168) = 0u;
  *(_OWORD *)(a6 + 184) = 0u;
  *(_OWORD *)(a6 + 200) = 0u;
  *(_OWORD *)(a6 + 209) = 0u;
  *(_OWORD *)(a6 + 248) = 0u;
  *(_OWORD *)(a6 + 264) = 0u;
  v40 = 0u;
  memset(v41, 0, sizeof(v41));
  v38 = 0u;
  v39 = 0u;
  v42 = 1;
  v43 = 0;
  v44 = 0;
  memset(v45, 0, 96);
  bzero(&v38, 0x28uLL);
  if (!a1)
    goto LABEL_22;
  v37 = a2;
  v14 = (unsigned __int16 *)((char *)a1 - *(int *)a1);
  v15 = *v14;
  if (v15 >= 0x17)
  {
    v16 = v14[11];
    if (!v14[11])
      goto LABEL_14;
    v17 = *(unsigned int *)((char *)a1 + v16);
    v18 = (unsigned int *)((char *)a1 + v16 + v17);
    v19 = *v18;
    if (!(_DWORD)v19)
      goto LABEL_14;
    v34 = a3;
    v35 = a4;
    v36 = a5;
    v20 = 0;
    v21 = DWORD2(v40);
    v22 = (char *)a1 + v16 + v17;
    do
    {
      v23 = &v22[4 * v20];
      v24 = *((unsigned int *)v23 + 1);
      v25 = (char *)v18 + v24 - *(int *)&v23[v24 + 4];
      if (*((unsigned __int16 *)v25 + 2) >= 5u)
      {
        v26 = *((unsigned __int16 *)v25 + 4);
        if (v26)
        {
          v27 = (char *)v18 + v24 + v26;
          if (*((_WORD *)v27 + 2))
          {
            *((_QWORD *)v45 + v20) = AGX::G9::TextureFormatTable::chooseTextureFormatCPP((AGX::G9::TextureFormatTable *)*((unsigned __int16 *)v27 + 2), v13);
            v21 |= 1 << v20;
          }
        }
      }
      if (v20 > 6)
        break;
      ++v20;
      ++v18;
    }
    while (v20 < v19);
    DWORD2(v40) = v21;
    a4 = v35;
    a5 = v36;
    a3 = v34;
  }
  if (v15 <= 0xC)
  {
    v29 = 1;
    LOBYTE(v43) = 1;
    a2 = v37;
LABEL_21:
    HIBYTE(v43) = v29;
    goto LABEL_22;
  }
LABEL_14:
  if (v14[6])
    v28 = *((_BYTE *)a1 + v14[6]);
  else
    v28 = 1;
  a2 = v37;
  LOBYTE(v43) = v28;
  HIBYTE(v43) = v28;
  if (v15 >= 0xF)
  {
    if (v14[7])
    {
      v29 = *((_BYTE *)a1 + v14[7]);
      if (v29)
        goto LABEL_21;
    }
  }
LABEL_22:
  AGX::FramebufferCompilerConfigGen2<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::buildDrawBufferState((unint64_t)&v38);
  v30 = v39;
  *(_OWORD *)(a6 + 112) = v38;
  *(_OWORD *)(a6 + 128) = v30;
  *(_QWORD *)(a6 + 144) = v40;
  AGX::Impl::FragmentProgramKey::initCommon((AGX *)a6, a1);
  v31 = *(_DWORD *)(a6 + 104);
  if (a2)
    v32 = 256;
  else
    v32 = 0;
  *(_DWORD *)(a6 + 100) &= ~0x80u;
  *(_DWORD *)(a6 + 104) = v31 & 0xFFFFFEFF | v32;
  AGX::Impl::FragmentProgramKey::setSerializedDescriptor((AGX::Impl::FragmentProgramKey *)a6, a3);
  if (v12 != (char *)a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v12, *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a6 + 256 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a6 + 256), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  LOWORD(v38) = 256;
  *(_QWORD *)((char *)&v38 + 2) = 0;
  *(_DWORD *)((char *)&v38 + 10) = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a6, (unsigned __int8 *)&v38);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G9::Classes,AGX::G9::Encoders>::CreateComputeProgramKey@<X0>(AGX *a1@<X1>, NSObject *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  __int16 v11;
  uint64_t v12;
  int v13;

  *(_DWORD *)(a5 + 8) = 6;
  *(_QWORD *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  *(_QWORD *)(a5 + 32) = 0;
  *(_QWORD *)(a5 + 40) = 0;
  *(_QWORD *)a5 = &off_1E7ED3878;
  *(_QWORD *)(a5 + 48) = 0;
  *(_QWORD *)(a5 + 56) = 0;
  std::string::basic_string[abi:nn180100]<0>((_QWORD *)(a5 + 64), (char *)&unk_1C3E4D9BB);
  *(_BYTE *)(a5 + 88) = 0;
  *(_OWORD *)(a5 + 96) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_OWORD *)(a5 + 128) = 0u;
  AGX::Impl::ComputeProgramKey::initCommon((AGX *)a5, a1);
  *(_DWORD *)(a5 + 52) &= ~0x80u;
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a5, a2);
  if (a5 + 96 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 96), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  if (a5 + 120 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 120), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  v11 = 256;
  v12 = 0;
  v13 = 0;
  return AGX::Impl::ComputeProgramKey::setDeviceOptions(a5, (unsigned __int8 *)&v11);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G9::Classes,AGX::G9::Encoders>::CreateTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, unint64_t a4@<X8>)
{
  MTLPixelFormat v8;
  unsigned __int16 *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char v23;
  char v24;
  __int128 v25;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[31];
  int v32;
  __int16 v33;
  int v34;
  _OWORD v35[7];

  *(_DWORD *)(a4 + 8) = 5;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)a4 = &off_1E7ED3838;
  *(_OWORD *)(a4 + 40) = 0u;
  *(_OWORD *)(a4 + 56) = 0u;
  *(_OWORD *)(a4 + 72) = 0u;
  *(_OWORD *)(a4 + 88) = 0u;
  *(_OWORD *)(a4 + 104) = 0u;
  *(_OWORD *)(a4 + 120) = 0u;
  *(_OWORD *)(a4 + 136) = 0u;
  *(_OWORD *)(a4 + 152) = 0u;
  *(_OWORD *)(a4 + 168) = 0u;
  *(_OWORD *)(a4 + 184) = 0u;
  *(_QWORD *)(a4 + 200) = 0;
  v30 = 0u;
  memset(v31, 0, sizeof(v31));
  v28 = 0u;
  v29 = 0u;
  v32 = 1;
  v33 = 0;
  v34 = 0;
  memset(v35, 0, 96);
  bzero(&v28, 0x28uLL);
  if (!a1)
    goto LABEL_22;
  v9 = (unsigned __int16 *)((char *)a1 - *a1);
  v10 = *v9;
  if (v10 < 0xF)
    goto LABEL_13;
  v11 = v9[7];
  if (v9[7])
  {
    v12 = *(unsigned int *)((char *)a1 + v11);
    v13 = (unsigned int *)((char *)a1 + v11 + v12);
    v14 = *v13;
    if ((_DWORD)v14)
    {
      v15 = 0;
      v16 = DWORD2(v30);
      v27 = a3;
      v17 = (char *)a1 + v11 + v12;
      do
      {
        v18 = &v17[4 * v15];
        v19 = *((unsigned int *)v18 + 1);
        v20 = (char *)v13 + v19 - *(int *)&v18[v19 + 4];
        if (*((unsigned __int16 *)v20 + 2) >= 5u)
        {
          v21 = *((unsigned __int16 *)v20 + 4);
          if (v21)
          {
            v22 = (char *)v13 + v19 + v21;
            if (*((_WORD *)v22 + 2))
            {
              *((_QWORD *)v35 + v15) = AGX::G9::TextureFormatTable::chooseTextureFormatCPP((AGX::G9::TextureFormatTable *)*((unsigned __int16 *)v22 + 2), v8);
              v16 |= 1 << v15;
            }
          }
        }
        if (v15 > 6)
          break;
        ++v15;
        ++v13;
      }
      while (v15 < v14);
      DWORD2(v30) = v16;
      a3 = v27;
LABEL_13:
      if (v10 <= 0xA)
      {
        v24 = 1;
        LOBYTE(v33) = 1;
LABEL_21:
        HIBYTE(v33) = v24;
        goto LABEL_22;
      }
    }
  }
  if (v9[5])
    v23 = *((_BYTE *)a1 + v9[5]);
  else
    v23 = 1;
  LOBYTE(v33) = v23;
  HIBYTE(v33) = v23;
  if (v10 >= 0xD)
  {
    if (v9[6])
    {
      v24 = *((_BYTE *)a1 + v9[6]);
      if (v24)
        goto LABEL_21;
    }
  }
LABEL_22:
  AGX::FramebufferCompilerConfigGen2<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::buildDrawBufferState((unint64_t)&v28);
  v25 = v29;
  *(_OWORD *)(a4 + 112) = v28;
  *(_OWORD *)(a4 + 128) = v25;
  *(_QWORD *)(a4 + 144) = v30;
  AGX::Impl::TileProgramKey::initCommon(a4, a1);
  *(_DWORD *)(a4 + 100) &= ~0x80u;
  if (a4 + 160 != a2)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 160), *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 5);
  if (a4 + 184 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 184), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  LOWORD(v28) = 256;
  *(_QWORD *)((char *)&v28 + 2) = 0;
  *(_DWORD *)((char *)&v28 + 10) = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a4, (unsigned __int8 *)&v28);
}

double AGX::ProgramKeyFactoryImpl<AGX::G9::Classes,AGX::G9::Encoders>::CreateBackgroundObjectProgramKey@<D0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  double result;
  __int128 v4;
  int v5;
  _OWORD v6[2];
  uint64_t v7;
  int v8;
  unsigned __int8 v9;
  unsigned __int16 v10;
  unsigned __int8 v11;

  *(_DWORD *)(a2 + 8) = 13;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFAA8;
  AGX::FramebufferCompilerConfig<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::FramebufferCompilerConfig((uint64_t)v6, a1);
  AGX::FramebufferCompilerConfigGen2<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::buildDrawBufferState((unint64_t)v6);
  result = *(double *)v6;
  v4 = v6[1];
  *(_OWORD *)(a2 + 40) = v6[0];
  *(_OWORD *)(a2 + 56) = v4;
  *(_QWORD *)(a2 + 72) = v7;
  *(_QWORD *)(a2 + 80) = 0;
  v5 = v10 | (v11 << 16) | (v8 << 24);
  *(_WORD *)(a2 + 84) = v9;
  *(_DWORD *)(a2 + 80) = v5;
  return result;
}

_OWORD *AGX::ProgramKeyFactoryImpl<AGX::G9::Classes,AGX::G9::Encoders>::CreateEndOfTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  _OWORD *result;
  unsigned int v5;
  unsigned int v6;
  int v7;
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  char *v18;
  int v19;
  int v20;
  unsigned int v22;
  unsigned int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  char *v28;
  char v29;
  int v30;
  unsigned int v31;
  int v32;
  int v33;
  int v34;
  _OWORD v35[2];
  uint64_t v36;
  _OWORD v37[2];
  uint64_t v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int8 v44;

  *(_DWORD *)(a2 + 8) = 19;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)a2 = off_1E7ECFAE8;
  *(_OWORD *)(a2 + 40) = 0u;
  v3 = a2 + 40;
  *(_QWORD *)(a2 + 16) = 0;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(_OWORD *)(a2 + 88) = 0u;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_QWORD *)(a2 + 118) = 0;
  AGX::FramebufferCompilerConfig<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::FramebufferCompilerConfig((uint64_t)v37, a1);
  result = (_OWORD *)AGX::FramebufferCompilerConfigGen2<AGX::G9::Encoders,AGX::G9::Classes,AGX::G9::ObjClasses>::buildDrawBufferState((unint64_t)v37);
  v35[0] = v37[0];
  v35[1] = v37[1];
  v5 = v38;
  v36 = v38;
  v6 = v39;
  v7 = v40;
  v8 = ((unint64_t)BYTE2(v38) << 36) | ((unint64_t)((unsigned __int16)v38 >> 12) << 32) | 0x40000000000000;
  *(_QWORD *)(a2 + 112) = v8;
  if (v6)
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = (unsigned __int16)v5 >> 12;
    v13 = HIWORD(v5) & 0x1FF;
    v14 = v43 & ~v42 | v41;
    v15 = v44;
    v16 = v42 & ~v43 | v41;
    result = v35;
    do
    {
      v17 = __clz(__rbit32(v6));
      v18 = (char *)v37 + 2 * v17;
      if ((v18[161] & 1) != 0)
      {
        v20 = 0x20000;
      }
      else
      {
        v19 = v18[160];
        if ((v18[161] & 2) != 0)
          v20 = 0x40000;
        else
          v20 = 0x20000;
        if (v19 != 2)
          v20 = 16711680;
        if ((v19 - 3) < 2 || v19 == 1)
          v20 = 0x20000;
      }
      v22 = *((_DWORD *)v35 + v17);
      v23 = (v22 >> 12) / v13;
      v24 = (v22 & 0x1F) << 8;
      v25 = (v22 << 21) & 0x1C000000;
      *(_DWORD *)(v3 + 4 * v17) = *(_DWORD *)(v3 + 4 * v17) & 0xE3000000 | v20 | v24 | v25 | v23;
      v9 |= 1 << v17;
      v10 |= (1 << v17) & v14;
      v26 = v15 & (1 << v17);
      v11 |= v26;
      if ((v7 & (1 << v17)) != 0)
      {
        if (v12 <= 1)
          v27 = 0;
        else
          v27 = (v22 << 16) & 0x1000000;
        v28 = (char *)v37 + 2 * v17;
        v29 = v28[177];
        if ((v29 & 1) != 0)
        {
          v34 = 0x20000;
        }
        else
        {
          v30 = v28[176];
          v31 = v30 - 3;
          if ((v29 & 2) != 0)
            v32 = 0x40000;
          else
            v32 = 0x20000;
          if (v30 != 2)
            v32 = 16711680;
          if (v30 == 1)
            v33 = 0x20000;
          else
            v33 = v32;
          if (v31 >= 2)
            v34 = v33;
          else
            v34 = 0x20000;
        }
        *(_DWORD *)(v3 + 4 * (v17 + 8)) = *(_DWORD *)(v3 + 4 * (v17 + 8)) & 0xE2000000 | v27 | v34 | v24 | v25 | v23;
        v9 |= 256 << v17;
        v10 |= ((v16 >> v17) & 1) << (v17 + 8);
        v11 |= (v26 != 0) << (v17 + 8);
      }
      v6 ^= 1 << v17;
    }
    while (v6);
    v8 = (unint64_t)*(unsigned int *)(a2 + 116) << 32;
  }
  else
  {
    LOWORD(v11) = 0;
    LOWORD(v10) = 0;
    LOWORD(v9) = 0;
  }
  *(_WORD *)(a2 + 120) = v9;
  *(_WORD *)(a2 + 122) = v10;
  *(_WORD *)(a2 + 124) = v11;
  *(_QWORD *)(a2 + 112) = v8 | (unsigned __int16)(v9 & ~(_WORD)v10) | ((unint64_t)(unsigned __int16)(v9 & v11) << 16);
  return result;
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::G9::Classes,AGX::G9::Encoders>::CreateBVHBuilderProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 8) = 24;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFB68;
  *(_DWORD *)(a2 + 40) = 0;
  return AGX::BVHBuilderProgramKey::initializeWithDescriptor(a2, a1);
}

uint64_t AGX::FramebufferCompilerConfig<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::FramebufferCompilerConfig(uint64_t a1, int *a2)
{
  uint64_t v4;
  char *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  char *v23;
  unsigned int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  char *v29;
  uint64_t v30;
  char v31;
  int v32;
  char v33;
  uint64_t v34;
  int v35;
  int v36;
  int32x2_t v37;
  int v38;
  char *v39;
  uint64_t v40;
  char v41;
  int v42;
  char *v43;
  char v44;
  char v45;
  char v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  unsigned __int16 *v50;
  unsigned int v51;
  char v52;
  char v53;
  uint64_t v54;

  *(_OWORD *)(a1 + 63) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 80) = 1;
  *(_WORD *)(a1 + 84) = 0;
  *(_DWORD *)(a1 + 88) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  bzero((void *)a1, 0x28uLL);
  if (a2)
  {
    v4 = *a2;
    v5 = (char *)a2 - v4;
    v6 = *(unsigned __int16 *)((char *)a2 - v4);
    if (v6 < 5)
      goto LABEL_72;
    v7 = -v4;
    v8 = *((unsigned __int16 *)v5 + 2);
    if (*((_WORD *)v5 + 2))
    {
      v9 = (char *)a2 + v8;
      v10 = *(unsigned int *)((char *)a2 + v8);
      v11 = *(unsigned int *)((char *)a2 + v8 + v10);
      if ((_DWORD)v11)
      {
        v12 = 0;
        v13 = 0;
        v14 = v8 + v10;
        while (1)
        {
          v15 = *(unsigned int *)((char *)a2 + v14 + 4);
          v16 = (char *)a2 + v14 + v15;
          v17 = (char *)a2 + v14 + v15 - *((int *)v16 + 1);
          if (*((unsigned __int16 *)v17 + 2) >= 5u)
          {
            v18 = *((unsigned __int16 *)v17 + 4);
            if (v18)
            {
              v19 = *(unsigned __int16 *)((char *)a2 + v14 + v15 + v18 + 4);
              if (v19)
                break;
            }
          }
LABEL_47:
          if (v13 <= 6)
          {
            ++v13;
            v12 += 2;
            v14 += 4;
            if (v13 < v11)
              continue;
          }
          v48 = *a2;
          v7 = -v48;
          v6 = *(unsigned __int16 *)((char *)a2 - v48);
          goto LABEL_67;
        }
        v20 = &texFormatUnsupported;
        if (v19 <= 0x285)
          v20 = *(&off_1E7ED22E8 + v19 - 1);
        *(_QWORD *)(a1 + 8 * v13 + 96) = v20;
        v21 = 1 << v13;
        *(_DWORD *)(a1 + 40) |= 1 << v13;
        v22 = v15 - *((int *)v16 + 1);
        v23 = (char *)a2 + v14 + v22;
        v24 = *((unsigned __int16 *)v23 + 2);
        if (v24 < 0x19)
        {
          v26 = 0;
          LODWORD(v25) = 0;
          if (v24 < 0xF)
          {
LABEL_35:
            v26 = 0;
            v35 = 1 << v13;
LABEL_36:
            *(_DWORD *)(a1 + 52) |= v35;
            v37.i32[0] = v25;
            v37.i32[1] = v26 & 0xFFFFFFFD;
            *(int8x8_t *)(a1 + 60) = vorr_s8(*(int8x8_t *)(a1 + 60), vand_s8((int8x8_t)vdup_n_s32(v21), (int8x8_t)vceq_s32(v37, (int32x2_t)0x100000001)));
            if (v26 == 4)
              v38 = 1 << v13;
            else
              v38 = 0;
            *(_DWORD *)(a1 + 72) |= v38;
            v39 = (char *)a2 + v14 + v15 - *((int *)v16 + 1);
            if (*((unsigned __int16 *)v39 + 2) >= 7u && (v40 = *((unsigned __int16 *)v39 + 5)) != 0)
            {
              v41 = 0;
              v42 = *((unsigned __int8 *)a2 + v14 + v15 + v40 + 4);
              v43 = (char *)(a1 + v12 + 160);
              v44 = 2;
              v45 = 1;
              switch(v42)
              {
                case 0:
                case 1:
                  v44 = 1;
                  v41 = v42;
                  goto LABEL_53;
                case 3:
                  goto LABEL_58;
                case 4:
                  v46 = 2;
                  goto LABEL_44;
                case 5:
                  goto LABEL_52;
                case 6:
                  v41 = 1;
LABEL_52:
                  v44 = 4;
                  goto LABEL_53;
                case 7:
                  *v43 = 3;
                  *(_BYTE *)(a1 + v12 + 161) = 0;
LABEL_56:
                  v47 = 3;
                  break;
                case 8:
                  v45 = 3;
LABEL_58:
                  *v43 = 2;
                  *(_BYTE *)(a1 + v12 + 161) = v45;
LABEL_59:
                  *(_BYTE *)(a1 + 78) |= v21;
                  goto LABEL_45;
                default:
LABEL_53:
                  *v43 = v44;
                  *(_BYTE *)(a1 + v12 + 161) = v41;
                  v47 = 1;
                  switch(v42)
                  {
                    case 0:
                      goto LABEL_46;
                    case 1:
                      *(_BYTE *)(a1 + 78) |= v21;
                      v47 = 1;
                      break;
                    case 3:
                    case 5:
                    case 6:
                    case 8:
                      goto LABEL_59;
                    case 7:
                      goto LABEL_56;
                    default:
                      goto LABEL_45;
                  }
                  break;
              }
            }
            else
            {
              v46 = 0;
              v43 = (char *)(a1 + 2 * v13 + 160);
LABEL_44:
              *v43 = 2;
              *(_BYTE *)(a1 + v12 + 161) = v46;
LABEL_45:
              v47 = 2;
            }
LABEL_46:
            *(_WORD *)(a1 + 76) |= v47 << v12;
            v11 = *(unsigned int *)&v9[v10];
            goto LABEL_47;
          }
        }
        else
        {
          v25 = *((unsigned __int16 *)v23 + 14);
          if (v25)
            LODWORD(v25) = *((unsigned __int8 *)a2 + v14 + v15 + v25 + 4);
          if (v24 >= 0x1B && *(_WORD *)((char *)a2 + v14 + v22 + 30))
            v26 = *((unsigned __int8 *)a2 + v14 + v15 + *(unsigned __int16 *)((char *)a2 + v14 + v22 + 30) + 4);
          else
            v26 = 0;
        }
        v27 = *(unsigned __int16 *)((char *)a2 + v14 + v22 + 18);
        if (v27 && *(_WORD *)((char *)a2 + v14 + v15 + v27 + 4))
        {
          *(_DWORD *)(a1 + 48) |= v21;
          if ((v26 & 0xFE) == 2)
            v28 = 1 << v13;
          else
            v28 = 0;
          *(_DWORD *)(a1 + 68) |= v28;
          v29 = (char *)a2 + v14 + v15 - *((int *)v16 + 1);
          if (*((unsigned __int16 *)v29 + 2) >= 0x11u && (v30 = *((unsigned __int16 *)v29 + 10), *((_WORD *)v29 + 10)))
          {
            v31 = 0;
            v32 = *((unsigned __int8 *)a2 + v14 + v15 + v30 + 4);
            v33 = 2;
            switch(v32)
            {
              case 0:
              case 1:
                v33 = 1;
                v31 = v32;
                break;
              case 3:
                v31 = 1;
                break;
              case 4:
                v31 = 2;
                break;
              case 5:
                goto LABEL_62;
              case 6:
                v31 = 1;
LABEL_62:
                v33 = 4;
                break;
              case 7:
                v31 = 0;
                v33 = 3;
                break;
              case 8:
                v31 = 3;
                break;
              default:
                break;
            }
          }
          else
          {
            v31 = 0;
            v33 = 2;
          }
          v34 = a1 + v12;
          *(_BYTE *)(v34 + 176) = v33;
          *(_BYTE *)(v34 + 177) = v31;
        }
        v35 = 0;
        if ((_DWORD)v25 == 2)
          v36 = 1 << v13;
        else
          v36 = 0;
        *(_DWORD *)(a1 + 56) |= v36;
        if (v26)
          goto LABEL_36;
        goto LABEL_35;
      }
    }
LABEL_67:
    if (v6 >= 7
      && *(_WORD *)((char *)a2 + v7 + 6)
      && (v49 = *(_QWORD *)((char *)a2 + *(unsigned __int16 *)((char *)a2 + v7 + 6)), (v49 & 0xFFFFFFFE) != 0))
    {
      if (v49 > 0x7FF)
        LODWORD(v49) = 2048;
    }
    else
    {
LABEL_72:
      LODWORD(v49) = 1;
    }
    *(_DWORD *)(a1 + 80) = v49;
    v50 = (unsigned __int16 *)((char *)a2 - *a2);
    v51 = *v50;
    if (v51 < 0xB)
    {
      v53 = 1;
      *(_BYTE *)(a1 + 84) = 1;
      if (v51 < 9)
      {
LABEL_83:
        *(_BYTE *)(a1 + 85) = v53;
        return a1;
      }
    }
    else
    {
      if (v50[5])
        v52 = *((_BYTE *)a2 + v50[5]);
      else
        v52 = 1;
      *(_BYTE *)(a1 + 84) = v52;
    }
    v54 = v50[4];
    if (v54)
      v53 = *((_BYTE *)a2 + v54);
    else
      v53 = 1;
    goto LABEL_83;
  }
  return a1;
}

uint64_t AGX::FramebufferCompilerConfig<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::partitionSizeFromFormatAndCompCount(int a1, uint64_t a2)
{
  switch(a1)
  {
    case 2:
    case 3:
    case 4:
    case 5:
      return a2;
    case 6:
    case 7:
    case 8:
    case 9:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 22:
      a2 = (2 * a2);
      break;
    case 10:
    case 11:
    case 17:
      a2 = (4 * a2);
      break;
    case 18:
    case 19:
    case 20:
    case 21:
      a2 = 4;
      break;
    default:
      a2 = 0;
      break;
  }
  return a2;
}

uint64_t AGX::FramebufferCompilerConfigGen3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::buildDrawBufferState(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  char v12;
  uint64_t result;
  uint64_t v14;
  unsigned int *v15;
  uint64_t v16;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  unint64_t v30;
  int v31;
  int v32;
  int v33;
  unsigned int v34;
  int v35;

  v2 = 0;
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = v3;
  do
  {
    v5 = v4;
    if (!v4)
      break;
    v6 = __clz(__rbit32(v4));
    v7 = *(_QWORD *)(a1 + 8 * v6 + 96);
    if (*(_DWORD *)(v7 + 32) == 18)
      v8 = 9;
    else
      v8 = *(_DWORD *)(v7 + 32);
    v2 += AGX::FramebufferCompilerConfig<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::partitionSizeFromFormatAndCompCount(v8, *(unsigned int *)(v7 + 28));
    v9 = 1 << v6;
    if (v2 > 0x100)
      v9 = 0;
    v4 = v9 ^ v5;
  }
  while (v2 < 0x101);
  if (v3)
  {
    LODWORD(v10) = 0;
    v11 = 0;
    v12 = 0;
    LODWORD(result) = 0;
    v34 = v5;
    do
    {
      v14 = __clz(__rbit32(v3));
      v15 = *(unsigned int **)(a1 + 8 * v14 + 96);
      v16 = v15[7];
      if (v15[8] == 18 && v5 == 0)
        v18 = 9;
      else
        v18 = v15[8];
      v19 = 1 << v14;
      if (v18 == 18)
        v20 = 1 << v14;
      else
        v20 = 0;
      if (v18 == 3)
      {
        v21 = (v15[21] != 0) << 8;
        v22 = 1;
      }
      else
      {
        v35 = result;
        v23 = v20;
        LODWORD(result) = AGX::FramebufferCompilerConfig<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::partitionSizeFromFormatAndCompCount(v18, v16);
        v20 = v23;
        v19 = 1 << v14;
        LODWORD(v16) = result;
        v5 = v34;
        LODWORD(result) = v35;
        v21 = 0;
        v22 = 1;
        switch(v18)
        {
          case 2:
          case 4:
          case 5:
            break;
          case 6:
          case 7:
          case 8:
          case 9:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 22:
            v21 = 0;
            v22 = 2;
            break;
          case 10:
          case 11:
          case 17:
          case 18:
          case 19:
          case 20:
          case 21:
            v21 = 0;
            v22 = 4;
            break;
          default:
            v21 = 0;
            v22 = 0;
            break;
        }
      }
      result = v20 | result;
      v24 = v22 - 1;
      v25 = -v22;
      v26 = (v24 + v10) & v25;
      v12 |= (v26 + v16) > 0x100;
      v27 = (v24 + v11) & v25;
      if ((v12 & 1) != 0)
        v11 = v27 + v16;
      else
        LOBYTE(v27) = v26;
      v28 = v21 & 0xFFF00FFF | *(_DWORD *)(a1 + 4 * v14) & 0xFFF00EE0 | v18 & 0x1F | (v27 << 12);
      *(_DWORD *)(a1 + 4 * v14) = v28;
      v29 = v28 & 0xFFFFF1FF | ((v15[19] & 7) << 9);
      *(_DWORD *)(a1 + 4 * v14) = v29;
      if ((v12 & 1) != 0)
        v10 = v10;
      else
        v10 = (v26 + v16);
      *(_DWORD *)(a1 + 4 * v14) = v29 & 0xFFFFFF1F | (32 * (v15[7] & 7));
      v3 ^= v19;
    }
    while (v3);
    v30 = 256;
    if (((v10 + 7) & 0x1FFFFFF00) == 0)
      v30 = (v10 + 7) & 0x1FFFFFFF8;
    if (v30 <= 8)
      LODWORD(v30) = 8;
    v31 = (_DWORD)v30 << 16;
    if ((v12 & 1) != 0)
    {
      v31 = 0x1000000;
      v32 = 0x2000000;
    }
    else
    {
      v32 = 0;
    }
    v33 = *(unsigned __int8 *)(a1 + 40) | v32;
  }
  else
  {
    v11 = 0;
    result = 0;
    v33 = 0;
    v31 = 0x80000;
  }
  *(_DWORD *)(a1 + 32) = v33 | ((*(_BYTE *)(a1 + 84) & 0xF) << 8) | *(_DWORD *)(a1 + 32) & 0xFC000000 | v31 | ((*(_BYTE *)(a1 + 85) & 0xF) << 12);
  *(_DWORD *)(a1 + 88) = v11;
  *(_DWORD *)(a1 + 44) = result;
  return result;
}

uint64_t AGX::PBEStateEncoderGen9<kAGXRevHAL200>::StateFields::getDimensionality(int a1, char a2, unsigned int a3)
{
  unsigned __int8 v3;
  unsigned __int8 v4;
  BOOL v5;

  if (a3 < 2)
    v3 = 2;
  else
    v3 = 3;
  if ((a2 & 1) != 0)
  {
    if ((a2 & 2) != 0)
      v4 = 8;
    else
      v4 = v3;
    v5 = a1 == 4;
LABEL_11:
    if (v5)
      return v3;
  }
  else
  {
    v4 = 5;
    switch(a1)
    {
      case 1:
        v4 = 2;
        break;
      case 2:
        v5 = (a2 & 2) == 0;
        v4 = 4;
        v3 = 2;
        goto LABEL_11;
      case 3:
        return v4;
      case 4:
        v4 = v3;
        break;
      default:
        v4 = -1;
        break;
    }
  }
  return v4;
}

_QWORD *AGCTargetImpl<AGX::HAL200::Classes,AGX::HAL200::Encoders>::CreateProgramKeyFactory@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_1E7ECFA40;
  *a1 = result;
  return result;
}

void AGCTargetImpl<AGX::HAL200::Classes,AGX::HAL200::Encoders>::CreateTGSizeToTempTable(_DWORD *a1@<X1>, _QWORD *a2@<X8>)
{
  void *v4;
  void *v5;
  uint64_t v6;

  *a1 = 24;
  v4 = (void *)operator new[]();
  v5 = v4;
  v6 = *a1;
  if ((_DWORD)v6)
    memset_pattern16(v4, &unk_1C3E386C0, 4 * v6);
  *a2 = v5;
}

_QWORD *AGCTargetImpl<AGX::HAL200::Classes,AGX::HAL200::Encoders>::GetLegalizationPasses@<X0>(uint64_t a1@<X0>, _DWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *result;
  uint64_t v6;
  int v7;
  const char *v8;
  const char *v9;
  char v10;
  const char *v11;
  char v12;
  const char *v13;
  char v14;
  const char *v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v9 = "air-degenerate-vertex-amplification-emulation";
  v10 = 0;
  v11 = "air-raytracing-emulation,indirect-acceleration-structures";
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  v13 = "mtl-fetch-all-unaligned";
  v14 = 1;
  v15 = "air-bfloat-emulation";
  v16 = 0;
  result = malloc_type_malloc(0x20uLL, 0x10040436913F5uLL);
  v6 = 0;
  v7 = 0;
  *a2 = 0;
  do
  {
    if (LOBYTE((&v9)[v6 + 1]))
    {
      v8 = (&v9)[v6];
      *a2 = v7 + 1;
      result[v7++] = v8;
    }
    v6 += 2;
  }
  while (v6 != 8);
  *a3 = result;
  return result;
}

uint64_t AGCTargetImpl<AGX::HAL200::Classes,AGX::HAL200::Encoders>::requiresRayTracingEmulation()
{
  return 0;
}

uint64_t AGCTargetImpl<AGX::HAL200::Classes,AGX::HAL200::Encoders>::maxMSAASampleCount()
{
  return 4;
}

void AGX::ProgramKeyFactoryImpl<AGX::HAL200::Classes,AGX::HAL200::Encoders>::~ProgramKeyFactoryImpl()
{
  JUMPOUT(0x1CAA2D68CLL);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::HAL200::Classes,AGX::HAL200::Encoders>::CreateVertexProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, int a6@<W6>, uint64_t a7@<X8>)
{
  uint64_t v14;
  int v15;
  _WORD v17[8];
  std::string v18;
  std::string v19;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v18, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v18 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v19, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v19 = *(std::string *)(a2 + 24);
  v14 = *(unsigned __int8 *)(a2 + 48);
  *(_DWORD *)(a7 + 8) = 3;
  *(_OWORD *)(a7 + 96) = 0u;
  *(_OWORD *)(a7 + 112) = 0u;
  *(_OWORD *)(a7 + 128) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 76) = 0u;
  *(_QWORD *)a7 = &off_1E7ED3720;
  *(std::string *)(a7 + 144) = v18;
  *(std::string *)(a7 + 168) = v19;
  *(_BYTE *)(a7 + 192) = v14;
  *(_QWORD *)(a7 + 56) = v14 << 18;
  AGX::Impl::VertexProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a7, a3);
  if (a7 + 96 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 96), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a7 + 120 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 120), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a6)
    v15 = 2;
  else
    v15 = 0;
  *(_DWORD *)(a7 + 88) = *(_DWORD *)(a7 + 88) & 0xFFFFFFFD | v15;
  memset(v17, 0, 14);
  return AGX::GeometrySharedKey<_AGCVertexContextStateAGP,(_AGCStreamToken)3>::setDeviceOptions(a7, (unsigned __int8 *)v17);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::HAL200::Classes,AGX::HAL200::Encoders>::CreateObjectProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, int a3@<W3>, NSObject *a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  char *v11;
  int v12;
  int v13;
  _WORD v15[8];

  *(_DWORD *)(a7 + 8) = 9;
  *(_OWORD *)(a7 + 104) = 0u;
  v11 = (char *)(a7 + 104);
  *(_OWORD *)(a7 + 120) = 0u;
  *(_OWORD *)(a7 + 136) = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 80) = 0u;
  *(_DWORD *)(a7 + 96) = 0;
  *(_QWORD *)a7 = &off_1E7ED37B0;
  if (a2)
    v12 = 2;
  else
    v12 = 0;
  if (a3)
    v13 = 4;
  else
    v13 = 0;
  *(_DWORD *)(a7 + 56) = v13 | v12;
  AGX::Impl::ObjectProgramKey::initCommon((AGX *)a7, a1);
  *(_DWORD *)(a7 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a7, a4);
  if (v11 != (char *)a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v11, *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  if (a7 + 128 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a7 + 128), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  memset(v15, 0, 14);
  return AGX::GeometrySharedKey<_AGCObjectContextStateAGP,(_AGCStreamToken)9>::setDeviceOptions(a7, (unsigned __int8 *)v15);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::HAL200::Classes,AGX::HAL200::Encoders>::CreateMeshProgramKey@<X0>(AGX *a1@<X1>, uint64_t a2@<X2>, int a3@<W3>, int a4@<W4>, NSObject *a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, char a9)
{
  int v17;
  __int128 v18;
  int v19;
  int v20;
  int v21;
  _WORD v23[8];
  std::string v24;
  std::string v25;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&v24, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v24 = *(std::string *)a2;
  if (*(char *)(a2 + 47) < 0)
    std::string::__init_copy_ctor_external(&v25, *(const std::string::value_type **)(a2 + 24), *(_QWORD *)(a2 + 32));
  else
    v25 = *(std::string *)(a2 + 24);
  v17 = *(unsigned __int8 *)(a2 + 48);
  *(_OWORD *)(a8 + 104) = 0u;
  *(_DWORD *)(a8 + 8) = 10;
  *(_OWORD *)(a8 + 120) = 0u;
  *(_OWORD *)(a8 + 136) = 0u;
  *(_OWORD *)(a8 + 16) = 0u;
  *(_OWORD *)(a8 + 32) = 0u;
  *(_OWORD *)(a8 + 48) = 0u;
  *(_OWORD *)(a8 + 64) = 0u;
  *(_OWORD *)(a8 + 80) = 0u;
  *(_DWORD *)(a8 + 96) = 0;
  *(_QWORD *)a8 = &off_1E7ED3768;
  *(std::string *)(a8 + 152) = v24;
  v18 = *(_OWORD *)&v25.__r_.__value_.__l.__data_;
  *(_QWORD *)(a8 + 192) = *((_QWORD *)&v25.__r_.__value_.__l + 2);
  if (a3)
    v19 = 128;
  else
    v19 = 0;
  if (a4)
    v20 = 256;
  else
    v20 = 0;
  *(_OWORD *)(a8 + 176) = v18;
  *(_BYTE *)(a8 + 200) = v17;
  *(_DWORD *)(a8 + 56) = v20 | v19 | (16 * v17);
  AGX::Impl::MeshProgramKey::initCommon((AGX *)a8, a1);
  *(_DWORD *)(a8 + 52) &= ~0x80u;
  AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setSerializedDescriptor((std::string *)a8, a5);
  if (a8 + 104 != a6)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 104), *(char **)a6, *(_QWORD *)(a6 + 8), (uint64_t)(*(_QWORD *)(a6 + 8) - *(_QWORD *)a6) >> 5);
  if (a8 + 128 != a7)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a8 + 128), *(char **)a7, *(_QWORD *)(a7 + 8), (uint64_t)(*(_QWORD *)(a7 + 8) - *(_QWORD *)a7) >> 5);
  if (a9)
    v21 = 2;
  else
    v21 = 0;
  *(_DWORD *)(a8 + 96) = *(_DWORD *)(a8 + 96) & 0xFFFFFFFD | v21;
  memset(v23, 0, 14);
  return AGX::GeometrySharedKey<_AGCMeshContextStateAGP,(_AGCStreamToken)10>::setDeviceOptions(a8, (unsigned __int8 *)v23);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::HAL200::Classes,AGX::HAL200::Encoders>::CreateFragmentProgramKey@<X0>(AGX *a1@<X1>, int a2@<W2>, NSObject *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  char *v12;
  unsigned __int16 *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unsigned int v26;
  void *v27;
  char v28;
  int v29;
  uint64_t v30;
  __int128 v31;
  int v32;
  unsigned int v33;
  int v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[31];
  int v40;
  __int16 v41;
  int v42;
  _OWORD v43[6];

  *(_DWORD *)(a6 + 8) = 4;
  *(_QWORD *)(a6 + 24) = 0;
  *(_QWORD *)(a6 + 32) = 0;
  *(_QWORD *)(a6 + 16) = 0;
  *(_OWORD *)(a6 + 232) = 0u;
  v12 = (char *)(a6 + 232);
  *(_QWORD *)a6 = &off_1E7ED37F8;
  *(_OWORD *)(a6 + 40) = 0u;
  *(_OWORD *)(a6 + 56) = 0u;
  *(_OWORD *)(a6 + 72) = 0u;
  *(_OWORD *)(a6 + 88) = 0u;
  *(_OWORD *)(a6 + 104) = 0u;
  *(_OWORD *)(a6 + 120) = 0u;
  *(_OWORD *)(a6 + 136) = 0u;
  *(_OWORD *)(a6 + 152) = 0u;
  *(_OWORD *)(a6 + 168) = 0u;
  *(_OWORD *)(a6 + 184) = 0u;
  *(_OWORD *)(a6 + 200) = 0u;
  *(_OWORD *)(a6 + 209) = 0u;
  *(_OWORD *)(a6 + 248) = 0u;
  *(_OWORD *)(a6 + 264) = 0u;
  v38 = 0u;
  memset(v39, 0, sizeof(v39));
  v36 = 0u;
  v37 = 0u;
  v40 = 1;
  v41 = 0;
  v42 = 0;
  memset(v43, 0, sizeof(v43));
  bzero(&v36, 0x28uLL);
  if (!a1)
    goto LABEL_24;
  v13 = (unsigned __int16 *)((char *)a1 - *(int *)a1);
  v14 = *v13;
  if (v14 >= 0x17)
  {
    v15 = v13[11];
    if (!v13[11])
      goto LABEL_16;
    v16 = *(unsigned int *)((char *)a1 + v15);
    v17 = (unsigned int *)((char *)a1 + v15 + v16);
    v18 = *v17;
    if (!(_DWORD)v18)
      goto LABEL_16;
    v19 = 0;
    v20 = DWORD2(v38);
    v21 = (char *)a1 + v15 + v16;
    do
    {
      v22 = &v21[4 * v19];
      v23 = *((unsigned int *)v22 + 1);
      v24 = (char *)v17 + v23 - *(int *)&v22[v23 + 4];
      if (*((unsigned __int16 *)v24 + 2) >= 5u)
      {
        v25 = *((unsigned __int16 *)v24 + 4);
        if (v25)
        {
          v26 = *(unsigned __int16 *)((char *)v17 + v23 + v25 + 4);
          if (v26)
          {
            v27 = &texFormatUnsupported;
            if (v26 <= 0x285)
              v27 = *(&off_1E7ED22E8 + v26 - 1);
            *((_QWORD *)v43 + v19) = v27;
            v20 |= 1 << v19;
          }
        }
      }
      if (v19 > 6)
        break;
      ++v19;
      ++v17;
    }
    while (v19 < v18);
    DWORD2(v38) = v20;
  }
  if (v14 <= 0xC)
  {
    LOBYTE(v29) = 1;
    LOBYTE(v41) = 1;
LABEL_23:
    HIBYTE(v41) = v29;
    goto LABEL_24;
  }
LABEL_16:
  if (v13[6])
    v28 = *((_BYTE *)a1 + v13[6]);
  else
    v28 = 1;
  LOBYTE(v41) = v28;
  HIBYTE(v41) = v28;
  if (v14 >= 0xF)
  {
    v30 = v13[7];
    if (v30)
    {
      v29 = *((unsigned __int8 *)a1 + v30);
      if (v29)
        goto LABEL_23;
    }
  }
LABEL_24:
  AGX::FramebufferCompilerConfigGen3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::buildDrawBufferState((uint64_t)&v36);
  v31 = v37;
  *(_OWORD *)(a6 + 112) = v36;
  *(_OWORD *)(a6 + 128) = v31;
  *(_QWORD *)(a6 + 144) = v38;
  AGX::Impl::FragmentProgramKey::initCommon((AGX *)a6, a1);
  v32 = *(_DWORD *)(a6 + 104);
  v33 = *(_DWORD *)(a6 + 100) & 0xFFFFFF7F;
  *(_DWORD *)(a6 + 40) &= ~0x10u;
  if (a2)
    v34 = 256;
  else
    v34 = 0;
  *(_DWORD *)(a6 + 100) = v33;
  *(_DWORD *)(a6 + 104) = v32 & 0xFFFFFEFF | v34;
  AGX::Impl::FragmentProgramKey::setSerializedDescriptor((AGX::Impl::FragmentProgramKey *)a6, a3);
  if (v12 != (char *)a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>(v12, *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  if (a6 + 256 != a5)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a6 + 256), *(char **)a5, *(_QWORD *)(a5 + 8), (uint64_t)(*(_QWORD *)(a5 + 8) - *(_QWORD *)a5) >> 5);
  *(_QWORD *)((char *)&v36 + 6) = 0;
  *(_QWORD *)&v36 = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a6, (unsigned __int8 *)&v36);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::HAL200::Classes,AGX::HAL200::Encoders>::CreateComputeProgramKey@<X0>(AGX *a1@<X1>, NSObject *a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  _WORD v11[8];

  *(_DWORD *)(a5 + 8) = 6;
  *(_QWORD *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 24) = 0;
  *(_QWORD *)(a5 + 32) = 0;
  *(_QWORD *)(a5 + 40) = 0;
  *(_QWORD *)a5 = &off_1E7ED3878;
  *(_QWORD *)(a5 + 48) = 0;
  *(_QWORD *)(a5 + 56) = 0;
  std::string::basic_string[abi:nn180100]<0>((_QWORD *)(a5 + 64), (char *)&unk_1C3E4D9BB);
  *(_BYTE *)(a5 + 88) = 0;
  *(_OWORD *)(a5 + 96) = 0u;
  *(_OWORD *)(a5 + 112) = 0u;
  *(_OWORD *)(a5 + 128) = 0u;
  AGX::Impl::ComputeProgramKey::initCommon((AGX *)a5, a1);
  *(int8x8_t *)(a5 + 52) = vand_s8(*(int8x8_t *)(a5 + 52), (int8x8_t)0xFFFFFFFEFFFFFF7FLL);
  AGX::Impl::ComputeProgramKey::setStageInDescriptor((AGX::Impl::ComputeProgramKey *)a5, a2);
  if (a5 + 96 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 96), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  if (a5 + 120 != a4)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a5 + 120), *(char **)a4, *(_QWORD *)(a4 + 8), (uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 5);
  memset(v11, 0, 14);
  return AGX::Impl::ComputeProgramKey::setDeviceOptions(a5, (unsigned __int8 *)v11);
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::HAL200::Classes,AGX::HAL200::Encoders>::CreateTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, unint64_t a4@<X8>)
{
  unsigned __int16 *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unsigned int v21;
  void *v22;
  char v23;
  int v24;
  uint64_t v25;
  __int128 v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[31];
  int v32;
  __int16 v33;
  int v34;
  _OWORD v35[6];

  *(_DWORD *)(a4 + 8) = 5;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)a4 = &off_1E7ED3838;
  *(_OWORD *)(a4 + 40) = 0u;
  *(_OWORD *)(a4 + 56) = 0u;
  *(_OWORD *)(a4 + 72) = 0u;
  *(_OWORD *)(a4 + 88) = 0u;
  *(_OWORD *)(a4 + 104) = 0u;
  *(_OWORD *)(a4 + 120) = 0u;
  *(_OWORD *)(a4 + 136) = 0u;
  *(_OWORD *)(a4 + 152) = 0u;
  *(_OWORD *)(a4 + 168) = 0u;
  *(_OWORD *)(a4 + 184) = 0u;
  *(_QWORD *)(a4 + 200) = 0;
  v30 = 0u;
  memset(v31, 0, sizeof(v31));
  v28 = 0u;
  v29 = 0u;
  v32 = 1;
  v33 = 0;
  v34 = 0;
  memset(v35, 0, sizeof(v35));
  bzero(&v28, 0x28uLL);
  if (!a1)
    goto LABEL_24;
  v8 = (unsigned __int16 *)((char *)a1 - *a1);
  v9 = *v8;
  if (v9 < 0xF)
    goto LABEL_15;
  v10 = v8[7];
  if (v8[7])
  {
    v11 = *(unsigned int *)((char *)a1 + v10);
    v12 = (unsigned int *)((char *)a1 + v10 + v11);
    v13 = *v12;
    if ((_DWORD)v13)
    {
      v14 = 0;
      v15 = DWORD2(v30);
      v16 = (char *)a1 + v10 + v11;
      do
      {
        v17 = &v16[4 * v14];
        v18 = *((unsigned int *)v17 + 1);
        v19 = (char *)v12 + v18 - *(int *)&v17[v18 + 4];
        if (*((unsigned __int16 *)v19 + 2) >= 5u)
        {
          v20 = *((unsigned __int16 *)v19 + 4);
          if (v20)
          {
            v21 = *(unsigned __int16 *)((char *)v12 + v18 + v20 + 4);
            if (v21)
            {
              v22 = &texFormatUnsupported;
              if (v21 <= 0x285)
                v22 = *(&off_1E7ED22E8 + v21 - 1);
              *((_QWORD *)v35 + v14) = v22;
              v15 |= 1 << v14;
            }
          }
        }
        if (v14 > 6)
          break;
        ++v14;
        ++v12;
      }
      while (v14 < v13);
      DWORD2(v30) = v15;
LABEL_15:
      if (v9 <= 0xA)
      {
        LOBYTE(v24) = 1;
        LOBYTE(v33) = 1;
LABEL_23:
        HIBYTE(v33) = v24;
        goto LABEL_24;
      }
    }
  }
  if (v8[5])
    v23 = *((_BYTE *)a1 + v8[5]);
  else
    v23 = 1;
  LOBYTE(v33) = v23;
  HIBYTE(v33) = v23;
  if (v9 >= 0xD)
  {
    v25 = v8[6];
    if (v25)
    {
      v24 = *((unsigned __int8 *)a1 + v25);
      if (v24)
        goto LABEL_23;
    }
  }
LABEL_24:
  AGX::FramebufferCompilerConfigGen3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::buildDrawBufferState((uint64_t)&v28);
  v26 = v29;
  *(_OWORD *)(a4 + 112) = v28;
  *(_OWORD *)(a4 + 128) = v26;
  *(_QWORD *)(a4 + 144) = v30;
  AGX::Impl::TileProgramKey::initCommon(a4, a1);
  *(_DWORD *)(a4 + 100) &= ~0x80u;
  if (a4 + 160 != a2)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 160), *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 5);
  if (a4 + 184 != a3)
    std::vector<MTLUINT256_t>::__assign_with_size[abi:nn180100]<MTLUINT256_t*,MTLUINT256_t*>((char *)(a4 + 184), *(char **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 5);
  *(_QWORD *)((char *)&v28 + 6) = 0;
  *(_QWORD *)&v28 = 0;
  return AGX::Impl::FragmentProgramKey::setDeviceOptions(a4, (unsigned __int8 *)&v28);
}

double AGX::ProgramKeyFactoryImpl<AGX::HAL200::Classes,AGX::HAL200::Encoders>::CreateBackgroundObjectProgramKey@<D0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  double result;
  __int128 v4;
  int v5;
  _OWORD v6[2];
  uint64_t v7;
  int v8;
  unsigned __int8 v9;
  unsigned __int16 v10;
  unsigned __int8 v11;

  *(_DWORD *)(a2 + 8) = 13;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFAA8;
  AGX::FramebufferCompilerConfig<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::FramebufferCompilerConfig((uint64_t)v6, a1);
  AGX::FramebufferCompilerConfigGen3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::buildDrawBufferState((uint64_t)v6);
  result = *(double *)v6;
  v4 = v6[1];
  *(_OWORD *)(a2 + 40) = v6[0];
  *(_OWORD *)(a2 + 56) = v4;
  *(_QWORD *)(a2 + 72) = v7;
  *(_QWORD *)(a2 + 80) = 0;
  v5 = v10 | (v11 << 16) | (v8 << 24);
  *(_WORD *)(a2 + 84) = v9;
  *(_DWORD *)(a2 + 80) = v5;
  return result;
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::HAL200::Classes,AGX::HAL200::Encoders>::CreateEndOfTileProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  unsigned int v27;
  int v28;
  _OWORD v29[2];
  uint64_t v30;
  _OWORD v31[2];
  uint64_t v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  unsigned __int8 v37;
  unsigned __int8 v38;
  unsigned int v39;
  _BYTE v40[40];

  *(_DWORD *)(a2 + 8) = 19;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)a2 = off_1E7ECFAE8;
  *(_OWORD *)(a2 + 40) = 0u;
  v3 = a2 + 40;
  *(_QWORD *)(a2 + 16) = 0;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(_OWORD *)(a2 + 88) = 0u;
  *(_OWORD *)(a2 + 104) = 0u;
  *(_QWORD *)(a2 + 118) = 0;
  AGX::FramebufferCompilerConfig<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::FramebufferCompilerConfig((uint64_t)v31, a1);
  result = AGX::FramebufferCompilerConfigGen3<AGX::HAL200::Encoders,AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::buildDrawBufferState((uint64_t)v31);
  v29[0] = v31[0];
  v29[1] = v31[1];
  v5 = v32;
  v30 = v32;
  v6 = v39;
  v7 = v33;
  v24 = v34;
  v8 = ((unint64_t)BYTE2(v32) << 36) | ((unint64_t)((unsigned __int16)v32 >> 12) << 32) | 0x40000000000000;
  *(_QWORD *)(a2 + 112) = v8;
  if (v7)
  {
    v9 = 0;
    v28 = 0;
    v10 = 0;
    v20 = (unsigned __int16)v5 >> 12;
    v23 = v38;
    v22 = HIWORD(v5) & 0x1FF;
    v21 = v37 & ~v36 | v35;
    v19 = v36 & ~v37 | v35;
    do
    {
      v11 = __clz(__rbit32(v7));
      v12 = *((_DWORD *)v29 + v11);
      v13 = *(_DWORD *)(v3 + 4 * v11) & 0xE3000000;
      result = AGX::PBEStateEncoderGen9<kAGXRevHAL200>::StateFields::getDimensionality(v40[2 * v11], v40[2 * v11 + 1], v6);
      *(_DWORD *)(v3 + 4 * v11) = v13 & 0xE3FFE0FF | ((_DWORD)result << 16) & 0xE3FFFFFF | ((v12 & 0x1F) << 8) | (v12 >> 5 << 26) | ((v12 >> 12) / v22);
      v9 |= 1 << v11;
      v27 = (v12 >> 12) / v22;
      v28 |= (1 << v11) & v21;
      v14 = v23 & (1 << v11);
      v10 |= v14;
      if ((v24 & (1 << v11)) != 0)
      {
        v26 = v10;
        v15 = (v12 & 0x1F) << 8;
        v25 = (v12 << 21) & 0x1C000000;
        v16 = v11 + 8;
        v17 = (v12 << 16) & 0x1000000;
        if (v20 <= 1)
          v17 = 0;
        v18 = *(_DWORD *)(v3 + 4 * (v11 + 8)) & 0xE2000000 | v17;
        result = AGX::PBEStateEncoderGen9<kAGXRevHAL200>::StateFields::getDimensionality(v40[2 * v11 + 16], v40[2 * v11 + 17], v6);
        *(_DWORD *)(v3 + 4 * v16) = v18 | ((_DWORD)result << 16) | v15 | v25 | v27;
        v9 |= 256 << v11;
        v28 |= ((v19 >> v11) & 1) << v16;
        v10 = ((v14 != 0) << v16) | v26;
      }
      v7 ^= 1 << v11;
    }
    while (v7);
    v8 = (unint64_t)*(unsigned int *)(a2 + 116) << 32;
  }
  else
  {
    LOWORD(v10) = 0;
    LOWORD(v28) = 0;
    LOWORD(v9) = 0;
  }
  *(_WORD *)(a2 + 120) = v9;
  *(_WORD *)(a2 + 122) = v28;
  *(_WORD *)(a2 + 124) = v10;
  *(_QWORD *)(a2 + 112) = v8 | (unsigned __int16)(v9 & ~(_WORD)v28) | ((unint64_t)(unsigned __int16)(v9 & v10) << 16);
  return result;
}

uint64_t AGX::ProgramKeyFactoryImpl<AGX::HAL200::Classes,AGX::HAL200::Encoders>::CreateBVHBuilderProgramKey@<X0>(int *a1@<X1>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 8) = 24;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = off_1E7ECFB68;
  *(_DWORD *)(a2 + 40) = 0;
  return AGX::BVHBuilderProgramKey::initializeWithDescriptor(a2, a1);
}

void *AGX::G10::TextureFormatTable::chooseTextureFormatCPP(AGX::G10::TextureFormatTable *this, MTLPixelFormat a2)
{
  int v2;
  void *result;

  v2 = (_DWORD)this - 1;
  result = &texFormatA8;
  switch(v2)
  {
    case 0:
      return result;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 20:
    case 25:
    case 26:
    case 27:
    case 28:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 55:
    case 56:
    case 57:
    case 58:
    case 60:
    case 65:
    case 66:
    case 67:
    case 68:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 81:
    case 82:
    case 85:
    case 86:
    case 87:
    case 88:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 105:
    case 106:
    case 107:
    case 108:
    case 110:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 167:
    case 168:
    case 170:
    case 172:
    case 174:
    case 176:
    case 183:
    case 200:
    case 201:
    case 218:
    case 219:
    case 236:
    case 237:
    case 238:
    case 241:
    case 242:
    case 243:
    case 244:
    case 245:
    case 246:
    case 247:
    case 248:
    case 250:
    case 253:
    case 254:
    case 255:
    case 256:
    case 257:
    case 258:
    case 261:
    case 262:
    case 263:
    case 264:
    case 265:
    case 266:
    case 267:
    case 268:
    case 269:
    case 270:
    case 271:
    case 272:
    case 273:
    case 274:
    case 275:
    case 276:
    case 277:
    case 278:
    case 279:
    case 280:
    case 281:
    case 282:
    case 283:
    case 284:
    case 285:
    case 286:
    case 287:
    case 288:
    case 289:
    case 290:
    case 291:
    case 292:
    case 293:
    case 294:
    case 295:
    case 296:
    case 297:
    case 298:
    case 304:
    case 305:
    case 306:
    case 307:
    case 308:
    case 309:
    case 310:
    case 311:
    case 315:
    case 316:
    case 317:
    case 318:
    case 319:
    case 320:
    case 321:
LABEL_150:
      result = &texFormatUnsupported;
      break;
    case 9:
      result = &texFormatR8;
      break;
    case 10:
      result = &texFormatsR8;
      break;
    case 11:
      result = &texFormatR8_SNORM;
      break;
    case 12:
      result = &texFormatR8UI;
      break;
    case 13:
      result = &texFormatR8I;
      break;
    case 19:
      result = &texFormatR16;
      break;
    case 21:
      result = &texFormatR16_SNORM;
      break;
    case 22:
      result = &texFormatR16UI;
      break;
    case 23:
      result = &texFormatR16I;
      break;
    case 24:
      result = &texFormatR16F;
      break;
    case 29:
      result = &texFormatRG8;
      break;
    case 30:
      result = &texFormatsRG8;
      break;
    case 31:
      result = &texFormatRG8_SNORM;
      break;
    case 32:
      result = &texFormatRG8UI;
      break;
    case 33:
      result = &texFormatRG8I;
      break;
    case 39:
      result = &texFormatRGB565;
      break;
    case 40:
      result = &texFormatRGB5A1;
      break;
    case 41:
      result = &texFormatRGBA4;
      break;
    case 42:
      result = &texFormatA1RGB5;
      break;
    case 43:
      result = &texFormatBGRA4;
      break;
    case 52:
      result = &texFormatR32UI;
      break;
    case 53:
      result = &texFormatR32I;
      break;
    case 54:
      result = &texFormatR32F;
      break;
    case 59:
      result = &texFormatRG16;
      break;
    case 61:
      result = &texFormatRG16_SNORM;
      break;
    case 62:
      result = &texFormatRG16UI;
      break;
    case 63:
      result = &texFormatRG16I;
      break;
    case 64:
      result = &texFormatRG16F;
      break;
    case 69:
      result = &texFormatRGBA8;
      break;
    case 70:
      result = &texFormatsRGBA8;
      break;
    case 71:
      result = &texFormatRGBA8_SNORM;
      break;
    case 72:
      result = &texFormatRGBA8UI;
      break;
    case 73:
      result = &texFormatRGBA8I;
      break;
    case 79:
      result = &texFormatBGRA8;
      break;
    case 80:
      result = &texFormatsBGRA8;
      break;
    case 83:
      result = &texFormatARGB8;
      break;
    case 84:
      result = &texFormatsARGB8;
      break;
    case 89:
      result = &texFormatRGB10_A2;
      break;
    case 90:
      result = &texFormatRGB10_A2UI;
      break;
    case 91:
      result = &texFormatR11FG11FB10F;
      break;
    case 92:
      result = &texFormatRGB9_E5;
      break;
    case 93:
      result = &texFormatBGR10_A2;
      break;
    case 102:
      result = &texFormatRG32UI;
      break;
    case 103:
      result = &texFormatRG32I;
      break;
    case 104:
      result = &texFormatRG32F;
      break;
    case 109:
      result = &texFormatRGBA16;
      break;
    case 111:
      result = &texFormatRGBA16_SNORM;
      break;
    case 112:
      result = &texFormatRGBA16UI;
      break;
    case 113:
      result = &texFormatRGBA16I;
      break;
    case 114:
      result = &texFormatRGBA16F;
      break;
    case 122:
      result = &texFormatRGBA32UI;
      break;
    case 123:
      result = &texFormatRGBA32I;
      break;
    case 124:
      result = &texFormatRGBA32F;
      break;
    case 159:
      result = &texFormatPVRTC2RGB;
      break;
    case 160:
      result = &texFormatPVRTC2sRGB;
      break;
    case 161:
      result = &texFormatPVRTC4RGB;
      break;
    case 162:
      result = &texFormatPVRTC4sRGB;
      break;
    case 163:
      result = &texFormatPVRTC2RGBA;
      break;
    case 164:
      result = &texFormatPVRTC2sRGBA;
      break;
    case 165:
      result = &texFormatPVRTC4RGBA;
      break;
    case 166:
      result = &texFormatPVRTC4sRGBA;
      break;
    case 169:
      result = &texFormatR11EAC;
      break;
    case 171:
      result = &texFormatR11EAC_SNORM;
      break;
    case 173:
      result = &texFormatRG11EAC;
      break;
    case 175:
      result = &texFormatRG11EAC_SNORM;
      break;
    case 177:
      result = &texFormatETC2RGBA8;
      break;
    case 178:
      result = &texFormatETC2sRGBA8;
      break;
    case 179:
      result = &texFormatETC2RGB8;
      break;
    case 180:
      result = &texFormatETC2sRGB8;
      break;
    case 181:
      result = &texFormatETC2RGB8A1;
      break;
    case 182:
      result = &texFormatETC2sRGB8A1;
      break;
    case 184:
      result = &texFormatASTC4x2sRGBA_UNORM;
      break;
    case 185:
      result = &texFormatASTC4x4sRGBA_UNORM;
      break;
    case 186:
      result = &texFormatASTC5x4sRGBA_UNORM;
      break;
    case 187:
      result = &texFormatASTC5x5sRGBA_UNORM;
      break;
    case 188:
      result = &texFormatASTC6x5sRGBA_UNORM;
      break;
    case 189:
      result = &texFormatASTC6x6sRGBA_UNORM;
      break;
    case 190:
      result = &texFormatASTC8x4sRGBA_UNORM;
      break;
    case 191:
      result = &texFormatASTC8x5sRGBA_UNORM;
      break;
    case 192:
      result = &texFormatASTC8x6sRGBA_UNORM;
      break;
    case 193:
      result = &texFormatASTC8x8sRGBA_UNORM;
      break;
    case 194:
      result = &texFormatASTC10x5sRGBA_UNORM;
      break;
    case 195:
      result = &texFormatASTC10x6sRGBA_UNORM;
      break;
    case 196:
      result = &texFormatASTC10x8sRGBA_UNORM;
      break;
    case 197:
      result = &texFormatASTC10x10sRGBA_UNORM;
      break;
    case 198:
      result = &texFormatASTC12x10sRGBA_UNORM;
      break;
    case 199:
      result = &texFormatASTC12x12sRGBA_UNORM;
      break;
    case 202:
      result = &texFormatASTC4x2RGBA_LP;
      break;
    case 203:
      result = &texFormatASTC4x4RGBA_LP;
      break;
    case 204:
      result = &texFormatASTC5x4RGBA_LP;
      break;
    case 205:
      result = &texFormatASTC5x5RGBA_LP;
      break;
    case 206:
      result = &texFormatASTC6x5RGBA_LP;
      break;
    case 207:
      result = &texFormatASTC6x6RGBA_LP;
      break;
    case 208:
      result = &texFormatASTC8x4RGBA_LP;
      break;
    case 209:
      result = &texFormatASTC8x5RGBA_LP;
      break;
    case 210:
      result = &texFormatASTC8x6RGBA_LP;
      break;
    case 211:
      result = &texFormatASTC8x8RGBA_LP;
      break;
    case 212:
      result = &texFormatASTC10x5RGBA_LP;
      break;
    case 213:
      result = &texFormatASTC10x6RGBA_LP;
      break;
    case 214:
      result = &texFormatASTC10x8RGBA_LP;
      break;
    case 215:
      result = &texFormatASTC10x10RGBA_LP;
      break;
    case 216:
      result = &texFormatASTC12x10RGBA_LP;
      break;
    case 217:
      result = &texFormatASTC12x12RGBA_LP;
      break;
    case 220:
      result = &texFormatASTC4x2RGBA;
      break;
    case 221:
      result = &texFormatASTC4x4RGBA;
      break;
    case 222:
      result = &texFormatASTC5x4RGBA;
      break;
    case 223:
      result = &texFormatASTC5x5RGBA;
      break;
    case 224:
      result = &texFormatASTC6x5RGBA;
      break;
    case 225:
      result = &texFormatASTC6x6RGBA;
      break;
    case 226:
      result = &texFormatASTC8x4RGBA;
      break;
    case 227:
      result = &texFormatASTC8x5RGBA;
      break;
    case 228:
      result = &texFormatASTC8x6RGBA;
      break;
    case 229:
      result = &texFormatASTC8x8RGBA;
      break;
    case 230:
      result = &texFormatASTC10x5RGBA;
      break;
    case 231:
      result = &texFormatASTC10x6RGBA;
      break;
    case 232:
      result = &texFormatASTC10x8RGBA;
      break;
    case 233:
      result = &texFormatASTC10x10RGBA;
      break;
    case 234:
      result = &texFormatASTC12x10RGBA;
      break;
    case 235:
      result = &texFormatASTC12x12RGBA;
      break;
    case 239:
      result = &texFormatYUY2_RGB;
      break;
    case 240:
      result = &texFormatUYVY_RGB;
      break;
    case 249:
      result = &texFormatD16;
      break;
    case 251:
      result = &texFormatD32;
      break;
    case 252:
    case 260:
      result = &texFormatS8;
      break;
    case 259:
      result = &texFormatD32FS8_2PLANE;
      break;
    case 299:
      result = &texFormatRGB8;
      break;
    case 300:
      result = &texFormatsRGB8;
      break;
    case 301:
      result = &texFormatRGB8_SNORM;
      break;
    case 302:
      result = &texFormatRGB8UI;
      break;
    case 303:
      result = &texFormatRGB8I;
      break;
    case 312:
      result = &texFormatRGBX16UI;
      break;
    case 313:
      result = &texFormatRGBX16I;
      break;
    case 314:
      result = &texFormatRGBX16F;
      break;
    case 322:
      result = &texFormatRGBX32UI;
      break;
    case 323:
      result = &texFormatRGBX32I;
      break;
    case 324:
      result = &texFormatRGBX32F;
      break;
    default:
      switch(&texFormatA8)
      {
        case 0x1F4u:
          result = &texFormatYCBCR8_420_2PLANE;
          break;
        case 0x1F5u:
          result = &texFormatYCBCR8_422_1PLANE;
          break;
        case 0x1F6u:
          result = &texFormatYCBCR8_422_2PLANE;
          break;
        case 0x1F7u:
          result = &texFormatYCBCR8_444_2PLANE;
          break;
        case 0x1F8u:
          result = &texFormatYCBCR10_444_1PLANE;
          break;
        case 0x1F9u:
          result = &texFormatYCBCR10_420_2PLANE;
          break;
        case 0x1FAu:
          result = &texFormatYCBCR10_422_2PLANE;
          break;
        case 0x1FBu:
          result = &texFormatYCBCR10_444_2PLANE;
          break;
        case 0x1FCu:
          result = &texFormatYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x1FDu:
          result = &texFormatYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x1FEu:
          result = &texFormatYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x208u:
          result = &texFormatsYCBCR8_420_2PLANE;
          break;
        case 0x209u:
          result = &texFormatsYCBCR8_422_1PLANE;
          break;
        case 0x20Au:
          result = &texFormatsYCBCR8_422_2PLANE;
          break;
        case 0x20Bu:
          result = &texFormatsYCBCR8_444_2PLANE;
          break;
        case 0x20Cu:
          result = &texFormatsYCBCR10_444_1PLANE;
          break;
        case 0x20Du:
          result = &texFormatsYCBCR10_420_2PLANE;
          break;
        case 0x20Eu:
          result = &texFormatsYCBCR10_422_2PLANE;
          break;
        case 0x20Fu:
          result = &texFormatsYCBCR10_444_2PLANE;
          break;
        case 0x210u:
          result = &texFormatsYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x211u:
          result = &texFormatsYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x212u:
          result = &texFormatsYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x21Cu:
          result = &texFormatRGB8_420_2PLANE;
          break;
        case 0x21Du:
          result = &texFormatRGB8_422_2PLANE;
          break;
        case 0x21Eu:
          result = &texFormatRGB8_444_2PLANE;
          break;
        case 0x21Fu:
          result = &texFormatRGB10_420_2PLANE;
          break;
        case 0x220u:
          result = &texFormatRGB10_422_2PLANE;
          break;
        case 0x221u:
          result = &texFormatRGB10_444_2PLANE;
          break;
        case 0x222u:
          result = &texFormatRGB10_420_2PLANE_PACKED;
          break;
        case 0x223u:
          result = &texFormatRGB10_422_2PLANE_PACKED;
          break;
        case 0x224u:
          result = &texFormatRGB10_444_2PLANE_PACKED;
          break;
        case 0x226u:
          result = &texFormatXRRGB10_PLANE_A8_PLANE;
          break;
        case 0x227u:
          result = &texFormatXRSRGB10_PLANE_A8_PLANE;
          break;
        case 0x228u:
          result = &texFormatARGBV16_XR10;
          break;
        case 0x229u:
          result = &texFormatsARGBV16_XR10;
          break;
        case 0x22Au:
          result = &texFormatXRRGB10;
          break;
        case 0x22Bu:
          result = &texFormatXRSRGB10;
          break;
        case 0x230u:
          result = &texFormatYCBCR8A8_444_1PLANE;
          break;
        case 0x232u:
          result = &texFormatYCBCR8_422_1PLANE_REV;
          break;
        case 0x24Cu:
          result = &texFormatR10_1PLANE_PACKED;
          break;
        case 0x24Du:
          result = &texFormatRG10_1PLANE_PACKED;
          break;
        default:
          goto LABEL_150;
      }
      break;
  }
  return result;
}

void *AGX::G11::TextureFormatTable::chooseTextureFormatCPP(AGX::G11::TextureFormatTable *this, MTLPixelFormat a2)
{
  int v2;
  void *result;

  v2 = (_DWORD)this - 1;
  result = &texFormatA8;
  switch(v2)
  {
    case 0:
      return result;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 20:
    case 25:
    case 26:
    case 27:
    case 28:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 55:
    case 56:
    case 57:
    case 58:
    case 60:
    case 65:
    case 66:
    case 67:
    case 68:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 81:
    case 82:
    case 85:
    case 86:
    case 87:
    case 88:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 105:
    case 106:
    case 107:
    case 108:
    case 110:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 167:
    case 168:
    case 170:
    case 172:
    case 174:
    case 176:
    case 183:
    case 200:
    case 201:
    case 218:
    case 219:
    case 236:
    case 237:
    case 238:
    case 241:
    case 242:
    case 243:
    case 244:
    case 245:
    case 246:
    case 247:
    case 248:
    case 250:
    case 253:
    case 254:
    case 255:
    case 256:
    case 257:
    case 258:
    case 261:
    case 262:
    case 263:
    case 264:
    case 265:
    case 266:
    case 267:
    case 268:
    case 269:
    case 270:
    case 271:
    case 272:
    case 273:
    case 274:
    case 275:
    case 276:
    case 277:
    case 278:
    case 279:
    case 280:
    case 281:
    case 282:
    case 283:
    case 284:
    case 285:
    case 286:
    case 287:
    case 288:
    case 289:
    case 290:
    case 291:
    case 292:
    case 293:
    case 294:
    case 295:
    case 296:
    case 297:
    case 298:
    case 304:
    case 305:
    case 306:
    case 307:
    case 308:
    case 309:
    case 310:
    case 311:
    case 315:
    case 316:
    case 317:
    case 318:
    case 319:
    case 320:
    case 321:
LABEL_150:
      result = &texFormatUnsupported;
      break;
    case 9:
      result = &texFormatR8;
      break;
    case 10:
      result = &texFormatsR8;
      break;
    case 11:
      result = &texFormatR8_SNORM;
      break;
    case 12:
      result = &texFormatR8UI;
      break;
    case 13:
      result = &texFormatR8I;
      break;
    case 19:
      result = &texFormatR16;
      break;
    case 21:
      result = &texFormatR16_SNORM;
      break;
    case 22:
      result = &texFormatR16UI;
      break;
    case 23:
      result = &texFormatR16I;
      break;
    case 24:
      result = &texFormatR16F;
      break;
    case 29:
      result = &texFormatRG8;
      break;
    case 30:
      result = &texFormatsRG8;
      break;
    case 31:
      result = &texFormatRG8_SNORM;
      break;
    case 32:
      result = &texFormatRG8UI;
      break;
    case 33:
      result = &texFormatRG8I;
      break;
    case 39:
      result = &texFormatRGB565;
      break;
    case 40:
      result = &texFormatRGB5A1;
      break;
    case 41:
      result = &texFormatRGBA4;
      break;
    case 42:
      result = &texFormatA1RGB5;
      break;
    case 43:
      result = &texFormatBGRA4;
      break;
    case 52:
      result = &texFormatR32UI;
      break;
    case 53:
      result = &texFormatR32I;
      break;
    case 54:
      result = &texFormatR32F;
      break;
    case 59:
      result = &texFormatRG16;
      break;
    case 61:
      result = &texFormatRG16_SNORM;
      break;
    case 62:
      result = &texFormatRG16UI;
      break;
    case 63:
      result = &texFormatRG16I;
      break;
    case 64:
      result = &texFormatRG16F;
      break;
    case 69:
      result = &texFormatRGBA8;
      break;
    case 70:
      result = &texFormatsRGBA8;
      break;
    case 71:
      result = &texFormatRGBA8_SNORM;
      break;
    case 72:
      result = &texFormatRGBA8UI;
      break;
    case 73:
      result = &texFormatRGBA8I;
      break;
    case 79:
      result = &texFormatBGRA8;
      break;
    case 80:
      result = &texFormatsBGRA8;
      break;
    case 83:
      result = &texFormatARGB8;
      break;
    case 84:
      result = &texFormatsARGB8;
      break;
    case 89:
      result = &texFormatRGB10_A2;
      break;
    case 90:
      result = &texFormatRGB10_A2UI;
      break;
    case 91:
      result = &texFormatR11FG11FB10F;
      break;
    case 92:
      result = &texFormatRGB9_E5;
      break;
    case 93:
      result = &texFormatBGR10_A2;
      break;
    case 102:
      result = &texFormatRG32UI;
      break;
    case 103:
      result = &texFormatRG32I;
      break;
    case 104:
      result = &texFormatRG32F;
      break;
    case 109:
      result = &texFormatRGBA16;
      break;
    case 111:
      result = &texFormatRGBA16_SNORM;
      break;
    case 112:
      result = &texFormatRGBA16UI;
      break;
    case 113:
      result = &texFormatRGBA16I;
      break;
    case 114:
      result = &texFormatRGBA16F;
      break;
    case 122:
      result = &texFormatRGBA32UI;
      break;
    case 123:
      result = &texFormatRGBA32I;
      break;
    case 124:
      result = &texFormatRGBA32F;
      break;
    case 159:
      result = &texFormatPVRTC2RGB;
      break;
    case 160:
      result = &texFormatPVRTC2sRGB;
      break;
    case 161:
      result = &texFormatPVRTC4RGB;
      break;
    case 162:
      result = &texFormatPVRTC4sRGB;
      break;
    case 163:
      result = &texFormatPVRTC2RGBA;
      break;
    case 164:
      result = &texFormatPVRTC2sRGBA;
      break;
    case 165:
      result = &texFormatPVRTC4RGBA;
      break;
    case 166:
      result = &texFormatPVRTC4sRGBA;
      break;
    case 169:
      result = &texFormatR11EAC;
      break;
    case 171:
      result = &texFormatR11EAC_SNORM;
      break;
    case 173:
      result = &texFormatRG11EAC;
      break;
    case 175:
      result = &texFormatRG11EAC_SNORM;
      break;
    case 177:
      result = &texFormatETC2RGBA8;
      break;
    case 178:
      result = &texFormatETC2sRGBA8;
      break;
    case 179:
      result = &texFormatETC2RGB8;
      break;
    case 180:
      result = &texFormatETC2sRGB8;
      break;
    case 181:
      result = &texFormatETC2RGB8A1;
      break;
    case 182:
      result = &texFormatETC2sRGB8A1;
      break;
    case 184:
      result = &texFormatASTC4x2sRGBA_UNORM;
      break;
    case 185:
      result = &texFormatASTC4x4sRGBA_UNORM;
      break;
    case 186:
      result = &texFormatASTC5x4sRGBA_UNORM;
      break;
    case 187:
      result = &texFormatASTC5x5sRGBA_UNORM;
      break;
    case 188:
      result = &texFormatASTC6x5sRGBA_UNORM;
      break;
    case 189:
      result = &texFormatASTC6x6sRGBA_UNORM;
      break;
    case 190:
      result = &texFormatASTC8x4sRGBA_UNORM;
      break;
    case 191:
      result = &texFormatASTC8x5sRGBA_UNORM;
      break;
    case 192:
      result = &texFormatASTC8x6sRGBA_UNORM;
      break;
    case 193:
      result = &texFormatASTC8x8sRGBA_UNORM;
      break;
    case 194:
      result = &texFormatASTC10x5sRGBA_UNORM;
      break;
    case 195:
      result = &texFormatASTC10x6sRGBA_UNORM;
      break;
    case 196:
      result = &texFormatASTC10x8sRGBA_UNORM;
      break;
    case 197:
      result = &texFormatASTC10x10sRGBA_UNORM;
      break;
    case 198:
      result = &texFormatASTC12x10sRGBA_UNORM;
      break;
    case 199:
      result = &texFormatASTC12x12sRGBA_UNORM;
      break;
    case 202:
      result = &texFormatASTC4x2RGBA_LP;
      break;
    case 203:
      result = &texFormatASTC4x4RGBA_LP;
      break;
    case 204:
      result = &texFormatASTC5x4RGBA_LP;
      break;
    case 205:
      result = &texFormatASTC5x5RGBA_LP;
      break;
    case 206:
      result = &texFormatASTC6x5RGBA_LP;
      break;
    case 207:
      result = &texFormatASTC6x6RGBA_LP;
      break;
    case 208:
      result = &texFormatASTC8x4RGBA_LP;
      break;
    case 209:
      result = &texFormatASTC8x5RGBA_LP;
      break;
    case 210:
      result = &texFormatASTC8x6RGBA_LP;
      break;
    case 211:
      result = &texFormatASTC8x8RGBA_LP;
      break;
    case 212:
      result = &texFormatASTC10x5RGBA_LP;
      break;
    case 213:
      result = &texFormatASTC10x6RGBA_LP;
      break;
    case 214:
      result = &texFormatASTC10x8RGBA_LP;
      break;
    case 215:
      result = &texFormatASTC10x10RGBA_LP;
      break;
    case 216:
      result = &texFormatASTC12x10RGBA_LP;
      break;
    case 217:
      result = &texFormatASTC12x12RGBA_LP;
      break;
    case 220:
      result = &texFormatASTC4x2RGBA;
      break;
    case 221:
      result = &texFormatASTC4x4RGBA;
      break;
    case 222:
      result = &texFormatASTC5x4RGBA;
      break;
    case 223:
      result = &texFormatASTC5x5RGBA;
      break;
    case 224:
      result = &texFormatASTC6x5RGBA;
      break;
    case 225:
      result = &texFormatASTC6x6RGBA;
      break;
    case 226:
      result = &texFormatASTC8x4RGBA;
      break;
    case 227:
      result = &texFormatASTC8x5RGBA;
      break;
    case 228:
      result = &texFormatASTC8x6RGBA;
      break;
    case 229:
      result = &texFormatASTC8x8RGBA;
      break;
    case 230:
      result = &texFormatASTC10x5RGBA;
      break;
    case 231:
      result = &texFormatASTC10x6RGBA;
      break;
    case 232:
      result = &texFormatASTC10x8RGBA;
      break;
    case 233:
      result = &texFormatASTC10x10RGBA;
      break;
    case 234:
      result = &texFormatASTC12x10RGBA;
      break;
    case 235:
      result = &texFormatASTC12x12RGBA;
      break;
    case 239:
      result = &texFormatYUY2_RGB;
      break;
    case 240:
      result = &texFormatUYVY_RGB;
      break;
    case 249:
      result = &texFormatD16;
      break;
    case 251:
      result = &texFormatD32;
      break;
    case 252:
    case 260:
      result = &texFormatS8;
      break;
    case 259:
      result = &texFormatD32FS8_2PLANE;
      break;
    case 299:
      result = &texFormatRGB8;
      break;
    case 300:
      result = &texFormatsRGB8;
      break;
    case 301:
      result = &texFormatRGB8_SNORM;
      break;
    case 302:
      result = &texFormatRGB8UI;
      break;
    case 303:
      result = &texFormatRGB8I;
      break;
    case 312:
      result = &texFormatRGBX16UI;
      break;
    case 313:
      result = &texFormatRGBX16I;
      break;
    case 314:
      result = &texFormatRGBX16F;
      break;
    case 322:
      result = &texFormatRGBX32UI;
      break;
    case 323:
      result = &texFormatRGBX32I;
      break;
    case 324:
      result = &texFormatRGBX32F;
      break;
    default:
      switch(&texFormatA8)
      {
        case 0x1F4u:
          result = &texFormatYCBCR8_420_2PLANE;
          break;
        case 0x1F5u:
          result = &texFormatYCBCR8_422_1PLANE;
          break;
        case 0x1F6u:
          result = &texFormatYCBCR8_422_2PLANE;
          break;
        case 0x1F7u:
          result = &texFormatYCBCR8_444_2PLANE;
          break;
        case 0x1F8u:
          result = &texFormatYCBCR10_444_1PLANE;
          break;
        case 0x1F9u:
          result = &texFormatYCBCR10_420_2PLANE;
          break;
        case 0x1FAu:
          result = &texFormatYCBCR10_422_2PLANE;
          break;
        case 0x1FBu:
          result = &texFormatYCBCR10_444_2PLANE;
          break;
        case 0x1FCu:
          result = &texFormatYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x1FDu:
          result = &texFormatYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x1FEu:
          result = &texFormatYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x208u:
          result = &texFormatsYCBCR8_420_2PLANE;
          break;
        case 0x209u:
          result = &texFormatsYCBCR8_422_1PLANE;
          break;
        case 0x20Au:
          result = &texFormatsYCBCR8_422_2PLANE;
          break;
        case 0x20Bu:
          result = &texFormatsYCBCR8_444_2PLANE;
          break;
        case 0x20Cu:
          result = &texFormatsYCBCR10_444_1PLANE;
          break;
        case 0x20Du:
          result = &texFormatsYCBCR10_420_2PLANE;
          break;
        case 0x20Eu:
          result = &texFormatsYCBCR10_422_2PLANE;
          break;
        case 0x20Fu:
          result = &texFormatsYCBCR10_444_2PLANE;
          break;
        case 0x210u:
          result = &texFormatsYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x211u:
          result = &texFormatsYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x212u:
          result = &texFormatsYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x21Cu:
          result = &texFormatRGB8_420_2PLANE;
          break;
        case 0x21Du:
          result = &texFormatRGB8_422_2PLANE;
          break;
        case 0x21Eu:
          result = &texFormatRGB8_444_2PLANE;
          break;
        case 0x21Fu:
          result = &texFormatRGB10_420_2PLANE;
          break;
        case 0x220u:
          result = &texFormatRGB10_422_2PLANE;
          break;
        case 0x221u:
          result = &texFormatRGB10_444_2PLANE;
          break;
        case 0x222u:
          result = &texFormatRGB10_420_2PLANE_PACKED;
          break;
        case 0x223u:
          result = &texFormatRGB10_422_2PLANE_PACKED;
          break;
        case 0x224u:
          result = &texFormatRGB10_444_2PLANE_PACKED;
          break;
        case 0x226u:
          result = &texFormatXRRGB10_PLANE_A8_PLANE;
          break;
        case 0x227u:
          result = &texFormatXRSRGB10_PLANE_A8_PLANE;
          break;
        case 0x228u:
          result = &texFormatARGBV16_XR10;
          break;
        case 0x229u:
          result = &texFormatsARGBV16_XR10;
          break;
        case 0x22Au:
          result = &texFormatXRRGB10;
          break;
        case 0x22Bu:
          result = &texFormatXRSRGB10;
          break;
        case 0x22Cu:
          result = &texFormatRGBA16F_XR;
          break;
        case 0x230u:
          result = &texFormatYCBCR8A8_444_1PLANE;
          break;
        case 0x232u:
          result = &texFormatYCBCR8_422_1PLANE_REV;
          break;
        case 0x240u:
          result = &texFormatR10X6F;
          break;
        case 0x241u:
          result = &texFormatsR10X6F;
          break;
        case 0x242u:
          result = &texFormatRG10X12F;
          break;
        case 0x243u:
          result = &texFormatsRG10X12F;
          break;
        case 0x24Cu:
          result = &texFormatR10_1PLANE_PACKED;
          break;
        case 0x24Du:
          result = &texFormatRG10_1PLANE_PACKED;
          break;
        default:
          goto LABEL_150;
      }
      break;
  }
  return result;
}

void *AGX::G12::TextureFormatTable::chooseTextureFormatCPP(AGX::G12::TextureFormatTable *this, MTLPixelFormat a2)
{
  int v2;
  void *result;

  v2 = (_DWORD)this - 1;
  result = &texFormatA8;
  switch(v2)
  {
    case 0:
      return result;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 20:
    case 25:
    case 26:
    case 27:
    case 28:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 55:
    case 56:
    case 57:
    case 58:
    case 60:
    case 65:
    case 66:
    case 67:
    case 68:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 81:
    case 82:
    case 85:
    case 86:
    case 87:
    case 88:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 105:
    case 106:
    case 107:
    case 108:
    case 110:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 167:
    case 168:
    case 170:
    case 172:
    case 174:
    case 176:
    case 183:
    case 200:
    case 201:
    case 218:
    case 219:
    case 236:
    case 237:
    case 238:
    case 241:
    case 242:
    case 243:
    case 244:
    case 245:
    case 246:
    case 247:
    case 248:
    case 250:
    case 253:
    case 254:
    case 255:
    case 256:
    case 257:
    case 258:
    case 261:
    case 262:
    case 263:
    case 264:
    case 265:
    case 266:
    case 267:
    case 268:
    case 269:
    case 270:
    case 271:
    case 272:
    case 273:
    case 274:
    case 275:
    case 276:
    case 277:
    case 278:
    case 279:
    case 280:
    case 281:
    case 282:
    case 283:
    case 284:
    case 285:
    case 286:
    case 287:
    case 288:
    case 289:
    case 290:
    case 291:
    case 292:
    case 293:
    case 294:
    case 295:
    case 296:
    case 297:
    case 298:
    case 304:
    case 305:
    case 306:
    case 307:
    case 308:
    case 309:
    case 310:
    case 311:
    case 315:
    case 316:
    case 317:
    case 318:
    case 319:
    case 320:
    case 321:
LABEL_150:
      result = &texFormatUnsupported;
      break;
    case 9:
      result = &texFormatR8;
      break;
    case 10:
      result = &texFormatsR8;
      break;
    case 11:
      result = &texFormatR8_SNORM;
      break;
    case 12:
      result = &texFormatR8UI;
      break;
    case 13:
      result = &texFormatR8I;
      break;
    case 19:
      result = &texFormatR16;
      break;
    case 21:
      result = &texFormatR16_SNORM;
      break;
    case 22:
      result = &texFormatR16UI;
      break;
    case 23:
      result = &texFormatR16I;
      break;
    case 24:
      result = &texFormatR16F;
      break;
    case 29:
      result = &texFormatRG8;
      break;
    case 30:
      result = &texFormatsRG8;
      break;
    case 31:
      result = &texFormatRG8_SNORM;
      break;
    case 32:
      result = &texFormatRG8UI;
      break;
    case 33:
      result = &texFormatRG8I;
      break;
    case 39:
      result = &texFormatRGB565;
      break;
    case 40:
      result = &texFormatRGB5A1;
      break;
    case 41:
      result = &texFormatRGBA4;
      break;
    case 42:
      result = &texFormatA1RGB5;
      break;
    case 43:
      result = &texFormatBGRA4;
      break;
    case 52:
      result = &texFormatR32UI;
      break;
    case 53:
      result = &texFormatR32I;
      break;
    case 54:
      result = &texFormatR32F;
      break;
    case 59:
      result = &texFormatRG16;
      break;
    case 61:
      result = &texFormatRG16_SNORM;
      break;
    case 62:
      result = &texFormatRG16UI;
      break;
    case 63:
      result = &texFormatRG16I;
      break;
    case 64:
      result = &texFormatRG16F;
      break;
    case 69:
      result = &texFormatRGBA8;
      break;
    case 70:
      result = &texFormatsRGBA8;
      break;
    case 71:
      result = &texFormatRGBA8_SNORM;
      break;
    case 72:
      result = &texFormatRGBA8UI;
      break;
    case 73:
      result = &texFormatRGBA8I;
      break;
    case 79:
      result = &texFormatBGRA8;
      break;
    case 80:
      result = &texFormatsBGRA8;
      break;
    case 83:
      result = &texFormatARGB8;
      break;
    case 84:
      result = &texFormatsARGB8;
      break;
    case 89:
      result = &texFormatRGB10_A2;
      break;
    case 90:
      result = &texFormatRGB10_A2UI;
      break;
    case 91:
      result = &texFormatR11FG11FB10F;
      break;
    case 92:
      result = &texFormatRGB9_E5;
      break;
    case 93:
      result = &texFormatBGR10_A2;
      break;
    case 102:
      result = &texFormatRG32UI;
      break;
    case 103:
      result = &texFormatRG32I;
      break;
    case 104:
      result = &texFormatRG32F;
      break;
    case 109:
      result = &texFormatRGBA16;
      break;
    case 111:
      result = &texFormatRGBA16_SNORM;
      break;
    case 112:
      result = &texFormatRGBA16UI;
      break;
    case 113:
      result = &texFormatRGBA16I;
      break;
    case 114:
      result = &texFormatRGBA16F;
      break;
    case 122:
      result = &texFormatRGBA32UI;
      break;
    case 123:
      result = &texFormatRGBA32I;
      break;
    case 124:
      result = &texFormatRGBA32F;
      break;
    case 159:
      result = &texFormatPVRTC2RGB;
      break;
    case 160:
      result = &texFormatPVRTC2sRGB;
      break;
    case 161:
      result = &texFormatPVRTC4RGB;
      break;
    case 162:
      result = &texFormatPVRTC4sRGB;
      break;
    case 163:
      result = &texFormatPVRTC2RGBA;
      break;
    case 164:
      result = &texFormatPVRTC2sRGBA;
      break;
    case 165:
      result = &texFormatPVRTC4RGBA;
      break;
    case 166:
      result = &texFormatPVRTC4sRGBA;
      break;
    case 169:
      result = &texFormatR11EAC;
      break;
    case 171:
      result = &texFormatR11EAC_SNORM;
      break;
    case 173:
      result = &texFormatRG11EAC;
      break;
    case 175:
      result = &texFormatRG11EAC_SNORM;
      break;
    case 177:
      result = &texFormatETC2RGBA8;
      break;
    case 178:
      result = &texFormatETC2sRGBA8;
      break;
    case 179:
      result = &texFormatETC2RGB8;
      break;
    case 180:
      result = &texFormatETC2sRGB8;
      break;
    case 181:
      result = &texFormatETC2RGB8A1;
      break;
    case 182:
      result = &texFormatETC2sRGB8A1;
      break;
    case 184:
      result = &texFormatASTC4x2sRGBA_UNORM;
      break;
    case 185:
      result = &texFormatASTC4x4sRGBA_UNORM;
      break;
    case 186:
      result = &texFormatASTC5x4sRGBA_UNORM;
      break;
    case 187:
      result = &texFormatASTC5x5sRGBA_UNORM;
      break;
    case 188:
      result = &texFormatASTC6x5sRGBA_UNORM;
      break;
    case 189:
      result = &texFormatASTC6x6sRGBA_UNORM;
      break;
    case 190:
      result = &texFormatASTC8x4sRGBA_UNORM;
      break;
    case 191:
      result = &texFormatASTC8x5sRGBA_UNORM;
      break;
    case 192:
      result = &texFormatASTC8x6sRGBA_UNORM;
      break;
    case 193:
      result = &texFormatASTC8x8sRGBA_UNORM;
      break;
    case 194:
      result = &texFormatASTC10x5sRGBA_UNORM;
      break;
    case 195:
      result = &texFormatASTC10x6sRGBA_UNORM;
      break;
    case 196:
      result = &texFormatASTC10x8sRGBA_UNORM;
      break;
    case 197:
      result = &texFormatASTC10x10sRGBA_UNORM;
      break;
    case 198:
      result = &texFormatASTC12x10sRGBA_UNORM;
      break;
    case 199:
      result = &texFormatASTC12x12sRGBA_UNORM;
      break;
    case 202:
      result = &texFormatASTC4x2RGBA_LP;
      break;
    case 203:
      result = &texFormatASTC4x4RGBA_LP;
      break;
    case 204:
      result = &texFormatASTC5x4RGBA_LP;
      break;
    case 205:
      result = &texFormatASTC5x5RGBA_LP;
      break;
    case 206:
      result = &texFormatASTC6x5RGBA_LP;
      break;
    case 207:
      result = &texFormatASTC6x6RGBA_LP;
      break;
    case 208:
      result = &texFormatASTC8x4RGBA_LP;
      break;
    case 209:
      result = &texFormatASTC8x5RGBA_LP;
      break;
    case 210:
      result = &texFormatASTC8x6RGBA_LP;
      break;
    case 211:
      result = &texFormatASTC8x8RGBA_LP;
      break;
    case 212:
      result = &texFormatASTC10x5RGBA_LP;
      break;
    case 213:
      result = &texFormatASTC10x6RGBA_LP;
      break;
    case 214:
      result = &texFormatASTC10x8RGBA_LP;
      break;
    case 215:
      result = &texFormatASTC10x10RGBA_LP;
      break;
    case 216:
      result = &texFormatASTC12x10RGBA_LP;
      break;
    case 217:
      result = &texFormatASTC12x12RGBA_LP;
      break;
    case 220:
      result = &texFormatASTC4x2RGBA;
      break;
    case 221:
      result = &texFormatASTC4x4RGBA;
      break;
    case 222:
      result = &texFormatASTC5x4RGBA;
      break;
    case 223:
      result = &texFormatASTC5x5RGBA;
      break;
    case 224:
      result = &texFormatASTC6x5RGBA;
      break;
    case 225:
      result = &texFormatASTC6x6RGBA;
      break;
    case 226:
      result = &texFormatASTC8x4RGBA;
      break;
    case 227:
      result = &texFormatASTC8x5RGBA;
      break;
    case 228:
      result = &texFormatASTC8x6RGBA;
      break;
    case 229:
      result = &texFormatASTC8x8RGBA;
      break;
    case 230:
      result = &texFormatASTC10x5RGBA;
      break;
    case 231:
      result = &texFormatASTC10x6RGBA;
      break;
    case 232:
      result = &texFormatASTC10x8RGBA;
      break;
    case 233:
      result = &texFormatASTC10x10RGBA;
      break;
    case 234:
      result = &texFormatASTC12x10RGBA;
      break;
    case 235:
      result = &texFormatASTC12x12RGBA;
      break;
    case 239:
      result = &texFormatYUY2_RGB;
      break;
    case 240:
      result = &texFormatUYVY_RGB;
      break;
    case 249:
      result = &texFormatD16;
      break;
    case 251:
      result = &texFormatD32;
      break;
    case 252:
    case 260:
      result = &texFormatS8;
      break;
    case 259:
      result = &texFormatD32FS8_2PLANE;
      break;
    case 299:
      result = &texFormatRGB8;
      break;
    case 300:
      result = &texFormatsRGB8;
      break;
    case 301:
      result = &texFormatRGB8_SNORM;
      break;
    case 302:
      result = &texFormatRGB8UI;
      break;
    case 303:
      result = &texFormatRGB8I;
      break;
    case 312:
      result = &texFormatRGBX16UI;
      break;
    case 313:
      result = &texFormatRGBX16I;
      break;
    case 314:
      result = &texFormatRGBX16F;
      break;
    case 322:
      result = &texFormatRGBX32UI;
      break;
    case 323:
      result = &texFormatRGBX32I;
      break;
    case 324:
      result = &texFormatRGBX32F;
      break;
    default:
      switch(&texFormatA8)
      {
        case 0x1F4u:
          result = &texFormatYCBCR8_420_2PLANE;
          break;
        case 0x1F5u:
          result = &texFormatYCBCR8_422_1PLANE;
          break;
        case 0x1F6u:
          result = &texFormatYCBCR8_422_2PLANE;
          break;
        case 0x1F7u:
          result = &texFormatYCBCR8_444_2PLANE;
          break;
        case 0x1F8u:
          result = &texFormatYCBCR10_444_1PLANE;
          break;
        case 0x1F9u:
          result = &texFormatYCBCR10_420_2PLANE;
          break;
        case 0x1FAu:
          result = &texFormatYCBCR10_422_2PLANE;
          break;
        case 0x1FBu:
          result = &texFormatYCBCR10_444_2PLANE;
          break;
        case 0x1FCu:
          result = &texFormatYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x1FDu:
          result = &texFormatYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x1FEu:
          result = &texFormatYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x208u:
          result = &texFormatsYCBCR8_420_2PLANE;
          break;
        case 0x209u:
          result = &texFormatsYCBCR8_422_1PLANE;
          break;
        case 0x20Au:
          result = &texFormatsYCBCR8_422_2PLANE;
          break;
        case 0x20Bu:
          result = &texFormatsYCBCR8_444_2PLANE;
          break;
        case 0x20Cu:
          result = &texFormatsYCBCR10_444_1PLANE;
          break;
        case 0x20Du:
          result = &texFormatsYCBCR10_420_2PLANE;
          break;
        case 0x20Eu:
          result = &texFormatsYCBCR10_422_2PLANE;
          break;
        case 0x20Fu:
          result = &texFormatsYCBCR10_444_2PLANE;
          break;
        case 0x210u:
          result = &texFormatsYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x211u:
          result = &texFormatsYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x212u:
          result = &texFormatsYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x21Cu:
          result = &texFormatRGB8_420_2PLANE;
          break;
        case 0x21Du:
          result = &texFormatRGB8_422_2PLANE;
          break;
        case 0x21Eu:
          result = &texFormatRGB8_444_2PLANE;
          break;
        case 0x21Fu:
          result = &texFormatRGB10_420_2PLANE;
          break;
        case 0x220u:
          result = &texFormatRGB10_422_2PLANE;
          break;
        case 0x221u:
          result = &texFormatRGB10_444_2PLANE;
          break;
        case 0x222u:
          result = &texFormatRGB10_420_2PLANE_PACKED;
          break;
        case 0x223u:
          result = &texFormatRGB10_422_2PLANE_PACKED;
          break;
        case 0x224u:
          result = &texFormatRGB10_444_2PLANE_PACKED;
          break;
        case 0x226u:
          result = &texFormatXRRGB10_PLANE_A8_PLANE;
          break;
        case 0x227u:
          result = &texFormatXRSRGB10_PLANE_A8_PLANE;
          break;
        case 0x228u:
          result = &texFormatARGBV16_XR10;
          break;
        case 0x229u:
          result = &texFormatsARGBV16_XR10;
          break;
        case 0x22Au:
          result = &texFormatXRRGB10;
          break;
        case 0x22Bu:
          result = &texFormatXRSRGB10;
          break;
        case 0x230u:
          result = &texFormatYCBCR8A8_444_1PLANE;
          break;
        case 0x232u:
          result = &texFormatYCBCR8_422_1PLANE_REV;
          break;
        case 0x233u:
          result = &texFormatpqYCBCR10_444_1PLANE;
          break;
        case 0x234u:
          result = &texFormatpqYCBCR10_420_2PLANE;
          break;
        case 0x235u:
          result = &texFormatpqYCBCR10_422_2PLANE;
          break;
        case 0x236u:
          result = &texFormatpqYCBCR10_444_2PLANE;
          break;
        case 0x237u:
          result = &texFormatpqYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x238u:
          result = &texFormatpqYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x239u:
          result = &texFormatpqYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x23Au:
          result = &texFormatYCBCR12_420_2PLANE;
          break;
        case 0x23Bu:
          result = &texFormatYCBCR12_422_2PLANE;
          break;
        case 0x23Cu:
          result = &texFormatYCBCR12_444_2PLANE;
          break;
        case 0x23Du:
          result = &texFormatpqYCBCR12_420_2PLANE;
          break;
        case 0x23Eu:
          result = &texFormatpqYCBCR12_422_2PLANE;
          break;
        case 0x23Fu:
          result = &texFormatpqYCBCR12_444_2PLANE;
          break;
        case 0x240u:
          result = &texFormatR10X6F;
          break;
        case 0x241u:
          result = &texFormatsR10X6F;
          break;
        case 0x242u:
          result = &texFormatRG10X12F;
          break;
        case 0x243u:
          result = &texFormatsRG10X12F;
          break;
        case 0x24Cu:
          result = &texFormatR10_1PLANE_PACKED;
          break;
        case 0x24Du:
          result = &texFormatRG10_1PLANE_PACKED;
          break;
        case 0x24Eu:
          result = &texFormatYCBCR10_444_1PLANE_XR;
          break;
        case 0x24Fu:
          result = &texFormatYCBCR10_420_2PLANE_XR;
          break;
        case 0x250u:
          result = &texFormatYCBCR10_422_2PLANE_XR;
          break;
        case 0x251u:
          result = &texFormatYCBCR10_444_2PLANE_XR;
          break;
        case 0x252u:
          result = &texFormatYCBCR10_420_2PLANE_PACKED_XR;
          break;
        case 0x253u:
          result = &texFormatYCBCR10_422_2PLANE_PACKED_XR;
          break;
        case 0x254u:
          result = &texFormatYCBCR10_444_2PLANE_PACKED_XR;
          break;
        case 0x255u:
          result = &texFormatYCBCR12_420_2PLANE_XR;
          break;
        case 0x256u:
          result = &texFormatYCBCR12_422_2PLANE_XR;
          break;
        case 0x257u:
          result = &texFormatYCBCR12_444_2PLANE_XR;
          break;
        case 0x25Bu:
          result = &texFormatR12X4U;
          break;
        case 0x25Cu:
          result = &texFormatpqR12X4U;
          break;
        case 0x25Du:
          result = &texFormatRG12X8U;
          break;
        case 0x25Eu:
          result = &texFormatpqR10X6U;
          break;
        default:
          goto LABEL_150;
      }
      break;
  }
  return result;
}

void *AGX::G13::TextureFormatTable::chooseTextureFormatCPP(AGX::G13::TextureFormatTable *this, MTLPixelFormat a2)
{
  int v2;
  void *result;

  v2 = (_DWORD)this - 1;
  result = &texFormatA8;
  switch(v2)
  {
    case 0:
      return result;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 20:
    case 25:
    case 26:
    case 27:
    case 28:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 55:
    case 56:
    case 57:
    case 58:
    case 60:
    case 65:
    case 66:
    case 67:
    case 68:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 81:
    case 82:
    case 85:
    case 86:
    case 87:
    case 88:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 105:
    case 106:
    case 107:
    case 108:
    case 110:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 125:
    case 126:
    case 127:
    case 128:
    case 135:
    case 136:
    case 137:
    case 138:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 167:
    case 168:
    case 170:
    case 172:
    case 174:
    case 176:
    case 183:
    case 200:
    case 201:
    case 218:
    case 219:
    case 236:
    case 237:
    case 238:
    case 241:
    case 242:
    case 243:
    case 244:
    case 245:
    case 246:
    case 247:
    case 248:
    case 250:
    case 253:
    case 254:
    case 255:
    case 256:
    case 257:
    case 258:
    case 261:
    case 262:
    case 263:
    case 264:
    case 265:
    case 266:
    case 267:
    case 268:
    case 269:
    case 270:
    case 271:
    case 272:
    case 273:
    case 274:
    case 275:
    case 276:
    case 277:
    case 278:
    case 279:
    case 280:
    case 281:
    case 282:
    case 283:
    case 284:
    case 285:
    case 286:
    case 287:
    case 288:
    case 289:
    case 290:
    case 291:
    case 292:
    case 293:
    case 294:
    case 295:
    case 296:
    case 297:
    case 298:
    case 304:
    case 305:
    case 306:
    case 307:
    case 308:
    case 309:
    case 310:
    case 311:
    case 315:
    case 316:
    case 317:
    case 318:
    case 319:
    case 320:
    case 321:
LABEL_164:
      result = &texFormatUnsupported;
      break;
    case 9:
      result = &texFormatR8;
      break;
    case 10:
      result = &texFormatsR8;
      break;
    case 11:
      result = &texFormatR8_SNORM;
      break;
    case 12:
      result = &texFormatR8UI;
      break;
    case 13:
      result = &texFormatR8I;
      break;
    case 19:
      result = &texFormatR16;
      break;
    case 21:
      result = &texFormatR16_SNORM;
      break;
    case 22:
      result = &texFormatR16UI;
      break;
    case 23:
      result = &texFormatR16I;
      break;
    case 24:
      result = &texFormatR16F;
      break;
    case 29:
      result = &texFormatRG8;
      break;
    case 30:
      result = &texFormatsRG8;
      break;
    case 31:
      result = &texFormatRG8_SNORM;
      break;
    case 32:
      result = &texFormatRG8UI;
      break;
    case 33:
      result = &texFormatRG8I;
      break;
    case 39:
      result = &texFormatRGB565;
      break;
    case 40:
      result = &texFormatRGB5A1;
      break;
    case 41:
      result = &texFormatRGBA4;
      break;
    case 42:
      result = &texFormatA1RGB5;
      break;
    case 43:
      result = &texFormatBGRA4;
      break;
    case 52:
      result = &texFormatR32UI;
      break;
    case 53:
      result = &texFormatR32I;
      break;
    case 54:
      result = &texFormatR32F;
      break;
    case 59:
      result = &texFormatRG16;
      break;
    case 61:
      result = &texFormatRG16_SNORM;
      break;
    case 62:
      result = &texFormatRG16UI;
      break;
    case 63:
      result = &texFormatRG16I;
      break;
    case 64:
      result = &texFormatRG16F;
      break;
    case 69:
      result = &texFormatRGBA8;
      break;
    case 70:
      result = &texFormatsRGBA8;
      break;
    case 71:
      result = &texFormatRGBA8_SNORM;
      break;
    case 72:
      result = &texFormatRGBA8UI;
      break;
    case 73:
      result = &texFormatRGBA8I;
      break;
    case 79:
      result = &texFormatBGRA8;
      break;
    case 80:
      result = &texFormatsBGRA8;
      break;
    case 83:
      result = &texFormatARGB8;
      break;
    case 84:
      result = &texFormatsARGB8;
      break;
    case 89:
      result = &texFormatRGB10_A2;
      break;
    case 90:
      result = &texFormatRGB10_A2UI;
      break;
    case 91:
      result = &texFormatR11FG11FB10F;
      break;
    case 92:
      result = &texFormatRGB9_E5;
      break;
    case 93:
      result = &texFormatBGR10_A2;
      break;
    case 102:
      result = &texFormatRG32UI;
      break;
    case 103:
      result = &texFormatRG32I;
      break;
    case 104:
      result = &texFormatRG32F;
      break;
    case 109:
      result = &texFormatRGBA16;
      break;
    case 111:
      result = &texFormatRGBA16_SNORM;
      break;
    case 112:
      result = &texFormatRGBA16UI;
      break;
    case 113:
      result = &texFormatRGBA16I;
      break;
    case 114:
      result = &texFormatRGBA16F;
      break;
    case 122:
      result = &texFormatRGBA32UI;
      break;
    case 123:
      result = &texFormatRGBA32I;
      break;
    case 124:
      result = &texFormatRGBA32F;
      break;
    case 129:
      result = &texFormatBC1_RGBA_UNORM;
      break;
    case 130:
      result = &texFormatBC1_sRGBA_UNORM;
      break;
    case 131:
      result = &texFormatBC2_RGBA_UNORM;
      break;
    case 132:
      result = &texFormatBC2_sRGBA_UNORM;
      break;
    case 133:
      result = &texFormatBC3_RGBA_UNORM;
      break;
    case 134:
      result = &texFormatBC3_sRGBA_UNORM;
      break;
    case 139:
      result = &texFormatBC4_R_UNORM;
      break;
    case 140:
      result = &texFormatBC4_R_SNORM;
      break;
    case 141:
      result = &texFormatBC5_RG_UNORM;
      break;
    case 142:
      result = &texFormatBC5_RG_SNORM;
      break;
    case 149:
      result = &texFormatBC6H_RGB_FLOAT;
      break;
    case 150:
      result = &texFormatBC6H_RGB_UFLOAT;
      break;
    case 151:
      result = &texFormatBC7_RGBA_UNORM;
      break;
    case 152:
      result = &texFormatBC7_sRGBA_UNORM;
      break;
    case 159:
      result = &texFormatPVRTC2RGB;
      break;
    case 160:
      result = &texFormatPVRTC2sRGB;
      break;
    case 161:
      result = &texFormatPVRTC4RGB;
      break;
    case 162:
      result = &texFormatPVRTC4sRGB;
      break;
    case 163:
      result = &texFormatPVRTC2RGBA;
      break;
    case 164:
      result = &texFormatPVRTC2sRGBA;
      break;
    case 165:
      result = &texFormatPVRTC4RGBA;
      break;
    case 166:
      result = &texFormatPVRTC4sRGBA;
      break;
    case 169:
      result = &texFormatR11EAC;
      break;
    case 171:
      result = &texFormatR11EAC_SNORM;
      break;
    case 173:
      result = &texFormatRG11EAC;
      break;
    case 175:
      result = &texFormatRG11EAC_SNORM;
      break;
    case 177:
      result = &texFormatETC2RGBA8;
      break;
    case 178:
      result = &texFormatETC2sRGBA8;
      break;
    case 179:
      result = &texFormatETC2RGB8;
      break;
    case 180:
      result = &texFormatETC2sRGB8;
      break;
    case 181:
      result = &texFormatETC2RGB8A1;
      break;
    case 182:
      result = &texFormatETC2sRGB8A1;
      break;
    case 184:
      result = &texFormatASTC4x2sRGBA_UNORM;
      break;
    case 185:
      result = &texFormatASTC4x4sRGBA_UNORM;
      break;
    case 186:
      result = &texFormatASTC5x4sRGBA_UNORM;
      break;
    case 187:
      result = &texFormatASTC5x5sRGBA_UNORM;
      break;
    case 188:
      result = &texFormatASTC6x5sRGBA_UNORM;
      break;
    case 189:
      result = &texFormatASTC6x6sRGBA_UNORM;
      break;
    case 190:
      result = &texFormatASTC8x4sRGBA_UNORM;
      break;
    case 191:
      result = &texFormatASTC8x5sRGBA_UNORM;
      break;
    case 192:
      result = &texFormatASTC8x6sRGBA_UNORM;
      break;
    case 193:
      result = &texFormatASTC8x8sRGBA_UNORM;
      break;
    case 194:
      result = &texFormatASTC10x5sRGBA_UNORM;
      break;
    case 195:
      result = &texFormatASTC10x6sRGBA_UNORM;
      break;
    case 196:
      result = &texFormatASTC10x8sRGBA_UNORM;
      break;
    case 197:
      result = &texFormatASTC10x10sRGBA_UNORM;
      break;
    case 198:
      result = &texFormatASTC12x10sRGBA_UNORM;
      break;
    case 199:
      result = &texFormatASTC12x12sRGBA_UNORM;
      break;
    case 202:
      result = &texFormatASTC4x2RGBA_LP;
      break;
    case 203:
      result = &texFormatASTC4x4RGBA_LP;
      break;
    case 204:
      result = &texFormatASTC5x4RGBA_LP;
      break;
    case 205:
      result = &texFormatASTC5x5RGBA_LP;
      break;
    case 206:
      result = &texFormatASTC6x5RGBA_LP;
      break;
    case 207:
      result = &texFormatASTC6x6RGBA_LP;
      break;
    case 208:
      result = &texFormatASTC8x4RGBA_LP;
      break;
    case 209:
      result = &texFormatASTC8x5RGBA_LP;
      break;
    case 210:
      result = &texFormatASTC8x6RGBA_LP;
      break;
    case 211:
      result = &texFormatASTC8x8RGBA_LP;
      break;
    case 212:
      result = &texFormatASTC10x5RGBA_LP;
      break;
    case 213:
      result = &texFormatASTC10x6RGBA_LP;
      break;
    case 214:
      result = &texFormatASTC10x8RGBA_LP;
      break;
    case 215:
      result = &texFormatASTC10x10RGBA_LP;
      break;
    case 216:
      result = &texFormatASTC12x10RGBA_LP;
      break;
    case 217:
      result = &texFormatASTC12x12RGBA_LP;
      break;
    case 220:
      result = &texFormatASTC4x2RGBA;
      break;
    case 221:
      result = &texFormatASTC4x4RGBA;
      break;
    case 222:
      result = &texFormatASTC5x4RGBA;
      break;
    case 223:
      result = &texFormatASTC5x5RGBA;
      break;
    case 224:
      result = &texFormatASTC6x5RGBA;
      break;
    case 225:
      result = &texFormatASTC6x6RGBA;
      break;
    case 226:
      result = &texFormatASTC8x4RGBA;
      break;
    case 227:
      result = &texFormatASTC8x5RGBA;
      break;
    case 228:
      result = &texFormatASTC8x6RGBA;
      break;
    case 229:
      result = &texFormatASTC8x8RGBA;
      break;
    case 230:
      result = &texFormatASTC10x5RGBA;
      break;
    case 231:
      result = &texFormatASTC10x6RGBA;
      break;
    case 232:
      result = &texFormatASTC10x8RGBA;
      break;
    case 233:
      result = &texFormatASTC10x10RGBA;
      break;
    case 234:
      result = &texFormatASTC12x10RGBA;
      break;
    case 235:
      result = &texFormatASTC12x12RGBA;
      break;
    case 239:
      result = &texFormatYUY2_RGB;
      break;
    case 240:
      result = &texFormatUYVY_RGB;
      break;
    case 249:
      result = &texFormatD16;
      break;
    case 251:
      result = &texFormatD32;
      break;
    case 252:
    case 260:
      result = &texFormatS8;
      break;
    case 259:
      result = &texFormatD32FS8_2PLANE;
      break;
    case 299:
      result = &texFormatRGB8;
      break;
    case 300:
      result = &texFormatsRGB8;
      break;
    case 301:
      result = &texFormatRGB8_SNORM;
      break;
    case 302:
      result = &texFormatRGB8UI;
      break;
    case 303:
      result = &texFormatRGB8I;
      break;
    case 312:
      result = &texFormatRGBX16UI;
      break;
    case 313:
      result = &texFormatRGBX16I;
      break;
    case 314:
      result = &texFormatRGBX16F;
      break;
    case 322:
      result = &texFormatRGBX32UI;
      break;
    case 323:
      result = &texFormatRGBX32I;
      break;
    case 324:
      result = &texFormatRGBX32F;
      break;
    default:
      switch(&texFormatA8)
      {
        case 0x1F4u:
          result = &texFormatYCBCR8_420_2PLANE;
          break;
        case 0x1F5u:
          result = &texFormatYCBCR8_422_1PLANE;
          break;
        case 0x1F6u:
          result = &texFormatYCBCR8_422_2PLANE;
          break;
        case 0x1F7u:
          result = &texFormatYCBCR8_444_2PLANE;
          break;
        case 0x1F8u:
          result = &texFormatYCBCR10_444_1PLANE;
          break;
        case 0x1F9u:
          result = &texFormatYCBCR10_420_2PLANE;
          break;
        case 0x1FAu:
          result = &texFormatYCBCR10_422_2PLANE;
          break;
        case 0x1FBu:
          result = &texFormatYCBCR10_444_2PLANE;
          break;
        case 0x1FCu:
          result = &texFormatYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x1FDu:
          result = &texFormatYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x1FEu:
          result = &texFormatYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x208u:
          result = &texFormatsYCBCR8_420_2PLANE;
          break;
        case 0x209u:
          result = &texFormatsYCBCR8_422_1PLANE;
          break;
        case 0x20Au:
          result = &texFormatsYCBCR8_422_2PLANE;
          break;
        case 0x20Bu:
          result = &texFormatsYCBCR8_444_2PLANE;
          break;
        case 0x20Cu:
          result = &texFormatsYCBCR10_444_1PLANE;
          break;
        case 0x20Du:
          result = &texFormatsYCBCR10_420_2PLANE;
          break;
        case 0x20Eu:
          result = &texFormatsYCBCR10_422_2PLANE;
          break;
        case 0x20Fu:
          result = &texFormatsYCBCR10_444_2PLANE;
          break;
        case 0x210u:
          result = &texFormatsYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x211u:
          result = &texFormatsYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x212u:
          result = &texFormatsYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x21Cu:
          result = &texFormatRGB8_420_2PLANE;
          break;
        case 0x21Du:
          result = &texFormatRGB8_422_2PLANE;
          break;
        case 0x21Eu:
          result = &texFormatRGB8_444_2PLANE;
          break;
        case 0x21Fu:
          result = &texFormatRGB10_420_2PLANE;
          break;
        case 0x220u:
          result = &texFormatRGB10_422_2PLANE;
          break;
        case 0x221u:
          result = &texFormatRGB10_444_2PLANE;
          break;
        case 0x222u:
          result = &texFormatRGB10_420_2PLANE_PACKED;
          break;
        case 0x223u:
          result = &texFormatRGB10_422_2PLANE_PACKED;
          break;
        case 0x224u:
          result = &texFormatRGB10_444_2PLANE_PACKED;
          break;
        case 0x226u:
          result = &texFormatXRRGB10_PLANE_A8_PLANE;
          break;
        case 0x227u:
          result = &texFormatXRSRGB10_PLANE_A8_PLANE;
          break;
        case 0x228u:
          result = &texFormatARGBV16_XR10;
          break;
        case 0x229u:
          result = &texFormatsARGBV16_XR10;
          break;
        case 0x22Au:
          result = &texFormatXRRGB10;
          break;
        case 0x22Bu:
          result = &texFormatXRSRGB10;
          break;
        case 0x230u:
          result = &texFormatYCBCR8A8_444_1PLANE;
          break;
        case 0x232u:
          result = &texFormatYCBCR8_422_1PLANE_REV;
          break;
        case 0x233u:
          result = &texFormatpqYCBCR10_444_1PLANE;
          break;
        case 0x234u:
          result = &texFormatpqYCBCR10_420_2PLANE;
          break;
        case 0x235u:
          result = &texFormatpqYCBCR10_422_2PLANE;
          break;
        case 0x236u:
          result = &texFormatpqYCBCR10_444_2PLANE;
          break;
        case 0x237u:
          result = &texFormatpqYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x238u:
          result = &texFormatpqYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x239u:
          result = &texFormatpqYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x23Au:
          result = &texFormatYCBCR12_420_2PLANE;
          break;
        case 0x23Bu:
          result = &texFormatYCBCR12_422_2PLANE;
          break;
        case 0x23Cu:
          result = &texFormatYCBCR12_444_2PLANE;
          break;
        case 0x23Du:
          result = &texFormatpqYCBCR12_420_2PLANE;
          break;
        case 0x23Eu:
          result = &texFormatpqYCBCR12_422_2PLANE;
          break;
        case 0x23Fu:
          result = &texFormatpqYCBCR12_444_2PLANE;
          break;
        case 0x240u:
          result = &texFormatR10X6F;
          break;
        case 0x241u:
          result = &texFormatsR10X6F;
          break;
        case 0x242u:
          result = &texFormatRG10X12F;
          break;
        case 0x243u:
          result = &texFormatsRG10X12F;
          break;
        case 0x244u:
          result = &texFormatYCBCR12_420_2PLANE_PACKED;
          break;
        case 0x245u:
          result = &texFormatYCBCR12_422_2PLANE_PACKED;
          break;
        case 0x246u:
          result = &texFormatYCBCR12_444_2PLANE_PACKED;
          break;
        case 0x247u:
          result = &texFormatpqYCBCR12_420_2PLANE_PACKED;
          break;
        case 0x248u:
          result = &texFormatpqYCBCR12_422_2PLANE_PACKED;
          break;
        case 0x249u:
          result = &texFormatpqYCBCR12_444_2PLANE_PACKED;
          break;
        case 0x24Au:
          result = &texFormatsRGB10_A2;
          break;
        case 0x24Bu:
          result = &texFormatpqRGB10_A2;
          break;
        case 0x24Cu:
          result = &texFormatR10_1PLANE_PACKED;
          break;
        case 0x24Du:
          result = &texFormatRG10_1PLANE_PACKED;
          break;
        case 0x24Eu:
          result = &texFormatYCBCR10_444_1PLANE_XR;
          break;
        case 0x24Fu:
          result = &texFormatYCBCR10_420_2PLANE_XR;
          break;
        case 0x250u:
          result = &texFormatYCBCR10_422_2PLANE_XR;
          break;
        case 0x251u:
          result = &texFormatYCBCR10_444_2PLANE_XR;
          break;
        case 0x252u:
          result = &texFormatYCBCR10_420_2PLANE_PACKED_XR;
          break;
        case 0x253u:
          result = &texFormatYCBCR10_422_2PLANE_PACKED_XR;
          break;
        case 0x254u:
          result = &texFormatYCBCR10_444_2PLANE_PACKED_XR;
          break;
        case 0x255u:
          result = &texFormatYCBCR12_420_2PLANE_XR;
          break;
        case 0x256u:
          result = &texFormatYCBCR12_422_2PLANE_XR;
          break;
        case 0x257u:
          result = &texFormatYCBCR12_444_2PLANE_XR;
          break;
        case 0x258u:
          result = &texFormatYCBCR12_420_2PLANE_PACKED_XR;
          break;
        case 0x259u:
          result = &texFormatYCBCR12_422_2PLANE_PACKED_XR;
          break;
        case 0x25Au:
          result = &texFormatYCBCR12_444_2PLANE_PACKED_XR;
          break;
        case 0x25Bu:
          result = &texFormatR12X4U;
          break;
        case 0x25Cu:
          result = &texFormatpqR12X4U;
          break;
        case 0x25Du:
          result = &texFormatRG12X8U;
          break;
        case 0x25Eu:
          result = &texFormatpqR10X6U;
          break;
        case 0x274u:
          result = &texFormatsBGR10_A2;
          break;
        case 0x275u:
          result = &texFormatpqBGR10_A2;
          break;
        default:
          goto LABEL_164;
      }
      break;
  }
  return result;
}

void *AGX::G14::TextureFormatTable::chooseTextureFormatCPP(AGX::G14::TextureFormatTable *this, MTLPixelFormat a2)
{
  int v2;
  void *result;

  v2 = (_DWORD)this - 1;
  result = &texFormatA8;
  switch(v2)
  {
    case 0:
      return result;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 20:
    case 26:
    case 27:
    case 28:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 55:
    case 56:
    case 57:
    case 58:
    case 60:
    case 66:
    case 67:
    case 68:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 81:
    case 82:
    case 85:
    case 86:
    case 87:
    case 88:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 105:
    case 106:
    case 107:
    case 108:
    case 110:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 125:
    case 126:
    case 127:
    case 128:
    case 135:
    case 136:
    case 137:
    case 138:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 167:
    case 168:
    case 170:
    case 172:
    case 174:
    case 176:
    case 183:
    case 200:
    case 201:
    case 218:
    case 219:
    case 236:
    case 237:
    case 238:
    case 241:
    case 242:
    case 243:
    case 244:
    case 245:
    case 246:
    case 247:
    case 248:
    case 250:
    case 253:
    case 254:
    case 255:
    case 256:
    case 257:
    case 258:
    case 261:
    case 262:
    case 263:
    case 264:
    case 265:
    case 266:
    case 267:
    case 268:
    case 269:
    case 270:
    case 271:
    case 272:
    case 273:
    case 274:
    case 275:
    case 276:
    case 277:
    case 278:
    case 279:
    case 280:
    case 281:
    case 282:
    case 283:
    case 284:
    case 285:
    case 286:
    case 287:
    case 288:
    case 289:
    case 290:
    case 291:
    case 292:
    case 293:
    case 294:
    case 295:
    case 296:
    case 297:
    case 298:
    case 304:
    case 305:
    case 306:
    case 307:
    case 308:
    case 309:
    case 310:
    case 311:
    case 315:
    case 316:
    case 317:
    case 318:
    case 319:
    case 320:
    case 321:
LABEL_167:
      result = &texFormatUnsupported;
      break;
    case 9:
      result = &texFormatR8;
      break;
    case 10:
      result = &texFormatsR8;
      break;
    case 11:
      result = &texFormatR8_SNORM;
      break;
    case 12:
      result = &texFormatR8UI;
      break;
    case 13:
      result = &texFormatR8I;
      break;
    case 19:
      result = &texFormatR16;
      break;
    case 21:
      result = &texFormatR16_SNORM;
      break;
    case 22:
      result = &texFormatR16UI;
      break;
    case 23:
      result = &texFormatR16I;
      break;
    case 24:
      result = &texFormatR16F;
      break;
    case 25:
      result = &texFormatR16BF;
      break;
    case 29:
      result = &texFormatRG8;
      break;
    case 30:
      result = &texFormatsRG8;
      break;
    case 31:
      result = &texFormatRG8_SNORM;
      break;
    case 32:
      result = &texFormatRG8UI;
      break;
    case 33:
      result = &texFormatRG8I;
      break;
    case 39:
      result = &texFormatRGB565;
      break;
    case 40:
      result = &texFormatRGB5A1;
      break;
    case 41:
      result = &texFormatRGBA4;
      break;
    case 42:
      result = &texFormatA1RGB5;
      break;
    case 43:
      result = &texFormatBGRA4;
      break;
    case 52:
      result = &texFormatR32UI;
      break;
    case 53:
      result = &texFormatR32I;
      break;
    case 54:
      result = &texFormatR32F;
      break;
    case 59:
      result = &texFormatRG16;
      break;
    case 61:
      result = &texFormatRG16_SNORM;
      break;
    case 62:
      result = &texFormatRG16UI;
      break;
    case 63:
      result = &texFormatRG16I;
      break;
    case 64:
      result = &texFormatRG16F;
      break;
    case 65:
      result = &texFormatRG16BF;
      break;
    case 69:
      result = &texFormatRGBA8;
      break;
    case 70:
      result = &texFormatsRGBA8;
      break;
    case 71:
      result = &texFormatRGBA8_SNORM;
      break;
    case 72:
      result = &texFormatRGBA8UI;
      break;
    case 73:
      result = &texFormatRGBA8I;
      break;
    case 79:
      result = &texFormatBGRA8;
      break;
    case 80:
      result = &texFormatsBGRA8;
      break;
    case 83:
      result = &texFormatARGB8;
      break;
    case 84:
      result = &texFormatsARGB8;
      break;
    case 89:
      result = &texFormatRGB10_A2;
      break;
    case 90:
      result = &texFormatRGB10_A2UI;
      break;
    case 91:
      result = &texFormatR11FG11FB10F;
      break;
    case 92:
      result = &texFormatRGB9_E5;
      break;
    case 93:
      result = &texFormatBGR10_A2;
      break;
    case 102:
      result = &texFormatRG32UI;
      break;
    case 103:
      result = &texFormatRG32I;
      break;
    case 104:
      result = &texFormatRG32F;
      break;
    case 109:
      result = &texFormatRGBA16;
      break;
    case 111:
      result = &texFormatRGBA16_SNORM;
      break;
    case 112:
      result = &texFormatRGBA16UI;
      break;
    case 113:
      result = &texFormatRGBA16I;
      break;
    case 114:
      result = &texFormatRGBA16F;
      break;
    case 115:
      result = &texFormatRGBA16BF;
      break;
    case 122:
      result = &texFormatRGBA32UI;
      break;
    case 123:
      result = &texFormatRGBA32I;
      break;
    case 124:
      result = &texFormatRGBA32F;
      break;
    case 129:
      result = &texFormatBC1_RGBA_UNORM;
      break;
    case 130:
      result = &texFormatBC1_sRGBA_UNORM;
      break;
    case 131:
      result = &texFormatBC2_RGBA_UNORM;
      break;
    case 132:
      result = &texFormatBC2_sRGBA_UNORM;
      break;
    case 133:
      result = &texFormatBC3_RGBA_UNORM;
      break;
    case 134:
      result = &texFormatBC3_sRGBA_UNORM;
      break;
    case 139:
      result = &texFormatBC4_R_UNORM;
      break;
    case 140:
      result = &texFormatBC4_R_SNORM;
      break;
    case 141:
      result = &texFormatBC5_RG_UNORM;
      break;
    case 142:
      result = &texFormatBC5_RG_SNORM;
      break;
    case 149:
      result = &texFormatBC6H_RGB_FLOAT;
      break;
    case 150:
      result = &texFormatBC6H_RGB_UFLOAT;
      break;
    case 151:
      result = &texFormatBC7_RGBA_UNORM;
      break;
    case 152:
      result = &texFormatBC7_sRGBA_UNORM;
      break;
    case 159:
      result = &texFormatPVRTC2RGB;
      break;
    case 160:
      result = &texFormatPVRTC2sRGB;
      break;
    case 161:
      result = &texFormatPVRTC4RGB;
      break;
    case 162:
      result = &texFormatPVRTC4sRGB;
      break;
    case 163:
      result = &texFormatPVRTC2RGBA;
      break;
    case 164:
      result = &texFormatPVRTC2sRGBA;
      break;
    case 165:
      result = &texFormatPVRTC4RGBA;
      break;
    case 166:
      result = &texFormatPVRTC4sRGBA;
      break;
    case 169:
      result = &texFormatR11EAC;
      break;
    case 171:
      result = &texFormatR11EAC_SNORM;
      break;
    case 173:
      result = &texFormatRG11EAC;
      break;
    case 175:
      result = &texFormatRG11EAC_SNORM;
      break;
    case 177:
      result = &texFormatETC2RGBA8;
      break;
    case 178:
      result = &texFormatETC2sRGBA8;
      break;
    case 179:
      result = &texFormatETC2RGB8;
      break;
    case 180:
      result = &texFormatETC2sRGB8;
      break;
    case 181:
      result = &texFormatETC2RGB8A1;
      break;
    case 182:
      result = &texFormatETC2sRGB8A1;
      break;
    case 184:
      result = &texFormatASTC4x2sRGBA_UNORM;
      break;
    case 185:
      result = &texFormatASTC4x4sRGBA_UNORM;
      break;
    case 186:
      result = &texFormatASTC5x4sRGBA_UNORM;
      break;
    case 187:
      result = &texFormatASTC5x5sRGBA_UNORM;
      break;
    case 188:
      result = &texFormatASTC6x5sRGBA_UNORM;
      break;
    case 189:
      result = &texFormatASTC6x6sRGBA_UNORM;
      break;
    case 190:
      result = &texFormatASTC8x4sRGBA_UNORM;
      break;
    case 191:
      result = &texFormatASTC8x5sRGBA_UNORM;
      break;
    case 192:
      result = &texFormatASTC8x6sRGBA_UNORM;
      break;
    case 193:
      result = &texFormatASTC8x8sRGBA_UNORM;
      break;
    case 194:
      result = &texFormatASTC10x5sRGBA_UNORM;
      break;
    case 195:
      result = &texFormatASTC10x6sRGBA_UNORM;
      break;
    case 196:
      result = &texFormatASTC10x8sRGBA_UNORM;
      break;
    case 197:
      result = &texFormatASTC10x10sRGBA_UNORM;
      break;
    case 198:
      result = &texFormatASTC12x10sRGBA_UNORM;
      break;
    case 199:
      result = &texFormatASTC12x12sRGBA_UNORM;
      break;
    case 202:
      result = &texFormatASTC4x2RGBA_LP;
      break;
    case 203:
      result = &texFormatASTC4x4RGBA_LP;
      break;
    case 204:
      result = &texFormatASTC5x4RGBA_LP;
      break;
    case 205:
      result = &texFormatASTC5x5RGBA_LP;
      break;
    case 206:
      result = &texFormatASTC6x5RGBA_LP;
      break;
    case 207:
      result = &texFormatASTC6x6RGBA_LP;
      break;
    case 208:
      result = &texFormatASTC8x4RGBA_LP;
      break;
    case 209:
      result = &texFormatASTC8x5RGBA_LP;
      break;
    case 210:
      result = &texFormatASTC8x6RGBA_LP;
      break;
    case 211:
      result = &texFormatASTC8x8RGBA_LP;
      break;
    case 212:
      result = &texFormatASTC10x5RGBA_LP;
      break;
    case 213:
      result = &texFormatASTC10x6RGBA_LP;
      break;
    case 214:
      result = &texFormatASTC10x8RGBA_LP;
      break;
    case 215:
      result = &texFormatASTC10x10RGBA_LP;
      break;
    case 216:
      result = &texFormatASTC12x10RGBA_LP;
      break;
    case 217:
      result = &texFormatASTC12x12RGBA_LP;
      break;
    case 220:
      result = &texFormatASTC4x2RGBA;
      break;
    case 221:
      result = &texFormatASTC4x4RGBA;
      break;
    case 222:
      result = &texFormatASTC5x4RGBA;
      break;
    case 223:
      result = &texFormatASTC5x5RGBA;
      break;
    case 224:
      result = &texFormatASTC6x5RGBA;
      break;
    case 225:
      result = &texFormatASTC6x6RGBA;
      break;
    case 226:
      result = &texFormatASTC8x4RGBA;
      break;
    case 227:
      result = &texFormatASTC8x5RGBA;
      break;
    case 228:
      result = &texFormatASTC8x6RGBA;
      break;
    case 229:
      result = &texFormatASTC8x8RGBA;
      break;
    case 230:
      result = &texFormatASTC10x5RGBA;
      break;
    case 231:
      result = &texFormatASTC10x6RGBA;
      break;
    case 232:
      result = &texFormatASTC10x8RGBA;
      break;
    case 233:
      result = &texFormatASTC10x10RGBA;
      break;
    case 234:
      result = &texFormatASTC12x10RGBA;
      break;
    case 235:
      result = &texFormatASTC12x12RGBA;
      break;
    case 239:
      result = &texFormatYUY2_RGB;
      break;
    case 240:
      result = &texFormatUYVY_RGB;
      break;
    case 249:
      result = &texFormatD16;
      break;
    case 251:
      result = &texFormatD32;
      break;
    case 252:
    case 260:
      result = &texFormatS8;
      break;
    case 259:
      result = &texFormatD32FS8_2PLANE;
      break;
    case 299:
      result = &texFormatRGB8;
      break;
    case 300:
      result = &texFormatsRGB8;
      break;
    case 301:
      result = &texFormatRGB8_SNORM;
      break;
    case 302:
      result = &texFormatRGB8UI;
      break;
    case 303:
      result = &texFormatRGB8I;
      break;
    case 312:
      result = &texFormatRGBX16UI;
      break;
    case 313:
      result = &texFormatRGBX16I;
      break;
    case 314:
      result = &texFormatRGBX16F;
      break;
    case 322:
      result = &texFormatRGBX32UI;
      break;
    case 323:
      result = &texFormatRGBX32I;
      break;
    case 324:
      result = &texFormatRGBX32F;
      break;
    default:
      switch(&texFormatA8)
      {
        case 0x1F4u:
          result = &texFormatYCBCR8_420_2PLANE;
          break;
        case 0x1F5u:
          result = &texFormatYCBCR8_422_1PLANE;
          break;
        case 0x1F6u:
          result = &texFormatYCBCR8_422_2PLANE;
          break;
        case 0x1F7u:
          result = &texFormatYCBCR8_444_2PLANE;
          break;
        case 0x1F8u:
          result = &texFormatYCBCR10_444_1PLANE;
          break;
        case 0x1F9u:
          result = &texFormatYCBCR10_420_2PLANE;
          break;
        case 0x1FAu:
          result = &texFormatYCBCR10_422_2PLANE;
          break;
        case 0x1FBu:
          result = &texFormatYCBCR10_444_2PLANE;
          break;
        case 0x1FCu:
          result = &texFormatYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x1FDu:
          result = &texFormatYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x1FEu:
          result = &texFormatYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x208u:
          result = &texFormatsYCBCR8_420_2PLANE;
          break;
        case 0x209u:
          result = &texFormatsYCBCR8_422_1PLANE;
          break;
        case 0x20Au:
          result = &texFormatsYCBCR8_422_2PLANE;
          break;
        case 0x20Bu:
          result = &texFormatsYCBCR8_444_2PLANE;
          break;
        case 0x20Cu:
          result = &texFormatsYCBCR10_444_1PLANE;
          break;
        case 0x20Du:
          result = &texFormatsYCBCR10_420_2PLANE;
          break;
        case 0x20Eu:
          result = &texFormatsYCBCR10_422_2PLANE;
          break;
        case 0x20Fu:
          result = &texFormatsYCBCR10_444_2PLANE;
          break;
        case 0x210u:
          result = &texFormatsYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x211u:
          result = &texFormatsYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x212u:
          result = &texFormatsYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x21Cu:
          result = &texFormatRGB8_420_2PLANE;
          break;
        case 0x21Du:
          result = &texFormatRGB8_422_2PLANE;
          break;
        case 0x21Eu:
          result = &texFormatRGB8_444_2PLANE;
          break;
        case 0x21Fu:
          result = &texFormatRGB10_420_2PLANE;
          break;
        case 0x220u:
          result = &texFormatRGB10_422_2PLANE;
          break;
        case 0x221u:
          result = &texFormatRGB10_444_2PLANE;
          break;
        case 0x222u:
          result = &texFormatRGB10_420_2PLANE_PACKED;
          break;
        case 0x223u:
          result = &texFormatRGB10_422_2PLANE_PACKED;
          break;
        case 0x224u:
          result = &texFormatRGB10_444_2PLANE_PACKED;
          break;
        case 0x226u:
          result = &texFormatXRRGB10_PLANE_A8_PLANE;
          break;
        case 0x227u:
          result = &texFormatXRSRGB10_PLANE_A8_PLANE;
          break;
        case 0x228u:
          result = &texFormatARGBV16_XR10;
          break;
        case 0x229u:
          result = &texFormatsARGBV16_XR10;
          break;
        case 0x22Au:
          result = &texFormatXRRGB10;
          break;
        case 0x22Bu:
          result = &texFormatXRSRGB10;
          break;
        case 0x22Cu:
          result = &texFormatRGBA16F_XR;
          break;
        case 0x230u:
          result = &texFormatYCBCR8A8_444_1PLANE;
          break;
        case 0x232u:
          result = &texFormatYCBCR8_422_1PLANE_REV;
          break;
        case 0x233u:
          result = &texFormatpqYCBCR10_444_1PLANE;
          break;
        case 0x234u:
          result = &texFormatpqYCBCR10_420_2PLANE;
          break;
        case 0x235u:
          result = &texFormatpqYCBCR10_422_2PLANE;
          break;
        case 0x236u:
          result = &texFormatpqYCBCR10_444_2PLANE;
          break;
        case 0x237u:
          result = &texFormatpqYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x238u:
          result = &texFormatpqYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x239u:
          result = &texFormatpqYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x23Au:
          result = &texFormatYCBCR12_420_2PLANE;
          break;
        case 0x23Bu:
          result = &texFormatYCBCR12_422_2PLANE;
          break;
        case 0x23Cu:
          result = &texFormatYCBCR12_444_2PLANE;
          break;
        case 0x23Du:
          result = &texFormatpqYCBCR12_420_2PLANE;
          break;
        case 0x23Eu:
          result = &texFormatpqYCBCR12_422_2PLANE;
          break;
        case 0x23Fu:
          result = &texFormatpqYCBCR12_444_2PLANE;
          break;
        case 0x240u:
          result = &texFormatR10X6F;
          break;
        case 0x241u:
          result = &texFormatsR10X6F;
          break;
        case 0x242u:
          result = &texFormatRG10X12F;
          break;
        case 0x243u:
          result = &texFormatsRG10X12F;
          break;
        case 0x244u:
          result = &texFormatYCBCR12_420_2PLANE_PACKED;
          break;
        case 0x245u:
          result = &texFormatYCBCR12_422_2PLANE_PACKED;
          break;
        case 0x246u:
          result = &texFormatYCBCR12_444_2PLANE_PACKED;
          break;
        case 0x247u:
          result = &texFormatpqYCBCR12_420_2PLANE_PACKED;
          break;
        case 0x248u:
          result = &texFormatpqYCBCR12_422_2PLANE_PACKED;
          break;
        case 0x249u:
          result = &texFormatpqYCBCR12_444_2PLANE_PACKED;
          break;
        case 0x24Au:
          result = &texFormatsRGB10_A2;
          break;
        case 0x24Bu:
          result = &texFormatpqRGB10_A2;
          break;
        case 0x24Cu:
          result = &texFormatR10_1PLANE_PACKED;
          break;
        case 0x24Du:
          result = &texFormatRG10_1PLANE_PACKED;
          break;
        case 0x24Eu:
          result = &texFormatYCBCR10_444_1PLANE_XR;
          break;
        case 0x24Fu:
          result = &texFormatYCBCR10_420_2PLANE_XR;
          break;
        case 0x250u:
          result = &texFormatYCBCR10_422_2PLANE_XR;
          break;
        case 0x251u:
          result = &texFormatYCBCR10_444_2PLANE_XR;
          break;
        case 0x252u:
          result = &texFormatYCBCR10_420_2PLANE_PACKED_XR;
          break;
        case 0x253u:
          result = &texFormatYCBCR10_422_2PLANE_PACKED_XR;
          break;
        case 0x254u:
          result = &texFormatYCBCR10_444_2PLANE_PACKED_XR;
          break;
        case 0x255u:
          result = &texFormatYCBCR12_420_2PLANE_XR;
          break;
        case 0x256u:
          result = &texFormatYCBCR12_422_2PLANE_XR;
          break;
        case 0x257u:
          result = &texFormatYCBCR12_444_2PLANE_XR;
          break;
        case 0x258u:
          result = &texFormatYCBCR12_420_2PLANE_PACKED_XR;
          break;
        case 0x259u:
          result = &texFormatYCBCR12_422_2PLANE_PACKED_XR;
          break;
        case 0x25Au:
          result = &texFormatYCBCR12_444_2PLANE_PACKED_XR;
          break;
        case 0x25Bu:
          result = &texFormatR12X4U;
          break;
        case 0x25Cu:
          result = &texFormatpqR12X4U;
          break;
        case 0x25Du:
          result = &texFormatRG12X8U;
          break;
        case 0x25Eu:
          result = &texFormatpqR10X6U;
          break;
        case 0x274u:
          result = &texFormatsBGR10_A2;
          break;
        case 0x275u:
          result = &texFormatpqBGR10_A2;
          break;
        default:
          goto LABEL_167;
      }
      break;
  }
  return result;
}

void *AGX::G14X::TextureFormatTable::chooseTextureFormatCPP(AGX::G14X::TextureFormatTable *this, MTLPixelFormat a2)
{
  int v2;
  void *result;

  v2 = (_DWORD)this - 1;
  result = &texFormatA8;
  switch(v2)
  {
    case 0:
      return result;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 20:
    case 26:
    case 27:
    case 28:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 55:
    case 56:
    case 57:
    case 58:
    case 60:
    case 66:
    case 67:
    case 68:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 81:
    case 82:
    case 85:
    case 86:
    case 87:
    case 88:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 105:
    case 106:
    case 107:
    case 108:
    case 110:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 125:
    case 126:
    case 127:
    case 128:
    case 135:
    case 136:
    case 137:
    case 138:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 167:
    case 168:
    case 170:
    case 172:
    case 174:
    case 176:
    case 183:
    case 200:
    case 201:
    case 218:
    case 219:
    case 236:
    case 237:
    case 238:
    case 241:
    case 242:
    case 243:
    case 244:
    case 245:
    case 246:
    case 247:
    case 248:
    case 250:
    case 253:
    case 254:
    case 255:
    case 256:
    case 257:
    case 258:
    case 261:
    case 262:
    case 263:
    case 264:
    case 265:
    case 266:
    case 267:
    case 268:
    case 269:
    case 270:
    case 271:
    case 272:
    case 273:
    case 274:
    case 275:
    case 276:
    case 277:
    case 278:
    case 279:
    case 280:
    case 281:
    case 282:
    case 283:
    case 284:
    case 285:
    case 286:
    case 287:
    case 288:
    case 289:
    case 290:
    case 291:
    case 292:
    case 293:
    case 294:
    case 295:
    case 296:
    case 297:
    case 298:
    case 304:
    case 305:
    case 306:
    case 307:
    case 308:
    case 309:
    case 310:
    case 311:
    case 315:
    case 316:
    case 317:
    case 318:
    case 319:
    case 320:
    case 321:
LABEL_167:
      result = &texFormatUnsupported;
      break;
    case 9:
      result = &texFormatR8;
      break;
    case 10:
      result = &texFormatsR8;
      break;
    case 11:
      result = &texFormatR8_SNORM;
      break;
    case 12:
      result = &texFormatR8UI;
      break;
    case 13:
      result = &texFormatR8I;
      break;
    case 19:
      result = &texFormatR16;
      break;
    case 21:
      result = &texFormatR16_SNORM;
      break;
    case 22:
      result = &texFormatR16UI;
      break;
    case 23:
      result = &texFormatR16I;
      break;
    case 24:
      result = &texFormatR16F;
      break;
    case 25:
      result = &texFormatR16BF;
      break;
    case 29:
      result = &texFormatRG8;
      break;
    case 30:
      result = &texFormatsRG8;
      break;
    case 31:
      result = &texFormatRG8_SNORM;
      break;
    case 32:
      result = &texFormatRG8UI;
      break;
    case 33:
      result = &texFormatRG8I;
      break;
    case 39:
      result = &texFormatRGB565;
      break;
    case 40:
      result = &texFormatRGB5A1;
      break;
    case 41:
      result = &texFormatRGBA4;
      break;
    case 42:
      result = &texFormatA1RGB5;
      break;
    case 43:
      result = &texFormatBGRA4;
      break;
    case 52:
      result = &texFormatR32UI;
      break;
    case 53:
      result = &texFormatR32I;
      break;
    case 54:
      result = &texFormatR32F;
      break;
    case 59:
      result = &texFormatRG16;
      break;
    case 61:
      result = &texFormatRG16_SNORM;
      break;
    case 62:
      result = &texFormatRG16UI;
      break;
    case 63:
      result = &texFormatRG16I;
      break;
    case 64:
      result = &texFormatRG16F;
      break;
    case 65:
      result = &texFormatRG16BF;
      break;
    case 69:
      result = &texFormatRGBA8;
      break;
    case 70:
      result = &texFormatsRGBA8;
      break;
    case 71:
      result = &texFormatRGBA8_SNORM;
      break;
    case 72:
      result = &texFormatRGBA8UI;
      break;
    case 73:
      result = &texFormatRGBA8I;
      break;
    case 79:
      result = &texFormatBGRA8;
      break;
    case 80:
      result = &texFormatsBGRA8;
      break;
    case 83:
      result = &texFormatARGB8;
      break;
    case 84:
      result = &texFormatsARGB8;
      break;
    case 89:
      result = &texFormatRGB10_A2;
      break;
    case 90:
      result = &texFormatRGB10_A2UI;
      break;
    case 91:
      result = &texFormatR11FG11FB10F;
      break;
    case 92:
      result = &texFormatRGB9_E5;
      break;
    case 93:
      result = &texFormatBGR10_A2;
      break;
    case 102:
      result = &texFormatRG32UI;
      break;
    case 103:
      result = &texFormatRG32I;
      break;
    case 104:
      result = &texFormatRG32F;
      break;
    case 109:
      result = &texFormatRGBA16;
      break;
    case 111:
      result = &texFormatRGBA16_SNORM;
      break;
    case 112:
      result = &texFormatRGBA16UI;
      break;
    case 113:
      result = &texFormatRGBA16I;
      break;
    case 114:
      result = &texFormatRGBA16F;
      break;
    case 115:
      result = &texFormatRGBA16BF;
      break;
    case 122:
      result = &texFormatRGBA32UI;
      break;
    case 123:
      result = &texFormatRGBA32I;
      break;
    case 124:
      result = &texFormatRGBA32F;
      break;
    case 129:
      result = &texFormatBC1_RGBA_UNORM;
      break;
    case 130:
      result = &texFormatBC1_sRGBA_UNORM;
      break;
    case 131:
      result = &texFormatBC2_RGBA_UNORM;
      break;
    case 132:
      result = &texFormatBC2_sRGBA_UNORM;
      break;
    case 133:
      result = &texFormatBC3_RGBA_UNORM;
      break;
    case 134:
      result = &texFormatBC3_sRGBA_UNORM;
      break;
    case 139:
      result = &texFormatBC4_R_UNORM;
      break;
    case 140:
      result = &texFormatBC4_R_SNORM;
      break;
    case 141:
      result = &texFormatBC5_RG_UNORM;
      break;
    case 142:
      result = &texFormatBC5_RG_SNORM;
      break;
    case 149:
      result = &texFormatBC6H_RGB_FLOAT;
      break;
    case 150:
      result = &texFormatBC6H_RGB_UFLOAT;
      break;
    case 151:
      result = &texFormatBC7_RGBA_UNORM;
      break;
    case 152:
      result = &texFormatBC7_sRGBA_UNORM;
      break;
    case 159:
      result = &texFormatPVRTC2RGB;
      break;
    case 160:
      result = &texFormatPVRTC2sRGB;
      break;
    case 161:
      result = &texFormatPVRTC4RGB;
      break;
    case 162:
      result = &texFormatPVRTC4sRGB;
      break;
    case 163:
      result = &texFormatPVRTC2RGBA;
      break;
    case 164:
      result = &texFormatPVRTC2sRGBA;
      break;
    case 165:
      result = &texFormatPVRTC4RGBA;
      break;
    case 166:
      result = &texFormatPVRTC4sRGBA;
      break;
    case 169:
      result = &texFormatR11EAC;
      break;
    case 171:
      result = &texFormatR11EAC_SNORM;
      break;
    case 173:
      result = &texFormatRG11EAC;
      break;
    case 175:
      result = &texFormatRG11EAC_SNORM;
      break;
    case 177:
      result = &texFormatETC2RGBA8;
      break;
    case 178:
      result = &texFormatETC2sRGBA8;
      break;
    case 179:
      result = &texFormatETC2RGB8;
      break;
    case 180:
      result = &texFormatETC2sRGB8;
      break;
    case 181:
      result = &texFormatETC2RGB8A1;
      break;
    case 182:
      result = &texFormatETC2sRGB8A1;
      break;
    case 184:
      result = &texFormatASTC4x2sRGBA_UNORM;
      break;
    case 185:
      result = &texFormatASTC4x4sRGBA_UNORM;
      break;
    case 186:
      result = &texFormatASTC5x4sRGBA_UNORM;
      break;
    case 187:
      result = &texFormatASTC5x5sRGBA_UNORM;
      break;
    case 188:
      result = &texFormatASTC6x5sRGBA_UNORM;
      break;
    case 189:
      result = &texFormatASTC6x6sRGBA_UNORM;
      break;
    case 190:
      result = &texFormatASTC8x4sRGBA_UNORM;
      break;
    case 191:
      result = &texFormatASTC8x5sRGBA_UNORM;
      break;
    case 192:
      result = &texFormatASTC8x6sRGBA_UNORM;
      break;
    case 193:
      result = &texFormatASTC8x8sRGBA_UNORM;
      break;
    case 194:
      result = &texFormatASTC10x5sRGBA_UNORM;
      break;
    case 195:
      result = &texFormatASTC10x6sRGBA_UNORM;
      break;
    case 196:
      result = &texFormatASTC10x8sRGBA_UNORM;
      break;
    case 197:
      result = &texFormatASTC10x10sRGBA_UNORM;
      break;
    case 198:
      result = &texFormatASTC12x10sRGBA_UNORM;
      break;
    case 199:
      result = &texFormatASTC12x12sRGBA_UNORM;
      break;
    case 202:
      result = &texFormatASTC4x2RGBA_LP;
      break;
    case 203:
      result = &texFormatASTC4x4RGBA_LP;
      break;
    case 204:
      result = &texFormatASTC5x4RGBA_LP;
      break;
    case 205:
      result = &texFormatASTC5x5RGBA_LP;
      break;
    case 206:
      result = &texFormatASTC6x5RGBA_LP;
      break;
    case 207:
      result = &texFormatASTC6x6RGBA_LP;
      break;
    case 208:
      result = &texFormatASTC8x4RGBA_LP;
      break;
    case 209:
      result = &texFormatASTC8x5RGBA_LP;
      break;
    case 210:
      result = &texFormatASTC8x6RGBA_LP;
      break;
    case 211:
      result = &texFormatASTC8x8RGBA_LP;
      break;
    case 212:
      result = &texFormatASTC10x5RGBA_LP;
      break;
    case 213:
      result = &texFormatASTC10x6RGBA_LP;
      break;
    case 214:
      result = &texFormatASTC10x8RGBA_LP;
      break;
    case 215:
      result = &texFormatASTC10x10RGBA_LP;
      break;
    case 216:
      result = &texFormatASTC12x10RGBA_LP;
      break;
    case 217:
      result = &texFormatASTC12x12RGBA_LP;
      break;
    case 220:
      result = &texFormatASTC4x2RGBA;
      break;
    case 221:
      result = &texFormatASTC4x4RGBA;
      break;
    case 222:
      result = &texFormatASTC5x4RGBA;
      break;
    case 223:
      result = &texFormatASTC5x5RGBA;
      break;
    case 224:
      result = &texFormatASTC6x5RGBA;
      break;
    case 225:
      result = &texFormatASTC6x6RGBA;
      break;
    case 226:
      result = &texFormatASTC8x4RGBA;
      break;
    case 227:
      result = &texFormatASTC8x5RGBA;
      break;
    case 228:
      result = &texFormatASTC8x6RGBA;
      break;
    case 229:
      result = &texFormatASTC8x8RGBA;
      break;
    case 230:
      result = &texFormatASTC10x5RGBA;
      break;
    case 231:
      result = &texFormatASTC10x6RGBA;
      break;
    case 232:
      result = &texFormatASTC10x8RGBA;
      break;
    case 233:
      result = &texFormatASTC10x10RGBA;
      break;
    case 234:
      result = &texFormatASTC12x10RGBA;
      break;
    case 235:
      result = &texFormatASTC12x12RGBA;
      break;
    case 239:
      result = &texFormatYUY2_RGB;
      break;
    case 240:
      result = &texFormatUYVY_RGB;
      break;
    case 249:
      result = &texFormatD16;
      break;
    case 251:
      result = &texFormatD32;
      break;
    case 252:
    case 260:
      result = &texFormatS8;
      break;
    case 259:
      result = &texFormatD32FS8_2PLANE;
      break;
    case 299:
      result = &texFormatRGB8;
      break;
    case 300:
      result = &texFormatsRGB8;
      break;
    case 301:
      result = &texFormatRGB8_SNORM;
      break;
    case 302:
      result = &texFormatRGB8UI;
      break;
    case 303:
      result = &texFormatRGB8I;
      break;
    case 312:
      result = &texFormatRGBX16UI;
      break;
    case 313:
      result = &texFormatRGBX16I;
      break;
    case 314:
      result = &texFormatRGBX16F;
      break;
    case 322:
      result = &texFormatRGBX32UI;
      break;
    case 323:
      result = &texFormatRGBX32I;
      break;
    case 324:
      result = &texFormatRGBX32F;
      break;
    default:
      switch(&texFormatA8)
      {
        case 0x1F4u:
          result = &texFormatYCBCR8_420_2PLANE;
          break;
        case 0x1F5u:
          result = &texFormatYCBCR8_422_1PLANE;
          break;
        case 0x1F6u:
          result = &texFormatYCBCR8_422_2PLANE;
          break;
        case 0x1F7u:
          result = &texFormatYCBCR8_444_2PLANE;
          break;
        case 0x1F8u:
          result = &texFormatYCBCR10_444_1PLANE;
          break;
        case 0x1F9u:
          result = &texFormatYCBCR10_420_2PLANE;
          break;
        case 0x1FAu:
          result = &texFormatYCBCR10_422_2PLANE;
          break;
        case 0x1FBu:
          result = &texFormatYCBCR10_444_2PLANE;
          break;
        case 0x1FCu:
          result = &texFormatYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x1FDu:
          result = &texFormatYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x1FEu:
          result = &texFormatYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x208u:
          result = &texFormatsYCBCR8_420_2PLANE;
          break;
        case 0x209u:
          result = &texFormatsYCBCR8_422_1PLANE;
          break;
        case 0x20Au:
          result = &texFormatsYCBCR8_422_2PLANE;
          break;
        case 0x20Bu:
          result = &texFormatsYCBCR8_444_2PLANE;
          break;
        case 0x20Cu:
          result = &texFormatsYCBCR10_444_1PLANE;
          break;
        case 0x20Du:
          result = &texFormatsYCBCR10_420_2PLANE;
          break;
        case 0x20Eu:
          result = &texFormatsYCBCR10_422_2PLANE;
          break;
        case 0x20Fu:
          result = &texFormatsYCBCR10_444_2PLANE;
          break;
        case 0x210u:
          result = &texFormatsYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x211u:
          result = &texFormatsYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x212u:
          result = &texFormatsYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x21Cu:
          result = &texFormatRGB8_420_2PLANE;
          break;
        case 0x21Du:
          result = &texFormatRGB8_422_2PLANE;
          break;
        case 0x21Eu:
          result = &texFormatRGB8_444_2PLANE;
          break;
        case 0x21Fu:
          result = &texFormatRGB10_420_2PLANE;
          break;
        case 0x220u:
          result = &texFormatRGB10_422_2PLANE;
          break;
        case 0x221u:
          result = &texFormatRGB10_444_2PLANE;
          break;
        case 0x222u:
          result = &texFormatRGB10_420_2PLANE_PACKED;
          break;
        case 0x223u:
          result = &texFormatRGB10_422_2PLANE_PACKED;
          break;
        case 0x224u:
          result = &texFormatRGB10_444_2PLANE_PACKED;
          break;
        case 0x226u:
          result = &texFormatXRRGB10_PLANE_A8_PLANE;
          break;
        case 0x227u:
          result = &texFormatXRSRGB10_PLANE_A8_PLANE;
          break;
        case 0x228u:
          result = &texFormatARGBV16_XR10;
          break;
        case 0x229u:
          result = &texFormatsARGBV16_XR10;
          break;
        case 0x22Au:
          result = &texFormatXRRGB10;
          break;
        case 0x22Bu:
          result = &texFormatXRSRGB10;
          break;
        case 0x230u:
          result = &texFormatYCBCR8A8_444_1PLANE;
          break;
        case 0x232u:
          result = &texFormatYCBCR8_422_1PLANE_REV;
          break;
        case 0x233u:
          result = &texFormatpqYCBCR10_444_1PLANE;
          break;
        case 0x234u:
          result = &texFormatpqYCBCR10_420_2PLANE;
          break;
        case 0x235u:
          result = &texFormatpqYCBCR10_422_2PLANE;
          break;
        case 0x236u:
          result = &texFormatpqYCBCR10_444_2PLANE;
          break;
        case 0x237u:
          result = &texFormatpqYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x238u:
          result = &texFormatpqYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x239u:
          result = &texFormatpqYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x23Au:
          result = &texFormatYCBCR12_420_2PLANE;
          break;
        case 0x23Bu:
          result = &texFormatYCBCR12_422_2PLANE;
          break;
        case 0x23Cu:
          result = &texFormatYCBCR12_444_2PLANE;
          break;
        case 0x23Du:
          result = &texFormatpqYCBCR12_420_2PLANE;
          break;
        case 0x23Eu:
          result = &texFormatpqYCBCR12_422_2PLANE;
          break;
        case 0x23Fu:
          result = &texFormatpqYCBCR12_444_2PLANE;
          break;
        case 0x240u:
          result = &texFormatR10X6F;
          break;
        case 0x241u:
          result = &texFormatsR10X6F;
          break;
        case 0x242u:
          result = &texFormatRG10X12F;
          break;
        case 0x243u:
          result = &texFormatsRG10X12F;
          break;
        case 0x244u:
          result = &texFormatYCBCR12_420_2PLANE_PACKED;
          break;
        case 0x245u:
          result = &texFormatYCBCR12_422_2PLANE_PACKED;
          break;
        case 0x246u:
          result = &texFormatYCBCR12_444_2PLANE_PACKED;
          break;
        case 0x247u:
          result = &texFormatpqYCBCR12_420_2PLANE_PACKED;
          break;
        case 0x248u:
          result = &texFormatpqYCBCR12_422_2PLANE_PACKED;
          break;
        case 0x249u:
          result = &texFormatpqYCBCR12_444_2PLANE_PACKED;
          break;
        case 0x24Au:
          result = &texFormatsRGB10_A2;
          break;
        case 0x24Bu:
          result = &texFormatpqRGB10_A2;
          break;
        case 0x24Cu:
          result = &texFormatR10_1PLANE_PACKED;
          break;
        case 0x24Du:
          result = &texFormatRG10_1PLANE_PACKED;
          break;
        case 0x24Eu:
          result = &texFormatYCBCR10_444_1PLANE_XR;
          break;
        case 0x24Fu:
          result = &texFormatYCBCR10_420_2PLANE_XR;
          break;
        case 0x250u:
          result = &texFormatYCBCR10_422_2PLANE_XR;
          break;
        case 0x251u:
          result = &texFormatYCBCR10_444_2PLANE_XR;
          break;
        case 0x252u:
          result = &texFormatYCBCR10_420_2PLANE_PACKED_XR;
          break;
        case 0x253u:
          result = &texFormatYCBCR10_422_2PLANE_PACKED_XR;
          break;
        case 0x254u:
          result = &texFormatYCBCR10_444_2PLANE_PACKED_XR;
          break;
        case 0x255u:
          result = &texFormatYCBCR12_420_2PLANE_XR;
          break;
        case 0x256u:
          result = &texFormatYCBCR12_422_2PLANE_XR;
          break;
        case 0x257u:
          result = &texFormatYCBCR12_444_2PLANE_XR;
          break;
        case 0x258u:
          result = &texFormatYCBCR12_420_2PLANE_PACKED_XR;
          break;
        case 0x259u:
          result = &texFormatYCBCR12_422_2PLANE_PACKED_XR;
          break;
        case 0x25Au:
          result = &texFormatYCBCR12_444_2PLANE_PACKED_XR;
          break;
        case 0x25Bu:
          result = &texFormatR12X4U;
          break;
        case 0x25Cu:
          result = &texFormatpqR12X4U;
          break;
        case 0x25Du:
          result = &texFormatRG12X8U;
          break;
        case 0x25Eu:
          result = &texFormatpqR10X6U;
          break;
        case 0x274u:
          result = &texFormatsBGR10_A2;
          break;
        case 0x275u:
          result = &texFormatpqBGR10_A2;
          break;
        default:
          goto LABEL_167;
      }
      break;
  }
  return result;
}

void *AGX::G15_AGX2::TextureFormatTable::chooseTextureFormatCPP(AGX::G15_AGX2::TextureFormatTable *this, MTLPixelFormat a2)
{
  int v2;
  void *result;

  v2 = (_DWORD)this - 1;
  result = &texFormatA8;
  switch(v2)
  {
    case 0:
      return result;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 20:
    case 26:
    case 27:
    case 28:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 55:
    case 56:
    case 57:
    case 58:
    case 60:
    case 66:
    case 67:
    case 68:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 81:
    case 82:
    case 85:
    case 86:
    case 87:
    case 88:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 105:
    case 106:
    case 107:
    case 108:
    case 110:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 125:
    case 126:
    case 127:
    case 128:
    case 135:
    case 136:
    case 137:
    case 138:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 167:
    case 168:
    case 170:
    case 172:
    case 174:
    case 176:
    case 183:
    case 200:
    case 201:
    case 218:
    case 219:
    case 236:
    case 237:
    case 238:
    case 241:
    case 242:
    case 243:
    case 244:
    case 245:
    case 246:
    case 247:
    case 248:
    case 250:
    case 253:
    case 254:
    case 255:
    case 256:
    case 257:
    case 258:
    case 261:
    case 262:
    case 263:
    case 264:
    case 265:
    case 266:
    case 267:
    case 268:
    case 269:
    case 270:
    case 271:
    case 272:
    case 273:
    case 274:
    case 275:
    case 276:
    case 277:
    case 278:
    case 279:
    case 280:
    case 281:
    case 282:
    case 283:
    case 284:
    case 285:
    case 286:
    case 287:
    case 288:
    case 289:
    case 290:
    case 291:
    case 292:
    case 293:
    case 294:
    case 295:
    case 296:
    case 297:
    case 298:
    case 304:
    case 305:
    case 306:
    case 307:
    case 308:
    case 309:
    case 310:
    case 311:
    case 315:
    case 316:
    case 317:
    case 318:
    case 319:
    case 320:
    case 321:
LABEL_167:
      result = &texFormatUnsupported;
      break;
    case 9:
      result = &texFormatR8;
      break;
    case 10:
      result = &texFormatsR8;
      break;
    case 11:
      result = &texFormatR8_SNORM;
      break;
    case 12:
      result = &texFormatR8UI;
      break;
    case 13:
      result = &texFormatR8I;
      break;
    case 19:
      result = &texFormatR16;
      break;
    case 21:
      result = &texFormatR16_SNORM;
      break;
    case 22:
      result = &texFormatR16UI;
      break;
    case 23:
      result = &texFormatR16I;
      break;
    case 24:
      result = &texFormatR16F;
      break;
    case 25:
      result = &texFormatR16BF;
      break;
    case 29:
      result = &texFormatRG8;
      break;
    case 30:
      result = &texFormatsRG8;
      break;
    case 31:
      result = &texFormatRG8_SNORM;
      break;
    case 32:
      result = &texFormatRG8UI;
      break;
    case 33:
      result = &texFormatRG8I;
      break;
    case 39:
      result = &texFormatRGB565;
      break;
    case 40:
      result = &texFormatRGB5A1;
      break;
    case 41:
      result = &texFormatRGBA4;
      break;
    case 42:
      result = &texFormatA1RGB5;
      break;
    case 43:
      result = &texFormatBGRA4;
      break;
    case 52:
      result = &texFormatR32UI;
      break;
    case 53:
      result = &texFormatR32I;
      break;
    case 54:
      result = &texFormatR32F;
      break;
    case 59:
      result = &texFormatRG16;
      break;
    case 61:
      result = &texFormatRG16_SNORM;
      break;
    case 62:
      result = &texFormatRG16UI;
      break;
    case 63:
      result = &texFormatRG16I;
      break;
    case 64:
      result = &texFormatRG16F;
      break;
    case 65:
      result = &texFormatRG16BF;
      break;
    case 69:
      result = &texFormatRGBA8;
      break;
    case 70:
      result = &texFormatsRGBA8;
      break;
    case 71:
      result = &texFormatRGBA8_SNORM;
      break;
    case 72:
      result = &texFormatRGBA8UI;
      break;
    case 73:
      result = &texFormatRGBA8I;
      break;
    case 79:
      result = &texFormatBGRA8;
      break;
    case 80:
      result = &texFormatsBGRA8;
      break;
    case 83:
      result = &texFormatARGB8;
      break;
    case 84:
      result = &texFormatsARGB8;
      break;
    case 89:
      result = &texFormatRGB10_A2;
      break;
    case 90:
      result = &texFormatRGB10_A2UI;
      break;
    case 91:
      result = &texFormatR11FG11FB10F;
      break;
    case 92:
      result = &texFormatRGB9_E5;
      break;
    case 93:
      result = &texFormatBGR10_A2;
      break;
    case 102:
      result = &texFormatRG32UI;
      break;
    case 103:
      result = &texFormatRG32I;
      break;
    case 104:
      result = &texFormatRG32F;
      break;
    case 109:
      result = &texFormatRGBA16;
      break;
    case 111:
      result = &texFormatRGBA16_SNORM;
      break;
    case 112:
      result = &texFormatRGBA16UI;
      break;
    case 113:
      result = &texFormatRGBA16I;
      break;
    case 114:
      result = &texFormatRGBA16F;
      break;
    case 115:
      result = &texFormatRGBA16BF;
      break;
    case 122:
      result = &texFormatRGBA32UI;
      break;
    case 123:
      result = &texFormatRGBA32I;
      break;
    case 124:
      result = &texFormatRGBA32F;
      break;
    case 129:
      result = &texFormatBC1_RGBA_UNORM;
      break;
    case 130:
      result = &texFormatBC1_sRGBA_UNORM;
      break;
    case 131:
      result = &texFormatBC2_RGBA_UNORM;
      break;
    case 132:
      result = &texFormatBC2_sRGBA_UNORM;
      break;
    case 133:
      result = &texFormatBC3_RGBA_UNORM;
      break;
    case 134:
      result = &texFormatBC3_sRGBA_UNORM;
      break;
    case 139:
      result = &texFormatBC4_R_UNORM;
      break;
    case 140:
      result = &texFormatBC4_R_SNORM;
      break;
    case 141:
      result = &texFormatBC5_RG_UNORM;
      break;
    case 142:
      result = &texFormatBC5_RG_SNORM;
      break;
    case 149:
      result = &texFormatBC6H_RGB_FLOAT;
      break;
    case 150:
      result = &texFormatBC6H_RGB_UFLOAT;
      break;
    case 151:
      result = &texFormatBC7_RGBA_UNORM;
      break;
    case 152:
      result = &texFormatBC7_sRGBA_UNORM;
      break;
    case 159:
      result = &texFormatPVRTC2RGB;
      break;
    case 160:
      result = &texFormatPVRTC2sRGB;
      break;
    case 161:
      result = &texFormatPVRTC4RGB;
      break;
    case 162:
      result = &texFormatPVRTC4sRGB;
      break;
    case 163:
      result = &texFormatPVRTC2RGBA;
      break;
    case 164:
      result = &texFormatPVRTC2sRGBA;
      break;
    case 165:
      result = &texFormatPVRTC4RGBA;
      break;
    case 166:
      result = &texFormatPVRTC4sRGBA;
      break;
    case 169:
      result = &texFormatR11EAC;
      break;
    case 171:
      result = &texFormatR11EAC_SNORM;
      break;
    case 173:
      result = &texFormatRG11EAC;
      break;
    case 175:
      result = &texFormatRG11EAC_SNORM;
      break;
    case 177:
      result = &texFormatETC2RGBA8;
      break;
    case 178:
      result = &texFormatETC2sRGBA8;
      break;
    case 179:
      result = &texFormatETC2RGB8;
      break;
    case 180:
      result = &texFormatETC2sRGB8;
      break;
    case 181:
      result = &texFormatETC2RGB8A1;
      break;
    case 182:
      result = &texFormatETC2sRGB8A1;
      break;
    case 184:
      result = &texFormatASTC4x2sRGBA_UNORM;
      break;
    case 185:
      result = &texFormatASTC4x4sRGBA_UNORM;
      break;
    case 186:
      result = &texFormatASTC5x4sRGBA_UNORM;
      break;
    case 187:
      result = &texFormatASTC5x5sRGBA_UNORM;
      break;
    case 188:
      result = &texFormatASTC6x5sRGBA_UNORM;
      break;
    case 189:
      result = &texFormatASTC6x6sRGBA_UNORM;
      break;
    case 190:
      result = &texFormatASTC8x4sRGBA_UNORM;
      break;
    case 191:
      result = &texFormatASTC8x5sRGBA_UNORM;
      break;
    case 192:
      result = &texFormatASTC8x6sRGBA_UNORM;
      break;
    case 193:
      result = &texFormatASTC8x8sRGBA_UNORM;
      break;
    case 194:
      result = &texFormatASTC10x5sRGBA_UNORM;
      break;
    case 195:
      result = &texFormatASTC10x6sRGBA_UNORM;
      break;
    case 196:
      result = &texFormatASTC10x8sRGBA_UNORM;
      break;
    case 197:
      result = &texFormatASTC10x10sRGBA_UNORM;
      break;
    case 198:
      result = &texFormatASTC12x10sRGBA_UNORM;
      break;
    case 199:
      result = &texFormatASTC12x12sRGBA_UNORM;
      break;
    case 202:
      result = &texFormatASTC4x2RGBA_LP;
      break;
    case 203:
      result = &texFormatASTC4x4RGBA_LP;
      break;
    case 204:
      result = &texFormatASTC5x4RGBA_LP;
      break;
    case 205:
      result = &texFormatASTC5x5RGBA_LP;
      break;
    case 206:
      result = &texFormatASTC6x5RGBA_LP;
      break;
    case 207:
      result = &texFormatASTC6x6RGBA_LP;
      break;
    case 208:
      result = &texFormatASTC8x4RGBA_LP;
      break;
    case 209:
      result = &texFormatASTC8x5RGBA_LP;
      break;
    case 210:
      result = &texFormatASTC8x6RGBA_LP;
      break;
    case 211:
      result = &texFormatASTC8x8RGBA_LP;
      break;
    case 212:
      result = &texFormatASTC10x5RGBA_LP;
      break;
    case 213:
      result = &texFormatASTC10x6RGBA_LP;
      break;
    case 214:
      result = &texFormatASTC10x8RGBA_LP;
      break;
    case 215:
      result = &texFormatASTC10x10RGBA_LP;
      break;
    case 216:
      result = &texFormatASTC12x10RGBA_LP;
      break;
    case 217:
      result = &texFormatASTC12x12RGBA_LP;
      break;
    case 220:
      result = &texFormatASTC4x2RGBA;
      break;
    case 221:
      result = &texFormatASTC4x4RGBA;
      break;
    case 222:
      result = &texFormatASTC5x4RGBA;
      break;
    case 223:
      result = &texFormatASTC5x5RGBA;
      break;
    case 224:
      result = &texFormatASTC6x5RGBA;
      break;
    case 225:
      result = &texFormatASTC6x6RGBA;
      break;
    case 226:
      result = &texFormatASTC8x4RGBA;
      break;
    case 227:
      result = &texFormatASTC8x5RGBA;
      break;
    case 228:
      result = &texFormatASTC8x6RGBA;
      break;
    case 229:
      result = &texFormatASTC8x8RGBA;
      break;
    case 230:
      result = &texFormatASTC10x5RGBA;
      break;
    case 231:
      result = &texFormatASTC10x6RGBA;
      break;
    case 232:
      result = &texFormatASTC10x8RGBA;
      break;
    case 233:
      result = &texFormatASTC10x10RGBA;
      break;
    case 234:
      result = &texFormatASTC12x10RGBA;
      break;
    case 235:
      result = &texFormatASTC12x12RGBA;
      break;
    case 239:
      result = &texFormatYUY2_RGB;
      break;
    case 240:
      result = &texFormatUYVY_RGB;
      break;
    case 249:
      result = &texFormatD16;
      break;
    case 251:
      result = &texFormatD32;
      break;
    case 252:
    case 260:
      result = &texFormatS8;
      break;
    case 259:
      result = &texFormatD32FS8_2PLANE;
      break;
    case 299:
      result = &texFormatRGB8;
      break;
    case 300:
      result = &texFormatsRGB8;
      break;
    case 301:
      result = &texFormatRGB8_SNORM;
      break;
    case 302:
      result = &texFormatRGB8UI;
      break;
    case 303:
      result = &texFormatRGB8I;
      break;
    case 312:
      result = &texFormatRGBX16UI;
      break;
    case 313:
      result = &texFormatRGBX16I;
      break;
    case 314:
      result = &texFormatRGBX16F;
      break;
    case 322:
      result = &texFormatRGBX32UI;
      break;
    case 323:
      result = &texFormatRGBX32I;
      break;
    case 324:
      result = &texFormatRGBX32F;
      break;
    default:
      switch(&texFormatA8)
      {
        case 0x1F4u:
          result = &texFormatYCBCR8_420_2PLANE;
          break;
        case 0x1F5u:
          result = &texFormatYCBCR8_422_1PLANE;
          break;
        case 0x1F6u:
          result = &texFormatYCBCR8_422_2PLANE;
          break;
        case 0x1F7u:
          result = &texFormatYCBCR8_444_2PLANE;
          break;
        case 0x1F8u:
          result = &texFormatYCBCR10_444_1PLANE;
          break;
        case 0x1F9u:
          result = &texFormatYCBCR10_420_2PLANE;
          break;
        case 0x1FAu:
          result = &texFormatYCBCR10_422_2PLANE;
          break;
        case 0x1FBu:
          result = &texFormatYCBCR10_444_2PLANE;
          break;
        case 0x1FCu:
          result = &texFormatYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x1FDu:
          result = &texFormatYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x1FEu:
          result = &texFormatYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x208u:
          result = &texFormatsYCBCR8_420_2PLANE;
          break;
        case 0x209u:
          result = &texFormatsYCBCR8_422_1PLANE;
          break;
        case 0x20Au:
          result = &texFormatsYCBCR8_422_2PLANE;
          break;
        case 0x20Bu:
          result = &texFormatsYCBCR8_444_2PLANE;
          break;
        case 0x20Cu:
          result = &texFormatsYCBCR10_444_1PLANE;
          break;
        case 0x20Du:
          result = &texFormatsYCBCR10_420_2PLANE;
          break;
        case 0x20Eu:
          result = &texFormatsYCBCR10_422_2PLANE;
          break;
        case 0x20Fu:
          result = &texFormatsYCBCR10_444_2PLANE;
          break;
        case 0x210u:
          result = &texFormatsYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x211u:
          result = &texFormatsYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x212u:
          result = &texFormatsYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x21Cu:
          result = &texFormatRGB8_420_2PLANE;
          break;
        case 0x21Du:
          result = &texFormatRGB8_422_2PLANE;
          break;
        case 0x21Eu:
          result = &texFormatRGB8_444_2PLANE;
          break;
        case 0x21Fu:
          result = &texFormatRGB10_420_2PLANE;
          break;
        case 0x220u:
          result = &texFormatRGB10_422_2PLANE;
          break;
        case 0x221u:
          result = &texFormatRGB10_444_2PLANE;
          break;
        case 0x222u:
          result = &texFormatRGB10_420_2PLANE_PACKED;
          break;
        case 0x223u:
          result = &texFormatRGB10_422_2PLANE_PACKED;
          break;
        case 0x224u:
          result = &texFormatRGB10_444_2PLANE_PACKED;
          break;
        case 0x226u:
          result = &texFormatXRRGB10_PLANE_A8_PLANE;
          break;
        case 0x227u:
          result = &texFormatXRSRGB10_PLANE_A8_PLANE;
          break;
        case 0x228u:
          result = &texFormatARGBV16_XR10;
          break;
        case 0x229u:
          result = &texFormatsARGBV16_XR10;
          break;
        case 0x22Au:
          result = &texFormatXRRGB10;
          break;
        case 0x22Bu:
          result = &texFormatXRSRGB10;
          break;
        case 0x22Cu:
          result = &texFormatRGBA16F_XR;
          break;
        case 0x230u:
          result = &texFormatYCBCR8A8_444_1PLANE;
          break;
        case 0x232u:
          result = &texFormatYCBCR8_422_1PLANE_REV;
          break;
        case 0x233u:
          result = &texFormatpqYCBCR10_444_1PLANE;
          break;
        case 0x234u:
          result = &texFormatpqYCBCR10_420_2PLANE;
          break;
        case 0x235u:
          result = &texFormatpqYCBCR10_422_2PLANE;
          break;
        case 0x236u:
          result = &texFormatpqYCBCR10_444_2PLANE;
          break;
        case 0x237u:
          result = &texFormatpqYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x238u:
          result = &texFormatpqYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x239u:
          result = &texFormatpqYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x23Au:
          result = &texFormatYCBCR12_420_2PLANE;
          break;
        case 0x23Bu:
          result = &texFormatYCBCR12_422_2PLANE;
          break;
        case 0x23Cu:
          result = &texFormatYCBCR12_444_2PLANE;
          break;
        case 0x23Du:
          result = &texFormatpqYCBCR12_420_2PLANE;
          break;
        case 0x23Eu:
          result = &texFormatpqYCBCR12_422_2PLANE;
          break;
        case 0x23Fu:
          result = &texFormatpqYCBCR12_444_2PLANE;
          break;
        case 0x240u:
          result = &texFormatR10X6F;
          break;
        case 0x241u:
          result = &texFormatsR10X6F;
          break;
        case 0x242u:
          result = &texFormatRG10X12F;
          break;
        case 0x243u:
          result = &texFormatsRG10X12F;
          break;
        case 0x244u:
          result = &texFormatYCBCR12_420_2PLANE_PACKED;
          break;
        case 0x245u:
          result = &texFormatYCBCR12_422_2PLANE_PACKED;
          break;
        case 0x246u:
          result = &texFormatYCBCR12_444_2PLANE_PACKED;
          break;
        case 0x247u:
          result = &texFormatpqYCBCR12_420_2PLANE_PACKED;
          break;
        case 0x248u:
          result = &texFormatpqYCBCR12_422_2PLANE_PACKED;
          break;
        case 0x249u:
          result = &texFormatpqYCBCR12_444_2PLANE_PACKED;
          break;
        case 0x24Au:
          result = &texFormatsRGB10_A2;
          break;
        case 0x24Bu:
          result = &texFormatpqRGB10_A2;
          break;
        case 0x24Cu:
          result = &texFormatR10_1PLANE_PACKED;
          break;
        case 0x24Du:
          result = &texFormatRG10_1PLANE_PACKED;
          break;
        case 0x24Eu:
          result = &texFormatYCBCR10_444_1PLANE_XR;
          break;
        case 0x24Fu:
          result = &texFormatYCBCR10_420_2PLANE_XR;
          break;
        case 0x250u:
          result = &texFormatYCBCR10_422_2PLANE_XR;
          break;
        case 0x251u:
          result = &texFormatYCBCR10_444_2PLANE_XR;
          break;
        case 0x252u:
          result = &texFormatYCBCR10_420_2PLANE_PACKED_XR;
          break;
        case 0x253u:
          result = &texFormatYCBCR10_422_2PLANE_PACKED_XR;
          break;
        case 0x254u:
          result = &texFormatYCBCR10_444_2PLANE_PACKED_XR;
          break;
        case 0x255u:
          result = &texFormatYCBCR12_420_2PLANE_XR;
          break;
        case 0x256u:
          result = &texFormatYCBCR12_422_2PLANE_XR;
          break;
        case 0x257u:
          result = &texFormatYCBCR12_444_2PLANE_XR;
          break;
        case 0x258u:
          result = &texFormatYCBCR12_420_2PLANE_PACKED_XR;
          break;
        case 0x259u:
          result = &texFormatYCBCR12_422_2PLANE_PACKED_XR;
          break;
        case 0x25Au:
          result = &texFormatYCBCR12_444_2PLANE_PACKED_XR;
          break;
        case 0x25Bu:
          result = &texFormatR12X4U;
          break;
        case 0x25Cu:
          result = &texFormatpqR12X4U;
          break;
        case 0x25Du:
          result = &texFormatRG12X8U;
          break;
        case 0x25Eu:
          result = &texFormatpqR10X6U;
          break;
        default:
          goto LABEL_167;
      }
      break;
  }
  return result;
}

void *AGX::G5::TextureFormatTable::chooseTextureFormatCPP(AGX::G5::TextureFormatTable *this, MTLPixelFormat a2)
{
  int v2;
  void *result;

  v2 = (_DWORD)this - 1;
  result = &texFormatA8;
  switch(v2)
  {
    case 0:
      return result;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 20:
    case 25:
    case 26:
    case 27:
    case 28:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 55:
    case 56:
    case 57:
    case 58:
    case 60:
    case 65:
    case 66:
    case 67:
    case 68:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 81:
    case 82:
    case 85:
    case 86:
    case 87:
    case 88:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 105:
    case 106:
    case 107:
    case 108:
    case 110:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 167:
    case 168:
    case 170:
    case 172:
    case 174:
    case 176:
    case 183:
    case 200:
    case 201:
    case 218:
    case 219:
    case 236:
    case 237:
    case 238:
    case 241:
    case 242:
    case 243:
    case 244:
    case 245:
    case 246:
    case 247:
    case 248:
    case 250:
    case 253:
    case 254:
    case 255:
    case 256:
    case 257:
    case 258:
    case 261:
    case 262:
    case 263:
    case 264:
    case 265:
    case 266:
    case 267:
    case 268:
    case 269:
    case 270:
    case 271:
    case 272:
    case 273:
    case 274:
    case 275:
    case 276:
    case 277:
    case 278:
    case 279:
    case 280:
    case 281:
    case 282:
    case 283:
    case 284:
    case 285:
    case 286:
    case 287:
    case 288:
    case 289:
    case 290:
    case 291:
    case 292:
    case 293:
    case 294:
    case 295:
    case 296:
    case 297:
    case 298:
    case 304:
    case 305:
    case 306:
    case 307:
    case 308:
    case 309:
    case 310:
    case 311:
    case 315:
    case 316:
    case 317:
    case 318:
    case 319:
    case 320:
    case 321:
LABEL_150:
      result = &texFormatUnsupported;
      break;
    case 9:
      result = &texFormatR8;
      break;
    case 10:
      result = &texFormatsR8;
      break;
    case 11:
      result = &texFormatR8_SNORM;
      break;
    case 12:
      result = &texFormatR8UI;
      break;
    case 13:
      result = &texFormatR8I;
      break;
    case 19:
      result = &texFormatR16;
      break;
    case 21:
      result = &texFormatR16_SNORM;
      break;
    case 22:
      result = &texFormatR16UI;
      break;
    case 23:
      result = &texFormatR16I;
      break;
    case 24:
      result = &texFormatR16F;
      break;
    case 29:
      result = &texFormatRG8;
      break;
    case 30:
      result = &texFormatsRG8;
      break;
    case 31:
      result = &texFormatRG8_SNORM;
      break;
    case 32:
      result = &texFormatRG8UI;
      break;
    case 33:
      result = &texFormatRG8I;
      break;
    case 39:
      result = &texFormatRGB565;
      break;
    case 40:
      result = &texFormatRGB5A1;
      break;
    case 41:
      result = &texFormatRGBA4;
      break;
    case 42:
      result = &texFormatA1RGB5;
      break;
    case 43:
      result = &texFormatBGRA4;
      break;
    case 52:
      result = &texFormatR32UI;
      break;
    case 53:
      result = &texFormatR32I;
      break;
    case 54:
      result = &texFormatR32F;
      break;
    case 59:
      result = &texFormatRG16;
      break;
    case 61:
      result = &texFormatRG16_SNORM;
      break;
    case 62:
      result = &texFormatRG16UI;
      break;
    case 63:
      result = &texFormatRG16I;
      break;
    case 64:
      result = &texFormatRG16F;
      break;
    case 69:
      result = &texFormatRGBA8;
      break;
    case 70:
      result = &texFormatsRGBA8;
      break;
    case 71:
      result = &texFormatRGBA8_SNORM;
      break;
    case 72:
      result = &texFormatRGBA8UI;
      break;
    case 73:
      result = &texFormatRGBA8I;
      break;
    case 79:
      result = &texFormatBGRA8;
      break;
    case 80:
      result = &texFormatsBGRA8;
      break;
    case 83:
      result = &texFormatARGB8;
      break;
    case 84:
      result = &texFormatsARGB8;
      break;
    case 89:
      result = &texFormatRGB10_A2;
      break;
    case 90:
      result = &texFormatRGB10_A2UI;
      break;
    case 91:
      result = &texFormatR11FG11FB10F;
      break;
    case 92:
      result = &texFormatRGB9_E5;
      break;
    case 93:
      result = &texFormatBGR10_A2;
      break;
    case 102:
      result = &texFormatRG32UI;
      break;
    case 103:
      result = &texFormatRG32I;
      break;
    case 104:
      result = &texFormatRG32F;
      break;
    case 109:
      result = &texFormatRGBA16;
      break;
    case 111:
      result = &texFormatRGBA16_SNORM;
      break;
    case 112:
      result = &texFormatRGBA16UI;
      break;
    case 113:
      result = &texFormatRGBA16I;
      break;
    case 114:
      result = &texFormatRGBA16F;
      break;
    case 122:
      result = &texFormatRGBA32UI;
      break;
    case 123:
      result = &texFormatRGBA32I;
      break;
    case 124:
      result = &texFormatRGBA32F;
      break;
    case 159:
      result = &texFormatPVRTC2RGB;
      break;
    case 160:
      result = &texFormatPVRTC2sRGB;
      break;
    case 161:
      result = &texFormatPVRTC4RGB;
      break;
    case 162:
      result = &texFormatPVRTC4sRGB;
      break;
    case 163:
      result = &texFormatPVRTC2RGBA;
      break;
    case 164:
      result = &texFormatPVRTC2sRGBA;
      break;
    case 165:
      result = &texFormatPVRTC4RGBA;
      break;
    case 166:
      result = &texFormatPVRTC4sRGBA;
      break;
    case 169:
      result = &texFormatR11EAC;
      break;
    case 171:
      result = &texFormatR11EAC_SNORM;
      break;
    case 173:
      result = &texFormatRG11EAC;
      break;
    case 175:
      result = &texFormatRG11EAC_SNORM;
      break;
    case 177:
      result = &texFormatETC2RGBA8;
      break;
    case 178:
      result = &texFormatETC2sRGBA8;
      break;
    case 179:
      result = &texFormatETC2RGB8;
      break;
    case 180:
      result = &texFormatETC2sRGB8;
      break;
    case 181:
      result = &texFormatETC2RGB8A1;
      break;
    case 182:
      result = &texFormatETC2sRGB8A1;
      break;
    case 184:
      result = &texFormatASTC4x2sRGBA_UNORM;
      break;
    case 185:
      result = &texFormatASTC4x4sRGBA_UNORM;
      break;
    case 186:
      result = &texFormatASTC5x4sRGBA_UNORM;
      break;
    case 187:
      result = &texFormatASTC5x5sRGBA_UNORM;
      break;
    case 188:
      result = &texFormatASTC6x5sRGBA_UNORM;
      break;
    case 189:
      result = &texFormatASTC6x6sRGBA_UNORM;
      break;
    case 190:
      result = &texFormatASTC8x4sRGBA_UNORM;
      break;
    case 191:
      result = &texFormatASTC8x5sRGBA_UNORM;
      break;
    case 192:
      result = &texFormatASTC8x6sRGBA_UNORM;
      break;
    case 193:
      result = &texFormatASTC8x8sRGBA_UNORM;
      break;
    case 194:
      result = &texFormatASTC10x5sRGBA_UNORM;
      break;
    case 195:
      result = &texFormatASTC10x6sRGBA_UNORM;
      break;
    case 196:
      result = &texFormatASTC10x8sRGBA_UNORM;
      break;
    case 197:
      result = &texFormatASTC10x10sRGBA_UNORM;
      break;
    case 198:
      result = &texFormatASTC12x10sRGBA_UNORM;
      break;
    case 199:
      result = &texFormatASTC12x12sRGBA_UNORM;
      break;
    case 202:
      result = &texFormatASTC4x2RGBA_LP;
      break;
    case 203:
      result = &texFormatASTC4x4RGBA_LP;
      break;
    case 204:
      result = &texFormatASTC5x4RGBA_LP;
      break;
    case 205:
      result = &texFormatASTC5x5RGBA_LP;
      break;
    case 206:
      result = &texFormatASTC6x5RGBA_LP;
      break;
    case 207:
      result = &texFormatASTC6x6RGBA_LP;
      break;
    case 208:
      result = &texFormatASTC8x4RGBA_LP;
      break;
    case 209:
      result = &texFormatASTC8x5RGBA_LP;
      break;
    case 210:
      result = &texFormatASTC8x6RGBA_LP;
      break;
    case 211:
      result = &texFormatASTC8x8RGBA_LP;
      break;
    case 212:
      result = &texFormatASTC10x5RGBA_LP;
      break;
    case 213:
      result = &texFormatASTC10x6RGBA_LP;
      break;
    case 214:
      result = &texFormatASTC10x8RGBA_LP;
      break;
    case 215:
      result = &texFormatASTC10x10RGBA_LP;
      break;
    case 216:
      result = &texFormatASTC12x10RGBA_LP;
      break;
    case 217:
      result = &texFormatASTC12x12RGBA_LP;
      break;
    case 220:
      result = &texFormatASTC4x2RGBA;
      break;
    case 221:
      result = &texFormatASTC4x4RGBA;
      break;
    case 222:
      result = &texFormatASTC5x4RGBA;
      break;
    case 223:
      result = &texFormatASTC5x5RGBA;
      break;
    case 224:
      result = &texFormatASTC6x5RGBA;
      break;
    case 225:
      result = &texFormatASTC6x6RGBA;
      break;
    case 226:
      result = &texFormatASTC8x4RGBA;
      break;
    case 227:
      result = &texFormatASTC8x5RGBA;
      break;
    case 228:
      result = &texFormatASTC8x6RGBA;
      break;
    case 229:
      result = &texFormatASTC8x8RGBA;
      break;
    case 230:
      result = &texFormatASTC10x5RGBA;
      break;
    case 231:
      result = &texFormatASTC10x6RGBA;
      break;
    case 232:
      result = &texFormatASTC10x8RGBA;
      break;
    case 233:
      result = &texFormatASTC10x10RGBA;
      break;
    case 234:
      result = &texFormatASTC12x10RGBA;
      break;
    case 235:
      result = &texFormatASTC12x12RGBA;
      break;
    case 239:
      result = &texFormatYUY2_RGB;
      break;
    case 240:
      result = &texFormatUYVY_RGB;
      break;
    case 249:
      result = &texFormatD16;
      break;
    case 251:
      result = &texFormatD32;
      break;
    case 252:
    case 260:
      result = &texFormatS8;
      break;
    case 259:
      result = &texFormatD32FS8_2PLANE;
      break;
    case 299:
      result = &texFormatRGB8;
      break;
    case 300:
      result = &texFormatsRGB8;
      break;
    case 301:
      result = &texFormatRGB8_SNORM;
      break;
    case 302:
      result = &texFormatRGB8UI;
      break;
    case 303:
      result = &texFormatRGB8I;
      break;
    case 312:
      result = &texFormatRGBX16UI;
      break;
    case 313:
      result = &texFormatRGBX16I;
      break;
    case 314:
      result = &texFormatRGBX16F;
      break;
    case 322:
      result = &texFormatRGBX32UI;
      break;
    case 323:
      result = &texFormatRGBX32I;
      break;
    case 324:
      result = &texFormatRGBX32F;
      break;
    default:
      switch(&texFormatA8)
      {
        case 0x1F4u:
          result = &texFormatYCBCR8_420_2PLANE;
          break;
        case 0x1F5u:
          result = &texFormatYCBCR8_422_1PLANE;
          break;
        case 0x1F6u:
          result = &texFormatYCBCR8_422_2PLANE;
          break;
        case 0x1F7u:
          result = &texFormatYCBCR8_444_2PLANE;
          break;
        case 0x1F8u:
          result = &texFormatYCBCR10_444_1PLANE;
          break;
        case 0x1F9u:
          result = &texFormatYCBCR10_420_2PLANE;
          break;
        case 0x1FAu:
          result = &texFormatYCBCR10_422_2PLANE;
          break;
        case 0x1FBu:
          result = &texFormatYCBCR10_444_2PLANE;
          break;
        case 0x1FCu:
          result = &texFormatYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x1FDu:
          result = &texFormatYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x1FEu:
          result = &texFormatYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x208u:
          result = &texFormatsYCBCR8_420_2PLANE;
          break;
        case 0x209u:
          result = &texFormatsYCBCR8_422_1PLANE;
          break;
        case 0x20Au:
          result = &texFormatsYCBCR8_422_2PLANE;
          break;
        case 0x20Bu:
          result = &texFormatsYCBCR8_444_2PLANE;
          break;
        case 0x20Cu:
          result = &texFormatsYCBCR10_444_1PLANE;
          break;
        case 0x20Du:
          result = &texFormatsYCBCR10_420_2PLANE;
          break;
        case 0x20Eu:
          result = &texFormatsYCBCR10_422_2PLANE;
          break;
        case 0x20Fu:
          result = &texFormatsYCBCR10_444_2PLANE;
          break;
        case 0x210u:
          result = &texFormatsYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x211u:
          result = &texFormatsYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x212u:
          result = &texFormatsYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x21Cu:
          result = &texFormatRGB8_420_2PLANE;
          break;
        case 0x21Du:
          result = &texFormatRGB8_422_2PLANE;
          break;
        case 0x21Eu:
          result = &texFormatRGB8_444_2PLANE;
          break;
        case 0x21Fu:
          result = &texFormatRGB10_420_2PLANE;
          break;
        case 0x220u:
          result = &texFormatRGB10_422_2PLANE;
          break;
        case 0x221u:
          result = &texFormatRGB10_444_2PLANE;
          break;
        case 0x222u:
          result = &texFormatRGB10_420_2PLANE_PACKED;
          break;
        case 0x223u:
          result = &texFormatRGB10_422_2PLANE_PACKED;
          break;
        case 0x224u:
          result = &texFormatRGB10_444_2PLANE_PACKED;
          break;
        case 0x226u:
          result = &texFormatXRRGB10_PLANE_A8_PLANE;
          break;
        case 0x227u:
          result = &texFormatXRSRGB10_PLANE_A8_PLANE;
          break;
        case 0x228u:
          result = &texFormatARGBV16_XR10;
          break;
        case 0x229u:
          result = &texFormatsARGBV16_XR10;
          break;
        case 0x22Au:
          result = &texFormatXRRGB10;
          break;
        case 0x22Bu:
          result = &texFormatXRSRGB10;
          break;
        case 0x232u:
          result = &texFormatYCBCR8_422_1PLANE_REV;
          break;
        case 0x24Cu:
          result = &texFormatR10_1PLANE_PACKED;
          break;
        case 0x24Du:
          result = &texFormatRG10_1PLANE_PACKED;
          break;
        default:
          goto LABEL_150;
      }
      break;
  }
  return result;
}

void *AGX::G9::TextureFormatTable::chooseTextureFormatCPP(AGX::G9::TextureFormatTable *this, MTLPixelFormat a2)
{
  int v2;
  void *result;

  v2 = (_DWORD)this - 1;
  result = &texFormatA8;
  switch(v2)
  {
    case 0:
      return result;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 20:
    case 25:
    case 26:
    case 27:
    case 28:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 55:
    case 56:
    case 57:
    case 58:
    case 60:
    case 65:
    case 66:
    case 67:
    case 68:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 81:
    case 82:
    case 85:
    case 86:
    case 87:
    case 88:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 105:
    case 106:
    case 107:
    case 108:
    case 110:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 125:
    case 126:
    case 127:
    case 128:
    case 129:
    case 130:
    case 131:
    case 132:
    case 133:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
    case 156:
    case 157:
    case 158:
    case 167:
    case 168:
    case 170:
    case 172:
    case 174:
    case 176:
    case 183:
    case 200:
    case 201:
    case 218:
    case 219:
    case 236:
    case 237:
    case 238:
    case 241:
    case 242:
    case 243:
    case 244:
    case 245:
    case 246:
    case 247:
    case 248:
    case 250:
    case 253:
    case 254:
    case 255:
    case 256:
    case 257:
    case 258:
    case 261:
    case 262:
    case 263:
    case 264:
    case 265:
    case 266:
    case 267:
    case 268:
    case 269:
    case 270:
    case 271:
    case 272:
    case 273:
    case 274:
    case 275:
    case 276:
    case 277:
    case 278:
    case 279:
    case 280:
    case 281:
    case 282:
    case 283:
    case 284:
    case 285:
    case 286:
    case 287:
    case 288:
    case 289:
    case 290:
    case 291:
    case 292:
    case 293:
    case 294:
    case 295:
    case 296:
    case 297:
    case 298:
    case 304:
    case 305:
    case 306:
    case 307:
    case 308:
    case 309:
    case 310:
    case 311:
    case 315:
    case 316:
    case 317:
    case 318:
    case 319:
    case 320:
    case 321:
LABEL_150:
      result = &texFormatUnsupported;
      break;
    case 9:
      result = &texFormatR8;
      break;
    case 10:
      result = &texFormatsR8;
      break;
    case 11:
      result = &texFormatR8_SNORM;
      break;
    case 12:
      result = &texFormatR8UI;
      break;
    case 13:
      result = &texFormatR8I;
      break;
    case 19:
      result = &texFormatR16;
      break;
    case 21:
      result = &texFormatR16_SNORM;
      break;
    case 22:
      result = &texFormatR16UI;
      break;
    case 23:
      result = &texFormatR16I;
      break;
    case 24:
      result = &texFormatR16F;
      break;
    case 29:
      result = &texFormatRG8;
      break;
    case 30:
      result = &texFormatsRG8;
      break;
    case 31:
      result = &texFormatRG8_SNORM;
      break;
    case 32:
      result = &texFormatRG8UI;
      break;
    case 33:
      result = &texFormatRG8I;
      break;
    case 39:
      result = &texFormatRGB565;
      break;
    case 40:
      result = &texFormatRGB5A1;
      break;
    case 41:
      result = &texFormatRGBA4;
      break;
    case 42:
      result = &texFormatA1RGB5;
      break;
    case 43:
      result = &texFormatBGRA4;
      break;
    case 52:
      result = &texFormatR32UI;
      break;
    case 53:
      result = &texFormatR32I;
      break;
    case 54:
      result = &texFormatR32F;
      break;
    case 59:
      result = &texFormatRG16;
      break;
    case 61:
      result = &texFormatRG16_SNORM;
      break;
    case 62:
      result = &texFormatRG16UI;
      break;
    case 63:
      result = &texFormatRG16I;
      break;
    case 64:
      result = &texFormatRG16F;
      break;
    case 69:
      result = &texFormatRGBA8;
      break;
    case 70:
      result = &texFormatsRGBA8;
      break;
    case 71:
      result = &texFormatRGBA8_SNORM;
      break;
    case 72:
      result = &texFormatRGBA8UI;
      break;
    case 73:
      result = &texFormatRGBA8I;
      break;
    case 79:
      result = &texFormatBGRA8;
      break;
    case 80:
      result = &texFormatsBGRA8;
      break;
    case 83:
      result = &texFormatARGB8;
      break;
    case 84:
      result = &texFormatsARGB8;
      break;
    case 89:
      result = &texFormatRGB10_A2;
      break;
    case 90:
      result = &texFormatRGB10_A2UI;
      break;
    case 91:
      result = &texFormatR11FG11FB10F;
      break;
    case 92:
      result = &texFormatRGB9_E5;
      break;
    case 93:
      result = &texFormatBGR10_A2;
      break;
    case 102:
      result = &texFormatRG32UI;
      break;
    case 103:
      result = &texFormatRG32I;
      break;
    case 104:
      result = &texFormatRG32F;
      break;
    case 109:
      result = &texFormatRGBA16;
      break;
    case 111:
      result = &texFormatRGBA16_SNORM;
      break;
    case 112:
      result = &texFormatRGBA16UI;
      break;
    case 113:
      result = &texFormatRGBA16I;
      break;
    case 114:
      result = &texFormatRGBA16F;
      break;
    case 122:
      result = &texFormatRGBA32UI;
      break;
    case 123:
      result = &texFormatRGBA32I;
      break;
    case 124:
      result = &texFormatRGBA32F;
      break;
    case 159:
      result = &texFormatPVRTC2RGB;
      break;
    case 160:
      result = &texFormatPVRTC2sRGB;
      break;
    case 161:
      result = &texFormatPVRTC4RGB;
      break;
    case 162:
      result = &texFormatPVRTC4sRGB;
      break;
    case 163:
      result = &texFormatPVRTC2RGBA;
      break;
    case 164:
      result = &texFormatPVRTC2sRGBA;
      break;
    case 165:
      result = &texFormatPVRTC4RGBA;
      break;
    case 166:
      result = &texFormatPVRTC4sRGBA;
      break;
    case 169:
      result = &texFormatR11EAC;
      break;
    case 171:
      result = &texFormatR11EAC_SNORM;
      break;
    case 173:
      result = &texFormatRG11EAC;
      break;
    case 175:
      result = &texFormatRG11EAC_SNORM;
      break;
    case 177:
      result = &texFormatETC2RGBA8;
      break;
    case 178:
      result = &texFormatETC2sRGBA8;
      break;
    case 179:
      result = &texFormatETC2RGB8;
      break;
    case 180:
      result = &texFormatETC2sRGB8;
      break;
    case 181:
      result = &texFormatETC2RGB8A1;
      break;
    case 182:
      result = &texFormatETC2sRGB8A1;
      break;
    case 184:
      result = &texFormatASTC4x2sRGBA_UNORM;
      break;
    case 185:
      result = &texFormatASTC4x4sRGBA_UNORM;
      break;
    case 186:
      result = &texFormatASTC5x4sRGBA_UNORM;
      break;
    case 187:
      result = &texFormatASTC5x5sRGBA_UNORM;
      break;
    case 188:
      result = &texFormatASTC6x5sRGBA_UNORM;
      break;
    case 189:
      result = &texFormatASTC6x6sRGBA_UNORM;
      break;
    case 190:
      result = &texFormatASTC8x4sRGBA_UNORM;
      break;
    case 191:
      result = &texFormatASTC8x5sRGBA_UNORM;
      break;
    case 192:
      result = &texFormatASTC8x6sRGBA_UNORM;
      break;
    case 193:
      result = &texFormatASTC8x8sRGBA_UNORM;
      break;
    case 194:
      result = &texFormatASTC10x5sRGBA_UNORM;
      break;
    case 195:
      result = &texFormatASTC10x6sRGBA_UNORM;
      break;
    case 196:
      result = &texFormatASTC10x8sRGBA_UNORM;
      break;
    case 197:
      result = &texFormatASTC10x10sRGBA_UNORM;
      break;
    case 198:
      result = &texFormatASTC12x10sRGBA_UNORM;
      break;
    case 199:
      result = &texFormatASTC12x12sRGBA_UNORM;
      break;
    case 202:
      result = &texFormatASTC4x2RGBA_LP;
      break;
    case 203:
      result = &texFormatASTC4x4RGBA_LP;
      break;
    case 204:
      result = &texFormatASTC5x4RGBA_LP;
      break;
    case 205:
      result = &texFormatASTC5x5RGBA_LP;
      break;
    case 206:
      result = &texFormatASTC6x5RGBA_LP;
      break;
    case 207:
      result = &texFormatASTC6x6RGBA_LP;
      break;
    case 208:
      result = &texFormatASTC8x4RGBA_LP;
      break;
    case 209:
      result = &texFormatASTC8x5RGBA_LP;
      break;
    case 210:
      result = &texFormatASTC8x6RGBA_LP;
      break;
    case 211:
      result = &texFormatASTC8x8RGBA_LP;
      break;
    case 212:
      result = &texFormatASTC10x5RGBA_LP;
      break;
    case 213:
      result = &texFormatASTC10x6RGBA_LP;
      break;
    case 214:
      result = &texFormatASTC10x8RGBA_LP;
      break;
    case 215:
      result = &texFormatASTC10x10RGBA_LP;
      break;
    case 216:
      result = &texFormatASTC12x10RGBA_LP;
      break;
    case 217:
      result = &texFormatASTC12x12RGBA_LP;
      break;
    case 220:
      result = &texFormatASTC4x2RGBA;
      break;
    case 221:
      result = &texFormatASTC4x4RGBA;
      break;
    case 222:
      result = &texFormatASTC5x4RGBA;
      break;
    case 223:
      result = &texFormatASTC5x5RGBA;
      break;
    case 224:
      result = &texFormatASTC6x5RGBA;
      break;
    case 225:
      result = &texFormatASTC6x6RGBA;
      break;
    case 226:
      result = &texFormatASTC8x4RGBA;
      break;
    case 227:
      result = &texFormatASTC8x5RGBA;
      break;
    case 228:
      result = &texFormatASTC8x6RGBA;
      break;
    case 229:
      result = &texFormatASTC8x8RGBA;
      break;
    case 230:
      result = &texFormatASTC10x5RGBA;
      break;
    case 231:
      result = &texFormatASTC10x6RGBA;
      break;
    case 232:
      result = &texFormatASTC10x8RGBA;
      break;
    case 233:
      result = &texFormatASTC10x10RGBA;
      break;
    case 234:
      result = &texFormatASTC12x10RGBA;
      break;
    case 235:
      result = &texFormatASTC12x12RGBA;
      break;
    case 239:
      result = &texFormatYUY2_RGB;
      break;
    case 240:
      result = &texFormatUYVY_RGB;
      break;
    case 249:
      result = &texFormatD16;
      break;
    case 251:
      result = &texFormatD32;
      break;
    case 252:
    case 260:
      result = &texFormatS8;
      break;
    case 259:
      result = &texFormatD32FS8_2PLANE;
      break;
    case 299:
      result = &texFormatRGB8;
      break;
    case 300:
      result = &texFormatsRGB8;
      break;
    case 301:
      result = &texFormatRGB8_SNORM;
      break;
    case 302:
      result = &texFormatRGB8UI;
      break;
    case 303:
      result = &texFormatRGB8I;
      break;
    case 312:
      result = &texFormatRGBX16UI;
      break;
    case 313:
      result = &texFormatRGBX16I;
      break;
    case 314:
      result = &texFormatRGBX16F;
      break;
    case 322:
      result = &texFormatRGBX32UI;
      break;
    case 323:
      result = &texFormatRGBX32I;
      break;
    case 324:
      result = &texFormatRGBX32F;
      break;
    default:
      switch(&texFormatA8)
      {
        case 0x1F4u:
          result = &texFormatYCBCR8_420_2PLANE;
          break;
        case 0x1F5u:
          result = &texFormatYCBCR8_422_1PLANE;
          break;
        case 0x1F6u:
          result = &texFormatYCBCR8_422_2PLANE;
          break;
        case 0x1F7u:
          result = &texFormatYCBCR8_444_2PLANE;
          break;
        case 0x1F8u:
          result = &texFormatYCBCR10_444_1PLANE;
          break;
        case 0x1F9u:
          result = &texFormatYCBCR10_420_2PLANE;
          break;
        case 0x1FAu:
          result = &texFormatYCBCR10_422_2PLANE;
          break;
        case 0x1FBu:
          result = &texFormatYCBCR10_444_2PLANE;
          break;
        case 0x1FCu:
          result = &texFormatYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x1FDu:
          result = &texFormatYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x1FEu:
          result = &texFormatYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x208u:
          result = &texFormatsYCBCR8_420_2PLANE;
          break;
        case 0x209u:
          result = &texFormatsYCBCR8_422_1PLANE;
          break;
        case 0x20Au:
          result = &texFormatsYCBCR8_422_2PLANE;
          break;
        case 0x20Bu:
          result = &texFormatsYCBCR8_444_2PLANE;
          break;
        case 0x20Cu:
          result = &texFormatsYCBCR10_444_1PLANE;
          break;
        case 0x20Du:
          result = &texFormatsYCBCR10_420_2PLANE;
          break;
        case 0x20Eu:
          result = &texFormatsYCBCR10_422_2PLANE;
          break;
        case 0x20Fu:
          result = &texFormatsYCBCR10_444_2PLANE;
          break;
        case 0x210u:
          result = &texFormatsYCBCR10_420_2PLANE_PACKED;
          break;
        case 0x211u:
          result = &texFormatsYCBCR10_422_2PLANE_PACKED;
          break;
        case 0x212u:
          result = &texFormatsYCBCR10_444_2PLANE_PACKED;
          break;
        case 0x21Cu:
          result = &texFormatRGB8_420_2PLANE;
          break;
        case 0x21Du:
          result = &texFormatRGB8_422_2PLANE;
          break;
        case 0x21Eu:
          result = &texFormatRGB8_444_2PLANE;
          break;
        case 0x21Fu:
          result = &texFormatRGB10_420_2PLANE;
          break;
        case 0x220u:
          result = &texFormatRGB10_422_2PLANE;
          break;
        case 0x221u:
          result = &texFormatRGB10_444_2PLANE;
          break;
        case 0x222u:
          result = &texFormatRGB10_420_2PLANE_PACKED;
          break;
        case 0x223u:
          result = &texFormatRGB10_422_2PLANE_PACKED;
          break;
        case 0x224u:
          result = &texFormatRGB10_444_2PLANE_PACKED;
          break;
        case 0x226u:
          result = &texFormatXRRGB10_PLANE_A8_PLANE;
          break;
        case 0x227u:
          result = &texFormatXRSRGB10_PLANE_A8_PLANE;
          break;
        case 0x228u:
          result = &texFormatARGBV16_XR10;
          break;
        case 0x229u:
          result = &texFormatsARGBV16_XR10;
          break;
        case 0x22Au:
          result = &texFormatXRRGB10;
          break;
        case 0x22Bu:
          result = &texFormatXRSRGB10;
          break;
        case 0x232u:
          result = &texFormatYCBCR8_422_1PLANE_REV;
          break;
        case 0x24Cu:
          result = &texFormatR10_1PLANE_PACKED;
          break;
        case 0x24Du:
          result = &texFormatRG10_1PLANE_PACKED;
          break;
        default:
          goto LABEL_150;
      }
      break;
  }
  return result;
}

uint64_t AGX::Impl::VertexProgramKey::addToDigest(AGX::Impl::VertexProgramKey *this, CC_SHA256state_st *a2)
{
  uint64_t result;
  int *v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  __int16 data;

  result = AGX::defaultVertexDescriptor(this);
  v5 = (int *)result;
  v6 = *((_QWORD *)this + 7);
  v7 = *(int *)result;
  v8 = *(unsigned __int16 *)(result - v7);
  if (v8 < 0x15)
  {
    LODWORD(v9) = 0;
  }
  else
  {
    v9 = *(unsigned __int16 *)(result - v7 + 20);
    if (*(_WORD *)(result - v7 + 20))
      LODWORD(v9) = *(unsigned __int8 *)(result + v9);
  }
  if (((v6 >> 10) & 3) == (_DWORD)v9)
  {
    v10 = -v7;
  }
  else
  {
    v38 = (v6 >> 10) & 3;
    data = 20;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, &v38, 8u);
    v6 = *((_QWORD *)this + 7);
    v11 = *v5;
    v10 = -v11;
    v8 = *(unsigned __int16 *)((char *)v5 - v11);
  }
  if (v8 < 0x19)
  {
    LODWORD(v12) = 0;
  }
  else
  {
    v12 = *(unsigned __int16 *)((char *)v5 + v10 + 24);
    if (*(_WORD *)((char *)v5 + v10 + 24))
      LODWORD(v12) = *((unsigned __int8 *)v5 + v12);
  }
  if (((v6 >> 8) & 3) != (_DWORD)v12)
  {
    v38 = (v6 >> 8) & 3;
    data = 24;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, &v38, 8u);
  }
  if (*((_QWORD *)this + 5))
  {
    LOWORD(v38) = 30;
    CC_SHA256_Update(a2, &v38, 2u);
    result = CC_SHA256_Update(a2, (char *)this + 40, 8u);
  }
  v13 = *v5;
  v14 = -v13;
  v15 = (char *)v5 - v13;
  v16 = *(unsigned __int16 *)((char *)v5 - v13);
  if (v16 >= 0x21 && (v17 = *((unsigned __int16 *)v15 + 16)) != 0)
  {
    v18 = *((_DWORD *)this + 22) & 1;
    if ((v18 == 0) != (*((_BYTE *)v5 + v17) != 0))
    {
      v19 = *((_QWORD *)this + 7);
      v20 = (v19 >> 12) & 3;
      goto LABEL_24;
    }
  }
  else
  {
    if ((*((_DWORD *)this + 22) & 1) == 0)
      goto LABEL_23;
    v18 = 1;
  }
  LODWORD(v38) = v18;
  data = 32;
  CC_SHA256_Update(a2, &data, 2u);
  result = CC_SHA256_Update(a2, &v38, 4u);
  v21 = *v5;
  v14 = -v21;
  v16 = *(unsigned __int16 *)((char *)v5 - v21);
LABEL_23:
  v19 = *((_QWORD *)this + 7);
  v20 = (v19 >> 12) & 3;
  if (v16 < 0x1D)
  {
    LODWORD(v22) = 0;
    goto LABEL_27;
  }
LABEL_24:
  v22 = *(unsigned __int16 *)((char *)v5 + v14 + 28);
  if (*(_WORD *)((char *)v5 + v14 + 28))
    LODWORD(v22) = *((unsigned __int8 *)v5 + v22);
LABEL_27:
  if (v20 != (_DWORD)v22)
  {
    v38 = (v19 >> 12) & 3;
    data = 28;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, &v38, 8u);
    v19 = *((_QWORD *)this + 7);
    v23 = *v5;
    v14 = -v23;
    v16 = *(unsigned __int16 *)((char *)v5 - v23);
  }
  if (v16 >= 0x1B && *(_WORD *)((char *)v5 + v14 + 26))
    v24 = *(_QWORD *)((char *)v5 + *(unsigned __int16 *)((char *)v5 + v14 + 26));
  else
    v24 = 1;
  if (((v19 >> 14) & 0xF) != v24)
  {
    v38 = (v19 >> 14) & 0xF;
    data = 26;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, &v38, 8u);
    v19 = *((_QWORD *)this + 7);
    v25 = *v5;
    v14 = -v25;
    v16 = *(unsigned __int16 *)((char *)v5 - v25);
  }
  if (v16 >= 0x2B && *(_WORD *)((char *)v5 + v14 + 42))
  {
    if (((v19 & 0x80000) == 0) != (*((_BYTE *)v5 + *(unsigned __int16 *)((char *)v5 + v14 + 42)) != 0))
    {
      v26 = (v19 >> 20) & 1;
      goto LABEL_42;
    }
  }
  else if ((v19 & 0x80000) == 0)
  {
    goto LABEL_41;
  }
  v38 = (v19 >> 19) & 1;
  data = 42;
  CC_SHA256_Update(a2, &data, 2u);
  result = CC_SHA256_Update(a2, &v38, 8u);
  v19 = *((_QWORD *)this + 7);
  v27 = *v5;
  v14 = -v27;
  v16 = *(unsigned __int16 *)((char *)v5 - v27);
LABEL_41:
  v26 = (v19 >> 20) & 1;
  if (v16 < 9)
    goto LABEL_49;
LABEL_42:
  v28 = (char *)v5 + v14;
  if (*(_WORD *)((char *)v5 + v14 + 8))
  {
    LODWORD(v29) = 0;
    if (v16 < 0xB || !*((_BYTE *)v5 + *(unsigned __int16 *)((char *)v5 + v14 + 8)))
      goto LABEL_50;
    goto LABEL_47;
  }
  if (v16 < 0xB)
  {
LABEL_49:
    LODWORD(v29) = 0;
    goto LABEL_50;
  }
LABEL_47:
  v29 = *((unsigned __int16 *)v28 + 5);
  if (*((_WORD *)v28 + 5))
    LODWORD(v29) = *((unsigned __int8 *)v5 + v29) == 1;
LABEL_50:
  if (v26 != (_DWORD)v29)
  {
    v38 = (v19 >> 20) & 1;
    data = 8;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, &v38, 8u);
    v19 = *((_QWORD *)this + 7);
    v30 = *v5;
    v14 = -v30;
    v16 = *(unsigned __int16 *)((char *)v5 - v30);
  }
  if (v16 < 0x11)
  {
    LODWORD(v31) = 0;
  }
  else
  {
    v31 = *(unsigned __int16 *)((char *)v5 + v14 + 16);
    if (*(_WORD *)((char *)v5 + v14 + 16))
      LODWORD(v31) = *((unsigned __int8 *)v5 + v31);
  }
  if (((v19 >> 22) & 1) != (_DWORD)v31)
  {
    v38 = (v19 >> 22) & 1;
    data = 16;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, &v38, 8u);
    v19 = *((_QWORD *)this + 7);
    v32 = *v5;
    v14 = -v32;
    v16 = *(unsigned __int16 *)((char *)v5 - v32);
  }
  if (v16 < 0x23 || (v33 = *(unsigned __int16 *)((char *)v5 + v14 + 34)) == 0)
  {
    if ((v19 & 0x2000000) == 0)
      goto LABEL_64;
    goto LABEL_63;
  }
  if (((v19 & 0x2000000) == 0) == (*((_BYTE *)v5 + v33) != 0))
  {
LABEL_63:
    v38 = (v19 >> 25) & 1;
    data = 34;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, &v38, 8u);
  }
LABEL_64:
  v34 = (_QWORD *)((char *)this + 144);
  if (*((char *)this + 167) < 0)
  {
    v35 = *((_QWORD *)this + 19);
    if (!v35)
      goto LABEL_70;
    v34 = (_QWORD *)*v34;
    goto LABEL_69;
  }
  LODWORD(v35) = *((unsigned __int8 *)this + 167);
  if (*((_BYTE *)this + 167))
LABEL_69:
    result = CC_SHA256_Update(a2, v34, v35);
LABEL_70:
  v36 = (_QWORD *)((char *)this + 168);
  if (*((char *)this + 191) < 0)
  {
    v37 = *((_QWORD *)this + 22);
    if (!v37)
      return result;
    v36 = (_QWORD *)*v36;
    return CC_SHA256_Update(a2, v36, v37);
  }
  LODWORD(v37) = *((unsigned __int8 *)this + 191);
  if (*((_BYTE *)this + 191))
    return CC_SHA256_Update(a2, v36, v37);
  return result;
}

_QWORD *AGX::Impl::VertexProgramKey::addToSerializeStream(_QWORD *this)
{
  _QWORD *v1;
  _QWORD *v2;
  size_t v3;
  _QWORD *v4;
  size_t v5;

  v1 = this;
  v2 = this + 18;
  if (*((char *)this + 167) < 0)
  {
    v3 = this[19];
    if (!v3)
      goto LABEL_7;
    v2 = (_QWORD *)*v2;
    goto LABEL_6;
  }
  v3 = *((unsigned __int8 *)this + 167);
  if (*((_BYTE *)this + 167))
LABEL_6:
    this = ProgramKey<(_AGCStreamToken)3,(AGX::DriverShaderCompilationMode)0>::addTokenToStream((uint64_t)this, 0x4Bu, v2, v3);
LABEL_7:
  v4 = v1 + 21;
  if (*((char *)v1 + 191) < 0)
  {
    v5 = v1[22];
    if (!v5)
      return this;
    v4 = (_QWORD *)*v4;
    return ProgramKey<(_AGCStreamToken)3,(AGX::DriverShaderCompilationMode)0>::addTokenToStream((uint64_t)v1, 0x4Cu, v4, v5);
  }
  v5 = *((unsigned __int8 *)v1 + 191);
  if (*((_BYTE *)v1 + 191))
    return ProgramKey<(_AGCStreamToken)3,(AGX::DriverShaderCompilationMode)0>::addTokenToStream((uint64_t)v1, 0x4Cu, v4, v5);
  return this;
}

void *ProgramKey<(_AGCStreamToken)3,(AGX::DriverShaderCompilationMode)0>::addTokenToStream(uint64_t a1, unsigned __int8 a2, const void *a3, size_t a4)
{
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;

  v7 = a1 + 16;
  v8 = *(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16);
  std::vector<unsigned int>::resize((std::vector<unsigned int> *)(a1 + 16), ((((a4 + 3) >> 2) + 2) & 0x7FFFFFFFFFFFFFFELL) + (v8 >> 2));
  v9 = (unsigned int *)(*(_QWORD *)v7 + v8);
  *v9 = a2 | ((*(_DWORD *)(v7 + 8) - *(_QWORD *)v7) >> 2 << 8);
  return memcpy(v9 + 1, a3, a4);
}

uint64_t AGX::defaultVertexDescriptor(AGX *this)
{
  unint64_t v1;
  char v3;
  char **v4;
  char *v5;

  v1 = atomic_load(&AGX::defaultVertexDescriptor(void)::once);
  if (v1 != -1)
  {
    v5 = &v3;
    v4 = &v5;
    std::__call_once(&AGX::defaultVertexDescriptor(void)::once, &v4, (void (__cdecl *)(void *))std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultVertexDescriptor(void)::$_0 &&>>);
  }
  return AGX::defaultVertexDescriptor(void)::_desc;
}

uint64_t std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultVertexDescriptor(void)::$_0 &&>>()
{
  uint64_t v0;
  int v1;
  const char *v2;
  uint64_t result;

  v0 = operator new();
  *(_QWORD *)v0 = 0;
  *(_BYTE *)(v0 + 8) = 0;
  *(_OWORD *)(v0 + 16) = xmmword_1C3E37B60;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 72) = 1;
  *(_WORD *)(v0 + 80) = 256;
  *(_QWORD *)(v0 + 88) = 0;
  AGX::defaultVertexDescriptor(void)::_fbb = v0;
  *(_BYTE *)(v0 + 70) = 1;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 26, 1, 1);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 12, 16, 16);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 4, 1, 1);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((char *)v0, 40, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 42, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 38, 255, 255);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 36, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 34, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 32, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 28, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 24, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 22, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 20, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 18, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 16, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 14, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 10, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 8, 1, 1);
  v1 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)v0, 0);
  result = flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)v0, v1, v2);
  AGX::defaultVertexDescriptor(void)::_desc = *(_QWORD *)(AGX::defaultVertexDescriptor(void)::_fbb + 48)
                                            + **(unsigned int **)(AGX::defaultVertexDescriptor(void)::_fbb + 48);
  return result;
}

uint64_t AGX::Impl::MeshProgramKey::addToDigest(AGX::Impl::MeshProgramKey *this, CC_SHA256state_st *a2)
{
  int *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  int data;
  __int16 v33;

  v4 = (int *)AGX::defaultMeshDescriptor(this);
  result = (*(uint64_t (**)(AGX::Impl::MeshProgramKey *))(*(_QWORD *)this + 40))(this);
  v6 = *v4;
  v7 = -v6;
  v8 = (char *)v4 - v6;
  v9 = *(unsigned __int16 *)((char *)v4 - v6);
  if (v9 >= 0x15)
  {
    v10 = *((unsigned __int16 *)v8 + 10);
    if (v10)
    {
      if ((_DWORD)result == (*((_BYTE *)v4 + v10) != 0))
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  if ((result & 1) != 0)
  {
LABEL_6:
    LOBYTE(v33) = (*(uint64_t (**)(AGX::Impl::MeshProgramKey *))(*(_QWORD *)this + 40))(this);
    LOWORD(data) = 20;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, &v33, 1u);
    v11 = *v4;
    v7 = -v11;
    v9 = *(unsigned __int16 *)((char *)v4 - v11);
  }
LABEL_7:
  v12 = *((_DWORD *)this + 13);
  if (v9 < 0x17 || (v13 = *(unsigned __int16 *)((char *)v4 + v7 + 22)) == 0)
  {
    if ((v12 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (((*((_DWORD *)this + 13) & 0x200) == 0) == (*((_BYTE *)v4 + v13) != 0))
  {
LABEL_12:
    data = (v12 >> 9) & 1;
    v33 = 22;
    CC_SHA256_Update(a2, &v33, 2u);
    result = CC_SHA256_Update(a2, &data, 4u);
  }
LABEL_13:
  if (*((_QWORD *)this + 5))
  {
    LOWORD(data) = 18;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, (char *)this + 40, 8u);
  }
  v14 = *((_DWORD *)this + 14);
  v15 = *v4;
  v16 = -v15;
  v17 = (char *)v4 - v15;
  v18 = *(unsigned __int16 *)((char *)v4 - v15);
  if (v18 < 0x1D || (v19 = *((unsigned __int16 *)v17 + 14)) == 0)
  {
    if ((v14 & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  if (((*((_DWORD *)this + 14) & 0x20) == 0) == (*((_BYTE *)v4 + v19) != 0))
  {
LABEL_20:
    data = (v14 >> 5) & 1;
    v33 = 28;
    CC_SHA256_Update(a2, &v33, 2u);
    result = CC_SHA256_Update(a2, &data, 4u);
    v14 = *((_DWORD *)this + 14);
    v21 = *v4;
    v16 = -v21;
    v18 = *(unsigned __int16 *)((char *)v4 - v21);
LABEL_21:
    v20 = v14 & 0xF;
    if (v18 < 0xF)
      goto LABEL_24;
    goto LABEL_22;
  }
  v20 = v14 & 0xF;
LABEL_22:
  if (*(_WORD *)((char *)v4 + v16 + 14))
  {
    v22 = *(_QWORD *)((char *)v4 + *(unsigned __int16 *)((char *)v4 + v16 + 14));
    goto LABEL_25;
  }
LABEL_24:
  v22 = 1;
LABEL_25:
  if (v22 != v20)
  {
    data = v20;
    v33 = 14;
    CC_SHA256_Update(a2, &v33, 2u);
    result = CC_SHA256_Update(a2, &data, 4u);
    v23 = *v4;
    v16 = -v23;
    v18 = *(unsigned __int16 *)((char *)v4 - v23);
  }
  if (v18 < 7)
  {
    v24 = 0;
  }
  else
  {
    v24 = *(unsigned __int16 *)((char *)v4 + v16 + 6);
    if (*(_WORD *)((char *)v4 + v16 + 6))
      v24 = *(_QWORD *)((char *)v4 + v24);
  }
  if (v24 != *((_DWORD *)this + 15))
  {
    LOWORD(data) = 6;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, (char *)this + 60, 4u);
    v25 = *v4;
    v16 = -v25;
    v18 = *(unsigned __int16 *)((char *)v4 - v25);
  }
  if (v18 < 9)
  {
    v26 = 0;
  }
  else
  {
    v26 = *(unsigned __int16 *)((char *)v4 + v16 + 8);
    if (v26)
      v26 = *(_QWORD *)((char *)v4 + v26);
  }
  if (v26 != *((_DWORD *)this + 16))
  {
    LOWORD(data) = 8;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, (char *)this + 64, 4u);
  }
  v27 = *((_DWORD *)this + 14);
  if ((v27 & 0x80) != 0)
  {
    data = (v27 >> 7) & 1;
    v33 = 0x8000;
    CC_SHA256_Update(a2, &v33, 2u);
    result = CC_SHA256_Update(a2, &data, 4u);
    v27 = *((_DWORD *)this + 14);
  }
  if ((v27 & 0x100) != 0)
  {
    data = (v27 >> 8) & 1;
    v33 = -32767;
    CC_SHA256_Update(a2, &v33, 2u);
    result = CC_SHA256_Update(a2, &data, 4u);
  }
  v28 = (_QWORD *)((char *)this + 152);
  if (*((char *)this + 175) < 0)
  {
    v29 = *((_QWORD *)this + 20);
    if (!v29)
      goto LABEL_49;
    v28 = (_QWORD *)*v28;
    goto LABEL_48;
  }
  LODWORD(v29) = *((unsigned __int8 *)this + 175);
  if (*((_BYTE *)this + 175))
LABEL_48:
    result = CC_SHA256_Update(a2, v28, v29);
LABEL_49:
  v30 = (_QWORD *)((char *)this + 176);
  if (*((char *)this + 199) < 0)
  {
    v31 = *((_QWORD *)this + 23);
    if (!v31)
      return result;
    v30 = (_QWORD *)*v30;
    return CC_SHA256_Update(a2, v30, v31);
  }
  LODWORD(v31) = *((unsigned __int8 *)this + 199);
  if (*((_BYTE *)this + 199))
    return CC_SHA256_Update(a2, v30, v31);
  return result;
}

_QWORD *AGX::Impl::MeshProgramKey::addToSerializeStream(_QWORD *this)
{
  _QWORD *v1;
  _QWORD *v2;
  size_t v3;
  _QWORD *v4;
  size_t v5;

  v1 = this;
  v2 = this + 19;
  if (*((char *)this + 175) < 0)
  {
    v3 = this[20];
    if (!v3)
      goto LABEL_7;
    v2 = (_QWORD *)*v2;
    goto LABEL_6;
  }
  v3 = *((unsigned __int8 *)this + 175);
  if (*((_BYTE *)this + 175))
LABEL_6:
    this = ProgramKey<(_AGCStreamToken)3,(AGX::DriverShaderCompilationMode)0>::addTokenToStream((uint64_t)this, 0x4Bu, v2, v3);
LABEL_7:
  v4 = v1 + 22;
  if (*((char *)v1 + 199) < 0)
  {
    v5 = v1[23];
    if (!v5)
      return this;
    v4 = (_QWORD *)*v4;
    return ProgramKey<(_AGCStreamToken)3,(AGX::DriverShaderCompilationMode)0>::addTokenToStream((uint64_t)v1, 0x4Cu, v4, v5);
  }
  v5 = *((unsigned __int8 *)v1 + 199);
  if (*((_BYTE *)v1 + 199))
    return ProgramKey<(_AGCStreamToken)3,(AGX::DriverShaderCompilationMode)0>::addTokenToStream((uint64_t)v1, 0x4Cu, v4, v5);
  return this;
}

uint64_t AGX::defaultMeshDescriptor(AGX *this)
{
  unint64_t v1;
  char v3;
  char **v4;
  char *v5;

  v1 = atomic_load(&AGX::defaultMeshDescriptor(void)::once);
  if (v1 != -1)
  {
    v5 = &v3;
    v4 = &v5;
    std::__call_once(&AGX::defaultMeshDescriptor(void)::once, &v4, (void (__cdecl *)(void *))std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultMeshDescriptor(void)::$_0 &&>>);
  }
  return AGX::defaultMeshDescriptor(void)::_desc;
}

uint64_t std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultMeshDescriptor(void)::$_0 &&>>()
{
  uint64_t v0;
  int v1;
  const char *v2;
  uint64_t result;

  v0 = operator new();
  *(_QWORD *)v0 = 0;
  *(_BYTE *)(v0 + 8) = 0;
  *(_OWORD *)(v0 + 16) = xmmword_1C3E37B60;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 72) = 1;
  *(_WORD *)(v0 + 80) = 256;
  *(_QWORD *)(v0 + 88) = 0;
  AGX::defaultMeshDescriptor(void)::_fbb = v0;
  *(_BYTE *)(v0 + 70) = 1;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 14, 1, 1);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 10, 1, 1);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 8, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 6, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 28, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 26, 255, 255);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 24, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 22, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 20, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 16, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 12, 1, 1);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 4, 0, 0);
  v1 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)v0, 0);
  result = flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)v0, v1, v2);
  AGX::defaultMeshDescriptor(void)::_desc = *(_QWORD *)(AGX::defaultMeshDescriptor(void)::_fbb + 48)
                                          + **(unsigned int **)(AGX::defaultMeshDescriptor(void)::_fbb + 48);
  return result;
}

uint64_t AGX::Impl::ObjectProgramKey::addToDigest(AGX::Impl::ObjectProgramKey *this, CC_SHA256state_st *a2)
{
  int *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unsigned int v18;
  uint64_t v19;
  _BOOL4 v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  int data;
  __int16 v32;

  v4 = (int *)AGX::defaultObjectDescriptor(this);
  result = (*(uint64_t (**)(AGX::Impl::ObjectProgramKey *))(*(_QWORD *)this + 40))(this);
  v6 = *v4;
  v7 = -v6;
  v8 = (char *)v4 - v6;
  v9 = *(unsigned __int16 *)((char *)v4 - v6);
  if (v9 >= 0x15)
  {
    v10 = *((unsigned __int16 *)v8 + 10);
    if (v10)
    {
      if ((_DWORD)result == (*((_BYTE *)v4 + v10) != 0))
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  if ((result & 1) != 0)
  {
LABEL_6:
    LOBYTE(v32) = (*(uint64_t (**)(AGX::Impl::ObjectProgramKey *))(*(_QWORD *)this + 40))(this);
    LOWORD(data) = 20;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, &v32, 1u);
    v11 = *v4;
    v7 = -v11;
    v9 = *(unsigned __int16 *)((char *)v4 - v11);
  }
LABEL_7:
  v12 = *((_DWORD *)this + 13);
  if (v9 < 0x17 || (v13 = *(unsigned __int16 *)((char *)v4 + v7 + 22)) == 0)
  {
    if ((v12 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (((*((_DWORD *)this + 13) & 0x200) == 0) == (*((_BYTE *)v4 + v13) != 0))
  {
LABEL_12:
    data = (v12 >> 9) & 1;
    v32 = 22;
    CC_SHA256_Update(a2, &v32, 2u);
    result = CC_SHA256_Update(a2, &data, 4u);
  }
LABEL_13:
  if (*((_QWORD *)this + 5))
  {
    LOWORD(data) = 18;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, (char *)this + 40, 8u);
  }
  v14 = *((unsigned int *)this + 14);
  v15 = *v4;
  v16 = -v15;
  v17 = (char *)v4 - v15;
  v18 = *(unsigned __int16 *)((char *)v4 - v15);
  if (v18 < 0x1B || (v19 = *((unsigned __int16 *)v17 + 13)) == 0)
  {
    if ((v14 & 1) == 0)
      goto LABEL_22;
    v21 = 1;
LABEL_21:
    data = v21;
    v32 = 26;
    CC_SHA256_Update(a2, &v32, 2u);
    result = CC_SHA256_Update(a2, &data, 4u);
    LODWORD(v14) = *((_DWORD *)this + 14);
    v23 = *v4;
    v16 = -v23;
    v18 = *(unsigned __int16 *)((char *)v4 - v23);
LABEL_22:
    v22 = (v14 >> 3) & 0xF;
    if (v18 < 0xF)
      goto LABEL_25;
    goto LABEL_23;
  }
  v20 = *((unsigned __int8 *)v4 + v19) != 0;
  v21 = *((_DWORD *)this + 14) & 1;
  if ((v21 == 0) == v20)
    goto LABEL_21;
  v22 = (v14 >> 3) & 0xF;
LABEL_23:
  if (*(_WORD *)((char *)v4 + v16 + 14))
  {
    v24 = *(_QWORD *)((char *)v4 + *(unsigned __int16 *)((char *)v4 + v16 + 14));
    goto LABEL_26;
  }
LABEL_25:
  v24 = 1;
LABEL_26:
  if (v24 != v22)
  {
    data = v22;
    v32 = 14;
    CC_SHA256_Update(a2, &v32, 2u);
    result = CC_SHA256_Update(a2, &data, 4u);
    v25 = *v4;
    v16 = -v25;
    v18 = *(unsigned __int16 *)((char *)v4 - v25);
  }
  if (v18 < 7)
  {
    v26 = 0;
  }
  else
  {
    v26 = *(unsigned __int16 *)((char *)v4 + v16 + 6);
    if (*(_WORD *)((char *)v4 + v16 + 6))
      v26 = *(_QWORD *)((char *)v4 + v26);
  }
  if (v26 != *((_DWORD *)this + 15))
  {
    LOWORD(data) = 6;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, (char *)this + 60, 4u);
    v27 = *v4;
    v16 = -v27;
    v18 = *(unsigned __int16 *)((char *)v4 - v27);
  }
  if (v18 < 9)
  {
    v28 = 0;
  }
  else
  {
    v28 = *(unsigned __int16 *)((char *)v4 + v16 + 8);
    if (v28)
      v28 = *(_QWORD *)((char *)v4 + v28);
  }
  if (v28 != *((_DWORD *)this + 16))
  {
    LOWORD(data) = 8;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, (char *)this + 64, 4u);
  }
  v29 = *((_DWORD *)this + 14);
  if ((v29 & 4) != 0)
  {
    data = (v29 >> 1) & 1;
    v32 = 0x8000;
    CC_SHA256_Update(a2, &v32, 2u);
    result = CC_SHA256_Update(a2, &data, 4u);
    v30 = *((_DWORD *)this + 14);
    if ((v30 & 4) != 0)
    {
      data = (v30 >> 2) & 1;
      v32 = -32767;
      CC_SHA256_Update(a2, &v32, 2u);
      return CC_SHA256_Update(a2, &data, 4u);
    }
  }
  return result;
}

uint64_t AGX::defaultObjectDescriptor(AGX *this)
{
  unint64_t v1;
  char v3;
  char **v4;
  char *v5;

  v1 = atomic_load(&AGX::defaultObjectDescriptor(void)::once);
  if (v1 != -1)
  {
    v5 = &v3;
    v4 = &v5;
    std::__call_once(&AGX::defaultObjectDescriptor(void)::once, &v4, (void (__cdecl *)(void *))std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultObjectDescriptor(void)::$_0 &&>>);
  }
  return AGX::defaultObjectDescriptor(void)::_desc;
}

uint64_t std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultObjectDescriptor(void)::$_0 &&>>()
{
  uint64_t v0;
  int v1;
  const char *v2;
  uint64_t result;

  v0 = operator new();
  *(_QWORD *)v0 = 0;
  *(_BYTE *)(v0 + 8) = 0;
  *(_OWORD *)(v0 + 16) = xmmword_1C3E37B60;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 72) = 1;
  *(_WORD *)(v0 + 80) = 256;
  *(_QWORD *)(v0 + 88) = 0;
  AGX::defaultObjectDescriptor(void)::_fbb = v0;
  *(_BYTE *)(v0 + 70) = 1;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 14, 1, 1);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 12, 1, 1);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 10, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 8, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 6, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 26, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 24, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 22, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 20, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 16, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 4, 0, 0);
  v1 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)v0, 0);
  result = flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)v0, v1, v2);
  AGX::defaultObjectDescriptor(void)::_desc = *(_QWORD *)(AGX::defaultObjectDescriptor(void)::_fbb + 48)
                                            + **(unsigned int **)(AGX::defaultObjectDescriptor(void)::_fbb + 48);
  return result;
}

uint64_t AGX::Impl::FragmentProgramKey::addToDigest(AGX::Impl::FragmentProgramKey *this, CC_SHA256state_st *a2)
{
  uint64_t result;
  int *v5;
  unsigned int v6;
  char *v7;
  unint64_t v8;
  unsigned int v9;
  uint64_t v10;
  char *v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  char *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  unsigned int v42;
  __int16 data;

  result = AGX::defaultFragmentDescriptor(this);
  v5 = (int *)result;
  v6 = 0;
  v42 = 0;
  do
  {
    if (*((_DWORD *)this + v6 + 16))
    {
      data = 22;
      CC_SHA256_Update(a2, &data, 2u);
      CC_SHA256_Update(a2, &v42, 4u);
      v7 = (char *)this + 4 * v42 + 64;
      data = 22;
      CC_SHA256_Update(a2, &data, 2u);
      result = CC_SHA256_Update(a2, v7, 4u);
      v6 = v42;
    }
    v42 = ++v6;
  }
  while (v6 < 8);
  if (*((_DWORD *)this + 12))
  {
    LOWORD(v42) = 22;
    CC_SHA256_Update(a2, &v42, 2u);
    result = CC_SHA256_Update(a2, (char *)this + 48, 4u);
  }
  v8 = 0;
  v9 = *((_DWORD *)this + 10);
  v10 = *v5;
  v11 = (char *)v5 - v10;
  v12 = *(unsigned __int16 *)((char *)v5 - v10);
  if (v12 >= 0x27
    && (v8 = *((unsigned __int16 *)v11 + 19), *((_WORD *)v11 + 19))
    && (v8 = *((unsigned __int8 *)v5 + v8), v8 > 0xF))
  {
    v13 = 0;
  }
  else
  {
    v13 = dword_1C3E37588[v8];
  }
  if (((v9 >> 6) & 0x1F) == v13)
  {
    v14 = -v10;
  }
  else
  {
    v42 = (v9 >> 6) & 0x1F;
    data = 38;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, &v42, 4u);
    v9 = *((_DWORD *)this + 10);
    v15 = *v5;
    v14 = -v15;
    v12 = *(unsigned __int16 *)((char *)v5 - v15);
  }
  if (v12 >= 0x2B && *(_WORD *)((char *)v5 + v14 + 42))
  {
    v16 = *((unsigned __int8 *)v5 + *(unsigned __int16 *)((char *)v5 + v14 + 42));
    if (v16 > 7)
      v17 = 0;
    else
      v17 = dword_1C3E375C8[v16];
  }
  else
  {
    v17 = 1;
  }
  if ((unsigned __int16)v9 >> 12 != v17)
  {
    v42 = (unsigned __int16)v9 >> 12;
    data = 42;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, &v42, 4u);
    v9 = *((_DWORD *)this + 10);
    v18 = *v5;
    v14 = -v18;
    v12 = *(unsigned __int16 *)((char *)v5 - v18);
  }
  if (v12 >= 9 && *(_WORD *)((char *)v5 + v14 + 8))
  {
    v19 = v9 & 1;
    if ((v19 == 0) != (*((_BYTE *)v5 + *(unsigned __int16 *)((char *)v5 + v14 + 8)) != 0))
      goto LABEL_28;
    goto LABEL_27;
  }
  if ((v9 & 1) != 0)
  {
    v19 = 1;
LABEL_27:
    v42 = v19;
    data = 8;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, &v42, 4u);
    v9 = *((_DWORD *)this + 10);
    v20 = *v5;
    v14 = -v20;
    v12 = *(unsigned __int16 *)((char *)v5 - v20);
  }
LABEL_28:
  if (v12 < 0xB || !*(_WORD *)((char *)v5 + v14 + 10))
  {
    if ((v9 & 2) == 0)
      goto LABEL_34;
    goto LABEL_33;
  }
  if (((v9 & 2) == 0) == (*((_BYTE *)v5 + *(unsigned __int16 *)((char *)v5 + v14 + 10)) != 0))
  {
LABEL_33:
    v42 = (v9 >> 1) & 1;
    data = 10;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, &v42, 4u);
    v9 = *((_DWORD *)this + 10);
    v21 = *v5;
    v14 = -v21;
    v12 = *(unsigned __int16 *)((char *)v5 - v21);
  }
LABEL_34:
  v22 = (v9 >> 2) & 1;
  v23 = (char *)v5 + v14;
  if (v12 < 0x13)
  {
    if (v12 < 0x11)
    {
LABEL_41:
      v25 = -1;
      goto LABEL_42;
    }
  }
  else if (*((_WORD *)v23 + 9) && *(float *)((char *)v5 + *((unsigned __int16 *)v23 + 9)) != 1.0)
  {
    v24 = 1;
    goto LABEL_43;
  }
  if (!*((_WORD *)v23 + 8))
    goto LABEL_41;
  v25 = *(_QWORD *)((char *)v5 + *((unsigned __int16 *)v23 + 8));
LABEL_42:
  v24 = v25 != 0xFFFFFFFFLL;
LABEL_43:
  if (v22 != v24)
  {
    v42 = v22;
    data = 18;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, &v42, 4u);
  }
  if (*((_QWORD *)this + 7))
  {
    LOWORD(v42) = 28;
    CC_SHA256_Update(a2, &v42, 2u);
    result = CC_SHA256_Update(a2, (char *)this + 56, 8u);
  }
  v26 = *v5;
  v27 = *(unsigned __int16 *)((char *)v5 - v26);
  if (v27 < 0x1F)
  {
    LODWORD(v28) = 0;
  }
  else
  {
    v28 = *(unsigned __int16 *)((char *)v5 - v26 + 30);
    if (*(_WORD *)((char *)v5 - v26 + 30))
      LODWORD(v28) = *((unsigned __int8 *)v5 + v28) != 0;
  }
  if (*((unsigned __int8 *)this + 224) == (_DWORD)v28)
  {
    v29 = -v26;
  }
  else
  {
    LOWORD(v42) = 30;
    CC_SHA256_Update(a2, &v42, 2u);
    result = CC_SHA256_Update(a2, (char *)this + 224, 1u);
    v30 = *v5;
    v29 = -v30;
    v27 = *(unsigned __int16 *)((char *)v5 - v30);
  }
  v31 = *((_DWORD *)this + 26);
  if (v27 >= 0x33 && *(_WORD *)((char *)v5 + v29 + 50))
  {
    if (((*((_DWORD *)this + 26) & 4) == 0) != (*((_BYTE *)v5 + *(unsigned __int16 *)((char *)v5 + v29 + 50)) != 0))
      goto LABEL_61;
  }
  else if ((v31 & 4) == 0)
  {
    goto LABEL_60;
  }
  v42 = (v31 >> 2) & 1;
  data = 50;
  CC_SHA256_Update(a2, &data, 2u);
  result = CC_SHA256_Update(a2, &v42, 4u);
  v31 = *((_DWORD *)this + 26);
  v32 = *v5;
  v29 = -v32;
  v27 = *(unsigned __int16 *)((char *)v5 - v32);
LABEL_60:
  if (v27 < 0x21)
    goto LABEL_64;
LABEL_61:
  if (!*(_WORD *)((char *)v5 + v29 + 32))
  {
LABEL_64:
    if ((v31 & 0x40) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
  if (((v31 & 0x40) == 0) == (*((_BYTE *)v5 + *(unsigned __int16 *)((char *)v5 + v29 + 32)) != 0))
  {
LABEL_65:
    v42 = (v31 >> 6) & 1;
    data = 32;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, &v42, 4u);
  }
LABEL_66:
  v33 = *((_DWORD *)this + 36);
  if ((_BYTE)v33)
  {
    LOWORD(v42) = 22;
    CC_SHA256_Update(a2, &v42, 2u);
    CC_SHA256_Update(a2, (char *)this + 112, 0x20u);
    v42 = *((unsigned __int8 *)this + 144);
    data = 22;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, &v42, 4u);
    v33 = *((_DWORD *)this + 36);
  }
  v34 = *v5;
  v35 = *(unsigned __int16 *)((char *)v5 - v34);
  if (v35 >= 0xD && *(_WORD *)((char *)v5 - v34 + 12))
    v36 = *(_QWORD *)((char *)v5 + *(unsigned __int16 *)((char *)v5 - v34 + 12));
  else
    v36 = 1;
  if (v36 == ((v33 >> 8) & 0xF))
  {
    v37 = -v34;
  }
  else
  {
    v42 = (v33 >> 8) & 0xF;
    data = 12;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, &v42, 4u);
    v33 = *((_DWORD *)this + 36);
    v38 = *v5;
    v37 = -v38;
    v35 = *(unsigned __int16 *)((char *)v5 - v38);
  }
  v39 = (unsigned __int16)v33 >> 12;
  if (v35 < 0xF)
  {
    v40 = 0;
  }
  else
  {
    v40 = *(unsigned __int16 *)((char *)v5 + v37 + 14);
    if (*(_WORD *)((char *)v5 + v37 + 14))
      v40 = *(_QWORD *)((char *)v5 + v40);
  }
  if (v40 != v39)
  {
    v42 = v39;
    data = 14;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, &v42, 4u);
  }
  v41 = *((_DWORD *)this + 26);
  if ((v41 & 0x100) != 0)
  {
    v42 = (v41 >> 8) & 1;
    data = 0x8000;
    CC_SHA256_Update(a2, &data, 2u);
    return CC_SHA256_Update(a2, &v42, 4u);
  }
  return result;
}

uint64_t AGX::Impl::FragmentProgramKey::legalizeStateForTargetOS(uint64_t a1, _QWORD *a2)
{
  unint64_t v2;
  uint64_t i;
  int8x8_t v4;
  int32x2_t v5;

  v2 = a2[1];
  if ((v2 & 0x1000A0011000E00) != 0 && (*a2 & v2) < (v2 & 0x1000A0011000E00))
  {
    for (i = 0; i != 32; i += 8)
    {
      v4 = *(int8x8_t *)(a1 + i + 112);
      v5 = vceq_s32((int32x2_t)vand_s8(v4, (int8x8_t)0x1F0000001FLL), (int32x2_t)0x1600000016);
      if ((v5.i8[0] & 1) != 0)
        *(_DWORD *)(a1 + i + 112) = v4.i32[0] & 0xFFFFFFE0 | 0xF;
      if ((v5.i8[4] & 1) != 0)
        *(_DWORD *)(a1 + i + 116) = v4.i32[1] & 0xFFFFFFE0 | 0xF;
    }
  }
  return 1;
}

void AGX::Impl::FragmentProgramKey::serialize(AGX::Impl::FragmentProgramKey *this, const void **a2, unint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  _QWORD *v15;
  size_t v16;
  _QWORD *v17;
  size_t v18;

  ProgramKey<(_AGCStreamToken)8,(AGX::DriverShaderCompilationMode)0>::initializeStream((uint64_t)this);
  v6 = *((_QWORD *)this + 3) - *((_QWORD *)this + 2);
  std::vector<unsigned int>::resize((std::vector<unsigned int> *)((char *)this + 16), (v6 >> 2) + 20);
  v7 = *((_QWORD *)this + 2) + v6;
  *(_DWORD *)v7 = ((*((_DWORD *)this + 6) - *((_QWORD *)this + 2)) >> 2 << 8) | 0x3F;
  *(_OWORD *)(v7 + 4) = *(_OWORD *)((char *)this + 40);
  v8 = *(_OWORD *)((char *)this + 56);
  v9 = *(_OWORD *)((char *)this + 72);
  v10 = *(_OWORD *)((char *)this + 88);
  *(_QWORD *)(v7 + 68) = *((_QWORD *)this + 13);
  *(_OWORD *)(v7 + 52) = v10;
  *(_OWORD *)(v7 + 36) = v9;
  *(_OWORD *)(v7 + 20) = v8;
  v11 = *((_QWORD *)this + 3) - *((_QWORD *)this + 2);
  std::vector<unsigned int>::resize((std::vector<unsigned int> *)((char *)this + 16), (v11 >> 2) + 12);
  v12 = *((_QWORD *)this + 2) + v11;
  *(_DWORD *)v12 = ((*((_DWORD *)this + 6) - *((_QWORD *)this + 2)) >> 2 << 8) | 0x42;
  v13 = *((_OWORD *)this + 7);
  v14 = *((_OWORD *)this + 8);
  *(_QWORD *)(v12 + 36) = *((_QWORD *)this + 18);
  *(_OWORD *)(v12 + 20) = v14;
  *(_OWORD *)(v12 + 4) = v13;
  v15 = (_QWORD *)((char *)this + 152);
  if (*((char *)this + 175) < 0)
  {
    v16 = *((_QWORD *)this + 20);
    if (!v16)
      goto LABEL_7;
    v15 = (_QWORD *)*v15;
    goto LABEL_6;
  }
  v16 = *((unsigned __int8 *)this + 175);
  if (*((_BYTE *)this + 175))
LABEL_6:
    ProgramKey<(_AGCStreamToken)3,(AGX::DriverShaderCompilationMode)0>::addTokenToStream((uint64_t)this, 0x4Bu, v15, v16);
LABEL_7:
  v17 = (_QWORD *)((char *)this + 176);
  if ((*((char *)this + 199) & 0x80000000) == 0)
  {
    v18 = *((unsigned __int8 *)this + 199);
    if (!*((_BYTE *)this + 199))
      goto LABEL_13;
    goto LABEL_12;
  }
  v18 = *((_QWORD *)this + 23);
  if (v18)
  {
    v17 = (_QWORD *)*v17;
LABEL_12:
    ProgramKey<(_AGCStreamToken)3,(AGX::DriverShaderCompilationMode)0>::addTokenToStream((uint64_t)this, 0x4Cu, v17, v18);
  }
LABEL_13:
  ProgramKey<(_AGCStreamToken)8,(AGX::DriverShaderCompilationMode)0>::finalizeStream(this);
  *a2 = (const void *)*((_QWORD *)this + 2);
  *a3 = *((_QWORD *)this + 3) - *((_QWORD *)this + 2);
}

uint64_t AGX::Impl::FragmentProgramKey::getSupportIndirectCommandBuffers(AGX::Impl::FragmentProgramKey *this)
{
  return *((unsigned __int8 *)this + 224);
}

uint64_t AGX::defaultFragmentDescriptor(AGX *this)
{
  unint64_t v1;
  char v3;
  char **v4;
  char *v5;

  v1 = atomic_load(&AGX::defaultFragmentDescriptor(void)::once);
  if (v1 != -1)
  {
    v5 = &v3;
    v4 = &v5;
    std::__call_once(&AGX::defaultFragmentDescriptor(void)::once, &v4, (void (__cdecl *)(void *))std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultFragmentDescriptor(void)::$_0 &&>>);
  }
  return AGX::defaultFragmentDescriptor(void)::_desc;
}

uint64_t std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultFragmentDescriptor(void)::$_0 &&>>()
{
  uint64_t v0;
  int v1;
  const char *v2;
  uint64_t result;

  v0 = operator new();
  *(_QWORD *)v0 = 0;
  *(_BYTE *)(v0 + 8) = 0;
  *(_OWORD *)(v0 + 16) = xmmword_1C3E37B60;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 72) = 1;
  *(_WORD *)(v0 + 80) = 256;
  *(_QWORD *)(v0 + 88) = 0;
  AGX::defaultFragmentDescriptor(void)::_fbb = v0;
  *(_BYTE *)(v0 + 70) = 1;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 16, -1, -1);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 14, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 12, 1, 1);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 4, 1, 1);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((char *)v0, 52, 0);
  flatbuffers::FlatBufferBuilder::AddElement<float>((char *)v0, 18, 1.0, 1.0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned short>((char *)v0, 26);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned short>((char *)v0, 24);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 50, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 48, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 46, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 44, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 42, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 40, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 38, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 36, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 34, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 32, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 30, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 20, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 10, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 8, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 6, 1, 1);
  v1 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)v0, 0);
  result = flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)v0, v1, v2);
  AGX::defaultFragmentDescriptor(void)::_desc = *(_QWORD *)(AGX::defaultFragmentDescriptor(void)::_fbb + 48)
                                              + **(unsigned int **)(AGX::defaultFragmentDescriptor(void)::_fbb + 48);
  return result;
}

char *flatbuffers::FlatBufferBuilder::AddElement<unsigned short>(char *result, uint64_t a2)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  if (result[80])
  {
    v3 = result;
    flatbuffers::FlatBufferBuilder::Align((flatbuffers::FlatBufferBuilder *)result, 2uLL);
    v4 = *((_QWORD *)v3 + 6);
    if ((unint64_t)(v4 - *((_QWORD *)v3 + 7)) <= 1)
    {
      flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)v3, 2uLL);
      v4 = *((_QWORD *)v3 + 6);
    }
    *(_WORD *)(v4 - 2) = 0;
    v5 = v4 - 2;
    *((_QWORD *)v3 + 6) = v5;
    return flatbuffers::FlatBufferBuilder::TrackField(v3, a2, *((_DWORD *)v3 + 8) - (int)v5 + *((_DWORD *)v3 + 10));
  }
  return result;
}

uint64_t AGX::Impl::TileProgramKey::addToDigest(AGX::Impl::TileProgramKey *this, CC_SHA256state_st *a2)
{
  uint64_t result;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unsigned int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned __int16 *v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int data;
  __int16 v26;

  result = AGX::defaultTileDescriptor(this);
  v5 = (int *)result;
  if (*((_DWORD *)this + 12))
  {
    LOWORD(data) = 14;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, (char *)this + 48, 4u);
  }
  v6 = *v5;
  v7 = -v6;
  v8 = (char *)v5 - v6;
  v9 = *(unsigned __int16 *)((char *)v5 - v6);
  if (v9 < 5 || (v10 = *((unsigned __int16 *)v8 + 2)) == 0)
  {
    if ((*((_DWORD *)this + 39) & 1) == 0)
      goto LABEL_10;
    v11 = 1;
    goto LABEL_9;
  }
  v11 = *((_DWORD *)this + 39) & 1;
  if ((v11 == 0) == (*((_BYTE *)v5 + v10) != 0))
  {
LABEL_9:
    data = v11;
    v26 = 4;
    CC_SHA256_Update(a2, &v26, 2u);
    result = CC_SHA256_Update(a2, &data, 4u);
    v12 = *v5;
    v7 = -v12;
    v9 = *(unsigned __int16 *)((char *)v5 - v12);
  }
LABEL_10:
  if (v9 < 7)
  {
    v13 = 0;
  }
  else
  {
    v13 = *(unsigned __int16 *)((char *)v5 + v7 + 6);
    if (v13)
      v13 = *(_QWORD *)((char *)v5 + v13);
  }
  if (v13 != *((_DWORD *)this + 38))
  {
    LOWORD(data) = 6;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, (char *)this + 152, 4u);
  }
  if (*((_QWORD *)this + 7))
  {
    LOWORD(data) = 16;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, (char *)this + 56, 8u);
  }
  v14 = *((_DWORD *)this + 26);
  v15 = (unsigned __int16 *)((char *)v5 - *v5);
  if (*v15 < 0x13u || (v16 = v15[9]) == 0)
  {
    if ((v14 & 0x40) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
  if (((*((_DWORD *)this + 26) & 0x40) == 0) == (*((_BYTE *)v5 + v16) != 0))
  {
LABEL_23:
    data = (v14 >> 6) & 1;
    v26 = 18;
    CC_SHA256_Update(a2, &v26, 2u);
    result = CC_SHA256_Update(a2, &data, 4u);
  }
LABEL_24:
  v17 = *((_DWORD *)this + 36);
  if ((_BYTE)v17)
  {
    LOWORD(data) = 14;
    CC_SHA256_Update(a2, &data, 2u);
    CC_SHA256_Update(a2, (char *)this + 112, 0x20u);
    data = *((unsigned __int8 *)this + 144);
    v26 = 14;
    CC_SHA256_Update(a2, &v26, 2u);
    result = CC_SHA256_Update(a2, &data, 4u);
    v17 = *((_DWORD *)this + 36);
  }
  v18 = *v5;
  v19 = *(unsigned __int16 *)((char *)v5 - v18);
  if (v19 >= 0xB && *(_WORD *)((char *)v5 - v18 + 10))
    v20 = *(_QWORD *)((char *)v5 + *(unsigned __int16 *)((char *)v5 - v18 + 10));
  else
    v20 = 1;
  if (v20 == ((v17 >> 8) & 0xF))
  {
    v21 = -v18;
  }
  else
  {
    data = (v17 >> 8) & 0xF;
    v26 = 10;
    CC_SHA256_Update(a2, &v26, 2u);
    result = CC_SHA256_Update(a2, &data, 4u);
    v17 = *((_DWORD *)this + 36);
    v22 = *v5;
    v21 = -v22;
    v19 = *(unsigned __int16 *)((char *)v5 - v22);
  }
  v23 = (unsigned __int16)v17 >> 12;
  if (v19 < 0xD)
  {
    v24 = 0;
  }
  else
  {
    v24 = *(unsigned __int16 *)((char *)v5 + v21 + 12);
    if (*(_WORD *)((char *)v5 + v21 + 12))
      v24 = *(_QWORD *)((char *)v5 + v24);
  }
  if (v24 != v23)
  {
    data = v23;
    v26 = 12;
    CC_SHA256_Update(a2, &v26, 2u);
    return CC_SHA256_Update(a2, &data, 4u);
  }
  return result;
}

void AGX::Impl::TileProgramKey::serialize(AGX::Impl::TileProgramKey *this, const void **a2, unint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  ProgramKey<(_AGCStreamToken)8,(AGX::DriverShaderCompilationMode)0>::initializeStream((uint64_t)this);
  v6 = *((_QWORD *)this + 3) - *((_QWORD *)this + 2);
  std::vector<unsigned int>::resize((std::vector<unsigned int> *)((char *)this + 16), (v6 >> 2) + 20);
  v7 = *((_QWORD *)this + 2) + v6;
  *(_DWORD *)v7 = ((*((_DWORD *)this + 6) - *((_QWORD *)this + 2)) >> 2 << 8) | 0x3F;
  *(_OWORD *)(v7 + 4) = *(_OWORD *)((char *)this + 40);
  v8 = *(_OWORD *)((char *)this + 56);
  v9 = *(_OWORD *)((char *)this + 72);
  v10 = *(_OWORD *)((char *)this + 88);
  *(_QWORD *)(v7 + 68) = *((_QWORD *)this + 13);
  *(_OWORD *)(v7 + 52) = v10;
  *(_OWORD *)(v7 + 36) = v9;
  *(_OWORD *)(v7 + 20) = v8;
  v11 = *((_QWORD *)this + 3) - *((_QWORD *)this + 2);
  std::vector<unsigned int>::resize((std::vector<unsigned int> *)((char *)this + 16), (v11 >> 2) + 12);
  v12 = *((_QWORD *)this + 2) + v11;
  *(_DWORD *)v12 = ((*((_DWORD *)this + 6) - *((_QWORD *)this + 2)) >> 2 << 8) | 0x42;
  v13 = *((_OWORD *)this + 7);
  v14 = *((_OWORD *)this + 8);
  *(_QWORD *)(v12 + 36) = *((_QWORD *)this + 18);
  *(_OWORD *)(v12 + 20) = v14;
  *(_OWORD *)(v12 + 4) = v13;
  v15 = *((_QWORD *)this + 3) - *((_QWORD *)this + 2);
  std::vector<unsigned int>::resize((std::vector<unsigned int> *)((char *)this + 16), (v15 >> 2) + 4);
  v16 = *((_QWORD *)this + 2) + v15;
  *(_DWORD *)v16 = ((*((_DWORD *)this + 6) - *((_QWORD *)this + 2)) >> 2 << 8) | 0x43;
  *(_QWORD *)(v16 + 4) = *((_QWORD *)this + 19);
  ProgramKey<(_AGCStreamToken)8,(AGX::DriverShaderCompilationMode)0>::finalizeStream(this);
  *a2 = (const void *)*((_QWORD *)this + 2);
  *a3 = *((_QWORD *)this + 3) - *((_QWORD *)this + 2);
}

uint64_t AGX::defaultTileDescriptor(AGX *this)
{
  unint64_t v1;
  char v3;
  char **v4;
  char *v5;

  v1 = atomic_load(&AGX::defaultTileDescriptor(void)::once);
  if (v1 != -1)
  {
    v5 = &v3;
    v4 = &v5;
    std::__call_once(&AGX::defaultTileDescriptor(void)::once, &v4, (void (__cdecl *)(void *))std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultTileDescriptor(void)::$_0 &&>>);
  }
  return AGX::defaultTileDescriptor(void)::_desc;
}

uint64_t std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultTileDescriptor(void)::$_0 &&>>()
{
  uint64_t v0;
  int v1;
  const char *v2;
  uint64_t result;

  v0 = operator new();
  *(_QWORD *)v0 = 0;
  *(_BYTE *)(v0 + 8) = 0;
  *(_OWORD *)(v0 + 16) = xmmword_1C3E37B60;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 72) = 1;
  *(_WORD *)(v0 + 80) = 256;
  *(_QWORD *)(v0 + 88) = 0;
  AGX::defaultTileDescriptor(void)::_fbb = v0;
  *(_BYTE *)(v0 + 70) = 1;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 12, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 10, 1, 1);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 8, 1, 1);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 6, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 20, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 18, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 4, 0, 0);
  v1 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)v0, 0);
  result = flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)v0, v1, v2);
  AGX::defaultTileDescriptor(void)::_desc = *(_QWORD *)(AGX::defaultTileDescriptor(void)::_fbb + 48)
                                          + **(unsigned int **)(AGX::defaultTileDescriptor(void)::_fbb + 48);
  return result;
}

uint64_t AGX::Impl::ComputeProgramKey::addToDigest(AGX::Impl::ComputeProgramKey *this, CC_SHA256state_st *a2)
{
  uint64_t result;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  int v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  int data;
  __int16 v22;

  result = AGX::defaultComputeDescriptor(this);
  v5 = (int *)result;
  if (*((_QWORD *)this + 5))
  {
    LOWORD(data) = 12;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, (char *)this + 40, 8u);
  }
  v6 = 0;
  v7 = *v5;
  v8 = (char *)v5 - v7;
  v9 = *(unsigned __int16 *)((char *)v5 - v7);
  if (v9 >= 7)
  {
    v6 = *((unsigned __int16 *)v8 + 3);
    if (*((_WORD *)v8 + 3))
      v6 = *(_QWORD *)((char *)v5 + v6);
  }
  if (v6 == *((_DWORD *)this + 12))
  {
    v10 = -v7;
  }
  else
  {
    LOWORD(data) = 6;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, (char *)this + 48, 4u);
    v11 = *v5;
    v10 = -v11;
    v9 = *(unsigned __int16 *)((char *)v5 - v11);
  }
  v12 = *((_DWORD *)this + 14);
  if (v9 >= 5 && *(_WORD *)((char *)v5 + v10 + 4))
  {
    v13 = *((_DWORD *)this + 14) & 1;
    if ((v13 == 0) != (*((_BYTE *)v5 + *(unsigned __int16 *)((char *)v5 + v10 + 4)) != 0))
      goto LABEL_16;
    goto LABEL_15;
  }
  if ((v12 & 1) != 0)
  {
    v13 = 1;
LABEL_15:
    data = v13;
    v22 = 4;
    CC_SHA256_Update(a2, &v22, 2u);
    result = CC_SHA256_Update(a2, &data, 4u);
    v12 = *((_DWORD *)this + 14);
    v14 = *v5;
    v10 = -v14;
    v9 = *(unsigned __int16 *)((char *)v5 - v14);
  }
LABEL_16:
  if (v9 >= 0x15 && *(_WORD *)((char *)v5 + v10 + 20))
  {
    if (((v12 & 2) == 0) != (*((_BYTE *)v5 + *(unsigned __int16 *)((char *)v5 + v10 + 20)) != 0))
    {
      v16 = (char *)this + 88;
      v15 = *((unsigned __int8 *)this + 88);
      goto LABEL_23;
    }
  }
  else if ((v12 & 2) == 0)
  {
    goto LABEL_22;
  }
  data = (v12 >> 1) & 1;
  v22 = 20;
  CC_SHA256_Update(a2, &v22, 2u);
  result = CC_SHA256_Update(a2, &data, 4u);
  v17 = *v5;
  v10 = -v17;
  v9 = *(unsigned __int16 *)((char *)v5 - v17);
LABEL_22:
  v16 = (char *)this + 88;
  v15 = *((unsigned __int8 *)this + 88);
  if (v9 < 0xF)
  {
    LODWORD(v18) = 0;
    goto LABEL_26;
  }
LABEL_23:
  v18 = *(unsigned __int16 *)((char *)v5 + v10 + 14);
  if (*(_WORD *)((char *)v5 + v10 + 14))
    LODWORD(v18) = *((unsigned __int8 *)v5 + v18) != 0;
LABEL_26:
  if (v15 != (_DWORD)v18)
  {
    LOWORD(data) = 14;
    CC_SHA256_Update(a2, &data, 2u);
    result = CC_SHA256_Update(a2, v16, 1u);
    v19 = *v5;
    v10 = -v19;
    v9 = *(unsigned __int16 *)((char *)v5 - v19);
  }
  v20 = *((_DWORD *)this + 14);
  if (v9 < 0x11 || !*(_WORD *)((char *)v5 + v10 + 16))
  {
    if ((v20 & 0x20) == 0)
      return result;
    goto LABEL_33;
  }
  if (((*((_DWORD *)this + 14) & 0x20) == 0) == (*((_BYTE *)v5 + *(unsigned __int16 *)((char *)v5 + v10 + 16)) != 0))
  {
LABEL_33:
    data = (v20 >> 5) & 1;
    v22 = 16;
    CC_SHA256_Update(a2, &v22, 2u);
    return CC_SHA256_Update(a2, &data, 4u);
  }
  return result;
}

void AGX::Impl::ComputeProgramKey::serialize(AGX::Impl::ComputeProgramKey *this, const void **a2, unint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  ProgramKey<(_AGCStreamToken)8,(AGX::DriverShaderCompilationMode)0>::initializeStream((uint64_t)this);
  v6 = *((_QWORD *)this + 3) - *((_QWORD *)this + 2);
  std::vector<unsigned int>::resize((std::vector<unsigned int> *)((char *)this + 16), (v6 >> 2) + 8);
  v7 = *((_QWORD *)this + 2) + v6;
  *(_DWORD *)v7 = ((*((_DWORD *)this + 6) - *((_QWORD *)this + 2)) >> 2 << 8) | 0x4E;
  v8 = *(_OWORD *)((char *)this + 40);
  *(_QWORD *)(v7 + 20) = *((_QWORD *)this + 7);
  *(_OWORD *)(v7 + 4) = v8;
  ProgramKey<(_AGCStreamToken)8,(AGX::DriverShaderCompilationMode)0>::finalizeStream(this);
  *a2 = (const void *)*((_QWORD *)this + 2);
  *a3 = *((_QWORD *)this + 3) - *((_QWORD *)this + 2);
}

uint64_t AGX::Impl::ComputeProgramKey::getSupportIndirectCommandBuffers(AGX::Impl::ComputeProgramKey *this)
{
  return *((unsigned __int8 *)this + 88);
}

uint64_t AGX::defaultComputeDescriptor(AGX *this)
{
  unint64_t v1;
  char v3;
  char **v4;
  char *v5;

  v1 = atomic_load(&AGX::defaultComputeDescriptor(void)::once);
  if (v1 != -1)
  {
    v5 = &v3;
    v4 = &v5;
    std::__call_once(&AGX::defaultComputeDescriptor(void)::once, &v4, (void (__cdecl *)(void *))std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultComputeDescriptor(void)::$_0 &&>>);
  }
  return AGX::defaultComputeDescriptor(void)::_desc;
}

uint64_t std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultComputeDescriptor(void)::$_0 &&>>()
{
  uint64_t v0;
  int v1;
  const char *v2;
  uint64_t result;

  v0 = operator new();
  *(_QWORD *)v0 = 0;
  *(_BYTE *)(v0 + 8) = 0;
  *(_OWORD *)(v0 + 16) = xmmword_1C3E37B60;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 72) = 1;
  *(_WORD *)(v0 + 80) = 256;
  *(_QWORD *)(v0 + 88) = 0;
  AGX::defaultComputeDescriptor(void)::_fbb = v0;
  *(_BYTE *)(v0 + 70) = 1;
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 8, 1, 1);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>((char *)v0, 6, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 20, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 18, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 16, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 14, 0, 0);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned char>((char *)v0, 4, 0, 0);
  v1 = flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)v0, 0);
  result = flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)v0, v1, v2);
  AGX::defaultComputeDescriptor(void)::_desc = *(_QWORD *)(AGX::defaultComputeDescriptor(void)::_fbb + 48)
                                             + **(unsigned int **)(AGX::defaultComputeDescriptor(void)::_fbb + 48);
  return result;
}

AGX *AGX::Impl::VertexProgramKey::initCommon(AGX *result, AGX *a2)
{
  AGX *v2;
  AGX *v3;
  uint64_t v4;
  unsigned __int16 *v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int16 *v8;
  uint64_t v9;
  unint64_t v10;
  unsigned __int16 *v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  unsigned __int16 *v15;
  unint64_t v16;
  unint64_t v17;
  unsigned __int16 *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unsigned __int16 *v22;
  unint64_t v23;
  unint64_t v24;
  unsigned __int16 *v25;
  unsigned int v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unsigned __int16 *v30;
  unint64_t v31;
  unint64_t v32;
  unsigned __int16 *v33;
  unint64_t v34;
  unsigned __int16 *v35;
  uint64_t v36;

  v2 = a2;
  v3 = result;
  if (!a2)
  {
    result = (AGX *)AGX::defaultVertexDescriptor(result);
    v2 = result;
  }
  v4 = *((_QWORD *)v3 + 7) | 0xFFLL;
  *((_QWORD *)v3 + 7) = v4;
  *((_DWORD *)v3 + 12) = 0;
  v5 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v5 < 0x15u)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v6 = v5[10];
    if (v6)
      LOBYTE(v6) = *((_BYTE *)v2 + v6);
  }
  v7 = v4 & 0xFFFFFFFFFFFFF3FFLL | ((unint64_t)(v6 & 3) << 10);
  *((_QWORD *)v3 + 7) = v7;
  v8 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v8 < 0x19u)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    v9 = v8[12];
    if (v9)
      LOBYTE(v9) = *((_BYTE *)v2 + v9);
  }
  v10 = v7 & 0xFFFFFFFFFFFFFCFFLL | ((unint64_t)(v9 & 3) << 8);
  *((_QWORD *)v3 + 7) = v10;
  v11 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  v12 = *v11;
  if (v12 <= 0x1E)
  {
    LODWORD(v14) = 0;
    *((_QWORD *)v3 + 5) = 0;
  }
  else
  {
    if (v11[15])
      v13 = (unint64_t)v2 + v11[15] + *(unsigned int *)((char *)v2 + v11[15]);
    else
      v13 = 0;
    result = (AGX *)AGX::mutableBufferMaskFromBufferDescriptorArray<flatbuffers::Vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>>>(v13);
    *((_QWORD *)v3 + 5) = result;
    if (v12 < 0x21)
    {
      LODWORD(v14) = 0;
    }
    else
    {
      v14 = v11[16];
      if (v11[16])
        LODWORD(v14) = *((unsigned __int8 *)v2 + v14) != 0;
    }
  }
  *((_DWORD *)v3 + 22) = *((_DWORD *)v3 + 22) & 0xFFFFFFFE | v14;
  v15 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v15 < 0x1Du)
  {
    v16 = 0;
  }
  else
  {
    v16 = v15[14];
    if (v16)
      v16 = (unint64_t)(*((_BYTE *)v2 + v16) & 3) << 12;
  }
  v17 = v16 | v10 & 0xFFFFFFFFFFFFCFFFLL;
  *((_QWORD *)v3 + 7) = v17;
  v18 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v18 >= 0x1Bu && (v19 = v18[13]) != 0)
    v20 = (unint64_t)(*(_DWORD *)((_BYTE *)v2 + v19) & 0xF) << 14;
  else
    v20 = 0x4000;
  v21 = v20 | v17 & 0xFFFFFFFFFFFC3FFFLL;
  *((_QWORD *)v3 + 7) = v21;
  v22 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v22 < 0x2Bu)
  {
    v23 = 0;
  }
  else
  {
    v23 = v22[21];
    if (v23)
      v23 = (unint64_t)(*((_BYTE *)v2 + v23) != 0) << 19;
  }
  v24 = v23 | v21 & 0xFFFFFFFFFFF7FFFFLL;
  *((_QWORD *)v3 + 7) = v24;
  v25 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  v26 = *v25;
  if (v26 < 9)
    goto LABEL_40;
  if (!v25[4])
  {
    if (v26 >= 0xB)
      goto LABEL_38;
LABEL_40:
    v27 = 0;
    goto LABEL_41;
  }
  v27 = 0;
  if (v26 >= 0xB && *((_BYTE *)v2 + v25[4]))
  {
LABEL_38:
    v28 = v25[5];
    if (v28)
    {
      v27 = (unint64_t)(*((_BYTE *)v2 + v28) == 1) << 20;
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_41:
  v29 = v27 | v24 & 0xFFFFFFFFFFEFFFFFLL;
  *((_QWORD *)v3 + 7) = v29;
  v30 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v30 < 0x11u)
  {
    v31 = 0;
  }
  else
  {
    v31 = v30[8];
    if (v31)
      v31 = (unint64_t)(*((_BYTE *)v2 + v31) & 1) << 22;
  }
  v32 = v31 | v29 & 0xFFFFFFFFFFBFFFFFLL;
  *((_QWORD *)v3 + 7) = v32;
  v33 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v33 < 0x23u)
  {
    v34 = 0;
  }
  else
  {
    v34 = v33[17];
    if (v34)
      v34 = (unint64_t)(*((_BYTE *)v2 + v34) != 0) << 25;
  }
  *((_QWORD *)v3 + 7) = v34 | v32 & 0xFFFFFFFFFDFFFFFFLL;
  v35 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v35 < 0x23u)
  {
    LODWORD(v36) = 0;
  }
  else
  {
    v36 = v35[17];
    if (v36)
      LODWORD(v36) = (*((_BYTE *)v2 + v36) != 0) << 9;
  }
  *((_DWORD *)v3 + 13) = *((_DWORD *)v3 + 13) & 0xFFFFFDFF | v36;
  return result;
}

unint64_t AGX::mutableBufferMaskFromBufferDescriptorArray<flatbuffers::Vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>>>(unint64_t result)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  int *v5;
  unsigned __int16 *v6;
  uint64_t v7;
  uint64_t v8;

  if (result)
  {
    v1 = result;
    LODWORD(v2) = *(_DWORD *)result;
    if (*(_DWORD *)result >= 0x1Fu)
      v2 = 31;
    else
      v2 = v2;
    if ((_DWORD)v2)
    {
      v3 = 0;
      result = 0;
      v4 = v1 + 4;
      do
      {
        v5 = (int *)(v4 + 4 * v3 + *(unsigned int *)(v4 + 4 * v3));
        v6 = (unsigned __int16 *)((char *)v5 - *v5);
        if (*v6 >= 5u)
        {
          v7 = v6[2];
          if (v7)
          {
            if (*((_BYTE *)v5 + v7) == 1)
              v8 = 1 << v3;
            else
              v8 = 0;
            result |= v8;
          }
        }
        ++v3;
      }
      while (v3 != v2);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

AGX *AGX::Impl::FragmentProgramKey::initCommon(AGX *result, AGX *a2)
{
  AGX *v2;
  AGX *v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  char *v24;
  uint64_t v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  char *v29;
  uint64_t v30;
  unsigned int v31;
  int v32;
  unsigned int v33;
  char *v34;
  uint64_t v35;
  unsigned int v36;
  int v37;
  unsigned int v38;
  char *v39;
  uint64_t v40;
  unsigned int v41;
  int v42;
  unsigned int v43;
  char *v44;
  uint64_t v45;
  unint64_t v46;
  int v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  int v57;
  unsigned int v58;
  unsigned __int16 *v59;
  uint64_t v60;
  unint64_t v61;
  int v62;
  unsigned int v63;
  unsigned __int16 *v64;
  uint64_t v65;
  int v66;
  unsigned __int16 *v67;
  uint64_t v68;
  int v69;
  unsigned __int16 *v70;
  unsigned int v71;
  int v72;
  uint64_t v73;
  int v74;
  int v75;
  unsigned __int16 *v76;
  unsigned int v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  unsigned __int16 *v82;
  uint64_t v83;
  unsigned __int16 *v84;
  uint64_t v85;

  v2 = a2;
  v3 = result;
  if (!a2)
  {
    result = (AGX *)AGX::defaultFragmentDescriptor(result);
    v2 = result;
  }
  v4 = 0;
  v5 = *(int *)v2;
  v6 = (char *)v2 - v5;
  v7 = *(unsigned __int16 *)((char *)v2 - v5);
  if (v7 < 0x17)
    goto LABEL_64;
  v8 = -v5;
  v9 = *((unsigned __int16 *)v6 + 11);
  if (*((_WORD *)v6 + 11))
  {
    v10 = (char *)v2 + v9;
    v11 = *(unsigned int *)((char *)v2 + v9);
    v12 = *(unsigned int *)((char *)v2 + v9 + v11);
    if ((_DWORD)v12)
    {
      v13 = 0;
      v14 = (char *)v3 + 64;
      v15 = v9 + v11;
      result = (AGX *)dword_1C3E37554;
      while (1)
      {
        v16 = *(unsigned int *)((char *)v2 + v15 + 4);
        v17 = (char *)v2 + v15 + v16;
        v18 = *((int *)v17 + 1);
        v19 = (char *)v2 + v15 + v16 - v18;
        v20 = *((unsigned __int16 *)v19 + 2);
        if (v20 < 5)
          goto LABEL_49;
        v21 = *((unsigned __int16 *)v19 + 4);
        if (!v21 || !*(_WORD *)((char *)v2 + v15 + v16 + v21 + 4))
          goto LABEL_49;
        v22 = -v18;
        if (v20 >= 9)
        {
          if (!*(_WORD *)((char *)v2 + v15 + v16 - v18 + 12)
            || !*((_BYTE *)v2 + v15 + v16 + *(unsigned __int16 *)((char *)v2 + v15 + v16 - v18 + 12) + 4))
          {
            goto LABEL_45;
          }
          v23 = *(_DWORD *)&v14[4 * v13] | 1;
          *(_DWORD *)&v14[4 * v13] = v23;
          v24 = (char *)v2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v24 + 2) >= 0x15u && (v25 = *((unsigned __int16 *)v24 + 12)) != 0)
          {
            v26 = *((unsigned __int8 *)v2 + v15 + v16 + v25 + 4);
            if (v26 > 0x12)
              v27 = 0;
            else
              v27 = 2 * v26 + 2;
          }
          else
          {
            v27 = 4;
          }
          v28 = v27 | v23 & 0xFFFFFFC1;
          *(_DWORD *)&v14[4 * v13] = v28;
          v29 = (char *)v2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v29 + 2) >= 0x11u && (v30 = *((unsigned __int16 *)v29 + 10)) != 0)
          {
            v31 = *((unsigned __int8 *)v2 + v15 + v16 + v30 + 4);
            if (v31 > 0x12)
              v32 = 0;
            else
              v32 = (v31 << 6) + 64;
          }
          else
          {
            v32 = 64;
          }
          v33 = v32 | v28 & 0xFFFFF83F;
          *(_DWORD *)&v14[4 * v13] = v33;
          v34 = (char *)v2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v34 + 2) >= 0x13u && (v35 = *((unsigned __int16 *)v34 + 11)) != 0)
          {
            v36 = *((unsigned __int8 *)v2 + v15 + v16 + v35 + 4);
            if (v36 > 0x12)
              v37 = 0;
            else
              v37 = (v36 << 11) + 2048;
          }
          else
          {
            v37 = 4096;
          }
          v38 = v37 | v33 & 0xFFFF07FF;
          *(_DWORD *)&v14[4 * v13] = v38;
          v39 = (char *)v2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v39 + 2) >= 0xFu && (v40 = *((unsigned __int16 *)v39 + 9)) != 0)
          {
            v41 = *((unsigned __int8 *)v2 + v15 + v16 + v40 + 4);
            if (v41 > 0x12)
              v42 = 0;
            else
              v42 = (v41 << 16) + 0x10000;
          }
          else
          {
            v42 = 0x10000;
          }
          v43 = v42 | v38 & 0xFFE0FFFF;
          *(_DWORD *)&v14[4 * v13] = v43;
          v44 = (char *)v2 + v15 + v16 - *((int *)v17 + 1);
          if (*((unsigned __int16 *)v44 + 2) >= 0xDu && (v45 = *((unsigned __int16 *)v44 + 8)) != 0)
          {
            v46 = *((unsigned __int8 *)v2 + v15 + v16 + v45 + 4);
            if (v46 > 4)
              v47 = 0;
            else
              v47 = dword_1C3E37540[v46];
          }
          else
          {
            v47 = 6291456;
          }
          v48 = v47 | v43 & 0xFF1FFFFF;
          *(_DWORD *)&v14[4 * v13] = v48;
          v49 = v16 - *((int *)v17 + 1);
          if (*(unsigned __int16 *)((char *)v2 + v15 + v49 + 4) >= 0xBu
            && (v50 = *(unsigned __int16 *)((char *)v2 + v15 + v49 + 14)) != 0)
          {
            v51 = *((unsigned __int8 *)v2 + v15 + v16 + v50 + 4);
            if (v51 > 4)
              v52 = 0;
            else
              v52 = dword_1C3E37554[v51];
          }
          else
          {
            v52 = 50331648;
          }
          *(_DWORD *)&v14[4 * v13] = v52 | v48 & 0xF8FFFFFF;
          v53 = *((int *)v17 + 1);
          v22 = -v53;
          v20 = *(unsigned __int16 *)((char *)v2 + v15 + v16 - v53 + 4);
        }
        if (v20 < 7)
          goto LABEL_47;
LABEL_45:
        v54 = v22 + v15;
        if (!*(_WORD *)((char *)v2 + v16 + v54 + 10))
        {
LABEL_47:
          v55 = 15;
          goto LABEL_48;
        }
        v55 = *((unsigned __int8 *)v2 + v15 + v16 + *(unsigned __int16 *)((char *)v2 + v16 + v54 + 10) + 4);
LABEL_48:
        *((_DWORD *)v3 + 12) = *((_DWORD *)v3 + 12) & 0xFF0000FF | (v55 << 31 >> 31) & (0x1000000 << v13) | (1 << v13) & (v55 << 28 >> 31) | ((unsigned __int16)((256 << v13) & ((__int16)((_WORD)v55 << 13) >> 15)) | (unsigned __int16)*((_DWORD *)v3 + 12)) & 0xFF00 | ((0x10000 << v13) & (v55 << 30 >> 31) | *((_DWORD *)v3 + 12)) & 0xFF0000;
        v12 = *(unsigned int *)&v10[v11];
LABEL_49:
        if (v13 <= 6)
        {
          ++v13;
          v15 += 4;
          if (v13 < v12)
            continue;
        }
        v56 = *(int *)v2;
        v8 = -v56;
        v7 = *(unsigned __int16 *)((char *)v2 - v56);
        break;
      }
    }
  }
  if (v7 < 0x27)
  {
    v4 = 0;
LABEL_64:
    v57 = dword_1C3E37588[v4];
    goto LABEL_65;
  }
  v4 = *(unsigned __int16 *)((char *)v2 + v8 + 38);
  if (!*(_WORD *)((char *)v2 + v8 + 38))
    goto LABEL_64;
  v4 = *((unsigned __int8 *)v2 + v4);
  if (v4 <= 0xF)
    goto LABEL_64;
  v57 = 0;
LABEL_65:
  v58 = *((_DWORD *)v3 + 10) & 0xFFFFF83F | (v57 << 6);
  *((_DWORD *)v3 + 10) = v58;
  v59 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v59 >= 0x2Bu && (v60 = v59[21]) != 0)
  {
    v61 = *((unsigned __int8 *)v2 + v60);
    if (v61 > 7)
      v62 = 0;
    else
      v62 = dword_1C3E37568[v61];
  }
  else
  {
    v62 = 4096;
  }
  v63 = v62 | v58 & 0xFFFF0FFF;
  *((_DWORD *)v3 + 10) = v63;
  v64 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v64 < 9u)
  {
    LODWORD(v65) = 0;
  }
  else
  {
    v65 = v64[4];
    if (v65)
      LODWORD(v65) = *((unsigned __int8 *)v2 + v65) != 0;
  }
  v66 = v65 | v63 & 0xFFFFFFFE;
  *((_DWORD *)v3 + 10) = v66;
  v67 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v67 < 0xBu)
  {
    LODWORD(v68) = 0;
  }
  else
  {
    v68 = v67[5];
    if (v68)
      LODWORD(v68) = 2 * (*((_BYTE *)v2 + v68) != 0);
  }
  v69 = v68 | v66 & 0xFFFFFFFD;
  *((_DWORD *)v3 + 10) = v69;
  v70 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  v71 = *v70;
  if (v71 < 0x11)
  {
    LODWORD(v73) = 0;
    v72 = -1;
  }
  else
  {
    if (v70[8])
      v72 = *(_DWORD *)((char *)v2 + v70[8]);
    else
      v72 = -1;
    if (v71 < 0x13)
    {
      LODWORD(v73) = 0;
    }
    else
    {
      v73 = v70[9];
      if (v73)
        LODWORD(v73) = *(float *)((char *)v2 + v73) != 1.0;
    }
  }
  if (v72 == -1)
    v74 = v73;
  else
    v74 = 1;
  if (v74)
    v75 = 4;
  else
    v75 = 0;
  *((_DWORD *)v3 + 10) = v75 | v69 & 0xFFFFFFFB;
  v76 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  v77 = *v76;
  if (v77 <= 0x1C)
  {
    *((_QWORD *)v3 + 7) = 0;
LABEL_104:
    LODWORD(v80) = 0;
    *((_BYTE *)v3 + 224) = 0;
    goto LABEL_105;
  }
  if (v76[14])
    v78 = (unint64_t)v2 + v76[14] + *(unsigned int *)((char *)v2 + v76[14]);
  else
    v78 = 0;
  result = (AGX *)AGX::mutableBufferMaskFromBufferDescriptorArray<flatbuffers::Vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>>>(v78);
  *((_QWORD *)v3 + 7) = result;
  if (v77 < 0x1F)
    goto LABEL_104;
  v79 = v76[15];
  if (v76[15])
    LOBYTE(v79) = *((_BYTE *)v2 + v79) != 0;
  *((_BYTE *)v3 + 224) = v79;
  if (v77 < 0x33)
  {
    LODWORD(v80) = 0;
  }
  else
  {
    v80 = v76[25];
    if (v76[25])
      LODWORD(v80) = 4 * (*((_BYTE *)v2 + v80) != 0);
  }
LABEL_105:
  v81 = *((_DWORD *)v3 + 26) & 0xFFFFFFFB | v80;
  *((_DWORD *)v3 + 26) = v81;
  v82 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v82 < 0x21u)
  {
    LODWORD(v83) = 0;
  }
  else
  {
    v83 = v82[16];
    if (v83)
      LODWORD(v83) = (*((_BYTE *)v2 + v83) != 0) << 6;
  }
  *((_DWORD *)v3 + 26) = v83 | v81 & 0xFFFFFFBF;
  v84 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v84 < 0x21u)
  {
    LODWORD(v85) = 0;
  }
  else
  {
    v85 = v84[16];
    if (v85)
      LODWORD(v85) = (*((_BYTE *)v2 + v85) != 0) << 9;
  }
  *((_DWORD *)v3 + 25) = *((_DWORD *)v3 + 25) & 0xFFFFFDFF | v85;
  return result;
}

unint64_t AGX::Impl::TileProgramKey::initCommon(unint64_t result, int *a2)
{
  int *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unsigned int v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int16 *v19;
  uint64_t v20;
  unsigned __int16 *v21;
  unsigned int v22;
  unint64_t v23;
  uint64_t v24;
  unsigned __int16 *v25;
  uint64_t v26;

  v2 = a2;
  v3 = result;
  if (!a2)
  {
    result = AGX::defaultTileDescriptor((AGX *)result);
    v2 = (int *)result;
  }
  v4 = *v2;
  v5 = -v4;
  v6 = (char *)v2 - v4;
  v7 = *(unsigned __int16 *)((char *)v2 - v4);
  if (v7 >= 0xF)
  {
    v8 = *((unsigned __int16 *)v6 + 7);
    if (!*((_WORD *)v6 + 7))
      goto LABEL_15;
    v9 = (char *)v2 + v8;
    v10 = *(unsigned int *)((char *)v2 + v8);
    v11 = *(unsigned int *)((char *)v2 + v8 + v10);
    if (!(_DWORD)v11)
      goto LABEL_15;
    v12 = 0;
    v13 = v8 + v10;
    do
    {
      v14 = *(unsigned int *)((char *)v2 + v13 + 4);
      v15 = (char *)v2 + v13 + v14 - *(int *)((char *)v2 + v13 + v14 + 4);
      result = *((unsigned __int16 *)v15 + 2);
      if (result >= 5)
      {
        v16 = *((unsigned __int16 *)v15 + 4);
        if (v16)
        {
          if (*(_WORD *)((char *)v2 + v13 + v14 + v16 + 4))
          {
            result = (16777217 << v12);
            *(_DWORD *)(v3 + 48) = result | *(_DWORD *)(v3 + 48) & 0xFF0000FF | ((unsigned __int16)*(_DWORD *)(v3 + 48) | (unsigned __int16)(256 << v12)) & 0xFF00 | (*(_DWORD *)(v3 + 48) | (0x10000 << v12)) & 0xFF0000;
            v11 = *(unsigned int *)&v9[v10];
          }
        }
      }
      if (v12 > 6)
        break;
      ++v12;
      v13 += 4;
    }
    while (v12 < v11);
    v17 = *v2;
    v5 = -v17;
    v7 = *(unsigned __int16 *)((char *)v2 - v17);
  }
  if (v7 < 5)
  {
    LODWORD(v18) = 0;
    goto LABEL_18;
  }
LABEL_15:
  v18 = *(unsigned __int16 *)((char *)v2 + v5 + 4);
  if (*(_WORD *)((char *)v2 + v5 + 4))
    LODWORD(v18) = *((unsigned __int8 *)v2 + v18) != 0;
LABEL_18:
  *(_DWORD *)(v3 + 156) = *(_DWORD *)(v3 + 156) & 0xFFFFFFFE | v18;
  v19 = (unsigned __int16 *)((char *)v2 - *v2);
  if (*v19 < 7u)
  {
    LODWORD(v20) = 0;
  }
  else
  {
    v20 = v19[3];
    if (v20)
      LODWORD(v20) = *(int *)((char *)v2 + v20);
  }
  *(_DWORD *)(v3 + 152) = v20;
  v21 = (unsigned __int16 *)((char *)v2 - *v2);
  v22 = *v21;
  if (v22 <= 0x10)
  {
    LODWORD(v24) = 0;
    *(_QWORD *)(v3 + 56) = 0;
  }
  else
  {
    if (v21[8])
      v23 = (unint64_t)v2 + v21[8] + *(unsigned int *)((char *)v2 + v21[8]);
    else
      v23 = 0;
    result = AGX::mutableBufferMaskFromBufferDescriptorArray<flatbuffers::Vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>>>(v23);
    *(_QWORD *)(v3 + 56) = result;
    if (v22 < 0x13)
    {
      LODWORD(v24) = 0;
    }
    else
    {
      v24 = v21[9];
      if (v21[9])
        LODWORD(v24) = (*((_BYTE *)v2 + v24) != 0) << 6;
    }
  }
  *(_DWORD *)(v3 + 104) = *(_DWORD *)(v3 + 104) & 0xFFFFFFBF | v24;
  v25 = (unsigned __int16 *)((char *)v2 - *v2);
  if (*v25 < 0x13u)
  {
    LODWORD(v26) = 0;
  }
  else
  {
    v26 = v25[9];
    if (v26)
      LODWORD(v26) = (*((_BYTE *)v2 + v26) != 0) << 9;
  }
  *(_DWORD *)(v3 + 100) = *(_DWORD *)(v3 + 100) & 0xFFFFFDFF | v26;
  return result;
}

AGX *AGX::Impl::ComputeProgramKey::initCommon(AGX *result, AGX *a2)
{
  AGX *v2;
  AGX *v3;
  unsigned __int16 *v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  unsigned __int16 *v8;
  uint64_t v9;
  int v10;
  unsigned __int16 *v11;
  uint64_t v12;
  int v13;
  unsigned __int16 *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int16 *v18;
  uint64_t v19;

  v2 = a2;
  v3 = result;
  if (!a2)
  {
    result = (AGX *)AGX::defaultComputeDescriptor(result);
    v2 = result;
  }
  v4 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  v5 = *v4;
  if (v5 < 0xD)
  {
    *((_QWORD *)v3 + 5) = 0;
    if (v5 < 7)
    {
      LODWORD(v7) = 0;
      goto LABEL_12;
    }
  }
  else
  {
    if (v4[6])
      v6 = (unint64_t)v2 + v4[6] + *(unsigned int *)((char *)v2 + v4[6]);
    else
      v6 = 0;
    result = (AGX *)AGX::mutableBufferMaskFromBufferDescriptorArray<flatbuffers::Vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>>>(v6);
    *((_QWORD *)v3 + 5) = result;
  }
  v7 = v4[3];
  if (v4[3])
    LODWORD(v7) = *(_DWORD *)((char *)v2 + v7);
LABEL_12:
  *((_DWORD *)v3 + 12) = v7;
  v8 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v8 < 5u)
  {
    LODWORD(v9) = 0;
  }
  else
  {
    v9 = v8[2];
    if (v9)
      LODWORD(v9) = *((unsigned __int8 *)v2 + v9) != 0;
  }
  v10 = *((_DWORD *)v3 + 14) & 0xFFFFFFFE | v9;
  *((_DWORD *)v3 + 14) = v10;
  v11 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v11 < 0x15u)
  {
    LODWORD(v12) = 0;
  }
  else
  {
    v12 = v11[10];
    if (v12)
      LODWORD(v12) = 2 * (*((_BYTE *)v2 + v12) != 0);
  }
  v13 = v12 | v10 & 0xFFFFFFFD;
  *((_DWORD *)v3 + 14) = v13;
  v14 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  v15 = *v14;
  if (v15 <= 0xE)
  {
    LODWORD(v17) = 0;
    *((_BYTE *)v3 + 88) = 0;
  }
  else
  {
    v16 = v14[7];
    if (v14[7])
      LOBYTE(v16) = *((_BYTE *)v2 + v16) != 0;
    *((_BYTE *)v3 + 88) = v16;
    if (v15 < 0x11)
    {
      LODWORD(v17) = 0;
    }
    else
    {
      v17 = v14[8];
      if (v17)
        LODWORD(v17) = 32 * (*((_BYTE *)v2 + v17) != 0);
    }
  }
  *((_DWORD *)v3 + 14) = v17 | v13 & 0xFFFFFFDF;
  v18 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v18 < 0x11u)
  {
    LODWORD(v19) = 0;
  }
  else
  {
    v19 = v18[8];
    if (v19)
      LODWORD(v19) = (*((_BYTE *)v2 + v19) != 0) << 9;
  }
  *((_DWORD *)v3 + 13) = *((_DWORD *)v3 + 13) & 0xFFFFFDFF | v19;
  return result;
}

AGX *AGX::Impl::MeshProgramKey::initCommon(AGX *result, AGX *a2)
{
  AGX *v2;
  AGX *v3;
  unsigned __int16 *v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  unsigned __int16 *v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  unsigned __int16 *v12;
  uint64_t v13;
  unsigned __int16 *v14;
  uint64_t v15;
  unsigned __int16 *v16;
  uint64_t v17;
  unsigned __int16 *v18;
  uint64_t v19;

  v2 = a2;
  v3 = result;
  if (!a2)
  {
    result = (AGX *)AGX::defaultMeshDescriptor(result);
    v2 = result;
  }
  v4 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  v5 = *v4;
  if (v5 <= 0x12)
  {
    LODWORD(v7) = 0;
    *((_QWORD *)v3 + 5) = 0;
  }
  else
  {
    if (v4[9])
      v6 = (unint64_t)v2 + v4[9] + *(unsigned int *)((char *)v2 + v4[9]);
    else
      v6 = 0;
    result = (AGX *)AGX::mutableBufferMaskFromBufferDescriptorArray<flatbuffers::Vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>>>(v6);
    *((_QWORD *)v3 + 5) = result;
    if (v5 < 0x15)
    {
      LODWORD(v7) = 0;
    }
    else
    {
      v7 = v4[10];
      if (v4[10])
        LODWORD(v7) = *((unsigned __int8 *)v2 + v7) != 0;
    }
  }
  *((_DWORD *)v3 + 24) = *((_DWORD *)v3 + 24) & 0xFFFFFFFE | v7;
  v8 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v8 >= 0xFu && (v9 = v8[7]) != 0)
    v10 = *(_DWORD *)((_BYTE *)v2 + v9) & 0xF;
  else
    v10 = 1;
  v11 = *((_DWORD *)v3 + 14) & 0xFFFFFFF0 | v10;
  *((_DWORD *)v3 + 14) = v11;
  v12 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v12 < 0x1Du)
  {
    LODWORD(v13) = 0;
  }
  else
  {
    v13 = v12[14];
    if (v13)
      LODWORD(v13) = 32 * (*((_BYTE *)v2 + v13) != 0);
  }
  *((_DWORD *)v3 + 14) = v13 | v11 & 0xFFFFFFDF;
  v14 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v14 < 0x17u)
  {
    LODWORD(v15) = 0;
  }
  else
  {
    v15 = v14[11];
    if (v15)
      LODWORD(v15) = (*((_BYTE *)v2 + v15) != 0) << 9;
  }
  *((_DWORD *)v3 + 13) = *((_DWORD *)v3 + 13) & 0xFFFFFDFF | v15;
  v16 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v16 < 7u)
  {
    LODWORD(v17) = 0;
  }
  else
  {
    v17 = v16[3];
    if (v17)
      LODWORD(v17) = *(_DWORD *)((char *)v2 + v17);
  }
  *((_DWORD *)v3 + 15) = v17;
  v18 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v18 < 9u)
  {
    LODWORD(v19) = 0;
  }
  else
  {
    v19 = v18[4];
    if (v19)
      LODWORD(v19) = *(_DWORD *)((char *)v2 + v19);
  }
  *((_DWORD *)v3 + 16) = v19;
  return result;
}

AGX *AGX::Impl::ObjectProgramKey::initCommon(AGX *result, AGX *a2)
{
  AGX *v2;
  AGX *v3;
  unsigned __int16 *v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  unsigned __int16 *v8;
  uint64_t v9;
  int v10;
  unsigned int v11;
  unsigned __int16 *v12;
  uint64_t v13;
  unsigned __int16 *v14;
  uint64_t v15;
  unsigned __int16 *v16;
  uint64_t v17;
  unsigned __int16 *v18;
  uint64_t v19;

  v2 = a2;
  v3 = result;
  if (!a2)
  {
    result = (AGX *)AGX::defaultObjectDescriptor(result);
    v2 = result;
  }
  v4 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  v5 = *v4;
  if (v5 <= 0x12)
  {
    LODWORD(v7) = 0;
    *((_QWORD *)v3 + 5) = 0;
  }
  else
  {
    if (v4[9])
      v6 = (unint64_t)v2 + v4[9] + *(unsigned int *)((char *)v2 + v4[9]);
    else
      v6 = 0;
    result = (AGX *)AGX::mutableBufferMaskFromBufferDescriptorArray<flatbuffers::Vector<flatbuffers::Offset<Air::PipelineBufferDescriptor>>>(v6);
    *((_QWORD *)v3 + 5) = result;
    if (v5 < 0x15)
    {
      LODWORD(v7) = 0;
    }
    else
    {
      v7 = v4[10];
      if (v4[10])
        LODWORD(v7) = *((unsigned __int8 *)v2 + v7) != 0;
    }
  }
  *((_DWORD *)v3 + 24) = *((_DWORD *)v3 + 24) & 0xFFFFFFFE | v7;
  v8 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v8 >= 0xFu && (v9 = v8[7]) != 0)
    v10 = 8 * (*(_DWORD *)((_BYTE *)v2 + v9) & 0xF);
  else
    v10 = 8;
  v11 = *((_DWORD *)v3 + 14) & 0xFFFFFF87 | v10;
  *((_DWORD *)v3 + 14) = v11;
  v12 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v12 < 0x1Bu)
  {
    LODWORD(v13) = 0;
  }
  else
  {
    v13 = v12[13];
    if (v13)
      LODWORD(v13) = *((unsigned __int8 *)v2 + v13) != 0;
  }
  *((_DWORD *)v3 + 14) = v13 | v11 & 0xFFFFFFFE;
  v14 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v14 < 0x17u)
  {
    LODWORD(v15) = 0;
  }
  else
  {
    v15 = v14[11];
    if (v15)
      LODWORD(v15) = (*((_BYTE *)v2 + v15) != 0) << 9;
  }
  *((_DWORD *)v3 + 13) = *((_DWORD *)v3 + 13) & 0xFFFFFDFF | v15;
  v16 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v16 < 7u)
  {
    LODWORD(v17) = 0;
  }
  else
  {
    v17 = v16[3];
    if (v17)
      LODWORD(v17) = *(_DWORD *)((char *)v2 + v17);
  }
  *((_DWORD *)v3 + 15) = v17;
  v18 = (unsigned __int16 *)((char *)v2 - *(int *)v2);
  if (*v18 < 9u)
  {
    LODWORD(v19) = 0;
  }
  else
  {
    v19 = v18[4];
    if (v19)
      LODWORD(v19) = *(_DWORD *)((char *)v2 + v19);
  }
  *((_DWORD *)v3 + 16) = v19;
  return result;
}

uint64_t AGX::BVHBuilderProgramKey::initializeWithDescriptor(uint64_t result, int *a2)
{
  unsigned __int16 *v2;
  uint64_t v3;
  int v4;
  unsigned __int16 *v5;
  uint64_t v6;
  int v7;
  unsigned __int16 *v8;
  uint64_t v9;

  v2 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v2 < 5u)
  {
    LODWORD(v3) = 0;
  }
  else
  {
    v3 = v2[2];
    if (v3)
      LODWORD(v3) = *(int *)((char *)a2 + v3) & 0x3FFFFFFF;
  }
  v4 = *(_DWORD *)(result + 40) & 0xC0000000 | v3;
  *(_DWORD *)(result + 40) = v4;
  v5 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v5 < 7u)
  {
    LODWORD(v6) = 0;
  }
  else
  {
    v6 = v5[3];
    if (v6)
      LODWORD(v6) = (*((_BYTE *)a2 + v6) != 0) << 31;
  }
  v7 = v6 | v4 & 0x7FFFFFFF;
  *(_DWORD *)(result + 40) = v7;
  v8 = (unsigned __int16 *)((char *)a2 - *a2);
  if (*v8 < 9u)
  {
    LODWORD(v9) = 0;
  }
  else
  {
    v9 = v8[4];
    if (v9)
      LODWORD(v9) = (*((_BYTE *)a2 + v9) != 0) << 30;
  }
  *(_DWORD *)(result + 40) = v9 | v7 & 0xBFFFFFFF;
  return result;
}

uint64_t ___ZL15getTimebaseInfov_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&getTimebaseInfo(void)::sTimebaseInfo);
}

void __cxx_global_array_dtor()
{
  uint64_t v0;

  v0 = 0x380u;
  do
  {
    if (AGCLLVMUserMeshShader::replaceBuiltins(void)::workitem_functions[v0 - 41] < 0)
      operator delete(*(void **)&AGCLLVMUserMeshShader::replaceBuiltins(void)::workitem_functions[v0 - 64]);
    v0 -= 64;
  }
  while (v0);
}

void __cxx_global_array_dtor_470()
{
  uint64_t v0;

  v0 = 0x4C0u;
  do
  {
    if (AGCLLVMUserMeshShaderSW::replacePreRuntimeLinkBuiltins(void)::workitem_functions[v0 - 41] < 0)
      operator delete(*(void **)&AGCLLVMUserMeshShaderSW::replacePreRuntimeLinkBuiltins(void)::workitem_functions[v0 - 64]);
    v0 -= 64;
  }
  while (v0);
}

void __cxx_global_array_dtor_591()
{
  uint64_t v0;

  v0 = 0x3F0u;
  do
  {
    if (AGCLLVMUserObjectShaderBase::replaceBuiltins(void)::workitem_functions[v0 - 33] < 0)
      operator delete(*(void **)&AGCLLVMUserObjectShaderBase::replaceBuiltins(void)::workitem_functions[v0 - 56]);
    v0 -= 56;
  }
  while (v0);
}

void __cxx_global_array_dtor_1919()
{
  uint64_t v0;

  v0 = 0x460u;
  do
  {
    if (AGCLLVMUserDynamicLibrary::replaceWorkitemFunctions(void)::workitem_functions[v0 - 33] < 0)
      operator delete(*(void **)&AGCLLVMUserDynamicLibrary::replaceWorkitemFunctions(void)::workitem_functions[v0 - 56]);
    v0 -= 56;
  }
  while (v0);
}

void __cxx_global_array_dtor_43()
{
  uint64_t i;

  for (i = 0; i != -96; i -= 24)
  {
    if (AGCLLVMUserDynamicLibrary::buildStageSpecificBuiltin(llvm::Type *,std::array<std::function<llvm::Value * ()(void)>,4ul> const&,std::array<int,4ul> const&)::stage_name[i + 95] < 0)
      operator delete(*(void **)&AGCLLVMUserDynamicLibrary::buildStageSpecificBuiltin(llvm::Type *,std::array<std::function<llvm::Value * ()(void)>,4ul> const&,std::array<int,4ul> const&)::stage_name[i + 72]);
  }
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1E0C98080](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1E0C980E8](bundleID);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

uint64_t LLVMAGXRuntimeMajorVersion()
{
  return MEMORY[0x1E0DE0410]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

uint64_t flatbuffers::GenerateText()
{
  return MEMORY[0x1E0DE6B20]();
}

uint64_t flatbuffers::Parser::Deserialize(flatbuffers::Parser *this, const unsigned __int8 *a2)
{
  return MEMORY[0x1E0DE6B30](this, a2);
}

uint64_t llvm::AllocaInst::AllocaInst()
{
  return MEMORY[0x1E0DE0418]();
}

uint64_t llvm::BasicBlock::eraseFromParent(llvm::BasicBlock *this)
{
  return MEMORY[0x1E0DE0428](this);
}

uint64_t llvm::BasicBlock::splitBasicBlock()
{
  return MEMORY[0x1E0DE0430]();
}

uint64_t llvm::BasicBlock::dropAllReferences(llvm::BasicBlock *this)
{
  return MEMORY[0x1E0DE0438](this);
}

uint64_t llvm::BasicBlock::removePredecessor(llvm::BasicBlock *this, llvm::BasicBlock *a2)
{
  return MEMORY[0x1E0DE0440](this, a2);
}

uint64_t llvm::BasicBlock::phis(llvm::BasicBlock *this)
{
  return MEMORY[0x1E0DE0448](this);
}

uint64_t llvm::BasicBlock::BasicBlock()
{
  return MEMORY[0x1E0DE0450]();
}

uint64_t llvm::BranchInst::BranchInst()
{
  return MEMORY[0x1E0DE0458]();
}

{
  return MEMORY[0x1E0DE0460]();
}

uint64_t llvm::ConstantFP::get()
{
  return MEMORY[0x1E0DE0468]();
}

uint64_t llvm::ConstantFP::getNaN()
{
  return MEMORY[0x1E0DE0478]();
}

uint64_t llvm::DILocation::getImpl()
{
  return MEMORY[0x1E0DE0488]();
}

uint64_t llvm::DataLayout::clear(llvm::DataLayout *this)
{
  return MEMORY[0x1E0DE0490](this);
}

uint64_t llvm::DataLayout::reset()
{
  return MEMORY[0x1E0DE0498]();
}

void llvm::DataLayout::~DataLayout(llvm::DataLayout *this)
{
  MEMORY[0x1E0DE04A0](this);
}

void llvm::ModulePass::~ModulePass(llvm::ModulePass *this)
{
  MEMORY[0x1E0DE04C0](this);
}

uint64_t llvm::ReturnInst::ReturnInst()
{
  return MEMORY[0x1E0DE04D0]();
}

{
  return MEMORY[0x1E0DE04E0]();
}

uint64_t llvm::StructType::getTypeByName()
{
  return MEMORY[0x1E0DE04E8]();
}

uint64_t llvm::StructType::get()
{
  return MEMORY[0x1E0DE04F0]();
}

{
  return MEMORY[0x1E0DE04F8]();
}

uint64_t llvm::StructType::create()
{
  return MEMORY[0x1E0DE0508]();
}

{
  return MEMORY[0x1E0DE0510]();
}

{
  return MEMORY[0x1E0DE0518]();
}

uint64_t llvm::StructType::setBody()
{
  return MEMORY[0x1E0DE0520]();
}

uint64_t llvm::StructType::setName()
{
  return MEMORY[0x1E0DE0528]();
}

uint64_t llvm::SwitchInst::removeCase()
{
  return MEMORY[0x1E0DE0530]();
}

uint64_t llvm::SwitchInst::addCase()
{
  return MEMORY[0x1E0DE0538]();
}

uint64_t llvm::SwitchInst::SwitchInst()
{
  return MEMORY[0x1E0DE0540]();
}

uint64_t llvm::UndefValue::get()
{
  return MEMORY[0x1E0DE0570]();
}

uint64_t llvm::VectorType::get()
{
  return MEMORY[0x1E0DE0578]();
}

uint64_t llvm::APFloatBase::IEEEdouble(llvm::APFloatBase *this)
{
  return MEMORY[0x1E0DE0580](this);
}

uint64_t llvm::APFloatBase::PPCDoubleDouble(llvm::APFloatBase *this)
{
  return MEMORY[0x1E0DE0590](this);
}

uint64_t llvm::BitCastInst::BitCastInst()
{
  return MEMORY[0x1E0DE05D8]();
}

uint64_t llvm::CloneModule()
{
  return MEMORY[0x1E0DE05E8]();
}

{
  return MEMORY[0x1E0DE05F0]();
}

uint64_t llvm::ConstantInt::get()
{
  return MEMORY[0x1E0DE05F8]();
}

{
  return MEMORY[0x1E0DE0608]();
}

uint64_t llvm::ConstantInt::getSigned()
{
  return MEMORY[0x1E0DE0630]();
}

uint64_t llvm::Instruction::moveBefore()
{
  return MEMORY[0x1E0DE0660]();
}

uint64_t llvm::Instruction::insertAfter()
{
  return MEMORY[0x1E0DE0678]();
}

uint64_t llvm::Instruction::setMetadata()
{
  return MEMORY[0x1E0DE0680]();
}

{
  return MEMORY[0x1E0DE0688]();
}

uint64_t llvm::Instruction::insertBefore()
{
  return MEMORY[0x1E0DE0698]();
}

uint64_t llvm::Instruction::eraseFromParent(llvm::Instruction *this)
{
  return MEMORY[0x1E0DE06B0](this);
}

uint64_t llvm::Instruction::setFastMathFlags()
{
  return MEMORY[0x1E0DE06C0]();
}

uint64_t llvm::Instruction::setHasApproxFunc(llvm::Instruction *this)
{
  return MEMORY[0x1E0DE06C8](this);
}

uint64_t llvm::Instruction::copyFastMathFlags()
{
  return MEMORY[0x1E0DE06D0]();
}

uint64_t llvm::Instruction::setHasAllowReassoc(llvm::Instruction *this)
{
  return MEMORY[0x1E0DE06E0](this);
}

uint64_t llvm::Instruction::setFast(llvm::Instruction *this)
{
  return MEMORY[0x1E0DE06F8](this);
}

uint64_t llvm::Instruction::moveAfter(llvm::Instruction *this, llvm::Instruction *a2)
{
  return MEMORY[0x1E0DE0700](this, a2);
}

uint64_t llvm::Instruction::Instruction()
{
  return MEMORY[0x1E0DE0710]();
}

uint64_t llvm::IntegerType::get()
{
  return MEMORY[0x1E0DE0718]();
}

uint64_t llvm::LLVMContext::setLLVMRemarkStreamer()
{
  return MEMORY[0x1E0DE0730]();
}

uint64_t llvm::LLVMContext::LLVMContext(llvm::LLVMContext *this)
{
  return MEMORY[0x1E0DE0740](this);
}

void llvm::LLVMContext::~LLVMContext(llvm::LLVMContext *this)
{
  MEMORY[0x1E0DE0748](this);
}

uint64_t llvm::NamedMDNode::addOperand()
{
  return MEMORY[0x1E0DE0750]();
}

uint64_t llvm::NamedMDNode::clearOperands(llvm::NamedMDNode *this)
{
  return MEMORY[0x1E0DE0760](this);
}

uint64_t llvm::NamedMDNode::eraseFromParent(llvm::NamedMDNode *this)
{
  return MEMORY[0x1E0DE0768](this);
}

uint64_t llvm::PointerType::get()
{
  return MEMORY[0x1E0DE0808]();
}

uint64_t llvm::PointerType::get(llvm::PointerType *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x1E0DE0810](this, a2);
}

uint64_t llvm::ValueMapper::remapInstruction(llvm::ValueMapper *this, llvm::Instruction *a2)
{
  return MEMORY[0x1E0DE0850](this, a2);
}

uint64_t llvm::ValueMapper::ValueMapper()
{
  return MEMORY[0x1E0DE0860]();
}

void llvm::ValueMapper::~ValueMapper(llvm::ValueMapper *this)
{
  MEMORY[0x1E0DE0868](this);
}

uint64_t llvm::raw_ostream::flush_nonempty(llvm::raw_ostream *this)
{
  return MEMORY[0x1E0DE0878](this);
}

uint64_t llvm::raw_ostream::SetBufferAndMode()
{
  return MEMORY[0x1E0DE0880]();
}

uint64_t llvm::raw_ostream::write(llvm::raw_ostream *this, const char *a2)
{
  return MEMORY[0x1E0DE0888](this, a2);
}

uint64_t llvm::raw_ostream::write(llvm::raw_ostream *this)
{
  return MEMORY[0x1E0DE0890](this);
}

void llvm::raw_ostream::~raw_ostream(llvm::raw_ostream *this)
{
  MEMORY[0x1E0DE08A0](this);
}

uint64_t llvm::ConstantExpr::getBitCast()
{
  return MEMORY[0x1E0DE0908]();
}

uint64_t llvm::ConstantExpr::getIntToPtr()
{
  return MEMORY[0x1E0DE0918]();
}

uint64_t llvm::ConstantExpr::getPtrToInt()
{
  return MEMORY[0x1E0DE0920]();
}

uint64_t llvm::ConstantExpr::getPointerCast()
{
  return MEMORY[0x1E0DE0928]();
}

uint64_t llvm::FunctionType::get()
{
  return MEMORY[0x1E0DE0958]();
}

{
  return MEMORY[0x1E0DE0960]();
}

uint64_t llvm::GlobalObject::setSection()
{
  return MEMORY[0x1E0DE0970]();
}

uint64_t llvm::GlobalObject::setAlignment()
{
  return MEMORY[0x1E0DE0980]();
}

uint64_t llvm::IntEqClasses::uncompress(llvm::IntEqClasses *this)
{
  return MEMORY[0x1E0DE09A8](this);
}

uint64_t llvm::IntEqClasses::grow(llvm::IntEqClasses *this)
{
  return MEMORY[0x1E0DE09B0](this);
}

uint64_t llvm::IntEqClasses::join(llvm::IntEqClasses *this)
{
  return MEMORY[0x1E0DE09B8](this);
}

uint64_t llvm::IntEqClasses::compress(llvm::IntEqClasses *this)
{
  return MEMORY[0x1E0DE09C0](this);
}

uint64_t llvm::MemoryBuffer::getMemBuffer()
{
  return MEMORY[0x1E0DE0A00]();
}

uint64_t llvm::MemoryBuffer::getFile()
{
  return MEMORY[0x1E0DE0A10]();
}

uint64_t llvm::PassRegistry::getPassRegistry(llvm::PassRegistry *this)
{
  return MEMORY[0x1E0DE0A20](this);
}

uint64_t llvm::verifyModule()
{
  return MEMORY[0x1E0DE0A40]();
}

uint64_t llvm::AnalysisUsage::addRequiredID(llvm::AnalysisUsage *this, char *a2)
{
  return MEMORY[0x1E0DE0A48](this, a2);
}

uint64_t llvm::AtomicRMWInst::AtomicRMWInst()
{
  return MEMORY[0x1E0DE0A58]();
}

uint64_t llvm::AttributeList::get()
{
  return MEMORY[0x1E0DE0A68]();
}

uint64_t llvm::ConstantArray::get()
{
  return MEMORY[0x1E0DE0A98]();
}

uint64_t llvm::IRBuilderBase::CreateMemSet()
{
  return MEMORY[0x1E0DE0AC0]();
}

uint64_t llvm::IRBuilderBase::CreateSelect()
{
  return MEMORY[0x1E0DE0AC8]();
}

uint64_t llvm::IRBuilderBase::CreateFCmpHelper()
{
  return MEMORY[0x1E0DE0AD0]();
}

uint64_t llvm::IRBuilderBase::CreateLifetimeEnd()
{
  return MEMORY[0x1E0DE0AD8]();
}

uint64_t llvm::IRBuilderBase::CreateLifetimeStart()
{
  return MEMORY[0x1E0DE0AE0]();
}

uint64_t llvm::IRBuilderBase::CreateMemTransferInst()
{
  return MEMORY[0x1E0DE0AE8]();
}

uint64_t llvm::IRBuilderBase::CreateConstrainedFPCast()
{
  return MEMORY[0x1E0DE0AF0]();
}

uint64_t llvm::IRBuilderBase::CreateConstrainedFPBinOp()
{
  return MEMORY[0x1E0DE0AF8]();
}

uint64_t llvm::StringMapImpl::RehashTable(llvm::StringMapImpl *this)
{
  return MEMORY[0x1E0DE0B10](this);
}

uint64_t llvm::StringMapImpl::LookupBucketFor()
{
  return MEMORY[0x1E0DE0B18]();
}

uint64_t llvm::StringMapImpl::RemoveKey()
{
  return MEMORY[0x1E0DE0B20]();
}

uint64_t llvm::StringMapImpl::StringMapImpl(llvm::StringMapImpl *this)
{
  return MEMORY[0x1E0DE0B28](this);
}

uint64_t llvm::UnaryOperator::Create()
{
  return MEMORY[0x1E0DE0B30]();
}

uint64_t llvm::initializeIPO(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x1E0DE0B48](this, a2);
}

uint64_t llvm::BinaryOperator::Create()
{
  return MEMORY[0x1E0DE0B60]();
}

uint64_t llvm::BinaryOperator::CreateNeg()
{
  return MEMORY[0x1E0DE0B68]();
}

uint64_t llvm::BinaryOperator::CreateNot()
{
  return MEMORY[0x1E0DE0B70]();
}

uint64_t llvm::ConstantStruct::get()
{
  return MEMORY[0x1E0DE0B80]();
}

uint64_t llvm::ConstantVector::get()
{
  return MEMORY[0x1E0DE0B88]();
}

uint64_t llvm::ConstantVector::getSplat()
{
  return MEMORY[0x1E0DE0B90]();
}

uint64_t llvm::DomTreeBuilder::Calculate<llvm::DominatorTreeBase<llvm::BasicBlock,false>>()
{
  return off_1E7E5F9F0();
}

uint64_t llvm::DomTreeBuilder::Calculate<llvm::DominatorTreeBase<llvm::BasicBlock,true>>()
{
  return off_1E7E5F9F8();
}

uint64_t llvm::GlobalVariable::setInitializer()
{
  return MEMORY[0x1E0DE0BA0]();
}

uint64_t llvm::GlobalVariable::eraseFromParent(llvm::GlobalVariable *this)
{
  return MEMORY[0x1E0DE0BA8](this);
}

uint64_t llvm::GlobalVariable::GlobalVariable()
{
  return MEMORY[0x1E0DE0BC8]();
}

uint64_t llvm::InlineFunction()
{
  return MEMORY[0x1E0DE0BD8]();
}

uint64_t llvm::createLICMPass(llvm *this)
{
  return MEMORY[0x1E0DE0C20](this);
}

uint64_t llvm::createSROAPass(llvm *this)
{
  return MEMORY[0x1E0DE0C30](this);
}

uint64_t llvm::initializeCore(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x1E0DE0C40](this, a2);
}

uint64_t llvm::CloneBasicBlock()
{
  return MEMORY[0x1E0DE0C68]();
}

uint64_t llvm::FixedVectorType::get()
{
  return MEMORY[0x1E0DE0C70]();
}

void llvm::IRBuilderFolder::~IRBuilderFolder(llvm::IRBuilderFolder *this)
{
  MEMORY[0x1E0DE0C78](this);
}

uint64_t llvm::InsertValueInst::init()
{
  return MEMORY[0x1E0DE0C80]();
}

uint64_t llvm::MemoryBufferRef::MemoryBufferRef()
{
  return MEMORY[0x1E0DE0CD0]();
}

uint64_t llvm::SmallVectorBase<unsigned int>::mallocForGrow()
{
  return off_1E7E5FA60();
}

uint64_t llvm::SmallVectorBase<unsigned int>::grow_pod()
{
  return off_1E7E5FA68();
}

uint64_t llvm::SmallVectorBase<unsigned long long>::grow_pod()
{
  return off_1E7E5FA70();
}

uint64_t llvm::ValueAsMetadata::get()
{
  return MEMORY[0x1E0DE0D00]();
}

uint64_t llvm::ValueHandleBase::AddToUseList(llvm::ValueHandleBase *this)
{
  return MEMORY[0x1E0DE0D08](this);
}

uint64_t llvm::ValueHandleBase::RemoveFromUseList(llvm::ValueHandleBase *this)
{
  return MEMORY[0x1E0DE0D10](this);
}

uint64_t llvm::ValueHandleBase::AddToExistingUseList(llvm::ValueHandleBase *this, llvm::ValueHandleBase **a2)
{
  return MEMORY[0x1E0DE0D18](this, a2);
}

uint64_t llvm::allocate_buffer(llvm *this)
{
  return MEMORY[0x1E0DE0D20](this);
}

uint64_t llvm::ExtractValueInst::getIndexedType()
{
  return MEMORY[0x1E0DE0D48]();
}

uint64_t llvm::ExtractValueInst::init()
{
  return MEMORY[0x1E0DE0D50]();
}

uint64_t llvm::MetadataTracking::track()
{
  return MEMORY[0x1E0DE0DC8]();
}

uint64_t llvm::MetadataTracking::retrack()
{
  return MEMORY[0x1E0DE0DD0]();
}

uint64_t llvm::MetadataTracking::untrack()
{
  return MEMORY[0x1E0DE0DD8]();
}

uint64_t llvm::createNewGVNPass(llvm *this)
{
  return MEMORY[0x1E0DE0E10](this);
}

uint64_t llvm::initializeTarget(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x1E0DE0E28](this, a2);
}

uint64_t llvm::parseBitcodeFile()
{
  return MEMORY[0x1E0DE0E30]();
}

uint64_t llvm::AtomicCmpXchgInst::AtomicCmpXchgInst()
{
  return MEMORY[0x1E0DE0E40]();
}

uint64_t llvm::CloneFunctionInto()
{
  return MEMORY[0x1E0DE0E58]();
}

uint64_t llvm::DominatorTreeBase<llvm::BasicBlock,false>::DominatorTreeBase()
{
  return off_1E7E5FAF0();
}

uint64_t llvm::DominatorTreeBase<llvm::BasicBlock,false>::operator=()
{
  return off_1E7E5FAF8();
}

uint64_t llvm::GetElementPtrInst::setIsInBounds(llvm::GetElementPtrInst *this)
{
  return MEMORY[0x1E0DE0E70](this);
}

uint64_t llvm::GetElementPtrInst::getIndexedType()
{
  return MEMORY[0x1E0DE0E78]();
}

uint64_t llvm::GetElementPtrInst::init()
{
  return MEMORY[0x1E0DE0E80]();
}

uint64_t llvm::InsertElementInst::InsertElementInst()
{
  return MEMORY[0x1E0DE0E88]();
}

uint64_t llvm::ShuffleVectorInst::getShuffleMask()
{
  return MEMORY[0x1E0DE0ED8]();
}

uint64_t llvm::ShuffleVectorInst::ShuffleVectorInst()
{
  return MEMORY[0x1E0DE0F10]();
}

uint64_t llvm::deallocate_buffer(llvm *this, void *a2)
{
  return MEMORY[0x1E0DE0F38](this, a2);
}

uint64_t llvm::ConstantDataVector::getSplat()
{
  return MEMORY[0x1E0DE0F58]();
}

uint64_t llvm::ExtractElementInst::ExtractElementInst()
{
  return MEMORY[0x1E0DE0F68]();
}

uint64_t llvm::initializeAnalysis(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x1E0DE0FF0](this, a2);
}

uint64_t llvm::ConstantPointerNull::get(llvm::ConstantPointerNull *this, llvm::PointerType *a2)
{
  return MEMORY[0x1E0DE1010](this, a2);
}

uint64_t llvm::ReplaceInstWithInst(llvm *this, llvm::Instruction *a2, llvm::Instruction *a3)
{
  return MEMORY[0x1E0DE1038](this, a2, a3);
}

uint64_t llvm::SmallPtrSetImplBase::insert_imp_big(llvm::SmallPtrSetImplBase *this, const void *a2)
{
  return MEMORY[0x1E0DE1040](this, a2);
}

uint64_t llvm::SmallPtrSetImplBase::CopyFrom(llvm::SmallPtrSetImplBase *this, const llvm::SmallPtrSetImplBase *a2)
{
  return MEMORY[0x1E0DE1050](this, a2);
}

uint64_t llvm::SmallPtrSetImplBase::SmallPtrSetImplBase(llvm::SmallPtrSetImplBase *this, const void **a2, const llvm::SmallPtrSetImplBase *a3)
{
  return MEMORY[0x1E0DE1058](this, a2, a3);
}

uint64_t llvm::SmallPtrSetImplBase::SmallPtrSetImplBase()
{
  return MEMORY[0x1E0DE1060]();
}

uint64_t llvm::createGlobalDCEPass(llvm *this)
{
  return MEMORY[0x1E0DE10A0](this);
}

uint64_t llvm::parseAssemblyString()
{
  return MEMORY[0x1E0DE10C8]();
}

uint64_t llvm::appendToCompilerUsed()
{
  return MEMORY[0x1E0DE1118]();
}

uint64_t llvm::getAsUnsignedInteger()
{
  return MEMORY[0x1E0DE1140]();
}

uint64_t llvm::initializeScalarOpts(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x1E0DE1158](this, a2);
}

uint64_t llvm::ConstantAggregateZero::get()
{
  return MEMORY[0x1E0DE1178]();
}

uint64_t llvm::SymbolTableListTraits<llvm::BasicBlock>::transferNodesFromList()
{
  return off_1E7E5FBB8();
}

uint64_t llvm::SymbolTableListTraits<llvm::Function>::addNodeToList()
{
  return off_1E7E5FBC0();
}

uint64_t llvm::SymbolTableListTraits<llvm::Function>::removeNodeFromList()
{
  return off_1E7E5FBC8();
}

uint64_t llvm::initializeInstCombine(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x1E0DE11E8](this, a2);
}

uint64_t llvm::ConstantFoldTerminator()
{
  return MEMORY[0x1E0DE11F8]();
}

uint64_t llvm::createGPUAAWrapperPass(llvm *this)
{
  return MEMORY[0x1E0DE1248](this);
}

uint64_t llvm::createAggressiveDCEPass(llvm *this)
{
  return MEMORY[0x1E0DE1298](this);
}

uint64_t llvm::initializeVectorization(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x1E0DE12A0](this, a2);
}

void llvm::IRBuilderDefaultInserter::~IRBuilderDefaultInserter(llvm::IRBuilderDefaultInserter *this)
{
  MEMORY[0x1E0DE12C8](this);
}

uint64_t llvm::createBasicAAWrapperPass(llvm *this)
{
  return MEMORY[0x1E0DE1328](this);
}

uint64_t llvm::createIndVarSimplifyPass(llvm *this)
{
  return MEMORY[0x1E0DE1338](this);
}

uint64_t llvm::initializeTransformUtils(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x1E0DE1348](this, a2);
}

uint64_t llvm::MergeBlockIntoPredecessor()
{
  return MEMORY[0x1E0DE1378]();
}

uint64_t llvm::createGlobalOptimizerPass(llvm *this)
{
  return MEMORY[0x1E0DE13A0](this);
}

uint64_t llvm::remapInstructionsInBlocks()
{
  return MEMORY[0x1E0DE13C8]();
}

uint64_t llvm::createSimpleLoopUnrollPass(llvm *this)
{
  return MEMORY[0x1E0DE1408](this);
}

uint64_t llvm::createCFGSimplificationPass()
{
  return MEMORY[0x1E0DE1448]();
}

uint64_t llvm::TargetLibraryInfoWrapperPass::TargetLibraryInfoWrapperPass()
{
  return MEMORY[0x1E0DE1480]();
}

uint64_t llvm::createTypeBasedAAWrapperPass(llvm *this)
{
  return MEMORY[0x1E0DE1498](this);
}

uint64_t llvm::createAlwaysInlinerLegacyPass(llvm *this)
{
  return MEMORY[0x1E0DE14A0](this);
}

uint64_t llvm::createDeadCodeEliminationPass(llvm *this)
{
  return MEMORY[0x1E0DE14A8](this);
}

uint64_t llvm::errorToErrorCodeAndEmitErrors()
{
  return MEMORY[0x1E0DE14C8]();
}

uint64_t llvm::createDeadStoreEliminationPass(llvm *this)
{
  return MEMORY[0x1E0DE1520](this);
}

uint64_t llvm::createInstructionCombiningPass(llvm *this)
{
  return MEMORY[0x1E0DE1528](this);
}

uint64_t llvm::createScopedNoAliasAAWrapperPass(llvm *this)
{
  return MEMORY[0x1E0DE1558](this);
}

uint64_t llvm::createUnifyFunctionExitNodesPass(llvm *this)
{
  return MEMORY[0x1E0DE1560](this);
}

uint64_t llvm::createPostOrderFunctionAttrsLegacyPass(llvm *this)
{
  return MEMORY[0x1E0DE15F0](this);
}

uint64_t llvm::AGX::AGXCompiler::createCompilePlan()
{
  return MEMORY[0x1E0DE1608]();
}

uint64_t llvm::AGX::AGXCompiler::getLastDiagnostics(llvm::AGX::AGXCompiler *this)
{
  return MEMORY[0x1E0DE1610](this);
}

uint64_t llvm::AGX::AGXCompiler::create()
{
  return MEMORY[0x1E0DE1618]();
}

uint64_t llvm::AGX::AGXCompiler::AGXCompiler()
{
  return MEMORY[0x1E0DE1620]();
}

void llvm::AGX::AGXCompiler::~AGXCompiler(llvm::AGX::AGXCompiler *this)
{
  MEMORY[0x1E0DE1628](this);
}

uint64_t llvm::AGX::CompileReply::getDiagnostics(llvm::AGX::CompileReply *this)
{
  return MEMORY[0x1E0DE1630](this);
}

uint64_t llvm::AGX::CompileReply::getBinary(llvm::AGX::CompileReply *this)
{
  return MEMORY[0x1E0DE1638](this);
}

uint64_t llvm::AGX::CompileReply::CompileReply()
{
  return MEMORY[0x1E0DE1640]();
}

void llvm::AGX::CompileReply::~CompileReply(llvm::AGX::CompileReply *this)
{
  MEMORY[0x1E0DE1648](this);
}

uint64_t llvm::AGX::AGXCompilePlan::collectConfiguration()
{
  return MEMORY[0x1E0DE1650]();
}

uint64_t llvm::AGX::AGXCompilePlan::execute()
{
  return MEMORY[0x1E0DE1658]();
}

uint64_t llvm::AGX::AGXCompilePlan::AGXCompilePlan()
{
  return MEMORY[0x1E0DE1660]();
}

void llvm::AGX::AGXCompilePlan::~AGXCompilePlan(llvm::AGX::AGXCompilePlan *this)
{
  MEMORY[0x1E0DE1668](this);
}

uint64_t llvm::AGX::CompileRequest::addSegments()
{
  return MEMORY[0x1E0DE1670]();
}

uint64_t llvm::AGX::CompileRequest::addDMAListEntry(llvm::AGX::CompileRequest *this)
{
  return MEMORY[0x1E0DE1678](this);
}

uint64_t llvm::AGX::CompileRequest::setLoggingStream()
{
  return MEMORY[0x1E0DE1680]();
}

uint64_t llvm::AGX::CompileRequest::CompileRequest()
{
  return MEMORY[0x1E0DE1688]();
}

void llvm::AGX::CompileRequest::~CompileRequest(llvm::AGX::CompileRequest *this)
{
  MEMORY[0x1E0DE1690](this);
}

uint64_t llvm::AGX::TelemetryCollector::startCollection(llvm::AGX::TelemetryCollector *this)
{
  return MEMORY[0x1E0DE1698](this);
}

uint64_t llvm::AGX::TelemetryCollector::finishCollection(llvm::AGX::TelemetryCollector *this)
{
  return MEMORY[0x1E0DE16A0](this);
}

uint64_t llvm::AGX::TelemetryCollector::enable(llvm::AGX::TelemetryCollector *this)
{
  return MEMORY[0x1E0DE16A8](this);
}

uint64_t llvm::AGX::TelemetryCollector::TelemetryCollector(llvm::AGX::TelemetryCollector *this)
{
  return MEMORY[0x1E0DE16B0](this);
}

void llvm::AGX::TelemetryCollector::~TelemetryCollector(llvm::AGX::TelemetryCollector *this)
{
  MEMORY[0x1E0DE16B8](this);
}

uint64_t llvm::AGX::operator<<()
{
  return MEMORY[0x1E0DE16C0]();
}

{
  return MEMORY[0x1E0DE16C8]();
}

uint64_t llvm::RecursivelyDeleteTriviallyDeadInstructions()
{
  return MEMORY[0x1E0DE1850]();
}

void llvm::Pass::~Pass(llvm::Pass *this)
{
  MEMORY[0x1E0DE1870](this);
}

uint64_t llvm::Type::getFloatTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x1E0DE1878](this, a2);
}

uint64_t llvm::Type::getInt16Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x1E0DE1880](this, a2);
}

uint64_t llvm::Type::getInt32Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x1E0DE1888](this, a2);
}

uint64_t llvm::Type::getInt64Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x1E0DE1890](this, a2);
}

uint64_t llvm::Type::getBFloatTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x1E0DE1898](this, a2);
}

uint64_t llvm::Type::getInt8PtrTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x1E0DE18A8](this, a2);
}

uint64_t llvm::Type::getFloatPtrTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x1E0DE18B8](this, a2);
}

uint64_t llvm::Type::getInt32PtrTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x1E0DE18C0](this, a2);
}

uint64_t llvm::Type::getHalfTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x1E0DE18D0](this, a2);
}

uint64_t llvm::Type::getInt1Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x1E0DE18D8](this, a2);
}

uint64_t llvm::Type::getInt8Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x1E0DE18E0](this, a2);
}

uint64_t llvm::Type::getIntNTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x1E0DE18E8](this, a2);
}

uint64_t llvm::Type::getVoidTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x1E0DE18F0](this, a2);
}

uint64_t llvm::User::getDescriptor(llvm::User *this)
{
  return MEMORY[0x1E0DE18F8](this);
}

uint64_t llvm::User::allocHungoffUses(llvm::User *this)
{
  return MEMORY[0x1E0DE1900](this);
}

uint64_t llvm::User::replaceUsesOfWith()
{
  return MEMORY[0x1E0DE1908]();
}

uint64_t llvm::User::operator new(llvm::User *this)
{
  return MEMORY[0x1E0DE1918](this);
}

{
  return MEMORY[0x1E0DE1920](this);
}

{
  return MEMORY[0x1E0DE1928](this);
}

uint64_t llvm::dbgs(llvm *this)
{
  return MEMORY[0x1E0DE1930](this);
}

uint64_t llvm::errs(llvm *this)
{
  return MEMORY[0x1E0DE1938](this);
}

uint64_t llvm::APInt::initSlowCase(llvm::APInt *this)
{
  return MEMORY[0x1E0DE1988](this);
}

void llvm::Regex::~Regex(llvm::Regex *this)
{
  MEMORY[0x1E0DE1A18](this);
}

uint64_t llvm::Value::replaceAllUsesWith()
{
  return MEMORY[0x1E0DE1A50]();
}

uint64_t llvm::Value::setName()
{
  return MEMORY[0x1E0DE1A60]();
}

uint64_t llvm::Value::takeName()
{
  return MEMORY[0x1E0DE1A68]();
}

uint64_t llvm::Linker::linkModules()
{
  return MEMORY[0x1E0DE1A78]();
}

uint64_t llvm::MDNode::replaceOperandWith()
{
  return MEMORY[0x1E0DE1AA8]();
}

uint64_t llvm::Module::materialize()
{
  return MEMORY[0x1E0DE1AC0]();
}

uint64_t llvm::Module::addModuleFlag()
{
  return MEMORY[0x1E0DE1AD0]();
}

uint64_t llvm::Module::setDataLayout()
{
  return MEMORY[0x1E0DE1AE0]();
}

uint64_t llvm::Module::eraseNamedMetadata(llvm::Module *this, llvm::NamedMDNode *a2)
{
  return MEMORY[0x1E0DE1B08](this, a2);
}

uint64_t llvm::Module::getOrInsertFunction()
{
  return MEMORY[0x1E0DE1B10]();
}

{
  return MEMORY[0x1E0DE1B18]();
}

uint64_t llvm::Module::getOrInsertNamedMetadata()
{
  return MEMORY[0x1E0DE1B30]();
}

uint64_t llvm::Module::Module()
{
  return MEMORY[0x1E0DE1B38]();
}

void llvm::Module::~Module(llvm::Module *this)
{
  MEMORY[0x1E0DE1B40](this);
}

uint64_t llvm::Triple::Triple()
{
  return MEMORY[0x1E0DE1BE0]();
}

uint64_t llvm::detail::IEEEFloat::IEEEFloat(llvm::detail::IEEEFloat *this, double a2)
{
  return MEMORY[0x1E0DE1C60](this, a2);
}

void llvm::detail::IEEEFloat::~IEEEFloat(llvm::detail::IEEEFloat *this)
{
  MEMORY[0x1E0DE1C70](this);
}

uint64_t llvm::legacy::PassManager::run(llvm::legacy::PassManager *this, llvm::Module *a2)
{
  return MEMORY[0x1E0DE1C88](this, a2);
}

uint64_t llvm::legacy::PassManager::PassManager(llvm::legacy::PassManager *this)
{
  return MEMORY[0x1E0DE1C90](this);
}

uint64_t llvm::APFloat::Storage::Storage()
{
  return MEMORY[0x1E0DE1CF8]();
}

uint64_t llvm::APFloat::convert()
{
  return MEMORY[0x1E0DE1D00]();
}

uint64_t llvm::CmpInst::CmpInst()
{
  return MEMORY[0x1E0DE1D08]();
}

uint64_t llvm::MDTuple::getImpl()
{
  return MEMORY[0x1E0DE1D70]();
}

uint64_t llvm::PHINode::growOperands(llvm::PHINode *this)
{
  return MEMORY[0x1E0DE1D78](this);
}

uint64_t llvm::parseIR()
{
  return MEMORY[0x1E0DE1D88]();
}

uint64_t llvm::remarks::RemarkStreamer::RemarkStreamer()
{
  return MEMORY[0x1E0DE1D90]();
}

uint64_t llvm::remarks::YAMLRemarkSerializer::YAMLRemarkSerializer()
{
  return MEMORY[0x1E0DE1D98]();
}

uint64_t llvm::CallInst::init()
{
  return MEMORY[0x1E0DE1DC8]();
}

uint64_t llvm::CastInst::CreateFPCast()
{
  return MEMORY[0x1E0DE1DE0]();
}

uint64_t llvm::CastInst::CreateIntegerCast()
{
  return MEMORY[0x1E0DE1DE8]();
}

uint64_t llvm::CastInst::CreatePointerCast()
{
  return MEMORY[0x1E0DE1DF0]();
}

uint64_t llvm::CastInst::CreateZExtOrBitCast()
{
  return MEMORY[0x1E0DE1DF8]();
}

uint64_t llvm::CastInst::CreateTruncOrBitCast()
{
  return MEMORY[0x1E0DE1E00]();
}

uint64_t llvm::CastInst::Create()
{
  return MEMORY[0x1E0DE1E08]();
}

uint64_t llvm::Constant::getNullValue(llvm::Constant *this, llvm::Type *a2)
{
  return MEMORY[0x1E0DE1E10](this, a2);
}

uint64_t llvm::Constant::destroyConstant(llvm::Constant *this)
{
  return MEMORY[0x1E0DE1E18](this);
}

uint64_t llvm::Constant::getAllOnesValue(llvm::Constant *this, llvm::Type *a2)
{
  return MEMORY[0x1E0DE1E20](this, a2);
}

uint64_t llvm::Constant::getIntegerValue(llvm::Constant *this, llvm::Type *a2, const llvm::APInt *a3)
{
  return MEMORY[0x1E0DE1E28](this, a2, a3);
}

uint64_t llvm::DebugLoc::DebugLoc()
{
  return MEMORY[0x1E0DE1E38]();
}

uint64_t llvm::Function::addRetAttr()
{
  return MEMORY[0x1E0DE1E40]();
}

uint64_t llvm::Function::addParamAttr()
{
  return MEMORY[0x1E0DE1E48]();
}

uint64_t llvm::Function::removeFnAttr()
{
  return MEMORY[0x1E0DE1E58]();
}

{
  return MEMORY[0x1E0DE1E60]();
}

uint64_t llvm::Function::setPrefixData(llvm::Function *this, llvm::Constant *a2)
{
  return MEMORY[0x1E0DE1E80](this, a2);
}

uint64_t llvm::Function::setSubprogram()
{
  return MEMORY[0x1E0DE1E88]();
}

uint64_t llvm::Function::eraseFromParent(llvm::Function *this)
{
  return MEMORY[0x1E0DE1E90](this);
}

uint64_t llvm::Function::dropAllReferences(llvm::Function *this)
{
  return MEMORY[0x1E0DE1EA8](this);
}

uint64_t llvm::Function::stealArgumentListFrom(llvm::Function *this, llvm::Function *a2)
{
  return MEMORY[0x1E0DE1EB8](this, a2);
}

uint64_t llvm::Function::addFnAttr()
{
  return MEMORY[0x1E0DE1EC8]();
}

{
  return MEMORY[0x1E0DE1ED0]();
}

uint64_t llvm::Function::Function()
{
  return MEMORY[0x1E0DE1ED8]();
}

uint64_t llvm::LoadInst::LoadInst()
{
  return MEMORY[0x1E0DE1F00]();
}

uint64_t llvm::MDString::get()
{
  return MEMORY[0x1E0DE1F08]();
}

uint64_t llvm::ArrayType::get(llvm::ArrayType *this, llvm::Type *a2)
{
  return MEMORY[0x1E0DE1F40](this, a2);
}

uint64_t llvm::Attribute::get()
{
  return MEMORY[0x1E0DE1F60]();
}

uint64_t llvm::CallGraph::CallGraph(llvm::CallGraph *this, llvm::Module *a2)
{
  return MEMORY[0x1E0DE1F78](this, a2);
}

void llvm::CallGraph::~CallGraph(llvm::CallGraph *this)
{
  MEMORY[0x1E0DE1F80](this);
}

uint64_t llvm::Intrinsic::getDeclaration()
{
  return MEMORY[0x1E0DE1FB0]();
}

uint64_t llvm::Intrinsic::matchIntrinsicSignature()
{
  return MEMORY[0x1E0DE1FC0]();
}

uint64_t llvm::Intrinsic::getIntrinsicInfoTableEntries()
{
  return MEMORY[0x1E0DE1FD0]();
}

uint64_t llvm::StoreInst::StoreInst()
{
  return MEMORY[0x1E0DE2030]();
}

uint64_t llvm::BasicBlock::getFirstNonPHI(llvm::BasicBlock *this)
{
  return MEMORY[0x1E0DE2058](this);
}

uint64_t llvm::BasicBlock::getFirstInsertionPt(llvm::BasicBlock *this)
{
  return MEMORY[0x1E0DE2060](this);
}

uint64_t llvm::BasicBlock::getSinglePredecessor(llvm::BasicBlock *this)
{
  return MEMORY[0x1E0DE2068](this);
}

uint64_t llvm::BasicBlock::getModule(llvm::BasicBlock *this)
{
  return MEMORY[0x1E0DE2070](this);
}

uint64_t llvm::ConstantFP::isExactlyValue()
{
  return MEMORY[0x1E0DE2078]();
}

uint64_t llvm::DataLayout::getABITypeAlign(llvm::DataLayout *this, llvm::Type *a2)
{
  return MEMORY[0x1E0DE20A0](this, a2);
}

uint64_t llvm::DataLayout::getStructLayout()
{
  return MEMORY[0x1E0DE20A8]();
}

uint64_t llvm::DataLayout::getPrefTypeAlign(llvm::DataLayout *this, llvm::Type *a2)
{
  return MEMORY[0x1E0DE20B0](this, a2);
}

uint64_t llvm::DataLayout::getABITypeAlignment(llvm::DataLayout *this, llvm::Type *a2)
{
  return MEMORY[0x1E0DE20B8](this, a2);
}

uint64_t llvm::DataLayout::getPointerAlignElem(llvm::DataLayout *this)
{
  return MEMORY[0x1E0DE20C0](this);
}

uint64_t llvm::DataLayout::getPrefTypeAlignment(llvm::DataLayout *this, llvm::Type *a2)
{
  return MEMORY[0x1E0DE20C8](this, a2);
}

uint64_t llvm::DataLayout::getIndexedOffsetInType()
{
  return MEMORY[0x1E0DE20D8]();
}

uint64_t llvm::StructType::getTypeAtIndex()
{
  return MEMORY[0x1E0DE20F0]();
}

uint64_t llvm::StructType::getName(llvm::StructType *this)
{
  return MEMORY[0x1E0DE20F8](this);
}

uint64_t llvm::GEPOperator::getResultElementType(llvm::GEPOperator *this)
{
  return MEMORY[0x1E0DE2108](this);
}

uint64_t llvm::GEPOperator::getSourceElementType(llvm::GEPOperator *this)
{
  return MEMORY[0x1E0DE2110](this);
}

uint64_t llvm::GlobalValue::isDeclaration(llvm::GlobalValue *this)
{
  return MEMORY[0x1E0DE2128](this);
}

uint64_t llvm::GlobalValue::hasExternalWeakLinkage(llvm::GlobalValue *this)
{
  return MEMORY[0x1E0DE2138](this);
}

uint64_t llvm::Instruction::comesBefore(llvm::Instruction *this, const llvm::Instruction *a2)
{
  return MEMORY[0x1E0DE2140](this, a2);
}

uint64_t llvm::Instruction::getFunction(llvm::Instruction *this)
{
  return MEMORY[0x1E0DE2148](this);
}

uint64_t llvm::Instruction::getSuccessor(llvm::Instruction *this)
{
  return MEMORY[0x1E0DE2150](this);
}

uint64_t llvm::Instruction::isIdenticalTo(llvm::Instruction *this, const llvm::Instruction *a2)
{
  return MEMORY[0x1E0DE2160](this, a2);
}

uint64_t llvm::Instruction::getMetadataImpl()
{
  return MEMORY[0x1E0DE2168]();
}

uint64_t llvm::Instruction::getFastMathFlags(llvm::Instruction *this)
{
  return MEMORY[0x1E0DE2178](this);
}

uint64_t llvm::Instruction::getNumSuccessors(llvm::Instruction *this)
{
  return MEMORY[0x1E0DE2180](this);
}

uint64_t llvm::Instruction::getNextNonDebugInstruction(llvm::Instruction *this)
{
  return MEMORY[0x1E0DE21B8](this);
}

uint64_t llvm::Instruction::clone(llvm::Instruction *this)
{
  return MEMORY[0x1E0DE21C0](this);
}

uint64_t llvm::NamedMDNode::getOperand(llvm::NamedMDNode *this)
{
  return MEMORY[0x1E0DE2230](this);
}

uint64_t llvm::NamedMDNode::getNumOperands(llvm::NamedMDNode *this)
{
  return MEMORY[0x1E0DE2238](this);
}

uint64_t llvm::AttributeSet::addAttribute()
{
  return MEMORY[0x1E0DE2250]();
}

uint64_t llvm::AttributeSet::removeAttribute()
{
  return MEMORY[0x1E0DE2270]();
}

uint64_t llvm::ConstantExpr::getPredicate(llvm::ConstantExpr *this)
{
  return MEMORY[0x1E0DE2288](this);
}

uint64_t llvm::ConstantExpr::getWithOperands()
{
  return MEMORY[0x1E0DE2290]();
}

uint64_t llvm::ConstantExpr::getAsInstruction(llvm::ConstantExpr *this, llvm::Instruction *a2)
{
  return MEMORY[0x1E0DE2298](this, a2);
}

uint64_t llvm::DILocalScope::getNonLexicalBlockFileScope(llvm::DILocalScope *this)
{
  return MEMORY[0x1E0DE22B0](this);
}

uint64_t llvm::GlobalObject::getSectionImpl(llvm::GlobalObject *this)
{
  return MEMORY[0x1E0DE22B8](this);
}

uint64_t llvm::MemoryBuffer::getMemBufferRef(llvm::MemoryBuffer *this)
{
  return MEMORY[0x1E0DE22C0](this);
}

uint64_t llvm::SMDiagnostic::print(llvm::SMDiagnostic *this, const char *a2, llvm::raw_ostream *a3)
{
  return MEMORY[0x1E0DE22D0](this, a2, a3);
}

uint64_t llvm::AttributeList::getFnAttrs(llvm::AttributeList *this)
{
  return MEMORY[0x1E0DE22E8](this);
}

uint64_t llvm::AttributeList::getParamAlignment(llvm::AttributeList *this)
{
  return MEMORY[0x1E0DE2310](this);
}

uint64_t llvm::AttributeList::addAttributeAtIndex()
{
  return MEMORY[0x1E0DE2318]();
}

{
  return MEMORY[0x1E0DE2320]();
}

uint64_t llvm::AttributeList::getAttributeAtIndex()
{
  return MEMORY[0x1E0DE2330]();
}

uint64_t llvm::AttributeList::hasFnAttr()
{
  return MEMORY[0x1E0DE2360]();
}

{
  return MEMORY[0x1E0DE2368]();
}

uint64_t llvm::DominatorTree::dominates()
{
  return MEMORY[0x1E0DE2370]();
}

uint64_t llvm::IRBuilderBase::getCurrentDebugLocation(llvm::IRBuilderBase *this)
{
  return MEMORY[0x1E0DE2378](this);
}

uint64_t llvm::StringMapImpl::FindKey()
{
  return MEMORY[0x1E0DE2380]();
}

uint64_t llvm::TargetExtType::getLayoutType(llvm::TargetExtType *this)
{
  return MEMORY[0x1E0DE2388](this);
}

uint64_t llvm::DominatorTreeBase<llvm::BasicBlock,false>::findNearestCommonDominator()
{
  return off_1E7E601A8();
}

uint64_t llvm::DominatorTreeBase<llvm::BasicBlock,true>::findNearestCommonDominator()
{
  return off_1E7E601B0();
}

uint64_t llvm::DominatorTreeBase<llvm::BasicBlock,true>::print()
{
  return off_1E7E601B8();
}

uint64_t llvm::GetElementPtrInst::isInBounds(llvm::GetElementPtrInst *this)
{
  return MEMORY[0x1E0DE23B0](this);
}

uint64_t llvm::GetElementPtrInst::hasAllConstantIndices(llvm::GetElementPtrInst *this)
{
  return MEMORY[0x1E0DE23B8](this);
}

uint64_t llvm::SmallPtrSetImplBase::FindBucketFor(llvm::SmallPtrSetImplBase *this, const void *a2)
{
  return MEMORY[0x1E0DE23F0](this, a2);
}

uint64_t llvm::ConstantDataSequential::getElementAsInteger(llvm::ConstantDataSequential *this)
{
  return MEMORY[0x1E0DE2438](this);
}

uint64_t llvm::AGX::Diagnostic::getMessage(llvm::AGX::Diagnostic *this)
{
  return MEMORY[0x1E0DE2490](this);
}

uint64_t llvm::AGX::AGXCompiler::isValid(llvm::AGX::AGXCompiler *this)
{
  return MEMORY[0x1E0DE2498](this);
}

uint64_t llvm::AGX::CompileReply::isValid(llvm::AGX::CompileReply *this)
{
  return MEMORY[0x1E0DE24A0](this);
}

uint64_t llvm::AGX::AGXCompilePlan::isValid(llvm::AGX::AGXCompilePlan *this)
{
  return MEMORY[0x1E0DE24A8](this);
}

uint64_t llvm::AGX::CompileRequest::getTelemetryCollector(llvm::AGX::CompileRequest *this)
{
  return MEMORY[0x1E0DE24B0](this);
}

uint64_t llvm::AGX::TelemetryCollector::fetchData(llvm::AGX::TelemetryCollector *this)
{
  return MEMORY[0x1E0DE24B8](this);
}

uint64_t llvm::LLT::print(llvm::LLT *this, llvm::raw_ostream *a2)
{
  return MEMORY[0x1E0DE24C0](this, a2);
}

uint64_t llvm::Use::getOperandNo(llvm::Use *this)
{
  return MEMORY[0x1E0DE24C8](this);
}

uint64_t llvm::Type::isIntegerTy(llvm::Type *this)
{
  return MEMORY[0x1E0DE24D8](this);
}

uint64_t llvm::Type::getPointerTo(llvm::Type *this)
{
  return MEMORY[0x1E0DE24E0](this);
}

uint64_t llvm::Type::isOpaquePointerTy(llvm::Type *this)
{
  return MEMORY[0x1E0DE24F0](this);
}

uint64_t llvm::Type::getFPMantissaWidth(llvm::Type *this)
{
  return MEMORY[0x1E0DE24F8](this);
}

uint64_t llvm::Type::isSizedDerivedType()
{
  return MEMORY[0x1E0DE2500]();
}

uint64_t llvm::Type::getScalarSizeInBits(llvm::Type *this)
{
  return MEMORY[0x1E0DE2508](this);
}

uint64_t llvm::Type::getPrimitiveSizeInBits(llvm::Type *this)
{
  return MEMORY[0x1E0DE2510](this);
}

uint64_t llvm::Type::print(llvm::Type *this, llvm::raw_ostream *a2)
{
  return MEMORY[0x1E0DE2518](this, a2);
}

uint64_t llvm::APInt::countLeadingZerosSlowCase(llvm::APInt *this)
{
  return MEMORY[0x1E0DE2538](this);
}

uint64_t llvm::Twine::str(llvm::Twine *this)
{
  return MEMORY[0x1E0DE2568](this);
}

uint64_t llvm::Value::getContext(llvm::Value *this)
{
  return MEMORY[0x1E0DE2580](this);
}

uint64_t llvm::Value::getNumUses(llvm::Value *this)
{
  return MEMORY[0x1E0DE2588](this);
}

uint64_t llvm::Value::getMetadata()
{
  return MEMORY[0x1E0DE2590]();
}

uint64_t llvm::Value::hasNUsesOrMore(llvm::Value *this)
{
  return MEMORY[0x1E0DE25A0](this);
}

uint64_t llvm::Value::stripPointerCasts(llvm::Value *this)
{
  return MEMORY[0x1E0DE25A8](this);
}

uint64_t llvm::Value::print(llvm::Value *this, llvm::raw_ostream *a2)
{
  return MEMORY[0x1E0DE25B8](this, a2);
}

uint64_t llvm::Value::getName(llvm::Value *this)
{
  return MEMORY[0x1E0DE25C0](this);
}

uint64_t llvm::Module::getFunction()
{
  return MEMORY[0x1E0DE25E8]();
}

uint64_t llvm::Module::getDataLayout(llvm::Module *this)
{
  return MEMORY[0x1E0DE25F0](this);
}

uint64_t llvm::Module::getNamedMetadata(llvm::Module *this, const llvm::Twine *a2)
{
  return MEMORY[0x1E0DE2628](this, a2);
}

uint64_t llvm::Module::getGlobalVariable()
{
  return MEMORY[0x1E0DE2630]();
}

uint64_t llvm::Module::print()
{
  return MEMORY[0x1E0DE2650]();
}

uint64_t llvm::Triple::getOSVersion(llvm::Triple *this)
{
  return MEMORY[0x1E0DE2670](this);
}

uint64_t llvm::Triple::getEnvironmentName(llvm::Triple *this)
{
  return MEMORY[0x1E0DE2688](this);
}

uint64_t llvm::Argument::hasAttribute()
{
  return MEMORY[0x1E0DE28B8]();
}

uint64_t llvm::Argument::hasNoAliasAttr(llvm::Argument *this)
{
  return MEMORY[0x1E0DE28D0](this);
}

uint64_t llvm::CallBase::paramHasAttr()
{
  return MEMORY[0x1E0DE28F0]();
}

uint64_t llvm::CallBase::hasReadingOperandBundles(llvm::CallBase *this)
{
  return MEMORY[0x1E0DE2908](this);
}

uint64_t llvm::CallBase::hasFnAttrOnCalledFunction()
{
  return MEMORY[0x1E0DE2910]();
}

{
  return MEMORY[0x1E0DE2918]();
}

uint64_t llvm::CallBase::getNumSubclassExtraOperandsDynamic(llvm::CallBase *this)
{
  return MEMORY[0x1E0DE2920](this);
}

uint64_t llvm::Constant::isNullValue(llvm::Constant *this)
{
  return MEMORY[0x1E0DE2930](this);
}

uint64_t llvm::Constant::isZeroValue(llvm::Constant *this)
{
  return MEMORY[0x1E0DE2938](this);
}

uint64_t llvm::Constant::getAggregateElement(llvm::Constant *this)
{
  return MEMORY[0x1E0DE2948](this);
}

uint64_t llvm::Constant::removeDeadConstantUsers(llvm::Constant *this)
{
  return MEMORY[0x1E0DE2950](this);
}

uint64_t llvm::Function::getContext(llvm::Function *this)
{
  return MEMORY[0x1E0DE2960](this);
}

uint64_t llvm::Function::getSubprogram(llvm::Function *this)
{
  return MEMORY[0x1E0DE2970](this);
}

uint64_t llvm::Function::getFnAttribute()
{
  return MEMORY[0x1E0DE2978]();
}

uint64_t llvm::Function::hasFnAttribute()
{
  return MEMORY[0x1E0DE2980]();
}

{
  return MEMORY[0x1E0DE2988]();
}

uint64_t llvm::Function::BuildLazyArguments(llvm::Function *this)
{
  return MEMORY[0x1E0DE29A0](this);
}

uint64_t llvm::MDString::getString(llvm::MDString *this)
{
  return MEMORY[0x1E0DE29B8](this);
}

uint64_t llvm::TypeSize::operator unsigned long long()
{
  return MEMORY[0x1E0DE29C8]();
}

uint64_t llvm::Attribute::getValueAsString(llvm::Attribute *this)
{
  return MEMORY[0x1E0DE2A10](this);
}

uint64_t llvm::Attribute::isStringAttribute(llvm::Attribute *this)
{
  return MEMORY[0x1E0DE2A18](this);
}

uint64_t llvm::StringRef::find()
{
  return MEMORY[0x1E0DE2A58]();
}

uint64_t llvm::StringRef::split()
{
  return MEMORY[0x1E0DE2A78]();
}

std::string::size_type std::string::find(const std::string *this, const std::string::value_type *__s, std::string::size_type __pos, std::string::size_type __n)
{
  return MEMORY[0x1E0DE41C0](this, __s, __pos, __n);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x1E0DE41C8](this, __c, __pos);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1E0DE41D8](this, __s);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x1E0DE43A8](a1, a2, a3);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4408](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4420](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4440](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4448](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4468](this, __pos, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4470](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x1E0DE44A8](this, __requested_capacity);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1E0DE44C8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1E0DE4590]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1E0DE45A8]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1E0DE45B0]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1E0DE4608]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1E0DE4628]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x1E0DE4640]();
}

{
  return MEMORY[0x1E0DE4650]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1E0DE4698]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1E0DE46A0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE4708]();
}

{
  return MEMORY[0x1E0DE4738]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

uint64_t std::ofstream::open()
{
  return MEMORY[0x1E0DE47B8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x1E0DE4848]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
  MEMORY[0x1E0DE4930](__format);
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x1E0DE4A78](__str, __idx, *(_QWORD *)&__base);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D58](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D60](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D80](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1E0DE4D88]();
}

uint64_t operator delete[]()
{
  return off_1E7E605C8();
}

void operator delete(void *__p)
{
  off_1E7E605D0(__p);
}

uint64_t operator delete()
{
  return off_1E7E605D8();
}

uint64_t operator new[]()
{
  return off_1E7E605E0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E7E605E8(__sz);
}

uint64_t operator new()
{
  return off_1E7E605F0();
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C78](*(_QWORD *)&a1);
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1E0C81008]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t analytics_send_event()
{
  return MEMORY[0x1E0D15468]();
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C82640](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CD0](data, buffer_ptr, size_ptr);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1E0C83030](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
  MEMORY[0x1E0C840C0](__b, __pattern4, __len);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1E0C84198](path, omode);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_parse_boot_arg_int()
{
  return MEMORY[0x1E0C848F8]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

uint64_t random(void)
{
  return MEMORY[0x1E0C84FC0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85460](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A58](a1, a2, a3);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C860E8](object);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}


@implementation Z21GetPlatformHeuristicsRKNSt3

uint64_t *___Z21GetPlatformHeuristicsRKNSt3__110shared_ptrIN8Espresso3netEEE_block_invoke()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void **v5;
  _QWORD *v6;
  int *v7;
  unint64_t v8;
  uint8x8_t v9;
  uint64_t **v10;
  uint64_t *i;
  unint64_t v12;
  _QWORD *v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  int8x8_t prime;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  uint8x8_t v25;
  unint64_t v26;
  uint8x8_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *result;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (GetChipID(void)::onceToken != -1)
    dispatch_once(&GetChipID(void)::onceToken, &__block_literal_global_2_12614);
  GetPlatformHeuristics(std::shared_ptr<Espresso::net> const&)::chip_id = GetChipID(void)::chipID;
  v1 = operator new();
  v2 = 0;
  v3 = 0;
  v4 = 0;
  *(_OWORD *)(v1 + 96) = 0u;
  *(_OWORD *)(v1 + 112) = 0u;
  *(_OWORD *)(v1 + 128) = 0u;
  *(_OWORD *)(v1 + 144) = 0u;
  *(_OWORD *)(v1 + 160) = 0u;
  *(_OWORD *)(v1 + 176) = 0u;
  *(_OWORD *)(v1 + 192) = 0u;
  *(_OWORD *)(v1 + 208) = 0u;
  *(_OWORD *)(v1 + 224) = 0u;
  *(_OWORD *)(v1 + 240) = 0u;
  *(_OWORD *)(v1 + 256) = 0u;
  *(_OWORD *)(v1 + 272) = 0u;
  *(_OWORD *)(v1 + 288) = 0u;
  *(_OWORD *)(v1 + 304) = 0u;
  *(_OWORD *)(v1 + 320) = 0u;
  *(_OWORD *)(v1 + 336) = 0u;
  *(_OWORD *)(v1 + 352) = 0u;
  *(_OWORD *)(v1 + 368) = 0u;
  *(_OWORD *)(v1 + 384) = 0u;
  *(_OWORD *)(v1 + 400) = 0u;
  *(_OWORD *)(v1 + 416) = 0u;
  *(_OWORD *)(v1 + 432) = 0u;
  *(_OWORD *)(v1 + 448) = 0u;
  *(_OWORD *)(v1 + 464) = 0u;
  *(_OWORD *)(v1 + 480) = 0u;
  *(_OWORD *)(v1 + 496) = 0u;
  *(_OWORD *)(v1 + 512) = 0u;
  *(_QWORD *)(v1 + 528) = 0;
  *(_QWORD *)(v1 + 8) = 850045863;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_QWORD *)(v1 + 64) = 0;
  *(_QWORD *)v1 = &off_1E2D56E90;
  *(_OWORD *)(v1 + 72) = 0u;
  v5 = (void **)(v1 + 72);
  *(_DWORD *)(v1 + 104) = 1065353216;
  *(_OWORD *)(v1 + 88) = 0u;
  v6 = (_QWORD *)(v1 + 88);
  do
  {
    v7 = (int *)((char *)&unk_191ABFF10 + 16 * v4);
    v8 = *v7;
    if (v2)
    {
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)v2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        v0 = *v7;
        if (v2 <= v8)
          v0 = v8 % v2;
      }
      else
      {
        v0 = (v2 - 1) & v8;
      }
      v10 = (uint64_t **)*((_QWORD *)*v5 + v0);
      if (v10)
      {
        for (i = *v10; i; i = (uint64_t *)*i)
        {
          v12 = i[1];
          if (v12 == v8)
          {
            if (*((_DWORD *)i + 4) == (_DWORD)v8)
              goto LABEL_76;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v2)
                v12 %= v2;
            }
            else
            {
              v12 &= v2 - 1;
            }
            if (v12 != v0)
              break;
          }
        }
      }
    }
    v13 = operator new(0x20uLL);
    *v13 = 0;
    v13[1] = v8;
    *((_OWORD *)v13 + 1) = *(_OWORD *)v7;
    v14 = (float)(unint64_t)(v3 + 1);
    v15 = *(float *)(v1 + 104);
    if (!v2 || (float)(v15 * (float)v2) < v14)
    {
      v16 = (v2 & (v2 - 1)) != 0;
      if (v2 < 3)
        v16 = 1;
      v17 = v16 | (2 * v2);
      v18 = vcvtps_u32_f32(v14 / v15);
      if (v17 <= v18)
        prime = (int8x8_t)v18;
      else
        prime = (int8x8_t)v17;
      if (*(_QWORD *)&prime == 1)
      {
        prime = (int8x8_t)2;
      }
      else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
      {
        prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
        v2 = *(_QWORD *)(v1 + 80);
      }
      if (*(_QWORD *)&prime > v2)
        goto LABEL_32;
      if (*(_QWORD *)&prime < v2)
      {
        v26 = vcvtps_u32_f32((float)*(unint64_t *)(v1 + 96) / *(float *)(v1 + 104));
        if (v2 < 3 || (v27 = (uint8x8_t)vcnt_s8((int8x8_t)v2), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
        {
          v26 = std::__next_prime(v26);
        }
        else
        {
          v28 = 1 << -(char)__clz(v26 - 1);
          if (v26 >= 2)
            v26 = v28;
        }
        if (*(_QWORD *)&prime <= v26)
          prime = (int8x8_t)v26;
        if (*(_QWORD *)&prime >= v2)
        {
          v2 = *(_QWORD *)(v1 + 80);
        }
        else
        {
          if (prime)
          {
LABEL_32:
            if (*(_QWORD *)&prime >> 61)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v20 = operator new(8 * *(_QWORD *)&prime);
            v21 = *v5;
            *v5 = v20;
            if (v21)
              operator delete(v21);
            v22 = 0;
            *(int8x8_t *)(v1 + 80) = prime;
            do
              *((_QWORD *)*v5 + v22++) = 0;
            while (*(_QWORD *)&prime != v22);
            v23 = (_QWORD *)*v6;
            if (*v6)
            {
              v24 = v23[1];
              v25 = (uint8x8_t)vcnt_s8(prime);
              v25.i16[0] = vaddlv_u8(v25);
              if (v25.u32[0] > 1uLL)
              {
                if (v24 >= *(_QWORD *)&prime)
                  v24 %= *(_QWORD *)&prime;
              }
              else
              {
                v24 &= *(_QWORD *)&prime - 1;
              }
              *((_QWORD *)*v5 + v24) = v6;
              v29 = (_QWORD *)*v23;
              if (*v23)
              {
                do
                {
                  v30 = v29[1];
                  if (v25.u32[0] > 1uLL)
                  {
                    if (v30 >= *(_QWORD *)&prime)
                      v30 %= *(_QWORD *)&prime;
                  }
                  else
                  {
                    v30 &= *(_QWORD *)&prime - 1;
                  }
                  if (v30 != v24)
                  {
                    if (!*((_QWORD *)*v5 + v30))
                    {
                      *((_QWORD *)*v5 + v30) = v23;
                      goto LABEL_57;
                    }
                    *v23 = *v29;
                    *v29 = **((_QWORD **)*v5 + v30);
                    **((_QWORD **)*v5 + v30) = v29;
                    v29 = v23;
                  }
                  v30 = v24;
LABEL_57:
                  v23 = v29;
                  v29 = (_QWORD *)*v29;
                  v24 = v30;
                }
                while (v29);
              }
            }
            v2 = (unint64_t)prime;
            goto LABEL_61;
          }
          v34 = *v5;
          *v5 = 0;
          if (v34)
            operator delete(v34);
          v2 = 0;
          *(_QWORD *)(v1 + 80) = 0;
        }
      }
LABEL_61:
      if ((v2 & (v2 - 1)) != 0)
      {
        if (v2 <= v8)
          v0 = v8 % v2;
        else
          v0 = v8;
      }
      else
      {
        v0 = (v2 - 1) & v8;
      }
    }
    v31 = *v5;
    v32 = (_QWORD *)*((_QWORD *)*v5 + v0);
    if (v32)
    {
      *v13 = *v32;
LABEL_74:
      *v32 = v13;
      goto LABEL_75;
    }
    *v13 = *v6;
    *v6 = v13;
    v31[v0] = v6;
    if (*v13)
    {
      v33 = *(_QWORD *)(*v13 + 8);
      if ((v2 & (v2 - 1)) != 0)
      {
        if (v33 >= v2)
          v33 %= v2;
      }
      else
      {
        v33 &= v2 - 1;
      }
      v32 = (char *)*v5 + 8 * v33;
      goto LABEL_74;
    }
LABEL_75:
    v3 = *(_QWORD *)(v1 + 96) + 1;
    *(_QWORD *)(v1 + 96) = v3;
LABEL_76:
    ++v4;
  }
  while (v4 != 3);
  *(_QWORD *)(v1 + 112) = &off_1E2D56398;
  v38 = xmmword_191AC0070;
  *(_QWORD *)&v39 = 0x4266666600000002;
  std::unordered_map<SOC_PState,float>::unordered_map((uint64_t *)(v1 + 120), (int *)&v38, 3);
  v38 = xmmword_191ABFFB0;
  *(_QWORD *)&v39 = 0x50F81AB600000002;
  std::unordered_map<SOC_PState,float>::unordered_map((uint64_t *)(v1 + 160), (int *)&v38, 3);
  v38 = xmmword_191ABFF40;
  v39 = unk_191ABFF50;
  v40 = xmmword_191ABFF60;
  v41 = unk_191ABFF70;
  std::unordered_map<Device_PState,float>::unordered_map((uint64_t *)(v1 + 200), (int *)&v38, 8);
  *(_QWORD *)(v1 + 240) = &off_1E2D55C70;
  v38 = xmmword_191ABFF80;
  *(_QWORD *)&v39 = 0x4275999A00000002;
  std::unordered_map<SOC_PState,float>::unordered_map((uint64_t *)(v1 + 248), (int *)&v38, 3);
  v38 = xmmword_191ABFFB0;
  *(_QWORD *)&v39 = 0x50F81AB600000002;
  std::unordered_map<SOC_PState,float>::unordered_map((uint64_t *)(v1 + 288), (int *)&v38, 3);
  v38 = xmmword_191ABFF98;
  *(_QWORD *)&v39 = 0x4E96342600000002;
  std::unordered_map<Device_PState,float>::unordered_map((uint64_t *)(v1 + 328), (int *)&v38, 3);
  v38 = xmmword_191ABFF98;
  *(_QWORD *)&v39 = 0x4E96342600000002;
  std::unordered_map<Device_PState,float>::unordered_map((uint64_t *)(v1 + 368), (int *)&v38, 3);
  *(_QWORD *)(v1 + 408) = &off_1E2D55D20;
  v38 = xmmword_191AC0070;
  *(_QWORD *)&v39 = 0x4266666600000002;
  std::unordered_map<SOC_PState,float>::unordered_map((uint64_t *)(v1 + 416), (int *)&v38, 3);
  v38 = xmmword_191ABFFB0;
  *(_QWORD *)&v39 = 0x50F81AB600000002;
  std::unordered_map<SOC_PState,float>::unordered_map((uint64_t *)(v1 + 456), (int *)&v38, 3);
  v38 = xmmword_191ABFFC8;
  v39 = unk_191ABFFD8;
  *(_QWORD *)&v40 = 0x4E8CC94200000004;
  std::unordered_map<Device_PState,float>::unordered_map((uint64_t *)(v1 + 496), (int *)&v38, 5);
  GetPlatformHeuristics(std::shared_ptr<Espresso::net> const&)::pHeuristics_old = v1;
  v35 = operator new();
  *(_OWORD *)(v35 + 80) = 0u;
  *(_OWORD *)(v35 + 96) = 0u;
  *(_OWORD *)(v35 + 112) = 0u;
  *(_OWORD *)(v35 + 128) = 0u;
  *(_OWORD *)(v35 + 144) = 0u;
  *(_OWORD *)(v35 + 160) = 0u;
  *(_OWORD *)(v35 + 176) = 0u;
  *(_OWORD *)(v35 + 192) = 0u;
  *(_OWORD *)(v35 + 208) = 0u;
  *(_OWORD *)(v35 + 224) = 0u;
  *(_OWORD *)(v35 + 240) = 0u;
  *(_OWORD *)(v35 + 256) = 0u;
  *(_OWORD *)(v35 + 272) = 0u;
  *(_OWORD *)(v35 + 288) = 0u;
  *(_OWORD *)(v35 + 304) = 0u;
  *(_OWORD *)(v35 + 320) = 0u;
  *(_OWORD *)(v35 + 336) = 0u;
  *(_OWORD *)(v35 + 352) = 0u;
  *(_OWORD *)(v35 + 368) = 0u;
  *(_OWORD *)(v35 + 384) = 0u;
  *(_OWORD *)(v35 + 400) = 0u;
  *(_OWORD *)(v35 + 416) = 0u;
  *(_OWORD *)(v35 + 432) = 0u;
  *(_OWORD *)(v35 + 448) = 0u;
  *(_OWORD *)(v35 + 464) = 0u;
  *(_OWORD *)(v35 + 480) = 0u;
  *(_OWORD *)(v35 + 496) = 0u;
  *(_OWORD *)(v35 + 512) = 0u;
  *(_QWORD *)(v35 + 528) = 0;
  *(_QWORD *)(v35 + 8) = 850045863;
  *(_OWORD *)(v35 + 16) = 0u;
  *(_OWORD *)(v35 + 32) = 0u;
  *(_OWORD *)(v35 + 48) = 0u;
  *(_OWORD *)(v35 + 64) = 0u;
  *(_QWORD *)(v35 + 64) = 0;
  *(_QWORD *)v35 = &off_1E2D57088;
  v38 = xmmword_191AC0088;
  *(_QWORD *)&v39 = 0x50FE109700000002;
  std::unordered_map<SOC_PState,float>::unordered_map((uint64_t *)(v35 + 72), (int *)&v38, 3);
  *(_QWORD *)(v35 + 112) = &off_1E2D56BE8;
  v38 = xmmword_191AC0070;
  *(_QWORD *)&v39 = 0x4266666600000002;
  std::unordered_map<SOC_PState,float>::unordered_map((uint64_t *)(v35 + 120), (int *)&v38, 3);
  v38 = xmmword_191ABFFF0;
  *(_QWORD *)&v39 = 0x4208666600000002;
  std::unordered_map<SOC_PState,float>::unordered_map((uint64_t *)(v35 + 160), (int *)&v38, 3);
  v40 = xmmword_191AC0028;
  v41 = unk_191AC0038;
  v42 = xmmword_191AC0048;
  v38 = xmmword_191AC0008;
  v39 = unk_191AC0018;
  std::unordered_map<Device_PState,float>::unordered_map((uint64_t *)(v35 + 200), (int *)&v38, 10);
  newpANEHeuristics::newpANEHeuristics((newpANEHeuristics *)(v35 + 240));
  *(_QWORD *)(v35 + 408) = &off_1E2D56580;
  v38 = xmmword_191AC0070;
  *(_QWORD *)&v39 = 0x4266666600000002;
  std::unordered_map<SOC_PState,float>::unordered_map((uint64_t *)(v35 + 416), (int *)&v38, 3);
  v38 = xmmword_191AC0088;
  *(_QWORD *)&v39 = 0x50FE109700000002;
  std::unordered_map<SOC_PState,float>::unordered_map((uint64_t *)(v35 + 456), (int *)&v38, 3);
  v38 = xmmword_191AC00A0;
  v39 = unk_191AC00B0;
  v40 = xmmword_191AC00C0;
  std::unordered_map<Device_PState,float>::unordered_map((uint64_t *)(v35 + 496), (int *)&v38, 6);
  GetPlatformHeuristics(std::shared_ptr<Espresso::net> const&)::pHeuristics_new = v35;
  v36 = operator new();
  *(_OWORD *)(v36 + 80) = 0u;
  *(_OWORD *)(v36 + 96) = 0u;
  *(_OWORD *)(v36 + 112) = 0u;
  *(_OWORD *)(v36 + 128) = 0u;
  *(_OWORD *)(v36 + 144) = 0u;
  *(_OWORD *)(v36 + 160) = 0u;
  *(_OWORD *)(v36 + 176) = 0u;
  *(_OWORD *)(v36 + 192) = 0u;
  *(_OWORD *)(v36 + 208) = 0u;
  *(_OWORD *)(v36 + 224) = 0u;
  *(_OWORD *)(v36 + 240) = 0u;
  *(_OWORD *)(v36 + 256) = 0u;
  *(_OWORD *)(v36 + 272) = 0u;
  *(_OWORD *)(v36 + 288) = 0u;
  *(_OWORD *)(v36 + 304) = 0u;
  *(_OWORD *)(v36 + 320) = 0u;
  *(_OWORD *)(v36 + 336) = 0u;
  *(_OWORD *)(v36 + 352) = 0u;
  *(_OWORD *)(v36 + 368) = 0u;
  *(_OWORD *)(v36 + 384) = 0u;
  *(_OWORD *)(v36 + 400) = 0u;
  *(_OWORD *)(v36 + 416) = 0u;
  *(_OWORD *)(v36 + 432) = 0u;
  *(_OWORD *)(v36 + 448) = 0u;
  *(_OWORD *)(v36 + 464) = 0u;
  *(_OWORD *)(v36 + 480) = 0u;
  *(_OWORD *)(v36 + 496) = 0u;
  *(_OWORD *)(v36 + 512) = 0u;
  *(_QWORD *)(v36 + 528) = 0;
  *(_QWORD *)(v36 + 8) = 850045863;
  *(_OWORD *)(v36 + 16) = 0u;
  *(_OWORD *)(v36 + 32) = 0u;
  *(_OWORD *)(v36 + 48) = 0u;
  *(_OWORD *)(v36 + 64) = 0u;
  *(_QWORD *)(v36 + 64) = 0;
  *(_QWORD *)v36 = &off_1E2D56FB8;
  v38 = xmmword_191AC00D0;
  *(_QWORD *)&v39 = 0x52BE749900000002;
  std::unordered_map<SOC_PState,float>::unordered_map((uint64_t *)(v36 + 72), (int *)&v38, 3);
  *(_QWORD *)(v36 + 112) = &off_1E2D56BE8;
  v38 = xmmword_191AC0070;
  *(_QWORD *)&v39 = 0x4266666600000002;
  std::unordered_map<SOC_PState,float>::unordered_map((uint64_t *)(v36 + 120), (int *)&v38, 3);
  v38 = xmmword_191ABFFF0;
  *(_QWORD *)&v39 = 0x4208666600000002;
  std::unordered_map<SOC_PState,float>::unordered_map((uint64_t *)(v36 + 160), (int *)&v38, 3);
  v40 = xmmword_191AC0028;
  v41 = unk_191AC0038;
  v42 = xmmword_191AC0048;
  v38 = xmmword_191AC0008;
  v39 = unk_191AC0018;
  std::unordered_map<Device_PState,float>::unordered_map((uint64_t *)(v36 + 200), (int *)&v38, 10);
  newpANEHeuristics::newpANEHeuristics((newpANEHeuristics *)(v36 + 240));
  *(_QWORD *)(v36 + 408) = &off_1E2D56460;
  v38 = xmmword_191AC00E8;
  *(_QWORD *)&v39 = 0x4400000000000002;
  std::unordered_map<SOC_PState,float>::unordered_map((uint64_t *)(v36 + 416), (int *)&v38, 3);
  v38 = xmmword_191AC0100;
  *(_QWORD *)&v39 = 0x52EE6B2800000002;
  std::unordered_map<SOC_PState,float>::unordered_map((uint64_t *)(v36 + 456), (int *)&v38, 3);
  v38 = xmmword_191AC0118;
  v39 = unk_191AC0128;
  v40 = xmmword_191AC0138;
  result = std::unordered_map<Device_PState,float>::unordered_map((uint64_t *)(v36 + 496), (int *)&v38, 6);
  GetPlatformHeuristics(std::shared_ptr<Espresso::net> const&)::pHeuristics_jade = v36;
  return result;
}

@end

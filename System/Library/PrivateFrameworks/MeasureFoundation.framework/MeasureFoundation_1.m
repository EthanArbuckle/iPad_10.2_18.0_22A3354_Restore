BOOL sub_221622208(void *__src, const void *a2)
{
  _BYTE v4[480];
  _BYTE __dst[480];

  memcpy(v4, __src, sizeof(v4));
  memcpy(__dst, a2, sizeof(__dst));
  return _s17MeasureFoundation24ComputedCameraPropertiesV23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v4, (uint64_t)__dst);
}

uint64_t sub_22162225C(uint64_t isStackAllocationSafe)
{
  uint64_t v1;
  char v2;
  size_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  uint64_t v38;

  v1 = isStackAllocationSafe;
  v38 = *MEMORY[0x24BDAC8D0];
  v2 = *(_BYTE *)(isStackAllocationSafe + 32);
  v36 = (unint64_t)((1 << v2) + 63) >> 6;
  v3 = 8 * v36;
  if ((v2 & 0x3Fu) > 0xD)
  {
    isStackAllocationSafe = swift_stdlib_isStackAllocationSafe();
    if ((isStackAllocationSafe & 1) == 0)
    {
      v37 = (char *)swift_slowAlloc();
      bzero(v37, v3);
      v20 = 0;
      v21 = 0;
      v22 = v1 + 64;
      v23 = 1 << *(_BYTE *)(v1 + 32);
      if (v23 < 64)
        v24 = ~(-1 << v23);
      else
        v24 = -1;
      v25 = v24 & *(_QWORD *)(v1 + 64);
      v26 = (unint64_t)(v23 + 63) >> 6;
      while (1)
      {
        if (v25)
        {
          v27 = __clz(__rbit64(v25));
          v25 &= v25 - 1;
          v28 = v27 | (v21 << 6);
        }
        else
        {
          v31 = v21 + 1;
          if (__OFADD__(v21, 1))
            goto LABEL_54;
          if (v31 >= v26)
            goto LABEL_51;
          v32 = *(_QWORD *)(v22 + 8 * v31);
          ++v21;
          if (!v32)
          {
            v21 = v31 + 1;
            if (v31 + 1 >= v26)
              goto LABEL_51;
            v32 = *(_QWORD *)(v22 + 8 * v21);
            if (!v32)
            {
              v21 = v31 + 2;
              if (v31 + 2 >= v26)
                goto LABEL_51;
              v32 = *(_QWORD *)(v22 + 8 * v21);
              if (!v32)
              {
                v33 = v31 + 3;
                if (v33 >= v26)
                  goto LABEL_51;
                v32 = *(_QWORD *)(v22 + 8 * v33);
                if (!v32)
                {
                  while (1)
                  {
                    v21 = v33 + 1;
                    if (__OFADD__(v33, 1))
                      goto LABEL_56;
                    if (v21 >= v26)
                      break;
                    v32 = *(_QWORD *)(v22 + 8 * v21);
                    ++v33;
                    if (v32)
                      goto LABEL_47;
                  }
LABEL_51:
                  v19 = sub_221622650((unint64_t *)v37, v36, v20, v1);
                  MEMORY[0x22766FAF4](v37, -1, -1);
                  return v19;
                }
                v21 = v33;
              }
            }
          }
LABEL_47:
          v25 = (v32 - 1) & v32;
          v28 = __clz(__rbit64(v32)) + (v21 << 6);
        }
        v29 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 496 * v28) + 16;
        swift_beginAccess();
        v30 = (void *)MEMORY[0x22766FB84](v29);
        if (v30)
        {

          *(_QWORD *)&v37[(v28 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v28;
          v18 = __OFADD__(v20++, 1);
          if (v18)
          {
            __break(1u);
            goto LABEL_51;
          }
        }
      }
    }
  }
  v35 = (uint64_t)&v35;
  MEMORY[0x24BDAC7A8](isStackAllocationSafe);
  v37 = (char *)&v35 - ((v3 + 15) & 0x3FFFFFFFFFFFFFF0);
  bzero(v37, v3);
  v4 = 0;
  v5 = 0;
  v6 = v1 + 64;
  v7 = 1 << *(_BYTE *)(v1 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(v1 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v12 = v11 | (v5 << 6);
    }
    else
    {
      v15 = v5 + 1;
      if (__OFADD__(v5, 1))
      {
        __break(1u);
LABEL_54:
        __break(1u);
        goto LABEL_55;
      }
      if (v15 >= v10)
        return sub_221622650((unint64_t *)v37, v36, v4, v1);
      v16 = *(_QWORD *)(v6 + 8 * v15);
      ++v5;
      if (!v16)
      {
        v5 = v15 + 1;
        if (v15 + 1 >= v10)
          return sub_221622650((unint64_t *)v37, v36, v4, v1);
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
        {
          v5 = v15 + 2;
          if (v15 + 2 >= v10)
            return sub_221622650((unint64_t *)v37, v36, v4, v1);
          v16 = *(_QWORD *)(v6 + 8 * v5);
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= v10)
              return sub_221622650((unint64_t *)v37, v36, v4, v1);
            v16 = *(_QWORD *)(v6 + 8 * v17);
            if (!v16)
            {
              while (1)
              {
                v5 = v17 + 1;
                if (__OFADD__(v17, 1))
                  break;
                if (v5 >= v10)
                  return sub_221622650((unint64_t *)v37, v36, v4, v1);
                v16 = *(_QWORD *)(v6 + 8 * v5);
                ++v17;
                if (v16)
                  goto LABEL_22;
              }
LABEL_55:
              __break(1u);
LABEL_56:
              __break(1u);
            }
            v5 = v17;
          }
        }
      }
LABEL_22:
      v9 = (v16 - 1) & v16;
      v12 = __clz(__rbit64(v16)) + (v5 << 6);
    }
    v13 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 496 * v12) + 16;
    swift_beginAccess();
    v14 = (void *)MEMORY[0x22766FB84](v13);
    if (v14)
    {

      *(_QWORD *)&v37[(v12 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v12;
      v18 = __OFADD__(v4++, 1);
      if (v18)
        break;
    }
  }
  __break(1u);
  return sub_221622650((unint64_t *)v37, v36, v4, v1);
}

uint64_t sub_221622650(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  _BYTE v28[512];

  if (!a3)
    return MEMORY[0x24BEE4B00];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DA0F0);
  result = sub_221653A14();
  v9 = result;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
    }
    else
    {
      v15 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_40;
      if (v15 >= a2)
        return v9;
      v16 = a1[v15];
      ++v11;
      if (!v16)
      {
        v11 = v15 + 1;
        if (v15 + 1 >= a2)
          return v9;
        v16 = a1[v11];
        if (!v16)
        {
          v11 = v15 + 2;
          if (v15 + 2 >= a2)
            return v9;
          v16 = a1[v11];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= a2)
              return v9;
            v16 = a1[v17];
            if (!v16)
            {
              while (1)
              {
                v11 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_41;
                if (v11 >= a2)
                  return v9;
                v16 = a1[v11];
                ++v17;
                if (v16)
                  goto LABEL_24;
              }
            }
            v11 = v17;
          }
        }
      }
LABEL_24:
      v10 = (v16 - 1) & v16;
      v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    v18 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    memcpy(v28, (const void *)(*(_QWORD *)(v4 + 56) + 496 * v14), 0x1F0uLL);
    result = sub_221653B7C();
    v19 = -1 << *(_BYTE *)(v9 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v25 = v21 == v24;
        if (v21 == v24)
          v21 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(_QWORD *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v22) = v18;
    result = (uint64_t)memcpy((void *)(*(_QWORD *)(v9 + 56) + 496 * v22), v28, 0x1F0uLL);
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    result = sub_2215D2034((uint64_t)v28);
    if (!v5)
      return v9;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

BOOL _s17MeasureFoundation24ComputedCameraPropertiesV23__derived_struct_equalsySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int32x2_t v2;
  _BOOL8 result;
  uint32x4_t v6;
  uint32x4_t v7;

  v2 = vceq_f32(*(float32x2_t *)a1, *(float32x2_t *)a2);
  if ((v2.i32[0] & v2.i32[1] & 1) == 0
    || (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 32), *(float32x4_t *)(a2 + 32)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 16), *(float32x4_t *)(a2 + 16))), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 48), *(float32x4_t *)(a2 + 48)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 64), *(float32x4_t *)(a2 + 64))))) & 0x80000000) == 0|| (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 96), *(float32x4_t *)(a2 + 96)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 80), *(float32x4_t *)(a2 + 80))), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 112), *(float32x4_t *)(a2 + 112)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 128), *(float32x4_t *)(a2 + 128))))) & 0x80000000) == 0|| (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 160), *(float32x4_t *)(a2 + 160)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 144), *(float32x4_t *)(a2 + 144))), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 176), *(float32x4_t *)(a2 + 176)),
                                   (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 192), *(float32x4_t *)(a2 + 192))))) & 0x80000000) == 0
    || (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 224), *(float32x4_t *)(a2 + 224)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 208), *(float32x4_t *)(a2 + 208))), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 240), *(float32x4_t *)(a2 + 240)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 256), *(float32x4_t *)(a2 + 256))))) & 0x80000000) == 0)
  {
    return 0;
  }
  result = CGRectEqualToRect(*(CGRect *)(a1 + 272), *(CGRect *)(a2 + 272));
  if (result)
  {
    if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 320), *(float32x4_t *)(a2 + 320)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 304), *(float32x4_t *)(a2 + 304))), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 336), *(float32x4_t *)(a2 + 336)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 352), *(float32x4_t *)(a2 + 352))))) & 0x80000000) != 0&& *(float *)(a1 + 368) == *(float *)(a2 + 368)&& *(float *)(a1 + 372) == *(float *)(a2 + 372))
    {
      v6 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 400), *(float32x4_t *)(a2 + 400)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 384), *(float32x4_t *)(a2 + 384))), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 416), *(float32x4_t *)(a2 + 416)));
      v6.i32[3] = v6.i32[2];
      if ((vminvq_u32(v6) & 0x80000000) != 0)
      {
        v7 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 448), *(float32x4_t *)(a2 + 448)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 432), *(float32x4_t *)(a2 + 432))), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + 464), *(float32x4_t *)(a2 + 464)));
        v7.i32[3] = v7.i32[2];
        return vminvq_u32(v7) >> 31;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_221622ADC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v4;
  double v5;
  _QWORD *v6;
  unint64_t v7;
  char v8;
  const void *v9;
  uint64_t result;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  _BYTE v43[496];
  __int128 __dst;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[496];

  swift_beginAccess();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2556DD830);
  swift_endAccess();
  if (qword_2556D8EE0 != -1)
    swift_once();
  objc_msgSend(a1, sel_timestamp);
  v5 = v4;
  swift_beginAccess();
  v6 = off_2556DD838;
  if (*((_QWORD *)off_2556DD838 + 2) && (v7 = sub_2215CA488(v5), (v8 & 1) != 0))
  {
    v9 = (const void *)(v6[7] + 496 * v7);
    memcpy(v43, v9, sizeof(v43));
    memmove(&__dst, v9, 0x1F0uLL);
    nullsub_1(&__dst);
    sub_2215D2034((uint64_t)v43);
  }
  else
  {
    sub_2215E731C(&__dst);
  }
  sub_221623394((uint64_t)&__dst, (uint64_t)v77);
  swift_endAccess();
  swift_beginAccess();
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2556DD830);
  swift_endAccess();
  sub_221623394((uint64_t)v77, (uint64_t)&__dst);
  result = sub_2215E7364((uint64_t *)&__dst);
  if ((_DWORD)result == 1)
  {
    v12 = *MEMORY[0x24BDAEE00];
    v13 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 16);
    v14 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 32);
    v15 = *(_OWORD *)(MEMORY[0x24BDAEE00] + 48);
    v16 = MEMORY[0x24BDAEDF8];
    v17 = *MEMORY[0x24BDAEDF8];
    v18 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
    v19 = *MEMORY[0x24BDAEE00];
    v20 = v13;
    v21 = v14;
    v22 = v15;
    v23 = *MEMORY[0x24BDAEE00];
    v24 = v13;
    v25 = v14;
    v26 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 32);
    v27 = v15;
    v28 = *MEMORY[0x24BDAEE00];
    v29 = v13;
    v30 = v14;
    v31 = 0uLL;
    v32 = 0;
    v33 = v15;
    v34 = *MEMORY[0x24BDAEE00];
    v35 = v13;
    v36 = v14;
    v37 = v15;
    v38 = *MEMORY[0x24BDAEDF8];
    v39 = v18;
    v40 = v26;
    v41 = 0;
    v42 = 0uLL;
  }
  else
  {
    result = sub_2215E737C((uint64_t)v77);
    v32 = v45;
    v16 = v46;
    v12 = v47;
    v13 = v48;
    v14 = v49;
    v15 = v50;
    v19 = v51;
    v20 = v52;
    v21 = v53;
    v22 = v54;
    v23 = v55;
    v24 = v56;
    v25 = v57;
    v27 = v58;
    v28 = v59;
    v29 = v60;
    v30 = v61;
    v33 = v62;
    v31 = v63;
    v42 = v64;
    v34 = v65;
    v35 = v66;
    v36 = v67;
    v37 = v68;
    v41 = v69;
    v11 = v70;
    v17 = v71;
    v18 = v72;
    v26 = v73;
    v38 = v74;
    v39 = v75;
    v40 = v76;
  }
  *(_QWORD *)a2 = v32;
  *(_QWORD *)(a2 + 8) = v16;
  *(_OWORD *)(a2 + 16) = v12;
  *(_OWORD *)(a2 + 32) = v13;
  *(_OWORD *)(a2 + 48) = v14;
  *(_OWORD *)(a2 + 64) = v15;
  *(_OWORD *)(a2 + 80) = v19;
  *(_OWORD *)(a2 + 96) = v20;
  *(_OWORD *)(a2 + 112) = v21;
  *(_OWORD *)(a2 + 128) = v22;
  *(_OWORD *)(a2 + 144) = v23;
  *(_OWORD *)(a2 + 160) = v24;
  *(_OWORD *)(a2 + 176) = v25;
  *(_OWORD *)(a2 + 192) = v27;
  *(_OWORD *)(a2 + 208) = v28;
  *(_OWORD *)(a2 + 224) = v29;
  *(_OWORD *)(a2 + 240) = v30;
  *(_OWORD *)(a2 + 256) = v33;
  *(_OWORD *)(a2 + 272) = v31;
  *(_OWORD *)(a2 + 288) = v42;
  *(_OWORD *)(a2 + 304) = v34;
  *(_OWORD *)(a2 + 320) = v35;
  *(_OWORD *)(a2 + 336) = v36;
  *(_OWORD *)(a2 + 352) = v37;
  *(_QWORD *)(a2 + 368) = v41;
  *(_QWORD *)(a2 + 376) = v11;
  *(_OWORD *)(a2 + 384) = v17;
  *(_OWORD *)(a2 + 400) = v18;
  *(_OWORD *)(a2 + 416) = v26;
  *(_OWORD *)(a2 + 432) = v38;
  *(_OWORD *)(a2 + 448) = v39;
  *(_OWORD *)(a2 + 464) = v40;
  return result;
}

void sub_221622D7C(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  double v7;
  float v8;
  double v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  float v18;
  float v19;
  simd_float3 v20;
  simd_float3 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  simd_float4 v26;
  simd_float4 v27;
  float32x4_t v28;
  simd_float4 v29;
  float32x4_t v30;
  simd_float4 v31;
  simd_float4 v32;
  float32x4_t v33;
  simd_float4 v34;
  simd_float4 v35;
  simd_float4 v36;
  simd_float4 v37;
  simd_float4 v38;
  simd_float4 v39;
  simd_float4 v40;
  float32x4_t v41;
  simd_float3 v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  simd_float3x3 v48;
  simd_float3x3 v49;
  simd_float4x4 v50;
  simd_float4x4 v51;
  simd_float4x4 v52;

  v7 = *(float *)&a4;
  v8 = *((float *)&a4 + 1);
  v9 = *((float *)&a4 + 1);
  objc_msgSend(a1, sel_projectionMatrixForOrientation_viewportSize_zNear_zFar_, a2, *(float *)&a4, *((float *)&a4 + 1), 0.00100000005, 1000.0);
  v28 = v10;
  v41 = v11;
  v30 = v12;
  v33 = v13;
  objc_msgSend(a1, sel_viewMatrixForOrientation_, a2);
  v45 = (float32x4_t)v50.columns[1];
  v46 = (float32x4_t)v50.columns[0];
  v43 = (float32x4_t)v50.columns[3];
  v44 = (float32x4_t)v50.columns[2];
  v51 = __invert_f4(v50);
  v39 = v51.columns[1];
  v40 = v51.columns[0];
  v38 = v51.columns[2];
  v37 = v51.columns[3];
  v51.columns[0] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v28, v46.f32[0]), v41, *(float32x2_t *)v46.f32, 1), v30, v46, 2), v33, v46, 3);
  v36 = v51.columns[0];
  v51.columns[1] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v28, v45.f32[0]), v41, *(float32x2_t *)v45.f32, 1), v30, v45, 2), v33, v45, 3);
  v35 = v51.columns[1];
  v51.columns[2] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v28, v44.f32[0]), v41, *(float32x2_t *)v44.f32, 1), v30, v44, 2), v33, v44, 3);
  v32 = v51.columns[2];
  v51.columns[3] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v28, v43.f32[0]), v41, *(float32x2_t *)v43.f32, 1), v30, v43, 2), v33, v43, 3);
  v34 = v51.columns[3];
  v52 = __invert_f4(v51);
  v29 = v52.columns[1];
  v31 = v52.columns[0];
  v26 = v52.columns[3];
  v27 = v52.columns[2];
  objc_msgSend(a1, sel_transform);
  v24 = v15;
  v25 = v14;
  v22 = v17;
  v23 = v16;
  v18 = atanf(1.0 / v41.f32[1]);
  v19 = (float)(v18 + v18) * 57.296;
  objc_msgSend(a1, sel_intrinsics);
  v42 = v48.columns[0];
  v20 = v48.columns[2];
  v21 = v48.columns[1];
  v49 = __invert_f3(v48);
  *(double *)a3 = a4;
  *(float32x4_t *)(a3 + 16) = v46;
  *(float32x4_t *)(a3 + 32) = v45;
  *(float32x4_t *)(a3 + 48) = v44;
  *(float32x4_t *)(a3 + 64) = v43;
  *(simd_float4 *)(a3 + 80) = v40;
  *(simd_float4 *)(a3 + 96) = v39;
  *(simd_float4 *)(a3 + 112) = v38;
  *(simd_float4 *)(a3 + 128) = v37;
  *(simd_float4 *)(a3 + 144) = v36;
  *(simd_float4 *)(a3 + 160) = v35;
  *(simd_float4 *)(a3 + 176) = v32;
  *(simd_float4 *)(a3 + 192) = v34;
  *(simd_float4 *)(a3 + 208) = v31;
  *(simd_float4 *)(a3 + 224) = v29;
  *(simd_float4 *)(a3 + 240) = v27;
  *(simd_float4 *)(a3 + 256) = v26;
  *(_QWORD *)(a3 + 272) = 0;
  *(_QWORD *)(a3 + 280) = 0;
  *(double *)(a3 + 288) = v7;
  *(double *)(a3 + 296) = v9;
  *(_OWORD *)(a3 + 304) = v25;
  *(_OWORD *)(a3 + 320) = v24;
  *(_OWORD *)(a3 + 336) = v23;
  *(_OWORD *)(a3 + 352) = v22;
  *(float *)(a3 + 368) = (float)(v8 / *(float *)&a4) * v19;
  *(float *)(a3 + 372) = v19;
  *(simd_float3 *)(a3 + 384) = v42;
  *(simd_float3 *)(a3 + 400) = v21;
  *(simd_float3 *)(a3 + 416) = v20;
  *(simd_float3x3 *)(a3 + 432) = v49;
}

uint64_t _s17MeasureFoundation24ComputedCameraPropertiesV12updateShared_12viewportSizeySo7ARFrameC_s5SIMD2VySfGtFZ_0(void *a1, double a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  void *v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;

  v4 = objc_msgSend(a1, sel_camera);
  sub_221622D7C(v4, 1, (uint64_t)&v80, a2);
  v5 = v80;
  v45 = v82;
  v46 = v81;
  v43 = v84;
  v44 = v83;
  v41 = v86;
  v42 = v85;
  v39 = v88;
  v40 = v87;
  v37 = v90;
  v38 = v89;
  v35 = v92;
  v36 = v91;
  v33 = v94;
  v34 = v93;
  v31 = v96;
  v32 = v95;
  v6 = v97;
  v7 = v98;
  v8 = v99;
  v9 = v100;
  v29 = v102;
  v30 = v101;
  v27 = v104;
  v28 = v103;
  v10 = v105;
  v25 = v107;
  v26 = v106;
  v23 = v109;
  v24 = v108;
  v21 = v111;
  v22 = v110;

  swift_beginAccess();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2556DD830);
  swift_endAccess();
  if (qword_2556D8EE0 != -1)
    swift_once();
  swift_beginAccess();
  v11 = swift_bridgeObjectRetain();
  v12 = (void *)sub_22162225C(v11);
  swift_bridgeObjectRelease();
  off_2556DD838 = v12;
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_timestamp);
  v14 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DD848);
  v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  v16 = a1;
  v17 = sub_2216536FC();

  *(_QWORD *)(v15 + 24) = v17;
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v79 = off_2556DD838;
  off_2556DD838 = (_UNKNOWN *)0x8000000000000000;
  v47[0] = v15;
  v47[2] = v5;
  v48 = v46;
  v49 = v45;
  v50 = v44;
  v51 = v43;
  v52 = v42;
  v53 = v41;
  v54 = v40;
  v55 = v39;
  v56 = v38;
  v57 = v37;
  v58 = v36;
  v59 = v35;
  v60 = v34;
  v61 = v33;
  v62 = v32;
  v63 = v31;
  v64 = v6;
  v65 = v7;
  v66 = v8;
  v67 = v9;
  v68 = v30;
  v69 = v29;
  v70 = v28;
  v71 = v27;
  v72 = v10;
  v73 = v26;
  v74 = v25;
  v75 = v24;
  v76 = v23;
  v77 = v22;
  v78 = v21;
  sub_22161C994((uint64_t)v47, isUniquelyReferenced_nonNull_native, v14);
  off_2556DD838 = v79;
  swift_bridgeObjectRelease();
  swift_endAccess();
  if (qword_2556D8EE8 != -1)
    swift_once();
  objc_msgSend(v16, sel_timestamp, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37,
    v38,
    v39,
    v40,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46);
  qword_2556DD840 = v19;
  swift_beginAccess();
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2556DD830);
  return swift_endAccess();
}

uint64_t sub_221623394(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2556DAEA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *__swift_memcpy480_16(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x1E0uLL);
}

uint64_t getEnumTagSinglePayload for ComputedCameraProperties(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 480))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ComputedCameraProperties(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 472) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 480) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ComputedCameraProperties()
{
  return &type metadata for ComputedCameraProperties;
}

double SKNode.worldRotation.getter()
{
  void *v0;
  double v1;
  double v2;
  id v3;
  void *v4;
  double v5;
  id v6;

  objc_msgSend(v0, sel_zRotation);
  v2 = v1;
  v3 = objc_msgSend(v0, sel_parent);
  if (v3)
  {
    v4 = v3;
    do
    {
      objc_msgSend(v4, sel_zRotation);
      v2 = v2 + v5;
      v6 = objc_msgSend(v4, sel_parent);

      v4 = v6;
    }
    while (v6);
  }
  return v2;
}

uint64_t Lerpable.lerped<A>(newValue:t:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v23 = a4;
  v24 = a6;
  v22 = a2;
  v12 = sub_221653714();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v21 - v15;
  v17 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v21 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, a1, v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v16, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(a7, v7, a3);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v16, a3);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 8))(v19, v22, v23, v24, a3, a5);
    return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, a3);
  }
}

uint64_t Optional<A>.lerped<A>(newValue:t:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v20 = a2;
  v22 = a1;
  v23 = a4;
  v19 = a6;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v10 = *(_QWORD *)(a3 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v18 - v14;
  swift_getAssociatedConformanceWitness();
  sub_221653B34();
  sub_221653AE0();
  sub_2216539A8();
  v16 = *(void (**)(char *, uint64_t))(v10 + 8);
  v16(v13, a3);
  Lerpable.lerped<A>(newValue:t:)(v21, (uint64_t)v15, *(_QWORD *)(v20 + 16), a3, v23, a5, v19);
  return ((uint64_t (*)(char *, uint64_t))v16)(v15, a3);
}

uint64_t Optional<A>.lerped<A>(newValue:t:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  void (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(char *, uint64_t, uint64_t);
  int v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  int v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t);
  uint64_t v52;
  void (*v53)(uint64_t, uint64_t);
  uint64_t v54;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  char *v62;
  char *v63;
  _QWORD v64[2];
  uint64_t AssociatedTypeWitness;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  char *v81;

  v8 = v7;
  v71 = a5;
  v72 = a6;
  v79 = (char *)a7;
  v80 = a2;
  v74 = a1;
  v68 = *(_QWORD *)(a6 + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v64[1] = (char *)v64 - v12;
  v76 = *(char **)(a4 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v66 = (char *)v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v67 = (char *)v64 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v81 = (char *)v64 - v18;
  v19 = *(_QWORD *)(a3 - 8);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v70 = (char *)v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v64 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v78 = (char *)v64 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)v64 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)v64 - v30;
  v32 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  v75 = v8;
  v32(v29, v8, a3);
  v33 = *(_QWORD *)(a3 + 16);
  v34 = *(_QWORD *)(v33 - 8);
  v35 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 48);
  v36 = v35(v29, 1, v33);
  v69 = v34;
  v77 = v19;
  if (v36 == 1)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v29, a3);
    v73 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56);
    v73(v31, 1, 1, v33);
    v37 = v78;
    v38 = v31;
    v39 = a4;
    v41 = v75;
    v40 = v76;
    v42 = v74;
  }
  else
  {
    v64[0] = v35;
    v43 = v74;
    Lerpable.lerped<A>(newValue:t:)(v74, v80, v33, a4, v71, v72, (uint64_t)v31);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v29, v33);
    v73 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56);
    v73(v31, 0, 1, v33);
    v37 = v78;
    v38 = v31;
    v39 = a4;
    v41 = v75;
    v40 = v76;
    v42 = v43;
    v35 = (uint64_t (*)(char *, uint64_t, uint64_t))v64[0];
  }
  v32(v37, v42, a3);
  v32(v24, v41, a3);
  v44 = (uint64_t)v24;
  v45 = v81;
  (*((void (**)(char *, uint64_t, uint64_t))v40 + 2))(v81, v80, v39);
  if (v35(v38, 1, v33) == 1)
  {
    v76 = v38;
    v80 = v44;
    v46 = v70;
    v32(v70, (uint64_t)v37, a3);
    v47 = v35(v46, 1, v33);
    v48 = v40;
    v49 = v39;
    v50 = v77;
    if (v47 == 1)
    {
      (*((void (**)(char *, uint64_t))v48 + 1))(v81, v49);
      v51 = *(void (**)(uint64_t, uint64_t))(v50 + 8);
      v51(v80, a3);
      v51((uint64_t)v37, a3);
      v51((uint64_t)v46, a3);
      v52 = 1;
    }
    else
    {
      swift_getAssociatedConformanceWitness();
      sub_221653B34();
      v56 = v66;
      sub_221653AE0();
      v57 = v72;
      v58 = (uint64_t)v67;
      v59 = v81;
      sub_2216539A8();
      v60 = (void (*)(char *, uint64_t))*((_QWORD *)v48 + 1);
      v60(v56, v49);
      v61 = v80;
      v62 = v70;
      Lerpable.lerped<A>(newValue:t:)(v80, v58, v33, v49, v71, v57, (uint64_t)v79);
      v60((char *)v58, v49);
      v60(v59, v49);
      v51 = *(void (**)(uint64_t, uint64_t))(v77 + 8);
      v51(v61, a3);
      v51((uint64_t)v78, a3);
      (*(void (**)(char *, uint64_t))(v69 + 8))(v62, v33);
      v52 = 0;
    }
    v63 = v76;
    v73(v79, v52, 1, v33);
    return ((uint64_t (*)(char *, uint64_t))v51)(v63, a3);
  }
  else
  {
    (*((void (**)(char *, uint64_t))v40 + 1))(v45, v39);
    v53 = *(void (**)(uint64_t, uint64_t))(v77 + 8);
    v53(v44, a3);
    v53((uint64_t)v37, a3);
    v54 = (uint64_t)v79;
    (*(void (**)(char *, char *, uint64_t))(v69 + 32))(v79, v38, v33);
    return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v73)(v54, 0, 1, v33);
  }
}

uint64_t sub_221623D5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  return Optional<A>.lerped<A>(newValue:t:)(a1, a2, a5, a3, *(_QWORD *)(a6 - 8), a4, a7);
}

float SmoothedValue.init<A>(value:alpha:)@<S0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, float *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float result;
  uint64_t v19;
  float v20;

  v10 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for SmoothedValue(0, v13, v15, v14);
  v17 = *(_QWORD *)(a3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))((char *)a5 + *(int *)(v16 + 36), a1, a3);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a2, a4);
  sub_2215C1F0C();
  sub_221653090();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a2, a4);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a1, a3);
  result = v20;
  *a5 = v20;
  return result;
}

uint64_t type metadata accessor for SmoothedValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SmoothedValue);
}

uint64_t sub_221623E98(uint64_t a1, uint64_t a2)
{
  int *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(uint64_t, int *, _QWORD, unint64_t, uint64_t, uint64_t);
  unint64_t v12;
  uint64_t v14;
  int v15;

  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (char *)v2 + *(int *)(v8 + 36);
  v15 = *v2;
  v10 = *(_QWORD *)(v8 + 24);
  v11 = *(void (**)(uint64_t, int *, _QWORD, unint64_t, uint64_t, uint64_t))(v10 + 8);
  v12 = sub_2215C1F0C();
  v11(a1, &v15, MEMORY[0x24BEE14E8], v12, v4, v10);
  return (*(uint64_t (**)(char *, char *, uint64_t))(v5 + 40))(v9, v7, v4);
}

uint64_t OptionalSmoothedValue.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v5 = sub_221653714();
  v14 = *(_QWORD *)(a1 + 24);
  v6 = MEMORY[0x22766FA4C](&protocol conformance descriptor for <A> A?, v5, &v14);
  v8 = type metadata accessor for SmoothedValue(0, v5, v6, v7);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v13 - v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v13 - v9, v2 + *(int *)(a1 + 36), v8);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, &v10[*(int *)(v8 + 36)], v5);
}

uint64_t OptionalSmoothedValue.init<A>(value:alpha:timeout:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v41 = a7;
  v42 = a3;
  v40 = a2;
  v13 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v39 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_221653714();
  v35 = *(_QWORD *)(v15 - 8);
  v16 = v35;
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v34 - v17;
  v43 = a6;
  v36 = MEMORY[0x22766FA4C](&protocol conformance descriptor for <A> A?, v15, &v43);
  v20 = type metadata accessor for SmoothedValue(0, v15, v36, v19);
  v37 = *(_QWORD *)(v20 - 8);
  v38 = v20;
  MEMORY[0x24BDAC7A8](v20);
  v22 = (float *)((char *)&v34 - v21);
  v24 = type metadata accessor for OptionalSmoothedValue(0, a4, a6, v23);
  v25 = a8;
  *(_QWORD *)&a8[*(int *)(v24 + 40)] = 0;
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v27 = a1;
  v26(v18, a1, v15);
  v28 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v29 = v13;
  v30 = (uint64_t)v39;
  v31 = v40;
  v28(v39, v40, a5);
  v32 = SmoothedValue.init<A>(value:alpha:)((uint64_t)v18, v30, v15, a5, v22);
  (*(void (**)(uint64_t, uint64_t, float))(v29 + 8))(v31, a5, v32);
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v27, v15);
  result = (*(uint64_t (**)(char *, float *, uint64_t))(v37 + 32))(&v25[*(int *)(v24 + 36)], v22, v38);
  *(_QWORD *)v25 = v42;
  return result;
}

uint64_t type metadata accessor for OptionalSmoothedValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for OptionalSmoothedValue);
}

uint64_t sub_22162421C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t (*v21)(char *, uint64_t);
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v30 = a1;
  v4 = *(_QWORD *)(a2 + 16);
  v5 = sub_221653714();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v29 - v11;
  v13 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v10);
  v16 = (char *)&v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(int *)(a2 + 40);
  v18 = *(_QWORD *)((char *)v2 + v17);
  v19 = __OFADD__(v18, 1);
  v20 = v18 + 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)((char *)v2 + v17) = v20;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v12, v30, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, v4) == 1)
    {
      v21 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
      result = v21(v12, v5);
      if (*(_QWORD *)((char *)v2 + *(int *)(a2 + 40)) >= *v2)
      {
        v22 = (char *)v2 + *(int *)(a2 + 36);
        v32 = *(_QWORD *)(a2 + 24);
        v23 = MEMORY[0x22766FA4C](&protocol conformance descriptor for <A> A?, v5, &v32);
        v25 = &v22[*(int *)(type metadata accessor for SmoothedValue(0, v5, v23, v24) + 36)];
        v21(v25, v5);
        return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v25, 1, 1, v4);
      }
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v16, v12, v4);
      *(_QWORD *)((char *)v2 + v17) = 0;
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v9, v16, v4);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v4);
      v31 = *(_QWORD *)(a2 + 24);
      v26 = MEMORY[0x22766FA4C](&protocol conformance descriptor for <A> A?, v5, &v31);
      v28 = type metadata accessor for SmoothedValue(0, v5, v26, v27);
      sub_221623E98((uint64_t)v9, v28);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v16, v4);
    }
  }
  return result;
}

Swift::Bool __swiftcall OptionalSmoothedValue.hasTimedOut()()
{
  uint64_t v0;
  _QWORD *v1;

  return *(_QWORD *)((char *)v1 + *(int *)(v0 + 40)) >= *v1;
}

uint64_t OptionalSmoothedValue.updated(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, v3, a2);
  return sub_22162421C(a1, a2);
}

uint64_t static OptionalSmoothedValue.makeNonSmoothedValue(value:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_221653714();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14 - v9;
  (*(void (**)(char *, uint64_t))(v11 + 16))((char *)&v14 - v9, a1);
  v15 = 0x3FF0000000000000;
  v12 = sub_221624584();
  return OptionalSmoothedValue.init<A>(value:alpha:timeout:)((uint64_t)v10, (uint64_t)&v15, 0, a2, MEMORY[0x24BEE13C8], a3, v12, a4);
}

unint64_t sub_221624584()
{
  unint64_t result;

  result = qword_2556DD850[0];
  if (!qword_2556DD850[0])
  {
    result = MEMORY[0x22766FA4C](MEMORY[0x24BEE13D0], MEMORY[0x24BEE13C8]);
    atomic_store(result, qword_2556DD850);
  }
  return result;
}

uint64_t sub_2216245C8()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_221624644(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if ((v5 | 3uLL) > 7
    || (*(_DWORD *)(v4 + 80) & 0x100000) != 0
    || ((v5 + 4) & (unint64_t)~v5) + *(_QWORD *)(v4 + 64) > 0x18)
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~(v5 | 3)));
    swift_retain();
  }
  else
  {
    *(_DWORD *)a1 = *(_DWORD *)a2;
    (*(void (**)(unint64_t, unint64_t))(v4 + 16))(((unint64_t)a1 + v5 + 4) & ~v5, ((unint64_t)a2 + v5 + 4) & ~v5);
  }
  return v3;
}

uint64_t sub_2216246E4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

_DWORD *sub_221624704(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 16))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_DWORD *sub_221624754(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_DWORD *sub_2216247A4(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_DWORD *sub_2216247F4(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v4;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 4) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

uint64_t sub_221624844(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  char v9;
  int v10;
  unsigned int v11;
  int v12;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v8 = ((v6 + 4) & ~v6) + *(_QWORD *)(v4 + 64);
  v9 = 8 * v8;
  if (v8 <= 3)
  {
    v11 = ((v7 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      v10 = *(_DWORD *)(a1 + v8);
      if (!v10)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v11 > 0xFF)
    {
      v10 = *(unsigned __int16 *)(a1 + v8);
      if (!*(_WORD *)(a1 + v8))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v11 < 2)
    {
LABEL_18:
      if (v5)
        return (*(uint64_t (**)(uint64_t))(v4 + 48))((a1 + v6 + 4) & ~v6);
      return 0;
    }
  }
  v10 = *(unsigned __int8 *)(a1 + v8);
  if (!*(_BYTE *)(a1 + v8))
    goto LABEL_18;
LABEL_11:
  v12 = (v10 - 1) << v9;
  if (v8 > 3)
    v12 = 0;
  if (!(_DWORD)v8)
    return v5 + v12 + 1;
  if (v8 > 3)
    LODWORD(v8) = 4;
  return ((uint64_t (*)(void))((char *)&loc_221624904 + 4 * byte_221659130[(v8 - 1)]))();
}

void sub_221624964(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  size_t v9;
  BOOL v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(unsigned __int8 *)(v6 + 80);
  v9 = ((v8 + 4) & ~v8) + *(_QWORD *)(v6 + 64);
  v10 = a3 >= v7;
  v11 = a3 - v7;
  if (v11 != 0 && v10)
  {
    if (v9 <= 3)
    {
      v14 = ((v11 + ~(-1 << (8 * v9))) >> (8 * v9)) + 1;
      if (HIWORD(v14))
      {
        v12 = 4u;
      }
      else if (v14 >= 0x100)
      {
        v12 = 2;
      }
      else
      {
        v12 = v14 > 1;
      }
    }
    else
    {
      v12 = 1u;
    }
  }
  else
  {
    v12 = 0;
  }
  if (v7 < a2)
  {
    v13 = ~v7 + a2;
    if (v9 < 4)
    {
      if ((_DWORD)v9)
      {
        v15 = v13 & ~(-1 << (8 * v9));
        bzero(a1, v9);
        if ((_DWORD)v9 == 3)
        {
          *a1 = v15;
          *((_BYTE *)a1 + 2) = BYTE2(v15);
        }
        else if ((_DWORD)v9 == 2)
        {
          *a1 = v15;
        }
        else
        {
          *(_BYTE *)a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, ((v8 + 4) & ~v8) + *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v13;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t sub_221624B30(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  unint64_t v7;
  _QWORD v8[4];

  v2 = MEMORY[0x24BEE0178] + 64;
  v8[1] = MEMORY[0x24BEE0178] + 64;
  v3 = sub_221653714();
  v8[0] = *(_QWORD *)(a1 + 24);
  v4 = MEMORY[0x22766FA4C](&protocol conformance descriptor for <A> A?, v3, v8);
  result = type metadata accessor for SmoothedValue(319, v3, v4, v5);
  if (v7 <= 0x3F)
  {
    v8[2] = *(_QWORD *)(result - 8) + 64;
    v8[3] = v2;
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_221624BE4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  unint64_t v11;
  int v12;
  uint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  _DWORD *v18;
  void *v19;
  const void *v20;

  v3 = a1;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = v6;
  v8 = v6 | 3;
  v9 = v6 + 4;
  if (*(_DWORD *)(v5 + 84))
    v10 = *(_QWORD *)(v5 + 64);
  else
    v10 = *(_QWORD *)(v5 + 64) + 1;
  v11 = ((v6 + 4) & ~(unint64_t)v6) + v10 + 7;
  v12 = v6 & 0x100000;
  if (v7 > 7 || v12 != 0 || ((v11 + ((v7 + 8) & ~(v7 | 3))) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v15 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v15 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16)));
    swift_retain();
  }
  else
  {
    v16 = ~v7;
    *a1 = *a2;
    v17 = (_DWORD *)(((unint64_t)a1 + v8 + 8) & ~v8);
    v18 = (_DWORD *)(((unint64_t)a2 + v8 + 8) & ~v8);
    *v17 = *v18;
    v19 = (void *)(((unint64_t)v17 + v9) & v16);
    v20 = (const void *)(((unint64_t)v18 + v9) & v16);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v20, 1, v4))
    {
      memcpy(v19, v20, v10);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v19, v20, v4);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v19, 0, 1, v4);
    }
    *(_QWORD *)(((unint64_t)v17 + v11) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v18 + v11) & 0xFFFFFFFFFFFFF8);
  }
  return v3;
}

uint64_t sub_221624D50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;

  v2 = *(_QWORD *)(a2 + 16);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80)
      + ((a1 + (*(unsigned __int8 *)(v3 + 80) | 3) + 8) & ~(*(unsigned __int8 *)(v3 + 80) | 3))
      + 4) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(unint64_t, uint64_t))(v3 + 8))(v4, v2);
  return result;
}

_QWORD *sub_221624DCC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  int v14;
  size_t v15;
  size_t v16;
  size_t v17;

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (v6 | 3) + 8;
  v8 = (_DWORD *)(((unint64_t)a1 + v7) & ~(v6 | 3));
  v9 = (_DWORD *)(((unint64_t)a2 + v7) & ~(v6 | 3));
  *v8 = *v9;
  v10 = v6 + 4;
  v11 = ~v6;
  v12 = (void *)(((unint64_t)v8 + v6 + 4) & ~v6);
  v13 = (const void *)(((unint64_t)v9 + v6 + 4) & ~v6);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4))
  {
    v14 = *(_DWORD *)(v5 + 84);
    v15 = *(_QWORD *)(v5 + 64);
    if (v14)
      v16 = v15;
    else
      v16 = v15 + 1;
    memcpy(v12, v13, v16);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v12, v13, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v12, 0, 1, v4);
    v14 = *(_DWORD *)(v5 + 84);
    v15 = *(_QWORD *)(v5 + 64);
  }
  v17 = v15 + (v10 & v11);
  if (!v14)
    ++v17;
  *(_QWORD *)(((unint64_t)v8 + v17 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v9 + v17 + 7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_221624EF4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  _DWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  int v15;
  size_t v16;
  uint64_t v17;
  uint64_t v19;

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (v6 | 3) + 8;
  v8 = (_DWORD *)(((unint64_t)a1 + v7) & ~(v6 | 3));
  v9 = (_DWORD *)(((unint64_t)a2 + v7) & ~(v6 | 3));
  *v8 = *v9;
  v10 = v6 + 4;
  v19 = ~v6;
  v11 = (void *)(((unint64_t)v8 + v6 + 4) & ~v6);
  v12 = (void *)(((unint64_t)v9 + v6 + 4) & ~v6);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v14 = v13(v11, 1, v4);
  v15 = v13(v12, 1, v4);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 16))(v11, v12, v4);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v11, 0, 1, v4);
      goto LABEL_10;
    }
LABEL_6:
    if (*(_DWORD *)(v5 + 84))
      v16 = *(_QWORD *)(v5 + 64);
    else
      v16 = *(_QWORD *)(v5 + 64) + 1;
    memcpy(v11, v12, v16);
    goto LABEL_10;
  }
  if (v15)
  {
    (*(void (**)(void *, uint64_t))(v5 + 8))(v11, v4);
    goto LABEL_6;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 24))(v11, v12, v4);
LABEL_10:
  v17 = *(_QWORD *)(v5 + 64) + (v10 & v19);
  if (!*(_DWORD *)(v5 + 84))
    ++v17;
  *(_QWORD *)(((unint64_t)v8 + v17 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v9 + v17 + 7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_221625070(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  int v14;
  size_t v15;
  size_t v16;
  size_t v17;

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (v6 | 3) + 8;
  v8 = (_DWORD *)(((unint64_t)a1 + v7) & ~(v6 | 3));
  v9 = (_DWORD *)(((unint64_t)a2 + v7) & ~(v6 | 3));
  *v8 = *v9;
  v10 = v6 + 4;
  v11 = ~v6;
  v12 = (void *)(((unint64_t)v8 + v6 + 4) & ~v6);
  v13 = (const void *)(((unint64_t)v9 + v6 + 4) & ~v6);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4))
  {
    v14 = *(_DWORD *)(v5 + 84);
    v15 = *(_QWORD *)(v5 + 64);
    if (v14)
      v16 = v15;
    else
      v16 = v15 + 1;
    memcpy(v12, v13, v16);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(v12, v13, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v12, 0, 1, v4);
    v14 = *(_DWORD *)(v5 + 84);
    v15 = *(_QWORD *)(v5 + 64);
  }
  v17 = v15 + (v10 & v11);
  if (!v14)
    ++v17;
  *(_QWORD *)(((unint64_t)v8 + v17 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v9 + v17 + 7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_221625198(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  _DWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  int v15;
  size_t v16;
  uint64_t v17;
  uint64_t v19;

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (v6 | 3) + 8;
  v8 = (_DWORD *)(((unint64_t)a1 + v7) & ~(v6 | 3));
  v9 = (_DWORD *)(((unint64_t)a2 + v7) & ~(v6 | 3));
  *v8 = *v9;
  v10 = v6 + 4;
  v19 = ~v6;
  v11 = (void *)(((unint64_t)v8 + v6 + 4) & ~v6);
  v12 = (void *)(((unint64_t)v9 + v6 + 4) & ~v6);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v14 = v13(v11, 1, v4);
  v15 = v13(v12, 1, v4);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 32))(v11, v12, v4);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v11, 0, 1, v4);
      goto LABEL_10;
    }
LABEL_6:
    if (*(_DWORD *)(v5 + 84))
      v16 = *(_QWORD *)(v5 + 64);
    else
      v16 = *(_QWORD *)(v5 + 64) + 1;
    memcpy(v11, v12, v16);
    goto LABEL_10;
  }
  if (v15)
  {
    (*(void (**)(void *, uint64_t))(v5 + 8))(v11, v4);
    goto LABEL_6;
  }
  (*(void (**)(void *, void *, uint64_t))(v5 + 40))(v11, v12, v4);
LABEL_10:
  v17 = *(_QWORD *)(v5 + 64) + (v10 & v19);
  if (!*(_DWORD *)(v5 + 84))
    ++v17;
  *(_QWORD *)(((unint64_t)v8 + v17 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v9 + v17 + 7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_221625314(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v15;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = v5 - 1;
  if (v5)
  {
    v7 = 7;
  }
  else
  {
    v6 = 0;
    v7 = 8;
  }
  if (!a2)
    return 0;
  v8 = *(unsigned __int8 *)(v4 + 80);
  v9 = v8 | 3;
  v10 = v8 + 4;
  if (v6 < a2)
  {
    if (((((v7 + *(_QWORD *)(v4 + 64) + (v10 & ~v8) + ((v8 + 8) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v11 = 2;
    else
      v11 = a2 - v6 + 1;
    if (v11 >= 0x10000)
      v12 = 4;
    else
      v12 = 2;
    if (v11 < 0x100)
      v12 = 1;
    if (v11 >= 2)
      v13 = v12;
    else
      v13 = 0;
    __asm { BR              X17 }
  }
  if (v5 < 2)
    return 0;
  v15 = (*(uint64_t (**)(uint64_t))(v4 + 48))((v10 + ((a1 + v9 + 8) & ~v9)) & ~v8);
  if (v15 >= 2)
    return v15 - 1;
  else
    return 0;
}

void sub_221625454(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;

  v6 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  v10 = *(unsigned __int8 *)(v7 + 80);
  v11 = 7;
  if (!v8)
    v11 = 8;
  if (v9 < a3)
  {
    v12 = a3 - v9;
    if ((((_DWORD)v11
         + *(_DWORD *)(v7 + 64)
         + (((_DWORD)v10 + 4) & ~(_DWORD)v10)
         + (((_DWORD)v10 + 8) & ~(v10 | 3))) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v13 = v12 + 1;
    else
      v13 = 2;
    if (v13 >= 0x10000)
      v14 = 4;
    else
      v14 = 2;
    if (v13 < 0x100)
      v14 = 1;
    if (v13 >= 2)
      v6 = v14;
    else
      v6 = 0;
  }
  if (a2 > v9)
  {
    if ((((_DWORD)v11
         + *(_DWORD *)(v7 + 64)
         + (((_DWORD)v10 + 4) & ~(_DWORD)v10)
         + (((_DWORD)v10 + 8) & ~(v10 | 3))) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      v15 = ~v9 + a2;
      bzero(a1, ((v11 + *(_QWORD *)(v7 + 64) + ((v10 + 4) & ~v10) + ((v10 + 8) & ~(v10 | 3))) & 0xFFFFFFFFFFFFFFF8) + 8);
      *a1 = v15;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X15 }
}

uint64_t sub_22162556C@<X0>(int a1@<W1>, unsigned int a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  *(_BYTE *)(v7 + v8) = 0;
  if (a1)
  {
    if (a2 >= 2)
      return (*(uint64_t (**)(uint64_t, _QWORD))(v3 + 56))((v5 + ((v7 + v4 + 8) & v6)) & a3, (a1 + 1));
  }
  return result;
}

void sub_2216255C8(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_WORD *)(v2 + v3) = 0;
  if (!a2)
    JUMPOUT(0x2216255D0);
  JUMPOUT(0x221625590);
}

void zip<A, B, C>(_:_:_:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t AssociatedConformanceWitness;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[17];
  uint64_t AssociatedTypeWitness;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v27[15] = a3;
  v27[16] = a9;
  v27[13] = a2;
  v27[11] = a1;
  v29 = a10;
  v27[14] = *(_QWORD *)(a6 - 8);
  v27[6] = a6;
  MEMORY[0x24BDAC7A8](a1);
  v27[12] = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v15 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v27[10] = (char *)v27 - v16;
  v27[9] = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v27[8] = (char *)v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27[2] = a8;
  v27[0] = a5;
  v18 = swift_getAssociatedTypeWitness();
  v19 = MEMORY[0x24BDAC7A8](v18);
  v27[7] = (char *)v27 - v20;
  v27[5] = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v27[1] = a7;
  v21 = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](v21);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v27[4] = AssociatedConformanceWitness;
  v23 = v18;
  v27[3] = v18;
  v24 = swift_getAssociatedConformanceWitness();
  v25 = AssociatedTypeWitness;
  v26 = swift_getAssociatedConformanceWitness();
  v30 = v21;
  v31 = v23;
  v32 = v25;
  v33 = AssociatedConformanceWitness;
  v34 = v24;
  v35 = v26;
  type metadata accessor for Zip3Generator();
}

void sub_221625850(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v4 - 248) + 16))(v1, *(_QWORD *)(v4 - 200), v3);
  sub_221653288();
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v4 - 216) + 16))(*(_QWORD *)(v4 - 224), *(_QWORD *)(v4 - 184), *(_QWORD *)(v4 - 288));
  sub_221653288();
  (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(v4 - 176) + 16))(*(_QWORD *)(v4 - 192), *(_QWORD *)(v4 - 168), v2);
  sub_221653288();
  Zip3Generator.init(_:_:_:)();
}

uint64_t sub_221625940()
{
  uint64_t v0;

  MEMORY[0x22766FA4C](&protocol conformance descriptor for Zip3Generator<A, B, C>, v0);
  return sub_22165396C();
}

void type metadata accessor for Zip3Generator()
{
  JUMPOUT(0x22766F9C8);
}

void Zip3Generator.init(_:_:_:)()
{
  type metadata accessor for Zip3Generator();
}

uint64_t sub_2216259E8(int *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v7 + a1[19]) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32))(v7, v6, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(v7 + a1[17], v5, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 32))(v7 + a1[18], v4, v1);
}

uint64_t Zip3Generator.next()@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, char *, uint64_t);
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t TupleTypeMetadata3;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;

  v58 = a2;
  v4 = a1[7];
  v47 = a1[4];
  v48 = v4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = sub_221653714();
  v41 = *(_QWORD *)(v6 - 8);
  v42 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v49 = (char *)&v41 - v8;
  v57 = AssociatedTypeWitness;
  v46 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = a1[3];
  v52 = (char *)a1[6];
  v50 = (char *)&v41 - v10;
  v51 = v9;
  v11 = swift_getAssociatedTypeWitness();
  v12 = sub_221653714();
  v43 = *(_QWORD *)(v12 - 8);
  v44 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v53 = (char *)&v41 - v14;
  v55 = *(_QWORD *)(v11 - 8);
  v56 = v11;
  MEMORY[0x24BDAC7A8](v13);
  v45 = (char *)&v41 - v15;
  v16 = swift_getAssociatedTypeWitness();
  v17 = sub_221653714();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v41 - v20;
  v22 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v41 - v23;
  v54 = v2;
  sub_221653720();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v21, 1, v16) == 1)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
  }
  else
  {
    v25 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
    v25(v24, v21, v16);
    v26 = v53;
    v27 = v22;
    sub_221653720();
    v28 = v56;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v55 + 48))(v26, 1, v56) == 1)
    {
      (*(void (**)(char *, uint64_t))(v27 + 8))(v24, v16);
      (*(void (**)(char *, uint64_t))(v43 + 8))(v26, v44);
    }
    else
    {
      v51 = v27;
      v52 = v24;
      v29 = v16;
      v30 = *(void (**)(char *, char *, uint64_t))(v55 + 32);
      v31 = v45;
      v30(v45, v26, v28);
      v32 = v49;
      sub_221653720();
      v33 = v46;
      v34 = v57;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v32, 1, v57) != 1)
      {
        v55 = *(_QWORD *)(v33 + 32);
        ((void (*)(char *, char *, uint64_t))v55)(v50, v32, v34);
        TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
        v38 = v58;
        v39 = &v58[*(int *)(TupleTypeMetadata3 + 48)];
        v40 = &v58[*(int *)(TupleTypeMetadata3 + 64)];
        v25(v58, v52, v29);
        v30(v39, v31, v28);
        ((void (*)(char *, char *, uint64_t))v55)(v40, v50, v34);
        return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(TupleTypeMetadata3 - 8) + 56))(v38, 0, 1, TupleTypeMetadata3);
      }
      (*(void (**)(char *, uint64_t))(v55 + 8))(v31, v28);
      (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v29);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v32, v42);
    }
  }
  v35 = swift_getTupleTypeMetadata3();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v58, 1, 1, v35);
}

uint64_t sub_221625E88()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_221625E90()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t *sub_221625F48(uint64_t *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;

  v3 = a1;
  v4 = *(_QWORD *)(a3[2] - 8);
  v5 = *(_QWORD *)(a3[3] - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = *(_QWORD *)(v4 + 64) + v6;
  v8 = *(_QWORD *)(a3[4] - 8);
  v9 = *(_DWORD *)(v8 + 80);
  v10 = *(_QWORD *)(v5 + 64) + v9;
  v11 = *(_QWORD *)(v8 + 64) + 7;
  v12 = v9 | *(_DWORD *)(v4 + 80) & 0xF8 | v6;
  if (v12 > 7
    || ((*(_DWORD *)(v8 + 80) | *(_DWORD *)(v5 + 80) | *(_DWORD *)(v4 + 80)) & 0x100000) != 0
    || ((v11 + ((v10 + (v7 & ~v6)) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v15 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v15 + (((v12 | 7) + 16) & ~(unint64_t)(v12 | 7)));
    swift_retain();
  }
  else
  {
    v16 = ~v6;
    v17 = ~v9;
    v23 = a3[3];
    v24 = a3[4];
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
    v19 = ((unint64_t)v3 + v7) & v16;
    v20 = ((unint64_t)a2 + v7) & v16;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16))(v19, v20, v23);
    v21 = (v20 + v10) & v17;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))((v19 + v10) & v17, v21, v24);
    *(_QWORD *)((v11 + ((v19 + v10) & v17)) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v11 + v21) & 0xFFFFFFFFFFFFF8);
  }
  return v3;
}

uint64_t sub_2216260B0(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *(_QWORD *)(a2[2] - 8);
  (*(void (**)(void))(v4 + 8))();
  v5 = *(_QWORD *)(v4 + 64) + a1;
  v6 = *(_QWORD *)(a2[3] - 8);
  v7 = (v5 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t))(v6 + 8))(v7);
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(a2[4] - 8) + 8))((v7
                                                                                       + *(_QWORD *)(v6 + 64)
                                                                                       + *(unsigned __int8 *)(*(_QWORD *)(a2[4] - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a2[4] - 8) + 80));
}

uint64_t sub_221626130(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 16))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v10, v11);
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(_QWORD *)(a3[4] - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v12 + v14;
  v16 = (v15 + v10) & ~v14;
  v17 = (v15 + v11) & ~v14;
  (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v16, v17);
  *(_QWORD *)((*(_QWORD *)(v13 + 64) + 7 + v16) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v13 + 64) + 7 + v17) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_221626200(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v10, v11);
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(_QWORD *)(a3[4] - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v12 + v14;
  v16 = (v15 + v10) & ~v14;
  v17 = (v15 + v11) & ~v14;
  (*(void (**)(uint64_t, uint64_t))(v13 + 24))(v16, v17);
  *(_QWORD *)((*(_QWORD *)(v13 + 64) + 7 + v16) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v13 + 64) + 7 + v17) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2216262D0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 32))(v10, v11);
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(_QWORD *)(a3[4] - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v12 + v14;
  v16 = (v15 + v10) & ~v14;
  v17 = (v15 + v11) & ~v14;
  (*(void (**)(uint64_t, uint64_t))(v13 + 32))(v16, v17);
  *(_QWORD *)((*(_QWORD *)(v13 + 64) + 7 + v16) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v13 + 64) + 7 + v17) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_2216263A0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = *(_QWORD *)(a3[2] - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(a3[3] - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = (v9 + a1) & ~v8;
  v11 = (v9 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v10, v11);
  v12 = *(_QWORD *)(v7 + 64);
  v13 = *(_QWORD *)(a3[4] - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v12 + v14;
  v16 = (v15 + v10) & ~v14;
  v17 = (v15 + v11) & ~v14;
  (*(void (**)(uint64_t, uint64_t))(v13 + 40))(v16, v17);
  *(_QWORD *)((*(_QWORD *)(v13 + 64) + 7 + v16) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v13 + 64) + 7 + v17) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_221626470(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v22;

  v6 = a3[2];
  v5 = a3[3];
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(v5 - 8);
  v10 = *(unsigned int *)(v9 + 84);
  if (v10 <= v8)
    v11 = *(_DWORD *)(v7 + 84);
  else
    v11 = *(_DWORD *)(v9 + 84);
  v12 = a3[4];
  v13 = *(_QWORD *)(v12 - 8);
  if (*(_DWORD *)(v13 + 84) > v11)
    v11 = *(_DWORD *)(v13 + 84);
  if (!a2)
    return 0;
  v14 = *(unsigned __int8 *)(v9 + 80);
  v15 = *(_QWORD *)(v7 + 64) + v14;
  v16 = *(_QWORD *)(v9 + 64);
  v17 = *(unsigned __int8 *)(v13 + 80);
  if (v11 < a2)
  {
    if (((((*(_QWORD *)(v13 + 64) + ((v16 + v17 + (v15 & ~v14)) & ~v17) + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v18 = 2;
    else
      v18 = a2 - v11 + 1;
    if (v18 >= 0x10000)
      v19 = 4;
    else
      v19 = 2;
    if (v18 < 0x100)
      v19 = 1;
    if (v18 >= 2)
      v20 = v19;
    else
      v20 = 0;
    __asm { BR              X20 }
  }
  if (!v11)
    return 0;
  if (v8 == v11)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v7 + 48))(a1, *(unsigned int *)(v7 + 84), v6);
  v22 = (v15 + a1) & ~v14;
  if ((_DWORD)v10 == v11)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v22, v10, v5);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v13 + 48))((v22 + v16 + v17) & ~v17, *(unsigned int *)(v13 + 84), v12);
}

void sub_2216265F4(unsigned int *a1, unsigned int a2, unsigned int a3, _QWORD *a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  int v11;
  unsigned int v12;

  v5 = *(_QWORD *)(a4[2] - 8);
  v6 = *(_QWORD *)(a4[3] - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(a4[4] - 8);
  if (*(_DWORD *)(v8 + 84) > v7)
    v7 = *(_DWORD *)(v8 + 84);
  if (v7 >= a3)
  {
    v11 = 0;
    if (a2 <= v7)
      goto LABEL_19;
  }
  else
  {
    if (((*(_DWORD *)(v8 + 64)
         + ((*(_DWORD *)(v6 + 64)
           + *(unsigned __int8 *)(v8 + 80)
           + ((*(_DWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~*(unsigned __int8 *)(v6 + 80))) & ~*(unsigned __int8 *)(v8 + 80))
         + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v9 = a3 - v7 + 1;
    else
      v9 = 2;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    if (a2 <= v7)
LABEL_19:
      __asm { BR              X21 }
  }
  if (((*(_DWORD *)(v8 + 64)
       + ((*(_DWORD *)(v6 + 64)
         + *(unsigned __int8 *)(v8 + 80)
         + ((*(_DWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~*(unsigned __int8 *)(v6 + 80))) & ~*(unsigned __int8 *)(v8 + 80))
       + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v12 = ~v7 + a2;
    bzero(a1, ((*(_QWORD *)(v8 + 64)+ ((*(_QWORD *)(v6 + 64)+ *(unsigned __int8 *)(v8 + 80)+ ((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ 7) & 0xFFFFFFFFFFFFFFF8)+ 8);
    *a1 = v12;
  }
  __asm { BR              X10 }
}

void sub_221626734()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_22162673C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x221626744);
}

void sub_221626778()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_221626780()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
}

void sub_221626788(uint64_t a1, int a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)(v5 + v6) = 0;
  if (!a2)
    JUMPOUT(0x221626790);
  if (v3 != v4 && a3 != v4)
    JUMPOUT(0x2216267A4);
  JUMPOUT(0x2216267BCLL);
}

BOOL sub_2216267D4(void *a1, void *a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, double a7, float64_t a8, double a9, double a10)
{
  uint64_t v10;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  int v25;
  void *v26;
  float32x4_t *v27;
  id v28;
  float64_t v29;
  float64x2_t v30;
  double v31;
  double v32;
  __int128 v33;
  float64_t v34;
  double v35;
  double v36;
  CGFloat Height;
  float64x2_t v38;
  float v39;
  float v40;
  int8x16_t v41;
  unsigned int v42;
  void *v43;
  _OWORD *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v49;
  int32x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  int8x16_t v53;
  float v55;
  float v57;
  int64x2_t v58;
  uint64_t v59;
  _QWORD v60[3];
  _QWORD v61[2];
  float64x2_t v62;
  float64x2_t v63;
  _BYTE v64[48];
  char v65;

  sub_2215E36FC(a6, (uint64_t)v61);
  v19 = *(double *)v61;
  v20 = *(double *)&v61[1];
  v51 = v62;
  v52 = v63;
  v21 = objc_msgSend(a1, sel_computeCommandEncoder);
  if (v21)
  {
    v22 = (uint64_t)objc_msgSend(a2, sel_width) / 32;
    v23 = (uint64_t)objc_msgSend(a2, sel_height) / 32;
    v24 = &OBJC_IVAR____TtC17MeasureFoundation16KernelYCbCrToRGB_convertAndRotatePipeline;
    v25 = a5 & 1;
    if (!v25)
      v24 = &OBJC_IVAR____TtC17MeasureFoundation16KernelYCbCrToRGB_convertPipeline;
    objc_msgSend(v21, sel_setComputePipelineState_, *(_QWORD *)(v10 + *v24));
    objc_msgSend(v21, sel_setTexture_atIndex_, a2, 0);
    objc_msgSend(v21, sel_setTexture_atIndex_, a3, 1);
    objc_msgSend(v21, sel_setTexture_atIndex_, a4, 2);
    v26 = *(void **)(v10 + OBJC_IVAR____TtC17MeasureFoundation16KernelYCbCrToRGB_roiBuffer);
    swift_unknownObjectRetain();
    v27 = (float32x4_t *)objc_msgSend(v26, sel_contents);
    v28 = v26;
    v29 = a8;
    v30.f64[0] = a7;
    v30.f64[1] = a8;
    v50 = (int32x2_t)vcvt_f32_f64(v30);
    v30.f64[0] = a7;
    v31 = a9;
    v32 = a10;
    *(double *)&v33 = CGRectGetWidth(*(CGRect *)(&v29 - 1));
    v49 = v33;
    *(double *)&v33 = a7;
    v34 = a8;
    v35 = a9;
    v36 = a10;
    Height = CGRectGetHeight(*(CGRect *)&v33);
    *(_QWORD *)&v38.f64[0] = v49;
    v38.f64[1] = Height;
    *v27 = vcvt_hight_f32_f64(v50, v38);
    objc_msgSend(v21, sel_setBuffer_offset_atIndex_, v28, 0, 0);
    if (!v25)
    {
      sub_2215E36FC(a6, (uint64_t)v64);
      v39 = v19;
      v40 = v20;
      v41 = (int8x16_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v51), v52);
      if (v65)
        v40 = 0.0;
      v57 = v40;
      if (v65)
        v39 = 1.0;
      v55 = v39;
      if (v65)
        v42 = -1;
      else
        v42 = 0;
      v53 = vbslq_s8((int8x16_t)vdupq_n_s32(v42), (int8x16_t)xmmword_221656590, v41);
      v43 = *(void **)(v10 + OBJC_IVAR____TtC17MeasureFoundation16KernelYCbCrToRGB_transformBuffer);
      v44 = objc_msgSend((id)swift_unknownObjectRetain(), sel_contents);
      v45 = v43;
      *(_QWORD *)&v46 = __PAIR64__(v53.u32[0], LODWORD(v55));
      *((_QWORD *)&v46 + 1) = v53.u32[2];
      *(_QWORD *)&v47 = __PAIR64__(v53.u32[1], LODWORD(v57));
      *((_QWORD *)&v47 + 1) = v53.u32[3];
      *v44 = v46;
      v44[1] = v47;
      v44[2] = xmmword_221656010;
      objc_msgSend(v21, sel_setBuffer_offset_atIndex_, v45, 0, 1);
    }
    v60[0] = v22;
    v60[1] = v23;
    v60[2] = 1;
    v58 = vdupq_n_s64(0x20uLL);
    v59 = 1;
    objc_msgSend(v21, sel_dispatchThreadgroups_threadsPerThreadgroup_, v60, &v58, v49);
    objc_msgSend(v21, sel_endEncoding);
    swift_unknownObjectRelease();
  }
  return v21 != 0;
}

id KernelYCbCrToRGB.__allocating_init(coder:device:)(void *a1, uint64_t a2)
{
  objc_class *v2;
  id v4;

  v4 = objc_msgSend(objc_allocWithZone(v2), sel_initWithCoder_device_, a1, a2);

  swift_unknownObjectRelease();
  return v4;
}

void KernelYCbCrToRGB.init(coder:device:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id KernelYCbCrToRGB.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for KernelYCbCrToRGB()
{
  return objc_opt_self();
}

id sub_221626D00(void *a1)
{
  void *v1;
  void *v2;
  objc_class *ObjectType;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id result;
  id v20;
  id v21;
  objc_super v22;
  id v23[2];

  v2 = v1;
  v23[1] = *(id *)MEMORY[0x24BDAC8D0];
  ObjectType = (objc_class *)swift_getObjectType();
  v5 = qword_2556D8D90;
  v6 = v2;
  if (v5 != -1)
    swift_once();
  v7 = (id)static MetalBundle.library;
  v8 = (void *)sub_22165318C();
  v9 = objc_msgSend(v7, sel_newFunctionWithName_, v8);

  if (!v9)
  {
    __break(1u);
    goto LABEL_11;
  }
  v23[0] = 0;
  v10 = objc_msgSend(a1, sel_newComputePipelineStateWithFunction_error_, v9, v23);
  swift_unknownObjectRelease();
  v11 = v23[0];
  if (!v10)
  {
    v20 = v23[0];
    sub_221652ED4();

    swift_willThrow();
    swift_unexpectedError();
    __break(1u);
    goto LABEL_15;
  }
  *(_QWORD *)&v6[OBJC_IVAR____TtC17MeasureFoundation16KernelYCbCrToRGB_convertPipeline] = v10;
  v12 = v11;
  v13 = (void *)sub_22165318C();
  v14 = objc_msgSend(v7, sel_newFunctionWithName_, v13);

  if (!v14)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v23[0] = 0;
  v15 = objc_msgSend(a1, sel_newComputePipelineStateWithFunction_error_, v14, v23);
  swift_unknownObjectRelease();
  v7 = v23[0];
  if (v15)
  {
    *(_QWORD *)&v6[OBJC_IVAR____TtC17MeasureFoundation16KernelYCbCrToRGB_convertAndRotatePipeline] = v15;
    v16 = v7;
    v17 = objc_msgSend(a1, sel_newBufferWithLength_options_, 16, 0);
    if (v17)
    {
      *(_QWORD *)&v6[OBJC_IVAR____TtC17MeasureFoundation16KernelYCbCrToRGB_roiBuffer] = v17;
      v18 = objc_msgSend(a1, sel_newBufferWithLength_options_, 48, 0);
      if (v18)
      {
        *(_QWORD *)&v6[OBJC_IVAR____TtC17MeasureFoundation16KernelYCbCrToRGB_transformBuffer] = v18;

        v22.receiver = v6;
        v22.super_class = ObjectType;
        return objc_msgSendSuper2(&v22, sel_initWithDevice_, a1);
      }
LABEL_13:
      __break(1u);
    }
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
LABEL_15:
  v21 = v7;
  sub_221652ED4();

  swift_willThrow();
  result = (id)swift_unexpectedError();
  __break(1u);
  return result;
}

void *SnapType.userPoint.unsafeMutableAddressor()
{
  return &static SnapType.userPoint;
}

uint64_t static SnapType.userPoint.getter()
{
  return 1;
}

void *SnapType.userLine.unsafeMutableAddressor()
{
  return &static SnapType.userLine;
}

uint64_t static SnapType.userLine.getter()
{
  return 2;
}

void *SnapType.guideLine.unsafeMutableAddressor()
{
  return &static SnapType.guideLine;
}

uint64_t static SnapType.guideLine.getter()
{
  return 4;
}

void *SnapType.worldCorner.unsafeMutableAddressor()
{
  return &static SnapType.worldCorner;
}

uint64_t static SnapType.worldCorner.getter()
{
  return 8;
}

void *SnapType.worldEdge.unsafeMutableAddressor()
{
  return &static SnapType.worldEdge;
}

uint64_t static SnapType.worldEdge.getter()
{
  return 16;
}

void *SnapType.all.unsafeMutableAddressor()
{
  return &static SnapType.all;
}

uint64_t static SnapType.all.getter()
{
  return 31;
}

id sub_221627030()
{
  id result;
  uint64_t v1;

  result = objc_msgSend((id)objc_opt_self(), sel_jasperAvailable);
  v1 = 9;
  if ((_DWORD)result)
    v1 = 13;
  static SnapType.standard = v1;
  return result;
}

uint64_t *SnapType.standard.unsafeMutableAddressor()
{
  if (qword_2556D8EF0 != -1)
    swift_once();
  return &static SnapType.standard;
}

uint64_t static SnapType.standard.getter()
{
  if (qword_2556D8EF0 != -1)
    swift_once();
  return static SnapType.standard;
}

unint64_t sub_2216270F4()
{
  unint64_t result;

  result = qword_2556DDA28;
  if (!qword_2556DDA28)
  {
    result = MEMORY[0x22766FA4C](&protocol conformance descriptor for SnapType, &type metadata for SnapType);
    atomic_store(result, (unint64_t *)&qword_2556DDA28);
  }
  return result;
}

unint64_t sub_22162713C()
{
  unint64_t result;

  result = qword_2556DDA30;
  if (!qword_2556DDA30)
  {
    result = MEMORY[0x22766FA4C](&protocol conformance descriptor for SnapType, &type metadata for SnapType);
    atomic_store(result, (unint64_t *)&qword_2556DDA30);
  }
  return result;
}

unint64_t sub_221627184()
{
  unint64_t result;

  result = qword_2556DDA38;
  if (!qword_2556DDA38)
  {
    result = MEMORY[0x22766FA4C](&protocol conformance descriptor for SnapType, &type metadata for SnapType);
    atomic_store(result, (unint64_t *)&qword_2556DDA38);
  }
  return result;
}

unint64_t sub_2216271CC()
{
  unint64_t result;

  result = qword_2556DDA40;
  if (!qword_2556DDA40)
  {
    result = MEMORY[0x22766FA4C](&protocol conformance descriptor for SnapType, &type metadata for SnapType);
    atomic_store(result, (unint64_t *)&qword_2556DDA40);
  }
  return result;
}

ValueMetadata *type metadata accessor for SnapType()
{
  return &type metadata for SnapType;
}

__IOSurface *SurfaceTexture.init(width:height:backgroundColor:)(Swift::Int a1, Swift::Int a2, int a3)
{
  _BYTE *v3;
  _DWORD *v7;
  char *v8;
  id v9;
  char *v10;
  char *v11;
  __IOSurface *result;
  uint64_t v13;
  uint32_t seed;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelFormat] = 80;
  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bitsPerComponent] = 8;
  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_texture] = 0;
  v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_isLocking] = 0;
  v7 = &v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_backgroundColor];
  *(_DWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_backgroundColor] = -1;
  *(_DWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_color] = -16776961;
  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_cursorX] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_cursorY] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerRow] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelBytes] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerPixel] = 4;
  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsNum] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_ioSurface] = 0;
  swift_beginAccess();
  *v7 = a3;
  v8 = v3;
  v9 = MTLCreateSystemDefaultDevice();
  if (!v9)
    __break(1u);
  *(_QWORD *)&v8[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_mtlDevice] = v9;

  v15.receiver = v8;
  v15.super_class = (Class)type metadata accessor for SurfaceTexture();
  v10 = (char *)objc_msgSendSuper2(&v15, sel_init);
  SurfaceTexture.setSize(width:height:)(a1, a2);
  v11 = &v10[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_isLocking];
  swift_beginAccess();
  if ((*v11 & 1) == 0)
  {
    seed = 0;
    result = *(__IOSurface **)&v10[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_ioSurface];
    if (!result)
    {
      __break(1u);
      goto LABEL_11;
    }
    IOSurfaceLock(result, 2u, &seed);
    *v11 = 1;
  }
  LOBYTE(seed) = 1;
  v13 = 0x100000000;
  SurfaceTexture.clear(color:)((Swift::UInt32_optional)v13);
  if (*v11 != 1)
  {
LABEL_8:

    return (__IOSurface *)v10;
  }
  seed = 0;
  result = *(__IOSurface **)&v10[OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_ioSurface];
  if (result)
  {
    IOSurfaceUnlock(result, 2u, &seed);
    *v11 = 0;
    goto LABEL_8;
  }
LABEL_11:
  __break(1u);
  return result;
}

uint64_t SurfaceTexture.width.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t SurfaceTexture.height.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t SurfaceTexture.texture.getter()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t SurfaceTexture.isLocking.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_isLocking);
  swift_beginAccess();
  return *v1;
}

uint64_t SurfaceTexture.backgroundColor.getter()
{
  uint64_t v0;
  unsigned int *v1;

  v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_backgroundColor);
  swift_beginAccess();
  return *v1;
}

uint64_t SurfaceTexture.backgroundColor.setter(int a1)
{
  uint64_t v1;
  _DWORD *v3;
  uint64_t result;

  v3 = (_DWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_backgroundColor);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.backgroundColor.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t SurfaceTexture.color.getter()
{
  uint64_t v0;
  unsigned int *v1;

  v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_color);
  swift_beginAccess();
  return *v1;
}

uint64_t SurfaceTexture.color.setter(int a1)
{
  uint64_t v1;
  _DWORD *v3;
  uint64_t result;

  v3 = (_DWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_color);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.color.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t SurfaceTexture.cursorX.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_cursorX;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t SurfaceTexture.cursorX.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_cursorX);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.cursorX.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t SurfaceTexture.cursorY.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_cursorY;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t SurfaceTexture.cursorY.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_cursorY);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.cursorY.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t SurfaceTexture.bytesPerRow.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerRow;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t SurfaceTexture.bytesPerRow.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerRow);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.bytesPerRow.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t SurfaceTexture.pixelsPerRow.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t SurfaceTexture.pixelsPerRow.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.pixelsPerRow.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t SurfaceTexture.pixel32s.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t SurfaceTexture.pixel32s.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.pixel32s.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t SurfaceTexture.pixelBytes.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelBytes;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t SurfaceTexture.pixelBytes.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelBytes);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.pixelBytes.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t SurfaceTexture.bytesPerPixel.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerPixel;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t SurfaceTexture.bytesPerPixel.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerPixel);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.bytesPerPixel.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t SurfaceTexture.pixelsNum.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsNum;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t SurfaceTexture.pixelsNum.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsNum);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*SurfaceTexture.pixelsNum.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

Swift::Void __swiftcall SurfaceTexture.setSize(width:height:)(Swift::Int width, Swift::Int height)
{
  uint64_t v2;
  Swift::Int *v5;
  Swift::Int *v6;
  uint64_t *v7;
  uint64_t AlignedBytesPerRow;
  uint64_t inited;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  const __CFDictionary *v26;
  IOSurfaceRef v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  Swift::Int v33;
  id v34;
  _QWORD *v35;
  __IOSurface *v36;
  void *BaseAddress;
  _QWORD *v38;
  __IOSurface *v39;
  void *v40;
  _QWORD *v41;
  __IOSurface *v42;
  void *v43;
  __IOSurface *v44;
  int64_t BytesPerRow;
  int64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t *v52;
  Swift::Int v53;

  v5 = (Swift::Int *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width);
  swift_beginAccess();
  *v5 = width;
  v6 = (Swift::Int *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height);
  swift_beginAccess();
  *v6 = height;
  v7 = (uint64_t *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerPixel);
  swift_beginAccess();
  if ((unsigned __int128)(width * (__int128)*v7) >> 64 != (width * *v7) >> 63)
  {
    __break(1u);
    goto LABEL_14;
  }
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2556DDAE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_221659440;
  v10 = (void *)*MEMORY[0x24BDD8FD0];
  v11 = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDD8FD0];
  *(_QWORD *)(inited + 40) = width;
  v53 = width;
  v12 = (void *)*MEMORY[0x24BDD8EB0];
  *(_QWORD *)(inited + 64) = v11;
  *(_QWORD *)(inited + 72) = v12;
  *(_QWORD *)(inited + 80) = height;
  v13 = (void *)*MEMORY[0x24BDD8E38];
  *(_QWORD *)(inited + 104) = v11;
  *(_QWORD *)(inited + 112) = v13;
  *(_QWORD *)(inited + 120) = AlignedBytesPerRow;
  v14 = (void *)*MEMORY[0x24BDD8E18];
  *(_QWORD *)(inited + 144) = v11;
  *(_QWORD *)(inited + 152) = v14;
  if ((unsigned __int128)(AlignedBytesPerRow * (__int128)height) >> 64 != (AlignedBytesPerRow * height) >> 63)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v15 = inited;
  *(_QWORD *)(inited + 160) = AlignedBytesPerRow * height;
  v16 = (void *)*MEMORY[0x24BDD8E30];
  *(_QWORD *)(inited + 184) = v11;
  *(_QWORD *)(inited + 192) = v16;
  v52 = v7;
  *(_QWORD *)(inited + 200) = *v7;
  v17 = (void *)*MEMORY[0x24BDD8EF8];
  *(_QWORD *)(inited + 224) = v11;
  *(_QWORD *)(inited + 232) = v17;
  v18 = *(_QWORD *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelFormat);
  type metadata accessor for MTLPixelFormat(0);
  *(_QWORD *)(v15 + 264) = v19;
  *(_QWORD *)(v15 + 240) = v18;
  v20 = v10;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  v24 = v16;
  v25 = v17;
  sub_2215C2D1C(v15);
  type metadata accessor for CFString(0);
  sub_2215C3964();
  v26 = (const __CFDictionary *)sub_22165309C();
  swift_bridgeObjectRelease();
  v27 = IOSurfaceCreate(v26);
  v28 = OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_ioSurface;
  v29 = *(void **)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_ioSurface);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_ioSurface) = v27;

  v30 = objc_msgSend((id)objc_opt_self(), sel_texture2DDescriptorWithPixelFormat_width_height_mipmapped_, v18, v53, height, 0);
  v31 = *(_QWORD *)(v2 + v28);
  if (!v31)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v32 = v30;
  v33 = height;
  v34 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_mtlDevice), sel_newTextureWithDescriptor_iosurface_plane_, v30, v31, 0);
  v35 = (_QWORD *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_texture);
  swift_beginAccess();
  *v35 = v34;
  swift_unknownObjectRelease();
  v36 = *(__IOSurface **)(v2 + v28);
  if (!v36)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  BaseAddress = IOSurfaceGetBaseAddress(v36);
  v38 = (_QWORD *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
  swift_beginAccess();
  *v38 = BaseAddress;
  v39 = *(__IOSurface **)(v2 + v28);
  if (!v39)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v40 = IOSurfaceGetBaseAddress(v39);
  v41 = (_QWORD *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelBytes);
  swift_beginAccess();
  *v41 = v40;
  v42 = *(__IOSurface **)(v2 + v28);
  if (!v42)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  *v52 = IOSurfaceGetBytesPerElement(v42);
  v43 = *(void **)(v2 + v28);
  if (v43)
  {
    v44 = v43;
    BytesPerRow = IOSurfaceGetBytesPerRow(v44);

    v46 = (int64_t *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerRow);
    swift_beginAccess();
    *v46 = BytesPerRow;
    v47 = *v52;
    if (*v52)
    {
      if (BytesPerRow == 0x8000000000000000 && v47 == -1)
        goto LABEL_17;
      v48 = (uint64_t *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow);
      v49 = BytesPerRow / v47;
      swift_beginAccess();
      *v48 = v49;
      v50 = v49 * v33;
      if ((unsigned __int128)(v49 * (__int128)v33) >> 64 == (v49 * v33) >> 63)
      {
        v51 = (uint64_t *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsNum);
        swift_beginAccess();
        *v51 = v50;
        return;
      }
LABEL_16:
      __break(1u);
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
LABEL_22:
  __break(1u);
}

Swift::UInt32 __swiftcall SurfaceTexture.getPixel(_:_:)(Swift::Int a1, Swift::Int a2)
{
  uint64_t v2;
  Swift::Int *v5;
  Swift::UInt32 result;
  Swift::Int *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  Swift::Int v11;
  BOOL v12;
  Swift::Int v13;

  if (a1 < 0)
    return 0;
  v5 = (Swift::Int *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width);
  swift_beginAccess();
  result = 0;
  if (*v5 <= a1 || a2 < 0)
    return result;
  v7 = (Swift::Int *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height);
  swift_beginAccess();
  if (*v7 <= a2)
    return 0;
  v8 = (uint64_t *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
  swift_beginAccess();
  v9 = *v8;
  if (!v9)
    return 0;
  v10 = (uint64_t *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow);
  result = swift_beginAccess();
  v11 = a2 * *v10;
  if ((unsigned __int128)(a2 * (__int128)*v10) >> 64 == v11 >> 63)
  {
    v12 = __OFADD__(v11, a1);
    v13 = v11 + a1;
    if (!v12)
      return *(_DWORD *)(v9 + 4 * v13);
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t SurfaceTexture.getPixel(srcPixels:x:y:invertY:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t *v9;
  uint64_t result;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  if (a2 < 0)
    return 0;
  v9 = (uint64_t *)(v4 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width);
  swift_beginAccess();
  result = 0;
  v11 = *v9;
  if (v11 <= a2 || a3 < 0)
    return result;
  v12 = (_QWORD *)(v4 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height);
  result = swift_beginAccess();
  if (*v12 <= a3)
    return 0;
  if ((a4 & 1) != 0)
    v13 = *v12 + ~a3;
  else
    v13 = a3;
  v14 = v13 * v11;
  if ((unsigned __int128)(v13 * (__int128)v11) >> 64 == (v13 * v11) >> 63)
  {
    v15 = __OFADD__(v14, a2);
    v16 = v14 + a2;
    if (!v15)
      return *(unsigned int *)(a1 + 4 * v16);
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall SurfaceTexture.setPixel(x:y:color:)(Swift::Int x, Swift::Int y, Swift::UInt32_optional color)
{
  uint64_t v3;
  unint64_t v4;
  Swift::Int *v7;
  Swift::Int *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  Swift::Int v12;
  BOOL v13;
  Swift::Int v14;

  if (x < 0)
    return;
  v4 = *(_QWORD *)&color.value;
  v7 = (Swift::Int *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width);
  swift_beginAccess();
  if (*v7 <= x)
    return;
  if (y < 0)
    return;
  v8 = (Swift::Int *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height);
  swift_beginAccess();
  if (*v8 <= y)
    return;
  v9 = (uint64_t *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
  swift_beginAccess();
  v10 = *v9;
  if (!*v9)
    return;
  v11 = (uint64_t *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow);
  swift_beginAccess();
  v12 = y * *v11;
  if ((unsigned __int128)(y * (__int128)*v11) >> 64 != v12 >> 63)
  {
    __break(1u);
    goto LABEL_13;
  }
  v13 = __OFADD__(v12, x);
  v14 = v12 + x;
  if (v13)
  {
LABEL_13:
    __break(1u);
    return;
  }
  if ((v4 & 0x100000000) != 0)
  {
    v4 = v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_color;
    swift_beginAccess();
    LODWORD(v4) = *(_DWORD *)v4;
  }
  *(_DWORD *)(v10 + 4 * v14) = v4;
}

Swift::Void __swiftcall SurfaceTexture.drawRect(x:y:width:height:color:)(Swift::Int x, Swift::Int y, Swift::Int width, Swift::Int height, Swift::UInt32_optional color)
{
  uint64_t v5;
  Swift::Int v6;
  Swift::Int v7;
  Swift::Int v9;
  uint64_t v10;
  Swift::Int *v11;
  Swift::Int *v12;
  _QWORD *v13;
  uint64_t *v14;
  int *v15;
  Swift::Int v16;
  Swift::Int v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  int v21;

  v6 = y + height;
  if (__OFADD__(y, height))
    goto LABEL_28;
  v7 = y;
  if (v6 < y)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (v6 == y)
    return;
  v9 = x + width;
  if (__OFADD__(x, width))
    goto LABEL_30;
  if (v9 < x)
  {
LABEL_31:
    __break(1u);
    return;
  }
  v10 = *(_QWORD *)&color.value;
  v11 = (Swift::Int *)(v5 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width);
  v12 = (Swift::Int *)(v5 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height);
  v13 = (_QWORD *)(v5 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
  v14 = (uint64_t *)(v5 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow);
  v15 = (int *)(v5 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_color);
  swift_beginAccess();
  swift_beginAccess();
  swift_beginAccess();
  swift_beginAccess();
  swift_beginAccess();
  do
  {
    if (v7 >= v6)
      goto LABEL_26;
    if (v9 != x)
    {
      if (v9 <= x)
        goto LABEL_27;
      v16 = width;
      v17 = x;
      do
      {
        if ((v17 & 0x8000000000000000) == 0 && (v7 & 0x8000000000000000) == 0 && v17 < *v11 && v7 < *v12 && *v13)
        {
          v18 = v7 * *v14;
          if ((unsigned __int128)(v7 * (__int128)*v14) >> 64 != v18 >> 63)
          {
            __break(1u);
LABEL_25:
            __break(1u);
LABEL_26:
            __break(1u);
LABEL_27:
            __break(1u);
LABEL_28:
            __break(1u);
            goto LABEL_29;
          }
          v19 = __OFADD__(v18, v17);
          v20 = v18 + v17;
          if (v19)
            goto LABEL_25;
          v21 = v10;
          if ((v10 & 0x100000000) != 0)
            v21 = *v15;
          *(_DWORD *)(*v13 + 4 * v20) = v21;
        }
        ++v17;
        --v16;
      }
      while (v16);
    }
    ++v7;
  }
  while (v7 != v6);
}

uint64_t SurfaceTexture.drawRect(x:y:width:height:srcPixels:invertY:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v7 = a2 + a4;
  if (__OFADD__(a2, a4))
    goto LABEL_33;
  v8 = a2;
  if (v7 < a2)
  {
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (v7 == a2)
    return result;
  v9 = v6;
  v10 = result;
  v11 = result + a3;
  if (__OFADD__(result, a3))
    goto LABEL_35;
  if (v11 < result)
  {
LABEL_36:
    __break(1u);
    return result;
  }
  v14 = (uint64_t *)(v9 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width);
  v15 = (_QWORD *)(v9 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height);
  v16 = (_QWORD *)(v9 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
  v17 = (uint64_t *)(v9 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow);
  swift_beginAccess();
  swift_beginAccess();
  result = swift_beginAccess();
  do
  {
    if (v8 >= v7)
      goto LABEL_31;
    if (v11 != v10)
    {
      if (v11 <= v10)
        goto LABEL_32;
      result = swift_beginAccess();
      v18 = a3;
      v19 = v10;
      do
      {
        if ((v19 & 0x8000000000000000) == 0 && (v8 & 0x8000000000000000) == 0)
        {
          v20 = *v14;
          if (v19 < *v14 && v8 < *v15)
          {
            if ((a6 & 1) != 0)
              v21 = *v15 + ~v8;
            else
              v21 = v8;
            v22 = v21 * v20;
            if ((unsigned __int128)(v21 * (__int128)v20) >> 64 != (v21 * v20) >> 63)
            {
              __break(1u);
LABEL_28:
              __break(1u);
LABEL_29:
              __break(1u);
LABEL_30:
              __break(1u);
LABEL_31:
              __break(1u);
LABEL_32:
              __break(1u);
LABEL_33:
              __break(1u);
              goto LABEL_34;
            }
            if (__OFADD__(v22, v19))
              goto LABEL_28;
            if (*v16)
            {
              v23 = v8 * *v17;
              if ((unsigned __int128)(v8 * (__int128)*v17) >> 64 != v23 >> 63)
                goto LABEL_29;
              v24 = __OFADD__(v23, v19);
              v25 = v23 + v19;
              if (v24)
                goto LABEL_30;
              *(_DWORD *)(*v16 + 4 * v25) = *(_DWORD *)(a5 + 4 * (v22 + v19));
            }
          }
        }
        ++v19;
        --v18;
      }
      while (v18);
    }
    ++v8;
  }
  while (v8 != v7);
  return result;
}

Swift::Void __swiftcall SurfaceTexture.blendPixel(x:y:color:)(Swift::Int x, Swift::Int y, Swift::UInt32 color)
{
  uint64_t v3;
  Swift::Int *v7;
  unint64_t v8;
  Swift::Int *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  Swift::Int v13;
  BOOL v14;
  Swift::Int v15;
  int v16;
  Swift::Int *v17;
  Swift::Int *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  Swift::Int v22;
  Swift::Int v23;

  if (x < 0)
  {
    _s17MeasureFoundation8GraphicsC9blendBGRA8srcColor03dstG0s6UInt32VAH_AHtFZ_0(0, color);
    return;
  }
  v7 = (Swift::Int *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width);
  swift_beginAccess();
  v8 = 0;
  if (*v7 > x && (y & 0x8000000000000000) == 0)
  {
    v9 = (Swift::Int *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height);
    swift_beginAccess();
    if (*v9 <= y
      || (v10 = (uint64_t *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s),
          swift_beginAccess(),
          (v11 = *v10) == 0))
    {
      v8 = 0;
      goto LABEL_11;
    }
    v12 = (uint64_t *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow);
    swift_beginAccess();
    v13 = y * *v12;
    if ((unsigned __int128)(y * (__int128)*v12) >> 64 == v13 >> 63)
    {
      v14 = __OFADD__(v13, x);
      v15 = v13 + x;
      if (!v14)
      {
        v8 = *(unsigned int *)(v11 + 4 * v15);
        goto LABEL_11;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_21;
  }
LABEL_11:
  v16 = _s17MeasureFoundation8GraphicsC9blendBGRA8srcColor03dstG0s6UInt32VAH_AHtFZ_0(v8, color);
  v17 = (Swift::Int *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width);
  swift_beginAccess();
  if (*v17 > x && (y & 0x8000000000000000) == 0)
  {
    v18 = (Swift::Int *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height);
    swift_beginAccess();
    if (*v18 > y)
    {
      v19 = (uint64_t *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
      swift_beginAccess();
      v20 = *v19;
      if (v20)
      {
        v21 = (uint64_t *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsPerRow);
        swift_beginAccess();
        v22 = y * *v21;
        if ((unsigned __int128)(y * (__int128)*v21) >> 64 == v22 >> 63)
        {
          v14 = __OFADD__(v22, x);
          v23 = v22 + x;
          if (!v14)
          {
            *(_DWORD *)(v20 + 4 * v23) = v16;
            return;
          }
LABEL_22:
          __break(1u);
          return;
        }
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
    }
  }
}

Swift::Void __swiftcall SurfaceTexture.blendBrightness(x:y:brightness:)(Swift::Int x, Swift::Int y, Swift::Float brightness)
{
  uint64_t v3;
  _DWORD *v7;
  float v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;

  v7 = (_DWORD *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_color);
  swift_beginAccess();
  v8 = brightness * 255.0;
  if ((~COERCE_INT(brightness * 255.0) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v8 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v8 < 4295000000.0)
  {
    v9 = *v7 & 0xFFFFFF | (v8 << 24);
    v10 = SurfaceTexture.getPixel(_:_:)(x, y);
    v11 = _s17MeasureFoundation8GraphicsC9blendBGRA8srcColor03dstG0s6UInt32VAH_AHtFZ_0(v10, v9);
    SurfaceTexture.setPixel(x:y:color:)(x, y, (Swift::UInt32_optional)v11);
    return;
  }
LABEL_7:
  __break(1u);
}

Swift::Void __swiftcall SurfaceTexture.setAlpha(_:)(Swift::Float a1)
{
  uint64_t v1;
  float v2;
  uint64_t *v3;
  uint64_t v4;
  _QWORD *v5;
  _DWORD *v6;
  _DWORD *v7;

  v2 = a1 * 255.0;
  if ((~COERCE_INT(a1 * 255.0) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (v2 <= -1.0)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (v2 >= 4295000000.0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsNum);
  swift_beginAccess();
  v4 = *v3;
  if (*v3 < 0)
  {
LABEL_14:
    __break(1u);
    return;
  }
  if (v4)
  {
    v5 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
    swift_beginAccess();
    v6 = (_DWORD *)*v5;
    v7 = (_DWORD *)*v5;
    do
    {
      if (v6)
        *v7 &= (v2 << 24) | 0xFFFFFF;
      ++v7;
      --v4;
    }
    while (v4);
  }
}

Swift::Void __swiftcall SurfaceTexture.clear(color:)(Swift::UInt32_optional color)
{
  uint64_t v1;
  Swift::UInt32 value;
  Swift::UInt32 *v3;
  Swift::UInt32 *v4;
  uint64_t *v5;
  uint64_t v6;
  Swift::UInt32 **v7;
  Swift::UInt32 *v8;
  Swift::UInt32 *v9;

  value = color.value;
  if ((*(_QWORD *)&color.value & 0x100000000) != 0)
  {
    v3 = (Swift::UInt32 *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_backgroundColor);
    swift_beginAccess();
    value = *v3;
  }
  v4 = (Swift::UInt32 *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_backgroundColor);
  swift_beginAccess();
  *v4 = value;
  v5 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsNum);
  swift_beginAccess();
  v6 = *v5;
  if (v6 < 0)
  {
    __break(1u);
  }
  else if (v6)
  {
    v7 = (Swift::UInt32 **)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
    swift_beginAccess();
    v8 = *v7;
    v9 = *v7;
    do
    {
      if (v8)
        *v9 = value;
      ++v9;
      --v6;
    }
    while (v6);
  }
}

void *SurfaceTexture.fill(withPointer:)(const void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  void *result;
  int64_t v9;

  v3 = (void **)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
  swift_beginAccess();
  v4 = *v3;
  v5 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsNum);
  swift_beginAccess();
  v6 = *v5;
  v7 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerPixel);
  result = (void *)swift_beginAccess();
  v9 = v6 * *v7;
  if ((unsigned __int128)(v6 * (__int128)*v7) >> 64 == v9 >> 63)
    return memcpy(v4, a1, v9);
  __break(1u);
  return result;
}

Swift::Void __swiftcall SurfaceTexture.fill(withPixelBuffer:)(CVBufferRef withPixelBuffer)
{
  uint64_t v1;
  void *BaseAddress;
  void **v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  int64_t v9;

  CVPixelBufferLockBaseAddress(withPixelBuffer, 0);
  BaseAddress = CVPixelBufferGetBaseAddress(withPixelBuffer);
  v4 = (void **)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
  swift_beginAccess();
  v5 = *v4;
  v6 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsNum);
  swift_beginAccess();
  v7 = *v6;
  v8 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_bytesPerPixel);
  swift_beginAccess();
  v9 = v7 * *v8;
  if ((unsigned __int128)(v7 * (__int128)*v8) >> 64 == v9 >> 63)
  {
    memcpy(v5, BaseAddress, v9);
    CVPixelBufferUnlockBaseAddress(withPixelBuffer, 0);
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall SurfaceTexture.fill(withARBG:)(Swift::OpaquePointer withARBG)
{
  uint64_t v1;
  size_t v3;
  _QWORD *v4;
  void **v5;

  v3 = *((_QWORD *)withARBG._rawValue + 2);
  v4 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelsNum);
  swift_beginAccess();
  if (v3 == *v4)
  {
    v5 = (void **)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixel32s);
    swift_beginAccess();
    memcpy(*v5, (char *)withARBG._rawValue + 32, v3);
  }
  else
  {
    sub_221653894();
    swift_bridgeObjectRelease();
    MEMORY[0x22766E7BC](withARBG._rawValue, MEMORY[0x24BEE44F0]);
    sub_221653210();
    swift_bridgeObjectRelease();
    sub_221653210();
    sub_221653ABC();
    sub_221653210();
    swift_bridgeObjectRelease();
    sub_221652FDC();
    swift_bridgeObjectRelease();
  }
}

Swift::Void __swiftcall SurfaceTexture.fill(withBytes:)(Swift::OpaquePointer withBytes)
{
  uint64_t v1;
  void **v3;

  v3 = (void **)(v1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_pixelBytes);
  swift_beginAccess();
  memcpy(*v3, (char *)withBytes._rawValue + 32, *((_QWORD *)withBytes._rawValue + 2));
}

Swift::Void __swiftcall SurfaceTexture.goTo(x:y:)(Swift::Int x, Swift::Int y)
{
  uint64_t v2;
  Swift::Int *v5;
  Swift::Int *v6;

  v5 = (Swift::Int *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_cursorX);
  swift_beginAccess();
  *v5 = x;
  v6 = (Swift::Int *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_cursorY);
  swift_beginAccess();
  *v6 = y;
}

Swift::Void __swiftcall SurfaceTexture.begin()()
{
  uint64_t v0;
  _BYTE *v1;
  __IOSurface *v2;
  uint32_t seed;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = (_BYTE *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_isLocking);
  swift_beginAccess();
  if ((*v1 & 1) == 0)
  {
    seed = 0;
    v2 = *(__IOSurface **)(v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_ioSurface);
    if (v2)
    {
      IOSurfaceLock(v2, 2u, &seed);
      *v1 = 1;
    }
    else
    {
      __break(1u);
    }
  }
}

Swift::Void __swiftcall SurfaceTexture.end()()
{
  uint64_t v0;
  _BYTE *v1;
  __IOSurface *v2;
  uint32_t seed;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = (_BYTE *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_isLocking);
  swift_beginAccess();
  if (*v1 == 1)
  {
    seed = 0;
    v2 = *(__IOSurface **)(v0 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_ioSurface);
    if (v2)
    {
      IOSurfaceUnlock(v2, 2u, &seed);
      *v1 = 0;
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t type metadata accessor for SurfaceTexture()
{
  return objc_opt_self();
}

uint64_t sub_221629278(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_texture);
  swift_beginAccess();
  *v3 = v2;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

__IOSurface *SurfaceTexture.__allocating_init(width:height:backgroundColor:)(Swift::Int a1, Swift::Int a2, int a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return SurfaceTexture.init(width:height:backgroundColor:)(a1, a2, a3);
}

id SurfaceTexture.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SurfaceTexture.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SurfaceTexture.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SurfaceTexture();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_221629418@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width, a2);
}

uint64_t sub_221629424(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_width);
}

uint64_t sub_221629430@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height, a2);
}

uint64_t keypath_getTm_0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *v4;
  uint64_t result;

  v4 = (_QWORD *)(*a1 + *a2);
  result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_221629488(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_height);
}

uint64_t keypath_setTm(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_QWORD *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

uint64_t sub_2216294DC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_texture);
  swift_beginAccess();
  *a2 = *v3;
  return swift_unknownObjectRetain();
}

uint64_t sub_221629534@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_isLocking);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_221629584(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC17MeasureFoundation14SurfaceTexture_isLocking);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t ADConfiguration.width.getter()
{
  return 256;
}

uint64_t ADConfiguration.height.getter()
{
  return 192;
}

double ADConfiguration.viewport.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

float ADConfiguration.depthToMeters.getter()
{
  return 1.0;
}

uint64_t ADConfiguration.shouldCoverEntireView.getter()
{
  return 1;
}

double ADConfiguration.size.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 72);
}

uint64_t ADConfiguration.orientation.getter()
{
  return 3;
}

CGFloat _s17MeasureFoundation15ADConfigurationC12viewCropRectSo6CGRectVvg_0()
{
  CGFloat *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double Width;
  double Height;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v1 = v0[9];
  v2 = v0[10];
  if (v2 >= v1)
    v3 = v0[9];
  else
    v3 = v0[10];
  if (v1 <= v2)
    v1 = v0[10];
  v4 = v3 / v1;
  v5 = v0[4];
  v6 = v0[5];
  v7 = v0[6];
  v8 = v0[7];
  v17.origin.x = v5;
  v17.origin.y = v6;
  v17.size.width = v7;
  v17.size.height = v8;
  Width = CGRectGetWidth(v17);
  v18.origin.x = v5;
  v18.origin.y = v6;
  v18.size.width = v7;
  v18.size.height = v8;
  if (v4 >= Width / CGRectGetHeight(v18))
  {
    v20.origin.x = v5;
    v20.origin.y = v6;
    v20.size.width = v7;
    v20.size.height = v8;
    v11 = CGRectGetWidth(v20);
    Height = v11 / v4;
  }
  else
  {
    v19.origin.x = v5;
    v19.origin.y = v6;
    v19.size.width = v7;
    v19.size.height = v8;
    Height = CGRectGetHeight(v19);
    v11 = v4 * Height;
  }
  v21.origin.x = v5;
  v21.origin.y = v6;
  v21.size.width = v7;
  v21.size.height = v8;
  v12 = CGRectGetWidth(v21) / v11;
  v22.origin.x = v5;
  v22.origin.y = v6;
  v22.size.width = v7;
  v22.size.height = v8;
  v13 = CGRectGetHeight(v22) / Height;
  if (v13 <= v12)
    v13 = v12;
  if (v13 <= 1.0)
    v13 = 1.0;
  v14 = v11 * v13;
  v23.origin.x = v5;
  v23.origin.y = v6;
  v23.size.width = v7;
  v23.size.height = v8;
  v15 = (CGRectGetWidth(v23) - v14) * 0.5;
  v24.origin.x = v5;
  v24.origin.y = v6;
  v24.size.width = v7;
  v24.size.height = v8;
  CGRectGetHeight(v24);
  return v15;
}

uint64_t ADConfiguration.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t ADConfiguration.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t ARKitADConfiguration.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t QVGAADConfiguration.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t VGAADConfiguration.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t type metadata accessor for ADConfiguration()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ARKitADConfiguration()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for QVGAADConfiguration()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for VGAADConfiguration()
{
  return objc_opt_self();
}

BOOL sub_221629824(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  _BOOL8 result;
  float v10;
  float v11;
  __int128 v13;
  __int128 v14;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (!v2 || a1 == a2)
    return 1;
  v3 = 0;
  v4 = a1 + 32;
  do
  {
    v5 = 0;
    v6 = 16 * v3++;
    v7 = *(_OWORD *)(v4 + v6);
    v8 = *(_OWORD *)(a2 + 32 + v6);
    while (1)
    {
      v13 = v7;
      v10 = *(float *)((unint64_t)&v13 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)));
      v14 = v8;
      v11 = *(float *)((unint64_t)&v14 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)));
      result = v10 == v11;
      if (v5 == 2)
        break;
      while (1)
      {
        ++v5;
        if (result)
          break;
        result = 0;
        if (v5 == 2)
          return result;
      }
    }
  }
  while (v10 == v11 && v3 != v2);
  return result;
}

uint64_t BoundingBox.visionCorners.getter()
{
  return swift_bridgeObjectRetain();
}

float32x2_t BoundingBox.centroid.getter(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  float *v5;
  uint64_t v6;
  float v7;
  __int128 v8;
  int32x2_t v9;
  float32x2_t v11;

  v2 = qword_2556D8DD0;
  swift_bridgeObjectRetain();
  if (v2 != -1)
    swift_once();
  v3 = static SIMD3<>.zero;
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v5 = (float *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 16);
    do
    {
      *(float32x2_t *)&v8 = vadd_f32(*(float32x2_t *)&v3, *(float32x2_t *)(v5 - 2));
      v7 = *v5;
      v5 += 4;
      *((float *)&v8 + 2) = *((float *)&v3 + 2) + v7;
      HIDWORD(v8) = 0;
      v3 = v8;
      --v6;
    }
    while (v6);
  }
  else
  {
    *(_QWORD *)&v8 = static SIMD3<>.zero;
  }
  v11 = (float32x2_t)v8;
  swift_bridgeObjectRelease();
  *(float *)v9.i32 = (float)v4;
  return vdiv_f32(v11, (float32x2_t)vdup_lane_s32(v9, 0));
}

float32x2_t BoundingBox.visionCentroid.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  float *v7;
  float v8;
  __int128 v9;
  int32x2_t v10;
  float32x2_t v12;

  v4 = qword_2556D8DD0;
  swift_bridgeObjectRetain();
  if (v4 != -1)
    swift_once();
  v5 = static SIMD3<>.zero;
  v6 = *(_QWORD *)(a2 + 16);
  if (v6)
  {
    v7 = (float *)(a2 + 40);
    do
    {
      *(float32x2_t *)&v9 = vadd_f32(*(float32x2_t *)&v5, *(float32x2_t *)(v7 - 2));
      v8 = *v7;
      v7 += 4;
      *((float *)&v9 + 2) = *((float *)&v5 + 2) + v8;
      HIDWORD(v9) = 0;
      v5 = v9;
      --v6;
    }
    while (v6);
  }
  else
  {
    *(_QWORD *)&v9 = static SIMD3<>.zero;
  }
  v12 = (float32x2_t)v9;
  swift_bridgeObjectRelease();
  *(float *)v10.i32 = (float)*(uint64_t *)(a1 + 16);
  return vdiv_f32(v12, (float32x2_t)vdup_lane_s32(v10, 0));
}

double BoundingBox.volume.getter(uint64_t a1)
{
  float32x4_t v2;
  float32x4_t v3;
  float32x2_t v4;
  double result;
  float32x4_t v6;
  float32x4_t v7;

  _s17MeasureFoundation11BoundingBoxV10dimensionss5SIMD3VySfGvg_0(a1);
  v6 = v2;
  _s17MeasureFoundation11BoundingBoxV10dimensionss5SIMD3VySfGvg_0(a1);
  v7 = vmulq_laneq_f32(v6, v3, 2);
  _s17MeasureFoundation11BoundingBoxV10dimensionss5SIMD3VySfGvg_0(a1);
  *(_QWORD *)&result = vmulq_lane_f32(v7, v4, 1).u64[0];
  return result;
}

float BoundingBox.init(visionCorners:confidence:visionToRenderTransform:)(float32x4_t *a1, float a2, float32x4_t a3, float32x4_t a4, float32x4_t a5, float32x4_t a6)
{
  int64_t v8;
  uint64_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  uint64_t v14;
  float32x4_t *v15;
  unint64_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  uint64_t v20;
  float32x4_t v21;
  unint64_t v22;
  float32x4_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  __int128 v28;
  unint64_t v29;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  __int128 v39;
  uint64_t v40;

  v8 = a1[1].i64[0];
  v9 = MEMORY[0x24BEE4AF8];
  if (v8)
  {
    v40 = MEMORY[0x24BEE4AF8];
    sub_2215CC09C(0, v8, 0);
    v11 = a3;
    v10 = a4;
    v13 = a5;
    v12 = a6;
    v14 = v40;
    v15 = a1 + 2;
    v16 = *(_QWORD *)(v40 + 16);
    v17 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a3, COERCE_FLOAT(*MEMORY[0x24BDAEE00])), a4, *MEMORY[0x24BDAEE00], 1), a5, *MEMORY[0x24BDAEE00], 2), a6, *MEMORY[0x24BDAEE00], 3);
    v18 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a3, COERCE_FLOAT(*(_OWORD *)(MEMORY[0x24BDAEE00] + 16))), a4, *(float32x2_t *)(MEMORY[0x24BDAEE00] + 16), 1), a5, *(float32x4_t *)(MEMORY[0x24BDAEE00] + 16), 2), a6, *(float32x4_t *)(MEMORY[0x24BDAEE00] + 16), 3);
    v19 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a3, COERCE_FLOAT(*(_OWORD *)(MEMORY[0x24BDAEE00] + 32))), a4, *(float32x2_t *)(MEMORY[0x24BDAEE00] + 32), 1), a5, *(float32x4_t *)(MEMORY[0x24BDAEE00] + 32), 2), a6, *(float32x4_t *)(MEMORY[0x24BDAEE00] + 32), 3);
    v20 = (v16 << 6) | 0x30;
    do
    {
      v21 = *v15;
      v22 = *(_QWORD *)(v40 + 24);
      if (v16++ >= v22 >> 1)
      {
        v33 = v18;
        v34 = v17;
        v31 = *v15;
        v32 = v19;
        sub_2215CC09C((char *)(v22 > 1), v16, 1);
        v21 = v31;
        v19 = v32;
        v18 = v33;
        v17 = v34;
        v11 = a3;
        v10 = a4;
        v13 = a5;
        v12 = a6;
      }
      *(_QWORD *)(v40 + 16) = v16;
      v24 = (float32x4_t *)(v40 + v20);
      v24[-1] = v17;
      *v24 = v18;
      v24[1] = v19;
      v24[2] = vaddq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, v21.f32[0]), v10, *(float32x2_t *)v21.f32, 1), v13, v21, 2), v12);
      v20 += 64;
      ++v15;
      --v8;
    }
    while (v8);
  }
  else
  {
    v16 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    if (!v16)
      goto LABEL_13;
    v14 = MEMORY[0x24BEE4AF8];
  }
  sub_2215CC080(0, v16, 0);
  v25 = v9;
  v26 = *(_QWORD *)(v9 + 16);
  v27 = 80;
  do
  {
    v28 = *(_OWORD *)(v14 + v27);
    v29 = *(_QWORD *)(v25 + 24);
    if (v26 >= v29 >> 1)
    {
      v39 = *(_OWORD *)(v14 + v27);
      sub_2215CC080((char *)(v29 > 1), v26 + 1, 1);
      v28 = v39;
    }
    HIDWORD(v28) = 0;
    *(_QWORD *)(v25 + 16) = v26 + 1;
    *(_OWORD *)(v25 + 16 * v26 + 32) = v28;
    v27 += 64;
    ++v26;
    --v16;
  }
  while (v16);
LABEL_13:
  swift_bridgeObjectRelease();
  return a2;
}

BOOL static BoundingBox.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, float a5, float a6)
{
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  _BOOL4 v14;
  float v15;
  float v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  BOOL v24;
  _BOOL8 result;
  float v26;
  float v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  v6 = *(_QWORD *)(a1 + 16);
  if (v6 != *(_QWORD *)(a3 + 16))
    return 0;
  if (v6)
    v7 = a1 == a3;
  else
    v7 = 1;
  if (!v7)
  {
    v18 = 0;
    v19 = a1 + 32;
    do
    {
      v20 = 0;
      v21 = 16 * v18++;
      v22 = *(_OWORD *)(v19 + v21);
      v23 = *(_OWORD *)(a3 + 32 + v21);
      while (1)
      {
        v30 = v22;
        v26 = *(float *)((unint64_t)&v30 & 0xFFFFFFFFFFFFFFF3 | (4 * (v20 & 3)));
        v31 = v23;
        v27 = *(float *)((unint64_t)&v31 & 0xFFFFFFFFFFFFFFF3 | (4 * (v20 & 3)));
        v24 = v26 == v27;
        if (v20 == 2)
          break;
        while (1)
        {
          ++v20;
          if (v24)
            break;
          v24 = 0;
          result = 0;
          if (v20 == 2)
            return result;
        }
      }
      if (v26 != v27)
        return 0;
    }
    while (v18 != v6);
  }
  v8 = *(_QWORD *)(a2 + 16);
  if (v8 == *(_QWORD *)(a4 + 16))
  {
    if (!v8 || a2 == a4)
    {
      v14 = 1;
    }
    else
    {
      v9 = 0;
      do
      {
        v10 = 0;
        v11 = 16 * v9++;
        v12 = *(_OWORD *)(a2 + 32 + v11);
        v13 = *(_OWORD *)(a4 + 32 + v11);
        while (1)
        {
          v28 = v12;
          v15 = *(float *)((unint64_t)&v28 & 0xFFFFFFFFFFFFFFF3 | (4 * (v10 & 3)));
          v29 = v13;
          v16 = *(float *)((unint64_t)&v29 & 0xFFFFFFFFFFFFFFF3 | (4 * (v10 & 3)));
          v14 = v15 == v16;
          if (v10 == 2)
            break;
          while (1)
          {
            ++v10;
            if (v14)
              break;
            v14 = 0;
            if (v10 == 2)
              return a5 == a6 && v14;
          }
        }
      }
      while (v15 == v16 && v9 != v8);
    }
  }
  else
  {
    v14 = 0;
  }
  return a5 == a6 && v14;
}

uint64_t sub_221629E70()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x436E6F697369765FLL;
  if (*v0 != 1)
    v1 = 0x6E656469666E6F63;
  if (*v0)
    return v1;
  else
    return 0x7372656E726F63;
}

uint64_t sub_221629EDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22162A6E4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_221629F00()
{
  return 0;
}

void sub_221629F0C(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_221629F18()
{
  sub_22162A6A0();
  return sub_221653BF4();
}

uint64_t sub_221629F40()
{
  sub_22162A6A0();
  return sub_221653C00();
}

uint64_t BoundingBox.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  uint64_t v13;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2556DDEB0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22162A6A0();
  sub_221653BE8();
  v13 = a2;
  HIBYTE(v12) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DDEC0);
  sub_22162B40C(&qword_2556DDEC8, (unint64_t *)&qword_2556DDED0, MEMORY[0x24BEE4108], MEMORY[0x24BEE12A0]);
  sub_221653A98();
  if (!v3)
  {
    v13 = a3;
    HIBYTE(v12) = 1;
    sub_221653A98();
    LOBYTE(v13) = 2;
    sub_221653A8C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void BoundingBox.init(from:)(_QWORD *a1)
{
  sub_22162A868(a1);
}

uint64_t sub_22162A130(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  float v3;
  uint64_t v4;
  float v5;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(float *)(a1 + 16);
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(float *)(a2 + 16);
  if (sub_221629824(*(_QWORD *)a1, *(_QWORD *)a2))
    return sub_221629824(v2, v4) & (v3 == v5);
  else
    return 0;
}

void sub_22162A190(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  float v6;

  v6 = sub_22162A868(a1);
  if (!v2)
  {
    *(_QWORD *)a2 = v4;
    *(_QWORD *)(a2 + 8) = v5;
    *(float *)(a2 + 16) = v6;
  }
}

uint64_t sub_22162A1BC(_QWORD *a1)
{
  uint64_t *v1;

  return BoundingBox.encode(to:)(a1, *v1, v1[1]);
}

uint64_t BoundingBox.ResultRepresentation.init(_:)(uint64_t a1)
{
  _s17MeasureFoundation11BoundingBoxV10dimensionss5SIMD3VySfGvg_0(a1);
  return a1;
}

uint64_t sub_22162A214()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_22162A24C + 4 * byte_221659540[*v0]))(0x6F69736E656D6964, 0xEA0000000000736ELL);
}

uint64_t sub_22162A24C()
{
  return 0x7372656E726F63;
}

uint64_t sub_22162A264()
{
  return 0x6F436E6F69736976;
}

uint64_t sub_22162A288()
{
  return 0x6E656469666E6F63;
}

uint64_t sub_22162A2A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22162B21C(a1, a2);
  *a3 = result;
  return result;
}

void sub_22162A2C8(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_22162A2D4()
{
  sub_22162AAB8();
  return sub_221653BF4();
}

uint64_t sub_22162A2FC()
{
  sub_22162AAB8();
  return sub_221653C00();
}

uint64_t BoundingBox.ResultRepresentation.encode(to:)(_QWORD *a1, unint64_t a2, unint64_t a3, __n128 a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  __n128 v13;
  char v14;
  __n128 v15;

  v13 = a4;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2556DDED8);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22162AAB8();
  sub_221653BE8();
  v15 = v13;
  v14 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DBBC8);
  sub_22162B488((unint64_t *)&qword_2556DDED0, MEMORY[0x24BEE4108]);
  sub_221653A98();
  if (!v4)
  {
    v15.n128_u64[0] = a2;
    v14 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2556DDEC0);
    sub_22162B40C(&qword_2556DDEC8, (unint64_t *)&qword_2556DDED0, MEMORY[0x24BEE4108], MEMORY[0x24BEE12A0]);
    sub_221653A98();
    v15.n128_u64[0] = a3;
    v14 = 2;
    sub_221653A98();
    v15.n128_u8[0] = 3;
    sub_221653A8C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_22162A528(_QWORD *a1)
{
  __n128 *v1;

  return BoundingBox.ResultRepresentation.encode(to:)(a1, v1[1].n128_u64[0], v1[1].n128_u64[1], *v1);
}

uint64_t BoundingBox.resultRepresentation.getter(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  _s17MeasureFoundation11BoundingBoxV10dimensionss5SIMD3VySfGvg_0(a1);
  return a1;
}

uint64_t sub_22162A594@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t result;
  __int128 v7;

  v3 = *(_QWORD *)v1;
  v4 = *(_QWORD *)(v1 + 8);
  v5 = *(_DWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = _s17MeasureFoundation11BoundingBoxV10dimensionss5SIMD3VySfGvg_0(v3);
  *(_OWORD *)a1 = v7;
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_DWORD *)(a1 + 32) = v5;
  return result;
}

uint64_t _s17MeasureFoundation11BoundingBoxV10dimensionss5SIMD3VySfGvg_0(uint64_t result)
{
  unint64_t v1;

  v1 = *(_QWORD *)(result + 16);
  if (!v1)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v1 == 1)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v1 < 3)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v1 < 5)
LABEL_9:
    __break(1u);
  return result;
}

unint64_t sub_22162A6A0()
{
  unint64_t result;

  result = qword_2556DDEB8;
  if (!qword_2556DDEB8)
  {
    result = MEMORY[0x22766FA4C](&unk_221659810, &type metadata for BoundingBox.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2556DDEB8);
  }
  return result;
}

uint64_t sub_22162A6E4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7372656E726F63 && a2 == 0xE700000000000000;
  if (v2 || (sub_221653B04() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x436E6F697369765FLL && a2 == 0xEE007372656E726FLL || (sub_221653B04() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6E656469666E6F63 && a2 == 0xEA00000000006563)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_221653B04();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

float sub_22162A868(_QWORD *a1)
{
  uint64_t v1;
  float v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  float v9;
  uint64_t v10;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2556DDF40);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22162A6A0();
  sub_221653BDC();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2556DDEC0);
    HIBYTE(v10) = 0;
    sub_22162B40C(&qword_2556DDF48, &qword_2556DDF50, MEMORY[0x24BEE4118], MEMORY[0x24BEE12D0]);
    sub_221653A50();
    HIBYTE(v10) = 1;
    swift_bridgeObjectRetain();
    sub_221653A50();
    LOBYTE(v11) = 2;
    swift_bridgeObjectRetain();
    sub_221653A44();
    v2 = v9;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v2;
}

unint64_t sub_22162AAB8()
{
  unint64_t result;

  result = qword_2556DDEE0;
  if (!qword_2556DDEE0)
  {
    result = MEMORY[0x22766FA4C](&unk_2216597C0, &type metadata for BoundingBox.ResultRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2556DDEE0);
  }
  return result;
}

unint64_t sub_22162AB00()
{
  unint64_t result;

  result = qword_2556DDEE8;
  if (!qword_2556DDEE8)
  {
    result = MEMORY[0x22766FA4C](&protocol conformance descriptor for BoundingBox.ResultRepresentation, &type metadata for BoundingBox.ResultRepresentation);
    atomic_store(result, (unint64_t *)&qword_2556DDEE8);
  }
  return result;
}

uint64_t destroy for BoundingBox()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s17MeasureFoundation11BoundingBoxVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BoundingBox(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy20_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for BoundingBox(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for BoundingBox(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 20))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BoundingBox(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_DWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 20) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 20) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BoundingBox()
{
  return &type metadata for BoundingBox;
}

uint64_t destroy for BoundingBox.ResultRepresentation()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BoundingBox.ResultRepresentation(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BoundingBox.ResultRepresentation(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy36_16(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for BoundingBox.ResultRepresentation(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for BoundingBox.ResultRepresentation(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 36))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BoundingBox.ResultRepresentation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_DWORD *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 36) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 36) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for BoundingBox.ResultRepresentation()
{
  return &type metadata for BoundingBox.ResultRepresentation;
}

uint64_t storeEnumTagSinglePayload for BoundingBox.ResultRepresentation.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_22162AF20 + 4 * byte_221659549[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_22162AF54 + 4 * byte_221659544[v4]))();
}

uint64_t sub_22162AF54(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22162AF5C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22162AF64);
  return result;
}

uint64_t sub_22162AF70(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22162AF78);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_22162AF7C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22162AF84(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BoundingBox.ResultRepresentation.CodingKeys()
{
  return &type metadata for BoundingBox.ResultRepresentation.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for BoundingBox.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_22162AFEC + 4 * byte_221659553[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22162B020 + 4 * byte_22165954E[v4]))();
}

uint64_t sub_22162B020(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22162B028(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22162B030);
  return result;
}

uint64_t sub_22162B03C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22162B044);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22162B048(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22162B050(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BoundingBox.CodingKeys()
{
  return &type metadata for BoundingBox.CodingKeys;
}

unint64_t sub_22162B070()
{
  unint64_t result;

  result = qword_2556DDF10;
  if (!qword_2556DDF10)
  {
    result = MEMORY[0x22766FA4C](&unk_2216596E0, &type metadata for BoundingBox.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2556DDF10);
  }
  return result;
}

unint64_t sub_22162B0B8()
{
  unint64_t result;

  result = qword_2556DDF18;
  if (!qword_2556DDF18)
  {
    result = MEMORY[0x22766FA4C](&unk_221659798, &type metadata for BoundingBox.ResultRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2556DDF18);
  }
  return result;
}

unint64_t sub_22162B100()
{
  unint64_t result;

  result = qword_2556DDF20;
  if (!qword_2556DDF20)
  {
    result = MEMORY[0x22766FA4C](&unk_221659708, &type metadata for BoundingBox.ResultRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2556DDF20);
  }
  return result;
}

unint64_t sub_22162B148()
{
  unint64_t result;

  result = qword_2556DDF28;
  if (!qword_2556DDF28)
  {
    result = MEMORY[0x22766FA4C](&unk_221659730, &type metadata for BoundingBox.ResultRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2556DDF28);
  }
  return result;
}

unint64_t sub_22162B190()
{
  unint64_t result;

  result = qword_2556DDF30;
  if (!qword_2556DDF30)
  {
    result = MEMORY[0x22766FA4C](&unk_221659650, &type metadata for BoundingBox.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2556DDF30);
  }
  return result;
}

unint64_t sub_22162B1D8()
{
  unint64_t result;

  result = qword_2556DDF38;
  if (!qword_2556DDF38)
  {
    result = MEMORY[0x22766FA4C](&unk_221659678, &type metadata for BoundingBox.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2556DDF38);
  }
  return result;
}

uint64_t sub_22162B21C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0x6F69736E656D6964 && a2 == 0xEA0000000000736ELL || (sub_221653B04() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7372656E726F63 && a2 == 0xE700000000000000 || (sub_221653B04() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F436E6F69736976 && a2 == 0xED00007372656E72 || (sub_221653B04() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6E656469666E6F63 && a2 == 0xEA00000000006563)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v5 = sub_221653B04();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_22162B40C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2556DDEC0);
    v10 = sub_22162B488(a2, a3);
    result = MEMORY[0x22766FA4C](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22162B488(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2556DBBC8);
    result = MEMORY[0x22766FA4C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

double UIColor.rgba.getter()
{
  void *v0;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = 0;
  v3 = 0;
  v4 = 0;
  v2 = 0;
  objc_msgSend(v0, sel_getRed_green_blue_alpha_, v5, &v4, &v3, &v2);
  return *(double *)v5;
}

id UIColor.argb.getter()
{
  void *v0;
  id result;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9[2];

  v9[1] = *(double *)MEMORY[0x24BDAC8D0];
  v9[0] = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  v6 = 0.0;
  result = objc_msgSend(v0, sel_getRed_green_blue_alpha_, v9, &v8, &v7, &v6);
  if ((_DWORD)result)
  {
    v2 = v7 * 255.0;
    if ((~COERCE__INT64(v7 * 255.0) & 0x7FF0000000000000) != 0)
    {
      if (v2 > -1.0)
      {
        if (v2 < 4294967300.0)
        {
          v3 = v8 * 255.0;
          if ((~COERCE__INT64(v8 * 255.0) & 0x7FF0000000000000) != 0)
          {
            if (v3 > -1.0)
            {
              if (v3 < 4294967300.0)
              {
                v4 = v9[0] * 255.0;
                if ((~COERCE__INT64(v9[0] * 255.0) & 0x7FF0000000000000) != 0)
                {
                  if (v4 > -1.0)
                  {
                    if (v4 < 4294967300.0)
                    {
                      v5 = v6 * 255.0;
                      if ((~COERCE__INT64(v6 * 255.0) & 0x7FF0000000000000) != 0)
                      {
                        if (v5 > -1.0)
                        {
                          if (v5 < 4294967300.0)
                            return (id)(v2 | (v3 << 8) | (v4 << 16) | (v5 << 24));
LABEL_27:
                          __break(1u);
                        }
LABEL_26:
                        __break(1u);
                        goto LABEL_27;
                      }
LABEL_25:
                      __break(1u);
                      goto LABEL_26;
                    }
LABEL_24:
                    __break(1u);
                    goto LABEL_25;
                  }
LABEL_23:
                  __break(1u);
                  goto LABEL_24;
                }
LABEL_22:
                __break(1u);
                goto LABEL_23;
              }
LABEL_21:
              __break(1u);
              goto LABEL_22;
            }
LABEL_20:
            __break(1u);
            goto LABEL_21;
          }
LABEL_19:
          __break(1u);
          goto LABEL_20;
        }
LABEL_18:
        __break(1u);
        goto LABEL_19;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_18;
  }
  return result;
}

UIColor __swiftcall UIColor.init(argb:)(Swift::UInt32 argb)
{
  return (UIColor)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRed_green_blue_alpha_, (double)BYTE2(argb) / 255.0, (double)BYTE1(argb) / 255.0, (double)argb / 255.0, (double)HIBYTE(argb) / 255.0);
}

id UIColor.bgra.getter()
{
  void *v0;
  id result;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9[2];

  v9[1] = *(double *)MEMORY[0x24BDAC8D0];
  v9[0] = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  v6 = 0.0;
  result = objc_msgSend(v0, sel_getRed_green_blue_alpha_, v9, &v8, &v7, &v6);
  if ((_DWORD)result)
  {
    v2 = v6 * 255.0;
    if ((~COERCE__INT64(v6 * 255.0) & 0x7FF0000000000000) != 0)
    {
      if (v2 > -1.0)
      {
        if (v2 < 4294967300.0)
        {
          v3 = v9[0] * 255.0;
          if ((~COERCE__INT64(v9[0] * 255.0) & 0x7FF0000000000000) != 0)
          {
            if (v3 > -1.0)
            {
              if (v3 < 4294967300.0)
              {
                v4 = v8 * 255.0;
                if ((~COERCE__INT64(v8 * 255.0) & 0x7FF0000000000000) != 0)
                {
                  if (v4 > -1.0)
                  {
                    if (v4 < 4294967300.0)
                    {
                      v5 = v7 * 255.0;
                      if ((~COERCE__INT64(v7 * 255.0) & 0x7FF0000000000000) != 0)
                      {
                        if (v5 > -1.0)
                        {
                          if (v5 < 4294967300.0)
                            return (id)(v2 | (v3 << 8) | (v4 << 16) | (v5 << 24));
LABEL_27:
                          __break(1u);
                        }
LABEL_26:
                        __break(1u);
                        goto LABEL_27;
                      }
LABEL_25:
                      __break(1u);
                      goto LABEL_26;
                    }
LABEL_24:
                    __break(1u);
                    goto LABEL_25;
                  }
LABEL_23:
                  __break(1u);
                  goto LABEL_24;
                }
LABEL_22:
                __break(1u);
                goto LABEL_23;
              }
LABEL_21:
              __break(1u);
              goto LABEL_22;
            }
LABEL_20:
            __break(1u);
            goto LABEL_21;
          }
LABEL_19:
          __break(1u);
          goto LABEL_20;
        }
LABEL_18:
        __break(1u);
        goto LABEL_19;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_18;
  }
  return result;
}

Swift::Bool __swiftcall UIColor.isClear()()
{
  void *v0;
  double v2;
  double v3;
  double v4;
  double v5[2];

  v5[1] = *(double *)MEMORY[0x24BDAC8D0];
  v5[0] = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v2 = 0.0;
  return !objc_msgSend(v0, sel_getRed_green_blue_alpha_, v5, &v4, &v3, &v2) || v5[0] + v4 + v3 + v2 == 0.0;
}

UIColor __swiftcall lerp(start:end:percent:)(UIColor start, UIColor end, Swift::Float percent)
{
  double v5;
  double v6;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15[2];

  v15[1] = *(double *)MEMORY[0x24BDAC8D0];
  v14 = 0.0;
  v15[0] = 0.0;
  v12 = 0;
  v13 = 0.0;
  -[objc_class getRed:green:blue:alpha:](start.super.isa, sel_getRed_green_blue_alpha_, v15, &v14, &v13, &v12);
  v10 = 0.0;
  v11 = 0.0;
  v8 = 0;
  v9 = 0.0;
  -[objc_class getRed:green:blue:alpha:](end.super.isa, sel_getRed_green_blue_alpha_, &v11, &v10, &v9, &v8);
  v5 = (float)(1.0 - percent);
  v6 = percent;
  return (UIColor)objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, v15[0] * v5 + v11 * percent, v14 * v5 + v10 * v6, v13 * v5 + v9 * v6, 1.0);
}

uint64_t sub_22162BADC(char a1, unsigned __int8 a2)
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  if (a1)
  {
    if (a1 == 1)
      v2 = 1684099177;
    else
      v2 = 1685016681;
    v3 = 0xE400000000000000;
    v4 = a2;
    if (a2)
    {
LABEL_6:
      if (v4 == 1)
        v5 = 1684099177;
      else
        v5 = 1685016681;
      v6 = 0xE400000000000000;
      if (v2 != v5)
        goto LABEL_15;
      goto LABEL_13;
    }
  }
  else
  {
    v3 = 0xE600000000000000;
    v2 = 0x656E6F685069;
    v4 = a2;
    if (a2)
      goto LABEL_6;
  }
  v6 = 0xE600000000000000;
  if (v2 != 0x656E6F685069)
  {
LABEL_15:
    v7 = sub_221653B04();
    goto LABEL_16;
  }
LABEL_13:
  if (v3 != v6)
    goto LABEL_15;
  v7 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_22162BBBC(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_22162BBF4(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_22162BC8C + 4 * byte_221659876[a2]))(0x7472617473);
}

uint64_t sub_22162BC8C(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x7472617473 && v1 == 0xE500000000000000)
    v2 = 1;
  else
    v2 = sub_221653B04();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

BOOL static UIDevice.isDeviceQualified(family:minVersion:)(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _BOOL8 result;
  char v14;

  if (qword_2556D8EF8 != -1)
    swift_once();
  if (static UIDevice.parsedDeviceIdentifier == 3)
    return 0;
  v6 = 1684099177;
  if (a1)
  {
    if (a1 == 1)
    {
      v7 = 0xE400000000000000;
      v8 = 1684099177;
    }
    else
    {
      v8 = 1685016681;
      v7 = 0xE400000000000000;
    }
  }
  else
  {
    v7 = 0xE600000000000000;
    v8 = 0x656E6F685069;
  }
  v10 = qword_2556E4630;
  v9 = qword_2556E4638;
  if (static UIDevice.parsedDeviceIdentifier != 1)
    v6 = 1685016681;
  if ((_BYTE)static UIDevice.parsedDeviceIdentifier)
    v11 = v6;
  else
    v11 = 0x656E6F685069;
  if ((_BYTE)static UIDevice.parsedDeviceIdentifier)
    v12 = 0xE400000000000000;
  else
    v12 = 0xE600000000000000;
  if (v8 == v11 && v7 == v12)
  {
    swift_bridgeObjectRelease_n();
    if (v10 < a2)
      return 0;
    return v9 >= a3;
  }
  v14 = sub_221653B04();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = 0;
  if ((v14 & 1) != 0 && v10 >= a2)
    return v9 >= a3;
  return result;
}

uint64_t static UIDevice.isIPad()()
{
  char v0;

  if (qword_2556D8EF8 != -1)
    swift_once();
  if (static UIDevice.parsedDeviceIdentifier == 3)
  {
    v0 = 0;
  }
  else
  {
    if (static UIDevice.parsedDeviceIdentifier == 1)
      v0 = 1;
    else
      v0 = sub_221653B04();
    swift_bridgeObjectRelease();
  }
  return v0 & 1;
}

void *static UIDevice.DeviceFamily.allCases.getter()
{
  return &unk_24E722CB0;
}

uint64_t UIDevice.DeviceFamily.rawValue.getter(char a1)
{
  if (!a1)
    return 0x656E6F685069;
  if (a1 == 1)
    return 1684099177;
  return 1685016681;
}

uint64_t sub_22162BFE0(char *a1, unsigned __int8 *a2)
{
  return sub_22162BADC(*a1, *a2);
}

uint64_t sub_22162BFEC()
{
  sub_221653B88();
  sub_2216531F8();
  swift_bridgeObjectRelease();
  return sub_221653BAC();
}

uint64_t sub_22162C07C()
{
  sub_2216531F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22162C0E8()
{
  sub_221653B88();
  sub_2216531F8();
  swift_bridgeObjectRelease();
  return sub_221653BAC();
}

uint64_t sub_22162C174@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _sSo8UIDeviceC17MeasureFoundationE12DeviceFamilyO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

void sub_22162C1A0(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  v2 = *v1;
  v3 = 0xE600000000000000;
  v4 = 1684099177;
  if (v2 != 1)
    v4 = 1685016681;
  v5 = v2 == 0;
  if (*v1)
    v6 = v4;
  else
    v6 = 0x656E6F685069;
  if (!v5)
    v3 = 0xE400000000000000;
  *a1 = v6;
  a1[1] = v3;
}

void sub_22162C1F0(_QWORD *a1@<X8>)
{
  *a1 = &unk_24E722CD8;
}

uint64_t sub_22162C200()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = sub_22162C224();
  static UIDevice.parsedDeviceIdentifier = result;
  qword_2556E4630 = v1;
  qword_2556E4638 = v2;
  return result;
}

uint64_t sub_22162C224()
{
  unsigned int v0;
  unint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  __int16 v18;
  char v19;
  char v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  __int16 v25;
  char v26;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[8];
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;

  if (qword_2556D8F00 != -1)
    swift_once();
  v0 = 0;
  v38 = static UIDevice.identifier;
  v39 = *(_QWORD *)algn_2556E4648;
  v36 = 0x656E6F685069;
  v37 = 0xE600000000000000;
  v1 = sub_2215C7D84();
  swift_bridgeObjectRetain();
  v2 = MEMORY[0x24BEE0D00];
  v3 = sub_221653750();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v3 & 1) == 0)
  {
    v0 = 1;
    v38 = static UIDevice.identifier;
    v39 = *(_QWORD *)algn_2556E4648;
    v36 = 1684099177;
    v37 = 0xE400000000000000;
    swift_bridgeObjectRetain();
    v4 = sub_221653750();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v4 & 1) == 0)
    {
      v0 = 2;
      v38 = static UIDevice.identifier;
      v39 = *(_QWORD *)algn_2556E4648;
      v36 = 1685016681;
      v37 = 0xE400000000000000;
      swift_bridgeObjectRetain();
      v5 = sub_221653750();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v5 & 1) == 0)
      {
        if (qword_2556D8F58 != -1)
          swift_once();
        v28 = qword_2556E4740;
        v29 = *(_QWORD *)algn_2556E4748;
        v38 = 0;
        v39 = 0xE000000000000000;
        sub_221653894();
        swift_bridgeObjectRelease();
        v30 = 0xD00000000000002DLL;
        v31 = "Failed to parse device family for identifier ";
        goto LABEL_29;
      }
    }
  }
  v38 = static UIDevice.identifier;
  v39 = *(_QWORD *)algn_2556E4648;
  v6 = 1685016681;
  if (v0 == 1)
    v6 = 1684099177;
  if (v0)
    v7 = v6;
  else
    v7 = 0x656E6F685069;
  if (v0)
    v8 = 0xE400000000000000;
  else
    v8 = 0xE600000000000000;
  v36 = v7;
  v37 = v8;
  v35[6] = 0;
  v35[7] = 0xE000000000000000;
  swift_bridgeObjectRetain();
  v35[3] = v1;
  v35[0] = v2;
  v35[1] = v1;
  v9 = sub_221653738();
  v11 = v10;
  swift_bridgeObjectRelease();
  v12 = swift_bridgeObjectRelease();
  v38 = 44;
  v39 = 0xE100000000000000;
  MEMORY[0x24BDAC7A8](v12);
  v35[2] = &v38;
  swift_bridgeObjectRetain();
  v13 = sub_22162CEDC(0x7FFFFFFFFFFFFFFFLL, 1, sub_22162E3F4, (uint64_t)v35, v9, v11);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)v13 + 2))
  {
    __break(1u);
    goto LABEL_34;
  }
  v14 = *((_QWORD *)v13 + 4);
  v15 = *((_QWORD *)v13 + 5);
  if (!((v15 ^ (unint64_t)v14) >> 14))
    goto LABEL_26;
  v17 = *((_QWORD *)v13 + 6);
  v16 = *((_QWORD *)v13 + 7);
  sub_22162DD04(*((_QWORD *)v13 + 4), *((_QWORD *)v13 + 5), v17, v16, 10);
  if ((v18 & 0x100) != 0)
  {
    swift_bridgeObjectRetain();
    sub_22162D2F4(v14, v15, v17, v16, 10);
    v20 = v19;
    swift_bridgeObjectRelease();
    if ((v20 & 1) != 0)
      goto LABEL_26;
  }
  else if ((v18 & 1) != 0)
  {
    goto LABEL_26;
  }
  if (*((_QWORD *)v13 + 2) < 2uLL)
  {
    __break(1u);
    goto LABEL_26;
  }
  v21 = *((_QWORD *)v13 + 8);
  v22 = *((_QWORD *)v13 + 9);
  v24 = *((_QWORD *)v13 + 10);
  v23 = *((_QWORD *)v13 + 11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (!((v22 ^ v21) >> 14))
  {
LABEL_26:
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  sub_22162DD04(v21, v22, v24, v23, 10);
  if ((v25 & 0x100) != 0)
    sub_22162D2F4(v21, v22, v24, v23, 10);
  v26 = v25;
  swift_bridgeObjectRelease();
  if ((v26 & 1) == 0)
    return v0;
LABEL_27:
  if (qword_2556D8F58 != -1)
LABEL_34:
    swift_once();
  v28 = qword_2556E4740;
  v29 = *(_QWORD *)algn_2556E4748;
  v38 = 0;
  v39 = 0xE000000000000000;
  sub_221653894();
  swift_bridgeObjectRelease();
  v30 = 0xD000000000000027;
  v31 = "Failed to parse version for identifier ";
LABEL_29:
  v38 = v30;
  v39 = (unint64_t)(v31 - 32) | 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_221653210();
  swift_bridgeObjectRelease();
  v32 = v38;
  v33 = v39;
  v34 = sub_221653624();
  _s17MeasureFoundation3LogV3log_4type9isPrivateySS_So03os_d1_E2_taSbtF_0(v32, v33, v34, 0, v28, v29);
  swift_bridgeObjectRelease();
  return 3;
}

uint64_t *UIDevice.identifier.unsafeMutableAddressor()
{
  if (qword_2556D8F00 != -1)
    swift_once();
  return &static UIDevice.identifier;
}

uint64_t *UIDevice.parsedDeviceIdentifier.unsafeMutableAddressor()
{
  if (qword_2556D8EF8 != -1)
    swift_once();
  return &static UIDevice.parsedDeviceIdentifier;
}

uint64_t static UIDevice.parsedDeviceIdentifier.getter()
{
  if (qword_2556D8EF8 != -1)
    swift_once();
  return static UIDevice.parsedDeviceIdentifier;
}

uint64_t sub_22162C858()
{
  uint64_t result;
  uint64_t v1;

  result = sub_22162C878();
  static UIDevice.identifier = result;
  *(_QWORD *)algn_2556E4648 = v1;
  return result;
}

uint64_t sub_22162C878()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  unsigned __int8 v31;
  utsname v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  _OWORD v36[2];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v0 = sub_221653BD0();
  v19 = *(_QWORD *)(v0 - 8);
  v20 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(&v32, 0x500uLL);
  uname(&v32);
  v23 = *(_OWORD *)&v32.machine[16];
  v24 = *(_OWORD *)v32.machine;
  v21 = *(_OWORD *)&v32.machine[48];
  v22 = *(_OWORD *)&v32.machine[32];
  v29 = *(_OWORD *)&v32.machine[80];
  v30 = *(_OWORD *)&v32.machine[64];
  v27 = *(_OWORD *)&v32.machine[112];
  v28 = *(_OWORD *)&v32.machine[96];
  v25 = *(_OWORD *)&v32.machine[144];
  v26 = *(_OWORD *)&v32.machine[128];
  *((_QWORD *)&v38 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_2556DDF70);
  v3 = (_OWORD *)swift_allocObject();
  *(_QWORD *)&v37 = v3;
  v4 = v23;
  v3[1] = v24;
  v3[2] = v4;
  v5 = v21;
  v3[3] = v22;
  v3[4] = v5;
  v6 = *(_OWORD *)&v32.machine[160];
  v7 = *(_OWORD *)&v32.machine[176];
  v8 = *(_OWORD *)&v32.machine[192];
  v9 = *(_OWORD *)&v32.machine[208];
  v10 = *(_OWORD *)&v32.machine[224];
  v11 = *(_OWORD *)&v32.machine[240];
  v12 = v29;
  v3[5] = v30;
  v3[6] = v12;
  v13 = v27;
  v3[7] = v28;
  v3[8] = v13;
  v14 = v25;
  v3[9] = v26;
  v3[10] = v14;
  v3[11] = v6;
  v3[12] = v7;
  v3[13] = v8;
  v3[14] = v9;
  v3[15] = v10;
  v3[16] = v11;
  sub_221653BB8();
  *(_QWORD *)&v30 = v2;
  *(_QWORD *)&v29 = sub_221653BC4();
  sub_221653954();
  sub_221653A20();
  if (*((_QWORD *)&v39 + 1))
  {
    v15 = 0;
    v16 = 0xE000000000000000;
    do
    {
      v35 = v37;
      v36[0] = v38;
      v36[1] = v39;
      v33 = v37;
      sub_2215D1ADC((uint64_t)v36, (uint64_t)&v34);
      if (swift_dynamicCast() && v31)
      {
        if ((v31 & 0x80) != 0)
          __break(1u);
        *(_QWORD *)&v33 = v31;
        MEMORY[0x22766E678](&v33, 1);
        *(_QWORD *)&v33 = v15;
        *((_QWORD *)&v33 + 1) = v16;
        swift_bridgeObjectRetain();
        sub_221653210();
        swift_bridgeObjectRelease();
        v17 = *((_QWORD *)&v33 + 1);
        v15 = v33;
      }
      else
      {
        swift_bridgeObjectRetain();
        v17 = v16;
      }
      sub_22162E3B4((uint64_t)&v35);
      swift_bridgeObjectRelease();
      sub_221653A20();
      v16 = v17;
    }
    while (*((_QWORD *)&v39 + 1));
  }
  else
  {
    v15 = 0;
  }
  swift_release();
  swift_release();
  (*(void (**)(_QWORD, uint64_t))(v19 + 8))(v30, v20);
  return v15;
}

uint64_t static UIDevice.identifier.getter()
{
  uint64_t v0;

  if (qword_2556D8F00 != -1)
    swift_once();
  v0 = static UIDevice.identifier;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static UIDevice.isIPhone()()
{
  int v0;
  char v1;
  char v2;

  if (qword_2556D8EF8 != -1)
    swift_once();
  v0 = static UIDevice.parsedDeviceIdentifier;
  if (static UIDevice.parsedDeviceIdentifier != 3)
  {
    if ((_BYTE)static UIDevice.parsedDeviceIdentifier)
    {
      v2 = sub_221653B04();
      swift_bridgeObjectRelease();
      if ((v2 & 1) != 0)
      {
        v1 = 1;
        return v1 & 1;
      }
      if (v0 == 2)
        v1 = 1;
      else
        v1 = sub_221653B04();
    }
    else
    {
      v1 = 1;
    }
    swift_bridgeObjectRelease();
    return v1 & 1;
  }
  v1 = 0;
  return v1 & 1;
}

BOOL static UIDevice.shouldLockFramerate()()
{
  if (qword_2556D8EF8 != -1)
    swift_once();
  if (static UIDevice.parsedDeviceIdentifier != 3)
  {
    if ((_BYTE)static UIDevice.parsedDeviceIdentifier)
    {
      if (static UIDevice.parsedDeviceIdentifier == 1)
      {
        if (qword_2556E4630 != 6)
        {
          if (qword_2556E4630 == 7)
            return (unint64_t)(qword_2556E4638 - 11) < 2;
          return 0;
        }
        return 1;
      }
    }
    else if (qword_2556E4630 == 8)
    {
      return 1;
    }
  }
  return 0;
}

BOOL static UIDevice.hasHWAcceleratedFeatureDetection()()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  _BOOL8 result;
  uint64_t v5;
  uint64_t v6;
  char v7;

  if (qword_2556D8EF8 != -1)
    swift_once();
  if (static UIDevice.parsedDeviceIdentifier == 3)
    return 0;
  v1 = qword_2556E4630;
  v0 = qword_2556E4638;
  if ((_BYTE)static UIDevice.parsedDeviceIdentifier)
  {
    v2 = sub_221653B04();
    swift_bridgeObjectRelease();
    if ((v2 & 1) != 0 && v1 >= 11 && v0 > 0)
      return 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    if (v1 >= 11 && v0 >= 1)
      return 1;
  }
  if (static UIDevice.parsedDeviceIdentifier == 3)
    return 0;
  v6 = qword_2556E4630;
  v5 = qword_2556E4638;
  if (static UIDevice.parsedDeviceIdentifier == 1)
  {
    swift_bridgeObjectRelease();
    if (v6 < 8)
      return 0;
    return v5 > 0;
  }
  v7 = sub_221653B04();
  swift_bridgeObjectRelease();
  result = 0;
  if ((v7 & 1) != 0 && v6 >= 8)
    return v5 > 0;
  return result;
}

char *sub_22162CEDC(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  unint64_t v44;
  _QWORD v46[4];

  v46[3] = a4;
  if (a1 < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v11 = a5;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = MEMORY[0x24BEE4AF8];
  v43 = swift_allocObject();
  *(_QWORD *)(v43 + 16) = 15;
  v15 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v16 = HIBYTE(a6) & 0xF) : (v16 = v11 & 0xFFFFFFFFFFFFLL), !v16))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v15 = v11 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((v11 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_22162DBF8(v30 | (v15 << 16), v43, a2 & 1, v14);
    swift_bridgeObjectRelease();
    v10 = *(char **)(v14 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_38;
  }
  v38 = a1;
  v39 = v14;
  v44 = 4 * v16;
  v10 = (char *)MEMORY[0x24BEE4AF8];
  v9 = 15;
  v8 = 15;
  v17 = 15;
  while (1)
  {
    v46[0] = sub_221653264();
    v46[1] = v18;
    v19 = a3(v46);
    if (v7)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v10;
    }
    v6 = v19;
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      break;
    v9 = sub_221653204();
LABEL_9:
    if (v44 == v9 >> 14)
      goto LABEL_29;
  }
  if (v8 >> 14 == v9 >> 14 && (a2 & 1) != 0)
  {
    v9 = sub_221653204();
    *(_QWORD *)(v43 + 16) = v9;
    v8 = v9;
    v17 = v9;
    goto LABEL_9;
  }
  if (v9 >> 14 < v8 >> 14)
  {
    __break(1u);
    goto LABEL_41;
  }
  v20 = sub_22165327C();
  v40 = v21;
  v41 = v20;
  v23 = v22;
  v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v10 = sub_2215D7444(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
  v27 = *((_QWORD *)v10 + 2);
  v26 = *((_QWORD *)v10 + 3);
  v6 = v27 + 1;
  if (v27 >= v26 >> 1)
    v10 = sub_2215D7444((char *)(v26 > 1), v27 + 1, 1, v10);
  *((_QWORD *)v10 + 2) = v6;
  v28 = &v10[32 * v27];
  *((_QWORD *)v28 + 4) = v41;
  *((_QWORD *)v28 + 5) = v23;
  *((_QWORD *)v28 + 6) = v25;
  *((_QWORD *)v28 + 7) = v40;
  *(_QWORD *)(v39 + 16) = v10;
  v29 = sub_221653204();
  v9 = v29;
  *(_QWORD *)(v43 + 16) = v29;
  if (*((_QWORD *)v10 + 2) != v38)
  {
    v8 = v29;
    v17 = v29;
    goto LABEL_9;
  }
  v17 = v29;
  v8 = v29;
LABEL_29:
  if (v44 == v8 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  if (v44 >= v17 >> 14)
  {
    v6 = sub_22165327C();
    v8 = v31;
    v9 = v32;
    v11 = v33;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      goto LABEL_43;
    goto LABEL_34;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  v10 = sub_2215D7444(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
LABEL_34:
  v35 = *((_QWORD *)v10 + 2);
  v34 = *((_QWORD *)v10 + 3);
  if (v35 >= v34 >> 1)
    v10 = sub_2215D7444((char *)(v34 > 1), v35 + 1, 1, v10);
  *((_QWORD *)v10 + 2) = v35 + 1;
  v36 = &v10[32 * v35];
  *((_QWORD *)v36 + 4) = v6;
  *((_QWORD *)v36 + 5) = v8;
  *((_QWORD *)v36 + 6) = v9;
  *((_QWORD *)v36 + 7) = v11;
  *(_QWORD *)(v39 + 16) = v10;
LABEL_37:
  swift_bridgeObjectRetain();
  swift_release();
LABEL_38:
  swift_release();
  return v10;
}

unsigned __int8 *sub_22162D2F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  sub_22162E448();
  swift_bridgeObjectRetain();
  v7 = sub_221653270();
  v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v10 = HIBYTE(v8) & 0xF;
    v15 = v7;
    v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  v7 = sub_22162D660();
  v12 = v11;
  swift_bridgeObjectRelease();
  v8 = v12;
  if ((v12 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = (unsigned __int8 *)sub_2216538D0();
  }
LABEL_7:
  v13 = sub_22162D3E4(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13;
}

unsigned __int8 *sub_22162D3E4(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 *v19;
  unsigned int v20;
  char v21;
  uint64_t v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  v13 = 0;
                  if (v11 < 0x61 || v11 >= v8)
                    return (unsigned __int8 *)v13;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v14 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v14 - (v11 + v12);
              if (__OFSUB__(v14, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_66;
    }
    if (a2)
    {
      v23 = a3 + 48;
      v24 = a3 + 55;
      v25 = a3 + 87;
      if (a3 > 10)
      {
        v23 = 58;
      }
      else
      {
        v25 = 97;
        v24 = 65;
      }
      if (result)
      {
        v26 = 0;
        do
        {
          v27 = *result;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              v13 = 0;
              if (v27 < 0x61 || v27 >= v25)
                return (unsigned __int8 *)v13;
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          v29 = v26 * a3;
          if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63)
            return 0;
          v26 = v29 + (v27 + v28);
          if (__OFADD__(v29, (v27 + v28)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v29 + (v27 + v28));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  v15 = a2 - 1;
  if (a2 == 1)
    return 0;
  v16 = a3 + 48;
  v17 = a3 + 55;
  v18 = a3 + 87;
  if (a3 > 10)
  {
    v16 = 58;
  }
  else
  {
    v18 = 97;
    v17 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v19 = result + 1;
  do
  {
    v20 = *v19;
    if (v20 < 0x30 || v20 >= v16)
    {
      if (v20 < 0x41 || v20 >= v17)
      {
        v13 = 0;
        if (v20 < 0x61 || v20 >= v18)
          return (unsigned __int8 *)v13;
        v21 = -87;
      }
      else
      {
        v21 = -55;
      }
    }
    else
    {
      v21 = -48;
    }
    v22 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v22 + (v20 + v21);
    if (__OFADD__(v22, (v20 + v21)))
      return 0;
    ++v19;
    --v15;
  }
  while (v15);
  return (unsigned __int8 *)v9;
}

uint64_t sub_22162D660()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_22165327C();
  v4 = sub_22162D6DC(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_22162D6DC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_22162D820(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_22162D90C(v9, 0);
      v12 = sub_22162D970((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x22766E678](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x22766E678);
LABEL_9:
      sub_2216538D0();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x22766E678]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_22162D820(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_22162DB80(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_22162DB80(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_221653234();
  }
  __break(1u);
  return result;
}

_QWORD *sub_22162D90C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DDF88);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_22162D970(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_22162DB80(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_221653240();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_2216538D0();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_22162DB80(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_22165321C();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_22162DB80(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_22165324C();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x22766E6B4](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_22162DBF8(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  char *v18;

  v10 = *(_QWORD *)(a2 + 16) >> 14;
  v11 = (v10 == a1 >> 14) & a3;
  if (v11 == 1)
    return v11 ^ 1u;
  if (a1 >> 14 < v10)
  {
    __break(1u);
    goto LABEL_9;
  }
  v4 = a4;
  v5 = sub_22165327C();
  v6 = v12;
  v7 = v13;
  v8 = v14;
  v9 = *(char **)(v4 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v4 + 16) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_9:
    v9 = sub_2215D7444(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
    *(_QWORD *)(v4 + 16) = v9;
  }
  v17 = *((_QWORD *)v9 + 2);
  v16 = *((_QWORD *)v9 + 3);
  if (v17 >= v16 >> 1)
  {
    v9 = sub_2215D7444((char *)(v16 > 1), v17 + 1, 1, v9);
    *(_QWORD *)(v4 + 16) = v9;
  }
  *((_QWORD *)v9 + 2) = v17 + 1;
  v18 = &v9[32 * v17];
  *((_QWORD *)v18 + 4) = v5;
  *((_QWORD *)v18 + 5) = v6;
  *((_QWORD *)v18 + 6) = v7;
  *((_QWORD *)v18 + 7) = v8;
  return v11 ^ 1u;
}

uint64_t sub_22162DD04(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t result;
  char v13;
  _QWORD v14[2];
  char v15;

  if ((a4 & 0x1000000000000000) != 0)
  {
    result = 0;
    goto LABEL_8;
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    v11 = v14;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    v11 = (_QWORD *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    v11 = (_QWORD *)sub_2216538D0();
  }
  result = sub_22162DDD4((uint64_t)v11, a1, a2, a3, a4, a5);
  if (!v5)
  {
    v15 = v13 & 1;
LABEL_8:
    LOBYTE(v14[0]) = (a4 & 0x1000000000000000) != 0;
  }
  return result;
}

uint64_t sub_22162DDD4(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unsigned __int8 *v19;
  int v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  uint64_t v24;
  unsigned __int8 *v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 *v34;
  uint64_t v35;
  unsigned int v36;
  char v37;
  uint64_t v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  uint64_t v42;
  unsigned int v43;
  char v44;
  uint64_t v45;

  v10 = a2;
  v11 = result;
  v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0)
    LOBYTE(v12) = 1;
  v13 = 4 << v12;
  v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    result = sub_22162DB80(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      v15 = a2 >> 16;
      if (v14 != v13)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0)
    v16 = HIBYTE(a5) & 0xF;
  if (v16 < a2 >> 16)
    goto LABEL_95;
  result = sub_221653234();
  v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    result = sub_22162DB80(v10, a4, a5);
    v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    result = sub_22162DB80(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0)
      goto LABEL_8;
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0)
    v17 = a4 & 0xFFFFFFFFFFFFLL;
  if (v17 < v10 >> 16)
    goto LABEL_91;
  if (v17 < a3 >> 16)
  {
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  result = sub_221653234();
LABEL_21:
  v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_90;
  }
  if (v18 < v15)
  {
LABEL_90:
    __break(1u);
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11)
    v19 = 0;
  v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        v31 = a6 + 48;
        v32 = a6 + 55;
        v33 = a6 + 87;
        if (a6 > 10)
        {
          v31 = 58;
        }
        else
        {
          v33 = 97;
          v32 = 65;
        }
        if (v19)
        {
          v24 = 0;
          v34 = v19 + 1;
          v35 = result - 1;
          do
          {
            v36 = *v34;
            if (v36 < 0x30 || v36 >= v31)
            {
              if (v36 < 0x41 || v36 >= v32)
              {
                v29 = 0;
                if (v36 < 0x61 || v36 >= v33)
                  return v29;
                v37 = -87;
              }
              else
              {
                v37 = -55;
              }
            }
            else
            {
              v37 = -48;
            }
            v38 = v24 * a6;
            if ((unsigned __int128)(v24 * (__int128)a6) >> 64 != (v24 * a6) >> 63)
              return 0;
            v24 = v38 + (v36 + v37);
            if (__OFADD__(v38, (v36 + v37)))
              return 0;
            ++v34;
            --v35;
          }
          while (v35);
          return v24;
        }
        return 0;
      }
      return 0;
    }
    goto LABEL_94;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      v39 = a6 + 48;
      v40 = a6 + 55;
      v41 = a6 + 87;
      if (a6 > 10)
      {
        v39 = 58;
      }
      else
      {
        v41 = 97;
        v40 = 65;
      }
      if (v19)
      {
        v42 = 0;
        do
        {
          v43 = *v19;
          if (v43 < 0x30 || v43 >= v39)
          {
            if (v43 < 0x41 || v43 >= v40)
            {
              v29 = 0;
              if (v43 < 0x61 || v43 >= v41)
                return v29;
              v44 = -87;
            }
            else
            {
              v44 = -55;
            }
          }
          else
          {
            v44 = -48;
          }
          v45 = v42 * a6;
          if ((unsigned __int128)(v42 * (__int128)a6) >> 64 != (v42 * a6) >> 63)
            return 0;
          v42 = v45 + (v43 + v44);
          if (__OFADD__(v45, (v43 + v44)))
            return 0;
          ++v19;
          --result;
        }
        while (result);
        return v45 + (v43 + v44);
      }
      return 0;
    }
    return 0;
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      v21 = a6 + 48;
      v22 = a6 + 55;
      v23 = a6 + 87;
      if (a6 > 10)
      {
        v21 = 58;
      }
      else
      {
        v23 = 97;
        v22 = 65;
      }
      if (v19)
      {
        v24 = 0;
        v25 = v19 + 1;
        v26 = result - 1;
        while (1)
        {
          v27 = *v25;
          if (v27 < 0x30 || v27 >= v21)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              v29 = 0;
              if (v27 < 0x61 || v27 >= v23)
                return v29;
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          v30 = v24 * a6;
          if ((unsigned __int128)(v24 * (__int128)a6) >> 64 != (v24 * a6) >> 63)
            return 0;
          v24 = v30 - (v27 + v28);
          if (__OFSUB__(v30, (v27 + v28)))
            return 0;
          ++v25;
          if (!--v26)
            return v24;
        }
      }
      return 0;
    }
    return 0;
  }
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
  return result;
}

uint64_t _sSo8UIDeviceC17MeasureFoundationE12DeviceFamilyO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_221653A38();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

unint64_t sub_22162E244()
{
  unint64_t result;

  result = qword_2556DDF58;
  if (!qword_2556DDF58)
  {
    result = MEMORY[0x22766FA4C](&protocol conformance descriptor for UIDevice.DeviceFamily, &type metadata for UIDevice.DeviceFamily);
    atomic_store(result, (unint64_t *)&qword_2556DDF58);
  }
  return result;
}

unint64_t sub_22162E28C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2556DDF60;
  if (!qword_2556DDF60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2556DDF68);
    result = MEMORY[0x22766FA4C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2556DDF60);
  }
  return result;
}

uint64_t _s12DeviceFamilyOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_22162E324 + 4 * byte_221659881[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22162E358 + 4 * byte_22165987C[v4]))();
}

uint64_t sub_22162E358(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22162E360(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22162E368);
  return result;
}

uint64_t sub_22162E374(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22162E37CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22162E380(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22162E388(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UIDevice.DeviceFamily()
{
  return &type metadata for UIDevice.DeviceFamily;
}

uint64_t sub_22162E3A4()
{
  return swift_deallocObject();
}

uint64_t sub_22162E3B4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2556DDF78);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22162E3F4(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return sub_221653B04() & 1;
}

unint64_t sub_22162E448()
{
  unint64_t result;

  result = qword_2556DDF80;
  if (!qword_2556DDF80)
  {
    result = MEMORY[0x22766FA4C](MEMORY[0x24BEE1E20], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_2556DDF80);
  }
  return result;
}

uint64_t sub_22162E48C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_22162E4B0()
{
  return swift_deallocObject();
}

UIImage_optional __swiftcall UIImage.init(color:size:)(UIColor color, CGSize size)
{
  CGFloat height;
  CGFloat width;
  UIImage *v5;
  CGImage *v6;
  CGImage *v7;
  objc_class *v8;
  Swift::Bool v9;
  objc_class *v10;
  UIImage_optional result;
  CGRect v12;

  height = size.height;
  width = size.width;
  UIGraphicsBeginImageContextWithOptions(size, 0, 0.0);
  -[objc_class setFill](color.super.isa, sel_setFill);
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v12.size.width = width;
  v12.size.height = height;
  UIRectFill(v12);
  v5 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  if (!v5)
    goto LABEL_5;
  v6 = -[UIImage CGImage](v5, sel_CGImage);
  if (!v6)
  {

LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v7 = v6;
  v8 = (objc_class *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCGImage_, v6);

LABEL_6:
  v10 = v8;
  result.value.super.isa = v10;
  result.is_nil = v9;
  return result;
}

id sub_22162E59C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBF648]), sel_init);
  qword_2556DDF90 = (uint64_t)result;
  return result;
}

UIImage_optional __swiftcall UIImage.rotated(to:)(UIDeviceOrientation to)
{
  id v1;
  id v2;
  Swift::Bool v3;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  objc_class *v14;
  UIImage_optional result;

  if (to != UIDeviceOrientationPortrait)
  {
    v5 = objc_msgSend(v1, sel_CGImage);
    if (v5)
    {
      v6 = v5;
      if ((unint64_t)(to - 2) > 2)
        v7 = 1;
      else
        v7 = dword_221659980[to - 2];
      v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBF660]), sel_initWithCGImage_, v5);
      v9 = objc_msgSend(v8, sel_imageByApplyingCGOrientation_, v7);

      if (qword_2556D8F08 != -1)
        swift_once();
      v10 = (void *)qword_2556DDF90;
      objc_msgSend(v9, sel_extent);
      v11 = objc_msgSend(v10, sel_createCGImage_fromRect_, v9);
      if (v11)
      {
        v12 = v11;
        objc_msgSend(v1, sel_scale);
        v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_initWithCGImage_scale_orientation_, v12, 0, v13);

        goto LABEL_13;
      }

    }
    v1 = 0;
    goto LABEL_13;
  }
  v2 = v1;
LABEL_13:
  v14 = (objc_class *)v1;
  result.value.super.isa = v14;
  result.is_nil = v3;
  return result;
}

uint64_t static NSUserDefaults.observe(observer:keys:)(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  void *ObjCClassFromMetadata;
  uint64_t v6;
  id v7;
  void *v8;

  v2 = *(_QWORD *)(a2 + 16);
  if (v2)
  {
    v4 = result;
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    swift_bridgeObjectRetain();
    v6 = a2 + 40;
    do
    {
      swift_bridgeObjectRetain();
      v7 = objc_msgSend(ObjCClassFromMetadata, sel_standardUserDefaults);
      v8 = (void *)sub_22165318C();
      swift_bridgeObjectRelease();
      objc_msgSend(v7, sel_addObserver_forKeyPath_options_context_, v4, v8, 1, 0);

      v6 += 16;
      --v2;
    }
    while (v2);
    return swift_bridgeObjectRelease();
  }
  return result;
}

id static NSUserDefaults.update<A>(_:key:feature:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v25 = a4;
  v27 = a1;
  v28 = *(_QWORD *)(a6 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = sub_221653714();
  v23 = *(_QWORD *)(v8 - 8);
  v24 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v23 - v10;
  v12 = *(_QWORD *)(a5 - 8);
  v13 = MEMORY[0x24BDAC7A8](v9);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v16 = MEMORY[0x24BDAC7A8](v13);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v23 - v17;
  v19 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_standardUserDefaults);
  v20 = (void *)sub_22165318C();
  v21 = objc_msgSend(v19, sel_BOOLForKey_, v20);

  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v25, a5);
  swift_dynamicCast();
  if ((_DWORD)v21)
  {
    sub_221653780();
  }
  else
  {
    sub_22165378C();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v24);
  }
  (*(void (**)(char *, uint64_t))(v26 + 8))(v18, AssociatedTypeWitness);
  return v21;
}

uint64_t static NSUserDefaults.createOptionSet<A>(keyForFeature:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t TupleTypeMetadata2;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t result;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  unint64_t v37;
  int64_t v38;
  int64_t v39;
  id v40;
  void *v41;
  unsigned int v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  int64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int64_t v59;

  v7 = *(_QWORD *)(a3 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v51 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v52 = AssociatedTypeWitness;
  v9 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v50 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v49 = (char *)&v45 - v12;
  v13 = *(_QWORD *)(a2 - 8);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v48 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v45 - v16;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v19 = sub_221653714();
  v57 = *(_QWORD *)(v19 - 8);
  v58 = v19;
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v45 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v45 - v23;
  v53 = v7;
  swift_getAssociatedTypeWitness();
  sub_221653384();
  v54 = a4;
  sub_221653AD4();
  v25 = *(_QWORD *)(a1 + 64);
  v47 = a1 + 64;
  v26 = 1 << *(_BYTE *)(a1 + 32);
  v27 = -1;
  if (v26 < 64)
    v27 = ~(-1 << v26);
  v28 = v27 & v25;
  v55 = (unint64_t)(v26 + 63) >> 6;
  v56 = a1;
  v46 = v55 - 1;
  result = swift_bridgeObjectRetain();
  v59 = 0;
  while (1)
  {
    if (v28)
    {
      v30 = __clz(__rbit64(v28));
      v28 &= v28 - 1;
      v31 = v30 | (v59 << 6);
      goto LABEL_7;
    }
    v36 = v59 + 1;
    if (__OFADD__(v59, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v36 < v55)
    {
      v37 = *(_QWORD *)(v47 + 8 * v36);
      if (v37)
        goto LABEL_11;
      v38 = v59 + 2;
      ++v59;
      if (v36 + 1 < v55)
      {
        v37 = *(_QWORD *)(v47 + 8 * v38);
        if (v37)
        {
          ++v36;
          goto LABEL_11;
        }
        v39 = v36 + 2;
        v59 = v36 + 1;
        if (v36 + 2 < v55)
          break;
      }
    }
LABEL_23:
    v35 = *(_QWORD *)(TupleTypeMetadata2 - 8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56))(v22, 1, 1, TupleTypeMetadata2);
    v28 = 0;
LABEL_24:
    (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v24, v22, v58);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v24, 1, TupleTypeMetadata2) == 1)
      return swift_release();
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v17, &v24[*(int *)(TupleTypeMetadata2 + 48)], a2);
    v40 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_standardUserDefaults);
    v41 = (void *)sub_22165318C();
    swift_bridgeObjectRelease();
    v42 = objc_msgSend(v40, sel_BOOLForKey_, v41);

    if (v42)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v48, v17, a2);
      v43 = v52;
      swift_dynamicCast();
      v44 = v49;
      sub_221653780();
      (*(void (**)(char *, uint64_t))(v51 + 8))(v44, v43);
    }
    result = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v17, a2);
  }
  v37 = *(_QWORD *)(v47 + 8 * v39);
  if (v37)
  {
    v36 += 2;
LABEL_11:
    v28 = (v37 - 1) & v37;
    v31 = __clz(__rbit64(v37)) + (v36 << 6);
    v59 = v36;
LABEL_7:
    v32 = *(_QWORD *)(v56 + 56);
    v33 = (_QWORD *)(*(_QWORD *)(v56 + 48) + 16 * v31);
    v34 = v33[1];
    *(_QWORD *)v22 = *v33;
    *((_QWORD *)v22 + 1) = v34;
    (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(&v22[*(int *)(TupleTypeMetadata2 + 48)], v32 + *(_QWORD *)(v13 + 72) * v31, a2);
    v35 = *(_QWORD *)(TupleTypeMetadata2 - 8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v22, 0, 1, TupleTypeMetadata2);
    swift_bridgeObjectRetain();
    goto LABEL_24;
  }
  while (1)
  {
    v36 = v39 + 1;
    if (__OFADD__(v39, 1))
      break;
    if (v36 >= v55)
    {
      v59 = v46;
      goto LABEL_23;
    }
    v37 = *(_QWORD *)(v47 + 8 * v36);
    ++v39;
    if (v37)
      goto LABEL_11;
  }
LABEL_29:
  __break(1u);
  return result;
}

unint64_t sub_22162EEFC()
{
  id v0;
  void *v1;
  id v2;
  unint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_integerForKey_, v1);

  result = _s17MeasureFoundation18RecordReplayOptionO8rawValueACSgSi_tcfC_0((unint64_t)v2);
  if (result == 5)
    __break(1u);
  else
    static NSUserDefaults.recordReplayOption = result;
  return result;
}

char *NSUserDefaults.recordReplayOption.unsafeMutableAddressor()
{
  if (qword_2556D8F10 != -1)
    swift_once();
  return &static NSUserDefaults.recordReplayOption;
}

uint64_t static NSUserDefaults.recordReplayOption.getter()
{
  if (qword_2556D8F10 != -1)
    swift_once();
  return static NSUserDefaults.recordReplayOption;
}

size_t static vImage_Buffer.make(width:height:rowBytes:allocating:)(size_t result, uint64_t a2, int64_t a3, char a4, char a5)
{
  if ((a4 & 1) != 0 && (a3 = result, (result & 0x8000000000000000) != 0))
  {
    __break(1u);
  }
  else
  {
    if ((a5 & 1) == 0)
      return 0;
    if ((a2 & 0x8000000000000000) == 0)
    {
      result = a2 * a3;
      if ((unsigned __int128)(a2 * (__int128)a3) >> 64 == (a2 * a3) >> 63)
        return (size_t)malloc(result);
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_10:
  __break(1u);
  return result;
}

{
  if (((a2 | result) & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a4 & 1) != 0)
      a3 = result;
    if ((a5 & 1) == 0)
      return 0;
    result = a2 * a3;
    if ((unsigned __int128)(a2 * (__int128)a3) >> 64 == (a2 * a3) >> 63)
      return (size_t)malloc(result);
  }
  __break(1u);
  return result;
}

uint64_t static vImage_Buffer.wrap(pixelBuffer:planeIndex:srcRect:)@<X0>(__CVBuffer *a1@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  _BYTE v6[40];

  sub_221630A78(a1, a2, a3, (uint64_t)v6);
  return sub_2215C6540((uint64_t)v6, a4, &qword_2556D9F40);
}

Swift::Void __swiftcall vImage_Buffer.deallocate()()
{
  _QWORD *v0;

  if (!*v0)
    __break(1u);
  JUMPOUT(0x22766FAF4);
}

uint64_t static vImage_Buffer.makeKernel(width:height:value:)(uint64_t result, uint64_t a2, char a3, unsigned int a4)
{
  unint64_t v5;
  _WORD *v7;
  unint64_t v8;
  int16x8_t v9;
  int16x8_t *v10;
  unint64_t v11;
  unint64_t v12;

  if ((a3 & 1) != 0)
    a2 = result;
  v5 = result * a2;
  if ((unsigned __int128)(result * (__int128)a2) >> 64 != (result * a2) >> 63)
  {
    __break(1u);
    goto LABEL_17;
  }
  if ((v5 & 0x8000000000000000) != 0)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  if (!v5)
    return MEMORY[0x24BEE4AF8];
  result = sub_221653390();
  *(_QWORD *)(result + 16) = v5;
  v7 = (_WORD *)(result + 32);
  if (v5 < 0x10)
  {
    v8 = 0;
LABEL_13:
    v12 = v5 - v8;
    do
    {
      *v7++ = a4;
      --v12;
    }
    while (v12);
    return result;
  }
  v8 = v5 & 0xFFFFFFFFFFFFFFF0;
  v7 += v5 & 0xFFFFFFFFFFFFFFF0;
  v9 = vdupq_n_s16(a4);
  v10 = (int16x8_t *)(result + 48);
  v11 = v5 & 0xFFFFFFFFFFFFFFF0;
  do
  {
    v10[-1] = v9;
    *v10 = v9;
    v10 += 2;
    v11 -= 16;
  }
  while (v11);
  if (v5 != v8)
    goto LABEL_13;
  return result;
}

void *static vImage_Buffer.makeTempBufferForConvolvePlanar8(srcImageBuffer:kernel:kernelWidth:kernelHeight:divisor:flags:)(void *a1, vImagePixelCount a2, vImagePixelCount a3, size_t a4, uint64_t a5, uint64_t kernel_width, uint64_t a7, char a8, int32_t divisor, uint64_t a10)
{
  vImage_Error v10;
  vImage_Buffer dest;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if ((a8 & 1) != 0)
    a7 = kernel_width;
  dest.data = a1;
  dest.height = a2;
  dest.width = a3;
  dest.rowBytes = a4;
  if (a7 > 0xFFFFFFFFLL)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (kernel_width > 0xFFFFFFFFLL)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if ((a10 | kernel_width | a7) < 0)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
  }
  if ((a10 | 0x80) > 0xFFFFFFFFLL)
    goto LABEL_14;
  v10 = vImageConvolve_Planar8(&dest, &dest, 0, 0, 0, (const int16_t *)(a5 + 32), a7, kernel_width, divisor, 0, a10 | 0x80);
  if (v10 < 1)
    return 0;
  else
    return malloc(v10);
}

uint64_t static vImage_Buffer.scalePlanar8(srcImageBuffer:dstImageBuffer:dstRect:flags:tempBuffer:)@<X0>(void *a1@<X0>, vImagePixelCount a2@<X1>, vImagePixelCount a3@<X2>, size_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, size_t a8@<X7>, uint64_t a9@<X8>, CGFloat a10@<D0>, CGFloat a11@<D1>, CGFloat a12@<D2>, CGFloat a13@<D3>, unint64_t flags, void *a15)
{
  _BYTE v17[40];

  sub_221630E94(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)v17, a10, a11, a12, a13, flags, a15);
  return sub_2215C6540((uint64_t)v17, a9, &qword_2556D9F40);
}

uint64_t static vImage_Buffer.scalePlanar8(srcImageBuffer:dstImageBuffer:scaleFactor:flags:tempBuffer:)@<X0>(void *a1@<X0>, vImagePixelCount a2@<X1>, int64_t a3@<X2>, int64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, void *a7@<X6>, uint64_t a8@<X8>, float a9@<S0>)
{
  _BYTE v11[40];

  sub_221631194(a1, a2, a3, a4, a5, a6, a7, (uint64_t)v11, a9);
  return sub_2215C6540((uint64_t)v11, a8, &qword_2556D9F40);
}

void static vImage_Buffer.wrap(srcImageBuffer:srcRect:srcBytesPerPixel:)(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_2216314B4(a1, a8, a9, a2, a3, a4, a5);
}

CGSize __swiftcall vImage_Buffer.getSize()()
{
  unint64_t v0;
  unint64_t v1;
  double v2;
  double v3;
  CGSize result;

  v2 = (double)v1;
  v3 = (double)v0;
  result.height = v3;
  result.width = v2;
  return result;
}

void *vImage_Buffer.fill(value:)(void *__c)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(v1 + 8);
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    v3 = *(_QWORD *)(v1 + 24);
    if ((unsigned __int128)(v3 * (__int128)v2) >> 64 == (v3 * v2) >> 63)
    {
      v4 = *(void **)v1;
      memset(*(void **)v1, (int)__c, v3 * v2);
      return v4;
    }
  }
  __break(1u);
  return __c;
}

const void *vImage_Buffer.clone()(const void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  size_t v4;
  const void *v5;
  void *v6;

  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = a2 * a4;
    if ((unsigned __int128)(a2 * (__int128)a4) >> 64 == (a2 * a4) >> 63)
    {
      v5 = result;
      v6 = malloc(a2 * a4);
      memcpy(v6, v5, v4);
      return v6;
    }
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall vImage_Buffer.printPixels(prefix:offsetValue:)(Swift::String prefix, Swift::Int offsetValue)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Swift::Int v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v20 = v3;
  if (v3)
  {
    v6 = v5;
    if ((v5 & 0x8000000000000000) == 0)
    {
      v7 = v4;
      v8 = v2;
      v21 = 0;
      v10 = 0;
      v11 = 0;
      v12 = MEMORY[0x24BEE1768];
      v13 = MEMORY[0x24BEE17F0];
      v18 = v4;
      v19 = v5;
      while (is_mul_ok(v11, v6))
      {
        if ((v10 & 1) != 0)
          swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        if (v7)
        {
          v14 = v21;
          while ((v14 & 0x8000000000000000) == 0)
          {
            v15 = *(unsigned __int8 *)(v8 + v14);
            v16 = v15 + offsetValue;
            if (__OFADD__(v15, offsetValue))
              goto LABEL_17;
            __swift_instantiateConcreteTypeFromMangledName(&qword_2556D9988);
            v17 = swift_allocObject();
            *(_OWORD *)(v17 + 16) = xmmword_2216560E0;
            *(_QWORD *)(v17 + 56) = v12;
            *(_QWORD *)(v17 + 64) = v13;
            *(_QWORD *)(v17 + 32) = v16;
            sub_2216531BC();
            sub_221653210();
            swift_bridgeObjectRelease();
            ++v14;
            if (!--v7)
            {
              v7 = v18;
              v6 = v19;
              goto LABEL_4;
            }
          }
          __break(1u);
LABEL_17:
          __break(1u);
          break;
        }
LABEL_4:
        ++v11;
        swift_bridgeObjectRetain();
        sub_221652FDC();
        swift_bridgeObjectRelease();
        v21 += v6;
        v10 = 1;
        if (v11 == v20)
        {
          swift_bridgeObjectRelease();
          return;
        }
      }
      __break(1u);
    }
    __break(1u);
  }
}

char *vImage_Buffer.draw(onto:offsetX:offsetY:bytesPerPixel:)(char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v13;
  BOOL v14;
  char *v15;
  size_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v22;

  v22 = result;
  if (a9)
  {
    v13 = 0;
    v14 = (unsigned __int128)(a5 * (__int128)a7) >> 64 != (a5 * a7) >> 63;
    v15 = &result[a5 * a7];
    v16 = a10 * a7;
    v17 = (unsigned __int128)(a10 * (__int128)a7) >> 64 != (a10 * a7) >> 63;
    while (v22)
    {
      if (v13 == 0x8000000000000000)
      {
        __break(1u);
LABEL_15:
        __break(1u);
LABEL_16:
        __break(1u);
LABEL_17:
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
        break;
      }
      v18 = v13 + a6;
      if (__OFADD__(v13, a6))
        goto LABEL_15;
      v19 = v18 * a4;
      if ((unsigned __int128)(v18 * (__int128)a4) >> 64 != (v18 * a4) >> 63)
        goto LABEL_16;
      if (v14)
        goto LABEL_17;
      if (!a8)
        goto LABEL_22;
      v20 = v13 * a11;
      if ((unsigned __int128)(v13 * (__int128)a11) >> 64 != (v13 * a11) >> 63)
        goto LABEL_18;
      if (a10 < 0)
        goto LABEL_19;
      if (v17)
        goto LABEL_20;
      ++v13;
      result = (char *)memcpy(&v15[v19], (const void *)(a8 + v20), v16);
      if (a9 == v13)
        return result;
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  return result;
}

void vImage_Buffer.draw(onto:within:bytesPerPixel:)(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  double Width;
  uint64_t v24;
  double Height;
  uint64_t v26;
  uint64_t v27;
  double MinY;
  uint64_t v29;
  uint64_t v30;
  double MinX;
  uint64_t v32;
  uint64_t v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  if (a12 < 0)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  Width = CGRectGetWidth(*(CGRect *)&a2);
  if ((~*(_QWORD *)&Width & 0x7FF0000000000000) == 0)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (Width <= -9.22337204e18)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  if (Width >= 9.22337204e18)
  {
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  if ((uint64_t)Width >= a12)
    v24 = a12;
  else
    v24 = (uint64_t)Width;
  if (a11 < 0)
    goto LABEL_50;
  v34.origin.x = a2;
  v34.origin.y = a3;
  v34.size.width = a4;
  v34.size.height = a5;
  Height = CGRectGetHeight(v34);
  if ((~*(_QWORD *)&Height & 0x7FF0000000000000) == 0)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  if (Height <= -9.22337204e18)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  if (Height < 9.22337204e18)
  {
    if ((uint64_t)Height >= a11)
      v26 = a11;
    else
      v26 = (uint64_t)Height;
    if (v26 < 0)
      goto LABEL_54;
    if (!v26)
      return;
    v27 = 0;
    while (v26 != v27)
    {
      if (!a1)
        goto LABEL_55;
      v35.origin.x = a2;
      v35.origin.y = a3;
      v35.size.width = a4;
      v35.size.height = a5;
      MinY = CGRectGetMinY(v35);
      if ((~*(_QWORD *)&MinY & 0x7FF0000000000000) == 0)
        goto LABEL_35;
      if (MinY <= -9.22337204e18)
        goto LABEL_36;
      if (MinY >= 9.22337204e18)
        goto LABEL_37;
      v29 = v27 + (uint64_t)MinY;
      if (__OFADD__(v27, (uint64_t)MinY))
        goto LABEL_38;
      v30 = v29 * a8;
      if ((unsigned __int128)(v29 * (__int128)a8) >> 64 != (v29 * a8) >> 63)
        goto LABEL_39;
      v36.origin.x = a2;
      v36.origin.y = a3;
      v36.size.width = a4;
      v36.size.height = a5;
      MinX = CGRectGetMinX(v36);
      if ((~*(_QWORD *)&MinX & 0x7FF0000000000000) == 0)
        goto LABEL_40;
      if (MinX <= -9.22337204e18)
        goto LABEL_41;
      if (MinX >= 9.22337204e18)
        goto LABEL_42;
      v32 = (uint64_t)MinX * a9;
      if ((unsigned __int128)((uint64_t)MinX * (__int128)a9) >> 64 != v32 >> 63)
        goto LABEL_43;
      if (!a10)
        goto LABEL_56;
      v33 = v27 * a13;
      if ((unsigned __int128)(v27 * (__int128)a13) >> 64 != (v27 * a13) >> 63)
        goto LABEL_44;
      if ((unsigned __int128)(v24 * (__int128)a9) >> 64 != (v24 * a9) >> 63)
        goto LABEL_45;
      ++v27;
      memcpy((void *)(a1 + v30 + v32), (const void *)(a10 + v33), v24 * a9);
      if (v26 == v27)
        return;
    }
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
}

uint64_t static vImage_Buffer.wrap(ioSurface:planeIndex:srcRect:)@<X0>(__IOSurface *a1@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  char *BaseAddressOfPlane;
  int64_t WidthOfPlane;
  int64_t HeightOfPlane;
  int64_t BytesPerRowOfPlane;
  double Width;
  double Height;
  double v14;
  double v15;
  int64_t BytesPerElementOfPlane;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t result;
  uint32_t seed;
  _QWORD v23[4];
  char v24;
  CGRect v25;
  char v26;
  CGRect v27;
  char v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  seed = 0;
  IOSurfaceLock(a1, 2u, &seed);
  BaseAddressOfPlane = (char *)IOSurfaceGetBaseAddressOfPlane(a1, a2);
  WidthOfPlane = IOSurfaceGetWidthOfPlane(a1, a2);
  HeightOfPlane = IOSurfaceGetHeightOfPlane(a1, a2);
  BytesPerRowOfPlane = IOSurfaceGetBytesPerRowOfPlane(a1, a2);
  sub_2215C6540(a3, (uint64_t)&v27, &qword_2556DBBE8);
  if ((v28 & 1) != 0)
    Width = (double)WidthOfPlane;
  else
    Width = CGRectGetWidth(v27);
  if ((~*(_QWORD *)&Width & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_26;
  }
  if (Width <= -1.0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (Width >= 1.84467441e19)
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  sub_2215C6540(a3, (uint64_t)&v25, &qword_2556DBBE8);
  if ((v26 & 1) != 0)
    Height = (double)HeightOfPlane;
  else
    Height = CGRectGetHeight(v25);
  if ((~*(_QWORD *)&Height & 0x7FF0000000000000) == 0)
    goto LABEL_28;
  if (Height <= -1.0)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (Height >= 1.84467441e19)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  sub_2215C6540(a3, (uint64_t)v23, &qword_2556DBBE8);
  if ((v24 & 1) == 0)
  {
    v14 = *(double *)v23;
    v15 = *(double *)&v23[1];
    BytesPerElementOfPlane = IOSurfaceGetBytesPerElementOfPlane(a1, a2);
    if (v15 > -9.22337204e18)
    {
      if (v15 < 9.22337204e18)
      {
        v17 = (uint64_t)v15 * BytesPerRowOfPlane;
        if ((unsigned __int128)((uint64_t)v15 * (__int128)BytesPerRowOfPlane) >> 64 == v17 >> 63)
        {
          if ((~*(_QWORD *)&v14 & 0x7FF0000000000000) != 0
            && (*(_QWORD *)&v15 & 0x7FF0000000000000) != 0x7FF0000000000000)
          {
            if (v14 > -9.22337204e18)
            {
              if (v14 < 9.22337204e18)
              {
                v18 = (uint64_t)v14 * BytesPerElementOfPlane;
                if ((unsigned __int128)((uint64_t)v14 * (__int128)BytesPerElementOfPlane) >> 64 == v18 >> 63)
                {
                  v19 = __OFADD__(v17, v18);
                  v20 = v17 + v18;
                  if (!v19)
                  {
                    BaseAddressOfPlane += v20;
                    goto LABEL_24;
                  }
LABEL_38:
                  __break(1u);
                }
LABEL_37:
                __break(1u);
                goto LABEL_38;
              }
LABEL_36:
              __break(1u);
              goto LABEL_37;
            }
LABEL_35:
            __break(1u);
            goto LABEL_36;
          }
LABEL_34:
          __break(1u);
          goto LABEL_35;
        }
LABEL_33:
        __break(1u);
        goto LABEL_34;
      }
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
LABEL_24:
  result = IOSurfaceUnlock(a1, 2u, &seed);
  *(_QWORD *)a4 = BaseAddressOfPlane;
  *(_QWORD *)(a4 + 8) = (unint64_t)Height;
  *(_QWORD *)(a4 + 16) = (unint64_t)Width;
  *(_QWORD *)(a4 + 24) = BytesPerRowOfPlane;
  *(_BYTE *)(a4 + 32) = 0;
  return result;
}

void static vImage_Buffer.wrap(mtlTexture:srcRect:)(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  double Width;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  double Height;
  id v15;
  id v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  double v22;
  double v23;
  char v24;
  CGRect v25;
  char v26;
  CGRect v27;
  char v28;

  v6 = objc_msgSend(a1, sel_buffer);
  if (!v6)
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v9 = 0;
LABEL_30:
    *(_QWORD *)a3 = v11;
    *(_QWORD *)(a3 + 8) = v12;
    *(_QWORD *)(a3 + 16) = v13;
    *(_QWORD *)(a3 + 24) = v9;
    *(_BYTE *)(a3 + 32) = v6 == 0;
    return;
  }
  v7 = (uint64_t)objc_msgSend(a1, sel_width);
  v8 = objc_msgSend(a1, sel_height);
  v9 = (uint64_t)objc_msgSend(a1, sel_bufferBytesPerRow);
  sub_2215C6540(a2, (uint64_t)&v27, &qword_2556DBBE8);
  if ((v28 & 1) != 0)
    Width = (double)v7;
  else
    Width = CGRectGetWidth(v27);
  if ((~*(_QWORD *)&Width & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_32;
  }
  if (Width <= -1.0)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if (Width >= 1.84467441e19)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  sub_2215C6540(a2, (uint64_t)&v25, &qword_2556DBBE8);
  if ((v26 & 1) != 0)
    Height = (double)(uint64_t)v8;
  else
    Height = CGRectGetHeight(v25);
  if ((~*(_QWORD *)&Height & 0x7FF0000000000000) == 0)
    goto LABEL_34;
  if (Height <= -1.0)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (Height >= 1.84467441e19)
  {
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v15 = objc_msgSend((id)swift_unknownObjectRetain(), sel_contents);
  v16 = v6;
  v17 = (char *)objc_msgSend(a1, sel_bufferOffset);
  swift_unknownObjectRelease();
  v11 = &v17[(_QWORD)v15];
  sub_2215C6540(a2, (uint64_t)&v22, &qword_2556DBBE8);
  if ((v24 & 1) != 0)
  {
LABEL_29:
    v13 = (unint64_t)Width;
    v12 = (unint64_t)Height;
    goto LABEL_30;
  }
  if (!v7)
    goto LABEL_37;
  if (v9 == 0x8000000000000000 && v7 == -1)
    goto LABEL_46;
  if (v23 <= -9.22337204e18)
    goto LABEL_38;
  if (v23 >= 9.22337204e18)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v18 = (uint64_t)v23 * v9;
  if ((unsigned __int128)((uint64_t)v23 * (__int128)v9) >> 64 != v18 >> 63)
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if ((~*(_QWORD *)&v22 & 0x7FF0000000000000) == 0
    || (*(_QWORD *)&v23 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_41;
  }
  if (v22 <= -9.22337204e18)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (v22 >= 9.22337204e18)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v19 = (uint64_t)v22 * (v9 / v7);
  if ((unsigned __int128)((uint64_t)v22 * (__int128)(v9 / v7)) >> 64 == v19 >> 63)
  {
    v20 = __OFADD__(v18, v19);
    v21 = v18 + v19;
    if (!v20)
    {
      v11 += v21;
      goto LABEL_29;
    }
    goto LABEL_45;
  }
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
}

void *static vImage_Buffer.makeTempBufferForScaleARGB(srcImageBuffer:is128Bit:scaleFactor:flags:)(void *a1, vImagePixelCount a2, int64_t a3, int64_t a4, char a5, uint64_t a6, float a7)
{
  float v7;
  int64_t v8;
  float v9;
  uint64_t v10;
  vImage_Error v11;
  vImage_Buffer dest;
  vImage_Buffer src;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  src.data = a1;
  src.height = a2;
  src.width = a3;
  src.rowBytes = a4;
  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (!a3)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  dest.data = 0;
  v7 = roundf((float)(unint64_t)a3 * a7);
  if ((~LODWORD(v7) & 0x7F800000) == 0)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v7 <= -1.0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v7 >= 1.8447e19)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v8 = (unint64_t)v7;
  dest.width = (unint64_t)v7;
  v9 = roundf((float)a2 * a7);
  if ((~LODWORD(v9) & 0x7F800000) == 0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v9 <= -1.0)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v9 >= 1.8447e19)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  dest.height = (unint64_t)v9;
  if (v8 < 0)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if ((unsigned __int128)(a4 / a3 * (__int128)v8) >> 64 != (a4 / a3 * v8) >> 63)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  dest.rowBytes = a4 / a3 * v8;
  v10 = a6 | 0x80;
  if ((a5 & 1) == 0)
  {
    if ((a6 & 0x8000000000000000) == 0)
    {
      if (v10 <= 0xFFFFFFFFLL)
      {
        v11 = vImageScale_ARGB8888(&src, &dest, 0, v10);
        if (v11 < 1)
          return 0;
        return malloc(v11);
      }
LABEL_34:
      __break(1u);
    }
    goto LABEL_32;
  }
  if (a6 < 0)
  {
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if (v10 > 0xFFFFFFFFLL)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v11 = vImageScale_ARGBFFFF(&src, &dest, 0, v10);
  if (v11 < 1)
    return 0;
  return malloc(v11);
}

vImage_Error static vImage_Buffer.scaleARGB(srcImageBuffer:is128Bit:dstImageBuffer:srcRect:dstRect:flags:tempBuffer:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, int64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, unint64_t a7@<X6>, unint64_t a8@<X7>, uint64_t a9@<X8>, int64_t a10, uint64_t a11, uint64_t a12, unint64_t a13, void *a14)
{
  double Width;
  double Height;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  int64_t v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  vImage_Error result;
  vImage_Error v41;
  uint64_t v42;
  vImage_Buffer dest;
  vImage_Buffer src;
  double v45[4];
  char v46;
  _BYTE v47[8];
  double v48;
  char v49;
  CGRect v50;
  char v51;
  CGRect v52;
  char v53;
  double v54[4];
  char v55;
  _BYTE v56[8];
  double v57;
  char v58;
  CGRect v59;
  char v60;
  CGRect v61;
  char v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  src.rowBytes = a4;
  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_66;
  }
  if (!a3)
  {
LABEL_66:
    __break(1u);
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  sub_2215C6540(a11, (uint64_t)&v61, &qword_2556DBBE8);
  if ((v62 & 1) != 0)
    Width = (double)(unint64_t)a3;
  else
    Width = CGRectGetWidth(v61);
  if ((~*(_QWORD *)&Width & 0x7FF0000000000000) == 0)
    goto LABEL_67;
  if (Width <= -1.0)
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  if (Width >= 1.84467441e19)
  {
LABEL_69:
    __break(1u);
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  src.width = (unint64_t)Width;
  sub_2215C6540(a11, (uint64_t)&v59, &qword_2556DBBE8);
  if ((v60 & 1) != 0)
    Height = (double)a2;
  else
    Height = CGRectGetHeight(v59);
  if ((~*(_QWORD *)&Height & 0x7FF0000000000000) == 0)
    goto LABEL_70;
  if (Height <= -1.0)
  {
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  if (Height >= 1.84467441e19)
  {
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  src.height = (unint64_t)Height;
  sub_2215C6540(a11, (uint64_t)v56, &qword_2556DBBE8);
  v25 = v57;
  if (v58)
    v25 = 0.0;
  if ((~*(_QWORD *)&v25 & 0x7FF0000000000000) == 0)
    goto LABEL_73;
  if (v25 <= -9.22337204e18)
  {
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  if (v25 >= 9.22337204e18)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  v26 = (uint64_t)v25 * a4;
  if ((unsigned __int128)((uint64_t)v25 * (__int128)a4) >> 64 != v26 >> 63)
  {
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  sub_2215C6540(a11, (uint64_t)v54, &qword_2556DBBE8);
  v27 = v54[0];
  if (v55)
    v27 = 0.0;
  if ((~*(_QWORD *)&v27 & 0x7FF0000000000000) == 0)
    goto LABEL_77;
  if (v27 <= -9.22337204e18)
  {
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  if (v27 >= 9.22337204e18)
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  v28 = a4 / a3;
  v29 = (uint64_t)v27 * (a4 / a3);
  if ((unsigned __int128)((uint64_t)v27 * (__int128)(a4 / a3)) >> 64 != v29 >> 63)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  v30 = __OFADD__(v26, v29);
  v31 = v26 + v29;
  if (v30)
  {
LABEL_81:
    __break(1u);
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  if (!a1)
  {
LABEL_101:
    __break(1u);
LABEL_102:
    __break(1u);
  }
  v32 = a10;
  dest.rowBytes = a10;
  src.data = (void *)(a1 + v31);
  sub_2215C6540(a12, (uint64_t)&v52, &qword_2556DBBE8);
  if ((v53 & 1) != 0)
    v33 = (double)a8;
  else
    v33 = CGRectGetWidth(v52);
  if ((~*(_QWORD *)&v33 & 0x7FF0000000000000) == 0)
    goto LABEL_82;
  if (v33 <= -1.0)
  {
LABEL_83:
    __break(1u);
    goto LABEL_84;
  }
  if (v33 >= 1.84467441e19)
  {
LABEL_84:
    __break(1u);
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  dest.width = (unint64_t)v33;
  sub_2215C6540(a12, (uint64_t)&v50, &qword_2556DBBE8);
  if ((v51 & 1) != 0)
    v34 = (double)a7;
  else
    v34 = CGRectGetHeight(v50);
  if ((~*(_QWORD *)&v34 & 0x7FF0000000000000) == 0)
    goto LABEL_85;
  if (v34 <= -1.0)
  {
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
  if (v34 >= 1.84467441e19)
  {
LABEL_87:
    __break(1u);
LABEL_88:
    __break(1u);
    goto LABEL_89;
  }
  dest.height = (unint64_t)v34;
  sub_2215C6540(a12, (uint64_t)v47, &qword_2556DBBE8);
  v35 = v48;
  if (v49)
    v35 = 0.0;
  if ((~*(_QWORD *)&v35 & 0x7FF0000000000000) == 0)
    goto LABEL_88;
  if (v35 <= -9.22337204e18)
  {
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  if (v35 >= 9.22337204e18)
  {
LABEL_90:
    __break(1u);
    goto LABEL_91;
  }
  v36 = (uint64_t)v35 * a10;
  if ((unsigned __int128)((uint64_t)v35 * (__int128)a10) >> 64 != v36 >> 63)
  {
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  sub_2215C6540(a12, (uint64_t)v45, &qword_2556DBBE8);
  v37 = v45[0];
  if (v46)
    v37 = 0.0;
  if ((~*(_QWORD *)&v37 & 0x7FF0000000000000) == 0)
    goto LABEL_92;
  if (v37 <= -9.22337204e18)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  if (v37 >= 9.22337204e18)
  {
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  v38 = (uint64_t)v37 * v28;
  if ((unsigned __int128)((uint64_t)v37 * (__int128)v28) >> 64 != v38 >> 63)
  {
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  v30 = __OFADD__(v36, v38);
  v39 = v36 + v38;
  if (v30)
  {
LABEL_96:
    __break(1u);
LABEL_97:
    __break(1u);
    goto LABEL_98;
  }
  if (!a6)
    goto LABEL_102;
  dest.data = (void *)(a6 + v39);
  if ((a5 & 1) != 0)
  {
    if ((a13 & 0x8000000000000000) == 0)
    {
      if (!HIDWORD(a13))
      {
        result = vImageScale_ARGBFFFF(&src, &dest, a14, a13);
        v41 = result;
        if (!result)
          goto LABEL_64;
        goto LABEL_63;
      }
      goto LABEL_99;
    }
    goto LABEL_97;
  }
  if ((a13 & 0x8000000000000000) != 0)
  {
LABEL_98:
    __break(1u);
LABEL_99:
    __break(1u);
    goto LABEL_100;
  }
  if (HIDWORD(a13))
  {
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  result = vImageScale_ARGB8888(&src, &dest, a14, a13);
  v41 = result;
  if (result)
  {
LABEL_63:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2556D9F48);
    v42 = swift_allocObject();
    *(_OWORD *)(v42 + 16) = xmmword_2216560E0;
    sub_221653894();
    swift_bridgeObjectRelease();
    sub_221653ABC();
    sub_221653210();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v42 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v42 + 32) = 0xD00000000000001CLL;
    *(_QWORD *)(v42 + 40) = 0x8000000221660F10;
    sub_221653B70();
    result = swift_bridgeObjectRelease();
    a6 = 0;
    a7 = 0;
    a8 = 0;
    v32 = 0;
  }
LABEL_64:
  *(_QWORD *)a9 = a6;
  *(_QWORD *)(a9 + 8) = a7;
  *(_QWORD *)(a9 + 16) = a8;
  *(_QWORD *)(a9 + 24) = v32;
  *(_BYTE *)(a9 + 32) = v41 != 0;
  return result;
}

size_t static vImage_Buffer.diff(srcImageBuffer:dstImageBuffer:resultImageBuffer:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, size_t a3@<X2>, size_t a4@<X3>, uint64_t a5@<X4>, size_t *a6@<X8>, uint64_t a7)
{
  size_t result;
  size_t v14;
  size_t v15;
  uint64_t v16;
  size_t v17;
  size_t v18;
  size_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  BOOL v27;
  size_t *v28;
  _QWORD v29[5];
  _BYTE v30[40];

  result = sub_2215C6540(a7, (uint64_t)v29, &qword_2556D9F40);
  if (((a3 | a2) & 0x8000000000000000) != 0)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v28 = a6;
  v14 = v29[2];
  v15 = v29[3];
  v17 = v29[0];
  v16 = v29[1];
  result = sub_2215C6540(a7, (uint64_t)v30, &qword_2556D9F40);
  if (v30[32] != 1)
  {
LABEL_5:
    v18 = 0;
    v19 = 0;
    if (!a2)
    {
LABEL_22:
      *v28 = v17;
      v28[1] = v16;
      v28[2] = v14;
      v28[3] = v15;
      v28[4] = v19;
      v28[5] = v18;
      return result;
    }
    v20 = 0;
    while (v20 != (a2 & ~(a2 >> 63)))
    {
      v21 = v20 * a4;
      if ((unsigned __int128)(v20 * (__int128)(uint64_t)a4) >> 64 != (uint64_t)(v20 * a4) >> 63)
        goto LABEL_26;
      if (a3)
      {
        v22 = 0;
        while (1)
        {
          v23 = v21 + v22;
          if (__OFADD__(v21, v22))
            break;
          v24 = *(unsigned __int8 *)(a5 + v23);
          v25 = *(unsigned __int8 *)(a1 + v23);
          result = (v24 - v25 + 255) >> 1;
          *(_BYTE *)(v17 + v23) = result;
          if (v24 - v25 >= 0)
            v26 = (v24 - v25);
          else
            v26 = (v25 - v24);
          v27 = __OFADD__(v19, v26);
          v19 += v26;
          if (v27)
            goto LABEL_24;
          if (v24 != v25)
          {
            v27 = __OFADD__(v18++, 1);
            if (v27)
            {
              __break(1u);
              goto LABEL_22;
            }
          }
          if (a3 == ++v22)
            goto LABEL_7;
        }
        __break(1u);
LABEL_24:
        __break(1u);
        break;
      }
LABEL_7:
      if (++v20 == a2)
        goto LABEL_22;
    }
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  result = a2 * a4;
  if ((unsigned __int128)(a2 * (__int128)(uint64_t)a4) >> 64 == (uint64_t)(a2 * a4) >> 63)
  {
    result = (size_t)malloc(result);
    v17 = result;
    v16 = a2;
    v14 = a3;
    v15 = a4;
    goto LABEL_5;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t static vImage_Buffer.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v5;
  unsigned int v6;

  if (a5)
    v5 = a1 == a5;
  else
    v5 = 0;
  v6 = v5;
  if (a1)
    return v6;
  else
    return a5 == 0;
}

uint64_t vImage_Buffer.hash(into:)(uint64_t a1, uint64_t a2)
{
  if (!a2)
    return sub_221653BA0();
  sub_221653BA0();
  return sub_221653B94();
}

uint64_t vImage_Buffer.hashValue.getter(uint64_t a1)
{
  sub_221653B88();
  sub_221653BA0();
  if (a1)
    sub_221653B94();
  return sub_221653BAC();
}

uint64_t sub_22163094C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  sub_221653B88();
  sub_221653BA0();
  if (v1)
    sub_221653B94();
  return sub_221653BAC();
}

uint64_t sub_2216309AC()
{
  _QWORD *v0;

  if (!*v0)
    return sub_221653BA0();
  sub_221653BA0();
  return sub_221653B94();
}

uint64_t sub_2216309F0()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  sub_221653B88();
  sub_221653BA0();
  if (v1)
    sub_221653B94();
  return sub_221653BAC();
}

BOOL sub_221630A4C(_QWORD *a1, _QWORD *a2)
{
  BOOL v2;

  if (*a1)
    v2 = *a2 == 0;
  else
    v2 = 1;
  if (v2)
    return (*a1 | *a2) == 0;
  else
    return *a1 == *a2;
}

void sub_221630A78(__CVBuffer *a1@<X0>, size_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  char *BaseAddressOfPlane;
  int64_t WidthOfPlane;
  int64_t HeightOfPlane;
  int64_t BytesPerRowOfPlane;
  double Width;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  double Height;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  double v21;
  double v22;
  char v23;
  CGRect v24;
  char v25;
  CGRect v26;
  char v27;

  CVPixelBufferLockBaseAddress(a1, 1uLL);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a1, a2);
  if (!BaseAddressOfPlane)
  {
    CVPixelBufferUnlockBaseAddress(a1, 1uLL);
    v13 = 0;
    v14 = 0;
    v15 = 0;
    BytesPerRowOfPlane = 0;
LABEL_30:
    *(_QWORD *)a4 = v13;
    *(_QWORD *)(a4 + 8) = v14;
    *(_QWORD *)(a4 + 16) = v15;
    *(_QWORD *)(a4 + 24) = BytesPerRowOfPlane;
    *(_BYTE *)(a4 + 32) = BaseAddressOfPlane == 0;
    return;
  }
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a1, a2);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, a2);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a1, a2);
  sub_2215C6540(a3, (uint64_t)&v26, &qword_2556DBBE8);
  if ((v27 & 1) != 0)
    Width = (double)WidthOfPlane;
  else
    Width = CGRectGetWidth(v26);
  if ((~*(_QWORD *)&Width & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_32;
  }
  if (Width <= -1.0)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  if (Width >= 1.84467441e19)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  sub_2215C6540(a3, (uint64_t)&v24, &qword_2556DBBE8);
  if ((v25 & 1) != 0)
    Height = (double)HeightOfPlane;
  else
    Height = CGRectGetHeight(v24);
  if ((~*(_QWORD *)&Height & 0x7FF0000000000000) == 0)
    goto LABEL_34;
  if (Height <= -1.0)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  if (Height >= 1.84467441e19)
  {
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  sub_2215C6540(a3, (uint64_t)&v21, &qword_2556DBBE8);
  v13 = BaseAddressOfPlane;
  if ((v23 & 1) != 0)
  {
LABEL_29:
    v15 = (unint64_t)Width;
    v14 = (unint64_t)Height;
    CVPixelBufferUnlockBaseAddress(a1, 1uLL);
    goto LABEL_30;
  }
  if (!WidthOfPlane)
    goto LABEL_37;
  if (BytesPerRowOfPlane == 0x8000000000000000 && WidthOfPlane == -1)
    goto LABEL_46;
  if (v22 <= -9.22337204e18)
    goto LABEL_38;
  if (v22 >= 9.22337204e18)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v17 = (uint64_t)v22 * BytesPerRowOfPlane;
  if ((unsigned __int128)((uint64_t)v22 * (__int128)BytesPerRowOfPlane) >> 64 != v17 >> 63)
  {
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if ((~*(_QWORD *)&v21 & 0x7FF0000000000000) == 0
    || (*(_QWORD *)&v22 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_41;
  }
  if (v21 <= -9.22337204e18)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if (v21 >= 9.22337204e18)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v18 = (uint64_t)v21 * (BytesPerRowOfPlane / WidthOfPlane);
  if ((unsigned __int128)((uint64_t)v21 * (__int128)(BytesPerRowOfPlane / WidthOfPlane)) >> 64 == v18 >> 63)
  {
    v19 = __OFADD__(v17, v18);
    v20 = v17 + v18;
    if (!v19)
    {
      v13 = &BaseAddressOfPlane[v20];
      goto LABEL_29;
    }
    goto LABEL_45;
  }
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
}

void *_sSo13vImage_BufferV17MeasureFoundationE08makeTempB15ForScalePlanar803srcaB011scaleFactor5flagsSvSgAB_SfSitFZ_0(void *a1, vImagePixelCount a2, int64_t a3, int64_t a4, uint64_t a5, float a6)
{
  float v6;
  int64_t v7;
  float v8;
  vImage_Error v9;
  vImage_Buffer dest;
  vImage_Buffer src;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  src.data = a1;
  src.height = a2;
  src.width = a3;
  src.rowBytes = a4;
  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (!a3)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  dest.data = 0;
  v6 = roundf((float)(unint64_t)a3 * a6);
  if ((~LODWORD(v6) & 0x7F800000) == 0)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v6 <= -1.0)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (v6 >= 1.8447e19)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v7 = (unint64_t)v6;
  dest.width = (unint64_t)v6;
  v8 = roundf((float)a2 * a6);
  if ((~LODWORD(v8) & 0x7F800000) == 0)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v8 <= -1.0)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v8 >= 1.8447e19)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  dest.height = (unint64_t)v8;
  if (v7 < 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if ((unsigned __int128)(a4 / a3 * (__int128)v7) >> 64 != (a4 / a3 * v7) >> 63)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  dest.rowBytes = a4 / a3 * v7;
  if (a5 < 0)
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
  }
  if ((a5 | 0x80) > 0xFFFFFFFFLL)
    goto LABEL_28;
  v9 = vImageScale_Planar8(&src, &dest, 0, a5 | 0x80);
  if (v9 < 1)
    return 0;
  else
    return malloc(v9);
}

vImage_Error sub_221630E94@<X0>(void *a1@<X0>, vImagePixelCount a2@<X1>, vImagePixelCount a3@<X2>, size_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, size_t a8@<X7>, uint64_t a9@<X8>, CGFloat a10@<D0>, CGFloat a11@<D1>, CGFloat a12@<D2>, CGFloat a13@<D3>, unint64_t flags, void *tempBuffer)
{
  int64_t v15;
  double Width;
  double Height;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  vImage_Error result;
  vImage_Error v30;
  uint64_t v31;
  vImage_Buffer dest;
  vImage_Buffer src;
  uint64_t v34;
  CGRect v35;

  v15 = a8;
  v34 = *MEMORY[0x24BDAC8D0];
  src.data = a1;
  src.height = a2;
  src.width = a3;
  src.rowBytes = a4;
  dest.rowBytes = a8;
  Width = CGRectGetWidth(*(CGRect *)&a10);
  if ((~*(_QWORD *)&Width & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  if (Width <= -1.0)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (Width >= 1.84467441e19)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  dest.width = (unint64_t)Width;
  v35.origin.x = a10;
  v35.origin.y = a11;
  v35.size.width = a12;
  v35.size.height = a13;
  Height = CGRectGetHeight(v35);
  if ((~*(_QWORD *)&Height & 0x7FF0000000000000) == 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (Height <= -1.0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (Height >= 1.84467441e19)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  dest.height = (unint64_t)Height;
  if (a11 <= -9.22337204e18)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (a11 >= 9.22337204e18)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v26 = (uint64_t)a11 * v15;
  if ((unsigned __int128)((uint64_t)a11 * (__int128)v15) >> 64 != v26 >> 63)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if ((~*(_QWORD *)&a10 & 0x7FF0000000000000) == 0
    || (*(_QWORD *)&a11 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_30;
  }
  if (a10 <= -9.22337204e18)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (a10 >= 9.22337204e18)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v27 = __OFADD__(v26, (uint64_t)a10);
  v28 = v26 + (uint64_t)a10;
  if (v27)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (!a5)
    goto LABEL_36;
  dest.data = (void *)(a5 + v28);
  if ((flags & 0x8000000000000000) != 0)
    goto LABEL_34;
  if (HIDWORD(flags))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
  }
  result = vImageScale_Planar8(&src, &dest, tempBuffer, flags);
  v30 = result;
  if (result)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2556D9F48);
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_2216560E0;
    sub_221653894();
    swift_bridgeObjectRelease();
    sub_221653ABC();
    sub_221653210();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v31 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v31 + 32) = 0xD00000000000001BLL;
    *(_QWORD *)(v31 + 40) = 0x8000000221660F30;
    sub_221653B70();
    result = swift_bridgeObjectRelease();
    a5 = 0;
    a6 = 0;
    a7 = 0;
    v15 = 0;
  }
  *(_QWORD *)a9 = a5;
  *(_QWORD *)(a9 + 8) = a6;
  *(_QWORD *)(a9 + 16) = a7;
  *(_QWORD *)(a9 + 24) = v15;
  *(_BYTE *)(a9 + 32) = v30 != 0;
  return result;
}

uint64_t sub_221631194@<X0>(void *a1@<X0>, vImagePixelCount a2@<X1>, int64_t a3@<X2>, int64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, void *a7@<X6>, uint64_t a8@<X8>, float a9@<S0>)
{
  int64_t v16;
  void *v17;
  int64_t v18;
  vImagePixelCount v19;
  float v20;
  float v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  vImage_Buffer dest;
  vImage_Buffer src;
  _QWORD v33[5];
  unint64_t v34;
  unint64_t v35;
  char v36;
  _BYTE v37[40];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  sub_2215C6540(a5, (uint64_t)v33, &qword_2556D9F40);
  v17 = (void *)v33[0];
  v16 = v33[1];
  v19 = v33[2];
  v18 = v33[3];
  src.data = a1;
  src.height = a2;
  src.width = a3;
  src.rowBytes = a4;
  if (a3 < 0)
  {
    __break(1u);
    goto LABEL_24;
  }
  if (!a3)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v20 = roundf((float)(unint64_t)a3 * a9);
  if ((~LODWORD(v20) & 0x7F800000) == 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (v20 <= -9.2234e18)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v20 >= 9.2234e18)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v21 = roundf((float)a2 * a9);
  if ((~LODWORD(v21) & 0x7F800000) == 0)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (v21 <= -9.2234e18)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v21 >= 9.2234e18)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  sub_2215C6540(a5, (uint64_t)v37, &qword_2556D9F40);
  if (v37[32] == 1)
  {
    v19 = (uint64_t)v20;
    v18 = a4 / a3 * (uint64_t)v20;
    if ((unsigned __int128)(a4 / a3 * (__int128)(uint64_t)v20) >> 64 != v18 >> 63)
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    v16 = (uint64_t)v21;
    if (((v19 | (uint64_t)v21) & 0x8000000000000000) != 0)
    {
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
    }
    if ((unsigned __int128)(v16 * (__int128)v18) >> 64 != (v16 * v18) >> 63)
      goto LABEL_35;
    v17 = malloc(v16 * v18);
  }
  dest.data = v17;
  dest.height = v16;
  dest.width = v19;
  dest.rowBytes = v18;
  if ((a6 & 0x8000000000000000) != 0)
    goto LABEL_31;
  if (HIDWORD(a6))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  result = vImageScale_Planar8(&src, &dest, a7, a6);
  v23 = result;
  if (!result)
  {
    v27 = *(_OWORD *)&dest.data;
    v28 = *(_OWORD *)&dest.width;
    goto LABEL_22;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2556D9F48);
  v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_2216560E0;
  v34 = 0;
  v35 = 0xE000000000000000;
  sub_221653894();
  swift_bridgeObjectRelease();
  v34 = 0xD00000000000001BLL;
  v35 = 0x8000000221660F30;
  sub_221653ABC();
  sub_221653210();
  swift_bridgeObjectRelease();
  v25 = v34;
  v26 = v35;
  *(_QWORD *)(v24 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v24 + 32) = v25;
  *(_QWORD *)(v24 + 40) = v26;
  sub_221653B70();
  swift_bridgeObjectRelease();
  result = sub_2215C6540(a5, (uint64_t)&v34, &qword_2556D9F40);
  v27 = 0uLL;
  if (v36 != 1)
  {
    v28 = 0uLL;
    goto LABEL_22;
  }
  result = (uint64_t)dest.data;
  if (dest.data)
  {
    result = MEMORY[0x22766FAF4](dest.data, -1, -1);
    v28 = 0uLL;
    v27 = 0uLL;
LABEL_22:
    *(_OWORD *)a8 = v27;
    *(_OWORD *)(a8 + 16) = v28;
    *(_BYTE *)(a8 + 32) = v23 != 0;
    return result;
  }
  __break(1u);
  return result;
}

void sub_2216314B4(uint64_t a1, uint64_t a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  double Width;
  double Height;
  CGRect v16;

  Width = CGRectGetWidth(*(CGRect *)&a4);
  if ((~*(_QWORD *)&Width & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (Width <= -1.0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (Width >= 1.84467441e19)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v16.origin.x = a4;
  v16.origin.y = a5;
  v16.size.width = a6;
  v16.size.height = a7;
  Height = CGRectGetHeight(v16);
  if ((~*(_QWORD *)&Height & 0x7FF0000000000000) == 0)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (Height <= -1.0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (Height >= 1.84467441e19)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (!a1)
  {
LABEL_30:
    __break(1u);
    return;
  }
  if (a5 <= -9.22337204e18)
    goto LABEL_23;
  if (a5 >= 9.22337204e18)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if ((unsigned __int128)((uint64_t)a5 * (__int128)a2) >> 64 != ((uint64_t)a5 * a2) >> 63)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if ((~*(_QWORD *)&a4 & 0x7FF0000000000000) == 0 || (*(_QWORD *)&a5 & 0x7FF0000000000000) == 0x7FF0000000000000)
    goto LABEL_26;
  if (a4 <= -9.22337204e18)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (a4 >= 9.22337204e18)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if ((unsigned __int128)((uint64_t)a4 * (__int128)a3) >> 64 != ((uint64_t)a4 * a3) >> 63)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
}

unint64_t sub_221631660()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2556DDF98[0];
  if (!qword_2556DDF98[0])
  {
    type metadata accessor for vImage_Buffer(255);
    result = MEMORY[0x22766FA4C](&protocol conformance descriptor for vImage_Buffer, v1);
    atomic_store(result, qword_2556DDF98);
  }
  return result;
}

uint64_t HashableWeakRef.__allocating_init(_:)(uint64_t a1)
{
  return sub_22163173C(a1, 32, (uint64_t (*)(uint64_t))sub_221631C68);
}

uint64_t (*WeakRef.value.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_beginAccess();
  v3[3] = MEMORY[0x22766FB84](v1 + 16);
  return sub_221631728;
}

uint64_t WeakRef.__allocating_init(_:)(uint64_t a1)
{
  return sub_22163173C(a1, 24, (uint64_t (*)(uint64_t))sub_221631CE0);
}

uint64_t sub_22163173C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;

  swift_allocObject();
  v5 = a3(a1);
  swift_unknownObjectRelease();
  return v5;
}

uint64_t WeakRef.init(_:)()
{
  uint64_t v0;

  v0 = sub_221631CE0();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t WeakRef.__deallocating_deinit()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocClassInstance();
}

uint64_t _s17MeasureFoundation7WeakRefC5valuexSgvg_0()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x22766FB84](v0 + 16);
}

uint64_t _s17MeasureFoundation7WeakRefC5valuexSgvs_0()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t (*HashableWeakRef.value.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_beginAccess();
  v3[3] = MEMORY[0x22766FB84](v1 + 16);
  return sub_221631728;
}

void sub_2216318E4(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t HashableWeakRef.hashSeed.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t HashableWeakRef.init(_:)()
{
  uint64_t v0;

  v0 = sub_221631C68();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t _s17MeasureFoundation7WeakRefC13dynamicMemberqd__Sgs7KeyPathCyxqd__G_tcluig_0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *a1;
  swift_beginAccess();
  if (!MEMORY[0x22766FB84](v2 + 16))
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*MEMORY[0x24BEE46A8] + v4 + 8)
                                                                            - 8)
                                                                + 56))(a2, 1, 1);
  swift_getAtKeyPath();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(*(_QWORD *)(*MEMORY[0x24BEE46A8] + v4 + 8)
                                                                         - 8)
                                                             + 56))(a2, 0, 1);
}

uint64_t HashableWeakRef.deinit()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy();
  return v0;
}

uint64_t HashableWeakRef.__deallocating_deinit()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocClassInstance();
}

uint64_t HashableWeakRef.hash(into:)()
{
  return sub_221653B94();
}

uint64_t static HashableWeakRef.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;

  v4 = a1 + 16;
  swift_beginAccess();
  if (!MEMORY[0x22766FB84](v4))
    goto LABEL_5;
  swift_beginAccess();
  if (!MEMORY[0x22766FB84](a2 + 16))
  {
    swift_unknownObjectRelease();
LABEL_5:
    v5 = *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24);
    return v5 & 1;
  }
  v5 = sub_221653168();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v5 & 1;
}

uint64_t HashableWeakRef.hashValue.getter()
{
  sub_221653B88();
  sub_221653B94();
  return sub_221653BAC();
}

uint64_t sub_221631BE0()
{
  return HashableWeakRef.hashValue.getter();
}

uint64_t sub_221631C00()
{
  return HashableWeakRef.hash(into:)();
}

uint64_t sub_221631C20()
{
  sub_221653B88();
  HashableWeakRef.hash(into:)();
  return sub_221653BAC();
}

uint64_t sub_221631C5C(uint64_t *a1, uint64_t *a2)
{
  return static HashableWeakRef.== infix(_:_:)(*a1, *a2);
}

uint64_t sub_221631C68()
{
  uint64_t v0;

  swift_unknownObjectWeakInit();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  *(_QWORD *)(v0 + 24) = sub_221653120();
  return v0;
}

uint64_t sub_221631CE0()
{
  uint64_t v0;

  swift_unknownObjectWeakInit();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return v0;
}

void sub_221631D3C()
{
  JUMPOUT(0x22766FA4CLL);
}

uint64_t sub_221631D4C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for WeakRef(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for WeakRef);
}

uint64_t sub_221631D98()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for HashableWeakRef(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for HashableWeakRef);
}

uint64_t WorldAnchor.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_identifier;
  v4 = sub_221652FD0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t WorldAnchor.autoUpdate.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_autoUpdate);
  swift_beginAccess();
  return *v1;
}

uint64_t WorldAnchor.autoUpdate.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_autoUpdate);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*WorldAnchor.autoUpdate.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

float WorldAnchor.confidence.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_confidence;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t property wrapper backing initializer of WorldAnchor.plane(uint64_t a1)
{
  uint64_t v2;
  _DWORD *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DE0A8);
  v2 = swift_allocObject();
  swift_retain();
  v3 = (_DWORD *)swift_slowAlloc();
  *v3 = 0;
  swift_release();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return v2;
}

uint64_t sub_221631FB8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t result;

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
  swift_beginAccess();
  v4 = *v3;
  v5 = *(os_unfair_lock_s **)(v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  v6 = *(_QWORD *)(v4 + 16);
  swift_retain();
  os_unfair_lock_unlock(v5);
  result = swift_release();
  *a2 = v6;
  return result;
}

uint64_t WorldAnchor.plane.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  uint64_t v4;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
  swift_beginAccess();
  v2 = *v1;
  v3 = *(os_unfair_lock_s **)(v2 + 24);
  swift_retain();
  os_unfair_lock_lock(v3);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 + 16);
  swift_retain();
  os_unfair_lock_unlock(v3);
  swift_release();
  return v4;
}

uint64_t sub_2216320E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  os_unfair_lock_s *v5;

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
  swift_beginAccess();
  v4 = *v3;
  v5 = *(os_unfair_lock_s **)(v4 + 24);
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  *(_QWORD *)(v4 + 16) = a1;
  swift_retain();
  swift_release();
  os_unfair_lock_unlock(v5);
  swift_release();
  return swift_release_n();
}

uint64_t property wrapper backing initializer of WorldAnchor.viewAnchor(void *a1)
{
  uint64_t v2;
  id v3;
  _DWORD *v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DE0B8);
  v2 = swift_allocObject();
  v3 = a1;
  v4 = (_DWORD *)swift_slowAlloc();
  *v4 = 0;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v4;
  return v2;
}

uint64_t _s17MeasureFoundation11WorldAnchorC05pointD033_5454E724AA4159EF16DA5F66FC4569C8LLSo8ARAnchorCvpfP_0(void *a1)
{
  uint64_t v2;
  id v3;
  _DWORD *v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC6C0);
  v2 = swift_allocObject();
  v3 = a1;
  v4 = (_DWORD *)swift_slowAlloc();
  *v4 = 0;

  *(_QWORD *)(v2 + 16) = v3;
  *(_QWORD *)(v2 + 24) = v4;
  return v2;
}

uint64_t WorldAnchor.updateHandler.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler);
  swift_beginAccess();
  v2 = *v1;
  sub_2215EE3EC(*v1);
  return v2;
}

uint64_t WorldAnchor.updateHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return sub_2215EE3DC(v6);
}

void (*WorldAnchor.updateHandler.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler;
  v3[5] = v1;
  v3[6] = v4;
  v5 = (uint64_t *)(v1 + v4);
  swift_beginAccess();
  v6 = *v5;
  v7 = v5[1];
  v3[3] = *v5;
  v3[4] = v7;
  sub_2215EE3EC(v6);
  return sub_221632398;
}

void sub_221632398(uint64_t a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD **)a1;
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v5 = v3[4];
  v6 = (uint64_t *)(v3[5] + v3[6]);
  v7 = *v6;
  *v6 = v4;
  v6[1] = v5;
  if ((a2 & 1) != 0)
  {
    sub_2215EE3EC(v4);
    sub_2215EE3DC(v7);
    v8 = v3[3];
  }
  else
  {
    v8 = v7;
  }
  sub_2215EE3DC(v8);
  free(v3);
}

void (*sub_221632408(_QWORD *a1))(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  os_unfair_lock_s *v4;
  uint64_t v5;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  if (qword_2556D8F18 != -1)
    swift_once();
  v3 = off_2556DE0A0;
  v2[4] = off_2556DE0A0;
  v4 = (os_unfair_lock_s *)*((_QWORD *)v3 + 3);
  swift_retain();
  os_unfair_lock_lock(v4);
  swift_beginAccess();
  v5 = *((_QWORD *)v3 + 2);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v4);
  v2[3] = v5;
  return sub_2216324BC;
}

void sub_2216324BC(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;

  v2 = *(void **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v5 = *(os_unfair_lock_s **)(v4 + 24);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    os_unfair_lock_lock(v5);
    *(_QWORD *)(v4 + 16) = v3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)(v4 + 24));
    *(_QWORD *)(v4 + 16) = v3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v5);
    swift_bridgeObjectRelease();
    swift_release();
  }
  free(v2);
}

_DWORD *sub_221632584()
{
  uint64_t v0;
  _DWORD *result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DE328);
  v0 = swift_allocObject();
  result = (_DWORD *)swift_slowAlloc();
  *result = 0;
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v0 + 24) = result;
  off_2556DE0A0 = (_UNKNOWN *)v0;
  return result;
}

uint64_t *WorldAnchor.arSession.unsafeMutableAddressor()
{
  return &static WorldAnchor.arSession;
}

uint64_t static WorldAnchor.arSession.getter()
{
  uint64_t v0;
  id v1;

  swift_beginAccess();
  v0 = static WorldAnchor.arSession;
  v1 = (id)static WorldAnchor.arSession;
  return v0;
}

void static WorldAnchor.arSession.setter(uint64_t a1)
{
  void *v2;

  swift_beginAccess();
  v2 = (void *)static WorldAnchor.arSession;
  static WorldAnchor.arSession = a1;

}

uint64_t (*static WorldAnchor.arSession.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_2216326BC()
{
  double result;

  qword_2556E4680 = 0;
  result = 0.0;
  static WorldAnchor.delegate = 0u;
  unk_2556E4670 = 0u;
  return result;
}

__int128 *WorldAnchor.delegate.unsafeMutableAddressor()
{
  if (qword_2556D8F20 != -1)
    swift_once();
  return &static WorldAnchor.delegate;
}

uint64_t static WorldAnchor.delegate.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_2556D8F20 != -1)
    swift_once();
  swift_beginAccess();
  return sub_2215C3ABC((uint64_t)&static WorldAnchor.delegate, a1, &qword_2556DE0C0);
}

uint64_t static WorldAnchor.delegate.setter(uint64_t a1)
{
  if (qword_2556D8F20 != -1)
    swift_once();
  swift_beginAccess();
  sub_22163281C(a1, (uint64_t)&static WorldAnchor.delegate);
  swift_endAccess();
  return sub_2215D2098(a1, &qword_2556DE0C0);
}

uint64_t sub_22163281C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2556DE0C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t (*static WorldAnchor.delegate.modify())()
{
  if (qword_2556D8F20 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t WorldAnchor.hash(into:)()
{
  sub_221652FD0();
  sub_2215BB99C((unint64_t *)&qword_2556DA0C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_221653114();
}

uint64_t static WorldAnchor.== infix(_:_:)()
{
  return sub_221652FAC();
}

__n128 WorldAnchor.transform.getter()
{
  uint64_t v0;

  return *(__n128 *)(v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
}

unint64_t WorldAnchor.viewDirection.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  void *v4;
  id v5;
  uint64_t *v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  id v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  int32x4_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x4_t v17;
  float32x4_t v18;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__viewAnchor);
  swift_beginAccess();
  v2 = *v1;
  v3 = *(os_unfair_lock_s **)(*v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v3);
  swift_beginAccess();
  v4 = *(void **)(v2 + 16);
  v5 = v4;
  os_unfair_lock_unlock(v3);
  swift_release();
  if (!v4)
    return 0;
  v6 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__targetAnchor);
  swift_beginAccess();
  v7 = *v6;
  v8 = *(os_unfair_lock_s **)(v7 + 24);
  swift_retain();
  os_unfair_lock_lock(v8);
  swift_beginAccess();
  v9 = *(id *)(v7 + 16);
  os_unfair_lock_unlock(v8);
  swift_release();
  objc_msgSend(v9, sel_transform);
  v18 = v10;

  objc_msgSend(v5, sel_transform);
  v17 = v11;

  v12 = vsubq_f32(v18, v17);
  v13 = (int32x4_t)vmulq_f32(v12, v12);
  v13.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v13, 2), vadd_f32(*(float32x2_t *)v13.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v13.i8, 1))).u32[0];
  v14 = vrsqrte_f32((float32x2_t)v13.u32[0]);
  v15 = vmul_f32(v14, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v14, v14)));
  return vmulq_n_f32(v12, vmul_f32(v15, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v15, v15))).f32[0]).u64[0];
}

unint64_t WorldAnchor.distanceToViewAnchor.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  void *v4;
  id v5;
  uint64_t *v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  id v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  uint64_t v14;
  float32x4_t v16;
  float32x4_t v17;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__viewAnchor);
  swift_beginAccess();
  v2 = *v1;
  v3 = *(os_unfair_lock_s **)(*v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v3);
  swift_beginAccess();
  v4 = *(void **)(v2 + 16);
  v5 = v4;
  os_unfair_lock_unlock(v3);
  swift_release();
  if (v4)
  {
    v6 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__targetAnchor);
    swift_beginAccess();
    v7 = *v6;
    v8 = *(os_unfair_lock_s **)(v7 + 24);
    swift_retain();
    os_unfair_lock_lock(v8);
    swift_beginAccess();
    v9 = *(id *)(v7 + 16);
    os_unfair_lock_unlock(v8);
    swift_release();
    objc_msgSend(v9, sel_transform);
    v17 = v10;

    objc_msgSend(v5, sel_transform);
    v16 = v11;

    v12 = vsubq_f32(v17, v16);
    v13 = vmulq_f32(v12, v12);
    v14 = COERCE_UNSIGNED_INT(sqrtf(v13.f32[2] + vaddv_f32(*(float32x2_t *)v13.f32)));
  }
  else
  {
    v14 = 0;
  }
  return v14 | ((unint64_t)(v4 == 0) << 32);
}

uint64_t WorldAnchor.__allocating_init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8, float a9)
{
  uint64_t v14;

  v14 = swift_allocObject();
  WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  return v14;
}

uint64_t WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)(uint64_t a1, uint64_t a2, char a3, uint64_t a4, __n128 a5, __n128 a6, __n128 a7, __n128 a8, float a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  _DWORD *v20;
  _QWORD *v21;
  __n128 *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  id v26;
  _DWORD *v27;
  id v28;
  double v29;
  uint64_t v30;
  id v31;
  _DWORD *v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  id v36;
  _DWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  _DWORD *v40;
  uint64_t v41;
  os_unfair_lock_s *v42;
  id v43;
  uint64_t v44;
  os_unfair_lock_s *v45;
  id v46;
  uint64_t v47;
  os_unfair_lock_s *v48;
  void *v49;
  id v50;
  uint64_t v51;
  os_unfair_lock_s *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  double v57;
  double v58;
  double v59;
  double v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  _QWORD v70[3];
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[7];
  _QWORD v74[7];
  _BYTE v75[80];
  _BYTE v76[80];

  v10 = v9;
  sub_2215BDFCC(a4, (uint64_t)v74);
  v61 = v74[0];
  v62 = v74[2];
  v63 = v74[4];
  v64 = v74[6];
  sub_2215BDFCC(a1, (uint64_t)v73);
  v57 = *(double *)v73;
  v58 = *(double *)&v73[2];
  v59 = *(double *)&v73[4];
  v60 = *(double *)&v73[6];
  _s17MeasureFoundation11WorldAnchorC10identifier0B04UUIDVvpfi_0();
  v15 = OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DE0A8);
  v16 = swift_allocObject();
  v17 = (_DWORD *)swift_slowAlloc();
  *v17 = 0;
  *(_QWORD *)(v16 + 16) = 0;
  *(_QWORD *)(v16 + 24) = v17;
  *(_QWORD *)(v10 + v15) = v16;
  *(_DWORD *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_maxTranslationForPlaneUpgrade) = 994352038;
  *(_DWORD *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_minDotForPlaneUpgrade) = 1065289295;
  v18 = (uint64_t *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__viewAnchor);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DE0B8);
  v19 = swift_allocObject();
  v20 = (_DWORD *)swift_slowAlloc();
  *v20 = 0;
  *(_QWORD *)(v19 + 16) = 0;
  *(_QWORD *)(v19 + 24) = v20;
  *v18 = v19;
  v21 = (_QWORD *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler);
  *v21 = 0;
  v21[1] = 0;
  v22 = (__n128 *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
  *v22 = a5;
  v22[1] = a6;
  v22[2] = a7;
  v22[3] = a8;
  v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFD910]), sel_initWithTransform_, a5.n128_f64[0], a6.n128_f64[0], a7.n128_f64[0], a8.n128_f64[0]);
  v24 = (uint64_t *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__pointAnchor);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC6C0);
  v25 = swift_allocObject();
  v26 = v23;
  v27 = (_DWORD *)swift_slowAlloc();
  *v27 = 0;
  *(_QWORD *)(v25 + 16) = v26;
  *(_QWORD *)(v25 + 24) = v27;
  *v24 = v25;
  swift_endAccess();

  sub_2215BDFCC(a1, (uint64_t)v76);
  v28 = 0;
  if ((v76[64] & 1) == 0)
  {
    v29 = v60;
    v28 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFD910]), sel_initWithTransform_, v57, v58, v59, v29);
  }
  swift_beginAccess();
  swift_release();
  v30 = swift_allocObject();
  v31 = v28;
  v32 = (_DWORD *)swift_slowAlloc();
  *v32 = 0;
  *(_QWORD *)(v30 + 16) = v28;
  *(_QWORD *)(v30 + 24) = v32;
  *v18 = v30;
  swift_endAccess();

  sub_2215BDFCC(a4, (uint64_t)v75);
  if ((v75[64] & 1) == 0)
  {
    a5.n128_u64[0] = v61;
    a6.n128_u64[0] = v62;
    a7.n128_u64[0] = v63;
    a8.n128_u64[0] = v64;
  }
  v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFD910]), sel_initWithTransform_, a5.n128_f64[0], a6.n128_f64[0], a7.n128_f64[0], a8.n128_f64[0]);
  v34 = (uint64_t *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__targetAnchor);
  swift_beginAccess();
  v35 = swift_allocObject();
  v36 = v33;
  v37 = (_DWORD *)swift_slowAlloc();
  *v37 = 0;
  *(_QWORD *)(v35 + 16) = v36;
  *(_QWORD *)(v35 + 24) = v37;
  *v34 = v35;
  swift_endAccess();

  v38 = (uint64_t *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
  swift_beginAccess();
  swift_retain_n();
  swift_release();
  v39 = swift_allocObject();
  v40 = (_DWORD *)swift_slowAlloc();
  *v40 = 0;
  *(_QWORD *)(v39 + 16) = a2;
  *(_QWORD *)(v39 + 24) = v40;
  *v38 = v39;
  swift_endAccess();
  swift_release();
  *(_BYTE *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_autoUpdate) = a3 & 1;
  *(float *)(v10 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_confidence) = a9;
  v41 = *v24;
  v42 = *(os_unfair_lock_s **)(*v24 + 24);
  swift_retain();
  os_unfair_lock_lock(v42);
  swift_beginAccess();
  v43 = *(id *)(v41 + 16);
  os_unfair_lock_unlock(v42);
  swift_release();
  sub_221635E7C(v43);

  v44 = *v34;
  v45 = *(os_unfair_lock_s **)(*v34 + 24);
  swift_retain();
  os_unfair_lock_lock(v45);
  swift_beginAccess();
  v46 = *(id *)(v44 + 16);
  os_unfair_lock_unlock(v45);
  swift_release();
  sub_221635E7C(v46);

  v47 = *v18;
  v48 = *(os_unfair_lock_s **)(*v18 + 24);
  swift_retain();
  os_unfair_lock_lock(v48);
  swift_beginAccess();
  v49 = *(void **)(v47 + 16);
  v50 = v49;
  os_unfair_lock_unlock(v48);
  swift_release();
  if (v49)
  {
    sub_221635E7C(v50);

  }
  if (a2)
  {
    swift_beginAccess();
    v51 = *(_QWORD *)(a2 + 16);
    v52 = *(os_unfair_lock_s **)(v51 + 24);
    swift_retain();
    swift_retain();
    os_unfair_lock_lock(v52);
    swift_beginAccess();
    v53 = *(id *)(v51 + 16);
    os_unfair_lock_unlock(v52);
    swift_release();
    swift_release();
    sub_221635E7C(v53);

  }
  if (qword_2556D8F20 != -1)
    swift_once();
  swift_beginAccess();
  if (qword_2556E4678)
  {
    sub_2215E70EC((uint64_t)&static WorldAnchor.delegate, (uint64_t)v70);
    v54 = v71;
    v55 = v72;
    __swift_project_boxed_opaque_existential_0(v70, v71);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 8))(v10, v54, v55);
    swift_release();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v70);
  }
  else
  {
    swift_release();
  }
  return v10;
}

uint64_t WorldAnchor.__allocating_init(anchor:shouldAutoUpdate:)(uint64_t a1, unsigned __int8 a2)
{
  uint64_t v2;

  v2 = sub_2216387B8(a1, a2);
  swift_release();
  return v2;
}

uint64_t WorldAnchor.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  id v5;
  uint64_t *v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  os_unfair_lock_s *v12;
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  os_unfair_lock_s *v17;
  uint64_t v18;
  uint64_t v19;
  os_unfair_lock_s *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[3];
  uint64_t v28;
  uint64_t v29;

  v1 = v0;
  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__pointAnchor);
  swift_beginAccess();
  v3 = *v2;
  v4 = *(os_unfair_lock_s **)(*v2 + 24);
  swift_retain();
  os_unfair_lock_lock(v4);
  swift_beginAccess();
  v5 = *(id *)(v3 + 16);
  os_unfair_lock_unlock(v4);
  swift_release();
  sub_221636358(v5);

  v6 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__targetAnchor);
  swift_beginAccess();
  v7 = *v6;
  v8 = *(os_unfair_lock_s **)(*v6 + 24);
  swift_retain();
  os_unfair_lock_lock(v8);
  swift_beginAccess();
  v9 = *(id *)(v7 + 16);
  os_unfair_lock_unlock(v8);
  swift_release();
  sub_221636358(v9);

  v10 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__viewAnchor);
  swift_beginAccess();
  v11 = *v10;
  v12 = *(os_unfair_lock_s **)(*v10 + 24);
  swift_retain();
  os_unfair_lock_lock(v12);
  swift_beginAccess();
  v13 = *(void **)(v11 + 16);
  v14 = v13;
  os_unfair_lock_unlock(v12);
  swift_release();
  if (v13)
  {
    sub_221636358(v14);

  }
  v15 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
  swift_beginAccess();
  v16 = *v15;
  v17 = *(os_unfair_lock_s **)(*v15 + 24);
  swift_retain();
  os_unfair_lock_lock(v17);
  swift_beginAccess();
  v18 = *(_QWORD *)(v16 + 16);
  swift_retain();
  os_unfair_lock_unlock(v17);
  swift_release();
  if (v18)
  {
    swift_beginAccess();
    v19 = *(_QWORD *)(v18 + 16);
    v20 = *(os_unfair_lock_s **)(v19 + 24);
    swift_retain();
    os_unfair_lock_lock(v20);
    swift_beginAccess();
    v21 = *(id *)(v19 + 16);
    os_unfair_lock_unlock(v20);
    swift_release();
    swift_release();
    sub_221636358(v21);

  }
  if (qword_2556D8F20 != -1)
    swift_once();
  swift_beginAccess();
  if (qword_2556E4678)
  {
    sub_2215E70EC((uint64_t)&static WorldAnchor.delegate, (uint64_t)v27);
    v22 = v28;
    v23 = v29;
    __swift_project_boxed_opaque_existential_0(v27, v28);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 24))(v1, v22, v23);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
  }
  v24 = v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_identifier;
  v25 = sub_221652FD0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 8))(v24, v25);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_2215EE3DC(*(_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler));
  return v1;
}

uint64_t WorldAnchor.__deallocating_deinit()
{
  WorldAnchor.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_221633794(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t *v10;
  uint64_t v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  os_unfair_lock_s *v16;
  uint64_t v17;
  uint64_t v18;
  os_unfair_lock_s *v19;
  id v20;
  id v21;
  id v22;
  void (*v23)(_BYTE *, uint64_t);
  uint64_t v24;
  os_unfair_lock_s *v25;
  _BYTE v26[24];

  v3 = sub_221652FD0();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = &v26[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v26[-v8];
  v10 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
  swift_beginAccess();
  v11 = *v10;
  v12 = *(os_unfair_lock_s **)(*v10 + 24);
  swift_retain();
  os_unfair_lock_lock(v12);
  swift_beginAccess();
  v13 = *(_QWORD *)(v11 + 16);
  swift_retain();
  os_unfair_lock_unlock(v12);
  swift_release();
  result = swift_release();
  if (v13)
  {
    v15 = *v10;
    v16 = *(os_unfair_lock_s **)(*v10 + 24);
    swift_retain();
    os_unfair_lock_lock(v16);
    swift_beginAccess();
    v17 = *(_QWORD *)(v15 + 16);
    swift_retain();
    os_unfair_lock_unlock(v16);
    result = swift_release();
    if (v17)
    {
      swift_beginAccess();
      v18 = *(_QWORD *)(v17 + 16);
      v19 = *(os_unfair_lock_s **)(v18 + 24);
      swift_retain();
      os_unfair_lock_lock(v19);
      swift_beginAccess();
      v20 = *(id *)(v18 + 16);
      os_unfair_lock_unlock(v19);
      swift_release();
      swift_release();
      v21 = objc_msgSend(v20, sel_identifier);

      sub_221652FB8();
      v22 = objc_msgSend(a1, sel_identifier);
      sub_221652FB8();

      LOBYTE(v22) = sub_221652FAC();
      v23 = *(void (**)(_BYTE *, uint64_t))(v4 + 8);
      v23(v7, v3);
      result = ((uint64_t (*)(_BYTE *, uint64_t))v23)(v9, v3);
      if ((v22 & 1) != 0)
      {
        v24 = *v10;
        v25 = *(os_unfair_lock_s **)(*v10 + 24);
        swift_retain();
        os_unfair_lock_lock(v25);
        swift_beginAccess();
        *(_QWORD *)(v24 + 16) = 0;
        swift_release();
        os_unfair_lock_unlock(v25);
        return swift_release();
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_221633A20(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t *v29;
  uint64_t v30;
  os_unfair_lock_s *v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  os_unfair_lock_s *v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  os_unfair_lock_s *v43;
  void *v44;
  uint64_t *v45;
  uint64_t v46;
  os_unfair_lock_s *v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t, uint64_t);
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t);
  uint64_t v60;
  char *v61;
  char v62;
  char *v63;
  void (*v64)(uint64_t, uint64_t);
  uint64_t v65;
  os_unfair_lock_s *v66;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  id v71;
  uint64_t *v72;
  uint64_t v73;
  os_unfair_lock_s *v74;
  id v75;
  id v76;
  char *v77;
  char *v78;
  char *v79;
  void (*v80)(char *, uint64_t);
  void *v81;
  id v82;
  void (*v84)(char *, char *, uint64_t);
  uint64_t v85;
  os_unfair_lock_s *v86;
  uint64_t v87;
  uint64_t v88;
  os_unfair_lock_s *v89;
  id v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  void (*v94)(uint64_t, char *, uint64_t);
  void (*v95)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v96;
  char *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t, uint64_t);
  int v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  int v106;
  void (*v107)(uint64_t, uint64_t);
  char *v108;
  char v109;
  void (*v110)(char *, uint64_t);
  uint64_t v111;
  os_unfair_lock_s *v112;
  id v113;
  float32x4_t v114;
  float32x4_t v115;
  uint64_t *v116;
  void (*v117)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t *v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  void (*v123)(uint64_t, char *, uint64_t);
  uint64_t *v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  char *v130;
  uint64_t (*v131)(uint64_t, uint64_t, uint64_t);
  void (*v132)(uint64_t, uint64_t);
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  float32x4_t v140;

  v121 = a2;
  v133 = __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC6D8);
  v4 = MEMORY[0x24BDAC7A8](v133);
  v126 = (uint64_t)&v116 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v131 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&v116 - v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(qword_2556DC6E0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v122 = (uint64_t)&v116 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v127 = (uint64_t)&v116 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v125 = (char *)&v116 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v128 = (uint64_t)&v116 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v134 = (uint64_t)&v116 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v135 = (uint64_t)&v116 - v18;
  v19 = sub_221652FD0();
  v139 = *(_QWORD *)(v19 - 8);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v129 = (char *)&v116 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v140.i64[0] = (uint64_t)&v116 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v116 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v116 - v27;
  v29 = (uint64_t *)(v2 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
  swift_beginAccess();
  v124 = v29;
  v30 = *v29;
  v31 = *(os_unfair_lock_s **)(*v29 + 24);
  swift_retain();
  os_unfair_lock_lock(v31);
  swift_beginAccess();
  v138 = *(_QWORD *)(v30 + 16);
  swift_retain();
  os_unfair_lock_unlock(v31);
  swift_release();
  v137 = a1;
  v32 = objc_msgSend(a1, sel_identifier);
  sub_221652FB8();

  v136 = v2;
  v33 = (uint64_t *)(v2 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__pointAnchor);
  swift_beginAccess();
  v34 = *v33;
  v35 = *(os_unfair_lock_s **)(*v33 + 24);
  swift_retain();
  os_unfair_lock_lock(v35);
  swift_beginAccess();
  v36 = *(id *)(v34 + 16);
  os_unfair_lock_unlock(v35);
  swift_release();
  v37 = v139;
  v38 = objc_msgSend(v36, sel_identifier);

  sub_221652FB8();
  v39 = sub_2215BB99C(&qword_2556DA0E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
  v40 = v19;
  LOBYTE(v38) = sub_221653168();
  v41 = *(void (**)(char *, uint64_t))(v37 + 8);
  v130 = v26;
  v41(v26, v19);
  if ((v38 & 1) != 0)
  {
    v41(v28, v19);
    v42 = *v33;
    v43 = *(os_unfair_lock_s **)(*v33 + 24);
    swift_retain();
    v44 = v137;
    os_unfair_lock_lock(v43);
LABEL_16:
    swift_beginAccess();
    v81 = *(void **)(v42 + 16);
    *(_QWORD *)(v42 + 16) = v44;
    v82 = v44;

    os_unfair_lock_unlock(v43);
    swift_release();
    swift_release();

    v69 = 1;
    return v69 & 1;
  }
  v119 = v39;
  v120 = v28;
  v132 = (void (*)(uint64_t, uint64_t))v41;
  v116 = v33;
  v123 = *(void (**)(uint64_t, char *, uint64_t))(v37 + 16);
  v123(v140.i64[0], v28, v19);
  v45 = (uint64_t *)(v136 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__viewAnchor);
  swift_beginAccess();
  v46 = *v45;
  v47 = *(os_unfair_lock_s **)(*v45 + 24);
  swift_retain();
  os_unfair_lock_lock(v47);
  swift_beginAccess();
  v48 = *(void **)(v46 + 16);
  v49 = v48;
  os_unfair_lock_unlock(v47);
  swift_release();
  v118 = v45;
  if (v48)
  {
    v50 = objc_msgSend(v49, sel_identifier);

    v51 = v135;
    sub_221652FB8();

    v52 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 56);
    v52(v51, 0, 1, v19);
  }
  else
  {
    v52 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 56);
    v51 = v135;
    v52(v135, 1, 1, v19);
  }
  v53 = (uint64_t)v131;
  v54 = v134;
  v55 = v140.i64[0];
  v123(v134, (char *)v140.i64[0], v40);
  v117 = v52;
  v52(v54, 0, 1, v40);
  v56 = v53 + *(int *)(v133 + 48);
  sub_2215C3ABC(v51, v53, qword_2556DC6E0);
  sub_2215C3ABC(v54, v56, qword_2556DC6E0);
  v57 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 48);
  if (v57(v53, 1, v40) != 1)
  {
    v58 = v128;
    sub_2215C3ABC(v53, v128, qword_2556DC6E0);
    if (v57(v56, 1, v40) != 1)
    {
      v131 = v57;
      v60 = v53;
      v61 = v130;
      (*(void (**)(char *, uint64_t, uint64_t))(v37 + 32))(v130, v56, v40);
      v62 = sub_221653168();
      v63 = v61;
      v64 = v132;
      v132((uint64_t)v63, v40);
      sub_2215D2098(v134, qword_2556DC6E0);
      sub_2215D2098(v135, qword_2556DC6E0);
      v64(v140.i64[0], v40);
      v64(v58, v40);
      sub_2215D2098(v60, qword_2556DC6E0);
      if ((v62 & 1) != 0)
        goto LABEL_13;
LABEL_14:
      v72 = (uint64_t *)(v136 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__targetAnchor);
      swift_beginAccess();
      v73 = *v72;
      v74 = *(os_unfair_lock_s **)(*v72 + 24);
      swift_retain();
      os_unfair_lock_lock(v74);
      swift_beginAccess();
      v75 = *(id *)(v73 + 16);
      os_unfair_lock_unlock(v74);
      swift_release();
      v76 = objc_msgSend(v75, sel_identifier);

      v77 = v130;
      sub_221652FB8();

      v78 = v120;
      LOBYTE(v76) = sub_221653168();
      v79 = v77;
      v80 = (void (*)(char *, uint64_t))v132;
      v132((uint64_t)v79, v40);
      if ((v76 & 1) != 0)
      {
        v80(v78, v40);
        v42 = *v72;
        v43 = *(os_unfair_lock_s **)(*v72 + 24);
        v44 = v137;
        swift_retain();
        os_unfair_lock_lock(v43);
        goto LABEL_16;
      }
      v84 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
      v84(v129, v78, v40);
      v85 = *v124;
      v86 = *(os_unfair_lock_s **)(*v124 + 24);
      swift_retain();
      os_unfair_lock_lock(v86);
      swift_beginAccess();
      v87 = *(_QWORD *)(v85 + 16);
      swift_retain();
      os_unfair_lock_unlock(v86);
      swift_release();
      if (v87)
      {
        swift_beginAccess();
        v88 = *(_QWORD *)(v87 + 16);
        v89 = *(os_unfair_lock_s **)(v88 + 24);
        swift_retain();
        os_unfair_lock_lock(v89);
        swift_beginAccess();
        v90 = *(id *)(v88 + 16);
        os_unfair_lock_unlock(v89);
        swift_release();
        swift_release();
        v91 = objc_msgSend(v90, sel_identifier);

        v92 = (uint64_t)v125;
        sub_221652FB8();

        v93 = 0;
      }
      else
      {
        v93 = 1;
        v92 = (uint64_t)v125;
      }
      v94 = v123;
      v95 = v117;
      v117(v92, v93, 1, v40);
      v96 = v127;
      v97 = v129;
      v94(v127, v129, v40);
      v95(v96, 0, 1, v40);
      v98 = v97;
      v99 = v126;
      v100 = v126 + *(int *)(v133 + 48);
      sub_2215C3ABC(v92, v126, qword_2556DC6E0);
      sub_2215C3ABC(v96, v100, qword_2556DC6E0);
      v101 = v131;
      if (v131(v99, 1, v40) == 1)
      {
        sub_2215D2098(v96, qword_2556DC6E0);
        sub_2215D2098(v92, qword_2556DC6E0);
        v132((uint64_t)v98, v40);
        v102 = v101(v100, 1, v40);
        v103 = v138;
        if (v102 == 1)
        {
          sub_2215D2098(v99, qword_2556DC6E0);
          v104 = v116;
          goto LABEL_28;
        }
      }
      else
      {
        v105 = v122;
        sub_2215C3ABC(v99, v122, qword_2556DC6E0);
        v106 = v101(v100, 1, v40);
        v104 = v116;
        if (v106 != 1)
        {
          v108 = v130;
          v84(v130, (char *)v100, v40);
          v109 = sub_221653168();
          v110 = (void (*)(char *, uint64_t))v132;
          v132((uint64_t)v108, v40);
          sub_2215D2098(v127, qword_2556DC6E0);
          sub_2215D2098(v92, qword_2556DC6E0);
          v110(v129, v40);
          v110((char *)v105, v40);
          sub_2215D2098(v99, qword_2556DC6E0);
          v103 = v138;
          if ((v109 & 1) != 0)
          {
LABEL_28:
            if (v103)
            {
              v111 = *v104;
              v112 = *(os_unfair_lock_s **)(*v104 + 24);
              swift_retain();
              swift_retain();
              os_unfair_lock_lock(v112);
              swift_beginAccess();
              v113 = *(id *)(v111 + 16);
              os_unfair_lock_unlock(v112);
              swift_release();
              objc_msgSend(v113, sel_transform);
              v140 = v114;

              v115 = v140;
              v115.i32[3] = 0;
              v69 = WorldPlane.refresh(anchor:camera:uncertaintyPoint:)(v137, v121, v115);
              swift_release_n();
              return v69 & 1;
            }
LABEL_31:
            v69 = 0;
            return v69 & 1;
          }
LABEL_30:
          swift_release();
          goto LABEL_31;
        }
        sub_2215D2098(v127, qword_2556DC6E0);
        sub_2215D2098(v92, qword_2556DC6E0);
        v107 = v132;
        v132((uint64_t)v129, v40);
        v107(v105, v40);
      }
      sub_2215D2098(v99, &qword_2556DC6D8);
      goto LABEL_30;
    }
    sub_2215D2098(v134, qword_2556DC6E0);
    sub_2215D2098(v135, qword_2556DC6E0);
    v59 = v132;
    v132(v140.i64[0], v40);
    v59(v58, v40);
    v53 = (uint64_t)v131;
LABEL_11:
    v131 = v57;
    sub_2215D2098(v53, &qword_2556DC6D8);
    goto LABEL_14;
  }
  sub_2215D2098(v54, qword_2556DC6E0);
  sub_2215D2098(v51, qword_2556DC6E0);
  v132(v55, v40);
  if (v57(v56, 1, v40) != 1)
    goto LABEL_11;
  sub_2215D2098(v53, qword_2556DC6E0);
LABEL_13:
  v132((uint64_t)v120, v40);
  v65 = *v118;
  v66 = *(os_unfair_lock_s **)(*v118 + 24);
  v67 = v137;
  v68 = v137;
  swift_retain();
  os_unfair_lock_lock(v66);
  v69 = 1;
  swift_beginAccess();
  v70 = *(void **)(v65 + 16);
  *(_QWORD *)(v65 + 16) = v67;
  v71 = v68;

  os_unfair_lock_unlock(v66);
  swift_release();
  swift_release();

  return v69 & 1;
}

Swift::Void __swiftcall WorldAnchor.update()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  os_unfair_lock_s *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  os_unfair_lock_s *v23;
  void *v24;
  id v25;
  float32x4_t v26;
  float32x4_t v27;
  char *v28;
  uint64_t *v29;
  uint64_t v30;
  os_unfair_lock_s *v31;
  id v32;
  float32x4_t v33;
  float32x4_t v34;
  int32x4_t v35;
  float32x2_t v36;
  float32x2_t v37;
  char *v38;
  uint64_t v39;
  os_unfair_lock_s *v40;
  uint64_t v41;
  uint64_t v42;
  os_unfair_lock_s *v43;
  id v44;
  void *v45;
  id v46;
  float32x4_t v47;
  uint64_t *v48;
  uint64_t v49;
  os_unfair_lock_s *v50;
  id v51;
  float32x4_t v52;
  __int128 v53;
  float32x4_t v54;
  float32x4_t v55;
  uint64_t v56;
  __int128 v57;
  float32x4_t v58;
  void (**v59)(uint64_t);
  void (*v60)(uint64_t);
  uint64_t v61;
  id v62;
  unint64_t v63;
  char *v64;
  char *v65;
  float32x4_t v66;
  BOOL v67;
  int v68;
  float32x4_t v69;
  id v70;
  char *v71;
  uint64_t v72;
  char *v73;
  os_unfair_lock_s *v74;
  id v75;
  os_unfair_lock_s *v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float v81;
  float32x4_t v82;
  char **p_attr;
  id v84;
  int8x16_t v85;
  float32x2_t v86;
  float32x2_t v87;
  float32x2_t v88;
  float32x2_t v89;
  id v90;
  id v91;
  void *v92;
  uint64_t v93;
  __int128 v94;
  float32x4_t v95;
  float32x4_t v96;
  float32x4_t v97;
  int v98;
  int v99;
  char *v100;
  uint64_t v101;
  char *v102;
  os_unfair_lock_s *v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  uint64_t v109;
  os_unfair_lock_s *v110;
  id v111;
  void *v112;
  id v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  os_unfair_lock_s *v117;
  id v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  os_unfair_lock_s *v124;
  id v125;
  __int128 v126;
  float32x4_t v127;
  float32x4_t v128;
  float32x4_t v129;
  float32x4_t *v130;
  float32x4_t v131;
  char *v132;
  void (*v133)(uint64_t);
  uint64_t v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  os_unfair_lock_s *v140;
  id v141;
  float32x4_t v142;
  float32x2_t v143;
  uint64_t v144;
  os_unfair_lock_s *v145;
  id v146;
  float32x4_t v147;
  float32x4_t v148;
  float32x4_t v149;
  __int128 v150;
  float32x4_t *v151;
  float32x4_t v152;
  char *v153;
  void (*v154)(uint64_t);
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  os_unfair_lock_s *v161;
  id v162;
  id v163;
  __int128 v164;
  uint64_t v165;
  float32x4_t v166;
  float32x4_t v167;
  char *v168;
  uint64_t v169;
  char *v170;
  os_unfair_lock_s *v171;
  id v172;
  id v173;
  __int128 v174;
  uint64_t v175;
  uint64_t v176;
  os_unfair_lock_s *v177;
  uint64_t v178;
  uint64_t v179;
  os_unfair_lock_s *v180;
  id v181;
  id v182;
  void *v183;
  uint64_t v184;
  id v185;
  void *v186;
  id v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  int v192;
  int v193;
  char *v194;
  uint64_t v195;
  os_unfair_lock_s *v196;
  id v197;
  id v198;
  void (*v199)(char *, uint64_t);
  id v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  char *v206;
  void (*v207)(char *, uint64_t);
  __int128 v208;
  float32x4_t v209;
  float32x4_t v210;
  char *v211;
  float32x4_t *v212;
  float32x4_t v213;
  float32x4_t v214;
  float32x4_t v215;
  __int128 v216;
  id v217[3];
  id v218;
  uint64_t v219;
  unint64_t v220;
  uint64_t v221;
  uint64_t v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  float32x4_t v226;
  float32x4_t v227;
  float32x4_t v228;
  uint64_t v229;
  uint64_t v230;
  char v231;
  uint64_t v232;
  int v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  uint64_t v239;
  uint64_t v240;
  char v241;
  uint64_t v242;
  int v243;

  v1 = v0;
  v2 = sub_221652FD0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v204 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2216536CC();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v204 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  if (!static WorldAnchor.arSession)
    return;
  v9 = objc_msgSend((id)static WorldAnchor.arSession, sel_currentFrame);
  if (!v9)
    return;
  v10 = v9;
  v11 = objc_msgSend(v9, sel_camera);
  sub_2216536D8();

  v12 = sub_2216536C0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 48))(v8, 2, v12) != 2
    || (v13 = objc_msgSend(v10, sel_worldTrackingState)) == 0
    || (v14 = v13, v15 = objc_msgSend(v13, sel_vioTrackingState), v14, v15))
  {

    sub_221638AD4((uint64_t)v8);
    return;
  }
  v218 = v10;
  sub_221638AD4((uint64_t)v8);
  v16 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__viewAnchor);
  swift_beginAccess();
  v17 = *v16;
  v18 = *(os_unfair_lock_s **)(*v16 + 24);
  swift_retain();
  os_unfair_lock_lock(v18);
  swift_beginAccess();
  v19 = *(void **)(v17 + 16);
  v20 = v1;
  v21 = v19;
  os_unfair_lock_unlock(v18);
  swift_release();

  if (!v19)
  {
    v48 = (uint64_t *)(v20 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__pointAnchor);
    swift_beginAccess();
    v49 = *v48;
    v50 = *(os_unfair_lock_s **)(v49 + 24);
    swift_retain();
    os_unfair_lock_lock(v50);
    swift_beginAccess();
    v51 = *(id *)(v49 + 16);
    os_unfair_lock_unlock(v50);
    swift_release();
    objc_msgSend(v51, sel_transform);
    v216 = v53;
    *(float32x4_t *)v217 = v52;
    v214 = v55;
    v215 = v54;

    v56 = v20 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform;
    v57 = v216;
    *(_OWORD *)v56 = *(_OWORD *)v217;
    *(_OWORD *)(v56 + 16) = v57;
    v58 = v214;
    *(float32x4_t *)(v56 + 32) = v215;
    *(float32x4_t *)(v56 + 48) = v58;
    v59 = (void (**)(uint64_t))(v20 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler);
    swift_beginAccess();
    v60 = *v59;
    if (*v59)
    {
      v61 = swift_retain();
      v60(v61);

      sub_2215EE3DC((uint64_t)v60);
      return;
    }
    v70 = v218;
    goto LABEL_66;
  }
  *(_QWORD *)&v216 = v20;
  v22 = *v16;
  v23 = *(os_unfair_lock_s **)(*v16 + 24);
  swift_retain();
  os_unfair_lock_lock(v23);
  swift_beginAccess();
  v24 = *(void **)(v22 + 16);
  v25 = v24;
  os_unfair_lock_unlock(v23);
  swift_release();
  if (!v24)
  {
    __break(1u);
    goto LABEL_89;
  }
  objc_msgSend(v25, sel_transform);
  *(float32x4_t *)v217 = v26;

  v27 = *(float32x4_t *)v217;
  v27.i32[3] = 0;
  v215 = v27;
  v28 = (char *)v216;
  v29 = (uint64_t *)(v216 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__targetAnchor);
  swift_beginAccess();
  v30 = *v29;
  v31 = *(os_unfair_lock_s **)(v30 + 24);
  swift_retain();
  os_unfair_lock_lock(v31);
  swift_beginAccess();
  v32 = *(id *)(v30 + 16);
  os_unfair_lock_unlock(v31);
  swift_release();
  objc_msgSend(v32, sel_transform);
  v214 = v33;

  v34 = vsubq_f32(v214, *(float32x4_t *)v217);
  v35 = (int32x4_t)vmulq_f32(v34, v34);
  v35.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v35, 2), vadd_f32(*(float32x2_t *)v35.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v35.i8, 1))).u32[0];
  v36 = vrsqrte_f32((float32x2_t)v35.u32[0]);
  v37 = vmul_f32(v36, vrsqrts_f32((float32x2_t)v35.u32[0], vmul_f32(v36, v36)));
  *(float32x4_t *)v217 = vmulq_n_f32(v34, vmul_f32(v37, vrsqrts_f32((float32x2_t)v35.u32[0], vmul_f32(v37, v37))).f32[0]);
  v38 = &v28[OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane];
  swift_beginAccess();
  v39 = *(_QWORD *)v38;
  v40 = *(os_unfair_lock_s **)(*(_QWORD *)v38 + 24);
  swift_retain();
  os_unfair_lock_lock(v40);
  swift_beginAccess();
  v41 = *(_QWORD *)(v39 + 16);
  swift_retain();
  os_unfair_lock_unlock(v40);
  swift_release();
  v210.i64[0] = (uint64_t)v38;
  if (v41)
  {
    swift_beginAccess();
    v42 = *(_QWORD *)(v41 + 16);
    v43 = *(os_unfair_lock_s **)(v42 + 24);
    swift_retain();
    swift_retain();
    os_unfair_lock_lock(v43);
    swift_beginAccess();
    v44 = *(id *)(v42 + 16);
    os_unfair_lock_unlock(v43);
    swift_release();
    swift_release();
    objc_opt_self();
    v45 = (void *)swift_dynamicCastObjCClass();
    if (v45)
    {
      v46 = objc_msgSend(v45, sel__hitTestFromOrigin_withDirection_usingExtent_usingGeometry_, 0, 0, *(double *)v215.i64, *(double *)v217);

    }
    else
    {

      v46 = 0;
    }
    v28 = (char *)v216;
    if (!*(_BYTE *)(v41 + 48))
    {
      v64 = 0;
      v47.i64[0] = *(_QWORD *)(v216 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);
      v215 = v47;
      v211 = (char *)(v216 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);
      v212 = (float32x4_t *)(v216 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
      v47.i32[0] = *(_DWORD *)(v216 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 56);
      v214 = v47;
      goto LABEL_40;
    }
  }
  else
  {
    v46 = 0;
  }
  v62 = objc_msgSend(v218, sel__hitTestFromOrigin_withDirection_types_, 32, *(double *)v215.i64, *(double *)v217);
  sub_2215DDC80(0, &qword_2556DC6A8);
  v63 = sub_221653324();

  if (v63 >> 62)
  {
    swift_bridgeObjectRetain();
    v64 = (char *)sub_2216539F0();
    swift_bridgeObjectRelease();
    if (!v64)
      goto LABEL_24;
  }
  else
  {
    v64 = *(char **)((v63 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v64)
      goto LABEL_24;
  }
  if ((v63 & 0xC000000000000001) != 0)
  {
    v65 = (char *)MEMORY[0x22766ED44](0, v63);
  }
  else
  {
    if (!*(_QWORD *)((v63 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_87;
    }
    v65 = (char *)*(id *)(v63 + 32);
  }
  v64 = v65;
LABEL_24:
  swift_bridgeObjectRelease();
  v217[0] = (id)v41;
  if (v41)
    v67 = v64 == 0;
  else
    v67 = 1;
  v68 = !v67;
  v66.i64[0] = *(_QWORD *)&v28[OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48];
  v215 = v66;
  v211 = &v28[OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48];
  v212 = (float32x4_t *)&v28[OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform];
  v66.i32[0] = *(_DWORD *)&v28[OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 56];
  v214 = v66;
  if (!v64)
    goto LABEL_39;
  if (v46)
  {
    objc_msgSend(v46, sel_worldTransform);
    v213 = v69;
  }
  else
  {
    v71 = &v28[OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__pointAnchor];
    swift_beginAccess();
    v72 = *(_QWORD *)v71;
    v73 = v64;
    v74 = *(os_unfair_lock_s **)(v72 + 24);
    swift_retain();
    os_unfair_lock_lock(v74);
    swift_beginAccess();
    v75 = *(id *)(v72 + 16);
    v76 = v74;
    v64 = v73;
    v46 = 0;
    os_unfair_lock_unlock(v76);
    swift_release();
    objc_msgSend(v75, sel_transform);
    v213 = v77;

    v28 = (char *)v216;
  }
  objc_msgSend(v64, sel_worldTransform);
  if (v68)
  {
    v79 = vsubq_f32(v213, v78);
    v80 = vmulq_f32(v79, v79);
    v81 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v80, 2), vaddq_f32(v80, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v80.f32, 1))).f32[0]);
    if (v46)
    {
      objc_msgSend(v46, sel_worldTransform);
      v213 = v82;
    }
    else
    {
      v213 = v212[1];
    }
    objc_msgSend(v64, sel_worldTransform);
    v41 = (uint64_t)v217[0];
    if (v81 < 0.003)
    {
      v167 = vmulq_f32(v213, v166);
      if ((float)(v167.f32[2] + vaddv_f32(*(float32x2_t *)v167.f32)) > 0.99619)
      {
        v213.i64[0] = (uint64_t)v64;
        if (qword_2556D8F28 != -1)
          swift_once();
        v209.i64[0] = qword_2556E46B0;
        *(_QWORD *)&v208 = *(_QWORD *)algn_2556E46B8;
        *(_QWORD *)&v234 = 0;
        *((_QWORD *)&v234 + 1) = 0xE000000000000000;
        sub_221653894();
        sub_221653210();
        v168 = &v28[OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__pointAnchor];
        swift_beginAccess();
        v206 = v168;
        v169 = *(_QWORD *)v168;
        v170 = v28;
        v171 = *(os_unfair_lock_s **)(v169 + 24);
        swift_retain();
        os_unfair_lock_lock(v171);
        swift_beginAccess();
        v172 = *(id *)(v169 + 16);
        os_unfair_lock_unlock(v171);
        swift_release();
        v173 = objc_msgSend(v172, sel_identifier);

        sub_221652FB8();
        sub_221652FA0();
        v207 = *(void (**)(char *, uint64_t))(v3 + 8);
        v207(v5, v2);
        sub_221653210();
        swift_bridgeObjectRelease();
        sub_221653210();
        sub_22165342C();
        sub_221653210();
        v174 = v234;
        v175 = sub_221653618();
        _s17MeasureFoundation3LogV3log_4type9isPrivateySS_So03os_d1_E2_taSbtF_0(v174, *((uint64_t *)&v174 + 1), v175, 0, v209.i64[0], v208);
        swift_bridgeObjectRelease();
        v176 = *(_QWORD *)v210.i64[0];
        v177 = *(os_unfair_lock_s **)(*(_QWORD *)v210.i64[0] + 24);
        swift_retain();
        os_unfair_lock_lock(v177);
        swift_beginAccess();
        v178 = *(_QWORD *)(v176 + 16);
        swift_retain();
        os_unfair_lock_unlock(v177);
        swift_release();
        if (!v178)
          goto LABEL_91;
        swift_beginAccess();
        v179 = *(_QWORD *)(v178 + 16);
        v180 = *(os_unfair_lock_s **)(v179 + 24);
        swift_retain();
        os_unfair_lock_lock(v180);
        swift_beginAccess();
        v181 = *(id *)(v179 + 16);
        os_unfair_lock_unlock(v180);
        swift_release();
        swift_release();
        sub_221636358(v181);

        swift_release();
        v64 = (char *)v213.i64[0];
        v182 = objc_msgSend((id)v213.i64[0], sel_anchor);
        v28 = v170;
        if (v182)
        {
          v183 = v182;
          objc_opt_self();
          v184 = swift_dynamicCastObjCClass();
          if (v184)
          {
            v210.i64[0] = v184;
            v217[0] = v64;
            v185 = objc_msgSend(v217[0], sel_anchor);
            if (!v185)
            {
LABEL_92:
              __break(1u);
              return;
            }
            v186 = v185;
            v209.i64[0] = (uint64_t)v183;
            type metadata accessor for WorldPlane();
            swift_allocObject();
            v41 = sub_22164164C(v186, 0, 0.0, 1.0);

            v187 = v217[0];
            objc_msgSend(v217[0], sel_worldTransform);
            v234 = xmmword_221657CB0;
            v235 = v188;
            v236 = v189;
            v237 = v190;
            v238 = v191;
            v239 = 0;
            v240 = 0;
            v241 = 1;
            v242 = v41;
            v243 = 0;
            swift_retain();
            sub_221641268();
            v193 = v192;

            swift_release();
            v194 = &v28[OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_confidence];
            swift_beginAccess();
            *(_DWORD *)v194 = v193;
            swift_retain();
            sub_221635E7C((void *)v210.i64[0]);
            if (qword_2556D8F30 != -1)
              swift_once();
            *(_QWORD *)&v208 = qword_2556E46C8;
            v205 = unk_2556E46D0;
            *(_QWORD *)&v224 = 0;
            *((_QWORD *)&v224 + 1) = 0xE000000000000000;
            sub_221653894();
            swift_bridgeObjectRelease();
            strcpy((char *)&v224, "World anchor ");
            HIWORD(v224) = -4864;
            v195 = *(_QWORD *)v206;
            v196 = *(os_unfair_lock_s **)(*(_QWORD *)v206 + 24);
            swift_retain();
            os_unfair_lock_lock(v196);
            swift_beginAccess();
            v197 = *(id *)(v195 + 16);
            os_unfair_lock_unlock(v196);
            swift_release();
            v198 = objc_msgSend(v197, sel_identifier);

            sub_221652FB8();
            sub_221652FA0();
            v199 = v207;
            v207(v5, v2);
            sub_221653210();
            swift_bridgeObjectRelease();
            sub_221653210();
            v200 = objc_msgSend((id)v210.i64[0], sel_identifier);
            sub_221652FB8();

            sub_221652FA0();
            v199(v5, v2);
            sub_221653210();
            swift_bridgeObjectRelease();
            sub_221653210();
            v202 = *((_QWORD *)&v224 + 1);
            v201 = v224;
            v203 = sub_221653618();
            _s17MeasureFoundation3LogV3log_4type9isPrivateySS_So03os_d1_E2_taSbtF_0(v201, v202, v203, 0, v208, v205);

            swift_release();
            swift_bridgeObjectRelease();
            v84 = v217[0];

            v64 = (char *)v213.i64[0];
            v46 = (id)v213.i64[0];
            v28 = (char *)v216;
            p_attr = (char **)(&stru_24E72FFF8 + 8);
            goto LABEL_42;
          }

        }
        v41 = 0;
      }
    }
  }
  else
  {
LABEL_39:
    v41 = (uint64_t)v217[0];
  }
LABEL_40:
  p_attr = &stru_24E72FFF8.attr;
  if (!v46)
  {
    v213.i64[0] = (uint64_t)v64;
    v217[0] = (id)v41;
    *(_QWORD *)&v216 = 0;
    goto LABEL_55;
  }
  v84 = v46;
LABEL_42:
  objc_msgSend(v84, sel_worldTransform);
  v86.i32[0] = vextq_s8(v85, v85, 8uLL).u32[0];
  v86.i32[1] = v85.i32[0];
  v87 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v215.f32, 0);
  v87.i32[0] = v214.i32[0];
  v88 = vsub_f32(v86, v87);
  v89 = vmul_f32(v88, v88);
  v213.i64[0] = (uint64_t)v64;
  v217[0] = (id)v41;
  if (sqrtf(v89.f32[0]+ (float)(v89.f32[1]+ (float)((float)(*(float *)&v85.i32[1] - v215.f32[1]) * (float)(*(float *)&v85.i32[1] - v215.f32[1])))) <= 0.00000011921)
  {
    *(_QWORD *)&v216 = v46;
LABEL_55:
    v138 = &v28[OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__pointAnchor];
    swift_beginAccess();
    v139 = *(_QWORD *)v138;
    v140 = *(os_unfair_lock_s **)(*(_QWORD *)v138 + 24);
    swift_retain();
    os_unfair_lock_lock(v140);
    swift_beginAccess();
    v64 = v28;
    v141 = *(id *)(v139 + 16);
    os_unfair_lock_unlock(v140);
    swift_release();
    objc_msgSend(v141, p_attr[239]);
    v210 = v142;

    v143 = vsub_f32(*(float32x2_t *)v210.f32, *(float32x2_t *)v215.f32);
    if (sqrtf((float)((float)(v210.f32[2] - v214.f32[0]) * (float)(v210.f32[2] - v214.f32[0]))+ vaddv_f32(vmul_f32(v143, v143))) <= 0.00000011921)
    {

LABEL_65:
      swift_release();

      v70 = (id)v216;
LABEL_66:

      return;
    }
    v215.i64[0] = (uint64_t)v138;
    v144 = *(_QWORD *)v138;
    v145 = *(os_unfair_lock_s **)(*(_QWORD *)v138 + 24);
    swift_retain();
    os_unfair_lock_lock(v145);
    swift_beginAccess();
    v146 = *(id *)(v144 + 16);
    os_unfair_lock_unlock(v145);
    swift_release();
    objc_msgSend(v146, p_attr[239]);
    v214 = v147;
    v209 = v149;
    v210 = v148;
    v208 = v150;

    v151 = v212;
    v152 = v210;
    *v212 = v214;
    v151[1] = v152;
    v151[2] = v209;
    *(_OWORD *)v211 = v208;
    v153 = &v64[OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler];
    swift_beginAccess();
    v154 = *(void (**)(uint64_t))v153;
    if (*(_QWORD *)v153)
    {
      v155 = swift_retain();
      v154(v155);
      sub_2215EE3DC((uint64_t)v154);
    }
    if (qword_2556D8F20 == -1)
    {
LABEL_59:
      swift_beginAccess();
      if (qword_2556E4678)
      {
        sub_2215E70EC((uint64_t)&static WorldAnchor.delegate, (uint64_t)&v224);
        v156 = *((_QWORD *)&v225 + 1);
        v157 = v226.i64[0];
        __swift_project_boxed_opaque_existential_0(&v224, *((uint64_t *)&v225 + 1));
        (*(void (**)(char *, uint64_t, uint64_t))(v157 + 16))(v64, v156, v157);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v224);
      }
      if (qword_2556D8F30 != -1)
        swift_once();
      v158 = qword_2556E46C8;
      v159 = unk_2556E46D0;
      *(_QWORD *)&v224 = 0;
      *((_QWORD *)&v224 + 1) = 0xE000000000000000;
      sub_221653894();
      v223 = v224;
      sub_221653210();
      v160 = *(_QWORD *)v215.i64[0];
      v161 = *(os_unfair_lock_s **)(*(_QWORD *)v215.i64[0] + 24);
      swift_retain();
      os_unfair_lock_lock(v161);
      swift_beginAccess();
      v162 = *(id *)(v160 + 16);
      os_unfair_lock_unlock(v161);
      swift_release();
      v163 = objc_msgSend(v162, sel_identifier);

      sub_221652FB8();
      sub_221652FA0();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      sub_221653210();
      swift_bridgeObjectRelease();
      sub_221653210();
      sub_22165342C();
      sub_221653210();
      v164 = v223;
      v165 = sub_221653630();
      _s17MeasureFoundation3LogV3log_4type9isPrivateySS_So03os_d1_E2_taSbtF_0(v164, *((uint64_t *)&v164 + 1), v165, 0, v158, v159);

      swift_bridgeObjectRelease();
      goto LABEL_65;
    }
LABEL_87:
    swift_once();
    goto LABEL_59;
  }
  v90 = v84;
  v91 = objc_msgSend(v90, sel_anchor);
  if (!v91)
  {
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  v92 = v91;
  type metadata accessor for WorldPlane();
  swift_allocObject();
  v93 = sub_22164164C(v92, 0, 0.0, 1.0);

  objc_msgSend(v90, sel_worldTransform);
  v215 = v95;
  v216 = v94;
  v214 = v96;
  v210 = v97;
  v224 = xmmword_221657CB0;
  v225 = v94;
  v226 = v95;
  v227 = v96;
  v228 = v97;
  v230 = 0;
  v229 = 0;
  v231 = 1;
  v232 = v93;
  v233 = 0;
  swift_retain();
  sub_221641268();
  v99 = v98;
  v209.i64[0] = (uint64_t)v90;

  *(_QWORD *)&v208 = v93;
  swift_release();
  v100 = &v28[OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__pointAnchor];
  swift_beginAccess();
  v101 = *(_QWORD *)v100;
  v102 = v28;
  v103 = *(os_unfair_lock_s **)(*(_QWORD *)v100 + 24);
  swift_retain();
  os_unfair_lock_lock(v103);
  swift_beginAccess();
  v104 = *(id *)(v101 + 16);
  os_unfair_lock_unlock(v103);
  swift_release();
  v105 = objc_allocWithZone(MEMORY[0x24BDFD910]);
  v106 = objc_msgSend(v105, sel_initWithTransform_, *(double *)&v216, *(double *)v215.i64, *(double *)v214.i64, *(double *)v210.i64);
  v107 = sub_221637E44(v104, v106);
  v108 = v107;

  if (!v107)
  {
LABEL_90:
    __break(1u);
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  v109 = *(_QWORD *)v100;
  v110 = *(os_unfair_lock_s **)(*(_QWORD *)v100 + 24);
  v111 = v108;
  swift_retain();
  os_unfair_lock_lock(v110);
  swift_beginAccess();
  v112 = *(void **)(v109 + 16);
  *(_QWORD *)(v109 + 16) = v111;
  v113 = v111;

  os_unfair_lock_unlock(v110);
  swift_release();
  v114 = &v102[OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_confidence];
  swift_beginAccess();
  *(_DWORD *)v114 = v99;
  if (qword_2556D8F30 != -1)
    swift_once();
  v115 = unk_2556E46D0;
  *(_QWORD *)&v216 = qword_2556E46C8;
  v219 = 0;
  v220 = 0xE000000000000000;
  sub_221653894();
  sub_221653210();
  v116 = *(_QWORD *)v100;
  v117 = *(os_unfair_lock_s **)(*(_QWORD *)v100 + 24);
  swift_retain();
  os_unfair_lock_lock(v117);
  swift_beginAccess();
  v118 = *(id *)(v116 + 16);
  os_unfair_lock_unlock(v117);
  swift_release();
  v119 = objc_msgSend(v118, sel_identifier);

  sub_221652FB8();
  sub_221652FA0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_221653210();
  swift_bridgeObjectRelease();
  sub_221653210();
  sub_22165342C();
  sub_221653210();
  v120 = v219;
  v121 = v220;
  v122 = sub_221653630();
  _s17MeasureFoundation3LogV3log_4type9isPrivateySS_So03os_d1_E2_taSbtF_0(v120, v121, v122, 0, v216, v115);
  swift_bridgeObjectRelease();
  v123 = *(_QWORD *)v100;
  v124 = *(os_unfair_lock_s **)(*(_QWORD *)v100 + 24);
  swift_retain();
  os_unfair_lock_lock(v124);
  swift_beginAccess();
  v125 = *(id *)(v123 + 16);
  os_unfair_lock_unlock(v124);
  swift_release();
  objc_msgSend(v125, sel_transform);
  v215 = v127;
  v216 = v126;
  v214 = v128;
  v210 = v129;

  v130 = v212;
  v131 = v215;
  *v212 = (float32x4_t)v216;
  v130[1] = v131;
  v130[2] = v214;
  *(float32x4_t *)v211 = v210;
  v132 = &v102[OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler];
  swift_beginAccess();
  v133 = *(void (**)(uint64_t))v132;
  if (*(_QWORD *)v132)
  {
    v134 = swift_retain();
    v133(v134);
    sub_2215EE3DC((uint64_t)v133);
  }
  v135 = (void *)v213.i64[0];
  if (qword_2556D8F20 != -1)
    swift_once();
  swift_beginAccess();
  if (qword_2556E4678)
  {
    sub_2215E70EC((uint64_t)&static WorldAnchor.delegate, (uint64_t)&v219);
    v136 = v221;
    v137 = v222;
    __swift_project_boxed_opaque_existential_0(&v219, v221);
    (*(void (**)(char *, uint64_t, uint64_t))(v137 + 16))(v102, v136, v137);

    swift_release();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v219);
  }
  else
  {

    swift_release();
  }

  swift_release();
}

uint64_t sub_221635E7C(void *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD *v18;
  os_unfair_lock_s *v19;
  uint64_t v20;
  char v21;
  void (*v22)(char *, uint64_t);
  id v23;
  char *v24;
  void (*v25)(uint64_t, char);
  void (*v26)(_QWORD *);
  _QWORD *v27;
  void (*v28)(char *, uint64_t);
  id v29;
  uint64_t inited;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  os_unfair_lock_s *v34;
  uint64_t v35;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v37;
  os_unfair_lock_s *v38;
  _QWORD v39[2];
  char *v40;
  _QWORD v41[4];
  uint64_t v42;
  _QWORD v43[9];

  v3 = *v1;
  v4 = sub_221652FD0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)v39 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v39 - v12;
  objc_opt_self();
  if (!swift_dynamicCastObjCClass())
  {
    swift_beginAccess();
    result = static WorldAnchor.arSession;
    if (!static WorldAnchor.arSession)
    {
      __break(1u);
      return result;
    }
    objc_msgSend((id)static WorldAnchor.arSession, sel_addAnchor_, a1);
  }
  v39[1] = v3;
  v40 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC4D0);
  v15 = swift_allocObject();
  swift_weakInit();
  swift_beginAccess();
  swift_weakAssign();
  sub_221653B88();
  sub_2215BB99C((unint64_t *)&qword_2556DA0C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  swift_retain();
  sub_221653114();
  v16 = sub_221653BAC();
  swift_release();
  *(_QWORD *)(v15 + 24) = v16;
  v17 = objc_msgSend(a1, sel_identifier);
  sub_221652FB8();

  if (qword_2556D8F18 != -1)
    swift_once();
  v18 = off_2556DE0A0;
  v19 = (os_unfair_lock_s *)*((_QWORD *)off_2556DE0A0 + 3);
  swift_retain();
  os_unfair_lock_lock(v19);
  swift_beginAccess();
  v20 = v18[2];
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v19);
  swift_release();
  if (*(_QWORD *)(v20 + 16) && (sub_2215CA2D8((uint64_t)v13), (v21 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v22 = *(void (**)(char *, uint64_t))(v5 + 8);
    v22(v13, v4);
    swift_bridgeObjectRelease();
    v23 = objc_msgSend(a1, sel_identifier);
    v24 = v40;
    sub_221652FB8();

    v25 = sub_221632408(v43);
    v26 = sub_221612288(v41);
    if (*v27)
    {
      swift_retain();
      sub_2215FE0BC(&v42, v15);
      ((void (*)(_QWORD *, _QWORD))v26)(v41, 0);
      v22(v24, v4);
      v25((uint64_t)v43, 0);
      swift_release();
    }
    else
    {
      ((void (*)(_QWORD *, _QWORD))v26)(v41, 0);
      v22(v24, v4);
      v25((uint64_t)v43, 0);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    v28 = *(void (**)(char *, uint64_t))(v5 + 8);
    v28(v13, v4);
    v29 = objc_msgSend(a1, sel_identifier);
    sub_221652FB8();

    __swift_instantiateConcreteTypeFromMangledName(&qword_2556DB3A0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2216570D0;
    *(_QWORD *)(inited + 32) = v15;
    v43[0] = inited;
    sub_22165333C();
    v31 = v43[0];
    swift_retain();
    v32 = sub_221637CF4(v31);
    swift_bridgeObjectRelease();
    v33 = off_2556DE0A0;
    v34 = (os_unfair_lock_s *)*((_QWORD *)off_2556DE0A0 + 3);
    swift_retain();
    os_unfair_lock_lock(v34);
    swift_beginAccess();
    v35 = *((_QWORD *)v33 + 2);
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v34);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v41[0] = v35;
    sub_22161CD1C(v32, (uint64_t)v8, isUniquelyReferenced_nonNull_native);
    v37 = v41[0];
    swift_bridgeObjectRelease();
    v28(v8, v4);
    v38 = (os_unfair_lock_s *)*((_QWORD *)v33 + 3);
    os_unfair_lock_lock(v38);
    *((_QWORD *)v33 + 2) = v37;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v38);
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_221636358(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  id v13;
  void (*v14)(uint64_t, char);
  void (*v15)(_QWORD *);
  _QWORD *v16;
  uint64_t v17;
  char *v18;
  void (*v19)(uint64_t, char);
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  id v22;
  id v23;
  _QWORD *v24;
  os_unfair_lock_s *v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  os_unfair_lock_s *v34;
  uint64_t v35;
  uint64_t v36;
  os_unfair_lock_s *v37;
  uint64_t v38;
  char *v39;
  void (*v40)(_QWORD *, _QWORD);
  id v41;
  _QWORD v42[4];
  _QWORD v43[4];

  v2 = sub_221652FD0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v38 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v38 - v10;
  objc_opt_self();
  if (!swift_dynamicCastObjCClass())
  {
    swift_beginAccess();
    result = static WorldAnchor.arSession;
    if (!static WorldAnchor.arSession)
    {
      __break(1u);
      return result;
    }
    objc_msgSend((id)static WorldAnchor.arSession, sel_removeAnchor_, a1);
  }
  v39 = v6;
  v41 = a1;
  v13 = objc_msgSend(a1, sel_identifier);
  sub_221652FB8();

  v14 = sub_221632408(v43);
  v15 = sub_221612288(v42);
  if (*v16)
  {
    v40 = (void (*)(_QWORD *, _QWORD))v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC4D0);
    v17 = swift_allocObject();
    swift_weakInit();
    swift_beginAccess();
    swift_weakAssign();
    sub_221653B88();
    sub_2215BB99C((unint64_t *)&qword_2556DA0C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    v18 = v9;
    v19 = v14;
    swift_retain();
    sub_221653114();
    v20 = sub_221653BAC();
    swift_release();
    *(_QWORD *)(v17 + 24) = v20;
    sub_2216166E8(v17);
    swift_release();
    v40(v42, 0);
    v21 = *(void (**)(char *, uint64_t))(v3 + 8);
    v21(v11, v2);
    v19((uint64_t)v43, 0);
    v9 = v18;
    swift_release();
  }
  else
  {
    ((void (*)(_QWORD *, _QWORD))v15)(v42, 0);
    v21 = *(void (**)(char *, uint64_t))(v3 + 8);
    v21(v11, v2);
    v14((uint64_t)v43, 0);
  }
  v22 = v41;
  v23 = objc_msgSend(v41, sel_identifier);
  sub_221652FB8();

  if (qword_2556D8F18 != -1)
    swift_once();
  v24 = off_2556DE0A0;
  v25 = (os_unfair_lock_s *)*((_QWORD *)off_2556DE0A0 + 3);
  swift_retain();
  os_unfair_lock_lock(v25);
  swift_beginAccess();
  v26 = v24[2];
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v25);
  swift_release();
  if (*(_QWORD *)(v26 + 16) && (v27 = sub_2215CA2D8((uint64_t)v9), (v28 & 1) != 0))
  {
    v29 = *(_QWORD *)(*(_QWORD *)(v26 + 56) + 8 * v27);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v21(v9, v2);
    if ((v29 & 0xC000000000000001) != 0)
      v30 = sub_221653810();
    else
      v30 = *(_QWORD *)(v29 + 16);
    result = swift_bridgeObjectRelease();
    if (!v30)
    {
      v31 = objc_msgSend(v22, sel_identifier);
      v32 = (uint64_t)v39;
      sub_221652FB8();

      v33 = off_2556DE0A0;
      v34 = (os_unfair_lock_s *)*((_QWORD *)off_2556DE0A0 + 3);
      swift_retain();
      os_unfair_lock_lock(v34);
      swift_beginAccess();
      v35 = *((_QWORD *)v33 + 2);
      swift_bridgeObjectRetain();
      os_unfair_lock_unlock(v34);
      v42[0] = v35;
      sub_221637388(v32);
      v21((char *)v32, v2);
      swift_bridgeObjectRelease();
      v36 = v42[0];
      v37 = (os_unfair_lock_s *)*((_QWORD *)v33 + 3);
      os_unfair_lock_lock(v37);
      *((_QWORD *)v33 + 2) = v36;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      os_unfair_lock_unlock(v37);
      swift_bridgeObjectRelease();
      return swift_release();
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(char *, uint64_t))v21)(v9, v2);
  }
  return result;
}

uint64_t static WorldAnchor.didUpdate(anchors:camera:forceUpdate:)(int64_t a1, uint64_t a2, char a3)
{
  unint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  id v14;
  _QWORD *v15;
  os_unfair_lock_s *v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  int64_t v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  int64_t v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  int64_t v61;
  unint64_t v62;

  LOBYTE(v3) = a3;
  v44 = a2;
  v5 = sub_221652FD0();
  v49 = *(_QWORD *)(v5 - 8);
  v50 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((unint64_t)a1 >> 62)
    goto LABEL_55;
  v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v8)
  {
LABEL_3:
    v9 = 0;
    v51 = 0;
    v48 = a1 & 0xC000000000000001;
    v42 = a1 & 0xFFFFFFFFFFFFFF8;
    v45 = a1;
    v41 = a1 + 32;
    v10 = MEMORY[0x24BEE4AF8];
    v54 = MEMORY[0x24BEE4AD0] + 8;
    v43 = v3 & 1;
    v46 = v7;
    v47 = v8;
LABEL_5:
    if (v48)
    {
      v11 = (id)MEMORY[0x22766ED44](v9, v45);
    }
    else
    {
      if (v9 >= *(_QWORD *)(v42 + 16))
        goto LABEL_54;
      v11 = *(id *)(v41 + 8 * v9);
    }
    v12 = v11;
    if (__OFADD__(v9++, 1))
      goto LABEL_53;
    v14 = objc_msgSend(v11, sel_identifier);
    sub_221652FB8();

    if (qword_2556D8F18 != -1)
      swift_once();
    v15 = off_2556DE0A0;
    v16 = (os_unfair_lock_s *)*((_QWORD *)off_2556DE0A0 + 3);
    swift_retain();
    os_unfair_lock_lock(v16);
    swift_beginAccess();
    v17 = v15[2];
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v16);
    swift_release();
    if (*(_QWORD *)(v17 + 16) && (v18 = sub_2215CA2D8((uint64_t)v7), (v19 & 1) != 0))
    {
      v20 = *(_QWORD *)(*(_QWORD *)(v17 + 56) + 8 * v18);
      swift_bridgeObjectRetain();
    }
    else
    {
      v20 = 0;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v49 + 8))(v7, v50);
    v3 = MEMORY[0x24BEE4B08];
    if ((v10 & 0xC000000000000000) != 0 && sub_2216539F0())
      v3 = sub_2215D1D5C(v10);
    v57 = v3;
    if (v20)
    {
      v21 = v12;
      v22 = v51;
      sub_2216379AC(v20, v21, v44, v43);
      v51 = v22;
      swift_bridgeObjectRelease();

      v3 = v57;
    }
    v53 = v12;
    if ((v3 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      sub_2216537D4();
      type metadata accessor for WorldAnchor();
      sub_2215BB99C(&qword_2556DE0F8, (uint64_t (*)(uint64_t))type metadata accessor for WorldAnchor, (uint64_t)&protocol conformance descriptor for WorldAnchor);
      sub_221653474();
      v3 = v58;
      v23 = v59;
      v24 = v60;
      v25 = v61;
      v26 = v62;
    }
    else
    {
      v27 = -1 << *(_BYTE *)(v3 + 32);
      v23 = v3 + 56;
      v24 = ~v27;
      v28 = -v27;
      if (v28 < 64)
        v29 = ~(-1 << v28);
      else
        v29 = -1;
      v26 = v29 & *(_QWORD *)(v3 + 56);
      swift_bridgeObjectRetain();
      v25 = 0;
    }
    v7 = (char *)(v3 & 0x7FFFFFFFFFFFFFFFLL);
    v52 = v24;
    a1 = (unint64_t)(v24 + 64) >> 6;
    if ((v3 & 0x8000000000000000) != 0)
    {
LABEL_28:
      v30 = sub_221653834();
      if (!v30)
        goto LABEL_4;
      v55 = v30;
      type metadata accessor for WorldAnchor();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v31 = v56;
      swift_unknownObjectRelease();
      v32 = v25;
      v33 = v26;
      if (!v31)
        goto LABEL_4;
      goto LABEL_43;
    }
    while (1)
    {
      if (v26)
      {
        v33 = (v26 - 1) & v26;
        v34 = __clz(__rbit64(v26)) | (v25 << 6);
        v32 = v25;
      }
      else
      {
        v32 = v25 + 1;
        if (__OFADD__(v25, 1))
        {
          __break(1u);
LABEL_53:
          __break(1u);
LABEL_54:
          __break(1u);
LABEL_55:
          swift_bridgeObjectRetain();
          v8 = sub_2216539F0();
          if (!v8)
            break;
          goto LABEL_3;
        }
        if (v32 >= a1)
          goto LABEL_4;
        v35 = *(_QWORD *)(v23 + 8 * v32);
        if (!v35)
        {
          v36 = v25 + 2;
          if (v25 + 2 >= a1)
            goto LABEL_4;
          v35 = *(_QWORD *)(v23 + 8 * v36);
          if (v35)
            goto LABEL_40;
          v36 = v25 + 3;
          if (v25 + 3 >= a1)
            goto LABEL_4;
          v35 = *(_QWORD *)(v23 + 8 * v36);
          if (v35)
          {
LABEL_40:
            v32 = v36;
          }
          else
          {
            v32 = v25 + 4;
            if (v25 + 4 >= a1)
            {
LABEL_4:
              v7 = v46;
              sub_2215D2090();

              swift_bridgeObjectRelease();
              v10 = MEMORY[0x24BEE4AF8];
              if (v9 == v47)
                break;
              goto LABEL_5;
            }
            v35 = *(_QWORD *)(v23 + 8 * v32);
            if (!v35)
            {
              v38 = v25 + 5;
              while (a1 != v38)
              {
                v35 = *(_QWORD *)(v23 + 8 * v38++);
                if (v35)
                {
                  v32 = v38 - 1;
                  goto LABEL_41;
                }
              }
              goto LABEL_4;
            }
          }
        }
LABEL_41:
        v33 = (v35 - 1) & v35;
        v34 = __clz(__rbit64(v35)) + (v32 << 6);
      }
      v37 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v34);
      swift_retain();
      if (!v37)
        goto LABEL_4;
LABEL_43:
      WorldAnchor.update()();
      swift_release();
      v25 = v32;
      v26 = v33;
      if ((v3 & 0x8000000000000000) != 0)
        goto LABEL_28;
    }
  }
  swift_bridgeObjectRelease();
  return _s17MeasureFoundation11WorldAnchorC6didAdd7anchorsySaySo8ARAnchorCG_tFZ_0();
}

uint64_t static WorldAnchor.didRemove(anchors:)(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t i;
  uint64_t j;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t k;
  id v14;
  void *v15;
  id v16;
  _QWORD *v17;
  os_unfair_lock_s *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = sub_221652FD0();
  v24 = *(_QWORD *)(v2 - 8);
  v25 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_2216539F0();
    v5 = result;
    if (!result)
      goto LABEL_15;
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (!v5)
      goto LABEL_15;
  }
  if (v5 < 1)
  {
    __break(1u);
    goto LABEL_34;
  }
  if ((a1 & 0xC000000000000001) != 0)
  {
    for (i = 0; i != v5; ++i)
    {
      MEMORY[0x22766ED44](i, a1);
      objc_opt_self();
      if (swift_dynamicCastObjCClass())
      {
        sub_2216538E8();
        sub_221653918();
        sub_221653924();
        sub_2216538F4();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    for (j = 0; j != v5; ++j)
    {
      v9 = *(void **)(a1 + 8 * j + 32);
      objc_opt_self();
      if (swift_dynamicCastObjCClass())
      {
        v10 = v9;
        sub_2216538E8();
        sub_221653918();
        sub_221653924();
        sub_2216538F4();
      }
    }
  }
LABEL_15:
  result = swift_bridgeObjectRelease();
  v11 = v26;
  if ((v26 & 0x8000000000000000) == 0 && (v26 & 0x4000000000000000) == 0)
  {
    v12 = *(_QWORD *)(v26 + 16);
    if (v12)
      goto LABEL_18;
    return swift_release();
  }
  swift_bridgeObjectRetain();
  v12 = sub_2216539F0();
  result = swift_release();
  if (!v12)
    return swift_release();
LABEL_18:
  if (v12 >= 1)
  {
    for (k = 0; k != v12; ++k)
    {
      if ((v11 & 0xC000000000000001) != 0)
        v14 = (id)MEMORY[0x22766ED44](k, v11);
      else
        v14 = *(id *)(v11 + 8 * k + 32);
      v15 = v14;
      v16 = objc_msgSend(v14, sel_identifier, v24, v25);
      sub_221652FB8();

      if (qword_2556D8F18 != -1)
        swift_once();
      v17 = off_2556DE0A0;
      v18 = (os_unfair_lock_s *)*((_QWORD *)off_2556DE0A0 + 3);
      swift_retain();
      os_unfair_lock_lock(v18);
      swift_beginAccess();
      v19 = v17[2];
      swift_bridgeObjectRetain();
      os_unfair_lock_unlock(v18);
      swift_release();
      if (*(_QWORD *)(v19 + 16) && (v20 = sub_2215CA2D8((uint64_t)v4), (v21 & 1) != 0))
      {
        v22 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v20);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v24 + 8))(v4, v25);
        v23 = v15;
        sub_2216381D0(v22, v23);
        swift_bridgeObjectRelease();

      }
      else
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v24 + 8))(v4, v25);
      }

    }
    return swift_release();
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t static WorldAnchor.resetPlanesConfidence()()
{
  return _s17MeasureFoundation11WorldAnchorC07forEachD0yyyAA15HashableWeakRefCyACGXEFZ_0((uint64_t)sub_2216370C4, 0);
}

uint64_t sub_2216370C4()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  uint64_t v4;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane;
    swift_beginAccess();
    v2 = *(_QWORD *)v1;
    v3 = *(os_unfair_lock_s **)(*(_QWORD *)v1 + 24);
    swift_retain();
    os_unfair_lock_lock(v3);
    swift_beginAccess();
    v4 = *(_QWORD *)(v2 + 16);
    swift_retain();
    os_unfair_lock_unlock(v3);
    swift_release();
    result = swift_release();
    if (v4)
    {
      *(_DWORD *)(v4 + 52) = 0;
      return swift_release();
    }
  }
  return result;
}

uint64_t WorldAnchor.hashValue.getter()
{
  sub_221653B88();
  sub_221652FD0();
  sub_2215BB99C((unint64_t *)&qword_2556DA0C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_221653114();
  return sub_221653BAC();
}

uint64_t sub_22163720C()
{
  sub_221653B88();
  sub_221652FD0();
  sub_2215BB99C((unint64_t *)&qword_2556DA0C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_221653114();
  return sub_221653BAC();
}

uint64_t sub_221637288()
{
  sub_221652FD0();
  sub_2215BB99C((unint64_t *)&qword_2556DA0C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_221653114();
}

uint64_t sub_2216372F4()
{
  sub_221653B88();
  sub_221652FD0();
  sub_2215BB99C((unint64_t *)&qword_2556DA0C0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_221653114();
  return sub_221653BAC();
}

uint64_t sub_22163736C()
{
  return sub_221652FAC();
}

uint64_t sub_221637388(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_2215CA2D8(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  v12 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2215CFD64();
    v7 = v12;
  }
  v8 = *(_QWORD *)(v7 + 48);
  v9 = sub_221652FD0();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * v4, v9);
  v10 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v4);
  sub_2215D0EE4(v4, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v10;
}

void sub_221637460(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  void *v4;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  char v14;
  id v15;
  void *v16;

  v6 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (sub_2216537F8() == *(_DWORD *)(a4 + 36))
      {
        sub_221653804();
        sub_2215DDC80(0, (unint64_t *)&qword_2556DC4D8);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v4 = v16;
        swift_unknownObjectRelease();
        v8 = sub_2216536E4();
        v9 = -1 << *(_BYTE *)(a4 + 32);
        v6 = v8 & ~v9;
        if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
        {
          v10 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          v11 = sub_2216536F0();

          if ((v11 & 1) == 0)
          {
            v12 = ~v9;
            do
            {
              v6 = (v6 + 1) & v12;
              if (((*(_QWORD *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
                goto LABEL_24;
              v13 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
              v14 = sub_2216536F0();

            }
            while ((v14 & 1) == 0);
          }

LABEL_20:
          v15 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v6);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v7 = a4;
  else
    v7 = a4 & 0xFFFFFFFFFFFFFF8;
  MEMORY[0x22766ECB4](a1, a2, v7);
  sub_2215DDC80(0, (unint64_t *)&qword_2556DC4D8);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
}

uint64_t sub_2216376C8(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;

  v5 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if ((a3 & 1) != 0)
    {
      if (a4 < 0)
        v6 = a4;
      else
        v6 = a4 & 0xFFFFFFFFFFFFFF8;
      MEMORY[0x22766ECB4](a1, a2, v6);
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC4D0);
      swift_dynamicCast();
      v7 = v16;
      swift_unknownObjectRelease();
      return v7;
    }
    goto LABEL_30;
  }
  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
      goto LABEL_27;
    }
    if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) == 0)
      goto LABEL_28;
    if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
      goto LABEL_24;
    __break(1u);
  }
  if (sub_2216537F8() != *(_DWORD *)(a4 + 36))
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    swift_release();
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  sub_221653804();
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC4D0);
  swift_dynamicCast();
  swift_unknownObjectRelease();
  sub_221653B88();
  sub_221653B94();
  v8 = sub_221653BAC();
  v9 = -1 << *(_BYTE *)(a4 + 32);
  v5 = v8 & ~v9;
  if (((*(_QWORD *)(a4 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
  {
LABEL_31:
    result = swift_release();
    __break(1u);
    return result;
  }
  v10 = ~v9;
  swift_beginAccess();
  while (1)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v5);
    swift_beginAccess();
    if (!swift_weakLoadStrong())
      break;
    if (!swift_weakLoadStrong())
    {
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_retain();
    v11 = sub_221652FAC();
    swift_release();
    swift_release();
    swift_release();
    if ((v11 & 1) != 0)
      goto LABEL_23;
LABEL_17:
    v5 = (v5 + 1) & v10;
    if (((*(_QWORD *)(a4 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
      goto LABEL_29;
  }
  swift_retain();
LABEL_22:
  v13 = *(_QWORD *)(v12 + 24);
  v14 = *(_QWORD *)(v16 + 24);
  swift_release();
  if (v13 != v14)
    goto LABEL_17;
LABEL_23:
  swift_release();
LABEL_24:
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v5);
  swift_retain();
  return v7;
}

uint64_t sub_2216379AC(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t Strong;
  uint64_t v24;
  char v25;
  char v26;
  _BYTE *v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;

  v6 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_2216537D4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC4D0);
    sub_221639C4C();
    result = sub_221653474();
    v6 = v31;
    v29 = v32;
    v8 = v33;
    v9 = v34;
    v10 = v35;
  }
  else
  {
    v11 = -1 << *(_BYTE *)(a1 + 32);
    v29 = a1 + 56;
    v12 = ~v11;
    v13 = -v11;
    if (v13 < 64)
      v14 = ~(-1 << v13);
    else
      v14 = -1;
    v10 = v14 & *(_QWORD *)(a1 + 56);
    result = swift_bridgeObjectRetain();
    v8 = v12;
    v9 = 0;
  }
  v28 = (unint64_t)(v8 + 64) >> 6;
  while (v6 < 0)
  {
    if (!sub_221653834())
      return sub_2215D2090();
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC4D0);
    swift_dynamicCast();
    v18 = v36;
    swift_unknownObjectRelease();
    v17 = v9;
    v15 = v10;
    if (!v18)
      return sub_2215D2090();
LABEL_32:
    swift_beginAccess();
    Strong = swift_weakLoadStrong();
    if (Strong)
    {
      v24 = Strong;
      v25 = sub_221633A20(a2, a3);
      if ((a4 & 1) != 0
        || (v26 = v25,
            v27 = (_BYTE *)(v24 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_autoUpdate),
            swift_beginAccess(),
            (*v27 & 1) != 0)
        && (v26 & 1) != 0)
      {
        sub_2215FE3F4(&v36, v24);
      }
      swift_release();
    }
    result = swift_release();
    v9 = v17;
    v10 = v15;
  }
  if (v10)
  {
    v15 = (v10 - 1) & v10;
    v16 = __clz(__rbit64(v10)) | (v9 << 6);
    v17 = v9;
LABEL_31:
    v22 = *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v16);
    swift_retain();
    if (!v22)
      return sub_2215D2090();
    goto LABEL_32;
  }
  v19 = v9 + 1;
  if (!__OFADD__(v9, 1))
  {
    if (v19 >= v28)
      return sub_2215D2090();
    v20 = *(_QWORD *)(v29 + 8 * v19);
    v17 = v9 + 1;
    if (!v20)
    {
      v17 = v9 + 2;
      if (v9 + 2 >= v28)
        return sub_2215D2090();
      v20 = *(_QWORD *)(v29 + 8 * v17);
      if (!v20)
      {
        v17 = v9 + 3;
        if (v9 + 3 >= v28)
          return sub_2215D2090();
        v20 = *(_QWORD *)(v29 + 8 * v17);
        if (!v20)
        {
          v17 = v9 + 4;
          if (v9 + 4 >= v28)
            return sub_2215D2090();
          v20 = *(_QWORD *)(v29 + 8 * v17);
          if (!v20)
          {
            v17 = v9 + 5;
            if (v9 + 5 >= v28)
              return sub_2215D2090();
            v20 = *(_QWORD *)(v29 + 8 * v17);
            if (!v20)
            {
              v21 = v9 + 6;
              while (v28 != v21)
              {
                v20 = *(_QWORD *)(v29 + 8 * v21++);
                if (v20)
                {
                  v17 = v21 - 1;
                  goto LABEL_30;
                }
              }
              return sub_2215D2090();
            }
          }
        }
      }
    }
LABEL_30:
    v15 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v17 << 6);
    goto LABEL_31;
  }
  __break(1u);
  return result;
}

uint64_t sub_221637CF4(unint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_2216539F0();
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC4D0);
  sub_221639C4C();
  result = sub_221653444();
  v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    v4 = sub_2216539F0();
    result = swift_bridgeObjectRelease();
    if (!v4)
      return v10;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
      return v10;
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v4; ++i)
      {
        v6 = MEMORY[0x22766ED44](i, a1);
        sub_2215FE0BC(&v9, v6);
        swift_release();
      }
    }
    else
    {
      v7 = (uint64_t *)(a1 + 32);
      do
      {
        v8 = *v7++;
        swift_retain();
        sub_2215FE0BC(&v9, v8);
        swift_release();
        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

id sub_221637E44(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int (*v25)(uint64_t, uint64_t, uint64_t);
  char *v26;
  char v27;
  void (*v28)(char *, uint64_t);
  id v29;
  id v30;
  uint64_t v32;
  char *v33;
  id v34;
  char *v35;
  void *v36;

  v4 = sub_221652FD0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v33 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC6D8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_2556DC6E0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v35 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v32 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v32 - v16;
  v36 = a1;
  v18 = objc_msgSend(a1, sel_identifier);
  sub_221652FB8();

  v19 = v5;
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v21 = 1;
  v20(v17, 0, 1, v4);
  v34 = a2;
  if (a2)
  {
    v22 = objc_msgSend(a2, sel_identifier);
    sub_221652FB8();

    v21 = 0;
  }
  v23 = (uint64_t)v35;
  v20(v15, v21, 1, v4);
  v24 = (uint64_t)&v9[*(int *)(v7 + 48)];
  sub_2215C3ABC((uint64_t)v17, (uint64_t)v9, qword_2556DC6E0);
  sub_2215C3ABC((uint64_t)v15, v24, qword_2556DC6E0);
  v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48);
  if (v25((uint64_t)v9, 1, v4) == 1)
  {
    sub_2215D2098((uint64_t)v15, qword_2556DC6E0);
    sub_2215D2098((uint64_t)v17, qword_2556DC6E0);
    if (v25(v24, 1, v4) == 1)
    {
      sub_2215D2098((uint64_t)v9, qword_2556DC6E0);
      return v36;
    }
    goto LABEL_8;
  }
  sub_2215C3ABC((uint64_t)v9, v23, qword_2556DC6E0);
  if (v25(v24, 1, v4) == 1)
  {
    sub_2215D2098((uint64_t)v15, qword_2556DC6E0);
    sub_2215D2098((uint64_t)v17, qword_2556DC6E0);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v23, v4);
LABEL_8:
    sub_2215D2098((uint64_t)v9, &qword_2556DC6D8);
    goto LABEL_11;
  }
  v26 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 32))(v33, v24, v4);
  sub_2215BB99C(&qword_2556DA0E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
  v27 = sub_221653168();
  v28 = *(void (**)(char *, uint64_t))(v19 + 8);
  v28(v26, v4);
  sub_2215D2098((uint64_t)v15, qword_2556DC6E0);
  sub_2215D2098((uint64_t)v17, qword_2556DC6E0);
  v28((char *)v23, v4);
  sub_2215D2098((uint64_t)v9, qword_2556DC6E0);
  if ((v27 & 1) != 0)
    return v36;
LABEL_11:
  sub_221636358(v36);
  v29 = v34;
  if (v34)
  {
    v30 = v34;
    sub_221635E7C(v30);

  }
  return v29;
}

uint64_t sub_2216381D0(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t Strong;
  uint64_t v20;
  void *v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;

  v3 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_2216537D4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC4D0);
    sub_221639C4C();
    result = sub_221653474();
    v3 = v24;
    v23 = v25;
    v6 = v26;
    v5 = v27;
    v7 = v28;
  }
  else
  {
    v8 = -1 << *(_BYTE *)(a1 + 32);
    v23 = a1 + 56;
    v6 = ~v8;
    v9 = -v8;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v7 = v10 & *(_QWORD *)(a1 + 56);
    result = swift_bridgeObjectRetain();
    v5 = 0;
  }
  v11 = (unint64_t)(v6 + 64) >> 6;
  while (v3 < 0)
  {
    if (!sub_221653834())
      return sub_2215D2090();
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC4D0);
    swift_dynamicCast();
    swift_unknownObjectRelease();
    v14 = v5;
    v12 = v7;
    if (!v29)
      return sub_2215D2090();
LABEL_33:
    swift_beginAccess();
    Strong = swift_weakLoadStrong();
    if (Strong)
    {
      v20 = Strong;
      objc_opt_self();
      v21 = (void *)swift_dynamicCastObjCClassUnconditional();
      sub_221633794(v21);
      sub_221636358(a2);
      v22 = (_BYTE *)(v20 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_autoUpdate);
      swift_beginAccess();
      if ((*v22 & 1) != 0)
        WorldAnchor.update()();
      swift_release();
    }
    result = swift_release();
    v5 = v14;
    v7 = v12;
  }
  if (v7)
  {
    v12 = (v7 - 1) & v7;
    v13 = __clz(__rbit64(v7)) | (v5 << 6);
    v14 = v5;
LABEL_32:
    v18 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13);
    swift_retain();
    if (!v18)
      return sub_2215D2090();
    goto LABEL_33;
  }
  v15 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v15 >= v11)
      return sub_2215D2090();
    v16 = *(_QWORD *)(v23 + 8 * v15);
    v14 = v5 + 1;
    if (!v16)
    {
      v14 = v5 + 2;
      if (v5 + 2 >= v11)
        return sub_2215D2090();
      v16 = *(_QWORD *)(v23 + 8 * v14);
      if (!v16)
      {
        v14 = v5 + 3;
        if (v5 + 3 >= v11)
          return sub_2215D2090();
        v16 = *(_QWORD *)(v23 + 8 * v14);
        if (!v16)
        {
          v14 = v5 + 4;
          if (v5 + 4 >= v11)
            return sub_2215D2090();
          v16 = *(_QWORD *)(v23 + 8 * v14);
          if (!v16)
          {
            v14 = v5 + 5;
            if (v5 + 5 >= v11)
              return sub_2215D2090();
            v16 = *(_QWORD *)(v23 + 8 * v14);
            if (!v16)
            {
              v17 = v5 + 6;
              while (v11 != v17)
              {
                v16 = *(_QWORD *)(v23 + 8 * v17++);
                if (v16)
                {
                  v14 = v17 - 1;
                  goto LABEL_31;
                }
              }
              return sub_2215D2090();
            }
          }
        }
      }
    }
LABEL_31:
    v12 = (v16 - 1) & v16;
    v13 = __clz(__rbit64(v16)) + (v14 << 6);
    goto LABEL_32;
  }
  __break(1u);
  return result;
}

uint64_t sub_2216384F4(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  int64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  uint64_t v27;

  v3 = v2;
  v5 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_2216537D4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC4D0);
    sub_221639C4C();
    result = sub_221653474();
    v5 = v22;
    v21 = v23;
    v7 = v24;
    v8 = v25;
    v9 = v26;
  }
  else
  {
    v10 = -1 << *(_BYTE *)(a1 + 32);
    v21 = a1 + 56;
    v7 = ~v10;
    v11 = -v10;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v9 = v12 & *(_QWORD *)(a1 + 56);
    result = swift_bridgeObjectRetain();
    v8 = 0;
  }
  v20 = (unint64_t)(v7 + 64) >> 6;
  while (1)
  {
    v16 = v8;
    if ((v5 & 0x8000000000000000) == 0)
      break;
    if (!sub_221653834())
      return sub_2215D2090();
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC4D0);
    swift_dynamicCast();
    v15 = v27;
    swift_unknownObjectRelease();
    if (!v27)
      return sub_2215D2090();
LABEL_10:
    a2(v15);
    result = swift_release();
    if (v3)
      return sub_2215D2090();
  }
  if (v9)
  {
    v13 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    v14 = v13 | (v8 << 6);
LABEL_9:
    v15 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v14);
    swift_retain();
    if (!v15)
      return sub_2215D2090();
    goto LABEL_10;
  }
  ++v8;
  if (!__OFADD__(v16, 1))
  {
    if (v8 >= v20)
      return sub_2215D2090();
    v17 = *(_QWORD *)(v21 + 8 * v8);
    if (!v17)
    {
      v18 = v16 + 2;
      if (v16 + 2 >= v20)
        return sub_2215D2090();
      v17 = *(_QWORD *)(v21 + 8 * v18);
      if (v17)
        goto LABEL_22;
      v18 = v16 + 3;
      if (v16 + 3 >= v20)
        return sub_2215D2090();
      v17 = *(_QWORD *)(v21 + 8 * v18);
      if (v17)
        goto LABEL_22;
      v18 = v16 + 4;
      if (v16 + 4 >= v20)
        return sub_2215D2090();
      v17 = *(_QWORD *)(v21 + 8 * v18);
      if (v17)
      {
LABEL_22:
        v8 = v18;
      }
      else
      {
        v8 = v16 + 5;
        if (v16 + 5 >= v20)
          return sub_2215D2090();
        v17 = *(_QWORD *)(v21 + 8 * v8);
        if (!v17)
        {
          v19 = v16 + 6;
          while (v20 != v19)
          {
            v17 = *(_QWORD *)(v21 + 8 * v19++);
            if (v17)
            {
              v8 = v19 - 1;
              goto LABEL_23;
            }
          }
          return sub_2215D2090();
        }
      }
    }
LABEL_23:
    v9 = (v17 - 1) & v17;
    v14 = __clz(__rbit64(v17)) + (v8 << 6);
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_2216387B8(uint64_t a1, unsigned __int8 a2)
{
  int v3;
  uint64_t *v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  id v7;
  __n128 v8;
  __n128 v9;
  __n128 v10;
  __n128 v11;
  uint64_t *v12;
  uint64_t v13;
  os_unfair_lock_s *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t *v25;
  uint64_t v26;
  os_unfair_lock_s *v27;
  uint64_t v28;
  float *v29;
  float v30;
  char *v31;
  char v32;
  uint64_t *v33;
  uint64_t v34;
  os_unfair_lock_s *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __n128 v51;
  __n128 v52;
  __n128 v53;
  __n128 v54;
  _OWORD v55[4];
  BOOL v56;
  _OWORD v57[4];
  char v58;

  v3 = a2;
  v4 = (uint64_t *)(a1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__pointAnchor);
  swift_beginAccess();
  v5 = *v4;
  v6 = *(os_unfair_lock_s **)(v5 + 24);
  swift_retain();
  os_unfair_lock_lock(v6);
  swift_beginAccess();
  v7 = *(id *)(v5 + 16);
  os_unfair_lock_unlock(v6);
  swift_release();
  objc_msgSend(v7, sel_transform);
  v53 = v9;
  v54 = v8;
  v51 = v11;
  v52 = v10;

  v12 = (uint64_t *)(a1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__viewAnchor);
  swift_beginAccess();
  v13 = *v12;
  v14 = *(os_unfair_lock_s **)(*v12 + 24);
  swift_retain();
  os_unfair_lock_lock(v14);
  swift_beginAccess();
  v15 = *(void **)(v13 + 16);
  v16 = v15;
  os_unfair_lock_unlock(v14);
  swift_release();
  if (v15)
  {
    objc_msgSend(v16, sel_transform);
    v47 = v18;
    v49 = v17;
    v43 = v20;
    v45 = v19;

    v22 = v43;
    v21 = v45;
    v24 = v47;
    v23 = v49;
  }
  else
  {
    v23 = 0uLL;
    v24 = 0uLL;
    v21 = 0uLL;
    v22 = 0uLL;
  }
  v55[0] = v23;
  v55[1] = v24;
  v55[2] = v21;
  v55[3] = v22;
  v56 = v15 == 0;
  v25 = (uint64_t *)(a1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
  swift_beginAccess();
  v26 = *v25;
  v27 = *(os_unfair_lock_s **)(*v25 + 24);
  swift_retain();
  os_unfair_lock_lock(v27);
  swift_beginAccess();
  v28 = *(_QWORD *)(v26 + 16);
  swift_retain();
  os_unfair_lock_unlock(v27);
  swift_release();
  v29 = (float *)(a1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_confidence);
  swift_beginAccess();
  v30 = *v29;
  if (v3 == 2)
  {
    v31 = (char *)(a1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_autoUpdate);
    swift_beginAccess();
    v32 = *v31;
  }
  else
  {
    v32 = v3 & 1;
  }
  v33 = (uint64_t *)(a1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__targetAnchor);
  swift_beginAccess();
  v34 = *v33;
  v35 = *(os_unfair_lock_s **)(v34 + 24);
  swift_retain();
  os_unfair_lock_lock(v35);
  swift_beginAccess();
  v36 = *(id *)(v34 + 16);
  os_unfair_lock_unlock(v35);
  swift_release();
  objc_msgSend(v36, sel_transform);
  v48 = v38;
  v50 = v37;
  v44 = v40;
  v46 = v39;

  v57[0] = v50;
  v57[1] = v48;
  v57[2] = v46;
  v57[3] = v44;
  v58 = 0;
  type metadata accessor for WorldAnchor();
  v41 = swift_allocObject();
  WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)((uint64_t)v55, v28, v32, (uint64_t)v57, v54, v53, v52, v51, v30);
  return v41;
}

uint64_t sub_221638AD4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2216536CC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for WorldAnchor()
{
  uint64_t result;

  result = qword_2556DE130;
  if (!qword_2556DE130)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t _s17MeasureFoundation11WorldAnchorC6didAdd7anchorsySaySo8ARAnchorCG_tFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t result;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  void (*v25)(uint64_t, unint64_t, uint64_t);
  _QWORD *v26;
  os_unfair_lock_s *v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t Strong;
  uint64_t v43;
  uint64_t v44;
  os_unfair_lock_s *v45;
  uint64_t v46;
  int v47;
  char *v48;
  uint64_t v49;
  char *v50;
  os_unfair_lock_s *v51;
  id v52;
  char *v53;
  void (*v54)(char *, uint64_t);
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _BYTE *v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  void (*v78)(char *, uint64_t);
  char *v79;
  char *v80;
  uint64_t v81;
  int64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  unint64_t i;
  uint64_t v88;
  int64_t v89;
  uint64_t v90;
  int64_t v91;
  uint64_t v92;
  char *v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;

  v0 = sub_221652FD0();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v79 = (char *)&v77 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v80 = (char *)&v77 - v5;
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v77 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2556DC6E0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t)&v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2556D8F18 != -1)
LABEL_105:
    swift_once();
  v11 = off_2556DE0A0;
  v12 = (os_unfair_lock_s *)*((_QWORD *)off_2556DE0A0 + 3);
  swift_retain();
  os_unfair_lock_lock(v12);
  swift_beginAccess();
  v13 = v11[2];
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v12);
  swift_release();
  v14 = *(_QWORD *)(v13 + 64);
  v88 = v13 + 64;
  v15 = 1 << *(_BYTE *)(v13 + 32);
  if (v15 < 64)
    v16 = ~(-1 << v15);
  else
    v16 = -1;
  v17 = v16 & v14;
  v89 = (unint64_t)(v15 + 63) >> 6;
  v90 = v13;
  result = swift_bridgeObjectRetain();
  v19 = 0;
  v84 = MEMORY[0x24BEE4AD0] + 8;
  v85 = v10;
  v86 = v7;
LABEL_8:
  while (2)
  {
    if (v17)
    {
      v20 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v21 = v20 | (v19 << 6);
LABEL_28:
      v25 = *(void (**)(uint64_t, unint64_t, uint64_t))(v1 + 16);
      v25(v10, *(_QWORD *)(v90 + 48) + *(_QWORD *)(v1 + 72) * v21, v0);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v1 + 56))(v10, 0, 1, v0);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v10, 1, v0) == 1)
        goto LABEL_102;
      v91 = v19;
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v7, v10, v0);
      v26 = off_2556DE0A0;
      v27 = (os_unfair_lock_s *)*((_QWORD *)off_2556DE0A0 + 3);
      swift_retain();
      os_unfair_lock_lock(v27);
      swift_beginAccess();
      v28 = v26[2];
      swift_bridgeObjectRetain();
      os_unfair_lock_unlock(v27);
      swift_release();
      if (!*(_QWORD *)(v28 + 16) || (v29 = sub_2215CA2D8((uint64_t)v7), (v30 & 1) == 0))
      {
        swift_bridgeObjectRelease();
LABEL_7:
        v19 = v91;
        result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v7, v0);
        continue;
      }
      v10 = *(_QWORD *)(*(_QWORD *)(v28 + 56) + 8 * v29);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      i = v10 & 0xC000000000000001;
      if ((v10 & 0xC000000000000001) != 0)
      {
        v31 = sub_2216537C8();
        v33 = v32;
        v34 = sub_22165384C();
        v36 = MEMORY[0x22766EC78](v31, v33, v34, v35);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v37 = v31;
        if ((v36 & 1) != 0)
          goto LABEL_99;
      }
      else
      {
        v38 = *(_BYTE *)(v10 + 32);
        v31 = 1 << v38;
        v39 = *(_QWORD *)(v10 + 56);
        if (v39)
        {
          v40 = 0;
        }
        else
        {
          v59 = v38 & 0x3F;
          if (v59 < 7)
            goto LABEL_98;
          v39 = *(_QWORD *)(v10 + 64);
          if (v39)
          {
            v40 = 1;
          }
          else
          {
            if (v59 < 8)
            {
LABEL_98:
              v33 = *(unsigned int *)(v10 + 36);
              swift_bridgeObjectRetain();
LABEL_99:
              sub_2215FF374(v31, v33, i != 0);
              swift_bridgeObjectRelease_n();
              goto LABEL_100;
            }
            v39 = *(_QWORD *)(v10 + 72);
            if (v39)
            {
              v40 = 2;
            }
            else
            {
              v39 = *(_QWORD *)(v10 + 80);
              if (v39)
              {
                v40 = 3;
              }
              else
              {
                v74 = 0;
                v75 = (unint64_t)(v31 + 63) >> 6;
                if (v75 <= 4)
                  v75 = 4;
                v76 = v75 - 4;
                do
                {
                  if (v76 == v74)
                    goto LABEL_98;
                  v39 = *(_QWORD *)(v10 + 88 + 8 * v74++);
                }
                while (!v39);
                v40 = v74 + 3;
              }
            }
          }
        }
        v37 = __clz(__rbit64(v39)) + (v40 << 6);
        v33 = *(unsigned int *)(v10 + 36);
        swift_bridgeObjectRetain();
        if (v37 == v31)
          goto LABEL_99;
      }
      v41 = i != 0;
      sub_2216376C8(v37, v33, i != 0, v10);
      sub_2215FF374(v37, v33, v41);
      swift_bridgeObjectRelease();
      swift_beginAccess();
      Strong = swift_weakLoadStrong();
      swift_release();
      if (!Strong)
        goto LABEL_43;
      v43 = Strong + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane;
      swift_beginAccess();
      v44 = *(_QWORD *)v43;
      v45 = *(os_unfair_lock_s **)(*(_QWORD *)v43 + 24);
      swift_retain();
      os_unfair_lock_lock(v45);
      swift_beginAccess();
      v46 = *(_QWORD *)(v44 + 16);
      swift_retain();
      os_unfair_lock_unlock(v45);
      swift_release();
      swift_release();
      if (!v46)
      {
LABEL_43:
        swift_bridgeObjectRelease();
LABEL_100:
        v10 = v85;
        v7 = v86;
        goto LABEL_7;
      }
      v47 = *(unsigned __int8 *)(v46 + 48);
      v48 = v80;
      v7 = v86;
      v25((uint64_t)v80, (unint64_t)v86, v0);
      if (v47 != 3)
      {
        swift_bridgeObjectRelease();
        swift_release();
        v54 = *(void (**)(char *, uint64_t))(v1 + 8);
        v54(v48, v0);
LABEL_49:
        v19 = v91;
        result = ((uint64_t (*)(char *, uint64_t))v54)(v7, v0);
        v10 = v85;
        continue;
      }
      swift_beginAccess();
      v49 = *(_QWORD *)(v46 + 16);
      v50 = v48;
      v51 = *(os_unfair_lock_s **)(v49 + 24);
      swift_retain();
      os_unfair_lock_lock(v51);
      swift_beginAccess();
      v7 = (char *)*(id *)(v49 + 16);
      os_unfair_lock_unlock(v51);
      swift_release();
      v52 = objc_msgSend(v7, sel_identifier);

      v53 = v79;
      sub_221652FB8();

      sub_2215BB99C(&qword_2556DA0E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      LOBYTE(v52) = sub_221653168();
      swift_release();
      v54 = *(void (**)(char *, uint64_t))(v1 + 8);
      v54(v53, v0);
      v54(v50, v0);
      if ((v52 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v7 = v86;
        goto LABEL_49;
      }
      v78 = v54;
      if (i)
      {
        swift_bridgeObjectRetain();
        sub_2216537D4();
        __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC4D0);
        sub_221639C4C();
        sub_221653474();
        v55 = v94;
        v83 = v95;
        v56 = v96;
        v57 = v97;
        v58 = v98;
      }
      else
      {
        v60 = -1 << *(_BYTE *)(v10 + 32);
        v61 = *(_QWORD *)(v10 + 56);
        v83 = v10 + 56;
        v62 = ~v60;
        v63 = -v60;
        if (v63 < 64)
          v64 = ~(-1 << v63);
        else
          v64 = -1;
        v58 = v64 & v61;
        swift_bridgeObjectRetain();
        v56 = v62;
        v57 = 0;
        v55 = v10;
      }
      v77 = v56;
      v81 = v55 & 0x7FFFFFFFFFFFFFFFLL;
      v82 = (unint64_t)(v56 + 64) >> 6;
      for (i = v55; ; v55 = i)
      {
        if ((v55 & 0x8000000000000000) != 0)
        {
          v68 = sub_221653834();
          if (!v68)
            goto LABEL_89;
          v92 = v68;
          swift_unknownObjectRetain();
          __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC4D0);
          swift_dynamicCast();
          v7 = v93;
          swift_unknownObjectRelease();
          v67 = v57;
          v65 = v58;
          if (!v7)
            goto LABEL_89;
        }
        else
        {
          if (v58)
          {
            v65 = (v58 - 1) & v58;
            v66 = __clz(__rbit64(v58)) | (v57 << 6);
            v67 = v57;
          }
          else
          {
            v69 = v57 + 1;
            if (__OFADD__(v57, 1))
              goto LABEL_104;
            if (v69 >= v82)
              goto LABEL_89;
            v70 = *(_QWORD *)(v83 + 8 * v69);
            v67 = v57 + 1;
            if (!v70)
            {
              v67 = v57 + 2;
              if (v57 + 2 >= v82)
                goto LABEL_89;
              v70 = *(_QWORD *)(v83 + 8 * v67);
              if (!v70)
              {
                v67 = v57 + 3;
                if (v57 + 3 >= v82)
                  goto LABEL_89;
                v70 = *(_QWORD *)(v83 + 8 * v67);
                if (!v70)
                {
                  v67 = v57 + 4;
                  if (v57 + 4 >= v82)
                    goto LABEL_89;
                  v70 = *(_QWORD *)(v83 + 8 * v67);
                  if (!v70)
                  {
                    v67 = v57 + 5;
                    if (v57 + 5 >= v82)
                      goto LABEL_89;
                    v70 = *(_QWORD *)(v83 + 8 * v67);
                    if (!v70)
                    {
                      v67 = v57 + 6;
                      if (v57 + 6 >= v82)
                        goto LABEL_89;
                      v70 = *(_QWORD *)(v83 + 8 * v67);
                      if (!v70)
                      {
                        v71 = v57 + 7;
                        while (v82 != v71)
                        {
                          v70 = *(_QWORD *)(v83 + 8 * v71++);
                          if (v70)
                          {
                            v67 = v71 - 1;
                            v55 = i;
                            goto LABEL_83;
                          }
                        }
LABEL_89:
                        sub_2215D2090();
                        v7 = v86;
                        v78(v86, v0);
                        result = swift_bridgeObjectRelease();
                        v10 = v85;
                        v19 = v91;
                        goto LABEL_8;
                      }
                    }
                  }
                }
              }
            }
LABEL_83:
            v65 = (v70 - 1) & v70;
            v66 = __clz(__rbit64(v70)) + (v67 << 6);
          }
          v7 = *(char **)(*(_QWORD *)(v55 + 48) + 8 * v66);
          swift_retain();
          if (!v7)
            goto LABEL_89;
        }
        swift_beginAccess();
        v72 = swift_weakLoadStrong();
        if (v72)
        {
          v73 = (_BYTE *)(v72 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_autoUpdate);
          swift_beginAccess();
          if ((*v73 & 1) != 0)
            WorldAnchor.update()();
          swift_release();
        }
        swift_release();
        v57 = v67;
        v58 = v65;
      }
    }
    break;
  }
  v22 = v19 + 1;
  if (__OFADD__(v19, 1))
  {
    __break(1u);
LABEL_104:
    __break(1u);
    goto LABEL_105;
  }
  if (v22 >= v89)
    goto LABEL_101;
  v23 = *(_QWORD *)(v88 + 8 * v22);
  ++v19;
  if (v23)
    goto LABEL_27;
  v19 = v22 + 1;
  if (v22 + 1 >= v89)
    goto LABEL_101;
  v23 = *(_QWORD *)(v88 + 8 * v19);
  if (v23)
    goto LABEL_27;
  v19 = v22 + 2;
  if (v22 + 2 >= v89)
    goto LABEL_101;
  v23 = *(_QWORD *)(v88 + 8 * v19);
  if (v23)
    goto LABEL_27;
  v19 = v22 + 3;
  if (v22 + 3 >= v89)
    goto LABEL_101;
  v23 = *(_QWORD *)(v88 + 8 * v19);
  if (v23)
    goto LABEL_27;
  v19 = v22 + 4;
  if (v22 + 4 >= v89)
    goto LABEL_101;
  v23 = *(_QWORD *)(v88 + 8 * v19);
  if (v23)
  {
LABEL_27:
    v17 = (v23 - 1) & v23;
    v21 = __clz(__rbit64(v23)) + (v19 << 6);
    goto LABEL_28;
  }
  v24 = v22 + 5;
  if (v24 >= v89)
  {
LABEL_101:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 56))(v10, 1, 1, v0);
LABEL_102:
    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v23 = *(_QWORD *)(v88 + 8 * v24);
    if (v23)
    {
      v19 = v24;
      goto LABEL_27;
    }
    while (1)
    {
      v19 = v24 + 1;
      if (__OFADD__(v24, 1))
        break;
      if (v19 >= v89)
        goto LABEL_101;
      v23 = *(_QWORD *)(v88 + 8 * v19);
      ++v24;
      if (v23)
        goto LABEL_27;
    }
    __break(1u);
  }
  return result;
}

uint64_t _s17MeasureFoundation11WorldAnchorC07forEachD0yyyAA15HashableWeakRefCyACGXEFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  os_unfair_lock_s *v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  os_unfair_lock_s *v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];
  _QWORD *v37;
  uint64_t v38;
  int64_t v39;

  v36[0] = a1;
  v36[1] = a2;
  v2 = sub_221652FD0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_2556DC6E0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2556D8F18 == -1)
    goto LABEL_2;
  while (1)
  {
    swift_once();
LABEL_2:
    v9 = off_2556DE0A0;
    v10 = (os_unfair_lock_s *)*((_QWORD *)off_2556DE0A0 + 3);
    swift_retain();
    os_unfair_lock_lock(v10);
    swift_beginAccess();
    v11 = v9[2];
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock(v10);
    result = swift_release();
    v13 = 0;
    v14 = *(_QWORD *)(v11 + 64);
    v38 = v11 + 64;
    v15 = 1 << *(_BYTE *)(v11 + 32);
    v16 = -1;
    if (v15 < 64)
      v16 = ~(-1 << v15);
    v17 = v16 & v14;
    v39 = (unint64_t)(v15 + 63) >> 6;
    v37 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if ((v16 & v14) != 0)
    {
      while (1)
      {
        v18 = __clz(__rbit64(v17));
        v17 &= v17 - 1;
        v19 = v18 | (v13 << 6);
LABEL_26:
        (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v8, *(_QWORD *)(v11 + 48) + *(_QWORD *)(v3 + 72) * v19, v2);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
          goto LABEL_36;
        (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
        v23 = off_2556DE0A0;
        v24 = (os_unfair_lock_s *)*((_QWORD *)off_2556DE0A0 + 3);
        swift_retain();
        os_unfair_lock_lock(v24);
        swift_beginAccess();
        v25 = v23[2];
        swift_bridgeObjectRetain();
        os_unfair_lock_unlock(v24);
        swift_release();
        if (*(_QWORD *)(v25 + 16) && (v26 = sub_2215CA2D8((uint64_t)v5), (v27 & 1) != 0))
        {
          v28 = *(_QWORD *)(*(_QWORD *)(v25 + 56) + 8 * v26);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_2215D7954(0, v37[2] + 1, 1, v37);
            v37 = (_QWORD *)result;
          }
          v30 = v37[2];
          v29 = v37[3];
          if (v30 >= v29 >> 1)
          {
            result = (uint64_t)sub_2215D7954((_QWORD *)(v29 > 1), v30 + 1, 1, v37);
            v37 = (_QWORD *)result;
          }
          v31 = v37;
          v37[2] = v30 + 1;
          v31[v30 + 4] = v28;
          if (!v17)
            break;
        }
        else
        {
          swift_bridgeObjectRelease();
          result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
          if (!v17)
            break;
        }
      }
    }
    v20 = v13 + 1;
    if (!__OFADD__(v13, 1))
      break;
    __break(1u);
  }
  if (v20 >= v39)
    goto LABEL_35;
  v21 = *(_QWORD *)(v38 + 8 * v20);
  ++v13;
  if (v21)
  {
LABEL_25:
    v17 = (v21 - 1) & v21;
    v19 = __clz(__rbit64(v21)) + (v13 << 6);
    goto LABEL_26;
  }
  v13 = v20 + 1;
  if (v20 + 1 >= v39)
  {
LABEL_35:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1, 1, v2);
LABEL_36:
    swift_release();
    v32 = v37[2];
    v33 = (void (*)(uint64_t))v36[0];
    if (v32)
    {
      swift_bridgeObjectRetain();
      v34 = 0;
      do
      {
        ++v34;
        v35 = swift_bridgeObjectRetain();
        sub_2216384F4(v35, v33);
        swift_bridgeObjectRelease();
      }
      while (v32 != v34);
      swift_bridgeObjectRelease();
    }
    return swift_bridgeObjectRelease();
  }
  v21 = *(_QWORD *)(v38 + 8 * v13);
  if (v21)
    goto LABEL_25;
  v13 = v20 + 2;
  if (v20 + 2 >= v39)
    goto LABEL_35;
  v21 = *(_QWORD *)(v38 + 8 * v13);
  if (v21)
    goto LABEL_25;
  v13 = v20 + 3;
  if (v20 + 3 >= v39)
    goto LABEL_35;
  v21 = *(_QWORD *)(v38 + 8 * v13);
  if (v21)
    goto LABEL_25;
  v13 = v20 + 4;
  if (v20 + 4 >= v39)
    goto LABEL_35;
  v21 = *(_QWORD *)(v38 + 8 * v13);
  if (v21)
    goto LABEL_25;
  v22 = v20 + 5;
  if (v22 >= v39)
    goto LABEL_35;
  v21 = *(_QWORD *)(v38 + 8 * v22);
  if (v21)
  {
    v13 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v13 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v13 >= v39)
      goto LABEL_35;
    v21 = *(_QWORD *)(v38 + 8 * v13);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
  __break(1u);
  return result;
}

uint64_t sub_221639A98()
{
  return sub_2215BB99C(&qword_2556DE100, (uint64_t (*)(uint64_t))type metadata accessor for WorldAnchor, (uint64_t)&protocol conformance descriptor for WorldAnchor);
}

float sub_221639AC4@<S0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  float *v3;
  float result;

  v3 = (float *)(*a1 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_confidence);
  swift_beginAccess();
  result = *v3;
  *a2 = *(_DWORD *)v3;
  return result;
}

uint64_t sub_221639B14(int *a1, _QWORD *a2)
{
  int v2;
  _DWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_DWORD *)(*a2 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_confidence);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_221639B6C()
{
  uint64_t v0;

  v0 = swift_retain();
  return sub_2216320E8(v0);
}

uint64_t sub_221639B94()
{
  return type metadata accessor for WorldAnchor();
}

uint64_t sub_221639B9C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_221652FD0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

unint64_t sub_221639C4C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2556DE320;
  if (!qword_2556DE320)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2556DC4D0);
    result = MEMORY[0x22766FA4C](&protocol conformance descriptor for HashableWeakRef<A>, v1);
    atomic_store(result, (unint64_t *)&qword_2556DE320);
  }
  return result;
}

void sub_221639C98(char a1)
{
  sub_221653B88();
  __asm { BR              X10 }
}

uint64_t sub_221639CDC()
{
  sub_2216531F8();
  swift_bridgeObjectRelease();
  return sub_221653BAC();
}

void sub_221639D7C(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_221639DB0()
{
  sub_2216531F8();
  return swift_bridgeObjectRelease();
}

void sub_221639E3C(uint64_t a1, char a2)
{
  sub_221653B88();
  __asm { BR              X10 }
}

uint64_t sub_221639E7C()
{
  sub_2216531F8();
  swift_bridgeObjectRelease();
  return sub_221653BAC();
}

uint64_t WorldLine.lineType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_lineType;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t WorldLine.lineType.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_lineType);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*WorldLine.lineType.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t WorldLine.ends.getter()
{
  return sub_2215D8BC4();
}

void sub_221639FF8(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

id WorldLine.center.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_22163A09C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;

  v5 = *a1;
  v6 = (_QWORD *)(*a2 + *a5);
  swift_beginAccess();
  *v6 = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t WorldLine.snappedPoints.getter()
{
  return sub_2215D8BC4();
}

uint64_t WorldLine.isOnVerticalGuide.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_isOnVerticalGuide);
  swift_beginAccess();
  return *v1;
}

uint64_t WorldLine.isOnVerticalGuide.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_isOnVerticalGuide);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*WorldLine.isOnVerticalGuide.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t WorldLine.identifiersOfObjectsComposedInto.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t (*sub_22163A308())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22163A34C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_identifiersOfObjectsComposedInto);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t WorldLine.isALineMeasurement.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_isALineMeasurement);
  swift_beginAccess();
  return *v1;
}

uint64_t WorldLine.isALineMeasurement.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_isALineMeasurement);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*WorldLine.isALineMeasurement.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double WorldLine.meanFPSDuringPlacement.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_meanFPSDuringPlacement;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t WorldLine.meanFPSDuringPlacement.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_meanFPSDuringPlacement);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*WorldLine.meanFPSDuringPlacement.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

char *WorldLine.__allocating_init(end1:end2:initialState:)(char *a1, void *a2, uint64_t a3, char a4)
{
  objc_class *v4;
  char v8;
  id v9;

  v8 = a4 & 1;
  v9 = objc_allocWithZone(v4);
  return WorldLine.init(end1:end2:initialState:)(a1, a2, a3, v8);
}

char *WorldLine.init(end1:end2:initialState:)(char *a1, void *a2, uint64_t a3, char a4)
{
  _BYTE *v4;
  uint64_t *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  os_unfair_lock_s *v14;
  char *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  char *v21;
  uint64_t v22;
  os_unfair_lock_s *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  os_unfair_lock_s *v27;
  _QWORD *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  void **v33;
  void *v34;
  char *v35;
  __n128 v37;
  __n128 v38;
  __n128 v39;
  __n128 v40;
  objc_super v41;
  _QWORD v42[8];
  char v43;

  *(_QWORD *)&v4[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_lineType] = 1;
  v4[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_isOnVerticalGuide] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_identifiersOfObjectsComposedInto] = 0;
  v4[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_isALineMeasurement] = 0;
  v9 = v42;
  *(_QWORD *)&v4[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_meanFPSDuringPlacement] = 0xBFF0000000000000;
  v10 = v4;
  WorldPoint.type.setter(1);
  WorldPoint.type.setter(1);
  if ((a4 & 1) != 0)
  {
    swift_beginAccess();
    a3 = static MeasureObjectState.default;
  }
  WorldPoint.state.setter(a3);
  WorldPoint.state.setter(a3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DB3A0);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_221656F90;
  *(_QWORD *)(v11 + 32) = a1;
  *(_QWORD *)(v11 + 40) = a2;
  v42[0] = v11;
  sub_22165333C();
  *(_QWORD *)&v10[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends] = v42[0];
  v12 = &a1[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
  swift_beginAccess();
  v13 = *(_QWORD *)v12;
  v14 = *(os_unfair_lock_s **)(v13 + 24);
  v15 = a1;
  v16 = a2;
  swift_retain();
  os_unfair_lock_lock(v14);
  swift_beginAccess();
  v17 = *(_QWORD *)(v13 + 16);
  swift_retain();
  os_unfair_lock_unlock(v14);
  swift_release();
  v39 = *(__n128 *)(v17 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 16);
  v40 = *(__n128 *)(v17 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
  v37 = *(__n128 *)(v17 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);
  v38 = *(__n128 *)(v17 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 32);
  swift_release();
  memset(v42, 0, sizeof(v42));
  v43 = 1;
  type metadata accessor for WorldAnchor();
  swift_allocObject();
  v18 = WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)((uint64_t)v42, 0, 0, (uint64_t)v42, v40, v39, v38, v37, 0.0);
  swift_beginAccess();
  v19 = static MeasureObjectState.default;
  v20 = objc_allocWithZone((Class)type metadata accessor for WorldPoint());
  *(_QWORD *)&v10[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center] = WorldPoint.init(anchor:type:state:)(v18, 2, v19);
  *(_QWORD *)&v10[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_snappedPoints] = MEMORY[0x24BEE4AF8];

  v41.receiver = v10;
  v41.super_class = (Class)type metadata accessor for WorldLine();
  v21 = (char *)objc_msgSendSuper2(&v41, sel_init);
  v22 = *(_QWORD *)&v21[OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state];
  v23 = *(os_unfair_lock_s **)(v22 + 24);
  v24 = v21;
  swift_retain();
  os_unfair_lock_lock(v23);
  swift_beginAccess();
  *(_QWORD *)(v22 + 16) = a3;
  os_unfair_lock_unlock(v23);
  swift_release();
  WorldLine.updateSubPoints()();
  v25 = &v24[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends];
  swift_beginAccess();
  v26 = *(_QWORD *)v25;
  if ((*(_QWORD *)v25 & 0xC000000000000001) != 0)
  {
    v27 = (os_unfair_lock_s *)MEMORY[0x22766ED44](0);
LABEL_6:
    v23 = v27;
    swift_endAccess();
    v9 = &OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines;
    v28 = (_QWORD *)((char *)&v23->_os_unfair_lock_opaque + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines);
    swift_beginAccess();
    v24 = v24;
    MEMORY[0x22766E798]();
    if (*(_QWORD *)((*v28 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((*v28 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_7;
    goto LABEL_14;
  }
  if (*(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v27 = (os_unfair_lock_s *)*(id *)(v26 + 32);
    goto LABEL_6;
  }
  __break(1u);
LABEL_14:
  sub_22165336C();
LABEL_7:
  sub_2216533A8();
  sub_22165333C();
  swift_endAccess();

  swift_beginAccess();
  v29 = *(_QWORD *)v25;
  if ((*(_QWORD *)v25 & 0xC000000000000001) != 0)
  {
    v30 = (char *)MEMORY[0x22766ED44](1);
  }
  else
  {
    if (*(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
    {
      __break(1u);
      goto LABEL_17;
    }
    v30 = (char *)*(id *)(v29 + 40);
  }
  v25 = v30;
  swift_endAccess();
  v31 = &v25[*v9];
  swift_beginAccess();
  v24 = v24;
  MEMORY[0x22766E798]();
  if (*(_QWORD *)((*(_QWORD *)v31 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)v31 & 0xFFFFFFFFFFFFFF8)
                                                                               + 0x18) >> 1)
LABEL_17:
    sub_22165336C();
  sub_2216533A8();
  sub_22165333C();
  swift_endAccess();

  v32 = &v24[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center];
  swift_beginAccess();
  v33 = (void **)(*(_QWORD *)v32 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine);
  swift_beginAccess();
  v34 = *v33;
  *v33 = v24;
  v35 = v24;

  return v35;
}

Swift::Void __swiftcall WorldLine.cleanup()()
{
  char *v0;
  char *v1;
  id *v2;
  id v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  id v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  char *v17;
  void **v18;
  void *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void *v24;
  void **v25;
  void *v26;

  v2 = (id *)&v0[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends];
  swift_beginAccess();
  v3 = *v2;
  if (((unint64_t)*v2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v4 = (id)MEMORY[0x22766ED44](0, v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (!*(_QWORD *)(((unint64_t)v3 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_21:
      swift_bridgeObjectRetain();
      v10 = (id)MEMORY[0x22766ED44](1, v2);
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
    v4 = *((id *)v3 + 4);
  }
  swift_beginAccess();
  v1 = v0;
  v5 = swift_bridgeObjectRetain();
  v6 = sub_22163D748(v5, (uint64_t)v1);
  v8 = v7;
  swift_bridgeObjectRelease();

  if ((v8 & 1) == 0)
  {
    swift_beginAccess();
    v9 = sub_2215C0A50(v6);
    swift_endAccess();

    v4 = (id)v9;
  }

  v2 = (id *)*v2;
  if (((unint64_t)v2 & 0xC000000000000001) != 0)
    goto LABEL_21;
  if (*(_QWORD *)(((unint64_t)v2 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
  {
    __break(1u);
    goto LABEL_23;
  }
  v10 = v2[5];
LABEL_9:
  swift_beginAccess();
  v11 = v1;
  v12 = swift_bridgeObjectRetain();
  v13 = sub_22163D748(v12, (uint64_t)v11);
  v15 = v14;
  swift_bridgeObjectRelease();

  if ((v15 & 1) == 0)
  {
    swift_beginAccess();
    v16 = sub_2215C0A50(v13);
    swift_endAccess();

    v10 = (id)v16;
  }

  v17 = &v11[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center];
  swift_beginAccess();
  v18 = (void **)(*(_QWORD *)v17 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine);
  swift_beginAccess();
  v19 = *v18;
  *v18 = 0;

  v20 = &v11[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_snappedPoints];
  swift_beginAccess();
  v2 = *(id **)v20;
  if (!((unint64_t)v2 >> 62))
  {
    v21 = *(_QWORD *)(((unint64_t)v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v21)
      goto LABEL_13;
LABEL_24:
    swift_bridgeObjectRelease();
    return;
  }
LABEL_23:
  swift_bridgeObjectRetain();
  v21 = sub_2216539F0();
  if (!v21)
    goto LABEL_24;
LABEL_13:
  if (v21 >= 1)
  {
    v22 = 0;
    do
    {
      if (((unint64_t)v2 & 0xC000000000000001) != 0)
        v23 = (char *)MEMORY[0x22766ED44](v22, v2);
      else
        v23 = (char *)v2[v22 + 4];
      v24 = v23;
      ++v22;
      v25 = (void **)&v23[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_snapLine];
      swift_beginAccess();
      v26 = *v25;
      *v25 = 0;

    }
    while (v21 != v22);
    goto LABEL_24;
  }
  __break(1u);
}

Swift::Void __swiftcall WorldLine.updateSubPoints()()
{
  uint64_t v0;
  uint64_t v1;
  void **v2;
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  os_unfair_lock_s *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  os_unfair_lock_s *v19;
  uint64_t v20;
  BOOL v21;
  __n128 v22;
  __int128 v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  os_unfair_lock_s *v28;
  uint64_t v29;
  float32x4_t v30;
  __n128 v31;
  void *v32;
  uint64_t *v33;
  uint64_t v34;
  os_unfair_lock_s *v35;
  id v36;
  uint64_t v37;
  float v38;
  float v39;
  void *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  os_unfair_lock_s *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  os_unfair_lock_s *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  os_unfair_lock_s *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  float32x4_t v63;
  char *v64;
  uint64_t v65;
  os_unfair_lock_s *v66;
  uint64_t v67;
  float32x4_t v68;
  char *v69;
  uint64_t v70;
  os_unfair_lock_s *v71;
  uint64_t v72;
  float32x4_t v73;
  __n128 v74;
  uint64_t v75;
  os_unfair_lock_s *v76;
  uint64_t v77;
  __n128 v78;
  uint64_t v79;
  os_unfair_lock_s *v80;
  uint64_t v81;
  _QWORD *v82;
  float32x4_t v83;
  float32x4_t v84;
  __n128 v85;
  float32x4_t v86;
  __n128 v87;
  float32x4_t v88;
  __n128 v89;
  __n128 v90;
  float32x4_t v91;
  float32x4_t v92;
  __n128 v93;
  float32x4_t v94;
  __int128 v95;
  float32x4_t v96;
  float32x4_t v97;
  __n128 v98;
  __int128 v99;
  __n128 v100;
  __n128 v101;
  float32x4_t v102;
  float32x4_t v103;
  __n128 v104;
  __n128 v105;
  __n128 v106;
  __int128 v107;
  _OWORD v108[4];
  char v109;
  _OWORD v110[4];
  char v111;

  v1 = v0;
  v2 = (void **)(v0 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center);
  swift_beginAccess();
  v3 = *v2;
  v4 = (uint64_t *)((char *)*v2 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor);
  swift_beginAccess();
  v5 = *v4;
  v6 = *(os_unfair_lock_s **)(v5 + 24);
  v7 = v3;
  swift_retain();
  os_unfair_lock_lock(v6);
  swift_beginAccess();
  v8 = *(_QWORD *)(v5 + 16);
  swift_retain();
  os_unfair_lock_unlock(v6);
  swift_release();
  v87 = *(__n128 *)(v8 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 16);
  v89 = *(__n128 *)(v8 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
  v85 = *(__n128 *)(v8 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 32);

  swift_release();
  v9 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends);
  swift_beginAccess();
  v10 = *v9;
  if ((*v9 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v11 = (char *)MEMORY[0x22766ED44](0, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_15;
    }
    v11 = (char *)*(id *)(v10 + 32);
  }
  v12 = &v11[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
  swift_beginAccess();
  v13 = *(_QWORD *)v12;
  v14 = *(os_unfair_lock_s **)(v13 + 24);
  swift_retain();
  os_unfair_lock_lock(v14);
  swift_beginAccess();
  v15 = *(_QWORD *)(v13 + 16);
  swift_retain();
  os_unfair_lock_unlock(v14);
  swift_release();
  v99 = *(_OWORD *)(v15 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);

  swift_release();
  v10 = *v9;
  if ((*v9 & 0xC000000000000001) != 0)
  {
LABEL_15:
    swift_bridgeObjectRetain();
    v16 = (char *)MEMORY[0x22766ED44](1, v10);
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
  {
    __break(1u);
    goto LABEL_17;
  }
  v16 = (char *)*(id *)(v10 + 40);
LABEL_7:
  v17 = &v16[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
  swift_beginAccess();
  v18 = *(_QWORD *)v17;
  v19 = *(os_unfair_lock_s **)(v18 + 24);
  swift_retain();
  os_unfair_lock_lock(v19);
  swift_beginAccess();
  v20 = *(_QWORD *)(v18 + 16);
  swift_retain();
  os_unfair_lock_unlock(v19);
  swift_release();
  v94 = *(float32x4_t *)(v20 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);

  swift_release();
  v10 = *v9;
  if ((*v9 & 0xC000000000000001) == 0)
  {
    v24 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v24)
    {
      __break(1u);
      goto LABEL_19;
    }
    v25 = (char *)*(id *)(v10 + 32);
    goto LABEL_10;
  }
LABEL_17:
  swift_bridgeObjectRetain();
  v25 = (char *)MEMORY[0x22766ED44](0, v10);
  swift_bridgeObjectRelease();
LABEL_10:
  v26 = &v25[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
  swift_beginAccess();
  v27 = *(_QWORD *)v26;
  v28 = *(os_unfair_lock_s **)(v27 + 24);
  swift_retain();
  os_unfair_lock_lock(v28);
  swift_beginAccess();
  v29 = *(_QWORD *)(v27 + 16);
  swift_retain();
  os_unfair_lock_unlock(v28);
  swift_release();
  v91 = *(float32x4_t *)(v29 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);

  swift_release();
  v30 = vsubq_f32(v94, v91);
  v31.n128_u64[0] = (unint64_t)vadd_f32(*(float32x2_t *)&v99, vmul_f32(*(float32x2_t *)v30.f32, (float32x2_t)0x3F0000003F000000));
  v31.n128_f32[2] = *((float *)&v99 + 2) + vmuls_lane_f32(0.5, v30, 2);
  v31.n128_u32[3] = 0;
  v100 = v31;
  v32 = *v2;
  v33 = (uint64_t *)((char *)*v2 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor);
  swift_beginAccess();
  v34 = *v33;
  v35 = *(os_unfair_lock_s **)(v34 + 24);
  v36 = v32;
  swift_retain();
  os_unfair_lock_lock(v35);
  swift_beginAccess();
  v37 = *(_QWORD *)(v34 + 16);
  swift_retain();
  os_unfair_lock_unlock(v35);

  swift_release();
  v95 = *(_OWORD *)(v37 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);
  swift_release();
  v23 = v95;
  v22 = v100;
  v24 = 0;
  HIDWORD(v23) = 0;
  while (1)
  {
    v106 = v22;
    v38 = *(float *)((unint64_t)&v106 & 0xFFFFFFFFFFFFFFF3 | (4 * (v24 & 3)));
    v107 = v23;
    v39 = *(float *)((unint64_t)&v107 & 0xFFFFFFFFFFFFFFF3 | (4 * (v24 & 3)));
    v21 = v38 == v39;
    if (v24 == 2)
      break;
LABEL_19:
    while (1)
    {
      ++v24;
      if (v21)
        break;
      if (v24 == 2)
        goto LABEL_22;
      v21 = 0;
    }
  }
  if (v38 != v39)
  {
LABEL_22:
    v22.n128_u32[3] = 1.0;
    v101 = v22;
    v40 = *v2;
    memset(v110, 0, sizeof(v110));
    v111 = 1;
    type metadata accessor for WorldAnchor();
    swift_allocObject();
    v41 = v40;
    v42 = WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)((uint64_t)v110, 0, 0, (uint64_t)v110, v89, v87, v85, v101, 0.0);
    v43 = &v41[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
    swift_beginAccess();
    v44 = *(_QWORD *)v43;
    v45 = *(os_unfair_lock_s **)(v44 + 24);
    swift_retain();
    swift_retain();
    os_unfair_lock_lock(v45);
    swift_beginAccess();
    *(_QWORD *)(v44 + 16) = v42;
    swift_retain();
    swift_release();
    os_unfair_lock_unlock(v45);
    swift_release();
    swift_release();
    sub_221643C94();

    swift_release();
  }
  v46 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_snappedPoints);
  swift_beginAccess();
  v47 = *v46;
  if ((unint64_t)*v46 >> 62)
    goto LABEL_44;
  v48 = *(_QWORD *)((v47 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v48)
  {
LABEL_45:
    swift_bridgeObjectRelease();
    return;
  }
LABEL_25:
  if (v48 >= 1)
  {
    v49 = 0;
    v82 = v9;
    while (1)
    {
      if ((v47 & 0xC000000000000001) != 0)
        v53 = (char *)MEMORY[0x22766ED44](v49, v47);
      else
        v53 = (char *)*(id *)(v47 + 8 * v49 + 32);
      v54 = v53;
      v55 = *v9;
      if ((*v9 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        v56 = (char *)MEMORY[0x22766ED44](0, v55);
        swift_bridgeObjectRelease();
      }
      else
      {
        if (!*(_QWORD *)((v55 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_43:
          __break(1u);
LABEL_44:
          swift_bridgeObjectRetain();
          v48 = sub_2216539F0();
          if (!v48)
            goto LABEL_45;
          goto LABEL_25;
        }
        v56 = (char *)*(id *)(v55 + 32);
      }
      v57 = &v56[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
      swift_beginAccess();
      v58 = *(_QWORD *)v57;
      v59 = *(os_unfair_lock_s **)(v58 + 24);
      swift_retain();
      os_unfair_lock_lock(v59);
      swift_beginAccess();
      v60 = *(_QWORD *)(v58 + 16);
      swift_retain();
      os_unfair_lock_unlock(v59);
      swift_release();
      v102 = *(float32x4_t *)(v60 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);

      swift_release();
      v61 = *v9;
      if ((*v9 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        v62 = (char *)MEMORY[0x22766ED44](1, v61);
        swift_bridgeObjectRelease();
      }
      else
      {
        if (*(_QWORD *)((v61 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
          goto LABEL_43;
        v62 = (char *)*(id *)(v61 + 40);
      }
      v63 = v102;
      v63.i32[3] = 0;
      v103 = v63;
      v64 = &v62[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
      swift_beginAccess();
      v65 = *(_QWORD *)v64;
      v66 = *(os_unfair_lock_s **)(v65 + 24);
      swift_retain();
      os_unfair_lock_lock(v66);
      swift_beginAccess();
      v67 = *(_QWORD *)(v65 + 16);
      swift_retain();
      os_unfair_lock_unlock(v66);
      swift_release();
      v96 = *(float32x4_t *)(v67 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);

      swift_release();
      v68 = v96;
      v68.i32[3] = 0;
      v97 = v68;
      v69 = &v54[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
      swift_beginAccess();
      v70 = *(_QWORD *)v69;
      v71 = *(os_unfair_lock_s **)(*(_QWORD *)v69 + 24);
      swift_retain();
      os_unfair_lock_lock(v71);
      swift_beginAccess();
      v72 = *(_QWORD *)(v70 + 16);
      swift_retain();
      os_unfair_lock_unlock(v71);
      swift_release();
      v92 = *(float32x4_t *)(v72 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);
      swift_release();
      v73 = v92;
      v73.i32[3] = 0;
      v74.n128_f64[0] = closestPointOnLine(lineP1:lineP2:point:)(v103, v97, v73);
      v104 = v74;
      v75 = *(_QWORD *)v69;
      v76 = *(os_unfair_lock_s **)(*(_QWORD *)v69 + 24);
      swift_retain();
      os_unfair_lock_lock(v76);
      swift_beginAccess();
      v77 = *(_QWORD *)(v75 + 16);
      swift_retain();
      os_unfair_lock_unlock(v76);
      swift_release();
      v93 = *(__n128 *)(v77 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 16);
      v98 = *(__n128 *)(v77 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
      v90 = *(__n128 *)(v77 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 32);
      swift_release();
      v78 = v104;
      v78.n128_u32[3] = 1.0;
      v105 = v78;
      v79 = *(_QWORD *)v69;
      v80 = *(os_unfair_lock_s **)(*(_QWORD *)v69 + 24);
      swift_retain();
      os_unfair_lock_lock(v80);
      swift_beginAccess();
      v81 = *(_QWORD *)(v79 + 16);
      swift_retain();
      os_unfair_lock_unlock(v80);
      swift_release();
      v83 = *(float32x4_t *)(v81 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 16);
      v84 = *(float32x4_t *)(v81 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
      v86 = *(float32x4_t *)(v81 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 32);
      v88 = *(float32x4_t *)(v81 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);
      swift_release();
      if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v83, (float32x4_t)v93), (int8x16_t)vceqq_f32(v84, (float32x4_t)v98)), (int8x16_t)vceqq_f32(v86, (float32x4_t)v90)), (int8x16_t)vceqq_f32(v88, (float32x4_t)v105))) & 0x80000000) != 0)
      {

      }
      else
      {
        memset(v108, 0, sizeof(v108));
        v109 = 1;
        type metadata accessor for WorldAnchor();
        swift_allocObject();
        v50 = WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)((uint64_t)v108, 0, 0, (uint64_t)v108, v98, v93, v90, v105, 0.0);
        v51 = *(_QWORD *)v69;
        v52 = *(os_unfair_lock_s **)(*(_QWORD *)v69 + 24);
        swift_retain();
        swift_retain();
        os_unfair_lock_lock(v52);
        swift_beginAccess();
        *(_QWORD *)(v51 + 16) = v50;
        swift_retain();
        swift_release();
        os_unfair_lock_unlock(v52);
        swift_release();
        swift_release();
        sub_221643C94();

        swift_release();
      }
      ++v49;
      v9 = v82;
      if (v48 == v49)
        goto LABEL_45;
    }
  }
  __break(1u);
}

void WorldLine.replaceEnd1(with:)(void *a1)
{
  char *v1;
  unint64_t *v3;
  unint64_t v4;
  id v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  int isUniquelyReferenced_nonNull_bridgeObject;
  void *v15;
  char *v16;

  v3 = (unint64_t *)&v1[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends];
  swift_beginAccess();
  v4 = *v3;
  if ((*v3 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v5 = (id)MEMORY[0x22766ED44](0, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
    v5 = *(id *)(v4 + 32);
  }
  swift_beginAccess();
  v6 = v1;
  v7 = swift_bridgeObjectRetain();
  v8 = sub_22163D748(v7, (uint64_t)v6);
  v10 = v9;
  swift_bridgeObjectRelease();

  if ((v10 & 1) == 0)
  {
    swift_beginAccess();
    v11 = sub_2215C0A50(v8);
    swift_endAccess();

    v5 = (id)v11;
  }

  swift_beginAccess();
  v12 = *v3;
  v13 = a1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v12;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v12 & 0x8000000000000000) != 0
    || (v12 & 0x4000000000000000) != 0)
  {
    sub_22163D6B8(v12);
  }
  if (!*(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_15;
  v15 = *(void **)((v12 & 0xFFFFFFFFFFFFFF8) + 0x20);
  *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x20) = v13;

  sub_22165333C();
  swift_endAccess();
  v16 = &v13[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines];
  swift_beginAccess();
  v6;
  MEMORY[0x22766E798]();
  if (*(_QWORD *)((*(_QWORD *)v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)v16 & 0xFFFFFFFFFFFFFF8)
                                                                               + 0x18) >> 1)
LABEL_16:
    sub_22165336C();
  sub_2216533A8();
  sub_22165333C();
  swift_endAccess();
  WorldLine.updateSubPoints()();
}

void WorldLine.replaceEnd2(with:)(void *a1)
{
  char *v1;
  unint64_t *v3;
  unint64_t v4;
  id v5;
  char *v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  int isUniquelyReferenced_nonNull_bridgeObject;
  void *v15;
  char *v16;

  v3 = (unint64_t *)&v1[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends];
  swift_beginAccess();
  v4 = *v3;
  if ((*v3 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v5 = (id)MEMORY[0x22766ED44](1, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
    {
      __break(1u);
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
    v5 = *(id *)(v4 + 40);
  }
  swift_beginAccess();
  v6 = v1;
  v7 = swift_bridgeObjectRetain();
  v8 = sub_22163D748(v7, (uint64_t)v6);
  v10 = v9;
  swift_bridgeObjectRelease();

  if ((v10 & 1) == 0)
  {
    swift_beginAccess();
    v11 = sub_2215C0A50(v8);
    swift_endAccess();

    v5 = (id)v11;
  }

  swift_beginAccess();
  v12 = *v3;
  v13 = a1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v12;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v12 & 0x8000000000000000) != 0
    || (v12 & 0x4000000000000000) != 0)
  {
    sub_22163D6B8(v12);
  }
  if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2uLL)
    goto LABEL_15;
  v15 = *(void **)((v12 & 0xFFFFFFFFFFFFFF8) + 0x28);
  *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x28) = v13;

  sub_22165333C();
  swift_endAccess();
  v16 = &v13[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines];
  swift_beginAccess();
  v6;
  MEMORY[0x22766E798]();
  if (*(_QWORD *)((*(_QWORD *)v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)v16 & 0xFFFFFFFFFFFFFF8)
                                                                               + 0x18) >> 1)
LABEL_16:
    sub_22165336C();
  sub_2216533A8();
  sub_22165333C();
  swift_endAccess();
  WorldLine.updateSubPoints()();
}

void WorldLine.replaceCenter(with:)(void *a1)
{
  char *v1;
  void **v3;
  void **v4;
  void *v5;
  void *v6;
  id v7;
  void **v8;
  void *v9;
  char *v10;

  v3 = (void **)&v1[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center];
  swift_beginAccess();
  v4 = (void **)((char *)*v3 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine);
  swift_beginAccess();
  v5 = *v4;
  *v4 = 0;

  v6 = *v3;
  *v3 = a1;
  v7 = a1;

  v8 = (void **)((char *)*v3 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine);
  swift_beginAccess();
  v9 = *v8;
  *v8 = v1;
  v10 = v1;

  WorldLine.updateSubPoints()();
}

void WorldLine.addSnappedPoint(with:)(void *a1)
{
  char *v1;
  void *v2;
  char *v4;
  char *v5;
  void **v6;
  void *v7;
  id v8;

  v2 = v1;
  v4 = &v1[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_snappedPoints];
  swift_beginAccess();
  v5 = a1;
  MEMORY[0x22766E798]();
  if (*(_QWORD *)((*(_QWORD *)v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)v4 & 0xFFFFFFFFFFFFFF8)
                                                                              + 0x18) >> 1)
    sub_22165336C();
  sub_2216533A8();
  sub_22165333C();
  swift_endAccess();
  v6 = (void **)&v5[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_snapLine];
  swift_beginAccess();
  v7 = *v6;
  *v6 = v2;
  v8 = v2;

}

void WorldLine.removeSnappedPoint(with:)(void *a1)
{
  char *v2;
  unint64_t v3;
  unint64_t v4;
  char v5;
  char v6;
  void *v7;
  void **v8;
  void *v9;

  swift_beginAccess();
  v2 = a1;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_22163D748(v3, (uint64_t)v2);
  v6 = v5;
  swift_bridgeObjectRelease();

  if ((v6 & 1) == 0)
  {
    swift_beginAccess();
    v7 = (void *)sub_2215C0A50(v4);
    swift_endAccess();

  }
  v8 = (void **)&v2[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_snapLine];
  swift_beginAccess();
  v9 = *v8;
  *v8 = 0;

}

Swift::Float __swiftcall WorldLine.length()()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t *v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  Swift::Float result;
  char *v11;
  char *v12;
  uint64_t v13;
  os_unfair_lock_s *v14;
  uint64_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;

  v3 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends);
  swift_beginAccess();
  v4 = *v3;
  if ((*v3 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v5 = (char *)MEMORY[0x22766ED44](0, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_10;
    }
    v5 = (char *)*(id *)(v4 + 32);
  }
  v1 = &unk_2556DE000;
  v6 = &v5[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
  swift_beginAccess();
  v7 = *(_QWORD *)v6;
  v8 = *(os_unfair_lock_s **)(v7 + 24);
  swift_retain();
  os_unfair_lock_lock(v8);
  swift_beginAccess();
  v9 = *(_QWORD *)(v7 + 16);
  swift_retain();
  os_unfair_lock_unlock(v8);
  swift_release();
  v2 = &unk_2556DE000;
  v19 = *(float32x4_t *)(v9 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);

  swift_release();
  v0 = *v3;
  if ((*v3 & 0xC000000000000001) != 0)
  {
LABEL_10:
    swift_bridgeObjectRetain();
    v11 = (char *)MEMORY[0x22766ED44](1, v0);
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  if (*(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    v11 = (char *)*(id *)(v0 + 40);
LABEL_7:
    v12 = &v11[v1[199]];
    swift_beginAccess();
    v13 = *(_QWORD *)v12;
    v14 = *(os_unfair_lock_s **)(v13 + 24);
    swift_retain();
    os_unfair_lock_lock(v14);
    swift_beginAccess();
    v15 = *(_QWORD *)(v13 + 16);
    swift_retain();
    os_unfair_lock_unlock(v14);
    swift_release();
    v18 = *(float32x4_t *)(v15 + v2[25] + 48);

    swift_release();
    v16 = vsubq_f32(v19, v18);
    v17 = vmulq_f32(v16, v16);
    return sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).f32[0]);
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall WorldLine.markAsPartOfComposedObject(withId:)(Swift::String withId)
{
  uint64_t v1;
  char **v2;
  unint64_t v3;
  void *object;
  uint64_t countAndFlagsBits;
  _QWORD *v6;
  char **v7;
  uint64_t (*v8)();
  char *v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  char *v12;
  char **v13;
  char *v14;
  char *v15;
  uint64_t *v16;
  _QWORD *v17;
  uint64_t *v18;
  _BYTE *v19;
  char v20[32];

  object = withId._object;
  countAndFlagsBits = withId._countAndFlagsBits;
  v6 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_identifiersOfObjectsComposedInto);
  swift_beginAccess();
  if (!*v6)
  {
    *v6 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRelease();
  }
  v8 = sub_22163A308();
  v9 = *v7;
  if (!*v7)
    goto LABEL_8;
  v2 = v7;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v2 = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    goto LABEL_19;
  while (1)
  {
    v3 = *((_QWORD *)v9 + 2);
    v11 = *((_QWORD *)v9 + 3);
    if (v3 >= v11 >> 1)
    {
      v9 = sub_2215D7A74((char *)(v11 > 1), v3 + 1, 1, v9);
      *v2 = v9;
    }
    *((_QWORD *)v9 + 2) = v3 + 1;
    v12 = &v9[16 * v3];
    *((_QWORD *)v12 + 4) = countAndFlagsBits;
    *((_QWORD *)v12 + 5) = object;
LABEL_8:
    ((void (*)(char *, _QWORD))v8)(v20, 0);
    v8 = (uint64_t (*)())(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends);
    swift_beginAccess();
    v13 = *(char ***)v8;
    if ((*(_QWORD *)v8 & 0xC000000000000001) == 0)
      break;
    swift_bridgeObjectRetain();
    v14 = (char *)MEMORY[0x22766ED44](0, v13);
    swift_bridgeObjectRelease();
LABEL_11:
    v3 = (unint64_t)&OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_partOfRectangleId;
    v9 = &v14[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_partOfRectangleId];
    swift_beginAccess();
    *(_QWORD *)v9 = countAndFlagsBits;
    *((_QWORD *)v9 + 1) = object;
    swift_bridgeObjectRetain();

    swift_bridgeObjectRelease();
    v2 = *(char ***)v8;
    if ((*(_QWORD *)v8 & 0xC000000000000001) != 0)
      goto LABEL_17;
    if (*(_QWORD *)(((unint64_t)v2 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
    {
      v15 = v2[5];
      goto LABEL_14;
    }
    __break(1u);
LABEL_19:
    v9 = sub_2215D7A74(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
    *v2 = v9;
  }
  if (*(_QWORD *)(((unint64_t)v13 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v14 = v13[4];
    goto LABEL_11;
  }
  __break(1u);
LABEL_17:
  swift_bridgeObjectRetain();
  v15 = (char *)MEMORY[0x22766ED44](1, v2);
  swift_bridgeObjectRelease();
LABEL_14:
  v16 = (uint64_t *)&v15[*(_QWORD *)v3];
  swift_beginAccess();
  *v16 = countAndFlagsBits;
  v16[1] = (uint64_t)object;
  swift_bridgeObjectRetain();

  swift_bridgeObjectRelease();
  v17 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center);
  swift_beginAccess();
  v18 = (uint64_t *)(*v17 + *(_QWORD *)v3);
  swift_beginAccess();
  *v18 = countAndFlagsBits;
  v18[1] = (uint64_t)object;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = (_BYTE *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_isALineMeasurement);
  swift_beginAccess();
  *v19 = 0;
}

Swift::Bool __swiftcall WorldLine.isPartOfAComposedObject()()
{
  uint64_t v0;
  _BYTE *v1;

  v1 = (_BYTE *)(v0 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_isALineMeasurement);
  swift_beginAccess();
  return (*v1 & 1) == 0;
}

Swift::Bool __swiftcall WorldLine.isPartOfComposedObject(withId:)(Swift::String withId)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  _BYTE *v4;
  _QWORD *v5;
  Swift::Bool result;
  _QWORD *v7;
  uint64_t v8;
  BOOL v9;
  Swift::Bool v10;
  _QWORD *v11;

  object = withId._object;
  countAndFlagsBits = withId._countAndFlagsBits;
  v4 = (_BYTE *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_isALineMeasurement);
  swift_beginAccess();
  if ((*v4 & 1) != 0)
    return 0;
  v5 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_identifiersOfObjectsComposedInto);
  result = swift_beginAccess();
  v7 = (_QWORD *)*v5;
  if (*v5)
  {
    v8 = v7[2];
    if (v8)
    {
      v9 = v7[4] == countAndFlagsBits && v7[5] == (_QWORD)object;
      if (v9 || (sub_221653B04() & 1) != 0)
        return 1;
      v11 = v7 + 7;
      do
      {
        v10 = --v8 != 0;
        if (!v8)
          break;
        if (*(v11 - 1) == countAndFlagsBits && *v11 == (_QWORD)object)
          break;
        v11 += 2;
      }
      while ((sub_221653B04() & 1) == 0);
      return v10;
    }
    return 0;
  }
  __break(1u);
  return result;
}

Swift::Float __swiftcall WorldLine.estimatedLengthError()()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  float v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  char v14;
  char v15;
  char *v16;
  char *v17;
  os_unfair_lock_s *v18;
  _QWORD *v19;
  unint64_t v20;
  char v21;
  char v22;
  char *v23;
  char *v24;
  uint64_t v25;
  os_unfair_lock_s *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  os_unfair_lock_s *v30;
  char *v31;
  char *v32;
  os_unfair_lock_s *v33;
  unint64_t v34;
  Swift::Float result;
  char *v36;
  char *v37;
  uint64_t v38;
  os_unfair_lock_s *v39;
  _QWORD *v40;
  uint64_t *v41;
  uint64_t v42;
  os_unfair_lock_s *v43;
  uint64_t v44;
  char *v45;
  void **v46;
  void *v47;
  os_unfair_lock_s *v48;
  unint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  os_unfair_lock_s *v53;
  uint64_t v54;
  char *v55;
  float32x4_t v56;
  char *v57;
  uint64_t v58;
  os_unfair_lock_s *v59;
  uint64_t v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float32_t v67;
  float32_t v68;
  float32x2_t v69;
  float32x4_t v70;
  float32x2_t v71;
  float32x2_t v72;
  float32x2_t v73;
  float32x2_t v74;
  float32x4_t v75;
  float32x4_t v76;
  float v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float v81;
  float32x4_t v82;
  float32x4_t v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  __int128 v91;
  float32x4_t v92;
  float v93;
  __int128 v94;
  float v95;
  unint64_t v96;
  float32x4_t v97;
  _QWORD *v98;

  v7 = v1;
  v8 = v1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends;
  swift_beginAccess();
  v9 = *(_QWORD *)v8;
  if ((*(_QWORD *)v8 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v10 = (char *)MEMORY[0x22766ED44](0, v9);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (!*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_44:
      swift_bridgeObjectRetain();
      v16 = (char *)MEMORY[0x22766ED44](1, v3);
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    v10 = (char *)*(id *)(v9 + 32);
  }
  v0 = &unk_2556DE000;
  v11 = &v10[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
  swift_beginAccess();
  v12 = *(os_unfair_lock_s **)(*(_QWORD *)v11 + 24);
  swift_retain();
  os_unfair_lock_lock(v12);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_unlock(v12);

  swift_release();
  v9 = WorldAnchor.viewDirection.getter();
  v2 = v13;
  v15 = v14;
  swift_release();
  v6 = -1.0;
  if ((v15 & 1) != 0)
    return v6;
  v3 = *(_QWORD *)v8;
  if ((*(_QWORD *)v8 & 0xC000000000000001) != 0)
    goto LABEL_44;
  if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
  {
    __break(1u);
LABEL_46:
    swift_bridgeObjectRetain();
    v23 = (char *)MEMORY[0x22766ED44](0, v5);
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v16 = (char *)*(id *)(v3 + 40);
LABEL_8:
  v17 = &v16[v0[199]];
  swift_beginAccess();
  v18 = *(os_unfair_lock_s **)(*(_QWORD *)v17 + 24);
  swift_retain();
  os_unfair_lock_lock(v18);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_unlock(v18);

  swift_release();
  v19 = (_QWORD *)WorldAnchor.viewDirection.getter();
  v4 = v20;
  v22 = v21;
  swift_release();
  if ((v22 & 1) != 0)
    return v6;
  v5 = *(_QWORD *)v8;
  v98 = v19;
  v96 = v4;
  if ((*(_QWORD *)v8 & 0xC000000000000001) != 0)
    goto LABEL_46;
  if (*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v23 = (char *)*(id *)(v5 + 32);
LABEL_12:
    v24 = &v23[v0[199]];
    swift_beginAccess();
    v25 = *(_QWORD *)v24;
    v26 = *(os_unfair_lock_s **)(v25 + 24);
    swift_retain();
    os_unfair_lock_lock(v26);
    swift_beginAccess();
    v27 = *(_QWORD *)(v25 + 16);
    swift_retain();
    os_unfair_lock_unlock(v26);

    swift_release();
    v19 = &unk_2556DE000;
    v28 = (uint64_t *)(v27 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
    swift_beginAccess();
    v29 = *v28;
    v30 = *(os_unfair_lock_s **)(v29 + 24);
    swift_retain();
    os_unfair_lock_lock(v30);
    swift_beginAccess();
    v5 = *(_QWORD *)(v29 + 16);
    swift_retain();
    os_unfair_lock_unlock(v30);
    swift_release();
    swift_release();
    if (!v5)
    {
      v95 = 0.0;
      goto LABEL_19;
    }
    v7 = *(_QWORD *)v8;
    if ((*(_QWORD *)v8 & 0xC000000000000001) != 0)
      goto LABEL_50;
    if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v31 = (char *)*(id *)(v7 + 32);
      while (1)
      {
        v32 = &v31[v0[199]];
        swift_beginAccess();
        v33 = *(os_unfair_lock_s **)(*(_QWORD *)v32 + 24);
        swift_retain();
        os_unfair_lock_lock(v33);
        swift_beginAccess();
        swift_retain();
        os_unfair_lock_unlock(v33);

        swift_release();
        v34 = WorldAnchor.distanceToViewAnchor.getter();
        swift_release();
        if ((v34 & 0x100000000) != 0)
          goto LABEL_58;
        v95 = WorldPlane.estimatedErrorAlongNormal(distanceFromObservation:)(*(Swift::Float *)&v34);
        swift_release();
LABEL_19:
        v7 = *(_QWORD *)v8;
        if ((*(_QWORD *)v8 & 0xC000000000000001) != 0)
          goto LABEL_48;
        if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
        {
          v36 = (char *)*(id *)(v7 + 40);
          goto LABEL_22;
        }
        __break(1u);
LABEL_50:
        swift_bridgeObjectRetain();
        v31 = (char *)MEMORY[0x22766ED44](0, v7);
        swift_bridgeObjectRelease();
      }
    }
    __break(1u);
LABEL_52:
    swift_bridgeObjectRetain();
    v45 = (char *)MEMORY[0x22766ED44](1, v4);
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  __break(1u);
LABEL_48:
  swift_bridgeObjectRetain();
  v36 = (char *)MEMORY[0x22766ED44](1, v7);
  swift_bridgeObjectRelease();
LABEL_22:
  v37 = &v36[v0[199]];
  swift_beginAccess();
  v38 = *(_QWORD *)v37;
  v39 = *(os_unfair_lock_s **)(v38 + 24);
  swift_retain();
  os_unfair_lock_lock(v39);
  swift_beginAccess();
  v40 = *(_QWORD **)(v38 + 16);
  swift_retain();
  os_unfair_lock_unlock(v39);

  swift_release();
  v41 = (_QWORD *)((char *)v40 + v19[22]);
  swift_beginAccess();
  v42 = *v41;
  v43 = *(os_unfair_lock_s **)(v42 + 24);
  swift_retain();
  os_unfair_lock_lock(v43);
  swift_beginAccess();
  v44 = *(_QWORD *)(v42 + 16);
  swift_retain();
  os_unfair_lock_unlock(v43);
  swift_release();
  swift_release();
  if (!v44)
    return v6;
  v4 = *(_QWORD *)v8;
  if ((*(_QWORD *)v8 & 0xC000000000000001) != 0)
    goto LABEL_52;
  if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
  {
    __break(1u);
    goto LABEL_54;
  }
  v45 = (char *)*(id *)(v4 + 40);
LABEL_26:
  v46 = (void **)&v45[v0[199]];
  swift_beginAccess();
  v47 = *v46;
  v48 = (os_unfair_lock_s *)*((_QWORD *)v47 + 3);
  swift_retain();
  os_unfair_lock_lock(v48);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_unlock(v48);

  swift_release();
  v49 = WorldAnchor.distanceToViewAnchor.getter();
  swift_release();
  if ((v49 & 0x100000000) == 0)
  {
    v93 = WorldPlane.estimatedErrorAlongNormal(distanceFromObservation:)(*(Swift::Float *)&v49);
    swift_release();
    v40 = v98;
    if (v5)
    {
      v5 = *(_QWORD *)v8;
      if ((*(_QWORD *)v8 & 0xC000000000000001) == 0)
      {
        if (!*(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_56;
        }
        v50 = (char *)*(id *)(v5 + 32);
LABEL_31:
        v51 = &v50[v0[199]];
        swift_beginAccess();
        v52 = *(_QWORD *)v51;
        v53 = *(os_unfair_lock_s **)(v52 + 24);
        swift_retain();
        os_unfair_lock_lock(v53);
        swift_beginAccess();
        v54 = *(_QWORD *)(v52 + 16);
        swift_retain();
        os_unfair_lock_unlock(v53);

        swift_release();
        v47 = &unk_2556DE000;
        v94 = *(_OWORD *)(v54 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48);
        swift_release();
        v8 = *(_QWORD *)v8;
        if ((v8 & 0xC000000000000001) == 0)
        {
          if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
          {
            __break(1u);
LABEL_58:
            __break(1u);
            goto LABEL_59;
          }
          v55 = (char *)*(id *)(v8 + 40);
          goto LABEL_34;
        }
LABEL_56:
        swift_bridgeObjectRetain();
        v55 = (char *)MEMORY[0x22766ED44](1, v8);
        swift_bridgeObjectRelease();
LABEL_34:
        v56.i64[0] = v9;
        v56.i64[1] = v2;
        v92 = v56;
        v56.i64[0] = (uint64_t)v40;
        v56.i64[1] = v96;
        v97 = v56;
        v57 = &v55[v0[199]];
        swift_beginAccess();
        v58 = *(_QWORD *)v57;
        v59 = *(os_unfair_lock_s **)(v58 + 24);
        swift_retain();
        os_unfair_lock_lock(v59);
        swift_beginAccess();
        v60 = *(_QWORD *)(v58 + 16);
        swift_retain();
        os_unfair_lock_unlock(v59);

        swift_release();
        v91 = *(_OWORD *)(v60 + *((_QWORD *)v47 + 25) + 48);
        swift_release();
        v61 = vmuls_lane_f32(v95, v92, 2);
        v62 = v61 + *((float *)&v94 + 2);
        v63 = *((float *)&v94 + 2) - v61;
        v64 = vmuls_lane_f32(v93, v97, 2);
        v65 = v64 + *((float *)&v91 + 2);
        v66 = *((float *)&v91 + 2) - v64;
        v67 = v62 - (float)(v64 + *((float *)&v91 + 2));
        v68 = v63 - v65;
        v69 = vmul_n_f32((float32x2_t)__PAIR64__(v92.u32[1], v9), v95);
        v70.i32[3] = HIDWORD(v94);
        v71 = vsub_f32(*(float32x2_t *)&v94, v69);
        v72 = vmul_n_f32((float32x2_t)__PAIR64__(v97.u32[1], v40), v93);
        v73 = vsub_f32(*(float32x2_t *)&v91, v72);
        v74 = vadd_f32(v69, *(float32x2_t *)&v94);
        *(float32x2_t *)v70.f32 = vsub_f32(v74, v73);
        v70.f32[2] = v62 - v66;
        v75 = vmulq_f32(v70, v70);
        v76 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v75, 2), vaddq_f32(v75, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v75.f32, 1)));
        v77 = sqrtf(v76.f32[0]);
        *(float32x2_t *)v76.f32 = vadd_f32(v72, *(float32x2_t *)&v91);
        *(float32x2_t *)v78.f32 = vsub_f32(v74, *(float32x2_t *)v76.f32);
        v78.f32[2] = v67;
        v79 = vmulq_f32(v78, v78);
        *(float32x2_t *)v76.f32 = vsub_f32(v71, *(float32x2_t *)v76.f32);
        v76.f32[2] = v68;
        v80 = vmulq_f32(v76, v76);
        v81 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v79, 2), vaddq_f32(v79, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v79.f32, 1))).f32[0]);
        v82 = vaddq_f32(v80, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v80.f32, 1));
        v80.i32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v80, 2), v82).u32[0];
        *(float32x2_t *)v82.f32 = vsub_f32(v71, v73);
        v82.f32[2] = v63 - v66;
        v83 = vmulq_f32(v82, v82);
        v84 = sqrtf(v80.f32[0]);
        v85 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v83, 2), vaddq_f32(v83, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v83.f32, 1))).f32[0]);
        v86 = WorldLine.length()();
        v87 = vabds_f32(v81, v86);
        v88 = vabds_f32(v77, v86);
        if (v87 <= v88)
          v87 = v88;
        v89 = vabds_f32(v84, v86);
        v90 = vabds_f32(v85, v86);
        if (v89 > v90)
          v90 = v89;
        if (v87 > v90)
          return v87;
        else
          return v90;
      }
LABEL_54:
      swift_bridgeObjectRetain();
      v50 = (char *)MEMORY[0x22766ED44](0, v5);
      swift_bridgeObjectRelease();
      goto LABEL_31;
    }
    return v6;
  }
LABEL_59:
  __break(1u);
  return result;
}

id WorldLine.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void WorldLine.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_22163CFC0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

id WorldLine.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorldLine();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_22163D094(char *a1)
{
  sub_22162BBBC(*a1);
}

void sub_22163D0A0()
{
  char *v0;

  sub_221639C98(*v0);
}

void sub_22163D0A8(uint64_t a1)
{
  char *v1;

  sub_221639D7C(a1, *v1);
}

void sub_22163D0B0(uint64_t a1)
{
  char *v1;

  sub_221639E3C(a1, *v1);
}

uint64_t sub_22163D0B8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22163D878();
  *a1 = result;
  return result;
}

uint64_t sub_22163D0E4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_22163D108 + 4 * byte_221659BD2[*v0]))();
}

void sub_22163D108(_QWORD *a1@<X8>)
{
  *a1 = 0x7472617473;
  a1[1] = 0xE500000000000000;
}

void sub_22163D120(_QWORD *a1@<X8>)
{
  *a1 = 6581861;
  a1[1] = 0xE300000000000000;
}

void sub_22163D134(_QWORD *a1@<X8>)
{
  *a1 = 0x6874676E656CLL;
  a1[1] = 0xE600000000000000;
}

void sub_22163D14C(char *a1@<X8>)
{
  strcpy(a1, "estimatedError");
  a1[15] = -18;
}

void sub_22163D174(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000016;
  a1[1] = 0x800000022165C820;
}

uint64_t sub_22163D194()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_22163D1B8 + 4 * byte_221659BD8[*v0]))(25705, 0xE200000000000000);
}

uint64_t sub_22163D1B8()
{
  return 0x7472617473;
}

uint64_t sub_22163D1CC()
{
  return 6581861;
}

uint64_t sub_22163D1DC()
{
  return 0x6874676E656CLL;
}

uint64_t sub_22163D1F0()
{
  return 0x6574616D69747365;
}

unint64_t sub_22163D214()
{
  return 0xD000000000000016;
}

uint64_t sub_22163D230@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22163D878();
  *a1 = result;
  return result;
}

void sub_22163D254(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_22163D260()
{
  sub_22163D834();
  return sub_221653BF4();
}

uint64_t sub_22163D288()
{
  sub_22163D834();
  return sub_221653C00();
}

uint64_t WorldLine.ResultRepresentation.encode(to:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  id v14;
  void *v15;
  uint64_t v16;
  char v17;
  __n128 v18[6];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2556DE370);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_22163D834();
  sub_221653BE8();
  swift_beginAccess();
  v18[0].n128_u8[0] = 0;
  swift_bridgeObjectRetain();
  sub_221653A74();
  if (v2)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v10 = (uint64_t *)(a2 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends);
  swift_beginAccess();
  v11 = *v10;
  if ((*v10 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v12 = (char *)MEMORY[0x22766ED44](0, v11);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (!*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_12;
    }
    v12 = (char *)*(id *)(v11 + 32);
  }
  sub_221644738(v12, v18);
  v17 = 1;
  sub_22163D8C0();
  result = sub_221653A98();
  v11 = *v10;
  if ((*v10 & 0xC000000000000001) != 0)
  {
LABEL_12:
    swift_bridgeObjectRetain();
    v13 = (char *)MEMORY[0x22766ED44](1, v11);
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    v13 = (char *)*(id *)(v11 + 40);
LABEL_9:
    sub_221644738(v13, v18);
    v17 = 2;
    sub_221653A98();
    WorldLine.length()();
    v14 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
    v15 = (void *)sub_22165318C();
    objc_msgSend(v14, sel_floatForKey_, v15);

    v18[0].n128_u8[0] = 3;
    sub_221653A8C();
    WorldLine.estimatedLengthError()();
    v18[0].n128_u8[0] = 4;
    sub_221653A8C();
    swift_beginAccess();
    v17 = 5;
    sub_221653A80();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  __break(1u);
  return result;
}

uint64_t sub_22163D654(_QWORD *a1)
{
  uint64_t *v1;

  return WorldLine.ResultRepresentation.encode(to:)(a1, *v1);
}

id WorldLine.resultRepresentation.getter()
{
  void *v0;

  return v0;
}

id sub_22163D674@<X0>(void **a1@<X8>)
{
  void **v1;
  void *v2;

  v2 = *v1;
  *a1 = *v1;
  return v2;
}

uint64_t type metadata accessor for WorldLine()
{
  return objc_opt_self();
}

char *sub_22163D6A4(uint64_t a1)
{
  return sub_2215D7110(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void sub_22163D6B8(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_2216539F0();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x22766ED50);
}

char *sub_22163D720(uint64_t a1)
{
  return sub_2215D7B74(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_22163D734(unint64_t a1, uint64_t a2)
{
  return sub_22163D748(a1, a2);
}

uint64_t sub_22163D748(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a1 >> 62)
    goto LABEL_13;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    v5 = 0;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v6 = MEMORY[0x22766ED44](v5, a1);
        swift_unknownObjectRelease();
        if (v6 == a2)
          return v5;
      }
      else if (*(_QWORD *)(a1 + 8 * v5 + 32) == a2)
      {
        return v5;
      }
      if (__OFADD__(v5, 1))
        break;
      if (++v5 == v4)
        return 0;
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
    v4 = sub_2216539F0();
    swift_bridgeObjectRelease();
  }
  return 0;
}

unint64_t sub_22163D834()
{
  unint64_t result;

  result = qword_2556DE378;
  if (!qword_2556DE378)
  {
    result = MEMORY[0x22766FA4C](&unk_221659D50, &type metadata for WorldLine.ResultRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2556DE378);
  }
  return result;
}

uint64_t sub_22163D878()
{
  unint64_t v0;

  v0 = sub_221653A38();
  swift_bridgeObjectRelease();
  if (v0 >= 6)
    return 6;
  else
    return v0;
}

unint64_t sub_22163D8C0()
{
  unint64_t result;

  result = qword_2556DE380;
  if (!qword_2556DE380)
  {
    result = MEMORY[0x22766FA4C](&protocol conformance descriptor for WorldPoint.ResultRepresentation, &type metadata for WorldPoint.ResultRepresentation);
    atomic_store(result, (unint64_t *)&qword_2556DE380);
  }
  return result;
}

unint64_t sub_22163D908()
{
  unint64_t result;

  result = qword_2556DE388;
  if (!qword_2556DE388)
  {
    result = MEMORY[0x22766FA4C](&protocol conformance descriptor for WorldLine.ResultRepresentation, &type metadata for WorldLine.ResultRepresentation);
    atomic_store(result, (unint64_t *)&qword_2556DE388);
  }
  return result;
}

uint64_t sub_22163D94C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_1(a1, &OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends, a2);
}

uint64_t sub_22163D958(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_22163A09C(a1, a2, a3, a4, &OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends);
}

id sub_22163D974@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_22163D9C8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_1(a1, &OBJC_IVAR____TtC17MeasureFoundation9WorldLine_snappedPoints, a2);
}

uint64_t keypath_getTm_1@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *v4;

  v4 = (_QWORD *)(*a1 + *a2);
  swift_beginAccess();
  *a3 = *v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22163DA24(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_22163A09C(a1, a2, a3, a4, &OBJC_IVAR____TtC17MeasureFoundation9WorldLine_snappedPoints);
}

uint64_t sub_22163DA40@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC17MeasureFoundation9WorldLine_identifiersOfObjectsComposedInto);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for WorldLine.ResultRepresentation()
{
  return &type metadata for WorldLine.ResultRepresentation;
}

uint64_t getEnumTagSinglePayload for WorldLine.ResultRepresentation.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for WorldLine.ResultRepresentation.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_22163DB84 + 4 * byte_221659BE3[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_22163DBB8 + 4 * byte_221659BDE[v4]))();
}

uint64_t sub_22163DBB8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22163DBC0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22163DBC8);
  return result;
}

uint64_t sub_22163DBD4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22163DBDCLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_22163DBE0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22163DBE8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WorldLine.ResultRepresentation.CodingKeys()
{
  return &type metadata for WorldLine.ResultRepresentation.CodingKeys;
}

unint64_t sub_22163DC08()
{
  unint64_t result;

  result = qword_2556DE3D8;
  if (!qword_2556DE3D8)
  {
    result = MEMORY[0x22766FA4C](&unk_221659D28, &type metadata for WorldLine.ResultRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2556DE3D8);
  }
  return result;
}

unint64_t sub_22163DC50()
{
  unint64_t result;

  result = qword_2556DE3E0;
  if (!qword_2556DE3E0)
  {
    result = MEMORY[0x22766FA4C](&unk_221659C60, &type metadata for WorldLine.ResultRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2556DE3E0);
  }
  return result;
}

unint64_t sub_22163DC98()
{
  unint64_t result;

  result = qword_2556DE3E8;
  if (!qword_2556DE3E8)
  {
    result = MEMORY[0x22766FA4C](&unk_221659C88, &type metadata for WorldLine.ResultRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2556DE3E8);
  }
  return result;
}

uint64_t WorldLineGuideType.rawValue.getter(uint64_t result)
{
  return result;
}

void Segment.end1.setter(__n128 a1)
{
  __n128 *v1;

  *v1 = a1;
}

uint64_t (*Segment.end1.modify())()
{
  return nullsub_1;
}

double Segment.end2.getter(double a1, double a2)
{
  return a2;
}

void Segment.end2.setter(__n128 a1)
{
  __n128 *v1;

  v1[1] = a1;
}

uint64_t (*Segment.end2.modify())()
{
  return nullsub_1;
}

BOOL Segment.isEqual(to:)(float32x4_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4)
{
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v7;
  _BOOL4 v8;

  v4 = vsubq_f32(a3, a1);
  v5 = vmulq_f32(v4, v4);
  v6 = vsubq_f32(a4, a2);
  v7 = vmulq_f32(v6, v6);
  v8 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2), vaddq_f32(v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1))).f32[0] < 0.00000011921;
  return vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v7, 2), vaddq_f32(v7, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v7.f32, 1))).f32[0] < 0.00000011921&& v8;
}

__n128 GuideSegments.primary.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  __n128 result;
  __int128 v4;

  v2 = *(_BYTE *)(v1 + 32);
  result = *(__n128 *)v1;
  v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 32) = v2;
  return result;
}

uint64_t GuideSegments.primary.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_22163E7F8(a1, v1);
}

uint64_t (*GuideSegments.primary.modify())()
{
  return nullsub_1;
}

__n128 GuideSegments.visible.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  __n128 result;
  __int128 v4;

  v2 = *(_BYTE *)(v1 + 80);
  result = *(__n128 *)(v1 + 48);
  v4 = *(_OWORD *)(v1 + 64);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 32) = v2;
  return result;
}

uint64_t GuideSegments.visible.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_22163E7F8(a1, v1 + 48);
}

uint64_t (*GuideSegments.visible.modify())()
{
  return nullsub_1;
}

BOOL static GuideAnchorState.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t GuideAnchorState.hash(into:)()
{
  return sub_221653B94();
}

uint64_t GuideAnchorState.hashValue.getter()
{
  sub_221653B88();
  sub_221653B94();
  return sub_221653BAC();
}

BOOL sub_22163DE3C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t WorldLineGuide.backingPlanes.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t WorldLineGuide.backingPlanes.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_backingPlanes);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*WorldLineGuide.backingPlanes.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t WorldLineGuide.anchorState.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_anchorState);
  swift_beginAccess();
  return *v1;
}

uint64_t WorldLineGuide.anchorState.setter(char a1)
{
  uint64_t v1;
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = a1 & 1;
  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_anchorState);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t (*WorldLineGuide.anchorState.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t WorldLineGuide.guideType.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_guideType);
  swift_beginAccess();
  return *v1;
}

double WorldLineGuide.end1.getter()
{
  double result;

  *(_QWORD *)&result = sub_22163E064(&OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_end1Anchor).n128_u64[0];
  return result;
}

double WorldLineGuide.end2.getter()
{
  double result;

  *(_QWORD *)&result = sub_22163E064(&OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_end2Anchor).n128_u64[0];
  return result;
}

__n128 sub_22163E064(_QWORD *a1)
{
  uint64_t v1;

  return *(__n128 *)(*(_QWORD *)(v1 + *a1) + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
}

__n128 sub_22163E084@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char v4;
  char v5;
  __int128 v6;
  __n128 result;
  __int128 v8;

  v3 = *a1 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_segments;
  swift_beginAccess();
  v4 = *(_BYTE *)(v3 + 32);
  v5 = *(_BYTE *)(v3 + 80);
  v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a2 = *(_OWORD *)v3;
  *(_OWORD *)(a2 + 16) = v6;
  *(_BYTE *)(a2 + 32) = v4;
  result = *(__n128 *)(v3 + 48);
  v8 = *(_OWORD *)(v3 + 64);
  *(__n128 *)(a2 + 48) = result;
  *(_OWORD *)(a2 + 64) = v8;
  *(_BYTE *)(a2 + 80) = v5;
  return result;
}

__n128 sub_22163E0EC(__int128 *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  __n128 result;
  __n128 v10;
  __int128 v11;

  v2 = *((_QWORD *)a1 + 2);
  v3 = *((_QWORD *)a1 + 3);
  v4 = *((_BYTE *)a1 + 32);
  v10 = (__n128)a1[3];
  v11 = *a1;
  v5 = *((_QWORD *)a1 + 8);
  v6 = *((_QWORD *)a1 + 9);
  v7 = *((_BYTE *)a1 + 80);
  v8 = *a2 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_segments;
  swift_beginAccess();
  *(_OWORD *)v8 = v11;
  *(_QWORD *)(v8 + 16) = v2;
  *(_QWORD *)(v8 + 24) = v3;
  *(_BYTE *)(v8 + 32) = v4;
  result = v10;
  *(__n128 *)(v8 + 48) = v10;
  *(_QWORD *)(v8 + 64) = v5;
  *(_QWORD *)(v8 + 72) = v6;
  *(_BYTE *)(v8 + 80) = v7;
  return result;
}

__n128 WorldLineGuide.segments.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char v4;
  char v5;
  __int128 v6;
  __n128 result;
  __int128 v8;

  v3 = v1 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_segments;
  swift_beginAccess();
  v4 = *(_BYTE *)(v3 + 32);
  v5 = *(_BYTE *)(v3 + 80);
  v6 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v3;
  *(_OWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 32) = v4;
  result = *(__n128 *)(v3 + 48);
  v8 = *(_OWORD *)(v3 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v8;
  *(_BYTE *)(a1 + 80) = v5;
  return result;
}

char *WorldLineGuide.__allocating_init(guideType:end1:end2:primarySegmentEnd1:primarySegmentEnd2:backingPlanes:anchorState:)(char a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, __n128 a9, __n128 a10, __n128 a11, __n128 a12, __n128 a13, __n128 a14, __n128 a15, __n128 a16, char a17)
{
  objc_class *v17;
  char v24;
  char v25;
  id v26;

  v24 = a4 & 1;
  v25 = a7 & 1;
  v26 = objc_allocWithZone(v17);
  return WorldLineGuide.init(guideType:end1:end2:primarySegmentEnd1:primarySegmentEnd2:backingPlanes:anchorState:)(a1, a2, a3, v24, a5, a6, v25, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17 & 1);
}

char *WorldLineGuide.init(guideType:end1:end2:primarySegmentEnd1:primarySegmentEnd2:backingPlanes:anchorState:)(char a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, __n128 a9, __n128 a10, __n128 a11, __n128 a12, __n128 a13, __n128 a14, __n128 a15, __n128 a16, char a17)
{
  _BYTE *v17;
  _QWORD *v20;
  _BYTE *v21;
  char *v22;
  char v23;
  char *v24;
  __n128 v25;
  __n128 v26;
  char *v27;
  uint64_t v28;
  os_unfair_lock_s *v29;
  char *v30;
  __n128 v43;
  __n128 v45;
  objc_super v46;
  _BYTE v47[96];

  v20 = &v17[OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_backingPlanes];
  *(_QWORD *)&v17[OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_backingPlanes] = 0;
  v21 = &v17[OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_anchorState];
  v17[OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_anchorState] = 0;
  v22 = &v17[OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_segments];
  *(_OWORD *)v22 = 0u;
  *((_OWORD *)v22 + 1) = 0u;
  v22[32] = 1;
  v23 = a4 | a7;
  *((_OWORD *)v22 + 3) = 0u;
  *((_OWORD *)v22 + 4) = 0u;
  v22[80] = 1;
  swift_beginAccess();
  *v21 = a17 & 1;
  v17[OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_guideType] = a1;
  memset(v47, 0, 64);
  v47[64] = 1;
  type metadata accessor for WorldAnchor();
  swift_allocObject();
  v24 = v17;
  *(_QWORD *)&v24[OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_end1Anchor] = WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)((uint64_t)v47, 0, 1, (uint64_t)v47, a9, a10, a11, a12, 0.0);
  swift_allocObject();
  *(_QWORD *)&v24[OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_end2Anchor] = WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)((uint64_t)v47, 0, 1, (uint64_t)v47, a13, a14, a15, a16, 0.0);
  swift_beginAccess();
  *v20 = a8;
  swift_bridgeObjectRelease();
  if ((v23 & 1) == 0)
  {
    swift_beginAccess();
    *(_QWORD *)v22 = a2;
    *((_QWORD *)v22 + 1) = a3;
    *((_QWORD *)v22 + 2) = a5;
    *((_QWORD *)v22 + 3) = a6;
    v22[32] = 0;
  }
  v25 = a12;
  v25.n128_u32[3] = 0;
  v43 = v25;
  v26 = a16;
  v26.n128_u32[3] = 0;
  v45 = v26;
  swift_beginAccess();
  *((__n128 *)v22 + 3) = v43;
  *((__n128 *)v22 + 4) = v45;
  v22[80] = 0;

  v46.receiver = v24;
  v46.super_class = (Class)type metadata accessor for WorldLineGuide();
  v27 = (char *)objc_msgSendSuper2(&v46, sel_init);
  v28 = *(_QWORD *)&v27[OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state];
  v29 = *(os_unfair_lock_s **)(v28 + 24);
  v30 = v27;
  swift_retain();
  os_unfair_lock_lock(v29);
  swift_beginAccess();
  *(_QWORD *)(v28 + 16) = 8;
  os_unfair_lock_unlock(v29);

  swift_release();
  return v30;
}

Swift::Void __swiftcall WorldLineGuide.update(end1:end2:)(simd_float4x4 *end1, simd_float4x4 *end2)
{
  uint64_t v2;
  __n128 v3;
  __n128 v4;
  __n128 v5;
  __n128 v6;
  __n128 v7;
  __n128 v8;
  __n128 v9;
  __n128 v10;
  __n128 v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  _OWORD v19[4];
  char v20;

  v17 = v9;
  v18 = v10;
  v15 = v7;
  v16 = v8;
  v13 = v5;
  v14 = v6;
  v11 = v3;
  v12 = v4;
  memset(v19, 0, sizeof(v19));
  v20 = 1;
  type metadata accessor for WorldAnchor();
  swift_allocObject();
  *(_QWORD *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_end1Anchor) = WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)((uint64_t)v19, 0, 1, (uint64_t)v19, v11, v12, v13, v14, 0.0);
  swift_release();
  swift_allocObject();
  *(_QWORD *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_end2Anchor) = WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)((uint64_t)v19, 0, 1, (uint64_t)v19, v15, v16, v17, v18, 0.0);
  swift_release();
}

__n128 WorldLineGuide.updatePrimarySegment(end1:end2:)(__n128 a1, __n128 a2)
{
  uint64_t v2;
  __n128 *v3;
  __n128 result;

  v3 = (__n128 *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_segments);
  swift_beginAccess();
  result = a2;
  *v3 = a1;
  v3[1] = a2;
  v3[2].n128_u8[0] = 0;
  return result;
}

__n128 WorldLineGuide.updateVisibleSegment(end1:end2:)(__n128 a1, __n128 a2)
{
  uint64_t v2;
  __n128 *v3;
  __n128 result;

  v3 = (__n128 *)(v2 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_segments);
  swift_beginAccess();
  result = a2;
  v3[3] = a1;
  v3[4] = a2;
  v3[5].n128_u8[0] = 0;
  return result;
}

id WorldLineGuide.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void WorldLineGuide.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_22163E744()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

id WorldLineGuide.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorldLineGuide();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22163E7F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2556DE3F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for WorldLineGuide()
{
  return objc_opt_self();
}

unint64_t sub_22163E864()
{
  unint64_t result;

  result = qword_2556DE428;
  if (!qword_2556DE428)
  {
    result = MEMORY[0x22766FA4C](&protocol conformance descriptor for WorldLineGuideType, &type metadata for WorldLineGuideType);
    atomic_store(result, (unint64_t *)&qword_2556DE428);
  }
  return result;
}

unint64_t sub_22163E8AC()
{
  unint64_t result;

  result = qword_2556DE430;
  if (!qword_2556DE430)
  {
    result = MEMORY[0x22766FA4C](&protocol conformance descriptor for GuideAnchorState, &type metadata for GuideAnchorState);
    atomic_store(result, (unint64_t *)&qword_2556DE430);
  }
  return result;
}

uint64_t sub_22163E8F0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_guideType);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_22163E940(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC17MeasureFoundation14WorldLineGuide_guideType);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t storeEnumTagSinglePayload for WorldLineGuideType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_22163E9E0 + 4 * byte_221659DA5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_22163EA14 + 4 * byte_221659DA0[v4]))();
}

uint64_t sub_22163EA14(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22163EA1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22163EA24);
  return result;
}

uint64_t sub_22163EA30(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22163EA38);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_22163EA3C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22163EA44(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WorldLineGuideType()
{
  return &type metadata for WorldLineGuideType;
}

__n128 __swift_memcpy32_16(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

ValueMetadata *type metadata accessor for Segment()
{
  return &type metadata for Segment;
}

__n128 __swift_memcpy81_16(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for GuideSegments(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 81))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for GuideSegments(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 80) = 0;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 81) = v3;
  return result;
}

ValueMetadata *type metadata accessor for GuideSegments()
{
  return &type metadata for GuideSegments;
}

uint64_t getEnumTagSinglePayload for GuideAnchorState(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for GuideAnchorState(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_22163EBF0 + 4 * byte_221659DAF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22163EC24 + 4 * byte_221659DAA[v4]))();
}

uint64_t sub_22163EC24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22163EC2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22163EC34);
  return result;
}

uint64_t sub_22163EC40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22163EC48);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22163EC4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22163EC54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_22163EC60(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for GuideAnchorState()
{
  return &type metadata for GuideAnchorState;
}

uint64_t WorldPlaneType.description.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_22163ECAC
                                                            + 4 * asc_221659F10[a1]))(0x74694B7261, 0xE500000000000000);
}

uint64_t sub_22163ECAC()
{
  return 0x6465727265666E69;
}

uint64_t sub_22163ECC4()
{
  return 0x6B6361626C6C6166;
}

uint64_t sub_22163ECDC()
{
  return 0x6C61636F6CLL;
}

uint64_t sub_22163ECEC()
{
  return 0x73756F6976657270;
}

uint64_t sub_22163ED04()
{
  return 0x6863746170;
}

uint64_t sub_22163ED14()
{
  return 0x706544656C707061;
}

BOOL static WorldPlaneContext.MeasureType.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

__n128 WorldPlaneHitTestResult.init(position:normal:confidence:type:)@<Q0>(char a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, float32x4_t a4@<Q1>, float a5@<S2>)
{
  simd_float4x4 *v8;
  simd_float4x4 *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __n128 v13;
  id v14;
  uint64_t v15;
  int v16;
  int v17;
  __n128 result;
  __n128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  _sSo13simd_float4x4a17MeasureFoundationE4make8position17normalizedForwardABs5SIMD3VySfG_AItFZ_0(a3, a4);
  sceneKitToARKit(_:)(v9, v8);
  v21 = v11;
  v22 = v10;
  v19 = v13;
  v20 = v12;
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFD910]), sel_initWithTransform_, *(double *)&v10, *(double *)&v11, *(double *)&v12, v13.n128_f64[0]);
  type metadata accessor for WorldPlane();
  swift_allocObject();
  v15 = sub_22164164C(v14, a1, 1.0 - a5, 1.0);

  swift_retain();
  sub_221641268();
  v17 = v16;
  swift_release();
  *(_OWORD *)a2 = xmmword_221657CB0;
  *(_OWORD *)(a2 + 16) = v22;
  *(_OWORD *)(a2 + 32) = v21;
  *(_OWORD *)(a2 + 48) = v20;
  result = v19;
  *(__n128 *)(a2 + 64) = v19;
  *(_QWORD *)(a2 + 80) = 0;
  *(_QWORD *)(a2 + 88) = 0;
  *(_BYTE *)(a2 + 96) = 1;
  *(_QWORD *)(a2 + 104) = v15;
  *(_DWORD *)(a2 + 112) = v17;
  return result;
}

Swift::Float __swiftcall WorldPlaneHitTestResult.distanceToCamera(in:)(ARFrame in)
{
  float32x2_t *v1;
  float v2;
  id v3;
  __int128 v4;
  float32x2_t v5;
  __int128 v7;

  v2 = v1[9].f32[0];
  v3 = -[objc_class camera](in.super.isa, sel_camera);
  objc_msgSend(v3, sel_transform);
  v7 = v4;

  v5 = vsub_f32(v1[8], *(float32x2_t *)&v7);
  return sqrtf((float)((float)(v2 - *((float *)&v7 + 2)) * (float)(v2 - *((float *)&v7 + 2))) + vaddv_f32(vmul_f32(v5, v5)));
}

uint64_t WorldPlane.__allocating_init(anchor:type:uncertainty:confidenceMultiplier:)(void *a1, char a2, float a3, float a4)
{
  uint64_t v8;

  swift_allocObject();
  v8 = sub_22164164C(a1, a2, a3, a4);

  return v8;
}

void WorldPlaneHitTestResult.init(transform:plane:)(uint64_t a1)
{
  __asm { BR              X10 }
}

double sub_22163EFAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  __int128 v5;
  double result;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  swift_retain();
  WorldPlane.confidence.getter();
  v4 = v3;
  swift_release();
  v5 = *(_OWORD *)(v2 - 48);
  result = 0.000488281365;
  *(_OWORD *)v0 = xmmword_221657CB0;
  *(_OWORD *)(v0 + 16) = v7;
  *(_OWORD *)(v0 + 32) = v8;
  *(_OWORD *)(v0 + 48) = v9;
  *(_OWORD *)(v0 + 64) = v5;
  *(_QWORD *)(v0 + 80) = 0;
  *(_QWORD *)(v0 + 88) = 0;
  *(_BYTE *)(v0 + 96) = 1;
  *(_QWORD *)(v0 + 104) = v1;
  *(_DWORD *)(v0 + 112) = v4;
  return result;
}

Swift::Float __swiftcall WorldPlaneHitTestResult.distanceSquaredToCamera(in:)(ARFrame in)
{
  float32x2_t *v1;
  float v2;
  id v3;
  __int128 v4;
  float32x2_t v5;
  __int128 v7;

  v2 = v1[9].f32[0];
  v3 = -[objc_class camera](in.super.isa, sel_camera);
  objc_msgSend(v3, sel_transform);
  v7 = v4;

  v5 = vsub_f32(v1[8], *(float32x2_t *)&v7);
  return (float)((float)(v2 - *((float *)&v7 + 2)) * (float)(v2 - *((float *)&v7 + 2))) + vaddv_f32(vmul_f32(v5, v5));
}

void WorldPlaneHitTestResult.init(arHitResult:withPlaneType:)(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  id v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  int v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v6 = objc_msgSend(a1, sel_anchor);
  if (v6)
  {
    v7 = v6;
    type metadata accessor for WorldPlane();
    swift_allocObject();
    v8 = sub_22164164C(v7, a2, 0.0, 1.0);

    objc_msgSend(a1, sel_worldTransform);
    v17 = v10;
    v18 = v9;
    v15 = v12;
    v16 = v11;
    swift_retain_n();
    sub_221641268();
    v14 = v13;
    swift_release_n();

    *(_OWORD *)a3 = xmmword_221657CB0;
    *(_OWORD *)(a3 + 16) = v18;
    *(_OWORD *)(a3 + 32) = v17;
    *(_OWORD *)(a3 + 48) = v16;
    *(_OWORD *)(a3 + 64) = v15;
    *(_QWORD *)(a3 + 80) = 0;
    *(_QWORD *)(a3 + 88) = 0;
    *(_BYTE *)(a3 + 96) = 1;
    *(_QWORD *)(a3 + 104) = v8;
    *(_DWORD *)(a3 + 112) = v14;
  }
  else
  {
    __break(1u);
  }
}

uint64_t WorldPlaneType.rawValue.getter(uint64_t result)
{
  return result;
}

unint64_t sub_22163F2B4@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = _s17MeasureFoundation14WorldPlaneTypeO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_22163F2DC()
{
  sub_2216420A0();
  return sub_2216532F4();
}

uint64_t sub_22163F328()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_22163F354 + 4 * byte_221659F1E[*v0]))(0x74694B7261, 0xE500000000000000);
}

uint64_t sub_22163F354()
{
  return 0x6465727265666E69;
}

uint64_t sub_22163F36C()
{
  return 0x6B6361626C6C6166;
}

uint64_t sub_22163F384()
{
  return 0x6C61636F6CLL;
}

uint64_t sub_22163F394()
{
  return 0x73756F6976657270;
}

uint64_t sub_22163F3AC()
{
  return 0x6863746170;
}

uint64_t sub_22163F3BC()
{
  return 0x706544656C707061;
}

uint64_t property wrapper backing initializer of WorldPlane.anchor(void *a1)
{
  uint64_t v2;
  id v3;
  _DWORD *v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC6C0);
  v2 = swift_allocObject();
  v3 = a1;
  v4 = (_DWORD *)swift_slowAlloc();
  *v4 = 0;

  *(_QWORD *)(v2 + 16) = v3;
  *(_QWORD *)(v2 + 24) = v4;
  return v2;
}

uint64_t sub_22163F440@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  id v6;
  uint64_t result;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 16);
  v5 = *(os_unfair_lock_s **)(v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  v6 = *(id *)(v4 + 16);
  os_unfair_lock_unlock(v5);
  result = swift_release();
  *a2 = v6;
  return result;
}

id WorldPlane.anchor.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  id v3;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(os_unfair_lock_s **)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v2);
  swift_beginAccess();
  v3 = *(id *)(v1 + 16);
  os_unfair_lock_unlock(v2);
  swift_release();
  return v3;
}

void sub_22163F558(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  id v5;
  void *v6;
  id v7;

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(os_unfair_lock_s **)(v3 + 24);
  swift_retain();
  v5 = a1;
  os_unfair_lock_lock(v4);
  swift_beginAccess();
  v6 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v5;
  v7 = v5;

  os_unfair_lock_unlock(v4);
  swift_release();

}

uint64_t WorldPlane.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  id v9;
  id v10;
  _BYTE v12[24];

  v1 = v0;
  v2 = sub_221652FD0();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_beginAccess();
  v7 = *(_QWORD *)(v1 + 16);
  v8 = *(os_unfair_lock_s **)(v7 + 24);
  swift_retain();
  os_unfair_lock_lock(v8);
  swift_beginAccess();
  v9 = *(id *)(v7 + 16);
  os_unfair_lock_unlock(v8);
  swift_release();
  v10 = objc_msgSend(v9, sel_identifier);

  sub_221652FB8();
  sub_221641890((unint64_t *)&qword_2556DA0C0, 255, v3, MEMORY[0x24BDCEA88]);
  sub_221653114();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v2);
  return sub_221653B94();
}

uint64_t WorldPlane.type.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t WorldPlane.label.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  id v3;
  uint64_t v4;

  if (qword_2556D8EB0 != -1)
    swift_once();
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(os_unfair_lock_s **)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v2);
  swift_beginAccess();
  v3 = *(id *)(v1 + 16);
  os_unfair_lock_unlock(v2);
  swift_release();
  v4 = sub_221615B38(v3);

  return v4;
}

void WorldPlane.confidence.getter()
{
  __asm { BR              X10 }
}

float sub_22163F868()
{
  uint64_t v0;

  return (float)(1.0 - *(float *)(v0 + 52)) * *(float *)(v0 + 56);
}

Swift::Float __swiftcall WorldPlane.estimatedErrorAlongNormal(distanceFromObservation:)(Swift::Float distanceFromObservation)
{
  uint64_t v1;
  int v2;
  Swift::Float result;

  v2 = *(unsigned __int8 *)(v1 + 48);
  if (v2 == 4 || v2 == 2)
    LOBYTE(v2) = WorldPlane.baseType.getter();
  __asm { BR              X10 }
  return result;
}

id sub_22163F9DC()
{
  return objc_msgSend((id)objc_opt_self(), sel_jasperAvailable);
}

uint64_t WorldPlane.baseType.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  id v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  BOOL v8;
  uint64_t v9;
  os_unfair_lock_s *v10;
  id v11;
  uint64_t v12;

  v1 = (uint64_t *)(v0 + 16);
  if (objc_msgSend((id)objc_opt_self(), sel_jasperAvailable))
  {
    swift_beginAccess();
    v2 = *v1;
    v3 = *(os_unfair_lock_s **)(v2 + 24);
    swift_retain();
    os_unfair_lock_lock(v3);
    swift_beginAccess();
    v4 = *(id *)(v2 + 16);
    os_unfair_lock_unlock(v3);
    swift_release();
    objc_opt_self();
    v5 = swift_dynamicCastObjCClass();

    if (!v5)
    {
      v6 = *(unsigned __int8 *)(v0 + 48);
      if (v6 == 5)
        v7 = 5;
      else
        v7 = 6;
      v8 = v6 == 3;
      goto LABEL_10;
    }
    return 0;
  }
  swift_beginAccess();
  v9 = *v1;
  v10 = *(os_unfair_lock_s **)(v9 + 24);
  swift_retain();
  os_unfair_lock_lock(v10);
  swift_beginAccess();
  v11 = *(id *)(v9 + 16);
  os_unfair_lock_unlock(v10);
  swift_release();
  objc_opt_self();
  v12 = swift_dynamicCastObjCClass();

  if (v12)
    return 0;
  v6 = *(unsigned __int8 *)(v0 + 48);
  v8 = v6 == 3;
  v7 = 5;
LABEL_10:
  if (v8)
    return v6;
  else
    return v7;
}

void WorldPlane.description.getter()
{
  char *v0;

  sub_221653894();
  sub_221653210();
  v0 = (char *)sub_22163FCC8 + 4 * byte_221659F33[WorldPlane.baseType.getter()];
  __asm { BR              X10 }
}

uint64_t sub_22163FCC8()
{
  uint64_t v0;
  uint64_t v1;

  sub_221653210();
  swift_bridgeObjectRelease();
  v1 = sub_221653210();
  return ((uint64_t (*)(uint64_t))((char *)sub_22163FD98 + 4 * byte_221659F3A[*(unsigned __int8 *)(v0 + 48)]))(v1);
}

uint64_t sub_22163FD98()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  id v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  id v6;
  uint64_t v8;

  sub_221653210();
  swift_bridgeObjectRelease();
  sub_221653210();
  WorldPlane.confidence.getter();
  sub_22165342C();
  sub_221653210();
  sub_22165342C();
  sub_221653210();
  if (qword_2556D8EB0 != -1)
    swift_once();
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(os_unfair_lock_s **)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v2);
  swift_beginAccess();
  v3 = *(id *)(v1 + 16);
  os_unfair_lock_unlock(v2);
  swift_release();
  sub_221615B38(v3);

  sub_221653960();
  sub_221653210();
  v4 = *(_QWORD *)(v0 + 16);
  v5 = *(os_unfair_lock_s **)(v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  v6 = *(id *)(v4 + 16);
  os_unfair_lock_unlock(v5);
  swift_release();
  sub_221615C68(v6);

  sub_22165342C();
  sub_221653210();
  return v8;
}

uint64_t WorldPlane.init(anchor:type:uncertainty:confidenceMultiplier:)(void *a1, char a2, float a3, float a4)
{
  uint64_t v5;

  v5 = sub_22164164C(a1, a2, a3, a4);

  return v5;
}

Swift::Void __swiftcall WorldPlane.resetConfidence()()
{
  uint64_t v0;

  *(_DWORD *)(v0 + 52) = 0;
}

uint64_t WorldPlane.similar(to:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  os_unfair_lock_s *v4;
  id v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  id v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(os_unfair_lock_s **)(v3 + 24);
  swift_retain();
  os_unfair_lock_lock(v4);
  swift_beginAccess();
  v5 = *(id *)(v3 + 16);
  os_unfair_lock_unlock(v4);
  swift_release();
  swift_beginAccess();
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(os_unfair_lock_s **)(v6 + 24);
  swift_retain();
  os_unfair_lock_lock(v7);
  swift_beginAccess();
  v8 = *(id *)(v6 + 16);
  os_unfair_lock_unlock(v7);
  swift_release();
  objc_msgSend(v5, sel_transform);
  v21 = v9;
  objc_msgSend(v8, sel_transform);
  v11 = vmulq_f32(v21, v10);
  if ((float)(v11.f32[2] + vaddv_f32(*(float32x2_t *)v11.f32)) <= 0.996)
  {

  }
  else
  {
    objc_msgSend(v5, sel_transform);
    v22 = v12;
    objc_msgSend(v5, sel_transform);
    v14 = vmulq_f32(v22, v13);
    v15 = v14.f32[2] + vaddv_f32(*(float32x2_t *)v14.f32);
    objc_msgSend(v8, sel_transform);
    v23 = v16;
    objc_msgSend(v8, sel_transform);
    v20 = v17;

    v18 = vmulq_f32(v23, v20);
    if (vabds_f32(v15, v18.f32[2] + vaddv_f32(*(float32x2_t *)v18.f32)) < 0.025)
      return 1;
  }
  return 0;
}

unint64_t WorldPlane.distanceToEdge(point:)(float32x4_t a1)
{
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  void *v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  const float *v14;
  float32x2_t v15;
  unint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  float v20;
  float v23[6];
  uint64_t v24;
  simd_float4x4 v25;
  simd_float4x4 v26;

  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(os_unfair_lock_s **)(v2 + 24);
  swift_retain();
  os_unfair_lock_lock(v3);
  swift_beginAccess();
  v4 = *(id *)(v2 + 16);
  os_unfair_lock_unlock(v3);
  swift_release();
  objc_opt_self();
  v5 = (void *)swift_dynamicCastObjCClass();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, sel_transform);
    v26 = __invert_f4(v25);
    *(float32x2_t *)&v7 = simd_float4x4.apply(to:)(a1, *(float32x2_t *)v26.columns[0].f32, *(float32x2_t *)v26.columns[1].f32, *(float32x2_t *)v26.columns[2].f32, *(float32x2_t *)v26.columns[3].f32);
    *(_OWORD *)v23 = v7;
    v8 = objc_msgSend(v6, sel_geometry);
    v9 = sub_221653648();

    v10 = *(_QWORD *)(v9 + 16);
    if (v10)
    {
      v24 = MEMORY[0x24BEE4AF8];
      sub_2215CC064(0, v10, 0);
      v11 = 0;
      v12 = v24;
      v13 = *(_QWORD *)(v24 + 16);
      do
      {
        v14 = (const float *)(v9 + 16 * v11 + 32);
        v15 = (float32x2_t)*(_OWORD *)vld2_f32(v14).val;
        v16 = *(_QWORD *)(v24 + 24);
        if (v13 >= v16 >> 1)
          sub_2215CC064((char *)(v16 > 1), v13 + 1, 1);
        ++v11;
        *(_QWORD *)(v24 + 16) = v13 + 1;
        *(float64x2_t *)(v24 + 16 * v13++ + 32) = vcvtq_f64_f32(v15);
      }
      while (v10 != v11);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      v12 = MEMORY[0x24BEE4AF8];
    }
    _s17MeasureFoundation6CVUtilC14signedDistance5point7contour12CoreGraphics7CGFloatVSo7CGPointV_SayAKGtFZ_0(v12, v23[0], v23[2]);
    v19 = v18;

    swift_bridgeObjectRelease();
    v20 = v19;
    v17 = LODWORD(v20) ^ 0x80000000;
  }
  else
  {

    v17 = 0;
  }
  return v17 | ((unint64_t)(v6 == 0) << 32);
}

unint64_t WorldPlane.distanceToEdge(normalizedPoint:frame:)(void *a1)
{
  id v1;
  uint64_t v2;
  __n128 v3;
  float32x4_t v4;
  uint64_t v5;
  float32x4_t v6;
  unint64_t v7;
  unsigned int v8;
  float32x4_t v10;
  float32x4_t v11;
  _BYTE v12[128];
  _BYTE v13[64];
  float32x4_t v14;
  uint64_t v15;
  _OWORD v16[4];
  char v17;

  v1 = objc_msgSend(a1, sel_camera);
  memset(v16, 0, sizeof(v16));
  LOBYTE(v2) = 1;
  v17 = 1;
  v3 = _sSo7ARFrameC17MeasureFoundationE9getHitRay11cameraPoint0G00G18CorrectedTransforms5SIMD3VySfG6origin_AJ9directionts5SIMD2VySfG_So8ARCameraCSo13simd_float4x4aSgtFZ_0(v1, (uint64_t)v16);
  v10 = v4;
  v11 = (float32x4_t)v3;

  WorldPlane.hitTest(hitRay:withPlaneType:)(7, (uint64_t)v12, v11, v10);
  sub_2215C6540((uint64_t)v12, (uint64_t)v13, &qword_2556DC6B0);
  v5 = v15;
  if (v15)
  {
    v6 = v14;
    v6.i32[3] = 0;
    v7 = WorldPlane.distanceToEdge(point:)(v6);
    v8 = v7;
    v2 = HIDWORD(v7) & 1;
    sub_221606E68((uint64_t)v12);
    v5 = v8;
  }
  return v5 | ((unint64_t)v2 << 32);
}

uint64_t WorldPlane.refresh(anchor:camera:uncertaintyPoint:)(void *a1, uint64_t a2, float32x4_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t *v12;
  uint64_t v13;
  os_unfair_lock_s *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  void *v21;
  uint64_t v22;
  float v23;
  float32x4_t v24;
  uint64_t v25;
  os_unfair_lock_s *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  __int128 v31;
  id v32;
  uint64_t v33;
  os_unfair_lock_s *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  int v39;
  int v40;
  void *v41;
  float32x4_t v42;
  int32x4_t v43;
  unsigned __int32 v44;
  float32x2_t v45;
  float32x2_t v46;
  float32x4_t v47;
  float v48;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  float32x4_t v54;
  float32x4_t v55;
  uint64_t v56;
  char v57[32];
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE v62[16];
  __int128 v63;
  float32x4_t v64;
  char v65;

  v54 = a3;
  v55.i64[0] = a2;
  sub_2215C6540(a2, (uint64_t)v57, &qword_2556D9618);
  v50 = v58;
  *(_QWORD *)&v52 = v59;
  v51 = v60;
  v53 = v61;
  v5 = sub_221652FD0();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v50 - v10;
  v12 = (uint64_t *)(v3 + 16);
  swift_beginAccess();
  v56 = v3;
  v13 = *(_QWORD *)(v3 + 16);
  v14 = *(os_unfair_lock_s **)(v13 + 24);
  swift_retain();
  os_unfair_lock_lock(v14);
  swift_beginAccess();
  v15 = *(id *)(v13 + 16);
  os_unfair_lock_unlock(v14);
  swift_release();
  v16 = objc_msgSend(v15, sel_identifier);

  sub_221652FB8();
  v17 = a1;
  v18 = objc_msgSend(a1, sel_identifier);
  sub_221652FB8();

  LOBYTE(v18) = sub_221652FAC();
  v19 = *(void (**)(char *, uint64_t))(v6 + 8);
  v19(v9, v5);
  v19(v11, v5);
  if ((v18 & 1) == 0)
    return 0;
  objc_opt_self();
  v20 = swift_dynamicCastObjCClass();
  if (!v20)
  {
    v25 = *v12;
    v26 = *(os_unfair_lock_s **)(*v12 + 24);
    v27 = a1;
    swift_retain();
    os_unfair_lock_lock(v26);
    swift_beginAccess();
    v28 = *(void **)(v25 + 16);
    *(_QWORD *)(v25 + 16) = v27;
    v29 = v27;

    os_unfair_lock_unlock(v26);
    swift_release();

    return 0;
  }
  v21 = (void *)v20;
  v22 = v56;
  v23 = *(float *)(v56 + 52);
  if (v23 != 0.0)
  {
    sub_2215C6540(v55.i64[0], (uint64_t)v62, &qword_2556D9618);
    if ((v65 & 1) == 0)
    {
      *(_QWORD *)&v31 = v50;
      *((_QWORD *)&v31 + 1) = v52;
      v52 = v31;
      v24.i64[0] = v51;
      v24.i64[1] = v53;
      goto LABEL_10;
    }
LABEL_8:
    v30 = a1;
    goto LABEL_11;
  }
  sub_2215C6540(v55.i64[0], (uint64_t)v62, &qword_2556D9618);
  if ((v65 & 1) != 0)
    goto LABEL_8;
  v52 = v63;
  v24 = v64;
LABEL_10:
  v55 = v24;
  v32 = a1;
  if (v23 != 0.0)
  {
    v41 = v32;
    v42 = vsubq_f32(v54, v55);
    v43 = (int32x4_t)vmulq_f32(v42, v42);
    if (sqrtf(*(float *)&v43.i32[2] + (float)(*(float *)v43.i32 + vmuls_lane_f32(v42.f32[1], *(float32x2_t *)v42.f32, 1))) >= 2.0|| (v44 = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v43, 2), vadd_f32(*(float32x2_t *)v43.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v43.i8, 1))).u32[0], v45 = vrsqrte_f32((float32x2_t)v44), v46 = vmul_f32(v45, vrsqrts_f32((float32x2_t)v44, vmul_f32(v45, v45))), v47 = vmulq_n_f32(v42, vmul_f32(v46, vrsqrts_f32((float32x2_t)v44, vmul_f32(v46, v46))).f32[0]), (float)(vmuls_lane_f32(0.0 - *((float *)&v52 + 2), v47, 2)+ (float)((float)((float)(0.0 - *(float *)&v52) * v47.f32[0])+ vmuls_lane_f32(0.0 - *((float *)&v52 + 1), *(float32x2_t *)v47.f32, 1))) <= 0.866)|| (objc_msgSend(v21, sel_uncertaintyAlongNormal), v48 >= *(float *)(v22 + 52)))
    {

      return 0;
    }
  }
LABEL_11:
  v33 = *(_QWORD *)(v22 + 16);
  v34 = *(os_unfair_lock_s **)(v33 + 24);
  v35 = v17;
  swift_retain();
  os_unfair_lock_lock(v34);
  v36 = 1;
  swift_beginAccess();
  v37 = *(void **)(v33 + 16);
  *(_QWORD *)(v33 + 16) = v35;
  v38 = v35;

  os_unfair_lock_unlock(v34);
  swift_release();

  objc_msgSend(v21, sel_uncertaintyAlongNormal);
  v40 = v39;

  *(_DWORD *)(v22 + 52) = v40;
  return v36;
}

uint64_t WorldPlane.hitTest(normalizedPoint:frame:withPlaneType:)@<X0>(void *a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  id v5;
  __n128 v6;
  float32x4_t v7;
  float32x4_t v9;
  float32x4_t v10;
  _BYTE v11[128];
  _OWORD v12[4];
  char v13;

  v5 = objc_msgSend(a1, sel_camera);
  memset(v12, 0, sizeof(v12));
  v13 = 1;
  v6 = _sSo7ARFrameC17MeasureFoundationE9getHitRay11cameraPoint0G00G18CorrectedTransforms5SIMD3VySfG6origin_AJ9directionts5SIMD2VySfG_So8ARCameraCSo13simd_float4x4aSgtFZ_0(v5, (uint64_t)v12);
  v9 = v7;
  v10 = (float32x4_t)v6;

  WorldPlane.hitTest(hitRay:withPlaneType:)(a2, (uint64_t)v11, v10, v9);
  return sub_2215C6540((uint64_t)v11, a3, &qword_2556DC6B0);
}

void WorldPlane.hitTest(hitRay:withPlaneType:)(char a1@<W0>, uint64_t a2@<X8>, float32x4_t a3@<Q0>, float32x4_t a4@<Q1>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  os_unfair_lock_s *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;
  int64x2_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int8x16_t v26;
  int64x2_t v27;
  __int128 v28;
  __int128 v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  double v34;
  char v35;
  simd_float4x4 *v36;
  simd_float4x4 *v37;
  int8x16_t v38;
  int8x16_t v39;
  int8x16_t v40;
  int64x2_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  __int32 v48;
  int64x2_t v49;
  int8x16_t v50;
  int8x16_t v51;
  int64x2_t v52;
  __int32 v53;
  int8x16_t v54;
  int v55;
  __int128 v56;
  int8x16_t v57;
  int64x2_t v58;
  int8x16_t v59;
  int8x16_t v60;
  int8x16_t v61;
  int8x16_t v62;
  float32x4_t v63;
  float32x4_t v64;
  int64x2_t v66;
  int8x16_t v67;
  int64x2_t v68;
  __int128 v70;
  __int128 v71;
  float32x4_t v72;
  __int128 v73;
  _BYTE v74[72];
  __int128 v75;
  uint64_t v76;
  int v77;

  v5 = v4;
  swift_beginAccess();
  v8 = *(_QWORD *)(v5 + 16);
  v9 = *(os_unfair_lock_s **)(v8 + 24);
  swift_retain();
  os_unfair_lock_lock(v9);
  swift_beginAccess();
  v10 = *(id *)(v8 + 16);
  os_unfair_lock_unlock(v9);
  swift_release();
  objc_opt_self();
  v11 = swift_dynamicCastObjCClass();
  if (!v11)
  {
    if (WorldPlane.baseType.getter() == 3)
    {
      if (qword_2556D8EB0 != -1)
        swift_once();
      sub_221612468((uint64_t)&v73, a3, a4);
      v23 = *(_QWORD *)v74;
      v67 = *(int8x16_t *)&v74[8];
      v71 = v73;
      v60 = *(int8x16_t *)&v74[40];
      v62 = *(int8x16_t *)&v74[24];
      v56 = v75;
      v58 = *(int64x2_t *)&v74[56];
      v5 = v76;
      v22 = v77;

      v29 = v56;
      v27 = v58;
      v26 = v60;
      v25 = v62;
      v24 = v67;
      v28 = v71;
      goto LABEL_14;
    }
    if (WorldPlane.baseType.getter() == 5)
    {
      objc_msgSend(v10, sel_transform);
      v30.i32[3] = 0;
      v63 = v30;
      objc_msgSend(v10, sel_transform);
      v32 = v31;
      v32.i32[3] = 0;
      v33 = a4;
      v72 = v32;
      sub_22160A740(a3, v33, v63, v32);
      if ((v35 & 1) != 0)
        goto LABEL_13;
      _sSo13simd_float4x4a17MeasureFoundationE4make8position17normalizedForwardABs5SIMD3VySfG_AItFZ_0(v34, v72);
      sceneKitToARKit(_:)(v37, v36);
      v57 = v38;
      v59 = v39;
      v61 = v40;
      v66 = v41;
      v70 = xmmword_221657CB0;
      v73 = xmmword_221657CB0;
      *(int8x16_t *)v74 = v38;
      *(int8x16_t *)&v74[16] = v40;
      *(int8x16_t *)&v74[32] = v39;
      *(int64x2_t *)&v74[48] = v41;
    }
    else
    {
      if (!objc_msgSend((id)objc_opt_self(), sel_jasperAvailable))
        goto LABEL_13;
      if (WorldPlane.baseType.getter() != 6)
        goto LABEL_13;
      objc_msgSend(v10, sel_transform);
      v42.i32[3] = 0;
      v64 = v42;
      objc_msgSend(v10, sel_transform);
      v44 = v43;
      v44.i32[3] = 0;
      sub_22160A740(a3, a4, v64, v44);
      if ((v47 & 1) != 0)
        goto LABEL_13;
      v48 = v45;
      v49.i64[0] = v45;
      v49.i64[1] = v46;
      v68 = v49;
      objc_msgSend(v10, sel_transform);
      v57 = v50;
      v59 = v51;
      v52 = v68;
      v52.i32[0] = v48;
      v52.i32[3] = v53;
      v61 = v54;
      v66 = v52;
      v70 = xmmword_221657CB0;
      v73 = xmmword_221657CB0;
      *(int8x16_t *)v74 = v50;
      *(int8x16_t *)&v74[16] = v54;
      *(int8x16_t *)&v74[32] = v51;
      *(int64x2_t *)&v74[48] = v52;
    }
    *(_QWORD *)&v74[64] = 0;
    *(_QWORD *)&v75 = 0;
    BYTE8(v75) = 1;
    v76 = v5;
    v77 = 0;
    swift_retain();
    sub_221641268();
    v22 = v55;

LABEL_7:
    v23 = v57.i64[0];
    v24 = vextq_s8(v57, v61, 8uLL);
    v25 = vextq_s8(v61, v59, 8uLL);
    v26 = vextq_s8(v59, (int8x16_t)v66, 8uLL);
    v27 = vzip2q_s64(v66, (int64x2_t)0);
    v28 = v70;
    v29 = xmmword_22165A210;
LABEL_14:
    *(_OWORD *)a2 = v28;
    *(_QWORD *)(a2 + 16) = v23;
    *(int8x16_t *)(a2 + 24) = v24;
    *(int8x16_t *)(a2 + 40) = v25;
    *(int8x16_t *)(a2 + 56) = v26;
    *(int64x2_t *)(a2 + 72) = v27;
    *(_OWORD *)(a2 + 88) = v29;
    *(_QWORD *)(a2 + 104) = v5;
    *(_DWORD *)(a2 + 112) = v22;
    return;
  }
  v12 = (void *)v11;
  v10 = v10;
  v13 = objc_msgSend(v12, sel__hitTestFromOrigin_withDirection_usingExtent_usingGeometry_, 0, 0, *(double *)a3.i64, *(double *)a4.i64);
  if (!v13)
  {

LABEL_13:
    v23 = 0;
    v5 = 0;
    v28 = 0uLL;
    v22 = 0;
    v24 = 0uLL;
    v25 = 0uLL;
    v26 = 0uLL;
    v27 = 0uLL;
    v29 = 0uLL;
    goto LABEL_14;
  }
  v14 = v13;
  v15 = objc_msgSend(v13, sel_anchor);
  if (v15)
  {
    v16 = v15;
    if (a1 == 7)
      a1 = 0;
    type metadata accessor for WorldPlane();
    swift_allocObject();
    v5 = sub_22164164C(v16, a1, 0.0, 1.0);

    objc_msgSend(v14, sel_worldTransform);
    v57 = v17;
    v59 = v18;
    v61 = v19;
    v66 = v20;
    v70 = xmmword_221657CB0;
    v73 = xmmword_221657CB0;
    *(int8x16_t *)v74 = v17;
    *(int8x16_t *)&v74[16] = v19;
    *(int8x16_t *)&v74[32] = v18;
    *(int64x2_t *)&v74[48] = v20;
    *(_QWORD *)&v74[64] = 0;
    *(_QWORD *)&v75 = 0;
    BYTE8(v75) = 1;
    v76 = v5;
    v77 = 0;
    swift_retain_n();
    sub_221641268();
    v22 = v21;

    swift_release_n();
    goto LABEL_7;
  }
  __break(1u);
}

uint64_t WorldPlane.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t WorldPlane.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t WorldPlane.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  id v9;
  id v10;
  uint64_t v12;

  v1 = v0;
  v2 = sub_221652FD0();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_221653B88();
  swift_beginAccess();
  v7 = *(_QWORD *)(v1 + 16);
  v8 = *(os_unfair_lock_s **)(v7 + 24);
  swift_retain();
  os_unfair_lock_lock(v8);
  swift_beginAccess();
  v9 = *(id *)(v7 + 16);
  os_unfair_lock_unlock(v8);
  swift_release();
  v10 = objc_msgSend(v9, sel_identifier);

  sub_221652FB8();
  sub_221641890((unint64_t *)&qword_2556DA0C0, 255, v3, MEMORY[0x24BDCEA88]);
  sub_221653114();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
  sub_221653B94();
  return sub_221653BAC();
}

BOOL sub_221641088(uint64_t *a1, uint64_t *a2)
{
  return _s17MeasureFoundation10WorldPlaneC2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t sub_221641094()
{
  return WorldPlane.hashValue.getter();
}

uint64_t sub_2216410B4()
{
  return WorldPlane.hash(into:)();
}

uint64_t sub_2216410D4()
{
  sub_221653B88();
  WorldPlane.hash(into:)();
  return sub_221653BAC();
}

void sub_221641110()
{
  WorldPlane.description.getter();
}

__n128 WorldPlaneHitTestResult.transform.getter()
{
  __n128 *v0;

  return v0[1];
}

double WorldPlaneHitTestResult.localPosition.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  id v4;
  simd_float4 v5;
  simd_float4 v6;
  simd_float4 v7;
  simd_float4 v8;
  float32x2_t v9;
  __int128 v10;
  simd_float4 v12;
  simd_float4 v13;
  simd_float4 v14;
  simd_float4 v15;
  simd_float4x4 v16;
  simd_float4x4 v17;

  if ((*(_BYTE *)(v0 + 96) & 1) != 0)
  {
    v1 = *(_QWORD *)(v0 + 104);
    swift_beginAccess();
    v2 = *(_QWORD *)(v1 + 16);
    v3 = *(os_unfair_lock_s **)(v2 + 24);
    swift_retain();
    os_unfair_lock_lock(v3);
    swift_beginAccess();
    v4 = *(id *)(v2 + 16);
    os_unfair_lock_unlock(v3);
    swift_release();
    objc_opt_self();
    objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_transform);
    v14 = v6;
    v15 = v5;
    v12 = v8;
    v13 = v7;

    v16.columns[1] = v14;
    v16.columns[0] = v15;
    v16.columns[3] = v12;
    v16.columns[2] = v13;
    v17 = __invert_f4(v16);
    v9 = *(float32x2_t *)v17.columns[0].f32;
    v17.columns[0] = *(simd_float4 *)(v0 + 64);
    v17.columns[0].i32[3] = 0;
    *(float32x2_t *)&v10 = simd_float4x4.apply(to:)((float32x4_t)v17.columns[0], v9, *(float32x2_t *)v17.columns[1].f32, *(float32x2_t *)v17.columns[2].f32, *(float32x2_t *)v17.columns[3].f32);
    *(_OWORD *)(v0 + 80) = v10;
    *(_BYTE *)(v0 + 96) = 0;
  }
  else
  {
    *(_QWORD *)&v10 = *(_QWORD *)(v0 + 80);
  }
  return *(double *)&v10;
}

uint64_t WorldPlaneHitTestResult.plane.getter()
{
  return swift_retain();
}

float WorldPlaneHitTestResult.confidence.getter()
{
  uint64_t v0;

  return *(float *)(v0 + 112);
}

void sub_221641268()
{
  __asm { BR              X10 }
}

void sub_22164129C()
{
  WorldPlane.confidence.getter();
}

uint64_t WorldPlaneContext.MeasureType.hash(into:)()
{
  return sub_221653B94();
}

uint64_t WorldPlaneContext.MeasureType.hashValue.getter()
{
  sub_221653B88();
  sub_221653B94();
  return sub_221653BAC();
}

uint64_t WorldPlaneContext.measureType.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t WorldPlaneContext.isFirstPoint.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t WorldPlaneContext.isFirstPoint.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 1) = result;
  return result;
}

uint64_t (*WorldPlaneContext.isFirstPoint.modify())()
{
  return nullsub_1;
}

uint64_t WorldPlaneContext.isMovingPoint.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t WorldPlaneContext.isMovingPoint.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 2) = result;
  return result;
}

uint64_t (*WorldPlaneContext.isMovingPoint.modify())()
{
  return nullsub_1;
}

uint64_t WorldPlaneContext.lastHitTestResult.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_22164178C(v1 + 16, a1);
}

uint64_t WorldPlaneContext.lastHitTestResult.setter(uint64_t a1)
{
  uint64_t v1;

  return sub_2216417D4(a1, v1 + 16);
}

uint64_t (*WorldPlaneContext.lastHitTestResult.modify())()
{
  return nullsub_1;
}

uint64_t WorldPlaneContext.fallbackPlane.getter()
{
  return swift_retain();
}

uint64_t WorldPlaneContext.fallbackPlane.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_release();
  *(_QWORD *)(v1 + 136) = a1;
  return result;
}

uint64_t (*WorldPlaneContext.fallbackPlane.modify())()
{
  return nullsub_1;
}

double WorldPlaneContext.init(measureType:)@<D0>(char a1@<W0>, uint64_t a2@<X8>)
{
  double result;

  *(_BYTE *)a2 = a1 & 1;
  *(_WORD *)(a2 + 1) = 0;
  *(_QWORD *)(a2 + 136) = 0;
  result = 0.0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_DWORD *)(a2 + 128) = 0;
  return result;
}

BOOL _s17MeasureFoundation10WorldPlaneC2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  os_unfair_lock_s *v12;
  id v13;
  id v14;
  uint64_t v15;
  os_unfair_lock_s *v16;
  id v17;
  id v18;
  void (*v19)(_BYTE *, uint64_t);
  _BYTE v21[24];

  v4 = sub_221652FD0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v10 = &v21[-v9];
  swift_beginAccess();
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(os_unfair_lock_s **)(v11 + 24);
  swift_retain();
  os_unfair_lock_lock(v12);
  swift_beginAccess();
  v13 = *(id *)(v11 + 16);
  os_unfair_lock_unlock(v12);
  swift_release();
  v14 = objc_msgSend(v13, sel_identifier);

  sub_221652FB8();
  swift_beginAccess();
  v15 = *(_QWORD *)(a2 + 16);
  v16 = *(os_unfair_lock_s **)(v15 + 24);
  swift_retain();
  os_unfair_lock_lock(v16);
  swift_beginAccess();
  v17 = *(id *)(v15 + 16);
  os_unfair_lock_unlock(v16);
  swift_release();
  v18 = objc_msgSend(v17, sel_identifier);

  sub_221652FB8();
  LOBYTE(v18) = sub_221652FAC();
  v19 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
  v19(v8, v4);
  v19(v10, v4);
  return (v18 & 1) != 0 && *(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(a2 + 48);
}

uint64_t sub_22164164C(void *a1, char a2, float a3, float a4)
{
  uint64_t v4;
  uint64_t v9;
  id v10;
  _DWORD *v11;
  _OWORD v13[4];
  char v14;

  *(_OWORD *)(v4 + 24) = xmmword_221657CC0;
  *(_QWORD *)(v4 + 40) = 0x3F5DB22D40000000;
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC6C0);
  v9 = swift_allocObject();
  v10 = a1;
  v11 = (_DWORD *)swift_slowAlloc();
  *v11 = 0;
  *(_QWORD *)(v9 + 16) = v10;
  *(_QWORD *)(v9 + 24) = v11;
  *(_QWORD *)(v4 + 16) = v9;
  swift_endAccess();
  *(_BYTE *)(v4 + 48) = a2;
  *(float *)(v4 + 52) = a3;
  *(float *)(v4 + 56) = a4;
  memset(v13, 0, sizeof(v13));
  v14 = 1;
  if (qword_2556D8DD0 != -1)
    swift_once();
  WorldPlane.refresh(anchor:camera:uncertaintyPoint:)(v10, (uint64_t)v13, (float32x4_t)static SIMD3<>.zero);
  return v4;
}

uint64_t type metadata accessor for WorldPlane()
{
  return objc_opt_self();
}

unint64_t _s17MeasureFoundation14WorldPlaneTypeO8rawValueACSgSi_tcfC_0(unint64_t result)
{
  if (result >= 7)
    return 7;
  return result;
}

uint64_t sub_22164178C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC6B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2216417D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2556DC6B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_221641820()
{
  unint64_t result;

  result = qword_2556DE460;
  if (!qword_2556DE460)
  {
    result = MEMORY[0x22766FA4C](&protocol conformance descriptor for WorldPlaneType, &type metadata for WorldPlaneType);
    atomic_store(result, (unint64_t *)&qword_2556DE460);
  }
  return result;
}

uint64_t sub_221641864(uint64_t a1, uint64_t a2)
{
  return sub_221641890(&qword_2556DE468, a2, (uint64_t (*)(uint64_t))type metadata accessor for WorldPlane, (uint64_t)&protocol conformance descriptor for WorldPlane);
}

uint64_t sub_221641890(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x22766FA4C](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2216418D4()
{
  unint64_t result;

  result = qword_2556DE470;
  if (!qword_2556DE470)
  {
    result = MEMORY[0x22766FA4C](&protocol conformance descriptor for WorldPlaneContext.MeasureType, &type metadata for WorldPlaneContext.MeasureType);
    atomic_store(result, (unint64_t *)&qword_2556DE470);
  }
  return result;
}

void sub_22164191C(id *a1)
{
  sub_22163F558(*a1);
}

uint64_t getEnumTagSinglePayload for WorldPlaneType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for WorldPlaneType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_221641A20 + 4 * byte_221659F4D[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_221641A54 + 4 * byte_221659F48[v4]))();
}

uint64_t sub_221641A54(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_221641A5C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x221641A64);
  return result;
}

uint64_t sub_221641A70(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x221641A78);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_221641A7C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_221641A84(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WorldPlaneType()
{
  return &type metadata for WorldPlaneType;
}

uint64_t destroy for WorldPlaneHitTestResult()
{
  return swift_release();
}

uint64_t initializeWithCopy for WorldPlaneHitTestResult(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for WorldPlaneHitTestResult(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 12) = *(_DWORD *)(a2 + 12);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v4 = *(_OWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = v4;
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_retain();
  swift_release();
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  return a1;
}

__n128 __swift_memcpy116_16(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[6];
  *(_DWORD *)(a1 + 112) = *((_DWORD *)a2 + 28);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for WorldPlaneHitTestResult(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_release();
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for WorldPlaneHitTestResult(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 116))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 104);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WorldPlaneHitTestResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 112) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 116) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 104) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 116) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for WorldPlaneHitTestResult()
{
  return &type metadata for WorldPlaneHitTestResult;
}

uint64_t destroy for WorldPlaneContext()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for WorldPlaneContext(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_WORD *)(a1 + 1) = *(_WORD *)(a2 + 1);
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_DWORD *)(a1 + 128) = *(_DWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for WorldPlaneContext(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  v4 = *(_OWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = v4;
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_retain();
  swift_release();
  *(_DWORD *)(a1 + 128) = *(_DWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy144_16(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  result = *(__n128 *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v6;
  return result;
}

uint64_t assignWithTake for WorldPlaneContext(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  v6 = *(_OWORD *)(a2 + 80);
  v7 = *(_OWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 112) = *(_BYTE *)(a2 + 112);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_release();
  *(_DWORD *)(a1 + 128) = *(_DWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for WorldPlaneContext(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 144))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 120);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WorldPlaneContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 144) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 144) = 0;
    if (a2)
      *(_QWORD *)(result + 120) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for WorldPlaneContext()
{
  return &type metadata for WorldPlaneContext;
}

uint64_t storeEnumTagSinglePayload for WorldPlaneContext.MeasureType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_221642020 + 4 * byte_221659F57[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_221642054 + 4 * byte_221659F52[v4]))();
}

uint64_t sub_221642054(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22164205C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x221642064);
  return result;
}

uint64_t sub_221642070(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x221642078);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22164207C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_221642084(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WorldPlaneContext.MeasureType()
{
  return &type metadata for WorldPlaneContext.MeasureType;
}

unint64_t sub_2216420A0()
{
  unint64_t result;

  result = qword_2556DE608;
  if (!qword_2556DE608)
  {
    result = MEMORY[0x22766FA4C](&protocol conformance descriptor for WorldPlaneType, &type metadata for WorldPlaneType);
    atomic_store(result, (unint64_t *)&qword_2556DE608);
  }
  return result;
}

id WorldPoint.__allocating_init(anchor:type:state:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return WorldPoint.init(anchor:type:state:)(a1, a2, a3);
}

double WorldPoint.resultRepresentation.getter@<D0>(uint64_t a1@<X8>)
{
  void *v1;
  __n128 v3;
  double result;
  __n128 v5;
  __n128 v6[4];
  _OWORD v7[2];

  sub_221644738((char *)v1, v6);
  v3 = v6[3];
  *(__n128 *)(a1 + 32) = v6[2];
  *(__n128 *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v7[0];
  *(_OWORD *)(a1 + 77) = *(_OWORD *)((char *)v7 + 13);
  result = v6[0].n128_f64[0];
  v5 = v6[1];
  *(__n128 *)a1 = v6[0];
  *(__n128 *)(a1 + 16) = v5;
  return result;
}

uint64_t *WorldPointType.default.unsafeMutableAddressor()
{
  return &static WorldPointType.default;
}

uint64_t static WorldPointType.default.getter()
{
  swift_beginAccess();
  return static WorldPointType.default;
}

uint64_t static WorldPointType.default.setter(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  static WorldPointType.default = a1;
  return result;
}

uint64_t (*static WorldPointType.default.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

Swift::Bool __swiftcall WorldPointType.isSnap()()
{
  unint64_t v0;

  return (v0 < 9) & (0x1E9u >> v0);
}

uint64_t WorldPointType.isSnappable.getter(unint64_t a1)
{
  return (a1 < 9) & (0x1EEu >> a1);
}

Swift::Bool __swiftcall WorldPointType.isUserObjectSnap()()
{
  unint64_t v0;

  return v0 < 3;
}

uint64_t WorldPointType.isSnappedOnGuide.getter(unint64_t a1)
{
  return (a1 < 9) & (0x160u >> a1);
}

uint64_t WorldPointType.description.getter(uint64_t a1)
{
  uint64_t result;

  result = 1885433459;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 0x726F6A616DLL;
      break;
    case 2:
      result = 0x726F6E696DLL;
      break;
    case 3:
      result = 0x6E726F4370616E73;
      break;
    case 4:
      result = 0x6567644570616E73;
      break;
    case 5:
      result = 0x6469754770616E73;
      break;
    case 6:
      result = 0xD000000000000011;
      break;
    case 7:
      result = 0x6976694470616E73;
      break;
    case 8:
      result = 0xD000000000000010;
      break;
    default:
      result = sub_221653B28();
      __break(1u);
      break;
  }
  return result;
}

unint64_t WorldPointType.init(rawValue:)(unint64_t a1)
{
  return sub_221644BE0(a1);
}

unint64_t sub_2216423F4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_221644BE0(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t WorldPoint.lines.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_221642548(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_2216425B0(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

void *WorldPoint.parentLine.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void *WorldPoint.snapLine.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_snapLine);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void WorldPoint.snapLine.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_snapLine);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*WorldPoint.snapLine.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_22164273C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_partOfRectangleId);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t WorldPoint.partOfRectangleId.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_partOfRectangleId);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t WorldPoint.delegate.getter()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t WorldPoint.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_delegate);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_unknownObjectRelease();
}

void (*WorldPoint.delegate.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  char *v3;
  uint64_t v4;
  _OWORD *v5;

  v3 = (char *)malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_delegate;
  *((_QWORD *)v3 + 5) = v1;
  *((_QWORD *)v3 + 6) = v4;
  v5 = (_OWORD *)(v1 + v4);
  swift_beginAccess();
  *(_OWORD *)(v3 + 24) = *v5;
  swift_unknownObjectRetain();
  return sub_221642918;
}

void sub_221642918(uint64_t a1, char a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_OWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + *(_QWORD *)(*(_QWORD *)a1 + 48)) = *(_OWORD *)(*(_QWORD *)a1 + 24);
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRelease();
  free(v2);
}

__n128 WorldPoint.transform.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  uint64_t v4;
  __int128 v6;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor);
  swift_beginAccess();
  v2 = *v1;
  v3 = *(os_unfair_lock_s **)(v2 + 24);
  swift_retain();
  os_unfair_lock_lock(v3);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 + 16);
  swift_retain();
  os_unfair_lock_unlock(v3);
  swift_release();
  v6 = *(_OWORD *)(v4 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
  swift_release();
  return (__n128)v6;
}

char *WorldPoint.connectedEndpoint.getter()
{
  uint64_t v0;
  char *v1;
  uint64_t *v2;
  uint64_t v3;
  char *v4;
  char *v5;
  char *result;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  BOOL v15;
  char *v16;
  char v18;

  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines);
  swift_beginAccess();
  v3 = *v2;
  if (!((unint64_t)*v2 >> 62))
  {
    v4 = *(char **)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  v4 = (char *)sub_2216539F0();
  if (!v4)
    goto LABEL_10;
LABEL_3:
  if ((v3 & 0xC000000000000001) != 0)
  {
    v5 = (char *)MEMORY[0x22766ED44](0, v3);
  }
  else
  {
    if (!*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_14:
      swift_bridgeObjectRetain();
      v8 = sub_2216539F0();
      result = (char *)swift_bridgeObjectRelease();
      if (v8 < 2)
        goto LABEL_8;
      goto LABEL_15;
    }
    v5 = (char *)*(id *)(v3 + 32);
  }
  v4 = v5;
  swift_bridgeObjectRelease();
  v1 = &v4[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends];
  result = (char *)swift_beginAccess();
  if (*(_QWORD *)v1 >> 62)
    goto LABEL_14;
  if (*(uint64_t *)((*(_QWORD *)v1 & 0xFFFFFFFFFFFFF8) + 0x10) < 2)
  {
LABEL_8:

    return 0;
  }
LABEL_15:
  v9 = *(_QWORD *)v1;
  if ((*(_QWORD *)v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v10 = (char *)MEMORY[0x22766ED44](0, v9);
    result = (char *)swift_bridgeObjectRelease();
    v9 = *(_QWORD *)v1;
    if ((*(_QWORD *)v1 & 0xC000000000000001) == 0)
      goto LABEL_18;
LABEL_36:
    swift_bridgeObjectRetain();
    v7 = (char *)MEMORY[0x22766ED44](1, v9);
    swift_bridgeObjectRelease();
LABEL_20:
    v11 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject_id);
    swift_beginAccess();
    v12 = *v11;
    v13 = v11[1];
    v14 = &v10[OBJC_IVAR____TtC17MeasureFoundation13MeasureObject_id];
    swift_beginAccess();
    v15 = *(_QWORD *)v14 == v12 && *((_QWORD *)v14 + 1) == v13;
    if (v15 || (sub_221653B04() & 1) != 0)
    {

      return v7;
    }
    v16 = &v7[OBJC_IVAR____TtC17MeasureFoundation13MeasureObject_id];
    swift_beginAccess();
    if (*(_QWORD *)v16 == v12 && *((_QWORD *)v16 + 1) == v13)
    {

    }
    else
    {
      v18 = sub_221653B04();

      if ((v18 & 1) == 0)
      {

        return 0;
      }
    }
    return v10;
  }
  if (!*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_38;
  }
  result = (char *)*(id *)(v9 + 32);
  v10 = result;
  if ((v9 & 0xC000000000000001) != 0)
    goto LABEL_36;
LABEL_18:
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
  {
    v7 = (char *)*(id *)(v9 + 40);
    goto LABEL_20;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t property wrapper backing initializer of WorldPoint.anchor(uint64_t a1)
{
  uint64_t v2;
  _DWORD *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DE640);
  v2 = swift_allocObject();
  swift_retain();
  v3 = (_DWORD *)swift_slowAlloc();
  *v3 = 0;
  swift_release();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return v2;
}

uint64_t WorldPoint.anchor.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  uint64_t v4;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor);
  swift_beginAccess();
  v2 = *v1;
  v3 = *(os_unfair_lock_s **)(v2 + 24);
  swift_retain();
  os_unfair_lock_lock(v3);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 + 16);
  swift_retain();
  os_unfair_lock_unlock(v3);
  swift_release();
  return v4;
}

uint64_t WorldPoint.anchor.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  os_unfair_lock_s *v5;

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor);
  swift_beginAccess();
  v4 = *v3;
  v5 = *(os_unfair_lock_s **)(v4 + 24);
  swift_retain();
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  *(_QWORD *)(v4 + 16) = a1;
  swift_retain();
  swift_release();
  os_unfair_lock_unlock(v5);
  swift_release();
  swift_release();
  sub_221643C94();
  return swift_release();
}

void (*WorldPoint.anchor.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  uint64_t v8;

  v3 = malloc(0x78uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor;
  v3[13] = v1;
  v3[14] = v4;
  v5 = (uint64_t *)(v1 + v4);
  swift_beginAccess();
  v6 = *v5;
  v7 = *(os_unfair_lock_s **)(v6 + 24);
  swift_retain();
  os_unfair_lock_lock(v7);
  swift_beginAccess();
  v8 = *(_QWORD *)(v6 + 16);
  swift_retain();
  os_unfair_lock_unlock(v7);
  swift_release();
  v3[12] = v8;
  return sub_221642F88;
}

void sub_221642F88(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;

  v2 = *(void **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 96);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 104) + *(_QWORD *)(*(_QWORD *)a1 + 112));
  v5 = *(os_unfair_lock_s **)(v4 + 24);
  if ((a2 & 1) != 0)
  {
    swift_retain_n();
    swift_retain();
    os_unfair_lock_lock(v5);
    swift_beginAccess();
    *(_QWORD *)(v4 + 16) = v3;
    swift_retain();
    swift_release();
    os_unfair_lock_unlock(v5);
    swift_release();
    swift_release();
    sub_221643C94();
    swift_release();
  }
  else
  {
    swift_retain();
    swift_retain();
    os_unfair_lock_lock(v5);
    swift_beginAccess();
    *(_QWORD *)(v4 + 16) = v3;
    swift_retain();
    swift_release();
    os_unfair_lock_unlock(v5);
    swift_release();
    swift_release();
    sub_221643C94();
  }
  swift_release();
  free(v2);
}

uint64_t WorldPoint.triangulationAnchor.getter()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t WorldPoint.triangulationAnchor.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_triangulationAnchor);
  swift_beginAccess();
  *v3 = a1;
  return swift_release();
}

uint64_t (*WorldPoint.triangulationAnchor.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t property wrapper backing initializer of WorldPoint.type(uint64_t a1)
{
  uint64_t v2;
  _DWORD *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DE650);
  v2 = swift_allocObject();
  v3 = (_DWORD *)swift_slowAlloc();
  *v3 = 0;
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v3;
  return v2;
}

uint64_t WorldPoint.type.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  uint64_t v4;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__type);
  swift_beginAccess();
  v2 = *v1;
  v3 = *(os_unfair_lock_s **)(v2 + 24);
  swift_retain();
  os_unfair_lock_lock(v3);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 + 16);
  os_unfair_lock_unlock(v3);
  swift_release();
  return v4;
}

uint64_t WorldPoint.type.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  os_unfair_lock_s *v10;
  uint64_t v11;
  uint64_t result;
  _QWORD *v13;
  uint64_t v14;
  uint64_t ObjectType;
  void (*v16)(uint64_t, uint64_t, uint64_t);

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__type);
  swift_beginAccess();
  v4 = *v3;
  v5 = *(os_unfair_lock_s **)(*v3 + 24);
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  v6 = *(_QWORD *)(v4 + 16);
  os_unfair_lock_unlock(v5);
  swift_release();
  v7 = *v3;
  v8 = *(os_unfair_lock_s **)(*v3 + 24);
  swift_retain();
  os_unfair_lock_lock(v8);
  swift_beginAccess();
  *(_QWORD *)(v7 + 16) = a1;
  os_unfair_lock_unlock(v8);
  swift_release();
  v9 = *v3;
  v10 = *(os_unfair_lock_s **)(v9 + 24);
  swift_retain();
  os_unfair_lock_lock(v10);
  swift_beginAccess();
  v11 = *(_QWORD *)(v9 + 16);
  os_unfair_lock_unlock(v10);
  result = swift_release();
  if (v6 != v11)
  {
    v13 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_delegate);
    result = swift_beginAccess();
    if (*v13)
    {
      v14 = v13[1];
      ObjectType = swift_getObjectType();
      v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 8);
      swift_unknownObjectRetain();
      v16(v1, ObjectType, v14);
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

void (*WorldPoint.type.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  uint64_t v7;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[7] = v1;
  v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__type);
  swift_beginAccess();
  v5 = *v4;
  v6 = *(os_unfair_lock_s **)(v5 + 24);
  swift_retain();
  os_unfair_lock_lock(v6);
  swift_beginAccess();
  v7 = *(_QWORD *)(v5 + 16);
  os_unfair_lock_unlock(v6);
  swift_release();
  v3[6] = v7;
  return sub_22164357C;
}

void sub_22164357C(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  WorldPoint.type.setter(*(_QWORD *)(*(_QWORD *)a1 + 48));
  free(v1);
}

uint64_t WorldPoint.state.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state);
  v2 = *(os_unfair_lock_s **)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v2);
  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 16);
  os_unfair_lock_unlock(v2);
  swift_release();
  return v3;
}

uint64_t WorldPoint.state.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  os_unfair_lock_s *v10;
  uint64_t v11;
  uint64_t result;
  _QWORD *v13;
  uint64_t v14;
  uint64_t ObjectType;
  void (*v16)(uint64_t, uint64_t, uint64_t);

  v3 = OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state;
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state);
  v5 = *(os_unfair_lock_s **)(v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  v6 = *(_QWORD *)(v4 + 16);
  os_unfair_lock_unlock(v5);
  swift_release();
  v7 = *(_QWORD *)(v1 + v3);
  v8 = *(os_unfair_lock_s **)(v7 + 24);
  swift_retain();
  os_unfair_lock_lock(v8);
  swift_beginAccess();
  *(_QWORD *)(v7 + 16) = a1;
  os_unfair_lock_unlock(v8);
  swift_release();
  v9 = *(_QWORD *)(v1 + v3);
  v10 = *(os_unfair_lock_s **)(v9 + 24);
  swift_retain();
  os_unfair_lock_lock(v10);
  swift_beginAccess();
  v11 = *(_QWORD *)(v9 + 16);
  os_unfair_lock_unlock(v10);
  result = swift_release();
  if (v6 != v11)
  {
    v13 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_delegate);
    result = swift_beginAccess();
    if (*v13)
    {
      v14 = v13[1];
      ObjectType = swift_getObjectType();
      v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 8);
      swift_unknownObjectRetain();
      v16(v1, ObjectType, v14);
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

void (*WorldPoint.state.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state);
  v5 = *(os_unfair_lock_s **)(v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  v6 = *(_QWORD *)(v4 + 16);
  os_unfair_lock_unlock(v5);
  swift_release();
  v3[3] = v6;
  return sub_2216438CC;
}

void sub_2216438CC(uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  WorldPoint.state.setter(*(_QWORD *)(*(_QWORD *)a1 + 24));
  free(v1);
}

id WorldPoint.init(anchor:type:state:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  char *v11;
  _DWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  _DWORD *v15;
  id v16;
  objc_super v18;

  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_snapLine] = 0;
  v7 = &v3[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_partOfRectangleId];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v8 = &v3[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_delegate];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_triangulationAnchor] = 0;
  v9 = (uint64_t *)&v3[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DE640);
  v10 = swift_allocObject();
  v11 = v3;
  swift_retain();
  v12 = (_DWORD *)swift_slowAlloc();
  *v12 = 0;
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = v12;
  *v9 = v10;
  swift_endAccess();
  v13 = (uint64_t *)&v11[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__type];
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DE650);
  v14 = swift_allocObject();
  v15 = (_DWORD *)swift_slowAlloc();
  *v15 = 0;
  *(_QWORD *)(v14 + 16) = a2;
  *(_QWORD *)(v14 + 24) = v15;
  *v13 = v14;
  swift_endAccess();

  v18.receiver = v11;
  v18.super_class = (Class)type metadata accessor for WorldPoint();
  v16 = objc_msgSendSuper2(&v18, sel_init);
  WorldPoint.state.setter(a3);
  sub_221643C94();

  swift_release();
  return v16;
}

uint64_t WorldPoint.addLine(_:)(void *a1)
{
  uint64_t v1;
  _QWORD *v3;
  id v4;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines);
  swift_beginAccess();
  v4 = a1;
  MEMORY[0x22766E798]();
  if (*(_QWORD *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_22165336C();
  sub_2216533A8();
  sub_22165333C();
  return swift_endAccess();
}

void WorldPoint.addParentLine(_:)(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;

  v3 = (void **)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

}

void WorldPoint.removeLine(_:)(void *a1)
{
  id v2;
  unint64_t v3;
  unint64_t v4;
  char v5;
  char v6;
  void *v7;

  swift_beginAccess();
  v2 = a1;
  v3 = swift_bridgeObjectRetain();
  v4 = sub_22163D734(v3, (uint64_t)v2);
  v6 = v5;
  swift_bridgeObjectRelease();

  if ((v6 & 1) == 0)
  {
    swift_beginAccess();
    v7 = (void *)sub_2215C0A50(v4);
    swift_endAccess();

  }
}

Swift::Void __swiftcall WorldPoint.removeParentLine()()
{
  uint64_t v0;
  void **v1;
  void *v2;

  v1 = (void **)(v0 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine);
  swift_beginAccess();
  v2 = *v1;
  *v1 = 0;

}

uint64_t sub_221643C94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t ObjectType;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t *v13;
  uint64_t result;
  uint64_t v15;
  os_unfair_lock_s *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;

  v1 = v0;
  v2 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor);
  swift_beginAccess();
  v3 = *v2;
  v4 = *(os_unfair_lock_s **)(*v2 + 24);
  swift_retain();
  os_unfair_lock_lock(v4);
  swift_beginAccess();
  v5 = *(_QWORD *)(v3 + 16);
  swift_retain();
  os_unfair_lock_unlock(v4);
  swift_release();
  v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v7 = (uint64_t *)(v5 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)sub_221645574;
  v7[1] = v6;
  sub_2215EE3DC(v8);
  swift_release();
  v9 = (_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_delegate);
  swift_beginAccess();
  if (*v9)
  {
    v10 = v9[1];
    ObjectType = swift_getObjectType();
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 8);
    swift_unknownObjectRetain();
    v12(v1, ObjectType, v10);
    swift_unknownObjectRelease();
  }
  v13 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_triangulationAnchor);
  result = swift_beginAccess();
  if (!*v13)
  {
    v15 = *v2;
    v16 = *(os_unfair_lock_s **)(v15 + 24);
    swift_retain();
    os_unfair_lock_lock(v16);
    swift_beginAccess();
    v17 = *(_QWORD *)(v15 + 16);
    swift_retain();
    os_unfair_lock_unlock(v16);
    swift_release();
    v18 = sub_2216387B8(v17, 1u);
    swift_release();
    *v13 = v18;
    result = swift_release();
    if (*v13)
    {
      v19 = (uint64_t *)(*v13 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_updateHandler);
      swift_beginAccess();
      v20 = *v19;
      *v19 = 0;
      v19[1] = 0;
      return sub_2215EE3DC(v20);
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

void sub_221643EC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t ObjectType;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x22766FB84](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (uint64_t *)(v2 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_delegate);
    swift_beginAccess();
    v5 = *v4;
    v6 = v4[1];
    swift_unknownObjectRetain();

    if (v5)
    {
      swift_beginAccess();
      v7 = MEMORY[0x22766FB84](v1);
      if (v7)
      {
        v8 = (void *)v7;
        ObjectType = swift_getObjectType();
        (*(void (**)(void *, uint64_t, uint64_t))(v6 + 8))(v8, ObjectType, v6);

        swift_unknownObjectRelease();
      }
      else
      {
        __break(1u);
      }
    }
  }
}

Swift::Void __swiftcall WorldPoint.markAsPartOfRectangle(withId:)(Swift::String withId)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t *v4;

  object = withId._object;
  countAndFlagsBits = withId._countAndFlagsBits;
  v4 = (uint64_t *)(v1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_partOfRectangleId);
  swift_beginAccess();
  *v4 = countAndFlagsBits;
  v4[1] = (uint64_t)object;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
}

id WorldPoint.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void WorldPoint.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_221644074()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

id WorldPoint.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorldPoint();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2216441D0(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_22164420C + 4 * byte_22165A229[a1]))(0x6D726F4E77656976, 0xEA00000000006C61);
}

uint64_t sub_22164420C()
{
  return 0x7473694477656976;
}

uint64_t sub_22164422C()
{
  return 0x6C6562616CLL;
}

uint64_t sub_221644240()
{
  return 0x707954656E616C70;
}

uint64_t sub_22164425C()
{
  return 0x726F4E656E616C70;
}

unint64_t sub_22164427C()
{
  return 0xD000000000000017;
}

uint64_t sub_221644298()
{
  return 0x6E656469666E6F63;
}

uint64_t sub_2216442B4()
{
  return 0x6E6F43656E616C70;
}

uint64_t sub_2216442D8()
{
  unsigned __int8 *v0;

  return sub_2216441D0(*v0);
}

uint64_t sub_2216442E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2216451A4(a1, a2);
  *a3 = result;
  return result;
}

void sub_221644304(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_221644310()
{
  sub_221644C10();
  return sub_221653BF4();
}

uint64_t sub_221644338()
{
  sub_221644C10();
  return sub_221653C00();
}

uint64_t WorldPoint.ResultRepresentation.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  char v10;
  uint64_t v12;
  char v13;
  _BYTE v14[32];
  _BYTE v15[32];
  _BYTE v16[30];
  char v17;
  char v18;
  _BYTE v19[32];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2556DE660);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_221644C10();
  sub_221653BE8();
  sub_2215C6540(v3, (uint64_t)v19, &qword_2556DE670);
  sub_2215C6540((uint64_t)v19, (uint64_t)v14, &qword_2556DE670);
  v13 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DBBC8);
  sub_221644C54();
  sub_221653A68();
  if (!v2)
  {
    v9 = *(_BYTE *)(v3 + 24);
    v14[0] = 1;
    v13 = v9;
    sub_221653A5C();
    sub_2215C6540(v3 + 25, (uint64_t)&v18, &qword_2556DE678);
    sub_2215C6540((uint64_t)&v18, (uint64_t)v14, &qword_2556DE678);
    v13 = 2;
    sub_221644CA0();
    sub_221653A68();
    sub_2215C6540(v3 + 26, (uint64_t)&v17, &qword_2556DE688);
    sub_2215C6540((uint64_t)&v17, (uint64_t)v14, &qword_2556DE688);
    v13 = 3;
    sub_221644CE4();
    sub_221653A68();
    sub_2215C6540(v3 + 32, (uint64_t)v16, &qword_2556DE670);
    sub_2215C6540((uint64_t)v16, (uint64_t)v14, &qword_2556DE670);
    v13 = 4;
    sub_221653A68();
    sub_2215C6540(v3 + 64, (uint64_t)v15, &qword_2556DE670);
    sub_2215C6540((uint64_t)v15, (uint64_t)v14, &qword_2556DE670);
    v13 = 5;
    sub_221653A68();
    v14[0] = 6;
    sub_221653A8C();
    v10 = *(_BYTE *)(v3 + 92);
    v14[0] = 7;
    v13 = v10;
    sub_221653A5C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_22164469C(_QWORD *a1)
{
  return WorldPoint.ResultRepresentation.encode(to:)(a1);
}

double sub_2216446E4@<D0>(uint64_t a1@<X8>)
{
  id *v1;
  __n128 v3;
  double result;
  __n128 v5;
  __n128 v6[4];
  _OWORD v7[2];

  sub_221644738((char *)*v1, v6);
  v3 = v6[3];
  *(__n128 *)(a1 + 32) = v6[2];
  *(__n128 *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v7[0];
  *(_OWORD *)(a1 + 77) = *(_OWORD *)((char *)v7 + 13);
  result = v6[0].n128_f64[0];
  v5 = v6[1];
  *(__n128 *)a1 = v6[0];
  *(__n128 *)(a1 + 16) = v5;
  return result;
}

__n128 sub_221644738@<Q0>(char *a1@<X0>, __n128 *a2@<X8>)
{
  char *v4;
  os_unfair_lock_s *v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  os_unfair_lock_s *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  os_unfair_lock_s *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_unfair_lock_s *v19;
  id v20;
  char v21;
  uint64_t v22;
  os_unfair_lock_s *v23;
  id v24;
  __n128 v25;
  __n128 v26;
  char *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  char v33;
  uint64_t v34;
  os_unfair_lock_s *v35;
  uint64_t v36;
  unsigned __int32 *v37;
  unsigned __int32 v38;
  unsigned __int32 v39;
  unsigned __int32 v40;
  __n128 result;
  char v42;
  unint64_t v43;
  char v44;
  unint64_t v45;
  unint64_t v46;
  __n128 v47;
  __n128 v48;

  v4 = &a1[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
  swift_beginAccess();
  v5 = *(os_unfair_lock_s **)(*(_QWORD *)v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_unlock(v5);
  swift_release();
  v6 = WorldAnchor.viewDirection.getter();
  v45 = v7;
  v46 = v6;
  v44 = v8;
  swift_release();
  v9 = *(os_unfair_lock_s **)(*(_QWORD *)v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v9);
  swift_beginAccess();
  swift_retain();
  os_unfair_lock_unlock(v9);
  swift_release();
  v43 = WorldAnchor.distanceToViewAnchor.getter();
  swift_release();
  v10 = *(_QWORD *)v4;
  v11 = *(os_unfair_lock_s **)(*(_QWORD *)v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v11);
  swift_beginAccess();
  v12 = *(_QWORD *)(v10 + 16);
  swift_retain();
  os_unfair_lock_unlock(v11);
  swift_release();
  v13 = (uint64_t *)(v12 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane);
  swift_beginAccess();
  v14 = *v13;
  v15 = *(os_unfair_lock_s **)(v14 + 24);
  swift_retain();
  os_unfair_lock_lock(v15);
  swift_beginAccess();
  v16 = *(_QWORD *)(v14 + 16);
  swift_retain();
  os_unfair_lock_unlock(v15);
  swift_release();
  swift_release();
  if (v16)
  {
    v17 = qword_2556D8EB0;
    swift_retain();
    if (v17 != -1)
      swift_once();
    swift_beginAccess();
    v18 = *(_QWORD *)(v16 + 16);
    v19 = *(os_unfair_lock_s **)(v18 + 24);
    swift_retain();
    os_unfair_lock_lock(v19);
    swift_beginAccess();
    v20 = *(id *)(v18 + 16);
    os_unfair_lock_unlock(v19);
    swift_release();
    v42 = sub_221615B38(v20);
    swift_release();

    v21 = *(_BYTE *)(v16 + 48);
    swift_beginAccess();
    v22 = *(_QWORD *)(v16 + 16);
    v23 = *(os_unfair_lock_s **)(v22 + 24);
    swift_retain();
    swift_retain();
    os_unfair_lock_lock(v23);
    swift_beginAccess();
    v24 = *(id *)(v22 + 16);
    os_unfair_lock_unlock(v23);
    swift_release();
    swift_release();
    objc_msgSend(v24, sel_transform);
    v47 = v25;

    v26 = v47;
    v26.n128_u32[3] = 0;
    v48 = v26;
  }
  else
  {
    v48 = 0u;
    v42 = 33;
    v21 = 7;
  }
  v27 = &a1[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_triangulationAnchor];
  swift_beginAccess();
  if (*(_QWORD *)v27)
  {
    swift_retain();
    v28 = WorldAnchor.viewDirection.getter();
    v30 = v29;
    v32 = v31;
    swift_release();
    v33 = v32 & 1;
  }
  else
  {
    v28 = 0;
    v30 = 0;
    v33 = 1;
  }
  v34 = *(_QWORD *)v4;
  v35 = *(os_unfair_lock_s **)(*(_QWORD *)v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v35);
  swift_beginAccess();
  v36 = *(_QWORD *)(v34 + 16);
  swift_retain();
  os_unfair_lock_unlock(v35);
  swift_release();
  v37 = (unsigned __int32 *)(v36 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_confidence);
  swift_beginAccess();
  v38 = *v37;
  swift_release();
  if (v16)
  {
    swift_retain();
    WorldPlane.confidence.getter();
    v40 = v39;
    swift_release_n();

  }
  else
  {

    v40 = 0;
  }
  a2->n128_u64[0] = v46;
  a2->n128_u64[1] = v45;
  a2[1].n128_u8[0] = v44 & 1;
  a2[1].n128_u32[1] = v43;
  a2[1].n128_u8[8] = BYTE4(v43) & 1;
  a2[1].n128_u8[9] = v42;
  a2[1].n128_u8[10] = v21;
  result = v48;
  a2[2] = v48;
  a2[3].n128_u8[0] = v16 == 0;
  a2[4].n128_u64[0] = v28;
  a2[4].n128_u64[1] = v30;
  a2[5].n128_u8[0] = v33;
  a2[5].n128_u32[1] = v38;
  a2[5].n128_u32[2] = v40;
  a2[5].n128_u8[12] = v16 == 0;
  return result;
}

unint64_t sub_221644BE0(unint64_t result)
{
  if (result > 8)
    return 0;
  return result;
}

uint64_t type metadata accessor for WorldPoint()
{
  return objc_opt_self();
}

unint64_t sub_221644C10()
{
  unint64_t result;

  result = qword_2556DE668;
  if (!qword_2556DE668)
  {
    result = MEMORY[0x22766FA4C](&unk_22165A448, &type metadata for WorldPoint.ResultRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2556DE668);
  }
  return result;
}

unint64_t sub_221644C54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2556DDED0;
  if (!qword_2556DDED0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2556DBBC8);
    result = MEMORY[0x22766FA4C](MEMORY[0x24BEE4108], v1);
    atomic_store(result, (unint64_t *)&qword_2556DDED0);
  }
  return result;
}

unint64_t sub_221644CA0()
{
  unint64_t result;

  result = qword_2556DE680;
  if (!qword_2556DE680)
  {
    result = MEMORY[0x22766FA4C](&protocol conformance descriptor for SegmentationResult.Label, &type metadata for SegmentationResult.Label);
    atomic_store(result, (unint64_t *)&qword_2556DE680);
  }
  return result;
}

unint64_t sub_221644CE4()
{
  unint64_t result;

  result = qword_2556DE690;
  if (!qword_2556DE690)
  {
    result = MEMORY[0x22766FA4C](&protocol conformance descriptor for WorldPlaneType, &type metadata for WorldPlaneType);
    atomic_store(result, (unint64_t *)&qword_2556DE690);
  }
  return result;
}

unint64_t sub_221644D2C()
{
  unint64_t result;

  result = qword_2556DE698;
  if (!qword_2556DE698)
  {
    result = MEMORY[0x22766FA4C](&protocol conformance descriptor for WorldPointType, &type metadata for WorldPointType);
    atomic_store(result, (unint64_t *)&qword_2556DE698);
  }
  return result;
}

uint64_t sub_221644D74@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_lines);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

id sub_221644DCC@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_parentLine);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_221644E20@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC17MeasureFoundation10WorldPoint_partOfRectangleId);
  swift_beginAccess();
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for WorldPointType()
{
  return &type metadata for WorldPointType;
}

__n128 __swift_memcpy93_16(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 77) = *(_OWORD *)(a2 + 77);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for WorldPoint.ResultRepresentation(uint64_t a1, unsigned int a2)
{
  int v3;
  int v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xF9 && *(_BYTE *)(a1 + 93))
    return (*(_DWORD *)a1 + 249);
  if (*(unsigned __int8 *)(a1 + 26) <= 7u)
    v3 = 7;
  else
    v3 = *(unsigned __int8 *)(a1 + 26);
  v4 = v3 - 8;
  if (*(unsigned __int8 *)(a1 + 26) < 7u)
    v5 = -1;
  else
    v5 = v4;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for WorldPoint.ResultRepresentation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF8)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 92) = 0;
    *(_DWORD *)(result + 88) = 0;
    *(_QWORD *)result = a2 - 249;
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 93) = 1;
  }
  else
  {
    if (a3 >= 0xF9)
      *(_BYTE *)(result + 93) = 0;
    if (a2)
      *(_BYTE *)(result + 26) = a2 + 7;
  }
  return result;
}

ValueMetadata *type metadata accessor for WorldPoint.ResultRepresentation()
{
  return &type metadata for WorldPoint.ResultRepresentation;
}

uint64_t getEnumTagSinglePayload for WorldPoint.ResultRepresentation.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for WorldPoint.ResultRepresentation.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_22164504C + 4 * byte_22165A236[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_221645080 + 4 * byte_22165A231[v4]))();
}

uint64_t sub_221645080(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_221645088(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x221645090);
  return result;
}

uint64_t sub_22164509C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2216450A4);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_2216450A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2216450B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WorldPoint.ResultRepresentation.CodingKeys()
{
  return &type metadata for WorldPoint.ResultRepresentation.CodingKeys;
}

unint64_t sub_2216450D0()
{
  unint64_t result;

  result = qword_2556DE6E8;
  if (!qword_2556DE6E8)
  {
    result = MEMORY[0x22766FA4C](&unk_22165A420, &type metadata for WorldPoint.ResultRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2556DE6E8);
  }
  return result;
}

unint64_t sub_221645118()
{
  unint64_t result;

  result = qword_2556DE6F0;
  if (!qword_2556DE6F0)
  {
    result = MEMORY[0x22766FA4C](&unk_22165A390, &type metadata for WorldPoint.ResultRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2556DE6F0);
  }
  return result;
}

unint64_t sub_221645160()
{
  unint64_t result;

  result = qword_2556DE6F8;
  if (!qword_2556DE6F8)
  {
    result = MEMORY[0x22766FA4C](&unk_22165A3B8, &type metadata for WorldPoint.ResultRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2556DE6F8);
  }
  return result;
}

uint64_t sub_2216451A4(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0x6D726F4E77656976 && a2 == 0xEA00000000006C61 || (sub_221653B04() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7473694477656976 && a2 == 0xEC00000065636E61 || (sub_221653B04() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C6562616CLL && a2 == 0xE500000000000000 || (sub_221653B04() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x707954656E616C70 && a2 == 0xE900000000000065 || (sub_221653B04() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x726F4E656E616C70 && a2 == 0xEB000000006C616DLL || (sub_221653B04() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x8000000221661560 || (sub_221653B04() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6E656469666E6F63 && a2 == 0xEA00000000006563 || (sub_221653B04() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6E6F43656E616C70 && a2 == 0xEF65636E65646966)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    v5 = sub_221653B04();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 7;
    else
      return 8;
  }
}

uint64_t sub_221645550()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_221645574()
{
  uint64_t v0;

  sub_221643EC0(v0);
}

uint64_t MeasurementEvent.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_221652FD0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t MeasurementEvent.time.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 36);
  v5 = sub_221652F94();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t MeasurementEvent.name.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 40));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t MeasurementEvent.results.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MeasurementEvent.init(name:results:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  char *AssociatedTypeWitness;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  _QWORD v21[6];

  _s17MeasureFoundation11WorldAnchorC10identifier0B04UUIDVvpfi_0();
  v13 = type metadata accessor for MeasurementEvent(0, a4, a5, v12);
  _s17MeasureFoundation16MeasurementEventV4time0B04DateVvpfi_0();
  v14 = (_QWORD *)(a6 + *(int *)(v13 + 40));
  *v14 = a1;
  v14[1] = a2;
  v21[5] = a3;
  v21[2] = a4;
  v21[3] = a5;
  v15 = sub_2216533FC();
  AssociatedTypeWitness = (char *)swift_getAssociatedTypeWitness();
  v17 = MEMORY[0x22766FA4C](MEMORY[0x24BEE12E0], v15);
  v19 = sub_22160A848((void (*)(char *, char *))sub_221645754, (uint64_t)v21, v15, AssociatedTypeWitness, MEMORY[0x24BEE4078], v17, MEMORY[0x24BEE40A8], v18);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(a6 + *(int *)(v13 + 44)) = v19;
  return result;
}

uint64_t type metadata accessor for MeasurementEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MeasurementEvent);
}

uint64_t sub_221645754()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 24) + 24))(*(_QWORD *)(v0 + 16));
}

BOOL sub_221645788(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_221645798()
{
  return sub_221653B94();
}

uint64_t sub_2216457BC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_221653B04() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701669236 && a2 == 0xE400000000000000 || (sub_221653B04() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000 || (sub_221653B04() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x73746C75736572 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_221653B04();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_221645938(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_221645960 + 4 * byte_22165A4A0[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_221645960()
{
  return 1701669236;
}

uint64_t sub_221645974()
{
  return 1701667182;
}

uint64_t sub_221645984()
{
  return 0x73746C75736572;
}

BOOL sub_22164599C(char *a1, char *a2)
{
  return sub_221645788(*a1, *a2);
}

uint64_t sub_2216459B0()
{
  return _s17MeasureFoundation8EdgeTypeO9hashValueSivg_0();
}

uint64_t sub_2216459BC()
{
  return sub_221645798();
}

uint64_t sub_2216459C8()
{
  sub_221653B88();
  sub_221645798();
  return sub_221653BAC();
}

uint64_t sub_221645A0C()
{
  unsigned __int8 *v0;

  return sub_221645938(*v0);
}

uint64_t sub_221645A18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2216457BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_221645A44@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2216464BC();
  *a1 = result;
  return result;
}

uint64_t sub_221645A6C(uint64_t a1)
{
  MEMORY[0x22766FA4C](&unk_22165A5F8, a1);
  return sub_221653BF4();
}

uint64_t sub_221645AA0(uint64_t a1)
{
  MEMORY[0x22766FA4C](&unk_22165A5F8, a1);
  return sub_221653C00();
}

uint64_t MeasurementEvent.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16[2];
  uint64_t v17;
  uint64_t v18;
  uint64_t AssociatedConformanceWitness;
  char v20;
  uint64_t v21;

  v17 = a2;
  v5 = v4;
  v7 = *(_QWORD *)(a2 + 16);
  v16[0] = *(_QWORD *)(a2 + 24);
  v16[1] = v7;
  v8 = type metadata accessor for MeasurementEvent.CodingKeys(255, v7, v16[0], a4);
  MEMORY[0x22766FA4C](&unk_22165A5F8, v8);
  v9 = sub_221653AA4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v16 - v11;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_221653BE8();
  LOBYTE(v21) = 0;
  sub_221652FD0();
  sub_2215BB99C(&qword_2556DE700, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  v13 = v18;
  sub_221653A98();
  if (!v13)
  {
    LOBYTE(v21) = 1;
    sub_221652F94();
    sub_2215BB99C(qword_2556DE708, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_221653A98();
    LOBYTE(v21) = 2;
    sub_221653A74();
    v21 = *(_QWORD *)(v5 + *(int *)(v17 + 44));
    v20 = 3;
    swift_getAssociatedTypeWitness();
    v14 = sub_2216533FC();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    MEMORY[0x22766FA4C](MEMORY[0x24BEE12A0], v14, &AssociatedConformanceWitness);
    sub_221653A98();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t type metadata accessor for MeasurementEvent.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MeasurementEvent.CodingKeys);
}

uint64_t sub_221645D90(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MeasurementEvent.encode(to:)(a1, a2, a3, a4);
}

uint64_t sub_221645DA4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_221652FD0();
  if (v1 <= 0x3F)
  {
    result = sub_221652F94();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_221645E40(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_221652FD0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[9];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_221652F94();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[10];
    v13 = a3[11];
    v14 = (uint64_t *)((char *)a1 + v12);
    v15 = (uint64_t *)((char *)a2 + v12);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    *(uint64_t *)((char *)a1 + v13) = *(uint64_t *)((char *)a2 + v13);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_221645F18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_221652FD0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 36);
  v6 = sub_221652F94();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_221645F98(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  v6 = sub_221652FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[9];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_221652F94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[10];
  v12 = a3[11];
  v13 = (_QWORD *)(a1 + v11);
  v14 = (_QWORD *)(a2 + v11);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_221646044(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  v6 = sub_221652FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[9];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_221652F94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = a3[10];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_221646110(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_221652FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[9];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_221652F94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);
  return a1;
}

uint64_t sub_2216461A8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = sub_221652FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[9];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_221652F94();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[10];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (uint64_t *)(a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22164625C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_221646268(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = sub_221652FD0();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_221652F94();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 36);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 40) + 8);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_221646314()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_221646320(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_221652FD0();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_221652F94();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 36);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 40) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_2216463C8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2216463D0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_22164641C + 4 * byte_22165A4A9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_221646450 + 4 * byte_22165A4A4[v4]))();
}

uint64_t sub_221646450(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_221646458(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x221646460);
  return result;
}

uint64_t sub_22164646C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x221646474);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_221646478(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_221646480(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_22164648C()
{
  JUMPOUT(0x22766FA4CLL);
}

void sub_22164649C()
{
  JUMPOUT(0x22766FA4CLL);
}

void sub_2216464AC()
{
  JUMPOUT(0x22766FA4CLL);
}

uint64_t sub_2216464BC()
{
  return 4;
}

uint64_t sub_2216464C4(int8x16_t *a1, uint64_t a2)
{
  int64_t v3;
  uint64_t result;
  __int32 v6;
  int8x16_t *v7;
  uint64_t v8;
  int8x16_t v9;
  int8x16_t v10;
  unint64_t v11;
  unint64_t v12;
  float32x4_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float32x4_t v18;
  int8x16_t v19;
  int8x16_t v20;
  __int32 v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a1[1].i64[0];
  result = MEMORY[0x24BEE4AF8];
  if (v3)
  {
    v22 = MEMORY[0x24BEE4AF8];
    sub_2215CC080(0, v3, 0);
    result = v22;
    v7 = a1 + 2;
    while ((*(_BYTE *)(a2 + 128) & 1) == 0)
    {
      v8 = *(_QWORD *)(a2 + 112);
      v9.i64[0] = v8;
      v9.i64[1] = *(_QWORD *)(a2 + 120);
      v10 = *v7;
      v23 = result;
      v12 = *(_QWORD *)(result + 16);
      v11 = *(_QWORD *)(result + 24);
      if (v12 >= v11 >> 1)
      {
        v20 = v9;
        v21 = v6;
        v19 = *v7;
        sub_2215CC080((char *)(v11 > 1), v12 + 1, 1);
        v10 = v19;
        v9 = v20;
        v6 = v21;
        result = v23;
      }
      *(float32x2_t *)v13.f32 = vsub_f32((float32x2_t)__PAIR64__(v9.u32[1], v8), *(float32x2_t *)v10.i8);
      v14 = vsub_f32((float32x2_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL), (float32x2_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL));
      v15 = vmul_f32(*(float32x2_t *)v13.f32, *(float32x2_t *)v13.f32);
      *(float32x2_t *)&v13.u32[2] = v14;
      v14.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)vmulq_f32(v13, v13), 2), vadd_f32(v15, (float32x2_t)vdup_lane_s32((int32x2_t)v15, 1))).u32[0];
      v16 = vrsqrte_f32((float32x2_t)v14.u32[0]);
      v17 = vmul_f32(v16, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(v16, v16)));
      v18 = vmulq_n_f32(v13, vmul_f32(v17, vrsqrts_f32((float32x2_t)v14.u32[0], vmul_f32(v17, v17))).f32[0]);
      v18.i32[3] = v6;
      *(_QWORD *)(result + 16) = v12 + 1;
      *(float32x4_t *)(result + 16 * v12 + 32) = v18;
      ++v7;
      if (!--v3)
        return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_221646620(const void *a1)
{
  uint64_t *v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;
  unint64_t v9;
  _BYTE v10[320];

  v3 = *v1;
  v4 = (char *)v1[2];
  v5 = *((_QWORD *)v4 + 2);
  if (v5 >= *v1)
  {
    v9 = v1[1];
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) != 0)
    {
      if ((v9 & 0x8000000000000000) == 0)
        goto LABEL_9;
    }
    else
    {
      result = (uint64_t)sub_22163D720((uint64_t)v4);
      v4 = (char *)result;
      if ((v9 & 0x8000000000000000) == 0)
      {
LABEL_9:
        if (v9 < *((_QWORD *)v4 + 2))
        {
          memcpy(v10, &v4[304 * v9 + 32], 0x130uLL);
          sub_22164A868((uint64_t)a1);
          sub_22164AE48((uint64_t)v10);
          result = (uint64_t)memcpy(&v4[304 * v9 + 32], a1, 0x130uLL);
          v1[2] = (uint64_t)v4;
          if (v3)
          {
            v1[1] = (uint64_t)(v9 + 1) % v3;
            return result;
          }
          goto LABEL_15;
        }
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
        return result;
      }
    }
    __break(1u);
    goto LABEL_14;
  }
  sub_22164A868((uint64_t)a1);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v4 = sub_2215D7B74(0, v5 + 1, 1, v4);
  v7 = *((_QWORD *)v4 + 2);
  v6 = *((_QWORD *)v4 + 3);
  if (v7 >= v6 >> 1)
    v4 = sub_2215D7B74((char *)(v6 > 1), v7 + 1, 1, v4);
  *((_QWORD *)v4 + 2) = v7 + 1;
  result = (uint64_t)memcpy(&v4[304 * v7 + 32], a1, 0x130uLL);
  v1[2] = (uint64_t)v4;
  return result;
}

void *RectangleQualificationParameters.qualityTolerance.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.qualityTolerance;
}

float static RectangleQualificationParameters.qualityTolerance.getter()
{
  return 0.05;
}

void *RectangleQualificationParameters.minimumEdgeLength.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.minimumEdgeLength;
}

float static RectangleQualificationParameters.minimumEdgeLength.getter()
{
  return 0.005;
}

void *RectangleQualificationParameters.maximumEdgeLength.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.maximumEdgeLength;
}

float static RectangleQualificationParameters.maximumEdgeLength.getter()
{
  return 100.0;
}

void *RectangleQualificationParameters.minimumAspectRatio.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.minimumAspectRatio;
}

float static RectangleQualificationParameters.minimumAspectRatio.getter()
{
  return 1.0;
}

void *RectangleQualificationParameters.maximumAspectRatio.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.maximumAspectRatio;
}

float static RectangleQualificationParameters.maximumAspectRatio.getter()
{
  return 100.0;
}

void *RectangleQualificationParameters.minimumArea.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.minimumArea;
}

float static RectangleQualificationParameters.minimumArea.getter()
{
  return 0.0001;
}

void *RectangleQualificationParameters.maximumArea.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.maximumArea;
}

float static RectangleQualificationParameters.maximumArea.getter()
{
  return 100.0;
}

void *RectangleQualificationParameters.squareFactorThreshold.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.squareFactorThreshold;
}

float static RectangleQualificationParameters.squareFactorThreshold.getter()
{
  return 0.9;
}

void *RectangleQualificationParameters.ignoreDistanceAlongNormal.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.ignoreDistanceAlongNormal;
}

uint64_t static RectangleQualificationParameters.ignoreDistanceAlongNormal.getter()
{
  return 1;
}

void *RectangleQualificationParameters.minDistanceThreshold.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.minDistanceThreshold;
}

float static RectangleQualificationParameters.minDistanceThreshold.getter()
{
  return 0.05;
}

void *RectangleQualificationParameters.maxDistanceThresholdCornerPoint.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.maxDistanceThresholdCornerPoint;
}

float static RectangleQualificationParameters.maxDistanceThresholdCornerPoint.getter()
{
  return 0.05;
}

void *RectangleQualificationParameters.minAreaSimilarity.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.minAreaSimilarity;
}

float static RectangleQualificationParameters.minAreaSimilarity.getter()
{
  return 0.7;
}

void *RectangleQualificationParameters.minOrientationSimilarity.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.minOrientationSimilarity;
}

float static RectangleQualificationParameters.minOrientationSimilarity.getter()
{
  return 0.8;
}

void *RectangleQualificationParameters.rectifyRectanglePoints.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.rectifyRectanglePoints;
}

uint64_t static RectangleQualificationParameters.rectifyRectanglePoints.getter()
{
  return 1;
}

void *RectangleQualificationParameters.minAspectRatioSimilarity.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.minAspectRatioSimilarity;
}

float static RectangleQualificationParameters.minAspectRatioSimilarity.getter()
{
  return 0.8;
}

void *RectangleQualificationParameters.captureQualityTolerance.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.captureQualityTolerance;
}

float static RectangleQualificationParameters.captureQualityTolerance.getter()
{
  return 0.05;
}

void *RectangleQualificationParameters.areaIncreaseTolerance.unsafeMutableAddressor()
{
  return &static RectangleQualificationParameters.areaIncreaseTolerance;
}

float static RectangleQualificationParameters.areaIncreaseTolerance.getter()
{
  return 0.1;
}

uint64_t WorldRectangleData.points.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WorldRectangleData.rawPoints.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WorldRectangleData.anchors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WorldRectangleData.baseVectors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WorldRectangleData.forward.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

__n128 WorldRectangleData.orientation.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)(v1 + 64);
  v3 = *(_OWORD *)(v1 + 80);
  v4 = *(_OWORD *)(v1 + 96);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  return result;
}

uint64_t WorldRectangleData.centroid.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 112);
}

unint64_t WorldRectangleData.area.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 132) | ((unint64_t)*(unsigned __int8 *)(v0 + 136) << 32);
}

unint64_t WorldRectangleData.aspectRatio.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 140) | ((unint64_t)*(unsigned __int8 *)(v0 + 144) << 32);
}

uint64_t WorldRectangleData.size.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 148);
}

uint64_t WorldRectangleData.timestamp.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 160);
}

unint64_t WorldRectangleData.cornerQuality.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 172) | ((unint64_t)*(unsigned __int8 *)(v0 + 176) << 32);
}

unint64_t WorldRectangleData.captureQuality.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 180) | ((unint64_t)*(unsigned __int8 *)(v0 + 184) << 32);
}

unint64_t WorldRectangleData.squareFactor.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 188) | ((unint64_t)*(unsigned __int8 *)(v0 + 192) << 32);
}

uint64_t WorldRectangleData.squared.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 193);
}

uint64_t WorldRectangleData.surfaceNormal.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 208);
}

unint64_t WorldRectangleData.boundingRadius.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 228) | ((unint64_t)*(unsigned __int8 *)(v0 + 232) << 32);
}

__n128 WorldRectangleData.screenCoordinates.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v2;
  __n128 result;
  __int128 v4;

  v2 = *(_OWORD *)(v1 + 256);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 240);
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(v1 + 272);
  v4 = *(_OWORD *)(v1 + 288);
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

double WorldRectangleData.cgSize.getter()
{
  uint64_t v0;
  double result;
  _BYTE v2[12];
  float v3;
  char v4;

  sub_2215C6540(v0 + 148, (uint64_t)v2, &qword_2556DE810);
  sub_2215C6540((uint64_t)v2, (uint64_t)&v3, &qword_2556DE810);
  result = v3;
  if (v4)
    return 0.0;
  return result;
}

Swift::OpaquePointer WorldRectangleData.init(_:screenCoordinates:keyFrame:)@<X0>(unint64_t a1@<X0>, float *a2@<X1>, void *a3@<X2>, char *rawValue@<X8>)
{
  float v4;
  float v5;
  float v6;
  uint64_t v10;
  unint64_t v11;
  Swift::OpaquePointer result;
  uint64_t v13;
  __int32 *v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  float32x4_t v18;
  uint64_t v19;
  id v20;
  float32x4_t v21;
  float32x4_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  float32x4_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  __n128 v39;
  __n128 v40;
  float v41;
  char *v42;
  float v43;
  float32x2_t v44;
  float v45;
  float32x2_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  float32x4_t *v51;
  uint64_t v52;
  float32x4_t v53;
  float32x4_t *v54;
  __n128 v55;
  unint64_t v56;
  uint64_t v57;
  os_unfair_lock_s *v58;
  float *v59;
  uint64_t v60;
  _BYTE *v61;
  int isUniquelyReferenced_nonNull_bridgeObject;
  unint64_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  double v68;
  float32x4_t v69;
  double v70;
  __int128 v71;
  __int128 *v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;
  __int128 *v77;
  char *v78;
  char *v79;
  float32x4_t v80;
  id v81;
  __n128 v82;
  __n128 v83;
  __n128 v84;
  float32x4_t v85;
  char v86;
  char v87;
  char v88;
  char v89;
  char v90;
  char v91;
  char v92;
  char v93;
  char v94;
  char v95;
  char v96;
  _OWORD v97[3];
  char v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  char v103;
  float v104;
  char v105;
  float v106;
  char v107;
  uint64_t v108;
  char v109;
  uint64_t v110;
  char v111;
  float v112;
  char v113;
  unsigned __int32 v114;
  char v115;
  float v116;
  char v117;
  BOOL v118;
  float32x4_t v119;
  char v120;
  int v121;
  char v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[304];
  __int128 v128;
  __int128 v129;
  __int128 v130;
  char v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  char v136;
  int v137;
  char v138;
  int v139;
  char v140;
  uint64_t v141;
  char v142;
  uint64_t v143;
  char v144;
  float v145;
  char v146;
  unsigned __int32 v147;
  char v148;
  int v149;
  __int16 v150;
  float32x4_t v151;
  char v152;
  int v153;
  char v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  _BYTE v159[96];

  v81 = a3;
  v10 = sub_221652F94();
  v11 = *(_QWORD *)(v10 - 8);
  result._rawValue = (void *)MEMORY[0x24BDAC7A8](v10);
  v84.n128_u64[0] = (unint64_t)&v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v129 = 0u;
  v130 = 0u;
  v128 = 0u;
  v131 = 1;
  v137 = 0;
  v138 = 1;
  v139 = 0;
  v140 = 1;
  v141 = 0;
  v142 = 1;
  v143 = 0;
  v144 = 1;
  LOBYTE(v150) = 1;
  v14 = (__int32 *)(a1 >> 62);
  v149 = 0;
  if (!(a1 >> 62))
  {
    if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10) == 4)
      goto LABEL_3;
LABEL_92:
    swift_bridgeObjectRelease();

    goto LABEL_93;
  }
LABEL_91:
  swift_bridgeObjectRetain();
  v75 = sub_2216539F0();
  result._rawValue = (void *)swift_bridgeObjectRelease();
  if (v75 != 4)
    goto LABEL_92;
LABEL_3:
  v15 = *((_OWORD *)a2 + 1);
  v155 = *(_OWORD *)a2;
  v156 = v15;
  v16 = *((_OWORD *)a2 + 3);
  v157 = *((_OWORD *)a2 + 2);
  v158 = v16;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v17 = MEMORY[0x22766ED44](0, a1);
  }
  else
  {
    if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_97;
    }
    v17 = swift_retain();
  }
  v85 = *(float32x4_t *)(v17 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 16);
  swift_release();
  v18 = v85;
  v18.i32[3] = 0;
  v151 = v18;
  v152 = 0;
  v19 = MEMORY[0x24BEE4AF8];
  v83.n128_u64[0] = v10;
  v82.n128_u64[0] = v11;
  if (v81)
  {
    v20 = objc_msgSend(v81, sel_camera);
    objc_msgSend(v20, sel_transform);
    v80 = v21;

    v22 = vmulq_f32(v85, v80);
    v147 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1))).u32[0];
  }
  else
  {
    v147 = 1065353216;
  }
  v148 = 0;
  *(_QWORD *)&v129 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v128 = v19;
  if (v14)
  {
    swift_bridgeObjectRetain();
    v23 = sub_2216539F0();
  }
  else
  {
    v23 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v78 = rawValue;
  rawValue = (char *)MEMORY[0x24BEE4AF8];
  if (!v23)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    *((_QWORD *)&v128 + 1) = rawValue;
    swift_bridgeObjectRetain();
    v33 = v84.n128_u64[0];
    _s17MeasureFoundation16MeasurementEventV4time0B04DateVvpfi_0();
    sub_221652F7C();
    v35 = v34;
    result._rawValue = (void *)(*(uint64_t (**)(unint64_t, unint64_t))(v82.n128_u64[0] + 8))(v33, v83.n128_u64[0]);
    v143 = v35;
    v144 = 0;
    a2 = (float *)v128;
    if (!(_QWORD)v128)
    {
LABEL_111:
      __break(1u);
      goto LABEL_112;
    }
    sub_221649E30((float32x4_t *)v128, v36, v37, v38, v39, v40);
    v145 = v41;
    v146 = 0;
    if (v41 > 0.05)
    {
LABEL_27:
      swift_bridgeObjectRelease();

      rawValue = v78;
      goto LABEL_93;
    }
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2556D9610);
    result._rawValue = (void *)swift_allocObject();
    *((_OWORD *)result._rawValue + 1) = xmmword_221655520;
    if (*((_QWORD *)a2 + 2) >= 2uLL)
    {
      rawValue = (char *)result._rawValue;
      v42 = (char *)result._rawValue + 32;
      v43 = a2[14] - a2[10];
      v44 = vsub_f32(*(float32x2_t *)(a2 + 12), *(float32x2_t *)(a2 + 8));
      *((float *)result._rawValue + 8) = sqrtf((float)(v43 * v43) + vaddv_f32(vmul_f32(v44, v44)));
      if (*((_QWORD *)a2 + 2) >= 4uLL)
      {
        v45 = a2[22] - a2[10];
        v46 = vsub_f32(*(float32x2_t *)(a2 + 20), *(float32x2_t *)(a2 + 8));
        *((float *)result._rawValue + 9) = sqrtf((float)(v45 * v45) + vaddv_f32(vmul_f32(v46, v46)));
        *(Swift::tuple_index_Int_value_Float_optional *)&result._rawValue = min(_:)(result);
        if ((v47 & 0x100000000) != 0)
        {
LABEL_112:
          __break(1u);
          goto LABEL_113;
        }
        v48 = (uint64_t)result._rawValue + 1;
        if (!__OFADD__(result._rawValue, 1))
        {
          if (v48 >= 0)
            v49 = v48 & 1;
          else
            v49 = -(v48 & 1);
          if ((unint64_t)result._rawValue <= 1)
          {
            if (*(float *)&v42[4 * (uint64_t)result._rawValue] < 0.005)
            {
              swift_bridgeObjectRelease();

              swift_setDeallocating();
              swift_deallocClassInstance();
              rawValue = v78;
              goto LABEL_93;
            }
            if ((v49 & 0x8000000000000000) == 0)
            {
              v4 = *(float *)&v42[4 * v49];
              swift_setDeallocating();
              result._rawValue = (void *)swift_deallocClassInstance();
              if (v4 > 100.0)
                goto LABEL_27;
              if ((v152 & 1) != 0)
              {
LABEL_113:
                __break(1u);
LABEL_114:
                __break(1u);
                return result;
              }
              v79 = (char *)&v129;
              v77 = &v130;
              v85 = v151;
              v50 = swift_bridgeObjectRetain();
              v51 = (float32x4_t *)sub_221649F50(v50, (int32x4_t)v85);
              swift_bridgeObjectRelease();
              result._rawValue = (void *)swift_bridgeObjectRelease();
              a1 = 0;
              v14 = &v51[2].i32[2];
              v80 = (float32x4_t)xmmword_221656B50;
              while ((_QWORD)v129)
              {
                if ((v129 & 0xC000000000000001) != 0)
                {
                  v52 = MEMORY[0x22766ED44](a1);
                }
                else
                {
                  if (a1 >= *(_QWORD *)((v129 & 0xFFFFFFFFFFFFF8) + 0x10))
                  {
                    __break(1u);
LABEL_86:
                    __break(1u);
LABEL_87:
                    __break(1u);
LABEL_88:
                    __break(1u);
LABEL_89:
                    __break(1u);
LABEL_90:
                    __break(1u);
                    goto LABEL_91;
                  }
                  v52 = swift_retain();
                }
                v53 = *(float32x4_t *)(v52 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform);
                v84 = *(__n128 *)(v52 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 16);
                v85 = v53;
                v83 = *(__n128 *)(v52 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 32);
                swift_release();
                v54 = (float32x4_t *)swift_allocObject();
                v54[1] = v80;
                if (a1 >= v51[1].i64[0])
                  goto LABEL_86;
                rawValue = (char *)v54;
                v54[2].i32[0] = v51[a1 + 2].i32[0];
                v54[2].i32[1] = *(v14 - 1);
                v54[2].i32[2] = *v14;
                v54[2].i32[3] = 1065353216;
                sub_221649DC0((uint64_t)v54);
                v82 = v55;
                swift_setDeallocating();
                result._rawValue = (void *)swift_deallocClassInstance();
                if (!(_QWORD)v129)
                  goto LABEL_107;
                if ((v129 & 0xC000000000000001) != 0)
                {
                  v11 = MEMORY[0x22766ED44](a1);
                }
                else
                {
                  if (a1 >= *(_QWORD *)((v129 & 0xFFFFFFFFFFFFF8) + 0x10))
                    goto LABEL_87;
                  v11 = *(_QWORD *)(v129 + 8 * a1 + 32);
                  swift_retain();
                }
                v56 = v11 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor__plane;
                swift_beginAccess();
                v57 = *(_QWORD *)v56;
                v58 = *(os_unfair_lock_s **)(*(_QWORD *)v56 + 24);
                swift_retain();
                os_unfair_lock_lock(v58);
                swift_beginAccess();
                rawValue = *(char **)(v57 + 16);
                swift_retain();
                os_unfair_lock_unlock(v58);
                swift_release();
                result._rawValue = (void *)swift_release();
                if (!(_QWORD)v129)
                  goto LABEL_108;
                if ((v129 & 0xC000000000000001) != 0)
                {
                  v11 = MEMORY[0x22766ED44](a1);
                }
                else
                {
                  if (a1 >= *(_QWORD *)((v129 & 0xFFFFFFFFFFFFF8) + 0x10))
                    goto LABEL_88;
                  v11 = *(_QWORD *)(v129 + 8 * a1 + 32);
                  swift_retain();
                }
                v59 = (float *)(v11 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_confidence);
                swift_beginAccess();
                v4 = *v59;
                result._rawValue = (void *)swift_release();
                if (!(_QWORD)v129)
                  goto LABEL_109;
                if ((v129 & 0xC000000000000001) != 0)
                {
                  v60 = MEMORY[0x22766ED44](a1);
                }
                else
                {
                  if (a1 >= *(_QWORD *)((v129 & 0xFFFFFFFFFFFFF8) + 0x10))
                    goto LABEL_89;
                  v60 = *(_QWORD *)(v129 + 8 * a1 + 32);
                  swift_retain();
                }
                memset(v159, 0, 64);
                v159[64] = 1;
                v61 = (_BYTE *)(v60 + OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_autoUpdate);
                swift_beginAccess();
                LOBYTE(v61) = *v61;
                swift_release();
                type metadata accessor for WorldAnchor();
                swift_allocObject();
                result._rawValue = (void *)WorldAnchor.init(transform:viewTransform:plane:confidence:shouldAutoUpdate:viewTarget:)((uint64_t)v159, (uint64_t)rawValue, (char)v61, (uint64_t)v159, (__n128)v85, v84, v83, v82, v4);
                v11 = v129;
                if (!(_QWORD)v129)
                  goto LABEL_110;
                rawValue = (char *)result._rawValue;
                isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
                *(_QWORD *)&v129 = v11;
                if (!isUniquelyReferenced_nonNull_bridgeObject || v11 >> 62)
                  sub_22163D6A0(v11);
                if (a1 >= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
                  goto LABEL_90;
                *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 8 * a1 + 0x20) = rawValue;
                swift_release();
                rawValue = v79;
                result._rawValue = (void *)sub_22165333C();
                v14 += 4;
                if (++a1 == 4)
                {
                  result._rawValue = (void *)swift_bridgeObjectRelease();
                  *(_QWORD *)&v128 = v51;
                  v63 = v51[1].u64[0];
                  if (!v63)
                    goto LABEL_102;
                  if (v63 < 3)
                    goto LABEL_103;
                  if (v63 == 3)
                    goto LABEL_104;
                  v64 = vsubq_f32(v51[2], v51[4]);
                  v65 = vmulq_f32(v64, v64);
                  *(_QWORD *)&v68 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v65, 2), vaddq_f32(v65, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v65.f32, 1))).u64[0];
                  v66 = vsubq_f32(v51[3], v51[5]);
                  v67 = vmulq_f32(v66, v66);
                  *(float *)&v68 = sqrtf(*(float *)&v68);
                  v69 = vaddq_f32(v67, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v67.f32, 1));
                  *(_QWORD *)&v70 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v67, 2), v69).u64[0];
                  *(float *)&v70 = sqrtf(*(float *)&v70);
                  if (*(float *)&v68 <= *(float *)&v70)
                    *(float *)&v68 = *(float *)&v70;
                  LODWORD(v70) = 0.5;
                  *(float *)&v68 = *(float *)&v68 * 0.5;
                  v153 = LODWORD(v68);
                  v154 = 0;
                  *(float32x2_t *)&v71 = _ss5SIMD3V17MeasureFoundationSfRszrlE7averageyABySfGSayAEGFZ_0((uint64_t)v51, v68, v70, *(double *)v69.i64);
                  v135 = v71;
                  v136 = 0;
                  v149 = 0;
                  v150 = 0;
                  v137 = 0;
                  v138 = 0;
                  v139 = 1065353216;
                  v140 = 0;
                  swift_bridgeObjectRelease();
                  *((_QWORD *)&v129 + 1) = MEMORY[0x24BEE4AF8];
                  v72 = v77;
                  *(_QWORD *)v77 = 0;
                  *((_QWORD *)v72 + 1) = 0;
                  *((_BYTE *)v72 + 16) = 0;
                  v73 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
                  v74 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 32);
                  v132 = *MEMORY[0x24BDAEDF8];
                  v133 = v73;
                  v134 = v74;
                  result._rawValue = (void *)sub_221647700();
                  if ((v142 & 1) != 0)
                    goto LABEL_114;
                  v5 = *(float *)&v141;
                  rawValue = v78;
                  v27 = v81;
                  if (*(float *)&v141 == 0.0
                    || (v6 = *((float *)&v141 + 1), *((float *)&v141 + 1) == 0.0)
                    || (v4 = *((float *)&v141 + 1) / *(float *)&v141,
                        (float)(*((float *)&v141 + 1) / *(float *)&v141) > 100.0))
                  {

                    goto LABEL_93;
                  }
                  goto LABEL_81;
                }
              }
              goto LABEL_106;
            }
LABEL_101:
            __break(1u);
LABEL_102:
            __break(1u);
LABEL_103:
            __break(1u);
LABEL_104:
            __break(1u);
LABEL_105:
            __break(1u);
LABEL_106:
            __break(1u);
LABEL_107:
            __break(1u);
LABEL_108:
            __break(1u);
LABEL_109:
            __break(1u);
LABEL_110:
            __break(1u);
            goto LABEL_111;
          }
LABEL_100:
          __break(1u);
          goto LABEL_101;
        }
LABEL_99:
        __break(1u);
        goto LABEL_100;
      }
LABEL_98:
      __break(1u);
      goto LABEL_99;
    }
LABEL_97:
    __break(1u);
    goto LABEL_98;
  }
  v24 = 1;
  v25 = 4;
  while (1)
  {
    v26 = v25 - 4;
    if ((a1 & 0xC000000000000001) == 0)
      break;
    result._rawValue = (void *)MEMORY[0x22766ED44](v25 - 4, a1);
    v28 = (char *)result._rawValue;
    v29 = v25 - 3;
    if (__OFADD__(v26, 1))
      goto LABEL_80;
LABEL_19:
    if (!v24)
      goto LABEL_105;
    v85 = *(float32x4_t *)&v28[OBJC_IVAR____TtC17MeasureFoundation11WorldAnchor_lastTransform + 48];
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      rawValue = sub_2215D7110(0, *((_QWORD *)rawValue + 2) + 1, 1, rawValue);
    v31 = *((_QWORD *)rawValue + 2);
    v30 = *((_QWORD *)rawValue + 3);
    v11 = v31 + 1;
    if (v31 >= v30 >> 1)
      rawValue = sub_2215D7110((char *)(v30 > 1), v31 + 1, 1, rawValue);
    v32 = v85;
    v32.i32[3] = 0;
    *((_QWORD *)rawValue + 2) = v11;
    *(float32x4_t *)&rawValue[16 * v31 + 32] = v32;
    swift_release();
    *(_QWORD *)&v128 = rawValue;
    ++v25;
    v24 = (uint64_t)rawValue;
    if (v29 == v23)
      goto LABEL_25;
  }
  v28 = *(char **)(a1 + 8 * v25);
  result._rawValue = (void *)swift_retain();
  v29 = v25 - 3;
  if (!__OFADD__(v26, 1))
    goto LABEL_19;
LABEL_80:
  __break(1u);
LABEL_81:

  if (v4 >= 1.0 && (float)(v5 * *((float *)&v141 + 1)) <= 100.0 && (float)(v5 * *((float *)&v141 + 1)) >= 0.0001)
  {
    v96 = v131;
    v95 = v136;
    v94 = 0;
    v93 = 0;
    v92 = v142;
    v91 = v144;
    v90 = v146;
    v89 = v148;
    v88 = 0;
    v87 = v152;
    v86 = v154;
    v97[0] = v128;
    v97[1] = v129;
    v97[2] = v130;
    v98 = v131;
    v99 = v132;
    v100 = v133;
    v101 = v134;
    v102 = v135;
    v103 = v136;
    v104 = v5 * *((float *)&v141 + 1);
    v105 = 0;
    v106 = v4;
    v107 = 0;
    v108 = v141;
    v109 = v142;
    v110 = v143;
    v111 = v144;
    v112 = v145;
    v113 = v146;
    v114 = v147;
    v115 = v148;
    v116 = v5 / v6;
    v117 = 0;
    v118 = (float)(v5 / v6) >= 0.9;
    v119 = v151;
    v120 = v152;
    v121 = v153;
    v122 = v154;
    v123 = v155;
    v124 = v156;
    v125 = v157;
    v126 = v158;
    nullsub_1(v97);
    goto LABEL_94;
  }
LABEL_93:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2215BA950((uint64_t)v97);
LABEL_94:
  sub_2215C6540((uint64_t)v97, (uint64_t)v127, qword_2556D8F80);
  return (Swift::OpaquePointer)sub_2215C6540((uint64_t)v127, (uint64_t)rawValue, qword_2556D8F80);
}

uint64_t sub_221647700()
{
  char *v0;
  uint64_t v1;
  uint64_t result;
  float32x2_t *v3;
  unint64_t v4;
  float32x2_t v5;
  __int128 v6;
  float v7;
  __int128 v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  uint64_t v13;
  float32x4_t v14;
  int32x4_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float32x4_t v18;
  float32x4_t v19;
  uint64_t v20;
  uint64_t v21;
  int32x4_t v22;
  float32x2_t v23;
  float32x2_t v24;
  float32x4_t v25;
  float32x4_t v26;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DA0D0);
  result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_221655520;
  v3 = *(float32x2_t **)v1;
  if (*(_QWORD *)v1)
  {
    v4 = (unint64_t)v3[2];
    if (v4 < 2)
    {
      __break(1u);
    }
    else
    {
      v0 = (char *)result;
      v5 = v3[4];
      *(float32x2_t *)&v6 = vsub_f32(v3[6], v5);
      v7 = v3[5].f32[0];
      *((float *)&v6 + 2) = v3[7].f32[0] - v7;
      HIDWORD(v6) = 0;
      *(_OWORD *)(result + 32) = v6;
      if (v4 >= 4)
      {
        *(float32x2_t *)&v8 = vsub_f32(v3[10], v5);
        *((_QWORD *)&v8 + 1) = COERCE_UNSIGNED_INT(v3[11].f32[0] - v7);
        *(_OWORD *)(result + 48) = v8;
        result = swift_bridgeObjectRelease();
        *(_QWORD *)(v1 + 24) = v0;
        if (*((_QWORD *)v0 + 2) >= 2uLL)
        {
          v9 = *((float32x4_t *)v0 + 2);
          v10 = *((float32x4_t *)v0 + 3);
          v11 = vmulq_f32(v10, v10);
          v12 = vmulq_f32(v9, v9);
          v11.f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1))).f32[0]);
          v12.f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), vaddq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 1))).f32[0]);
          *(_QWORD *)(v1 + 148) = v11.u32[0] | ((unint64_t)v12.u32[0] << 32);
          *(_BYTE *)(v1 + 156) = 0;
          if (v12.f32[0] >= v11.f32[0])
            goto LABEL_12;
          v25 = v9;
          v26 = v10;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            goto LABEL_22;
          while (1)
          {
            if (*((_QWORD *)v0 + 2))
            {
              *((float32x4_t *)v0 + 2) = v26;
              *(_QWORD *)(v1 + 24) = v0;
              result = swift_isUniquelyReferenced_nonNull_native();
              if ((result & 1) != 0)
                goto LABEL_9;
            }
            else
            {
              __break(1u);
            }
            result = (uint64_t)sub_22163D6A4((uint64_t)v0);
            v0 = (char *)result;
LABEL_9:
            if (*((_QWORD *)v0 + 2) < 2uLL)
            {
              __break(1u);
              goto LABEL_26;
            }
            *((float32x4_t *)v0 + 3) = v25;
            *(_QWORD *)(v1 + 24) = v0;
            if ((*(_BYTE *)(v1 + 156) & 1) != 0)
              goto LABEL_29;
            *(int32x2_t *)(v1 + 148) = vrev64_s32(*(int32x2_t *)(v1 + 148));
LABEL_12:
            if (!v0)
              goto LABEL_27;
            v13 = *((_QWORD *)v0 + 2);
            if (v13)
            {
              v14 = *((float32x4_t *)v0 + 2);
              v15 = (int32x4_t)vmulq_f32(v14, v14);
              v15.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v15, 2), vadd_f32(*(float32x2_t *)v15.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v15.i8, 1))).u32[0];
              v16 = vrsqrte_f32((float32x2_t)v15.u32[0]);
              v17 = vmul_f32(v16, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v16, v16)));
              v18 = vmulq_n_f32(v14, vmul_f32(v17, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v17, v17))).f32[0]);
              *(float32x4_t *)(v1 + 32) = v18;
              *(_BYTE *)(v1 + 48) = 0;
              if (v13 != 1)
              {
                if ((*(_BYTE *)(v1 + 224) & 1) != 0)
                  goto LABEL_28;
                v19 = *((float32x4_t *)v0 + 3);
                v20 = *(_QWORD *)(v1 + 208);
                v21 = *(_QWORD *)(v1 + 216);
                v22 = (int32x4_t)vmulq_f32(v19, v19);
                v22.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v22, 2), vadd_f32(*(float32x2_t *)v22.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v22.i8, 1))).u32[0];
                v23 = vrsqrte_f32((float32x2_t)v22.u32[0]);
                v24 = vmul_f32(v23, vrsqrts_f32((float32x2_t)v22.u32[0], vmul_f32(v23, v23)));
                *(float32x4_t *)(v1 + 64) = vmulq_n_f32(v19, vmul_f32(v24, vrsqrts_f32((float32x2_t)v22.u32[0], vmul_f32(v24, v24))).f32[0]);
                *(_QWORD *)(v1 + 80) = v20;
                *(_QWORD *)(v1 + 88) = v21;
                *(float32x4_t *)(v1 + 96) = v18;
                return result;
              }
            }
            else
            {
LABEL_20:
              __break(1u);
            }
            __break(1u);
LABEL_22:
            v0 = sub_22163D6A4((uint64_t)v0);
          }
        }
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
    }
    __break(1u);
    goto LABEL_19;
  }
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

uint64_t static WorldRectangleData.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t result;

  v3 = *(_BYTE *)(a1 + 168);
  result = *(unsigned __int8 *)(a2 + 168);
  if ((v3 & 1) == 0)
    return (*(double *)(a1 + 160) == *(double *)(a2 + 160)) & ~(_DWORD)result;
  return result;
}

void sub_221647988(float32x4_t a1)
{
  char **v1;
  char **v2;
  int8x16_t *v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  Swift::OpaquePointer v7;
  unint64_t v8;
  float32x4_t v9;
  float32x4_t v10;
  unint64_t v11;
  float32x4_t v12;
  Swift::Int index;
  uint64_t v14;
  unint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  float32x4_t v26;
  __int128 v28;
  _QWORD *v29;
  Swift::tuple_index_Int_value_Float_optional v30;

  v2 = v1;
  if (!*v1)
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    return;
  }
  v3 = (int8x16_t *)swift_bridgeObjectRetain();
  v4 = sub_2216464C4(v3, (uint64_t)v1);
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v29 = (_QWORD *)MEMORY[0x24BEE4AF8];
    sub_2215CBFF4(0, v5, 0);
    v6 = 0;
    v7._rawValue = v29;
    v8 = v29[2];
    v9 = a1;
    do
    {
      v10 = *(float32x4_t *)(v4 + 16 * v6 + 32);
      v11 = v29[3];
      if (v8 >= v11 >> 1)
      {
        v26 = *(float32x4_t *)(v4 + 16 * v6 + 32);
        sub_2215CBFF4((char *)(v11 > 1), v8 + 1, 1);
        v10 = v26;
        v9 = a1;
      }
      ++v6;
      v12 = vmulq_f32(v10, v9);
      v29[2] = v8 + 1;
      *((_DWORD *)v29 + v8++ + 8) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), vaddq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 1))).u32[0];
    }
    while (v5 != v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v7._rawValue = (void *)MEMORY[0x24BEE4AF8];
  }
  v30 = max(_:)(v7);
  index = v30.value.index;
  v14 = *(_QWORD *)&v30.is_nil;
  swift_bridgeObjectRelease();
  if ((v14 & 0x100000000) != 0)
    goto LABEL_40;
  if (index)
  {
    if (index < 0)
    {
LABEL_35:
      __break(1u);
    }
    else
    {
      v15 = (unint64_t *)(v2 + 2);
      while (1)
      {
        v16 = *v2;
        if (!*v2)
          break;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
        {
          v17 = *((_QWORD *)v16 + 2);
          if (!v17)
            goto LABEL_33;
        }
        else
        {
          v16 = sub_22163D6A4((uint64_t)v16);
          v17 = *((_QWORD *)v16 + 2);
          if (!v17)
          {
LABEL_33:
            __break(1u);
LABEL_34:
            __break(1u);
            goto LABEL_35;
          }
        }
        v18 = v17 - 1;
        v28 = *((_OWORD *)v16 + 2);
        memmove(v16 + 32, v16 + 48, 16 * (v17 - 1));
        *((_QWORD *)v16 + 2) = v18;
        *v2 = v16;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v16 = sub_2215D7110(0, *((_QWORD *)v16 + 2) + 1, 1, v16);
        v20 = *((_QWORD *)v16 + 2);
        v19 = *((_QWORD *)v16 + 3);
        if (v20 >= v19 >> 1)
          v16 = sub_2215D7110((char *)(v19 > 1), v20 + 1, 1, v16);
        *((_QWORD *)v16 + 2) = v20 + 1;
        *(_OWORD *)&v16[16 * v20 + 32] = v28;
        *v2 = v16;
        v21 = (unint64_t)v2[2];
        if (!v21)
          goto LABEL_37;
        isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
        *v15 = v21;
        if (!isUniquelyReferenced_nonNull_bridgeObject || v21 >> 62)
          sub_22163D6A0(v21);
        v23 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (!v23)
          goto LABEL_34;
        v24 = v23 - 1;
        memmove((void *)((v21 & 0xFFFFFFFFFFFFFF8) + 32), (const void *)((v21 & 0xFFFFFFFFFFFFFF8) + 40), 8 * (v23 - 1));
        *(_QWORD *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10) = v24;
        v25 = sub_22165333C();
        if (!*v15)
          goto LABEL_38;
        MEMORY[0x22766E798](v25);
        if (*(_QWORD *)((*v15 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_22165336C();
        sub_2216533A8();
        sub_22165333C();
        if (!--index)
        {
          sub_221647700();
          return;
        }
      }
    }
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
}

uint64_t static WorldRectangleData.pointLiesWithinRectangle(point:rectangle:pointsCoplanar:)(uint64_t result, char a2, __n128 a3)
{
  uint64_t v3;
  float32x4_t *v4;
  int64_t v5;
  float32x4_t *v6;
  __int32 v7;
  uint64_t v8;
  unint64_t v9;
  float32x4_t v10;
  unint64_t v11;
  int32x4_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x4_t v15;
  unint64_t v16;
  BOOL v17;
  float32x2_t v18;
  float v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float v24;
  float32x4_t v25;
  float v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float v30;
  float32x4_t v31;
  float v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  __int32 v37;
  __n128 v38;
  char v39[8];
  float32x2_t *v40;

  v3 = result;
  if ((a2 & 1) == 0)
    result = _s17MeasureFoundation18WorldRectangleDataV014projectPointToD05point9rectangles5SIMD3VySfGAI_ACtFZ_0(result);
  v4 = *(float32x4_t **)(v3 + 24);
  if (!v4)
    goto LABEL_29;
  v38 = a3;
  v5 = v4[1].i64[0];
  v6 = (float32x4_t *)MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v40 = (float32x2_t *)MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_2215CC080(0, v5, 0);
    v8 = 0;
    v6 = (float32x4_t *)v40;
    v9 = (unint64_t)v40[2];
    do
    {
      v10 = v4[v8 + 2];
      v40 = (float32x2_t *)v6;
      v11 = v6[1].u64[1];
      if (v9 >= v11 >> 1)
      {
        v34 = v10;
        v37 = v7;
        sub_2215CC080((char *)(v11 > 1), v9 + 1, 1);
        v10 = v34;
        v7 = v37;
        v6 = (float32x4_t *)v40;
      }
      ++v8;
      v12 = (int32x4_t)vmulq_f32(v10, v10);
      v12.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v12, 2), vadd_f32(*(float32x2_t *)v12.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v12.i8, 1))).u32[0];
      v13 = vrsqrte_f32((float32x2_t)v12.u32[0]);
      v14 = vmul_f32(v13, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v13, v13)));
      v15 = vmulq_n_f32(v10, vmul_f32(v14, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v14, v14))).f32[0]);
      v15.i32[3] = v7;
      v6[1].i64[0] = v9 + 1;
      v6[v9++ + 2] = v15;
    }
    while (v5 != v8);
    swift_bridgeObjectRelease();
  }
  sub_2215C6540(v3, (uint64_t)v39, &qword_2556DE818);
  result = sub_2215C6540((uint64_t)v39, (uint64_t)&v40, &qword_2556DE818);
  if (!v40)
    goto LABEL_30;
  if (!*(_QWORD *)&v40[2])
  {
    __break(1u);
    goto LABEL_25;
  }
  v16 = v6[1].u64[0];
  if (!v16)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v17 = 0;
  v18 = v40[4];
  v19 = v40[5].f32[0];
  *(float32x2_t *)v20.f32 = vsub_f32((float32x2_t)v38.n128_u64[0], v18);
  v20.f32[2] = v38.n128_f32[2] - v19;
  v20.i32[3] = 0;
  v21 = v6[2];
  v22 = vmulq_f32(v20, v21);
  v23 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 2), vaddq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v22.f32, 1)));
  if (v23.f32[0] > 0.0)
  {
    v24 = v19 + vmulq_laneq_f32(v23, v21, 2).f32[0];
    *(float32x2_t *)v21.f32 = vsub_f32((float32x2_t)v38.n128_u64[0], vadd_f32(v18, vmul_n_f32(*(float32x2_t *)v21.f32, v23.f32[0])));
    v21.f32[2] = v38.n128_f32[2] - v24;
    v25 = vmulq_f32(v21, v21);
    v26 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v25, 2), vaddq_f32(v25, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v25.f32, 1))).f32[0]);
    if (v26 > 0.0)
    {
      if (v4[1].i64[0] < 2uLL)
      {
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        return result;
      }
      v27 = vmulq_f32(v4[3], v4[3]);
      v17 = v26 < sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2), vaddq_f32(v27, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 1))).f32[0]);
    }
  }
  if (v16 < 2)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v35 = v20;
  v36 = v6[3];
  result = swift_bridgeObjectRelease();
  v28 = vmulq_f32(v35, v36);
  v29 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2), vaddq_f32(v28, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.f32, 1)));
  if (v29.f32[0] > 0.0)
  {
    v30 = vmulq_laneq_f32(v29, v36, 2).f32[0];
    *(float32x2_t *)v29.f32 = vsub_f32((float32x2_t)v38.n128_u64[0], vadd_f32(v18, vmul_n_f32(*(float32x2_t *)v36.f32, v29.f32[0])));
    v29.f32[2] = v38.n128_f32[2] - (float)(v19 + v30);
    v31 = vmulq_f32(v29, v29);
    v32 = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v31, 2), vaddq_f32(v31, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v31.f32, 1))).f32[0]);
    if (v32 > 0.0)
    {
      if (v4[1].i64[0])
      {
        v33 = vmulq_f32(v4[2], v4[2]);
        result = v32 < sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v33, 2), vaddq_f32(v33, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.f32, 1))).f32[0]);
        if (v17)
          return result;
        return 0;
      }
      goto LABEL_28;
    }
  }
  return 0;
}

uint64_t sub_221647F98(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t result;

  v3 = *(_BYTE *)(a1 + 168);
  result = *(unsigned __int8 *)(a2 + 168);
  if ((v3 & 1) == 0)
    return (*(double *)(a1 + 160) == *(double *)(a2 + 160)) & ~(_DWORD)result;
  return result;
}

uint64_t WorldRectangle.edges.getter()
{
  return sub_2215D8BC4();
}

uint64_t WorldRectangle.splitters.getter()
{
  return sub_2215D8BC4();
}

uint64_t sub_221647FD8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  _BYTE v5[304];

  v3 = *a1 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_data;
  swift_beginAccess();
  sub_2215C6540(v3, (uint64_t)v5, qword_2556D8F80);
  sub_2215C6540((uint64_t)v5, a2, qword_2556D8F80);
  return sub_22164A72C((uint64_t)v5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22164A6B8);
}

uint64_t sub_221648060(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  _BYTE v5[304];
  _BYTE v6[304];

  sub_2215C6540(a1, (uint64_t)v5, qword_2556D8F80);
  v3 = *a2 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_data;
  swift_beginAccess();
  sub_2215C6540(v3, (uint64_t)v6, qword_2556D8F80);
  sub_2215C6540((uint64_t)v5, v3, qword_2556D8F80);
  sub_22164A72C((uint64_t)v5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22164A6B8);
  return sub_22164A72C((uint64_t)v6, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22164A7B0);
}

uint64_t WorldRectangle.data.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[304];

  v3 = v1 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_data;
  swift_beginAccess();
  sub_2215C6540(v3, (uint64_t)v5, qword_2556D8F80);
  sub_22164A72C((uint64_t)v5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22164A6B8);
  return sub_2215C6540((uint64_t)v5, a1, qword_2556D8F80);
}

uint64_t WorldRectangle.rectangleDataBuffer.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_rectangleDataBuffer);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t WorldRectangle.rectangleDataBuffer.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)(v3 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_rectangleDataBuffer);
  swift_beginAccess();
  *v7 = a1;
  v7[1] = a2;
  v7[2] = a3;
  return swift_bridgeObjectRelease();
}

uint64_t (*WorldRectangle.rectangleDataBuffer.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t WorldRectangle.state.getter()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state);
  v2 = *(os_unfair_lock_s **)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v2);
  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 16);
  os_unfair_lock_unlock(v2);
  swift_release();
  return v3;
}

uint64_t WorldRectangle.state.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t v7;
  os_unfair_lock_s *v8;

  v3 = OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state;
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state);
  v5 = *(os_unfair_lock_s **)(v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  v6 = *(_QWORD *)(v4 + 16);
  os_unfair_lock_unlock(v5);
  swift_release();
  v7 = *(_QWORD *)(v1 + v3);
  v8 = *(os_unfair_lock_s **)(v7 + 24);
  swift_retain();
  os_unfair_lock_lock(v8);
  swift_beginAccess();
  *(_QWORD *)(v7 + 16) = a1;
  os_unfair_lock_unlock(v8);
  swift_release();
  return sub_22164848C(v6);
}

uint64_t sub_22164848C(uint64_t a1)
{
  char *v1;
  char *v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  os_unfair_lock_s *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char *v17;
  id v18;
  void *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  os_unfair_lock_s *v27;
  uint64_t v28;
  uint64_t v29;
  os_unfair_lock_s *v30;
  char *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  os_unfair_lock_s *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  os_unfair_lock_s *v39;
  uint64_t v40;
  void **v41;
  void *v42;
  uint64_t v43;
  os_unfair_lock_s *v44;
  id v45;
  uint64_t v46;
  char *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  os_unfair_lock_s *v54;
  uint64_t v55;
  uint64_t v56;
  os_unfair_lock_s *v57;
  uint64_t v58;
  _QWORD aBlock[6];

  v2 = v1;
  v4 = &unk_2556DB000;
  v5 = OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state;
  v6 = *(_QWORD *)&v2[OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state];
  v7 = *(os_unfair_lock_s **)(v6 + 24);
  swift_retain();
  os_unfair_lock_lock(v7);
  swift_beginAccess();
  v8 = *(_QWORD *)(v6 + 16);
  os_unfair_lock_unlock(v7);
  result = swift_release();
  if (v8 == a1)
    return result;
  v10 = *(_QWORD *)&v2[v5];
  v11 = *(os_unfair_lock_s **)(v10 + 24);
  swift_retain();
  os_unfair_lock_lock(v11);
  swift_beginAccess();
  v12 = *(_QWORD *)(v10 + 16);
  os_unfair_lock_unlock(v11);
  swift_release();
  if (v12 == 6)
  {
    v13 = OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationTimer;
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationTimer], sel_invalidate);
    v14 = (void *)objc_opt_self();
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v2;
    aBlock[4] = sub_22164AE98;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22164980C;
    aBlock[3] = &block_descriptor_18;
    v16 = _Block_copy(aBlock);
    v17 = v2;
    swift_release();
    v18 = objc_msgSend(v14, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v16, 2.0);
    _Block_release(v16);
    v19 = *(void **)&v2[v13];
    *(_QWORD *)&v2[v13] = v18;

  }
  v20 = &v2[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_edges];
  swift_beginAccess();
  v21 = *(_QWORD *)v20;
  v58 = v5;
  if (*(_QWORD *)v20 >> 62)
    goto LABEL_23;
  v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v22)
  {
LABEL_24:
    swift_bridgeObjectRelease();
    v47 = &v2[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_splitters];
    swift_beginAccess();
    v48 = *(_QWORD *)v47;
    if (v48 >> 62)
    {
      swift_bridgeObjectRetain();
      result = sub_2216539F0();
      v49 = result;
      if (result)
        goto LABEL_26;
    }
    else
    {
      v49 = *(_QWORD *)((v48 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain();
      if (v49)
      {
LABEL_26:
        if (v49 < 1)
          goto LABEL_36;
        v50 = 0;
        do
        {
          if ((v48 & 0xC000000000000001) != 0)
            v51 = (char *)MEMORY[0x22766ED44](v50, v48);
          else
            v51 = (char *)*(id *)(v48 + 8 * v50 + 32);
          v52 = v51;
          ++v50;
          v53 = *(_QWORD *)&v2[v58];
          v54 = *(os_unfair_lock_s **)(v53 + 24);
          swift_retain();
          os_unfair_lock_lock(v54);
          swift_beginAccess();
          v55 = *(_QWORD *)(v53 + 16);
          os_unfair_lock_unlock(v54);
          swift_release();
          v56 = *(_QWORD *)&v52[v4[230]];
          v57 = *(os_unfair_lock_s **)(v56 + 24);
          swift_retain();
          os_unfair_lock_lock(v57);
          swift_beginAccess();
          *(_QWORD *)(v56 + 16) = v55;
          os_unfair_lock_unlock(v57);

          swift_release();
        }
        while (v49 != v50);
      }
    }
    return swift_bridgeObjectRelease();
  }
LABEL_6:
  if (v22 >= 1)
  {
    v23 = 0;
    while (1)
    {
      if ((v21 & 0xC000000000000001) != 0)
        v24 = (char *)MEMORY[0x22766ED44](v23, v21);
      else
        v24 = (char *)*(id *)(v21 + 8 * v23 + 32);
      v25 = v24;
      v26 = *(_QWORD *)&v2[v58];
      v27 = *(os_unfair_lock_s **)(v26 + 24);
      swift_retain();
      os_unfair_lock_lock(v27);
      swift_beginAccess();
      v28 = *(_QWORD *)(v26 + 16);
      os_unfair_lock_unlock(v27);
      swift_release();
      v29 = *(_QWORD *)&v25[v4[230]];
      v30 = *(os_unfair_lock_s **)(v29 + 24);
      swift_retain();
      os_unfair_lock_lock(v30);
      swift_beginAccess();
      *(_QWORD *)(v29 + 16) = v28;
      os_unfair_lock_unlock(v30);
      swift_release();
      v31 = &v25[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends];
      swift_beginAccess();
      v32 = *(_QWORD *)v31;
      if ((*(_QWORD *)v31 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        v33 = (id)MEMORY[0x22766ED44](0, v32);
        swift_bridgeObjectRelease();
      }
      else
      {
        if (!*(_QWORD *)((v32 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_22:
          __break(1u);
LABEL_23:
          swift_bridgeObjectRetain();
          result = sub_2216539F0();
          v22 = result;
          if (!result)
            goto LABEL_24;
          goto LABEL_6;
        }
        v33 = *(id *)(v32 + 32);
      }
      v34 = *(_QWORD *)&v2[v58];
      v35 = *(os_unfair_lock_s **)(v34 + 24);
      swift_retain();
      os_unfair_lock_lock(v35);
      swift_beginAccess();
      v4 = *(_QWORD **)(v34 + 16);
      os_unfair_lock_unlock(v35);
      swift_release();
      WorldPoint.state.setter((uint64_t)v4);

      v36 = *(_QWORD *)v31;
      if ((v36 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        v37 = (id)MEMORY[0x22766ED44](1, v36);
        swift_bridgeObjectRelease();
      }
      else
      {
        if (*(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
          goto LABEL_22;
        v37 = *(id *)(v36 + 40);
      }
      ++v23;
      v38 = *(_QWORD *)&v2[v58];
      v39 = *(os_unfair_lock_s **)(v38 + 24);
      swift_retain();
      os_unfair_lock_lock(v39);
      swift_beginAccess();
      v40 = *(_QWORD *)(v38 + 16);
      os_unfair_lock_unlock(v39);
      swift_release();
      WorldPoint.state.setter(v40);

      v41 = (void **)&v25[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_center];
      swift_beginAccess();
      v42 = *v41;
      v43 = *(_QWORD *)&v2[v58];
      v44 = *(os_unfair_lock_s **)(v43 + 24);
      v45 = v42;
      swift_retain();
      os_unfair_lock_lock(v44);
      swift_beginAccess();
      v46 = *(_QWORD *)(v43 + 16);
      os_unfair_lock_unlock(v44);
      swift_release();
      WorldPoint.state.setter(v46);

      v4 = (_QWORD *)&unk_2556DB000;
      if (v22 == v23)
        goto LABEL_24;
    }
  }
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

void (*WorldRectangle.state.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  uint64_t v7;

  v3 = malloc(0x90uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state;
  v3[16] = v1;
  v3[17] = v4;
  v5 = *(_QWORD *)(v1 + v4);
  v6 = *(os_unfair_lock_s **)(v5 + 24);
  swift_retain();
  os_unfair_lock_lock(v6);
  swift_beginAccess();
  v7 = *(_QWORD *)(v5 + 16);
  os_unfair_lock_unlock(v6);
  swift_release();
  v3[15] = v7;
  return sub_221648B38;
}

void sub_221648B38(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  os_unfair_lock_s *v9;

  v1 = *(_QWORD **)a1;
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 120);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 128) + *(_QWORD *)(*(_QWORD *)a1 + 136));
  v4 = *(os_unfair_lock_s **)(v3 + 24);
  swift_retain();
  os_unfair_lock_lock(v4);
  v5 = v1[16];
  v6 = v1[17];
  swift_beginAccess();
  v7 = *(_QWORD *)(v3 + 16);
  os_unfair_lock_unlock(v4);
  swift_release();
  v8 = *(_QWORD *)(v5 + v6);
  v9 = *(os_unfair_lock_s **)(v8 + 24);
  swift_retain();
  os_unfair_lock_lock(v9);
  swift_beginAccess();
  *(_QWORD *)(v8 + 16) = v2;
  os_unfair_lock_unlock(v9);
  swift_release();
  sub_22164848C(v7);
  free(v1);
}

uint64_t WorldRectangle.__allocating_init(data:edges:splitters:)(const void *a1, unint64_t a2, unint64_t a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return WorldRectangle.init(data:edges:splitters:)(a1, a2, a3);
}

uint64_t WorldRectangle.init(data:edges:splitters:)(const void *a1, unint64_t a2, unint64_t a3)
{
  char *v3;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  os_unfair_lock_s *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  os_unfair_lock_s *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t result;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  Swift::String v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  Swift::String v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  Swift::String v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  Swift::String v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  char *v53;
  id v54;
  void *v55;
  _QWORD aBlock[6];
  objc_super v57;
  _BYTE v58[304];
  _BYTE __dst[304];
  _BYTE v60[320];

  v7 = (char *)MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_edges] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v3[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_splitters] = v7;
  v8 = (uint64_t)&v3[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_data];
  sub_2215BA950((uint64_t)v58);
  sub_2215C6540((uint64_t)v58, v8, qword_2556D8F80);
  v9 = &v3[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_rectangleDataBuffer];
  v10 = v3;
  v11 = sub_2215D7B74(0, 10, 0, v7);
  *(_OWORD *)v9 = xmmword_22165A650;
  *((_QWORD *)v9 + 2) = v11;
  *(_QWORD *)&v10[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationTime] = 0x4000000000000000;
  *(_QWORD *)&v10[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationTimer] = 0;
  v12 = &v10[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationAction];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;

  v57.receiver = v10;
  v57.super_class = (Class)type metadata accessor for WorldRectangle();
  v13 = (char *)objc_msgSendSuper2(&v57, sel_init);
  v14 = OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state;
  v15 = *(_QWORD *)&v13[OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state];
  v16 = *(os_unfair_lock_s **)(v15 + 24);
  v17 = v13;
  swift_retain();
  os_unfair_lock_lock(v16);
  swift_beginAccess();
  v18 = *(_QWORD *)(v15 + 16);
  os_unfair_lock_unlock(v16);
  swift_release();
  v19 = *(_QWORD *)&v13[v14];
  v20 = *(os_unfair_lock_s **)(v19 + 24);
  swift_retain();
  os_unfair_lock_lock(v20);
  swift_beginAccess();
  *(_QWORD *)(v19 + 16) = 1;
  os_unfair_lock_unlock(v20);
  swift_release();
  sub_22164848C(v18);
  memcpy(__dst, a1, sizeof(__dst));
  nullsub_1(__dst);
  v21 = (uint64_t)&v17[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_data];
  swift_beginAccess();
  sub_2215C6540(v21, (uint64_t)v60, qword_2556D8F80);
  sub_2215C6540((uint64_t)__dst, v21, qword_2556D8F80);
  sub_22164A72C((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22164A7B0);
  v22 = &v17[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_edges];
  swift_beginAccess();
  *(_QWORD *)v22 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v23 = &v17[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_splitters];
  swift_beginAccess();
  *(_QWORD *)v23 = a3;
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    v25 = sub_2216539F0();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v25 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v25)
  {
    if (v25 < 1)
    {
      __break(1u);
      goto LABEL_25;
    }
    v26 = (uint64_t *)&v17[OBJC_IVAR____TtC17MeasureFoundation13MeasureObject_id];
    if ((a2 & 0xC000000000000001) != 0)
    {
      swift_beginAccess();
      v27 = 0;
      do
      {
        MEMORY[0x22766ED44](v27++, a2);
        v28 = *v26;
        v29 = (void *)v26[1];
        swift_bridgeObjectRetain();
        v30._countAndFlagsBits = v28;
        v30._object = v29;
        WorldLine.markAsPartOfComposedObject(withId:)(v30);
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
      }
      while (v25 != v27);
    }
    else
    {
      swift_beginAccess();
      v31 = 0;
      do
      {
        v32 = *(void **)(a2 + 8 * v31++ + 32);
        v33 = *v26;
        v34 = (void *)v26[1];
        v35 = v32;
        swift_bridgeObjectRetain();
        v36._countAndFlagsBits = v33;
        v36._object = v34;
        WorldLine.markAsPartOfComposedObject(withId:)(v36);

        swift_bridgeObjectRelease();
      }
      while (v25 != v31);
    }
  }
  result = swift_bridgeObjectRelease();
  if (!(a3 >> 62))
  {
    v37 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v37)
      goto LABEL_13;
LABEL_20:
    swift_bridgeObjectRelease();
    v49 = OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationTimer;
    objc_msgSend(*(id *)&v17[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationTimer], sel_invalidate);
    v50 = (void *)objc_opt_self();
    v51 = swift_allocObject();
    *(_QWORD *)(v51 + 16) = v17;
    aBlock[4] = sub_22164A824;
    aBlock[5] = v51;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_22164980C;
    aBlock[3] = &block_descriptor_4;
    v52 = _Block_copy(aBlock);
    v53 = v17;
    swift_release();
    v54 = objc_msgSend(v50, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v52, 2.0);
    _Block_release(v52);
    v55 = *(void **)&v17[v49];
    *(_QWORD *)&v17[v49] = v54;

    return (uint64_t)v53;
  }
  swift_bridgeObjectRetain();
  v37 = sub_2216539F0();
  result = swift_bridgeObjectRelease();
  if (!v37)
    goto LABEL_20;
LABEL_13:
  if (v37 >= 1)
  {
    v38 = (uint64_t *)&v17[OBJC_IVAR____TtC17MeasureFoundation13MeasureObject_id];
    if ((a3 & 0xC000000000000001) != 0)
    {
      swift_beginAccess();
      v39 = 0;
      do
      {
        MEMORY[0x22766ED44](v39++, a3);
        v40 = *v38;
        v41 = (void *)v38[1];
        swift_bridgeObjectRetain();
        v42._countAndFlagsBits = v40;
        v42._object = v41;
        WorldLine.markAsPartOfComposedObject(withId:)(v42);
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
      }
      while (v37 != v39);
    }
    else
    {
      swift_beginAccess();
      v43 = 0;
      do
      {
        v44 = *(void **)(a3 + 8 * v43++ + 32);
        v45 = *v38;
        v46 = (void *)v38[1];
        v47 = v44;
        swift_bridgeObjectRetain();
        v48._countAndFlagsBits = v45;
        v48._object = v46;
        WorldLine.markAsPartOfComposedObject(withId:)(v48);

        swift_bridgeObjectRelease();
      }
      while (v37 != v43);
    }
    goto LABEL_20;
  }
LABEL_25:
  __break(1u);
  return result;
}

void WorldRectangle.updateLinesWithRectangle(_:onExpiration:)(void *__src, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  uint64_t v8;
  __int32 v9;
  float32x4_t v10;
  int32x4_t v11;
  float32x2_t v12;
  float32x2_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  os_unfair_lock_s *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  char *v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  float32x4_t v44;
  _QWORD aBlock[6];
  _BYTE v46[304];
  _BYTE v47[304];
  float32x2_t *v48;
  _QWORD __dst[38];
  _BYTE v50[304];
  uint64_t v51[14];
  float32x4_t v52;
  char v53;

  v4 = v3;
  memcpy(__dst, __src, sizeof(__dst));
  v8 = (uint64_t)&v4[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_data];
  swift_beginAccess();
  sub_2215C6540(v8, (uint64_t)v50, qword_2556D8F80);
  sub_2215C6540((uint64_t)v50, (uint64_t)v51, qword_2556D8F80);
  if (sub_22164A844(v51) == 1)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if ((v53 & 1) != 0)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v9 = v52.i32[0];
  v44 = v52;
  sub_2215C6540((uint64_t)v50, (uint64_t)&v48, qword_2556D8F80);
  if (v48)
  {
    if (!*(_QWORD *)&v48[2])
      goto LABEL_30;
    *(float32x2_t *)v10.f32 = vsub_f32((float32x2_t)__PAIR64__(v44.u32[1], v9), v48[4]);
    v10.f32[2] = v44.f32[2] - v48[5].f32[0];
    v11 = (int32x4_t)vmulq_f32(v10, v10);
    v11.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v11, 2), vadd_f32(*(float32x2_t *)v11.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v11.i8, 1))).u32[0];
    v12 = vrsqrte_f32((float32x2_t)v11.u32[0]);
    v13 = vmul_f32(v12, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v12, v12)));
    v44 = vmulq_n_f32(v10, vmul_f32(v13, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v13, v13))).f32[0]);
    sub_22164A868((uint64_t)__src);
    sub_221647988(v44);
    v14 = &v4[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_edges];
    swift_beginAccess();
    v43 = v4;
    v44.i64[0] = (uint64_t)v14;
    v41 = a2;
    v42 = a3;
    v40 = v8;
    if (*(_QWORD *)v14 >> 62)
      goto LABEL_31;
    v15 = *(_QWORD *)((*(_QWORD *)v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    do
    {
      if (!v15)
      {
LABEL_25:
        memcpy(v46, __dst, sizeof(v46));
        nullsub_1(v46);
        sub_2215C6540(v40, (uint64_t)v47, qword_2556D8F80);
        sub_2215C6540((uint64_t)v46, v40, qword_2556D8F80);
        sub_22164A72C((uint64_t)v47, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22164A7B0);
        v31 = (uint64_t *)&v43[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationAction];
        v32 = *(_QWORD *)&v43[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationAction];
        *v31 = v41;
        v31[1] = v42;
        sub_2215EE3EC(v41);
        sub_2215EE3DC(v32);
        v33 = OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationTimer;
        objc_msgSend(*(id *)&v43[OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationTimer], sel_invalidate);
        v34 = (void *)objc_opt_self();
        v35 = swift_allocObject();
        *(_QWORD *)(v35 + 16) = v43;
        aBlock[4] = sub_22164AE98;
        aBlock[5] = v35;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_22164980C;
        aBlock[3] = &block_descriptor_7;
        v36 = _Block_copy(aBlock);
        v37 = v43;
        swift_release();
        v38 = objc_msgSend(v34, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v36, 2.0);
        _Block_release(v36);
        v39 = *(void **)&v43[v33];
        *(_QWORD *)&v43[v33] = v38;

        return;
      }
      v16 = 0;
      v17 = __dst[2];
      v18 = __dst[2] & 0xC000000000000001;
      v19 = __dst[2] & 0xFFFFFFFFFFFFFF8;
      while (v15 != v16)
      {
        v20 = *(_QWORD *)v44.i64[0];
        if ((*(_QWORD *)v44.i64[0] & 0xC000000000000001) != 0)
        {
          swift_bridgeObjectRetain();
          v21 = (char *)MEMORY[0x22766ED44](v16, v20);
          swift_bridgeObjectRelease();
        }
        else
        {
          if (v16 >= *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_27;
          v21 = (char *)*(id *)(v20 + 8 * v16 + 32);
        }
        v22 = &v21[OBJC_IVAR____TtC17MeasureFoundation9WorldLine_ends];
        swift_beginAccess();
        v23 = *(_QWORD *)v22;
        swift_bridgeObjectRetain();

        if ((v23 & 0xC000000000000001) != 0)
        {
          v24 = (char *)MEMORY[0x22766ED44](0, v23);
        }
        else
        {
          if (!*(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_28;
          v24 = (char *)*(id *)(v23 + 32);
        }
        v25 = v24;
        swift_bridgeObjectRelease();
        if (!v17)
          goto LABEL_33;
        if (v18)
        {
          swift_bridgeObjectRetain();
          v26 = MEMORY[0x22766ED44](v16, v17);
          swift_bridgeObjectRelease();
        }
        else
        {
          if (v16 >= *(_QWORD *)(v19 + 16))
            goto LABEL_29;
          v26 = *(_QWORD *)(v17 + 8 * v16 + 32);
          swift_retain();
        }
        ++v16;
        v27 = sub_2216387B8(v26, 2u);
        swift_release();
        v28 = &v25[OBJC_IVAR____TtC17MeasureFoundation10WorldPoint__anchor];
        swift_beginAccess();
        v29 = *(_QWORD *)v28;
        v30 = *(os_unfair_lock_s **)(v29 + 24);
        swift_retain();
        swift_retain();
        os_unfair_lock_lock(v30);
        swift_beginAccess();
        *(_QWORD *)(v29 + 16) = v27;
        swift_retain();
        swift_release();
        os_unfair_lock_unlock(v30);
        swift_release();
        swift_release();
        sub_221643C94();

        swift_release();
        if (v15 == v16)
          goto LABEL_25;
      }
      __break(1u);
LABEL_27:
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      __break(1u);
LABEL_31:
      swift_bridgeObjectRetain();
      v15 = sub_2216539F0();
      swift_bridgeObjectRelease();
    }
    while ((v15 & 0x8000000000000000) == 0);
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
LABEL_36:
  __break(1u);
}

uint64_t sub_22164974C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t result;
  void (*v9)(uint64_t);

  v4 = *(_QWORD *)(a2 + OBJC_IVAR____TtC17MeasureFoundation13MeasureObject__state);
  v5 = *(os_unfair_lock_s **)(v4 + 24);
  swift_retain();
  os_unfair_lock_lock(v5);
  swift_beginAccess();
  v6 = *(_QWORD *)(v4 + 16);
  os_unfair_lock_unlock(v5);
  result = swift_release();
  if (v6 != 5 && v6 != 9)
  {
    v9 = *(void (**)(uint64_t))(a2 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationAction);
    if (v9)
    {
      swift_retain();
      v9(a1);
      return sub_2215EE3DC((uint64_t)v9);
    }
  }
  return result;
}

void sub_22164980C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

Swift::Void __swiftcall WorldRectangle.cleanup()()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_edges);
  swift_beginAccess();
  v2 = *v1;
  if ((unint64_t)*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2216539F0();
    if (!v3)
      goto LABEL_10;
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v3)
      goto LABEL_10;
  }
  if (v3 < 1)
  {
    __break(1u);
    return;
  }
  for (i = 0; i != v3; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0)
      v5 = (id)MEMORY[0x22766ED44](i, v2);
    else
      v5 = *(id *)(v2 + 8 * i + 32);
    v6 = v5;
    WorldLine.cleanup()();

  }
LABEL_10:
  swift_bridgeObjectRelease();
  if (qword_2556D8F48 != -1)
    swift_once();
  v7 = qword_2556E4710;
  v8 = *(_QWORD *)algn_2556E4718;
  sub_221653894();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_221653210();
  swift_bridgeObjectRelease();
  sub_221653210();
  v9 = sub_221653630();
  _s17MeasureFoundation3LogV3log_4type9isPrivateySS_So03os_d1_E2_taSbtF_0(0x636552646C726F57, 0xEF20656C676E6174, v9, 0, v7, v8);
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall WorldRectangle.rememberCurrentRectangle()()
{
  uint64_t v0;
  uint64_t *v1;
  char v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  char v12;
  _BYTE v13[312];
  _BYTE v14[304];
  uint64_t v15[21];
  char v16;
  _BYTE __dst[304];

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_rectangleDataBuffer);
  v2 = 1;
  swift_beginAccess();
  v3 = v1[2];
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v5 = *v1;
    if (*v1)
    {
      v6 = v1[1];
      if (v6 == 0x8000000000000000 && v5 == -1)
        goto LABEL_21;
      v8 = v6 % v5;
      if (v8 < v4)
      {
        v9 = v3 + 304 * v8;
        v10 = *(double *)(v9 + 192);
        v2 = *(_BYTE *)(v9 + 200);
        goto LABEL_10;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v10 = 0.0;
LABEL_10:
  v11 = v0 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_data;
  swift_beginAccess();
  sub_2215C6540(v11, (uint64_t)v14, qword_2556D8F80);
  sub_2215C6540((uint64_t)v14, (uint64_t)v15, qword_2556D8F80);
  if (sub_22164A844(v15) == 1)
  {
LABEL_22:
    __break(1u);
    return;
  }
  v12 = v16;
  if ((v2 & 1) != 0)
  {
    if ((v16 & 1) != 0)
      return;
    goto LABEL_17;
  }
  if (v10 != *(double *)&v15[20])
    v12 = 1;
  if ((v12 & 1) != 0)
  {
LABEL_17:
    sub_2215C6540((uint64_t)v14, (uint64_t)v13, qword_2556D8F80);
    memcpy(__dst, v13, sizeof(__dst));
    sub_22164A868((uint64_t)v13);
    sub_221646620(__dst);
    sub_22164A72C((uint64_t)v14, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22164A7B0);
  }
}

id WorldRectangle.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void WorldRectangle.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_221649C44()
{
  uint64_t v0;
  _BYTE v2[304];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2215C6540(v0 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_data, (uint64_t)v2, qword_2556D8F80);
  sub_22164A72C((uint64_t)v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22164A7B0);
  swift_bridgeObjectRelease();

  return sub_2215EE3DC(*(_QWORD *)(v0 + OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_expirationAction));
}

id WorldRectangle.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorldRectangle();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_221649DC0(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  __int128 v4;
  int v5;
  __int128 v6;

  v1 = *(_QWORD *)(result + 16);
  if (v1)
  {
    v2 = 0;
    v3 = 4;
    if ((unint64_t)(v1 - 1) < 4)
      v3 = v1 - 1;
    v4 = 0uLL;
    do
    {
      if ((unint64_t)(v1 - 1) > 3)
      {
        __break(1u);
        goto LABEL_10;
      }
      v5 = *(_DWORD *)(result + 32 + 4 * v2);
      v6 = v4;
      *(_DWORD *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3))) = v5;
      v4 = v6;
      ++v2;
    }
    while (v1 != v2);
    if (v3 < 3)
      goto LABEL_10;
  }
  else
  {
LABEL_10:
    __break(1u);
  }
  return result;
}

float32x4_t *sub_221649E30(float32x4_t *result, double a2, double a3, double a4, __n128 a5, __n128 a6)
{
  uint64_t v6;
  float32x4_t v7;
  float32x4_t v8;
  float32x4_t *v9;
  float v10;
  uint64_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  int32x4_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float32x4_t v18;
  float32x4_t v19;
  int32x4_t v20;
  float32x2_t v21;
  float32x2_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float v25;
  float32x4_t v26;

  if (result[1].i64[0] == 4)
  {
    v6 = 0;
    v7 = result[2];
    result += 2;
    v8 = v7;
    v9 = result + 1;
    v10 = 0.0;
    do
    {
      v26 = v9[-1];
      if (v6 == 3)
      {
        v11 = 2;
        v12 = v8;
      }
      else
      {
        v12 = *v9;
        if (!v6)
        {
          v13 = result[3];
          goto LABEL_5;
        }
        v11 = v6 - 1;
        if ((unint64_t)(v6 - 1) > 3)
        {
          __break(1u);
          return result;
        }
      }
      v13 = result[v11];
LABEL_5:
      v14 = vsubq_f32(v12, v26);
      v15 = (int32x4_t)vmulq_f32(v14, v14);
      v15.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v15, 2), vadd_f32(*(float32x2_t *)v15.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v15.i8, 1))).u32[0];
      v16 = vrsqrte_f32((float32x2_t)v15.u32[0]);
      v17 = vmul_f32(v16, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v16, v16)));
      v18 = vmulq_n_f32(v14, vmul_f32(v17, vrsqrts_f32((float32x2_t)v15.u32[0], vmul_f32(v17, v17))).f32[0]);
      v18.i32[3] = a6.n128_i32[3];
      v19 = vsubq_f32(v13, v26);
      v20 = (int32x4_t)vmulq_f32(v19, v19);
      v20.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v20, 2), vadd_f32(*(float32x2_t *)v20.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v20.i8, 1))).u32[0];
      v21 = vrsqrte_f32((float32x2_t)v20.u32[0]);
      v22 = vmul_f32(v21, vrsqrts_f32((float32x2_t)v20.u32[0], vmul_f32(v21, v21)));
      v23 = vmulq_n_f32(v19, vmul_f32(v22, vrsqrts_f32((float32x2_t)v20.u32[0], vmul_f32(v22, v22))).f32[0]);
      v23.i32[3] = a5.n128_i32[3];
      v24 = vmulq_f32(v18, v23);
      ++v6;
      v25 = fabsf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v24, 2), vaddq_f32(v24, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.f32, 1))).f32[0]);
      if (v10 < v25)
        v10 = v25;
      ++v9;
      a6.n128_u32[3] = v18.u32[3];
      a5.n128_u32[3] = v23.u32[3];
    }
    while (v6 != 4);
  }
  return result;
}

uint64_t sub_221649F50(uint64_t a1, int32x4_t a2)
{
  unint64_t v2;
  unint64_t v3;
  _OWORD *v5;
  unint64_t v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  __int128 v13;
  __int128 v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  __int128 v22;
  __int128 v23;
  unint64_t v24;
  char *v25;
  float v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  unint64_t v30;
  unint64_t v31;
  __int32 v32;
  __int32 v33;
  int32x4_t v34;
  float32x2_t v35;
  float32x2_t v36;
  float32x4_t v37;
  int32x4_t v38;
  float32x2_t v39;
  float32x2_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float v43;
  char *v44;
  unint64_t v45;
  unint64_t v46;
  __int32 v47;
  __int32 v48;
  int32x4_t v49;
  float32x2_t v50;
  float32x2_t v51;
  float32x4_t v52;
  int32x4_t v53;
  float32x2_t v54;
  float32x2_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float v58;
  unint64_t v59;
  char *v60;
  char *v61;
  float32x4_t v62;
  float32x4_t v63;
  unint64_t v64;
  float32x2_t *v65;
  float32x4_t v66;
  float32x4_t v67;
  int8x16_t v68;
  float32x4_t v69;
  float32x2_t v70;
  float32x2_t v71;
  float32x4_t v72;
  float32x4_t v73;
  uint64_t result;
  unint64_t v75;
  unint64_t v76;
  int32x4_t v77;
  float32x2_t v78;
  float32x2_t v79;
  float32x4_t v80;
  float32x4_t v81;
  int8x16_t v82;
  float32x2_t v83;
  float32x2_t v84;
  float v85;
  unint64_t v86;
  __int128 v87;
  uint64_t v88;
  uint64_t v90;
  unint64_t v91;
  float32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  __int32 v95;
  float32x4_t v96;
  __int32 v97;
  __int32 v98;
  __int32 v99;
  float32x4_t v100;
  float32x4_t v101;
  float32x4_t v102;
  __int128 v103;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DA0D0);
  v5 = (_OWORD *)swift_allocObject();
  v5[1] = xmmword_221656B50;
  v6 = *(_QWORD *)(a1 + 16);
  if (v6 < 2)
  {
    __break(1u);
    goto LABEL_42;
  }
  v7 = *(float *)(a1 + 32);
  v8 = *(float *)(a1 + 48);
  v9 = *(float *)(a1 + 52);
  v10 = *(float *)(a1 + 36);
  v11 = *(float *)(a1 + 40);
  v12 = *(float *)(a1 + 56);
  HIDWORD(v13) = 0;
  HIDWORD(v14) = 0;
  *(float *)&v14 = v8 - v7;
  *((float *)&v14 + 1) = v9 - v10;
  *((float *)&v14 + 2) = v12 - v11;
  v102.i64[0] = (uint64_t)(v5 + 2);
  v5[2] = v14;
  if (v6 == 2)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v15 = *(float *)(a1 + 64);
  v16 = *(float *)(a1 + 68);
  v17 = v15 - v8;
  v18 = *(float *)(a1 + 72);
  *(float *)&v13 = v17;
  *((float *)&v13 + 1) = v16 - v9;
  *((float *)&v13 + 2) = v18 - v12;
  v5[3] = v13;
  if (v6 == 3)
  {
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v91 = v6;
  v88 = a1 + 32;
  v19 = *(float *)(a1 + 80);
  v20 = *(float *)(a1 + 84);
  v21 = *(float *)(a1 + 88);
  HIDWORD(v22) = 0;
  *(float *)&v22 = v19 - v15;
  *((float *)&v22 + 1) = v20 - v16;
  *((float *)&v22 + 2) = v21 - v18;
  HIDWORD(v23) = 0;
  *(float *)&v23 = v7 - v19;
  *((float *)&v23 + 1) = v10 - v20;
  *((float *)&v23 + 2) = v11 - v21;
  v5[4] = v22;
  v5[5] = v23;
  v90 = a1;
  swift_bridgeObjectRetain();
  v3 = 0;
  v24 = 0;
  v25 = (char *)MEMORY[0x24BEE4AF8];
  v26 = 2.0;
  v2 = 1;
  v27 = 3;
  *(_QWORD *)&v103 = MEMORY[0x24BEE4AF8];
  do
  {
    if (v24 == 3)
      v28 = 0;
    else
      v28 = v24 + 1;
    a1 = ((_BYTE)v24 - 1) & 3;
    v92 = *(float32x4_t *)(v102.i64[0] + 16 * v24);
    v94 = *(float32x4_t *)(v102.i64[0] + 16 * a1);
    v29 = (char *)v103;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v29 = sub_2215D711C(0, *(_QWORD *)(v103 + 16) + 1, 1, (char *)v103);
    v31 = *((_QWORD *)v29 + 2);
    v30 = *((_QWORD *)v29 + 3);
    v33 = v97;
    v32 = v98;
    if (v31 >= v30 >> 1)
    {
      v60 = sub_2215D711C((char *)(v30 > 1), v31 + 1, 1, v29);
      v33 = v97;
      v32 = v98;
      v29 = v60;
    }
    v34 = (int32x4_t)vmulq_f32(v92, v92);
    v34.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v34, 2), vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v34.i8, 1))).u32[0];
    v35 = vrsqrte_f32((float32x2_t)v34.u32[0]);
    v36 = vmul_f32(v35, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v35, v35)));
    v37 = vmulq_n_f32(v92, vmul_f32(v36, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v36, v36))).f32[0]);
    v37.i32[3] = v33;
    v38 = (int32x4_t)vmulq_f32(v94, v94);
    v38.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v38, 2), vadd_f32(*(float32x2_t *)v38.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v38.i8, 1))).u32[0];
    v39 = vrsqrte_f32((float32x2_t)v38.u32[0]);
    v40 = vmul_f32(v39, vrsqrts_f32((float32x2_t)v38.u32[0], vmul_f32(v39, v39)));
    v41 = vmulq_n_f32(v94, vmul_f32(v40, vrsqrts_f32((float32x2_t)v38.u32[0], vmul_f32(v40, v40))).f32[0]);
    v41.i32[3] = v32;
    v99 = v33;
    v95 = v32;
    v42 = vmulq_f32(v37, v41);
    v43 = fabsf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v42, 2), vaddq_f32(v42, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v42.f32, 1))).f32[0]);
    *((_QWORD *)v29 + 2) = v31 + 1;
    *(_QWORD *)&v103 = v29;
    v44 = v29 + 32;
    *(float *)&v44[4 * v31] = v43;
    v93 = *(float32x4_t *)(v102.i64[0] + 16 * v24);
    v96 = *(float32x4_t *)(v102.i64[0] + 16 * v28);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v25 = sub_2215D711C(0, *((_QWORD *)v25 + 2) + 1, 1, v25);
    v46 = *((_QWORD *)v25 + 2);
    v45 = *((_QWORD *)v25 + 3);
    v47 = v100.i32[3];
    v48 = v101.i32[3];
    if (v46 >= v45 >> 1)
    {
      v61 = sub_2215D711C((char *)(v45 > 1), v46 + 1, 1, v25);
      v47 = v100.i32[3];
      v48 = v101.i32[3];
      v25 = v61;
    }
    v49 = (int32x4_t)vmulq_f32(v93, v93);
    v49.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v49, 2), vadd_f32(*(float32x2_t *)v49.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v49.i8, 1))).u32[0];
    v50 = vrsqrte_f32((float32x2_t)v49.u32[0]);
    v51 = vmul_f32(v50, vrsqrts_f32((float32x2_t)v49.u32[0], vmul_f32(v50, v50)));
    v52 = vmulq_n_f32(v93, vmul_f32(v51, vrsqrts_f32((float32x2_t)v49.u32[0], vmul_f32(v51, v51))).f32[0]);
    v52.i32[3] = v47;
    v53 = (int32x4_t)vmulq_f32(v96, v96);
    v53.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v53, 2), vadd_f32(*(float32x2_t *)v53.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v53.i8, 1))).u32[0];
    v54 = vrsqrte_f32((float32x2_t)v53.u32[0]);
    v55 = vmul_f32(v54, vrsqrts_f32((float32x2_t)v53.u32[0], vmul_f32(v54, v54)));
    v56 = vmulq_n_f32(v96, vmul_f32(v55, vrsqrts_f32((float32x2_t)v53.u32[0], vmul_f32(v55, v55))).f32[0]);
    v56.i32[3] = v48;
    v57 = vmulq_f32(v52, v56);
    v58 = v43
        + fabsf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v57, 2), vaddq_f32(v57, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v57.f32, 1))).f32[0]);
    if (v58 < v26)
      v3 = v24;
    v59 = v24 + 1;
    *((_QWORD *)v25 + 2) = v46 + 1;
    *(float *)&v25[4 * v46 + 32] = v58;
    if (v58 < v26)
    {
      v27 = ((_BYTE)v24 - 1) & 3;
      v2 = v28;
    }
    v97 = v99;
    v98 = v95;
    if (v58 < v26)
      v26 = v58;
    v100 = v52;
    v101 = v56;
    ++v24;
  }
  while (v59 != 4);
  swift_bridgeObjectRelease();
  if (v3 >= v91)
    goto LABEL_44;
  if (v2 >= v91)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  if (v2 > 3)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  v64 = *(_QWORD *)(v103 + 16);
  if (v3 >= v64)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  if (v2 >= v64)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  v65 = (float32x2_t *)(v102.i64[0] + 16 * v27);
  *(float32x2_t *)v66.f32 = vsub_f32(0, *v65);
  v66.f32[2] = 0.0 - v65[1].f32[0];
  v66.i32[3] = 0;
  v67 = *(float32x4_t *)(v102.i64[0] + 16 * v2);
  v62.i32[0] = *(_DWORD *)&v44[4 * v3];
  v63.i32[0] = *(_DWORD *)&v44[4 * v2];
  if (vabds_f32(v62.f32[0], v63.f32[0]) <= 0.00000011921)
  {
    v69 = vmulq_f32(v66, v66);
    v69.i32[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v69, 2), vaddq_f32(v69, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v69.f32, 1))).u32[0];
    v70 = vrsqrte_f32((float32x2_t)v69.u32[0]);
    v71 = vmul_f32(v70, vrsqrts_f32((float32x2_t)v69.u32[0], vmul_f32(v70, v70)));
    v72 = vmulq_n_f32(v66, vmul_f32(v71, vrsqrts_f32((float32x2_t)v69.u32[0], vmul_f32(v71, v71))).f32[0]);
    v73 = vmulq_f32(v67, v67);
    v73.f32[0] = sqrtf(v69.f32[0])
               + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v73, 2), vaddq_f32(v73, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v73.f32, 1))).f32[0]);
    v69.f32[0] = vmuls_lane_f32(v73.f32[0], v72, 2);
    *(float32x2_t *)v68.i8 = vmul_f32(vmul_n_f32(*(float32x2_t *)v72.f32, v73.f32[0]), (float32x2_t)0x3F0000003F000000);
    *(float *)&v68.i32[2] = v69.f32[0] * 0.5;
    v68.i32[3] = 0;
  }
  else
  {
    v62.f32[0] = v62.f32[0] - v63.f32[0];
    v63.i32[0] = 0;
    v68 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v63, v62), 0), (int8x16_t)v66, (int8x16_t)v67);
  }
  a1 = v90;
  if (v3 <= 3)
  {
    v101 = (float32x4_t)v68;
    v103 = *(_OWORD *)(v88 + 16 * v3);
    v100 = *(float32x4_t *)(v88 + 16 * v2);
    v102 = *(float32x4_t *)(v102.i64[0] + 16 * v3);
    swift_bridgeObjectRelease();
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) != 0)
      goto LABEL_33;
    goto LABEL_50;
  }
LABEL_49:
  __break(1u);
LABEL_50:
  result = (uint64_t)sub_22163D6A4(a1);
  a1 = result;
LABEL_33:
  v75 = v3 - 1;
  if (!v3)
    v75 = 3;
  if ((v75 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_52;
  }
  v76 = *(_QWORD *)(a1 + 16);
  if (v75 >= v76)
  {
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  v77 = (int32x4_t)vmulq_f32(v102, v102);
  v77.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v77, 2), vadd_f32(*(float32x2_t *)v77.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v77.i8, 1))).u32[0];
  v78 = vrsqrte_f32((float32x2_t)v77.u32[0]);
  v79 = vmul_f32(v78, vrsqrts_f32((float32x2_t)v77.u32[0], vmul_f32(v78, v78)));
  v80 = vmulq_n_f32(v102, vmul_f32(v79, vrsqrts_f32((float32x2_t)v77.u32[0], vmul_f32(v79, v79))).f32[0]);
  v81 = vmulq_f32(v101, v101);
  v82 = (int8x16_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(a2, a2), (int8x16_t)a2, 0xCuLL), vnegq_f32(v80)), (float32x4_t)a2, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v80, (int32x4_t)v80), (int8x16_t)v80, 0xCuLL));
  v83.i32[0] = vextq_s8(v82, v82, 8uLL).u32[0];
  v80.f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v81, 2), vaddq_f32(v81, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v81.f32, 1))).f32[0]);
  v83.i32[1] = v82.i32[0];
  v84 = vmul_n_f32(v83, v80.f32[0]);
  v85 = vmuls_lane_f32(v80.f32[0], *(float32x2_t *)v82.i8, 1);
  *(float32x2_t *)v82.i8 = vadd_f32(*(float32x2_t *)&v103, v84);
  *(float *)&v82.i32[2] = *((float *)&v103 + 2) + v85;
  v82.i32[3] = 0;
  *(int8x16_t *)(a1 + 32 + 16 * v75) = v82;
  v86 = v2 - 3;
  if (v2 < 3)
    v86 = v2 + 1;
  if (v86 < v76)
  {
    *(float32x2_t *)&v87 = vadd_f32(*(float32x2_t *)v100.f32, v84);
    *((_QWORD *)&v87 + 1) = COERCE_UNSIGNED_INT(v100.f32[2] + v85);
    *(_OWORD *)(a1 + 32 + 16 * v86) = v87;
    swift_bridgeObjectRelease();
    return a1;
  }
LABEL_53:
  __break(1u);
  return result;
}

uint64_t _s17MeasureFoundation18WorldRectangleDataV014projectPointToD05point9rectangles5SIMD3VySfGAI_ACtFZ_0(uint64_t a1)
{
  uint64_t result;
  _BYTE v3[8];
  uint64_t v4;

  sub_2215C6540(a1, (uint64_t)v3, &qword_2556DE818);
  result = sub_2215C6540((uint64_t)v3, (uint64_t)&v4, &qword_2556DE818);
  if (!v4)
    goto LABEL_6;
  if (!*(_QWORD *)(v4 + 16))
  {
    __break(1u);
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if ((*(_BYTE *)(a1 + 224) & 1) != 0)
LABEL_7:
    __break(1u);
  return result;
}

uint64_t sub_22164A6B8(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t type metadata accessor for WorldRectangle()
{
  return objc_opt_self();
}

uint64_t sub_22164A72C(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v6 = *(_OWORD *)(a1 + 256);
  v7 = *(_OWORD *)(a1 + 272);
  v4 = *(_OWORD *)(a1 + 224);
  v5 = *(_OWORD *)(a1 + 240);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(_QWORD *)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    v4,
    *((_QWORD *)&v4 + 1),
    v5,
    *((_QWORD *)&v5 + 1),
    v6,
    *((_QWORD *)&v6 + 1),
    v7,
    *((_QWORD *)&v7 + 1),
    *(_QWORD *)(a1 + 288),
    *(_QWORD *)(a1 + 296));
  return a1;
}

uint64_t sub_22164A7B0(uint64_t result)
{
  if (result != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22164A800()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_22164A824(uint64_t a1)
{
  uint64_t v1;

  return sub_22164974C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_22164A844(uint64_t *a1)
{
  uint64_t v1;
  int v2;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  v2 = v1 - 1;
  if (v2 < 0)
    v2 = -1;
  return (v2 + 1);
}

uint64_t sub_22164A868(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_22164A8B4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_1(a1, &OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_edges, a2);
}

uint64_t sub_22164A8C0(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_22163A09C(a1, a2, a3, a4, &OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_edges);
}

uint64_t sub_22164A8DC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_1(a1, &OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_splitters, a2);
}

uint64_t sub_22164A8E8(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_22163A09C(a1, a2, a3, a4, &OBJC_IVAR____TtC17MeasureFoundation14WorldRectangle_splitters);
}

ValueMetadata *type metadata accessor for RectangleQualificationParameters()
{
  return &type metadata for RectangleQualificationParameters;
}

uint64_t destroy for WorldRectangleData()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for WorldRectangleData(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  v6 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v6;
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_DWORD *)(a1 + 132) = *(_DWORD *)(a2 + 132);
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  *(_DWORD *)(a1 + 140) = *(_DWORD *)(a2 + 140);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_BYTE *)(a1 + 156) = *(_BYTE *)(a2 + 156);
  *(_QWORD *)(a1 + 148) = *(_QWORD *)(a2 + 148);
  v7 = *(_QWORD *)(a2 + 160);
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = v7;
  *(_BYTE *)(a1 + 176) = *(_BYTE *)(a2 + 176);
  *(_DWORD *)(a1 + 172) = *(_DWORD *)(a2 + 172);
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  *(_DWORD *)(a1 + 180) = *(_DWORD *)(a2 + 180);
  *(_DWORD *)(a1 + 188) = *(_DWORD *)(a2 + 188);
  *(_WORD *)(a1 + 192) = *(_WORD *)(a2 + 192);
  *(_BYTE *)(a1 + 224) = *(_BYTE *)(a2 + 224);
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  LODWORD(v7) = *(_DWORD *)(a2 + 228);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_DWORD *)(a1 + 228) = v7;
  v8 = *(_OWORD *)(a2 + 240);
  v9 = *(_OWORD *)(a2 + 256);
  v10 = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 288) = v10;
  *(_OWORD *)(a1 + 240) = v8;
  *(_OWORD *)(a1 + 256) = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for WorldRectangleData(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  v5 = *(_OWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = v5;
  v6 = *(_DWORD *)(a2 + 132);
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  *(_DWORD *)(a1 + 132) = v6;
  v7 = *(_DWORD *)(a2 + 140);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_DWORD *)(a1 + 140) = v7;
  v8 = *(_QWORD *)(a2 + 148);
  *(_BYTE *)(a1 + 156) = *(_BYTE *)(a2 + 156);
  *(_QWORD *)(a1 + 148) = v8;
  v9 = *(_QWORD *)(a2 + 160);
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = v9;
  LODWORD(v9) = *(_DWORD *)(a2 + 172);
  *(_BYTE *)(a1 + 176) = *(_BYTE *)(a2 + 176);
  *(_DWORD *)(a1 + 172) = v9;
  LODWORD(v9) = *(_DWORD *)(a2 + 180);
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  *(_DWORD *)(a1 + 180) = v9;
  LODWORD(v9) = *(_DWORD *)(a2 + 188);
  *(_BYTE *)(a1 + 192) = *(_BYTE *)(a2 + 192);
  *(_DWORD *)(a1 + 188) = v9;
  *(_BYTE *)(a1 + 193) = *(_BYTE *)(a2 + 193);
  v10 = *(_OWORD *)(a2 + 208);
  *(_BYTE *)(a1 + 224) = *(_BYTE *)(a2 + 224);
  *(_OWORD *)(a1 + 208) = v10;
  LODWORD(v9) = *(_DWORD *)(a2 + 228);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  *(_DWORD *)(a1 + 228) = v9;
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  return a1;
}

void *__swift_memcpy304_16(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x130uLL);
}

uint64_t assignWithTake for WorldRectangleData(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  int v6;
  __int128 v7;
  __int128 v8;

  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v4 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v4;
  v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  *(_DWORD *)(a1 + 132) = *(_DWORD *)(a2 + 132);
  *(_DWORD *)(a1 + 140) = *(_DWORD *)(a2 + 140);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_QWORD *)(a1 + 148) = *(_QWORD *)(a2 + 148);
  *(_BYTE *)(a1 + 156) = *(_BYTE *)(a2 + 156);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  *(_BYTE *)(a1 + 176) = *(_BYTE *)(a2 + 176);
  *(_DWORD *)(a1 + 172) = *(_DWORD *)(a2 + 172);
  v6 = *(_DWORD *)(a2 + 180);
  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  *(_DWORD *)(a1 + 180) = v6;
  *(_BYTE *)(a1 + 192) = *(_BYTE *)(a2 + 192);
  *(_DWORD *)(a1 + 188) = *(_DWORD *)(a2 + 188);
  *(_BYTE *)(a1 + 193) = *(_BYTE *)(a2 + 193);
  *(_BYTE *)(a1 + 224) = *(_BYTE *)(a2 + 224);
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  *(_DWORD *)(a1 + 228) = *(_DWORD *)(a2 + 228);
  *(_BYTE *)(a1 + 232) = *(_BYTE *)(a2 + 232);
  v7 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v7;
  v8 = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 288) = v8;
  return a1;
}

uint64_t getEnumTagSinglePayload for WorldRectangleData(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 304))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WorldRectangleData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 296) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 304) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 304) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for WorldRectangleData()
{
  return &type metadata for WorldRectangleData;
}

uint64_t sub_22164AE48(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_22164AEB4()
{
  uint64_t result;

  result = swift_getKeyPath();
  strcpy((char *)&qword_2556E46B0, "PlaneSelection");
  algn_2556E46B8[7] = -18;
  qword_2556E46C0 = result;
  return result;
}

uint64_t sub_22164AF00()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_2556E46C8 = 0x636E41646C726F57;
  unk_2556E46D0 = 0xEB00000000726F68;
  qword_2556E46D8 = result;
  return result;
}

uint64_t sub_22164AF48()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_2556E46E0 = 0x6564695665726F43;
  *(_QWORD *)algn_2556E46E8 = 0xE90000000000006FLL;
  qword_2556E46F0 = result;
  return result;
}

uint64_t sub_22164AF8C()
{
  uint64_t result;

  result = swift_getKeyPath();
  strcpy((char *)&qword_2556E46F8, "MeasureObject");
  unk_2556E4706 = -4864;
  qword_2556E4708 = result;
  return result;
}

uint64_t sub_22164AFD8()
{
  uint64_t result;

  result = swift_getKeyPath();
  strcpy((char *)&qword_2556E4710, "WorldRectangle");
  algn_2556E4718[7] = -18;
  qword_2556E4720 = result;
  return result;
}

char *keypath_get_selector_logWorldRectangle()
{
  return sel_logWorldRectangle;
}

char *keypath_get_selector_logWorldAnchor()
{
  return sel_logWorldAnchor;
}

uint64_t sub_22164B04C()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_2556E4728 = 0x616D726F66726550;
  unk_2556E4730 = 0xEB0000000065636ELL;
  qword_2556E4738 = result;
  return result;
}

uint64_t sub_22164B094()
{
  uint64_t result;

  result = swift_getKeyPath();
  strcpy((char *)&qword_2556E4740, "Uncategorized");
  *(_WORD *)&algn_2556E4748[6] = -4864;
  qword_2556E4750 = result;
  return result;
}

char *keypath_get_selector_logMisc()
{
  return sel_logMisc;
}

char *keypath_get_selector_logPlaneSelection()
{
  return sel_logPlaneSelection;
}

char *keypath_get_selector_logMeasureObject()
{
  return sel_logMeasureObject;
}

char *keypath_get_selector_logCoreVideo()
{
  return sel_logCoreVideo;
}

char *keypath_get_selector_logPerf()
{
  return sel_logPerf;
}

char *sub_22164B144(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_17;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v3 = MEMORY[0x24BEE4AF8];
    if (!v2)
      return (char *)v3;
    v14 = MEMORY[0x24BEE4AF8];
    result = sub_2215CBFA0(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0)
      break;
    v5 = 0;
    v3 = v14;
    v13 = v1 & 0xC000000000000001;
    while (v2 != v5)
    {
      if (v13)
        MEMORY[0x22766ED44](v5, v1);
      else
        swift_retain();
      swift_retain();
      v6 = sub_221653774();
      v8 = v7;
      swift_release_n();
      if (!v8)
        goto LABEL_16;
      v9 = v1;
      v11 = *(_QWORD *)(v14 + 16);
      v10 = *(_QWORD *)(v14 + 24);
      if (v11 >= v10 >> 1)
        sub_2215CBFA0((char *)(v10 > 1), v11 + 1, 1);
      ++v5;
      *(_QWORD *)(v14 + 16) = v11 + 1;
      v12 = v14 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v6;
      *(_QWORD *)(v12 + 40) = v8;
      v1 = v9;
      if (v2 == v5)
        return (char *)v3;
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
    v2 = sub_2216539F0();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t NSUserDefaults.performOnChange<A>(to:on:action:)(uint64_t *a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v4;

  if (qword_2556D8F60 != -1)
    swift_once();
  return sub_22164B578(a1, a2, v4, a3, a4);
}

uint64_t sub_22164B34C()
{
  unint64_t v0;
  objc_class *v1;
  char *v2;
  id v3;
  char *v4;
  uint64_t v5;
  void *v6;
  char *v7;
  id v8;
  void *v9;
  uint64_t result;
  objc_super v11;

  if (qword_2556D8F68 != -1)
    swift_once();
  v0 = static NSUserDefaults.internalDefaults;
  v1 = (objc_class *)type metadata accessor for NSUserDefaults._DefaultsStore();
  v2 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v2[OBJC_IVAR____TtCE17MeasureFoundationCSo14NSUserDefaults14_DefaultsStore_actions] = MEMORY[0x24BEE4B00];
  *(_QWORD *)&v2[OBJC_IVAR____TtCE17MeasureFoundationCSo14NSUserDefaults14_DefaultsStore_managedDefaults] = v0;
  v11.receiver = v2;
  v11.super_class = v1;
  swift_bridgeObjectRetain_n();
  v3 = objc_msgSendSuper2(&v11, sel_init);
  v4 = sub_22164B144(v0);
  v5 = *((_QWORD *)v4 + 2);
  if (v5)
  {
    v6 = (void *)objc_opt_self();
    swift_bridgeObjectRetain();
    v7 = v4 + 40;
    do
    {
      swift_bridgeObjectRetain();
      v8 = objc_msgSend(v6, sel_standardUserDefaults);
      v9 = (void *)sub_22165318C();
      objc_msgSend(v8, sel_addObserver_forKeyPath_options_context_, v3, v9, 1, 0);
      swift_bridgeObjectRelease();

      v7 += 16;
      --v5;
    }
    while (v5);

    swift_bridgeObjectRelease();
  }
  else
  {

  }
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  static NSUserDefaults.standardStore = (uint64_t)v3;
  return result;
}

uint64_t *NSUserDefaults.standardStore.unsafeMutableAddressor()
{
  if (qword_2556D8F60 != -1)
    swift_once();
  return &static NSUserDefaults.standardStore;
}

id static NSUserDefaults.standardStore.getter()
{
  if (qword_2556D8F60 != -1)
    swift_once();
  return (id)static NSUserDefaults.standardStore;
}

uint64_t sub_22164B578(uint64_t *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char isUniquelyReferenced_nonNull_native;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v34[4];
  uint64_t v35;

  v6 = v5;
  v11 = *a1;
  v12 = (_QWORD *)swift_allocObject();
  v13 = *(_QWORD *)(*MEMORY[0x24BEE46A8] + v11 + 8);
  v12[2] = v13;
  v12[3] = a2;
  v12[4] = a4;
  v12[5] = a5;
  swift_retain();
  v33 = a2;
  result = sub_221653774();
  if (v15)
  {
    v16 = result;
    v17 = v15;
    v32 = a4;
    v18 = (uint64_t *)(v6 + OBJC_IVAR____TtCE17MeasureFoundationCSo14NSUserDefaults14_DefaultsStore_actions);
    swift_beginAccess();
    v19 = *v18;
    if (*(_QWORD *)(*v18 + 16) && (v20 = sub_2215CA39C(v16, v17), (v21 & 1) != 0))
    {
      v22 = *(_QWORD **)(*(_QWORD *)(v19 + 56) + 8 * v20);
      swift_endAccess();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_endAccess();
      v22 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = sub_22164C1B8;
    *(_QWORD *)(v23 + 24) = v12;
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v22 = sub_2215D6CF8(0, v22[2] + 1, 1, v22);
    v25 = v22[2];
    v24 = v22[3];
    if (v25 >= v24 >> 1)
      v22 = sub_2215D6CF8((_QWORD *)(v24 > 1), v25 + 1, 1, v22);
    v22[2] = v25 + 1;
    v26 = &v22[2 * v25];
    v26[4] = sub_22164C1E8;
    v26[5] = v23;
    result = sub_221653774();
    if (v27)
    {
      v28 = result;
      v29 = v27;
      swift_beginAccess();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v35 = *v18;
      *v18 = 0x8000000000000000;
      sub_22161C08C((uint64_t)v22, v28, v29, isUniquelyReferenced_nonNull_native);
      *v18 = v35;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      v34[3] = v13;
      v35 = (uint64_t)a3;
      __swift_allocate_boxed_opaque_existential_1(v34);
      v31 = a3;
      swift_getAtKeyPath();

      sub_22164B93C((uint64_t)v34, (uint64_t)v33, v32, a5, v13);
      swift_release();
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_22164B93C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];
  _OWORD v25[2];

  v22 = a2;
  v9 = sub_221653030();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v21 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_221653048();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2215D1ADC(a1, (uint64_t)v25);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a5;
  sub_2215C39AC(v25, (_OWORD *)(v17 + 24));
  *(_QWORD *)(v17 + 56) = a3;
  *(_QWORD *)(v17 + 64) = a4;
  aBlock[4] = sub_22164C234;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2215BFCE8;
  aBlock[3] = &block_descriptor_5;
  v18 = _Block_copy(aBlock);
  swift_retain();
  sub_22165303C();
  v23 = MEMORY[0x24BEE4AF8];
  sub_2215BB99C(&qword_2556DA4C8, v10, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DA4D0);
  sub_2215DDC10();
  sub_2216537A4();
  MEMORY[0x22766EB04](0, v16, v12, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  return swift_release();
}

uint64_t sub_22164BB40(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  id v11;
  unsigned __int8 v12;
  id v13;
  int v14;
  int v15;
  id v16;
  id v17;
  id v18;
  unsigned int v19;
  id v21;
  id v22;
  _BYTE v23[32];

  v7 = *(_QWORD *)(a4 - 8);
  v8 = (_QWORD *)MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(v8, v8[3]);
  swift_getDynamicType();
  if (swift_dynamicCastMetatype()
    && ((sub_2215DDC80(0, (unint64_t *)&qword_2556DA4E0), swift_dynamicCastMetatype())
     || (sub_2215DDC80(0, &qword_2556DA4E8), swift_dynamicCastMetatype())))
  {
    sub_2215D1ADC(a1, (uint64_t)v23);
    swift_dynamicCast();
    v11 = v22;
    v12 = objc_msgSend(v22, sel_BOOLValue);

    LOBYTE(v21) = v12;
  }
  else
  {
    if (!swift_dynamicCastMetatype()
      || (sub_2215DDC80(0, (unint64_t *)&qword_2556DA4E0), !swift_dynamicCastMetatype())
      && (sub_2215DDC80(0, &qword_2556DA4E8), !swift_dynamicCastMetatype()))
    {
      if (swift_dynamicCastMetatype())
      {
        sub_2215DDC80(0, (unint64_t *)&qword_2556DA4E0);
        if (swift_dynamicCastMetatype())
        {
          sub_2215D1ADC(a1, (uint64_t)v23);
          swift_dynamicCast();
          v16 = v21;
          v17 = objc_msgSend(v21, sel_integerValue);

          v22 = v17;
          goto LABEL_15;
        }
        sub_2215DDC80(0, &qword_2556DA4E8);
        if (swift_dynamicCastMetatype())
        {
          sub_2215D1ADC(a1, (uint64_t)v23);
          swift_dynamicCast();
          v18 = v22;
          v19 = objc_msgSend(v22, sel_intValue);

          LODWORD(v21) = v19;
          goto LABEL_15;
        }
      }
      sub_2215D1ADC(a1, (uint64_t)v23);
      goto LABEL_15;
    }
    sub_2215D1ADC(a1, (uint64_t)v23);
    swift_dynamicCast();
    v13 = v22;
    objc_msgSend(v22, sel_floatValue);
    v15 = v14;

    LODWORD(v21) = v15;
  }
LABEL_15:
  swift_dynamicCast();
  a2(v10);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, a4);
}

uint64_t sub_22164BEC4(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t PartialKeyPath<A>.keyString.getter()
{
  uint64_t result;
  uint64_t v1;

  result = sub_221653774();
  if (!v1)
    __break(1u);
  return result;
}

id NSUserDefaults._DefaultsStore.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void NSUserDefaults._DefaultsStore.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id NSUserDefaults._DefaultsStore.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void _sSo14NSUserDefaultsC17MeasureFoundationE01_B5StoreC12observeValue10forKeyPath2of6change7contextySSSg_ypSgSDySo05NSKeyg6ChangeI0aypGSgSvSgtF_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v10;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_OWORD *);
  __int128 v20;
  __int128 v21;
  _OWORD v22[2];

  if (!a2)
    return;
  v6 = v4;
  if (!a4)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (!*(_QWORD *)(a4 + 16))
  {
LABEL_17:
    v20 = 0u;
    v21 = 0u;
    __break(1u);
    goto LABEL_18;
  }
  v5 = (id)*MEMORY[0x24BDD0E70];
  v10 = sub_2215CA2D4(v5);
  if ((v11 & 1) == 0)
  {
LABEL_18:
    v20 = 0u;
    v21 = 0u;

    goto LABEL_19;
  }
  sub_2215D1ADC(*(_QWORD *)(a4 + 56) + 32 * v10, (uint64_t)&v20);

  if (!*((_QWORD *)&v21 + 1))
  {
LABEL_19:
    __break(1u);
    return;
  }
  sub_2215C39AC(&v20, v22);
  v12 = (uint64_t *)(v6 + OBJC_IVAR____TtCE17MeasureFoundationCSo14NSUserDefaults14_DefaultsStore_actions);
  swift_beginAccess();
  v13 = *v12;
  if (!*(_QWORD *)(v13 + 16))
  {
LABEL_14:
    swift_endAccess();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v22);
    return;
  }
  swift_bridgeObjectRetain();
  v14 = sub_2215CA39C(a1, a2);
  if ((v15 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  v16 = *(_QWORD *)(*(_QWORD *)(v13 + 56) + 8 * v14);
  swift_endAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = *(_QWORD *)(v16 + 16);
  if (v17)
  {
    swift_bridgeObjectRetain();
    v18 = v16 + 40;
    do
    {
      v19 = *(void (**)(_OWORD *))(v18 - 8);
      swift_retain();
      v19(v22);
      swift_release();
      v18 += 16;
      --v17;
    }
    while (v17);
    swift_bridgeObjectRelease();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v22);
  swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for NSUserDefaults._DefaultsStore()
{
  return objc_opt_self();
}

uint64_t sub_22164C18C()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22164C1B8(uint64_t a1)
{
  uint64_t *v1;

  return sub_22164B93C(a1, v1[3], v1[4], v1[5], v1[2]);
}

uint64_t sub_22164C1C4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22164C1E8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_22164C208()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 24);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22164C234()
{
  uint64_t v0;

  return sub_22164BB40(v0 + 24, *(void (**)(char *))(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 16));
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

void sub_22164C25C(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_firstEdge);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

id WorldRectangleGuide.firstEdge.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_firstEdge);
  swift_beginAccess();
  return *v1;
}

void sub_22164C300(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_secondEdge);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

void *WorldRectangleGuide.secondEdge.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_secondEdge);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void *WorldRectangleGuide.data.getter@<X0>(void *a1@<X8>)
{
  uint64_t v1;
  const void *v3;
  _BYTE __dst[304];

  v3 = (const void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_data);
  swift_beginAccess();
  memcpy(__dst, v3, sizeof(__dst));
  sub_22164A868((uint64_t)__dst);
  return memcpy(a1, __dst, 0x130uLL);
}

uint64_t WorldRectangleGuide.data.setter(const void *a1)
{
  uint64_t v1;
  void *v3;
  _BYTE __dst[304];

  v3 = (void *)(v1 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_data);
  swift_beginAccess();
  memcpy(__dst, v3, sizeof(__dst));
  memcpy(v3, a1, 0x130uLL);
  return sub_22164AE48((uint64_t)__dst);
}

uint64_t (*WorldRectangleGuide.data.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id WorldRectangleGuide.__allocating_init(data:baseEdge:)(const void *a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  objc_super v7;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_secondEdge] = 0;
  memcpy(&v5[OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_data], a1, 0x130uLL);
  *(_QWORD *)&v5[OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_firstEdge] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id WorldRectangleGuide.init(data:baseEdge:)(void *__src, uint64_t a2)
{
  char *v2;
  objc_super v5;

  *(_QWORD *)&v2[OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_secondEdge] = 0;
  memcpy(&v2[OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_data], __src, 0x130uLL);
  *(_QWORD *)&v2[OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_firstEdge] = a2;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for WorldRectangleGuide();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for WorldRectangleGuide()
{
  return objc_opt_self();
}

void WorldRectangleGuide.addSecondEdge(_:)(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;

  v3 = (void **)(v1 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_secondEdge);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

}

id WorldRectangleGuide.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void WorldRectangleGuide.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_22164C6B8()
{
  uint64_t v0;
  _BYTE v2[304];

  memcpy(v2, (const void *)(v0 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_data), sizeof(v2));
  return sub_22164AE48((uint64_t)v2);
}

id WorldRectangleGuide.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorldRectangleGuide();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_22164C748@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_firstEdge);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

id sub_22164C79C@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC17MeasureFoundation19WorldRectangleGuide_secondEdge);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

id sub_22164C854@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logPlaneSelection);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22164C884(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogPlaneSelection_, *a1);
}

id sub_22164C898@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logWorldAnchor);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22164C8C8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogWorldAnchor_, *a1);
}

id sub_22164C8DC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logCoreVideo);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22164C90C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogCoreVideo_, *a1);
}

id sub_22164C920@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logMeasureObject);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22164C950(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogMeasureObject_, *a1);
}

id sub_22164C964@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logWorldRectangle);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22164C994(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogWorldRectangle_, *a1);
}

id sub_22164C9A8@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logPerf);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22164C9D8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogPerf_, *a1);
}

id sub_22164C9EC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logMisc);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22164CA1C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogMisc_, *a1);
}

uint64_t *NSUserDefaults.internalDefaults.unsafeMutableAddressor()
{
  if (qword_2556D8F68 != -1)
    swift_once();
  return &static NSUserDefaults.internalDefaults;
}

float sub_22164CA70(void *a1)
{
  return sub_22164E534(a1);
}

float NSUserDefaults.kReticleADSlerpFactor.getter()
{
  void *v0;
  void *v1;
  float v2;
  float v3;

  v1 = (void *)sub_22165318C();
  objc_msgSend(v0, sel_floatForKey_, v1);
  v3 = v2;

  return v3;
}

void sub_22164CAEC(void *a1, float a2)
{
  sub_22164E61C(a1, a2);
}

void NSUserDefaults.kReticleADSlerpFactor.setter(float a1)
{
  sub_22164E6AC(a1);
}

id sub_22164CB24(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kADDemoEnabled.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164CBA8(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kADDemoEnabled.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164CBF0(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kADShowDepth.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164CC6C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kADShowDepth.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164CCAC(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kADGuidedFilterEnabled.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164CD20(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kADGuidedFilterEnabled.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164CD58(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kShouldReportMeasurements.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164CDCC(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kShouldReportMeasurements.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164CE04(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kPEShowStats.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164CE80(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kPEShowStats.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164CEC0(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kPEShowAccuracy.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164CF44(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kPEShowAccuracy.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164CF8C(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kPEShowHitPoints.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164D000(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kPEShowHitPoints.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164D038(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kPEShowHitRay.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164D0BC(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kPEShowHitRay.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164D104(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kResetDefaultOnStart.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164D178(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kResetDefaultOnStart.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164D1B0(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kDrawDebugPlanes.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164D224(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kDrawDebugPlanes.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164D25C(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kShowStatistics.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164D2E0(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kShowStatistics.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164D328(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kShowOverallState.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164D39C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kShowOverallState.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164D3D4(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kShowFeaturePoints.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164D448(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kShowFeaturePoints.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164D480(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kHideTapToRadar.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164D504(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kHideTapToRadar.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164D54C(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kShowWorldAnchorDebugInfo.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164D5C0(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kShowWorldAnchorDebugInfo.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164D5F8(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kShowRectangleDebugInfo.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164D66C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kShowRectangleDebugInfo.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164D6A4(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.shouldEnableObjectMeasurements.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164D718(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.shouldEnableObjectMeasurements.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164D750(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.shouldShowObjectDebugViews.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164D7C4(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.shouldShowObjectDebugViews.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164D7FC(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.shouldRenderOpaqueSurfaces.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164D870(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.shouldRenderOpaqueSurfaces.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164D8A8(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.shouldVERefinePredictedBoundingBoxes.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164D91C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.shouldVERefinePredictedBoundingBoxes.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164D954(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.shouldTuriRefinePredictedBoundingBoxes.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164D9C8(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.shouldTuriRefinePredictedBoundingBoxes.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164DA00(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.shouldUseNormalsForBoxOrientation.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164DA74(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.shouldUseNormalsForBoxOrientation.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164DAAC(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.shouldArchiveSpatialMappingData.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164DB20(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.shouldArchiveSpatialMappingData.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164DB58(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kShowLightIntensityDebugInfo.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164DBCC(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kShowLightIntensityDebugInfo.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164DC04(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kDisableAllCoaching.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164DC78(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kDisableAllCoaching.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164DCB0(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kCoachingCalloutEnabledV1.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164DD24(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kCoachingCalloutEnabledV1.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164DD5C(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kEnableRectangleDetection.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164DDD0(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kEnableRectangleDetection.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164DE08(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kEnableRectangleTracking.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164DE7C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kEnableRectangleTracking.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164DEB4(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kHideRectangleSuggestions.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164DF28(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kHideRectangleSuggestions.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164DF60(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kADEdgeDetectionEnabled.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164DFD4(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kADEdgeDetectionEnabled.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164E00C(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.throttleEdges.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164E090(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.throttleEdges.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164E0D8(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.showEDLines.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164E154(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.showEDLines.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164E194(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.showFinalPlanes.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164E218(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.showFinalPlanes.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164E260(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.showRefinementPlanes.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164E2D4(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.showRefinementPlanes.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164E30C(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.showFilteredRefinementPlanes.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164E380(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.showFilteredRefinementPlanes.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164E3B8(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.showSnappableEdges.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164E42C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.showSnappableEdges.setter(char a1)
{
  sub_221650AF8(a1);
}

float sub_22164E464(void *a1)
{
  return sub_22164E534(a1);
}

float NSUserDefaults.kRayCastDistThreshold.getter()
{
  void *v0;
  void *v1;
  float v2;
  float v3;

  v1 = (void *)sub_22165318C();
  objc_msgSend(v0, sel_floatForKey_, v1);
  v3 = v2;

  return v3;
}

void sub_22164E4E0(void *a1, float a2)
{
  sub_22164E61C(a1, a2);
}

void NSUserDefaults.kRayCastDistThreshold.setter(float a1)
{
  sub_22164E6AC(a1);
}

float sub_22164E518(void *a1)
{
  return sub_22164E534(a1);
}

float sub_22164E534(void *a1)
{
  id v1;
  void *v2;
  float v3;
  float v4;

  v1 = a1;
  v2 = (void *)sub_22165318C();
  objc_msgSend(v1, sel_floatForKey_, v2);
  v4 = v3;

  return v4;
}

float NSUserDefaults.kRayCastAngleThreshold.getter()
{
  void *v0;
  void *v1;
  float v2;
  float v3;

  v1 = (void *)sub_22165318C();
  objc_msgSend(v0, sel_floatForKey_, v1);
  v3 = v2;

  return v3;
}

void sub_22164E600(void *a1, float a2)
{
  sub_22164E61C(a1, a2);
}

void sub_22164E61C(void *a1, float a2)
{
  id v3;
  double v4;
  id v5;

  v3 = a1;
  v5 = (id)sub_22165318C();
  *(float *)&v4 = a2;
  objc_msgSend(v3, sel_setFloat_forKey_, v5, v4);

}

void NSUserDefaults.kRayCastAngleThreshold.setter(float a1)
{
  sub_22164E6AC(a1);
}

void sub_22164E6AC(float a1)
{
  void *v1;
  double v3;
  id v4;

  v4 = (id)sub_22165318C();
  *(float *)&v3 = a1;
  objc_msgSend(v1, sel_setFloat_forKey_, v4, v3);

}

id sub_22164E6F4(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.guideSnapPointsEnabled.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164E768(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.guideSnapPointsEnabled.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164E7A0(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.showGuideSnapPoints.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164E814(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.showGuideSnapPoints.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164E84C(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kEdgeDetectionEnabled.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164E8C0(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kEdgeDetectionEnabled.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164E8F8(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kSnapReticleToEdges.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164E96C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kSnapReticleToEdges.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164E9A4(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kEdgeDetectionDebugReticleEnabled.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164EA18(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kEdgeDetectionDebugReticleEnabled.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164EA50(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kEdgeDetectionUniqueContours.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164EAC4(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kEdgeDetectionUniqueContours.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164EAFC(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kShowPreciseMeasurement.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164EB70(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kShowPreciseMeasurement.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164EBA8(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kShowOppositeUnits.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164EC1C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kShowOppositeUnits.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164EC54(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kLPShowPlane.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164ECD0(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kLPShowPlane.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164ED10(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kLPShowPoints.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164ED94(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kLPShowPoints.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164EDDC(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.showsOnlyYukonEModes.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164EE50(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.showsOnlyYukonEModes.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164EE88(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.isLabelOcclusionEnabled.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164EEFC(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.isLabelOcclusionEnabled.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164EF34(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.labelFadesInAtSpot.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164EFA8(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.labelFadesInAtSpot.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164EFE0(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.isLineOcclusionEnabled.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164F054(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.isLineOcclusionEnabled.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164F08C(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.isLineOcclusionAlphaBlendingEnabled.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164F100(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.isLineOcclusionAlphaBlendingEnabled.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164F138(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.isPointOcclusionEnabled.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164F1AC(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.isPointOcclusionEnabled.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164F1E4(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kMLShowUnprojectedTrail.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164F258(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kMLShowUnprojectedTrail.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164F290(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kMLShowSampledPoints.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164F304(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kMLShowSampledPoints.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164F33C(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kMLShowSegmentedBackground.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164F3B0(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kMLShowSegmentedBackground.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164F3E8(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kMLShowNormalsBackground.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164F45C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kMLShowNormalsBackground.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164F494(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kPersonHeightEnabled.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164F508(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kPersonHeightEnabled.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164F540(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kPersonHeightDebugViewEnabled.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164F5B4(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kPersonHeightDebugViewEnabled.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164F5EC(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kPersonHeightCoachingEnabled.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164F660(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kPersonHeightCoachingEnabled.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164F698(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kPersonSegmentationAlwaysOn.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164F70C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kPersonSegmentationAlwaysOn.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164F744(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kADShowPerson.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164F7C8(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kADShowPerson.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164F810(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.kDivisionsEnabled.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164F884(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.kDivisionsEnabled.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164F8BC(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logPlaneSelection.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164F930(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logPlaneSelection.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164F968(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logObjectMeasurements.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164F9DC(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logObjectMeasurements.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164FA14(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logWorldRectangle.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164FA88(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logWorldRectangle.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164FAC0(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logUIContext.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164FB3C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logUIContext.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164FB7C(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logHapticFeedback.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164FBF0(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logHapticFeedback.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164FC28(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logComputerVision.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164FC9C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logComputerVision.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164FCD4(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logARSession.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164FD50(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logARSession.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164FD90(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logARSessionReplay.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164FE04(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logARSessionReplay.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164FE3C(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logARSessionRecording.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164FEB0(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logARSessionRecording.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164FEE8(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logMotionUpdates.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22164FF5C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logMotionUpdates.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22164FF94(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logApplicationState.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_221650008(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logApplicationState.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_221650040(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logMeasureObject.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_2216500B4(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logMeasureObject.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_2216500EC(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logLightEstimation.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_221650160(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logLightEstimation.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_221650198(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logCoaching.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_221650214(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logCoaching.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_221650254(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logLabel.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_2216502C0(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logLabel.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_2216502F0(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logUIAction.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22165036C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logUIAction.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_2216503AC(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logEdgeDetection.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_221650420(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logEdgeDetection.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_221650458(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logEdgeSnapping.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_2216504DC(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logEdgeSnapping.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_221650524(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logPersonHeight.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_2216505A8(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logPersonHeight.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_2216505F0(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logPerf.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_22165065C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logPerf.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22165068C(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logShaders.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_221650700(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logShaders.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_221650738(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logWorldAnchor.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_2216507BC(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logWorldAnchor.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_221650804(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logCoreVideo.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_221650880(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logCoreVideo.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_2216508C0(void *a1)
{
  return sub_2216509A4(a1);
}

id NSUserDefaults.logArbitration.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_221650944(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void NSUserDefaults.logArbitration.setter(char a1)
{
  sub_221650AF8(a1);
}

id sub_22165098C(void *a1)
{
  return sub_2216509A4(a1);
}

id sub_2216509A4(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  v2 = (void *)sub_22165318C();
  v3 = objc_msgSend(v1, sel_BOOLForKey_, v2);

  return v3;
}

id NSUserDefaults.logMisc.getter()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_22165318C();
  v2 = objc_msgSend(v0, sel_BOOLForKey_, v1);

  return v2;
}

void sub_221650A5C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_221650A74(a1, a2, a3);
}

void sub_221650A74(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  id v5;

  v4 = a1;
  v5 = (id)sub_22165318C();
  objc_msgSend(v4, sel_setBool_forKey_, a3, v5);

}

void NSUserDefaults.logMisc.setter(char a1)
{
  sub_221650AF8(a1);
}

void sub_221650AF8(char a1)
{
  void *v1;
  id v3;

  v3 = (id)sub_22165318C();
  objc_msgSend(v1, sel_setBool_forKey_, a1 & 1, v3);

}

uint64_t sub_221650B48()
{
  uint64_t v0;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2556DB3A0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_22165A970;
  *(_QWORD *)(v0 + 32) = swift_getKeyPath();
  *(_QWORD *)(v0 + 40) = swift_getKeyPath();
  *(_QWORD *)(v0 + 48) = swift_getKeyPath();
  *(_QWORD *)(v0 + 56) = swift_getKeyPath();
  *(_QWORD *)(v0 + 64) = swift_getKeyPath();
  *(_QWORD *)(v0 + 72) = swift_getKeyPath();
  *(_QWORD *)(v0 + 80) = swift_getKeyPath();
  *(_QWORD *)(v0 + 88) = swift_getKeyPath();
  *(_QWORD *)(v0 + 96) = swift_getKeyPath();
  *(_QWORD *)(v0 + 104) = swift_getKeyPath();
  *(_QWORD *)(v0 + 112) = swift_getKeyPath();
  *(_QWORD *)(v0 + 120) = swift_getKeyPath();
  *(_QWORD *)(v0 + 128) = swift_getKeyPath();
  *(_QWORD *)(v0 + 136) = swift_getKeyPath();
  *(_QWORD *)(v0 + 144) = swift_getKeyPath();
  *(_QWORD *)(v0 + 152) = swift_getKeyPath();
  *(_QWORD *)(v0 + 160) = swift_getKeyPath();
  *(_QWORD *)(v0 + 168) = swift_getKeyPath();
  *(_QWORD *)(v0 + 176) = swift_getKeyPath();
  *(_QWORD *)(v0 + 184) = swift_getKeyPath();
  *(_QWORD *)(v0 + 192) = swift_getKeyPath();
  *(_QWORD *)(v0 + 200) = swift_getKeyPath();
  *(_QWORD *)(v0 + 208) = swift_getKeyPath();
  *(_QWORD *)(v0 + 216) = swift_getKeyPath();
  *(_QWORD *)(v0 + 224) = swift_getKeyPath();
  *(_QWORD *)(v0 + 232) = swift_getKeyPath();
  *(_QWORD *)(v0 + 240) = swift_getKeyPath();
  *(_QWORD *)(v0 + 248) = swift_getKeyPath();
  *(_QWORD *)(v0 + 256) = swift_getKeyPath();
  *(_QWORD *)(v0 + 264) = swift_getKeyPath();
  *(_QWORD *)(v0 + 272) = swift_getKeyPath();
  *(_QWORD *)(v0 + 280) = swift_getKeyPath();
  *(_QWORD *)(v0 + 288) = swift_getKeyPath();
  *(_QWORD *)(v0 + 296) = swift_getKeyPath();
  *(_QWORD *)(v0 + 304) = swift_getKeyPath();
  *(_QWORD *)(v0 + 312) = swift_getKeyPath();
  *(_QWORD *)(v0 + 320) = swift_getKeyPath();
  *(_QWORD *)(v0 + 328) = swift_getKeyPath();
  *(_QWORD *)(v0 + 336) = swift_getKeyPath();
  *(_QWORD *)(v0 + 344) = swift_getKeyPath();
  *(_QWORD *)(v0 + 352) = swift_getKeyPath();
  *(_QWORD *)(v0 + 360) = swift_getKeyPath();
  *(_QWORD *)(v0 + 368) = swift_getKeyPath();
  *(_QWORD *)(v0 + 376) = swift_getKeyPath();
  *(_QWORD *)(v0 + 384) = swift_getKeyPath();
  *(_QWORD *)(v0 + 392) = swift_getKeyPath();
  *(_QWORD *)(v0 + 400) = swift_getKeyPath();
  *(_QWORD *)(v0 + 408) = swift_getKeyPath();
  *(_QWORD *)(v0 + 416) = swift_getKeyPath();
  *(_QWORD *)(v0 + 424) = swift_getKeyPath();
  *(_QWORD *)(v0 + 432) = swift_getKeyPath();
  *(_QWORD *)(v0 + 440) = swift_getKeyPath();
  *(_QWORD *)(v0 + 448) = swift_getKeyPath();
  *(_QWORD *)(v0 + 456) = swift_getKeyPath();
  *(_QWORD *)(v0 + 464) = swift_getKeyPath();
  *(_QWORD *)(v0 + 472) = swift_getKeyPath();
  *(_QWORD *)(v0 + 480) = swift_getKeyPath();
  *(_QWORD *)(v0 + 488) = swift_getKeyPath();
  *(_QWORD *)(v0 + 496) = swift_getKeyPath();
  *(_QWORD *)(v0 + 504) = swift_getKeyPath();
  *(_QWORD *)(v0 + 512) = swift_getKeyPath();
  *(_QWORD *)(v0 + 520) = swift_getKeyPath();
  *(_QWORD *)(v0 + 528) = swift_getKeyPath();
  *(_QWORD *)(v0 + 536) = swift_getKeyPath();
  *(_QWORD *)(v0 + 544) = swift_getKeyPath();
  *(_QWORD *)(v0 + 552) = swift_getKeyPath();
  *(_QWORD *)(v0 + 560) = swift_getKeyPath();
  *(_QWORD *)(v0 + 568) = swift_getKeyPath();
  *(_QWORD *)(v0 + 576) = swift_getKeyPath();
  *(_QWORD *)(v0 + 584) = swift_getKeyPath();
  *(_QWORD *)(v0 + 592) = swift_getKeyPath();
  *(_QWORD *)(v0 + 600) = swift_getKeyPath();
  *(_QWORD *)(v0 + 608) = swift_getKeyPath();
  *(_QWORD *)(v0 + 616) = swift_getKeyPath();
  *(_QWORD *)(v0 + 624) = swift_getKeyPath();
  *(_QWORD *)(v0 + 632) = swift_getKeyPath();
  *(_QWORD *)(v0 + 640) = swift_getKeyPath();
  *(_QWORD *)(v0 + 648) = swift_getKeyPath();
  *(_QWORD *)(v0 + 656) = swift_getKeyPath();
  *(_QWORD *)(v0 + 664) = swift_getKeyPath();
  *(_QWORD *)(v0 + 672) = swift_getKeyPath();
  *(_QWORD *)(v0 + 680) = swift_getKeyPath();
  *(_QWORD *)(v0 + 688) = swift_getKeyPath();
  *(_QWORD *)(v0 + 696) = swift_getKeyPath();
  *(_QWORD *)(v0 + 704) = swift_getKeyPath();
  *(_QWORD *)(v0 + 712) = swift_getKeyPath();
  *(_QWORD *)(v0 + 720) = swift_getKeyPath();
  *(_QWORD *)(v0 + 728) = swift_getKeyPath();
  *(_QWORD *)(v0 + 736) = swift_getKeyPath();
  *(_QWORD *)(v0 + 744) = swift_getKeyPath();
  result = sub_22165333C();
  static NSUserDefaults.internalDefaults = v0;
  return result;
}

uint64_t static NSUserDefaults.internalDefaults.getter()
{
  if (qword_2556D8F68 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

Swift::Int __swiftcall NSUserDefaults.int(forKey:)(Swift::String forKey)
{
  void *v1;
  void *v2;
  id v3;

  v2 = (void *)sub_22165318C();
  v3 = objc_msgSend(v1, sel_integerForKey_, v2);

  return (Swift::Int)v3;
}

char *keypath_get_selector_kReticleADSlerpFactor()
{
  return sel_kReticleADSlerpFactor;
}

id sub_2216511D4@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result;
  int v4;

  result = objc_msgSend(*a1, sel_kReticleADSlerpFactor);
  *a2 = v4;
  return result;
}

id sub_221651204(_DWORD *a1, id *a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*a2, sel_setKReticleADSlerpFactor_, a3);
}

char *keypath_get_selector_kADShowDepth()
{
  return sel_kADShowDepth;
}

id sub_22165122C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kADShowDepth);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165125C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKADShowDepth_, *a1);
}

char *keypath_get_selector_kADGuidedFilterEnabled()
{
  return sel_kADGuidedFilterEnabled;
}

id sub_22165127C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kADGuidedFilterEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216512AC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKADGuidedFilterEnabled_, *a1);
}

char *keypath_get_selector_kShouldReportMeasurements()
{
  return sel_kShouldReportMeasurements;
}

id sub_2216512CC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kShouldReportMeasurements);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216512FC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKShouldReportMeasurements_, *a1);
}

char *keypath_get_selector_kPEShowStats()
{
  return sel_kPEShowStats;
}

id sub_22165131C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kPEShowStats);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165134C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKPEShowStats_, *a1);
}

char *keypath_get_selector_kPEShowAccuracy()
{
  return sel_kPEShowAccuracy;
}

id sub_22165136C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kPEShowAccuracy);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165139C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKPEShowAccuracy_, *a1);
}

char *keypath_get_selector_kPEShowHitPoints()
{
  return sel_kPEShowHitPoints;
}

id sub_2216513BC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kPEShowHitPoints);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216513EC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKPEShowHitPoints_, *a1);
}

char *keypath_get_selector_kPEShowHitRay()
{
  return sel_kPEShowHitRay;
}

id sub_22165140C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kPEShowHitRay);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165143C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKPEShowHitRay_, *a1);
}

char *keypath_get_selector_kResetDefaultOnStart()
{
  return sel_kResetDefaultOnStart;
}

id sub_22165145C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kResetDefaultOnStart);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165148C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKResetDefaultOnStart_, *a1);
}

char *keypath_get_selector_kDrawDebugPlanes()
{
  return sel_kDrawDebugPlanes;
}

id sub_2216514AC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kDrawDebugPlanes);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216514DC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKDrawDebugPlanes_, *a1);
}

char *keypath_get_selector_kShowStatistics()
{
  return sel_kShowStatistics;
}

id sub_2216514FC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kShowStatistics);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165152C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKShowStatistics_, *a1);
}

char *keypath_get_selector_kShowOverallState()
{
  return sel_kShowOverallState;
}

id sub_22165154C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kShowOverallState);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165157C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKShowOverallState_, *a1);
}

char *keypath_get_selector_kShowFeaturePoints()
{
  return sel_kShowFeaturePoints;
}

id sub_22165159C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kShowFeaturePoints);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216515CC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKShowFeaturePoints_, *a1);
}

char *keypath_get_selector_kHideTapToRadar()
{
  return sel_kHideTapToRadar;
}

id sub_2216515EC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kHideTapToRadar);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165161C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKHideTapToRadar_, *a1);
}

char *keypath_get_selector_kShowWorldAnchorDebugInfo()
{
  return sel_kShowWorldAnchorDebugInfo;
}

id sub_22165163C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kShowWorldAnchorDebugInfo);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165166C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKShowWorldAnchorDebugInfo_, *a1);
}

char *keypath_get_selector_kShowRectangleDebugInfo()
{
  return sel_kShowRectangleDebugInfo;
}

id sub_22165168C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kShowRectangleDebugInfo);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216516BC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKShowRectangleDebugInfo_, *a1);
}

char *keypath_get_selector_shouldEnableObjectMeasurements()
{
  return sel_shouldEnableObjectMeasurements;
}

id sub_2216516DC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_shouldEnableObjectMeasurements);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165170C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldEnableObjectMeasurements_, *a1);
}

char *keypath_get_selector_shouldShowObjectDebugViews()
{
  return sel_shouldShowObjectDebugViews;
}

id sub_22165172C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_shouldShowObjectDebugViews);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165175C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldShowObjectDebugViews_, *a1);
}

char *keypath_get_selector_shouldRenderOpaqueSurfaces()
{
  return sel_shouldRenderOpaqueSurfaces;
}

id sub_22165177C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_shouldRenderOpaqueSurfaces);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216517AC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldRenderOpaqueSurfaces_, *a1);
}

char *keypath_get_selector_shouldVERefinePredictedBoundingBoxes()
{
  return sel_shouldVERefinePredictedBoundingBoxes;
}

id sub_2216517CC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_shouldVERefinePredictedBoundingBoxes);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216517FC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldVERefinePredictedBoundingBoxes_, *a1);
}

char *keypath_get_selector_shouldTuriRefinePredictedBoundingBoxes()
{
  return sel_shouldTuriRefinePredictedBoundingBoxes;
}

id sub_22165181C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_shouldTuriRefinePredictedBoundingBoxes);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165184C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldTuriRefinePredictedBoundingBoxes_, *a1);
}

char *keypath_get_selector_shouldUseNormalsForBoxOrientation()
{
  return sel_shouldUseNormalsForBoxOrientation;
}

id sub_22165186C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_shouldUseNormalsForBoxOrientation);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165189C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldUseNormalsForBoxOrientation_, *a1);
}

char *keypath_get_selector_shouldArchiveSpatialMappingData()
{
  return sel_shouldArchiveSpatialMappingData;
}

id sub_2216518BC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_shouldArchiveSpatialMappingData);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216518EC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShouldArchiveSpatialMappingData_, *a1);
}

char *keypath_get_selector_kShowLightIntensityDebugInfo()
{
  return sel_kShowLightIntensityDebugInfo;
}

id sub_22165190C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kShowLightIntensityDebugInfo);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165193C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKShowLightIntensityDebugInfo_, *a1);
}

char *keypath_get_selector_kDisableAllCoaching()
{
  return sel_kDisableAllCoaching;
}

id sub_22165195C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kDisableAllCoaching);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165198C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKDisableAllCoaching_, *a1);
}

char *keypath_get_selector_kCoachingCalloutEnabledV1()
{
  return sel_kCoachingCalloutEnabledV1;
}

id sub_2216519AC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kCoachingCalloutEnabledV1);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216519DC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKCoachingCalloutEnabledV1_, *a1);
}

char *keypath_get_selector_kEnableRectangleDetection()
{
  return sel_kEnableRectangleDetection;
}

id sub_2216519FC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kEnableRectangleDetection);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221651A2C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKEnableRectangleDetection_, *a1);
}

char *keypath_get_selector_kEnableRectangleTracking()
{
  return sel_kEnableRectangleTracking;
}

id sub_221651A4C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kEnableRectangleTracking);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221651A7C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKEnableRectangleTracking_, *a1);
}

char *keypath_get_selector_kHideRectangleSuggestions()
{
  return sel_kHideRectangleSuggestions;
}

id sub_221651A9C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kHideRectangleSuggestions);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221651ACC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKHideRectangleSuggestions_, *a1);
}

char *keypath_get_selector_kADEdgeDetectionEnabled()
{
  return sel_kADEdgeDetectionEnabled;
}

id sub_221651AEC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kADEdgeDetectionEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221651B1C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKADEdgeDetectionEnabled_, *a1);
}

char *keypath_get_selector_throttleEdges()
{
  return sel_throttleEdges;
}

id sub_221651B3C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_throttleEdges);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221651B6C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setThrottleEdges_, *a1);
}

char *keypath_get_selector_showEDLines()
{
  return sel_showEDLines;
}

id sub_221651B8C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_showEDLines);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221651BBC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShowEDLines_, *a1);
}

char *keypath_get_selector_showFinalPlanes()
{
  return sel_showFinalPlanes;
}

id sub_221651BDC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_showFinalPlanes);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221651C0C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShowFinalPlanes_, *a1);
}

char *keypath_get_selector_showRefinementPlanes()
{
  return sel_showRefinementPlanes;
}

id sub_221651C2C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_showRefinementPlanes);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221651C5C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShowRefinementPlanes_, *a1);
}

char *keypath_get_selector_showFilteredRefinementPlanes()
{
  return sel_showFilteredRefinementPlanes;
}

id sub_221651C7C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_showFilteredRefinementPlanes);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221651CAC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShowFilteredRefinementPlanes_, *a1);
}

char *keypath_get_selector_showSnappableEdges()
{
  return sel_showSnappableEdges;
}

id sub_221651CCC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_showSnappableEdges);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221651CFC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShowSnappableEdges_, *a1);
}

char *keypath_get_selector_kRayCastDistThreshold()
{
  return sel_kRayCastDistThreshold;
}

id sub_221651D1C@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result;
  int v4;

  result = objc_msgSend(*a1, sel_kRayCastDistThreshold);
  *a2 = v4;
  return result;
}

id sub_221651D4C(_DWORD *a1, id *a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*a2, sel_setKRayCastDistThreshold_, a3);
}

char *keypath_get_selector_kRayCastAngleThreshold()
{
  return sel_kRayCastAngleThreshold;
}

id sub_221651D6C@<X0>(id *a1@<X0>, _DWORD *a2@<X8>)
{
  id result;
  int v4;

  result = objc_msgSend(*a1, sel_kRayCastAngleThreshold);
  *a2 = v4;
  return result;
}

id sub_221651D9C(_DWORD *a1, id *a2, double a3)
{
  LODWORD(a3) = *a1;
  return objc_msgSend(*a2, sel_setKRayCastAngleThreshold_, a3);
}

char *keypath_get_selector_guideSnapPointsEnabled()
{
  return sel_guideSnapPointsEnabled;
}

id sub_221651DBC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_guideSnapPointsEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221651DEC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setGuideSnapPointsEnabled_, *a1);
}

char *keypath_get_selector_showGuideSnapPoints()
{
  return sel_showGuideSnapPoints;
}

id sub_221651E0C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_showGuideSnapPoints);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221651E3C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShowGuideSnapPoints_, *a1);
}

char *keypath_get_selector_kEdgeDetectionEnabled()
{
  return sel_kEdgeDetectionEnabled;
}

id sub_221651E5C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kEdgeDetectionEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221651E8C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKEdgeDetectionEnabled_, *a1);
}

char *keypath_get_selector_kSnapReticleToEdges()
{
  return sel_kSnapReticleToEdges;
}

id sub_221651EAC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kSnapReticleToEdges);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221651EDC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKSnapReticleToEdges_, *a1);
}

char *keypath_get_selector_kEdgeDetectionDebugReticleEnabled()
{
  return sel_kEdgeDetectionDebugReticleEnabled;
}

id sub_221651EFC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kEdgeDetectionDebugReticleEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221651F2C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKEdgeDetectionDebugReticleEnabled_, *a1);
}

char *keypath_get_selector_kEdgeDetectionUniqueContours()
{
  return sel_kEdgeDetectionUniqueContours;
}

id sub_221651F4C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kEdgeDetectionUniqueContours);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221651F7C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKEdgeDetectionUniqueContours_, *a1);
}

char *keypath_get_selector_kShowPreciseMeasurement()
{
  return sel_kShowPreciseMeasurement;
}

id sub_221651F9C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kShowPreciseMeasurement);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221651FCC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKShowPreciseMeasurement_, *a1);
}

char *keypath_get_selector_kShowOppositeUnits()
{
  return sel_kShowOppositeUnits;
}

id sub_221651FEC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kShowOppositeUnits);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165201C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKShowOppositeUnits_, *a1);
}

char *keypath_get_selector_kLPShowPlane()
{
  return sel_kLPShowPlane;
}

id sub_22165203C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kLPShowPlane);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165206C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKLPShowPlane_, *a1);
}

char *keypath_get_selector_kLPShowPoints()
{
  return sel_kLPShowPoints;
}

id sub_22165208C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kLPShowPoints);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216520BC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKLPShowPoints_, *a1);
}

char *keypath_get_selector_showsOnlyYukonEModes()
{
  return sel_showsOnlyYukonEModes;
}

id sub_2216520DC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_showsOnlyYukonEModes);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165210C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setShowsOnlyYukonEModes_, *a1);
}

char *keypath_get_selector_isLabelOcclusionEnabled()
{
  return sel_isLabelOcclusionEnabled;
}

id sub_22165212C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isLabelOcclusionEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165215C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsLabelOcclusionEnabled_, *a1);
}

char *keypath_get_selector_labelFadesInAtSpot()
{
  return sel_labelFadesInAtSpot;
}

id sub_22165217C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_labelFadesInAtSpot);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216521AC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLabelFadesInAtSpot_, *a1);
}

char *keypath_get_selector_isLineOcclusionEnabled()
{
  return sel_isLineOcclusionEnabled;
}

id sub_2216521CC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isLineOcclusionEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216521FC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsLineOcclusionEnabled_, *a1);
}

char *keypath_get_selector_isLineOcclusionAlphaBlendingEnabled()
{
  return sel_isLineOcclusionAlphaBlendingEnabled;
}

id sub_22165221C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isLineOcclusionAlphaBlendingEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165224C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsLineOcclusionAlphaBlendingEnabled_, *a1);
}

char *keypath_get_selector_isPointOcclusionEnabled()
{
  return sel_isPointOcclusionEnabled;
}

id sub_22165226C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isPointOcclusionEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165229C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsPointOcclusionEnabled_, *a1);
}

char *keypath_get_selector_kMLShowUnprojectedTrail()
{
  return sel_kMLShowUnprojectedTrail;
}

id sub_2216522BC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kMLShowUnprojectedTrail);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216522EC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKMLShowUnprojectedTrail_, *a1);
}

char *keypath_get_selector_kMLShowSampledPoints()
{
  return sel_kMLShowSampledPoints;
}

id sub_22165230C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kMLShowSampledPoints);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165233C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKMLShowSampledPoints_, *a1);
}

char *keypath_get_selector_kMLShowSegmentedBackground()
{
  return sel_kMLShowSegmentedBackground;
}

id sub_22165235C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kMLShowSegmentedBackground);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165238C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKMLShowSegmentedBackground_, *a1);
}

char *keypath_get_selector_kMLShowNormalsBackground()
{
  return sel_kMLShowNormalsBackground;
}

id sub_2216523AC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kMLShowNormalsBackground);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216523DC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKMLShowNormalsBackground_, *a1);
}

char *keypath_get_selector_kPersonHeightEnabled()
{
  return sel_kPersonHeightEnabled;
}

id sub_2216523FC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kPersonHeightEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165242C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKPersonHeightEnabled_, *a1);
}

char *keypath_get_selector_kPersonHeightDebugViewEnabled()
{
  return sel_kPersonHeightDebugViewEnabled;
}

id sub_22165244C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kPersonHeightDebugViewEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165247C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKPersonHeightDebugViewEnabled_, *a1);
}

char *keypath_get_selector_kPersonHeightCoachingEnabled()
{
  return sel_kPersonHeightCoachingEnabled;
}

id sub_22165249C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kPersonHeightCoachingEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216524CC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKPersonHeightCoachingEnabled_, *a1);
}

char *keypath_get_selector_kPersonSegmentationAlwaysOn()
{
  return sel_kPersonSegmentationAlwaysOn;
}

id sub_2216524EC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kPersonSegmentationAlwaysOn);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165251C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKPersonSegmentationAlwaysOn_, *a1);
}

char *keypath_get_selector_kADShowPerson()
{
  return sel_kADShowPerson;
}

id sub_22165253C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kADShowPerson);
  *a2 = (_BYTE)result;
  return result;
}

id sub_22165256C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKADShowPerson_, *a1);
}

char *keypath_get_selector_kDivisionsEnabled()
{
  return sel_kDivisionsEnabled;
}

id sub_22165258C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_kDivisionsEnabled);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216525BC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setKDivisionsEnabled_, *a1);
}

id sub_2216525D0@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logPlaneSelection);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652600(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogPlaneSelection_, *a1);
}

char *keypath_get_selector_logObjectMeasurements()
{
  return sel_logObjectMeasurements;
}

id sub_221652620@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logObjectMeasurements);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652650(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogObjectMeasurements_, *a1);
}

id sub_221652664@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logWorldRectangle);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652694(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogWorldRectangle_, *a1);
}

char *keypath_get_selector_logUIContext()
{
  return sel_logUIContext;
}

id sub_2216526B4@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logUIContext);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216526E4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogUIContext_, *a1);
}

char *keypath_get_selector_logHapticFeedback()
{
  return sel_logHapticFeedback;
}

id sub_221652704@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logHapticFeedback);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652734(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogHapticFeedback_, *a1);
}

char *keypath_get_selector_logComputerVision()
{
  return sel_logComputerVision;
}

id sub_221652754@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logComputerVision);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652784(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogComputerVision_, *a1);
}

char *keypath_get_selector_logARSession()
{
  return sel_logARSession;
}

id sub_2216527A4@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logARSession);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216527D4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogARSession_, *a1);
}

char *keypath_get_selector_logARSessionReplay()
{
  return sel_logARSessionReplay;
}

id sub_2216527F4@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logARSessionReplay);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652824(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogARSessionReplay_, *a1);
}

char *keypath_get_selector_logARSessionRecording()
{
  return sel_logARSessionRecording;
}

id sub_221652844@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logARSessionRecording);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652874(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogARSessionRecording_, *a1);
}

char *keypath_get_selector_logMotionUpdates()
{
  return sel_logMotionUpdates;
}

id sub_221652894@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logMotionUpdates);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216528C4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogMotionUpdates_, *a1);
}

char *keypath_get_selector_logApplicationState()
{
  return sel_logApplicationState;
}

id sub_2216528E4@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logApplicationState);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652914(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogApplicationState_, *a1);
}

id sub_221652928@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logMeasureObject);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652958(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogMeasureObject_, *a1);
}

char *keypath_get_selector_logLightEstimation()
{
  return sel_logLightEstimation;
}

id sub_221652978@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logLightEstimation);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216529A8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogLightEstimation_, *a1);
}

char *keypath_get_selector_logCoaching()
{
  return sel_logCoaching;
}

id sub_2216529C8@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logCoaching);
  *a2 = (_BYTE)result;
  return result;
}

id sub_2216529F8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogCoaching_, *a1);
}

char *keypath_get_selector_logLabel()
{
  return sel_logLabel;
}

id sub_221652A18@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logLabel);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652A48(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogLabel_, *a1);
}

char *keypath_get_selector_logUIAction()
{
  return sel_logUIAction;
}

id sub_221652A68@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logUIAction);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652A98(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogUIAction_, *a1);
}

char *keypath_get_selector_logEdgeDetection()
{
  return sel_logEdgeDetection;
}

id sub_221652AB8@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logEdgeDetection);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652AE8(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogEdgeDetection_, *a1);
}

char *keypath_get_selector_logEdgeSnapping()
{
  return sel_logEdgeSnapping;
}

id sub_221652B08@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logEdgeSnapping);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652B38(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogEdgeSnapping_, *a1);
}

char *keypath_get_selector_logPersonHeight()
{
  return sel_logPersonHeight;
}

id sub_221652B58@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logPersonHeight);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652B88(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogPersonHeight_, *a1);
}

id sub_221652B9C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logPerf);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652BCC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogPerf_, *a1);
}

char *keypath_get_selector_logShaders()
{
  return sel_logShaders;
}

id sub_221652BEC@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logShaders);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652C1C(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogShaders_, *a1);
}

id sub_221652C30@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logWorldAnchor);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652C60(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogWorldAnchor_, *a1);
}

id sub_221652C74@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logCoreVideo);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652CA4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogCoreVideo_, *a1);
}

char *keypath_get_selector_logArbitration()
{
  return sel_logArbitration;
}

id sub_221652CC4@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logArbitration);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652CF4(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogArbitration_, *a1);
}

id sub_221652D08@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_logMisc);
  *a2 = (_BYTE)result;
  return result;
}

id sub_221652D38(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setLogMisc_, *a1);
}

void cva::MatrixData<double,0ul,0ul,false>::allocate()
{
  __assert_rtn("allocate", "matrixdata.h", 490, "(m_data) || cva::detail::assertMessage(\"Matrix data must be allocated on exit.\")");
}

{
  __assert_rtn("allocate", "matrixdata.h", 479, "(!m_data) || cva::detail::assertMessage(\"No matrix data must be allocated.\")");
}

void cva::SVD<cva::Matrix<double,0u,0u,false>,true>::decomposeRectangular<cva::Matrix<double,0u,0u,false>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_2("MatrixMultExpr", "matrixmultexpr.h", a3, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
}

void cva::SVD<cva::Matrix<double,0u,0u,false>,true>::decomposeDirect<0u,0u>()
{
  __assert_rtn("decomposeDirect", "matrixsvd.h", 433, "(info == 0) || cva::detail::assertMessage(\"gesvd() query workspace size failed!\")");
}

void cva::SVD<cva::Matrix<double,0u,0u,false>,true>::S()
{
  __assert_rtn("VectorAsDiagonalExpr", "vectorasdiagexpr.h", 211, "(std::min(rows, cols) <= vector.elements()) || cva::detail::assertMessage(\"The matrix can't be in both dimensions larger than its diagonal.\")");
}

void cva::assign<false,false,cva::Matrix<double,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<double,0u,0u,false> const>,cva::Matrix<double,0u,0u,false>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("assert_equal_size", "matrixfun.h", a3, "(lhs.rows() == rhs.rows() && lhs.columns() == rhs.columns()) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
}

void cva::assign<false,false,cva::Matrix<double,0u,0u,false>,cva::MatrixTransposeExpr<cva::Matrix<double,0u,0u,false>>,cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<double,0u,1u,false>,0u,0u>>>()
{
  __assert_rtn("assert_in_bounds", "matrixmixin.h", 2252, "((row + nRows <= mixed().rows()) && (col + nCols <= mixed().columns())) || cva::detail::assertMessage(\"Index out of bounds!\")");
}

void cva::detail::assignNoAlias<cva::Matrix<double,0u,0u,false>,cva::MatrixBinaryExpr<cva::MatrixSubExpr<cva::MatrixTransposeExpr<cva::Matrix<double,0u,0u,false>> const,0u,0u>,cva::MatrixRepeatExpr<cva::MatrixTransposeExpr<cva::MatrixDiagonalExpr<cva::DiagonalMatrixInverseExpr<cva::VectorAsDiagonalExpr<cva::Matrix<double,0u,1u,false>,0u,0u>> const> const>,0u,1u>,cva::detail::MulOp>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1("assert_in_bounds", "matrixmixin.h", a3, "((row < mixed().rows()) && (col < mixed().columns())) || cva::detail::assertMessage(\"Index out of bounds!\")");
}

{
  OUTLINED_FUNCTION_3("operator()", "matrixsubexpr.h", a3, "(row < rows() && column < columns()) || cva::detail::assertMessage(\"Out of range index being used on submatrix expression.\")");
}

uint64_t sub_221652EA4()
{
  return MEMORY[0x24BDCB620]();
}

uint64_t sub_221652EB0()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_221652EBC()
{
  return MEMORY[0x24BDCC7C0]();
}

uint64_t sub_221652EC8()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_221652ED4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_221652EE0()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_221652EEC()
{
  return MEMORY[0x24BDCD848]();
}

uint64_t sub_221652EF8()
{
  return MEMORY[0x24BDCD860]();
}

uint64_t sub_221652F04()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_221652F10()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_221652F1C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_221652F28()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_221652F34()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_221652F40()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_221652F4C()
{
  return MEMORY[0x24BDCDE98]();
}

uint64_t sub_221652F58()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_221652F64()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_221652F70()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_221652F7C()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t _s17MeasureFoundation16MeasurementEventV4time0B04DateVvpfi_0()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_221652F94()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_221652FA0()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_221652FAC()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_221652FB8()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t _s17MeasureFoundation11WorldAnchorC10identifier0B04UUIDVvpfi_0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_221652FD0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_221652FDC()
{
  return MEMORY[0x24BDCEAC8]();
}

uint64_t sub_221652FE8()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_221652FF4()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_221653000()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_22165300C()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_221653018()
{
  return MEMORY[0x24BDB9CD0]();
}

uint64_t sub_221653024()
{
  return MEMORY[0x24BDB9F38]();
}

uint64_t sub_221653030()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_22165303C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_221653048()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_221653054()
{
  return MEMORY[0x24BEE5548]();
}

uint64_t sub_221653060()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_22165306C()
{
  return MEMORY[0x24BEE01A8]();
}

uint64_t sub_221653078()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t _s17MeasureFoundation10ObjectPoolC7objects33_8B01F5F47CB49D64DA54EB87E4B4A93DLLShyxGvpfi_0()
{
  return MEMORY[0x24BEE01C0]();
}

uint64_t sub_221653090()
{
  return MEMORY[0x24BEE0228]();
}

uint64_t sub_22165309C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2216530A8()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2216530B4()
{
  return MEMORY[0x24BEE0278]();
}

uint64_t sub_2216530C0()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_2216530CC()
{
  return MEMORY[0x24BEE0458]();
}

uint64_t sub_2216530D8()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_2216530E4()
{
  return MEMORY[0x24BEE0490]();
}

uint64_t sub_2216530F0()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_2216530FC()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_221653108()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_221653114()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_221653120()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_22165312C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_221653138()
{
  return MEMORY[0x24BEE07D8]();
}

uint64_t sub_221653144()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_221653150()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_22165315C()
{
  return MEMORY[0x24BEE0878]();
}

uint64_t sub_221653168()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_221653174()
{
  return MEMORY[0x24BEE0998]();
}

uint64_t sub_221653180()
{
  return MEMORY[0x24BEE09B0]();
}

uint64_t sub_22165318C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_221653198()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_2216531A4()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2216531B0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2216531BC()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_2216531C8()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_2216531D4()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_2216531E0()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_2216531EC()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_2216531F8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_221653204()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_221653210()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22165321C()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_221653228()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_221653234()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_221653240()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_22165324C()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_221653258()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_221653264()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_221653270()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_22165327C()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_221653288()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_221653294()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_2216532A0()
{
  return MEMORY[0x24BEE0E48]();
}

uint64_t sub_2216532AC()
{
  return MEMORY[0x24BEE0E50]();
}

uint64_t sub_2216532B8()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_2216532C4()
{
  return MEMORY[0x24BEE0E90]();
}

uint64_t sub_2216532D0()
{
  return MEMORY[0x24BEE0EB0]();
}

uint64_t sub_2216532DC()
{
  return MEMORY[0x24BEE0EB8]();
}

uint64_t sub_2216532E8()
{
  return MEMORY[0x24BEE0EE0]();
}

uint64_t sub_2216532F4()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_221653300()
{
  return MEMORY[0x24BEE1048]();
}

uint64_t sub_22165330C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_221653318()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_221653324()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_221653330()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_22165333C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_221653348()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_221653354()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_221653360()
{
  return MEMORY[0x24BEE1150]();
}

uint64_t sub_22165336C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_221653378()
{
  return MEMORY[0x24BEE1178]();
}

uint64_t sub_221653384()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_221653390()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_22165339C()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_2216533A8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2216533B4()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_2216533C0()
{
  return MEMORY[0x24BEE11F0]();
}

uint64_t sub_2216533CC()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_2216533D8()
{
  return MEMORY[0x24BEE1208]();
}

uint64_t sub_2216533E4()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_2216533F0()
{
  return MEMORY[0x24BEE1240]();
}

uint64_t sub_2216533FC()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_221653408()
{
  return MEMORY[0x24BEE1278]();
}

uint64_t sub_221653414()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_221653420()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_22165342C()
{
  return MEMORY[0x24BEE14C8]();
}

uint64_t sub_221653438()
{
  return MEMORY[0x24BEE15A0]();
}

uint64_t sub_221653444()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_221653450()
{
  return MEMORY[0x24BEE1608]();
}

uint64_t sub_22165345C()
{
  return MEMORY[0x24BEE1628]();
}

uint64_t sub_221653468()
{
  return MEMORY[0x24BEE1648]();
}

uint64_t sub_221653474()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_221653480()
{
  return MEMORY[0x24BEE16D0]();
}

uint64_t sub_22165348C()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_221653498()
{
  return MEMORY[0x24BEE17F8]();
}

uint64_t sub_2216534A4()
{
  return MEMORY[0x24BEE1870]();
}

uint64_t sub_2216534B0()
{
  return MEMORY[0x24BEE1878]();
}

uint64_t sub_2216534BC()
{
  return MEMORY[0x24BEE1880]();
}

uint64_t sub_2216534C8()
{
  return MEMORY[0x24BEE1888]();
}

uint64_t sub_2216534D4()
{
  return MEMORY[0x24BEE1890]();
}

uint64_t sub_2216534E0()
{
  return MEMORY[0x24BEE1898]();
}

uint64_t sub_2216534EC()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_2216534F8()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_221653504()
{
  return MEMORY[0x24BEE1900]();
}

uint64_t sub_221653510()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_22165351C()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_221653528()
{
  return MEMORY[0x24BEE1950]();
}

uint64_t sub_221653534()
{
  return MEMORY[0x24BEE1978]();
}

uint64_t sub_221653540()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_22165354C()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_221653558()
{
  return MEMORY[0x24BEE19E8]();
}

uint64_t sub_221653564()
{
  return MEMORY[0x24BEE1A00]();
}

uint64_t sub_221653570()
{
  return MEMORY[0x24BEE1A18]();
}

uint64_t sub_22165357C()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_221653588()
{
  return MEMORY[0x24BEE1A30]();
}

uint64_t sub_221653594()
{
  return MEMORY[0x24BEE1A38]();
}

uint64_t sub_2216535A0()
{
  return MEMORY[0x24BEE1A48]();
}

uint64_t sub_2216535AC()
{
  return MEMORY[0x24BEE1A68]();
}

uint64_t sub_2216535B8()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_2216535C4()
{
  return MEMORY[0x24BEE5E70]();
}

uint64_t sub_2216535D0()
{
  return MEMORY[0x24BEE5E88]();
}

uint64_t sub_2216535DC()
{
  return MEMORY[0x24BEE5E90]();
}

uint64_t sub_2216535E8()
{
  return MEMORY[0x24BEE5E98]();
}

uint64_t sub_2216535F4()
{
  return MEMORY[0x24BEE5EA0]();
}

uint64_t sub_221653600()
{
  return MEMORY[0x24BEDF2A8]();
}

uint64_t sub_22165360C()
{
  return MEMORY[0x24BDBD780]();
}

uint64_t sub_221653618()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_221653624()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_221653630()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_22165363C()
{
  return MEMORY[0x24BEE79B8]();
}

uint64_t sub_221653648()
{
  return MEMORY[0x24BEDF308]();
}

uint64_t sub_221653654()
{
  return MEMORY[0x24BEDF318]();
}

uint64_t sub_221653660()
{
  return MEMORY[0x24BEE5740]();
}

uint64_t sub_22165366C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_221653678()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_221653684()
{
  return MEMORY[0x24BEE5EA8]();
}

uint64_t sub_221653690()
{
  return MEMORY[0x24BEE5918]();
}

uint64_t sub_22165369C()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_2216536A8()
{
  return MEMORY[0x24BDD0150]();
}

uint64_t sub_2216536B4()
{
  return MEMORY[0x24BDD0158]();
}

uint64_t sub_2216536C0()
{
  return MEMORY[0x24BEDF350]();
}

uint64_t sub_2216536CC()
{
  return MEMORY[0x24BEDF358]();
}

uint64_t sub_2216536D8()
{
  return MEMORY[0x24BEDF368]();
}

uint64_t sub_2216536E4()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_2216536F0()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2216536FC()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_221653708()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_221653714()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_221653720()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_22165372C()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_221653738()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_221653744()
{
  return MEMORY[0x24BDD0608]();
}

uint64_t sub_221653750()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_22165375C()
{
  return MEMORY[0x24BEE2090]();
}

uint64_t sub_221653768()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_221653774()
{
  return MEMORY[0x24BEE20B8]();
}

uint64_t sub_221653780()
{
  return MEMORY[0x24BEE2238]();
}

uint64_t sub_22165378C()
{
  return MEMORY[0x24BEE2240]();
}

uint64_t sub_221653798()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_2216537A4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2216537B0()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2216537BC()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_2216537C8()
{
  return MEMORY[0x24BEE22F8]();
}

uint64_t sub_2216537D4()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_2216537E0()
{
  return MEMORY[0x24BEE2308]();
}

uint64_t sub_2216537EC()
{
  return MEMORY[0x24BEE2318]();
}

uint64_t sub_2216537F8()
{
  return MEMORY[0x24BEE2320]();
}

uint64_t sub_221653804()
{
  return MEMORY[0x24BEE2328]();
}

uint64_t sub_221653810()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_22165381C()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_221653828()
{
  return MEMORY[0x24BEE2348]();
}

uint64_t sub_221653834()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_221653840()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_22165384C()
{
  return MEMORY[0x24BEE2368]();
}

uint64_t sub_221653858()
{
  return MEMORY[0x24BEE2370]();
}

uint64_t sub_221653864()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_221653870()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_22165387C()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_221653888()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_221653894()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2216538A0()
{
  return MEMORY[0x24BEE2588]();
}

uint64_t sub_2216538AC()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_2216538B8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2216538C4()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2216538D0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2216538DC()
{
  return MEMORY[0x24BEE28C0]();
}

uint64_t sub_2216538E8()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2216538F4()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_221653900()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_22165390C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_221653918()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_221653924()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_221653930()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_22165393C()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_221653948()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_221653954()
{
  return MEMORY[0x24BEE2B80]();
}

uint64_t sub_221653960()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_22165396C()
{
  return MEMORY[0x24BEE2C28]();
}

uint64_t sub_221653978()
{
  return MEMORY[0x24BEE2E88]();
}

uint64_t sub_221653984()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_221653990()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_22165399C()
{
  return MEMORY[0x24BEE2F68]();
}

uint64_t sub_2216539A8()
{
  return MEMORY[0x24BEE2F70]();
}

uint64_t sub_2216539B4()
{
  return MEMORY[0x24BEE2F88]();
}

uint64_t sub_2216539C0()
{
  return MEMORY[0x24BEE2F90]();
}

uint64_t sub_2216539CC()
{
  return MEMORY[0x24BEE2F98]();
}

uint64_t sub_2216539D8()
{
  return MEMORY[0x24BEE2FA0]();
}

uint64_t sub_2216539E4()
{
  return MEMORY[0x24BEE2FB0]();
}

uint64_t sub_2216539F0()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2216539FC()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_221653A08()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_221653A14()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_221653A20()
{
  return MEMORY[0x24BEE30D0]();
}

uint64_t sub_221653A2C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_221653A38()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_221653A44()
{
  return MEMORY[0x24BEE3368]();
}

uint64_t sub_221653A50()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_221653A5C()
{
  return MEMORY[0x24BEE3440]();
}

uint64_t sub_221653A68()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_221653A74()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_221653A80()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_221653A8C()
{
  return MEMORY[0x24BEE34B8]();
}

uint64_t sub_221653A98()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_221653AA4()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_221653AB0()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_221653ABC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_221653AC8()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_221653AD4()
{
  return MEMORY[0x24BEE3888]();
}

uint64_t sub_221653AE0()
{
  return MEMORY[0x24BEE38A0]();
}

uint64_t sub_221653AEC()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_221653AF8()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t sub_221653B04()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_221653B10()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_221653B1C()
{
  return MEMORY[0x24BEE3D90]();
}

uint64_t sub_221653B28()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_221653B34()
{
  return MEMORY[0x24BEE3DC0]();
}

uint64_t sub_221653B40()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t sub_221653B4C()
{
  return MEMORY[0x24BEE3E90]();
}

uint64_t sub_221653B58()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_221653B64()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_221653B70()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_221653B7C()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_221653B88()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_221653B94()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_221653BA0()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_221653BAC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_221653BB8()
{
  return MEMORY[0x24BEE4358]();
}

uint64_t sub_221653BC4()
{
  return MEMORY[0x24BEE43D0]();
}

uint64_t sub_221653BD0()
{
  return MEMORY[0x24BEE43D8]();
}

uint64_t sub_221653BDC()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_221653BE8()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_221653BF4()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_221653C00()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_221653C0C()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t ARCameraFieldOfViewFromIntrinsics()
{
  return MEMORY[0x24BDFD7F0]();
}

uint64_t ARCameraImageToViewTransform()
{
  return MEMORY[0x24BDFD7F8]();
}

uint64_t ARCameraToDisplayRotation()
{
  return MEMORY[0x24BDFD800]();
}

uint64_t ARViewToCameraImageTransform()
{
  return MEMORY[0x24BDFD908]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8C0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8F8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x24BDBD968](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x24BDBD988]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB80]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

CGPoint CGPointApplyAffineTransform(CGPoint point, CGAffineTransform *t)
{
  double v2;
  double v3;
  CGPoint result;

  MEMORY[0x24BDBEF90](t, (__n128)point, *(__n128 *)&point.y);
  result.y = v3;
  result.x = v2;
  return result;
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x24BDC51F8](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x24BDC5200](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x24BDC5210](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5250](allocator, width, height, *(_QWORD *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5258](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDC5288](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC5290](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC5298](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52B8](pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D8](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52F0](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8B50](properties);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x24BDD8B80](buffer);
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDD8BA8](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerElement(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8BC0](buffer);
}

size_t IOSurfaceGetBytesPerElementOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8BC8](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8BD0](buffer);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8BE0](buffer, planeIndex);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C48](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8C58](buffer, planeIndex);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8CD0](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8CE0](buffer, planeIndex);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8D08](buffer, *(_QWORD *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8DD0](buffer, *(_QWORD *)&options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

SCNMatrix4 *__cdecl SCNMatrix4MakeRotation(SCNMatrix4 *__return_ptr retstr, float angle, float x, float y, float z)
{
  return (SCNMatrix4 *)MEMORY[0x24BDE82D8](retstr, angle, x, y, z);
}

SCNMatrix4 *__cdecl SCNMatrix4Mult(SCNMatrix4 *__return_ptr retstr, SCNMatrix4 *a, SCNMatrix4 *b)
{
  return (SCNMatrix4 *)MEMORY[0x24BDE82E0](retstr, a, b);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x24BEBE698]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x24BDF9168](allocator, pixelTransferSessionOut);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x24BDF9178](session, sourceBuffer, destinationBuffer);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t cva::Logger::logInCategory()
{
  return MEMORY[0x24BE1A240]();
}

uint64_t cva::Logger::instance(cva::Logger *this)
{
  return MEMORY[0x24BE1A250](this);
}

uint64_t cva::VecLib<double>::gemm()
{
  return off_24E721FD8();
}

uint64_t cva::vecLib::gesvd<double>()
{
  return MEMORY[0x24BE1A268]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  simd_float3x3 result;

  MEMORY[0x24BDAC820]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  simd_float4x4 result;

  MEMORY[0x24BDAC828]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x24BEE4B28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

float acosf(float a1)
{
  float result;

  MEMORY[0x24BDAD110](a1);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

float atanf(float a1)
{
  float result;

  MEMORY[0x24BDAD230](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

float cosf(float a1)
{
  float result;

  MEMORY[0x24BDADBE8](a1);
  return result;
}

uint64_t dispatch_benchmark()
{
  return MEMORY[0x24BDADD08]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

double drand48(void)
{
  double result;

  MEMORY[0x24BDAE0B0]();
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

uint64_t lroundf(float a1)
{
  return MEMORY[0x24BDAEB18](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x24BDAED80](memptr, alignment, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x24BDAF478](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x24BEE4C48]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x24BEE4C50]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x24BEE4F98]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x24BEE4FA0]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x24BEE4FA8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x24BEE4FF0]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x24BEE4FF8]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x24BEE5000]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

int uname(utsname *a1)
{
  return MEMORY[0x24BDB02A8](a1);
}

vImage_Error vImageConvert_PlanarFToBGRX8888(const vImage_Buffer *blue, const vImage_Buffer *green, const vImage_Buffer *red, Pixel_8 alpha, const vImage_Buffer *dest, const Pixel_FFFF maxFloat, const Pixel_FFFF minFloat, vImage_Flags flags)
{
  return MEMORY[0x24BDB37C8](blue, green, red, alpha, dest, maxFloat, minFloat, *(_QWORD *)&flags);
}

vImage_Error vImageConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const int16_t *kernel, uint32_t kernel_height, uint32_t kernel_width, int32_t divisor, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB3898](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A10](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_ARGBFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A20](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A60](src, dest, tempBuffer, *(_QWORD *)&flags);
}


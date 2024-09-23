float32x2_t sub_22755B16C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int32x2_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  float32x4_t *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  float32x4_t v18;
  __int128 v19;
  float32x4_t v20;
  float32x4_t v21;
  int32x4_t v22;
  float32x2_t v23;
  float32x2_t v24;
  float32x4_t v25;
  float32x2_t v26;
  float32x4_t v28;
  int32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  __int128 v32;

  v2 = type metadata accessor for SpatialTextBlock();
  MEMORY[0x24BDAC7A8](v2, v3, v4, v5, v6);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a1 + 16);
  if (v12)
  {
    v13 = *(int *)(v7 + 20);
    v14 = (float32x4_t *)&v11[*(int *)(v7 + 36)];
    v15 = a1 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    v16 = *(_QWORD *)(v8 + 72);
    swift_bridgeObjectRetain();
    LODWORD(v17) = 0;
    v32 = v17;
    v31 = 0u;
    do
    {
      sub_22730DEEC(v15, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for SpatialTextBlock);
      v18 = vmulq_lane_f32(*(float32x4_t *)&v11[v13], *(float32x2_t *)&v11[v13], 1);
      v19 = v32;
      *(float *)&v19 = *(float *)&v32 + v18.f32[0];
      v32 = v19;
      v28 = *v14;
      v29 = (int32x4_t)v14[1];
      v30 = v18;
      sub_22730DFB0((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for SpatialTextBlock);
      v20 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v29, v29), (int8x16_t)v29, 0xCuLL), vnegq_f32(v28)), (float32x4_t)v29, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v28, (int32x4_t)v28), (int8x16_t)v28, 0xCuLL));
      v21 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v20, (int32x4_t)v20), (int8x16_t)v20, 0xCuLL);
      v22 = (int32x4_t)vmulq_f32(v20, v20);
      v22.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v22.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v22, 2), *(float32x2_t *)v22.i8)).u32[0];
      v23 = vrsqrte_f32((float32x2_t)v22.u32[0]);
      v24 = vmul_f32(v23, vrsqrts_f32((float32x2_t)v22.u32[0], vmul_f32(v23, v23)));
      v25 = vmulq_n_f32(v21, vmul_f32(v24, vrsqrts_f32((float32x2_t)v22.u32[0], vmul_f32(v24, v24))).f32[0]);
      *(float *)v22.i32 = vmuls_lane_f32(v30.f32[0], v25, 2);
      *(float32x2_t *)v25.f32 = vadd_f32(*(float32x2_t *)v31.f32, vmul_n_f32(*(float32x2_t *)v25.f32, v30.f32[0]));
      v25.i64[1] = COERCE_UNSIGNED_INT(v31.f32[2] + *(float *)v22.i32);
      v31 = v25;
      v15 += v16;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
    v26 = *(float32x2_t *)v31.f32;
    v9 = (int32x2_t)v32;
  }
  else
  {
    v9.i32[0] = 0;
    v26 = 0;
  }
  return vdiv_f32(v26, (float32x2_t)vdup_lane_s32(v9, 0));
}

unint64_t sub_22755B32C@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>, float32x4_t a3@<Q0>, float a4@<S1>)
{
  unint64_t v4;
  int64_t v6;
  uint64_t v7;
  float *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  float32x4_t v13;
  float32x4_t v14;
  unint64_t v15;
  unint64_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float *v19;
  float v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  float32x4_t v24;
  float *v26;
  float *v27;

  v4 = result;
  v6 = *(_QWORD *)(result + 16);
  if (v6 == 1)
  {
    v7 = *(_QWORD *)(result + 32);
    *(_QWORD *)(a2 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5C88);
    *(_QWORD *)(a2 + 32) = sub_22755F2EC();
    *(_QWORD *)a2 = v7;
    return swift_bridgeObjectRetain();
  }
  if (!v6)
  {
    *(_QWORD *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    return result;
  }
  v26 = (float *)MEMORY[0x24BEE4AF8];
  sub_227324B70(0, v6, 0);
  v9 = v26;
  v10 = (uint64_t *)(v4 + 32);
  do
  {
    v11 = *v10;
    v12 = swift_bridgeObjectRetain();
    *(float32x2_t *)v13.f32 = sub_22755B010(v12);
    v14 = v13;
    v26 = v9;
    v16 = *((_QWORD *)v9 + 2);
    v15 = *((_QWORD *)v9 + 3);
    if (v16 >= v15 >> 1)
    {
      v24 = v13;
      sub_227324B70(v15 > 1, v16 + 1, 1);
      v14 = v24;
      v9 = v26;
    }
    v17 = vsubq_f32(a3, v14);
    v18 = vmulq_f32(v17, v17);
    *((_QWORD *)v9 + 2) = v16 + 1;
    v19 = &v9[4 * v16];
    v19[8] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2), vaddq_f32(v18, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 1))).f32[0]);
    *((_QWORD *)v19 + 5) = v11;
    ++v10;
    --v6;
  }
  while (v6);
  v26 = v9;
  swift_retain();
  sub_22755BFE0((_QWORD **)&v26);
  swift_release();
  v27 = v26;
  if (!*((_QWORD *)v26 + 2))
  {
    __break(1u);
    goto LABEL_15;
  }
  v20 = v26[8];
  v21 = *((_QWORD *)v26 + 5);
  swift_bridgeObjectRetain();
  sub_2273D5CEC(0, 1);
  if (!*((_QWORD *)v27 + 2))
  {
LABEL_15:
    __break(1u);
    result = swift_release();
    __break(1u);
    return result;
  }
  v22 = *((_QWORD *)v27 + 5);
  swift_bridgeObjectRetain();
  sub_2273D5CEC(0, 1);
  swift_bridgeObjectRelease();
  v23 = sub_22755DB98(v22, v21);
  swift_bridgeObjectRelease();
  if ((float)(v23 / v20) >= a4)
  {
    *(_QWORD *)(a2 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5C88);
    result = sub_22755F2EC();
    *(_QWORD *)(a2 + 32) = result;
    *(_QWORD *)a2 = v21;
  }
  else
  {
    *(_QWORD *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22755B590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[2] = a4;
  v5[3] = a5;
  sub_22758E49C();
  v5[4] = sub_22758E490();
  sub_22758E460();
  return swift_task_switch();
}

uint64_t sub_22755B5FC()
{
  uint64_t v0;
  void *v1;
  char *v2;
  uint64_t v3;
  id v4;
  char *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v1 = *(void **)(v0 + 24);
  v2 = *(char **)(v0 + 16);
  swift_release();
  objc_msgSend(v1, sel_timestamp);
  *(_QWORD *)&v2[OBJC_IVAR____TtC16MagnifierSupport17AppViewController_lastDetectedTextCheckTime] = v3;
  *(_BYTE *)(*(_QWORD *)&v2[OBJC_IVAR____TtC16MagnifierSupport17AppViewController_pointAndSpeakService]
           + OBJC_IVAR____TtC16MagnifierSupport23MAGPointAndSpeakService_providedTextTooCloseFeedback) = 0;
  v4 = objc_msgSend(v1, sel_capturedImage);
  v5 = v2;
  v6 = v1;
  v7 = v4;
  sub_22731DBA4(MEMORY[0x24BEE4AF8]);
  v8 = objc_allocWithZone(MEMORY[0x24BDF9C28]);
  type metadata accessor for VNImageOption(0);
  sub_22755DF28();
  v9 = (void *)sub_22758E10C();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_initWithCVPixelBuffer_orientation_options_, v7, 6, v9);

  v11 = sub_2273C6860(v10, 1);
  v12 = *(void **)(v0 + 16);
  v13 = *(void **)(v0 + 24);
  v14 = v11;
  sub_22755B7C0(v11, (uint64_t)v12, v13);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22755B7C0(void *a1, uint64_t a2, void *a3)
{
  id v6;
  uint64_t v7;
  _QWORD *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v13;
  id v14;
  _QWORD *v15[5];

  if (a1)
  {
    v6 = a1;
    v7 = detectTextBlocks(forDocument:)(v6);
    v8 = (_QWORD *)sub_22755DF70(v7);
    swift_bridgeObjectRelease();
    v15[3] = &type metadata for MFFeatureFlags;
    v15[4] = (_QWORD *)sub_22735E01C();
    LOBYTE(v15[0]) = 0;
    v9 = sub_22758CB4C();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v15);
    if ((v9 & 1) != 0)
    {
      v10 = sub_22755E5A8(v8, a3);
      swift_bridgeObjectRelease();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5C58);
      v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_227593AB0;
      v15[0] = v8;
      swift_bridgeObjectRetain();
      sub_22755C048(v15);
      swift_bridgeObjectRelease();
      *(_QWORD **)(v10 + 32) = v15[0];
    }
    v13 = *(void **)(a2 + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_cachedDetectedTextDocument);
    *(_QWORD *)(a2 + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_cachedDetectedTextDocument) = a1;
    v14 = v6;

    *(_QWORD *)(a2 + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_cachedDetectedTextGroups) = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_22755B970(v10);

    return swift_bridgeObjectRelease();
  }
  else
  {
    v11 = *(void **)(a2 + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_cachedDetectedTextDocument);
    *(_QWORD *)(a2 + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_cachedDetectedTextDocument) = 0;

    *(_QWORD *)(a2 + OBJC_IVAR____TtC16MagnifierSupport17AppViewController_cachedDetectedTextGroups) = MEMORY[0x24BEE4AF8];
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_22755B970(uint64_t a1)
{
  char *v1;
  char *v2;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  uint64_t *v38;
  void *v39;
  void *v40;
  char v41;
  uint64_t v43;
  char v44[2];
  char v45;

  v2 = v1;
  v4 = (int *)type metadata accessor for MAGOutputEvent(0);
  MEMORY[0x24BDAC7A8](v4, v5, v6, v7, v8);
  v10 = &v44[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 3];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B9E30);
  MEMORY[0x24BDAC7A8](v11, v12, v13, v14, v15);
  v17 = &v44[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0) - 3];
  v18 = *(_QWORD *)(a1 + 16);
  if (v18)
  {
    v43 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    for (i = 0; i != v18; ++i)
    {
      v20 = swift_bridgeObjectRetain();
      sub_2273A3F78(v20);
    }
    swift_bridgeObjectRelease();
    v21 = sub_227575E74(v43);
    swift_bridgeObjectRelease();
    sub_2273D70E4(v21, 0, v44);
    swift_bridgeObjectRelease();
    v22 = v44[0];
  }
  else
  {
    v22 = 0;
  }
  v44[1] = v22;
  sub_2273D8B00(0, &v45);
  v23 = v45;
  if (v45 != 12)
  {
    v24 = *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport17AppViewController_pointAndSpeakService];
    v25 = OBJC_IVAR____TtC16MagnifierSupport23MAGPointAndSpeakService_consecutiveFramesWithoutDeviceDirectionMessage;
    v26 = *(_QWORD *)(v24
                    + OBJC_IVAR____TtC16MagnifierSupport23MAGPointAndSpeakService_consecutiveFramesWithoutDeviceDirectionMessage);
    if (v26 < 61)
    {
      v32 = v26 + 1;
    }
    else
    {
      v27 = sub_22758E4C0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v17, 1, 1, v27);
      sub_22758E49C();
      v28 = v1;
      v29 = sub_22758E490();
      v30 = swift_allocObject();
      v31 = MEMORY[0x24BEE6930];
      *(_QWORD *)(v30 + 16) = v29;
      *(_QWORD *)(v30 + 24) = v31;
      *(_QWORD *)(v30 + 32) = v28;
      *(_BYTE *)(v30 + 40) = v23;
      sub_227367B10((uint64_t)v17, (uint64_t)&unk_2558DE6A8, v30);
      swift_release();
      v32 = 0;
    }
    *(_QWORD *)(v24 + v25) = v32;
  }
  *(_QWORD *)&v10[v4[5]] = a1;
  type metadata accessor for MAGOutputEvent.EventType(0);
  swift_storeEnumTagMultiPayload();
  swift_bridgeObjectRetain();
  sub_22758C978();
  v10[v4[6]] = 1;
  v10[v4[7]] = 0;
  v33 = MAGOutputEvent.displayContent.getter();
  if (!v34)
    return sub_22730DFB0((uint64_t)v10, type metadata accessor for MAGOutputEvent);
  v35 = v33;
  v36 = v34;
  if (v33)
    v37 = 0;
  else
    v37 = v34 == 0xE000000000000000;
  if (!v37 && (sub_22758EE50() & 1) == 0)
  {
    v38 = (uint64_t *)&v2[OBJC_IVAR____TtC16MagnifierSupport17AppViewController_currentTextAnnouncement];
    swift_bridgeObjectRetain();
    v39 = (void *)sub_22758E1B4();
    swift_bridgeObjectRelease();
    v40 = (void *)sub_22758E1B4();
    v41 = sub_22752A278(v40, 360, 0.35);

    if ((v41 & 1) != 0)
    {
      sub_2273C9264((uint64_t)v10);
      *v38 = v35;
      v38[1] = v36;
      swift_bridgeObjectRelease();
      return sub_22730DFB0((uint64_t)v10, type metadata accessor for MAGOutputEvent);
    }
  }
  sub_22730DFB0((uint64_t)v10, type metadata accessor for MAGOutputEvent);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22755BCC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;

  *(_BYTE *)(v5 + 48) = a5;
  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = type metadata accessor for MAGOutputEvent(0);
  *(_QWORD *)(v5 + 32) = swift_task_alloc();
  sub_22758E49C();
  *(_QWORD *)(v5 + 40) = sub_22758E490();
  sub_22758E460();
  return swift_task_switch();
}

uint64_t sub_22755BD58()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  int *v3;
  uint64_t ObjCClassFromMetadata;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_BYTE *)(v0 + 48);
  v3 = *(int **)(v0 + 24);
  swift_release();
  sub_22739E614();
  type metadata accessor for MAGUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v6 = (void *)sub_22758E1B4();
  v7 = (void *)sub_22758E1B4();
  v8 = objc_msgSend(v5, sel_localizedStringForKey_value_table_, v6, 0, v7);

  v9 = sub_22758E1E4();
  v11 = v10;

  swift_bridgeObjectRelease();
  v12 = sub_2274E51C0();
  v13 = sub_2274E5324();
  sub_2274E2410(v9, v11, v12, v13);

  swift_bridgeObjectRelease();
  *(_BYTE *)(v1 + v3[5]) = v2;
  type metadata accessor for MAGOutputEvent.EventType(0);
  swift_storeEnumTagMultiPayload();
  sub_22758C978();
  *(_BYTE *)(v1 + v3[6]) = 1;
  *(_BYTE *)(v1 + v3[7]) = 0;
  sub_2273C9264(v1);
  sub_22730DFB0(v1, type metadata accessor for MAGOutputEvent);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22755BF28@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *a2;
  if (*(_QWORD *)(*a2 + 16))
  {
    result = sub_2274DE8E4(result);
    if ((v5 & 1) != 0)
    {
      v6 = result;
      v7 = *(_QWORD *)(v4 + 56);
      v8 = type metadata accessor for DetectedTextBlock();
      return sub_22730DEEC(v7 + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 72) * v6, a3, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_22755BF9C(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)(a3 + 16) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_22755BFBC(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_22755BFE0(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (_QWORD *)sub_227467530(v2);
  v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  result = sub_22755C0C8(v5);
  *a1 = v2;
  return result;
}

void sub_22755C048(_QWORD **a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5[2];

  v2 = *(_QWORD *)(type metadata accessor for DetectedTextBlock() - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = (_QWORD *)sub_227467544(v3);
  v4 = v3[2];
  v5[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v5[1] = v4;
  sub_22755C7B4(v5);
  *a1 = v3;
}

uint64_t sub_22755C0C8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  float v15;
  uint64_t v16;
  float v17;
  float *v18;
  float v19;
  float v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  float v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  unint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  uint64_t v59;
  char v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  float v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  float *__dst;

  v3 = a1[1];
  result = sub_22758EE20();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_137;
    if ((unint64_t)v3 >= 2)
    {
      v84 = *a1;
      v85 = -1;
      v86 = 1;
      v87 = *a1;
      do
      {
        v88 = *(float *)(v84 + 16 * v86);
        v89 = v85;
        v90 = v87;
        do
        {
          if (v88 >= *(float *)v90)
            break;
          if (!v84)
            goto LABEL_141;
          v91 = *(_QWORD *)(v90 + 24);
          *(_OWORD *)(v90 + 16) = *(_OWORD *)v90;
          *(float *)v90 = v88;
          *(_QWORD *)(v90 + 8) = v91;
          v90 -= 16;
        }
        while (!__CFADD__(v89++, 1));
        ++v86;
        v87 += 16;
        --v85;
      }
      while (v86 != v3);
    }
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_146;
  v6 = result;
  v102 = a1;
  if (v3 < 2)
  {
    v9 = MEMORY[0x24BEE4AF8];
    __dst = (float *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v13 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v12 = (char *)MEMORY[0x24BEE4AF8];
LABEL_103:
      v93 = v12;
      v104 = v9;
      if (v13 >= 2)
      {
        v94 = *v102;
        do
        {
          v95 = v13 - 2;
          if (v13 < 2)
            goto LABEL_132;
          if (!v94)
            goto LABEL_145;
          v96 = v93;
          v97 = *(_QWORD *)&v93[16 * v95 + 32];
          v98 = *(_QWORD *)&v93[16 * v13 + 24];
          sub_22755D444((float *)(v94 + 16 * v97), (float *)(v94 + 16 * *(_QWORD *)&v93[16 * v13 + 16]), v94 + 16 * v98, __dst);
          if (v1)
            break;
          if (v98 < v97)
            goto LABEL_133;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v96 = sub_227467370((uint64_t)v96);
          if (v95 >= *((_QWORD *)v96 + 2))
            goto LABEL_134;
          v99 = &v96[16 * v95 + 32];
          *(_QWORD *)v99 = v97;
          *((_QWORD *)v99 + 1) = v98;
          v100 = *((_QWORD *)v96 + 2);
          if (v13 > v100)
            goto LABEL_135;
          memmove(&v96[16 * v13 + 16], &v96[16 * v13 + 32], 16 * (v100 - v13));
          v93 = v96;
          *((_QWORD *)v96 + 2) = v100 - 1;
          v13 = v100 - 1;
        }
        while (v100 > 2);
      }
LABEL_93:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v104 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v7 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5C70);
    v8 = sub_22758E418();
    *(_QWORD *)(v8 + 16) = v7;
    v104 = v8;
    __dst = (float *)(v8 + 32);
  }
  v10 = 0;
  v11 = *a1;
  v103 = *a1 + 32;
  v101 = *a1 - 16;
  v12 = (char *)MEMORY[0x24BEE4AF8];
  v105 = v6;
  v106 = v3;
  v107 = v11;
  while (1)
  {
    v14 = v10++;
    if (v10 < v3)
    {
      v15 = *(float *)(v11 + 16 * v10);
      v16 = 16 * v14;
      v17 = *(float *)(v11 + 16 * v14);
      v10 = v14 + 2;
      if (v14 + 2 < v3)
      {
        v18 = (float *)(v103 + 16 * v14);
        v19 = v15;
        while (1)
        {
          v20 = v19;
          v19 = *v18;
          if (v15 < v17 == *v18 >= v20)
            break;
          ++v10;
          v18 += 4;
          if (v3 == v10)
          {
            v10 = v3;
            break;
          }
        }
      }
      if (v15 < v17)
      {
        if (v10 < v14)
          goto LABEL_138;
        if (v14 < v10)
        {
          v21 = 16 * v10;
          v22 = v10;
          v23 = v14;
          do
          {
            if (v23 != --v22)
            {
              if (!v11)
                goto LABEL_144;
              v24 = v11 + v21;
              v25 = *(_DWORD *)(v11 + v16);
              v26 = *(_QWORD *)(v11 + v16 + 8);
              *(_OWORD *)(v11 + v16) = *(_OWORD *)(v11 + v21 - 16);
              *(_DWORD *)(v24 - 16) = v25;
              *(_QWORD *)(v24 - 8) = v26;
            }
            ++v23;
            v21 -= 16;
            v16 += 16;
          }
          while (v23 < v22);
        }
      }
    }
    if (v10 >= v3)
      goto LABEL_46;
    if (__OFSUB__(v10, v14))
      goto LABEL_136;
    if (v10 - v14 >= v6)
      goto LABEL_46;
    v27 = v14 + v6;
    if (__OFADD__(v14, v6))
      goto LABEL_139;
    if (v27 >= v3)
      v27 = v3;
    if (v27 < v14)
      break;
    if (v10 != v27)
    {
      v28 = v101 + 16 * v10;
      do
      {
        v29 = *(float *)(v11 + 16 * v10);
        v30 = v14;
        v31 = v28;
        do
        {
          if (v29 >= *(float *)v31)
            break;
          if (!v11)
            goto LABEL_142;
          v32 = *(_QWORD *)(v31 + 24);
          *(_OWORD *)(v31 + 16) = *(_OWORD *)v31;
          *(float *)v31 = v29;
          *(_QWORD *)(v31 + 8) = v32;
          v31 -= 16;
          ++v30;
        }
        while (v10 != v30);
        ++v10;
        v28 += 16;
      }
      while (v10 != v27);
      v10 = v27;
    }
LABEL_46:
    if (v10 < v14)
      goto LABEL_131;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v12 = sub_227466C8C(0, *((_QWORD *)v12 + 2) + 1, 1, v12);
    v34 = *((_QWORD *)v12 + 2);
    v33 = *((_QWORD *)v12 + 3);
    v13 = v34 + 1;
    v11 = v107;
    if (v34 >= v33 >> 1)
    {
      v83 = sub_227466C8C((char *)(v33 > 1), v34 + 1, 1, v12);
      v11 = v107;
      v12 = v83;
    }
    *((_QWORD *)v12 + 2) = v13;
    v35 = v12 + 32;
    v36 = &v12[16 * v34 + 32];
    *(_QWORD *)v36 = v14;
    *((_QWORD *)v36 + 1) = v10;
    if (v34)
    {
      while (1)
      {
        v37 = v13 - 1;
        if (v13 >= 4)
        {
          v42 = &v35[16 * v13];
          v43 = *((_QWORD *)v42 - 8);
          v44 = *((_QWORD *)v42 - 7);
          v48 = __OFSUB__(v44, v43);
          v45 = v44 - v43;
          if (v48)
            goto LABEL_120;
          v47 = *((_QWORD *)v42 - 6);
          v46 = *((_QWORD *)v42 - 5);
          v48 = __OFSUB__(v46, v47);
          v40 = v46 - v47;
          v41 = v48;
          if (v48)
            goto LABEL_121;
          v49 = v13 - 2;
          v50 = &v35[16 * v13 - 32];
          v52 = *(_QWORD *)v50;
          v51 = *((_QWORD *)v50 + 1);
          v48 = __OFSUB__(v51, v52);
          v53 = v51 - v52;
          if (v48)
            goto LABEL_123;
          v48 = __OFADD__(v40, v53);
          v54 = v40 + v53;
          if (v48)
            goto LABEL_126;
          if (v54 >= v45)
          {
            v72 = &v35[16 * v37];
            v74 = *(_QWORD *)v72;
            v73 = *((_QWORD *)v72 + 1);
            v48 = __OFSUB__(v73, v74);
            v75 = v73 - v74;
            if (v48)
              goto LABEL_130;
            v65 = v40 < v75;
            goto LABEL_83;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v66 = *((_QWORD *)v12 + 4);
            v67 = *((_QWORD *)v12 + 5);
            v48 = __OFSUB__(v67, v66);
            v59 = v67 - v66;
            v60 = v48;
            goto LABEL_77;
          }
          v39 = *((_QWORD *)v12 + 4);
          v38 = *((_QWORD *)v12 + 5);
          v48 = __OFSUB__(v38, v39);
          v40 = v38 - v39;
          v41 = v48;
        }
        if ((v41 & 1) != 0)
          goto LABEL_122;
        v49 = v13 - 2;
        v55 = &v35[16 * v13 - 32];
        v57 = *(_QWORD *)v55;
        v56 = *((_QWORD *)v55 + 1);
        v58 = __OFSUB__(v56, v57);
        v59 = v56 - v57;
        v60 = v58;
        if (v58)
          goto LABEL_125;
        v61 = &v35[16 * v37];
        v63 = *(_QWORD *)v61;
        v62 = *((_QWORD *)v61 + 1);
        v48 = __OFSUB__(v62, v63);
        v64 = v62 - v63;
        if (v48)
          goto LABEL_128;
        if (__OFADD__(v59, v64))
          goto LABEL_129;
        if (v59 + v64 >= v40)
        {
          v65 = v40 < v64;
LABEL_83:
          if (v65)
            v37 = v49;
          goto LABEL_85;
        }
LABEL_77:
        if ((v60 & 1) != 0)
          goto LABEL_124;
        v68 = &v35[16 * v37];
        v70 = *(_QWORD *)v68;
        v69 = *((_QWORD *)v68 + 1);
        v48 = __OFSUB__(v69, v70);
        v71 = v69 - v70;
        if (v48)
          goto LABEL_127;
        if (v71 < v59)
          goto LABEL_15;
LABEL_85:
        v76 = v37 - 1;
        if (v37 - 1 >= v13)
        {
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
          goto LABEL_140;
        }
        if (!v11)
          goto LABEL_143;
        v77 = v12;
        v78 = &v35[16 * v76];
        v79 = *(_QWORD *)v78;
        v80 = &v35[16 * v37];
        v81 = *((_QWORD *)v80 + 1);
        sub_22755D444((float *)(v11 + 16 * *(_QWORD *)v78), (float *)(v11 + 16 * *(_QWORD *)v80), v11 + 16 * v81, __dst);
        if (v1)
          goto LABEL_93;
        if (v81 < v79)
          goto LABEL_117;
        if (v37 > *((_QWORD *)v77 + 2))
          goto LABEL_118;
        *(_QWORD *)v78 = v79;
        *(_QWORD *)&v35[16 * v76 + 8] = v81;
        v82 = *((_QWORD *)v77 + 2);
        if (v37 >= v82)
          goto LABEL_119;
        v12 = v77;
        v13 = v82 - 1;
        memmove(&v35[16 * v37], v80 + 16, 16 * (v82 - 1 - v37));
        *((_QWORD *)v77 + 2) = v82 - 1;
        v11 = v107;
        if (v82 <= 2)
          goto LABEL_15;
      }
    }
    v13 = 1;
LABEL_15:
    v6 = v105;
    v3 = v106;
    if (v10 >= v106)
    {
      v9 = v104;
      goto LABEL_103;
    }
  }
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  result = sub_22758ECB8();
  __break(1u);
  return result;
}

void sub_22755C7B4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _BOOL4 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  double v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  char *v77;
  char *v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  unint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  BOOL v100;
  uint64_t v101;
  char v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  BOOL v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  char *v120;
  char *v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  char *v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  unint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;

  v150 = type metadata accessor for DetectedTextBlock();
  v142 = *(_QWORD *)(v150 - 8);
  MEMORY[0x24BDAC7A8](v150, v3, v4, v5, v6);
  v139 = (uint64_t)&v135 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8, v9, v10, v11, v12);
  v151 = (uint64_t)&v135 - v13;
  MEMORY[0x24BDAC7A8](v14, v15, v16, v17, v18);
  v148 = (uint64_t)&v135 - v19;
  MEMORY[0x24BDAC7A8](v20, v21, v22, v23, v24);
  v147 = (uint64_t)&v135 - v25;
  v26 = a1[1];
  v27 = sub_22758EE20();
  if (v27 >= v26)
  {
    if (v26 < 0)
      goto LABEL_138;
    if (v26)
      sub_22755D1D8(0, v26, 1, a1);
    return;
  }
  if (v26 >= 0)
    v28 = v26;
  else
    v28 = v26 + 1;
  if (v26 < -1)
    goto LABEL_146;
  v149 = a1;
  v136 = v27;
  v143 = v1;
  if (v26 < 2)
  {
    v32 = (char *)MEMORY[0x24BEE4AF8];
    v141 = MEMORY[0x24BEE4AF8]
         + ((*(unsigned __int8 *)(v142 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v142 + 80));
    v135 = MEMORY[0x24BEE4AF8];
    if (v26 != 1)
    {
      v34 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_104:
      v127 = v32;
      if (v34 >= 2)
      {
        v128 = *v149;
        do
        {
          v129 = v34 - 2;
          if (v34 < 2)
            goto LABEL_133;
          if (!v128)
            goto LABEL_145;
          v130 = *(_QWORD *)&v127[16 * v129 + 32];
          v131 = *(_QWORD *)&v127[16 * v34 + 24];
          v132 = v143;
          sub_22755D6BC(v128 + *(_QWORD *)(v142 + 72) * v130, v128 + *(_QWORD *)(v142 + 72) * *(_QWORD *)&v127[16 * v34 + 16], v128 + *(_QWORD *)(v142 + 72) * v131, v141);
          v143 = v132;
          if (v132)
            break;
          if (v131 < v130)
            goto LABEL_134;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v127 = sub_227467370((uint64_t)v127);
          if (v129 >= *((_QWORD *)v127 + 2))
            goto LABEL_135;
          v133 = &v127[16 * v129 + 32];
          *(_QWORD *)v133 = v130;
          *((_QWORD *)v133 + 1) = v131;
          v134 = *((_QWORD *)v127 + 2);
          if (v34 > v134)
            goto LABEL_136;
          memmove(&v127[16 * v34 + 16], &v127[16 * v34 + 32], 16 * (v134 - v34));
          *((_QWORD *)v127 + 2) = v134 - 1;
          v34 = v134 - 1;
        }
        while (v134 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v135 + 16) = 0;
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    v29 = v28 >> 1;
    v30 = sub_22758E418();
    *(_QWORD *)(v30 + 16) = v29;
    v31 = *(unsigned __int8 *)(v142 + 80);
    v135 = v30;
    v141 = v30 + ((v31 + 32) & ~v31);
  }
  v33 = 0;
  v145 = v148 + 8;
  v146 = v147 + 8;
  v32 = (char *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    v35 = v33;
    v36 = v33 + 1;
    if (v33 + 1 >= v26)
    {
      ++v33;
      v37 = v149;
    }
    else
    {
      v37 = v149;
      v38 = *v149;
      v39 = *(_QWORD *)(v142 + 72);
      v40 = v147;
      sub_22730DEEC(*v149 + v39 * v36, v147, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
      v41 = v38 + v39 * v35;
      v140 = v35;
      v42 = v148;
      sub_22730DEEC(v41, v148, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
      v43 = *(int *)(v150 + 24);
      v44 = 1.0 - *(double *)(v146 + v43);
      v45 = 1.0 - *(double *)(v145 + v43);
      v46 = v42;
      v35 = v140;
      sub_22730DFB0(v46, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
      sub_22730DFB0(v40, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
      v33 = v35 + 2;
      v144 = v38;
      v152 = v39;
      if (v35 + 2 >= v26)
      {
        v55 = v39;
        if (v44 >= v45)
          goto LABEL_39;
      }
      else
      {
        v137 = v32;
        v47 = v39 * v36;
        v48 = v38;
        v49 = v39 * v33;
        while (1)
        {
          v50 = v26;
          v51 = v33;
          v52 = v147;
          sub_22730DEEC(v48 + v49, v147, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
          v53 = v148;
          sub_22730DEEC(v48 + v47, v148, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
          v54 = 1.0 - *(double *)(v146 + *(int *)(v150 + 24)) >= 1.0 - *(double *)(v145 + *(int *)(v150 + 24));
          sub_22730DFB0(v53, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
          sub_22730DFB0(v52, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
          if (v44 < v45 == v54)
            break;
          v33 = v51 + 1;
          v55 = v152;
          v48 += v152;
          v26 = v50;
          if (v50 == v51 + 1)
          {
            v33 = v50;
            v37 = v149;
            v32 = v137;
            v35 = v140;
            if (v44 < v45)
              goto LABEL_26;
            goto LABEL_39;
          }
        }
        v37 = v149;
        v32 = v137;
        v33 = v51;
        v35 = v140;
        v26 = v50;
        v55 = v152;
        if (v44 >= v45)
          goto LABEL_39;
      }
LABEL_26:
      if (v33 < v35)
        goto LABEL_139;
      if (v35 < v33)
      {
        v137 = v32;
        v138 = v26;
        v56 = 0;
        v57 = v55 * (v33 - 1);
        v58 = v33 * v55;
        v59 = v35 * v55;
        do
        {
          if (v35 != v33 + v56 - 1)
          {
            v60 = v144;
            if (!v144)
              goto LABEL_144;
            v61 = v144 + v59;
            sub_22730DFEC(v144 + v59, v139, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
            if (v59 < v57 || v61 >= v60 + v58)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v59 != v57)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            sub_22730DFEC(v139, v60 + v57, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
            v37 = v149;
            v55 = v152;
          }
          ++v35;
          --v56;
          v57 -= v55;
          v58 -= v55;
          v59 += v55;
        }
        while (v35 < v33 + v56);
        v32 = v137;
        v26 = v138;
        v35 = v140;
      }
    }
LABEL_39:
    if (v33 >= v26)
      goto LABEL_56;
    if (__OFSUB__(v33, v35))
      goto LABEL_137;
    if (v33 - v35 >= v136)
      goto LABEL_56;
    if (__OFADD__(v35, v136))
      goto LABEL_140;
    v62 = v35 + v136 >= v26 ? v26 : v35 + v136;
    if (v62 < v35)
      break;
    if (v33 != v62)
    {
      v137 = v32;
      v138 = v62;
      v63 = *(_QWORD *)(v142 + 72);
      v152 = v63 * (v33 - 1);
      v144 = v63;
      v64 = v33 * v63;
      v140 = v35;
      do
      {
        v65 = 0;
        do
        {
          v66 = *v37;
          v67 = v147;
          sub_22730DEEC(v64 + v65 + *v37, v147, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
          v68 = v152 + v65 + v66;
          v69 = v148;
          sub_22730DEEC(v68, v148, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
          v70 = *(int *)(v150 + 24);
          v71 = 1.0 - *(double *)(v146 + v70);
          v72 = 1.0 - *(double *)(v145 + v70);
          sub_22730DFB0(v69, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
          sub_22730DFB0(v67, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
          if (v71 >= v72)
            break;
          v73 = *v37;
          if (!*v37)
            goto LABEL_142;
          v74 = v73 + v152 + v65;
          sub_22730DFEC(v73 + v64 + v65, v151, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
          swift_arrayInitWithTakeFrontToBack();
          sub_22730DFEC(v151, v74, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
          v65 -= v144;
          ++v35;
          v37 = v149;
        }
        while (v33 != v35);
        ++v33;
        v152 += v144;
        v64 += v144;
        v35 = v140;
      }
      while (v33 != v138);
      v33 = v138;
      v32 = v137;
    }
LABEL_56:
    if (v33 < v35)
      goto LABEL_132;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v32 = sub_227466C8C(0, *((_QWORD *)v32 + 2) + 1, 1, v32);
    v76 = *((_QWORD *)v32 + 2);
    v75 = *((_QWORD *)v32 + 3);
    v34 = v76 + 1;
    if (v76 >= v75 >> 1)
      v32 = sub_227466C8C((char *)(v75 > 1), v76 + 1, 1, v32);
    *((_QWORD *)v32 + 2) = v34;
    v77 = v32 + 32;
    v78 = &v32[16 * v76 + 32];
    *(_QWORD *)v78 = v35;
    *((_QWORD *)v78 + 1) = v33;
    if (v76)
    {
      while (1)
      {
        v79 = v34 - 1;
        if (v34 >= 4)
        {
          v84 = &v77[16 * v34];
          v85 = *((_QWORD *)v84 - 8);
          v86 = *((_QWORD *)v84 - 7);
          v90 = __OFSUB__(v86, v85);
          v87 = v86 - v85;
          if (v90)
            goto LABEL_121;
          v89 = *((_QWORD *)v84 - 6);
          v88 = *((_QWORD *)v84 - 5);
          v90 = __OFSUB__(v88, v89);
          v82 = v88 - v89;
          v83 = v90;
          if (v90)
            goto LABEL_122;
          v91 = v34 - 2;
          v92 = &v77[16 * v34 - 32];
          v94 = *(_QWORD *)v92;
          v93 = *((_QWORD *)v92 + 1);
          v90 = __OFSUB__(v93, v94);
          v95 = v93 - v94;
          if (v90)
            goto LABEL_124;
          v90 = __OFADD__(v82, v95);
          v96 = v82 + v95;
          if (v90)
            goto LABEL_127;
          if (v96 >= v87)
          {
            v114 = &v77[16 * v79];
            v116 = *(_QWORD *)v114;
            v115 = *((_QWORD *)v114 + 1);
            v90 = __OFSUB__(v115, v116);
            v117 = v115 - v116;
            if (v90)
              goto LABEL_131;
            v107 = v82 < v117;
            goto LABEL_93;
          }
        }
        else
        {
          if (v34 != 3)
          {
            v108 = *((_QWORD *)v32 + 4);
            v109 = *((_QWORD *)v32 + 5);
            v90 = __OFSUB__(v109, v108);
            v101 = v109 - v108;
            v102 = v90;
            goto LABEL_87;
          }
          v81 = *((_QWORD *)v32 + 4);
          v80 = *((_QWORD *)v32 + 5);
          v90 = __OFSUB__(v80, v81);
          v82 = v80 - v81;
          v83 = v90;
        }
        if ((v83 & 1) != 0)
          goto LABEL_123;
        v91 = v34 - 2;
        v97 = &v77[16 * v34 - 32];
        v99 = *(_QWORD *)v97;
        v98 = *((_QWORD *)v97 + 1);
        v100 = __OFSUB__(v98, v99);
        v101 = v98 - v99;
        v102 = v100;
        if (v100)
          goto LABEL_126;
        v103 = &v77[16 * v79];
        v105 = *(_QWORD *)v103;
        v104 = *((_QWORD *)v103 + 1);
        v90 = __OFSUB__(v104, v105);
        v106 = v104 - v105;
        if (v90)
          goto LABEL_129;
        if (__OFADD__(v101, v106))
          goto LABEL_130;
        if (v101 + v106 >= v82)
        {
          v107 = v82 < v106;
LABEL_93:
          if (v107)
            v79 = v91;
          goto LABEL_95;
        }
LABEL_87:
        if ((v102 & 1) != 0)
          goto LABEL_125;
        v110 = &v77[16 * v79];
        v112 = *(_QWORD *)v110;
        v111 = *((_QWORD *)v110 + 1);
        v90 = __OFSUB__(v111, v112);
        v113 = v111 - v112;
        if (v90)
          goto LABEL_128;
        if (v113 < v101)
          goto LABEL_14;
LABEL_95:
        v118 = v79 - 1;
        if (v79 - 1 >= v34)
        {
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
          goto LABEL_141;
        }
        if (!*v149)
          goto LABEL_143;
        v119 = v33;
        v120 = v32;
        v121 = &v77[16 * v118];
        v122 = *(_QWORD *)v121;
        v123 = &v77[16 * v79];
        v124 = *((_QWORD *)v123 + 1);
        v125 = v143;
        sub_22755D6BC(*v149 + *(_QWORD *)(v142 + 72) * *(_QWORD *)v121, *v149 + *(_QWORD *)(v142 + 72) * *(_QWORD *)v123, *v149 + *(_QWORD *)(v142 + 72) * v124, v141);
        v143 = v125;
        if (v125)
          goto LABEL_115;
        if (v124 < v122)
          goto LABEL_118;
        if (v79 > *((_QWORD *)v120 + 2))
          goto LABEL_119;
        *(_QWORD *)v121 = v122;
        *(_QWORD *)&v77[16 * v118 + 8] = v124;
        v126 = *((_QWORD *)v120 + 2);
        if (v79 >= v126)
          goto LABEL_120;
        v32 = v120;
        v34 = v126 - 1;
        memmove(&v77[16 * v79], v123 + 16, 16 * (v126 - 1 - v79));
        *((_QWORD *)v120 + 2) = v126 - 1;
        v33 = v119;
        if (v126 <= 2)
          goto LABEL_14;
      }
    }
    v34 = 1;
LABEL_14:
    v26 = v149[1];
    if (v33 >= v26)
      goto LABEL_104;
  }
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  sub_22758ECB8();
  __break(1u);
}

void sub_22755D1D8(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v46 = a1;
  v53 = type metadata accessor for DetectedTextBlock();
  MEMORY[0x24BDAC7A8](v53, v7, v8, v9, v10);
  v54 = (uint64_t)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12, v13, v14, v15, v16);
  v50 = (uint64_t)&v44 - v17;
  MEMORY[0x24BDAC7A8](v18, v19, v20, v21, v22);
  v49 = (uint64_t)&v44 - v24;
  v52 = a3;
  v45 = a2;
  if (a3 != a2)
  {
    v25 = *(_QWORD *)(v23 + 72);
    v47 = v50 + 8;
    v48 = v49 + 8;
    v55 = v25 * (v52 - 1);
    v51 = v25;
    v26 = v25 * v52;
LABEL_5:
    v27 = 0;
    v28 = v46;
    while (1)
    {
      v29 = *a4;
      v30 = v26 + v27 + *a4;
      v31 = v26;
      v32 = v49;
      sub_22730DEEC(v30, v49, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
      v33 = v55 + v27 + v29;
      v34 = a4;
      v35 = v50;
      sub_22730DEEC(v33, v50, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
      v36 = *(int *)(v53 + 24);
      v37 = 1.0 - *(double *)(v48 + v36);
      v38 = 1.0 - *(double *)(v47 + v36);
      v39 = v35;
      a4 = v34;
      sub_22730DFB0(v39, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
      v40 = v32;
      v26 = v31;
      sub_22730DFB0(v40, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
      if (v37 >= v38)
      {
LABEL_4:
        v55 += v51;
        v26 += v51;
        if (++v52 == v45)
          return;
        goto LABEL_5;
      }
      v41 = *v34;
      if (!*v34)
        break;
      v42 = v41 + v31 + v27;
      v43 = v41 + v55 + v27;
      sub_22730DFEC(v42, v54, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
      swift_arrayInitWithTakeFrontToBack();
      sub_22730DFEC(v54, v43, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
      v27 -= v51;
      if (v52 == ++v28)
        goto LABEL_4;
    }
    __break(1u);
  }
}

uint64_t sub_22755D444(float *__src, float *a2, unint64_t a3, float *__dst)
{
  float *v4;
  float *v6;
  float *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  float *v14;
  float *v15;
  float *v16;
  float *v17;
  float *v18;
  float *v19;
  float v20;
  uint64_t result;
  float *v22;
  float *v23;
  float *v24;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = (char *)a2 - (char *)__src;
  v9 = (char *)a2 - (char *)__src + 15;
  if ((char *)a2 - (char *)__src >= 0)
    v9 = (char *)a2 - (char *)__src;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 4;
  v24 = __src;
  v23 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[4 * v13] <= __dst)
        memmove(__dst, a2, 16 * v13);
      v16 = &v4[4 * v13];
      v22 = v16;
      v24 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        v17 = (float *)(a3 - 16);
        v18 = v6;
        while (1)
        {
          v19 = v17 + 4;
          v20 = *(v18 - 4);
          v18 -= 4;
          if (*(v16 - 4) >= v20)
          {
            v22 = v16 - 4;
            if (v19 < v16 || v17 >= v16 || v19 != v16)
              *(_OWORD *)v17 = *((_OWORD *)v16 - 1);
            v18 = v6;
            v16 -= 4;
            if (v6 <= v7)
              goto LABEL_42;
          }
          else
          {
            if (v19 != v6 || v17 >= v6)
              *(_OWORD *)v17 = *(_OWORD *)v18;
            v24 = v18;
            if (v18 <= v7)
              goto LABEL_42;
          }
          v17 -= 4;
          v6 = v18;
          if (v16 <= v4)
            goto LABEL_42;
        }
      }
      goto LABEL_42;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[4 * v10] <= __dst)
      memmove(__dst, __src, 16 * v10);
    v14 = &v4[4 * v10];
    v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        if (*v6 >= *v4)
        {
          if (v7 != v4)
            *(_OWORD *)v7 = *(_OWORD *)v4;
          v4 += 4;
          v23 = v4;
          v15 = v6;
        }
        else
        {
          v15 = v6 + 4;
          if (v7 < v6 || v7 >= v15 || v7 != v6)
            *(_OWORD *)v7 = *(_OWORD *)v6;
        }
        v7 += 4;
        if (v4 >= v14)
          break;
        v6 = v15;
      }
      while ((unint64_t)v15 < a3);
      v24 = v7;
    }
LABEL_42:
    sub_227466F98((void **)&v24, (const void **)&v23, &v22);
    return 1;
  }
  result = sub_22758ED24();
  __break(1u);
  return result;
}

uint64_t sub_22755D6BC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v36;
  unint64_t v38;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  unint64_t v47;
  uint64_t result;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;

  v55 = type metadata accessor for DetectedTextBlock();
  MEMORY[0x24BDAC7A8](v55, v8, v9, v10, v11);
  v54 = (uint64_t)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13, v14, v15, v16, v17);
  v19 = (char *)&v50 - v18;
  v21 = *(_QWORD *)(v20 + 72);
  if (!v21)
  {
    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  if (a2 - a1 == 0x8000000000000000 && v21 == -1)
    goto LABEL_71;
  v22 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v21 == -1)
    goto LABEL_72;
  v23 = (uint64_t)(a2 - a1) / v21;
  v57 = a4;
  v58 = a1;
  v24 = v22 / v21;
  if (v23 >= v22 / v21)
  {
    if ((v24 & 0x8000000000000000) == 0)
    {
      v26 = v24 * v21;
      if (a4 < a2 || a2 + v26 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v38 = a4 + v26;
      v56 = a4 + v26;
      v58 = a2;
      v53 = (char *)a1;
      if (v26 >= 1 && a1 < a2)
      {
        v40 = -v21;
        v51 = v54 + 8;
        v52 = v19 + 8;
        v41 = v54;
        do
        {
          v42 = a3 + v40;
          sub_22730DEEC(v38 + v40, (uint64_t)v19, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
          v43 = a2 + v40;
          sub_22730DEEC(a2 + v40, v41, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
          v44 = *(int *)(v55 + 24);
          v45 = 1.0 - *(double *)&v52[v44];
          v46 = 1.0 - *(double *)(v51 + v44);
          sub_22730DFB0(v41, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
          sub_22730DFB0((uint64_t)v19, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
          if (v45 >= v46)
          {
            v47 = v56;
            v56 += v40;
            if (a3 < v47 || v42 >= v47)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v47)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v43 = a2;
          }
          else
          {
            if (a3 < a2 || v42 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v58 += v40;
          }
          v38 = v56;
          if (v56 <= a4)
            break;
          a2 = v43;
          a3 += v40;
        }
        while (v43 > (unint64_t)v53);
      }
      goto LABEL_69;
    }
  }
  else if ((v23 & 0x8000000000000000) == 0)
  {
    v25 = v23 * v21;
    if (a4 < a1 || a1 + v25 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v27 = a4 + v25;
    v56 = a4 + v25;
    if (v25 >= 1 && a2 < a3)
    {
      v52 = (char *)(v54 + 8);
      v53 = v19 + 8;
      do
      {
        sub_22730DEEC(a2, (uint64_t)v19, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
        v29 = v54;
        sub_22730DEEC(a4, v54, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
        v30 = *(int *)(v55 + 24);
        v31 = 1.0 - *(double *)&v53[v30];
        v32 = 1.0 - *(double *)&v52[v30];
        sub_22730DFB0(v29, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
        sub_22730DFB0((uint64_t)v19, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
        v33 = v58;
        if (v31 >= v32)
        {
          v36 = v57 + v21;
          if (v58 < v57 || v58 >= v36)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v58 != v57)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v57 = v36;
          v34 = a2;
        }
        else
        {
          v34 = a2 + v21;
          if (v58 < a2 || v58 >= v34)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v58 == a2)
          {
            v33 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        v58 = v33 + v21;
        a4 = v57;
        if (v57 >= v27)
          break;
        a2 = v34;
      }
      while (v34 < a3);
    }
LABEL_69:
    sub_227467258(&v58, &v57, (uint64_t *)&v56);
    return 1;
  }
LABEL_73:
  result = sub_22758ED24();
  __break(1u);
  return result;
}

float sub_22755DB98(uint64_t a1, uint64_t a2)
{
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float v7;
  float32x2_t v8;
  float32x2_t v9;
  float v10;
  float32x4_t v11;
  float v12;
  float32x4_t v14;
  float32x2_t v15;
  float32x4_t v16;
  float32x4_t v17;

  *(float32x2_t *)v4.f32 = sub_22755B010(a2);
  v17 = v4;
  *(float32x2_t *)v5.f32 = sub_22755B010(a1);
  v14 = v5;
  v16 = vsubq_f32(v5, v17);
  *(float32x2_t *)v6.f32 = sub_22755B16C(a2);
  v7 = vmulq_f32(v16, v6).f32[0];
  v8.i32[1] = v14.i32[1];
  v8.i32[0] = vextq_s8((int8x16_t)v14, (int8x16_t)v14, 8uLL).u32[0];
  v15 = v8;
  v9.i32[1] = v17.i32[1];
  v9.i32[0] = vextq_s8((int8x16_t)v17, (int8x16_t)v17, 8uLL).u32[0];
  v6.i32[0] = vextq_s8((int8x16_t)v6, (int8x16_t)v6, 8uLL).u32[0];
  *(float32x2_t *)v6.f32 = vmul_f32(vsub_f32(v8, v9), *(float32x2_t *)v6.f32);
  v10 = fabsf(v6.f32[0] + (float)(v7 + v6.f32[1]));
  *(float32x2_t *)v16.f32 = v9;
  *(float32x2_t *)v11.f32 = sub_22755B16C(a1);
  v12 = vmulq_f32(vsubq_f32(v17, v14), v11).f32[0];
  v11.i32[0] = vextq_s8((int8x16_t)v11, (int8x16_t)v11, 8uLL).u32[0];
  *(float32x2_t *)v11.f32 = vmul_f32(vsub_f32(*(float32x2_t *)v16.f32, v15), *(float32x2_t *)v11.f32);
  return (float)(v10 + fabsf(v11.f32[0] + (float)(v12 + v11.f32[1]))) * 0.5;
}

uint64_t sub_22755DC98(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  BOOL v10;
  uint64_t result;
  double v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _BYTE v19[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B9E30);
  MEMORY[0x24BDAC7A8](v3, v4, v5, v6, v7);
  v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_2540B87B8 != -1)
    swift_once();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22758D194();
  swift_release();
  swift_release();
  if (v19[15] != 1
    || (!*(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport17AppViewController_currentPointSpeakAnnouncement]
      ? (v10 = *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport17AppViewController_currentPointSpeakAnnouncement + 8] == 0xE000000000000000)
      : (v10 = 0),
        v10 || (result = sub_22758EE50(), (result & 1) != 0)))
  {
    result = (uint64_t)objc_msgSend(a1, sel_timestamp);
    if (v12 - *(double *)&v1[OBJC_IVAR____TtC16MagnifierSupport17AppViewController_lastDetectedTextCheckTime] > 2.0)
    {
      v13 = sub_22758E4C0();
      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 1, 1, v13);
      sub_22758E49C();
      v14 = v1;
      v15 = a1;
      v16 = sub_22758E490();
      v17 = (_QWORD *)swift_allocObject();
      v18 = MEMORY[0x24BEE6930];
      v17[2] = v16;
      v17[3] = v18;
      v17[4] = v14;
      v17[5] = v15;
      sub_227367B10((uint64_t)v9, (uint64_t)&unk_2558DE688, (uint64_t)v17);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_22755DE7C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_22755DEB0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_227344044;
  return sub_22755B590(a1, v4, v5, v7, v6);
}

unint64_t sub_22755DF28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2558D5018;
  if (!qword_2558D5018)
  {
    type metadata accessor for VNImageOption(255);
    result = MEMORY[0x2276B3C78](&unk_2275949C0, v1);
    atomic_store(result, (unint64_t *)&qword_2558D5018);
  }
  return result;
}

uint64_t sub_22755DF70(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;

  v2 = type metadata accessor for DetectedTextBlock();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4, v5, v6, v7);
  v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10, v11, v12, v13, v14);
  v16 = (char *)v25 - v15;
  v17 = MEMORY[0x24BEE4AF8];
  v27 = MEMORY[0x24BEE4AF8];
  v18 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v18)
  {
    v19 = *(unsigned __int8 *)(v3 + 80);
    v20 = *(_QWORD *)(v3 + 72);
    v25[1] = a1;
    v26 = (v19 + 32) & ~v19;
    v21 = a1 + v26;
    do
    {
      sub_22730DEEC(v21, (uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
      if (*(double *)&v16[*(int *)(v2 + 24) + 16] * *(double *)&v16[*(int *)(v2 + 24) + 24] <= 0.0009)
      {
        sub_22730DFB0((uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
      }
      else
      {
        sub_22730DFEC((uint64_t)v16, (uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_227324AEC(0, *(_QWORD *)(v17 + 16) + 1, 1);
        v17 = v27;
        v23 = *(_QWORD *)(v27 + 16);
        v22 = *(_QWORD *)(v27 + 24);
        if (v23 >= v22 >> 1)
        {
          sub_227324AEC(v22 > 1, v23 + 1, 1);
          v17 = v27;
        }
        *(_QWORD *)(v17 + 16) = v23 + 1;
        sub_22730DFEC((uint64_t)v9, v17 + v26 + v23 * v20, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
      }
      v21 += v20;
      --v18;
    }
    while (v18);
    v17 = v27;
  }
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_22755E130(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  char *v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  id v48;
  void *v49;
  __CVBuffer *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558D55A8);
  MEMORY[0x24BDAC7A8](v4, v5, v6, v7, v8);
  v10 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for SpatialTextBlock();
  v69 = *(_QWORD *)(v11 - 8);
  v70 = v11;
  MEMORY[0x24BDAC7A8](v11, v12, v13, v14, v15);
  v67 = (uint64_t)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17, v18, v19, v20, v21);
  v66 = (uint64_t)&v62 - v22;
  v23 = type metadata accessor for DetectedTextBlock();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23, v25, v26, v27, v28);
  MEMORY[0x24BDAC7A8](v29, v30, v31, v32, v33);
  v36 = (char *)&v62 - v35;
  v37 = *(_QWORD *)(a1 + 16);
  if (!v37)
    return MEMORY[0x24BEE4B00];
  v64 = v34;
  v68 = (id)objc_opt_self();
  v38 = a1 + ((*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80));
  v39 = *(_QWORD *)(v24 + 72);
  v62 = a1;
  v63 = v39;
  swift_bridgeObjectRetain();
  v40 = MEMORY[0x24BEE4B00];
  v65 = v10;
  while (1)
  {
    sub_22730DEEC(v38, (uint64_t)v36, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
    v41 = objc_msgSend(v68, sel_currentDevice);
    v42 = (char *)objc_msgSend(v41, sel_orientation);

    v72 = v38;
    if ((unint64_t)(v42 - 2) > 2)
      v43 = 1;
    else
      v43 = qword_2275A79B0[(_QWORD)(v42 - 2)];
    v44 = objc_msgSend(a2, sel_sceneDepth);
    if (!v44
      || (v45 = v44, v46 = objc_msgSend(v44, sel_depthMap), v45, !v46))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_14;
    }
    v71 = v37;
    v47 = v64;
    sub_22730DEEC((uint64_t)v36, v64, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
    v48 = objc_msgSend(a2, sel_camera);
    v49 = a2;
    v50 = (__CVBuffer *)objc_msgSend(a2, sel_capturedImage);
    v51 = v46;
    v52 = v43;
    v53 = (uint64_t)v65;
    sub_22756C324(v47, v48, v50, v51, v52, (uint64_t)v65);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v69 + 48))(v53, 1, v70) == 1)
      break;
    v54 = v66;
    sub_22730DFEC(v53, v66, (uint64_t (*)(_QWORD))type metadata accessor for SpatialTextBlock);
    v55 = v67;
    sub_22730DEEC(v54, v67, (uint64_t (*)(_QWORD))type metadata accessor for SpatialTextBlock);
    sub_22730DEEC((uint64_t)v36, v47, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v73 = v40;
    sub_2275872AC(v47, v55, isUniquelyReferenced_nonNull_native);
    v40 = v73;
    swift_bridgeObjectRelease();
    sub_22730DFB0(v55, (uint64_t (*)(_QWORD))type metadata accessor for SpatialTextBlock);

    sub_22730DFB0(v54, (uint64_t (*)(_QWORD))type metadata accessor for SpatialTextBlock);
    sub_22730DFB0((uint64_t)v36, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
    v38 = v72 + v63;
    v37 = v71 - 1;
    a2 = v49;
    if (v71 == 1)
    {
      swift_bridgeObjectRelease();
      return v40;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_22731A1A4(v53, &qword_2558D55A8);
LABEL_14:
  if (qword_2558D4AA8 != -1)
    swift_once();
  v57 = sub_22758CF9C();
  __swift_project_value_buffer(v57, (uint64_t)qword_2558D6320);
  v58 = sub_22758CF84();
  v59 = sub_22758E6DC();
  if (os_log_type_enabled(v58, v59))
  {
    v60 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v60 = 0;
    _os_log_impl(&dword_2272F4000, v58, v59, "Failed to spatialize text block", v60, 2u);
    MEMORY[0x2276B3D50](v60, -1, -1);
  }

  sub_22730DFB0((uint64_t)v36, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
  return 0;
}

uint64_t sub_22755E5A8(_QWORD *a1, void *a2)
{
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  id v59;
  float32x4_t v60;
  float32x4_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  unint64_t v72;
  unint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __n128 v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int64_t v83;
  char v84;
  char v85;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  os_log_type_t v90;
  uint8_t *v91;
  int64_t v92;
  int64_t v93;
  unint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  char v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  _QWORD *v114;
  _QWORD *v115;
  uint64_t v116;
  _QWORD **v117;
  _QWORD *v118;
  uint64_t (*v119)();
  _QWORD *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t (*v124)();
  int v125;
  char v126;
  unint64_t v127;
  uint64_t v128;
  _BOOL8 v129;
  uint64_t v130;
  char v131;
  uint64_t v132;
  char v133;
  uint64_t v134;
  uint64_t v135;
  BOOL v136;
  uint64_t v137;
  uint64_t v138;
  _QWORD *v139;
  _QWORD *v140;
  _QWORD *v141;
  _QWORD *v142;
  char *v143;
  uint64_t v144;
  char v145;
  uint64_t v146;
  unint64_t v147;
  unint64_t v148;
  _QWORD *v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t v152;
  unint64_t v153;
  uint64_t v154;
  char v155;
  uint64_t result;
  unint64_t v157;
  uint64_t v158;
  int64_t v159;
  unint64_t v160;
  char *v161;
  _QWORD *v162;
  float32x4_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  unint64_t v170;
  __int128 v171;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  _QWORD *v174[3];
  uint64_t v175;
  uint64_t v176;
  _QWORD *v177;
  unint64_t v178;

  v161 = (char *)type metadata accessor for DetectedTextBlock();
  v4 = *((_QWORD *)v161 - 1);
  MEMORY[0x24BDAC7A8](v161, v5, v6, v7, v8);
  v165 = (uint64_t)&v157 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10, v11, v12, v13, v14);
  v164 = (uint64_t)&v157 - v15;
  MEMORY[0x24BDAC7A8](v16, v17, v18, v19, v20);
  v169 = (uint64_t)&v157 - v21;
  MEMORY[0x24BDAC7A8](v22, v23, v24, v25, v26);
  v167 = (uint64_t)&v157 - v27;
  MEMORY[0x24BDAC7A8](v28, v29, v30, v31, v32);
  v166 = (uint64_t)&v157 - v33;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DE690);
  MEMORY[0x24BDAC7A8](v34, v35, v36, v37, v38);
  v168 = (uint64_t)&v157 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = type metadata accessor for SpatialTextBlock();
  v41 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40, v42, v43, v44, v45);
  v47 = (char *)&v157 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558D55A8);
  MEMORY[0x24BDAC7A8](v48, v49, v50, v51, v52);
  v54 = (char *)&v157 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (!a1[2])
    return (uint64_t)v55;
  v56 = sub_22755E130((uint64_t)a1, a2);
  if (!v56)
  {
LABEL_19:
    if (qword_2558D4AA8 == -1)
    {
LABEL_20:
      v88 = sub_22758CF9C();
      __swift_project_value_buffer(v88, (uint64_t)qword_2558D6320);
      v89 = sub_22758CF84();
      v90 = sub_22758E6C4();
      if (os_log_type_enabled(v89, v90))
      {
        v91 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v91 = 0;
        _os_log_impl(&dword_2272F4000, v89, v90, "Cannot group and sort 3D text groups. Sorting 2D text blocks instead", v91, 2u);
        MEMORY[0x2276B3D50](v91, -1, -1);
      }

      __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5C58);
      v55 = (_QWORD *)swift_allocObject();
      *((_OWORD *)v55 + 1) = xmmword_227593AB0;
      v174[0] = a1;
      swift_bridgeObjectRetain();
      sub_22755C048(v174);
      v55[4] = v174[0];
      return (uint64_t)v55;
    }
LABEL_87:
    swift_once();
    goto LABEL_20;
  }
  v178 = v56;
  v57 = swift_bridgeObjectRetain();
  v58 = sub_22756AC64(v57, 0.15);
  swift_bridgeObjectRelease();
  if (!v58)
  {
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  v177 = v55;
  v59 = objc_msgSend(a2, sel_camera);
  objc_msgSend(v59, sel_transform);
  v163 = v60;

  v61 = v163;
  v61.i32[3] = 0;
  sub_22755B32C(v58, (uint64_t)&v171, v61, 0.25);
  v158 = v41;
  v157 = v58;
  if (AssociatedTypeWitness)
  {
    sub_22731A268(&v171, (uint64_t)v174);
    v62 = v175;
    v63 = v176;
    v64 = __swift_project_boxed_opaque_existential_1(v174, v175);
    MEMORY[0x24BDAC7A8](v64, v65, v66, v67, v68);
    *(&v157 - 2) = (unint64_t)&v178;
    *(_QWORD *)&v171 = sub_22755A3D4((void (*)(char *, char *))sub_22755F2D0, (uint64_t)(&v157 - 4), v62, v161, MEMORY[0x24BEE4078], v63, MEMORY[0x24BEE40A8], v69);
    swift_bridgeObjectRetain();
    sub_22755C048((_QWORD **)&v171);
    swift_bridgeObjectRelease();
    v70 = v171;
    v71 = v177;
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v71 = sub_2273A6004(0, v71[2] + 1, 1, v71);
    v73 = v71[2];
    v72 = v71[3];
    if (v73 >= v72 >> 1)
      v71 = sub_2273A6004((_QWORD *)(v72 > 1), v73 + 1, 1, v71);
    v71[2] = v73 + 1;
    v71[v73 + 4] = v70;
    swift_release();
    v177 = v71;
    v74 = __swift_project_boxed_opaque_existential_1(v174, v175);
    v78 = MEMORY[0x24BDAC7A8](v74, v74, v75, v76, v77);
    (*(void (**)(char *, __n128))(v80 + 16))((char *)&v157 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0), v78);
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v171);
    sub_22758E340();
    a1 = 0;
    v41 = v158;
    while (1)
    {
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v171, AssociatedTypeWitness);
      sub_22758EA3C();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v54, 1, v40) == 1)
        break;
      sub_22730DFEC((uint64_t)v54, (uint64_t)v47, (uint64_t (*)(_QWORD))type metadata accessor for SpatialTextBlock);
      swift_bridgeObjectRetain();
      v83 = sub_2274DE8E4((uint64_t)v47);
      v85 = v84;
      swift_bridgeObjectRelease();
      if ((v85 & 1) != 0)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v87 = v178;
        v170 = v178;
        v178 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native)
        {
          sub_227589050();
          v87 = v170;
        }
        sub_22730DFB0(*(_QWORD *)(v87 + 48) + *(_QWORD *)(v41 + 72) * v83, (uint64_t (*)(_QWORD))type metadata accessor for SpatialTextBlock);
        v82 = v168;
        sub_22730DFEC(*(_QWORD *)(v87 + 56) + *(_QWORD *)(v4 + 72) * v83, v168, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
        sub_227337FE0(v83, v87);
        v178 = v87;
        swift_bridgeObjectRelease();
        v81 = 0;
      }
      else
      {
        v81 = 1;
        v82 = v168;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t, char *))(v4 + 56))(v82, v81, 1, v161);
      sub_22731A1A4(v82, &qword_2558DE690);
      sub_22730DFB0((uint64_t)v47, (uint64_t (*)(_QWORD))type metadata accessor for SpatialTextBlock);
    }
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v171);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v174);
    v55 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v58 = v157;
  }
  else
  {
    a1 = 0;
  }
  v92 = *(_QWORD *)(v58 + 16);
  v168 = v4;
  if (v92)
  {
    v162 = 0;
    v174[0] = v55;
    v159 = v92;
    sub_227324B44(0, v92, 0);
    v93 = v159;
    v94 = v58;
    v95 = 0;
    v96 = v174[0];
    v160 = v94 + 32;
    do
    {
      v97 = *(_QWORD *)(v160 + 8 * v95);
      v98 = *(_QWORD *)(v97 + 16);
      if (v98)
      {
        v163.i64[0] = (uint64_t)v96;
        v99 = v97 + ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80));
        v100 = *(_QWORD *)(v41 + 72);
        swift_bridgeObjectRetain();
        do
        {
          v102 = v178;
          if (*(_QWORD *)(v178 + 16))
          {
            v103 = sub_2274DE8E4(v99);
            if ((v104 & 1) != 0)
            {
              v105 = *(_QWORD *)(v4 + 72);
              v106 = *(_QWORD *)(v102 + 56) + v105 * v103;
              v107 = v167;
              sub_22730DEEC(v106, v167, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
              v108 = v107;
              v109 = v166;
              sub_22730DFEC(v108, v166, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
              sub_22730DFEC(v109, v169, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v55 = (_QWORD *)sub_2273A5210(0, v55[2] + 1, 1, (unint64_t)v55);
              v111 = v55[2];
              v110 = v55[3];
              if (v111 >= v110 >> 1)
                v55 = (_QWORD *)sub_2273A5210(v110 > 1, v111 + 1, 1, (unint64_t)v55);
              v55[2] = v111 + 1;
              v101 = (uint64_t)v55
                   + ((*(unsigned __int8 *)(v168 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v168 + 80))
                   + v111 * v105;
              v4 = v168;
              sub_22730DFEC(v169, v101, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
            }
          }
          v99 += v100;
          --v98;
        }
        while (v98);
        swift_bridgeObjectRelease();
        v41 = v158;
        v96 = (_QWORD *)v163.i64[0];
        v93 = v159;
      }
      v174[0] = v96;
      v113 = v96[2];
      v112 = v96[3];
      if (v113 >= v112 >> 1)
      {
        sub_227324B44(v112 > 1, v113 + 1, 1);
        v93 = v159;
        v96 = v174[0];
      }
      ++v95;
      v96[2] = v113 + 1;
      v96[v113 + 4] = v55;
      v55 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    while (v95 != v93);
    v114 = v96;
    swift_bridgeObjectRelease();
    v115 = v114;
    a1 = v162;
  }
  else
  {
    swift_bridgeObjectRelease();
    v115 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v116 = v115[2];
  v163.i64[0] = (uint64_t)v115;
  if (v116)
  {
    v117 = (_QWORD **)(v115 + 4);
    v118 = (_QWORD *)MEMORY[0x24BEE4B00];
    v119 = type metadata accessor for DetectedTextBlock;
    while (1)
    {
      v174[0] = *v117;
      swift_bridgeObjectRetain_n();
      sub_22755C048(v174);
      if (a1)
        goto LABEL_88;
      swift_bridgeObjectRelease();
      v120 = v174[0];
      if (v174[0][2])
      {
        v121 = v164;
        sub_22730DEEC((uint64_t)v174[0] + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)), v164, (uint64_t (*)(_QWORD))v119);
        v122 = v121;
        v123 = v165;
        v124 = v119;
        sub_22730DEEC(v122, v165, (uint64_t (*)(_QWORD))v119);
        v125 = swift_isUniquelyReferenced_nonNull_native();
        v174[0] = v118;
        v127 = sub_2274DE734(v123);
        v128 = v118[2];
        v129 = (v126 & 1) == 0;
        v130 = v128 + v129;
        if (__OFADD__(v128, v129))
          goto LABEL_85;
        v131 = v126;
        if (v118[3] >= v130)
        {
          if ((v125 & 1) == 0)
            sub_2275892E8();
        }
        else
        {
          sub_227584188(v130, v125);
          v132 = sub_2274DE734(v165);
          if ((v131 & 1) != (v133 & 1))
            goto LABEL_89;
          v127 = v132;
        }
        v4 = v168;
        v162 = 0;
        v118 = v174[0];
        if ((v131 & 1) != 0)
        {
          v134 = v174[0][7];
          swift_bridgeObjectRelease();
          *(_QWORD *)(v134 + 8 * v127) = v120;
          v119 = v124;
        }
        else
        {
          v174[0][(v127 >> 6) + 8] |= 1 << v127;
          v119 = v124;
          sub_22730DEEC(v165, v118[6] + *(_QWORD *)(v4 + 72) * v127, (uint64_t (*)(_QWORD))v124);
          *(_QWORD *)(v118[7] + 8 * v127) = v120;
          v135 = v118[2];
          v136 = __OFADD__(v135, 1);
          v137 = v135 + 1;
          if (v136)
            goto LABEL_86;
          v118[2] = v137;
        }
        swift_bridgeObjectRelease();
        sub_22730DFB0(v165, (uint64_t (*)(_QWORD))v119);
        sub_22730DFB0(v164, (uint64_t (*)(_QWORD))v119);
        a1 = v162;
      }
      else
      {
        swift_release();
      }
      ++v117;
      if (!--v116)
        goto LABEL_60;
    }
  }
  v118 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_60:
  swift_bridgeObjectRelease();
  v138 = swift_bridgeObjectRetain();
  v139 = (_QWORD *)sub_2273A66F4(v138);
  swift_bridgeObjectRelease();
  v174[0] = v139;
  swift_bridgeObjectRetain();
  sub_22755C048(v174);
  if (!a1)
  {
    swift_release();
    v140 = v174[0];
    a1 = (_QWORD *)v174[0][2];
    if (!a1)
    {
      swift_release();
      v142 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_70:
      sub_2273A4560((uint64_t)v142);
      v149 = v177;
      v150 = v177[2];
      if (v150)
      {
        swift_bridgeObjectRetain();
        v151 = 0;
        v55 = (_QWORD *)MEMORY[0x24BEE4AF8];
        do
        {
          v154 = v149[v151 + 4];
          if (*(_QWORD *)(v154 + 16))
          {
            swift_bridgeObjectRetain();
            v155 = swift_isUniquelyReferenced_nonNull_native();
            v174[0] = v55;
            if ((v155 & 1) == 0)
            {
              sub_227324B44(0, v55[2] + 1, 1);
              v55 = v174[0];
            }
            v153 = v55[2];
            v152 = v55[3];
            if (v153 >= v152 >> 1)
            {
              sub_227324B44(v152 > 1, v153 + 1, 1);
              v55 = v174[0];
            }
            v55[2] = v153 + 1;
            v55[v153 + 4] = v154;
          }
          ++v151;
        }
        while (v150 != v151);
        swift_bridgeObjectRelease();
      }
      else
      {
        v55 = (_QWORD *)MEMORY[0x24BEE4AF8];
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v55;
    }
    v174[0] = (_QWORD *)MEMORY[0x24BEE4AF8];
    sub_227324B44(0, (int64_t)a1, 0);
    v141 = 0;
    v142 = v174[0];
    v143 = (char *)v140 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    while (v118[2])
    {
      v144 = sub_2274DE734((uint64_t)&v143[*(_QWORD *)(v168 + 72) * (_QWORD)v141]);
      if ((v145 & 1) == 0)
        goto LABEL_84;
      v146 = *(_QWORD *)(v118[7] + 8 * v144);
      v174[0] = v142;
      v148 = v142[2];
      v147 = v142[3];
      swift_bridgeObjectRetain();
      if (v148 >= v147 >> 1)
      {
        sub_227324B44(v147 > 1, v148 + 1, 1);
        v142 = v174[0];
      }
      v141 = (_QWORD *)((char *)v141 + 1);
      v142[2] = v148 + 1;
      v142[v148 + 4] = v146;
      if (a1 == v141)
      {
        swift_release();
        goto LABEL_70;
      }
    }
    __break(1u);
LABEL_84:
    __break(1u);
LABEL_85:
    __break(1u);
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
LABEL_88:
  swift_release();
  __break(1u);
LABEL_89:
  sub_22758EEB0();
  __break(1u);
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_22755F2D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_22755BF28(a1, *(uint64_t **)(v2 + 16), a2);
}

unint64_t sub_22755F2EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2558DE698;
  if (!qword_2558DE698)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558D5C88);
    result = MEMORY[0x2276B3C78](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, &qword_2558DE698);
  }
  return result;
}

uint64_t sub_22755F338()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_22755F364(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_BYTE *)(v1 + 40);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_227319F84;
  return sub_22755BCC4(a1, v4, v5, v6, v7);
}

unint64_t static MAGImageUtils.convertToCGImage(_:)(uint64_t a1, unint64_t a2)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v4 = objc_allocWithZone(MEMORY[0x24BEBD640]);
  sub_22732459C(a1, a2);
  v5 = (void *)sub_22758C870();
  v6 = objc_msgSend(v4, sel_initWithData_, v5);
  sub_2273245E0(a1, a2);

  if (v6)
  {
    v7 = objc_msgSend(v6, sel_CGImage);
    if (v7)
    {
      a2 = (unint64_t)v7;
    }
    else
    {
      sub_2273203F0();
      swift_allocError();
      *(_QWORD *)v9 = 0xD00000000000002BLL;
      *(_QWORD *)(v9 + 8) = 0x80000002275AED10;
      *(_QWORD *)(v9 + 16) = 0;
      *(_BYTE *)(v9 + 24) = 2;
      swift_willThrow();
    }

  }
  else
  {
    sub_2273203F0();
    swift_allocError();
    *(_QWORD *)v8 = 0xD000000000000029;
    *(_QWORD *)(v8 + 8) = 0x80000002275AECE0;
    *(_QWORD *)(v8 + 16) = 0;
    *(_BYTE *)(v8 + 24) = 2;
    swift_willThrow();
  }
  return a2;
}

void static MAGImageUtils.convertToJPEGData(_:scale:orientation:)(uint64_t a1, uint64_t a2, double a3)
{
  UIImage *v3;
  NSData *v4;
  NSData *v5;
  uint64_t v6;

  v3 = (UIImage *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_initWithCGImage_scale_orientation_, a1, a2, a3);
  v4 = UIImageJPEGRepresentation(v3, 1.0);
  if (v4)
  {
    v5 = v4;
    sub_22758C87C();

  }
  else
  {
    sub_2273203F0();
    swift_allocError();
    *(_QWORD *)v6 = 0xD000000000000038;
    *(_QWORD *)(v6 + 8) = 0x80000002275AED40;
    *(_QWORD *)(v6 + 16) = 0;
    *(_BYTE *)(v6 + 24) = 2;
    swift_willThrow();

  }
}

id static MAGImageUtils.convertToImage(_:)(__CVBuffer *a1)
{
  return sub_22755FEC4(a1);
}

uint64_t MAGCVPixelBufferWrapper.__allocating_init(pixelBuffer:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

id static MAGImageUtils.convertToImage2(_:)(uint64_t a1)
{
  id v1;
  id v2;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBF660]), sel_initWithCVPixelBuffer_, a1);
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_initWithCIImage_, v1);

  return v2;
}

uint64_t static MAGImageUtils.convertToJPEGData(_:quality:)(UIImage *a1, CGFloat a2)
{
  NSData *v2;
  NSData *v3;
  uint64_t v4;
  uint64_t v6;

  v2 = UIImageJPEGRepresentation(a1, a2);
  if (v2)
  {
    v3 = v2;
    v4 = sub_22758C87C();

    return v4;
  }
  else
  {
    sub_2273203F0();
    swift_allocError();
    *(_QWORD *)v6 = 0xD000000000000038;
    *(_QWORD *)(v6 + 8) = 0x80000002275AED40;
    *(_QWORD *)(v6 + 16) = 0;
    *(_BYTE *)(v6 + 24) = 2;
    return swift_willThrow();
  }
}

uint64_t static MAGImageUtils.convertToPNGData(_:)(UIImage *a1)
{
  NSData *v1;
  NSData *v2;
  uint64_t v3;
  uint64_t v5;

  v1 = UIImagePNGRepresentation(a1);
  if (v1)
  {
    v2 = v1;
    v3 = sub_22758C87C();

    return v3;
  }
  else
  {
    sub_2273203F0();
    swift_allocError();
    *(_QWORD *)v5 = 0xD000000000000036;
    *(_QWORD *)(v5 + 8) = 0x80000002275BDE70;
    *(_QWORD *)(v5 + 16) = 0;
    *(_BYTE *)(v5 + 24) = 2;
    return swift_willThrow();
  }
}

id static MAGImageUtils.convertToImage(_:scale:)(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  if ((a4 & 1) != 0)
  {
    v10 = objc_allocWithZone(MEMORY[0x24BEBD640]);
    sub_22732459C(a1, a2);
    v8 = (void *)sub_22758C870();
    v9 = objc_msgSend(v10, sel_initWithData_, v8);
  }
  else
  {
    v7 = objc_allocWithZone(MEMORY[0x24BEBD640]);
    sub_22732459C(a1, a2);
    v8 = (void *)sub_22758C870();
    v9 = objc_msgSend(v7, sel_initWithData_scale_, v8, *(double *)&a3);
  }
  v11 = v9;
  sub_2273245E0(a1, a2);

  if (!v11)
  {
    sub_2273203F0();
    swift_allocError();
    *(_QWORD *)v12 = 0xD000000000000029;
    *(_QWORD *)(v12 + 8) = 0x80000002275AECE0;
    *(_QWORD *)(v12 + 16) = 0;
    *(_BYTE *)(v12 + 24) = 2;
    swift_willThrow();
  }
  return v11;
}

id static MAGImageUtils.convertToImage(_:scale:orientation:)(uint64_t a1, uint64_t a2, double a3)
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_initWithCGImage_scale_orientation_, a1, a2, a3);
}

id static MAGImageUtils.convertToCGImage(_:)(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(a1, sel_CGImage);
  if (!v1)
  {
    sub_2273203F0();
    swift_allocError();
    *(_QWORD *)v2 = 0xD00000000000002BLL;
    *(_QWORD *)(v2 + 8) = 0x80000002275AED10;
    *(_QWORD *)(v2 + 16) = 0;
    *(_BYTE *)(v2 + 24) = 2;
    swift_willThrow();
  }
  return v1;
}

void static MAGImageUtils.convertToPNGData(_:)(__CVBuffer *a1)
{
  uint64_t v1;
  UIImage *v2;
  UIImage *v3;
  NSData *v4;
  NSData *v5;
  uint64_t v6;

  v2 = (UIImage *)sub_22755FEC4(a1);
  if (!v1)
  {
    v3 = v2;
    v4 = UIImagePNGRepresentation(v2);
    if (v4)
    {
      v5 = v4;
      sub_22758C87C();

    }
    else
    {
      sub_2273203F0();
      swift_allocError();
      *(_QWORD *)v6 = 0xD00000000000003DLL;
      *(_QWORD *)(v6 + 8) = 0x80000002275BDEB0;
      *(_QWORD *)(v6 + 16) = 0;
      *(_BYTE *)(v6 + 24) = 2;
      swift_willThrow();
    }

  }
}

void static MAGImageUtils.convertToPixelBuffer(_:)(void *a1)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t inited;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  const __CFAllocator *v14;
  const __CFDictionary *v15;
  CVReturn v16;
  uint64_t v17;
  uint64_t v18;
  __CVBuffer *v19;
  void *BaseAddress;
  CGColorSpace *DeviceRGB;
  size_t BytesPerRow;
  CGContextRef v23;
  __CVBuffer *v24;
  CVPixelBufferRef pixelBufferOut[2];

  pixelBufferOut[1] = *(CVPixelBufferRef *)MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, sel_CGImage);
  if (!v2)
  {
    sub_2273203F0();
    swift_allocError();
    *(_QWORD *)v18 = 0xD00000000000003DLL;
    *(_QWORD *)(v18 + 8) = 0x80000002275BDEF0;
    *(_QWORD *)(v18 + 16) = 0;
    *(_BYTE *)(v18 + 24) = 2;
    swift_willThrow();
    return;
  }
  v3 = v2;
  pixelBufferOut[0] = 0;
  objc_msgSend(a1, sel_size);
  v5 = v4;
  v7 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558DE6B0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_227596540;
  v9 = (void *)*MEMORY[0x24BDC55E8];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDC55E8];
  v10 = v9;
  v11 = sub_22758E454();
  v12 = (void *)*MEMORY[0x24BDC55E0];
  *(_QWORD *)(inited + 40) = v11;
  *(_QWORD *)(inited + 48) = v12;
  v13 = v12;
  *(_QWORD *)(inited + 56) = sub_22758E454();
  sub_22731E70C(inited);
  if (v5 <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (v5 >= 9.22337204e18)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if ((*(_QWORD *)&v5 & 0x7FF0000000000000) == 0x7FF0000000000000
    || (*(_QWORD *)&v7 & 0x7FF0000000000000) == 0x7FF0000000000000)
  {
    goto LABEL_17;
  }
  if (v7 <= -9.22337204e18)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
  }
  if (v7 >= 9.22337204e18)
    goto LABEL_19;
  v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  sub_2273DC25C();
  sub_22755FFF4();
  v15 = (const __CFDictionary *)sub_22758E10C();
  swift_bridgeObjectRelease();
  v16 = CVPixelBufferCreate(v14, (uint64_t)v5, (uint64_t)v7, 0x20u, v15, pixelBufferOut);

  if (v16)
  {
    sub_2273203F0();
    swift_allocError();
    *(_QWORD *)(v17 + 8) = 0;
    *(_QWORD *)(v17 + 16) = 0;
    *(_QWORD *)v17 = v16;
    *(_BYTE *)(v17 + 24) = 1;
    swift_willThrow();

  }
  else
  {
    v19 = pixelBufferOut[0];
    if (pixelBufferOut[0])
    {
      CVPixelBufferLockBaseAddress(pixelBufferOut[0], 0);
      BaseAddress = CVPixelBufferGetBaseAddress(v19);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      BytesPerRow = CVPixelBufferGetBytesPerRow(v19);
      v23 = CGBitmapContextCreate(BaseAddress, (uint64_t)v5, (uint64_t)v7, 8uLL, BytesPerRow, DeviceRGB, 6u);
      if (v23)
        sub_22758E670();
      v24 = v19;

      CVPixelBufferUnlockBaseAddress(v24, 0);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t MAGCVPixelBufferWrapper.init(pixelBuffer:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t MAGCVPixelBufferWrapper.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t MAGCVPixelBufferWrapper.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

id sub_22755FEC4(__CVBuffer *a1)
{
  id v1;
  CGImageRef v3;
  id v4;
  CGImage *v5;
  uint64_t v6;
  CGImageRef v8[2];

  v8[1] = *(CGImageRef *)MEMORY[0x24BDAC8D0];
  CVPixelBufferLockBaseAddress(a1, 1uLL);
  v8[0] = 0;
  VTCreateCGImageFromCVPixelBuffer(a1, 0, v8);
  v3 = v8[0];
  if (v8[0])
  {
    v4 = objc_allocWithZone(MEMORY[0x24BEBD640]);
    v5 = v3;
    v1 = objc_msgSend(v4, sel_initWithCGImage_scale_orientation_, v5, 3, 1.0);
    CVPixelBufferUnlockBaseAddress(a1, 1uLL);

  }
  else
  {
    sub_2273203F0();
    swift_allocError();
    *(_QWORD *)v6 = 0xD000000000000050;
    *(_QWORD *)(v6 + 8) = 0x80000002275BDFB0;
    *(_QWORD *)(v6 + 16) = 0;
    *(_BYTE *)(v6 + 24) = 2;
    swift_willThrow();

  }
  return v1;
}

unint64_t sub_22755FFF4()
{
  unint64_t result;
  unint64_t v1;

  result = qword_2558DE6B8;
  if (!qword_2558DE6B8)
  {
    v1 = sub_2273DC25C();
    result = MEMORY[0x2276B3C78](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_2558DE6B8);
  }
  return result;
}

ValueMetadata *type metadata accessor for MAGImageUtils()
{
  return &type metadata for MAGImageUtils;
}

uint64_t type metadata accessor for MAGCVPixelBufferWrapper()
{
  return objc_opt_self();
}

uint64_t method lookup function for MAGCVPixelBufferWrapper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MAGCVPixelBufferWrapper.__allocating_init(pixelBuffer:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t type metadata accessor for MAGCMSampleBufferWrapper()
{
  return objc_opt_self();
}

uint64_t method lookup function for MAGCMSampleBufferWrapper()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_2275600C0@<X0>(unint64_t *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = _ss6UInt32V16MagnifierSupportE20unicodeScalarLiteralABSS_tcfC_0(*a1, a1[1]);
  *a2 = result;
  return result;
}

uint64_t UInt32.string.getter(int a1)
{
  uint64_t result;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2558DE830);
  result = swift_initStackObject();
  *(_OWORD *)(result + 16) = xmmword_227598340;
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  *(_BYTE *)(result + 32) = HIBYTE(a1);
  if ((a1 & 0x800000) != 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  *(_BYTE *)(result + 33) = BYTE2(a1);
  if ((a1 & 0x8000) != 0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  *(_BYTE *)(result + 34) = BYTE1(a1);
  if ((a1 & 0x80) == 0)
  {
    *(_BYTE *)(result + 35) = a1;
    *(_BYTE *)(result + 36) = 0;
    v3 = sub_22756044C(result);
    swift_setDeallocating();
    return v3;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t _ss6UInt32V16MagnifierSupportE20unicodeScalarLiteralABSS_tcfC_0(unint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v19;
  uint64_t v20;

  if (sub_22758E280() != 4)
    goto LABEL_36;
  v4 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_35;
  v5 = (a2 & 0x2000000000000000) != 0 ? HIBYTE(a2) & 0xF : a1 & 0xFFFFFFFFFFFFLL;
  if (v5 != 4)
  {
LABEL_36:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540BA330);
    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_227593AB0;
    v19 = 0;
    v20 = 0xE000000000000000;
    sub_22758EBB0();
    sub_22758E2B0();
    sub_22758E2B0();
    swift_bridgeObjectRelease();
    sub_22758E2B0();
    v16 = v19;
    v17 = v20;
    *(_QWORD *)(v15 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v15 + 32) = v16;
    *(_QWORD *)(v15 + 40) = v17;
    sub_22758EF28();
    v4 = 1061109567;
    goto LABEL_37;
  }
LABEL_7:
  if ((a2 & 0x2000000000000000) != 0)
    v6 = v4;
  else
    v6 = a1 & 0xFFFFFFFFFFFFLL;
  if (v6)
  {
    v4 = 0;
    v7 = (a1 >> 59) & 1;
    if ((a2 & 0x1000000000000000) == 0)
      LOBYTE(v7) = 1;
    v8 = 4 << v7;
    v9 = 15;
    while (1)
    {
      v10 = v9 & 0xC;
      v11 = v9;
      if (v10 == v8)
        v11 = sub_227387D58(v9, a1, a2);
      v12 = v11 >> 16;
      if (v11 >> 16 >= v6)
      {
        __break(1u);
LABEL_34:
        __break(1u);
LABEL_35:
        if (sub_22758E2C8() != 4)
          goto LABEL_36;
        goto LABEL_7;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        v14 = sub_22758E2F8();
        if (v10 != v8)
          goto LABEL_26;
      }
      else if ((a2 & 0x2000000000000000) != 0)
      {
        v19 = a1;
        v20 = a2 & 0xFFFFFFFFFFFFFFLL;
        v14 = *((_BYTE *)&v19 + v12);
        if (v10 != v8)
          goto LABEL_26;
      }
      else
      {
        v13 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if ((a1 & 0x1000000000000000) == 0)
          v13 = sub_22758EBF8();
        v14 = *(_BYTE *)(v13 + v12);
        if (v10 != v8)
        {
LABEL_26:
          if ((a2 & 0x1000000000000000) == 0)
            goto LABEL_14;
          goto LABEL_27;
        }
      }
      v9 = sub_227387D58(v9, a1, a2);
      if ((a2 & 0x1000000000000000) == 0)
      {
LABEL_14:
        v9 = (v9 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_15;
      }
LABEL_27:
      if (v6 <= v9 >> 16)
        goto LABEL_34;
      v9 = sub_22758E2D4();
LABEL_15:
      v4 = v14 | ((_DWORD)v4 << 8);
      if (4 * v6 == v9 >> 14)
        goto LABEL_37;
    }
  }
  v4 = 0;
LABEL_37:
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_22756044C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(result + 16);
  if (v1)
  {
    v2 = result;
    v3 = *(unsigned __int8 *)(result + 32);
    result += 32;
    if (!v3)
      return sub_22758E25C();
    v4 = 0;
    v5 = v1 - 1;
    v6 = v2 + 33;
    while (v5 != v4)
    {
      if (!*(unsigned __int8 *)(v6 + v4++))
        return sub_22758E25C();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_227560498()
{
  unint64_t result;

  result = qword_2558DE838;
  if (!qword_2558DE838)
  {
    result = MEMORY[0x2276B3C78](&protocol conformance descriptor for UInt32, MEMORY[0x24BEE44F0]);
    atomic_store(result, (unint64_t *)&qword_2558DE838);
  }
  return result;
}

uint64_t sub_2275604DC()
{
  return MEMORY[0x24BEE0D90];
}

uint64_t sub_2275604E8()
{
  return MEMORY[0x24BEE0D88];
}

unint64_t sub_2275604F8()
{
  unint64_t result;

  result = qword_2558DE840;
  if (!qword_2558DE840)
  {
    result = MEMORY[0x2276B3C78](&protocol conformance descriptor for UInt32, MEMORY[0x24BEE44F0]);
    atomic_store(result, (unint64_t *)&qword_2558DE840);
  }
  return result;
}

uint64_t sub_22756053C()
{
  return MEMORY[0x24BEE0D80];
}

uint64_t Array<A>.argmax()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = sub_22758E430();
  MEMORY[0x2276B3C78](MEMORY[0x24BEE12C8], v1);
  sub_22758E34C();
  v2 = sub_22758ECDC();
  MEMORY[0x2276B3C78](MEMORY[0x24BEE2FC0], v2);
  sub_22758E364();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_227560638(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[99] = v3;
  v4[98] = a3;
  v4[97] = a2;
  v4[96] = a1;
  return swift_task_switch();
}

uint64_t sub_2275606A8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  int *v21;
  uint64_t v22;
  _QWORD *v23;
  int *v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  _QWORD *v28;
  int *v29;
  uint64_t v30;
  _QWORD *v31;
  int *v32;
  uint64_t v33;
  _QWORD *v34;
  id v35;
  void *v36;
  uint64_t result;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  int *v42;
  uint64_t v43;
  _QWORD *v44;
  void *v45;
  id v46;
  id v47;
  _QWORD *v48;

  v1 = *(_QWORD *)(v0 + 792);
  v2 = *(void **)(v1 + 16);
  if (!v2)
  {
    sub_227563200();
    v2 = *(void **)(v1 + 16);
    if (!v2)
    {
      v29 = *(int **)(v0 + 776);
      v30 = *v29;
      v31 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 960) = v31;
      *v31 = v0;
      v31[1] = sub_22756224C;
      v24 = (int *)((char *)v29 + v30);
      v25 = 0;
      return ((uint64_t (*)(uint64_t, _QWORD))v24)(v25, 0);
    }
  }
  *(_QWORD *)(v0 + 800) = v2;
  v3 = objc_msgSend(v2, sel_modelDescription);
  v4 = objc_msgSend(v3, sel_inputDescriptionsByName);

  sub_22730BA80(0, &qword_2558DABC0);
  v5 = sub_22758E118();

  v6 = sub_2274DC798(v5);
  v8 = v7;
  swift_bridgeObjectRelease();
  if (!v8)
    goto LABEL_9;
  v9 = *(_QWORD *)(v0 + 768);
  *(_QWORD *)(v0 + 688) = 0;
  VTCreateCGImageFromCVPixelBuffer(*(CVPixelBufferRef *)(v9 + 16), 0, (CGImageRef *)(v0 + 688));
  v10 = *(void **)(v0 + 688);
  if (!v10)
  {
    v26 = *(int **)(v0 + 776);
    swift_bridgeObjectRelease();
    v27 = *v26;
    v28 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 944) = v28;
    *v28 = v0;
    v28[1] = sub_2275620F0;
    v24 = (int *)((char *)v26 + v27);
    v25 = 2;
    return ((uint64_t (*)(uint64_t, _QWORD))v24)(v25, 0);
  }
  v11 = v10;
  sub_2274CE150(512.0, 512.0);
  v13 = v12;
  *(_QWORD *)(v0 + 808) = v12;

  if (!v13)
  {
    v32 = *(int **)(v0 + 776);
    swift_bridgeObjectRelease();
    v33 = *v32;
    v34 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 936) = v34;
    *v34 = v0;
    v34[1] = sub_22756200C;
    v24 = (int *)((char *)v32 + v33);
    v25 = 3;
    return ((uint64_t (*)(_QWORD, _QWORD))v24)(v25, 0);
  }
  v14 = (void *)objc_opt_self();
  *(_QWORD *)(v0 + 720) = 0;
  v15 = v13;
  v16 = objc_msgSend(v14, sel_featureValueWithCGImage_orientation_pixelsWide_pixelsHigh_pixelFormatType_options_error_, v15, 6, 512, 512, 32, 0, v0 + 720);
  v17 = *(void **)(v0 + 720);
  if (v16)
  {
    v18 = v16;
    v19 = v17;

    v20 = objc_msgSend(v18, sel_imageBufferValue);
    if (!v20)
    {
      __break(1u);
LABEL_9:
      v21 = *(int **)(v0 + 776);
      v22 = *v21;
      v23 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 952) = v23;
      *v23 = v0;
      v23[1] = sub_227562170;
      v24 = (int *)((char *)v21 + v22);
      v25 = 1;
      return ((uint64_t (*)(_QWORD, _QWORD))v24)(v25, 0);
    }
  }
  else
  {
    v35 = v17;
    v36 = (void *)sub_22758C75C();

    swift_willThrow();
    v20 = 0;
  }
  *(_QWORD *)(v0 + 816) = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540BA2C0);
  result = swift_initStackObject();
  *(_OWORD *)(result + 16) = xmmword_227593AB0;
  *(_QWORD *)(result + 32) = v6;
  *(_QWORD *)(result + 40) = v8;
  if (v20)
  {
    v38 = result;
    v39 = objc_msgSend(v14, sel_featureValueWithPixelBuffer_, v20);
    *(_QWORD *)(v38 + 72) = sub_22730BA80(0, &qword_2558DABC8);
    *(_QWORD *)(v38 + 48) = v39;
    sub_22731D950(v38);
    v40 = objc_allocWithZone(MEMORY[0x24BDBFF80]);
    v41 = sub_227476848();
    *(_QWORD *)(v0 + 824) = v41;
    v45 = v41;
    if (!v41)
    {
      v42 = *(int **)(v0 + 776);
      v43 = *v42;
      v44 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 928) = v44;
      *v44 = v0;
      v44[1] = sub_227561F10;
      v24 = (int *)((char *)v42 + v43);
      v25 = 4;
      return ((uint64_t (*)(_QWORD, _QWORD))v24)(v25, 0);
    }
    v46 = objc_allocWithZone(MEMORY[0x24BDC0018]);
    v47 = v45;
    *(_QWORD *)(v0 + 832) = objc_msgSend(v46, sel_init);
    v48 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 840) = v48;
    *v48 = v0;
    v48[1] = sub_227560B98;
    return sub_22758E8EC();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_227560B98(uint64_t a1)
{
  void *v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  int *v6;
  uint64_t v7;
  _QWORD *v8;

  v3 = (_QWORD *)*v2;
  v3[106] = a1;
  swift_task_dealloc();
  v4 = (void *)v3[104];
  v5 = (void *)v3[103];
  if (v1)
  {
    v6 = (int *)v3[97];

    v7 = *v6;
    v8 = (_QWORD *)swift_task_alloc();
    v3[115] = v8;
    *v8 = v3;
    v8[1] = sub_227561E0C;
    return ((uint64_t (*)(uint64_t, _QWORD))((char *)v6 + v7))(5, 0);
  }
  else
  {

    return swift_task_switch();
  }
}

uint64_t sub_227560CB8()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  id v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  int *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  void *v26;
  float v27;
  float v28;
  id v29;
  int *v30;
  uint64_t v31;
  _QWORD *v32;
  void *v33;
  id v34;
  uint64_t v35;
  int *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  id v41;
  unsigned int v42;
  unsigned int v43;
  unsigned __int8 v44;
  unsigned int v45;
  id v46;
  uint64_t v47;
  id v48;
  unsigned int v49;
  unsigned int v50;
  unsigned __int8 v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  id v55;
  unsigned int v56;
  unsigned int v57;
  unsigned __int8 v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id v62;
  unsigned int v63;
  unsigned int v64;
  unsigned __int8 v65;
  uint64_t v66;
  id v67;
  id v68;
  unsigned int v69;
  unsigned int v70;
  unsigned __int8 v71;
  uint64_t v72;
  int *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id *v82;
  id *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id *v90;
  uint64_t v91;
  id *v92;
  id *v93;
  void *v94;
  uint64_t v95;
  int64_t v96;

  v85 = v0 + 128;
  v87 = v0 + 160;
  v91 = v0 + 224;
  v86 = v0 + 256;
  v89 = v0 + 352;
  v88 = v0 + 448;
  v84 = v0 + 512;
  v83 = (id *)(v0 + 728);
  v92 = (id *)(v0 + 744);
  v93 = (id *)(v0 + 736);
  v82 = (id *)(v0 + 752);
  v90 = (id *)(v0 + 760);
  v1 = objc_msgSend(*(id *)(v0 + 848), sel_featureNames);
  v2 = sub_22758E5B0();

  v3 = 0;
  v4 = 0;
  v95 = v2 + 56;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(v2 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(v2 + 56);
  v96 = (unint64_t)(63 - v6) >> 6;
LABEL_4:
  v94 = v3;
  *(_QWORD *)(v0 + 856) = v3;
  while (v7)
  {
    v8 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v9 = v8 | (v4 << 6);
LABEL_22:
    v13 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v9);
    v14 = v13[1];
    *(_QWORD *)(v0 + 672) = *v13;
    *(_QWORD *)(v0 + 680) = v14;
    *(_QWORD *)(v0 + 656) = 0x5F6465646F636564;
    *(_QWORD *)(v0 + 664) = 0xE900000000000031;
    sub_227476B4C();
    sub_227476B90();
    swift_bridgeObjectRetain();
    if ((sub_22758E154() & 1) != 0)
    {
      v15 = *(void **)(v0 + 848);
      v16 = (void *)sub_22758E1B4();
      swift_bridgeObjectRelease();
      v17 = objc_msgSend(v15, sel_featureValueForName_, v16);

      if (!v17)
        goto LABEL_89;
      v3 = objc_msgSend(v17, sel_multiArrayValue);

      if (v3)
      {

        goto LABEL_4;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  v10 = v4 + 1;
  if (__OFADD__(v4, 1))
  {
    __break(1u);
LABEL_88:
    __break(1u);
LABEL_89:

    __break(1u);
  }
  if (v10 >= v96)
    goto LABEL_26;
  v11 = *(_QWORD *)(v95 + 8 * v10);
  ++v4;
  if (v11)
    goto LABEL_21;
  v4 = v10 + 1;
  if (v10 + 1 >= v96)
    goto LABEL_26;
  v11 = *(_QWORD *)(v95 + 8 * v4);
  if (v11)
    goto LABEL_21;
  v4 = v10 + 2;
  if (v10 + 2 >= v96)
    goto LABEL_26;
  v11 = *(_QWORD *)(v95 + 8 * v4);
  if (v11)
  {
LABEL_21:
    v7 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v4 << 6);
    goto LABEL_22;
  }
  v12 = v10 + 3;
  if (v12 < v96)
  {
    v11 = *(_QWORD *)(v95 + 8 * v12);
    if (!v11)
    {
      while (1)
      {
        v4 = v12 + 1;
        if (__OFADD__(v12, 1))
          goto LABEL_88;
        if (v4 >= v96)
          goto LABEL_26;
        v11 = *(_QWORD *)(v95 + 8 * v4);
        ++v12;
        if (v11)
          goto LABEL_21;
      }
    }
    v4 = v12;
    goto LABEL_21;
  }
LABEL_26:
  swift_release();
  v18 = objc_msgSend((id)objc_opt_self(), sel_shared);
  v19 = objc_msgSend(v18, sel_signDetectorProperties);
  *(_QWORD *)(v0 + 864) = v19;

  if (!v19)
  {
    v21 = *(int **)(v0 + 776);
    v22 = *v21;
    v23 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 912) = v23;
    *v23 = v0;
    v23[1] = sub_227561CEC;
    v24 = (uint64_t (*)(uint64_t, uint64_t))((char *)v21 + v22);
    v25 = 6;
LABEL_44:
    v39 = 0;
    return v24(v25, v39);
  }
  *(_QWORD *)(v0 + 624) = 0xD000000000000015;
  *(_QWORD *)(v0 + 632) = 0x80000002275BE320;
  v20 = objc_msgSend(v19, sel___swift_objectForKeyedSubscript_, sub_22758EE98());
  swift_unknownObjectRelease();
  if (v20)
  {
    sub_22758EAB4();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)(v0 + 288) = 0u;
    *(_OWORD *)(v0 + 304) = 0u;
  }
  sub_22732D760(v0 + 288, v91);
  if (!*(_QWORD *)(v0 + 248))
  {
    sub_22731A1A4(v91, &qword_2540BA340);
    goto LABEL_36;
  }
  sub_22730BA80(0, &qword_2540BA030);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_36:
    v30 = *(int **)(v0 + 776);
    v31 = *v30;
    v32 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 904) = v32;
    *v32 = v0;
    v32[1] = sub_227561C6C;
    v24 = (uint64_t (*)(uint64_t, uint64_t))((char *)v30 + v31);
    v25 = 7;
    goto LABEL_44;
  }
  v26 = *(void **)(v0 + 712);
  objc_msgSend(v26, sel_floatValue);
  v28 = v27;

  *(_QWORD *)(v0 + 560) = 0xD000000000000013;
  *(_QWORD *)(v0 + 568) = 0x80000002275AF2F0;
  v29 = objc_msgSend(v19, sel___swift_objectForKeyedSubscript_, sub_22758EE98());
  swift_unknownObjectRelease();
  if (v29)
  {
    sub_22758EAB4();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)(v0 + 416) = 0u;
    *(_OWORD *)(v0 + 432) = 0u;
  }
  sub_22732D760(v0 + 416, v89);
  if (!*(_QWORD *)(v0 + 376))
  {
    sub_22731A1A4(v89, &qword_2540BA340);
    goto LABEL_43;
  }
  sub_22730BA80(0, (unint64_t *)&unk_2558D5E40);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_43:
    v36 = *(int **)(v0 + 776);
    v37 = *v36;
    v38 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 896) = v38;
    *v38 = v0;
    v38[1] = sub_227561B3C;
    v24 = (uint64_t (*)(uint64_t, uint64_t))((char *)v36 + v37);
    v25 = 8;
    goto LABEL_44;
  }
  v33 = *(void **)(v0 + 704);
  *(_QWORD *)(v0 + 872) = v33;
  *(_QWORD *)(v0 + 696) = sub_22731F070(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 544) = 0x6269737365636361;
  *(_QWORD *)(v0 + 552) = 0xEA0000000000656CLL;
  v34 = objc_msgSend(v33, sel___swift_objectForKeyedSubscript_, sub_22758EE98());
  swift_unknownObjectRelease();
  if (v34)
  {
    sub_22758EAB4();
    swift_unknownObjectRelease();
    v35 = v0 + 384;
  }
  else
  {
    v35 = v0 + 384;
    *(_OWORD *)(v0 + 384) = 0u;
    *(_OWORD *)(v0 + 400) = 0u;
  }
  sub_22732D760(v35, v84);
  if (*(_QWORD *)(v0 + 536))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v41 = *v90;
      objc_msgSend(*v90, sel_floatValue);
      v43 = v42;

      v44 = 0;
      v45 = v43;
      goto LABEL_52;
    }
  }
  else
  {
    sub_22731A1A4(v84, &qword_2540BA340);
  }
  v45 = 0;
  v44 = 1;
LABEL_52:
  sub_227350EC0(v45 | ((unint64_t)v44 << 32), 0);
  *(_QWORD *)(v0 + 592) = 0x656C616D6566;
  *(_QWORD *)(v0 + 600) = 0xE600000000000000;
  v46 = objc_msgSend(v33, sel___swift_objectForKeyedSubscript_, sub_22758EE98());
  swift_unknownObjectRelease();
  if (v46)
  {
    sub_22758EAB4();
    swift_unknownObjectRelease();
    v47 = v0 + 320;
  }
  else
  {
    v47 = v0 + 320;
    *(_OWORD *)(v0 + 320) = 0u;
    *(_OWORD *)(v0 + 336) = 0u;
  }
  sub_22732D760(v47, v85);
  if (*(_QWORD *)(v0 + 152))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v48 = *v82;
      objc_msgSend(*v82, sel_floatValue);
      v50 = v49;

      v51 = 0;
      v52 = v50;
      goto LABEL_60;
    }
  }
  else
  {
    sub_22731A1A4(v85, &qword_2540BA340);
  }
  v52 = 0;
  v51 = 1;
LABEL_60:
  sub_227350EC0(v52 | ((unint64_t)v51 << 32), 1);
  strcpy((char *)(v0 + 640), "gender_neutral");
  *(_BYTE *)(v0 + 655) = -18;
  v53 = objc_msgSend(v33, sel___swift_objectForKeyedSubscript_, sub_22758EE98());
  swift_unknownObjectRelease();
  if (v53)
  {
    sub_22758EAB4();
    swift_unknownObjectRelease();
    v54 = v0 + 192;
  }
  else
  {
    v54 = v0 + 192;
    *(_OWORD *)(v0 + 192) = 0u;
    *(_OWORD *)(v0 + 208) = 0u;
  }
  sub_22732D760(v54, v86);
  if (*(_QWORD *)(v0 + 280))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v55 = *v92;
      objc_msgSend(*v92, sel_floatValue);
      v57 = v56;

      v58 = 0;
      v59 = v57;
      goto LABEL_68;
    }
  }
  else
  {
    sub_22731A1A4(v86, &qword_2540BA340);
  }
  v59 = 0;
  v58 = 1;
LABEL_68:
  sub_227350EC0(v59 | ((unint64_t)v58 << 32), 2);
  *(_QWORD *)(v0 + 576) = 1701601645;
  *(_QWORD *)(v0 + 584) = 0xE400000000000000;
  v60 = objc_msgSend(v33, sel___swift_objectForKeyedSubscript_, sub_22758EE98());
  swift_unknownObjectRelease();
  if (v60)
  {
    sub_22758EAB4();
    swift_unknownObjectRelease();
    v61 = v0 + 480;
  }
  else
  {
    v61 = v0 + 480;
    *(_OWORD *)(v0 + 480) = 0u;
    *(_OWORD *)(v0 + 496) = 0u;
  }
  sub_22732D760(v61, v87);
  if (*(_QWORD *)(v0 + 184))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v62 = *v93;
      objc_msgSend(*v93, sel_floatValue);
      v64 = v63;

      v65 = 0;
      v66 = v64;
      goto LABEL_76;
    }
  }
  else
  {
    sub_22731A1A4(v87, &qword_2540BA340);
  }
  v66 = 0;
  v65 = 1;
LABEL_76:
  sub_227350EC0(v66 | ((unint64_t)v65 << 32), 3);
  *(_QWORD *)(v0 + 608) = 0x696B6F6D735F6F6ELL;
  *(_QWORD *)(v0 + 616) = 0xEA0000000000676ELL;
  v67 = objc_msgSend(v33, sel___swift_objectForKeyedSubscript_, sub_22758EE98());
  swift_unknownObjectRelease();
  if (v67)
  {
    sub_22758EAB4();
    swift_unknownObjectRelease();
  }
  else
  {
    *(_OWORD *)(v0 + 96) = 0u;
    *(_OWORD *)(v0 + 112) = 0u;
  }
  sub_22732D760(v0 + 96, v88);
  if (*(_QWORD *)(v0 + 472))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v68 = *v83;
      objc_msgSend(*v83, sel_floatValue);
      v70 = v69;

      v71 = 0;
      v72 = v70;
      goto LABEL_84;
    }
  }
  else
  {
    sub_22731A1A4(v88, &qword_2540BA340);
  }
  v72 = 0;
  v71 = 1;
LABEL_84:
  sub_227350EC0(v72 | ((unint64_t)v71 << 32), 4);
  if (v94)
  {
    v73 = *(int **)(v0 + 776);
    sub_2275699B0(v94, *(_QWORD **)(v0 + 696), v28);
    v75 = v74;
    *(_QWORD *)(v0 + 880) = v74;
    swift_bridgeObjectRelease();
    v76 = *v73;
    v77 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 888) = v77;
    *v77 = v0;
    v77[1] = sub_2275619F4;
    v24 = (uint64_t (*)(uint64_t, uint64_t))((char *)v73 + v76);
    v25 = 9;
    v39 = v75;
    return v24(v25, v39);
  }
  else
  {
    v78 = *(void **)(v0 + 824);
    v79 = *(void **)(v0 + 816);
    v80 = *(void **)(v0 + 808);
    v81 = *(void **)(v0 + 800);
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2275619F4()
{
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_227561A80()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = *(void **)(v0 + 872);
  v2 = *(void **)(v0 + 864);
  v3 = *(void **)(v0 + 856);
  v4 = *(void **)(v0 + 816);
  v5 = *(void **)(v0 + 808);
  v6 = *(void **)(v0 + 800);

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_227561B3C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_227561BBC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = *(void **)(v0 + 864);
  v2 = *(void **)(v0 + 856);
  v3 = *(void **)(v0 + 816);
  v4 = *(void **)(v0 + 808);
  v5 = *(void **)(v0 + 800);

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_227561C6C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_227561CEC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_227561D6C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(void **)(v0 + 856);
  v2 = *(void **)(v0 + 816);
  v3 = *(void **)(v0 + 808);
  v4 = *(void **)(v0 + 800);

  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_227561E0C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_227561E8C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(v0 + 816);
  v2 = *(void **)(v0 + 808);
  v3 = *(void **)(v0 + 800);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_227561F10()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_227561F90()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 808);
  v2 = *(void **)(v0 + 800);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22756200C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22756208C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2275620F0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_227562170()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2275621F0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22756224C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_2275622C0()
{
  __asm { BR              X10 }
}

uint64_t sub_2275622EC()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  type metadata accessor for MAGUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = (void *)sub_22758E1B4();
  v3 = (void *)sub_22758E1B4();
  v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  v5 = sub_22758E1E4();
  return v5;
}

MagnifierSupport::DoorSignDetectorType_optional __swiftcall DoorSignDetectorType.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 5;
  if ((unint64_t)rawValue < 5)
    v2 = rawValue;
  *v1 = v2;
  return (MagnifierSupport::DoorSignDetectorType_optional)rawValue;
}

void *static DoorSignDetectorType.allCases.getter()
{
  return &unk_24EF9A8B8;
}

uint64_t DoorSignDetectorType.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

void sub_227562548(_QWORD *a1@<X8>)
{
  *a1 = &unk_24EF9A8E0;
}

MagnifierSupport::DoorSignDetectorType_optional sub_227562558(Swift::Int *a1)
{
  return DoorSignDetectorType.init(rawValue:)(*a1);
}

id DoorSignDetectorResult.__allocating_init(boundingBox:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_227568438((uint64_t)a1);

  return v4;
}

id DoorSignDetectorResult.init(boundingBox:)(void *a1)
{
  id v2;

  v2 = sub_227568438((uint64_t)a1);

  return v2;
}

id DoorSignDetectorResult.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void DoorSignDetectorResult.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_227562640()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6D614E6C6562616CLL;
  if (*v0 != 1)
    v1 = 0x6E656469666E6F63;
  if (*v0)
    return v1;
  else
    return 7892834;
}

uint64_t sub_22756269C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_227569EA4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2275626C0()
{
  sub_2275685C0();
  return sub_22758EFDC();
}

uint64_t sub_2275626E8()
{
  sub_2275685C0();
  return sub_22758EFE8();
}

id DoorSignDetectorResult.__deallocating_deinit(uint64_t a1)
{
  return sub_22751E31C(a1, type metadata accessor for DoorSignDetectorResult);
}

uint64_t sub_227562730(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  __int128 v13;
  _BYTE v15[16];
  __int128 v16;
  __int128 v17;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DE848);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7, v8, v9, v10);
  v12 = &v15[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2275685C0();
  sub_22758EFC4();
  v13 = *(_OWORD *)(v3 + OBJC_IVAR____TtC16MagnifierSupport22DoorSignDetectorResult_box + 16);
  v16 = *(_OWORD *)(v3 + OBJC_IVAR____TtC16MagnifierSupport22DoorSignDetectorResult_box);
  v17 = v13;
  v15[15] = 0;
  type metadata accessor for CGRect(0);
  sub_2273096F0(&qword_2558DE860, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, MEMORY[0x24BDBD828]);
  sub_22758EE08();
  if (!v2)
  {
    LOBYTE(v16) = 1;
    sub_22758EDCC();
    LOBYTE(v16) = 2;
    sub_22758EDE4();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v12, v5);
}

id DoorSignDetectorResult.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return DoorSignDetectorResult.init(from:)(a1);
}

id DoorSignDetectorResult.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  objc_class *v23;
  uint64_t v24;
  char *v25;
  objc_super v26;
  __int128 v27;
  __int128 v28;
  char v29;

  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DE878);
  v4 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24, v5, v6, v7, v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2275685C0();
  v25 = v1;
  v12 = v11;
  sub_22758EFB8();
  if (v2)
  {
    v15 = v25;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);

    type metadata accessor for DoorSignDetectorResult();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v13 = v4;
    type metadata accessor for CGRect(0);
    v29 = 0;
    sub_2273096F0(&qword_2558DE880, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, MEMORY[0x24BDBD838]);
    v14 = v24;
    sub_22758EDA8();
    v17 = v25;
    v18 = &v25[OBJC_IVAR____TtC16MagnifierSupport22DoorSignDetectorResult_box];
    *(_OWORD *)v18 = v27;
    *((_OWORD *)v18 + 1) = v28;
    LOBYTE(v27) = 1;
    v19 = sub_22758ED6C();
    v20 = (uint64_t *)&v17[OBJC_IVAR____TtC16MagnifierSupport22DoorSignDetectorResult_labelName];
    *v20 = v19;
    v20[1] = v21;
    LOBYTE(v27) = 2;
    sub_22758ED84();
    *(_QWORD *)&v17[OBJC_IVAR____TtC16MagnifierSupport22DoorSignDetectorResult_confidence] = v22;

    v23 = (objc_class *)type metadata accessor for DoorSignDetectorResult();
    v26.receiver = v17;
    v26.super_class = v23;
    v12 = objc_msgSendSuper2(&v26, sel_init);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v14);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  return v12;
}

uint64_t sub_227562B7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for DoorSignDetectorResult();
  result = sub_22758EBC8();
  *a1 = result;
  return result;
}

uint64_t sub_227562BB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  return sub_227566394(a1, a2, (uint64_t (*)(uint64_t))type metadata accessor for DoorSignDetectorResult, (uint64_t (*)(uint64_t))DoorSignDetectorResult.init(from:), a3);
}

uint64_t sub_227562BDC(_QWORD *a1)
{
  return sub_227562730(a1);
}

Swift::Float __swiftcall MLMultiArray.floatValue(_:)(Swift::OpaquePointer a1)
{
  id v1;
  float v2;
  float v3;

  v1 = MLMultiArray.subscript.getter((uint64_t)a1._rawValue);
  objc_msgSend(v1, sel_floatValue);
  v3 = v2;

  return v3;
}

double CGRect.init(centerX:y:width:height:)(double a1, double a2, double a3)
{
  return a1 - a3 * 0.5;
}

id MindNetModelBoundingBox.__allocating_init(id:timestamp:heat:angle:rect:classIndex:heatByClass:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, float a5, float a6, double a7, double a8, double a9, double a10)
{
  objc_class *v10;
  id v21;

  v21 = objc_allocWithZone(v10);
  return MindNetModelBoundingBox.init(id:timestamp:heat:angle:rect:classIndex:heatByClass:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_227562CF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
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
  uint64_t v29;
  char *v30;
  id v31;
  id v32;
  uint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t, uint64_t, uint64_t);
  unint64_t v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  id v51;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B9E30);
  MEMORY[0x24BDAC7A8](v2, v3, v4, v5, v6);
  v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B7B10);
  MEMORY[0x24BDAC7A8](v9, v10, v11, v12, v13);
  v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_22758C858();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(_QWORD *)(v17 + 64);
  v23 = MEMORY[0x24BDAC7A8](v16, v19, v20, v21, v22);
  v24 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23, v25, v26, v27, v28);
  v30 = (char *)&v48 - v29;
  *(_QWORD *)(v1 + 16) = 0;
  v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFFD8]), sel_init);
  v31 = objc_msgSend((id)objc_opt_self(), sel_shared);
  v32 = objc_msgSend(v31, sel_signDetectorModelPath);

  if (v32)
  {
    v33 = (uint64_t)v8;
    sub_22758C81C();

    v34 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    v34(v15, v24, v16);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v15, 0, 1, v16);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) != 1)
    {
      v50 = v30;
      v34(v30, v15, v16);
      v35 = sub_22758E4C0();
      v36 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56);
      v49 = v33;
      v36(v33, 1, 1, v35);
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v24, v30, v16);
      v37 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
      v38 = (v18 + v37 + 7) & 0xFFFFFFFFFFFFFFF8;
      v39 = v51;
      v40 = v1;
      v41 = swift_allocObject();
      *(_QWORD *)(v41 + 16) = 0;
      *(_QWORD *)(v41 + 24) = 0;
      v34((char *)(v41 + v37), v24, v16);
      *(_QWORD *)(v41 + v38) = v39;
      *(_QWORD *)(v41 + ((v38 + 15) & 0xFFFFFFFFFFFFFFF8)) = v1;
      v42 = v39;
      swift_retain();
      sub_227367B10(v49, (uint64_t)&unk_2558DEB80, v41);

      v1 = v40;
      swift_release();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v50, v16);
      return v1;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
  }
  sub_22731A1A4((uint64_t)v15, &qword_2540B7B10);
  if (qword_2558D4A58 != -1)
    swift_once();
  v43 = sub_22758CF9C();
  __swift_project_value_buffer(v43, (uint64_t)qword_2558D6230);
  v44 = sub_22758CF84();
  v45 = sub_22758E6B8();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v46 = 0;
    _os_log_impl(&dword_2272F4000, v44, v45, "Door Sign Detection Model URL is not available", v46, 2u);
    MEMORY[0x2276B3D50](v46, -1, -1);

  }
  else
  {

  }
  return v1;
}

uint64_t sub_2275630AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;

  v6[2] = a5;
  v6[3] = a6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B7B10);
  v6[4] = swift_task_alloc();
  v7 = sub_22758C858();
  v6[5] = v7;
  v6[6] = *(_QWORD *)(v7 - 8);
  v6[7] = swift_task_alloc();
  v6[8] = swift_task_alloc();
  v6[9] = sub_22730BA80(0, &qword_2558DABF0);
  v8 = (_QWORD *)swift_task_alloc();
  v6[10] = v8;
  *v8 = v6;
  v8[1] = sub_227563194;
  return sub_22758E8F8();
}

uint64_t sub_227563194()
{
  void *v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0)

  return swift_task_switch();
}

void sub_227563200()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  id v30;
  id v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  id v47;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B9E30);
  MEMORY[0x24BDAC7A8](v1, v2, v3, v4, v5);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B7B10);
  MEMORY[0x24BDAC7A8](v8, v9, v10, v11, v12);
  v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_22758C858();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 64);
  v22 = MEMORY[0x24BDAC7A8](v15, v18, v19, v20, v21);
  v23 = (char *)&v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22, v24, v25, v26, v27);
  v29 = (char *)&v44 - v28;
  v47 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBFFD8]), sel_init);
  v30 = objc_msgSend((id)objc_opt_self(), sel_shared);
  v31 = objc_msgSend(v30, sel_signDetectorModelPath);

  if (v31)
  {
    sub_22758C81C();

    v32 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
    v32(v14, v23, v15);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v14, 0, 1, v15);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) != 1)
    {
      v46 = v29;
      v32(v29, v14, v15);
      v33 = sub_22758E4C0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v7, 1, 1, v33);
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v23, v29, v15);
      v34 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
      v35 = (v17 + v34 + 7) & 0xFFFFFFFFFFFFFFF8;
      v45 = v7;
      v36 = v0;
      v37 = v47;
      v38 = swift_allocObject();
      *(_QWORD *)(v38 + 16) = 0;
      *(_QWORD *)(v38 + 24) = 0;
      v32((char *)(v38 + v34), v23, v15);
      *(_QWORD *)(v38 + v35) = v37;
      *(_QWORD *)(v38 + ((v35 + 15) & 0xFFFFFFFFFFFFFFF8)) = v36;
      v39 = v37;
      swift_retain();
      sub_227367B10((uint64_t)v45, (uint64_t)&unk_2558DEB08, v38);

      swift_release();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v46, v15);
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
  }
  sub_22731A1A4((uint64_t)v14, &qword_2540B7B10);
  if (qword_2558D4A58 != -1)
    swift_once();
  v40 = sub_22758CF9C();
  __swift_project_value_buffer(v40, (uint64_t)qword_2558D6230);
  v41 = sub_22758CF84();
  v42 = sub_22758E6B8();
  if (os_log_type_enabled(v41, v42))
  {
    v43 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v43 = 0;
    _os_log_impl(&dword_2272F4000, v41, v42, "Door Sign Detection Model URL is not available", v43, 2u);
    MEMORY[0x2276B3D50](v43, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_2275635A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;

  v6[2] = a5;
  v6[3] = a6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B7B10);
  v6[4] = swift_task_alloc();
  v7 = sub_22758C858();
  v6[5] = v7;
  v6[6] = *(_QWORD *)(v7 - 8);
  v6[7] = swift_task_alloc();
  v6[8] = swift_task_alloc();
  v6[9] = sub_22730BA80(0, &qword_2558DABF0);
  v8 = (_QWORD *)swift_task_alloc();
  v6[10] = v8;
  *v8 = v6;
  v8[1] = sub_227563688;
  return sub_22758E8F8();
}

uint64_t sub_227563688()
{
  void *v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (v0)

  return swift_task_switch();
}

uint64_t sub_2275636F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 32);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v1);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_22731A1A4(*(_QWORD *)(v0 + 32), &qword_2540B7B10);
    if (qword_2558D4A58 != -1)
      swift_once();
    v4 = sub_22758CF9C();
    __swift_project_value_buffer(v4, (uint64_t)qword_2558D6230);
    v5 = sub_22758CF84();
    v6 = sub_22758E6B8();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2272F4000, v5, v6, "Door Sign Detection Model cannot be compiled", v7, 2u);
      MEMORY[0x2276B3D50](v7, -1, -1);
    }

  }
  else
  {
    v8 = *(void **)(v0 + 88);
    v9 = *(_QWORD *)(v0 + 64);
    v11 = *(_QWORD *)(v0 + 48);
    v10 = *(_QWORD *)(v0 + 56);
    v12 = *(_QWORD *)(v0 + 40);
    v13 = *(void **)(v0 + 16);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v11 + 32))(v9, *(_QWORD *)(v0 + 32), v12);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v10, v9, v12);
    v14 = v13;
    v15 = sub_2274791DC(v10, (uint64_t)v14);

    if (v8)
    {

    }
    else if (v15)
    {
      v23 = *(_QWORD *)(v0 + 24);
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 40));
      v24 = *(void **)(v23 + 16);
      *(_QWORD *)(v23 + 16) = v15;

      goto LABEL_16;
    }
    if (qword_2558D4A58 != -1)
      swift_once();
    v16 = sub_22758CF9C();
    __swift_project_value_buffer(v16, (uint64_t)qword_2558D6230);
    v17 = sub_22758CF84();
    v18 = sub_22758E6B8();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_2272F4000, v17, v18, "Door Sign Detection Model failed to initialize.", v19, 2u);
      MEMORY[0x2276B3D50](v19, -1, -1);
    }
    v20 = *(_QWORD *)(v0 + 64);
    v21 = *(_QWORD *)(v0 + 40);
    v22 = *(_QWORD *)(v0 + 48);

    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
  }
LABEL_16:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_227563998()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 48) + 56))(*(_QWORD *)(v0 + 32), 1, 1, *(_QWORD *)(v0 + 40));
  sub_22731A1A4(*(_QWORD *)(v0 + 32), &qword_2540B7B10);
  if (qword_2558D4A58 != -1)
    swift_once();
  v1 = sub_22758CF9C();
  __swift_project_value_buffer(v1, (uint64_t)qword_2558D6230);
  v2 = sub_22758CF84();
  v3 = sub_22758E6B8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2272F4000, v2, v3, "Door Sign Detection Model cannot be compiled", v4, 2u);
    MEMORY[0x2276B3D50](v4, -1, -1);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id MindNetModelBoundingBox.init(id:timestamp:heat:angle:rect:classIndex:heatByClass:)(uint64_t a1, uint64_t a2, uint64_t a3, double a4, float a5, float a6, double a7, double a8, double a9, double a10)
{
  char *v10;
  char *v21;
  char *v22;
  float *v23;
  float *v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  double *v30;
  id v31;
  objc_super v33;

  v21 = &v10[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_id];
  v22 = v10;
  sub_22758C978();
  v23 = (float *)&v22[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat];
  *(_DWORD *)&v22[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat] = 0;
  v24 = (float *)&v22[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_angle];
  *(_DWORD *)&v22[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_angle] = 0;
  v25 = &v22[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_depth];
  *(_DWORD *)v25 = 0;
  v25[4] = 1;
  v26 = &v22[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_centroid3d];
  *(_QWORD *)v26 = 0;
  *((_QWORD *)v26 + 1) = 0;
  v26[16] = 1;
  *(_QWORD *)&v22[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_knownFeaturePoints] = 0;
  v27 = &v22[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_physicalSize];
  *(_QWORD *)v27 = 0;
  v27[8] = 1;
  swift_beginAccess();
  v28 = sub_22758C984();
  v29 = *(_QWORD *)(v28 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v29 + 24))(v21, a1, v28);
  swift_endAccess();
  swift_beginAccess();
  *v23 = a5;
  swift_beginAccess();
  *v24 = a6;
  v30 = (double *)&v22[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect];
  *v30 = a7;
  v30[1] = a8;
  v30[2] = a9;
  v30[3] = a10;
  *(_QWORD *)&v22[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_classIndex] = a2;
  *(_QWORD *)&v22[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heatByClass] = a3;
  *(double *)&v22[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_firstSeen] = a4;
  *(double *)&v22[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_lastSeen] = a4;

  v33.receiver = v22;
  v33.super_class = (Class)type metadata accessor for MindNetModelBoundingBox();
  v31 = objc_msgSendSuper2(&v33, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(a1, v28);
  return v31;
}

uint64_t sub_227563CB4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_id;
  swift_beginAccess();
  v4 = sub_22758C984();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_227563D1C(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __n128 v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v15;

  v4 = sub_22758C984();
  v5 = *(_QWORD *)(v4 - 8);
  v10 = MEMORY[0x24BDAC7A8](v4, v6, v7, v8, v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, __n128))(v5 + 16))(v12, a1, v4, v10);
  v13 = *a2 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_id;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v13, v12, v4);
  return swift_endAccess();
}

uint64_t sub_227563DE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_id;
  swift_beginAccess();
  v4 = sub_22758C984();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_227563E44(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_id;
  swift_beginAccess();
  v4 = sub_22758C984();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_227563EB0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

float sub_227563EF4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_227563F38(float a1)
{
  uint64_t v1;
  float *v3;
  uint64_t result;

  v3 = (float *)(v1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_227563F88())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

float sub_227563FCC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_angle;
  swift_beginAccess();
  return *(float *)v1;
}

uint64_t sub_227564010(float a1)
{
  uint64_t v1;
  float *v3;
  uint64_t result;

  v3 = (float *)(v1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_angle);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_227564060())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_2275640A4(_QWORD *a1@<X0>, CGFloat *a2@<X8>)
{
  CGRect *v3;
  CGFloat MidX;
  CGFloat MidY;

  v3 = (CGRect *)(*a1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect);
  swift_beginAccess();
  MidX = CGRectGetMidX(*v3);
  MidY = CGRectGetMidY(*v3);
  *a2 = MidX;
  a2[1] = MidY;
}

double sub_227564114()
{
  uint64_t v0;
  CGRect *v1;
  double MidX;

  v1 = (CGRect *)(v0 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect);
  swift_beginAccess();
  MidX = CGRectGetMidX(*v1);
  CGRectGetMidY(*v1);
  return MidX;
}

float64x2_t sub_227564180(float64_t a1, float64_t a2)
{
  uint64_t v2;
  float64x2_t *v3;
  float64x2_t v9;
  float64x2_t result;

  v3 = (float64x2_t *)(v2 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect);
  swift_beginAccess();
  __asm { FMOV            V1.2D, #-0.5 }
  v9.f64[0] = a1;
  v9.f64[1] = a2;
  result = vaddq_f64(v9, vmulq_f64(v3[1], _Q1));
  *v3 = result;
  return result;
}

void (*sub_2275641E0(CGFloat **a1))(uint64_t *a1)
{
  uint64_t v1;
  CGFloat *v3;
  uint64_t v4;
  CGRect *v5;
  CGFloat MidX;
  CGFloat MidY;

  v3 = (CGFloat *)malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect;
  *((_QWORD *)v3 + 5) = v1;
  *((_QWORD *)v3 + 6) = v4;
  v5 = (CGRect *)(v1 + v4);
  swift_beginAccess();
  MidX = CGRectGetMidX(*v5);
  MidY = CGRectGetMidY(*v5);
  v3[3] = MidX;
  v3[4] = MidY;
  return sub_22756426C;
}

void sub_22756426C(uint64_t *a1)
{
  uint64_t v1;
  float64x2_t *v2;

  v1 = *a1;
  v2 = (float64x2_t *)(*(_QWORD *)(v1 + 40) + *(_QWORD *)(v1 + 48));
  __asm { FMOV            V2.2D, #-0.5 }
  *v2 = vaddq_f64(*(float64x2_t *)(v1 + 24), vmulq_f64(v2[1], _Q2));
  free((void *)v1);
}

double sub_227564294()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect;
  swift_beginAccess();
  return *(double *)(v1 + 16);
}

uint64_t sub_2275642D8(double a1, double a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  v5 = v2 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect;
  result = swift_beginAccess();
  *(double *)(v5 + 16) = a1;
  *(double *)(v5 + 24) = a2;
  return result;
}

void (*sub_22756432C(_QWORD *a1))(uint64_t *a1)
{
  uint64_t v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (char *)malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect;
  *((_QWORD *)v3 + 5) = v1;
  *((_QWORD *)v3 + 6) = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  *(_OWORD *)(v3 + 24) = *(_OWORD *)(v5 + 16);
  return sub_227564398;
}

void sub_227564398(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  *(_OWORD *)(*(_QWORD *)(v1 + 40) + *(_QWORD *)(v1 + 48) + 16) = *(_OWORD *)(v1 + 24);
  free((void *)v1);
}

double sub_2275643B0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_2275643F8(double a1, double a2, double a3, double a4)
{
  uint64_t v4;
  double *v9;
  uint64_t result;

  v9 = (double *)(v4 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect);
  result = swift_beginAccess();
  *v9 = a1;
  v9[1] = a2;
  v9[2] = a3;
  v9[3] = a4;
  return result;
}

uint64_t (*sub_227564460())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2275644A4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_classIndex;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_2275644E8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_classIndex);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_227564530())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_227564574(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heatByClass);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2275645DC()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_227564624(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heatByClass);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_227564674())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_2275646B8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_firstSeen;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_2275646FC(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_firstSeen);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_22756474C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_227564790()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_lastSeen;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_2275647D4(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_lastSeen);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_227564824())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

unint64_t sub_227564868()
{
  uint64_t v0;
  unsigned int *v1;

  v1 = (unsigned int *)(v0 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_depth);
  swift_beginAccess();
  return *v1 | ((unint64_t)*((unsigned __int8 *)v1 + 4) << 32);
}

uint64_t sub_2275648BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = v1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_depth;
  result = swift_beginAccess();
  *(_DWORD *)v3 = a1;
  *(_BYTE *)(v3 + 4) = BYTE4(a1) & 1;
  return result;
}

uint64_t (*sub_22756490C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_227564950()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_centroid3d;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_227564998(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t result;

  v7 = v3 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_centroid3d;
  result = swift_beginAccess();
  *(_QWORD *)v7 = a1;
  *(_QWORD *)(v7 + 8) = a2;
  *(_BYTE *)(v7 + 16) = a3 & 1;
  return result;
}

uint64_t (*sub_2275649F8())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_227564A3C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_knownFeaturePoints);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_227564AA4()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_227564AEC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_knownFeaturePoints);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_227564B3C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_227564B80()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_physicalSize;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_227564BC8(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  v5 = v2 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_physicalSize;
  result = swift_beginAccess();
  *(_QWORD *)v5 = a1;
  *(_BYTE *)(v5 + 8) = a2 & 1;
  return result;
}

uint64_t (*sub_227564C24())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_227564C68(uint64_t a1)
{
  uint64_t v1;
  CGRect *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v3 = (CGRect *)(v1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect);
  swift_beginAccess();
  x = v3->origin.x;
  y = v3->origin.y;
  width = v3->size.width;
  height = v3->size.height;
  v8 = (CGRect *)(a1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect);
  swift_beginAccess();
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v19 = CGRectUnion(v18, *v8);
  v9 = v19.origin.x;
  v10 = v19.origin.y;
  v11 = v19.size.width;
  v12 = v19.size.height;
  v13 = CGRectGetHeight(v19);
  v20.origin.x = v9;
  v20.origin.y = v10;
  v20.size.width = v11;
  v20.size.height = v12;
  if (sqrt(v13 * CGRectGetWidth(v20)) != 0.0)
  {
    v21 = CGRectIntersection(*v3, *v8);
    v14 = v21.origin.x;
    v15 = v21.origin.y;
    v16 = v21.size.width;
    v17 = v21.size.height;
    CGRectGetHeight(v21);
    v22.origin.x = v14;
    v22.origin.y = v15;
    v22.size.width = v16;
    v22.size.height = v17;
    CGRectGetWidth(v22);
  }
}

uint64_t sub_227564DF0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t result;
  uint64_t v4;
  int *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGFloat MidX;
  uint64_t v11;
  unint64_t v12;
  CGFloat MidY;
  uint64_t v14;
  uint64_t v15;

  v1 = v0;
  v2 = (_QWORD *)(v0 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_classIndex);
  result = swift_beginAccess();
  if (*v2 > 4uLL)
  {
    __break(1u);
  }
  else
  {
    sub_22758EBB0();
    sub_22758E2B0();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540BA310);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_227593AB0;
    v5 = (int *)(v1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
    swift_beginAccess();
    v6 = *v5;
    v7 = MEMORY[0x24BEE1568];
    *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE14E8];
    *(_QWORD *)(v4 + 64) = v7;
    *(_DWORD *)(v4 + 32) = v6;
    sub_22758E208();
    swift_bridgeObjectRelease();
    sub_22758E2B0();
    swift_bridgeObjectRelease();
    sub_22758E2B0();
    sub_22758E238();
    sub_22758E2B0();
    swift_bridgeObjectRelease();
    sub_22758E2B0();
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_227596540;
    v9 = v1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect;
    swift_beginAccess();
    MidX = CGRectGetMidX(*(CGRect *)v9);
    CGRectGetMidY(*(CGRect *)v9);
    v11 = MEMORY[0x24BEE50B0];
    *(_QWORD *)(v8 + 56) = MEMORY[0x24BEE50B0];
    v12 = sub_22754750C();
    *(_QWORD *)(v8 + 64) = v12;
    *(CGFloat *)(v8 + 32) = MidX;
    CGRectGetMidX(*(CGRect *)v9);
    MidY = CGRectGetMidY(*(CGRect *)v9);
    *(_QWORD *)(v8 + 96) = v11;
    *(_QWORD *)(v8 + 104) = v12;
    *(CGFloat *)(v8 + 72) = MidY;
    sub_22758E208();
    swift_bridgeObjectRelease();
    sub_22758E2B0();
    swift_bridgeObjectRelease();
    sub_22758E2B0();
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_227596540;
    *(_QWORD *)(v14 + 56) = v11;
    *(_QWORD *)(v14 + 64) = v12;
    v15 = *(_QWORD *)(v9 + 24);
    *(_QWORD *)(v14 + 32) = *(_QWORD *)(v9 + 16);
    *(_QWORD *)(v14 + 96) = v11;
    *(_QWORD *)(v14 + 104) = v12;
    *(_QWORD *)(v14 + 72) = v15;
    sub_22758E208();
    swift_bridgeObjectRelease();
    sub_22758E2B0();
    swift_bridgeObjectRelease();
    sub_22758E2B0();
    return 0;
  }
  return result;
}

void MindNetModelBoundingBox.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_227565190(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2275651B8 + 4 * byte_2275A7B40[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_2275651B8()
{
  return 1952540008;
}

uint64_t sub_2275651C8()
{
  return 0x656C676E61;
}

uint64_t sub_2275651DC()
{
  return 1952671090;
}

uint64_t sub_2275651EC()
{
  return 0x646E497373616C63;
}

uint64_t sub_227565208()
{
  return 0x6C43794274616568;
}

uint64_t sub_227565228()
{
  return 0x6565537473726966;
}

uint64_t sub_227565244()
{
  return 0x6E6565537473616CLL;
}

uint64_t sub_22756525C()
{
  return 0x6874706564;
}

uint64_t sub_227565270()
{
  return 0x64696F72746E6563;
}

unint64_t sub_22756528C()
{
  return 0xD000000000000012;
}

uint64_t sub_2275652A8()
{
  return 0x6C61636973796870;
}

uint64_t sub_2275652C8()
{
  unsigned __int8 *v0;

  return sub_227565190(*v0);
}

uint64_t sub_2275652D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22756A000(a1, a2);
  *a3 = result;
  return result;
}

void sub_2275652F4(_BYTE *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_227565300()
{
  sub_227568640();
  return sub_22758EFDC();
}

uint64_t sub_227565328()
{
  sub_227568640();
  return sub_22758EFE8();
}

id MindNetModelBoundingBox.__deallocating_deinit()
{
  return sub_22751E31C(0, type metadata accessor for MindNetModelBoundingBox);
}

uint64_t sub_2275653C0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 *v23;
  __int128 v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  __int128 *v28;
  char v29;
  uint64_t *v30;
  uint64_t *v31;
  char v32;
  _QWORD v33[2];
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  __int128 v38;
  char v39;
  char v40;
  char v41;
  char v42;
  uint64_t v43;
  char v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v2 = sub_22758C984();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4, v5, v6, v7);
  v9 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DE888);
  v47 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v11, v12, v13, v14);
  v16 = (char *)v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_227568640();
  sub_22758EFC4();
  v17 = v33[0];
  v18 = v33[0] + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_id;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v9, v18, v2);
  LOBYTE(v45) = 0;
  sub_2273096F0(&qword_2558DE898, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  v19 = v33[1];
  sub_22758EE08();
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v16, v10);
  }
  else
  {
    v20 = v3;
    v21 = v47;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v9, v2);
    swift_beginAccess();
    LOBYTE(v45) = 1;
    sub_22758EDF0();
    swift_beginAccess();
    LOBYTE(v45) = 2;
    sub_22758EDF0();
    v23 = (__int128 *)(v17 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect);
    swift_beginAccess();
    v24 = v23[1];
    v45 = *v23;
    v46 = v24;
    v44 = 3;
    type metadata accessor for CGRect(0);
    sub_2273096F0(&qword_2558DE860, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, MEMORY[0x24BDBD828]);
    sub_22758EE08();
    swift_beginAccess();
    v44 = 4;
    sub_22758EDFC();
    v25 = (uint64_t *)(v17 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heatByClass);
    swift_beginAccess();
    v43 = *v25;
    v42 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558DE8A0);
    sub_227568684(&qword_2558DE8A8, MEMORY[0x24BEE14F8], MEMORY[0x24BEE12A0]);
    sub_22758EE08();
    swift_beginAccess();
    v42 = 6;
    sub_22758EDE4();
    swift_beginAccess();
    v41 = 7;
    sub_22758EDE4();
    v26 = v17 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_depth;
    swift_beginAccess();
    v27 = *(_BYTE *)(v26 + 4);
    v40 = 8;
    LOBYTE(v38) = v27;
    sub_22758EDB4();
    v28 = (__int128 *)(v17 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_centroid3d);
    swift_beginAccess();
    v29 = *((_BYTE *)v28 + 16);
    v38 = *v28;
    v39 = v29;
    LOBYTE(v37) = 9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558DE8B0);
    sub_22730BB7C(&qword_2558DE8B8, &qword_2558DE8B0, MEMORY[0x24BEE4108]);
    sub_22758EDC0();
    v30 = (uint64_t *)(v17 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_knownFeaturePoints);
    swift_beginAccess();
    v37 = *v30;
    LOBYTE(v35) = 10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558DE8C0);
    sub_2275686E4(&qword_2558DE8C8, &qword_2558DE8B8, MEMORY[0x24BEE4108], MEMORY[0x24BEE12A0]);
    sub_22758EDC0();
    v31 = (uint64_t *)(v17 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_physicalSize);
    swift_beginAccess();
    v32 = *((_BYTE *)v31 + 8);
    v35 = *v31;
    v36 = v32;
    v34 = 11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558DE8D0);
    sub_22730BB7C(&qword_2558DE8D8, &qword_2558DE8D0, MEMORY[0x24BEE40D8]);
    sub_22758EDC0();
    return (*(uint64_t (**)(char *, _QWORD))(v21 + 8))(v16, 0);
  }
}

void *MindNetModelBoundingBox.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return MindNetModelBoundingBox.init(from:)(a1);
}

void *MindNetModelBoundingBox.init(from:)(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  char *v31;
  char *v32;
  int v33;
  int v34;
  char *v35;
  int v36;
  int v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  objc_class *v53;
  uint64_t v54;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  _QWORD *v64;
  char *v65;
  char *v66;
  uint64_t v67;
  char *v68;
  objc_super v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  char v76;
  __int128 v77;
  __int128 v78;

  v63 = sub_22758C984();
  v67 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63, v3, v4, v5, v6);
  v60 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DE8E0);
  v59 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61, v8, v9, v10, v11);
  v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = &v1[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_id];
  v15 = v1;
  v66 = v14;
  sub_22758C978();
  v58 = &v15[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat];
  *(_DWORD *)&v15[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat] = 0;
  v16 = &v15[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_angle];
  *(_DWORD *)&v15[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_angle] = 0;
  v17 = &v15[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_depth];
  *(_DWORD *)v17 = 0;
  v17[4] = 1;
  v18 = &v15[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_centroid3d];
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = 0;
  v18[16] = 1;
  v65 = &v15[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_knownFeaturePoints];
  *(_QWORD *)&v15[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_knownFeaturePoints] = 0;
  v68 = v15;
  v19 = &v15[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_physicalSize];
  *(_QWORD *)v19 = 0;
  v19[8] = 1;
  v20 = a1[3];
  v64 = a1;
  v21 = __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_227568640();
  v22 = v62;
  sub_22758EFB8();
  if (v22)
  {
    v23 = v63;
    v27 = v67;
    v28 = v66;
    v29 = v68;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v64);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v23);

    swift_bridgeObjectRelease();
    type metadata accessor for MindNetModelBoundingBox();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v62 = v16;
    v57 = v17;
    v56 = v18;
    v55 = v19;
    v24 = v59;
    LOBYTE(v77) = 0;
    sub_2273096F0(&qword_2558DE8E8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    v25 = v60;
    v26 = v63;
    sub_22758EDA8();
    v31 = v66;
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v67 + 40))(v31, v25, v26);
    swift_endAccess();
    LOBYTE(v77) = 1;
    v60 = v13;
    sub_22758ED90();
    v32 = v68;
    v34 = v33;
    v35 = v58;
    swift_beginAccess();
    *(_DWORD *)v35 = v34;
    LOBYTE(v77) = 2;
    sub_22758ED90();
    v37 = v36;
    v38 = v62;
    swift_beginAccess();
    *(_DWORD *)v38 = v37;
    type metadata accessor for CGRect(0);
    v76 = 3;
    sub_2273096F0(&qword_2558DE880, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, MEMORY[0x24BDBD838]);
    sub_22758EDA8();
    v39 = &v32[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect];
    *(_OWORD *)v39 = v77;
    *((_OWORD *)v39 + 1) = v78;
    LOBYTE(v77) = 4;
    *(_QWORD *)&v32[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_classIndex] = sub_22758ED9C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558DE8A0);
    v76 = 5;
    sub_227568684(&qword_2558DE8F0, MEMORY[0x24BEE1520], MEMORY[0x24BEE12D0]);
    sub_22758EDA8();
    *(_QWORD *)&v32[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heatByClass] = v77;
    LOBYTE(v77) = 6;
    sub_22758ED84();
    *(_QWORD *)&v32[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_firstSeen] = v40;
    LOBYTE(v77) = 7;
    sub_22758ED84();
    *(_QWORD *)&v32[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_lastSeen] = v41;
    LOBYTE(v77) = 8;
    v42 = sub_22758ED54();
    v43 = v57;
    swift_beginAccess();
    *(_DWORD *)v43 = v42;
    v43[4] = BYTE4(v42) & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558DE8B0);
    v76 = 9;
    sub_22730BB7C(&qword_2558DE8F8, &qword_2558DE8B0, MEMORY[0x24BEE4118]);
    sub_22758ED60();
    v44 = v73;
    v45 = v74;
    v46 = v75;
    v47 = v56;
    swift_beginAccess();
    *(_QWORD *)v47 = v44;
    *((_QWORD *)v47 + 1) = v45;
    v47[16] = v46;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558DE8C0);
    LOBYTE(v73) = 10;
    sub_2275686E4(&qword_2558DE900, &qword_2558DE8F8, MEMORY[0x24BEE4118], MEMORY[0x24BEE12D0]);
    sub_22758ED60();
    v48 = v70;
    v49 = v65;
    swift_beginAccess();
    *(_QWORD *)v49 = v48;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558DE8D0);
    LOBYTE(v70) = 11;
    sub_22730BB7C(&qword_2558DE908, &qword_2558DE8D0, MEMORY[0x24BEE40E8]);
    sub_22758ED60();
    v50 = v71;
    LOBYTE(v49) = v72;
    v51 = v55;
    swift_beginAccess();
    *(_QWORD *)v51 = v50;
    v51[8] = (char)v49;
    v52 = v68;

    v53 = (objc_class *)type metadata accessor for MindNetModelBoundingBox();
    v69.receiver = v52;
    v69.super_class = v53;
    v21 = objc_msgSendSuper2(&v69, sel_init);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v60, v61);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v64);
  }
  return v21;
}

uint64_t sub_227566304@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_id;
  swift_beginAccess();
  v4 = sub_22758C984();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_22756636C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_227566394(a1, 0, (uint64_t (*)(uint64_t))type metadata accessor for MindNetModelBoundingBox, (uint64_t (*)(uint64_t))MindNetModelBoundingBox.init(from:), a2);
}

uint64_t sub_227566394@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t (*a3)(uint64_t)@<X4>, uint64_t (*a4)(uint64_t)@<X5>, uint64_t *a5@<X8>)
{
  uint64_t v5;
  id v9;
  uint64_t result;

  v9 = objc_allocWithZone((Class)a3(a2));
  result = a4(a1);
  if (!v5)
    *a5 = result;
  return result;
}

uint64_t sub_2275663EC(_QWORD *a1)
{
  return sub_2275653C0(a1);
}

id MLMultiArray.subscript.getter(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_22758EC28();
    v4 = (uint64_t *)(a1 + 32);
    do
    {
      v5 = *v4++;
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v5);
      sub_22758EC04();
      sub_22758EC34();
      sub_22758EC40();
      sub_22758EC10();
      --v2;
    }
    while (v2);
  }
  sub_22730BA80(0, &qword_2540BA030);
  v6 = (void *)sub_22758E3C4();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v1, sel_objectForKeyedSubscript_, v6);

  return v7;
}

uint64_t sub_22756652C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  uint64_t TupleTypeMetadata2;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __n128 v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  uint64_t result;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;

  v39 = a4;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2, v8, v9, v10, v11);
  v12 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v13, v14, v15, v16, v17);
  v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v20, v21, v22, v23, v24);
  v27 = (char *)&v38 - v26;
  v28 = *a1;
  v30 = *(int *)(v29 + 48);
  v32 = v31 + v30;
  v33 = (char *)a2 + v30;
  v34 = *a2;
  (*(void (**)(uint64_t, char *, uint64_t, __n128))(v12 + 16))(v31 + v30, v33, a3, v25);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v27, v32, a3);
  sub_22758E448();
  LOBYTE(v32) = sub_22758E178();
  v35 = *(void (**)(char *, uint64_t))(v12 + 8);
  v35(v19, a3);
  result = ((uint64_t (*)(char *, uint64_t))v35)(v27, a3);
  if ((v32 & 1) != 0)
    v37 = v34;
  else
    v37 = v28;
  *v39 = v37;
  return result;
}

uint64_t sub_2275666B4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  return sub_22756652C(a1, a2, *(_QWORD *)(v3 + 16), a3);
}

uint64_t sub_2275666D0(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_227470E7C();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_227566748(v6);
  return sub_22758EC10();
}

uint64_t sub_227566748(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  float *v17;
  float v18;
  float *v19;
  uint64_t v20;
  BOOL v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  float *v28;
  float v29;
  float *v30;
  float v31;
  _QWORD *v32;
  uint64_t v33;
  float *v34;
  float v35;
  float *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  float *v48;
  float v49;
  float *v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  char *v54;
  char *v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  BOOL v67;
  unint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  BOOL v77;
  uint64_t v78;
  char v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  char *v97;
  char *v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  char *v107;
  uint64_t v108;
  float *v109;
  float v110;
  float *v111;
  char *v112;
  BOOL v113;
  char *v114;
  uint64_t v115;
  char *v116;
  char *v117;
  char *v118;
  uint64_t v119;
  char *v120;
  char *v121;
  unint64_t v122;
  float *v123;
  float v124;
  float *v125;
  char *v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  unint64_t v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  unint64_t v137;
  uint64_t *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  uint64_t v145;
  char *v146;
  char *v147;
  char *v148;
  unint64_t v149;
  int64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  char *__dst;
  uint64_t v157;

  v3 = a1[1];
  result = sub_22758EE20();
  v141 = v3;
  if (result >= v3)
  {
    if (v3 < 0)
    {
LABEL_194:
      __break(1u);
LABEL_195:
      __break(1u);
LABEL_196:
      __break(1u);
LABEL_197:
      __break(1u);
LABEL_198:
      __break(1u);
LABEL_199:
      sub_22758ED24();
      __break(1u);
      goto LABEL_200;
    }
    if ((unint64_t)v3 >= 2)
    {
      v9 = (uint64_t *)*a1;
      v10 = -1;
      v11 = 1;
      v12 = v9;
      do
      {
        v13 = v9[v11];
        v14 = v10;
        v15 = v12;
        do
        {
          v16 = *v15;
          v17 = (float *)(v13 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
          swift_beginAccess();
          v18 = *v17;
          v19 = (float *)(v16 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
          result = swift_beginAccess();
          if (*v19 >= v18)
            break;
          if (!v9)
            goto LABEL_195;
          v20 = *v15;
          v13 = v15[1];
          *v15 = v13;
          v15[1] = v20;
          --v15;
          v21 = __CFADD__(v14++, 1);
        }
        while (!v21);
        ++v11;
        ++v12;
        --v10;
      }
      while (v11 != v141);
    }
  }
  else
  {
    if (v3 >= 0)
      v5 = v3;
    else
      v5 = v3 + 1;
    if (v3 < -1)
    {
LABEL_200:
      result = sub_22758ECB8();
      __break(1u);
      return result;
    }
    v140 = result;
    v138 = a1;
    if (v3 >= 2)
    {
      v6 = v5 >> 1;
      type metadata accessor for MindNetModelBoundingBox();
      v7 = sub_22758E418();
      *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
      v8 = (v7 & 0xFFFFFFFFFFFFFF8) + 32;
      v157 = v7;
      goto LABEL_19;
    }
    v22 = (char *)MEMORY[0x24BEE4AF8];
    v157 = MEMORY[0x24BEE4AF8];
    v8 = (MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32;
    if (v3 == 1)
    {
LABEL_19:
      v23 = 0;
      v139 = *a1 + 16;
      v145 = *a1;
      v142 = *a1 - 8;
      v22 = (char *)MEMORY[0x24BEE4AF8];
      __dst = (char *)v8;
      while (1)
      {
        v25 = v23++;
        v154 = v25;
        if (v23 >= v3)
        {
          v26 = v145;
        }
        else
        {
          v26 = v145;
          v27 = *(_QWORD *)(v145 + 8 * v25);
          v28 = (float *)(*(_QWORD *)(v145 + 8 * v23) + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
          swift_beginAccess();
          v29 = *v28;
          v30 = (float *)(v27 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
          swift_beginAccess();
          v31 = *v30;
          v23 = v25 + 2;
          if (v25 + 2 < v3)
          {
            v32 = (_QWORD *)(v139 + 8 * v25);
            while (1)
            {
              v33 = *(v32 - 1);
              v34 = (float *)(*v32 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
              swift_beginAccess();
              v35 = *v34;
              v36 = (float *)(v33 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
              swift_beginAccess();
              if (v31 < v29 == *v36 >= v35)
                break;
              ++v23;
              ++v32;
              if (v3 == v23)
              {
                v23 = v3;
                break;
              }
            }
            v8 = (unint64_t)__dst;
          }
          if (v31 < v29)
          {
            if (v23 < v25)
              goto LABEL_190;
            if (v25 < v23)
            {
              v37 = (uint64_t *)(v142 + 8 * v23);
              v38 = v23;
              v39 = v25;
              v40 = (uint64_t *)(v145 + 8 * v25);
              do
              {
                if (v39 != --v38)
                {
                  if (!v145)
                    goto LABEL_197;
                  v41 = *v40;
                  *v40 = *v37;
                  *v37 = v41;
                }
                ++v39;
                --v37;
                ++v40;
              }
              while (v39 < v38);
            }
          }
        }
        if (v23 < v3)
        {
          if (__OFSUB__(v23, v25))
            goto LABEL_185;
          if (v23 - v25 < v140)
          {
            if (__OFADD__(v25, v140))
              goto LABEL_191;
            if (v25 + v140 >= v3)
              v42 = v3;
            else
              v42 = v25 + v140;
            if (v42 < v25)
              goto LABEL_192;
            if (v23 != v42)
            {
              v43 = (uint64_t *)(v142 + 8 * v23);
              v152 = v42;
              do
              {
                v44 = *(_QWORD *)(v26 + 8 * v23);
                v45 = v25;
                v46 = v43;
                do
                {
                  v47 = *v46;
                  v48 = (float *)(v44 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
                  swift_beginAccess();
                  v49 = *v48;
                  v50 = (float *)(v47 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
                  swift_beginAccess();
                  if (*v50 >= v49)
                    break;
                  if (!v26)
                    goto LABEL_193;
                  v51 = *v46;
                  v44 = v46[1];
                  *v46 = v44;
                  v46[1] = v51;
                  --v46;
                  ++v45;
                }
                while (v23 != v45);
                ++v23;
                ++v43;
                v25 = v154;
              }
              while (v23 != v152);
              v23 = v152;
              v8 = (unint64_t)__dst;
            }
          }
        }
        if (v23 < v25)
          goto LABEL_184;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v22 = sub_227466C8C(0, *((_QWORD *)v22 + 2) + 1, 1, v22);
        v53 = *((_QWORD *)v22 + 2);
        v52 = *((_QWORD *)v22 + 3);
        v24 = v53 + 1;
        if (v53 >= v52 >> 1)
          v22 = sub_227466C8C((char *)(v52 > 1), v53 + 1, 1, v22);
        *((_QWORD *)v22 + 2) = v24;
        v146 = v22 + 32;
        v54 = &v22[16 * v53 + 32];
        *(_QWORD *)v54 = v25;
        *((_QWORD *)v54 + 1) = v23;
        if (v53)
          break;
        v24 = 1;
LABEL_21:
        v3 = v141;
        if (v23 >= v141)
          goto LABEL_156;
      }
      v55 = v22 + 32;
      v143 = v23;
      v144 = v22;
      while (1)
      {
        v56 = v24 - 1;
        if (v24 >= 4)
        {
          v61 = &v55[16 * v24];
          v62 = *((_QWORD *)v61 - 8);
          v63 = *((_QWORD *)v61 - 7);
          v67 = __OFSUB__(v63, v62);
          v64 = v63 - v62;
          if (v67)
            goto LABEL_173;
          v66 = *((_QWORD *)v61 - 6);
          v65 = *((_QWORD *)v61 - 5);
          v67 = __OFSUB__(v65, v66);
          v59 = v65 - v66;
          v60 = v67;
          if (v67)
            goto LABEL_174;
          v68 = v24 - 2;
          v69 = &v55[16 * v24 - 32];
          v71 = *(_QWORD *)v69;
          v70 = *((_QWORD *)v69 + 1);
          v67 = __OFSUB__(v70, v71);
          v72 = v70 - v71;
          if (v67)
            goto LABEL_176;
          v67 = __OFADD__(v59, v72);
          v73 = v59 + v72;
          if (v67)
            goto LABEL_179;
          if (v73 >= v64)
          {
            v91 = &v55[16 * v56];
            v93 = *(_QWORD *)v91;
            v92 = *((_QWORD *)v91 + 1);
            v67 = __OFSUB__(v92, v93);
            v94 = v92 - v93;
            if (v67)
              goto LABEL_183;
            v84 = v59 < v94;
            goto LABEL_94;
          }
        }
        else
        {
          if (v24 != 3)
          {
            v85 = *((_QWORD *)v22 + 4);
            v86 = *((_QWORD *)v22 + 5);
            v67 = __OFSUB__(v86, v85);
            v78 = v86 - v85;
            v79 = v67;
            goto LABEL_88;
          }
          v58 = *((_QWORD *)v22 + 4);
          v57 = *((_QWORD *)v22 + 5);
          v67 = __OFSUB__(v57, v58);
          v59 = v57 - v58;
          v60 = v67;
        }
        if ((v60 & 1) != 0)
          goto LABEL_175;
        v68 = v24 - 2;
        v74 = &v55[16 * v24 - 32];
        v76 = *(_QWORD *)v74;
        v75 = *((_QWORD *)v74 + 1);
        v77 = __OFSUB__(v75, v76);
        v78 = v75 - v76;
        v79 = v77;
        if (v77)
          goto LABEL_178;
        v80 = &v55[16 * v56];
        v82 = *(_QWORD *)v80;
        v81 = *((_QWORD *)v80 + 1);
        v67 = __OFSUB__(v81, v82);
        v83 = v81 - v82;
        if (v67)
          goto LABEL_181;
        if (__OFADD__(v78, v83))
          goto LABEL_182;
        if (v78 + v83 >= v59)
        {
          v84 = v59 < v83;
LABEL_94:
          if (v84)
            v56 = v68;
          goto LABEL_96;
        }
LABEL_88:
        if ((v79 & 1) != 0)
          goto LABEL_177;
        v87 = &v55[16 * v56];
        v89 = *(_QWORD *)v87;
        v88 = *((_QWORD *)v87 + 1);
        v67 = __OFSUB__(v88, v89);
        v90 = v88 - v89;
        if (v67)
          goto LABEL_180;
        if (v90 < v78)
          goto LABEL_21;
LABEL_96:
        if (v56 - 1 >= v24)
        {
          __break(1u);
LABEL_170:
          __break(1u);
LABEL_171:
          __break(1u);
LABEL_172:
          __break(1u);
LABEL_173:
          __break(1u);
LABEL_174:
          __break(1u);
LABEL_175:
          __break(1u);
LABEL_176:
          __break(1u);
LABEL_177:
          __break(1u);
LABEL_178:
          __break(1u);
LABEL_179:
          __break(1u);
LABEL_180:
          __break(1u);
LABEL_181:
          __break(1u);
LABEL_182:
          __break(1u);
LABEL_183:
          __break(1u);
LABEL_184:
          __break(1u);
LABEL_185:
          __break(1u);
          goto LABEL_186;
        }
        if (!v145)
          goto LABEL_196;
        v149 = v56 - 1;
        v150 = v56;
        v148 = &v55[16 * v56 - 16];
        v95 = &v55[16 * v56];
        v96 = *(_QWORD *)v95;
        v147 = v95;
        v151 = *(_QWORD *)v148;
        v153 = *((_QWORD *)v95 + 1);
        v97 = (char *)(v145 + 8 * *(_QWORD *)v148);
        v98 = (char *)(v145 + 8 * *(_QWORD *)v95);
        v99 = v145 + 8 * v153;
        v100 = v98 - v97;
        v101 = v98 - v97 + 7;
        if (v98 - v97 >= 0)
          v101 = v98 - v97;
        v102 = v101 >> 3;
        v103 = v99 - (_QWORD)v98;
        v104 = v99 - (_QWORD)v98 + 7;
        if ((uint64_t)(v99 - (_QWORD)v98) >= 0)
          v104 = v99 - (_QWORD)v98;
        v105 = v104 >> 3;
        if (v102 >= v104 >> 3)
        {
          if (v103 < -7)
            goto LABEL_199;
          if ((unint64_t)__dst >= v99 || __dst != v98)
            memmove(__dst, v98, 8 * v105);
          v114 = &__dst[8 * v105];
          v115 = v151;
          v8 = (unint64_t)__dst;
          if (v151 >= v96 || v103 < 8)
          {
            v107 = __dst;
            goto LABEL_144;
          }
          v116 = (char *)(v142 + 8 * v153);
          v155 = v97;
          while (2)
          {
            v117 = v114 - 8;
            v118 = v116 + 8;
            v120 = v98 - 8;
            v119 = *((_QWORD *)v98 - 1);
            v121 = v98;
            v122 = (unint64_t)v114;
            v123 = (float *)(*((_QWORD *)v114 - 1) + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
            swift_beginAccess();
            v124 = *v123;
            v125 = (float *)(v119 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
            swift_beginAccess();
            if (*v125 < v124)
            {
              if (v118 == v121)
              {
                v21 = v116 >= v121;
                v126 = v120;
                v8 = (unint64_t)__dst;
                v114 = (char *)v122;
                v127 = v155;
                if (!v21)
                  goto LABEL_137;
              }
              else
              {
                v126 = v120;
                v127 = v155;
                v8 = (unint64_t)__dst;
                v114 = (char *)v122;
              }
              goto LABEL_136;
            }
            v126 = v121;
            v120 = v117;
            if (v118 != (char *)v122)
            {
              v114 = v117;
              v127 = v155;
              v8 = (unint64_t)__dst;
              goto LABEL_136;
            }
            v114 = v117;
            v8 = (unint64_t)__dst;
            v127 = v155;
            if ((unint64_t)v116 >= v122)
LABEL_136:
              *(_QWORD *)v116 = *(_QWORD *)v120;
LABEL_137:
            v98 = v126;
            if (v127 >= v126 || (v116 -= 8, v8 >= (unint64_t)v114))
            {
              v107 = (char *)v8;
              goto LABEL_142;
            }
            continue;
          }
        }
        if (v100 < -7)
          goto LABEL_199;
        v8 = (unint64_t)__dst;
        if (__dst != v97 || __dst >= v98)
          memmove(__dst, v97, 8 * v102);
        v106 = &__dst[8 * v102];
        if (v96 < v153 && v100 >= 8)
        {
          v107 = __dst;
          while (1)
          {
            v108 = *(_QWORD *)v107;
            v109 = (float *)(*(_QWORD *)v98 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
            swift_beginAccess();
            v110 = *v109;
            v111 = (float *)(v108 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
            swift_beginAccess();
            if (*v111 >= v110)
              break;
            v112 = v98;
            v113 = v97 == v98;
            v98 += 8;
            if (!v113)
              goto LABEL_115;
LABEL_116:
            v97 += 8;
            if (v107 >= v106 || (unint64_t)v98 >= v99)
            {
              v114 = v106;
              goto LABEL_141;
            }
          }
          v112 = v107;
          v113 = v97 == v107;
          v107 += 8;
          if (v113)
            goto LABEL_116;
LABEL_115:
          *(_QWORD *)v97 = *(_QWORD *)v112;
          goto LABEL_116;
        }
        v114 = v106;
        v107 = __dst;
LABEL_141:
        v98 = v97;
LABEL_142:
        v115 = v151;
LABEL_144:
        v128 = v114 - v107 + 7;
        if (v114 - v107 >= 0)
          v128 = v114 - v107;
        v22 = v144;
        if (v114 - v107 <= -8)
          goto LABEL_199;
        v129 = v128 >> 3;
        if (v98 != v107 || v98 >= &v107[8 * v129])
          memmove(v98, v107, 8 * v129);
        if (v153 < v115)
          goto LABEL_170;
        if (v150 > *((_QWORD *)v144 + 2))
          goto LABEL_171;
        *(_QWORD *)v148 = v115;
        v55 = v146;
        *(_QWORD *)&v146[16 * v149 + 8] = v153;
        v130 = *((_QWORD *)v144 + 2);
        if (v150 >= (uint64_t)v130)
          goto LABEL_172;
        v24 = v130 - 1;
        memmove(v147, v147 + 16, 16 * (v130 - 1 - v150));
        *((_QWORD *)v144 + 2) = v130 - 1;
        v84 = v130 > 2;
        v23 = v143;
        if (!v84)
          goto LABEL_21;
      }
    }
    v24 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_156:
    if (v24 >= 2)
    {
      v131 = *v138;
      while (1)
      {
        v132 = v24 - 2;
        if (v24 < 2)
          break;
        if (!v131)
          goto LABEL_198;
        v133 = (char *)v8;
        v134 = *(_QWORD *)&v22[16 * v132 + 32];
        v135 = *(_QWORD *)&v22[16 * v24 + 24];
        sub_22756723C((char *)(v131 + 8 * v134), (char *)(v131 + 8 * *(_QWORD *)&v22[16 * v24 + 16]), v131 + 8 * v135, v133);
        if (v1)
          goto LABEL_167;
        if (v135 < v134)
          goto LABEL_187;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v22 = sub_227467370((uint64_t)v22);
        if (v132 >= *((_QWORD *)v22 + 2))
          goto LABEL_188;
        v136 = &v22[16 * v132 + 32];
        *(_QWORD *)v136 = v134;
        *((_QWORD *)v136 + 1) = v135;
        v137 = *((_QWORD *)v22 + 2);
        if (v24 > v137)
          goto LABEL_189;
        memmove(&v22[16 * v24 + 16], &v22[16 * v24 + 32], 16 * (v137 - v24));
        *((_QWORD *)v22 + 2) = v137 - 1;
        v24 = v137 - 1;
        v8 = (unint64_t)v133;
        if (v137 <= 2)
          goto LABEL_167;
      }
LABEL_186:
      __break(1u);
LABEL_187:
      __break(1u);
LABEL_188:
      __break(1u);
LABEL_189:
      __break(1u);
LABEL_190:
      __break(1u);
LABEL_191:
      __break(1u);
LABEL_192:
      __break(1u);
LABEL_193:
      __break(1u);
      goto LABEL_194;
    }
LABEL_167:
    swift_bridgeObjectRelease();
    *(_QWORD *)((v157 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
    sub_22758E3F4();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_22756723C(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  float *v16;
  float v17;
  float *v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  float *v26;
  float v27;
  float *v28;
  char *v29;
  uint64_t result;
  char *v31;
  char *v32;
  char *v33;
  char *v34;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 7;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 3;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 3;
  v33 = __dst;
  v34 = __src;
  if (v10 >= v12 >> 3)
  {
    if (v11 < -7)
      goto LABEL_45;
    if (__dst != a2 || &a2[8 * v13] <= __dst)
      memmove(__dst, a2, 8 * v13);
    v20 = &v4[8 * v13];
    v32 = v20;
    v34 = v6;
    if (v7 >= v6 || v11 < 8)
      goto LABEL_44;
    v21 = (char *)(a3 - 8);
    v22 = v6;
    v31 = v4;
    while (1)
    {
      v23 = v21 + 8;
      v24 = v20 - 8;
      v25 = *((_QWORD *)v22 - 1);
      v22 -= 8;
      v26 = (float *)(*((_QWORD *)v20 - 1) + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
      swift_beginAccess();
      v27 = *v26;
      v28 = (float *)(v25 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
      swift_beginAccess();
      if (*v28 >= v27)
      {
        v32 = v20 - 8;
        if (v23 >= v20 && v21 < v20)
        {
          v29 = v31;
          if (v23 != v20)
            *(_QWORD *)v21 = *(_QWORD *)v24;
          v22 = v6;
          v20 -= 8;
          goto LABEL_42;
        }
        *(_QWORD *)v21 = *(_QWORD *)v24;
        v22 = v6;
        v20 -= 8;
      }
      else
      {
        if (v23 != v6 || v21 >= v6)
          *(_QWORD *)v21 = *(_QWORD *)v22;
        v34 = v22;
      }
      v29 = v31;
LABEL_42:
      if (v22 > v7)
      {
        v21 -= 8;
        v6 = v22;
        if (v20 > v29)
          continue;
      }
      goto LABEL_44;
    }
  }
  if (v8 >= -7)
  {
    if (__dst != __src || &__src[8 * v10] <= __dst)
      memmove(__dst, __src, 8 * v10);
    v14 = &v4[8 * v10];
    v32 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      do
      {
        v15 = *(_QWORD *)v4;
        v16 = (float *)(*(_QWORD *)v6 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
        swift_beginAccess();
        v17 = *v16;
        v18 = (float *)(v15 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
        swift_beginAccess();
        if (*v18 >= v17)
        {
          if (v7 != v4)
            *(_QWORD *)v7 = *(_QWORD *)v4;
          v4 += 8;
          v33 = v4;
          v19 = v6;
        }
        else
        {
          v19 = v6 + 8;
          if (v7 < v6 || v7 >= v19 || v7 != v6)
            *(_QWORD *)v7 = *(_QWORD *)v6;
        }
        v7 += 8;
        if (v4 >= v14)
          break;
        v6 = v19;
      }
      while ((unint64_t)v19 < a3);
      v34 = v7;
    }
LABEL_44:
    sub_227467040((void **)&v34, (const void **)&v33, &v32);
    return 1;
  }
LABEL_45:
  result = sub_22758ED24();
  __break(1u);
  return result;
}

uint64_t sub_22756755C(unint64_t a1, CGRect *a2, float a3)
{
  uint64_t v6;
  CGRect *v7;
  unint64_t i;
  char *v9;
  void *v10;
  unint64_t v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  float v23;
  uint64_t v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v25 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_21;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  v7 = (CGRect *)((char *)a2 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect);
  swift_beginAccess();
  if (v6)
  {
    for (i = 0; ; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v9 = (char *)MEMORY[0x2276B2BEC](i, a1);
      }
      else
      {
        if (i >= *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_20:
          __break(1u);
LABEL_21:
          v6 = sub_22758ECE8();
          goto LABEL_3;
        }
        v9 = (char *)*(id *)(a1 + 8 * i + 32);
      }
      v10 = v9;
      v11 = i + 1;
      if (__OFADD__(i, 1))
        goto LABEL_20;
      a2 = (CGRect *)&v9[OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect];
      swift_beginAccess();
      v26 = CGRectUnion(*a2, *v7);
      x = v26.origin.x;
      y = v26.origin.y;
      width = v26.size.width;
      height = v26.size.height;
      v16 = CGRectGetHeight(v26);
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      v17 = sqrt(v16 * CGRectGetWidth(v27));
      if (v17 == 0.0)
      {
        if (a3 >= 0.0)
          goto LABEL_15;
      }
      else
      {
        v28 = CGRectIntersection(*a2, *v7);
        v18 = v28.origin.x;
        v19 = v28.origin.y;
        v20 = v28.size.width;
        v21 = v28.size.height;
        v22 = CGRectGetHeight(v28);
        v29.origin.x = v18;
        v29.origin.y = v19;
        v29.size.width = v20;
        v29.size.height = v21;
        v23 = sqrt(v22 * CGRectGetWidth(v29)) / v17;
        if (v23 <= a3)
        {
LABEL_15:
          sub_22758EC04();
          sub_22758EC34();
          v11 = i + 1;
          sub_22758EC40();
          a2 = (CGRect *)&v25;
          sub_22758EC10();
          goto LABEL_6;
        }
      }
      *v7 = CGRectUnion(*v7, *a2);

LABEL_6:
      if (v11 == v6)
        return v25;
    }
  }
  return MEMORY[0x24BEE4AF8];
}

unint64_t _s16MagnifierSupport23MindNetModelBoundingBoxC24nonMaximalSuppressionIOU5boxes9thresholdSayACGAG_SftFZ_0(unint64_t a1, float a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  CGRect *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16[2];
  uint64_t v17;

  v3 = a1;
  v17 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_21;
  if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    swift_bridgeObjectRetain();
    do
    {
      while (1)
      {
        if ((v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
        {
          swift_bridgeObjectRetain_n();
          v4 = (uint64_t)sub_2273A63F4(v3);
          swift_bridgeObjectRelease();
        }
        else
        {
          v4 = v3 & 0xFFFFFFFFFFFFFF8;
          swift_bridgeObjectRetain_n();
        }
        v16[0] = v4;
        sub_2275666D0(v16);
        swift_bridgeObjectRelease_n();
        v5 = v16[0];
        isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
        v16[1] = v5;
        if (!isUniquelyReferenced_nonNull_bridgeObject || v5 < 0 || (v5 & 0x4000000000000000) != 0)
          sub_22738D1A0(v5);
        v3 = v5 & 0xFFFFFFFFFFFFFF8;
        v7 = *(_QWORD *)(v3 + 16);
        if (!v7)
          break;
        v8 = v7 - 1;
        v10 = *(void **)(v3 + 32);
        v9 = v3 + 32;
        memmove((void *)v9, (const void *)(v9 + 8), 8 * (v7 - 1));
        *(_QWORD *)(v9 - 16) = v8;
        sub_22758E3F4();
        v11 = v10;
        MEMORY[0x2276B23C4]();
        if (*(_QWORD *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_22758E400();
        sub_22758E424();
        sub_22758E3F4();
        v12 = swift_bridgeObjectRetain();
        v3 = sub_22756755C(v12, v11, a2);
        swift_bridgeObjectRelease_n();

        if (v3 >> 62)
        {
          swift_bridgeObjectRetain();
          v13 = sub_22758ECE8();
          swift_bridgeObjectRelease();
          if (v13 <= 0)
          {
LABEL_19:
            swift_bridgeObjectRelease();
            return v17;
          }
        }
        else if (*(uint64_t *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10) <= 0)
        {
          goto LABEL_19;
        }
      }
      __break(1u);
LABEL_21:
      swift_bridgeObjectRetain();
      v14 = sub_22758ECE8();
      swift_bridgeObjectRelease();
      if (v14 <= 0)
        goto LABEL_24;
      swift_bridgeObjectRetain();
    }
    while (sub_22758ECE8() >= 1);
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  else
  {
LABEL_24:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  return v3;
}

void sub_227567A70(float a1, uint64_t a2, _QWORD *inited)
{
  uint64_t v3;
  int64_t v4;
  double v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char **v27;
  char *v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id i;
  void *v39;
  _BOOL4 v40;
  _BOOL4 v41;
  _BOOL4 v42;
  char *v43;
  uint64_t v44;
  void *v45;
  id v46;
  int v47;
  int v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  float v52;
  uint64_t v53;
  char v54;
  id v55;
  float v56;
  float v57;
  uint64_t v58;
  id v59;
  float v60;
  float v61;
  uint64_t v62;
  id v63;
  float v64;
  float v65;
  uint64_t v66;
  double v67;
  double v68;
  id v69;
  float v70;
  float v71;
  uint64_t v72;
  id v73;
  id v74;
  unint64_t v75;
  char **v76;
  unint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  int64_t v81;
  double v82;
  double v83;
  _BOOL4 v84;
  int64_t v85;
  _BOOL4 v86;
  int64_t v87;
  _BOOL4 v88;
  char *v89;
  id *v90;
  _QWORD *v91;
  __int128 v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;

  *(float *)&v5 = a1;
  v7 = sub_22758C984();
  MEMORY[0x24BDAC7A8](v7, v8, v9, v10, v11);
  v89 = (char *)&v76 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DEB10);
  v14 = *(_QWORD *)(v13 - 8);
  v19 = MEMORY[0x24BDAC7A8](v13, v15, v16, v17, v18);
  v21 = (char *)&v76 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19, v22, v23, v24, v25);
  v27 = (char **)((char *)&v76 - v26);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558DEB18);
  sub_22758D0A4();
  sub_22730BA80(0, &qword_2558DEB70);
  (*(void (**)(char *, char **, uint64_t))(v14 + 16))(v21, v27, v13);
  sub_22730BB7C(&qword_2558DEB68, &qword_2558DEB10, MEMORY[0x24BDBFD50]);
  v28 = (char *)sub_22758E67C();
  v29 = (unint64_t)&selRef_userInteractionEnded;
  v30 = objc_msgSend(v28, sel_shape);
  v93 = sub_22730BA80(0, &qword_2540BA030);
  v31 = sub_22758E3DC();

  if ((v31 & 0xC000000000000001) != 0)
    goto LABEL_69;
  if (*(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v32 = *(id *)(v31 + 32);
    goto LABEL_4;
  }
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  v35 = (id)MEMORY[0x2276B2BEC](1, v31);
LABEL_8:
  v36 = v35;
  swift_bridgeObjectRelease();
  v3 = sub_22758E5E0();

  v37 = objc_msgSend(v28, *(SEL *)(v29 + 2168));
  v31 = sub_22758E3DC();

  if ((v31 & 0xC000000000000001) != 0)
    goto LABEL_74;
  if (*(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10) >= 3uLL)
  {
    for (i = *(id *)(v31 + 48); ; i = (id)MEMORY[0x2276B2BEC](2, v31))
    {
      v39 = i;
      swift_bridgeObjectRelease();
      v31 = sub_22758E5E0();

      v97 = MEMORY[0x24BEE4AF8];
      if (v3 < 0)
        goto LABEL_76;
      v94 = v28;
      if (!v3)
      {
LABEL_59:
        v75 = MEMORY[0x24BEE4AF8];
LABEL_60:
        _s16MagnifierSupport23MindNetModelBoundingBoxC24nonMaximalSuppressionIOU5boxes9thresholdSayACGAG_SftFZ_0(v75, *(float *)&v5);
        swift_bridgeObjectRelease();

        (*(void (**)(char **, uint64_t))(v14 + 8))(v27, v13);
        return;
      }
      if (v31 < 0)
        goto LABEL_77;
      v76 = v27;
      v77 = v14;
      v78 = v13;
      v79 = LODWORD(v5);
      v13 = 0;
      v87 = v4 + 1;
      v83 = (double)v31;
      v40 = __OFADD__(v4, 1);
      v88 = v40;
      v82 = (double)v3;
      v85 = v4 + 2;
      v41 = __OFADD__(v4, 2);
      v86 = v41;
      v81 = v4 + 3;
      v42 = __OFADD__(v4, 3);
      v84 = v42;
      v5 = 0.5;
      v14 = 0x24BDD1000uLL;
      v27 = &selRef_userInteractionEnded;
      v91 = inited;
      v28 = (char *)v4;
      v90 = (id *)v31;
      v80 = v3;
      v92 = xmmword_227596570;
      while (1)
      {
        if (v13 == v3)
          goto LABEL_67;
        if (v31)
          break;
LABEL_24:
        ++v13;
        v3 = v80;
        if (v13 == v80)
        {
          v75 = v97;
          LODWORD(v5) = v79;
          v13 = v78;
          v14 = v77;
          v27 = v76;
          goto LABEL_60;
        }
      }
      if (v4 < 0)
        goto LABEL_68;
      v3 = 0;
      while (v3 != v31)
      {
        if (v4)
        {
          v96 = MEMORY[0x24BEE4AF8];
          sub_227324824(0, v4, 0);
          v43 = 0;
          v44 = v96;
          do
          {
            v95 = MEMORY[0x24BEE4AF8];
            sub_22758EC28();
            objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v43);
            sub_22758EC04();
            sub_22758EC34();
            sub_22758EC40();
            sub_22758EC10();
            objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v13);
            sub_22758EC04();
            sub_22758EC34();
            sub_22758EC40();
            sub_22758EC10();
            objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, v3);
            sub_22758EC04();
            sub_22758EC34();
            sub_22758EC40();
            sub_22758EC10();
            v45 = (void *)sub_22758E3C4();
            swift_release();
            v46 = objc_msgSend(v94, sel_objectForKeyedSubscript_, v45);

            objc_msgSend(v46, sel_floatValue);
            v48 = v47;

            v96 = v44;
            v50 = *(_QWORD *)(v44 + 16);
            v49 = *(_QWORD *)(v44 + 24);
            v31 = v50 + 1;
            if (v50 >= v49 >> 1)
            {
              sub_227324824(v49 > 1, v50 + 1, 1);
              v44 = v96;
            }
            ++v43;
            *(_QWORD *)(v44 + 16) = v31;
            *(_DWORD *)(v44 + 4 * v50 + 32) = v48;
          }
          while (v28 != v43);
          inited = v91;
        }
        else
        {
          v44 = MEMORY[0x24BEE4AF8];
          v31 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
          if (!v31)
          {
            v29 = 0;
            goto LABEL_63;
          }
        }
        v51 = 0;
        v29 = 0;
        do
        {
          if (v29 >= v31)
          {
            __break(1u);
            goto LABEL_59;
          }
          if (*(float *)(v44 + 32 + 4 * v29) < *(float *)(v44 + 4 * v51 + 32))
            v29 = v51;
          ++v51;
        }
        while (v31 != v51);
        if (v29 >= v31)
          goto LABEL_63;
        if (v29 >= 5)
          goto LABEL_78;
        v52 = *(float *)(v44 + 4 * v29 + 32);
        if (inited[2] && (v53 = sub_2274DE4F0(v29), (v54 & 1) != 0))
        {
          if (*(float *)(inited[7] + 4 * v53) > v52)
            goto LABEL_29;
        }
        else if (v52 < 0.3)
        {
LABEL_29:
          swift_bridgeObjectRelease();
          goto LABEL_30;
        }
        v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5C50);
        inited = (_QWORD *)swift_initStackObject();
        *((_OWORD *)inited + 1) = v92;
        inited[4] = v28;
        inited[5] = v13;
        inited[6] = v3;
        v55 = MLMultiArray.subscript.getter((uint64_t)inited);
        objc_msgSend(v55, sel_floatValue);
        v57 = v56;

        swift_setDeallocating();
        v58 = swift_initStackObject();
        *(_OWORD *)(v58 + 16) = v92;
        if (v88)
          goto LABEL_64;
        inited = (_QWORD *)v58;
        *(_QWORD *)(v58 + 32) = v87;
        *(_QWORD *)(v58 + 40) = v13;
        *(_QWORD *)(v58 + 48) = v3;
        v59 = MLMultiArray.subscript.getter(v58);
        objc_msgSend(v59, sel_floatValue);
        v61 = v60;

        swift_setDeallocating();
        v62 = swift_initStackObject();
        *(_OWORD *)(v62 + 16) = v92;
        if (v86)
          goto LABEL_65;
        inited = (_QWORD *)v62;
        *(_QWORD *)(v62 + 32) = v85;
        *(_QWORD *)(v62 + 40) = v13;
        *(_QWORD *)(v62 + 48) = v3;
        v63 = MLMultiArray.subscript.getter(v62);
        objc_msgSend(v63, sel_floatValue);
        v65 = v64;

        swift_setDeallocating();
        v66 = swift_initStackObject();
        *(_OWORD *)(v66 + 16) = v92;
        if (v84)
          goto LABEL_66;
        v67 = ((double)v3 + v61) / v83;
        v68 = 1.0 - ((double)v13 + v57) / v82;
        *(_QWORD *)(v66 + 32) = v81;
        *(_QWORD *)(v66 + 40) = v13;
        *(_QWORD *)(v66 + 48) = v3;
        v69 = MLMultiArray.subscript.getter(v66);
        objc_msgSend(v69, sel_floatValue);
        v71 = v70;

        swift_setDeallocating();
        v72 = (uint64_t)v89;
        sub_22758C978();
        v73 = objc_allocWithZone((Class)type metadata accessor for MindNetModelBoundingBox());
        v74 = MindNetModelBoundingBox.init(id:timestamp:heat:angle:rect:classIndex:heatByClass:)(v72, v29, v44, 0.0, v52, 0.0, v67 - v71 * 0.5, v68 - v65 * 0.5, v71, v65);
        MEMORY[0x2276B23C4]();
        v29 = *(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v29 >= *(_QWORD *)((v97 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_22758E400();
        sub_22758E424();
        sub_22758E3F4();

        inited = v91;
LABEL_30:
        v4 = (int64_t)v28;
        ++v3;
        v31 = (uint64_t)v90;
        if ((id *)v3 == v90)
          goto LABEL_24;
      }
      __break(1u);
LABEL_63:
      __break(1u);
LABEL_64:
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
LABEL_69:
      v32 = (id)MEMORY[0x2276B2BEC](0, v31);
LABEL_4:
      v33 = v32;
      swift_bridgeObjectRelease();
      v31 = (uint64_t)objc_msgSend(v33, sel_integerValue);

      v4 = v31 - 4;
      if (__OFSUB__(v31, 4))
        goto LABEL_71;
      v34 = objc_msgSend(v28, *(SEL *)(v29 + 2168));
      v31 = sub_22758E3DC();

      if ((v31 & 0xC000000000000001) != 0)
        goto LABEL_72;
      if (*(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
      {
        v35 = *(id *)(v31 + 40);
        goto LABEL_8;
      }
      __break(1u);
LABEL_74:
      ;
    }
  }
  __break(1u);
LABEL_76:
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  __break(1u);
}

id sub_227568438(uint64_t a1)
{
  void *v1;
  CGRect *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  char *v8;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat v11;
  CGFloat v12;
  CGFloat *v13;
  float *v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  objc_super v20;
  CGRect v21;

  v3 = (CGRect *)(a1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect);
  swift_beginAccess();
  x = v3->origin.x;
  y = v3->origin.y;
  width = v3->size.width;
  height = v3->size.height;
  v8 = v1;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  MinX = CGRectGetMinX(v21);
  MinY = CGRectGetMinY(*v3);
  v11 = CGRectGetWidth(*v3);
  v12 = CGRectGetHeight(*v3);
  v13 = (CGFloat *)&v8[OBJC_IVAR____TtC16MagnifierSupport22DoorSignDetectorResult_box];
  *v13 = MinX;
  v13[1] = MinY;
  v13[2] = v11;
  v13[3] = v12;
  v14 = (float *)(a1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
  swift_beginAccess();
  *(double *)&v8[OBJC_IVAR____TtC16MagnifierSupport22DoorSignDetectorResult_confidence] = *v14;
  v15 = (_QWORD *)(a1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_classIndex);
  swift_beginAccess();
  if (*v15 > 4uLL)
  {
    v16 = 0;
    v17 = 0xE000000000000000;
  }
  else
  {
    sub_2275622C0();
  }
  v18 = &v8[OBJC_IVAR____TtC16MagnifierSupport22DoorSignDetectorResult_labelName];
  *(_QWORD *)v18 = v16;
  *((_QWORD *)v18 + 1) = v17;

  v20.receiver = v8;
  v20.super_class = (Class)type metadata accessor for DoorSignDetectorResult();
  return objc_msgSendSuper2(&v20, sel_init);
}

uint64_t type metadata accessor for DoorSignDetectorResult()
{
  return objc_opt_self();
}

unint64_t sub_2275685C0()
{
  unint64_t result;

  result = qword_2558DE850;
  if (!qword_2558DE850)
  {
    result = MEMORY[0x2276B3C78](&unk_2275A807C, &type metadata for DoorSignDetectorResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2558DE850);
  }
  return result;
}

uint64_t type metadata accessor for MindNetModelBoundingBox()
{
  uint64_t result;

  result = qword_2558DEAB8;
  if (!qword_2558DEAB8)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_227568640()
{
  unint64_t result;

  result = qword_2558DE890;
  if (!qword_2558DE890)
  {
    result = MEMORY[0x2276B3C78](&unk_2275A802C, &type metadata for MindNetModelBoundingBox.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2558DE890);
  }
  return result;
}

uint64_t sub_227568684(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558DE8A0);
    v8 = a2;
    result = MEMORY[0x2276B3C78](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2275686E4(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558DE8C0);
    v10 = sub_22730BB7C(a2, &qword_2558DE8B0, a3);
    result = MEMORY[0x2276B3C78](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22756876C()
{
  unint64_t result;

  result = qword_2558DE910;
  if (!qword_2558DE910)
  {
    result = MEMORY[0x2276B3C78](&protocol conformance descriptor for DoorSignDetectorType, &type metadata for DoorSignDetectorType);
    atomic_store(result, (unint64_t *)&qword_2558DE910);
  }
  return result;
}

uint64_t sub_2275687B0()
{
  return sub_22730BB7C(&qword_2558DE918, &qword_2558DE920, MEMORY[0x24BEE12E0]);
}

uint64_t sub_2275687DC()
{
  return MEMORY[0x24BEE0948];
}

float sub_2275687F0@<S0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat, a2);
}

uint64_t sub_2275687FC(int *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heat);
}

float sub_227568808@<S0>(_QWORD *a1@<X0>, _DWORD *a2@<X8>)
{
  return keypath_get_1Tm(a1, &OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_angle, a2);
}

float keypath_get_1Tm@<S0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _DWORD *a3@<X8>)
{
  float *v4;
  float result;

  v4 = (float *)(*a1 + *a2);
  swift_beginAccess();
  result = *v4;
  *a3 = *(_DWORD *)v4;
  return result;
}

uint64_t sub_227568860(int *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_2Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_angle);
}

uint64_t keypath_set_2Tm(int *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  int v5;
  _DWORD *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_DWORD *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

float64x2_t sub_2275688C0(float64x2_t *a1, _QWORD *a2)
{
  float64x2_t *v3;
  float64x2_t result;

  v3 = (float64x2_t *)(*a2 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect);
  swift_beginAccess();
  __asm { FMOV            V2.2D, #-0.5 }
  result = vaddq_f64(*a1, vmulq_f64(v3[1], _Q2));
  *v3 = result;
  return result;
}

__n128 sub_227568920@<Q0>(_QWORD *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 *v3;
  __n128 result;

  v3 = (__n128 *)(*a1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect);
  swift_beginAccess();
  result = v3[1];
  *a2 = result;
  return result;
}

uint64_t sub_227568970(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect;
  result = swift_beginAccess();
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v3;
  return result;
}

__n128 sub_2275689C4@<Q0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = *a1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect;
  swift_beginAccess();
  result = *(__n128 *)v3;
  v5 = *(_OWORD *)(v3 + 16);
  *a2 = *(_OWORD *)v3;
  a2[1] = v5;
  return result;
}

__n128 sub_227568A14(__n128 *a1, _QWORD *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  __n128 result;
  __n128 v6;

  v6 = *a1;
  v2 = a1[1].n128_u64[0];
  v3 = a1[1].n128_u64[1];
  v4 = *a2 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_rect;
  swift_beginAccess();
  result = v6;
  *(__n128 *)v4 = v6;
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v3;
  return result;
}

uint64_t sub_227568A78@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_classIndex);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_227568AC8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_classIndex);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_227568B14@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_heatByClass);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

double sub_227568B6C@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_firstSeen, a2);
}

uint64_t sub_227568B78(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_16Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_firstSeen);
}

double sub_227568B84@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_15Tm(a1, &OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_lastSeen, a2);
}

double keypath_get_15Tm@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  double *v4;
  double result;

  v4 = (double *)(*a1 + *a2);
  swift_beginAccess();
  result = *v4;
  *a3 = *(_QWORD *)v4;
  return result;
}

uint64_t sub_227568BDC(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_16Tm(a1, a2, a3, a4, &OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_lastSeen);
}

uint64_t keypath_set_16Tm(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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

uint64_t sub_227568C38@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  char v5;

  v3 = *a1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_depth;
  result = swift_beginAccess();
  v5 = *(_BYTE *)(v3 + 4);
  *(_DWORD *)a2 = *(_DWORD *)v3;
  *(_BYTE *)(a2 + 4) = v5;
  return result;
}

uint64_t sub_227568C90(int *a1, _QWORD *a2)
{
  int v2;
  char v3;
  uint64_t v4;
  uint64_t result;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 4);
  v4 = *a2 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_depth;
  result = swift_beginAccess();
  *(_DWORD *)v4 = v2;
  *(_BYTE *)(v4 + 4) = v3;
  return result;
}

__n128 sub_227568CEC@<Q0>(_QWORD *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 *v3;
  unsigned __int8 v4;
  __n128 result;

  v3 = (__n128 *)(*a1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_centroid3d);
  swift_beginAccess();
  v4 = v3[1].n128_u8[0];
  result = *v3;
  *a2 = *v3;
  a2[1].n128_u8[0] = v4;
  return result;
}

uint64_t sub_227568D44(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  v5 = *a2 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_centroid3d;
  result = swift_beginAccess();
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = v3;
  *(_BYTE *)(v5 + 16) = v4;
  return result;
}

uint64_t sub_227568DA0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_knownFeaturePoints);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_227568DF8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  char v5;

  v3 = *a1 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_physicalSize;
  result = swift_beginAccess();
  v5 = *(_BYTE *)(v3 + 8);
  *(_QWORD *)a2 = *(_QWORD *)v3;
  *(_BYTE *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_227568E50(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t result;

  v2 = *a1;
  v3 = *((_BYTE *)a1 + 8);
  v4 = *a2 + OBJC_IVAR____TtC16MagnifierSupport23MindNetModelBoundingBox_physicalSize;
  result = swift_beginAccess();
  *(_QWORD *)v4 = v2;
  *(_BYTE *)(v4 + 8) = v3;
  return result;
}

uint64_t storeEnumTagSinglePayload for DoorSignDetectorType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_227568EF8 + 4 * byte_2275A7B51[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_227568F2C + 4 * byte_2275A7B4C[v4]))();
}

uint64_t sub_227568F2C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_227568F34(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x227568F3CLL);
  return result;
}

uint64_t sub_227568F48(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x227568F50);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_227568F54(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_227568F5C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DoorSignDetectorType()
{
  return &type metadata for DoorSignDetectorType;
}

uint64_t method lookup function for DoorSignDetectorResult()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DoorSignDetectorResult.__allocating_init(boundingBox:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of DoorSignDetectorResult.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of DoorSignDetectorResult.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t type metadata accessor for DoorSignDetectorInferenceRunner()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for DoorSignDetectorModel()
{
  return objc_opt_self();
}

uint64_t sub_227569010()
{
  return type metadata accessor for MindNetModelBoundingBox();
}

uint64_t sub_227569018()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22758C984();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for MindNetModelBoundingBox()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.__allocating_init(id:timestamp:heat:angle:rect:classIndex:heatByClass:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.id.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.id.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.id.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.heat.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.heat.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.heat.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.angle.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.angle.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.angle.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.center.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.center.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.center.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.size.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.size.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.size.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.rect.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.rect.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.rect.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.classIndex.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.classIndex.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.classIndex.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.heatByClass.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.heatByClass.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.heatByClass.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.firstSeen.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.firstSeen.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.firstSeen.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.lastSeen.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.lastSeen.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.lastSeen.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.depth.getter()
{
  _QWORD *v0;
  unint64_t v1;

  v1 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A8))();
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

uint64_t dispatch thunk of MindNetModelBoundingBox.depth.setter(unint64_t a1)
{
  _QWORD *v1;

  return (*(uint64_t (**)(unint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0x1B0))(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t dispatch thunk of MindNetModelBoundingBox.depth.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.centroid3d.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.centroid3d.setter(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v3) + 0x1C8))(a1, a2, a3 & 1);
}

uint64_t dispatch thunk of MindNetModelBoundingBox.centroid3d.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.knownFeaturePoints.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.knownFeaturePoints.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.knownFeaturePoints.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.physicalSize.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.physicalSize.setter(uint64_t a1, char a2)
{
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v2) + 0x1F8))(a1, a2 & 1);
}

uint64_t dispatch thunk of MindNetModelBoundingBox.physicalSize.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x200))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.iou(other:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of MindNetModelBoundingBox.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 536))();
}

uint64_t storeEnumTagSinglePayload for MindNetModelBoundingBox.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_2275696B4 + 4 * byte_2275A7B5B[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_2275696E8 + 4 * byte_2275A7B56[v4]))();
}

uint64_t sub_2275696E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2275696F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2275696F8);
  return result;
}

uint64_t sub_227569704(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22756970CLL);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_227569710(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_227569718(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MindNetModelBoundingBox.CodingKeys()
{
  return &type metadata for MindNetModelBoundingBox.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for DoorSignDetectorResult.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_227569780 + 4 * byte_2275A7B65[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2275697B4 + 4 * byte_2275A7B60[v4]))();
}

uint64_t sub_2275697B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2275697BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2275697C4);
  return result;
}

uint64_t sub_2275697D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2275697D8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2275697DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2275697E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DoorSignDetectorResult.CodingKeys()
{
  return &type metadata for DoorSignDetectorResult.CodingKeys;
}

unint64_t sub_227569804()
{
  unint64_t result;

  result = qword_2558DEAC8;
  if (!qword_2558DEAC8)
  {
    result = MEMORY[0x2276B3C78](&unk_2275A7F4C, &type metadata for DoorSignDetectorResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2558DEAC8);
  }
  return result;
}

unint64_t sub_22756984C()
{
  unint64_t result;

  result = qword_2558DEAD0;
  if (!qword_2558DEAD0)
  {
    result = MEMORY[0x2276B3C78](&unk_2275A8004, &type metadata for MindNetModelBoundingBox.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2558DEAD0);
  }
  return result;
}

unint64_t sub_227569894()
{
  unint64_t result;

  result = qword_2558DEAD8;
  if (!qword_2558DEAD8)
  {
    result = MEMORY[0x2276B3C78](&unk_2275A7F74, &type metadata for MindNetModelBoundingBox.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2558DEAD8);
  }
  return result;
}

unint64_t sub_2275698DC()
{
  unint64_t result;

  result = qword_2558DEAE0;
  if (!qword_2558DEAE0)
  {
    result = MEMORY[0x2276B3C78](&unk_2275A7F9C, &type metadata for MindNetModelBoundingBox.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2558DEAE0);
  }
  return result;
}

unint64_t sub_227569924()
{
  unint64_t result;

  result = qword_2558DEAE8;
  if (!qword_2558DEAE8)
  {
    result = MEMORY[0x2276B3C78](&unk_2275A7EBC, &type metadata for DoorSignDetectorResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2558DEAE8);
  }
  return result;
}

unint64_t sub_22756996C()
{
  unint64_t result;

  result = qword_2558DEAF0;
  if (!qword_2558DEAF0)
  {
    result = MEMORY[0x2276B3C78](&unk_2275A7EE4, &type metadata for DoorSignDetectorResult.CodingKeys);
    atomic_store(result, &qword_2558DEAF0);
  }
  return result;
}

void sub_2275699B0(void *a1, _QWORD *a2, float a3)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void (*v44)(unint64_t, char *, uint64_t);
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  void (*v56)(char *, uint64_t);
  uint64_t v57;
  void (*v58)(char *, uint64_t);
  uint64_t v59;
  char *v60;
  __int128 v61;
  uint64_t v62;
  char *v63;
  _QWORD *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;

  v64 = a2;
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DEB10);
  v67 = *(_QWORD *)(v65 - 8);
  v9 = MEMORY[0x24BDAC7A8](v65, v5, v6, v7, v8);
  v63 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9, v11, v12, v13, v14);
  v16 = (char *)&v59 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DEB18);
  v59 = *(_QWORD *)(v17 - 8);
  v22 = MEMORY[0x24BDAC7A8](v17, v18, v19, v20, v21);
  v66 = (char *)&v59 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22, v24, v25, v26, v27);
  v29 = (char *)&v59 - v28;
  sub_22730BB7C(&qword_2558DEB20, &qword_2558DEB18, MEMORY[0x24BDBFCD0]);
  v30 = a1;
  sub_22758D0B0();
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DEB28);
  v31 = swift_allocObject();
  v61 = xmmword_227598080;
  *(_OWORD *)(v31 + 16) = xmmword_227598080;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DEB30);
  *(_QWORD *)(v31 + 56) = v32;
  v33 = sub_22730BB7C(&qword_2558DEB38, &qword_2558DEB30, MEMORY[0x24BDBFF08]);
  *(_QWORD *)(v31 + 64) = v33;
  *(_QWORD *)(v31 + 32) = 0;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DEB40);
  *(_QWORD *)(v31 + 96) = v34;
  v35 = sub_22730BB7C(&qword_2558DEB48, &qword_2558DEB40, MEMORY[0x24BDBFE50]);
  *(_OWORD *)(v31 + 72) = xmmword_2275A7B20;
  *(_QWORD *)(v31 + 136) = v32;
  *(_QWORD *)(v31 + 144) = v33;
  *(_QWORD *)(v31 + 104) = v35;
  *(_QWORD *)(v31 + 112) = 0;
  *(_QWORD *)(v31 + 176) = v32;
  *(_QWORD *)(v31 + 184) = v33;
  *(_QWORD *)(v31 + 152) = 0;
  sub_22758D0BC();
  swift_bridgeObjectRelease();
  v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = v61;
  *(_QWORD *)(v36 + 56) = v32;
  *(_QWORD *)(v36 + 64) = v33;
  *(_QWORD *)(v36 + 32) = 0;
  *(_QWORD *)(v36 + 96) = v34;
  *(_QWORD *)(v36 + 104) = v35;
  *(_OWORD *)(v36 + 72) = xmmword_2275A7B30;
  *(_QWORD *)(v36 + 136) = v32;
  *(_QWORD *)(v36 + 144) = v33;
  *(_QWORD *)(v36 + 112) = 0;
  *(_QWORD *)(v36 + 176) = v32;
  *(_QWORD *)(v36 + 184) = v33;
  *(_QWORD *)(v36 + 152) = 0;
  v37 = v63;
  v60 = v29;
  *(_QWORD *)&v61 = v17;
  v38 = v65;
  sub_22758D0BC();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558DEB50);
  v39 = *(_QWORD *)(v67 + 72);
  v40 = v67;
  v41 = (*(unsigned __int8 *)(v67 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80);
  v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_227596540;
  v43 = v42 + v41;
  v44 = *(void (**)(unint64_t, char *, uint64_t))(v40 + 16);
  v62 = (uint64_t)v16;
  v44(v43, v16, v38);
  v44(v43 + v39, v37, v38);
  v68 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558DEB58);
  sub_22730BB7C(&qword_2558DEB60, &qword_2558DEB58, MEMORY[0x24BEE12C8]);
  sub_22730BB7C(&qword_2558DEB68, &qword_2558DEB10, MEMORY[0x24BDBFD50]);
  v45 = (uint64_t)v66;
  sub_22758D098();
  sub_227567A70(a3, v45, v64);
  v47 = v46;
  v68 = MEMORY[0x24BEE4AF8];
  if (!(v46 >> 62))
  {
    v48 = *(_QWORD *)((v46 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v48)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
LABEL_14:
    v56 = *(void (**)(char *, uint64_t))(v59 + 8);
    v57 = v61;
    v56(v66, v61);
    v58 = *(void (**)(char *, uint64_t))(v67 + 8);
    v58(v37, v38);
    v58((char *)v62, v38);
    v56(v60, v57);
    return;
  }
  v48 = sub_22758ECE8();
  if (!v48)
    goto LABEL_13;
LABEL_3:
  if (v48 >= 1)
  {
    v49 = 0;
    do
    {
      if ((v47 & 0xC000000000000001) != 0)
        v50 = (id)MEMORY[0x2276B2BEC](v49, v47);
      else
        v50 = *(id *)(v47 + 8 * v49 + 32);
      v51 = v50;
      v52 = objc_allocWithZone((Class)type metadata accessor for DoorSignDetectorResult());
      v53 = v51;
      v54 = sub_227568438((uint64_t)v53);

      v55 = v54;
      MEMORY[0x2276B23C4]();
      if (*(_QWORD *)((v68 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v68 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_22758E400();
      ++v49;
      sub_22758E424();
      sub_22758E3F4();

    }
    while (v48 != v49);
    swift_bridgeObjectRelease();
    v38 = v65;
    goto LABEL_14;
  }
  __break(1u);
}

uint64_t sub_227569EA4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 7892834 && a2 == 0xE300000000000000;
  if (v2 || (sub_22758EE50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D614E6C6562616CLL && a2 == 0xE900000000000065 || (sub_22758EE50() & 1) != 0)
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
    v6 = sub_22758EE50();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_22756A000(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_22758EE50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1952540008 && a2 == 0xE400000000000000 || (sub_22758EE50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C676E61 && a2 == 0xE500000000000000 || (sub_22758EE50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1952671090 && a2 == 0xE400000000000000 || (sub_22758EE50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x646E497373616C63 && a2 == 0xEA00000000007865 || (sub_22758EE50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6C43794274616568 && a2 == 0xEB00000000737361 || (sub_22758EE50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6565537473726966 && a2 == 0xE90000000000006ELL || (sub_22758EE50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6E6565537473616CLL && a2 == 0xE800000000000000 || (sub_22758EE50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6874706564 && a2 == 0xE500000000000000 || (sub_22758EE50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x64696F72746E6563 && a2 == 0xEA00000000006433 || (sub_22758EE50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000002275BE240 || (sub_22758EE50() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6C61636973796870 && a2 == 0xEC000000657A6953)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else
  {
    v6 = sub_22758EE50();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 11;
    else
      return 12;
  }
}

uint64_t sub_22756A4E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(sub_22758C858() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v1 + 24);
  v9 = v1 + v5;
  v10 = *(_QWORD *)(v1 + v6);
  v11 = *(_QWORD *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFF8));
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_227319F84;
  return sub_2275635A0(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_22756A598(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(sub_22758C858() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(v1 + 16);
  v8 = *(_QWORD *)(v1 + 24);
  v9 = v1 + v5;
  v10 = *(_QWORD *)(v1 + v6);
  v11 = *(_QWORD *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFF8));
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_227344044;
  return sub_2275630AC(a1, v7, v8, v9, v10, v11);
}

uint64_t storeEnumTagSinglePayload for DoorSignDetectorModel.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_22756A698 + 4 * byte_2275A7B6F[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_22756A6CC + 4 * byte_2275A7B6A[v4]))();
}

uint64_t sub_22756A6CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22756A6D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22756A6DCLL);
  return result;
}

uint64_t sub_22756A6E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22756A6F0);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_22756A6F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22756A6FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DoorSignDetectorModel.Error()
{
  return &type metadata for DoorSignDetectorModel.Error;
}

unint64_t sub_22756A71C()
{
  unint64_t result;

  result = qword_2558DEB88;
  if (!qword_2558DEB88)
  {
    result = MEMORY[0x2276B3C78](&unk_2275A8114, &type metadata for DoorSignDetectorModel.Error);
    atomic_store(result, (unint64_t *)&qword_2558DEB88);
  }
  return result;
}

uint64_t sub_22756A764()
{
  return sub_227561BBC();
}

uint64_t sub_22756A7B8()
{
  return sub_22756208C();
}

uint64_t sub_22756A80C(unint64_t a1, unint64_t a2)
{
  uint64_t result;
  unint64_t *v5;
  unint64_t v6;
  int64x2_t v7;
  int64x2_t *v8;
  unint64_t v9;
  unint64_t v10;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = sub_22758ECB8();
    __break(1u);
    return result;
  }
  if (!a2)
    return MEMORY[0x24BEE4AF8];
  result = sub_22758E418();
  *(_QWORD *)(result + 16) = a2;
  v5 = (unint64_t *)(result + 32);
  if (a2 < 4)
  {
    v6 = 0;
LABEL_9:
    v10 = a2 - v6;
    do
    {
      *v5++ = a1;
      --v10;
    }
    while (v10);
    return result;
  }
  v6 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  v5 += a2 & 0xFFFFFFFFFFFFFFFCLL;
  v7 = vdupq_n_s64(a1);
  v8 = (int64x2_t *)(result + 48);
  v9 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    *v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v6 != a2)
    goto LABEL_9;
  return result;
}

uint64_t sub_22756A8F4(uint64_t a1, uint64_t a2)
{
  return sub_22756AB78(a1, a2, (uint64_t *)&unk_2558D50B0);
}

uint64_t sub_22756A900(char a1, size_t a2)
{
  uint64_t v4;
  uint64_t result;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = sub_22758ECB8();
    __break(1u);
  }
  else
  {
    if (!a2)
      return MEMORY[0x24BEE4AF8];
    v4 = sub_22758E418();
    *(_QWORD *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1 & 1, a2);
    return v4;
  }
  return result;
}

uint64_t sub_22756A9B8(uint64_t a1, uint64_t a2)
{
  return sub_22756AB78(a1, a2, &qword_2558D7D40);
}

uint64_t sub_22756A9C4(int a1, size_t a2)
{
  uint64_t v4;
  uint64_t result;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = sub_22758ECB8();
    __break(1u);
  }
  else
  {
    if (!a2)
      return MEMORY[0x24BEE4AF8];
    v4 = sub_22758E418();
    *(_QWORD *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1, a2);
    return v4;
  }
  return result;
}

uint64_t sub_22756AA7C(uint64_t a1, uint64_t a2)
{
  return sub_22756AB78(a1, a2, &qword_2558D7D20);
}

uint64_t sub_22756AA88(unint64_t a1, double a2)
{
  uint64_t result;
  double *v4;
  unint64_t v5;
  double v6;
  int64x2_t v7;
  int64x2_t *v8;
  unint64_t v9;
  unint64_t v10;

  if ((a1 & 0x8000000000000000) != 0)
  {
    result = sub_22758ECB8();
    __break(1u);
    return result;
  }
  if (!a1)
    return MEMORY[0x24BEE4AF8];
  result = sub_22758E418();
  *(_QWORD *)(result + 16) = a1;
  v4 = (double *)(result + 32);
  if (a1 < 4)
  {
    v5 = 0;
    v6 = a2;
LABEL_9:
    v10 = a1 - v5;
    do
    {
      *v4++ = v6;
      --v10;
    }
    while (v10);
    return result;
  }
  v5 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  v4 += a1 & 0xFFFFFFFFFFFFFFFCLL;
  v6 = a2;
  v7 = vdupq_lane_s64(*(uint64_t *)&a2, 0);
  v8 = (int64x2_t *)(result + 48);
  v9 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    *v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v5 != a1)
    goto LABEL_9;
  return result;
}

uint64_t sub_22756AB78(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t result;

  if (a2 < 0)
  {
    result = sub_22758ECB8();
    __break(1u);
  }
  else
  {
    if (a2)
    {
      __swift_instantiateConcreteTypeFromMangledName(a3);
      v5 = (_QWORD *)sub_22758E418();
      v6 = v5;
      v5[2] = a2;
      v5[4] = a1;
      if (a2 != 1)
      {
        v5[5] = a1;
        v7 = a2 - 2;
        if (v7)
        {
          v8 = v5 + 6;
          do
          {
            *v8++ = a1;
            swift_bridgeObjectRetain();
            --v7;
          }
          while (v7);
        }
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x24BEE4AF8];
    }
    return (uint64_t)v6;
  }
  return result;
}

uint64_t sub_22756AC64(uint64_t a1, double a2)
{
  uint64_t v3;
  size_t v4;
  int64_t v5;
  _QWORD *v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  double v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  unint64_t v41;
  uint64_t v42;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v44;
  char v45;
  uint64_t v46;
  int64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t result;
  size_t v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;

  if (*(_QWORD *)(a1 + 16) < 2uLL)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5C80);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_227593AB0;
    v13 = swift_bridgeObjectRetain();
    v14 = sub_2273A6708(v13);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v12 + 32) = v14;
    return v12;
  }
  if (a2 <= 0.0)
  {
    if (qword_2558D4AA8 != -1)
LABEL_93:
      swift_once();
    v15 = sub_22758CF9C();
    __swift_project_value_buffer(v15, (uint64_t)qword_2558D6320);
    v16 = sub_22758CF84();
    v17 = sub_22758E6C4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v18 = 134217984;
      sub_22758EA48();
      _os_log_impl(&dword_2272F4000, v16, v17, "A threshold distance to stop clustering should be >0, but received %f", v18, 0xCu);
      MEMORY[0x2276B3D50](v18, -1, -1);
    }

    return 0;
  }
  v3 = swift_bridgeObjectRetain();
  v4 = sub_2273A6708(v3);
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v4 + 16);
  v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v7 = v4;
    v55 = (_QWORD *)MEMORY[0x24BEE4AF8];
    sub_227324B18(0, v5, 0);
    v8 = 0;
    v6 = v55;
    do
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5C50);
      v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_227593AB0;
      *(_QWORD *)(v9 + 32) = v8;
      v11 = v55[2];
      v10 = v55[3];
      if (v11 >= v10 >> 1)
        sub_227324B18(v10 > 1, v11 + 1, 1);
      ++v8;
      v55[2] = v11 + 1;
      v55[v11 + 4] = v9;
    }
    while (v5 != v8);
    v4 = v7;
  }
  v19 = (_QWORD *)sub_22756B2D8(v4);
  if (v6[2] < 2uLL)
  {
LABEL_69:
    swift_retain();
    v50 = swift_bridgeObjectRetain();
    v12 = sub_22756B4E0(v50, v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_release_n();
    return v12;
  }
  v52 = v4;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v19 = sub_22738D374(v19);
  v54 = v19 + 4;
  v20 = v6[2];
  while (1)
  {
    v53 = v6;
    if (v20)
    {
      if (v20 == 1)
      {
        v21 = 0;
        v22 = 0;
        v23 = INFINITY;
      }
      else
      {
        v24 = 0;
        v22 = 0;
        v21 = 0;
        v23 = INFINITY;
        v25 = 1;
        while (2)
        {
          v26 = v6[v24 + 4];
          v27 = *(_QWORD *)(v26 + 32);
          if ((v27 & 0x8000000000000000) != 0)
            goto LABEL_83;
          if (v27 >= v19[2])
          {
LABEL_84:
            __break(1u);
LABEL_85:
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
LABEL_91:
            __break(1u);
LABEL_92:
            __break(1u);
            goto LABEL_93;
          }
          if (!*(_QWORD *)(v26 + 16))
            goto LABEL_85;
          v28 = v54[v27];
          v29 = v28 + 32;
          v30 = *(_QWORD *)(v28 + 16);
          v31 = v24;
          do
          {
            v32 = v6[v31 + 5];
            if (!*(_QWORD *)(v32 + 16))
            {
              __break(1u);
LABEL_72:
              __break(1u);
              goto LABEL_73;
            }
            v33 = *(_QWORD *)(v32 + 32);
            if (v33 >= v30)
              goto LABEL_72;
            if (*(double *)(v29 + 8 * v33) < v23)
            {
              v22 = v31 + 1;
              v21 = v24;
              v23 = *(double *)(v29 + 8 * v33);
            }
            ++v31;
          }
          while (v20 - 1 != v31);
          ++v25;
          ++v24;
          if (v25 != v20)
            continue;
          break;
        }
      }
      if (v23 > a2)
      {
        v4 = v52;
        goto LABEL_69;
      }
    }
    else
    {
      if (a2 < INFINITY)
        goto LABEL_73;
      v22 = 0;
      v21 = 0;
    }
    if (v21 >= v20)
      goto LABEL_86;
    v34 = v6 + 4;
    v35 = v6[v21 + 4];
    if (!*(_QWORD *)(v35 + 16))
      goto LABEL_87;
    if (v22 >= v20)
      goto LABEL_88;
    v36 = v34[v22];
    if (!*(_QWORD *)(v36 + 16))
      goto LABEL_89;
    if (v5)
    {
      v37 = 0;
      v38 = *(_QWORD *)(v35 + 32);
      v39 = *(_QWORD *)(v36 + 32);
      while (1)
      {
        if (v38 != v37)
        {
          if (v37 >= v19[2])
          {
            __break(1u);
LABEL_76:
            __break(1u);
LABEL_77:
            __break(1u);
LABEL_78:
            __break(1u);
LABEL_79:
            __break(1u);
LABEL_80:
            __break(1u);
LABEL_81:
            __break(1u);
LABEL_82:
            __break(1u);
LABEL_83:
            __break(1u);
            goto LABEL_84;
          }
          if ((v38 & 0x8000000000000000) != 0)
            goto LABEL_76;
          v40 = (_QWORD *)v54[v37];
          v41 = v40[2];
          if (v38 >= v41)
            goto LABEL_77;
          if ((v39 & 0x8000000000000000) != 0)
            goto LABEL_78;
          if (v39 >= v41)
            goto LABEL_79;
          if (*(double *)&v40[v39 + 4] >= *(double *)&v40[v38 + 4])
            v42 = v40[v38 + 4];
          else
            v42 = v40[v39 + 4];
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v54[v37] = v40;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            v40 = sub_22738D360(v40);
            v54[v37] = v40;
          }
          if (v38 >= v40[2])
            goto LABEL_80;
          v40[v38 + 4] = v42;
          if (v38 >= v19[2])
            goto LABEL_81;
          v44 = (_QWORD *)v54[v38];
          v45 = swift_isUniquelyReferenced_nonNull_native();
          v54[v38] = v44;
          if ((v45 & 1) == 0)
          {
            v44 = sub_22738D360(v44);
            v54[v38] = v44;
          }
          if (v37 >= v44[2])
            goto LABEL_82;
          v44[v37 + 4] = v42;
        }
        if (v5 == ++v37)
        {
          v34 = v6 + 4;
          v20 = v6[2];
          break;
        }
      }
    }
    if (v22 >= (uint64_t)v20)
      goto LABEL_90;
    v46 = v34[v22];
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v53 = sub_22738D1B8(v6);
    if ((int64_t)v21 >= v53[2])
      goto LABEL_91;
    sub_2273A441C(v46);
    v47 = v53[2];
    if (v22 >= v47)
      goto LABEL_92;
    v48 = v47 - 1;
    v49 = v47 - 1 - v22;
    if (v49 < 0)
      break;
    memmove(&v53[v22 + 4], &v53[v22 + 5], 8 * v49);
    v6 = v53;
    v53[2] = v48;
    swift_bridgeObjectRelease();
    v20 = v53[2];
    if (v20 <= 1)
    {
LABEL_73:
      v4 = v52;
      goto LABEL_69;
    }
  }
  result = sub_22758ED24();
  __break(1u);
  return result;
}

uint64_t sub_22756B2D8(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  uint64_t result;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  float v12;
  _QWORD *v13;
  double v14;
  _QWORD *v15;
  _QWORD *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = sub_22756AA88(v2, 0.0);
  v4 = (_QWORD *)sub_22756AB78(v3, v2, &qword_2558D7D10);
  v5 = v2 - 1;
  if (v2 <= 1)
    return (uint64_t)v4;
  result = type metadata accessor for SpatialTextBlock();
  v7 = 0;
  v19 = *(_QWORD *)(result - 8);
  v17 = v2;
  v18 = a1 + ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80));
  v8 = 1;
  while (v8 != v2)
  {
    v9 = *(_QWORD *)(v19 + 72);
    v20 = v8;
    v10 = v18 + v9 * v8;
    v11 = v7;
    do
    {
      if (v5 == v11)
      {
        __break(1u);
LABEL_21:
        __break(1u);
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
      v12 = sub_227509E48(v10, 1, 0.4, 1.0, 0.02);
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_22738D374(v4);
        v4 = (_QWORD *)result;
      }
      if (v7 >= v4[2])
        goto LABEL_21;
      v13 = (_QWORD *)v4[v7 + 4];
      result = swift_isUniquelyReferenced_nonNull_native();
      v4[v7 + 4] = v13;
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_22738D360(v13);
        v13 = (_QWORD *)result;
        v4[v7 + 4] = result;
      }
      if (v11 + 1 >= v13[2])
        goto LABEL_22;
      v14 = v12;
      *(double *)&v13[v11 + 5] = v14;
      if (v11 + 1 >= v4[2])
        goto LABEL_23;
      v15 = &v4[v11];
      v16 = (_QWORD *)v15[5];
      result = swift_isUniquelyReferenced_nonNull_native();
      v15[5] = v16;
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_22738D360(v16);
        v16 = (_QWORD *)result;
        v15[5] = result;
      }
      if (v7 >= v16[2])
        goto LABEL_24;
      *(double *)&v16[v7 + 4] = v14;
      ++v11;
      v10 += v9;
    }
    while (v5 != v11);
    v8 = v20 + 1;
    ++v7;
    v2 = v17;
    if (v20 + 1 == v17)
      return (uint64_t)v4;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_22756B4E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD v29[2];
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v5 = type metadata accessor for SpatialTextBlock();
  MEMORY[0x24BDAC7A8](v5, v6, v7, v8, v9);
  v12 = (char *)v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)(a1 + 16);
  v14 = MEMORY[0x24BEE4AF8];
  if (!v13)
    return MEMORY[0x24BEE4AF8];
  v29[1] = v2;
  v40 = MEMORY[0x24BEE4AF8];
  v32 = v10;
  sub_227324B8C(0, v13, 0);
  v15 = 0;
  result = v40;
  v33 = a1 + 32;
  v30 = v13;
  v31 = a2;
  while (1)
  {
    v17 = *(_QWORD *)(v33 + 8 * v15);
    v18 = *(_QWORD *)(v17 + 16);
    if (v18)
      break;
    v21 = v14;
LABEL_11:
    v40 = result;
    v28 = *(_QWORD *)(result + 16);
    v27 = *(_QWORD *)(result + 24);
    if (v28 >= v27 >> 1)
    {
      sub_227324B8C(v27 > 1, v28 + 1, 1);
      result = v40;
    }
    ++v15;
    *(_QWORD *)(result + 16) = v28 + 1;
    *(_QWORD *)(result + 8 * v28 + 32) = v21;
    if (v15 == v13)
      return result;
  }
  v34 = result;
  v35 = v15;
  v39 = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_227324BB8(0, v18, 0);
  v19 = v32;
  v20 = 0;
  v21 = v39;
  v37 = (*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  v36 = a2 + v37;
  v38 = *(_QWORD *)(a2 + 16);
  while (1)
  {
    v22 = *(_QWORD *)(v17 + 8 * v20 + 32);
    if (v22 >= v38)
      break;
    v23 = v18;
    v24 = *(_QWORD *)(v19 + 72);
    sub_22756B734(v36 + v24 * v22, (uint64_t)v12);
    v39 = v21;
    v26 = *(_QWORD *)(v21 + 16);
    v25 = *(_QWORD *)(v21 + 24);
    if (v26 >= v25 >> 1)
    {
      sub_227324BB8(v25 > 1, v26 + 1, 1);
      v19 = v32;
      v21 = v39;
    }
    ++v20;
    *(_QWORD *)(v21 + 16) = v26 + 1;
    result = sub_2273383D4((uint64_t)v12, v21 + v37 + v26 * v24);
    v18 = v23;
    if (v23 == v20)
    {
      swift_bridgeObjectRelease();
      a2 = v31;
      swift_bridgeObjectRelease();
      v14 = MEMORY[0x24BEE4AF8];
      v13 = v30;
      result = v34;
      v15 = v35;
      goto LABEL_11;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_22756B734(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SpatialTextBlock();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t destroy for MAGAudioHandle()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for MAGAudioHandle(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  v3 = *(_QWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 200) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for MAGAudioHandle(_QWORD *a1, _QWORD *a2)
{
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

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_retain();
  swift_release();
  v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_retain();
  swift_release();
  v9 = a2[11];
  a1[10] = a2[10];
  a1[11] = v9;
  swift_retain();
  swift_release();
  v10 = a2[13];
  a1[12] = a2[12];
  a1[13] = v10;
  swift_retain();
  swift_release();
  v11 = a2[15];
  a1[14] = a2[14];
  a1[15] = v11;
  swift_retain();
  swift_release();
  v12 = a2[17];
  a1[16] = a2[16];
  a1[17] = v12;
  swift_retain();
  swift_release();
  v13 = a2[19];
  a1[18] = a2[18];
  a1[19] = v13;
  swift_retain();
  swift_release();
  v14 = a2[21];
  a1[20] = a2[20];
  a1[21] = v14;
  swift_retain();
  swift_release();
  v15 = a2[23];
  a1[22] = a2[22];
  a1[23] = v15;
  swift_retain();
  swift_release();
  v16 = a2[25];
  a1[24] = a2[24];
  a1[25] = v16;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy208_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  v5 = *(_OWORD *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  result = *(__n128 *)(a2 + 144);
  v9 = *(_OWORD *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v10;
  *(__n128 *)(a1 + 144) = result;
  *(_OWORD *)(a1 + 160) = v9;
  return result;
}

_OWORD *assignWithTake for MAGAudioHandle(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  a1[4] = a2[4];
  swift_release();
  a1[5] = a2[5];
  swift_release();
  a1[6] = a2[6];
  swift_release();
  a1[7] = a2[7];
  swift_release();
  a1[8] = a2[8];
  swift_release();
  a1[9] = a2[9];
  swift_release();
  a1[10] = a2[10];
  swift_release();
  a1[11] = a2[11];
  swift_release();
  a1[12] = a2[12];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MAGAudioHandle(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 208))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MAGAudioHandle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 200) = 0;
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
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 208) = 1;
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
    *(_BYTE *)(result + 208) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MAGAudioHandle()
{
  return &type metadata for MAGAudioHandle;
}

uint64_t static MAGOUEvent.didRecievePointerContactWithObjectGroup(objectGroup:occupants:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = a2;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_QWORD *)(a3 + 80) = 0;
  *(_BYTE *)(a3 + 88) = 1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t static MAGOUEvent.didRecievePointerContactWithFurnitureDetections(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = a1;
  *(_OWORD *)(a2 + 8) = 0u;
  *(_OWORD *)(a2 + 24) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  *(_BYTE *)(a2 + 88) = 2;
  return swift_bridgeObjectRetain();
}

uint64_t static MAGOUEvent.didRecievePointerContactWithObject(object:occupants:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = *(void **)a1;
  v4 = *(_OWORD *)(a1 + 16);
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)a3 = *(_QWORD *)a1;
  *(_QWORD *)(a3 + 8) = 0;
  *(_OWORD *)(a3 + 16) = v4;
  *(_OWORD *)(a3 + 32) = v5;
  *(_OWORD *)(a3 + 48) = v6;
  *(_QWORD *)(a3 + 64) = v8;
  *(_QWORD *)(a3 + 72) = v7;
  *(_QWORD *)(a3 + 80) = a2;
  *(_BYTE *)(a3 + 88) = 0;
  v9 = v3;
  return swift_bridgeObjectRetain();
}

double static MAGOUEvent.didRecieveEmptyPointerContact()@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 80) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_BYTE *)(a1 + 88) = 3;
  return result;
}

uint64_t MAGOUEvent.description.getter()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = *(void **)v0;
  v2 = *(_QWORD *)(v0 + 8);
  v3 = *(_QWORD *)(v0 + 16);
  v12 = *(_QWORD *)(v0 + 32);
  v13 = *(_QWORD *)(v0 + 24);
  v10 = *(_QWORD *)(v0 + 48);
  v11 = *(_QWORD *)(v0 + 40);
  v9 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 72);
  v6 = *(_QWORD *)(v0 + 80);
  v7 = *(_BYTE *)(v0 + 88);
  sub_2273768B8(*(void **)v0, v2, v3, v13, v12, v11, v10, v9, v4, v5, v6, v7);
  sub_22758E2B0();
  swift_bridgeObjectRelease();
  sub_22737685C(v1, v2, v3, v13, v12, v11, v10, v9, v4, v5, v6, v7);
  return 0x746E65766520554FLL;
}

unint64_t MAGOUEvent.MAGOUEventType.description.getter()
{
  uint64_t v0;

  if (*(unsigned __int8 *)(v0 + 88) >= 3u)
    return 0xD00000000000001DLL;
  else
    return 0xD000000000000022;
}

void *MAGOUEvent.eventType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v2 = *(void **)v1;
  v3 = *(_QWORD *)(v1 + 8);
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_QWORD *)(v1 + 48);
  v9 = *(_QWORD *)(v1 + 56);
  v10 = *(_QWORD *)(v1 + 64);
  v11 = *(_QWORD *)(v1 + 72);
  v12 = *(_QWORD *)(v1 + 80);
  v13 = *(_BYTE *)(v1 + 88);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v9;
  *(_QWORD *)(a1 + 64) = v10;
  *(_QWORD *)(a1 + 72) = v11;
  *(_QWORD *)(a1 + 80) = v12;
  *(_BYTE *)(a1 + 88) = v13;
  return sub_2273768B8(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
}

__n128 __swift_memcpy89_16(uint64_t a1, uint64_t a2)
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
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

ValueMetadata *type metadata accessor for MAGOUEvent()
{
  return &type metadata for MAGOUEvent;
}

void *_s16MagnifierSupport10MAGOUEventVwxx_0(uint64_t a1)
{
  return sub_22737685C(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_BYTE *)(a1 + 88));
}

uint64_t _s16MagnifierSupport10MAGOUEventVwcp_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_QWORD *)(a2 + 80);
  v15 = *(_BYTE *)(a2 + 88);
  sub_2273768B8(*(void **)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v13;
  *(_QWORD *)(a1 + 80) = v14;
  *(_BYTE *)(a1 + 88) = v15;
  return a1;
}

uint64_t _s16MagnifierSupport10MAGOUEventVwca_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  char v22;
  uint64_t v24;
  uint64_t v25;
  char v26;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v24 = *(_QWORD *)(a2 + 72);
  v25 = *(_QWORD *)(a2 + 80);
  v26 = *(_BYTE *)(a2 + 88);
  sub_2273768B8(*(void **)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25, v26);
  v12 = *(void **)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(_OWORD *)(a1 + 64);
  v21 = *(_QWORD *)(a1 + 80);
  v22 = *(_BYTE *)(a1 + 88);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v24;
  *(_QWORD *)(a1 + 80) = v25;
  *(_BYTE *)(a1 + 88) = v26;
  sub_22737685C(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, v22);
  return a1;
}

uint64_t _s16MagnifierSupport10MAGOUEventVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  __int128 v17;

  v3 = *(_QWORD *)(a2 + 80);
  v4 = *(_BYTE *)(a2 + 88);
  v5 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(_OWORD *)(a1 + 64);
  v14 = *(_QWORD *)(a1 + 80);
  v15 = *(_BYTE *)(a1 + 88);
  v16 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v16;
  v17 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v17;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = v3;
  *(_BYTE *)(a1 + 88) = v4;
  sub_22737685C(v5, v7, v6, v8, v9, v10, v11, v12, v13, *((uint64_t *)&v13 + 1), v14, v15);
  return a1;
}

uint64_t _s16MagnifierSupport10MAGOUEventVwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 89))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 88);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s16MagnifierSupport10MAGOUEventV14MAGOUEventTypeOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 88) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 89) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 89) = 0;
    if (a2)
      *(_BYTE *)(result + 88) = -(char)a2;
  }
  return result;
}

uint64_t sub_22756C2CC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 88) <= 2u)
    return *(unsigned __int8 *)(a1 + 88);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_22756C2E4(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 88) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MAGOUEvent.MAGOUEventType()
{
  return &type metadata for MAGOUEvent.MAGOUEventType;
}

id sub_22756C324@<X0>(uint64_t a1@<X0>, void *a2@<X1>, __CVBuffer *a3@<X2>, id a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __CVBuffer *v24;
  __CVBuffer *v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  unsigned int v32;
  float32x4_t v33;
  float v34;
  double v35;
  __float2 v36;
  __n128 v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  id v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t *v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  int64_t Width;
  size_t Height;
  uint64_t v59;
  uint64_t v60;
  double v61;
  id result;
  double v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  float32x4_t v78;
  uint64_t v79;
  uint64_t v80;
  float32x4_t v81;
  uint64_t v82;
  float32x4_t v83;
  float32x4_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  uint64_t *v88;
  uint64_t *v89;
  uint64_t *v90;
  __CVBuffer *v91;
  __CVBuffer *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  float32x4_t v103;
  float32x4_t v104;
  float32x4_t v105;
  float32x4_t v106;
  int *v107;
  uint64_t v108;
  _OWORD *v109;
  char *v110;
  __int128 v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  __CVBuffer *v116;
  uint64_t v117;
  uint64_t v118;
  float32x4_t v119;
  float32x4_t v120;
  float32x4_t v121;
  float32x4_t v122;
  void *v123;
  id v124;
  float32x4_t v125;
  float32x4_t v126;
  float32x4_t v127;
  float32x4_t v128;
  int *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  __CVBuffer *v133;
  uint64_t v134;
  simd_float4x4 v135;
  simd_float4x4 v136;

  v132 = a5;
  v11 = (int *)type metadata accessor for SpatialTextBlock();
  v12 = *((_QWORD *)v11 - 1);
  MEMORY[0x24BDAC7A8](v11, v13, v14, v15, v16);
  v18 = (char *)&v117 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758C978();
  v19 = v11[11];
  *(_QWORD *)&v18[v19] = 0;
  v20 = v11[15];
  *(_QWORD *)&v18[v20] = 0;
  v21 = type metadata accessor for DetectedTextBlock();
  v22 = *(int *)(v21 + 36);
  v134 = a1;
  v23 = *(void **)(a1 + v22);
  if (!v23)
  {
    v59 = v134;
LABEL_28:

    sub_22730DFB0(v59, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
    v115 = sub_22758C984();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v115 - 8) + 8))(v18, v115);
    swift_bridgeObjectRelease();

    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v12 + 56))(a6, 1, 1, v11);
  }
  v129 = (int *)v21;
  v133 = (__CVBuffer *)a4;
  v131 = v20;
  a4 = v23;
  v24 = (__CVBuffer *)objc_msgSend(a4, sel_boundingQuad);
  if (!v24)
  {
    v25 = v133;
    v59 = v134;
LABEL_27:

    a3 = v25;
    v20 = v131;
    goto LABEL_28;
  }
  v25 = v24;
  v123 = v23;
  v130 = v12;
  -[__CVBuffer midPoint](v24, sel_midPoint);
  v26 = v132;
  sub_22756D038(v133, a3, v132, v27, v28);
  if ((v31 & 1) != 0)
  {
    v12 = v130;
    v59 = v134;
LABEL_26:

    a3 = v133;
    goto LABEL_27;
  }
  v32 = v29;
  v118 = a6;
  v33.i64[0] = v29;
  v33.i64[1] = v30;
  v128 = v33;
  objc_msgSend(a2, sel_transform);
  v136 = __invert_f4(v135);
  v128 = vaddq_f32((float32x4_t)v136.columns[3], vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_f32((float32x4_t)vdupq_n_s32(v32), (float32x4_t)v136.columns[0]), (float32x4_t)v136.columns[1], *(float32x2_t *)v128.f32, 1), (float32x4_t)v136.columns[2], v128, 2));
  v34 = (float)((float)ARCameraToDisplayRotation() * 3.1416) / 180.0;
  objc_msgSend(a4, sel_baselineAngle);
  *(float *)&v35 = v35;
  v36 = __sincosf_stret((float)(v34 + *(float *)&v35) * 0.5);
  v37 = (__n128)vmulq_n_f32((float32x4_t)xmmword_227593970, v36.__sinval);
  v37.n128_u32[3] = LODWORD(v36.__cosval);
  *(double *)v38.i64 = MEMORY[0x2276B26F4](v37);
  v125 = v38;
  v126 = v39;
  v127 = v40;
  v41 = objc_msgSend(a2, sel_transform);
  v46 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v42, v125.f32[0]), v43, *(float32x2_t *)v125.f32, 1), v44, v125, 2), v45, v125, 3);
  v47 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v42, v126.f32[0]), v43, *(float32x2_t *)v126.f32, 1), v44, v126, 2), v45, v126, 3);
  v48 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v42, v127.f32[0]), v43, *(float32x2_t *)v127.f32, 1), v44, v127, 2), v45, v127, 3);
  v49 = v128;
  v50 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v42, v128.f32[0]), v43, *(float32x2_t *)v128.f32, 1), v44, v128, 2);
  v51 = (float32x4_t *)&v18[v11[9]];
  v126 = v46;
  v127 = v47;
  *v51 = v46;
  v51[1] = v47;
  v52 = vmlaq_laneq_f32(v50, v45, v49, 3);
  v128 = v48;
  v51[2] = v48;
  v51[3] = v52;
  v125 = v52;
  *(double *)v53.i64 = MEMORY[0x2276B26F4](v41, (__n128)xmmword_2275A8220);
  v119 = v53;
  v120 = v54;
  v121 = v55;
  v122 = v56;
  if (UIInterfaceOrientationIsLandscape(v26))
  {
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
  }
  else
  {
    Width = CVPixelBufferGetHeight(a3);
    Height = CVPixelBufferGetWidth(a3);
  }
  v60 = Height;
  v61 = (double)Width;
  result = -[__CVBuffer topLeft](v25, sel_topLeft);
  if ((double)Width <= -9.22337204e18)
  {
    __break(1u);
    goto LABEL_33;
  }
  if (v61 >= 9.22337204e18)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if ((*(_QWORD *)&v61 & 0x7FF0000000000000) == 0x7FF0000000000000)
    goto LABEL_34;
  v63 = (double)v60;
  if ((COERCE_UNSIGNED_INT64((double)v60) & 0x7FF0000000000000) == 0x7FF0000000000000)
    goto LABEL_34;
  if (v63 <= -9.22337204e18)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v124 = a4;
  if (v63 < 9.22337204e18)
  {
    v64 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v126, v121.f32[0]), v127, *(float32x2_t *)v121.f32, 1), v128, v121, 2);
    v65 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v126, v122.f32[0]), v127, *(float32x2_t *)v122.f32, 1), v128, v122, 2);
    v66 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v126, v119.f32[0]), v127, *(float32x2_t *)v119.f32, 1), v128, v119, 2), v125, v119, 3);
    v127 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v126, v120.f32[0]), v127, *(float32x2_t *)v120.f32, 1), v128, v120, 2), v125, v120, 3);
    v128 = v66;
    v67 = vmlaq_laneq_f32(v64, v125, v121, 3);
    v125 = vmlaq_laneq_f32(v65, v125, v122, 3);
    v126 = v67;
    MEMORY[0x2276B34BC]((uint64_t)v61, (uint64_t)v63);
    v68 = sub_22758E910();
    if ((v70 & 1) != 0)
      goto LABEL_24;
    v121.i64[0] = v69;
    v122.i64[0] = v68;
    -[__CVBuffer topRight](v25, sel_topRight);
    MEMORY[0x2276B34BC]((uint64_t)v61, (uint64_t)v63);
    v71 = sub_22758E910();
    if ((v73 & 1) != 0)
      goto LABEL_24;
    v119.i64[0] = v72;
    v120.i64[0] = v71;
    -[__CVBuffer bottomRight](v25, sel_bottomRight);
    v117 = (uint64_t)v61;
    MEMORY[0x2276B34BC]((uint64_t)v61, (uint64_t)v63);
    v74 = sub_22758E910();
    if ((v76 & 1) != 0)
      goto LABEL_24;
    v77 = v122.i64[0];
    v78.i64[0] = v122.i64[0];
    v79 = v121.i64[0];
    v78.i64[1] = v121.i64[0];
    v80 = v120.i64[0];
    v81.i64[0] = v120.i64[0];
    v82 = v119.i64[0];
    v81.i64[1] = v119.i64[0];
    v83 = vsubq_f32(v78, v81);
    v84 = vmulq_f32(v83, v83);
    v85.i64[0] = v74;
    v85.i64[1] = v75;
    v86 = vsubq_f32(v81, v85);
    v87 = vmulq_f32(v86, v86);
    v84.f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v84, 2), vaddq_f32(v84, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v84.f32, 1))).f32[0]);
    v84.i32[1] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v87, 2), vaddq_f32(v87, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v87.f32, 1))).f32[0]);
    v84.i64[1] = 1;
    *(float32x4_t *)&v18[v11[5]] = v84;
    v88 = (uint64_t *)&v18[v11[6]];
    *v88 = v77;
    v88[1] = v79;
    v89 = (uint64_t *)&v18[v11[7]];
    *v89 = v80;
    v89[1] = v82;
    v90 = (uint64_t *)&v18[v11[8]];
    *v90 = v74;
    v90[1] = v75;
    v91 = (__CVBuffer *)sub_22756D410();
    if (!v91)
    {
LABEL_24:
      a6 = v118;
      v12 = v130;
      v59 = v134;
    }
    else
    {
      v92 = v91;
      v93 = -[__CVBuffer boundingQuad](v91, sel_boundingQuad);
      if (v93)
      {
        v121.i64[0] = (uint64_t)v92;
        v122.i64[0] = (uint64_t)v93;
        objc_msgSend(v93, sel_topLeft);
        v94 = v117;
        MEMORY[0x2276B34BC](v117, (uint64_t)v63);
        v119.i64[0] = sub_22758E910();
        v120.i64[0] = v95;
        if ((v96 & 1) == 0)
        {
          objc_msgSend((id)v122.i64[0], sel_bottomLeft);
          MEMORY[0x2276B34BC](v94, (uint64_t)v63);
          v97 = sub_22758E910();
          if ((v99 & 1) == 0)
          {
            v100 = v97;
            v101 = v98;

            v102 = v124;
            v103.i64[0] = v119.i64[0];
            v103.i64[1] = v120.i64[0];
            v104.i64[0] = v100;
            v104.i64[1] = v101;
            v105 = vsubq_f32(v103, v104);
            v106 = vmulq_f32(v105, v105);
            *(float *)&v18[v11[10]] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v106, 2), vaddq_f32(v106, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v106.f32, 1))).f32[0]);
            v107 = v129;
            v108 = v134;
            *(_QWORD *)&v18[v19] = *(_QWORD *)(v134 + v129[5]);
            v109 = (_OWORD *)(v108 + v107[6]);
            v110 = &v18[v11[12]];
            v111 = v109[1];
            *(_OWORD *)v110 = *v109;
            *((_OWORD *)v110 + 1) = v111;
            *(_QWORD *)&v18[v11[13]] = *(_QWORD *)(v108 + v107[7]);
            v18[v11[14]] = *(_BYTE *)(v108 + v107[8]);
            swift_bridgeObjectRetain();
            v112 = v102;
            sub_22730DFB0(v108, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
            v113 = v131;

            *(_QWORD *)&v18[v113] = v123;
            v114 = v118;
            sub_22756B734((uint64_t)v18, v118);
            (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v130 + 56))(v114, 0, 1, v11);
            return (id)sub_22730DFB0((uint64_t)v18, (uint64_t (*)(_QWORD))type metadata accessor for SpatialTextBlock);
          }
        }

        a3 = v133;
        v59 = v134;
        a6 = v118;
        v92 = (__CVBuffer *)v121.i64[0];
        v116 = (__CVBuffer *)v122.i64[0];
      }
      else
      {
        v116 = v133;
        v59 = v134;
        a6 = v118;
      }

      a3 = v116;
      v133 = v92;
      v12 = v130;
    }
    a4 = v124;
    goto LABEL_26;
  }
LABEL_36:
  __break(1u);
  return result;
}

unint64_t sub_22756CB3C(float32x4_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v15;
  char *v16;
  float32x2_t *v17;
  float32x4_t v18;
  float v19;
  uint64_t v20;
  int32x4_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float32x4_t v24;
  float v25;
  float32x4_t v26;
  float32x4_t v27;
  int32x4_t v28;
  float32x2_t v29;
  float32x2_t v30;
  float32x4_t v31;
  float v32;
  float32x4_t v33;
  uint64_t v34;
  unsigned __int8 v35;
  float32x4_t v37;
  int32x4_t v38;
  float32x2_t v39;
  float32x2_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  unsigned __int8 v44;

  v42 = a1;
  v2 = type metadata accessor for SpatialTextBlock();
  v7 = MEMORY[0x24BDAC7A8](v2, v3, v4, v5, v6);
  v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v7, v10, v11, v12, v13);
  v16 = (char *)&v42 - v15;
  v17 = (float32x2_t *)(v1 + *(int *)(v14 + 24));
  *(float32x2_t *)v18.f32 = vsub_f32(*(float32x2_t *)v42.f32, *v17);
  v19 = v42.f32[2];
  v18.f32[2] = v42.f32[2] - v17[1].f32[0];
  v20 = v1 + *(int *)(v14 + 36);
  v21 = (int32x4_t)vmulq_f32(*(float32x4_t *)v20, *(float32x4_t *)v20);
  v21.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v21, 2), vadd_f32(*(float32x2_t *)v21.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v21.i8, 1))).u32[0];
  v22 = vrsqrte_f32((float32x2_t)v21.u32[0]);
  v23 = vmul_f32(v22, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(v22, v22)));
  v24 = vmulq_f32(v18, vmulq_n_f32(*(float32x4_t *)v20, vmul_f32(v23, vrsqrts_f32((float32x2_t)v21.u32[0], vmul_f32(v23, v23))).f32[0]));
  v43 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v24, 2), vaddq_f32(v24, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.f32, 1)));
  sub_22756B734(v1, (uint64_t)&v42 - v15);
  if (v43.f32[0] >= -0.01)
  {
    v25 = *(float *)&v16[*(int *)(v2 + 20)];
    sub_22730DFB0((uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for SpatialTextBlock);
    if ((float)(v25 + 0.01) >= v43.f32[0])
    {
      *(float32x2_t *)v26.f32 = sub_227509DC8();
      v27 = *(float32x4_t *)(v20 + 16);
      v28 = (int32x4_t)vmulq_f32(v27, v27);
      v28.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v28, 2), vadd_f32(*(float32x2_t *)v28.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v28.i8, 1))).u32[0];
      v29 = vrsqrte_f32((float32x2_t)v28.u32[0]);
      v30 = vmul_f32(v29, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(v29, v29)));
      v31 = vmulq_f32(vsubq_f32(v42, v26), vmulq_n_f32(v27, vmul_f32(v30, vrsqrts_f32((float32x2_t)v28.u32[0], vmul_f32(v30, v30))).f32[0]));
      v43 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v31, 2), vaddq_f32(v31, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v31.f32, 1)));
      sub_22756B734(v1, (uint64_t)v9);
      if (v43.f32[0] >= -0.01)
      {
        v32 = *(float *)&v9[*(int *)(v2 + 20) + 4];
        sub_22730DFB0((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for SpatialTextBlock);
        v33.i32[3] = v43.i32[3];
        if ((float)(v32 + 0.01) >= v43.f32[0])
        {
          v35 = 0;
          *(float32x2_t *)v33.f32 = vsub_f32(*(float32x2_t *)v42.f32, *(float32x2_t *)(v20 + 48));
          v33.f32[2] = v19 - *(float *)(v20 + 56);
          v37 = *(float32x4_t *)(v20 + 32);
          v38 = (int32x4_t)vmulq_f32(v37, v37);
          v38.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v38, 2), vadd_f32(*(float32x2_t *)v38.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v38.i8, 1))).u32[0];
          v39 = vrsqrte_f32((float32x2_t)v38.u32[0]);
          v40 = vmul_f32(v39, vrsqrts_f32((float32x2_t)v38.u32[0], vmul_f32(v39, v39)));
          v41 = vmulq_f32(v33, vmulq_n_f32(v37, vmul_f32(v40, vrsqrts_f32((float32x2_t)v38.u32[0], vmul_f32(v40, v40))).f32[0]));
          v34 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v41, 2), vaddq_f32(v41, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 1))).u32[0];
          goto LABEL_8;
        }
      }
      else
      {
        sub_22730DFB0((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for SpatialTextBlock);
      }
    }
  }
  else
  {
    sub_22730DFB0((uint64_t)v16, (uint64_t (*)(_QWORD))type metadata accessor for SpatialTextBlock);
  }
  v34 = 0;
  v35 = 1;
LABEL_8:
  v44 = v35;
  return v34 | ((unint64_t)v35 << 32);
}

uint64_t SpatialTextBlock.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_22758C984();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t SpatialTextBlock.id.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_22758C984();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*SpatialTextBlock.id.modify())()
{
  return CGRectMake;
}

__n128 SpatialTextBlock.dimensions.getter()
{
  uint64_t v0;

  return *(__n128 *)(v0 + *(int *)(type metadata accessor for SpatialTextBlock() + 20));
}

uint64_t type metadata accessor for SpatialTextBlock()
{
  uint64_t result;

  result = qword_2558DEBF8;
  if (!qword_2558DEBF8)
    return swift_getSingletonMetadata();
  return result;
}

__n128 SpatialTextBlock.dimensions.setter(__n128 a1)
{
  uint64_t v1;
  uint64_t v2;
  __n128 result;

  v2 = type metadata accessor for SpatialTextBlock();
  result = a1;
  *(__n128 *)(v1 + *(int *)(v2 + 20)) = a1;
  return result;
}

double (*SpatialTextBlock.dimensions.modify())(_QWORD)
{
  type metadata accessor for SpatialTextBlock();
  return CGRectMake;
}

__n128 SpatialTextBlock.transform.getter()
{
  uint64_t v0;

  return *(__n128 *)(v0 + *(int *)(type metadata accessor for SpatialTextBlock() + 36));
}

__n128 SpatialTextBlock.transform.setter(__n128 a1, __n128 a2, __n128 a3, __n128 a4)
{
  uint64_t v4;
  __n128 *v5;
  __n128 result;

  v5 = (__n128 *)(v4 + *(int *)(type metadata accessor for SpatialTextBlock() + 36));
  *v5 = a1;
  v5[1] = a2;
  result = a4;
  v5[2] = a3;
  v5[3] = a4;
  return result;
}

double (*SpatialTextBlock.transform.modify())(_QWORD)
{
  type metadata accessor for SpatialTextBlock();
  return CGRectMake;
}

uint64_t SpatialTextBlock.hash(into:)()
{
  sub_22758C984();
  sub_2273096F0((unint64_t *)&qword_2558D5D40, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  return sub_22758E13C();
}

void sub_22756D038(__CVBuffer *a1, __CVBuffer *a2, uint64_t a3, double a4, double a5)
{
  void *v5;
  int64_t Height;
  int64_t Width;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 IsLandscape;
  BOOL v18;
  int64_t v19;
  int64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  int64_t v32;
  int64_t v33;
  float v34;
  float v35;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;

  if (CVPixelBufferGetPixelFormatType(a1) == 1717855600
    && !CVPixelBufferLockBaseAddress(a1, 1uLL)
    && CVPixelBufferGetBaseAddress(a1)
    && a3)
  {
    Height = CVPixelBufferGetHeight(a2);
    Width = CVPixelBufferGetWidth(a2);
    v13 = 1.0;
    if (a4 <= 1.0)
      v14 = a4;
    else
      v14 = 1.0;
    if (v14 > 0.0)
      v15 = v14;
    else
      v15 = 0.0;
    if (a5 <= 1.0)
      v13 = a5;
    if (v13 > 0.0)
      v16 = v13;
    else
      v16 = 0.0;
    IsLandscape = UIInterfaceOrientationIsLandscape(a3);
    v18 = !IsLandscape;
    if (IsLandscape)
      v19 = Width;
    else
      v19 = Height;
    if (v18)
      v20 = Width;
    else
      v20 = Height;
    v21 = MEMORY[0x2276B34BC](v19, v20, v15, v16);
    v23 = (double)Width - v21;
    v24 = (double)Height - v22;
    v25 = (double)Width - v22;
    v26 = (double)Height - v21;
    if (a3 != 1)
    {
      v26 = v22;
      v22 = v21;
    }
    if (a3 != 2)
    {
      v21 = v26;
      v25 = v22;
    }
    if (a3 == 4)
      v27 = v24;
    else
      v27 = v21;
    if (a3 == 4)
      v28 = v23;
    else
      v28 = v25;
    v29 = round(v28);
    if ((~*(_QWORD *)&v29 & 0x7FF0000000000000) != 0)
    {
      if (v29 > -9.22337204e18)
      {
        if (v29 < 9.22337204e18)
        {
          v30 = round(v27);
          if ((~*(_QWORD *)&v30 & 0x7FF0000000000000) != 0)
          {
            if (v30 > -9.22337204e18)
            {
              if (v30 < 9.22337204e18)
              {
                v31 = (uint64_t)v29;
                v32 = CVPixelBufferGetHeight(a1);
                v33 = CVPixelBufferGetWidth(a1);
                v34 = (float)((float)v31 / (float)Width) * (float)v33;
                if (v34 > -9.2234e18)
                {
                  if (v34 < 9.2234e18)
                  {
                    v35 = (float)((float)(uint64_t)v30 / (float)Height) * (float)v32;
                    if ((~LODWORD(v35) & 0x7F800000) != 0 && (LODWORD(v34) & 0x7F800000) != 2139095040)
                    {
                      if (v35 > -9.2234e18)
                      {
                        if (v35 < 9.2234e18)
                        {
                          v37 = (uint64_t)v35 * v33;
                          if ((unsigned __int128)((uint64_t)v35 * (__int128)v33) >> 64 == v37 >> 63)
                          {
                            v38 = __OFADD__((uint64_t)v34, v37);
                            v39 = (uint64_t)v34 + v37;
                            if (!v38)
                            {
                              if ((unint64_t)(v39 - 0x2000000000000000) >> 62 == 3)
                              {
                                objc_msgSend(v5, sel_intrinsics);
                                objc_msgSend(v5, sel_intrinsics);
                                objc_msgSend(v5, sel_intrinsics);
                                objc_msgSend(v5, sel_intrinsics);
                                objc_msgSend(v5, sel_transform);
                                ARVisionCameraToRenderingCoordinateTransform();
                                CVPixelBufferUnlockBaseAddress(a1, 1uLL);
                                return;
                              }
                              goto LABEL_65;
                            }
LABEL_64:
                            __break(1u);
LABEL_65:
                            __break(1u);
                            return;
                          }
LABEL_63:
                          __break(1u);
                          goto LABEL_64;
                        }
LABEL_62:
                        __break(1u);
                        goto LABEL_63;
                      }
LABEL_61:
                      __break(1u);
                      goto LABEL_62;
                    }
LABEL_60:
                    __break(1u);
                    goto LABEL_61;
                  }
LABEL_59:
                  __break(1u);
                  goto LABEL_60;
                }
LABEL_58:
                __break(1u);
                goto LABEL_59;
              }
LABEL_57:
              __break(1u);
              goto LABEL_58;
            }
LABEL_56:
            __break(1u);
            goto LABEL_57;
          }
LABEL_55:
          __break(1u);
          goto LABEL_56;
        }
LABEL_54:
        __break(1u);
        goto LABEL_55;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_54;
  }
}

uint64_t sub_22756D410()
{
  void *v0;
  id v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  void *v8;
  id v9;
  int64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  double v33;
  id v34;
  id *v35;
  double v36;
  uint64_t result;
  unint64_t v38;

  v1 = objc_msgSend(v0, sel_children);
  if (!v1)
    return 0;
  v2 = v1;
  sub_22756EC88();
  v3 = sub_22758E3DC();

  v4 = MEMORY[0x24BEE4AF8];
  v38 = MEMORY[0x24BEE4AF8];
  if (!(v3 >> 62))
  {
    v5 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_4;
LABEL_17:
    swift_bridgeObjectRelease();
    v3 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_26;
    goto LABEL_18;
  }
  swift_bridgeObjectRetain();
  v5 = sub_22758ECE8();
  swift_bridgeObjectRelease();
  if (!v5)
    goto LABEL_17;
LABEL_4:
  if (v5 < 1)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  for (i = 0; i != v5; ++i)
  {
    if ((v3 & 0xC000000000000001) != 0)
      v7 = (id)MEMORY[0x2276B2BEC](i, v3);
    else
      v7 = *(id *)(v3 + 8 * i + 32);
    v8 = v7;
    v9 = objc_msgSend(v7, sel_boundingQuad);

    if (v9)
    {
      sub_22758EC04();
      sub_22758EC34();
      sub_22758EC40();
      sub_22758EC10();
    }
    else
    {

    }
  }
  swift_bridgeObjectRelease();
  v3 = v38;
  if ((v38 & 0x8000000000000000) != 0)
  {
LABEL_26:
    swift_bridgeObjectRetain();
    v10 = sub_22758ECE8();
    swift_release();
    if (v10 < 2)
    {
      swift_bridgeObjectRetain();
      v10 = sub_22758ECE8();
      swift_release();
      if (!v10)
        goto LABEL_25;
      goto LABEL_21;
    }
LABEL_29:
    sub_227324674(0, v10, 0);
    v12 = 0;
    do
    {
      if (v10 == v12)
      {
        __break(1u);
        goto LABEL_50;
      }
      if ((v3 & 0xC000000000000001) != 0)
        v13 = (id)MEMORY[0x2276B2BEC](v12, v3);
      else
        v13 = *(id *)(v3 + 8 * v12 + 32);
      v14 = v13;
      v15 = objc_msgSend(v13, sel_boundingQuad);
      if (!v15)
        goto LABEL_53;
      v16 = v15;
      objc_msgSend(v15, sel_topLeft);
      v18 = v17;
      v20 = v19;

      v21 = objc_msgSend(v14, sel_boundingQuad);
      if (!v21)
        goto LABEL_54;
      v22 = v21;
      objc_msgSend(v21, sel_bottomLeft);
      v24 = v23;
      v26 = v25;

      v28 = *(_QWORD *)(v4 + 16);
      v27 = *(_QWORD *)(v4 + 24);
      if (v28 >= v27 >> 1)
        sub_227324674(v27 > 1, v28 + 1, 1);
      ++v12;
      *(_QWORD *)(v4 + 16) = v28 + 1;
      v29 = v4 + 16 * v28;
      *(double *)(v29 + 32) = sqrt((v24 - v18) * (v24 - v18) + (v26 - v20) * (v26 - v20));
      *(_QWORD *)(v29 + 40) = v14;
    }
    while (v10 != v12);
    swift_release();
    v30 = *(_QWORD *)(v4 + 16);
    if (!v30)
      goto LABEL_55;
    v31 = *(void **)(v4 + 40);
    v32 = v30 - 1;
    if (v30 == 1)
    {
      v10 = v31;
    }
    else
    {
      v33 = *(double *)(v4 + 32);
      swift_bridgeObjectRetain();
      v34 = v31;
      v35 = (id *)(v4 + 56);
      v10 = (int64_t)v34;
      do
      {
        v36 = *((double *)v35 - 1);
        if (v33 < v36)
        {
          v10 = (int64_t)*v35;

          v34 = (id)v10;
          v33 = v36;
        }
        v35 += 2;
        --v32;
      }
      while (v32);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    return v10;
  }
LABEL_18:
  if ((v3 & 0x4000000000000000) != 0)
    goto LABEL_26;
  v10 = *(_QWORD *)(v3 + 16);
  if ((unint64_t)v10 >= 2)
    goto LABEL_29;
  if (!v10)
  {
LABEL_25:
    swift_release();
    return v10;
  }
LABEL_21:
  if ((v3 & 0xC000000000000001) != 0)
  {
LABEL_51:
    v11 = (id)MEMORY[0x2276B2BEC](0, v3);
    goto LABEL_24;
  }
  if (*(_QWORD *)(v3 + 16))
  {
    v11 = *(id *)(v3 + 32);
LABEL_24:
    v10 = (int64_t)v11;
    goto LABEL_25;
  }
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t SpatialTextBlock.hashValue.getter()
{
  sub_22758EF4C();
  sub_22758C984();
  sub_2273096F0((unint64_t *)&qword_2558D5D40, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_22758E13C();
  return sub_22758EF88();
}

__n128 sub_22756D888(uint64_t a1)
{
  uint64_t v1;

  return *(__n128 *)(v1 + *(int *)(a1 + 36));
}

uint64_t sub_22756D89C()
{
  return swift_bridgeObjectRetain();
}

double sub_22756D8A8(uint64_t a1)
{
  uint64_t v1;

  return *(double *)(v1 + *(int *)(a1 + 48));
}

uint64_t sub_22756D8BC(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 56));
}

void sub_22756D8CC()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  double v17;
  float v18;
  float *v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC16MagnifierSupport14WireframePlane_bottom);
  v2 = objc_msgSend(v1, sel_geometry);
  if (v2)
  {
    v26 = v2;
    objc_opt_self();
    v3 = swift_dynamicCastObjCClass();
    if (v3)
    {
      v4 = (void *)v3;
      v5 = *(void **)(v0 + OBJC_IVAR____TtC16MagnifierSupport14WireframePlane_left);
      v6 = objc_msgSend(v5, sel_geometry);
      if (v6)
      {
        v7 = v6;
        objc_opt_self();
        v8 = swift_dynamicCastObjCClass();
        if (v8)
        {
          v9 = (void *)v8;
          v10 = *(void **)(v0 + OBJC_IVAR____TtC16MagnifierSupport14WireframePlane_right);
          v11 = objc_msgSend(v10, sel_geometry);
          if (v11)
          {
            v12 = v11;
            objc_opt_self();
            v13 = swift_dynamicCastObjCClass();
            if (v13)
            {
              v24 = (id)v13;
              v25 = *(id *)(v0 + OBJC_IVAR____TtC16MagnifierSupport14WireframePlane_top);
              v14 = objc_msgSend(v25, sel_geometry);
              if (v14)
              {
                v15 = v14;
                objc_opt_self();
                v16 = swift_dynamicCastObjCClass();
                if (v16)
                {
                  v23 = (id)v16;
                  objc_msgSend(v4, sel_capRadius);
                  v18 = v17;
                  v19 = (float *)(v0 + OBJC_IVAR____TtC16MagnifierSupport14WireframePlane_dimensions);
                  LODWORD(v17) = 0;
                  *((float *)&v17 + 1) = -(float)((float)(v19[1] * 0.5) - v18);
                  objc_msgSend(v1, sel_setSimdPosition_, v17);
                  objc_msgSend(v4, sel_setHeight_, COERCE_FLOAT(*(_QWORD *)v19));
                  objc_msgSend(v5, sel_setSimdPosition_, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT(-(float)((float)(0.5* COERCE_FLOAT(*(_QWORD *)v19))- v18))));
                  objc_msgSend(v9, sel_setHeight_, v19[1]);
                  objc_msgSend(v10, sel_setSimdPosition_, COERCE_DOUBLE((unint64_t)COERCE_UNSIGNED_INT((float)(0.5 * COERCE_FLOAT(*(_QWORD *)v19)) - v18)));
                  objc_msgSend(v24, sel_setHeight_, v19[1]);
                  LODWORD(v20) = 0;
                  *((float *)&v20 + 1) = (float)(v19[1] * 0.5) - v18;
                  objc_msgSend(v25, sel_setSimdPosition_, v20);
                  objc_msgSend(v23, sel_setHeight_, COERCE_FLOAT(*(_QWORD *)v19));
                  v21 = v26;
                  v22 = v7;
                  v26 = v15;
                  v7 = v12;
                  v12 = v22;
                }
                else
                {
                  v21 = v15;
                }

              }
            }

          }
        }

      }
    }

  }
}

char *sub_22756DBF8(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  char *v7;
  double v10;
  void *v11;
  char *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  char *v43;
  double v45;
  objc_super v51;

  *(_QWORD *)&v7[OBJC_IVAR____TtC16MagnifierSupport14WireframePlane_dimensions] = 0;
  v10 = *(float *)&a3;
  v11 = (void *)objc_opt_self();
  v12 = v7;
  v13 = objc_msgSend(v11, sel_capsuleWithCapRadius_height_, a2, v10);
  v14 = (void *)objc_opt_self();
  v15 = objc_msgSend(v14, sel_nodeWithGeometry_, v13);

  v16 = objc_msgSend(v15, sel_geometry);
  if (v16)
  {
    v17 = v16;
    v18 = objc_msgSend(v16, sel_firstMaterial);

    if (v18)
    {
      v19 = objc_msgSend(v18, sel_diffuse);

      objc_msgSend(v19, sel_setContents_, a1);
    }
  }
  objc_msgSend(v15, sel_simdLocalRotateBy_, _PromotedConst_1);
  *(_QWORD *)&v12[OBJC_IVAR____TtC16MagnifierSupport14WireframePlane_bottom] = v15;
  v20 = v15;
  v21 = objc_msgSend(v11, sel_capsuleWithCapRadius_height_, a2, *((float *)&a3 + 1));
  v22 = objc_msgSend(v14, sel_nodeWithGeometry_, v21);

  v23 = objc_msgSend(v22, sel_geometry);
  if (v23)
  {
    v24 = v23;
    v25 = objc_msgSend(v23, sel_firstMaterial);

    if (v25)
    {
      v26 = objc_msgSend(v25, sel_diffuse);

      objc_msgSend(v26, sel_setContents_, a1);
    }
  }
  v27 = a1;
  *(_QWORD *)&v12[OBJC_IVAR____TtC16MagnifierSupport14WireframePlane_left] = v22;
  v28 = v22;
  v29 = objc_msgSend(v11, sel_capsuleWithCapRadius_height_, a2, *((float *)&a3 + 1));
  v30 = objc_msgSend(v14, sel_nodeWithGeometry_, v29);

  v31 = objc_msgSend(v30, sel_geometry);
  if (v31)
  {
    v32 = v31;
    v33 = objc_msgSend(v31, sel_firstMaterial);

    if (v33)
    {
      v34 = objc_msgSend(v33, sel_diffuse);

      objc_msgSend(v34, sel_setContents_, v27);
    }
  }
  *(_QWORD *)&v12[OBJC_IVAR____TtC16MagnifierSupport14WireframePlane_right] = v30;
  v35 = v30;
  v36 = objc_msgSend(v11, sel_capsuleWithCapRadius_height_, a2, v10);
  v37 = objc_msgSend(v14, sel_nodeWithGeometry_, v36);

  v38 = objc_msgSend(v37, sel_geometry);
  if (v38)
  {
    v39 = v38;
    v40 = objc_msgSend(v38, sel_firstMaterial);

    if (v40)
    {
      v41 = objc_msgSend(v40, sel_diffuse);

      objc_msgSend(v41, sel_setContents_, v27);
    }
  }
  objc_msgSend(v37, sel_simdLocalRotateBy_, v45);
  *(_QWORD *)&v12[OBJC_IVAR____TtC16MagnifierSupport14WireframePlane_top] = v37;
  v42 = v37;

  v51.receiver = v12;
  v51.super_class = (Class)type metadata accessor for WireframePlane();
  v43 = (char *)objc_msgSendSuper2(&v51, sel_init);
  objc_msgSend(v43, sel_addChildNode_, v20);
  objc_msgSend(v43, sel_addChildNode_, v28);
  objc_msgSend(v43, sel_addChildNode_, v35);
  objc_msgSend(v43, sel_addChildNode_, v42);
  objc_msgSend(v43, sel_setSimdWorldTransform_, a4, a5, a6, a7);

  *(double *)&v43[OBJC_IVAR____TtC16MagnifierSupport14WireframePlane_dimensions] = a3;
  sub_22756D8CC();

  return v43;
}

id sub_22756E0F0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WireframePlane();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL _s16MagnifierSupport16SpatialTextBlockV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  BOOL v9;
  _BOOL8 result;
  float v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  BOOL v17;
  float v18;
  float v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  BOOL v24;
  float v25;
  float v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  BOOL v31;
  float v32;
  float v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  char v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;

  if ((sub_22758C960() & 1) == 0)
    return 0;
  v4 = (int *)type metadata accessor for SpatialTextBlock();
  v5 = 0;
  v6 = v4[5];
  v7 = *(_OWORD *)(a1 + v6);
  v8 = *(_OWORD *)(a2 + v6);
  while (1)
  {
    v50 = v7;
    v11 = *(float *)((unint64_t)&v50 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)));
    v51 = v8;
    v12 = *(float *)((unint64_t)&v51 & 0xFFFFFFFFFFFFFFF3 | (4 * (v5 & 3)));
    v9 = v11 == v12;
    if (v5 == 2)
      break;
    while (1)
    {
      ++v5;
      if (v9)
        break;
      v9 = 0;
      result = 0;
      if (v5 == 2)
        return result;
    }
  }
  if (v11 != v12)
    return 0;
  v13 = 0;
  v14 = v4[6];
  v15 = *(_OWORD *)(a1 + v14);
  v16 = *(_OWORD *)(a2 + v14);
  while (1)
  {
    v48 = v15;
    v18 = *(float *)((unint64_t)&v48 & 0xFFFFFFFFFFFFFFF3 | (4 * (v13 & 3)));
    v49 = v16;
    v19 = *(float *)((unint64_t)&v49 & 0xFFFFFFFFFFFFFFF3 | (4 * (v13 & 3)));
    v17 = v18 == v19;
    if (v13 == 2)
      break;
    while (1)
    {
      ++v13;
      if (v17)
        break;
      v17 = 0;
      result = 0;
      if (v13 == 2)
        return result;
    }
  }
  if (v18 != v19)
    return 0;
  v20 = 0;
  v21 = v4[7];
  v22 = *(_OWORD *)(a1 + v21);
  v23 = *(_OWORD *)(a2 + v21);
  while (1)
  {
    v46 = v22;
    v25 = *(float *)((unint64_t)&v46 & 0xFFFFFFFFFFFFFFF3 | (4 * (v20 & 3)));
    v47 = v23;
    v26 = *(float *)((unint64_t)&v47 & 0xFFFFFFFFFFFFFFF3 | (4 * (v20 & 3)));
    v24 = v25 == v26;
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
  if (v25 != v26)
    return 0;
  v27 = 0;
  v28 = v4[8];
  v29 = *(_OWORD *)(a1 + v28);
  v30 = *(_OWORD *)(a2 + v28);
  while (1)
  {
    v44 = v29;
    v32 = *(float *)((unint64_t)&v44 & 0xFFFFFFFFFFFFFFF3 | (4 * (v27 & 3)));
    v45 = v30;
    v33 = *(float *)((unint64_t)&v45 & 0xFFFFFFFFFFFFFFF3 | (4 * (v27 & 3)));
    v31 = v32 == v33;
    if (v27 == 2)
      break;
    while (1)
    {
      ++v27;
      if (v31)
        break;
      v31 = 0;
      result = 0;
      if (v27 == 2)
        return result;
    }
  }
  if (v32 != v33)
    return 0;
  v34 = v4[9];
  if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + v34 + 16), *(float32x4_t *)(a2 + v34 + 16)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + v34), *(float32x4_t *)(a2 + v34))), vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + v34 + 32), *(float32x4_t *)(a2 + v34 + 32)), (int8x16_t)vceqq_f32(*(float32x4_t *)(a1 + v34 + 48), *(float32x4_t *)(a2 + v34 + 48))))) & 0x80000000) == 0|| *(float *)(a1 + v4[10]) != *(float *)(a2 + v4[10]))
  {
    return 0;
  }
  v35 = v4[11];
  v36 = *(_QWORD *)(a1 + v35);
  v37 = *(_QWORD *)(a2 + v35);
  if (!v36)
  {
    if (!v37)
      goto LABEL_39;
    return 0;
  }
  if (!v37 || (sub_227448A68(v36, v37) & 1) == 0)
    return 0;
LABEL_39:
  result = CGRectEqualToRect(*(CGRect *)(a1 + v4[12]), *(CGRect *)(a2 + v4[12]));
  if (result)
  {
    if (*(double *)(a1 + v4[13]) == *(double *)(a2 + v4[13])
      && *(unsigned __int8 *)(a1 + v4[14]) == *(unsigned __int8 *)(a2 + v4[14]))
    {
      v38 = v4[15];
      v39 = *(void **)(a1 + v38);
      v40 = *(void **)(a2 + v38);
      if (v39)
      {
        if (v40)
        {
          sub_22756EC88();
          v41 = v40;
          v42 = v39;
          v43 = sub_22758E94C();

          if ((v43 & 1) != 0)
            return 1;
        }
      }
      else if (!v40)
      {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_22756E4B0(uint64_t a1)
{
  uint64_t result;

  result = sub_2273096F0(&qword_2558DEB90, (uint64_t (*)(uint64_t))type metadata accessor for SpatialTextBlock, (uint64_t)&protocol conformance descriptor for SpatialTextBlock);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_22756E4EC(uint64_t a1)
{
  uint64_t result;

  result = sub_2273096F0(&qword_2558DEB98, (uint64_t (*)(uint64_t))type metadata accessor for SpatialTextBlock, (uint64_t)&protocol conformance descriptor for SpatialTextBlock);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_22756E528()
{
  return sub_2273096F0(&qword_2558DEB98, (uint64_t (*)(uint64_t))type metadata accessor for SpatialTextBlock, (uint64_t)&protocol conformance descriptor for SpatialTextBlock);
}

uint64_t dispatch thunk of SpatialObject.dimensions.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SpatialObject.transform.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

_QWORD *initializeBufferWithCopyOfBuffer for SpatialTextBlock(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _OWORD *v17;
  _OWORD *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v24 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_22758C984();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(_OWORD *)((char *)a1 + a3[5]) = *(_OWORD *)((char *)a2 + a3[5]);
    *(_OWORD *)((char *)a1 + v8) = *(_OWORD *)((char *)a2 + v8);
    v9 = a3[8];
    *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
    *(_OWORD *)((char *)a1 + v9) = *(_OWORD *)((char *)a2 + v9);
    v10 = a3[9];
    v11 = a3[10];
    v12 = (_OWORD *)((char *)a1 + v10);
    v13 = (_OWORD *)((char *)a2 + v10);
    v14 = v13[1];
    *v12 = *v13;
    v12[1] = v14;
    v15 = v13[3];
    v12[2] = v13[2];
    v12[3] = v15;
    *(_DWORD *)((char *)a1 + v11) = *(_DWORD *)((char *)a2 + v11);
    v16 = a3[12];
    *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
    v17 = (_OWORD *)((char *)a1 + v16);
    v18 = (_OWORD *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    v20 = a3[14];
    *(_QWORD *)((char *)a1 + a3[13]) = *(_QWORD *)((char *)a2 + a3[13]);
    *((_BYTE *)a1 + v20) = *((_BYTE *)a2 + v20);
    v21 = a3[15];
    v22 = *(void **)((char *)a2 + v21);
    *(_QWORD *)((char *)a1 + v21) = v22;
    swift_bridgeObjectRetain();
    v23 = v22;
  }
  return a1;
}

void destroy for SpatialTextBlock(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_22758C984();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for SpatialTextBlock(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  v6 = sub_22758C984();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  v9 = a3[9];
  v10 = a3[10];
  v11 = (_OWORD *)(a1 + v9);
  v12 = (_OWORD *)(a2 + v9);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  v14 = v12[3];
  v11[2] = v12[2];
  v11[3] = v14;
  *(_DWORD *)(a1 + v10) = *(_DWORD *)(a2 + v10);
  v15 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  v16 = (_OWORD *)(a1 + v15);
  v17 = (_OWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = a3[14];
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v19) = *(_BYTE *)(a2 + v19);
  v20 = a3[15];
  v21 = *(void **)(a2 + v20);
  *(_QWORD *)(a1 + v20) = v21;
  swift_bridgeObjectRetain();
  v22 = v21;
  return a1;
}

uint64_t assignWithCopy for SpatialTextBlock(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v6 = sub_22758C984();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  v7 = a3[9];
  v8 = (_OWORD *)(a1 + v7);
  v9 = (_OWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  *(_DWORD *)(a1 + a3[10]) = *(_DWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[12];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  v11[2] = v12[2];
  v11[3] = v12[3];
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  v13 = a3[15];
  v14 = *(void **)(a1 + v13);
  v15 = *(void **)(a2 + v13);
  *(_QWORD *)(a1 + v13) = v15;
  v16 = v15;

  return a1;
}

uint64_t initializeWithTake for SpatialTextBlock(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  __int128 v18;
  uint64_t v19;

  v6 = sub_22758C984();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  v9 = a3[9];
  v10 = a3[10];
  v11 = (_OWORD *)(a1 + v9);
  v12 = (_OWORD *)(a2 + v9);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  v14 = v12[3];
  v11[2] = v12[2];
  v11[3] = v14;
  *(_DWORD *)(a1 + v10) = *(_DWORD *)(a2 + v10);
  v15 = a3[12];
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  v16 = (_OWORD *)(a1 + v15);
  v17 = (_OWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = a3[14];
  *(_QWORD *)(a1 + a3[13]) = *(_QWORD *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v19) = *(_BYTE *)(a2 + v19);
  *(_QWORD *)(a1 + a3[15]) = *(_QWORD *)(a2 + a3[15]);
  return a1;
}

uint64_t assignWithTake for SpatialTextBlock(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  _OWORD *v19;
  uint64_t v20;
  void *v21;

  v6 = sub_22758C984();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  v9 = a3[9];
  v10 = a3[10];
  v11 = (_OWORD *)(a1 + v9);
  v12 = (_OWORD *)(a2 + v9);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  v14 = v12[3];
  v11[2] = v12[2];
  v11[3] = v14;
  *(_DWORD *)(a1 + v10) = *(_DWORD *)(a2 + v10);
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  v15 = a3[12];
  v16 = a3[13];
  v17 = *(_OWORD *)(a2 + v15);
  v18 = *(_OWORD *)(a2 + v15 + 16);
  v19 = (_OWORD *)(a1 + v15);
  *v19 = v17;
  v19[1] = v18;
  *(_QWORD *)(a1 + v16) = *(_QWORD *)(a2 + v16);
  v20 = a3[15];
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  v21 = *(void **)(a1 + v20);
  *(_QWORD *)(a1 + v20) = *(_QWORD *)(a2 + v20);

  return a1;
}

uint64_t getEnumTagSinglePayload for SpatialTextBlock()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22756EA9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = sub_22758C984();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 44));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for SpatialTextBlock()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22756EB30(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_22758C984();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 44)) = a2;
  return result;
}

uint64_t sub_22756EBA8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22758C984();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t type metadata accessor for WireframePlane()
{
  return objc_opt_self();
}

unint64_t sub_22756EC88()
{
  unint64_t result;

  result = qword_2558D8B00;
  if (!qword_2558D8B00)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2558D8B00);
  }
  return result;
}

uint64_t sub_22756ECC4()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _OWORD v11[2];
  _QWORD v12[4];

  v1 = v0;
  v2 = (void *)sub_22758E1B4();
  v3 = objc_msgSend(v0, sel_valueForKey_, v2);

  if (v3)
  {
    sub_22758EAB4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  sub_22732D760((uint64_t)v11, (uint64_t)v12);
  if (!v12[3])
  {
    sub_227365B54((uint64_t)v12);
    goto LABEL_8;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2558DBE10);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v12[0] = MEMORY[0x24BEE4AF8];
    sub_22756EEB0();
    sub_2273A46D0(v5);
    v6 = v12[0];
    sub_22730BA80(0, &qword_2558D7CE0);
    v7 = (void *)sub_22758E3C4();
    v8 = (void *)sub_22758E1B4();
    objc_msgSend(v1, sel_setValue_forKey_, v7, v8);

    v4 = sub_2275760EC(v6);
    swift_bridgeObjectRelease();
    return v4;
  }
  return v10;
}

void sub_22756EEB0()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  BOOL v24;
  uint64_t v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v0 = MEMORY[0x24BEE4AF8];
  v49 = MEMORY[0x24BEE4AF8];
  v1 = (void *)objc_opt_self();
  v2 = (void *)sub_22758E1B4();
  v3 = (void *)sub_22758E1B4();
  v44 = v1;
  v4 = objc_msgSend(v1, sel_groupSpecifierWithID_name_, v2, v3);

  if (v4)
  {
    v5 = sub_22730BA80(0, &qword_2540BA030);
    v6 = (void *)sub_22758E928();
    objc_msgSend(v4, sel_setProperty_forKey_, v6, *MEMORY[0x24BE75B28]);

    v7 = (void *)sub_22758E5EC();
    objc_msgSend(v4, sel_setProperty_forKey_, v7, *MEMORY[0x24BE759E0]);

    v48 = v0;
    sub_227324764(0, 3, 0);
    v8 = v0;
    v47 = v5;
    *(_QWORD *)&v46 = sub_22758E5EC();
    v10 = *(_QWORD *)(v0 + 16);
    v9 = *(_QWORD *)(v8 + 24);
    if (v10 >= v9 >> 1)
    {
      sub_227324764(v9 > 1, v10 + 1, 1);
      v8 = v48;
    }
    *(_QWORD *)(v8 + 16) = v10 + 1;
    sub_227320358(&v46, (_OWORD *)(v8 + 32 * v10 + 32));
    v11 = sub_22758E5EC();
    v47 = v5;
    v48 = v8;
    *(_QWORD *)&v46 = v11;
    v13 = *(_QWORD *)(v8 + 16);
    v12 = *(_QWORD *)(v8 + 24);
    if (v13 >= v12 >> 1)
    {
      sub_227324764(v12 > 1, v13 + 1, 1);
      v8 = v48;
    }
    *(_QWORD *)(v8 + 16) = v13 + 1;
    sub_227320358(&v46, (_OWORD *)(v8 + 32 * v13 + 32));
    v14 = sub_22758E5EC();
    v47 = v5;
    v48 = v8;
    *(_QWORD *)&v46 = v14;
    v16 = *(_QWORD *)(v8 + 16);
    v15 = *(_QWORD *)(v8 + 24);
    if (v16 >= v15 >> 1)
    {
      sub_227324764(v15 > 1, v16 + 1, 1);
      v8 = v48;
    }
    *(_QWORD *)(v8 + 16) = v16 + 1;
    sub_227320358(&v46, (_OWORD *)(v8 + 32 * v16 + 32));
    v17 = (void *)sub_22758E3C4();
    swift_release();
    v18 = 3;
    v43 = v4;
    v48 = MEMORY[0x24BEE4AF8];
    sub_227324764(0, 3, 0);
    v19 = &byte_24EF9A950;
    v20 = v48;
    v21 = MEMORY[0x24BEE0D00];
    do
    {
      v23 = *v19++;
      v22 = v23;
      v24 = v23 == 1;
      v25 = 0x65746E4920707041;
      if (v23 != 1)
        v25 = 0x442074757074754FLL;
      v26 = 0xEF6F6D654420746ELL;
      if (!v24)
        v26 = 0xEB000000006F6D65;
      v27 = v22 == 0;
      if (v22)
        v28 = v25;
      else
        v28 = 0x746C7561666544;
      if (v27)
        v29 = 0xE700000000000000;
      else
        v29 = v26;
      v47 = v21;
      v48 = v20;
      *(_QWORD *)&v46 = v28;
      *((_QWORD *)&v46 + 1) = v29;
      v31 = *(_QWORD *)(v20 + 16);
      v30 = *(_QWORD *)(v20 + 24);
      if (v31 >= v30 >> 1)
      {
        sub_227324764(v30 > 1, v31 + 1, 1);
        v20 = v48;
      }
      *(_QWORD *)(v20 + 16) = v31 + 1;
      sub_227320358(&v46, (_OWORD *)(v20 + 32 * v31 + 32));
      --v18;
    }
    while (v18);
    v32 = (void *)sub_22758E3C4();
    swift_bridgeObjectRelease();
    objc_msgSend(v43, sel_setValues_titles_, v17, v32);

    v33 = v43;
    MEMORY[0x2276B23C4]();
    if (*(_QWORD *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_22758E400();
    sub_22758E424();
    sub_22758E3F4();
    if (qword_2558D4BF0 != -1)
      swift_once();
    swift_retain();
    sub_22758D2CC();
    swift_release();
    v34 = 0;
    v35 = v46;
    v36 = *MEMORY[0x24BE75DA0];
    v37 = *MEMORY[0x24BE75C20];
    while (1)
    {
      v38 = byte_24EF9A958[v34 + 32];
      v39 = (void *)sub_22758E1B4();
      swift_bridgeObjectRelease();
      v40 = objc_msgSend(v44, sel_preferenceSpecifierNamed_target_set_get_detail_cell_edit_, v39, v45, 0, 0, 0, 3, 0);

      if (!v40)
        break;
      v41 = (void *)sub_22758E5EC();
      objc_msgSend(v40, sel_setProperty_forKey_, v41, v36);

      if (v38 == v35)
        objc_msgSend(v33, sel_setProperty_forKey_, v40, v37);
      v42 = v40;
      MEMORY[0x2276B23C4]();
      if (*(_QWORD *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_22758E400();
      ++v34;
      sub_22758E424();
      sub_22758E3F4();

      if (v34 == 3)
      {

        return;
      }
    }
    __break(1u);
  }
  __break(1u);
}

void sub_22756F4D8(void *a1)
{
  void *v1;
  void *v2;
  objc_class *ObjectType;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char receiver;
  void *v10;
  char v11;
  id v12;
  objc_super v13[2];
  objc_super v14;
  __int128 v15;
  __int128 v16;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  v5 = (void *)sub_22758CA74();
  v12 = objc_msgSend(a1, sel_cellForRowAtIndexPath_, v5);

  if (v12)
  {
    objc_opt_self();
    v6 = (void *)swift_dynamicCastObjCClass();
    if (!v6)
    {

      return;
    }
    v7 = objc_msgSend(v6, sel_specifier);
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, sel_propertyForKey_, *MEMORY[0x24BE75DA0]))
      {
        sub_22758EAB4();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v13, 0, sizeof(v13));
      }
      sub_22732D760((uint64_t)v13, (uint64_t)&v15);
      if (*((_QWORD *)&v16 + 1))
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          receiver = (char)v13[0].receiver;
          if (v13[0].receiver <= (id)2)
          {
            if (qword_2558D4BF0 != -1)
            {
              v11 = (char)v13[0].receiver;
              swift_once();
              receiver = v11;
            }
            LOBYTE(v15) = receiver;
            swift_retain();
            sub_22758D2D8();
            swift_release();
          }
        }
        goto LABEL_16;
      }
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
    }
    sub_227365B54((uint64_t)&v15);
LABEL_16:
    v10 = (void *)sub_22758CA74();
    v14.receiver = v2;
    v14.super_class = ObjectType;
    objc_msgSendSuper2(&v14, sel_tableView_didSelectRowAtIndexPath_, a1, v10);

  }
}

uint64_t type metadata accessor for MAGInternalSettingsViewController()
{
  return objc_opt_self();
}

void sub_22756F8A4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (qword_2558D4BA0 != -1)
    swift_once();
  if (byte_2558DAEE0 != 1)
    goto LABEL_13;
  if ((a4 & 1) != 0)
  {
    if (a1 == 1)
    {
LABEL_13:
      v9 = (void *)objc_opt_self();
      sub_22756FA90();
      sub_227390F80();
      v11 = (void *)sub_22758E3C4();
      swift_bridgeObjectRelease();
      objc_msgSend(v9, sel_deactivateConstraints_, v11);

      swift_bridgeObjectRetain();
      goto LABEL_14;
    }
  }
  else if (a1 == 1)
  {
    v8 = *(double *)&a2;
    if (qword_2540B7CF0 != -1)
    {
      swift_once();
      v8 = *(double *)&a2;
    }
    if (*(double *)&qword_2540BCD10 >= v8 || v8 / *(double *)&a3 <= 0.42)
      goto LABEL_13;
  }
  v9 = (void *)objc_opt_self();
  sub_227390F80();
  swift_bridgeObjectRetain();
  v10 = (void *)sub_22758E3C4();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_deactivateConstraints_, v10);

  sub_22756FA90();
LABEL_14:
  v12 = (id)sub_22758E3C4();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_activateConstraints_, v12);

}

uint64_t sub_22756FA90()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  unint64_t v12;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_boundaryConstraints);
  swift_bridgeObjectRetain();
  v2 = sub_22756FC60();
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_cardController);
  v4 = *(void **)(v3 + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_xPositionConstraint);
  v5 = *(void **)(v3 + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_yPositionConstraint);
  v12 = MEMORY[0x24BEE4AF8];
  v6 = v5;
  v7 = v2;
  v8 = v4;
  MEMORY[0x2276B23C4]();
  if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_22758E400();
  sub_22758E424();
  sub_22758E3F4();
  if (v4)
  {
    v9 = v8;
    MEMORY[0x2276B23C4]();
    if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_22758E400();
    sub_22758E424();
    sub_22758E3F4();
  }
  if (v5)
  {
    v10 = v6;
    MEMORY[0x2276B23C4]();
    if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_22758E400();
    sub_22758E424();
    sub_22758E3F4();
  }

  sub_2273A4254(v12);
  return v1;
}

id sub_22756FC60()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___regularWidthConstraint;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___regularWidthConstraint);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___regularWidthConstraint);
  }
  else
  {
    v4 = objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_cardContainer), sel_widthAnchor);
    if (qword_2540B7CF0 != -1)
      swift_once();
    v5 = objc_msgSend(v4, sel_constraintEqualToConstant_, *(double *)&qword_2540BCD10);

    v6 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

id sub_22756FD34()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___informationLabel;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___informationLabel);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___informationLabel);
  }
  else
  {
    v4 = sub_2274E521C();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_22756FD90()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v1 = OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___landscapeInformationLabel;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___landscapeInformationLabel);
  v3 = v2;
  if (v2 == (void *)1)
  {
    if (qword_2558D4BA8 != -1)
      swift_once();
    if (byte_2558DAEE1 == 1)
    {
      v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MFInformationLabel()), sel_init);
      v5 = sub_2273BAB94();
      objc_msgSend(v4, sel_setFont_, v5);

      v6 = (void *)objc_opt_self();
      v7 = v4;
      v8 = objc_msgSend(v6, sel_whiteColor);
      objc_msgSend(v7, sel_setTextColor_, v8);

      v9 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
      v3 = v7;
      v10 = objc_msgSend(v9, sel_initWithWhite_alpha_, 0.1, 1.0);
      objc_msgSend(v3, sel_setBackgroundColor_, v10);

    }
    else
    {
      v3 = 0;
    }
    v11 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;
    v12 = v3;
    sub_2273D3754(v11);
  }
  sub_2273D60B0(v2);
  return v3;
}

char *sub_22756FF14(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  char *v6;
  __int128 v7;
  id v8;
  void *v9;
  void *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  objc_super v17;

  swift_getObjectType();
  v3 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_compactConstraints] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___regularWidthConstraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_boundaryConstraints] = v3;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___informationLabel] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___landscapeInformationLabel] = 1;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_topBoundaryConstraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_leadingBoundaryConstraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_trailingBoundaryConstraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_bottomBoundaryConstraint] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_rotationSubscription] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_containedCard] = a1;
  v4 = qword_2540B90A8;
  v5 = a1;
  v6 = v1;
  if (v4 != -1)
    swift_once();
  v7 = xmmword_2540BD0E0;
  v8 = objc_allocWithZone((Class)type metadata accessor for MFCardContainerView());
  sub_2275506D0(v5, *(double *)&v7, *((double *)&v7 + 1));
  v10 = v9;
  *(_QWORD *)&v6[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_cardContainer] = v9;
  objc_allocWithZone((Class)type metadata accessor for MFCardContainerController());
  *(_QWORD *)&v6[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_cardController] = sub_2275444E8(v10);

  v17.receiver = v6;
  v17.super_class = (Class)type metadata accessor for MFMainCardViewController();
  v11 = (char *)objc_msgSendSuper2(&v17, sel_initWithNibName_bundle_, 0, 0);
  *(_QWORD *)(*(_QWORD *)&v11[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_cardController]
            + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_delegate
            + 8) = &off_24EFAC368;
  swift_unknownObjectWeakAssign();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558DED48);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_227593AB0;
  v13 = sub_22758CFD8();
  v14 = MEMORY[0x24BEBC308];
  *(_QWORD *)(v12 + 32) = v13;
  *(_QWORD *)(v12 + 40) = v14;
  v15 = v11;
  sub_22758E718();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v15;
}

void sub_2275701A0()
{
  char *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  _BYTE *v6;
  id v7;
  id v8;
  objc_super v9;
  uint64_t v10;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540BA320);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_227596560;
  v3 = *(void **)&v0[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_containedCard];
  *(_QWORD *)(v2 + 32) = v3;
  v10 = v2;
  sub_22758E3F4();
  v4 = v10;
  v5 = (objc_class *)type metadata accessor for MFPassthroughView();
  v6 = objc_allocWithZone(v5);
  v6[OBJC_IVAR____TtC16MagnifierSupport17MFPassthroughView_enabled] = 1;
  *(_QWORD *)&v6[OBJC_IVAR____TtC16MagnifierSupport17MFPassthroughView_heightOfPanAreaAboveDrawer] = 0x403E000000000000;
  *(_QWORD *)&v6[OBJC_IVAR____TtC16MagnifierSupport17MFPassthroughView_exemptViews] = v4;
  v9.receiver = v6;
  v9.super_class = v5;
  v7 = v3;
  v8 = objc_msgSendSuper2(&v9, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v1, sel_setView_, v8);

}

void sub_227570334(char a1)
{
  void *v1;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = v1;
  v14.super_class = (Class)type metadata accessor for MFMainCardViewController();
  objc_msgSendSuper2(&v14, sel_viewWillAppear_, a1 & 1);
  v3 = objc_msgSend(v1, sel_traitCollection);
  v4 = objc_msgSend(v3, sel_horizontalSizeClass);

  if (*MEMORY[0x24BEBDF78])
  {
    v5 = (id)*MEMORY[0x24BEBDF78];
    v6 = (void *)sub_2273B8EB0();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, sel_bounds);
      v9 = v8;
      v11 = v10;

      v12 = v9;
      v13 = v11;
    }
    else
    {

      v12 = 0;
      v13 = 0;
    }
    sub_22756F8A4((uint64_t)v4, v12, v13, v7 == 0);
    sub_227571814();
  }
  else
  {
    __break(1u);
  }
}

id sub_2275704D4()
{
  char *v0;
  char *v1;
  void *v2;
  id result;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v1 = v0;
  v2 = *(void **)&v0[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_cardContainer];
  objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  result = objc_msgSend(v1, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  v4 = result;
  objc_msgSend(result, sel_addSubview_, v2);

  v5 = *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_cardController];
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(v5 + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_containerView)+ OBJC_IVAR____TtC16MagnifierSupport19MFCardContainerView_draggableView), sel_heightAnchor);
  v7 = objc_msgSend(v6, sel_constraintEqualToConstant_, sub_2274B9558(0));

  v8 = OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_cardHeightConstraint;
  v9 = *(void **)(v5 + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_cardHeightConstraint);
  *(_QWORD *)(v5 + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_cardHeightConstraint) = v7;

  result = *(id *)(v5 + v8);
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  objc_msgSend(result, sel_setActive_, 1);
  *(_BYTE *)(v5 + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_cardPosition) = 0;
  result = objc_msgSend(v1, sel_view);
  if (!result)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  v10 = result;
  sub_227544870(result);

  result = sub_227570680();
  if (qword_2558D4BA0 != -1)
    result = (id)swift_once();
  if (byte_2558DAEE0 == 1)
    return sub_2275708A4();
  return result;
}

id sub_227570680()
{
  char *v0;
  char *v1;
  void *v2;
  id v3;
  id result;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;

  v1 = v0;
  v2 = *(void **)&v0[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_cardContainer];
  v3 = objc_msgSend(v2, sel_leadingAnchor);
  result = objc_msgSend(v1, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_6;
  }
  v5 = result;
  v6 = objc_msgSend(result, sel_leadingAnchor);

  v7 = objc_msgSend(v3, sel_constraintEqualToAnchor_, v6);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540BA320);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_227599CC0;
  *(_QWORD *)(v8 + 32) = v7;
  v9 = v7;
  v10 = objc_msgSend(v2, sel_bottomAnchor);
  result = objc_msgSend(v1, sel_view);
  if (!result)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v11 = result;
  v12 = objc_msgSend(result, sel_bottomAnchor);

  v13 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v12);
  *(_QWORD *)(v8 + 40) = v13;
  v14 = objc_msgSend(v2, sel_widthAnchor);
  result = objc_msgSend(v1, sel_view);
  if (result)
  {
    v15 = result;
    v16 = objc_msgSend(result, sel_widthAnchor);

    v17 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v16);
    *(_QWORD *)(v8 + 48) = v17;
    sub_22758E3F4();
    *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_compactConstraints] = v8;

    return (id)swift_bridgeObjectRelease();
  }
LABEL_7:
  __break(1u);
  return result;
}

id sub_2275708A4()
{
  char *v0;
  char *v1;
  void *v2;
  id v3;
  id result;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;

  v1 = v0;
  v2 = *(void **)&v0[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_cardContainer];
  v3 = objc_msgSend(v2, sel_topAnchor);
  result = objc_msgSend(v1, sel_view);
  if (!result)
  {
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v5 = result;
  v6 = objc_msgSend(result, sel_safeAreaLayoutGuide);

  v7 = objc_msgSend(v6, sel_topAnchor);
  if (qword_2540B7D18 != -1)
    swift_once();
  v8 = objc_msgSend(v3, sel_constraintGreaterThanOrEqualToAnchor_constant_, v7, *(double *)&qword_2540BCD38);

  v9 = OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_topBoundaryConstraint;
  v10 = *(void **)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_topBoundaryConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_topBoundaryConstraint] = v8;

  v11 = objc_msgSend(v2, sel_leadingAnchor);
  result = objc_msgSend(v1, sel_view);
  if (!result)
    goto LABEL_17;
  v12 = result;
  v13 = objc_msgSend(result, sel_safeAreaLayoutGuide);

  v14 = objc_msgSend(v13, sel_leadingAnchor);
  if (qword_2540B7D08 != -1)
    swift_once();
  v15 = objc_msgSend(v11, sel_constraintGreaterThanOrEqualToAnchor_constant_, v14, *(double *)&qword_2540BCD28, v9);

  v16 = OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_leadingBoundaryConstraint;
  v17 = *(void **)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_leadingBoundaryConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_leadingBoundaryConstraint] = v15;

  v18 = objc_msgSend(v2, sel_trailingAnchor);
  result = objc_msgSend(v1, sel_view);
  if (!result)
    goto LABEL_18;
  v19 = result;
  v20 = objc_msgSend(result, sel_safeAreaLayoutGuide);

  v21 = objc_msgSend(v20, sel_trailingAnchor);
  v22 = objc_msgSend(v18, sel_constraintLessThanOrEqualToAnchor_constant_, v21, -*(double *)&qword_2540BCD28);

  v23 = OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_trailingBoundaryConstraint;
  v24 = *(void **)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_trailingBoundaryConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_trailingBoundaryConstraint] = v22;

  v25 = objc_msgSend(v2, sel_bottomAnchor);
  result = objc_msgSend(v1, sel_view);
  if (!result)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v26 = result;
  v27 = objc_msgSend(result, sel_safeAreaLayoutGuide);

  v28 = objc_msgSend(v27, sel_bottomAnchor);
  if (qword_2540B7D00 != -1)
    swift_once();
  v29 = objc_msgSend(v25, sel_constraintLessThanOrEqualToAnchor_constant_, v28, -*(double *)&qword_2540BCD20);

  v30 = OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_bottomBoundaryConstraint;
  v31 = *(void **)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_bottomBoundaryConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_bottomBoundaryConstraint] = v29;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540BA320);
  result = (id)swift_allocObject();
  *((_OWORD *)result + 1) = xmmword_227598070;
  v32 = *(void **)&v1[v40];
  if (!v32)
    goto LABEL_20;
  *((_QWORD *)result + 4) = v32;
  v33 = *(void **)&v1[v16];
  if (!v33)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  *((_QWORD *)result + 5) = v33;
  v34 = *(void **)&v1[v23];
  if (!v34)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  *((_QWORD *)result + 6) = v34;
  v35 = *(void **)&v1[v30];
  if (v35)
  {
    *((_QWORD *)result + 7) = v35;
    v41 = result;
    sub_22758E3F4();
    *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_boundaryConstraints] = v41;
    v36 = v32;
    v37 = v33;
    v38 = v34;
    v39 = v35;
    return (id)swift_bridgeObjectRelease();
  }
LABEL_23:
  __break(1u);
  return result;
}

void sub_227570CE8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  char *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  char *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  char *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v1 = v0;
  v2 = sub_22758E82C();
  v56 = *(_QWORD *)(v2 - 8);
  v57 = v2;
  MEMORY[0x24BDAC7A8](v2, v3, v4, v5, v6);
  v55 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_22756FD34();
  v9 = (void *)sub_22758E1B4();
  objc_msgSend(v8, sel_setText_, v9);

  v10 = sub_22756FD34();
  objc_msgSend(v10, sel_setAlpha_, 0.0);

  v11 = sub_22756FD34();
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v12 = objc_msgSend(v1, sel_view);
  if (!v12)
  {
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v13 = v12;
  v14 = sub_22756FD34();
  objc_msgSend(v13, sel_addSubview_, v14);

  v15 = (char *)sub_22756FD34();
  v16 = sub_22756FD34();
  v17 = objc_msgSend(v16, sel_bottomAnchor);

  v18 = *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_cardContainer];
  v19 = OBJC_IVAR____TtC16MagnifierSupport19MFCardContainerView_draggableView;
  v20 = objc_msgSend(*(id *)(v18 + OBJC_IVAR____TtC16MagnifierSupport19MFCardContainerView_draggableView), sel_topAnchor);
  if (qword_2540B7CF8 != -1)
    swift_once();
  v21 = objc_msgSend(v17, sel_constraintEqualToAnchor_constant_, v20, -*(double *)&qword_2540BCD18);

  v22 = *(void **)&v15[OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintAboveCard];
  *(_QWORD *)&v15[OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintAboveCard] = v21;

  v23 = (char *)sub_22756FD34();
  v24 = sub_22756FD34();
  v25 = objc_msgSend(v24, sel_topAnchor);

  v26 = objc_msgSend(*(id *)(v18 + v19), sel_bottomAnchor);
  v27 = objc_msgSend(v25, sel_constraintEqualToAnchor_constant_, v26, *(double *)&qword_2540BCD18);

  v28 = *(void **)&v23[OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintBelowCard];
  *(_QWORD *)&v23[OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintBelowCard] = v27;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540BA320);
  v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_227598070;
  v30 = sub_22756FD34();
  v31 = objc_msgSend(v30, sel_leadingAnchor);

  v32 = objc_msgSend(v1, sel_view);
  if (!v32)
    goto LABEL_15;
  v33 = v32;
  v34 = objc_msgSend(v32, sel_leadingAnchor);

  if (qword_2540B8D98 != -1)
    swift_once();
  v35 = objc_msgSend(v31, sel_constraintGreaterThanOrEqualToAnchor_constant_, v34, *(double *)&qword_2540BCE50);

  *(_QWORD *)(v29 + 32) = v35;
  v36 = sub_22756FD34();
  v37 = objc_msgSend(v36, sel_trailingAnchor);

  v38 = objc_msgSend(v1, sel_view);
  if (!v38)
    goto LABEL_16;
  v39 = v38;
  v40 = objc_msgSend(v38, sel_trailingAnchor);

  v41 = objc_msgSend(v37, sel_constraintLessThanOrEqualToAnchor_constant_, v40, -*(double *)&qword_2540BCE50);
  *(_QWORD *)(v29 + 40) = v41;
  v42 = sub_22756FD34();
  v43 = objc_msgSend(v42, sel_centerXAnchor);

  v44 = objc_msgSend(*(id *)(v18 + v19), sel_centerXAnchor);
  v45 = objc_msgSend(v43, sel_constraintEqualToAnchor_, v44);

  *(_QWORD *)(v29 + 48) = v45;
  v46 = (char *)sub_22756FD34();
  v47 = *(void **)&v46[OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintAboveCard];
  v48 = v47;

  if (!v47)
  {
LABEL_17:
    __break(1u);
    return;
  }
  v49 = (void *)objc_opt_self();
  *(_QWORD *)(v29 + 56) = v48;
  v58 = v29;
  sub_22758E3F4();
  sub_227390F80();
  v50 = (void *)sub_22758E3C4();
  swift_bridgeObjectRelease();
  objc_msgSend(v49, sel_activateConstraints_, v50);

  if (qword_2558D4BA8 != -1)
    swift_once();
  if (byte_2558DAEE1 == 1)
  {
    v51 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    v52 = v55;
    sub_22758E838();

    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_22749B570();
    v53 = v57;
    v54 = sub_22758D248();
    swift_release();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v52, v53);
    *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_rotationSubscription] = v54;
    swift_release();
  }
}

void sub_227571300(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x2276B3E34](v2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
    v6 = objc_msgSend(v5, sel_orientation);

    sub_227571394((uint64_t)v6);
  }
}

void sub_227571394(uint64_t a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  if (qword_2558D4BA8 != -1)
    swift_once();
  if (byte_2558DAEE1 == 1)
  {
    v3 = sub_22756FD90();
    if (v3)
    {
      v4 = v3;
      objc_msgSend(v3, sel_rotateIfPossibleTo_, a1);

    }
    v5 = v1 + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_landscapeCoachingLabel;
    v6 = (void *)MEMORY[0x2276B3E34](v1 + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_landscapeCoachingLabel);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, sel_rotateIfPossibleTo_, a1);

    }
    sub_2275722B8();
    if ((unint64_t)(a1 - 3) > 1)
    {
      v14 = sub_22756FD90();
      if (v14)
      {
        v15 = v14;
        objc_msgSend(v14, sel_setHidden_, 1);

      }
      v16 = (void *)MEMORY[0x2276B3E34](v5);
      if (v16)
      {
        v17 = v16;
        objc_msgSend(v16, sel_setHidden_, 1);

      }
      v18 = sub_22756FD34();
      objc_msgSend(v18, sel_setHidden_, 0);

      v13 = (void *)MEMORY[0x2276B3E34](v1 + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_coachingLabel);
      if (v13)
        goto LABEL_14;
    }
    else
    {
      v8 = sub_22756FD34();
      objc_msgSend(v8, sel_setHidden_, 1);

      v9 = (void *)MEMORY[0x2276B3E34](v1 + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_coachingLabel);
      if (v9)
      {
        v10 = v9;
        objc_msgSend(v9, sel_setHidden_, 1);

      }
      v11 = sub_22756FD90();
      if (v11)
      {
        v12 = v11;
        objc_msgSend(v11, sel_setHidden_, 0);

      }
      v13 = (void *)MEMORY[0x2276B3E34](v5);
      if (v13)
      {
LABEL_14:
        v19 = v13;
        objc_msgSend(v13, sel_setHidden_, 0);

      }
    }
  }
}

void sub_22757155C()
{
  void *v0;
  char *v1;
  char *v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;

  v1 = (char *)sub_22756FD90();
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_setText_, 0);
    objc_msgSend(v2, sel_setAlpha_, 0.0);
    objc_msgSend(v2, sel_setHidden_, 1);
    objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v3 = objc_msgSend(v0, sel_view);
    if (v3)
    {
      v4 = v3;
      objc_msgSend(v3, sel_addSubview_, v2);

      v5 = objc_msgSend(v2, sel_centerXAnchor);
      v6 = objc_msgSend(v0, sel_view);
      if (v6)
      {
        v7 = v6;
        v8 = objc_msgSend(v6, sel_centerXAnchor);

        v9 = objc_msgSend(v5, sel_constraintEqualToAnchor_, v8);
        v10 = OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_centerConstraintX;
        v11 = *(void **)&v2[OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_centerConstraintX];
        *(_QWORD *)&v2[OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_centerConstraintX] = v9;

        v12 = objc_msgSend(v2, sel_centerYAnchor);
        v13 = objc_msgSend(v0, sel_view);
        if (v13)
        {
          v14 = v13;
          v15 = objc_msgSend(v13, sel_centerYAnchor);

          v16 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v15);
          v17 = OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_centerConstraintY;
          v18 = *(void **)&v2[OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_centerConstraintY];
          *(_QWORD *)&v2[OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_centerConstraintY] = v16;

          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540BA320);
          v19 = swift_allocObject();
          *(_OWORD *)(v19 + 16) = xmmword_227596550;
          v20 = *(void **)&v2[v10];
          if (v20)
          {
            v21 = v19;
            *(_QWORD *)(v19 + 32) = v20;
            v22 = *(void **)&v2[v17];
            if (v22)
            {
              v23 = (void *)objc_opt_self();
              *(_QWORD *)(v21 + 40) = v22;
              sub_22758E3F4();
              sub_227390F80();
              v24 = v20;
              v25 = v22;
              v26 = (id)sub_22758E3C4();
              swift_bridgeObjectRelease();
              objc_msgSend(v23, sel_activateConstraints_, v26);

              return;
            }
            goto LABEL_13;
          }
LABEL_12:
          __break(1u);
LABEL_13:
          __break(1u);
          return;
        }
LABEL_11:
        __break(1u);
        goto LABEL_12;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_11;
  }
}

void sub_227571814()
{
  char *v0;
  char *v1;
  void *v2;
  id v3;
  char v4;
  char v5;
  char *v6;
  void *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  char *v14;
  void *v15;
  uint64_t *v16;
  void *v17;
  id v18;
  char *v19;
  void *v20;
  void *v21;
  double MidY;
  id v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  char *v34;
  void *v35;
  char *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  char *v41;
  CGRect v42;
  CGRect v43;

  v1 = v0;
  if (qword_2558D4BA0 != -1)
    swift_once();
  if (byte_2558DAEE0 == 1
    && (v2 = *(void **)&v0[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_cardContainer],
        v3 = objc_msgSend(v2, sel_traitCollection),
        sub_22750D7F4(),
        v5 = v4,
        v3,
        (v5 & 1) == 0))
  {
    objc_msgSend(v2, sel_frame);
    MidY = CGRectGetMidY(v42);
    v23 = objc_msgSend(v1, sel_view);
    if (!v23)
    {
      __break(1u);
      return;
    }
    v24 = v23;
    objc_msgSend(v23, sel_bounds);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;

    v43.origin.x = v26;
    v43.origin.y = v28;
    v43.size.width = v30;
    v43.size.height = v32;
    v33 = CGRectGetMidY(v43);
    v34 = (char *)sub_22756FD34();
    v6 = v34;
    if (MidY < v33)
    {
      v35 = *(void **)&v34[OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintAboveCard];
      if (v35)
      {
        v36 = v35;

        objc_msgSend(v36, sel_setActive_, 0);
        v6 = v36;
      }

      v9 = &v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_coachingLabel];
      v37 = MEMORY[0x2276B3E34](&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_coachingLabel]);
      if (v37)
      {
        v38 = (void *)v37;
        v39 = *(void **)(v37 + OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintAboveCard);
        if (v39)
        {
          v40 = v39;

          objc_msgSend(v40, sel_setActive_, 0);
          v38 = v40;
        }

      }
      v14 = (char *)sub_22756FD34();
      v15 = v14;
      v16 = &OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintBelowCard;
      goto LABEL_12;
    }
    v7 = *(void **)&v34[OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintBelowCard];
    if (v7)
      goto LABEL_6;
  }
  else
  {
    v6 = (char *)sub_22756FD34();
    v7 = *(void **)&v6[OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintBelowCard];
    if (v7)
    {
LABEL_6:
      v8 = v7;

      objc_msgSend(v8, sel_setActive_, 0);
      v6 = v8;
    }
  }

  v9 = &v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_coachingLabel];
  v10 = MEMORY[0x2276B3E34](&v1[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_coachingLabel]);
  if (v10)
  {
    v11 = (void *)v10;
    v12 = *(void **)(v10 + OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintBelowCard);
    if (v12)
    {
      v13 = v12;

      objc_msgSend(v13, sel_setActive_, 0);
      v11 = v13;
    }

  }
  v14 = (char *)sub_22756FD34();
  v15 = v14;
  v16 = &OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_constraintAboveCard;
LABEL_12:
  v17 = *(void **)&v14[*v16];
  if (v17)
  {
    v18 = v17;

    objc_msgSend(v18, sel_setActive_, 1);
    v15 = v18;
  }

  v19 = (char *)MEMORY[0x2276B3E34](v9);
  if (v19)
  {
    v20 = v19;
    v21 = *(void **)&v19[*v16];
    if (v21)
    {
      v41 = v21;

      objc_msgSend(v41, sel_setActive_, 1);
      v19 = v41;
    }

  }
}

id sub_227571B7C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MFMainCardViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MFMainCardViewController()
{
  return objc_opt_self();
}

void sub_227571CD4(void *a1, double a2, double a3)
{
  void *v3;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t aBlock[6];
  objc_super v18;

  v18.receiver = v3;
  v18.super_class = (Class)type metadata accessor for MFMainCardViewController();
  objc_msgSendSuper2(&v18, sel_viewWillTransitionToSize_withTransitionCoordinator_, a1, a2, a3);
  if (qword_2558D4BA0 != -1)
    swift_once();
  if (byte_2558DAEE0 == 1)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v3;
    *(double *)(v7 + 24) = a2;
    *(double *)(v7 + 32) = a3;
    aBlock[4] = (uint64_t)sub_2275726F8;
    aBlock[5] = v7;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_227571FE0;
    aBlock[3] = (uint64_t)&block_descriptor_60;
    v8 = _Block_copy(aBlock);
    v9 = v3;
    swift_release();
    objc_msgSend(a1, sel_animateAlongsideTransition_completion_, v8, 0);
    _Block_release(v8);
    if (qword_2558D4A00 != -1)
      swift_once();
    v10 = sub_22758CF9C();
    __swift_project_value_buffer(v10, (uint64_t)qword_2558D6128);
    v11 = sub_22758CF84();
    v12 = sub_22758E6B8();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc();
      v14 = swift_slowAlloc();
      aBlock[0] = v14;
      *(_DWORD *)v13 = 136315394;
      v15 = MEMORY[0x2276B28BC](a2, a3);
      sub_22733611C(v15, v16, aBlock);
      sub_22758EA48();
      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2048;
      sub_22758EA48();
      _os_log_impl(&dword_2272F4000, v11, v12, "new size: %s, ratio w/h: %f", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2276B3D50](v14, -1, -1);
      MEMORY[0x2276B3D50](v13, -1, -1);
    }

  }
}

void sub_227571F64(int a1, id a2, double a3, double a4)
{
  id v6;
  id v7;

  v6 = objc_msgSend(a2, sel_traitCollection);
  v7 = objc_msgSend(v6, sel_horizontalSizeClass);

  sub_22756F8A4((uint64_t)v7, *(uint64_t *)&a3, *(uint64_t *)&a4, 0);
  sub_227571814();
}

uint64_t sub_227571FE0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_227572094(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = v2;
  v14.super_class = (Class)type metadata accessor for MFMainCardViewController();
  objc_msgSendSuper2(&v14, sel_willTransitionToTraitCollection_withTransitionCoordinator_, a1, a2);
  if (qword_2558D4A00 != -1)
    swift_once();
  v5 = sub_22758CF9C();
  __swift_project_value_buffer(v5, (uint64_t)qword_2558D6128);
  v6 = a1;
  v7 = sub_22758CF84();
  v8 = sub_22758E6B8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v13 = v10;
    *(_DWORD *)v9 = 136315138;
    v11 = sub_22750D910();
    sub_22733611C(v11, v12, &v13);
    sub_22758EA48();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2272F4000, v7, v8, "new sz class: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276B3D50](v10, -1, -1);
    MEMORY[0x2276B3D50](v9, -1, -1);

  }
  else
  {

  }
}

void sub_2275722B8()
{
  char *v0;
  id v1;
  id v2;
  char *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  char *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  id v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  char *v40;

  v1 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v2 = objc_msgSend(v1, sel_orientation);

  if (v2 == (id)3)
  {
    v23 = (char *)sub_22756FD90();
    if (v23)
    {
      v24 = v23;
      v25 = *(void **)&v23[OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_centerConstraintX];
      if (v25)
      {
        v26 = v25;
        v27 = objc_msgSend(v0, sel_view);
        if (!v27)
        {
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
          return;
        }
        v28 = v27;
        objc_msgSend(v27, sel_bounds);
        v30 = v29;

        objc_msgSend(v24, sel_bounds);
        v32 = v31 * 0.5 - v30 * 0.5;
        if (qword_2540B8D98 != -1)
          swift_once();
        objc_msgSend(v26, sel_setConstant_, v32 + *(double *)&qword_2540BCE50);

      }
    }
    v13 = (char *)MEMORY[0x2276B3E34](&v0[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_landscapeCoachingLabel]);
    if (v13)
    {
      v33 = *(void **)&v13[OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_centerConstraintX];
      if (v33)
      {
        v40 = v13;
        v15 = v33;
        v34 = objc_msgSend(v0, sel_view);
        if (v34)
        {
          v35 = v34;
          objc_msgSend(v34, sel_bounds);
          v37 = v36;

          objc_msgSend(v40, sel_bounds);
          v39 = v37 * 0.5 - v38 * 0.5;
          if (qword_2540B8D98 != -1)
            swift_once();
          v22 = v39 - *(double *)&qword_2540BCE50;
          goto LABEL_29;
        }
        goto LABEL_35;
      }
      goto LABEL_30;
    }
  }
  else if (v2 == (id)4)
  {
    v3 = (char *)sub_22756FD90();
    if (v3)
    {
      v4 = v3;
      v5 = *(void **)&v3[OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_centerConstraintX];
      if (v5)
      {
        v6 = v5;
        v7 = objc_msgSend(v0, sel_view);
        if (!v7)
        {
          __break(1u);
LABEL_33:
          __break(1u);
          goto LABEL_34;
        }
        v8 = v7;
        objc_msgSend(v7, sel_bounds);
        v10 = v9;

        objc_msgSend(v4, sel_bounds);
        v12 = v10 * 0.5 - v11 * 0.5;
        if (qword_2540B8D98 != -1)
          swift_once();
        objc_msgSend(v6, sel_setConstant_, v12 - *(double *)&qword_2540BCE50);

      }
    }
    v13 = (char *)MEMORY[0x2276B3E34](&v0[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_landscapeCoachingLabel]);
    if (v13)
    {
      v14 = *(void **)&v13[OBJC_IVAR____TtC16MagnifierSupport18MFInformationLabel_centerConstraintX];
      if (v14)
      {
        v40 = v13;
        v15 = v14;
        v16 = objc_msgSend(v0, sel_view);
        if (v16)
        {
          v17 = v16;
          objc_msgSend(v16, sel_bounds);
          v19 = v18;

          objc_msgSend(v40, sel_bounds);
          v21 = v20 * 0.5 - v19 * 0.5;
          if (qword_2540B8D98 != -1)
            swift_once();
          v22 = v21 + *(double *)&qword_2540BCE50;
LABEL_29:
          objc_msgSend(v15, sel_setConstant_, v22);

          v13 = v40;
          goto LABEL_30;
        }
        goto LABEL_33;
      }
LABEL_30:

    }
  }
}

uint64_t sub_2275726D4()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2275726F8(int a1)
{
  uint64_t v1;

  sub_227571F64(a1, *(id *)(v1 + 16), *(double *)(v1 + 24), *(double *)(v1 + 32));
}

uint64_t block_copy_helper_60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_60()
{
  return swift_release();
}

uint64_t sub_22757271C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_227572740(uint64_t a1)
{
  uint64_t v1;

  sub_227571300(a1, v1);
}

void sub_227572748(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  double v15;
  uint64_t v16;
  uint64_t v17;

  if (qword_2558D4A00 != -1)
    swift_once();
  v4 = sub_22758CF9C();
  __swift_project_value_buffer(v4, (uint64_t)qword_2558D6128);
  v5 = a2;
  v6 = sub_22758CF84();
  v7 = sub_22758E6B8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v17 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = sub_22750D910();
    v16 = sub_22733611C(v10, v11, &v17);
    sub_22758EA48();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2272F4000, v6, v7, "old sz class: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2276B3D50](v9, -1, -1);
    MEMORY[0x2276B3D50](v8, -1, -1);

  }
  else
  {

  }
  v12 = *(_QWORD *)(a1 + OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_cardController);
  sub_227544BA0(*(_BYTE *)(v12 + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_cardPosition));
  v13 = *(void **)(v12 + OBJC_IVAR____TtC16MagnifierSupport25MFCardContainerController_containerHeightConstraint);
  if (v13)
  {
    v14 = v13;
    v15 = sub_2274B9558(0);
    if (qword_2540B7D10 != -1)
      swift_once();
    objc_msgSend(v14, sel_setConstant_, v15 + *(double *)&qword_2540BCD30, v16, v17);

  }
}

void sub_227572980()
{
  char *v0;
  uint64_t v1;

  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_compactConstraints] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___regularWidthConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_boundaryConstraints] = v1;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___informationLabel] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController____lazy_storage___landscapeInformationLabel] = 1;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_topBoundaryConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_leadingBoundaryConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_trailingBoundaryConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_bottomBoundaryConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16MagnifierSupport24MFMainCardViewController_rotationSubscription] = 0;

  sub_22758ECC4();
  __break(1u);
}

void MAGAREvent.description.getter()
{
  __asm { BR              X12 }
}

uint64_t sub_227572AF0()
{
  uint64_t v1;

  sub_22758E2B0();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_227572B5C()
{
  uint64_t v0;

  return ((uint64_t (*)(unint64_t))((char *)&loc_227572B34 + 4 * byte_2275A8486[v0]))(0xD000000000000012);
}

void sub_227572B8C()
{
  JUMPOUT(0x227572B2CLL);
}

void sub_227572B98()
{
  JUMPOUT(0x227572B2CLL);
}

void sub_227572BA8()
{
  JUMPOUT(0x227572B2CLL);
}

void sub_227572BB8()
{
  JUMPOUT(0x227572B2CLL);
}

void static MAGAREvent.startedARSession()(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 5;
}

double static MAGAREvent.stoppedARSession()@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 1;
  *(_OWORD *)a1 = xmmword_22759BE70;
  *(_BYTE *)(a1 + 16) = 5;
  return result;
}

id static MAGAREvent.didReceiveARFrame(session:frame:)@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v3;

  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = a2;
  *(_BYTE *)(a3 + 16) = 0;
  v3 = a1;
  return a2;
}

uint64_t static MAGAREvent.didReceiveARSpatialMappingPointClouds(session:spatialMappingPointClouds:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_227572C3C(a1, a2, 1, a3);
}

uint64_t static MAGAREvent.didAddAnchors(session:anchors:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_227572C3C(a1, a2, 2, a3);
}

uint64_t static MAGAREvent.didUpdateAnchors(session:anchors:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_227572C3C(a1, a2, 3, a3);
}

uint64_t static MAGAREvent.didRemoveAnchors(session:anchors:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_227572C3C(a1, a2, 4, a3);
}

uint64_t sub_227572C3C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  id v4;

  *(_QWORD *)a4 = a1;
  *(_QWORD *)(a4 + 8) = a2;
  *(_BYTE *)(a4 + 16) = a3;
  v4 = a1;
  return swift_bridgeObjectRetain();
}

double static MAGAREvent.sessionWasInterrupted()@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 2;
  *(_OWORD *)a1 = xmmword_22759BE80;
  *(_BYTE *)(a1 + 16) = 5;
  return result;
}

double static MAGAREvent.sessionInterruptionEnded()@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 3;
  *(_OWORD *)a1 = xmmword_22759BE90;
  *(_BYTE *)(a1 + 16) = 5;
  return result;
}

double static MAGAREvent.replayConfigurationDidFinishReplaying()@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 4;
  *(_OWORD *)a1 = xmmword_22759BEA0;
  *(_BYTE *)(a1 + 16) = 5;
  return result;
}

id MAGAREvent.eventType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v2;
  void *v3;
  char v4;

  v2 = *(void **)v1;
  v3 = *(void **)(v1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_BYTE *)(v1 + 16);
  *(_BYTE *)(a1 + 16) = v4;
  return sub_227386444(v2, v3, v4);
}

uint64_t MAGAREvent.AREventType.description.getter()
{
  uint64_t v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_227572CFC
                                                                     + 4 * byte_2275A848B[*(unsigned __int8 *)(v0 + 16)]))(0xD00000000000001CLL, 0x80000002275BE7F0);
}

uint64_t sub_227572CFC@<X0>(uint64_t a1@<X8>)
{
  return a1 + 30;
}

uint64_t sub_227572D44()
{
  _QWORD *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)&locret_227572D40
                                                                     + 4 * byte_2275A8491[*v0]))(0xD000000000000012, 0x80000002275BE830);
}

void sub_227572D78()
{
  JUMPOUT(0x227572D38);
}

void sub_227572D84()
{
  JUMPOUT(0x227572D38);
}

void sub_227572D94()
{
  JUMPOUT(0x227572D38);
}

void sub_227572DA4()
{
  JUMPOUT(0x227572D38);
}

ValueMetadata *type metadata accessor for MAGAREvent()
{
  return &type metadata for MAGAREvent;
}

void destroy for MAGAREvent.AREventType(uint64_t a1)
{
  sub_2273C5ACC(*(void **)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s16MagnifierSupport10MAGAREventV11AREventTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  char v5;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_227386444(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s16MagnifierSupport10MAGAREventV11AREventTypeOwca_0(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_227386444(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_2273C5ACC(v6, v7, v8);
  return a1;
}

uint64_t _s16MagnifierSupport10MAGAREventV11AREventTypeOwta_0(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_2273C5ACC(v4, v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for MAGAREvent.AREventType()
{
  return &type metadata for MAGAREvent.AREventType;
}

uint64_t *sub_227572EDC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_22758C858();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B7B10);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v11 = *(int *)(a3 + 20);
    v12 = *(void **)((char *)a2 + v11);
    *(uint64_t *)((char *)a1 + v11) = (uint64_t)v12;
    v13 = v12;
  }
  return a1;
}

void sub_227572FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_22758C858();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);

}

char *sub_227573030(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = sub_22758C858();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B7B10);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = *(int *)(a3 + 20);
  v10 = *(void **)&a2[v9];
  *(_QWORD *)&a1[v9] = v10;
  v11 = v10;
  return a1;
}

char *sub_2275730F0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v6 = sub_22758C858();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B7B10);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  v12 = *(int *)(a3 + 20);
  v13 = *(void **)&a1[v12];
  v14 = *(void **)&a2[v12];
  *(_QWORD *)&a1[v12] = v14;
  v15 = v14;

  return a1;
}

char *sub_227573204(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_22758C858();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B7B10);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  *(_QWORD *)&a1[*(int *)(a3 + 20)] = *(_QWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_2275732C0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v6 = sub_22758C858();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B7B10);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  v12 = *(int *)(a3 + 20);
  v13 = *(void **)&a1[v12];
  *(_QWORD *)&a1[v12] = *(_QWORD *)&a2[v12];

  return a1;
}

uint64_t sub_2275733D0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2275733DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B7B10);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_227573468()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_227573474(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B7B10);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2;
  return result;
}

uint64_t type metadata accessor for Asset()
{
  uint64_t result;

  result = qword_2558DEDA8;
  if (!qword_2558DEDA8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_22757352C()
{
  unint64_t v0;

  sub_22737FCD4();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void MAGError.errorDescription.getter()
{
  __asm { BR              X10 }
}

unint64_t sub_2275735D8()
{
  sub_22758EBB0();
  swift_bridgeObjectRelease();
  sub_22758EE2C();
  sub_22758E2B0();
  swift_bridgeObjectRelease();
  sub_22758E2B0();
  sub_22758E2B0();
  return 0xD00000000000001FLL;
}

void sub_22757377C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjCClassFromMetadata;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = v2 | v1;
  if (v2 | v1 | v0 && (v0 != 1 || v3) && (v0 != 2 || v3) && (v0 != 3 || v3) && v0 == 4 && !v3)
  {
    type metadata accessor for MAGUtilities();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v5 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v6 = (void *)sub_22758E1B4();
    v7 = (void *)sub_22758E1B4();
    v8 = objc_msgSend(v5, sel_localizedStringForKey_value_table_, v6, 0, v7);

    sub_22758E1E4();
  }
  JUMPOUT(0x22757375CLL);
}

uint64_t sub_227573A1C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if (!a4 || a4 == 3 || a4 == 2)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for MAGError(uint64_t a1)
{
  return sub_227386414(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t initializeWithCopy for MAGError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_227573A1C(*(_QWORD *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for MAGError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_227573A1C(*(_QWORD *)a2, v4, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  sub_227386414(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for MAGError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  sub_227386414(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for MAGError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 4)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MAGError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 252;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_227573C10(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 3u)
    return *(unsigned __int8 *)(a1 + 24);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_227573C28(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  v2 = a2 - 4;
  if (a2 >= 4)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    LOBYTE(a2) = 4;
    *(_QWORD *)result = v2;
  }
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MAGError()
{
  return &type metadata for MAGError;
}

uint64_t sub_227573C54(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_227573C88 + 4 * byte_2275A8650[a1]))(0x7974697275636553, 0xE800000000000000);
}

unint64_t sub_227573C88()
{
  return 0xD000000000000014;
}

uint64_t sub_227573CA4()
{
  return 0x7265776F50;
}

uint64_t sub_227573CB8()
{
  return 0x616D726F66726550;
}

uint64_t sub_227573CD8()
{
  return 0x69626173552F4955;
}

uint64_t sub_227573CF8()
{
  return 0x2073756F69726553;
}

uint64_t sub_227573D18()
{
  return 0x754220726568744FLL;
}

uint64_t sub_227573D34()
{
  return 0x2065727574616546;
}

uint64_t sub_227573D58()
{
  return 0x6D65636E61686E45;
}

uint64_t sub_227573D78()
{
  return 1802723668;
}

uint64_t sub_227573D88()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;

  v1 = v0[1];
  if ((v1 & 0x2000000000000000) == 0)
  {
    if ((*v0 & 0xFFFFFFFFFFFFLL) != 0)
    {
LABEL_5:
      sub_22758E28C();
      return sub_22758E2BC();
    }
    __break(1u);
  }
  if ((v1 & 0xF00000000000000) != 0)
    goto LABEL_5;
  __break(1u);
  return result;
}

void sub_227573DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  v5 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v6 = (void *)sub_22758C7EC();
  sub_22731E814(MEMORY[0x24BEE4AF8]);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_2273096F0(&qword_2558D5340, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_2275960AC);
  v7 = (void *)sub_22758E10C();
  swift_bridgeObjectRelease();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  v10[4] = sub_2275751CC;
  v10[5] = v8;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_2273D1018;
  v10[3] = &block_descriptor_6_6;
  v9 = _Block_copy(v10);
  sub_22735ECF8(a2);
  swift_release();
  objc_msgSend(v5, sel_openURL_options_completionHandler_, v6, v7, v9);
  _Block_release(v9);

}

uint64_t type metadata accessor for TapToRadarManager()
{
  return objc_opt_self();
}

uint64_t sub_227573F70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, unint64_t a8)
{
  BOOL v8;
  uint64_t v9;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;

  v8 = (a6 & 1) == 0 || a2 != 0 && a4 != 0;
  if (!a8)
    goto LABEL_10;
  v9 = HIBYTE(a8) & 0xF;
  if ((a8 & 0x2000000000000000) == 0)
    v9 = a7 & 0xFFFFFFFFFFFFLL;
  if (v9)
  {
    if (v8)
      return 1;
  }
  else
  {
LABEL_10:
    swift_bridgeObjectRelease();
  }
  v11 = (void *)sub_22758E1B4();
  v12 = (void *)sub_22758E1B4();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v11, v12, 1);

  v14 = (void *)sub_22758E1B4();
  v15 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v14, 0, 0);

  objc_msgSend(v13, sel_addAction_, v15);
  v16 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v17 = sub_2273B91A4();

  if (v17)
  {
    v18 = objc_msgSend(v17, sel_rootViewController);

    if (v18)
    {
      objc_msgSend(v18, sel_presentViewController_animated_completion_, v13, 1, 0);

    }
  }

  return 0;
}

uint64_t sub_227574164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, char a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11, unsigned __int8 a12, char *a13, uint64_t a14, unsigned __int8 a15, unint64_t a16, uint64_t (*a17)(_QWORD), uint64_t a18)
{
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t result;
  uint64_t v121;
  void (**v122)(char *, uint64_t);
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  _QWORD v129[4];
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  char *v140;
  char *v141;
  uint64_t v142;
  unint64_t v143;
  char *v144;
  char *v145;
  uint64_t v146;
  char *v147;
  char *v148;
  uint64_t v149;
  char *v150;
  uint64_t (*v151)(_QWORD);
  unint64_t v152;
  char *v153;
  void (**v154)(char *, uint64_t);
  unint64_t v155;
  char *v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  __int128 aBlock;
  unint64_t v162;
  uint64_t v163;
  unint64_t v164;
  unint64_t v165;

  v155 = a5;
  v149 = a18;
  v151 = a17;
  v24 = a6 & 1;
  v137 = sub_22758DF20();
  v25 = *(_QWORD *)(v137 - 8);
  MEMORY[0x24BDAC7A8](v137, v26, v27, v28, v29);
  v31 = (char *)v129 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v136 = sub_22758DF68();
  v135 = *(_QWORD *)(v136 - 8);
  MEMORY[0x24BDAC7A8](v136, v32, v33, v34, v35);
  v134 = (char *)v129 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_22758C858();
  v158 = *(_QWORD *)(v37 - 8);
  v159 = v37;
  MEMORY[0x24BDAC7A8](v37, v38, v39, v40, v41);
  v150 = (char *)v129 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v43, v44, v45, v46, v47);
  v133 = (char *)v129 - v48;
  v132 = v49;
  MEMORY[0x24BDAC7A8](v50, v51, v52, v53, v54);
  v157 = (char *)v129 - v55;
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B7B10);
  MEMORY[0x24BDAC7A8](v56, v57, v58, v59, v60);
  v148 = (char *)v129 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v62, v63, v64, v65, v66);
  v144 = (char *)v129 - v67;
  v160 = sub_22758C5E8();
  v154 = *(void (***)(char *, uint64_t))(v160 - 8);
  MEMORY[0x24BDAC7A8](v160, v68, v69, v70, v71);
  v156 = (char *)v129 - ((v72 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v73, v74, v75, v76, v77);
  v153 = (char *)v129 - v78;
  MEMORY[0x24BDAC7A8](v79, v80, v81, v82, v83);
  v141 = (char *)v129 - v84;
  MEMORY[0x24BDAC7A8](v85, v86, v87, v88, v89);
  v140 = (char *)v129 - v90;
  MEMORY[0x24BDAC7A8](v91, v92, v93, v94, v95);
  v147 = (char *)v129 - v96;
  MEMORY[0x24BDAC7A8](v97, v98, v99, v100, v101);
  v145 = (char *)v129 - v102;
  MEMORY[0x24BDAC7A8](v103, v104, v105, v106, v107);
  v138 = (char *)v129 - v108;
  MEMORY[0x24BDAC7A8](v109, v110, v111, v112, v113);
  v115 = (char *)v129 - v114;
  v143 = a1;
  v116 = a1;
  v117 = a2;
  v118 = a2;
  v119 = v155;
  v139 = a3;
  v146 = a4;
  v142 = a7;
  v152 = a8;
  result = sub_227573F70(v116, v118, a3, a4, v155, v24, a7, a8);
  if ((result & 1) != 0)
  {
    v129[1] = v31;
    v129[2] = v25;
    v164 = 0xD000000000000013;
    v165 = 0x80000002275BEB80;
    if (!v24)
    {
      strcpy((char *)&aBlock, "ComponentID=");
      BYTE13(aBlock) = 0;
      HIWORD(aBlock) = -5120;
      v162 = v119;
      sub_22758EE2C();
      sub_22758E2B0();
      swift_bridgeObjectRelease();
      sub_22758E2B0();
      sub_22758E2B0();
      swift_bridgeObjectRelease();
    }
    v121 = v160;
    v122 = v154;
    if (v117)
    {
      *(_QWORD *)&aBlock = 0;
      *((_QWORD *)&aBlock + 1) = 0xE000000000000000;
      sub_22758EBB0();
      swift_bridgeObjectRelease();
      strcpy((char *)&aBlock, "ComponentName=");
      HIBYTE(aBlock) = -18;
      sub_22758C5AC();
      sub_22758C5D0();
      v162 = v143;
      v163 = v117;
      sub_22731236C();
      sub_22758EA90();
      v122[1](v115, v121);
      sub_22758E2B0();
      swift_bridgeObjectRelease();
      sub_22758E2B0();
      sub_22758E2B0();
      swift_bridgeObjectRelease();
    }
    v143 = a16;
    v130 = a12;
    v123 = v146;
    if (v146)
    {
      *(_QWORD *)&aBlock = 0;
      *((_QWORD *)&aBlock + 1) = 0xE000000000000000;
      sub_22758EBB0();
      swift_bridgeObjectRelease();
      *(_QWORD *)&aBlock = 0xD000000000000011;
      *((_QWORD *)&aBlock + 1) = 0x80000002275BEBE0;
      v124 = v138;
      sub_22758C5AC();
      sub_22758C5D0();
      v162 = v139;
      v163 = v123;
      sub_22731236C();
      sub_22758EA90();
      v122[1](v124, v121);
      sub_22758E2B0();
      swift_bridgeObjectRelease();
      sub_22758E2B0();
      sub_22758E2B0();
      swift_bridgeObjectRelease();
    }
    LODWORD(v146) = a15;
    v139 = a14;
    v138 = a13;
    v131 = a10;
    v129[3] = a9;
    *(_QWORD *)&aBlock = 0;
    *((_QWORD *)&aBlock + 1) = 0xE000000000000000;
    sub_22758EBB0();
    swift_bridgeObjectRelease();
    *(_QWORD *)&aBlock = 0x6966697373616C43;
    *((_QWORD *)&aBlock + 1) = 0xEF3D6E6F69746163;
    v125 = sub_227573C54(a11);
    v127 = v126;
    v128 = v145;
    sub_22758C5AC();
    sub_22758C5D0();
    v162 = v125;
    v163 = v127;
    v155 = sub_22731236C();
    sub_22758EA90();
    v154 = (void (**)(char *, uint64_t))v122[1];
    ((void (*)(char *, uint64_t))v154)(v128, v121);
    swift_bridgeObjectRelease();
    sub_22758E2B0();
    swift_bridgeObjectRelease();
    sub_22758E2B0();
    sub_22758E2B0();
    swift_bridgeObjectRelease();
    *(_QWORD *)&aBlock = 0;
    *((_QWORD *)&aBlock + 1) = 0xE000000000000000;
    sub_22758EBB0();
    swift_bridgeObjectRelease();
    *(_QWORD *)&aBlock = 0xD000000000000010;
    *((_QWORD *)&aBlock + 1) = 0x80000002275BEBA0;
    __asm { BR              X10 }
  }
  if (v151)
    return v151(0);
  return result;
}

uint64_t sub_2275750CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_22758C858();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  if (*(_QWORD *)(v0 + v4))
    swift_release();
  return swift_deallocObject();
}

void sub_227575144()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t *v3;

  v1 = *(_QWORD *)(sub_22758C858() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (uint64_t *)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_227573DDC(v0 + v2, *v3, v3[1]);
}

uint64_t block_copy_helper_61(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_61()
{
  return swift_release();
}

uint64_t sub_2275751A0()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_2275751CC(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t);

  v2 = *(uint64_t (**)(uint64_t))(v1 + 16);
  if (v2)
    return v2(result & 1);
  return result;
}

void sub_227575200()
{
  qword_2540BCD10 = 0x4077700000000000;
}

void sub_227575214()
{
  qword_2540BCD38 = 0x4034000000000000;
}

void sub_227575224()
{
  qword_2540BCD20 = 0x4058400000000000;
}

void sub_227575238()
{
  qword_2540BCD28 = 0x4034000000000000;
}

void sub_227575248()
{
  qword_2540BCD30 = 0x4030000000000000;
}

void sub_227575258()
{
  qword_2540BCD18 = 0x4038000000000000;
}

uint64_t sub_227575268()
{
  void *v0;
  id v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v1 = objc_msgSend(v0, sel_blocksWithTypes_inRegion_, 2, 0.0, 0.0, 1.0, 1.0);
  sub_22730BA80(0, (unint64_t *)&qword_2558DC3B0);
  v2 = sub_22758E3DC();

  v3 = sub_2273D6F00(v2);
  result = swift_bridgeObjectRelease();
  v13 = v3;
  if (!v3)
    return 0;
  if (!(v3 >> 62))
  {
    v5 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_4;
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v5 = sub_22758ECE8();
  result = swift_bridgeObjectRelease();
  if (!v5)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_4:
  if (v5 >= 1)
  {
    v6 = 0;
    v12 = v5;
    do
    {
      if ((v13 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x2276B2BEC](v6, v13);
      else
        v8 = *(id *)(v13 + 8 * v6 + 32);
      v9 = v8;
      v10 = objc_msgSend(v8, sel_getTranscript);
      if (v10)
      {
        v11 = v10;
        sub_22758E1E4();

        swift_bridgeObjectRetain();
        sub_22758E328();
        sub_22758E2A4();
        v5 = v12;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      ++v6;
      swift_bridgeObjectRetain();
      v14 = sub_22758E328();
      sub_22758E2A4();
      swift_bridgeObjectRelease();

      v7 = v14;
    }
    while (v5 != v6);
    swift_bridgeObjectRelease();
    return v7;
  }
  __break(1u);
  return result;
}

uint64_t sub_2275754F8()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  void *v4;

  v0 = objc_allocWithZone(MEMORY[0x24BE00668]);
  swift_bridgeObjectRetain();
  v1 = (void *)sub_22758E1B4();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithContent_, v1);

  if (v2)
  {
    objc_msgSend(v2, sel_tagContent);
    v3 = objc_msgSend(v2, sel_tags);
    if (v3)
    {
      v4 = v3;
      sub_22730BA80(0, &qword_2558D9A50);
      sub_22758E3D0();

    }
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_22757580C(void *a1, double a2, double a3, double a4, double a5)
{
  void *v5;
  void *v6;
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t result;
  uint64_t v26;
  uint64_t i;
  id v28;
  void *v29;

  v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540BA320);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_227598070;
  v13 = objc_msgSend(v6, sel_leadingAnchor);
  v14 = objc_msgSend(a1, sel_leadingAnchor);
  v15 = objc_msgSend(v13, sel_constraintEqualToAnchor_constant_, v14, a3);

  *(_QWORD *)(v12 + 32) = v15;
  v16 = objc_msgSend(v6, sel_trailingAnchor);
  v17 = objc_msgSend(a1, sel_trailingAnchor);
  v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_constant_, v17, a5);

  *(_QWORD *)(v12 + 40) = v18;
  v19 = objc_msgSend(v6, sel_topAnchor);
  v20 = objc_msgSend(a1, sel_topAnchor);
  v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_constant_, v20, a2);

  *(_QWORD *)(v12 + 48) = v21;
  v22 = objc_msgSend(v6, sel_bottomAnchor);
  v23 = objc_msgSend(a1, sel_bottomAnchor);
  v24 = objc_msgSend(v22, sel_constraintEqualToAnchor_constant_, v23, a4);

  *(_QWORD *)(v12 + 56) = v24;
  result = sub_22758E3F4();
  if (!(v12 >> 62))
  {
    v26 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v26)
      goto LABEL_3;
    return v12;
  }
  swift_bridgeObjectRetain();
  v26 = sub_22758ECE8();
  result = swift_bridgeObjectRelease();
  if (!v26)
    return v12;
LABEL_3:
  if (v26 >= 1)
  {
    swift_bridgeObjectRetain();
    for (i = 0; i != v26; ++i)
    {
      if ((v12 & 0xC000000000000001) != 0)
        v28 = (id)MEMORY[0x2276B2BEC](i, v12);
      else
        v28 = *(id *)(v12 + 8 * i + 32);
      v29 = v28;
      objc_msgSend(v28, sel_setActive_, 1);

    }
    swift_bridgeObjectRelease();
    return v12;
  }
  __break(1u);
  return result;
}

void sub_227575ADC(uint64_t a1)
{
  void *v1;
  id v3;
  id v4;
  CGFloat v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGAffineTransform v9;

  v3 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v4 = objc_msgSend(v3, sel_userInterfaceIdiom);

  if (!v4)
  {
    switch(a1)
    {
      case 2:
        v5 = 3.14159265;
        break;
      case 4:
        v5 = -1.57079633;
        break;
      case 3:
        v5 = 1.57079633;
        break;
      default:
        v7 = xmmword_2275A39F0;
        v6 = xmmword_2275A3A00;
        v8 = 0uLL;
        goto LABEL_10;
    }
    CGAffineTransformMakeRotation(&v9, v5);
    v6 = *(_OWORD *)&v9.a;
    v7 = *(_OWORD *)&v9.c;
    v8 = *(_OWORD *)&v9.tx;
LABEL_10:
    *(_OWORD *)&v9.a = v6;
    *(_OWORD *)&v9.c = v7;
    *(_OWORD *)&v9.tx = v8;
    objc_msgSend(v1, sel_setTransform_, &v9);
  }
}

void sub_227575BC0(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;

  v4 = a1;
  sub_227575ADC(a3);

}

uint64_t sub_227575C00(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_22758ECE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return v3;
  v13 = MEMORY[0x24BEE4AF8];
  result = sub_227324764(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x2276B2BEC](i, a1);
        sub_22730BA80(0, (unint64_t *)&unk_2540BA020);
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_227324764(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v7 = *(_QWORD *)(v3 + 16);
        v6 = *(_QWORD *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_227324764(v6 > 1, v7 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v7 + 1;
        sub_227320358(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      sub_22730BA80(0, (unint64_t *)&unk_2540BA020);
      do
      {
        v9 = *v8;
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_227324764(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v11 = *(_QWORD *)(v3 + 16);
        v10 = *(_QWORD *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_227324764(v10 > 1, v11 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v11 + 1;
        sub_227320358(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_227575E60(unint64_t a1)
{
  return sub_227576100(a1, (unint64_t *)&qword_2558D9E60);
}

uint64_t sub_227575E74(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t *boxed_opaque_existential_1;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = type metadata accessor for DetectedTextBlock();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4, v5, v6, v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = MEMORY[0x24BEE4AF8];
  if (v10)
  {
    v21 = MEMORY[0x24BEE4AF8];
    sub_2273248B4(0, v10, 0);
    v11 = v21;
    v12 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v13 = *(_QWORD *)(v3 + 72);
    do
    {
      sub_22738D654(v12, (uint64_t)v9);
      v21 = v11;
      v15 = *(_QWORD *)(v11 + 16);
      v14 = *(_QWORD *)(v11 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_2273248B4(v14 > 1, v15 + 1, 1);
        v11 = v21;
      }
      v19 = v2;
      v20 = sub_2273096F0((unint64_t *)&unk_2558DEF60, (uint64_t (*)(uint64_t))type metadata accessor for DetectedTextBlock, (uint64_t)&unk_22759BBBC);
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v18);
      sub_22738D654((uint64_t)v9, (uint64_t)boxed_opaque_existential_1);
      *(_QWORD *)(v11 + 16) = v15 + 1;
      sub_22731A268(&v18, v11 + 40 * v15 + 32);
      sub_2273D9400((uint64_t)v9);
      v12 += v13;
      --v10;
    }
    while (v10);
  }
  return v11;
}

uint64_t sub_227575FE0(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  __int128 *v4;
  __int128 v5;
  id v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v7 = MEMORY[0x24BEE4AF8];
    sub_22758EC28();
    v4 = (__int128 *)(a1 + 32);
    do
    {
      v5 = *v4++;
      v6 = (id)v5;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2540B9080);
      sub_22730BA80(0, (unint64_t *)&unk_2540B9FE0);
      swift_dynamicCast();

      sub_22758EC04();
      sub_22758EC34();
      sub_22758EC40();
      sub_22758EC10();
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_2275760EC(unint64_t a1)
{
  return sub_227576100(a1, &qword_2558D7CE0);
}

uint64_t sub_227576100(unint64_t a1, unint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  id *v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  _OWORD v14[2];
  uint64_t v15;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_22758ECE8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v5 = MEMORY[0x24BEE4AF8];
  if (!v4)
    return v5;
  v15 = MEMORY[0x24BEE4AF8];
  result = sub_227324764(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v4; ++i)
      {
        MEMORY[0x2276B2BEC](i, a1);
        sub_22730BA80(0, a2);
        swift_dynamicCast();
        v5 = v15;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_227324764(0, *(_QWORD *)(v5 + 16) + 1, 1);
          v5 = v15;
        }
        v9 = *(_QWORD *)(v5 + 16);
        v8 = *(_QWORD *)(v5 + 24);
        if (v9 >= v8 >> 1)
        {
          sub_227324764(v8 > 1, v9 + 1, 1);
          v5 = v15;
        }
        *(_QWORD *)(v5 + 16) = v9 + 1;
        sub_227320358(v14, (_OWORD *)(v5 + 32 * v9 + 32));
      }
    }
    else
    {
      v10 = (id *)(a1 + 32);
      sub_22730BA80(0, a2);
      do
      {
        v11 = *v10;
        swift_dynamicCast();
        v5 = v15;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_227324764(0, *(_QWORD *)(v5 + 16) + 1, 1);
          v5 = v15;
        }
        v13 = *(_QWORD *)(v5 + 16);
        v12 = *(_QWORD *)(v5 + 24);
        if (v13 >= v12 >> 1)
        {
          sub_227324764(v12 > 1, v13 + 1, 1);
          v5 = v15;
        }
        *(_QWORD *)(v5 + 16) = v13 + 1;
        sub_227320358(v14, (_OWORD *)(v5 + 32 * v13 + 32));
        ++v10;
        --v4;
      }
      while (v4);
    }
    return v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_227576350@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_22758D194();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2275763CC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_22758D1A0();
}

uint64_t sub_22757643C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(uint8_t *, char *, uint64_t);
  unint64_t v14;
  unint64_t v15;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;

  v1 = sub_22758C858();
  v18 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v2, v3, v4, v5);
  v7 = (uint8_t *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2558D4BD8 != -1)
    swift_once();
  v8 = sub_22738669C();
  v9 = *((_QWORD *)v8 + 2);
  if (v9)
  {
    v17[1] = v0;
    v20 = MEMORY[0x24BEE4AF8];
    sub_22758EC28();
    v10 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    v17[0] = v8;
    v11 = &v8[v10];
    v12 = *(_QWORD *)(v18 + 72);
    v13 = *(void (**)(uint8_t *, char *, uint64_t))(v18 + 16);
    do
    {
      v13(v7, v11, v1);
      sub_227579104(v7, &v19);
      (*(void (**)(uint8_t *, uint64_t))(v18 + 8))(v7, v1);
      sub_22758EC04();
      sub_22758EC34();
      sub_22758EC40();
      sub_22758EC10();
      v11 += v12;
      --v9;
    }
    while (v9);
    v14 = v20;
    swift_bridgeObjectRelease();
    if (!(v14 >> 62))
      goto LABEL_7;
LABEL_10:
    sub_22730BA80(0, (unint64_t *)&unk_2540B9FE0);
    swift_bridgeObjectRetain();
    v15 = sub_22758ECD0();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  swift_bridgeObjectRelease();
  v14 = MEMORY[0x24BEE4AF8];
  if (MEMORY[0x24BEE4AF8] >> 62)
    goto LABEL_10;
LABEL_7:
  swift_bridgeObjectRetain();
  sub_22758EE68();
  sub_22730BA80(0, (unint64_t *)&unk_2540B9FE0);
  v15 = v14;
LABEL_8:
  swift_bridgeObjectRelease();
  sub_227579440(v15);
  return swift_bridgeObjectRelease();
}

double sub_22757668C()
{
  uint64_t v0;
  void *v1;
  double v2;
  double v3;
  uint64_t v4;
  double (**v5)(_QWORD, _QWORD);
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_scrollView);
  objc_msgSend(v1, sel_contentOffset);
  v3 = v2;
  v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_config);
  v5 = *(double (***)(_QWORD, _QWORD))(v0
                                                + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_config
                                                + 8);
  v6 = v5[3](v4, v5);
  sub_22757699C();
  v8 = v7;
  v9 = v5[6](v4, v5);
  if (v8 <= v9)
    v8 = v9;
  v10 = v5[7](v4, v5);
  if (v10 >= v8)
    v10 = v8;
  v11 = v3 + (v6 + v10) * 0.5;
  objc_msgSend(v1, sel_frame);
  objc_msgSend(v1, sel_contentOffset);
  return v11;
}

uint64_t sub_227576788()
{
  void *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];

  v1 = sub_22758DF20();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v23 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v3, v4, v5, v6);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_22758DF68();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11, v12, v13, v14);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22730BA80(0, (unint64_t *)&qword_2540B9EF0);
  v17 = (void *)sub_22758E79C();
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v0;
  aBlock[4] = sub_227349CF4;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_227367AE4;
  aBlock[3] = &block_descriptor_32_1;
  v19 = _Block_copy(aBlock);
  v20 = v0;
  swift_release();
  sub_22758DF44();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_2273096F0((unint64_t *)&qword_2540B9C50, v2, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540B9DF0);
  sub_22730BB7C((unint64_t *)&qword_2540B9E00, (uint64_t *)&unk_2540B9DF0, MEMORY[0x24BEE12C8]);
  sub_22758EACC();
  MEMORY[0x2276B27CC](0, v16, v8, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v16, v9);
}

void sub_22757699C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = &v0[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_buttons];
  swift_beginAccess();
  if (!(*(_QWORD *)v1 >> 62))
  {
    v2 = *(_QWORD *)((*(_QWORD *)v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    v3 = v2 - 1;
    if (!__OFSUB__(v2, 1))
      goto LABEL_3;
LABEL_11:
    __break(1u);
LABEL_12:
    swift_bridgeObjectRetain();
    sub_22758ECE8();
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  swift_bridgeObjectRetain();
  v5 = sub_22758ECE8();
  swift_bridgeObjectRelease();
  v3 = v5 - 1;
  if (__OFSUB__(v5, 1))
    goto LABEL_11;
LABEL_3:
  if (v3 < 1)
    return;
  objc_msgSend(v0, sel_bounds);
  if (*(_QWORD *)v1 >> 62)
    goto LABEL_12;
LABEL_5:
  (*(void (**)(void))(*(_QWORD *)&v0[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_config + 8] + 24))();
  v4 = *(_QWORD *)v1;
  if (!(v4 >> 62))
  {
    if (!__OFSUB__(*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10), 1))
      return;
LABEL_15:
    __break(1u);
    return;
  }
  swift_bridgeObjectRetain();
  v6 = sub_22758ECE8();
  swift_bridgeObjectRelease();
  if (__OFSUB__(v6, 1))
    goto LABEL_15;
}

double sub_227576B24()
{
  char *v0;
  double v1;
  double v2;
  double v3;
  unint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v14;

  objc_msgSend(v0, sel_bounds);
  v4 = (unint64_t *)&v0[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_buttons];
  swift_beginAccess();
  v5 = *v4;
  if (!(*v4 >> 62))
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    v7 = v6 - 1;
    if (!__OFSUB__(v6, 1))
      goto LABEL_3;
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  v14 = sub_22758ECE8();
  swift_bridgeObjectRelease();
  v7 = v14 - 1;
  if (__OFSUB__(v14, 1))
    goto LABEL_13;
LABEL_3:
  sub_22757699C();
  v1 = v8;
  v9 = &v0[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_config];
  v0 = *(char **)&v0[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_config];
  v5 = *((_QWORD *)v9 + 1);
  v2 = (*(double (**)(char *, unint64_t))(v5 + 48))(v0, v5);
  v3 = (*(double (**)(char *, unint64_t))(v5 + 56))(v0, v5);
  v10 = *v4;
  if (!(v10 >> 62))
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_5;
  }
LABEL_14:
  swift_bridgeObjectRetain();
  v11 = sub_22758ECE8();
  swift_bridgeObjectRelease();
LABEL_5:
  if (v1 > v2)
    v12 = v1;
  else
    v12 = v2;
  if (v3 < v12)
    v12 = v3;
  return v12 * (double)v7 + (*(double (**)(char *, unint64_t))(v5 + 24))(v0, v5) * (double)v11;
}

uint64_t sub_227576CA0(_BYTE *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  void (*v21)(_BYTE *, uint64_t, uint64_t);
  void (*v22)(_BYTE *, uint64_t);
  void *v23;
  _BYTE v25[24];

  v2 = v1;
  v4 = sub_22758CAD4();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCF678];
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v7, v8, v9, v10);
  v12 = &v25[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v13, v14, v15, v16, v17);
  v19 = &v25[-v18];
  v20 = v2 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_activeItemIndexPath;
  swift_beginAccess();
  v21 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16);
  v21(v19, v20, v4);
  swift_beginAccess();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v6 + 24))(v20, a1, v4);
  swift_endAccess();
  v21(v12, v20, v4);
  sub_2273096F0((unint64_t *)&qword_2558D8E10, v5, MEMORY[0x24BDCF6A0]);
  LOBYTE(v5) = sub_22758E190();
  v22 = *(void (**)(_BYTE *, uint64_t))(v6 + 8);
  v22(v12, v4);
  if ((v5 & 1) == 0)
  {
    v23 = *(void **)(v2 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_scrollView);
    if ((objc_msgSend(v23, sel_isDragging) & 1) != 0
      || objc_msgSend(v23, sel_isDecelerating))
    {
      objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_feedbackGenerator), sel_selectionChanged);
    }
  }
  v22(a1, v4);
  return ((uint64_t (*)(_BYTE *, uint64_t))v22)(v19, v4);
}

id sub_227576E60()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber____lazy_storage___overlayBox;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber____lazy_storage___overlayBox);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber____lazy_storage___overlayBox);
  }
  else
  {
    v4 = sub_2273446A4();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_227576EBC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber____lazy_storage___addButton;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber____lazy_storage___addButton);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber____lazy_storage___addButton);
  }
  else
  {
    sub_227576F1C(v0);
    v4 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void sub_227576F1C(uint64_t a1)
{
  id v2;
  uint64_t ObjCClassFromMetadata;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v2 = sub_227490F14();
  type metadata accessor for MAGUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v4 = (void *)objc_opt_self();
  v5 = v2;
  v6 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
  v7 = (void *)sub_22758E1B4();
  v8 = (void *)sub_22758E1B4();
  v9 = objc_msgSend(v6, sel_localizedStringForKey_value_table_, v7, 0, v8);

  sub_22758E1E4();
  v10 = (id)*MEMORY[0x24BEBAE28];
  v11 = (void *)sub_22758E1B4();
  v12 = (id)AXAttributedStringForBetterPronuciation();

  if (v12)
  {
    sub_22758E1E4();
    swift_bridgeObjectRelease();

    v13 = (void *)sub_22758E1B4();
    swift_bridgeObjectRelease();
    objc_msgSend(v5, sel_setAccessibilityHint_, v13);

    v14 = sub_2274C4B44();
    objc_msgSend(v5, sel_setImage_forState_, v14, 0);

    objc_msgSend(v5, sel_addTarget_action_forControlEvents_, a1, sel_didTapAddButton_, 64);
  }
  else
  {
    __break(1u);
  }
}

id sub_22757710C(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v5;
  objc_class *ObjectType;
  char *v11;
  uint64_t v12;
  id v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  objc_super v25;

  v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  v11 = &v4[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_config];
  *(_QWORD *)v11 = &type metadata for LayoutConstants.FilterRow;
  *((_QWORD *)v11 + 1) = &off_24EF9FBC0;
  v12 = OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_scrollView;
  v13 = objc_allocWithZone(MEMORY[0x24BEBD918]);
  v14 = v4;
  *(_QWORD *)&v5[v12] = objc_msgSend(v13, sel_init);
  v14[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_shouldHighlight] = 0;
  v15 = OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_maskedView;
  *(_QWORD *)&v14[v15] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(_QWORD *)&v14[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_subscribers] = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v14[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_buttons] = MEMORY[0x24BEE4AF8];
  v16 = OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_feedbackGenerator;
  v17 = objc_msgSend((id)objc_opt_self(), sel_lightConfiguration);
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD940]), sel_initWithConfiguration_, v17);

  objc_msgSend(v18, sel__setOutputMode_, 5);
  *(_QWORD *)&v14[v16] = v18;
  MEMORY[0x2276B0AB0](0, 0);
  *(_QWORD *)&v14[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber____lazy_storage___overlayBox] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_overlayBoxLeadingAnchorConstraint] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber____lazy_storage___addButton] = 0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber____lazy_storage___activeItemIndicator] = 0;
  v19 = OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_shouldCenterButtonsVerticallyInParent;
  if (qword_2558D4BA0 != -1)
    swift_once();
  v14[v19] = byte_2558DAEE0;
  *(_QWORD *)&v14[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_rotationSubscription] = 0;

  v25.receiver = v14;
  v25.super_class = ObjectType;
  v20 = objc_msgSendSuper2(&v25, sel_initWithFrame_, a1, a2, a3, a4);
  v21 = (void *)objc_opt_self();
  v22 = v20;
  v23 = objc_msgSend(v21, sel_clearColor);
  objc_msgSend(v22, sel_setBackgroundColor_, v23);

  sub_2275773B4();
  sub_22757643C();
  sub_22757758C();
  sub_227577B74();

  return v22;
}

void sub_2275773B4()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;

  v1 = *(void **)&v0[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_maskedView];
  objc_msgSend(v1, sel_setClipsToBounds_, 0);
  v2 = *(void **)&v0[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_scrollView];
  objc_msgSend(v2, sel_setClipsToBounds_, 0);
  objc_msgSend(v2, sel_setContentInsetAdjustmentBehavior_, 2);
  objc_msgSend(v2, sel_setShowsHorizontalScrollIndicator_, 0);
  objc_msgSend(v2, sel_setShowsVerticalScrollIndicator_, 0);
  objc_msgSend(v2, sel_setDecelerationRate_, *MEMORY[0x24BEBE730]);
  objc_msgSend(v2, sel_setDelegate_, v0);
  objc_msgSend(v2, sel_setBounces_, 1);
  objc_msgSend(v2, sel_setBouncesVertically_, 0);
  objc_msgSend(v2, sel_setBouncesHorizontally_, 1);
  objc_msgSend(v2, sel_setAlwaysBounceHorizontal_, 1);
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA20]), sel_initWithTarget_action_, v0, sel_didTapScrollView_);
  objc_msgSend(v3, sel_setNumberOfTapsRequired_, 1);
  objc_msgSend(v2, sel_addGestureRecognizer_, v3);
  objc_msgSend(v0, sel_addSubview_, v1);
  objc_msgSend(v1, sel_addSubview_, v2);
  v4 = sub_227576E60();
  objc_msgSend(v0, sel_addSubview_, v4);

  v5 = sub_227576EBC();
  objc_msgSend(v0, sel_addSubview_, v5);

}

void sub_22757758C()
{
  char *v0;
  char *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  double (*v25)(uint64_t, uint64_t);
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;

  v1 = v0;
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_maskedView], sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v2 = sub_227576E60();
  objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v3 = sub_227576EBC();
  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  sub_22757580C(v1, *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  swift_bridgeObjectRelease();
  v4 = sub_227576E60();
  v5 = objc_msgSend(v4, sel_leadingAnchor);

  v6 = objc_msgSend(v1, sel_leadingAnchor);
  if (qword_2540B8D20 != -1)
    swift_once();
  v7 = objc_msgSend(v5, sel_constraintEqualToAnchor_constant_, v6, *(double *)&qword_2540BCE00 - *(double *)&qword_2540BCE00);

  v8 = OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_overlayBoxLeadingAnchorConstraint;
  v9 = *(void **)&v1[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_overlayBoxLeadingAnchorConstraint];
  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_overlayBoxLeadingAnchorConstraint] = v7;

  LODWORD(v7) = v1[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_shouldCenterButtonsVerticallyInParent];
  v10 = sub_227576E60();
  v11 = v10;
  if ((_DWORD)v7 == 1)
  {
    v12 = objc_msgSend(v10, sel_centerYAnchor);

    v13 = objc_msgSend(v1, sel_centerYAnchor);
    v14 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v13);
  }
  else
  {
    v12 = objc_msgSend(v10, sel_topAnchor);

    v13 = objc_msgSend(v1, sel_topAnchor);
    v14 = objc_msgSend(v12, sel_constraintEqualToAnchor_constant_, v13, -*(double *)&qword_2540BCE00);
  }
  v15 = v14;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540BA320);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_227598070;
  v17 = *(void **)&v1[v8];
  if (v17)
  {
    v18 = (_QWORD *)v16;
    v19 = (void *)objc_opt_self();
    v18[4] = v17;
    v18[5] = v15;
    v20 = v17;
    v48 = v15;
    v21 = sub_227576E60();
    v22 = objc_msgSend(v21, sel_widthAnchor);

    v23 = *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_config];
    v24 = *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_config + 8];
    v25 = *(double (**)(uint64_t, uint64_t))(v24 + 24);
    v26 = objc_msgSend(v22, sel_constraintEqualToConstant_, v25(v23, v24) + *(double *)&qword_2540BCE00 + *(double *)&qword_2540BCE00);

    v18[6] = v26;
    v27 = sub_227576E60();
    v28 = objc_msgSend(v27, sel_heightAnchor);

    v29 = objc_msgSend(v28, sel_constraintEqualToConstant_, v25(v23, v24) + *(double *)&qword_2540BCE00 + *(double *)&qword_2540BCE00);
    v18[7] = v29;
    sub_22758E3F4();
    sub_22730BA80(0, (unint64_t *)&qword_2540B9F00);
    v30 = (void *)sub_22758E3C4();
    swift_bridgeObjectRelease();
    v31 = v19;
    objc_msgSend(v19, sel_activateConstraints_, v30);

    v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_227598070;
    v33 = sub_227576EBC();
    v34 = objc_msgSend(v33, sel_trailingAnchor);

    v35 = objc_msgSend(v1, sel_trailingAnchor);
    v36 = objc_msgSend(v34, sel_constraintEqualToAnchor_, v35);

    *(_QWORD *)(v32 + 32) = v36;
    v37 = sub_227576EBC();
    v38 = objc_msgSend(v37, sel_widthAnchor);

    if (qword_2540B8DD0 != -1)
      swift_once();
    v39 = objc_msgSend(v38, sel_constraintEqualToConstant_, *(double *)&qword_2540BCE70);

    *(_QWORD *)(v32 + 40) = v39;
    v40 = sub_227576EBC();
    v41 = objc_msgSend(v40, sel_heightAnchor);

    v42 = objc_msgSend(v41, sel_constraintEqualToConstant_, *(double *)&qword_2540BCE70);
    *(_QWORD *)(v32 + 48) = v42;
    v43 = sub_227576EBC();
    v44 = objc_msgSend(v43, sel_centerYAnchor);

    v45 = sub_227576E60();
    v46 = objc_msgSend(v45, sel_centerYAnchor);

    v47 = objc_msgSend(v44, sel_constraintEqualToAnchor_, v46);
    *(_QWORD *)(v32 + 56) = v47;
    sub_22758E3F4();
    v49 = (id)sub_22758E3C4();
    swift_bridgeObjectRelease();
    objc_msgSend(v31, sel_activateConstraints_, v49);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_227577B74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t result;
  id v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;

  v0 = sub_22758E82C();
  v70 = *(_QWORD *)(v0 - 8);
  v71 = v0;
  MEMORY[0x24BDAC7A8](v0, v1, v2, v3, v4);
  v69 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540BA0C0);
  MEMORY[0x24BDAC7A8](v6, v7, v8, v9, v10);
  v80 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B9AE0);
  v79 = *(_QWORD *)(v81 - 8);
  MEMORY[0x24BDAC7A8](v81, v12, v13, v14, v15);
  v78 = (char *)&v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B9930);
  v83 = *(_QWORD *)(v17 - 8);
  v84 = v17;
  MEMORY[0x24BDAC7A8](v17, v18, v19, v20, v21);
  v82 = (char *)&v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_22758DF2C();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23, v25, v26, v27, v28);
  v30 = (char *)&v68 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_22758E784();
  v74 = *(_QWORD *)(v31 - 8);
  v75 = v31;
  MEMORY[0x24BDAC7A8](v31, v32, v33, v34, v35);
  v37 = (char *)&v68 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DEF30);
  v72 = *(_QWORD *)(v38 - 8);
  v73 = v38;
  MEMORY[0x24BDAC7A8](v38, v39, v40, v41, v42);
  v44 = (char *)&v68 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DEF38);
  v76 = *(_QWORD *)(v45 - 8);
  v77 = v45;
  MEMORY[0x24BDAC7A8](v45, v46, v47, v48, v49);
  v51 = (char *)&v68 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2540B87B8 != -1)
    swift_once();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B9B50);
  sub_22758D170();
  swift_endAccess();
  sub_22758E778();
  sub_22730BA80(0, (unint64_t *)&qword_2540B9EF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v24 + 104))(v30, *MEMORY[0x24BEE5488], v23);
  v52 = (void *)sub_22758E7E4();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v30, v23);
  v86 = v52;
  v53 = MEMORY[0x24BDB9EE8];
  sub_22730BB7C((unint64_t *)&unk_2558DEF40, &qword_2558DEF30, MEMORY[0x24BDB9EE8]);
  sub_2273B7764((unint64_t *)&qword_2540B9EE0, (unint64_t *)&qword_2540B9EF0, 0x24BDAC4D0, MEMORY[0x24BEE5670]);
  v54 = v73;
  sub_22758D20C();

  (*(void (**)(char *, uint64_t))(v74 + 8))(v37, v75);
  (*(void (**)(char *, uint64_t))(v72 + 8))(v44, v54);
  swift_allocObject();
  v55 = v85;
  swift_unknownObjectWeakInit();
  sub_22730BB7C((unint64_t *)&unk_2558DEF50, &qword_2558DEF38, MEMORY[0x24BDB9988]);
  v56 = v77;
  sub_22758D248();
  swift_release();
  (*(void (**)(char *, uint64_t))(v76 + 8))(v51, v56);
  swift_beginAccess();
  sub_22758D110();
  swift_endAccess();
  swift_release();
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B9BC0);
  v57 = v78;
  sub_22758D170();
  swift_endAccess();
  v86 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
  v58 = sub_22758EA00();
  v59 = (uint64_t)v80;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56))(v80, 1, 1, v58);
  sub_22730BA80(0, (unint64_t *)&unk_2540BA0E0);
  sub_22730BB7C((unint64_t *)&unk_2540B9AD0, &qword_2540B9AE0, v53);
  sub_2273B7764((unint64_t *)&qword_2540BA0D0, (unint64_t *)&unk_2540BA0E0, 0x24BDBCF18, MEMORY[0x24BDD0408]);
  v60 = v81;
  v61 = v82;
  sub_22758D200();
  sub_22731A1A4(v59, (uint64_t *)&unk_2540BA0C0);

  (*(void (**)(char *, uint64_t))(v79 + 8))(v57, v60);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_22730BB7C((unint64_t *)&unk_2540B9920, &qword_2540B9930, MEMORY[0x24BDB9A08]);
  v62 = v84;
  sub_22758D248();
  swift_release();
  (*(void (**)(char *, uint64_t))(v83 + 8))(v61, v62);
  swift_beginAccess();
  sub_22758D110();
  swift_endAccess();
  result = swift_release();
  if (qword_2558D4BA8 != -1)
    result = swift_once();
  if (byte_2558DAEE1 == 1)
  {
    v64 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    v65 = v69;
    sub_22758E838();

    swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_2273096F0((unint64_t *)&qword_2540B9F40, (uint64_t (*)(uint64_t))MEMORY[0x24BDD0078], MEMORY[0x24BDD0070]);
    v66 = v71;
    v67 = sub_22758D248();
    swift_release();
    (*(void (**)(char *, uint64_t))(v70 + 8))(v65, v66);
    *(_QWORD *)(v55 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_rotationSubscription) = v67;
    return swift_release();
  }
  return result;
}

uint64_t sub_227578308(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD aBlock[6];

  v4 = sub_22758DF20();
  v36 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v5, v6, v7, v8);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_22758DF68();
  v34 = *(_QWORD *)(v11 - 8);
  v35 = v11;
  MEMORY[0x24BDAC7A8](v11, v12, v13, v14, v15);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_22758CAD4();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(_QWORD *)(v19 + 64);
  MEMORY[0x24BDAC7A8](v18, v21, v22, v23, v24);
  swift_beginAccess();
  result = MEMORY[0x2276B3E34](a2 + 16);
  if (result)
  {
    v26 = (void *)result;
    sub_22730BA80(0, (unint64_t *)&qword_2540B9EF0);
    v33 = sub_22758E79C();
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))((char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v18);
    v27 = (*(unsigned __int8 *)(v19 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = v26;
    (*(void (**)(unint64_t, char *, uint64_t))(v19 + 32))(v28 + v27, (char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), v18);
    aBlock[4] = sub_22757B24C;
    aBlock[5] = v28;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_227367AE4;
    aBlock[3] = &block_descriptor_26_2;
    v29 = _Block_copy(aBlock);
    v30 = v26;
    swift_release();
    sub_22758DF44();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_2273096F0((unint64_t *)&qword_2540B9C50, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540B9DF0);
    sub_22730BB7C((unint64_t *)&qword_2540B9E00, (uint64_t *)&unk_2540B9DF0, MEMORY[0x24BEE12C8]);
    sub_22758EACC();
    v31 = (void *)v33;
    MEMORY[0x2276B27CC](0, v17, v10, v29);
    _Block_release(v29);

    (*(void (**)(char *, uint64_t))(v36 + 8))(v10, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v17, v35);
  }
  return result;
}

void sub_2275785BC(uint64_t a1)
{
  void *v1;
  unsigned int v2;
  uint64_t v3;

  v1 = *(void **)(a1 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_scrollView);
  if ((objc_msgSend(v1, sel_isDragging) & 1) != 0)
    v2 = 0;
  else
    v2 = objc_msgSend(v1, sel_isDecelerating) ^ 1;
  v3 = sub_22758CAB0();
  sub_227578634(v3, v2, v2);
}

void sub_227578634(uint64_t a1, int a2, int a3)
{
  char *v3;
  char *v4;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(CGAffineTransform *, _QWORD);
  uint64_t ObjCClassFromMetadata;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  int v34;
  char *v35;
  int v36;
  CGAffineTransform v37;
  uint64_t v38;

  v4 = v3;
  KeyPath = sub_22758CAD4();
  v9 = *(_QWORD *)(KeyPath - 8);
  MEMORY[0x24BDAC7A8](KeyPath, v10, v11, v12, v13);
  v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = &v3[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_buttons];
  swift_beginAccess();
  if (*(_QWORD *)v16 >> 62)
  {
    swift_bridgeObjectRetain();
    v17 = sub_22758ECE8();
    swift_bridgeObjectRelease();
    if (v17 < 0)
    {
      __break(1u);
LABEL_20:
      swift_once();
      goto LABEL_8;
    }
  }
  else
  {
    v17 = *(_QWORD *)((*(_QWORD *)v16 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (a1 < 0 || v17 <= a1)
  {
    v37.a = 0.0;
    v37.b = -2.68156159e154;
    sub_22758EBB0();
    swift_bridgeObjectRelease();
    v37.a = -2.31584178e77;
    *(_QWORD *)&v37.b = 0x80000002275BED80;
    v38 = a1;
    sub_22758EE2C();
    sub_22758E2B0();
    swift_bridgeObjectRelease();
    sub_22758ECC4();
    __break(1u);
    return;
  }
  v17 = (uint64_t)&v3[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_activeItemIndexPath];
  swift_beginAccess();
  v18 = sub_22758CAB0();
  swift_endAccess();
  if (v18 != a1)
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 16))(v15, v17, KeyPath);
    MEMORY[0x2276B0AC8](a1);
    sub_227576CA0(v15);
  }
  v36 = a2;
  v34 = a3;
  v35 = v16;
  if (qword_2540B87B8 != -1)
    goto LABEL_20;
LABEL_8:
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22758D194();
  swift_release();
  swift_release();
  v19 = sub_22758CAB0();
  (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v15, KeyPath);
  if (v19 != a1)
  {
    swift_getKeyPath();
    KeyPath = swift_getKeyPath();
    v20 = (void (*)(CGAffineTransform *, _QWORD))sub_22758D188();
    MEMORY[0x2276B0AC8](a1);
    v20(&v37, 0);
    swift_release();
    swift_release();
  }
  if ((v36 & 1) != 0)
    sub_227579608(a1, v34 & 1);
  type metadata accessor for MAGUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v22 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v23 = (void *)sub_22758E1B4();
  v24 = (void *)sub_22758E1B4();
  v25 = objc_msgSend(v22, sel_localizedStringForKey_value_table_, v23, 0, v24);

  sub_22758E1E4();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540BA310);
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_227596540;
  swift_beginAccess();
  v27 = sub_22758CAB0();
  swift_endAccess();
  if (__OFADD__(v27, 1))
  {
    __break(1u);
  }
  else
  {
    v17 = MEMORY[0x24BEE1768];
    KeyPath = MEMORY[0x24BEE17F0];
    *(_QWORD *)(v26 + 56) = MEMORY[0x24BEE1768];
    *(_QWORD *)(v26 + 64) = KeyPath;
    *(_QWORD *)(v26 + 32) = v27 + 1;
    if (!(*(_QWORD *)v35 >> 62))
    {
      v28 = *(_QWORD *)((*(_QWORD *)v35 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRetain();
  v28 = sub_22758ECE8();
  swift_bridgeObjectRelease();
LABEL_15:
  *(_QWORD *)(v26 + 96) = v17;
  *(_QWORD *)(v26 + 104) = KeyPath;
  *(_QWORD *)(v26 + 72) = v28;
  sub_22758E214();
  swift_bridgeObjectRelease();
  v29 = (void *)sub_22758E1B4();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setAccessibilityValue_, v29);

  v30 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v31 = objc_msgSend(v30, sel_userInterfaceLayoutDirection);

  if (v31 == (id)1)
  {
    v32 = *(void **)&v4[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_scrollView];
    CGAffineTransformMakeScale(&v37, -1.0, 1.0);
    objc_msgSend(v32, sel_setTransform_, &v37);
  }
}

uint64_t sub_227578BB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void **p_vtable;
  void *v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void **v15;
  uint64_t *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  int v26;
  void *v27;
  unint64_t v28;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char v33;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x2276B3E34](v2);
  p_vtable = &OBJC_METACLASS____TtCV16MagnifierSupport13MFEnvironment11FreezeFrame.vtable;
  if (v3)
  {
    v5 = (void *)v3;
    v6 = (unint64_t *)(v3 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_buttons);
    swift_beginAccess();
    v7 = *v6;
    swift_bridgeObjectRetain();

    if (v7 >> 62)
      goto LABEL_23;
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v8; v8 = sub_22758ECE8())
    {
      v31 = v7 & 0xC000000000000001;
      v9 = 4;
      v30 = v7;
      while (1)
      {
        v10 = v31 ? (id)MEMORY[0x2276B2BEC](v9 - 4, v7) : *(id *)(v7 + 8 * v9);
        v11 = v10;
        v12 = v9 - 3;
        if (__OFADD__(v9 - 4, 1))
          break;
        if (p_vtable[247] != (void *)-1)
          swift_once();
        swift_getKeyPath();
        swift_getKeyPath();
        sub_22758D194();
        swift_release();
        swift_release();
        if (v32 == 1
          && (type metadata accessor for ImageCell(), (v13 = swift_dynamicCastClass()) != 0))
        {
          v14 = v13;
          v15 = p_vtable;
          v16 = (uint64_t *)(qword_2540BCDD0
                          + OBJC_IVAR____TtCV16MagnifierSupport13MFEnvironment12UserControls__storedColorFilter);
          swift_beginAccess();
          v32 = *v16;
          v17 = qword_2540B9100;
          v18 = v11;
          v19 = swift_bridgeObjectRetain();
          if (v17 != -1)
            v19 = swift_once();
          MEMORY[0x24BDAC7A8](v19, v20, v21, v22, v23);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540B7DF0);
          sub_22758E7B4();
          swift_bridgeObjectRelease();
          v24 = OBJC_IVAR____TtC16MagnifierSupport9ImageCell_filter;
          *(_BYTE *)(v14 + OBJC_IVAR____TtC16MagnifierSupport9ImageCell_filter) = v33;
          v25 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v14
                                                                      + OBJC_IVAR____TtC16MagnifierSupport9ImageCell_imageView), sel_layer));
          v26 = *(unsigned __int8 *)(v14 + v24);
          if (v26 == 12)
          {
            v27 = 0;
          }
          else
          {
            sub_227418614(v26);
            sub_227575C00(v28);
            swift_bridgeObjectRelease();
            v27 = (void *)sub_22758E3C4();
            swift_bridgeObjectRelease();
          }
          p_vtable = v15;
          objc_msgSend(v25, sel_setFilters_, v27);

          v7 = v30;
          if (v12 == v8)
            goto LABEL_24;
        }
        else
        {

          if (v12 == v8)
            goto LABEL_24;
        }
        ++v9;
      }
      __break(1u);
LABEL_23:
      swift_bridgeObjectRetain();
    }
LABEL_24:
    swift_bridgeObjectRelease_n();
  }
  if (p_vtable[247] != (void *)-1)
    swift_once();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_22758D1A0();
}

void sub_227578FA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD aBlock[6];

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x2276B3E34](v2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
    v6 = objc_msgSend(v5, sel_orientation);

    v7 = (void *)objc_opt_self();
    v8 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v8;
    *(_QWORD *)(v9 + 24) = v6;
    aBlock[4] = sub_22757B19C;
    aBlock[5] = v9;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_227367AE4;
    aBlock[3] = &block_descriptor_62;
    v10 = _Block_copy(aBlock);
    swift_release();

    _Block_release(v10);
  }
}

void sub_227579104(uint8_t *a1@<X0>, _QWORD *a2@<X8>)
{
  id v4;
  void *v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  int v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];

  type metadata accessor for ImageCell();
  strcpy((char *)v27, "freezeframe-");
  v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  sub_22758C7E0();
  sub_22758E2B0();
  swift_bridgeObjectRelease();
  v5 = (void *)sub_22758E1B4();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setAccessibilityIdentifier_, v5);

  strcpy((char *)v27, "freezeframe-");
  BYTE5(v27[1]) = 0;
  HIWORD(v27[1]) = -5120;
  v6 = (char *)v4;
  sub_22758C7E0();
  sub_22758E2B0();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_22758E1B4();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setAccessibilityLabel_, v7);

  v8 = OBJC_IVAR____TtC16MagnifierSupport9ImageCell_imageView;
  v9 = qword_2558D4BE0;
  v10 = *(id *)&v6[OBJC_IVAR____TtC16MagnifierSupport9ImageCell_imageView];
  if (v9 != -1)
    swift_once();
  v11 = sub_227389A24(a1);
  objc_msgSend(v10, sel_setImage_, v11);

  if (qword_2540B87B8 != -1)
    swift_once();
  v12 = qword_2540BCDD0 + OBJC_IVAR____TtCV16MagnifierSupport13MFEnvironment12UserControls__storedColorFilter;
  swift_beginAccess();
  v24 = *(_QWORD *)v12;
  v25 = *(_QWORD *)(v12 + 8);
  LOBYTE(v26) = *(_BYTE *)(v12 + 16);
  v13 = qword_2540B9100;
  v14 = swift_bridgeObjectRetain();
  if (v13 != -1)
    v14 = swift_once();
  MEMORY[0x24BDAC7A8](v14, v15, v16, v17, v18);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540B7DF0);
  sub_22758E7B4();
  swift_bridgeObjectRelease();
  v19 = OBJC_IVAR____TtC16MagnifierSupport9ImageCell_filter;
  v6[OBJC_IVAR____TtC16MagnifierSupport9ImageCell_filter] = HIBYTE(v26);
  v20 = objc_msgSend(*(id *)&v6[v8], sel_layer, v24, v25, v26, v27[0], v27[1]);
  v21 = v6[v19];
  if (v21 == 12)
  {
    v22 = 0;
  }
  else
  {
    sub_227418614(v21);
    sub_227575C00(v23);
    swift_bridgeObjectRelease();
    v22 = (void *)sub_22758E3C4();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v20, sel_setFilters_, v22);

  *a2 = v6;
}

uint64_t sub_227579440(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  unint64_t *v12;
  CGAffineTransform v13;

  if (!(a1 >> 62))
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
LABEL_14:
    v12 = (unint64_t *)(v1 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_buttons);
    swift_beginAccess();
    *v12 = a1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    return sub_227576788();
  }
  swift_bridgeObjectRetain();
  v3 = sub_22758ECE8();
  if (!v3)
    goto LABEL_13;
LABEL_3:
  result = objc_opt_self();
  if (v3 >= 1)
  {
    v5 = (void *)result;
    v6 = 0;
    v7 = *(void **)(v1 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_scrollView);
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x2276B2BEC](v6, a1);
      else
        v8 = *(id *)(a1 + 8 * v6 + 32);
      v9 = v8;
      v10 = objc_msgSend(v5, sel_sharedApplication);
      v11 = objc_msgSend(v10, sel_userInterfaceLayoutDirection);

      if (v11 == (id)1)
      {
        CGAffineTransformMakeScale(&v13, -1.0, 1.0);
        objc_msgSend(v9, sel_setTransform_, &v13);
      }
      ++v6;
      objc_msgSend(v7, sel_addSubview_, v9);

    }
    while (v3 != v6);
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

void sub_227579608(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_buttons);
  swift_beginAccess();
  if ((unint64_t)*v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_22758ECE8();
    swift_bridgeObjectRelease();
    if (v6 < 0)
    {
      __break(1u);
      goto LABEL_12;
    }
  }
  else
  {
    v6 = *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if ((a1 & 0x8000000000000000) == 0 && v6 > a1)
  {
    swift_beginAccess();
    v7 = *v5;
    if ((*v5 & 0xC000000000000001) == 0)
    {
      if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10) <= (unint64_t)a1)
      {
        __break(1u);
        return;
      }
      v8 = *(id *)(v7 + 8 * a1 + 32);
      goto LABEL_8;
    }
LABEL_12:
    v8 = (id)MEMORY[0x2276B2BEC](a1);
LABEL_8:
    v9 = v8;
    swift_endAccess();
    objc_msgSend(v9, sel_bounds);
    v10 = *(void **)(v2 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_scrollView);
    objc_msgSend(v9, sel_convertRect_toCoordinateSpace_, v10);
    v12 = v11;
    objc_msgSend(v10, sel_contentOffset);
    objc_msgSend(v10, sel_setContentOffset_animated_, a2 & 1, v12);

  }
}

void sub_227579770()
{
  char *v0;
  char *v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  id *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  v1 = v0;
  v18.receiver = v0;
  v18.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v18, sel_layoutSubviews);
  v2 = *(void **)&v0[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_maskedView];
  objc_msgSend(v2, sel_bounds);
  v4 = v3;
  v6 = v5;
  v7 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v8 = objc_msgSend(v7, sel_userInterfaceLayoutDirection);

  if (!v8)
  {
    if (qword_2540B8D20 != -1)
      swift_once();
    v4 = v4 + *(double *)&qword_2540BCE00;
  }
  objc_msgSend(v2, sel_bounds);
  v9 = *(void **)&v1[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_scrollView];
  objc_msgSend(v9, sel_setFrame_, v4, v6);
  objc_msgSend(v9, sel_frame);
  objc_msgSend(v9, sel_setContentInset_, 0.0, 0.0, 0.0, v10- (*(double (**)(void))(*(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_config + 8] + 24))());
  objc_msgSend(v9, sel_setContentSize_, sub_227576B24());
  objc_msgSend(v9, sel_setScrollEnabled_, 1);
  v11 = *(void **)&v1[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_overlayBoxLeadingAnchorConstraint];
  if (!v11)
    goto LABEL_8;
  v12 = qword_2540B8D20;
  v13 = v11;
  if (v12 != -1)
    goto LABEL_16;
  while (1)
  {
    objc_msgSend((id)v13, sel_setConstant_, *(double *)&qword_2540BCE00 - *(double *)&qword_2540BCE00);

LABEL_8:
    sub_227579A58();
    v14 = (id *)&v1[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_buttons];
    swift_beginAccess();
    v13 = (unint64_t)*v14;
    if (!(v13 >> 62))
      break;
    swift_bridgeObjectRetain();
    v15 = sub_22758ECE8();
    swift_bridgeObjectRelease();
    if ((v15 & 0x8000000000000000) == 0)
      goto LABEL_10;
    __break(1u);
LABEL_16:
    swift_once();
  }
  v15 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_10:
  swift_beginAccess();
  v16 = sub_22758CAB0();
  swift_endAccess();
  if ((v16 & 0x8000000000000000) == 0 && v16 < v15)
  {
    swift_beginAccess();
    v17 = sub_22758CAB0();
    swift_endAccess();
    sub_227578634(v17, 1, 0);
  }
}

uint64_t sub_227579A58()
{
  uint64_t v0;
  uint64_t v1;
  double v2;
  double v3;
  uint64_t v4;
  double (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  double (*v17)(uint64_t, _QWORD);
  id v18;
  void *v19;
  double v20;
  double v21;

  v1 = v0;
  sub_22757699C();
  v3 = v2;
  v4 = v0 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_config;
  v6 = *(_QWORD *)(v0 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_config);
  v5 = *(double (***)(_QWORD, _QWORD))(v4 + 8);
  v7 = v5[6](v6, v5);
  if (v3 <= v7)
    v3 = v7;
  v8 = v5[7](v6, v5);
  if (v8 >= v3)
    v9 = v3;
  else
    v9 = v8;
  v10 = 0.0;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_shouldCenterButtonsVerticallyInParent) == 1)
  {
    objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_maskedView), sel_bounds);
    v10 = (v11 - v5[3](v6, v5)) * 0.5;
  }
  v12 = (unint64_t *)(v1 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_buttons);
  swift_beginAccess();
  v13 = *v12;
  if (!(v13 >> 62))
  {
    v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain_n();
    if (v14)
      goto LABEL_10;
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  result = sub_22758ECE8();
  v14 = result;
  if (!result)
    return swift_bridgeObjectRelease_n();
LABEL_10:
  if (v14 >= 1)
  {
    v16 = 0;
    v17 = v5[3];
    do
    {
      if ((v13 & 0xC000000000000001) != 0)
        v18 = (id)MEMORY[0x2276B2BEC](v16, v13);
      else
        v18 = *(id *)(v13 + 8 * v16 + 32);
      v19 = v18;
      v20 = v9 * (double)v16 + v17(v6, v5) * (double)v16;
      v21 = v17(v6, v5);
      objc_msgSend(v19, sel_setFrame_, v20, v10, v21, v17(v6, v5));

      ++v16;
    }
    while (v14 != v16);
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t sub_227579D7C()
{
  return type metadata accessor for LensFreezeFrameScrubber();
}

uint64_t type metadata accessor for LensFreezeFrameScrubber()
{
  uint64_t result;

  result = qword_2558DEF18;
  if (!qword_2558DEF18)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_227579DC0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22758CAD4();
  if (v1 <= 0x3F)
    return swift_updateClassMetadata2();
  return result;
}

uint64_t sub_227579E74()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540BA320);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_227596560;
  *(_QWORD *)(v0 + 32) = sub_227576EBC();
  sub_22758E3F4();
  return v0;
}

void sub_227579ED8(void *a1)
{
  uint64_t v1;
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  id v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_scrollView);
  objc_msgSend(a1, sel_locationInView_, v2);
  v4 = v3;
  v6 = v5;
  v7 = objc_msgSend(v2, sel_subviews);
  sub_22730BA80(0, (unint64_t *)&unk_2540B9FE0);
  v8 = sub_22758E3DC();

  v9 = v2;
  LOBYTE(v7) = sub_2273496D4(v8, (uint64_t)v9, v4, v6);
  swift_bridgeObjectRelease();

  if ((v7 & 1) != 0)
  {
    v10 = sub_22757A024(v4);
    if (v10)
    {
      v11 = (void *)v10;
      v12 = (unint64_t *)(v1 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_buttons);
      swift_beginAccess();
      v13 = *v12;
      swift_bridgeObjectRetain();
      sub_2274AB910((uint64_t)v11, v13);
      v15 = v14;
      v17 = v16;
      swift_bridgeObjectRelease();
      if ((v17 & 1) == 0)
        sub_227578634(v15, 1, 1);

    }
  }
}

uint64_t sub_22757A024(double a1)
{
  char *v1;
  void *v2;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t i;
  id v9;
  void *v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;

  v2 = v1;
  v4 = objc_msgSend(*(id *)&v1[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_scrollView], sel_subviews);
  sub_22730BA80(0, (unint64_t *)&unk_2540B9FE0);
  v5 = sub_22758E3DC();

  v14 = MEMORY[0x24BEE4AF8];
  if (!(v5 >> 62))
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v6)
      goto LABEL_3;
LABEL_16:
    swift_bridgeObjectRelease();
    v11 = MEMORY[0x24BEE4AF8];
LABEL_17:
    swift_bridgeObjectRelease();
    v12 = v2;
    v13 = sub_22757ABDC(v11, (uint64_t)v12, a1);
    swift_bridgeObjectRelease();

    return v13;
  }
  swift_bridgeObjectRetain();
  result = sub_22758ECE8();
  v6 = result;
  if (!result)
    goto LABEL_16;
LABEL_3:
  if (v6 >= 1)
  {
    for (i = 0; i != v6; ++i)
    {
      if ((v5 & 0xC000000000000001) != 0)
        v9 = (id)MEMORY[0x2276B2BEC](i, v5);
      else
        v9 = *(id *)(v5 + 8 * i + 32);
      v10 = v9;
      type metadata accessor for ImageCell();
      if (swift_dynamicCastClass())
      {
        MEMORY[0x2276B23C4]();
        if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_22758E400();
        sub_22758E424();
        sub_22758E3F4();
      }
      else
      {

      }
    }
    swift_bridgeObjectRelease();
    v11 = v14;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

void *sub_22757A270(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  double (**v5)(_QWORD, _QWORD);
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *result;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v2 = v1;
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_config);
  v5 = *(double (***)(_QWORD, _QWORD))(v1
                                                + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_config
                                                + 8);
  v6 = v5[3](v4, v5);
  sub_22757699C();
  v8 = v7;
  v9 = v5[6](v4, v5);
  if (v8 <= v9)
    v8 = v9;
  v10 = v5[7](v4, v5);
  if (v10 >= v8)
    v10 = v8;
  result = (void *)sub_22757A024((v6 + v10) * 0.5 + a1);
  v12 = result;
  if (result)
  {
    objc_msgSend(result, sel_bounds);
    objc_msgSend(v12, sel_convertRect_toCoordinateSpace_, *(_QWORD *)(v2 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_scrollView));
    v14 = v13;

    return (void *)v14;
  }
  return result;
}

void sub_22757A37C(void *a1)
{
  uint64_t v1;
  double v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  id v11;

  v3 = sub_22757668C();
  v4 = sub_22757A024(v3);
  if (v4)
  {
    v11 = (id)v4;
    sub_22730BA80(0, (unint64_t *)&qword_2540BA060);
    if ((sub_22758E94C() & 1) != 0
      && ((objc_msgSend(a1, sel_isDragging) & 1) != 0
       || objc_msgSend(a1, sel_isDecelerating, v11)))
    {
      v5 = (unint64_t *)(v1 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_buttons);
      swift_beginAccess();
      v6 = *v5;
      swift_bridgeObjectRetain();
      sub_2274AB910((uint64_t)v11, v6);
      v8 = v7;
      v10 = v9;
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
        sub_227578634(v8, 0, 0);

    }
    else
    {

    }
  }
}

void sub_22757A6E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  uint64_t v7;

  v1 = v0;
  swift_beginAccess();
  v2 = sub_22758CAB0();
  swift_endAccess();
  v3 = __OFSUB__(v2, 1);
  v4 = v2 - 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    v5 = (unint64_t *)(v1 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_buttons);
    swift_beginAccess();
    v6 = *v5;
    if (!(v6 >> 62))
    {
      v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  v7 = sub_22758ECE8();
  swift_bridgeObjectRelease();
  if (v7 < 0)
  {
    __break(1u);
    return;
  }
LABEL_4:
  if ((v4 & 0x8000000000000000) == 0 && v4 < v7)
    sub_227578634(v4, 1, 1);
}

void sub_22757A804()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  uint64_t v7;

  v1 = v0;
  swift_beginAccess();
  v2 = sub_22758CAB0();
  swift_endAccess();
  v3 = __OFADD__(v2, 1);
  v4 = v2 + 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    v5 = (unint64_t *)(v1 + OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_buttons);
    swift_beginAccess();
    v6 = *v5;
    if (!(v6 >> 62))
    {
      v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  v7 = sub_22758ECE8();
  swift_bridgeObjectRelease();
  if (v7 < 0)
  {
    __break(1u);
    return;
  }
LABEL_4:
  if ((v4 & 0x8000000000000000) == 0 && v4 < v7)
    sub_227578634(v4, 1, 1);
}

void sub_22757A9C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x2276B3E34](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = sub_227576EBC();
    objc_msgSend(v6, sel_rotateIfPossibleTo_, a2);

  }
}

uint64_t sub_22757AA3C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_22758D194();
  swift_release();
  return swift_release();
}

uint64_t sub_22757AAA4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
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
  __n128 v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t, __n128);
  uint64_t v20;

  v2 = sub_22758CAD4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4, v5, v6, v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v10, v11, v12, v13, v14);
  v17 = (char *)&v20 - v16;
  v18 = *(void (**)(char *, uint64_t, uint64_t, __n128))(v3 + 16);
  v18((char *)&v20 - v16, a1, v2, v15);
  swift_getKeyPath();
  swift_getKeyPath();
  ((void (*)(char *, char *, uint64_t))v18)(v9, v17, v2);
  swift_retain();
  sub_22758D1A0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v17, v2);
}

uint64_t sub_22757ABA8@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_227412FD8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(unsigned __int8 *)(a1 + 16));
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_22757ABDC(unint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4;
  uint64_t result;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  uint64_t v31;
  CGRect v34;
  CGRect v35;

  if (a1 >> 62)
    goto LABEL_24;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (v4)
  {
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v6 = (id)MEMORY[0x2276B2BEC](0, a1);
      }
      else
      {
        if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return result;
        }
        v6 = *(id *)(a1 + 32);
      }
      v7 = v6;
      if (v4 == 1)
        break;
      v31 = OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_scrollView;
      v9 = 1;
      while (1)
      {
        if ((a1 & 0xC000000000000001) != 0)
        {
          v10 = (id)MEMORY[0x2276B2BEC](v9, a1);
        }
        else
        {
          if ((v9 & 0x8000000000000000) != 0)
            goto LABEL_22;
          if (v9 >= *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_23;
          v10 = *(id *)(a1 + 8 * v9 + 32);
        }
        v8 = v10;
        v11 = v9 + 1;
        if (__OFADD__(v9, 1))
          break;
        v12 = v4;
        objc_msgSend(v10, sel_bounds);
        v13 = *(_QWORD *)(a2 + v31);
        objc_msgSend(v8, sel_convertRect_toCoordinateSpace_, v13);
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        objc_msgSend(v7, sel_bounds);
        objc_msgSend(v7, sel_convertRect_toCoordinateSpace_, v13);
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v34.origin.x = v15;
        v34.origin.y = v17;
        v34.size.width = v19;
        v34.size.height = v21;
        v30 = vabdd_f64(CGRectGetMidX(v34), a3);
        v35.origin.x = v23;
        v35.origin.y = v25;
        v35.size.width = v27;
        v35.size.height = v29;
        if (v30 < vabdd_f64(CGRectGetMidX(v35), a3))
        {

          v7 = v8;
          ++v9;
          v4 = v12;
          if (v11 == v12)
            goto LABEL_8;
        }
        else
        {

          ++v9;
          v4 = v12;
          if (v11 == v12)
            goto LABEL_7;
        }
      }
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      swift_bridgeObjectRetain();
      result = sub_22758ECE8();
      v4 = result;
      if (!result)
        goto LABEL_25;
    }
LABEL_7:
    v8 = v7;
LABEL_8:
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return 0;
  }
  return (uint64_t)v8;
}

void sub_22757AE44()
{
  _BYTE *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;

  v1 = &v0[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_config];
  *v1 = &type metadata for LayoutConstants.FilterRow;
  v1[1] = &off_24EF9FBC0;
  v2 = OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_scrollView;
  *(_QWORD *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD918]), sel_init);
  v0[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_shouldHighlight] = 0;
  v3 = OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_maskedView;
  *(_QWORD *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_subscribers] = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v0[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_buttons] = MEMORY[0x24BEE4AF8];
  v4 = OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_feedbackGenerator;
  v5 = objc_msgSend((id)objc_opt_self(), sel_lightConfiguration);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD940]), sel_initWithConfiguration_, v5);

  objc_msgSend(v6, sel__setOutputMode_, 5);
  *(_QWORD *)&v0[v4] = v6;
  MEMORY[0x2276B0AB0](0, 0);
  *(_QWORD *)&v0[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber____lazy_storage___overlayBox] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_overlayBoxLeadingAnchorConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber____lazy_storage___addButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber____lazy_storage___activeItemIndicator] = 0;
  v7 = OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_shouldCenterButtonsVerticallyInParent;
  if (qword_2558D4BA0 != -1)
    swift_once();
  v0[v7] = byte_2558DAEE0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC16MagnifierSupport23LensFreezeFrameScrubber_rotationSubscription] = 0;

  sub_22758ECC4();
  __break(1u);
}

uint64_t sub_22757B048()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  type metadata accessor for MAGUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = (void *)sub_22758E1B4();
  v3 = (void *)sub_22758E1B4();
  v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  v5 = sub_22758E1E4();
  return v5;
}

uint64_t sub_22757B13C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_22757B160(uint64_t a1)
{
  uint64_t v1;

  return sub_227578308(a1, v1);
}

uint64_t sub_22757B168(uint64_t a1)
{
  uint64_t v1;

  return sub_227578BB8(a1, v1);
}

void sub_22757B170(uint64_t a1)
{
  uint64_t v1;

  sub_227578FA4(a1, v1);
}

uint64_t sub_22757B178()
{
  swift_release();
  return swift_deallocObject();
}

void sub_22757B19C()
{
  uint64_t v0;

  sub_22757A9C8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t block_copy_helper_62(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_62()
{
  return swift_release();
}

uint64_t sub_22757B1C4@<X0>(_BYTE *a1@<X8>)
{
  return sub_22757B2A0(a1);
}

uint64_t sub_22757B1D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_22758CAD4();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_22757B24C()
{
  uint64_t v0;

  sub_22758CAD4();
  sub_2275785BC(*(_QWORD *)(v0 + 16));
}

uint64_t sub_22757B27C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_22757B2A0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = sub_227412FD8(**(_QWORD **)(v1 + 16), *(_QWORD *)(*(_QWORD *)(v1 + 16) + 8), *(unsigned __int8 *)(*(_QWORD *)(v1 + 16) + 16));
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t *sub_22757B2E4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[2];
    v9 = a2[3];
    v11 = (void *)a2[4];
    v10 = a2[5];
    a1[4] = (uint64_t)v11;
    a1[5] = v10;
    v12 = *(int *)(a3 + 28);
    v13 = (uint64_t *)((char *)a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    a1[2] = v8;
    a1[3] = v9;
    swift_retain();
    swift_retain();
    v15 = v11;
    __swift_instantiateConcreteTypeFromMangledName(qword_2558D6380);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v16 = sub_22758D47C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
    }
    else
    {
      *v13 = *v14;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 32));
  }
  return a1;
}

uint64_t sub_22757B3F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  swift_release();

  v4 = a1 + *(int *)(a2 + 28);
  __swift_instantiateConcreteTypeFromMangledName(qword_2558D6380);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v5 = sub_22758D47C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_22757B480(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[2];
  v8 = a2[3];
  v10 = (void *)a2[4];
  v9 = a2[5];
  a1[4] = v10;
  a1[5] = v9;
  v11 = *(int *)(a3 + 28);
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  a1[2] = v7;
  a1[3] = v8;
  swift_retain();
  swift_retain();
  v14 = v10;
  __swift_instantiateConcreteTypeFromMangledName(qword_2558D6380);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = sub_22758D47C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v12, v13, v15);
  }
  else
  {
    *v12 = *v13;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 32)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 32));
  return a1;
}

_QWORD *sub_22757B568(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  v6 = (void *)a1[4];
  v7 = (void *)a2[4];
  a1[4] = v7;
  v8 = v7;

  a1[5] = a2[5];
  if (a1 != a2)
  {
    v9 = *(int *)(a3 + 28);
    v10 = (_QWORD *)((char *)a1 + v9);
    v11 = (_QWORD *)((char *)a2 + v9);
    sub_22731A1A4((uint64_t)a1 + v9, qword_2558D6380);
    __swift_instantiateConcreteTypeFromMangledName(qword_2558D6380);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_22758D47C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 32)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 32));
  return a1;
}

_OWORD *sub_22757B694(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  a1[2] = a2[2];
  v7 = *(int *)(a3 + 28);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_2558D6380);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_22758D47C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 32)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 32));
  return a1;
}

_QWORD *sub_22757B760(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_release();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_release();
  v8 = (void *)a1[4];
  a1[4] = a2[4];

  a1[5] = a2[5];
  if (a1 != a2)
  {
    v9 = *(int *)(a3 + 28);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    sub_22731A1A4((uint64_t)a1 + v9, qword_2558D6380);
    v12 = __swift_instantiateConcreteTypeFromMangledName(qword_2558D6380);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v13 = sub_22758D47C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v10, v11, v13);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
  }
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 32)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t sub_22757B86C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22757B878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558D7670);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t sub_22757B8F8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22757B904(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558D7670);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for MFReaderTextDisplayView()
{
  uint64_t result;

  result = qword_2558DEFC8;
  if (!qword_2558DEFC8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_22757B9B8()
{
  unint64_t v0;

  sub_2273392C4();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_22757BA44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22757BA54@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_22758D194();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_22757BAD0(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = v2;
  return sub_22758D1A0();
}

uint64_t sub_22757BB3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t OpaqueTypeConformance2;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t result;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;

  v69 = a1;
  v85 = a3;
  v4 = sub_22758D47C();
  v83 = *(_QWORD *)(v4 - 8);
  v84 = v4;
  MEMORY[0x24BDAC7A8](v4, v5, v6, v7, v8);
  v79 = (uint64_t)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = type metadata accessor for MFReaderTextDisplayView();
  v10 = *(_QWORD *)(v72 - 8);
  MEMORY[0x24BDAC7A8](v72, v11, v12, v13, v14);
  v73 = v15;
  v16 = (char *)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_22758D518();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(_QWORD *)(v18 + 64);
  MEMORY[0x24BDAC7A8](v17, v20, v21, v22, v23);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF010);
  v70 = *(_QWORD *)(v71 - 8);
  MEMORY[0x24BDAC7A8](v71, v24, v25, v26, v27);
  v29 = (char *)&v67 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF018);
  v76 = *(_QWORD *)(v80 - 8);
  MEMORY[0x24BDAC7A8](v80, v30, v31, v32, v33);
  v86 = (char *)&v67 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF020);
  v81 = *(_QWORD *)(v35 - 8);
  v82 = v35;
  MEMORY[0x24BDAC7A8](v35, v36, v37, v38, v39);
  v78 = (char *)&v67 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF028);
  v75 = *(_QWORD *)(v77 - 8);
  MEMORY[0x24BDAC7A8](v77, v41, v42, v43, v44);
  v74 = (char *)&v67 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758D980();
  v87 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF030);
  sub_22757D3B4();
  v68 = v29;
  sub_22758D2FC();
  v46 = *(void **)(a2 + 32);
  if (v46)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v47 = v46;
    sub_22758D194();

    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))((char *)&v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v69, v17);
    sub_22757D2D4(a2, (uint64_t)v16);
    v48 = (*(unsigned __int8 *)(v18 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
    v49 = *(unsigned __int8 *)(v10 + 80);
    v50 = a2;
    v69 = v49 | 7;
    v51 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v18 + 32))(v51 + v48, (char *)&v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
    sub_22757D31C((uint64_t)v16, v51 + ((v19 + v49 + v48) & ~v49));
    v52 = sub_22730BB7C(&qword_2558DF060, &qword_2558DF010, MEMORY[0x24BDEB238]);
    v53 = MEMORY[0x24BEE1788];
    v54 = v71;
    v55 = v68;
    sub_22758DC38();
    swift_release();
    (*(void (**)(char *, uint64_t))(v70 + 8))(v55, v54);
    v56 = v79;
    sub_22753F394(v79);
    sub_22757D2D4(v50, (uint64_t)v16);
    v57 = swift_allocObject();
    sub_22757D31C((uint64_t)v16, v57 + ((v49 + 16) & ~v49));
    v88 = v54;
    v89 = MEMORY[0x24BEE1768];
    v90 = v52;
    v91 = v53;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v59 = sub_2273096F0((unint64_t *)&qword_2558D7790, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], MEMORY[0x24BDECF78]);
    v60 = v78;
    v61 = v80;
    v62 = v84;
    v63 = v86;
    sub_22758DC38();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v83 + 8))(v56, v62);
    (*(void (**)(char *, uint64_t))(v76 + 8))(v63, v61);
    v88 = v61;
    v89 = v62;
    v90 = OpaqueTypeConformance2;
    v91 = v59;
    swift_getOpaqueTypeConformance2();
    v64 = v74;
    v65 = v82;
    sub_22758DB9C();
    (*(void (**)(char *, uint64_t))(v81 + 8))(v60, v65);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v75 + 32))(v85, v64, v77);
  }
  else
  {
    type metadata accessor for MFReaderBlockManager();
    sub_2273096F0((unint64_t *)&qword_2558D6758, (uint64_t (*)(uint64_t))type metadata accessor for MFReaderBlockManager, (uint64_t)&protocol conformance descriptor for MFReaderBlockManager);
    result = sub_22758D578();
    __break(1u);
  }
  return result;
}

uint64_t sub_22757C0C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  unsigned __int8 v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;

  v52 = a2;
  v3 = sub_22758D890();
  MEMORY[0x24BDAC7A8](v3, v4, v5, v6, v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF058);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10, v11, v12, v13);
  v15 = (char *)&v51 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF048);
  MEMORY[0x24BDAC7A8](v16, v17, v18, v19, v20);
  v22 = (char *)&v51 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF030);
  MEMORY[0x24BDAC7A8](v23, v24, v25, v26, v27);
  v29 = (char *)&v51 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = a1;
  sub_22758D74C();
  v54 = 0;
  sub_2273096F0(&qword_2558DD7A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEF998], MEMORY[0x24BDEF9B8]);
  sub_22758EFF4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF068);
  sub_22757D6B0();
  sub_22758D2F0();
  LOBYTE(a1) = sub_22758D998();
  sub_22758D2E4();
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v22, v15, v8);
  v38 = &v22[*(int *)(v16 + 36)];
  *v38 = a1;
  *((_QWORD *)v38 + 1) = v31;
  *((_QWORD *)v38 + 2) = v33;
  *((_QWORD *)v38 + 3) = v35;
  *((_QWORD *)v38 + 4) = v37;
  v38[40] = 0;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
  v39 = sub_22758D9B0();
  v40 = sub_22758D9C8();
  sub_22758D9C8();
  if (sub_22758D9C8() != v39)
    v40 = sub_22758D9C8();
  sub_22758D2E4();
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;
  sub_22731A11C((uint64_t)v22, (uint64_t)v29, &qword_2558DF048);
  v49 = &v29[*(int *)(v23 + 36)];
  *v49 = v40;
  *((_QWORD *)v49 + 1) = v42;
  *((_QWORD *)v49 + 2) = v44;
  *((_QWORD *)v49 + 3) = v46;
  *((_QWORD *)v49 + 4) = v48;
  v49[40] = 0;
  sub_22731A1A4((uint64_t)v22, &qword_2558DF048);
  return sub_22757D81C((uint64_t)v29, v52);
}

uint64_t sub_22757C384@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v18;
  uint64_t v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;

  v4 = type metadata accessor for MFReaderTextDisplayView();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4, v7, v8, v9, v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF068);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13, v14, v15, v16);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(_QWORD *)(a1 + 32);
  if (v19)
  {
    v20 = (uint64_t *)(v19 + OBJC_IVAR____TtC16MagnifierSupport20MFReaderBlockManager_blocks);
    swift_beginAccess();
    v24 = *v20;
    sub_22757D2D4(a1, (uint64_t)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    v21 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v22 = swift_allocObject();
    sub_22757D31C((uint64_t)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v22 + v21);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF0B8);
    sub_22758C984();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF080);
    sub_22730BB7C(&qword_2558DF0C0, &qword_2558DF0B8, MEMORY[0x24BEE12D8]);
    sub_22757D714();
    sub_2273096F0(&qword_2558DF0C8, (uint64_t (*)(uint64_t))type metadata accessor for MFReaderTextBlock, (uint64_t)&unk_2275A279C);
    sub_22758DE18();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v12 + 32))(a2, v18, v11);
  }
  else
  {
    type metadata accessor for MFReaderBlockManager();
    sub_2273096F0((unint64_t *)&qword_2558D6758, (uint64_t (*)(uint64_t))type metadata accessor for MFReaderBlockManager, (uint64_t)&protocol conformance descriptor for MFReaderBlockManager);
    result = sub_22758D578();
    __break(1u);
  }
  return result;
}

uint64_t sub_22757C5B0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *v41;
  uint64_t KeyPath;
  _BYTE *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE *v49;
  _BYTE *v50;
  uint64_t v51;
  _BYTE v53[12];
  int v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unsigned __int8 v69;
  uint64_t v70;
  unsigned __int8 v71;

  v59 = a2;
  v61 = a3;
  v5 = sub_22758D47C();
  v62 = *(_QWORD *)(v5 - 8);
  v63 = v5;
  MEMORY[0x24BDAC7A8](v5, v6, v7, v8, v9);
  v60 = &v53[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF0A0);
  MEMORY[0x24BDAC7A8](v11, v12, v13, v14, v15);
  v17 = &v53[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF090);
  MEMORY[0x24BDAC7A8](v58, v18, v19, v20, v21);
  v23 = &v53[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v24 = *a1;
  v57 = sub_22758D6C8();
  sub_22757C930(v24, a2, &v64);
  v25 = v64;
  v26 = v65;
  v27 = v66;
  v28 = v67;
  v29 = v68;
  v56 = v69;
  v55 = v70;
  v54 = v71;
  swift_getKeyPath();
  v64 = v24;
  sub_2273096F0((unint64_t *)&qword_2558D5FD0, (uint64_t (*)(uint64_t))type metadata accessor for MFReaderTextBlock, (uint64_t)&unk_2275A2718);
  sub_22758CAF8();
  swift_release();
  v30 = v24 + OBJC_IVAR____TtC16MagnifierSupport17MFReaderTextBlock__id;
  swift_beginAccess();
  v31 = &v17[*(int *)(v11 + 52)];
  v32 = sub_22758C984();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v31, v30, v32);
  *(_QWORD *)v17 = v57;
  *((_QWORD *)v17 + 1) = 0;
  v17[16] = 1;
  *((_QWORD *)v17 + 3) = v25;
  v17[32] = v26;
  *((_QWORD *)v17 + 5) = v27;
  *((_QWORD *)v17 + 6) = v28;
  *((_QWORD *)v17 + 7) = v29;
  v17[64] = v56;
  *((_QWORD *)v17 + 9) = v55;
  v17[80] = v54;
  LOBYTE(v30) = sub_22758D9E0();
  sub_22758D2E4();
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  sub_22731A11C((uint64_t)v17, (uint64_t)v23, &qword_2558DF0A0);
  v41 = &v23[*(int *)(v58 + 36)];
  *v41 = v30;
  *((_QWORD *)v41 + 1) = v34;
  *((_QWORD *)v41 + 2) = v36;
  *((_QWORD *)v41 + 3) = v38;
  *((_QWORD *)v41 + 4) = v40;
  v41[40] = 0;
  sub_22731A1A4((uint64_t)v17, &qword_2558DF0A0);
  KeyPath = swift_getKeyPath();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  v43 = v60;
  sub_22758D194();
  swift_release();
  swift_release();
  swift_release();
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF080);
  v45 = v61;
  v46 = (uint64_t *)(v61 + *(int *)(v44 + 36));
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF0B0);
  v48 = v62;
  v49 = v43;
  v50 = v43;
  v51 = v63;
  (*(void (**)(char *, _BYTE *, uint64_t))(v62 + 16))((char *)v46 + *(int *)(v47 + 28), v50, v63);
  *v46 = KeyPath;
  sub_22731A11C((uint64_t)v23, v45, &qword_2558DF090);
  (*(void (**)(_BYTE *, uint64_t))(v48 + 8))(v49, v51);
  return sub_22731A1A4((uint64_t)v23, &qword_2558DF090);
}

uint64_t sub_22757C930@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  char v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  char v38;
  char v39;
  void *v40;
  id v41;
  uint64_t result;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  _QWORD *v47;
  char v48;
  uint64_t v49;
  uint64_t v50;

  v47 = a3;
  v5 = type metadata accessor for MFReaderTextDisplayView();
  MEMORY[0x24BDAC7A8](v5, v6, v7, v8, v9);
  v46 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_22758C984();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13, v14, v15, v16);
  v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19, v20, v21, v22, v23);
  v25 = (char *)&v45 - v24;
  v45 = a2;
  v26 = *(void **)(a2 + 32);
  if (v26)
  {
    v27 = v26;
    v28 = sub_2273DCA9C();

    swift_getKeyPath();
    v50 = v28;
    sub_2273096F0((unint64_t *)&qword_2558D5FD0, (uint64_t (*)(uint64_t))type metadata accessor for MFReaderTextBlock, (uint64_t)&unk_2275A2718);
    sub_22758CAF8();
    swift_release();
    v29 = v28 + OBJC_IVAR____TtC16MagnifierSupport17MFReaderTextBlock__id;
    swift_beginAccess();
    v30 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    v30(v25, v29, v11);
    swift_release();
    swift_getKeyPath();
    v49 = a1;
    sub_22758CAF8();
    swift_release();
    v31 = a1 + OBJC_IVAR____TtC16MagnifierSupport17MFReaderTextBlock__id;
    swift_beginAccess();
    v30(v18, v31, v11);
    v32 = sub_22758C960();
    v33 = *(void (**)(char *, uint64_t))(v12 + 8);
    v33(v18, v11);
    v33(v25, v11);
    v34 = v45;
    v35 = *(void **)(v45 + 32);
    if (v35)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      v36 = v35;
      sub_22758D194();

      swift_release();
      swift_release();
      v37 = (uint64_t)v46;
      if (!v48)
      {
        swift_bridgeObjectRelease();
        sub_22757D2D4(v34, v37);
LABEL_7:
        v39 = 1;
LABEL_14:
        sub_22757D984(v37);
        type metadata accessor for MFReaderTextFormatterModel(0);
        sub_2273096F0(&qword_2558D64A8, type metadata accessor for MFReaderTextFormatterModel, (uint64_t)&unk_22759F048);
        swift_retain();
        result = sub_22758D44C();
        v43 = v47;
        *v47 = a1;
        *((_BYTE *)v43 + 8) = v32 & 1;
        v43[2] = result;
        v43[3] = v44;
        v43[4] = 0x3FC999999999999ALL;
        *((_BYTE *)v43 + 40) = v39 & 1;
        v43[6] = 0;
        *((_BYTE *)v43 + 56) = 1;
        return result;
      }
      v38 = sub_22758EE50();
      swift_bridgeObjectRelease();
      sub_22757D2D4(v34, v37);
      if ((v38 & 1) != 0)
        goto LABEL_7;
      v40 = *(void **)(v37 + 32);
      if (v40)
      {
        swift_getKeyPath();
        swift_getKeyPath();
        v41 = v40;
        sub_22758D194();

        swift_release();
        swift_release();
        if (v48 && v48 == 1)
          v39 = 1;
        else
          v39 = sub_22758EE50();
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
    }
    else
    {
      type metadata accessor for MFReaderBlockManager();
      sub_2273096F0((unint64_t *)&qword_2558D6758, (uint64_t (*)(uint64_t))type metadata accessor for MFReaderBlockManager, (uint64_t)&protocol conformance descriptor for MFReaderBlockManager);
      swift_retain();
      sub_22758D578();
      __break(1u);
    }
  }
  type metadata accessor for MFReaderBlockManager();
  sub_2273096F0((unint64_t *)&qword_2558D6758, (uint64_t (*)(uint64_t))type metadata accessor for MFReaderBlockManager, (uint64_t)&protocol conformance descriptor for MFReaderBlockManager);
  result = sub_22758D578();
  __break(1u);
  return result;
}

uint64_t sub_22757CE30()
{
  sub_22758DEA8();
  sub_22758D41C();
  return swift_release();
}

uint64_t sub_22757CE94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t result;
  char *v21;
  _QWORD v22[4];

  v5 = sub_22758C984();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7, v8, v9, v10);
  v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(char **)(a3 + 32);
  if (v13)
  {
    v14 = a1 & ~(a1 >> 63);
    v15 = &v13[OBJC_IVAR____TtC16MagnifierSupport20MFReaderBlockManager_blocks];
    swift_beginAccess();
    v16 = *(_QWORD *)v15;
    if ((v16 & 0xC000000000000001) != 0)
    {
      v21 = v13;
      v17 = MEMORY[0x2276B2BEC](v14, v16);
      goto LABEL_5;
    }
    if (v14 < *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v17 = *(_QWORD *)(v16 + 8 * v14 + 32);
      v18 = v13;
      swift_retain();
LABEL_5:
      swift_endAccess();

      swift_getKeyPath();
      v22[1] = v17;
      sub_2273096F0((unint64_t *)&qword_2558D5FD0, (uint64_t (*)(uint64_t))type metadata accessor for MFReaderTextBlock, (uint64_t)&unk_2275A2718);
      sub_22758CAF8();
      swift_release();
      v19 = v17 + OBJC_IVAR____TtC16MagnifierSupport17MFReaderTextBlock__id;
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v12, v19, v5);
      swift_release();
      sub_22758DEFC();
      sub_2273096F0((unint64_t *)&qword_2558D5D40, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      sub_22758D50C();
      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v12, v5);
    }
    __break(1u);
  }
  type metadata accessor for MFReaderBlockManager();
  sub_2273096F0((unint64_t *)&qword_2558D6758, (uint64_t (*)(uint64_t))type metadata accessor for MFReaderBlockManager, (uint64_t)&protocol conformance descriptor for MFReaderBlockManager);
  result = sub_22758D578();
  __break(1u);
  return result;
}

uint64_t sub_22757D0CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v19;

  v3 = sub_22758D47C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5, v6, v7, v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(qword_2558D8F00);
  MEMORY[0x24BDAC7A8](v11, v12, v13, v14, v15);
  v17 = (char *)&v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MFReaderTextFormatterModel(0);
  sub_2273096F0(&qword_2558D64A8, type metadata accessor for MFReaderTextFormatterModel, (uint64_t)&unk_22759F048);
  sub_22758D458();
  swift_getKeyPath();
  sub_22758D464();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v10, a2, v3);
  sub_22758DDD0();
  return sub_22731A1A4((uint64_t)v17, qword_2558D8F00);
}

uint64_t sub_22757D230@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t (**a6)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v8 = *(_QWORD *)(a1 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](a1, a2, a3, a4, a5);
  sub_22757D2D4(v6, (uint64_t)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v11 = swift_allocObject();
  result = sub_22757D31C((uint64_t)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10);
  *a6 = sub_22757D360;
  a6[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v11;
  return result;
}

uint64_t sub_22757D2D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MFReaderTextDisplayView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22757D31C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MFReaderTextDisplayView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22757D360@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MFReaderTextDisplayView() - 8) + 80);
  return sub_22757BB3C(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_22757D3AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_22757C0C8(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_22757D3B4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2558DF038;
  if (!qword_2558DF038)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558DF030);
    v2[0] = sub_22757D420();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2276B3C78](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2558DF038);
  }
  return result;
}

unint64_t sub_22757D420()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2558DF040;
  if (!qword_2558DF040)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558DF048);
    v2[0] = sub_22730BB7C(&qword_2558DF050, &qword_2558DF058, MEMORY[0x24BDEB188]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2276B3C78](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2558DF040);
  }
  return result;
}

uint64_t sub_22757D4AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = sub_22758D518();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = type metadata accessor for MFReaderTextDisplayView();
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  v7 = v0 + ((v3 + v4 + v6) & ~v6);
  swift_release();
  swift_release();

  v8 = v7 + *(int *)(v5 + 28);
  __swift_instantiateConcreteTypeFromMangledName(qword_2558D6380);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = sub_22758D47C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_22757D5B4()
{
  sub_22758D518();
  type metadata accessor for MFReaderTextDisplayView();
  return sub_22757CE30();
}

uint64_t sub_22757D630(uint64_t a1, uint64_t a2)
{
  type metadata accessor for MFReaderTextDisplayView();
  return sub_22757D0CC(a1, a2);
}

uint64_t sub_22757D684()
{
  uint64_t *v0;

  return sub_22757CE94(v0[2], v0[3], v0[4]);
}

uint64_t sub_22757D6A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_22757C384(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_22757D6B0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2558DF070;
  if (!qword_2558DF070)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558DF068);
    v2 = sub_22757D714();
    result = MEMORY[0x2276B3C78](MEMORY[0x24BDF4A08], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2558DF070);
  }
  return result;
}

unint64_t sub_22757D714()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2558DF078;
  if (!qword_2558DF078)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558DF080);
    v2[0] = sub_22757D798();
    v2[1] = sub_22730BB7C(&qword_2558DF0A8, &qword_2558DF0B0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2276B3C78](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2558DF078);
  }
  return result;
}

unint64_t sub_22757D798()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2558DF088;
  if (!qword_2558DF088)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558DF090);
    v2[0] = sub_22730BB7C(&qword_2558DF098, &qword_2558DF0A0, MEMORY[0x24BDF44C8]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2276B3C78](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2558DF088);
  }
  return result;
}

uint64_t sub_22757D81C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t objectdestroyTm_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for MFReaderTextDisplayView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_release();
  swift_release();

  v4 = v3 + *(int *)(v1 + 28);
  __swift_instantiateConcreteTypeFromMangledName(qword_2558D6380);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_22758D47C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_22757D928@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for MFReaderTextDisplayView() - 8) + 80);
  return sub_22757C5B0(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_22757D984(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MFReaderTextDisplayView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22757D9C0()
{
  return sub_22730BB7C(&qword_2558DF0D0, &qword_2558DF0D8, MEMORY[0x24BDEDA10]);
}

uint64_t MAGSoundEffect.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_22757DA28 + 4 * byte_2275A89D0[*v0]))(0x6E61747369447861, 0xEE00686769486563);
}

unint64_t sub_22757DA3C()
{
  return 0xD000000000000011;
}

void MAGSoundEffect.url.getter(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[2];

  v72[1] = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B7B10);
  MEMORY[0x24BDAC7A8](v2, v3, v4, v5, v6);
  MEMORY[0x24BDAC7A8](v7, v8, v9, v10, v11);
  MEMORY[0x24BDAC7A8](v12, v13, v14, v15, v16);
  MEMORY[0x24BDAC7A8](v17, v18, v19, v20, v21);
  MEMORY[0x24BDAC7A8]((char *)v72 - v22, v23, v24, v25, v26);
  MEMORY[0x24BDAC7A8](v28, (char *)v72 - v27, v29, v30, v31);
  MEMORY[0x24BDAC7A8](v32, v33, v34, v35, v36);
  MEMORY[0x24BDAC7A8](v37, v38, v39, v40, v41);
  MEMORY[0x24BDAC7A8](v42, v43, v44, v45, v46);
  MEMORY[0x24BDAC7A8](v47, v48, v49, v50, v51);
  MEMORY[0x24BDAC7A8](v52, v53, v54, v55, v56);
  MEMORY[0x24BDAC7A8](v57, v58, v59, v60, v61);
  MEMORY[0x24BDAC7A8](v62, v63, v64, v65, v66);
  MEMORY[0x24BDAC7A8](v67, v68, v69, v70, v71);
  __asm { BR              X10 }
}

uint64_t sub_22757DD4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjCClassFromMetadata;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  type metadata accessor for MAGUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_22758E1B4();
  v5 = (void *)sub_22758E1B4();
  v6 = objc_msgSend(v3, sel_URLForResource_withExtension_, v4, v5);

  if (v6)
  {
    sub_22758C81C();

    v7 = sub_22758C858();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v0, 0, 1, v7);
  }
  else
  {
    v8 = sub_22758C858();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v0, 1, 1, v8);
  }
  return sub_22757E988(v0, *(_QWORD *)(v1 - 88));
}

uint64_t sub_22757E988(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B7B10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *static MAGSoundEffect.allCases.getter()
{
  return &unk_24EF9A608;
}

uint64_t MAGSoundEffect.id.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_22757EA18 + 4 * byte_2275A89DE[*v0]))(0x6E61747369447861, 0xEE00686769486563);
}

unint64_t sub_22757EA2C()
{
  return 0xD000000000000011;
}

MagnifierSupport::MAGSoundEffect_optional __swiftcall MAGSoundEffect.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  MagnifierSupport::MAGSoundEffect_optional result;
  char v5;

  v2 = v1;
  v3 = sub_22758ED48();
  result.value = swift_bridgeObjectRelease();
  v5 = 14;
  if (v3 < 0xE)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t sub_22757EBB0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2273934FC(*a1, *a2);
}

unint64_t sub_22757EBC0()
{
  unint64_t result;

  result = qword_2558DF0E0;
  if (!qword_2558DF0E0)
  {
    result = MEMORY[0x2276B3C78](&protocol conformance descriptor for MAGSoundEffect, &type metadata for MAGSoundEffect);
    atomic_store(result, (unint64_t *)&qword_2558DF0E0);
  }
  return result;
}

uint64_t sub_22757EC04()
{
  sub_22758EF4C();
  MAGSoundEffect.rawValue.getter();
  sub_22758E274();
  swift_bridgeObjectRelease();
  return sub_22758EF88();
}

uint64_t sub_22757EC68()
{
  MAGSoundEffect.rawValue.getter();
  sub_22758E274();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22757ECB8()
{
  sub_22758EF4C();
  MAGSoundEffect.rawValue.getter();
  sub_22758E274();
  swift_bridgeObjectRelease();
  return sub_22758EF88();
}

MagnifierSupport::MAGSoundEffect_optional sub_22757ED18(Swift::String *a1)
{
  return MAGSoundEffect.init(rawValue:)(*a1);
}

uint64_t sub_22757ED24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = MAGSoundEffect.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_22757ED4C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2558DF0E8;
  if (!qword_2558DF0E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558DCF88);
    result = MEMORY[0x2276B3C78](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2558DF0E8);
  }
  return result;
}

void sub_22757ED98(_QWORD *a1@<X8>)
{
  *a1 = &unk_24EF9A608;
}

uint64_t sub_22757EDA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = MAGSoundEffect.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for MAGSoundEffect(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF3)
    goto LABEL_17;
  if (a2 + 13 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 13) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 13;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 13;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 13;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xE;
  v8 = v6 - 14;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MAGSoundEffect(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 13 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 13) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF3)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF2)
    return ((uint64_t (*)(void))((char *)&loc_22757EEA8 + 4 * byte_2275A89F1[v4]))();
  *a1 = a2 + 13;
  return ((uint64_t (*)(void))((char *)sub_22757EEDC + 4 * byte_2275A89EC[v4]))();
}

uint64_t sub_22757EEDC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22757EEE4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22757EEECLL);
  return result;
}

uint64_t sub_22757EEF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22757EF00);
  *(_BYTE *)result = a2 + 13;
  return result;
}

uint64_t sub_22757EF04(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22757EF0C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MAGSoundEffect()
{
  return &type metadata for MAGSoundEffect;
}

id sub_22757EF28(double a1, double a2, double a3, double a4)
{
  char *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  v5 = UIEdgeInsetsInsetRect(a1, a2, a3, a4, *(double *)&v4[OBJC_IVAR____TtC16MagnifierSupport12MFInsetLabel_topInset], *(double *)&v4[OBJC_IVAR____TtC16MagnifierSupport12MFInsetLabel_leftInset]);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13.receiver = v4;
  v13.super_class = (Class)type metadata accessor for MFInsetLabel();
  return objc_msgSendSuper2(&v13, sel_drawTextInRect_, v5, v7, v9, v11);
}

double sub_22757F020(double a1, double a2)
{
  char *v2;
  double v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for MFInsetLabel();
  objc_msgSendSuper2(&v7, sel_sizeThatFits_, a1, a2);
  return v5
       + *(double *)&v2[OBJC_IVAR____TtC16MagnifierSupport12MFInsetLabel_leftInset]
       + *(double *)&v2[OBJC_IVAR____TtC16MagnifierSupport12MFInsetLabel_rightInset];
}

double sub_22757F138()
{
  char *v0;
  double v1;
  objc_super v3;

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for MFInsetLabel();
  objc_msgSendSuper2(&v3, sel_intrinsicContentSize);
  return v1
       + *(double *)&v0[OBJC_IVAR____TtC16MagnifierSupport12MFInsetLabel_leftInset]
       + *(double *)&v0[OBJC_IVAR____TtC16MagnifierSupport12MFInsetLabel_rightInset];
}

id sub_22757F24C(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport12MFInsetLabel_topInset] = 0x4000000000000000;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport12MFInsetLabel_leftInset] = 0x4020000000000000;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport12MFInsetLabel_bottomInset] = 0x4000000000000000;
  *(_QWORD *)&v1[OBJC_IVAR____TtC16MagnifierSupport12MFInsetLabel_rightInset] = 0x4020000000000000;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for MFInsetLabel();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_22757F2F4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MFInsetLabel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MFInsetLabel()
{
  return objc_opt_self();
}

uint64_t MAGFeatures.__allocating_init()()
{
  uint64_t v0;
  void *v1;
  id v2;

  v0 = swift_allocObject();
  if (qword_2558D4D90 != -1)
    swift_once();
  v1 = (void *)qword_2558F4148;
  sub_22750D3D4();
  v2 = v1;
  *(_QWORD *)(v0 + 16) = sub_22758D2C0();
  return v0;
}

MagnifierSupport::MAGAppMode_optional __swiftcall MAGAppMode.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 3;
  if ((unint64_t)rawValue < 3)
    v2 = rawValue;
  *v1 = v2;
  return (MagnifierSupport::MAGAppMode_optional)rawValue;
}

uint64_t MAGAppMode.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

void *static MAGAppMode.allCases.getter()
{
  return &unk_24EF9A980;
}

uint64_t MAGAppMode.title.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x65746E4920707041;
  if (*v0 != 1)
    v1 = 0x442074757074754FLL;
  if (*v0)
    return v1;
  else
    return 0x746C7561666544;
}

uint64_t MAGAppMode.symbolImage.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x687361642E707061;
  else
    return 7368801;
}

MagnifierSupport::MAGAppMode_optional sub_22757F4C4(Swift::Int *a1)
{
  return MAGAppMode.init(rawValue:)(*a1);
}

void sub_22757F4CC(_QWORD *a1@<X8>)
{
  *a1 = &unk_24EF9AB18;
}

uint64_t MAGFeatures.init()()
{
  uint64_t v0;
  void *v1;
  id v2;

  if (qword_2558D4D90 != -1)
    swift_once();
  v1 = (void *)qword_2558F4148;
  sub_22750D3D4();
  v2 = v1;
  *(_QWORD *)(v0 + 16) = sub_22758D2C0();
  return v0;
}

uint64_t MAGFeatures.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t MAGFeatures.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

void sub_22757F5B8()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v1 = (void *)sub_22758E1B4();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
    qword_2558F4148 = (uint64_t)v2;
  else
    __break(1u);
}

unint64_t sub_22757F630()
{
  unint64_t result;

  result = qword_2558DF110;
  if (!qword_2558DF110)
  {
    result = MEMORY[0x2276B3C78](&protocol conformance descriptor for MAGAppMode, &type metadata for MAGAppMode);
    atomic_store(result, (unint64_t *)&qword_2558DF110);
  }
  return result;
}

unint64_t sub_22757F678()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2558DF118;
  if (!qword_2558DF118)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558DF120);
    result = MEMORY[0x2276B3C78](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2558DF118);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for MAGAppMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22757F710 + 4 * byte_2275A8B75[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22757F744 + 4 * asc_2275A8B70[v4]))();
}

uint64_t sub_22757F744(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22757F74C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22757F754);
  return result;
}

uint64_t sub_22757F760(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22757F768);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22757F76C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22757F774(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MAGAppMode()
{
  return &type metadata for MAGAppMode;
}

uint64_t type metadata accessor for MAGFeatures()
{
  return objc_opt_self();
}

uint64_t method lookup function for MAGFeatures()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MAGFeatures.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t MAGPointAndSpeakEventHandler.register(_:asActionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  v5 = v4;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a3;
  *(_QWORD *)(v10 + 24) = a4;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *(_QWORD *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = 0x8000000000000000;
  sub_2275867B4((uint64_t)&unk_2558DCD00, v10, a1, a2, isUniquelyReferenced_nonNull_native, &qword_2558D5B00);
  *(_QWORD *)(v5 + 16) = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

uint64_t static MAGPointAndSpeakEvent.handTooClose()()
{
  type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t MAGPointAndSpeakEventHandler.send(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[12] = a1;
  v2[13] = v1;
  type metadata accessor for MAGPointAndSpeakEvent(0);
  v2[14] = swift_task_alloc();
  sub_22758E49C();
  v2[15] = sub_22758E490();
  v2[16] = sub_22758E460();
  v2[17] = v3;
  return swift_task_switch();
}

uint64_t sub_22757F968()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int **v12;
  int *v13;
  _QWORD *v14;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(void);

  v1 = *(_QWORD *)(v0 + 104);
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 144) = v2;
  v3 = *(_BYTE *)(v2 + 32);
  *(_BYTE *)(v0 + 208) = v3;
  v4 = -1;
  v5 = -1 << v3;
  if (-(-1 << v3) < 64)
    v4 = ~(-1 << -(char)v5);
  v6 = v4 & *(_QWORD *)(v2 + 64);
  swift_bridgeObjectRetain();
  if (v6)
  {
    v7 = 0;
    v8 = __clz(__rbit64(v6));
    v9 = (v6 - 1) & v6;
LABEL_5:
    *(_QWORD *)(v0 + 152) = v7;
    *(_QWORD *)(v0 + 160) = v9;
    v10 = 16 * v8;
    v11 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v10);
    *(_QWORD *)(v0 + 168) = *v11;
    *(_QWORD *)(v0 + 176) = v11[1];
    v12 = (int **)(*(_QWORD *)(v2 + 56) + v10);
    v13 = *v12;
    *(_QWORD *)(v0 + 184) = v12[1];
    v21 = (uint64_t (*)(void))((char *)v13 + *v13);
    swift_bridgeObjectRetain();
    swift_retain();
    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v14;
    *v14 = v0;
    v14[1] = sub_22757FB54;
    return v21();
  }
  v16 = 63 - v5;
  if ((unint64_t)(63 - v5) > 0x7F)
  {
    v17 = *(_QWORD *)(v2 + 72);
    if (v17)
    {
      v7 = 1;
LABEL_9:
      v9 = (v17 - 1) & v17;
      v8 = __clz(__rbit64(v17)) + (v7 << 6);
      goto LABEL_5;
    }
    if (v16 >= 0xC0)
    {
      v17 = *(_QWORD *)(v2 + 80);
      if (v17)
      {
        v7 = 2;
        goto LABEL_9;
      }
      if (v16 >= 0x100)
      {
        v17 = *(_QWORD *)(v2 + 88);
        if (v17)
        {
          v7 = 3;
          goto LABEL_9;
        }
        if (v16 >= 0x140)
        {
          v17 = *(_QWORD *)(v2 + 96);
          if (v17)
          {
            v7 = 4;
            goto LABEL_9;
          }
          v18 = 0;
          v19 = v16 >> 6;
          if (v19 <= 5)
            v19 = 5;
          v20 = v19 - 5;
          while (v20 != v18)
          {
            v17 = *(_QWORD *)(v2 + 104 + 8 * v18++);
            if (v17)
            {
              v7 = v18 + 4;
              goto LABEL_9;
            }
          }
        }
      }
    }
  }
  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22757FB54()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_22757FBC0()
{
  uint64_t v0;
  uint64_t result;
  int64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  int *v10;
  _QWORD *v11;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t (*v17)(void);

  swift_release();
  result = swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 160);
  if (v3)
  {
    v4 = __clz(__rbit64(v3));
    v5 = (v3 - 1) & v3;
    v6 = v4 | (v2 << 6);
    v7 = *(_QWORD *)(v0 + 144);
LABEL_3:
    *(_QWORD *)(v0 + 152) = v2;
    *(_QWORD *)(v0 + 160) = v5;
    v8 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v6);
    *(_QWORD *)(v0 + 168) = *v8;
    *(_QWORD *)(v0 + 176) = v8[1];
    v9 = *(_QWORD *)(v7 + 56) + 16 * v6;
    v10 = *(int **)v9;
    *(_QWORD *)(v0 + 184) = *(_QWORD *)(v9 + 8);
    v17 = (uint64_t (*)(void))((char *)v10 + *v10);
    swift_bridgeObjectRetain();
    swift_retain();
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v11;
    *v11 = v0;
    v11[1] = sub_22757FB54;
    return v17();
  }
  v12 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
    __break(1u);
  }
  else
  {
    v13 = (unint64_t)((1 << *(_BYTE *)(v0 + 208)) + 63) >> 6;
    v7 = *(_QWORD *)(v0 + 144);
    if (v12 >= v13)
      goto LABEL_18;
    v14 = v7 + 64;
    v15 = *(_QWORD *)(v7 + 64 + 8 * v12);
    ++v2;
    if (v15)
    {
LABEL_7:
      v5 = (v15 - 1) & v15;
      v6 = __clz(__rbit64(v15)) + (v2 << 6);
      goto LABEL_3;
    }
    v2 = v12 + 1;
    if (v12 + 1 >= v13)
      goto LABEL_18;
    v15 = *(_QWORD *)(v14 + 8 * v2);
    if (v15)
      goto LABEL_7;
    v2 = v12 + 2;
    if (v12 + 2 >= v13)
      goto LABEL_18;
    v15 = *(_QWORD *)(v14 + 8 * v2);
    if (v15)
      goto LABEL_7;
    v16 = v12 + 3;
    if (v16 >= v13)
    {
LABEL_18:
      swift_release();
      swift_release();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    v15 = *(_QWORD *)(v14 + 8 * v16);
    if (v15)
    {
      v2 = v16;
      goto LABEL_7;
    }
    while (1)
    {
      v2 = v16 + 1;
      if (__OFADD__(v16, 1))
        break;
      if (v2 >= v13)
        goto LABEL_18;
      v15 = *(_QWORD *)(v14 + 8 * v2);
      ++v16;
      if (v15)
        goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_22757FD74()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  swift_release();
  if (qword_2558D49E0 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(void **)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 112);
  v4 = sub_22758CF9C();
  __swift_project_value_buffer(v4, (uint64_t)qword_2558D60C8);
  sub_22730DEEC(v1, v3, type metadata accessor for MAGPointAndSpeakEvent);
  v5 = v2;
  swift_bridgeObjectRetain();
  v6 = v2;
  v7 = sub_22758CF84();
  v8 = sub_22758E6C4();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(void **)(v0 + 200);
  v11 = *(_QWORD *)(v0 + 176);
  if (v9)
  {
    v12 = *(_QWORD *)(v0 + 168);
    v18 = *(_QWORD *)(v0 + 112);
    v13 = swift_slowAlloc();
    v19 = swift_slowAlloc();
    v20 = v19;
    *(_DWORD *)v13 = 136315650;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 64) = sub_22733611C(v12, v11, &v20);
    sub_22758EA48();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 2080;
    v21 = 0x746E657645205241;
    v22 = 0xEA0000000000203ALL;
    MAGPointAndSpeakEvent.PointAndSpeakEventType.description.getter();
    sub_22758E2B0();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 72) = sub_22733611C(v21, v22, &v20);
    sub_22758EA48();
    swift_bridgeObjectRelease();
    sub_22730DFB0(v18, type metadata accessor for MAGPointAndSpeakEvent);
    *(_WORD *)(v13 + 22) = 2080;
    swift_getErrorValue();
    v14 = sub_22758EEEC();
    *(_QWORD *)(v0 + 88) = sub_22733611C(v14, v15, &v20);
    sub_22758EA48();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2272F4000, v7, v8, "Handler=%s error handling event=%s. Error=%s", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2276B3D50](v19, -1, -1);
    MEMORY[0x2276B3D50](v13, -1, -1);
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 112);
    swift_bridgeObjectRelease_n();
    sub_22730DFB0(v16, type metadata accessor for MAGPointAndSpeakEvent);

  }
  swift_willThrow();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static MAGPointAndSpeakEvent.handDetected()()
{
  type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(0);
  return swift_storeEnumTagMultiPayload();
}

id static MAGPointAndSpeakEvent.handlePointAndSpeakBounds(boundingBox:block:camera:capturedImage:depthMap:orientation:isHuman:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, double *a7@<X8>, double a8@<D0>, double a9@<D1>, double a10@<D2>, double a11@<D3>)
{
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;

  v20 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_2558D55C0);
  v21 = (uint64_t)a7 + v20[12];
  v22 = v20[16];
  v23 = v20[20];
  v24 = v20[24];
  v25 = v20[28];
  v26 = v20[32];
  *a7 = a8;
  a7[1] = a9;
  a7[2] = a10;
  a7[3] = a11;
  sub_22730DEEC(a1, v21, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
  *(_QWORD *)((char *)a7 + v22) = a2;
  *(_QWORD *)((char *)a7 + v23) = a3;
  *(_QWORD *)((char *)a7 + v24) = a4;
  *(_QWORD *)((char *)a7 + v25) = a5;
  *((_BYTE *)a7 + v26) = a6;
  type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(0);
  swift_storeEnumTagMultiPayload();
  v27 = a4;
  v28 = a2;
  return a3;
}

uint64_t static MAGPointAndSpeakEvent.handlePointAndSpeak3D(joint:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_22758CFCC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t static MAGPointAndSpeakEvent.processPointAndSpeakUpdate(filteredTextBlocks:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = a1;
  type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(0);
  swift_storeEnumTagMultiPayload();
  return swift_bridgeObjectRetain();
}

uint64_t static MAGPointAndSpeakEvent.handlePointAndSpeakBoundsWithSpatialBlock(spatialText:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_22730DEEC(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for SpatialTextBlock);
  type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t static MAGPointAndSpeakEvent.handleCoachingUpdate(tip:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(0);
  swift_storeEnumTagMultiPayload();
  return swift_bridgeObjectRetain();
}

uint64_t static MAGPointAndSpeakEvent.handleNoContentAvailable()()
{
  type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t static MAGPointAndSpeakEvent.handleEmptyHandPoseRequest()()
{
  type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t MAGPointAndSpeakEventHandler.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_22731E5DC(MEMORY[0x24BEE4AF8]);
  return v0;
}

uint64_t MAGPointAndSpeakEvent.eventType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_22730DEEC(v1, a1, type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType);
}

uint64_t MAGPointAndSpeakEvent.description.getter()
{
  MAGPointAndSpeakEvent.PointAndSpeakEventType.description.getter();
  sub_22758E2B0();
  swift_bridgeObjectRelease();
  return 0x746E657645205241;
}

void MAGPointAndSpeakEvent.PointAndSpeakEventType.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD);
  char *v7;
  uint64_t v8;

  v1 = type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(0);
  MEMORY[0x24BDAC7A8](v1, v2, type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType, v3, v4);
  sub_22730DEEC(v0, (uint64_t)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  v7 = (char *)sub_2275804B0 + 4 * byte_2275A8CD0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_2275804B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_22758CFCC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0 + 6;
}

uint64_t sub_227580608()
{
  MAGPointAndSpeakEvent.PointAndSpeakEventType.description.getter();
  sub_22758E2B0();
  swift_bridgeObjectRelease();
  return 0x746E657645205241;
}

uint64_t MAGPointAndSpeakEventHandler.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = sub_22731E5DC(MEMORY[0x24BEE4AF8]);
  return v0;
}

uint64_t sub_227580688()
{
  swift_release();
  return swift_deallocObject();
}

Swift::Void __swiftcall MAGPointAndSpeakEventHandler.unregister(_:)(Swift::String a1)
{
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v3;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v3 = sub_2273366F8(countAndFlagsBits, (uint64_t)object);
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_2273382D0(v3);
}

uint64_t MAGPointAndSpeakEventHandler.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t MAGPointAndSpeakEventHandler.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_22758076C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _QWORD *v18;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5B58);
  v6 = sub_22758ED0C();
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_26;
  v7 = 1 << *(_BYTE *)(v5 + 32);
  v18 = (_QWORD *)(v5 + 64);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v5 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  swift_retain();
  if (v9)
  {
    v11 = __clz(__rbit64(v9));
    goto LABEL_18;
  }
  if (v10 > 1)
  {
    v12 = *(_QWORD *)(v5 + 72);
    v13 = 1;
    if (v12)
      goto LABEL_17;
    v13 = 2;
    if (v10 > 2)
    {
      v12 = *(_QWORD *)(v5 + 80);
      if (!v12)
      {
        v14 = 3;
        if (v10 > 3)
        {
          v12 = *(_QWORD *)(v5 + 88);
          if (v12)
          {
            v13 = 3;
            goto LABEL_17;
          }
          while (1)
          {
            v13 = v14 + 1;
            if (__OFADD__(v14, 1))
            {
              __break(1u);
              JUMPOUT(0x227580B68);
            }
            if (v13 >= v10)
              break;
            v12 = v18[v13];
            ++v14;
            if (v12)
              goto LABEL_17;
          }
        }
        goto LABEL_21;
      }
LABEL_17:
      v11 = __clz(__rbit64(v12)) + (v13 << 6);
LABEL_18:
      v15 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 48) + v11);
      if ((a2 & 1) == 0)
        swift_bridgeObjectRetain();
      sub_22758EF4C();
      __asm { BR              X8 }
    }
  }
LABEL_21:
  swift_release();
  v3 = v2;
  if ((a2 & 1) != 0)
  {
    v16 = 1 << *(_BYTE *)(v5 + 32);
    if (v16 >= 64)
      bzero(v18, ((unint64_t)(v16 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    else
      *v18 = -1 << v16;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_26:
  result = swift_release();
  *v3 = v6;
  return result;
}

uint64_t sub_227580B8C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  _QWORD *v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF3D8);
  v37 = a2;
  v6 = sub_22758ED0C();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v34 = v2;
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v36 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v21 = v20 | (v13 << 6);
      }
      else
      {
        v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v35)
          goto LABEL_33;
        v23 = v36[v22];
        ++v13;
        if (!v23)
        {
          v13 = v22 + 1;
          if (v22 + 1 >= v35)
            goto LABEL_33;
          v23 = v36[v13];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v35)
            {
LABEL_33:
              swift_release();
              v3 = v34;
              if ((v37 & 1) != 0)
              {
                v33 = 1 << *(_BYTE *)(v5 + 32);
                if (v33 >= 64)
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v33;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v36[v24];
            if (!v23)
            {
              while (1)
              {
                v13 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_40;
                if (v13 >= v35)
                  goto LABEL_33;
                v23 = v36[v13];
                ++v24;
                if (v23)
                  goto LABEL_30;
              }
            }
            v13 = v24;
          }
        }
LABEL_30:
        v10 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      v29 = 8 * v21;
      v30 = *(void **)(*(_QWORD *)(v5 + 48) + v29);
      v31 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v29);
      if ((v37 & 1) == 0)
      {
        v32 = v30;
        swift_bridgeObjectRetain();
      }
      sub_22758E1E4();
      sub_22758EF4C();
      sub_22758E274();
      v14 = sub_22758EF88();
      result = swift_bridgeObjectRelease();
      v15 = -1 << *(_BYTE *)(v7 + 32);
      v16 = v14 & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v11 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v11 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v27 = v17 == v26;
          if (v17 == v26)
            v17 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v11 + 8 * v17);
        }
        while (v28 == -1);
        v18 = __clz(__rbit64(~v28)) + (v17 << 6);
      }
      *(_QWORD *)(v11 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      v19 = 8 * v18;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v30;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v31;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_227580EA8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5BC8);
  result = sub_22758ED0C();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v36 = (uint64_t *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v33 = -1 << v9;
    v34 = v9;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v35)
          goto LABEL_33;
        v21 = v36[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v35)
            goto LABEL_33;
          v21 = v36[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v35)
            {
LABEL_33:
              if ((a2 & 1) != 0)
              {
                if (v34 >= 64)
                  bzero(v36, 8 * v35);
                else
                  *v36 = v33;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v21 = v36[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_41;
                if (v8 >= v35)
                  goto LABEL_33;
                v21 = v36[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v19);
      v28 = *(_QWORD *)(v5 + 56) + 56 * v19;
      v38 = *(_OWORD *)(v28 + 16);
      v39 = *(_OWORD *)v28;
      v29 = *(_QWORD *)(v28 + 32);
      v37 = *(_OWORD *)(v28 + 40);
      if ((a2 & 1) == 0)
      {
        v30 = *((id *)&v38 + 1);
        swift_bridgeObjectRetain();
        v31 = *((id *)&v39 + 1);
        v32 = (id)v38;
      }
      result = sub_22758EF40();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v25 = v15 == v24;
          if (v15 == v24)
            v15 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v16) = v27;
      v17 = *(_QWORD *)(v7 + 56) + 56 * v16;
      *(_OWORD *)v17 = v39;
      *(_OWORD *)(v17 + 16) = v38;
      *(_QWORD *)(v17 + 32) = v29;
      *(_OWORD *)(v17 + 40) = v37;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2275811B8(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int v41;
  int64_t v42;
  _QWORD *v43;
  uint64_t v44;

  v3 = v2;
  v5 = sub_22758C984();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7, v8, v9, v10);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5BD8);
  result = sub_22758ED0C();
  v15 = result;
  if (*(_QWORD *)(v13 + 16))
  {
    v40 = v3;
    v16 = 0;
    v17 = *(_QWORD *)(v13 + 64);
    v43 = (_QWORD *)(v13 + 64);
    v18 = 1 << *(_BYTE *)(v13 + 32);
    if (v18 < 64)
      v19 = ~(-1 << v18);
    else
      v19 = -1;
    v20 = v19 & v17;
    v42 = (unint64_t)(v18 + 63) >> 6;
    v21 = result + 64;
    v41 = a2;
    v22 = 16;
    if ((a2 & 1) != 0)
      v22 = 32;
    v44 = v22;
    while (1)
    {
      if (v20)
      {
        v24 = __clz(__rbit64(v20));
        v20 &= v20 - 1;
        v25 = v24 | (v16 << 6);
      }
      else
      {
        v26 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = (uint64_t)v43;
        if (v26 >= v42)
          goto LABEL_33;
        v27 = v43[v26];
        ++v16;
        if (!v27)
        {
          v16 = v26 + 1;
          if (v26 + 1 >= v42)
            goto LABEL_33;
          v27 = v43[v16];
          if (!v27)
          {
            v28 = v26 + 2;
            if (v28 >= v42)
            {
LABEL_33:
              if ((v41 & 1) == 0)
              {
                result = swift_release();
                v3 = v40;
                goto LABEL_40;
              }
              v38 = 1 << *(_BYTE *)(v13 + 32);
              if (v38 >= 64)
                bzero(v43, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v43 = -1 << v38;
              v3 = v40;
              *(_QWORD *)(v13 + 16) = 0;
              break;
            }
            v27 = v43[v28];
            if (!v27)
            {
              while (1)
              {
                v16 = v28 + 1;
                if (__OFADD__(v28, 1))
                  goto LABEL_42;
                if (v16 >= v42)
                  goto LABEL_33;
                v27 = v43[v16];
                ++v28;
                if (v27)
                  goto LABEL_23;
              }
            }
            v16 = v28;
          }
        }
LABEL_23:
        v20 = (v27 - 1) & v27;
        v25 = __clz(__rbit64(v27)) + (v16 << 6);
      }
      v29 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 8 * v25);
      v30 = *(_QWORD *)(v6 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + v44))(v12, *(_QWORD *)(v13 + 56) + v30 * v25, v5);
      result = sub_22758EF40();
      v31 = -1 << *(_BYTE *)(v15 + 32);
      v32 = result & ~v31;
      v33 = v32 >> 6;
      if (((-1 << v32) & ~*(_QWORD *)(v21 + 8 * (v32 >> 6))) != 0)
      {
        v23 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v21 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v34 = 0;
        v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v36 = v33 == v35;
          if (v33 == v35)
            v33 = 0;
          v34 |= v36;
          v37 = *(_QWORD *)(v21 + 8 * v33);
        }
        while (v37 == -1);
        v23 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(_QWORD *)(v21 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      *(_QWORD *)(*(_QWORD *)(v15 + 48) + 8 * v23) = v29;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v15 + 56) + v30 * v23, v12, v5);
      ++*(_QWORD *)(v15 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v15;
  return result;
}

uint64_t sub_2275814E8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  _QWORD *v35;
  unint64_t v36;
  int64_t v37;
  uint64_t *v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char v42;
  unint64_t v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  int64_t v48;
  _QWORD *v49;
  uint64_t i;
  char v51;
  uint64_t v52;
  char v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  char v59;
  char v60;
  uint64_t v61;
  char v62;
  char v63;
  char v64;
  char v65;
  uint64_t v66;
  char v67;
  char v68;
  char v69;
  char v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  __int128 v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  __int128 v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  _OWORD __dst[18];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540BA1E0);
  v51 = a2;
  v6 = sub_22758ED0C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v49 = (_QWORD *)(v5 + 64);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v47 = v2;
  v48 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  for (i = v5; ; v5 = i)
  {
    if (v10)
    {
      v17 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v18 = v17 | (v13 << 6);
      if ((v51 & 1) != 0)
        goto LABEL_10;
      goto LABEL_23;
    }
    v34 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v34 >= v48)
      break;
    v35 = v49;
    v36 = v49[v34];
    ++v13;
    if (!v36)
    {
      v13 = v34 + 1;
      if (v34 + 1 >= v48)
        goto LABEL_33;
      v36 = v49[v13];
      if (!v36)
      {
        v37 = v34 + 2;
        if (v37 >= v48)
        {
LABEL_33:
          swift_release();
          v3 = v47;
          if ((v51 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v36 = v49[v37];
        if (!v36)
        {
          while (1)
          {
            v13 = v37 + 1;
            if (__OFADD__(v37, 1))
              goto LABEL_42;
            if (v13 >= v48)
              goto LABEL_33;
            v36 = v49[v13];
            ++v37;
            if (v36)
              goto LABEL_22;
          }
        }
        v13 = v37;
      }
    }
LABEL_22:
    v10 = (v36 - 1) & v36;
    v18 = __clz(__rbit64(v36)) + (v13 << 6);
    if ((v51 & 1) != 0)
    {
LABEL_10:
      v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v18);
      v20 = *v19;
      v21 = v19[1];
      v22 = *(_QWORD *)(v5 + 56) + 280 * v18;
      v23 = *(_BYTE *)v22;
      v24 = *(_BYTE *)(v22 + 1);
      v26 = *(_QWORD *)(v22 + 8);
      v25 = *(_QWORD *)(v22 + 16);
      v27 = *(_QWORD *)(v22 + 24);
      v28 = *(_BYTE *)(v22 + 32);
      v52 = *(_QWORD *)(v22 + 40);
      v29 = *(_DWORD *)(v22 + 48);
      v53 = *(_BYTE *)(v22 + 52);
      v54 = *(_BYTE *)(v22 + 53);
      v55 = *(_BYTE *)(v22 + 54);
      v56 = *(_BYTE *)(v22 + 55);
      v57 = *(_BYTE *)(v22 + 56);
      v58 = *(_BYTE *)(v22 + 57);
      v59 = *(_BYTE *)(v22 + 58);
      v60 = *(_BYTE *)(v22 + 59);
      v30 = *(_QWORD *)(v22 + 64);
      v61 = *(_QWORD *)(v22 + 72);
      v32 = *(_QWORD *)(v22 + 80);
      v31 = *(_QWORD *)(v22 + 88);
      v74 = *(_OWORD *)(v22 + 96);
      v79 = *(_QWORD *)(v22 + 120);
      v33 = *(_QWORD *)(v22 + 136);
      v75 = *(_QWORD *)(v22 + 128);
      v62 = *(_BYTE *)(v22 + 112);
      v63 = *(_BYTE *)(v22 + 144);
      v64 = *(_BYTE *)(v22 + 145);
      v65 = *(_BYTE *)(v22 + 146);
      v66 = *(_QWORD *)(v22 + 152);
      v76 = *(_OWORD *)(v22 + 168);
      v78 = *(_OWORD *)(v22 + 184);
      v83 = *(_QWORD *)(v22 + 200);
      v80 = *(_QWORD *)(v22 + 208);
      v77 = *(_QWORD *)(v22 + 216);
      v67 = *(_BYTE *)(v22 + 160);
      v68 = *(_BYTE *)(v22 + 224);
      v69 = *(_BYTE *)(v22 + 225);
      v70 = *(_BYTE *)(v22 + 226);
      v71 = *(_BYTE *)(v22 + 227);
      v81 = *(_OWORD *)(v22 + 232);
      v82 = *(_OWORD *)(v22 + 248);
      v72 = *(_QWORD *)(v22 + 272);
      v73 = *(_QWORD *)(v22 + 264);
      goto LABEL_24;
    }
LABEL_23:
    v38 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v18);
    v20 = *v38;
    v21 = v38[1];
    memcpy(__dst, (const void *)(*(_QWORD *)(v5 + 56) + 280 * v18), 0x118uLL);
    v72 = *(_QWORD *)&__dst[17];
    v73 = *((_QWORD *)&__dst[16] + 1);
    v81 = *(_OWORD *)((char *)&__dst[14] + 8);
    v82 = *(_OWORD *)((char *)&__dst[15] + 8);
    v70 = BYTE2(__dst[14]);
    v71 = BYTE3(__dst[14]);
    v68 = __dst[14];
    v69 = BYTE1(__dst[14]);
    v83 = *((_QWORD *)&__dst[12] + 1);
    v77 = *((_QWORD *)&__dst[13] + 1);
    v78 = *(_OWORD *)((char *)&__dst[11] + 8);
    v76 = *(_OWORD *)((char *)&__dst[10] + 8);
    v67 = __dst[10];
    v66 = *((_QWORD *)&__dst[9] + 1);
    v64 = BYTE1(__dst[9]);
    v65 = BYTE2(__dst[9]);
    v79 = *((_QWORD *)&__dst[7] + 1);
    v80 = *(_QWORD *)&__dst[13];
    v33 = *((_QWORD *)&__dst[8] + 1);
    v75 = *(_QWORD *)&__dst[8];
    v62 = __dst[7];
    v63 = __dst[9];
    v74 = __dst[6];
    v31 = *((_QWORD *)&__dst[5] + 1);
    v32 = *(_QWORD *)&__dst[5];
    v61 = *((_QWORD *)&__dst[4] + 1);
    v30 = *(_QWORD *)&__dst[4];
    v59 = BYTE10(__dst[3]);
    v60 = BYTE11(__dst[3]);
    v57 = BYTE8(__dst[3]);
    v58 = BYTE9(__dst[3]);
    v55 = BYTE6(__dst[3]);
    v56 = BYTE7(__dst[3]);
    v53 = BYTE4(__dst[3]);
    v54 = BYTE5(__dst[3]);
    v29 = __dst[3];
    v52 = *((_QWORD *)&__dst[2] + 1);
    v28 = __dst[2];
    v27 = *((_QWORD *)&__dst[1] + 1);
    v25 = *(_QWORD *)&__dst[1];
    v26 = *((_QWORD *)&__dst[0] + 1);
    v24 = BYTE1(__dst[0]);
    v23 = __dst[0];
    swift_bridgeObjectRetain();
    sub_22730B838((uint64_t)__dst);
LABEL_24:
    sub_22758EF4C();
    sub_22758E274();
    result = sub_22758EF88();
    v39 = -1 << *(_BYTE *)(v7 + 32);
    v40 = result & ~v39;
    v41 = v40 >> 6;
    if (((-1 << v40) & ~*(_QWORD *)(v11 + 8 * (v40 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v40) & ~*(_QWORD *)(v11 + 8 * (v40 >> 6)))) | v40 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v42 = 0;
      v43 = (unint64_t)(63 - v39) >> 6;
      do
      {
        if (++v41 == v43 && (v42 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v44 = v41 == v43;
        if (v41 == v43)
          v41 = 0;
        v42 |= v44;
        v45 = *(_QWORD *)(v11 + 8 * v41);
      }
      while (v45 == -1);
      v14 = __clz(__rbit64(~v45)) + (v41 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
    *v15 = v20;
    v15[1] = v21;
    v16 = *(_QWORD *)(v7 + 56) + 280 * v14;
    *(_BYTE *)v16 = v23;
    *(_BYTE *)(v16 + 1) = v24;
    *(_BYTE *)(v16 + 32) = v28;
    *(_QWORD *)(v16 + 40) = v52;
    *(_BYTE *)(v16 + 52) = v53;
    *(_BYTE *)(v16 + 53) = v54;
    *(_BYTE *)(v16 + 54) = v55;
    *(_BYTE *)(v16 + 55) = v56;
    *(_BYTE *)(v16 + 56) = v57;
    *(_BYTE *)(v16 + 57) = v58;
    *(_BYTE *)(v16 + 58) = v59;
    *(_BYTE *)(v16 + 59) = v60;
    *(_QWORD *)(v16 + 72) = v61;
    *(_BYTE *)(v16 + 112) = v62;
    *(_BYTE *)(v16 + 144) = v63;
    *(_BYTE *)(v16 + 145) = v64;
    *(_BYTE *)(v16 + 146) = v65;
    *(_QWORD *)(v16 + 152) = v66;
    *(_BYTE *)(v16 + 160) = v67;
    *(_BYTE *)(v16 + 224) = v68;
    *(_BYTE *)(v16 + 225) = v69;
    *(_BYTE *)(v16 + 226) = v70;
    *(_BYTE *)(v16 + 227) = v71;
    *(_QWORD *)(v16 + 264) = v73;
    *(_QWORD *)(v16 + 272) = v72;
    *(_QWORD *)(v16 + 8) = v26;
    *(_QWORD *)(v16 + 16) = v25;
    *(_QWORD *)(v16 + 24) = v27;
    *(_DWORD *)(v16 + 48) = v29;
    *(_QWORD *)(v16 + 64) = v30;
    *(_QWORD *)(v16 + 80) = v32;
    *(_QWORD *)(v16 + 88) = v31;
    *(_OWORD *)(v16 + 96) = v74;
    *(_QWORD *)(v16 + 120) = v79;
    *(_QWORD *)(v16 + 128) = v75;
    *(_QWORD *)(v16 + 136) = v33;
    *(_OWORD *)(v16 + 168) = v76;
    *(_OWORD *)(v16 + 184) = v78;
    *(_QWORD *)(v16 + 200) = v83;
    *(_QWORD *)(v16 + 208) = v80;
    *(_QWORD *)(v16 + 216) = v77;
    *(_OWORD *)(v16 + 232) = v81;
    *(_OWORD *)(v16 + 248) = v82;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v47;
  v35 = v49;
  if ((v51 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v46 = 1 << *(_BYTE *)(v5 + 32);
  if (v46 >= 64)
    bzero(v35, ((unint64_t)(v46 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v35 = -1 << v46;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_227581B50(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  char v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  char v31;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5B18);
  result = sub_22758ED0C();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v31 = a2;
    v8 = 0;
    v9 = (_QWORD *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v17 = v16 | (v8 << 6);
      }
      else
      {
        v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v18 >= v13)
          goto LABEL_31;
        v19 = v9[v18];
        ++v8;
        if (!v19)
        {
          v8 = v18 + 1;
          if (v18 + 1 >= v13)
            goto LABEL_31;
          v19 = v9[v8];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v13)
            {
LABEL_31:
              if ((v31 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_38;
              }
              v30 = 1 << *(_BYTE *)(v5 + 32);
              if (v30 >= 64)
                bzero((void *)(v5 + 64), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v9 = -1 << v30;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v19 = v9[v20];
            if (!v19)
            {
              while (1)
              {
                v8 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_40;
                if (v8 >= v13)
                  goto LABEL_31;
                v19 = v9[v8];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v8 = v20;
          }
        }
LABEL_21:
        v12 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      v21 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v17);
      v22 = *(_DWORD *)(*(_QWORD *)(v5 + 56) + 4 * v17);
      sub_22758EF4C();
      sub_22758EF58();
      result = sub_22758EF88();
      v23 = -1 << *(_BYTE *)(v7 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v28 = v25 == v27;
          if (v25 == v27)
            v25 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(_QWORD *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_BYTE *)(*(_QWORD *)(v7 + 48) + v15) = v21;
      *(_DWORD *)(*(_QWORD *)(v7 + 56) + 4 * v15) = v22;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

uint64_t sub_227581E18(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5AC0);
  v42 = a2;
  v6 = sub_22758ED0C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_22758EF4C();
    sub_22758E274();
    result = sub_22758EF88();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_22758213C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF3B0);
  v36 = a2;
  v6 = sub_22758ED0C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_22758EF4C();
    sub_22758E274();
    result = sub_22758EF88();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_227582450(uint64_t a1, int a2)
{
  return sub_22758245C(a1, a2, &qword_2558D7548);
}

uint64_t sub_22758245C(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t result;
  int64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  unint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  int64_t v44;
  _QWORD *v45;
  uint64_t i;
  int v47;

  v5 = v3;
  v7 = sub_22758C984();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9, v10, v11, v12);
  v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v47 = a2;
  v16 = sub_22758ED0C();
  v17 = v16;
  if (*(_QWORD *)(v15 + 16))
  {
    v43 = v3;
    v18 = 1 << *(_BYTE *)(v15 + 32);
    v19 = *(_QWORD *)(v15 + 64);
    v45 = (_QWORD *)(v15 + 64);
    if (v18 < 64)
      v20 = ~(-1 << v18);
    else
      v20 = -1;
    v21 = v20 & v19;
    v44 = (unint64_t)(v18 + 63) >> 6;
    v22 = v16 + 64;
    result = swift_retain();
    v24 = 0;
    for (i = v15; ; v15 = i)
    {
      if (v21)
      {
        v26 = __clz(__rbit64(v21));
        v21 &= v21 - 1;
        v27 = v26 | (v24 << 6);
      }
      else
      {
        v28 = v24 + 1;
        if (__OFADD__(v24, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v28 >= v44)
          goto LABEL_34;
        v29 = v45[v28];
        ++v24;
        if (!v29)
        {
          v24 = v28 + 1;
          if (v28 + 1 >= v44)
            goto LABEL_34;
          v29 = v45[v24];
          if (!v29)
          {
            v30 = v28 + 2;
            if (v30 >= v44)
            {
LABEL_34:
              swift_release();
              v5 = v43;
              if ((v47 & 1) != 0)
              {
                v41 = 1 << *(_BYTE *)(v15 + 32);
                if (v41 >= 64)
                  bzero(v45, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v45 = -1 << v41;
                *(_QWORD *)(v15 + 16) = 0;
              }
              break;
            }
            v29 = v45[v30];
            if (!v29)
            {
              while (1)
              {
                v24 = v30 + 1;
                if (__OFADD__(v30, 1))
                  goto LABEL_41;
                if (v24 >= v44)
                  goto LABEL_34;
                v29 = v45[v24];
                ++v30;
                if (v29)
                  goto LABEL_21;
              }
            }
            v24 = v30;
          }
        }
LABEL_21:
        v21 = (v29 - 1) & v29;
        v27 = __clz(__rbit64(v29)) + (v24 << 6);
      }
      v31 = *(_QWORD *)(v8 + 72);
      v32 = *(_QWORD *)(v15 + 48) + v31 * v27;
      if ((v47 & 1) != 0)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v8 + 32))(v14, v32, v7);
        v33 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v27);
      }
      else
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v14, v32, v7);
        v33 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v27);
        swift_bridgeObjectRetain();
      }
      sub_22733838C();
      result = sub_22758E130();
      v34 = -1 << *(_BYTE *)(v17 + 32);
      v35 = result & ~v34;
      v36 = v35 >> 6;
      if (((-1 << v35) & ~*(_QWORD *)(v22 + 8 * (v35 >> 6))) != 0)
      {
        v25 = __clz(__rbit64((-1 << v35) & ~*(_QWORD *)(v22 + 8 * (v35 >> 6)))) | v35 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v37 = 0;
        v38 = (unint64_t)(63 - v34) >> 6;
        do
        {
          if (++v36 == v38 && (v37 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v39 = v36 == v38;
          if (v36 == v38)
            v36 = 0;
          v37 |= v39;
          v40 = *(_QWORD *)(v22 + 8 * v36);
        }
        while (v40 == -1);
        v25 = __clz(__rbit64(~v40)) + (v36 << 6);
      }
      *(_QWORD *)(v22 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v8 + 32))(*(_QWORD *)(v17 + 48) + v31 * v25, v14, v7);
      *(_QWORD *)(*(_QWORD *)(v17 + 56) + 8 * v25) = v33;
      ++*(_QWORD *)(v17 + 16);
    }
  }
  result = swift_release();
  *v5 = v17;
  return result;
}

uint64_t sub_2275827C8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t result;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540BA1D0);
  v6 = sub_22758ED0C();
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_28;
  v7 = 1 << *(_BYTE *)(v5 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v5 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  swift_retain();
  if (v9)
  {
    v11 = __clz(__rbit64(v9));
    goto LABEL_18;
  }
  if (v10 <= 1)
  {
    swift_release();
    v12 = (_QWORD *)(v5 + 64);
    if ((a2 & 1) == 0)
      goto LABEL_28;
    goto LABEL_24;
  }
  v12 = (_QWORD *)(v5 + 64);
  v13 = *(_QWORD *)(v5 + 72);
  v14 = 1;
  if (v13)
    goto LABEL_17;
  v14 = 2;
  if (v10 <= 2)
    goto LABEL_21;
  v13 = *(_QWORD *)(v5 + 80);
  if (v13)
  {
LABEL_17:
    v11 = __clz(__rbit64(v13)) + (v14 << 6);
LABEL_18:
    v16 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 48) + v11);
    if ((a2 & 1) == 0)
      v17 = *(id *)(*(_QWORD *)(v5 + 56) + 16 * v11);
    sub_22758EF4C();
    __asm { BR              X8 }
  }
  v15 = 3;
  if (v10 > 3)
  {
    v13 = *(_QWORD *)(v5 + 88);
    if (v13)
    {
      v14 = 3;
      goto LABEL_17;
    }
    while (1)
    {
      v14 = v15 + 1;
      if (__OFADD__(v15, 1))
      {
        __break(1u);
        JUMPOUT(0x227582CE4);
      }
      if (v14 >= v10)
        break;
      v13 = *(_QWORD *)(v5 + 64 + 8 * v14);
      ++v15;
      if (v13)
        goto LABEL_17;
    }
  }
LABEL_21:
  swift_release();
  if ((a2 & 1) == 0)
    goto LABEL_28;
LABEL_24:
  v18 = 1 << *(_BYTE *)(v5 + 32);
  if (v18 >= 64)
    bzero(v12, ((unint64_t)(v18 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v12 = -1 << v18;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_28:
  result = swift_release();
  *v3 = v6;
  return result;
}

uint64_t sub_227582D28(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5B60);
  v6 = sub_22758ED0C();
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_28;
  v7 = 1 << *(_BYTE *)(v5 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v5 + 64);
  v19 = (unint64_t)(v7 + 63) >> 6;
  swift_retain();
  if (v9)
  {
    v10 = __clz(__rbit64(v9));
    goto LABEL_18;
  }
  if (v19 <= 1)
  {
    swift_release();
    v11 = (_QWORD *)(v5 + 64);
    if ((a2 & 1) == 0)
      goto LABEL_28;
    goto LABEL_24;
  }
  v11 = (_QWORD *)(v5 + 64);
  v12 = *(_QWORD *)(v5 + 72);
  v13 = 1;
  if (v12)
    goto LABEL_17;
  v13 = 2;
  if (v19 <= 2)
    goto LABEL_21;
  v12 = *(_QWORD *)(v5 + 80);
  if (v12)
  {
LABEL_17:
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
LABEL_18:
    v15 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 48) + v10);
    if ((a2 & 1) == 0)
      v16 = *(id *)(*(_QWORD *)(v5 + 56) + 8 * v10);
    sub_22758EF4C();
    __asm { BR              X8 }
  }
  v14 = 3;
  if (v19 > 3)
  {
    v12 = *(_QWORD *)(v5 + 88);
    if (v12)
    {
      v13 = 3;
      goto LABEL_17;
    }
    while (1)
    {
      v13 = v14 + 1;
      if (__OFADD__(v14, 1))
      {
        __break(1u);
        JUMPOUT(0x2275831DCLL);
      }
      if (v13 >= v19)
        break;
      v12 = *(_QWORD *)(v5 + 64 + 8 * v13);
      ++v14;
      if (v12)
        goto LABEL_17;
    }
  }
LABEL_21:
  swift_release();
  if ((a2 & 1) == 0)
    goto LABEL_28;
LABEL_24:
  v17 = 1 << *(_BYTE *)(v5 + 32);
  if (v17 >= 64)
    bzero(v11, ((unint64_t)(v17 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v11 = -1 << v17;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_28:
  result = swift_release();
  *v3 = v6;
  return result;
}

uint64_t sub_227583214(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5AF0);
  v42 = a2;
  v6 = sub_22758ED0C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = *(_QWORD *)(v5 + 56) + v31;
    v36 = *(_QWORD *)v35;
    v37 = *(_DWORD *)(v35 + 8);
    if ((v42 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_22758EF4C();
    sub_22758E274();
    result = sub_22758EF88();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = *(_QWORD *)(v7 + 56) + v18;
    *(_QWORD *)v20 = v36;
    *(_DWORD *)(v20 + 8) = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_22758353C(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  _QWORD *v37;
  __int128 v38;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v7 = a2;
  v8 = sub_22758ED0C();
  v9 = v8;
  if (*(_QWORD *)(v6 + 16))
  {
    v10 = 1 << *(_BYTE *)(v6 + 32);
    v37 = (_QWORD *)(v6 + 64);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v6 + 64);
    v36 = (unint64_t)(v10 + 63) >> 6;
    v13 = v8 + 64;
    result = swift_retain();
    v15 = 0;
    while (1)
    {
      if (v12)
      {
        v22 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v23 = v22 | (v15 << 6);
      }
      else
      {
        v24 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v24 >= v36)
          goto LABEL_33;
        v25 = v37[v24];
        ++v15;
        if (!v25)
        {
          v15 = v24 + 1;
          if (v24 + 1 >= v36)
            goto LABEL_33;
          v25 = v37[v15];
          if (!v25)
          {
            v26 = v24 + 2;
            if (v26 >= v36)
            {
LABEL_33:
              swift_release();
              v4 = v3;
              if ((v7 & 1) != 0)
              {
                v35 = 1 << *(_BYTE *)(v6 + 32);
                if (v35 >= 64)
                  bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v37 = -1 << v35;
                *(_QWORD *)(v6 + 16) = 0;
              }
              break;
            }
            v25 = v37[v26];
            if (!v25)
            {
              while (1)
              {
                v15 = v26 + 1;
                if (__OFADD__(v26, 1))
                  goto LABEL_40;
                if (v15 >= v36)
                  goto LABEL_33;
                v25 = v37[v15];
                ++v26;
                if (v25)
                  goto LABEL_30;
              }
            }
            v15 = v26;
          }
        }
LABEL_30:
        v12 = (v25 - 1) & v25;
        v23 = __clz(__rbit64(v25)) + (v15 << 6);
      }
      v31 = 16 * v23;
      v32 = (uint64_t *)(*(_QWORD *)(v6 + 48) + v31);
      v34 = *v32;
      v33 = v32[1];
      v38 = *(_OWORD *)(*(_QWORD *)(v6 + 56) + v31);
      if ((v7 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_retain();
      }
      sub_22758EF4C();
      sub_22758E274();
      result = sub_22758EF88();
      v16 = -1 << *(_BYTE *)(v9 + 32);
      v17 = result & ~v16;
      v18 = v17 >> 6;
      if (((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v29 = v18 == v28;
          if (v18 == v28)
            v18 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v13 + 8 * v18);
        }
        while (v30 == -1);
        v19 = __clz(__rbit64(~v30)) + (v18 << 6);
      }
      *(_QWORD *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      v20 = 16 * v19;
      v21 = (_QWORD *)(*(_QWORD *)(v9 + 48) + v20);
      *v21 = v34;
      v21[1] = v33;
      *(_OWORD *)(*(_QWORD *)(v9 + 56) + v20) = v38;
      ++*(_QWORD *)(v9 + 16);
    }
  }
  result = swift_release();
  *v4 = v9;
  return result;
}

uint64_t sub_227583840(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540BA1D8);
  v6 = sub_22758ED0C();
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_28;
  v7 = 1 << *(_BYTE *)(v5 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v5 + 64);
  v18 = (unint64_t)(v7 + 63) >> 6;
  swift_retain();
  if (v9)
  {
    v10 = __clz(__rbit64(v9));
    goto LABEL_18;
  }
  if (v18 <= 1)
  {
    swift_release();
    v11 = (_QWORD *)(v5 + 64);
    if ((a2 & 1) == 0)
      goto LABEL_28;
    goto LABEL_24;
  }
  v11 = (_QWORD *)(v5 + 64);
  v12 = *(_QWORD *)(v5 + 72);
  v13 = 1;
  if (v12)
    goto LABEL_17;
  v13 = 2;
  if (v18 <= 2)
    goto LABEL_21;
  v12 = *(_QWORD *)(v5 + 80);
  if (v12)
  {
LABEL_17:
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
LABEL_18:
    v15 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 48) + v10);
    if ((a2 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_22758EF4C();
    __asm { BR              X8 }
  }
  v14 = 3;
  if (v18 > 3)
  {
    v12 = *(_QWORD *)(v5 + 88);
    if (v12)
    {
      v13 = 3;
      goto LABEL_17;
    }
    while (1)
    {
      v13 = v14 + 1;
      if (__OFADD__(v14, 1))
      {
        __break(1u);
        JUMPOUT(0x227583D58);
      }
      if (v13 >= v18)
        break;
      v12 = *(_QWORD *)(v5 + 64 + 8 * v13);
      ++v14;
      if (v12)
        goto LABEL_17;
    }
  }
LABEL_21:
  swift_release();
  if ((a2 & 1) == 0)
    goto LABEL_28;
LABEL_24:
  v16 = 1 << *(_BYTE *)(v5 + 32);
  if (v16 >= 64)
    bzero(v11, ((unint64_t)(v16 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v11 = -1 << v16;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_28:
  result = swift_release();
  *v3 = v6;
  return result;
}

uint64_t sub_227583D9C(uint64_t a1, int a2, uint64_t (*a3)(_QWORD), uint64_t (*a4)(_QWORD), uint64_t *a5)
{
  uint64_t *v5;
  uint64_t *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __n128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t result;
  int64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  int64_t v37;
  _QWORD *v38;
  unint64_t v39;
  int64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  char v47;
  unint64_t v48;
  BOOL v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  int64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t (*v59)(_QWORD);
  uint64_t (*v60)(_QWORD);

  v8 = v5;
  v59 = a3;
  v10 = a3(0);
  v55 = *(_QWORD *)(v10 - 8);
  v15 = MEMORY[0x24BDAC7A8](v10, v11, v12, v13, v14);
  v58 = (uint64_t)&v52 - v16;
  v60 = a4;
  v17 = ((uint64_t (*)(_QWORD, __n128))a4)(0, v15);
  v56 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17, v18, v19, v20, v21);
  v23 = (char *)&v52 - v22;
  v24 = *v5;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v57 = a2;
  v25 = sub_22758ED0C();
  v26 = v25;
  if (!*(_QWORD *)(v24 + 16))
    goto LABEL_41;
  v27 = 1 << *(_BYTE *)(v24 + 32);
  v28 = *(_QWORD *)(v24 + 64);
  v54 = (_QWORD *)(v24 + 64);
  if (v27 < 64)
    v29 = ~(-1 << v27);
  else
    v29 = -1;
  v30 = v29 & v28;
  v52 = v5;
  v53 = (unint64_t)(v27 + 63) >> 6;
  v31 = v25 + 64;
  result = swift_retain();
  v33 = 0;
  while (1)
  {
    if (v30)
    {
      v35 = __clz(__rbit64(v30));
      v30 &= v30 - 1;
      v36 = v35 | (v33 << 6);
      goto LABEL_22;
    }
    v37 = v33 + 1;
    if (__OFADD__(v33, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v37 >= v53)
      break;
    v38 = v54;
    v39 = v54[v37];
    ++v33;
    if (!v39)
    {
      v33 = v37 + 1;
      if (v37 + 1 >= v53)
        goto LABEL_34;
      v39 = v54[v33];
      if (!v39)
      {
        v40 = v37 + 2;
        if (v40 >= v53)
        {
LABEL_34:
          swift_release();
          v8 = v52;
          if ((v57 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v39 = v54[v40];
        if (!v39)
        {
          while (1)
          {
            v33 = v40 + 1;
            if (__OFADD__(v40, 1))
              goto LABEL_43;
            if (v33 >= v53)
              goto LABEL_34;
            v39 = v54[v33];
            ++v40;
            if (v39)
              goto LABEL_21;
          }
        }
        v33 = v40;
      }
    }
LABEL_21:
    v30 = (v39 - 1) & v39;
    v36 = __clz(__rbit64(v39)) + (v33 << 6);
LABEL_22:
    v41 = *(_QWORD *)(v56 + 72);
    v42 = *(_QWORD *)(v24 + 48) + v41 * v36;
    if ((v57 & 1) != 0)
    {
      sub_22730DFEC(v42, (uint64_t)v23, v60);
      v43 = *(_QWORD *)(v55 + 72);
      sub_22730DFEC(*(_QWORD *)(v24 + 56) + v43 * v36, v58, v59);
    }
    else
    {
      sub_22730DEEC(v42, (uint64_t)v23, v60);
      v43 = *(_QWORD *)(v55 + 72);
      sub_22730DEEC(*(_QWORD *)(v24 + 56) + v43 * v36, v58, v59);
    }
    sub_22758EF4C();
    sub_22758C984();
    sub_22733838C();
    sub_22758E13C();
    result = sub_22758EF88();
    v44 = -1 << *(_BYTE *)(v26 + 32);
    v45 = result & ~v44;
    v46 = v45 >> 6;
    if (((-1 << v45) & ~*(_QWORD *)(v31 + 8 * (v45 >> 6))) != 0)
    {
      v34 = __clz(__rbit64((-1 << v45) & ~*(_QWORD *)(v31 + 8 * (v45 >> 6)))) | v45 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v47 = 0;
      v48 = (unint64_t)(63 - v44) >> 6;
      do
      {
        if (++v46 == v48 && (v47 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v49 = v46 == v48;
        if (v46 == v48)
          v46 = 0;
        v47 |= v49;
        v50 = *(_QWORD *)(v31 + 8 * v46);
      }
      while (v50 == -1);
      v34 = __clz(__rbit64(~v50)) + (v46 << 6);
    }
    *(_QWORD *)(v31 + ((v34 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v34;
    sub_22730DFEC((uint64_t)v23, *(_QWORD *)(v26 + 48) + v41 * v34, v60);
    result = sub_22730DFEC(v58, *(_QWORD *)(v26 + 56) + v43 * v34, v59);
    ++*(_QWORD *)(v26 + 16);
  }
  swift_release();
  v8 = v52;
  v38 = v54;
  if ((v57 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v51 = 1 << *(_BYTE *)(v24 + 32);
  if (v51 >= 64)
    bzero(v38, ((unint64_t)(v51 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v38 = -1 << v51;
  *(_QWORD *)(v24 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v8 = v26;
  return result;
}

uint64_t sub_227584188(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t result;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  uint64_t v43;
  int v44;

  v3 = v2;
  v5 = type metadata accessor for DetectedTextBlock();
  v43 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v6, v7, v8, v9);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF3C0);
  v44 = a2;
  v13 = sub_22758ED0C();
  v14 = v13;
  if (!*(_QWORD *)(v12 + 16))
    goto LABEL_41;
  v15 = 1 << *(_BYTE *)(v12 + 32);
  v16 = *(_QWORD *)(v12 + 64);
  v42 = (_QWORD *)(v12 + 64);
  if (v15 < 64)
    v17 = ~(-1 << v15);
  else
    v17 = -1;
  v18 = v17 & v16;
  v40 = v2;
  v41 = (unint64_t)(v15 + 63) >> 6;
  v19 = v13 + 64;
  result = swift_retain();
  v21 = 0;
  while (1)
  {
    if (v18)
    {
      v23 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v24 = v23 | (v21 << 6);
      goto LABEL_22;
    }
    v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v41)
      break;
    v26 = v42;
    v27 = v42[v25];
    ++v21;
    if (!v27)
    {
      v21 = v25 + 1;
      if (v25 + 1 >= v41)
        goto LABEL_34;
      v27 = v42[v21];
      if (!v27)
      {
        v28 = v25 + 2;
        if (v28 >= v41)
        {
LABEL_34:
          swift_release();
          v3 = v40;
          if ((v44 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v27 = v42[v28];
        if (!v27)
        {
          while (1)
          {
            v21 = v28 + 1;
            if (__OFADD__(v28, 1))
              goto LABEL_43;
            if (v21 >= v41)
              goto LABEL_34;
            v27 = v42[v21];
            ++v28;
            if (v27)
              goto LABEL_21;
          }
        }
        v21 = v28;
      }
    }
LABEL_21:
    v18 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v21 << 6);
LABEL_22:
    v29 = *(_QWORD *)(v43 + 72);
    v30 = *(_QWORD *)(v12 + 48) + v29 * v24;
    if ((v44 & 1) != 0)
    {
      sub_22730DFEC(v30, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
      v31 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v24);
    }
    else
    {
      sub_22730DEEC(v30, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
      v31 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v24);
      swift_bridgeObjectRetain();
    }
    sub_22758EF4C();
    sub_22758C984();
    sub_22733838C();
    sub_22758E13C();
    result = sub_22758EF88();
    v32 = -1 << *(_BYTE *)(v14 + 32);
    v33 = result & ~v32;
    v34 = v33 >> 6;
    if (((-1 << v33) & ~*(_QWORD *)(v19 + 8 * (v33 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v33) & ~*(_QWORD *)(v19 + 8 * (v33 >> 6)))) | v33 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v35 = 0;
      v36 = (unint64_t)(63 - v32) >> 6;
      do
      {
        if (++v34 == v36 && (v35 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v37 = v34 == v36;
        if (v34 == v36)
          v34 = 0;
        v35 |= v37;
        v38 = *(_QWORD *)(v19 + 8 * v34);
      }
      while (v38 == -1);
      v22 = __clz(__rbit64(~v38)) + (v34 << 6);
    }
    *(_QWORD *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    result = sub_22730DFEC((uint64_t)v11, *(_QWORD *)(v14 + 48) + v29 * v22, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
    *(_QWORD *)(*(_QWORD *)(v14 + 56) + 8 * v22) = v31;
    ++*(_QWORD *)(v14 + 16);
  }
  swift_release();
  v3 = v40;
  v26 = v42;
  if ((v44 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v39 = 1 << *(_BYTE *)(v12 + 32);
  if (v39 >= 64)
    bzero(v26, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v26 = -1 << v39;
  *(_QWORD *)(v12 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v14;
  return result;
}

uint64_t sub_22758452C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  return sub_2275867B4(a1, a2, a3, a4, a5, &qword_2558D5B00);
}

uint64_t type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(uint64_t a1)
{
  return sub_22733978C(a1, qword_2558DF2D8);
}

uint64_t type metadata accessor for MAGPointAndSpeakEvent(uint64_t a1)
{
  return sub_22733978C(a1, qword_2558DF230);
}

_OWORD *initializeBufferWithCopyOfBuffer for MAGPointAndSpeakEvent(_OWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  __int128 v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  _OWORD *v35;
  _OWORD *v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  _OWORD *v40;
  _OWORD *v41;
  __int128 v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;

  v4 = *(_QWORD *)(type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(0) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (_OWORD *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v6 = sub_22758CFCC();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
        v9 = a2[1];
        *a1 = *a2;
        a1[1] = v9;
        v10 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_2558D55C0);
        v11 = v10[12];
        v12 = (char *)a1 + v11;
        v13 = (char *)a2 + v11;
        v14 = sub_22758C984();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
        v15 = (int *)type metadata accessor for DetectedTextBlock();
        *(_QWORD *)&v12[v15[5]] = *(_QWORD *)&v13[v15[5]];
        v16 = v15[6];
        v17 = &v12[v16];
        v18 = &v13[v16];
        v19 = *((_OWORD *)v18 + 1);
        *(_OWORD *)v17 = *(_OWORD *)v18;
        *((_OWORD *)v17 + 1) = v19;
        *(_QWORD *)&v12[v15[7]] = *(_QWORD *)&v13[v15[7]];
        v12[v15[8]] = v13[v15[8]];
        v20 = v15[9];
        v21 = *(void **)&v13[v20];
        *(_QWORD *)&v12[v20] = v21;
        v22 = v10[16];
        v23 = *(void **)((char *)a2 + v22);
        *(_QWORD *)((char *)a1 + v22) = v23;
        v24 = v10[20];
        v25 = *(void **)((char *)a2 + v24);
        *(_QWORD *)((char *)a1 + v24) = v25;
        v26 = v10[24];
        v27 = *(void **)((char *)a2 + v26);
        *(_QWORD *)((char *)a1 + v26) = v27;
        *(_QWORD *)((char *)a1 + v10[28]) = *(_QWORD *)((char *)a2 + v10[28]);
        *((_BYTE *)a1 + v10[32]) = *((_BYTE *)a2 + v10[32]);
        swift_bridgeObjectRetain();
        v28 = v21;
        v29 = v23;
        v30 = v25;
        v31 = v27;
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        v32 = sub_22758C984();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(a1, a2, v32);
        v33 = (int *)type metadata accessor for SpatialTextBlock();
        *(_OWORD *)((char *)a1 + v33[5]) = *(_OWORD *)((char *)a2 + v33[5]);
        *(_OWORD *)((char *)a1 + v33[6]) = *(_OWORD *)((char *)a2 + v33[6]);
        *(_OWORD *)((char *)a1 + v33[7]) = *(_OWORD *)((char *)a2 + v33[7]);
        *(_OWORD *)((char *)a1 + v33[8]) = *(_OWORD *)((char *)a2 + v33[8]);
        v34 = v33[9];
        v35 = (_OWORD *)((char *)a1 + v34);
        v36 = (_OWORD *)((char *)a2 + v34);
        v37 = v36[1];
        *v35 = *v36;
        v35[1] = v37;
        v38 = v36[3];
        v35[2] = v36[2];
        v35[3] = v38;
        *(_DWORD *)((char *)a1 + v33[10]) = *(_DWORD *)((char *)a2 + v33[10]);
        *(_QWORD *)((char *)a1 + v33[11]) = *(_QWORD *)((char *)a2 + v33[11]);
        v39 = v33[12];
        v40 = (_OWORD *)((char *)a1 + v39);
        v41 = (_OWORD *)((char *)a2 + v39);
        v42 = v41[1];
        *v40 = *v41;
        v40[1] = v42;
        *(_QWORD *)((char *)a1 + v33[13]) = *(_QWORD *)((char *)a2 + v33[13]);
        *((_BYTE *)a1 + v33[14]) = *((_BYTE *)a2 + v33[14]);
        v43 = v33[15];
        v44 = *(void **)((char *)a2 + v43);
        *(_QWORD *)((char *)a1 + v43) = v44;
        swift_bridgeObjectRetain();
        v45 = v44;
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        v46 = *((_QWORD *)a2 + 1);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *((_QWORD *)a1 + 1) = v46;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v4 + 64));
        break;
    }
  }
  return a1;
}

void destroy for MAGPointAndSpeakEvent(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v2 = sub_22758CFCC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
      break;
    case 1u:
      v3 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_2558D55C0);
      v4 = a1 + v3[12];
      v5 = sub_22758C984();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
      v6 = type metadata accessor for DetectedTextBlock();
      swift_bridgeObjectRelease();

      v7 = v3[24];
      goto LABEL_5;
    case 2u:
      v8 = sub_22758C984();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
      v9 = type metadata accessor for SpatialTextBlock();
      swift_bridgeObjectRelease();
      v7 = *(int *)(v9 + 60);
LABEL_5:

      break;
    case 3u:
    case 4u:
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

_OWORD *initializeWithCopy for MAGPointAndSpeakEvent(_OWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  int *v30;
  uint64_t v31;
  _OWORD *v32;
  _OWORD *v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _OWORD *v37;
  _OWORD *v38;
  __int128 v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;

  v4 = type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v5 = sub_22758CFCC();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
      goto LABEL_8;
    case 1u:
      v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_2558D55C0);
      v8 = v7[12];
      v9 = (char *)a1 + v8;
      v10 = (char *)a2 + v8;
      v11 = sub_22758C984();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
      v12 = (int *)type metadata accessor for DetectedTextBlock();
      *(_QWORD *)&v9[v12[5]] = *(_QWORD *)&v10[v12[5]];
      v13 = v12[6];
      v14 = &v9[v13];
      v15 = &v10[v13];
      v16 = *((_OWORD *)v15 + 1);
      *(_OWORD *)v14 = *(_OWORD *)v15;
      *((_OWORD *)v14 + 1) = v16;
      *(_QWORD *)&v9[v12[7]] = *(_QWORD *)&v10[v12[7]];
      v9[v12[8]] = v10[v12[8]];
      v17 = v12[9];
      v18 = *(void **)&v10[v17];
      *(_QWORD *)&v9[v17] = v18;
      v19 = v7[16];
      v20 = *(void **)((char *)a2 + v19);
      *(_QWORD *)((char *)a1 + v19) = v20;
      v21 = v7[20];
      v22 = *(void **)((char *)a2 + v21);
      *(_QWORD *)((char *)a1 + v21) = v22;
      v23 = v7[24];
      v24 = *(void **)((char *)a2 + v23);
      *(_QWORD *)((char *)a1 + v23) = v24;
      *(_QWORD *)((char *)a1 + v7[28]) = *(_QWORD *)((char *)a2 + v7[28]);
      *((_BYTE *)a1 + v7[32]) = *((_BYTE *)a2 + v7[32]);
      swift_bridgeObjectRetain();
      v25 = v18;
      v26 = v20;
      v27 = v22;
      v28 = v24;
      goto LABEL_8;
    case 2u:
      v29 = sub_22758C984();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(a1, a2, v29);
      v30 = (int *)type metadata accessor for SpatialTextBlock();
      *(_OWORD *)((char *)a1 + v30[5]) = *(_OWORD *)((char *)a2 + v30[5]);
      *(_OWORD *)((char *)a1 + v30[6]) = *(_OWORD *)((char *)a2 + v30[6]);
      *(_OWORD *)((char *)a1 + v30[7]) = *(_OWORD *)((char *)a2 + v30[7]);
      *(_OWORD *)((char *)a1 + v30[8]) = *(_OWORD *)((char *)a2 + v30[8]);
      v31 = v30[9];
      v32 = (_OWORD *)((char *)a1 + v31);
      v33 = (_OWORD *)((char *)a2 + v31);
      v34 = v33[1];
      *v32 = *v33;
      v32[1] = v34;
      v35 = v33[3];
      v32[2] = v33[2];
      v32[3] = v35;
      *(_DWORD *)((char *)a1 + v30[10]) = *(_DWORD *)((char *)a2 + v30[10]);
      *(_QWORD *)((char *)a1 + v30[11]) = *(_QWORD *)((char *)a2 + v30[11]);
      v36 = v30[12];
      v37 = (_OWORD *)((char *)a1 + v36);
      v38 = (_OWORD *)((char *)a2 + v36);
      v39 = v38[1];
      *v37 = *v38;
      v37[1] = v39;
      *(_QWORD *)((char *)a1 + v30[13]) = *(_QWORD *)((char *)a2 + v30[13]);
      *((_BYTE *)a1 + v30[14]) = *((_BYTE *)a2 + v30[14]);
      v40 = v30[15];
      v41 = *(void **)((char *)a2 + v40);
      *(_QWORD *)((char *)a1 + v40) = v41;
      swift_bridgeObjectRetain();
      v42 = v41;
      goto LABEL_8;
    case 3u:
      *(_QWORD *)a1 = *(_QWORD *)a2;
      swift_bridgeObjectRetain();
      goto LABEL_8;
    case 4u:
      v43 = *((_QWORD *)a2 + 1);
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *((_QWORD *)a1 + 1) = v43;
      swift_bridgeObjectRetain();
LABEL_8:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
      break;
  }
  return a1;
}

_OWORD *assignWithCopy for MAGPointAndSpeakEvent(_OWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  int *v30;
  uint64_t v31;
  _OWORD *v32;
  __int128 *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _OWORD *v38;
  _OWORD *v39;
  __int128 v40;
  uint64_t v41;
  void *v42;
  id v43;

  if (a1 != a2)
  {
    sub_22730DFB0((uint64_t)a1, type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType);
    v4 = type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v5 = sub_22758CFCC();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
        goto LABEL_9;
      case 1u:
        v6 = a2[1];
        *a1 = *a2;
        a1[1] = v6;
        v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_2558D55C0);
        v8 = v7[12];
        v9 = (char *)a1 + v8;
        v10 = (char *)a2 + v8;
        v11 = sub_22758C984();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
        v12 = (int *)type metadata accessor for DetectedTextBlock();
        *(_QWORD *)&v9[v12[5]] = *(_QWORD *)&v10[v12[5]];
        v13 = v12[6];
        v14 = &v9[v13];
        v15 = &v10[v13];
        v16 = *((_OWORD *)v15 + 1);
        *(_OWORD *)v14 = *(_OWORD *)v15;
        *((_OWORD *)v14 + 1) = v16;
        *(_QWORD *)&v9[v12[7]] = *(_QWORD *)&v10[v12[7]];
        v9[v12[8]] = v10[v12[8]];
        v17 = v12[9];
        v18 = *(void **)&v10[v17];
        *(_QWORD *)&v9[v17] = v18;
        v19 = v7[16];
        v20 = *(void **)((char *)a2 + v19);
        *(_QWORD *)((char *)a1 + v19) = v20;
        v21 = v7[20];
        v22 = *(void **)((char *)a2 + v21);
        *(_QWORD *)((char *)a1 + v21) = v22;
        v23 = v7[24];
        v24 = *(void **)((char *)a2 + v23);
        *(_QWORD *)((char *)a1 + v23) = v24;
        *(_QWORD *)((char *)a1 + v7[28]) = *(_QWORD *)((char *)a2 + v7[28]);
        *((_BYTE *)a1 + v7[32]) = *((_BYTE *)a2 + v7[32]);
        swift_bridgeObjectRetain();
        v25 = v18;
        v26 = v20;
        v27 = v22;
        v28 = v24;
        goto LABEL_9;
      case 2u:
        v29 = sub_22758C984();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(a1, a2, v29);
        v30 = (int *)type metadata accessor for SpatialTextBlock();
        *(_OWORD *)((char *)a1 + v30[5]) = *(_OWORD *)((char *)a2 + v30[5]);
        *(_OWORD *)((char *)a1 + v30[6]) = *(_OWORD *)((char *)a2 + v30[6]);
        *(_OWORD *)((char *)a1 + v30[7]) = *(_OWORD *)((char *)a2 + v30[7]);
        *(_OWORD *)((char *)a1 + v30[8]) = *(_OWORD *)((char *)a2 + v30[8]);
        v31 = v30[9];
        v32 = (_OWORD *)((char *)a1 + v31);
        v33 = (_OWORD *)((char *)a2 + v31);
        v34 = *v33;
        v35 = v33[1];
        v36 = v33[3];
        v32[2] = v33[2];
        v32[3] = v36;
        *v32 = v34;
        v32[1] = v35;
        *(_DWORD *)((char *)a1 + v30[10]) = *(_DWORD *)((char *)a2 + v30[10]);
        *(_QWORD *)((char *)a1 + v30[11]) = *(_QWORD *)((char *)a2 + v30[11]);
        v37 = v30[12];
        v38 = (_OWORD *)((char *)a1 + v37);
        v39 = (_OWORD *)((char *)a2 + v37);
        v40 = v39[1];
        *v38 = *v39;
        v38[1] = v40;
        *(_QWORD *)((char *)a1 + v30[13]) = *(_QWORD *)((char *)a2 + v30[13]);
        *((_BYTE *)a1 + v30[14]) = *((_BYTE *)a2 + v30[14]);
        v41 = v30[15];
        v42 = *(void **)((char *)a2 + v41);
        *(_QWORD *)((char *)a1 + v41) = v42;
        swift_bridgeObjectRetain();
        v43 = v42;
        goto LABEL_9;
      case 3u:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        swift_bridgeObjectRetain();
        goto LABEL_9;
      case 4u:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
        swift_bridgeObjectRetain();
LABEL_9:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
        break;
    }
  }
  return a1;
}

_OWORD *initializeWithTake for MAGPointAndSpeakEvent(_OWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  int EnumCaseMultiPayload;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  int *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  __int128 v28;

  v4 = type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(0);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v7 = sub_22758C984();
    (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    v8 = (int *)type metadata accessor for SpatialTextBlock();
    *(_OWORD *)((char *)a1 + v8[5]) = *(_OWORD *)((char *)a2 + v8[5]);
    *(_OWORD *)((char *)a1 + v8[6]) = *(_OWORD *)((char *)a2 + v8[6]);
    *(_OWORD *)((char *)a1 + v8[7]) = *(_OWORD *)((char *)a2 + v8[7]);
    *(_OWORD *)((char *)a1 + v8[8]) = *(_OWORD *)((char *)a2 + v8[8]);
    v9 = v8[9];
    v10 = (_OWORD *)((char *)a1 + v9);
    v11 = (_OWORD *)((char *)a2 + v9);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = v11[3];
    v10[2] = v11[2];
    v10[3] = v13;
    *(_DWORD *)((char *)a1 + v8[10]) = *(_DWORD *)((char *)a2 + v8[10]);
    *(_QWORD *)((char *)a1 + v8[11]) = *(_QWORD *)((char *)a2 + v8[11]);
    v14 = v8[12];
    v15 = (_OWORD *)((char *)a1 + v14);
    v16 = (_OWORD *)((char *)a2 + v14);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    *(_QWORD *)((char *)a1 + v8[13]) = *(_QWORD *)((char *)a2 + v8[13]);
    *((_BYTE *)a1 + v8[14]) = *((_BYTE *)a2 + v8[14]);
    *(_QWORD *)((char *)a1 + v8[15]) = *(_QWORD *)((char *)a2 + v8[15]);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 1)
  {
    v18 = a2[1];
    *a1 = *a2;
    a1[1] = v18;
    v19 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_2558D55C0);
    v20 = v19[12];
    v21 = (char *)a1 + v20;
    v22 = (char *)a2 + v20;
    v23 = sub_22758C984();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v21, v22, v23);
    v24 = (int *)type metadata accessor for DetectedTextBlock();
    *(_QWORD *)&v21[v24[5]] = *(_QWORD *)&v22[v24[5]];
    v25 = v24[6];
    v26 = &v21[v25];
    v27 = &v22[v25];
    v28 = *((_OWORD *)v27 + 1);
    *(_OWORD *)v26 = *(_OWORD *)v27;
    *((_OWORD *)v26 + 1) = v28;
    *(_QWORD *)&v21[v24[7]] = *(_QWORD *)&v22[v24[7]];
    v21[v24[8]] = v22[v24[8]];
    *(_QWORD *)&v21[v24[9]] = *(_QWORD *)&v22[v24[9]];
    *(_QWORD *)((char *)a1 + v19[16]) = *(_QWORD *)((char *)a2 + v19[16]);
    *(_QWORD *)((char *)a1 + v19[20]) = *(_QWORD *)((char *)a2 + v19[20]);
    *(_QWORD *)((char *)a1 + v19[24]) = *(_QWORD *)((char *)a2 + v19[24]);
    *(_QWORD *)((char *)a1 + v19[28]) = *(_QWORD *)((char *)a2 + v19[28]);
    *((_BYTE *)a1 + v19[32]) = *((_BYTE *)a2 + v19[32]);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  }
  else
  {
    v6 = sub_22758CFCC();
    (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *assignWithTake for MAGPointAndSpeakEvent(_OWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  int EnumCaseMultiPayload;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  int *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  __int128 v28;

  if (a1 != a2)
  {
    sub_22730DFB0((uint64_t)a1, type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType);
    v4 = type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v7 = sub_22758C984();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      v8 = (int *)type metadata accessor for SpatialTextBlock();
      *(_OWORD *)((char *)a1 + v8[5]) = *(_OWORD *)((char *)a2 + v8[5]);
      *(_OWORD *)((char *)a1 + v8[6]) = *(_OWORD *)((char *)a2 + v8[6]);
      *(_OWORD *)((char *)a1 + v8[7]) = *(_OWORD *)((char *)a2 + v8[7]);
      *(_OWORD *)((char *)a1 + v8[8]) = *(_OWORD *)((char *)a2 + v8[8]);
      v9 = v8[9];
      v10 = (_OWORD *)((char *)a1 + v9);
      v11 = (_OWORD *)((char *)a2 + v9);
      v12 = v11[1];
      *v10 = *v11;
      v10[1] = v12;
      v13 = v11[3];
      v10[2] = v11[2];
      v10[3] = v13;
      *(_DWORD *)((char *)a1 + v8[10]) = *(_DWORD *)((char *)a2 + v8[10]);
      *(_QWORD *)((char *)a1 + v8[11]) = *(_QWORD *)((char *)a2 + v8[11]);
      v14 = v8[12];
      v15 = (_OWORD *)((char *)a1 + v14);
      v16 = (_OWORD *)((char *)a2 + v14);
      v17 = v16[1];
      *v15 = *v16;
      v15[1] = v17;
      *(_QWORD *)((char *)a1 + v8[13]) = *(_QWORD *)((char *)a2 + v8[13]);
      *((_BYTE *)a1 + v8[14]) = *((_BYTE *)a2 + v8[14]);
      *(_QWORD *)((char *)a1 + v8[15]) = *(_QWORD *)((char *)a2 + v8[15]);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v18 = a2[1];
      *a1 = *a2;
      a1[1] = v18;
      v19 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_2558D55C0);
      v20 = v19[12];
      v21 = (char *)a1 + v20;
      v22 = (char *)a2 + v20;
      v23 = sub_22758C984();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v21, v22, v23);
      v24 = (int *)type metadata accessor for DetectedTextBlock();
      *(_QWORD *)&v21[v24[5]] = *(_QWORD *)&v22[v24[5]];
      v25 = v24[6];
      v26 = &v21[v25];
      v27 = &v22[v25];
      v28 = *((_OWORD *)v27 + 1);
      *(_OWORD *)v26 = *(_OWORD *)v27;
      *((_OWORD *)v26 + 1) = v28;
      *(_QWORD *)&v21[v24[7]] = *(_QWORD *)&v22[v24[7]];
      v21[v24[8]] = v22[v24[8]];
      *(_QWORD *)&v21[v24[9]] = *(_QWORD *)&v22[v24[9]];
      *(_QWORD *)((char *)a1 + v19[16]) = *(_QWORD *)((char *)a2 + v19[16]);
      *(_QWORD *)((char *)a1 + v19[20]) = *(_QWORD *)((char *)a2 + v19[20]);
      *(_QWORD *)((char *)a1 + v19[24]) = *(_QWORD *)((char *)a2 + v19[24]);
      *(_QWORD *)((char *)a1 + v19[28]) = *(_QWORD *)((char *)a2 + v19[28]);
      *((_BYTE *)a1 + v19[32]) = *((_BYTE *)a2 + v19[32]);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
    }
    else
    {
      v6 = sub_22758CFCC();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for MAGPointAndSpeakEvent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_227585464(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for MAGPointAndSpeakEvent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2275854AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_2275854EC()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_OWORD *initializeBufferWithCopyOfBuffer for MAGPointAndSpeakEvent.PointAndSpeakEventType(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  __int128 v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;
  _OWORD *v36;
  _OWORD *v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _OWORD *v41;
  _OWORD *v42;
  __int128 v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v8 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (_OWORD *)(v8 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v7 = sub_22758CFCC();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
        swift_storeEnumTagMultiPayload();
        break;
      case 1u:
        v10 = a2[1];
        *a1 = *a2;
        a1[1] = v10;
        v11 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_2558D55C0);
        v12 = v11[12];
        v13 = (char *)a1 + v12;
        v14 = (char *)a2 + v12;
        v15 = sub_22758C984();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
        v16 = (int *)type metadata accessor for DetectedTextBlock();
        *(_QWORD *)&v13[v16[5]] = *(_QWORD *)&v14[v16[5]];
        v17 = v16[6];
        v18 = &v13[v17];
        v19 = &v14[v17];
        v20 = *((_OWORD *)v19 + 1);
        *(_OWORD *)v18 = *(_OWORD *)v19;
        *((_OWORD *)v18 + 1) = v20;
        *(_QWORD *)&v13[v16[7]] = *(_QWORD *)&v14[v16[7]];
        v13[v16[8]] = v14[v16[8]];
        v21 = v16[9];
        v22 = *(void **)&v14[v21];
        *(_QWORD *)&v13[v21] = v22;
        v23 = v11[16];
        v24 = *(void **)((char *)a2 + v23);
        *(_QWORD *)((char *)a1 + v23) = v24;
        v25 = v11[20];
        v26 = *(void **)((char *)a2 + v25);
        *(_QWORD *)((char *)a1 + v25) = v26;
        v27 = v11[24];
        v28 = *(void **)((char *)a2 + v27);
        *(_QWORD *)((char *)a1 + v27) = v28;
        *(_QWORD *)((char *)a1 + v11[28]) = *(_QWORD *)((char *)a2 + v11[28]);
        *((_BYTE *)a1 + v11[32]) = *((_BYTE *)a2 + v11[32]);
        swift_bridgeObjectRetain();
        v29 = v22;
        v30 = v24;
        v31 = v26;
        v32 = v28;
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        v33 = sub_22758C984();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(a1, a2, v33);
        v34 = (int *)type metadata accessor for SpatialTextBlock();
        *(_OWORD *)((char *)a1 + v34[5]) = *(_OWORD *)((char *)a2 + v34[5]);
        *(_OWORD *)((char *)a1 + v34[6]) = *(_OWORD *)((char *)a2 + v34[6]);
        *(_OWORD *)((char *)a1 + v34[7]) = *(_OWORD *)((char *)a2 + v34[7]);
        *(_OWORD *)((char *)a1 + v34[8]) = *(_OWORD *)((char *)a2 + v34[8]);
        v35 = v34[9];
        v36 = (_OWORD *)((char *)a1 + v35);
        v37 = (_OWORD *)((char *)a2 + v35);
        v38 = v37[1];
        *v36 = *v37;
        v36[1] = v38;
        v39 = v37[3];
        v36[2] = v37[2];
        v36[3] = v39;
        *(_DWORD *)((char *)a1 + v34[10]) = *(_DWORD *)((char *)a2 + v34[10]);
        *(_QWORD *)((char *)a1 + v34[11]) = *(_QWORD *)((char *)a2 + v34[11]);
        v40 = v34[12];
        v41 = (_OWORD *)((char *)a1 + v40);
        v42 = (_OWORD *)((char *)a2 + v40);
        v43 = v42[1];
        *v41 = *v42;
        v41[1] = v43;
        *(_QWORD *)((char *)a1 + v34[13]) = *(_QWORD *)((char *)a2 + v34[13]);
        *((_BYTE *)a1 + v34[14]) = *((_BYTE *)a2 + v34[14]);
        v44 = v34[15];
        v45 = *(void **)((char *)a2 + v44);
        *(_QWORD *)((char *)a1 + v44) = v45;
        swift_bridgeObjectRetain();
        v46 = v45;
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 4u:
        v47 = *((_QWORD *)a2 + 1);
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *((_QWORD *)a1 + 1) = v47;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

void destroy for MAGPointAndSpeakEvent.PointAndSpeakEventType(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v2 = sub_22758CFCC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
      break;
    case 1u:
      v3 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_2558D55C0);
      v4 = a1 + v3[12];
      v5 = sub_22758C984();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
      v6 = type metadata accessor for DetectedTextBlock();
      swift_bridgeObjectRelease();

      v7 = v3[24];
      goto LABEL_5;
    case 2u:
      v8 = sub_22758C984();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
      v9 = type metadata accessor for SpatialTextBlock();
      swift_bridgeObjectRelease();
      v7 = *(int *)(v9 + 60);
LABEL_5:

      break;
    case 3u:
    case 4u:
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

_OWORD *initializeWithCopy for MAGPointAndSpeakEvent.PointAndSpeakEventType(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  __int128 v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  int *v31;
  uint64_t v32;
  _OWORD *v33;
  _OWORD *v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _OWORD *v38;
  _OWORD *v39;
  __int128 v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v6 = sub_22758CFCC();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      goto LABEL_8;
    case 1u:
      v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_2558D55C0);
      v9 = v8[12];
      v10 = (char *)a1 + v9;
      v11 = (char *)a2 + v9;
      v12 = sub_22758C984();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
      v13 = (int *)type metadata accessor for DetectedTextBlock();
      *(_QWORD *)&v10[v13[5]] = *(_QWORD *)&v11[v13[5]];
      v14 = v13[6];
      v15 = &v10[v14];
      v16 = &v11[v14];
      v17 = *((_OWORD *)v16 + 1);
      *(_OWORD *)v15 = *(_OWORD *)v16;
      *((_OWORD *)v15 + 1) = v17;
      *(_QWORD *)&v10[v13[7]] = *(_QWORD *)&v11[v13[7]];
      v10[v13[8]] = v11[v13[8]];
      v18 = v13[9];
      v19 = *(void **)&v11[v18];
      *(_QWORD *)&v10[v18] = v19;
      v20 = v8[16];
      v21 = *(void **)((char *)a2 + v20);
      *(_QWORD *)((char *)a1 + v20) = v21;
      v22 = v8[20];
      v23 = *(void **)((char *)a2 + v22);
      *(_QWORD *)((char *)a1 + v22) = v23;
      v24 = v8[24];
      v25 = *(void **)((char *)a2 + v24);
      *(_QWORD *)((char *)a1 + v24) = v25;
      *(_QWORD *)((char *)a1 + v8[28]) = *(_QWORD *)((char *)a2 + v8[28]);
      *((_BYTE *)a1 + v8[32]) = *((_BYTE *)a2 + v8[32]);
      swift_bridgeObjectRetain();
      v26 = v19;
      v27 = v21;
      v28 = v23;
      v29 = v25;
      goto LABEL_8;
    case 2u:
      v30 = sub_22758C984();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(a1, a2, v30);
      v31 = (int *)type metadata accessor for SpatialTextBlock();
      *(_OWORD *)((char *)a1 + v31[5]) = *(_OWORD *)((char *)a2 + v31[5]);
      *(_OWORD *)((char *)a1 + v31[6]) = *(_OWORD *)((char *)a2 + v31[6]);
      *(_OWORD *)((char *)a1 + v31[7]) = *(_OWORD *)((char *)a2 + v31[7]);
      *(_OWORD *)((char *)a1 + v31[8]) = *(_OWORD *)((char *)a2 + v31[8]);
      v32 = v31[9];
      v33 = (_OWORD *)((char *)a1 + v32);
      v34 = (_OWORD *)((char *)a2 + v32);
      v35 = v34[1];
      *v33 = *v34;
      v33[1] = v35;
      v36 = v34[3];
      v33[2] = v34[2];
      v33[3] = v36;
      *(_DWORD *)((char *)a1 + v31[10]) = *(_DWORD *)((char *)a2 + v31[10]);
      *(_QWORD *)((char *)a1 + v31[11]) = *(_QWORD *)((char *)a2 + v31[11]);
      v37 = v31[12];
      v38 = (_OWORD *)((char *)a1 + v37);
      v39 = (_OWORD *)((char *)a2 + v37);
      v40 = v39[1];
      *v38 = *v39;
      v38[1] = v40;
      *(_QWORD *)((char *)a1 + v31[13]) = *(_QWORD *)((char *)a2 + v31[13]);
      *((_BYTE *)a1 + v31[14]) = *((_BYTE *)a2 + v31[14]);
      v41 = v31[15];
      v42 = *(void **)((char *)a2 + v41);
      *(_QWORD *)((char *)a1 + v41) = v42;
      swift_bridgeObjectRetain();
      v43 = v42;
      goto LABEL_8;
    case 3u:
      *(_QWORD *)a1 = *(_QWORD *)a2;
      swift_bridgeObjectRetain();
      goto LABEL_8;
    case 4u:
      v44 = *((_QWORD *)a2 + 1);
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *((_QWORD *)a1 + 1) = v44;
      swift_bridgeObjectRetain();
LABEL_8:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_OWORD *assignWithCopy for MAGPointAndSpeakEvent.PointAndSpeakEventType(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  __int128 v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  int *v31;
  uint64_t v32;
  _OWORD *v33;
  __int128 *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  _OWORD *v39;
  _OWORD *v40;
  __int128 v41;
  uint64_t v42;
  void *v43;
  id v44;

  if (a1 != a2)
  {
    sub_22730DFB0((uint64_t)a1, type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v6 = sub_22758CFCC();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
        goto LABEL_9;
      case 1u:
        v7 = a2[1];
        *a1 = *a2;
        a1[1] = v7;
        v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_2558D55C0);
        v9 = v8[12];
        v10 = (char *)a1 + v9;
        v11 = (char *)a2 + v9;
        v12 = sub_22758C984();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
        v13 = (int *)type metadata accessor for DetectedTextBlock();
        *(_QWORD *)&v10[v13[5]] = *(_QWORD *)&v11[v13[5]];
        v14 = v13[6];
        v15 = &v10[v14];
        v16 = &v11[v14];
        v17 = *((_OWORD *)v16 + 1);
        *(_OWORD *)v15 = *(_OWORD *)v16;
        *((_OWORD *)v15 + 1) = v17;
        *(_QWORD *)&v10[v13[7]] = *(_QWORD *)&v11[v13[7]];
        v10[v13[8]] = v11[v13[8]];
        v18 = v13[9];
        v19 = *(void **)&v11[v18];
        *(_QWORD *)&v10[v18] = v19;
        v20 = v8[16];
        v21 = *(void **)((char *)a2 + v20);
        *(_QWORD *)((char *)a1 + v20) = v21;
        v22 = v8[20];
        v23 = *(void **)((char *)a2 + v22);
        *(_QWORD *)((char *)a1 + v22) = v23;
        v24 = v8[24];
        v25 = *(void **)((char *)a2 + v24);
        *(_QWORD *)((char *)a1 + v24) = v25;
        *(_QWORD *)((char *)a1 + v8[28]) = *(_QWORD *)((char *)a2 + v8[28]);
        *((_BYTE *)a1 + v8[32]) = *((_BYTE *)a2 + v8[32]);
        swift_bridgeObjectRetain();
        v26 = v19;
        v27 = v21;
        v28 = v23;
        v29 = v25;
        goto LABEL_9;
      case 2u:
        v30 = sub_22758C984();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(a1, a2, v30);
        v31 = (int *)type metadata accessor for SpatialTextBlock();
        *(_OWORD *)((char *)a1 + v31[5]) = *(_OWORD *)((char *)a2 + v31[5]);
        *(_OWORD *)((char *)a1 + v31[6]) = *(_OWORD *)((char *)a2 + v31[6]);
        *(_OWORD *)((char *)a1 + v31[7]) = *(_OWORD *)((char *)a2 + v31[7]);
        *(_OWORD *)((char *)a1 + v31[8]) = *(_OWORD *)((char *)a2 + v31[8]);
        v32 = v31[9];
        v33 = (_OWORD *)((char *)a1 + v32);
        v34 = (_OWORD *)((char *)a2 + v32);
        v35 = *v34;
        v36 = v34[1];
        v37 = v34[3];
        v33[2] = v34[2];
        v33[3] = v37;
        *v33 = v35;
        v33[1] = v36;
        *(_DWORD *)((char *)a1 + v31[10]) = *(_DWORD *)((char *)a2 + v31[10]);
        *(_QWORD *)((char *)a1 + v31[11]) = *(_QWORD *)((char *)a2 + v31[11]);
        v38 = v31[12];
        v39 = (_OWORD *)((char *)a1 + v38);
        v40 = (_OWORD *)((char *)a2 + v38);
        v41 = v40[1];
        *v39 = *v40;
        v39[1] = v41;
        *(_QWORD *)((char *)a1 + v31[13]) = *(_QWORD *)((char *)a2 + v31[13]);
        *((_BYTE *)a1 + v31[14]) = *((_BYTE *)a2 + v31[14]);
        v42 = v31[15];
        v43 = *(void **)((char *)a2 + v42);
        *(_QWORD *)((char *)a1 + v42) = v43;
        swift_bridgeObjectRetain();
        v44 = v43;
        goto LABEL_9;
      case 3u:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        swift_bridgeObjectRetain();
        goto LABEL_9;
      case 4u:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
        swift_bridgeObjectRetain();
LABEL_9:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

_OWORD *initializeWithTake for MAGPointAndSpeakEvent.PointAndSpeakEventType(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  _OWORD *v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  __int128 v18;
  __int128 v19;
  int *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  int *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  __int128 v29;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v8 = sub_22758C984();
    (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    v9 = (int *)type metadata accessor for SpatialTextBlock();
    *(_OWORD *)((char *)a1 + v9[5]) = *(_OWORD *)((char *)a2 + v9[5]);
    *(_OWORD *)((char *)a1 + v9[6]) = *(_OWORD *)((char *)a2 + v9[6]);
    *(_OWORD *)((char *)a1 + v9[7]) = *(_OWORD *)((char *)a2 + v9[7]);
    *(_OWORD *)((char *)a1 + v9[8]) = *(_OWORD *)((char *)a2 + v9[8]);
    v10 = v9[9];
    v11 = (_OWORD *)((char *)a1 + v10);
    v12 = (_OWORD *)((char *)a2 + v10);
    v13 = v12[1];
    *v11 = *v12;
    v11[1] = v13;
    v14 = v12[3];
    v11[2] = v12[2];
    v11[3] = v14;
    *(_DWORD *)((char *)a1 + v9[10]) = *(_DWORD *)((char *)a2 + v9[10]);
    *(_QWORD *)((char *)a1 + v9[11]) = *(_QWORD *)((char *)a2 + v9[11]);
    v15 = v9[12];
    v16 = (_OWORD *)((char *)a1 + v15);
    v17 = (_OWORD *)((char *)a2 + v15);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    *(_QWORD *)((char *)a1 + v9[13]) = *(_QWORD *)((char *)a2 + v9[13]);
    *((_BYTE *)a1 + v9[14]) = *((_BYTE *)a2 + v9[14]);
    *(_QWORD *)((char *)a1 + v9[15]) = *(_QWORD *)((char *)a2 + v9[15]);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 1)
  {
    v19 = a2[1];
    *a1 = *a2;
    a1[1] = v19;
    v20 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_2558D55C0);
    v21 = v20[12];
    v22 = (char *)a1 + v21;
    v23 = (char *)a2 + v21;
    v24 = sub_22758C984();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v22, v23, v24);
    v25 = (int *)type metadata accessor for DetectedTextBlock();
    *(_QWORD *)&v22[v25[5]] = *(_QWORD *)&v23[v25[5]];
    v26 = v25[6];
    v27 = &v22[v26];
    v28 = &v23[v26];
    v29 = *((_OWORD *)v28 + 1);
    *(_OWORD *)v27 = *(_OWORD *)v28;
    *((_OWORD *)v27 + 1) = v29;
    *(_QWORD *)&v22[v25[7]] = *(_QWORD *)&v23[v25[7]];
    v22[v25[8]] = v23[v25[8]];
    *(_QWORD *)&v22[v25[9]] = *(_QWORD *)&v23[v25[9]];
    *(_QWORD *)((char *)a1 + v20[16]) = *(_QWORD *)((char *)a2 + v20[16]);
    *(_QWORD *)((char *)a1 + v20[20]) = *(_QWORD *)((char *)a2 + v20[20]);
    *(_QWORD *)((char *)a1 + v20[24]) = *(_QWORD *)((char *)a2 + v20[24]);
    *(_QWORD *)((char *)a1 + v20[28]) = *(_QWORD *)((char *)a2 + v20[28]);
    *((_BYTE *)a1 + v20[32]) = *((_BYTE *)a2 + v20[32]);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_22758CFCC();
    (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *assignWithTake for MAGPointAndSpeakEvent.PointAndSpeakEventType(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  _OWORD *v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  __int128 v18;
  __int128 v19;
  int *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  int *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  __int128 v29;

  if (a1 != a2)
  {
    sub_22730DFB0((uint64_t)a1, type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v8 = sub_22758C984();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      v9 = (int *)type metadata accessor for SpatialTextBlock();
      *(_OWORD *)((char *)a1 + v9[5]) = *(_OWORD *)((char *)a2 + v9[5]);
      *(_OWORD *)((char *)a1 + v9[6]) = *(_OWORD *)((char *)a2 + v9[6]);
      *(_OWORD *)((char *)a1 + v9[7]) = *(_OWORD *)((char *)a2 + v9[7]);
      *(_OWORD *)((char *)a1 + v9[8]) = *(_OWORD *)((char *)a2 + v9[8]);
      v10 = v9[9];
      v11 = (_OWORD *)((char *)a1 + v10);
      v12 = (_OWORD *)((char *)a2 + v10);
      v13 = v12[1];
      *v11 = *v12;
      v11[1] = v13;
      v14 = v12[3];
      v11[2] = v12[2];
      v11[3] = v14;
      *(_DWORD *)((char *)a1 + v9[10]) = *(_DWORD *)((char *)a2 + v9[10]);
      *(_QWORD *)((char *)a1 + v9[11]) = *(_QWORD *)((char *)a2 + v9[11]);
      v15 = v9[12];
      v16 = (_OWORD *)((char *)a1 + v15);
      v17 = (_OWORD *)((char *)a2 + v15);
      v18 = v17[1];
      *v16 = *v17;
      v16[1] = v18;
      *(_QWORD *)((char *)a1 + v9[13]) = *(_QWORD *)((char *)a2 + v9[13]);
      *((_BYTE *)a1 + v9[14]) = *((_BYTE *)a2 + v9[14]);
      *(_QWORD *)((char *)a1 + v9[15]) = *(_QWORD *)((char *)a2 + v9[15]);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v19 = a2[1];
      *a1 = *a2;
      a1[1] = v19;
      v20 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_2558D55C0);
      v21 = v20[12];
      v22 = (char *)a1 + v21;
      v23 = (char *)a2 + v21;
      v24 = sub_22758C984();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(v22, v23, v24);
      v25 = (int *)type metadata accessor for DetectedTextBlock();
      *(_QWORD *)&v22[v25[5]] = *(_QWORD *)&v23[v25[5]];
      v26 = v25[6];
      v27 = &v22[v26];
      v28 = &v23[v26];
      v29 = *((_OWORD *)v28 + 1);
      *(_OWORD *)v27 = *(_OWORD *)v28;
      *((_OWORD *)v27 + 1) = v29;
      *(_QWORD *)&v22[v25[7]] = *(_QWORD *)&v23[v25[7]];
      v22[v25[8]] = v23[v25[8]];
      *(_QWORD *)&v22[v25[9]] = *(_QWORD *)&v23[v25[9]];
      *(_QWORD *)((char *)a1 + v20[16]) = *(_QWORD *)((char *)a2 + v20[16]);
      *(_QWORD *)((char *)a1 + v20[20]) = *(_QWORD *)((char *)a2 + v20[20]);
      *(_QWORD *)((char *)a1 + v20[24]) = *(_QWORD *)((char *)a2 + v20[24]);
      *(_QWORD *)((char *)a1 + v20[28]) = *(_QWORD *)((char *)a2 + v20[28]);
      *((_BYTE *)a1 + v20[32]) = *((_BYTE *)a2 + v20[32]);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_22758CFCC();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_227586414()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  result = sub_22758CFCC();
  if (v1 <= 0x3F)
  {
    v5 = *(_QWORD *)(result - 8) + 64;
    result = type metadata accessor for DetectedTextBlock();
    if (v2 <= 0x3F)
    {
      swift_getTupleTypeLayout();
      v6 = &v4;
      result = type metadata accessor for SpatialTextBlock();
      if (v3 <= 0x3F)
      {
        v7 = *(_QWORD *)(result - 8) + 64;
        v8 = MEMORY[0x24BEE0158] + 64;
        v9 = &unk_2275A8DE0;
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

uint64_t type metadata accessor for MAGPointAndSpeakEventHandler()
{
  return objc_opt_self();
}

uint64_t method lookup function for MAGPointAndSpeakEventHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MAGPointAndSpeakEventHandler.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_227586548(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v10 = *v4;
  v12 = sub_2274DE498(a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_2275876F8();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = (_QWORD *)(v18[7] + 16 * v12);
      result = swift_bridgeObjectRelease();
      *v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(_BYTE *)(v18[6] + v12) = a3;
    v21 = (_QWORD *)(v18[7] + 16 * v12);
    *v21 = a1;
    v21[1] = a2;
    v22 = v18[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_22758076C(result, a4 & 1);
  result = sub_2274DE498(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_22758EEB0();
  __break(1u);
  return result;
}

uint64_t sub_227586684(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  unint64_t v20;
  char v21;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_2274DE604(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = v16[7];
        v18 = sub_22758C984();
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v10, a1, v18);
      }
      return sub_2275874C4(v10, a2, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_227587C28();
      goto LABEL_7;
    }
    sub_2275811B8(v13, a3 & 1);
    v20 = sub_2274DE604(a2);
    if ((v14 & 1) == (v21 & 1))
    {
      v10 = v20;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_2275874C4(v10, a2, a1, v16);
    }
  }
  result = sub_22758EEB0();
  __break(1u);
  return result;
}

uint64_t sub_2275867A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  return sub_2275867B4(a1, a2, a3, a4, a5, &qword_2558D5B98);
}

uint64_t sub_2275867B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t *a6)
{
  _QWORD *v6;
  _QWORD *v8;
  uint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t result;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;

  v8 = v6;
  v14 = *v6;
  v16 = sub_2274DE434(a3, a4);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v20 = v15;
  v21 = *(_QWORD *)(v14 + 24);
  if (v21 >= v19 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v21 >= v19 && (a5 & 1) == 0)
  {
    sub_227588CF8(a6);
LABEL_7:
    v22 = (_QWORD *)*v8;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      v23 = (_QWORD *)(v22[7] + 16 * v16);
      result = swift_release();
      *v23 = a1;
      v23[1] = a2;
      return result;
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    v27 = (uint64_t *)(v22[6] + 16 * v16);
    *v27 = a3;
    v27[1] = a4;
    v28 = (_QWORD *)(v22[7] + 16 * v16);
    *v28 = a1;
    v28[1] = a2;
    v29 = v22[2];
    v30 = __OFADD__(v29, 1);
    v31 = v29 + 1;
    if (!v30)
    {
      v22[2] = v31;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_22758353C(v19, a5 & 1, a6);
  v25 = sub_2274DE434(a3, a4);
  if ((v20 & 1) == (v26 & 1))
  {
    v16 = v25;
    v22 = (_QWORD *)*v8;
    if ((v20 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_22758EEB0();
  __break(1u);
  return result;
}

uint64_t sub_227586934(const void *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t result;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_2274DE434(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_227587E54();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      return sub_22758804C((uint64_t)a1, v18[7] + 280 * v12);
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    memcpy((void *)(v18[7] + 280 * v12), a1, 0x118uLL);
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_2275814E8(v15, a4 & 1);
  v20 = sub_2274DE434(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      return sub_22758804C((uint64_t)a1, v18[7] + 280 * v12);
    goto LABEL_11;
  }
LABEL_15:
  result = sub_22758EEB0();
  __break(1u);
  return result;
}

uint64_t sub_227586A9C(uint64_t a1, char a2, float a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v4 = v3;
  v8 = *v3;
  v10 = sub_2274DE4F0(a1);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a2 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a2 & 1) == 0)
  {
    result = (uint64_t)sub_227588088();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      *(float *)(v16[7] + 4 * v10) = a3;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_BYTE *)(v16[6] + v10) = a1;
    *(float *)(v16[7] + 4 * v10) = a3;
    v18 = v16[2];
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (!v19)
    {
      v16[2] = v20;
      return result;
    }
    goto LABEL_14;
  }
  sub_227581B50(result, a2 & 1);
  result = sub_2274DE4F0(a1);
  if ((v14 & 1) == (v17 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_22758EEB0();
  __break(1u);
  return result;
}

uint64_t sub_227586BC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_2274DE434(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_227588214();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 16 * v14);
      result = swift_bridgeObjectRelease();
      *v21 = a1;
      v21[1] = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_227581E18(v17, a5 & 1);
  v23 = sub_2274DE434(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_22758EEB0();
  __break(1u);
  return result;
}

uint64_t sub_227586D34(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_2274DE434(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2275883CC();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_22758213C(v15, a4 & 1);
  v21 = sub_2274DE434(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_22758EEB0();
  __break(1u);
  return result;
}

uint64_t sub_227586E90(uint64_t a1, uint64_t a2, char a3)
{
  return sub_2275872D0(a1, a2, a3, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock, (uint64_t (*)(uint64_t, __n128))sub_2274DE734, (uint64_t (*)(_QWORD))type metadata accessor for SpatialTextBlock, &qword_2558DF3D0);
}

uint64_t sub_227586EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  return sub_2275867B4(a1, a2, a3, a4, a5, &qword_2558D5B78);
}

uint64_t sub_227586EC0(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t result;
  unint64_t v27;
  char v28;
  uint64_t v29;

  v4 = (_QWORD **)v3;
  v8 = sub_22758C984();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10, v11, v12, v13);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (_QWORD *)*v3;
  v18 = sub_2274DE7E0(a2);
  v19 = v16[2];
  v20 = (v17 & 1) == 0;
  v21 = v19 + v20;
  if (__OFADD__(v19, v20))
  {
    __break(1u);
    goto LABEL_14;
  }
  v22 = v17;
  v23 = v16[3];
  if (v23 >= v21 && (a3 & 1) != 0)
  {
LABEL_7:
    v24 = *v4;
    if ((v22 & 1) != 0)
    {
LABEL_8:
      v25 = v24[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v25 + 8 * v18) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v23 >= v21 && (a3 & 1) == 0)
  {
    sub_2275885B4(&qword_2558DF3C8);
    goto LABEL_7;
  }
  sub_22758245C(v21, a3 & 1, &qword_2558DF3C8);
  v27 = sub_2274DE7E0(a2);
  if ((v22 & 1) != (v28 & 1))
  {
LABEL_14:
    result = sub_22758EEB0();
    __break(1u);
    return result;
  }
  v18 = v27;
  v24 = *v4;
  if ((v22 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v15, a2, v8);
  return sub_227587550(v18, (uint64_t)v15, a1, v24);
}

void sub_22758702C(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v8 = *v3;
  v10 = sub_2274DE84C(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_227588988();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];

      *(_QWORD *)(v17 + 8 * v10) = a1;
      return;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_BYTE *)(v16[6] + v10) = a2;
    *(_QWORD *)(v16[7] + 8 * v10) = a1;
    v20 = v16[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return;
    }
    goto LABEL_14;
  }
  sub_227582D28(v13, a3 & 1);
  v18 = sub_2274DE84C(a2);
  if ((v14 & 1) == (v19 & 1))
  {
    v10 = v18;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_22758EEB0();
  __break(1u);
}

uint64_t sub_227587160(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  return sub_2275867B4(a1, a2, a3, a4, a5, &qword_2558D5B10);
}

uint64_t sub_22758716C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  return sub_2275867B4(a1, a2, a3, a4, a5, &qword_2558D5B08);
}

uint64_t sub_227587178(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v4 = v3;
  v8 = *v3;
  v10 = sub_2274DE634(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_227588EB0();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_BYTE *)(v16[6] + v10) = a2;
    *(_QWORD *)(v16[7] + 8 * v10) = a1;
    v19 = v16[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (!v20)
    {
      v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_227583840(result, a3 & 1);
  result = sub_2274DE634(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_22758EEB0();
  __break(1u);
  return result;
}

uint64_t sub_2275872AC(uint64_t a1, uint64_t a2, char a3)
{
  return sub_2275872D0(a1, a2, a3, (uint64_t (*)(_QWORD))type metadata accessor for SpatialTextBlock, (uint64_t (*)(uint64_t, __n128))sub_2274DE8E4, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock, &qword_2558DF3B8);
}

uint64_t sub_2275872D0(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(_QWORD), uint64_t (*a5)(uint64_t, __n128), uint64_t (*a6)(_QWORD), uint64_t *a7)
{
  _QWORD *v7;
  _QWORD **v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __n128 v18;
  uint64_t v19;
  char *v20;
  _QWORD *v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t (*v31)(_QWORD);
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(_QWORD);

  v37 = a7;
  v38 = a1;
  v39 = a6;
  v10 = (_QWORD **)v7;
  v13 = a4(0);
  v18 = MEMORY[0x24BDAC7A8](v13, v14, v15, v16, v17);
  v20 = (char *)&v36 - v19;
  v21 = (_QWORD *)*v7;
  v23 = a5(a2, v18);
  v24 = v21[2];
  v25 = (v22 & 1) == 0;
  v26 = v24 + v25;
  if (__OFADD__(v24, v25))
  {
    __break(1u);
    goto LABEL_14;
  }
  v27 = v22;
  v28 = v21[3];
  if (v28 >= v26 && (a3 & 1) != 0)
  {
LABEL_7:
    v29 = *v10;
    if ((v27 & 1) != 0)
    {
LABEL_8:
      v30 = v29[7];
      v31 = v39;
      v32 = v39(0);
      return sub_227589520(v38, v30 + *(_QWORD *)(*(_QWORD *)(v32 - 8) + 72) * v23, v31);
    }
    goto LABEL_11;
  }
  if (v28 >= v26 && (a3 & 1) == 0)
  {
    sub_22758906C(v39, (uint64_t (*)(_QWORD, __n128))a4, v37);
    goto LABEL_7;
  }
  sub_227583D9C(v26, a3 & 1, v39, a4, v37);
  v34 = ((uint64_t (*)(uint64_t))a5)(a2);
  if ((v27 & 1) != (v35 & 1))
  {
LABEL_14:
    result = sub_22758EEB0();
    __break(1u);
    return result;
  }
  v23 = v34;
  v29 = *v10;
  if ((v27 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  sub_22730DEEC(a2, (uint64_t)v20, a4);
  return sub_22758762C(v23, (uint64_t)v20, v38, v29, a4, v39);
}

unint64_t sub_227587464(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_QWORD *)(a4[6] + 8 * result) = a2;
  v4 = a4[7] + 56 * result;
  v5 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)v4 = *(_OWORD *)a3;
  *(_OWORD *)(v4 + 16) = v5;
  *(_OWORD *)(v4 + 32) = *(_OWORD *)(a3 + 32);
  *(_QWORD *)(v4 + 48) = *(_QWORD *)(a3 + 48);
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

uint64_t sub_2275874C4(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  v7 = a4[7];
  v8 = sub_22758C984();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7 + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 72) * a1, a3, v8);
  v10 = a4[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a4[2] = v12;
  return result;
}

uint64_t sub_227587550(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_22758C984();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

unint64_t sub_2275875E8(unint64_t result, char a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_BYTE *)(a4[6] + result) = a2;
  *(_QWORD *)(a4[7] + 8 * result) = a3;
  v4 = a4[2];
  v5 = __OFADD__(v4, 1);
  v6 = v4 + 1;
  if (v5)
    __break(1u);
  else
    a4[2] = v6;
  return result;
}

uint64_t sub_22758762C(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t (*a5)(_QWORD), uint64_t (*a6)(_QWORD))
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v12 = a4[6];
  v13 = a5(0);
  sub_22730DFEC(a2, v12 + *(_QWORD *)(*(_QWORD *)(v13 - 8) + 72) * a1, a5);
  v14 = a4[7];
  v15 = a6(0);
  result = sub_22730DFEC(a3, v14 + *(_QWORD *)(*(_QWORD *)(v15 - 8) + 72) * a1, a6);
  v17 = a4[2];
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    a4[2] = v19;
  return result;
}

void *sub_2275876EC()
{
  return sub_227588CF8(&qword_2558D5B00);
}

void *sub_2275876F8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  __int128 v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5B58);
  v2 = *v0;
  v3 = sub_22758ED00();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v12 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    v16 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + 16 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + 16 * v15) = v16;
    result = (void *)swift_bridgeObjectRetain();
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22758789C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF3D8);
  v2 = *v0;
  v3 = sub_22758ED00();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_227587A44()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  int64_t v29;
  unint64_t v30;
  int64_t v31;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5BC8);
  v2 = *v0;
  v3 = sub_22758ED00();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v29 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v29 >= v13)
      goto LABEL_26;
    v30 = *(_QWORD *)(v6 + 8 * v29);
    ++v9;
    if (!v30)
    {
      v9 = v29 + 1;
      if (v29 + 1 >= v13)
        goto LABEL_26;
      v30 = *(_QWORD *)(v6 + 8 * v9);
      if (!v30)
        break;
    }
LABEL_25:
    v12 = (v30 - 1) & v30;
    v15 = __clz(__rbit64(v30)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 56 * v15;
    v19 = *(_QWORD *)(v2 + 56) + v18;
    v20 = *(_QWORD *)(v19 + 32);
    v21 = *(_OWORD *)(v19 + 40);
    v22 = *(_OWORD *)v19;
    v23 = *(_OWORD *)(v19 + 16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    v24 = *(_QWORD *)(v4 + 56) + v18;
    *(_OWORD *)v24 = v22;
    *(_OWORD *)(v24 + 16) = v23;
    *(_QWORD *)(v24 + 32) = v20;
    *(_OWORD *)(v24 + 40) = v21;
    v25 = (void *)*((_QWORD *)&v22 + 1);
    v26 = (void *)v23;
    v27 = *((id *)&v23 + 1);
    swift_bridgeObjectRetain();
    v28 = v25;
    result = v26;
  }
  v31 = v29 + 2;
  if (v31 >= v13)
    goto LABEL_26;
  v30 = *(_QWORD *)(v6 + 8 * v31);
  if (v30)
  {
    v9 = v31;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v31 + 1;
    if (__OFADD__(v31, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v30 = *(_QWORD *)(v6 + 8 * v9);
    ++v31;
    if (v30)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_227587C28()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *result;
  unint64_t v13;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int64_t v30;

  v1 = sub_22758C984();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v3, v4, v5, v6);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5BD8);
  v28 = v0;
  v9 = *v0;
  v10 = sub_22758ED00();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v28 = v11;
    return result;
  }
  result = (void *)(v10 + 64);
  v13 = (unint64_t)((1 << *(_BYTE *)(v11 + 32)) + 63) >> 6;
  if (v11 != v9 || (unint64_t)result >= v9 + 64 + 8 * v13)
    result = memmove(result, (const void *)(v9 + 64), 8 * v13);
  v15 = 0;
  *(_QWORD *)(v11 + 16) = *(_QWORD *)(v9 + 16);
  v16 = 1 << *(_BYTE *)(v9 + 32);
  v17 = -1;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  v18 = v17 & *(_QWORD *)(v9 + 64);
  v29 = v9 + 64;
  v30 = (unint64_t)(v16 + 63) >> 6;
  while (1)
  {
    if (v18)
    {
      v19 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v20 = v19 | (v15 << 6);
      goto LABEL_12;
    }
    v24 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v30)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v24);
    ++v15;
    if (!v25)
    {
      v15 = v24 + 1;
      if (v24 + 1 >= v30)
        goto LABEL_26;
      v25 = *(_QWORD *)(v29 + 8 * v15);
      if (!v25)
        break;
    }
LABEL_25:
    v18 = (v25 - 1) & v25;
    v20 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_12:
    v21 = 8 * v20;
    v22 = *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v20);
    v23 = *(_QWORD *)(v2 + 72) * v20;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v8, *(_QWORD *)(v9 + 56) + v23, v1);
    *(_QWORD *)(*(_QWORD *)(v11 + 48) + v21) = v22;
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v11 + 56) + v23, v8, v1);
  }
  v26 = v24 + 2;
  if (v26 >= v30)
    goto LABEL_26;
  v25 = *(_QWORD *)(v29 + 8 * v26);
  if (v25)
  {
    v15 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v15 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v15 >= v30)
      goto LABEL_26;
    v25 = *(_QWORD *)(v29 + 8 * v15);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_227587E48()
{
  return sub_227588CF8(&qword_2558D5B98);
}

void *sub_227587E54()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _BYTE __dst[288];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540BA1E0);
  v2 = *v0;
  v3 = sub_22758ED00();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = *v17;
    v19 = v17[1];
    v20 = 280 * v15;
    memcpy(__dst, (const void *)(*(_QWORD *)(v2 + 56) + 280 * v15), 0x118uLL);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v18;
    v21[1] = v19;
    memcpy((void *)(*(_QWORD *)(v4 + 56) + v20), __dst, 0x118uLL);
    swift_bridgeObjectRetain();
    result = (void *)sub_22730B838((uint64_t)__dst);
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_22758804C(uint64_t a1, uint64_t a2)
{
  assignWithTake for MFEnvironment.ActivityControls(a2, a1);
  return a2;
}

void *sub_227588088()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5B18);
  v2 = *v0;
  v3 = sub_22758ED00();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v20 = __clz(__rbit64(v18));
    v12 = (v18 - 1) & v18;
    v15 = v20 + (v9 << 6);
LABEL_12:
    v16 = *(_DWORD *)(*(_QWORD *)(v2 + 56) + 4 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_DWORD *)(*(_QWORD *)(v4 + 56) + 4 * v15) = v16;
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_227588214()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5AC0);
  v2 = *v0;
  v3 = sub_22758ED00();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2275883CC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF3B0);
  v2 = *v0;
  v3 = sub_22758ED00();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_227588580()
{
  return sub_22758906C((uint64_t (*)(_QWORD))type metadata accessor for SpatialTextBlock, (uint64_t (*)(_QWORD, __n128))type metadata accessor for DetectedTextBlock, &qword_2558DF3D0);
}

void *sub_22758859C()
{
  return sub_227588CF8(&qword_2558D5B78);
}

void *sub_2275885A8()
{
  return sub_2275885B4(&qword_2558D7548);
}

void *sub_2275885B4(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *result;
  unint64_t v15;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int64_t v32;

  v3 = sub_22758C984();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5, v6, v7, v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v30 = v1;
  v11 = *v1;
  v12 = sub_22758ED00();
  v13 = v12;
  if (!*(_QWORD *)(v11 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v30 = v13;
    return result;
  }
  result = (void *)(v12 + 64);
  v15 = (unint64_t)((1 << *(_BYTE *)(v13 + 32)) + 63) >> 6;
  if (v13 != v11 || (unint64_t)result >= v11 + 64 + 8 * v15)
    result = memmove(result, (const void *)(v11 + 64), 8 * v15);
  v31 = v11 + 64;
  v17 = 0;
  *(_QWORD *)(v13 + 16) = *(_QWORD *)(v11 + 16);
  v18 = 1 << *(_BYTE *)(v11 + 32);
  v19 = -1;
  if (v18 < 64)
    v19 = ~(-1 << v18);
  v20 = v19 & *(_QWORD *)(v11 + 64);
  v32 = (unint64_t)(v18 + 63) >> 6;
  while (1)
  {
    if (v20)
    {
      v21 = __clz(__rbit64(v20));
      v20 &= v20 - 1;
      v22 = v21 | (v17 << 6);
      goto LABEL_12;
    }
    v26 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v32)
      goto LABEL_26;
    v27 = *(_QWORD *)(v31 + 8 * v26);
    ++v17;
    if (!v27)
    {
      v17 = v26 + 1;
      if (v26 + 1 >= v32)
        goto LABEL_26;
      v27 = *(_QWORD *)(v31 + 8 * v17);
      if (!v27)
        break;
    }
LABEL_25:
    v20 = (v27 - 1) & v27;
    v22 = __clz(__rbit64(v27)) + (v17 << 6);
LABEL_12:
    v23 = *(_QWORD *)(v4 + 72) * v22;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v10, *(_QWORD *)(v11 + 48) + v23, v3);
    v24 = 8 * v22;
    v25 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v22);
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(_QWORD *)(v13 + 48) + v23, v10, v3);
    *(_QWORD *)(*(_QWORD *)(v13 + 56) + v24) = v25;
    result = (void *)swift_bridgeObjectRetain();
  }
  v28 = v26 + 2;
  if (v28 >= v32)
    goto LABEL_26;
  v27 = *(_QWORD *)(v31 + 8 * v28);
  if (v27)
  {
    v17 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v17 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v17 >= v32)
      goto LABEL_26;
    v27 = *(_QWORD *)(v31 + 8 * v17);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2275887E4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  __int128 v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540BA1D0);
  v2 = *v0;
  v3 = sub_22758ED00();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v12 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    v16 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + 16 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + 16 * v15) = v16;
    result = (id)v16;
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_227588988()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5B60);
  v2 = *v0;
  v3 = sub_22758ED00();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v12 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    v16 = *(void **)(*(_QWORD *)(v2 + 56) + 8 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v15) = v16;
    result = v16;
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_227588B28()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  _QWORD *v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558D5AF0);
  v2 = *v0;
  v3 = sub_22758ED00();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = *(_QWORD *)(v2 + 56) + v16;
    v21 = *(_QWORD *)v20;
    v22 = *(_DWORD *)(v20 + 8);
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = *(_QWORD *)(v4 + 56) + v16;
    *(_QWORD *)v24 = v21;
    *(_DWORD *)(v24 + 8) = v22;
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_227588CE0()
{
  return sub_227588CF8(&qword_2558D5B10);
}

void *sub_227588CEC()
{
  return sub_227588CF8(&qword_2558D5B08);
}

void *sub_227588CF8(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_22758ED00();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (uint64_t *)(*(_QWORD *)(v3 + 48) + v17);
    v20 = *v18;
    v19 = v18[1];
    v21 = *(_OWORD *)(*(_QWORD *)(v3 + 56) + v17);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = v20;
    v22[1] = v19;
    *(_OWORD *)(*(_QWORD *)(v5 + 56) + v17) = v21;
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_227588EB0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540BA1D8);
  v2 = *v0;
  v3 = sub_22758ED00();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v12 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    v16 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v15) = v16;
    result = (void *)swift_bridgeObjectRetain();
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_227589050()
{
  return sub_22758906C((uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock, (uint64_t (*)(_QWORD, __n128))type metadata accessor for SpatialTextBlock, &qword_2558DF3B8);
}

void *sub_22758906C(uint64_t (*a1)(_QWORD), uint64_t (*a2)(_QWORD, __n128), uint64_t *a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *result;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  int64_t v35;
  unint64_t v36;
  int64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  uint64_t v43;

  v7 = a1(0);
  v43 = *(_QWORD *)(v7 - 8);
  v12 = MEMORY[0x24BDAC7A8](v7, v8, v9, v10, v11);
  v14 = (char *)&v38 - v13;
  v15 = a2(0, v12);
  v42 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15, v16, v17, v18, v19);
  v21 = (char *)&v38 - v20;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v39 = v3;
  v22 = *v3;
  v23 = sub_22758ED00();
  v24 = v23;
  if (!*(_QWORD *)(v22 + 16))
  {
LABEL_23:
    result = (void *)swift_release();
    *v39 = v24;
    return result;
  }
  result = (void *)(v23 + 64);
  v26 = (unint64_t)((1 << *(_BYTE *)(v24 + 32)) + 63) >> 6;
  if (v24 != v22 || (unint64_t)result >= v22 + 64 + 8 * v26)
    result = memmove(result, (const void *)(v22 + 64), 8 * v26);
  v27 = 0;
  *(_QWORD *)(v24 + 16) = *(_QWORD *)(v22 + 16);
  v28 = 1 << *(_BYTE *)(v22 + 32);
  v29 = -1;
  if (v28 < 64)
    v29 = ~(-1 << v28);
  v30 = v29 & *(_QWORD *)(v22 + 64);
  v40 = v22 + 64;
  v41 = (unint64_t)(v28 + 63) >> 6;
  while (1)
  {
    if (v30)
    {
      v31 = __clz(__rbit64(v30));
      v30 &= v30 - 1;
      v32 = v31 | (v27 << 6);
      goto LABEL_9;
    }
    v35 = v27 + 1;
    if (__OFADD__(v27, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v35 >= v41)
      goto LABEL_23;
    v36 = *(_QWORD *)(v40 + 8 * v35);
    ++v27;
    if (!v36)
    {
      v27 = v35 + 1;
      if (v35 + 1 >= v41)
        goto LABEL_23;
      v36 = *(_QWORD *)(v40 + 8 * v27);
      if (!v36)
        break;
    }
LABEL_22:
    v30 = (v36 - 1) & v36;
    v32 = __clz(__rbit64(v36)) + (v27 << 6);
LABEL_9:
    v33 = *(_QWORD *)(v42 + 72) * v32;
    sub_22730DEEC(*(_QWORD *)(v22 + 48) + v33, (uint64_t)v21, (uint64_t (*)(_QWORD))a2);
    v34 = *(_QWORD *)(v43 + 72) * v32;
    sub_22730DEEC(*(_QWORD *)(v22 + 56) + v34, (uint64_t)v14, a1);
    sub_22730DFEC((uint64_t)v21, *(_QWORD *)(v24 + 48) + v33, (uint64_t (*)(_QWORD))a2);
    result = (void *)sub_22730DFEC((uint64_t)v14, *(_QWORD *)(v24 + 56) + v34, a1);
  }
  v37 = v35 + 2;
  if (v37 >= v41)
    goto LABEL_23;
  v36 = *(_QWORD *)(v40 + 8 * v37);
  if (v36)
  {
    v27 = v37;
    goto LABEL_22;
  }
  while (1)
  {
    v27 = v37 + 1;
    if (__OFADD__(v37, 1))
      break;
    if (v27 >= v41)
      goto LABEL_23;
    v36 = *(_QWORD *)(v40 + 8 * v27);
    ++v37;
    if (v36)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

void *sub_2275892E8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *result;
  unint64_t v13;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v1 = v0;
  v2 = type metadata accessor for DetectedTextBlock();
  v31 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v3, v4, v5, v6);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF3C0);
  v9 = *v0;
  v10 = sub_22758ED00();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v11;
    return result;
  }
  v29 = v1;
  result = (void *)(v10 + 64);
  v13 = (unint64_t)((1 << *(_BYTE *)(v11 + 32)) + 63) >> 6;
  if (v11 != v9 || (unint64_t)result >= v9 + 64 + 8 * v13)
    result = memmove(result, (const void *)(v9 + 64), 8 * v13);
  v30 = v9 + 64;
  v15 = 0;
  *(_QWORD *)(v11 + 16) = *(_QWORD *)(v9 + 16);
  v16 = 1 << *(_BYTE *)(v9 + 32);
  v17 = -1;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  v18 = v17 & *(_QWORD *)(v9 + 64);
  v19 = (unint64_t)(v16 + 63) >> 6;
  while (1)
  {
    if (v18)
    {
      v20 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v21 = v20 | (v15 << 6);
      goto LABEL_12;
    }
    v25 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v19)
      goto LABEL_26;
    v26 = *(_QWORD *)(v30 + 8 * v25);
    ++v15;
    if (!v26)
    {
      v15 = v25 + 1;
      if (v25 + 1 >= v19)
        goto LABEL_26;
      v26 = *(_QWORD *)(v30 + 8 * v15);
      if (!v26)
        break;
    }
LABEL_25:
    v18 = (v26 - 1) & v26;
    v21 = __clz(__rbit64(v26)) + (v15 << 6);
LABEL_12:
    v22 = *(_QWORD *)(v31 + 72) * v21;
    sub_22730DEEC(*(_QWORD *)(v9 + 48) + v22, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
    v23 = 8 * v21;
    v24 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    sub_22730DFEC((uint64_t)v8, *(_QWORD *)(v11 + 48) + v22, (uint64_t (*)(_QWORD))type metadata accessor for DetectedTextBlock);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + v23) = v24;
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v19)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v29;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v30 + 8 * v27);
  if (v26)
  {
    v15 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v15 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v15 >= v19)
      goto LABEL_26;
    v26 = *(_QWORD *)(v30 + 8 * v15);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_227589520(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t destroy for MFReaderPlaybackSpeedMenu(uint64_t a1)
{
  swift_release();
  swift_release();

  return sub_227341CF0(*(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
}

uint64_t initializeWithCopy for MFReaderPlaybackSpeedMenu(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v6 = *(void **)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v5;
  v7 = *(_QWORD *)(a2 + 48);
  v8 = *(_BYTE *)(a2 + 56);
  swift_retain();
  swift_retain();
  v9 = v6;
  sub_227341C6C(v7, v8);
  *(_QWORD *)(a1 + 48) = v7;
  *(_BYTE *)(a1 + 56) = v8;
  return a1;
}

uint64_t assignWithCopy for MFReaderPlaybackSpeedMenu(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v2 = a2;
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = a2[1];
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 16) = v2[2];
  *(_QWORD *)(a1 + 24) = v2[3];
  swift_retain();
  swift_release();
  v4 = *(void **)(a1 + 32);
  v5 = (void *)v2[4];
  *(_QWORD *)(a1 + 32) = v5;
  v6 = v5;

  *(_QWORD *)(a1 + 40) = v2[5];
  v7 = v2[6];
  LOBYTE(v2) = *((_BYTE *)v2 + 56);
  sub_227341C6C(v7, (char)v2);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = v7;
  *(_BYTE *)(a1 + 56) = (_BYTE)v2;
  sub_227341CF0(v8, v9);
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for MFReaderPlaybackSpeedMenu(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  char v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  v6 = *(_BYTE *)(a2 + 56);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_BYTE *)(a1 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 56) = v6;
  sub_227341CF0(v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for MFReaderPlaybackSpeedMenu(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 57))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MFReaderPlaybackSpeedMenu(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 57) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 57) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MFReaderPlaybackSpeedMenu()
{
  return &type metadata for MFReaderPlaybackSpeedMenu;
}

uint64_t sub_2275897F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_227589808@<X0>(uint64_t a1@<X8>)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t);
  char *v68;
  uint64_t v69;
  _QWORD *v70;
  char *v71;
  void (*v72)(char *, _QWORD, uint64_t);
  uint64_t result;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  char *v77;
  void (*v78)(char *, char *, uint64_t);
  char *v79;
  char *v80;
  void (*v81)(char *, char *, uint64_t);
  uint64_t v82;
  void (*v83)(char *, uint64_t);
  char *v84;
  ValueMetadata *v85;
  uint64_t v86;
  uint64_t OpaqueTypeConformance2;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  char *v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  char *v115;
  _QWORD *v116;
  uint64_t v117;
  char *v118;
  char *v119;
  uint64_t v120;
  ValueMetadata *v121;
  uint64_t v122;
  char *v123;

  v111 = a1;
  v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558D95A8);
  MEMORY[0x24BDAC7A8](v105, v2, v3, v4, v5);
  v99 = (char *)&v98 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7, v8, v9, v10, v11);
  v103 = (char *)&v98 - v12;
  v13 = sub_22758D47C();
  v116 = *(_QWORD **)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13, v14, v15, v16, v17);
  v114 = (char *)&v98 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19, v20, v21, v22, v23);
  v115 = (char *)&v98 - v24;
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558D95B0);
  MEMORY[0x24BDAC7A8](v109, v25, v26, v27, v28);
  v101 = (char *)&v98 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30, v31, v32, v33, v34);
  v106 = (uint64_t)&v98 - v35;
  v117 = sub_22758D878();
  v113 = *(_QWORD *)(v117 - 8);
  MEMORY[0x24BDAC7A8](v117, v36, v37, v38, v39);
  v41 = (char *)&v98 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF3E0);
  v112 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42, v43, v44, v45, v46);
  v48 = (char *)&v98 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF3E8);
  v100 = *(_QWORD *)(v102 - 8);
  MEMORY[0x24BDAC7A8](v102, v49, v50, v51, v52);
  v54 = (char *)&v98 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF3F0);
  v107 = *(_QWORD *)(v108 - 8);
  MEMORY[0x24BDAC7A8](v108, v55, v56, v57, v58);
  v104 = (char *)&v98 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = v1;
  v110 = v1;
  v118 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF3F8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF400);
  sub_22758AAC4();
  v60 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558DF420);
  v61 = sub_22730BB7C(&qword_2558DF428, &qword_2558DF420, MEMORY[0x24BDF4570]);
  v62 = sub_227366E40();
  v120 = v60;
  v121 = &type metadata for MFReaderPlaybackSpeed;
  v122 = v61;
  v123 = (char *)v62;
  swift_getOpaqueTypeConformance2();
  sub_22758DAA0();
  sub_22758D86C();
  v63 = sub_22730BB7C(&qword_2558DF430, &qword_2558DF3E0, MEMORY[0x24BDF1A70]);
  v64 = sub_2273096F0(&qword_2558D9090, (uint64_t (*)(uint64_t))MEMORY[0x24BDEF8D0], MEMORY[0x24BDEF8B0]);
  v98 = v54;
  v65 = v114;
  v66 = v117;
  sub_22758DB24();
  (*(void (**)(char *, uint64_t))(v113 + 8))(v41, v66);
  v67 = *(void (**)(char *, uint64_t))(v112 + 8);
  v68 = v48;
  v113 = v42;
  v69 = v42;
  v71 = v115;
  v70 = v116;
  v67(v68, v69);
  v72 = (void (*)(char *, _QWORD, uint64_t))v70[13];
  v72(v71, *MEMORY[0x24BDECF28], v13);
  v72(v65, *MEMORY[0x24BDECEA0], v13);
  sub_2273096F0(&qword_2558D9678, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], MEMORY[0x24BDECF70]);
  result = sub_22758E184();
  if ((result & 1) != 0)
  {
    v74 = v105;
    v75 = *(int *)(v105 + 48);
    v112 = v63;
    v76 = v103;
    v77 = &v103[v75];
    v78 = (void (*)(char *, char *, uint64_t))v70[4];
    v78(v103, v71, v13);
    v78(v77, v65, v13);
    v79 = v99;
    v80 = &v99[*(int *)(v74 + 48)];
    v115 = (char *)v64;
    v81 = (void (*)(char *, char *, uint64_t))v70[2];
    v81(v99, v76, v13);
    v81(v80, v77, v13);
    v82 = (uint64_t)v101;
    v78(v101, v79, v13);
    v83 = (void (*)(char *, uint64_t))v70[1];
    v83(v80, v13);
    v84 = &v79[*(int *)(v74 + 48)];
    v78(v79, v76, v13);
    v78(v84, v77, v13);
    v85 = (ValueMetadata *)v109;
    v78((char *)(v82 + *(int *)(v109 + 36)), v84, v13);
    v83(v79, v13);
    v86 = v106;
    sub_22758ABB4(v82, v106);
    v120 = v113;
    v121 = (ValueMetadata *)v117;
    v122 = v112;
    v123 = v115;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v88 = sub_22730BB7C(&qword_2558D9670, &qword_2558D95B0, MEMORY[0x24BEE08F8]);
    v89 = v104;
    v90 = v102;
    v91 = v98;
    sub_22758DB60();
    sub_22731A1A4(v86, &qword_2558D95B0);
    v92 = (*(uint64_t (**)(char *, uint64_t))(v100 + 8))(v91, v90);
    MEMORY[0x24BDAC7A8](v92, v93, v94, v95, v96);
    *(&v98 - 2) = v110;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF438);
    v120 = v90;
    v121 = v85;
    v122 = OpaqueTypeConformance2;
    v123 = (char *)v88;
    swift_getOpaqueTypeConformance2();
    sub_22730BB7C(&qword_2558DF440, &qword_2558DF438, MEMORY[0x24BDF4700]);
    v97 = v108;
    sub_22758DBF0();
    return (*(uint64_t (**)(char *, uint64_t))(v107 + 8))(v89, v97);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_227589ECC@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _OWORD *v11;
  __int128 v12;
  _QWORD v14[2];
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;

  v14[1] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF420);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5, v6, v7, v8);
  v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MFReaderSpeechFormatterModel(0);
  sub_2273096F0(&qword_2558D6750, type metadata accessor for MFReaderSpeechFormatterModel, (uint64_t)&unk_22759F010);
  sub_22758D458();
  swift_getKeyPath();
  sub_22758D464();
  swift_release();
  swift_release();
  v15 = v18;
  v16 = v19;
  v17 = v20;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF448);
  sub_22758AC0C();
  sub_22758AC50();
  sub_22758DD94();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_22758D194();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(v15) = v18;
  v11 = (_OWORD *)swift_allocObject();
  v12 = a1[1];
  v11[1] = *a1;
  v11[2] = v12;
  v11[3] = a1[2];
  *(_OWORD *)((char *)v11 + 57) = *(_OWORD *)((char *)a1 + 41);
  sub_22758AE04((uint64_t)a1);
  sub_22730BB7C(&qword_2558DF428, &qword_2558DF420, MEMORY[0x24BDF4570]);
  sub_227366E40();
  sub_22758DC38();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v10, v3);
}

uint64_t sub_22758A14C()
{
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558D72A0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF468);
  sub_22730BB7C(&qword_2558DF4A0, &qword_2558D72A0, MEMORY[0x24BEE12D8]);
  sub_22758ACB4();
  return sub_22758DE0C();
}

uint64_t sub_22758A214@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  char v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1;
  result = MFReaderPlaybackSpeed.localizedName.getter();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = MEMORY[0x24BEE4AF8];
  *(_BYTE *)(a2 + 32) = v3;
  *(_BYTE *)(a2 + 33) = v3;
  return result;
}

void sub_22758A26C(uint64_t a1, uint64_t a2, __int128 *a3)
{
  void *v3;
  id v4;
  unsigned __int8 v5[2];
  __int128 v6;

  v3 = (void *)*((_QWORD *)a3 + 4);
  if (v3)
  {
    v6 = *a3;
    swift_getKeyPath();
    swift_getKeyPath();
    v4 = v3;
    sub_227341B0C((uint64_t)&v6);
    sub_22758D194();
    swift_release();
    swift_release();
    sub_227335520((uint64_t)&v6);
    v5[0] = v5[1];
    sub_2273DE868(v5);

  }
  else
  {
    type metadata accessor for MFReaderBlockManager();
    sub_2273096F0((unint64_t *)&qword_2558D6758, (uint64_t (*)(uint64_t))type metadata accessor for MFReaderBlockManager, (uint64_t)&protocol conformance descriptor for MFReaderBlockManager);
    sub_22758D578();
    __break(1u);
  }
}

uint64_t sub_22758A360@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
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
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t ObjCClassFromMetadata;
  id v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE v44[4];
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  __int128 v60;
  _OWORD v61[2];

  v51 = a2;
  v3 = sub_22758D6F8();
  MEMORY[0x24BDAC7A8](v3, v4, v5, v6, v7);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF3F8);
  MEMORY[0x24BDAC7A8](v50, v8, v9, v10, v11);
  v13 = &v44[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v14, v15, v16, v17, v18);
  v49 = &v44[-v19];
  sub_22758D6EC();
  sub_22758D6E0();
  v61[0] = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_22758D194();
  swift_release();
  swift_release();
  sub_227335520((uint64_t)v61);
  LOBYTE(v60) = v54;
  MFReaderPlaybackSpeed.localizedName.getter();
  sub_22758D6D4();
  swift_bridgeObjectRelease();
  sub_22758D6E0();
  sub_22758D710();
  v20 = sub_22758DAD0();
  v46 = v21;
  v47 = v20;
  v22 = v21;
  v24 = v23;
  v48 = v23;
  v26 = v25 & 1;
  v45 = v25 & 1;
  v60 = a1[1];
  swift_retain();
  sub_22743A5C0();
  v28 = v27;
  sub_227335520((uint64_t)&v60);
  v54 = v20;
  v55 = v22;
  v56 = v26;
  v57 = v24;
  v58 = v28;
  v59 = 0;
  type metadata accessor for MAGUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v30 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v31 = (void *)sub_22758E1B4();
  v32 = (void *)sub_22758E1B4();
  v33 = objc_msgSend(v30, sel_localizedStringForKey_value_table_, v31, 0, v32);

  v34 = sub_22758E1E4();
  v36 = v35;

  v52 = v34;
  v53 = v36;
  sub_22731236C();
  v37 = sub_22758DAE8();
  v39 = v38;
  LOBYTE(v24) = v40 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2558DF418);
  sub_22758AB48();
  sub_22758DB78();
  sub_227335548(v37, v39, v24);
  swift_bridgeObjectRelease();
  sub_227335548(v47, v46, v45);
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_22758D194();
  swift_release();
  swift_release();
  sub_227335520((uint64_t)v61);
  LOBYTE(v54) = v52;
  v54 = MFReaderPlaybackSpeed.localizedName.getter();
  v55 = v41;
  v42 = (uint64_t)v49;
  sub_22758D4AC();
  swift_bridgeObjectRelease();
  sub_22731A1A4((uint64_t)v13, &qword_2558DF3F8);
  sub_22758D4C4();
  return sub_22731A1A4(v42, &qword_2558DF3F8);
}

__n128 sub_22758A7AC@<Q0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  __n128 result;
  __int128 v10;
  __n128 v11;
  char v12;
  uint64_t v13;
  __int128 v14;
  char v15;
  uint64_t v16;

  v4 = sub_22758D74C();
  sub_22758A82C(a1, (uint64_t)&v11);
  v5 = v12;
  v6 = v13;
  v7 = v15;
  v8 = v16;
  result = v11;
  v10 = v14;
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  *(__n128 *)(a2 + 24) = result;
  *(_BYTE *)(a2 + 40) = v5;
  *(_QWORD *)(a2 + 48) = v6;
  *(_OWORD *)(a2 + 56) = v10;
  *(_BYTE *)(a2 + 72) = v7;
  *(_QWORD *)(a2 + 80) = v8;
  return result;
}

uint64_t sub_22758A82C@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t ObjCClassFromMetadata;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  __int128 v21;

  v21 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_22758D194();
  swift_release();
  swift_release();
  sub_227335520((uint64_t)&v21);
  MFReaderPlaybackSpeed.localizedName.getter();
  sub_22731236C();
  v3 = sub_22758DAE8();
  v5 = v4;
  v7 = v6;
  v9 = v8 & 1;
  type metadata accessor for MAGUtilities();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v11 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v12 = (void *)sub_22758E1B4();
  v13 = (void *)sub_22758E1B4();
  v14 = objc_msgSend(v11, sel_localizedStringForKey_value_table_, v12, 0, v13);

  sub_22758E1E4();
  v15 = sub_22758DAE8();
  v17 = v16;
  LOBYTE(v12) = v18 & 1;
  *(_QWORD *)a2 = v3;
  *(_QWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 16) = v9;
  *(_QWORD *)(a2 + 24) = v7;
  *(_QWORD *)(a2 + 32) = v15;
  *(_QWORD *)(a2 + 40) = v16;
  *(_BYTE *)(a2 + 48) = v18 & 1;
  *(_QWORD *)(a2 + 56) = v19;
  sub_227409F64(v3, v5, v9);
  swift_bridgeObjectRetain();
  sub_227409F64(v15, v17, (char)v12);
  swift_bridgeObjectRetain();
  sub_227335548(v15, v17, (char)v12);
  swift_bridgeObjectRelease();
  sub_227335548(v3, v5, v9);
  return swift_bridgeObjectRelease();
}

uint64_t sub_22758AA74@<X0>(uint64_t a1@<X8>)
{
  return sub_227589808(a1);
}

uint64_t sub_22758AAB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_227589ECC(*(_OWORD **)(v1 + 16), a1);
}

uint64_t sub_22758AABC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_22758A360(*(_OWORD **)(v1 + 16), a1);
}

unint64_t sub_22758AAC4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2558DF408;
  if (!qword_2558DF408)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558DF3F8);
    v2[0] = sub_22758AB48();
    v2[1] = sub_2273096F0(&qword_2558D6590, MEMORY[0x24BDF1088], MEMORY[0x24BDF1078]);
    result = MEMORY[0x2276B3C78](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2558DF408);
  }
  return result;
}

unint64_t sub_22758AB48()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_2558DF410;
  if (!qword_2558DF410)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558DF418);
    v2 = sub_22750B8BC();
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x2276B3C78](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2558DF410);
  }
  return result;
}

uint64_t sub_22758ABB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558D95B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

double sub_22758ABFC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;

  *(_QWORD *)&result = sub_22758A7AC((__int128 *)*(_QWORD *)(v1 + 16), a1).n128_u64[0];
  return result;
}

unint64_t sub_22758AC0C()
{
  unint64_t result;

  result = qword_2558DF450;
  if (!qword_2558DF450)
  {
    result = MEMORY[0x2276B3C78](&protocol conformance descriptor for MFReaderPlaybackSpeed, &type metadata for MFReaderPlaybackSpeed);
    atomic_store(result, (unint64_t *)&qword_2558DF450);
  }
  return result;
}

unint64_t sub_22758AC50()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2558DF458;
  if (!qword_2558DF458)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558DF448);
    v2 = sub_22758ACB4();
    result = MEMORY[0x2276B3C78](MEMORY[0x24BDF4A08], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2558DF458);
  }
  return result;
}

unint64_t sub_22758ACB4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2558DF460;
  if (!qword_2558DF460)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558DF468);
    v2[0] = sub_22758AD38();
    v2[1] = sub_22730BB7C(&qword_2558DF490, &qword_2558DF498, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x2276B3C78](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2558DF460);
  }
  return result;
}

unint64_t sub_22758AD38()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2558DF470;
  if (!qword_2558DF470)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558DF478);
    v2 = sub_22730BB7C(&qword_2558DF480, &qword_2558DF488, MEMORY[0x24BDEFB48]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x2276B3C78](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2558DF470);
  }
  return result;
}

uint64_t sub_22758ADBC()
{
  uint64_t v0;

  swift_release();
  swift_release();

  sub_227341CF0(*(_QWORD *)(v0 + 64), *(_BYTE *)(v0 + 72));
  return swift_deallocObject();
}

void sub_22758ADFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_22758A26C(a1, a2, (__int128 *)(v2 + 16));
}

uint64_t sub_22758AE04(uint64_t a1)
{
  uint64_t v2;
  char v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_BYTE *)(a1 + 56);
  v4 = *(id *)(a1 + 32);
  swift_retain();
  swift_retain();
  sub_227341C6C(v2, v3);
  return a1;
}

float sub_22758AE64@<S0>(char *a1@<X0>, float *a2@<X8>)
{
  float result;

  result = flt_2275A8F40[*a1];
  *a2 = result;
  return result;
}

uint64_t sub_22758AE7C()
{
  uint64_t (*v0)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558DF3F0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558DF438);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558DF3E8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558D95B0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2558DF3E0);
  sub_22758D878();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEF8D0];
  sub_22730BB7C(&qword_2558DF430, &qword_2558DF3E0, MEMORY[0x24BDF1A70]);
  sub_2273096F0(&qword_2558D9090, v0, MEMORY[0x24BDEF8B0]);
  swift_getOpaqueTypeConformance2();
  sub_22730BB7C(&qword_2558D9670, &qword_2558D95B0, MEMORY[0x24BEE08F8]);
  swift_getOpaqueTypeConformance2();
  sub_22730BB7C(&qword_2558DF440, &qword_2558DF438, MEMORY[0x24BDF4700]);
  return swift_getOpaqueTypeConformance2();
}

void sub_22758AFEC(void *a1, __int128 *a2, uint64_t a3, unsigned __int8 a4)
{
  void *v4;
  void *v5;
  id v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat Height;
  id v23;
  void *v24;
  id v25;
  double v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  double v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  int v66;
  double v67;
  void *v68;
  uint64_t v69;
  CGFloat v70;
  void *v71;
  id v72;
  uint64_t v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  id v78;
  void *v79;
  uint64_t v80;
  CGFloat v81;
  uint64_t v82;
  void *v83;
  id v84;
  id v85;
  CGAffineTransform v86;
  double v87;
  double v88;
  double v89;
  double v90;
  char v91;
  CGRect v92;

  v5 = v4;
  objc_msgSend(v5, sel_addChildViewController_, a1);
  if (a4)
  {
    if (a4 == 1)
    {
      v10 = objc_msgSend(a1, sel_view);
      if (!v10)
      {
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
      v11 = v10;
      v12 = objc_msgSend(v5, sel_view);
      if (!v12)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v13 = v12;
      objc_msgSend(v12, sel_frame);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;

      v92.origin.x = v15;
      v92.origin.y = v17;
      v92.size.width = v19;
      v92.size.height = v21;
      Height = CGRectGetHeight(v92);
      CGAffineTransformMakeTranslation(&v86, 0.0, Height);
      objc_msgSend(v11, sel_setTransform_, &v86);

    }
  }
  else
  {
    v23 = objc_msgSend(a1, sel_view);
    if (!v23)
    {
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    v24 = v23;
    v25 = objc_msgSend(v23, sel_layer);

    LODWORD(v26) = 0;
    objc_msgSend(v25, sel_setOpacity_, v26);

  }
  v27 = objc_msgSend(v5, sel_view);
  if (!v27)
  {
    __break(1u);
    goto LABEL_32;
  }
  v28 = v27;
  v29 = objc_msgSend(a1, sel_view);
  if (!v29)
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v30 = v29;
  objc_msgSend(v28, sel_addSubview_, v29);

  sub_22758B9F0(a2, (uint64_t)&v87);
  v31 = v87;
  if (v91 != 1)
  {
    v75 = v88;
    v76 = v89;
    v77 = v90;
    v78 = objc_msgSend(a1, sel_view);
    if (v78)
    {
      v79 = v78;
      objc_msgSend(v78, sel_setFrame_, v31, v75, v76, v77);

      v66 = a4;
      if (a4)
        goto LABEL_24;
LABEL_28:
      v67 = *(double *)&a3;
      v68 = (void *)objc_opt_self();
      v80 = swift_allocObject();
      *(_QWORD *)(v80 + 16) = a1;
      *(_QWORD *)&v86.tx = sub_22758BA4C;
      *(_QWORD *)&v86.ty = v80;
      v81 = MEMORY[0x24BDAC760];
      *(_QWORD *)&v86.a = MEMORY[0x24BDAC760];
      *(_QWORD *)&v86.b = 1107296256;
      *(_QWORD *)&v86.c = sub_227367AE4;
      *(_QWORD *)&v86.d = &block_descriptor_12_4;
      v71 = _Block_copy(&v86);
      v72 = a1;
      swift_release();
      v82 = swift_allocObject();
      *(_QWORD *)(v82 + 16) = v72;
      *(_QWORD *)(v82 + 24) = v5;
      *(_QWORD *)&v86.tx = sub_22758BA94;
      *(_QWORD *)&v86.ty = v82;
      v86.a = v81;
      *(_QWORD *)&v86.b = 1107296256;
      v74 = &block_descriptor_18_2;
      goto LABEL_29;
    }
    goto LABEL_33;
  }
  if (*(_QWORD *)&v89 | *(_QWORD *)&v90 | *(_QWORD *)&v87 | *(_QWORD *)&v88)
    goto LABEL_23;
  v32 = objc_msgSend(a1, sel_view);
  if (!v32)
    goto LABEL_37;
  v33 = v32;
  objc_msgSend(v32, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v34 = objc_msgSend(v5, sel_view);
  if (!v34)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v35 = v34;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540BA320);
  v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_227598070;
  v37 = objc_msgSend(v5, sel_view);
  if (!v37)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v38 = v37;
  v39 = objc_msgSend(v37, sel_topAnchor);

  v40 = objc_msgSend(a1, sel_view);
  if (!v40)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v41 = v40;
  v42 = objc_msgSend(v40, sel_topAnchor);

  v43 = objc_msgSend(v39, sel_constraintEqualToAnchor_, v42);
  *(_QWORD *)(v36 + 32) = v43;
  v44 = objc_msgSend(v5, sel_view);
  if (!v44)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v45 = v44;
  v46 = objc_msgSend(v44, sel_bottomAnchor);

  v47 = objc_msgSend(a1, sel_view);
  if (!v47)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v48 = v47;
  v49 = objc_msgSend(v47, sel_bottomAnchor);

  v50 = objc_msgSend(v46, sel_constraintEqualToAnchor_, v49);
  *(_QWORD *)(v36 + 40) = v50;
  v51 = objc_msgSend(v5, sel_view);
  if (!v51)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v52 = v51;
  v53 = objc_msgSend(v51, sel_leftAnchor);

  v54 = objc_msgSend(a1, sel_view);
  if (!v54)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  v55 = v54;
  v56 = objc_msgSend(v54, sel_leftAnchor);

  v57 = objc_msgSend(v53, sel_constraintEqualToAnchor_, v56);
  *(_QWORD *)(v36 + 48) = v57;
  v58 = objc_msgSend(v5, sel_view);
  if (!v58)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  v59 = v58;
  v60 = objc_msgSend(v58, sel_rightAnchor);

  v61 = objc_msgSend(a1, sel_view);
  if (!v61)
  {
LABEL_46:
    __break(1u);
    return;
  }
  v62 = v61;
  v63 = objc_msgSend(v61, sel_rightAnchor);

  v64 = objc_msgSend(v60, sel_constraintEqualToAnchor_, v63);
  *(_QWORD *)(v36 + 56) = v64;
  *(_QWORD *)&v86.a = v36;
  sub_22758E3F4();
  sub_227390F80();
  v65 = (void *)sub_22758E3C4();
  swift_bridgeObjectRelease();
  objc_msgSend(v35, sel_addConstraints_, v65);

LABEL_23:
  v66 = a4;
  if (!a4)
    goto LABEL_28;
LABEL_24:
  if (v66 == 1)
  {
    v67 = *(double *)&a3;
    v68 = (void *)objc_opt_self();
    v69 = swift_allocObject();
    *(_QWORD *)(v69 + 16) = a1;
    *(_QWORD *)&v86.tx = sub_22758BA2C;
    *(_QWORD *)&v86.ty = v69;
    v70 = MEMORY[0x24BDAC760];
    *(_QWORD *)&v86.a = MEMORY[0x24BDAC760];
    *(_QWORD *)&v86.b = 1107296256;
    *(_QWORD *)&v86.c = sub_227367AE4;
    *(_QWORD *)&v86.d = &block_descriptor_63;
    v71 = _Block_copy(&v86);
    v72 = a1;
    swift_release();
    v73 = swift_allocObject();
    *(_QWORD *)(v73 + 16) = v72;
    *(_QWORD *)(v73 + 24) = v5;
    *(_QWORD *)&v86.tx = sub_22758BB5C;
    *(_QWORD *)&v86.ty = v73;
    v86.a = v70;
    *(_QWORD *)&v86.b = 1107296256;
    v74 = &block_descriptor_6_7;
LABEL_29:
    *(_QWORD *)&v86.c = sub_2273D1018;
    *(_QWORD *)&v86.d = v74;
    v83 = _Block_copy(&v86);
    v84 = v72;
    v85 = v5;
    swift_release();
    objc_msgSend(v68, sel_animateWithDuration_delay_options_animations_completion_, 0x20000, v71, v83, v67, 0.0, *(_OWORD *)&v86.a);
    _Block_release(v83);
    _Block_release(v71);
    return;
  }
  objc_msgSend(a1, sel_didMoveToParentViewController_, v5);
}

void sub_22758B7A8(void *a1)
{
  id v1;
  void *v2;
  CGAffineTransform v3;

  v1 = objc_msgSend(a1, sel_view);
  if (v1)
  {
    v2 = v1;
    CGAffineTransformMakeTranslation(&v3, 0.0, 0.0);
    objc_msgSend(v2, sel_setTransform_, &v3);

  }
  else
  {
    __break(1u);
  }
}

void sub_22758B820(void *a1)
{
  sub_22758B828(a1, 0.0);
}

void sub_22758B828(void *a1, float a2)
{
  id v3;
  void *v4;
  double v5;
  id v6;

  v3 = objc_msgSend(a1, sel_view);
  if (v3)
  {
    v4 = v3;
    v6 = objc_msgSend(v3, sel_layer);

    *(float *)&v5 = a2;
    objc_msgSend(v6, sel_setOpacity_, v5);

  }
  else
  {
    __break(1u);
  }
}

void sub_22758B8AC(void *a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat Height;
  CGAffineTransform v15;
  CGRect v16;

  v2 = objc_msgSend(a1, sel_view);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(a1, sel_view);
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, sel_frame);
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;

      v16.origin.x = v7;
      v16.origin.y = v9;
      v16.size.width = v11;
      v16.size.height = v13;
      Height = CGRectGetHeight(v16);
      CGAffineTransformMakeTranslation(&v15, 0.0, Height);
      objc_msgSend(v3, sel_setTransform_, &v15);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_22758B994(int a1, id a2)
{
  id result;
  id v4;

  result = objc_msgSend(a2, sel_view);
  if (result)
  {
    v4 = result;
    objc_msgSend(result, sel_removeFromSuperview);

    return objc_msgSend(a2, sel_removeFromParentViewController);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22758B9F0(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_BYTE *)(a2 + 32) = *((_BYTE *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_22758BA08()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_22758BA2C()
{
  uint64_t v0;

  sub_22758B7A8(*(void **)(v0 + 16));
}

uint64_t block_copy_helper_63(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_63()
{
  return swift_release();
}

void sub_22758BA4C()
{
  uint64_t v0;

  sub_22758B828(*(void **)(v0 + 16), 1.0);
}

uint64_t sub_22758BA68()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_22758BA94()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_didMoveToParentViewController_, *(_QWORD *)(v0 + 24));
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t _s11ChildSizingOwet(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t _s11ChildSizingOwst(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 33) = v3;
  return result;
}

uint64_t sub_22758BB0C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22758BB28(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    *(_BYTE *)(result + 32) = 0;
  }
  return result;
}

ValueMetadata *_s11ChildSizingOMa()
{
  return &_s11ChildSizingON;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_22758C4D4()
{
  return MEMORY[0x24BDB4DF8]();
}

uint64_t sub_22758C4E0()
{
  return MEMORY[0x24BDB4E10]();
}

uint64_t sub_22758C4EC()
{
  return MEMORY[0x24BDB4E60]();
}

uint64_t sub_22758C4F8()
{
  return MEMORY[0x24BDB4E68]();
}

uint64_t sub_22758C504()
{
  return MEMORY[0x24BDB51C0]();
}

uint64_t sub_22758C510()
{
  return MEMORY[0x24BDB5800]();
}

uint64_t sub_22758C51C()
{
  return MEMORY[0x24BDB5810]();
}

uint64_t sub_22758C528()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_22758C534()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_22758C540()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_22758C54C()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_22758C558()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_22758C564()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_22758C570()
{
  return MEMORY[0x24BDCB470]();
}

uint64_t sub_22758C57C()
{
  return MEMORY[0x24BDCB488]();
}

uint64_t sub_22758C588()
{
  return MEMORY[0x24BDCB498]();
}

uint64_t sub_22758C594()
{
  return MEMORY[0x24BDCB4A0]();
}

uint64_t sub_22758C5A0()
{
  return MEMORY[0x24BDCB558]();
}

uint64_t sub_22758C5AC()
{
  return MEMORY[0x24BDCB638]();
}

uint64_t sub_22758C5B8()
{
  return MEMORY[0x24BDCB6A0]();
}

uint64_t sub_22758C5C4()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_22758C5D0()
{
  return MEMORY[0x24BDCB6E8]();
}

uint64_t sub_22758C5DC()
{
  return MEMORY[0x24BDCB728]();
}

uint64_t sub_22758C5E8()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_22758C5F4()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_22758C600()
{
  return MEMORY[0x24BDCB918]();
}

uint64_t sub_22758C60C()
{
  return MEMORY[0x24BDCB928]();
}

uint64_t sub_22758C618()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_22758C624()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_22758C630()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_22758C63C()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_22758C648()
{
  return MEMORY[0x24BDEAD50]();
}

uint64_t sub_22758C654()
{
  return MEMORY[0x24BDCC2D8]();
}

uint64_t sub_22758C660()
{
  return MEMORY[0x24BDCC4F0]();
}

uint64_t sub_22758C66C()
{
  return MEMORY[0x24BDCC510]();
}

uint64_t sub_22758C678()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_22758C684()
{
  return MEMORY[0x24BDCC5D8]();
}

uint64_t sub_22758C690()
{
  return MEMORY[0x24BDCC608]();
}

uint64_t sub_22758C69C()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_22758C6A8()
{
  return MEMORY[0x24BEE6118]();
}

uint64_t sub_22758C6B4()
{
  return MEMORY[0x24BDCC7E8]();
}

uint64_t sub_22758C6C0()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_22758C6CC()
{
  return MEMORY[0x24BDCC890]();
}

uint64_t sub_22758C6D8()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_22758C6E4()
{
  return MEMORY[0x24BDCC978]();
}

uint64_t sub_22758C6F0()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t sub_22758C6FC()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t sub_22758C708()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t sub_22758C714()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_22758C720()
{
  return MEMORY[0x24BDCD2A0]();
}

uint64_t sub_22758C72C()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t sub_22758C738()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_22758C744()
{
  return MEMORY[0x24BDEAD90]();
}

uint64_t sub_22758C750()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_22758C75C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_22758C768()
{
  return MEMORY[0x24BDCD340]();
}

uint64_t sub_22758C774()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_22758C780()
{
  return MEMORY[0x24BDCD3B0]();
}

uint64_t sub_22758C78C()
{
  return MEMORY[0x24BDCD728]();
}

uint64_t sub_22758C798()
{
  return MEMORY[0x24BDCD730]();
}

uint64_t sub_22758C7A4()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t sub_22758C7B0()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_22758C7BC()
{
  return MEMORY[0x24BDCD848]();
}

uint64_t sub_22758C7C8()
{
  return MEMORY[0x24BDCD860]();
}

uint64_t sub_22758C7D4()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_22758C7E0()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_22758C7EC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_22758C7F8()
{
  return MEMORY[0x24BDCD908]();
}

uint64_t sub_22758C804()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_22758C810()
{
  return MEMORY[0x24BDCD938]();
}

uint64_t sub_22758C81C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_22758C828()
{
  return MEMORY[0x24BDCD9D8]();
}

uint64_t sub_22758C834()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_22758C840()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_22758C84C()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_22758C858()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_22758C864()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_22758C870()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_22758C87C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_22758C888()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_22758C894()
{
  return MEMORY[0x24BDCDD40]();
}

uint64_t sub_22758C8A0()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_22758C8AC()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_22758C8B8()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_22758C8C4()
{
  return MEMORY[0x24BDCE608]();
}

uint64_t sub_22758C8D0()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_22758C8DC()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_22758C8E8()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_22758C8F4()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_22758C900()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_22758C90C()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_22758C918()
{
  return MEMORY[0x24BDCE8C8]();
}

uint64_t sub_22758C924()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_22758C930()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_22758C93C()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_22758C948()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_22758C954()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_22758C960()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_22758C96C()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_22758C978()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_22758C984()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_22758C990()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_22758C99C()
{
  return MEMORY[0x24BDCEBE0]();
}

uint64_t sub_22758C9A8()
{
  return MEMORY[0x24BDCEC00]();
}

uint64_t sub_22758C9B4()
{
  return MEMORY[0x24BDCEC28]();
}

uint64_t sub_22758C9C0()
{
  return MEMORY[0x24BDCEC38]();
}

uint64_t sub_22758C9CC()
{
  return MEMORY[0x24BDCEC68]();
}

uint64_t sub_22758C9D8()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_22758C9E4()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_22758C9F0()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_22758C9FC()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_22758CA08()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_22758CA14()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_22758CA20()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_22758CA2C()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_22758CA38()
{
  return MEMORY[0x24BDCF368]();
}

uint64_t sub_22758CA44()
{
  return MEMORY[0x24BDCF428]();
}

uint64_t sub_22758CA50()
{
  return MEMORY[0x24BDCF4C8]();
}

uint64_t sub_22758CA5C()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_22758CA68()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_22758CA74()
{
  return MEMORY[0x24BDCF638]();
}

uint64_t sub_22758CA80()
{
  return MEMORY[0x24BDCF650]();
}

uint64_t sub_22758CA8C()
{
  return MEMORY[0x24BEBBE78]();
}

uint64_t sub_22758CA98()
{
  return MEMORY[0x24BEBBE88]();
}

uint64_t sub_22758CAA4()
{
  return MEMORY[0x24BEBBE90]();
}

uint64_t sub_22758CAB0()
{
  return MEMORY[0x24BEBBEA0]();
}

uint64_t sub_22758CABC()
{
  return MEMORY[0x24BEBBEA8]();
}

uint64_t sub_22758CAC8()
{
  return MEMORY[0x24BEBBEB8]();
}

uint64_t sub_22758CAD4()
{
  return MEMORY[0x24BDCF678]();
}

uint64_t sub_22758CAE0()
{
  return MEMORY[0x24BEE5B98]();
}

uint64_t sub_22758CAEC()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_22758CAF8()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_22758CB04()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_22758CB10()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_22758CB1C()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_22758CB28()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_22758CB34()
{
  return MEMORY[0x24BDCF758]();
}

uint64_t sub_22758CB40()
{
  return MEMORY[0x24BDCF760]();
}

uint64_t sub_22758CB4C()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_22758CB58()
{
  return MEMORY[0x24BEB5C98]();
}

uint64_t sub_22758CB64()
{
  return MEMORY[0x24BEB5CA0]();
}

uint64_t sub_22758CB70()
{
  return MEMORY[0x24BEB5CA8]();
}

uint64_t sub_22758CB7C()
{
  return MEMORY[0x24BEB5CC0]();
}

uint64_t sub_22758CB88()
{
  return MEMORY[0x24BEB5D50]();
}

uint64_t sub_22758CB94()
{
  return MEMORY[0x24BEB5E90]();
}

uint64_t sub_22758CBA0()
{
  return MEMORY[0x24BEB5EA0]();
}

uint64_t sub_22758CBAC()
{
  return MEMORY[0x24BEB5EA8]();
}

uint64_t sub_22758CBB8()
{
  return MEMORY[0x24BEB5EB0]();
}

uint64_t sub_22758CBC4()
{
  return MEMORY[0x24BEB5EB8]();
}

uint64_t sub_22758CBD0()
{
  return MEMORY[0x24BDFFB08]();
}

uint64_t sub_22758CBDC()
{
  return MEMORY[0x24BEB5EC0]();
}

uint64_t sub_22758CBE8()
{
  return MEMORY[0x24BEB5EF0]();
}

uint64_t sub_22758CBF4()
{
  return MEMORY[0x24BEB5FE8]();
}

uint64_t sub_22758CC00()
{
  return MEMORY[0x24BEB5FF8]();
}

uint64_t sub_22758CC0C()
{
  return MEMORY[0x24BEB6018]();
}

uint64_t sub_22758CC18()
{
  return MEMORY[0x24BEB6058]();
}

uint64_t sub_22758CC24()
{
  return MEMORY[0x24BEB6070]();
}

uint64_t sub_22758CC30()
{
  return MEMORY[0x24BEB6078]();
}

uint64_t sub_22758CC3C()
{
  return MEMORY[0x24BEB6080]();
}

uint64_t sub_22758CC48()
{
  return MEMORY[0x24BEB6088]();
}

uint64_t sub_22758CC54()
{
  return MEMORY[0x24BEB60C0]();
}

uint64_t sub_22758CC60()
{
  return MEMORY[0x24BEB60D0]();
}

uint64_t sub_22758CC6C()
{
  return MEMORY[0x24BEB6158]();
}

uint64_t sub_22758CC78()
{
  return MEMORY[0x24BEB6160]();
}

uint64_t sub_22758CC84()
{
  return MEMORY[0x24BEB6168]();
}

uint64_t sub_22758CC90()
{
  return MEMORY[0x24BEB6170]();
}

uint64_t sub_22758CC9C()
{
  return MEMORY[0x24BEB6178]();
}

uint64_t sub_22758CCA8()
{
  return MEMORY[0x24BEB6180]();
}

uint64_t sub_22758CCB4()
{
  return MEMORY[0x24BEB6188]();
}

uint64_t sub_22758CCC0()
{
  return MEMORY[0x24BEB61A8]();
}

uint64_t sub_22758CCCC()
{
  return MEMORY[0x24BEB61B8]();
}

uint64_t sub_22758CCD8()
{
  return MEMORY[0x24BEB61C0]();
}

uint64_t sub_22758CCE4()
{
  return MEMORY[0x24BEB61D0]();
}

uint64_t sub_22758CCF0()
{
  return MEMORY[0x24BEB61D8]();
}

uint64_t sub_22758CCFC()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_22758CD08()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_22758CD14()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_22758CD20()
{
  return MEMORY[0x24BDFDDA8]();
}

uint64_t sub_22758CD2C()
{
  return MEMORY[0x24BDFDDB0]();
}

uint64_t sub_22758CD38()
{
  return MEMORY[0x24BDFDDB8]();
}

uint64_t sub_22758CD44()
{
  return MEMORY[0x24BDFDE48]();
}

uint64_t sub_22758CD50()
{
  return MEMORY[0x24BDFDE58]();
}

uint64_t sub_22758CD5C()
{
  return MEMORY[0x24BDFDE60]();
}

uint64_t sub_22758CD68()
{
  return MEMORY[0x24BDFDE70]();
}

uint64_t sub_22758CD74()
{
  return MEMORY[0x24BDFDE78]();
}

uint64_t sub_22758CD80()
{
  return MEMORY[0x24BDFDE80]();
}

uint64_t sub_22758CD8C()
{
  return MEMORY[0x24BE63660]();
}

uint64_t sub_22758CD98()
{
  return MEMORY[0x24BE63668]();
}

uint64_t sub_22758CDA4()
{
  return MEMORY[0x24BE63670]();
}

uint64_t sub_22758CDB0()
{
  return MEMORY[0x24BE63678]();
}

uint64_t sub_22758CDBC()
{
  return MEMORY[0x24BE63680]();
}

uint64_t sub_22758CDC8()
{
  return MEMORY[0x24BE63688]();
}

uint64_t sub_22758CDD4()
{
  return MEMORY[0x24BE63690]();
}

uint64_t sub_22758CDE0()
{
  return MEMORY[0x24BE63698]();
}

uint64_t sub_22758CDEC()
{
  return MEMORY[0x24BE636A0]();
}

uint64_t sub_22758CDF8()
{
  return MEMORY[0x24BEE73C0]();
}

uint64_t sub_22758CE04()
{
  return MEMORY[0x24BEE7420]();
}

uint64_t sub_22758CE10()
{
  return MEMORY[0x24BDDAA18]();
}

uint64_t sub_22758CE1C()
{
  return MEMORY[0x24BDDAA28]();
}

uint64_t sub_22758CE28()
{
  return MEMORY[0x24BDDAA38]();
}

uint64_t sub_22758CE34()
{
  return MEMORY[0x24BDDAA40]();
}

uint64_t sub_22758CE40()
{
  return MEMORY[0x24BDDAA48]();
}

uint64_t sub_22758CE4C()
{
  return MEMORY[0x24BDDAA58]();
}

uint64_t sub_22758CE58()
{
  return MEMORY[0x24BDDAA60]();
}

uint64_t sub_22758CE64()
{
  return MEMORY[0x24BE08828]();
}

uint64_t sub_22758CE70()
{
  return MEMORY[0x24BE08848]();
}

uint64_t sub_22758CE7C()
{
  return MEMORY[0x24BE08888]();
}

uint64_t sub_22758CE88()
{
  return MEMORY[0x24BE088A8]();
}

uint64_t sub_22758CE94()
{
  return MEMORY[0x24BE088B0]();
}

uint64_t sub_22758CEA0()
{
  return MEMORY[0x24BE088C0]();
}

uint64_t sub_22758CEAC()
{
  return MEMORY[0x24BE088C8]();
}

uint64_t sub_22758CEB8()
{
  return MEMORY[0x24BEE6190]();
}

uint64_t sub_22758CEC4()
{
  return MEMORY[0x24BEE6310]();
}

uint64_t sub_22758CED0()
{
  return MEMORY[0x24BEE6318]();
}

uint64_t sub_22758CEDC()
{
  return MEMORY[0x24BEE6368]();
}

uint64_t sub_22758CEE8()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_22758CEF4()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_22758CF00()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_22758CF0C()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_22758CF18()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_22758CF24()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_22758CF30()
{
  return MEMORY[0x24BEE77C8]();
}

uint64_t sub_22758CF3C()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_22758CF48()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t sub_22758CF54()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t sub_22758CF60()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t sub_22758CF6C()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t sub_22758CF78()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t sub_22758CF84()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_22758CF90()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_22758CF9C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_22758CFA8()
{
  return MEMORY[0x24BE4F870]();
}

uint64_t sub_22758CFB4()
{
  return MEMORY[0x24BE4F880]();
}

uint64_t sub_22758CFC0()
{
  return MEMORY[0x24BE4F890]();
}

uint64_t sub_22758CFCC()
{
  return MEMORY[0x24BE4F898]();
}

uint64_t sub_22758CFD8()
{
  return MEMORY[0x24BEBC310]();
}

uint64_t sub_22758CFE4()
{
  return MEMORY[0x24BEBC690]();
}

uint64_t sub_22758CFF0()
{
  return MEMORY[0x24BEBC698]();
}

uint64_t sub_22758CFFC()
{
  return MEMORY[0x24BEBC6A0]();
}

uint64_t sub_22758D008()
{
  return MEMORY[0x24BEBC6D0]();
}

uint64_t sub_22758D014()
{
  return MEMORY[0x24BEBC6F0]();
}

uint64_t sub_22758D020()
{
  return MEMORY[0x24BEBC710]();
}

uint64_t sub_22758D02C()
{
  return MEMORY[0x24BEBC718]();
}

uint64_t sub_22758D038()
{
  return MEMORY[0x24BEBC730]();
}

uint64_t sub_22758D044()
{
  return MEMORY[0x24BEBC738]();
}

uint64_t sub_22758D050()
{
  return MEMORY[0x24BEBC740]();
}

uint64_t sub_22758D05C()
{
  return MEMORY[0x24BEBC820]();
}

uint64_t sub_22758D068()
{
  return MEMORY[0x24BEBC828]();
}

uint64_t sub_22758D074()
{
  return MEMORY[0x24BEBC838]();
}

uint64_t sub_22758D080()
{
  return MEMORY[0x24BEBC848]();
}

uint64_t sub_22758D08C()
{
  return MEMORY[0x24BEBC850]();
}

uint64_t sub_22758D098()
{
  return MEMORY[0x24BDBFC10]();
}

uint64_t sub_22758D0A4()
{
  return MEMORY[0x24BDBFCA8]();
}

uint64_t sub_22758D0B0()
{
  return MEMORY[0x24BDBFD80]();
}

uint64_t sub_22758D0BC()
{
  return MEMORY[0x24BDBFDD8]();
}

uint64_t sub_22758D0C8()
{
  return MEMORY[0x24BDB9448]();
}

uint64_t sub_22758D0D4()
{
  return MEMORY[0x24BDB9488]();
}

uint64_t sub_22758D0E0()
{
  return MEMORY[0x24BDB94A8]();
}

uint64_t sub_22758D0EC()
{
  return MEMORY[0x24BDB9550]();
}

uint64_t sub_22758D0F8()
{
  return MEMORY[0x24BDB99C8]();
}

uint64_t sub_22758D104()
{
  return MEMORY[0x24BDB9AC0]();
}

uint64_t sub_22758D110()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_22758D11C()
{
  return MEMORY[0x24BDB9B50]();
}

uint64_t sub_22758D128()
{
  return MEMORY[0x24BDB9B60]();
}

uint64_t sub_22758D134()
{
  return MEMORY[0x24BDEAE18]();
}

uint64_t sub_22758D140()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_22758D14C()
{
  return MEMORY[0x24BDB9C78]();
}

uint64_t sub_22758D158()
{
  return MEMORY[0x24BDB9C90]();
}

uint64_t sub_22758D164()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_22758D170()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_22758D17C()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_22758D188()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_22758D194()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_22758D1A0()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_22758D1AC()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_22758D1B8()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_22758D1C4()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t sub_22758D1D0()
{
  return MEMORY[0x24BDB9F38]();
}

uint64_t sub_22758D1DC()
{
  return MEMORY[0x24BDB9F88]();
}

uint64_t sub_22758D1E8()
{
  return MEMORY[0x24BDB9F90]();
}

uint64_t sub_22758D1F4()
{
  return MEMORY[0x24BDBA030]();
}

uint64_t sub_22758D200()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_22758D20C()
{
  return MEMORY[0x24BDBA0B0]();
}

uint64_t sub_22758D218()
{
  return MEMORY[0x24BDBA0C0]();
}

uint64_t sub_22758D224()
{
  return MEMORY[0x24BDBA0D0]();
}

uint64_t sub_22758D230()
{
  return MEMORY[0x24BDBA0E8]();
}

uint64_t sub_22758D23C()
{
  return MEMORY[0x24BDBA0F0]();
}

uint64_t sub_22758D248()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_22758D254()
{
  return MEMORY[0x24BDBA138]();
}

uint64_t sub_22758D260()
{
  return MEMORY[0x24BDE00C8]();
}

uint64_t sub_22758D26C()
{
  return MEMORY[0x24BDE0410]();
}

uint64_t sub_22758D278()
{
  return MEMORY[0x24BDE0418]();
}

uint64_t sub_22758D284()
{
  return MEMORY[0x24BDE0428]();
}

uint64_t sub_22758D290()
{
  return MEMORY[0x24BDE0440]();
}

uint64_t sub_22758D29C()
{
  return MEMORY[0x24BDE0630]();
}

uint64_t sub_22758D2A8()
{
  return MEMORY[0x24BDE0640]();
}

uint64_t sub_22758D2B4()
{
  return MEMORY[0x24BDE0650]();
}

uint64_t sub_22758D2C0()
{
  return MEMORY[0x24BDEAF20]();
}

uint64_t sub_22758D2CC()
{
  return MEMORY[0x24BDEAF28]();
}

uint64_t sub_22758D2D8()
{
  return MEMORY[0x24BDEAF30]();
}

uint64_t sub_22758D2E4()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_22758D2F0()
{
  return MEMORY[0x24BDEB170]();
}

uint64_t sub_22758D2FC()
{
  return MEMORY[0x24BDEB230]();
}

uint64_t sub_22758D308()
{
  return MEMORY[0x24BDEB2F0]();
}

uint64_t sub_22758D314()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_22758D320()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_22758D32C()
{
  return MEMORY[0x24BDEB4A0]();
}

uint64_t sub_22758D338()
{
  return MEMORY[0x24BDEB4C0]();
}

uint64_t sub_22758D344()
{
  return MEMORY[0x24BDEB4D0]();
}

uint64_t sub_22758D350()
{
  return MEMORY[0x24BDEB540]();
}

uint64_t sub_22758D35C()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_22758D368()
{
  return MEMORY[0x24BDEB5B8]();
}

uint64_t sub_22758D374()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_22758D380()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_22758D38C()
{
  return MEMORY[0x24BDEB828]();
}

uint64_t sub_22758D398()
{
  return MEMORY[0x24BDEBBB8]();
}

uint64_t sub_22758D3A4()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_22758D3B0()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_22758D3BC()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_22758D3C8()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_22758D3D4()
{
  return MEMORY[0x24BDEBF88]();
}

uint64_t sub_22758D3E0()
{
  return MEMORY[0x24BDEC000]();
}

uint64_t sub_22758D3EC()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_22758D3F8()
{
  return MEMORY[0x24BDEC138]();
}

uint64_t sub_22758D404()
{
  return MEMORY[0x24BDEC148]();
}

uint64_t sub_22758D410()
{
  return MEMORY[0x24BDEC4E0]();
}

uint64_t sub_22758D41C()
{
  return MEMORY[0x24BDEC5A0]();
}

uint64_t sub_22758D428()
{
  return MEMORY[0x24BDEC6D8]();
}

uint64_t sub_22758D434()
{
  return MEMORY[0x24BDEC6E0]();
}

uint64_t sub_22758D440()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_22758D44C()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_22758D458()
{
  return MEMORY[0x24BDEC9A0]();
}

uint64_t sub_22758D464()
{
  return MEMORY[0x24BDEC9B0]();
}

uint64_t sub_22758D470()
{
  return MEMORY[0x24BDECE88]();
}

uint64_t sub_22758D47C()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_22758D488()
{
  return MEMORY[0x24BDED1A0]();
}

uint64_t sub_22758D494()
{
  return MEMORY[0x24BDED1C8]();
}

uint64_t sub_22758D4A0()
{
  return MEMORY[0x24BDED1E0]();
}

uint64_t sub_22758D4AC()
{
  return MEMORY[0x24BDED210]();
}

uint64_t sub_22758D4B8()
{
  return MEMORY[0x24BDED248]();
}

uint64_t sub_22758D4C4()
{
  return MEMORY[0x24BDED250]();
}

uint64_t sub_22758D4D0()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_22758D4DC()
{
  return MEMORY[0x24BDED330]();
}

uint64_t sub_22758D4E8()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_22758D4F4()
{
  return MEMORY[0x24BDED3E0]();
}

uint64_t sub_22758D500()
{
  return MEMORY[0x24BDED3F0]();
}

uint64_t sub_22758D50C()
{
  return MEMORY[0x24BDED408]();
}

uint64_t sub_22758D518()
{
  return MEMORY[0x24BDED420]();
}

uint64_t sub_22758D524()
{
  return MEMORY[0x24BDED860]();
}

uint64_t sub_22758D530()
{
  return MEMORY[0x24BDED868]();
}

uint64_t sub_22758D53C()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_22758D548()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_22758D554()
{
  return MEMORY[0x24BDEDBF0]();
}

uint64_t sub_22758D560()
{
  return MEMORY[0x24BDEDD00]();
}

uint64_t sub_22758D56C()
{
  return MEMORY[0x24BDEDD10]();
}

uint64_t sub_22758D578()
{
  return MEMORY[0x24BDEDE50]();
}

uint64_t sub_22758D584()
{
  return MEMORY[0x24BDEDE60]();
}

uint64_t sub_22758D590()
{
  return MEMORY[0x24BDEDED8]();
}

uint64_t sub_22758D59C()
{
  return MEMORY[0x24BDEDEE0]();
}

uint64_t sub_22758D5A8()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_22758D5B4()
{
  return MEMORY[0x24BDEDF08]();
}

uint64_t sub_22758D5C0()
{
  return MEMORY[0x24BDEDF10]();
}

uint64_t sub_22758D5CC()
{
  return MEMORY[0x24BDEDF68]();
}

uint64_t sub_22758D5D8()
{
  return MEMORY[0x24BDEDF70]();
}

uint64_t sub_22758D5E4()
{
  return MEMORY[0x24BDEE020]();
}

uint64_t sub_22758D5F0()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_22758D5FC()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_22758D608()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_22758D614()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_22758D620()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_22758D62C()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_22758D638()
{
  return MEMORY[0x24BDEE3B0]();
}

uint64_t sub_22758D644()
{
  return MEMORY[0x24BDEE3B8]();
}

uint64_t sub_22758D650()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_22758D65C()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_22758D668()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_22758D674()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_22758D680()
{
  return MEMORY[0x24BDEE4C0]();
}

uint64_t sub_22758D68C()
{
  return MEMORY[0x24BDEE4D8]();
}

uint64_t sub_22758D698()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_22758D6A4()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_22758D6B0()
{
  return MEMORY[0x24BDEE628]();
}

uint64_t sub_22758D6BC()
{
  return MEMORY[0x24BDEE630]();
}

uint64_t sub_22758D6C8()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_22758D6D4()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_22758D6E0()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_22758D6EC()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_22758D6F8()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_22758D704()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_22758D710()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_22758D71C()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_22758D728()
{
  return MEMORY[0x24BDEECF8]();
}

uint64_t sub_22758D734()
{
  return MEMORY[0x24BDEED60]();
}

uint64_t sub_22758D740()
{
  return MEMORY[0x24BDEED88]();
}

uint64_t sub_22758D74C()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_22758D758()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_22758D764()
{
  return MEMORY[0x24BDEF038]();
}

uint64_t sub_22758D770()
{
  return MEMORY[0x24BDEF048]();
}

uint64_t sub_22758D77C()
{
  return MEMORY[0x24BDEF168]();
}

uint64_t sub_22758D788()
{
  return MEMORY[0x24BDEF1A0]();
}

uint64_t sub_22758D794()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_22758D7A0()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_22758D7AC()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_22758D7B8()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_22758D7C4()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_22758D7D0()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_22758D7DC()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_22758D7E8()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_22758D7F4()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_22758D800()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_22758D80C()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_22758D818()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_22758D824()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_22758D830()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_22758D83C()
{
  return MEMORY[0x24BDEF540]();
}

uint64_t sub_22758D848()
{
  return MEMORY[0x24BDEF6F0]();
}

uint64_t sub_22758D854()
{
  return MEMORY[0x24BDEF700]();
}

uint64_t sub_22758D860()
{
  return MEMORY[0x24BDEF740]();
}

uint64_t sub_22758D86C()
{
  return MEMORY[0x24BDEF8C0]();
}

uint64_t sub_22758D878()
{
  return MEMORY[0x24BDEF8D0]();
}

uint64_t sub_22758D884()
{
  return MEMORY[0x24BDEF950]();
}

uint64_t sub_22758D890()
{
  return MEMORY[0x24BDEF998]();
}

uint64_t sub_22758D89C()
{
  return MEMORY[0x24BDEFCA8]();
}

uint64_t sub_22758D8A8()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_22758D8B4()
{
  return MEMORY[0x24BDF0138]();
}

uint64_t sub_22758D8C0()
{
  return MEMORY[0x24BDF0158]();
}

uint64_t sub_22758D8CC()
{
  return MEMORY[0x24BDF0A18]();
}

uint64_t sub_22758D8D8()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t sub_22758D8E4()
{
  return MEMORY[0x24BDF0AF0]();
}

uint64_t sub_22758D8F0()
{
  return MEMORY[0x24BDF0D98]();
}

uint64_t sub_22758D8FC()
{
  return MEMORY[0x24BDF0DA8]();
}

uint64_t sub_22758D908()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_22758D914()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_22758D920()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_22758D92C()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_22758D938()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_22758D944()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_22758D950()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_22758D95C()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_22758D968()
{
  return MEMORY[0x24BDF0F38]();
}

uint64_t sub_22758D974()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_22758D980()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_22758D98C()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_22758D998()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_22758D9A4()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_22758D9B0()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_22758D9BC()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_22758D9C8()
{
  return MEMORY[0x24BDF14E8]();
}

uint64_t sub_22758D9D4()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_22758D9E0()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_22758D9EC()
{
  return MEMORY[0x24BDF1560]();
}

uint64_t sub_22758D9F8()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_22758DA04()
{
  return MEMORY[0x24BDF1640]();
}

uint64_t sub_22758DA10()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_22758DA1C()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_22758DA28()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_22758DA34()
{
  return MEMORY[0x24BDF1728]();
}

uint64_t sub_22758DA40()
{
  return MEMORY[0x24BDF1730]();
}

uint64_t sub_22758DA4C()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_22758DA58()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_22758DA64()
{
  return MEMORY[0x24BDF1790]();
}

uint64_t sub_22758DA70()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_22758DA7C()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_22758DA88()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_22758DA94()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_22758DAA0()
{
  return MEMORY[0x24BDF1A48]();
}

uint64_t sub_22758DAAC()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_22758DAB8()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_22758DAC4()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_22758DAD0()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_22758DADC()
{
  return MEMORY[0x24BDF1FD8]();
}

uint64_t sub_22758DAE8()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_22758DAF4()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_22758DB00()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_22758DB0C()
{
  return MEMORY[0x24BDF2100]();
}

uint64_t sub_22758DB18()
{
  return MEMORY[0x24BDF2258]();
}

uint64_t sub_22758DB24()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_22758DB30()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_22758DB3C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_22758DB48()
{
  return MEMORY[0x24BDF2790]();
}

uint64_t sub_22758DB54()
{
  return MEMORY[0x24BDF27E0]();
}

uint64_t sub_22758DB60()
{
  return MEMORY[0x24BDF27F0]();
}

uint64_t sub_22758DB6C()
{
  return MEMORY[0x24BDF2880]();
}

uint64_t sub_22758DB78()
{
  return MEMORY[0x24BDF2B40]();
}

uint64_t sub_22758DB84()
{
  return MEMORY[0x24BDF2B50]();
}

uint64_t sub_22758DB90()
{
  return MEMORY[0x24BDF2B68]();
}

uint64_t sub_22758DB9C()
{
  return MEMORY[0x24BDF2D30]();
}

uint64_t sub_22758DBA8()
{
  return MEMORY[0x24BDF2DC0]();
}

uint64_t sub_22758DBB4()
{
  return MEMORY[0x24BDF2E80]();
}

uint64_t sub_22758DBC0()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t sub_22758DBCC()
{
  return MEMORY[0x24BDF3020]();
}

uint64_t sub_22758DBD8()
{
  return MEMORY[0x24BDF30D8]();
}

uint64_t sub_22758DBE4()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_22758DBF0()
{
  return MEMORY[0x24BDF3420]();
}

uint64_t sub_22758DBFC()
{
  return MEMORY[0x24BDF3628]();
}

uint64_t sub_22758DC08()
{
  return MEMORY[0x24BDF3690]();
}

uint64_t sub_22758DC14()
{
  return MEMORY[0x24BDF37C8]();
}

uint64_t sub_22758DC20()
{
  return MEMORY[0x24BDF3840]();
}

uint64_t sub_22758DC2C()
{
  return MEMORY[0x24BDF38C8]();
}

uint64_t sub_22758DC38()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_22758DC44()
{
  return MEMORY[0x24BDF3AD0]();
}

uint64_t sub_22758DC50()
{
  return MEMORY[0x24BDF3BD8]();
}

uint64_t sub_22758DC5C()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_22758DC68()
{
  return MEMORY[0x24BDF3BF8]();
}

uint64_t sub_22758DC74()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_22758DC80()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_22758DC8C()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_22758DC98()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_22758DCA4()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_22758DCB0()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_22758DCBC()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_22758DCC8()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_22758DCD4()
{
  return MEMORY[0x24BDF3E78]();
}

uint64_t sub_22758DCE0()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_22758DCEC()
{
  return MEMORY[0x24BDF3EC0]();
}

uint64_t sub_22758DCF8()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_22758DD04()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_22758DD10()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_22758DD1C()
{
  return MEMORY[0x24BDF4048]();
}

uint64_t sub_22758DD28()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_22758DD34()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_22758DD40()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_22758DD4C()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_22758DD58()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_22758DD64()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_22758DD70()
{
  return MEMORY[0x24BDF4378]();
}

uint64_t sub_22758DD7C()
{
  return MEMORY[0x24BDF4380]();
}

uint64_t sub_22758DD88()
{
  return MEMORY[0x24BDF4398]();
}

uint64_t sub_22758DD94()
{
  return MEMORY[0x24BDF4518]();
}

uint64_t sub_22758DDA0()
{
  return MEMORY[0x24BDF4550]();
}

uint64_t sub_22758DDAC()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t sub_22758DDB8()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_22758DDC4()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_22758DDD0()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_22758DDDC()
{
  return MEMORY[0x24BDF47E0]();
}

uint64_t sub_22758DDE8()
{
  return MEMORY[0x24BDF47F8]();
}

uint64_t sub_22758DDF4()
{
  return MEMORY[0x24BDF4908]();
}

uint64_t sub_22758DE00()
{
  return MEMORY[0x24BDF4918]();
}

uint64_t sub_22758DE0C()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_22758DE18()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_22758DE24()
{
  return MEMORY[0x24BDF4A40]();
}

uint64_t sub_22758DE30()
{
  return MEMORY[0x24BDF4A88]();
}

uint64_t sub_22758DE3C()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_22758DE48()
{
  return MEMORY[0x24BDF4D48]();
}

uint64_t sub_22758DE54()
{
  return MEMORY[0x24BDF4D58]();
}

uint64_t sub_22758DE60()
{
  return MEMORY[0x24BDF4D80]();
}

uint64_t sub_22758DE6C()
{
  return MEMORY[0x24BDF4E20]();
}

uint64_t sub_22758DE78()
{
  return MEMORY[0x24BDF4E58]();
}

uint64_t sub_22758DE84()
{
  return MEMORY[0x24BDF4EF0]();
}

uint64_t sub_22758DE90()
{
  return MEMORY[0x24BDF4F00]();
}

uint64_t sub_22758DE9C()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_22758DEA8()
{
  return MEMORY[0x24BDF4FE0]();
}

uint64_t sub_22758DEB4()
{
  return MEMORY[0x24BDF5010]();
}

uint64_t sub_22758DEC0()
{
  return MEMORY[0x24BDF51E8]();
}

uint64_t sub_22758DECC()
{
  return MEMORY[0x24BDF5368]();
}

uint64_t sub_22758DED8()
{
  return MEMORY[0x24BDF5380]();
}

uint64_t sub_22758DEE4()
{
  return MEMORY[0x24BDF5478]();
}

uint64_t sub_22758DEF0()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_22758DEFC()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_22758DF08()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_22758DF14()
{
  return MEMORY[0x24BEE5450]();
}

uint64_t sub_22758DF20()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_22758DF2C()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_22758DF38()
{
  return MEMORY[0x24BEE54C0]();
}

uint64_t sub_22758DF44()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_22758DF50()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_22758DF5C()
{
  return MEMORY[0x24BEE54E8]();
}

uint64_t sub_22758DF68()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_22758DF74()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_22758DF80()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_22758DF8C()
{
  return MEMORY[0x24BEE55C0]();
}

uint64_t sub_22758DF98()
{
  return MEMORY[0x24BEE55D8]();
}

uint64_t sub_22758DFA4()
{
  return MEMORY[0x24BEE55E0]();
}

uint64_t sub_22758DFB0()
{
  return MEMORY[0x24BEE55F8]();
}

uint64_t sub_22758DFBC()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_22758DFC8()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_22758DFD4()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_22758DFE0()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_22758DFEC()
{
  return MEMORY[0x24BDE3948]();
}

uint64_t sub_22758DFF8()
{
  return MEMORY[0x24BDE3950]();
}

uint64_t sub_22758E004()
{
  return MEMORY[0x24BDE3960]();
}

uint64_t sub_22758E010()
{
  return MEMORY[0x24BDE3970]();
}

uint64_t sub_22758E01C()
{
  return MEMORY[0x24BDE3988]();
}

uint64_t sub_22758E028()
{
  return MEMORY[0x24BDE39C0]();
}

uint64_t sub_22758E034()
{
  return MEMORY[0x24BDE3A20]();
}

uint64_t sub_22758E040()
{
  return MEMORY[0x24BDE3A60]();
}

uint64_t sub_22758E04C()
{
  return MEMORY[0x24BDE3A98]();
}

uint64_t sub_22758E058()
{
  return MEMORY[0x24BDE3AF8]();
}

uint64_t sub_22758E064()
{
  return MEMORY[0x24BDF9F98]();
}

uint64_t sub_22758E070()
{
  return MEMORY[0x24BDF9FA0]();
}

uint64_t sub_22758E07C()
{
  return MEMORY[0x24BDF9FB8]();
}

uint64_t sub_22758E088()
{
  return MEMORY[0x24BDF9FC0]();
}

uint64_t sub_22758E094()
{
  return MEMORY[0x24BDF9FC8]();
}

uint64_t sub_22758E0A0()
{
  return MEMORY[0x24BDF9FD8]();
}

uint64_t sub_22758E0AC()
{
  return MEMORY[0x24BDF9FE0]();
}

uint64_t sub_22758E0B8()
{
  return MEMORY[0x24BDFA070]();
}

uint64_t sub_22758E0C4()
{
  return MEMORY[0x24BDFA078]();
}

uint64_t sub_22758E0D0()
{
  return MEMORY[0x24BDFA080]();
}

uint64_t sub_22758E0DC()
{
  return MEMORY[0x24BDFA098]();
}

uint64_t sub_22758E0E8()
{
  return MEMORY[0x24BDFA0A0]();
}

uint64_t sub_22758E0F4()
{
  return MEMORY[0x24BDFA0A8]();
}

uint64_t sub_22758E100()
{
  return MEMORY[0x24BDFA0B0]();
}

uint64_t sub_22758E10C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_22758E118()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_22758E124()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_22758E130()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_22758E13C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_22758E148()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_22758E154()
{
  return MEMORY[0x24BEE75F0]();
}

uint64_t sub_22758E160()
{
  return MEMORY[0x24BEE75F8]();
}

uint64_t sub_22758E16C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_22758E178()
{
  return MEMORY[0x24BEE07D8]();
}

uint64_t sub_22758E184()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_22758E190()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_22758E19C()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_22758E1A8()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_22758E1B4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22758E1C0()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_22758E1CC()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_22758E1D8()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_22758E1E4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22758E1F0()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_22758E1FC()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_22758E208()
{
  return MEMORY[0x24BDCFA68]();
}

uint64_t sub_22758E214()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_22758E220()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_22758E22C()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_22758E238()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_22758E244()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_22758E250()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_22758E25C()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_22758E268()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_22758E274()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22758E280()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_22758E28C()
{
  return MEMORY[0x24BEE0B78]();
}

uint64_t sub_22758E298()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_22758E2A4()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_22758E2B0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22758E2BC()
{
  return MEMORY[0x24BEE0BE0]();
}

uint64_t sub_22758E2C8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22758E2D4()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_22758E2E0()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_22758E2EC()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_22758E2F8()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_22758E304()
{
  return MEMORY[0x24BEE0C60]();
}

uint64_t sub_22758E310()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_22758E31C()
{
  return MEMORY[0x24BEE0CE8]();
}

uint64_t sub_22758E328()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_22758E334()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_22758E340()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_22758E34C()
{
  return MEMORY[0x24BEE0E48]();
}

uint64_t sub_22758E358()
{
  return MEMORY[0x24BEE0E98]();
}

uint64_t sub_22758E364()
{
  return MEMORY[0x24BEE0EB8]();
}

uint64_t sub_22758E370()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_22758E37C()
{
  return MEMORY[0x24BEE1010]();
}

uint64_t sub_22758E388()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_22758E394()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_22758E3A0()
{
  return MEMORY[0x24BEE1090]();
}

uint64_t sub_22758E3AC()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_22758E3B8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_22758E3C4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_22758E3D0()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_22758E3DC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_22758E3E8()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_22758E3F4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_22758E400()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_22758E40C()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_22758E418()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_22758E424()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_22758E430()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_22758E43C()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_22758E448()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_22758E454()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_22758E460()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_22758E46C()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_22758E478()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_22758E484()
{
  return MEMORY[0x24BEE68D8]();
}

uint64_t sub_22758E490()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_22758E49C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_22758E4A8()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_22758E4B4()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_22758E4C0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_22758E4CC()
{
  return MEMORY[0x24BEE69A8]();
}

uint64_t sub_22758E4D8()
{
  return MEMORY[0x24BEE69F8]();
}

uint64_t sub_22758E4E4()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_22758E4F0()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_22758E4FC()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_22758E508()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_22758E514()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_22758E520()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_22758E52C()
{
  return MEMORY[0x24BEE6C50]();
}

uint64_t sub_22758E538()
{
  return MEMORY[0x24BEE6C90]();
}

uint64_t sub_22758E544()
{
  return MEMORY[0x24BEE6CC0]();
}

uint64_t sub_22758E550()
{
  return MEMORY[0x24BEE6CC8]();
}

uint64_t sub_22758E55C()
{
  return MEMORY[0x24BEE6CE0]();
}

uint64_t sub_22758E568()
{
  return MEMORY[0x24BEE6CE8]();
}

uint64_t sub_22758E574()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_22758E580()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_22758E58C()
{
  return MEMORY[0x24BDCFC78]();
}

uint64_t sub_22758E598()
{
  return MEMORY[0x24BDCFC80]();
}

uint64_t sub_22758E5A4()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_22758E5B0()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_22758E5BC()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_22758E5C8()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_22758E5D4()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_22758E5E0()
{
  return MEMORY[0x24BDCFD18]();
}

uint64_t sub_22758E5EC()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_22758E5F8()
{
  return MEMORY[0x24BDCFD30]();
}

uint64_t sub_22758E604()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_22758E610()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_22758E61C()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_22758E628()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_22758E634()
{
  return MEMORY[0x24BDCFD70]();
}

uint64_t sub_22758E640()
{
  return MEMORY[0x24BDBD758]();
}

uint64_t sub_22758E64C()
{
  return MEMORY[0x24BEE5E78]();
}

uint64_t sub_22758E658()
{
  return MEMORY[0x24BEE5E88]();
}

uint64_t sub_22758E664()
{
  return MEMORY[0x24BEE5E98]();
}

uint64_t sub_22758E670()
{
  return MEMORY[0x24BDBD780]();
}

uint64_t sub_22758E67C()
{
  return MEMORY[0x24BDBFE88]();
}

uint64_t sub_22758E688()
{
  return MEMORY[0x24BDCFDF8]();
}

uint64_t sub_22758E694()
{
  return MEMORY[0x24BEDF2F0]();
}

uint64_t sub_22758E6A0()
{
  return MEMORY[0x24BEDF300]();
}

uint64_t sub_22758E6AC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_22758E6B8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_22758E6C4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_22758E6D0()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_22758E6DC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_22758E6E8()
{
  return MEMORY[0x24BEE79B8]();
}

uint64_t sub_22758E6F4()
{
  return MEMORY[0x24BEDF418]();
}

uint64_t sub_22758E700()
{
  return MEMORY[0x24BEDF420]();
}

uint64_t sub_22758E70C()
{
  return MEMORY[0x24BDBD800]();
}

uint64_t sub_22758E718()
{
  return MEMORY[0x24BEBCCB0]();
}

uint64_t sub_22758E724()
{
  return MEMORY[0x24BEE5660]();
}

uint64_t sub_22758E730()
{
  return MEMORY[0x24BEE5678]();
}

uint64_t sub_22758E73C()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_22758E748()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_22758E754()
{
  return MEMORY[0x24BEE56C0]();
}

uint64_t sub_22758E760()
{
  return MEMORY[0x24BEE56C8]();
}

uint64_t sub_22758E76C()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_22758E778()
{
  return MEMORY[0x24BEE5708]();
}

uint64_t sub_22758E784()
{
  return MEMORY[0x24BEE5728]();
}

uint64_t sub_22758E790()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_22758E79C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_22758E7A8()
{
  return MEMORY[0x24BEE5778]();
}

uint64_t sub_22758E7B4()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_22758E7C0()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_22758E7CC()
{
  return MEMORY[0x24BEE5798]();
}

uint64_t sub_22758E7D8()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_22758E7E4()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_22758E7F0()
{
  return MEMORY[0x24BEE5EA8]();
}

uint64_t sub_22758E7FC()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_22758E808()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_22758E814()
{
  return MEMORY[0x24BEE7958]();
}

uint64_t sub_22758E820()
{
  return MEMORY[0x24BEDF438]();
}

uint64_t sub_22758E82C()
{
  return MEMORY[0x24BDD0078]();
}

uint64_t sub_22758E838()
{
  return MEMORY[0x24BDD0098]();
}

uint64_t sub_22758E844()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_22758E850()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_22758E85C()
{
  return MEMORY[0x24BEDF460]();
}

uint64_t sub_22758E868()
{
  return MEMORY[0x24BDD00A8]();
}

uint64_t sub_22758E874()
{
  return MEMORY[0x24BDE3B70]();
}

uint64_t sub_22758E880()
{
  return MEMORY[0x24BDE3B78]();
}

uint64_t sub_22758E88C()
{
  return MEMORY[0x24BEBCD90]();
}

uint64_t sub_22758E898()
{
  return MEMORY[0x24BEE5930]();
}

uint64_t sub_22758E8A4()
{
  return MEMORY[0x24BEE5948]();
}

uint64_t sub_22758E8B0()
{
  return MEMORY[0x24BDBD840]();
}

uint64_t sub_22758E8BC()
{
  return MEMORY[0x24BEE5320]();
}

uint64_t sub_22758E8C8()
{
  return MEMORY[0x24BEBCFA0]();
}

uint64_t sub_22758E8D4()
{
  return MEMORY[0x24BDD0140]();
}

uint64_t sub_22758E8E0()
{
  return MEMORY[0x24BDBD868]();
}

uint64_t sub_22758E8EC()
{
  return MEMORY[0x24BDBFEA0]();
}

uint64_t sub_22758E8F8()
{
  return MEMORY[0x24BDBFEC0]();
}

uint64_t sub_22758E904()
{
  return MEMORY[0x24BDF5540]();
}

uint64_t sub_22758E910()
{
  return MEMORY[0x24BEDF370]();
}

uint64_t sub_22758E91C()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_22758E928()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_22758E934()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_22758E940()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_22758E94C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_22758E958()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_22758E964()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_22758E970()
{
  return MEMORY[0x24BDD0248]();
}

uint64_t sub_22758E97C()
{
  return MEMORY[0x24BEBD030]();
}

uint64_t sub_22758E988()
{
  return MEMORY[0x24BEBD098]();
}

uint64_t sub_22758E994()
{
  return MEMORY[0x24BEBD0A0]();
}

uint64_t sub_22758E9A0()
{
  return MEMORY[0x24BEBD0B8]();
}

uint64_t sub_22758E9AC()
{
  return MEMORY[0x24BEBD128]();
}

uint64_t sub_22758E9B8()
{
  return MEMORY[0x24BEBD130]();
}

uint64_t sub_22758E9C4()
{
  return MEMORY[0x24BEBD1A8]();
}

uint64_t sub_22758E9D0()
{
  return MEMORY[0x24BEBD1C8]();
}

uint64_t sub_22758E9DC()
{
  return MEMORY[0x24BEBD1F8]();
}

uint64_t sub_22758E9E8()
{
  return MEMORY[0x24BEBD210]();
}

uint64_t sub_22758E9F4()
{
  return MEMORY[0x24BEBD218]();
}

uint64_t sub_22758EA00()
{
  return MEMORY[0x24BDD03C0]();
}

uint64_t sub_22758EA0C()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t sub_22758EA18()
{
  return MEMORY[0x24BEE7978]();
}

uint64_t sub_22758EA24()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_22758EA30()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_22758EA3C()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_22758EA48()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_22758EA54()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_22758EA60()
{
  return MEMORY[0x24BDD04B8]();
}

uint64_t sub_22758EA6C()
{
  return MEMORY[0x24BDD0538]();
}

uint64_t sub_22758EA78()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_22758EA84()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_22758EA90()
{
  return MEMORY[0x24BDD0570]();
}

uint64_t sub_22758EA9C()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_22758EAA8()
{
  return MEMORY[0x24BEE5E68]();
}

uint64_t sub_22758EAB4()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_22758EAC0()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_22758EACC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_22758EAD8()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_22758EAE4()
{
  return MEMORY[0x24BEE22D8]();
}

uint64_t sub_22758EAF0()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_22758EAFC()
{
  return MEMORY[0x24BEE22F8]();
}

uint64_t sub_22758EB08()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_22758EB14()
{
  return MEMORY[0x24BEE2318]();
}

uint64_t sub_22758EB20()
{
  return MEMORY[0x24BEE2320]();
}

uint64_t sub_22758EB2C()
{
  return MEMORY[0x24BEE2328]();
}

uint64_t sub_22758EB38()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_22758EB44()
{
  return MEMORY[0x24BEE2348]();
}

uint64_t sub_22758EB50()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_22758EB5C()
{
  return MEMORY[0x24BEE2368]();
}

uint64_t sub_22758EB68()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_22758EB74()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_22758EB80()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_22758EB8C()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_22758EB98()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_22758EBA4()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_22758EBB0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22758EBBC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22758EBC8()
{
  return MEMORY[0x24BEE2578]();
}

uint64_t sub_22758EBD4()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_22758EBE0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_22758EBEC()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_22758EBF8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22758EC04()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_22758EC10()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_22758EC1C()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_22758EC28()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_22758EC34()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_22758EC40()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_22758EC4C()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_22758EC58()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_22758EC64()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_22758EC70()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_22758EC7C()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_22758EC88()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_22758EC94()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_22758ECA0()
{
  return MEMORY[0x24BEE2B80]();
}

uint64_t sub_22758ECAC()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_22758ECB8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_22758ECC4()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_22758ECD0()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_22758ECDC()
{
  return MEMORY[0x24BEE2FB0]();
}

uint64_t sub_22758ECE8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_22758ECF4()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_22758ED00()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_22758ED0C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_22758ED18()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_22758ED24()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_22758ED30()
{
  return MEMORY[0x24BEE30D0]();
}

uint64_t sub_22758ED3C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_22758ED48()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_22758ED54()
{
  return MEMORY[0x24BEE32F0]();
}

uint64_t sub_22758ED60()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_22758ED6C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_22758ED78()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_22758ED84()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_22758ED90()
{
  return MEMORY[0x24BEE3368]();
}

uint64_t sub_22758ED9C()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_22758EDA8()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_22758EDB4()
{
  return MEMORY[0x24BEE3440]();
}

uint64_t sub_22758EDC0()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_22758EDCC()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_22758EDD8()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_22758EDE4()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_22758EDF0()
{
  return MEMORY[0x24BEE34B8]();
}

uint64_t sub_22758EDFC()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_22758EE08()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_22758EE14()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_22758EE20()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_22758EE2C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_22758EE38()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_22758EE44()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_22758EE50()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22758EE5C()
{
  return MEMORY[0x24BEE7098]();
}

uint64_t sub_22758EE68()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_22758EE74()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_22758EE80()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_22758EE8C()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_22758EE98()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_22758EEA4()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_22758EEB0()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_22758EEBC()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_22758EEC8()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_22758EED4()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_22758EEE0()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_22758EEEC()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_22758EEF8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_22758EF04()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_22758EF10()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_22758EF1C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_22758EF28()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_22758EF34()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_22758EF40()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_22758EF4C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22758EF58()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22758EF64()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_22758EF70()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_22758EF7C()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_22758EF88()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_22758EF94()
{
  return MEMORY[0x24BEE4358]();
}

uint64_t sub_22758EFA0()
{
  return MEMORY[0x24BEE43D0]();
}

uint64_t sub_22758EFAC()
{
  return MEMORY[0x24BEE43D8]();
}

uint64_t sub_22758EFB8()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_22758EFC4()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_22758EFD0()
{
  return MEMORY[0x24BEE48A0]();
}

uint64_t sub_22758EFDC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_22758EFE8()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_22758EFF4()
{
  return MEMORY[0x24BEE4A18]();
}

uint64_t sub_22758F000()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t ARCameraToDisplayRotation()
{
  return MEMORY[0x24BDB1418]();
}

uint64_t ARVisionCameraToRenderingCoordinateTransform()
{
  return MEMORY[0x24BDB1460]();
}

uint64_t ARVisionToRenderingCoordinateTransform()
{
  return MEMORY[0x24BDB1468]();
}

uint64_t AVCaptureSessionSetAuthorizedToUseCameraInMultipleForegroundAppLayout()
{
  return MEMORY[0x24BDB1B60]();
}

uint64_t AXAttributedStringForBetterPronuciation()
{
  return MEMORY[0x24BEBAD48]();
}

uint64_t AXDeviceHasStaccato()
{
  return MEMORY[0x24BDFDFD0]();
}

uint64_t AXDeviceSupportsBackTap()
{
  return MEMORY[0x24BDFFFD8]();
}

uint64_t AXDeviceSupportsDetectionMode()
{
  return MEMORY[0x24BDFFFF0]();
}

uint64_t AXDeviceSupportsHuman()
{
  return MEMORY[0x24BE00008]();
}

uint64_t AXIsInternalInstall()
{
  return MEMORY[0x24BDFE088]();
}

uint64_t AXLanguageCanonicalFormToGeneralLanguage()
{
  return MEMORY[0x24BE001A0]();
}

uint64_t AXLocStringForDeviceVariant()
{
  return MEMORY[0x24BE001B0]();
}

uint64_t AXLogAssetLoader()
{
  return MEMORY[0x24BDFE0C0]();
}

uint64_t AXRuntimeCheck_MediaAnalysisSupport()
{
  return MEMORY[0x24BDFE310]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

uint64_t CEKFontOfSizeAndStyle()
{
  return MEMORY[0x24BE14A00]();
}

uint64_t CEKIsSFCameraSupportedForLocale()
{
  return MEMORY[0x24BE14A08]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8C0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x24BDD9148](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9168](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEEB0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBEEE0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
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

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectStandardize(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF080]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x24BDC02E8](sbuf);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x24BDC0498](retstr, value, *(_QWORD *)&timescale);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
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

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

uint64_t MAGLogCommon()
{
  return MEMORY[0x24BDFE470]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t OSThermalNotificationCurrentLevel()
{
  return MEMORY[0x24BDAC510]();
}

uint64_t PSRoundToPixel()
{
  return MEMORY[0x24BE75C50]();
}

uint64_t SBSRequestPasscodeUnlockUI()
{
  return MEMORY[0x24BEB0D20]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x24BEBDE50]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BEBDE80]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BEBDE98](*(_QWORD *)&notification, argument);
}

uint64_t UIAccessibilitySpeak()
{
  return MEMORY[0x24BEBB0B8]();
}

uint64_t UIAccessibilitySpeakAndDoNotBeInterrupted()
{
  return MEMORY[0x24BEBB0C0]();
}

uint64_t UIAccessibilitySpeakIfNotSpeaking()
{
  return MEMORY[0x24BEBB0C8]();
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

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x24BEBE2D8](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BEBE2E0](image);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BEBE6A8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x24BEBE6E0]();
}

CGPoint VNImagePointForNormalizedPoint(CGPoint normalizedPoint, size_t imageWidth, size_t imageHeight)
{
  double v3;
  double v4;
  CGPoint result;

  MEMORY[0x24BDF9F48](imageWidth, imageHeight, (__n128)normalizedPoint, *(__n128 *)&normalizedPoint.y);
  result.y = v4;
  result.x = v3;
  return result;
}

CGRect VNNormalizedRectForImageRect(CGRect imageRect, size_t imageWidth, size_t imageHeight)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDF9F58](imageWidth, imageHeight, (__n128)imageRect.origin, *(__n128 *)&imageRect.origin.y, (__n128)imageRect.size, *(__n128 *)&imageRect.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x24BDF9020](pixelBuffer, options, imageOut);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24EF97380(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24EF97388(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
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

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x24BDAE710](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x24BDAF4E0]();
}

int setgid(gid_t a1)
{
  return MEMORY[0x24BDAFD20](*(_QWORD *)&a1);
}

int setuid(uid_t a1)
{
  return MEMORY[0x24BDAFD88](*(_QWORD *)&a1);
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

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x24BEE4DD8]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x24BEE4DE8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
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

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

int uname(utsname *a1)
{
  return MEMORY[0x24BDB02A8](a1);
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB32F0](__A, __IA, __C, __N);
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3530](__B, __IB, __A, __IA, __C, __IC, __N);
}


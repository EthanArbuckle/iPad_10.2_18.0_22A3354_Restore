void sub_20A9B3704(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_20A9B377C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x20u);
}

uint64_t (*sub_20A9B3F70())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

_QWORD *sub_20A9B3FB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v19 = a5;
  v10 = sub_20A9E02B4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  v14 = MEMORY[0x24BEE4B00];
  v5[14] = MEMORY[0x24BEE4B00];
  v5[15] = v14;
  v15 = OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_geoCoder;
  sub_20A9DFF84();
  *(_QWORD *)((char *)v5 + v15) = sub_20A9DFF78();
  *(_QWORD *)((char *)v5 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller__locationHelper) = 0;
  *(_QWORD *)((char *)v5 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_locationCollectionTask) = 0;
  *(_QWORD *)((char *)v5 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_locationHelperContinuations) = 0;
  v5[16] = a1;
  v5[17] = a2;
  v21 = sub_20A9DFA98();
  v22 = MEMORY[0x24BE1F190];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v20);
  swift_bridgeObjectRetain();
  sub_20A9DFA74();
  sub_20A9C13A0(&v20, (uint64_t)(v5 + 18));
  *(_QWORD *)((char *)v5 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_locationBundle) = a3;
  v16 = (_QWORD *)((char *)v5 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_locationBundleIdentifier);
  v17 = v19;
  *v16 = a4;
  v16[1] = v17;
  sub_20A9E02A8();
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))((uint64_t)v5 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_coalescingReferenceDate, v13, v10);
  return v5;
}

uint64_t (*sub_20A9B4124())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20A9B4168(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t (*v16)();
  _QWORD **v17;
  _QWORD *v18;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t v27[4];

  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C48);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v27[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254611C50);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v27[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v27[-1] - v11;
  if (*(_QWORD *)(a2 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller__locationHelper))
  {
    v27[0] = *(_QWORD *)(a2 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller__locationHelper);
    swift_retain();
    return sub_20A9E017C();
  }
  else
  {
    v14 = (_QWORD *)(a2 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_locationHelperContinuations);
    swift_beginAccess();
    if (*v14)
    {
      v16 = sub_20A9B4124();
      if (*v15)
      {
        v17 = (_QWORD **)v15;
        (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, a1, v6);
        v18 = *v17;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *v17 = v18;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v18 = (_QWORD *)sub_20A9BA758(0, v18[2] + 1, 1, v18);
          *v17 = v18;
        }
        v21 = v18[2];
        v20 = v18[3];
        if (v21 >= v20 >> 1)
        {
          v18 = (_QWORD *)sub_20A9BA758(v20 > 1, v21 + 1, 1, v18);
          *v17 = v18;
        }
        v18[2] = v21 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))((unint64_t)v18+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v21, v12, v6);
      }
      return ((uint64_t (*)(uint64_t *, _QWORD))v16)(v27, 0);
    }
    else
    {
      *v14 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRelease();
      v22 = sub_20A9E0194();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v5, 1, 1, v22);
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a1, v6);
      v23 = sub_20A9BA454(&qword_254611C60, (uint64_t (*)(uint64_t))type metadata accessor for ODIBindingsFiller, (uint64_t)&unk_20A9E1144);
      v24 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      v25 = (char *)swift_allocObject();
      *((_QWORD *)v25 + 2) = a2;
      *((_QWORD *)v25 + 3) = v23;
      *((_QWORD *)v25 + 4) = a2;
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v25[v24], v10, v6);
      swift_retain_n();
      sub_20A9C3E64((uint64_t)v5, (uint64_t)&unk_254611C68, (uint64_t)v25);
      return swift_release();
    }
  }
}

uint64_t sub_20A9B4438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[12] = a4;
  v5[13] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254611C50);
  v5[14] = v6;
  v5[15] = *(_QWORD *)(v6 - 8);
  v5[16] = swift_task_alloc();
  v7 = sub_20A9E0050();
  v5[17] = v7;
  v5[18] = *(_QWORD *)(v7 - 8);
  v5[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9B44C8()
{
  uint64_t *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;

  v1 = *(void **)(v0[12] + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_locationBundle);
  sub_20A9DFE28();
  v2 = sub_20A9DFA98();
  v3 = MEMORY[0x24BE1F190];
  v0[5] = v2;
  v0[6] = v3;
  __swift_allocate_boxed_opaque_existential_1(v0 + 2);
  v4 = v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_20A9DFA74();
  sub_20A9DFF54();
  swift_allocObject();
  sub_20A9DFF48();
  sub_20A9DFED0();
  swift_allocObject();
  sub_20A9DFEC4();
  v5 = (_QWORD *)swift_task_alloc();
  v0[20] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_20A9B4600;
  return sub_20A9DFE1C();
}

uint64_t sub_20A9B4600(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 168) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9B4660()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v17;

  v1 = *(_QWORD *)(v0 + 168);
  v2 = *(_QWORD *)(v0 + 96);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller__locationHelper) = v1;
  swift_retain_n();
  swift_release();
  *(_QWORD *)(v0 + 80) = v1;
  sub_20A9E017C();
  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_locationHelperContinuations);
  swift_beginAccess();
  v4 = *v3;
  if (*v3)
  {
    v5 = *(_QWORD *)(v4 + 16);
    if (v5)
    {
      v17 = v3;
      v6 = *(_QWORD *)(v0 + 120);
      v7 = v4 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
      v8 = *(_QWORD *)(v6 + 72);
      v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
      swift_bridgeObjectRetain();
      do
      {
        v10 = *(_QWORD *)(v0 + 168);
        v11 = *(_QWORD *)(v0 + 128);
        v12 = *(_QWORD *)(v0 + 112);
        v9(v11, v7, v12);
        *(_QWORD *)(v0 + 88) = v10;
        swift_retain();
        sub_20A9E017C();
        (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v11, v12);
        v7 += v8;
        --v5;
      }
      while (v5);
      swift_bridgeObjectRelease();
      v3 = v17;
    }
    swift_release();
    *v3 = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 144);
    v13 = *(_QWORD *)(v0 + 152);
    v15 = *(_QWORD *)(v0 + 136);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 96) + 144), *(_QWORD *)(*(_QWORD *)(v0 + 96) + 168));
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v14 + 104))(v13, *MEMORY[0x24BE1F7F8], v15);
    sub_20A9DFFB4();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9B4854(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  void (*v24)(_QWORD);
  char *v25;
  void (*v26)(_QWORD);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v35;
  void (*v36)(char *, _QWORD, uint64_t);
  unsigned int v37;
  void (*v38)(char *, uint64_t);
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46[2];
  uint64_t v47[6];

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254611C48);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_20A9E0050();
  v11 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = (void (*)(char *, uint64_t))sub_20A9E02B4();
  v14 = *((_QWORD *)v38 - 1);
  MEMORY[0x24BDAC7A8](v38);
  v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_20A9E00E0();
  v40 = v17;
  sub_20A9B4E4C(a1, a2, v47);
  v18 = sub_20A9B50D0((uint64_t)a2, a3);
  v39 = v10;
  if ((v18 & 1) == 0)
    goto LABEL_9;
  swift_beginAccess();
  v19 = v4[14];
  if (!*(_QWORD *)(v19 + 16))
  {
    v45 = 0;
    v43 = 0u;
    v44 = 0u;
LABEL_10:
    sub_20A9C16D4((uint64_t)&v43, &qword_254611D50);
    goto LABEL_11;
  }
  v20 = v40;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v21 = sub_20A9BAC84(v42, v20);
  if ((v22 & 1) != 0)
  {
    sub_20A9BF828(*(_QWORD *)(v19 + 56) + 40 * v21, (uint64_t)&v43);
  }
  else
  {
    v45 = 0;
    v43 = 0u;
    v44 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v44 + 1))
    goto LABEL_10;
  sub_20A9C13A0(&v43, (uint64_t)v46);
  sub_20A9DFB70();
  v23 = MEMORY[0x20BD2917C](v47, v46);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
  if ((v23 & 1) == 0)
  {
LABEL_11:
    sub_20A9E02A8();
    v25 = (char *)v4 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_coalescingReferenceDate;
    swift_beginAccess();
    (*(void (**)(char *, char *, void (*)(char *, uint64_t)))(v14 + 40))(v25, v16, v38);
    swift_endAccess();
    __swift_project_boxed_opaque_existential_1(v4 + 18, v4[21]);
    *(_QWORD *)&v46[0] = 0;
    *((_QWORD *)&v46[0] + 1) = 0xE000000000000000;
    sub_20A9E026C();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v46[0] = 0xD000000000000012;
    *((_QWORD *)&v46[0] + 1) = 0x800000020A9E2CA0;
    sub_20A9E0110();
    swift_bridgeObjectRelease();
    sub_20A9E0110();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254611D28);
    sub_20A9E0098();
    sub_20A9E0110();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v26 = *(void (**)(_QWORD))(v11 + 104);
    v37 = *MEMORY[0x24BE1F7C0];
    v36 = (void (*)(char *, _QWORD, uint64_t))v26;
    v26(v13);
    sub_20A9DFF9C();
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
LABEL_9:
  __swift_project_boxed_opaque_existential_1(v4 + 18, v4[21]);
  v24 = *(void (**)(_QWORD))(v11 + 104);
  v37 = *MEMORY[0x24BE1F7C0];
  v36 = (void (*)(char *, _QWORD, uint64_t))v24;
  v24(v13);
  sub_20A9DFF9C();
LABEL_12:
  v38 = *(void (**)(char *, uint64_t))(v11 + 8);
  v27 = v41;
  v38(v13, v41);
  sub_20A9BF828((uint64_t)v47, (uint64_t)v46);
  swift_beginAccess();
  v28 = v40;
  swift_bridgeObjectRetain();
  sub_20A9B5294((uint64_t)v46, v42, v28);
  swift_endAccess();
  __swift_project_boxed_opaque_existential_1(v4 + 18, v4[21]);
  *(_QWORD *)&v46[0] = 0;
  *((_QWORD *)&v46[0] + 1) = 0xE000000000000000;
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v46[0] = 0xD000000000000010;
  *((_QWORD *)&v46[0] + 1) = 0x800000020A9E2C80;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611D28);
  sub_20A9E0080();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v36(v13, v37, v27);
  sub_20A9DFFD8();
  swift_bridgeObjectRelease();
  v38(v13, v27);
  v29 = sub_20A9E0194();
  v30 = (uint64_t)v39;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v39, 1, 1, v29);
  sub_20A9BF828((uint64_t)v47, (uint64_t)v46);
  v31 = sub_20A9BA454(&qword_254611C60, (uint64_t (*)(uint64_t))type metadata accessor for ODIBindingsFiller, (uint64_t)&unk_20A9E1144);
  v32 = (_QWORD *)swift_allocObject();
  v32[2] = v4;
  v32[3] = v31;
  v33 = v42;
  v32[4] = v4;
  v32[5] = v33;
  v32[6] = v28;
  sub_20A9C13A0(v46, (uint64_t)(v32 + 7));
  swift_retain_n();
  sub_20A9C3E64(v30, (uint64_t)&unk_254611D48, (uint64_t)v32);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
}

void sub_20A9B4E4C(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  _BYTE v29[40];

  v28 = a2;
  sub_20A9BF828(a1, (uint64_t)v29);
  v6 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611D28);
  if (!swift_dynamicCast())
    goto LABEL_20;
  v7 = sub_20A9E00E0();
  v9 = v8;
  if (v7 == sub_20A9E00E0() && v9 == v10)
    goto LABEL_15;
  v12 = sub_20A9E032C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v12 & 1) != 0)
  {
LABEL_16:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);

    v23 = MEMORY[0x20BD2926C]();
    swift_bridgeObjectRelease();
    v24 = MEMORY[0x24BEE1778];
    a3[3] = MEMORY[0x24BEE1768];
    a3[4] = v24;
    *a3 = v23;
    return;
  }
  v13 = sub_20A9E00E0();
  v15 = v14;
  if (v13 == sub_20A9E00E0() && v15 == v16)
  {
LABEL_15:
    swift_bridgeObjectRelease_n();
    goto LABEL_16;
  }
  v18 = sub_20A9E032C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v18 & 1) != 0)
    goto LABEL_16;
  v19 = sub_20A9E00E0();
  v21 = v20;
  if (v19 == sub_20A9E00E0() && v21 == v22)
  {
    swift_bridgeObjectRelease_n();
LABEL_18:
    v26 = MEMORY[0x20BD29278]();
    swift_bridgeObjectRelease();
    v27 = MEMORY[0x24BEE1778];
    a3[3] = MEMORY[0x24BEE1768];
    a3[4] = v27;
    *a3 = v26;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);

    return;
  }
  v25 = sub_20A9E032C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v25 & 1) != 0)
    goto LABEL_18;
  swift_bridgeObjectRelease();
LABEL_20:
  sub_20A9BF828(a1, (uint64_t)a3);
  sub_20A9C16D4((uint64_t)&v28, &qword_254611DA8);
}

uint64_t sub_20A9B50D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;

  if (*(_QWORD *)(a2 + 16))
  {
    sub_20A9E00E0();
    sub_20A9E0368();
    sub_20A9E0104();
    v3 = sub_20A9E0380();
    swift_bridgeObjectRelease();
    v4 = -1 << *(_BYTE *)(a2 + 32);
    v5 = v3 & ~v4;
    v6 = a2 + 56;
    if (((*(_QWORD *)(a2 + 56 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
    {
      v7 = sub_20A9E00E0();
      v9 = v8;
      if (v7 == sub_20A9E00E0() && v9 == v10)
      {
LABEL_17:
        swift_bridgeObjectRelease_n();
        goto LABEL_18;
      }
      v12 = sub_20A9E032C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) != 0)
      {
LABEL_18:
        v20 = 1;
        return v20 & 1;
      }
      v13 = ~v4;
      v14 = (v5 + 1) & v13;
      if (((*(_QWORD *)(v6 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
      {
        while (1)
        {
          v15 = sub_20A9E00E0();
          v17 = v16;
          if (v15 == sub_20A9E00E0() && v17 == v18)
            break;
          v20 = sub_20A9E032C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v20 & 1) == 0)
          {
            v14 = (v14 + 1) & v13;
            if (((*(_QWORD *)(v6 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
              continue;
          }
          return v20 & 1;
        }
        goto LABEL_17;
      }
    }
  }
  v20 = 0;
  return v20 & 1;
}

uint64_t sub_20A9B5294(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  __int128 v9[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_20A9C13A0((__int128 *)a1, (uint64_t)v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *v3;
    *v3 = 0x8000000000000000;
    sub_20A9BC918(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_20A9C16D4(a1, &qword_254611D50);
    sub_20A9D6BB0(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_20A9C16D4((uint64_t)v9, &qword_254611D50);
  }
}

uint64_t sub_20A9B5368(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  v7[2] = a1;
  return swift_task_switch();
}

uint64_t sub_20A9B5388()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  sub_20A9BA454(&qword_254611C60, (uint64_t (*)(uint64_t))type metadata accessor for ODIBindingsFiller, (uint64_t)&unk_20A9E1144);
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  v4 = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  *(_OWORD *)(v3 + 32) = v4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v5;
  *v5 = v0;
  v5[1] = sub_20A9B5444;
  return sub_20A9E0320();
}

uint64_t sub_20A9B5444()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_20A9B5494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[20] = a5;
  v6[21] = a6;
  v6[18] = a3;
  v6[19] = a4;
  v6[17] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C48);
  v6[22] = swift_task_alloc();
  v6[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9B550C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  __int128 *v30;
  _OWORD *v31;
  uint64_t v32;

  v1 = *(_QWORD *)(v0 + 144);
  swift_beginAccess();
  v2 = *(_QWORD *)(v1 + 120);
  if (*(_QWORD *)(v2 + 16))
  {
    v4 = *(_QWORD *)(v0 + 152);
    v3 = *(_QWORD *)(v0 + 160);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v5 = sub_20A9BAC84(v4, v3);
    if ((v6 & 1) != 0)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v5);
      swift_bridgeObjectRetain();
    }
    else
    {
      v7 = MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = MEMORY[0x24BEE4AF8];
  }
  v29 = v7;
  v8 = *(_QWORD *)(v7 + 16);
  if (v8)
  {
    v30 = (__int128 *)(v0 + 16);
    v9 = (_OWORD *)(v29 + 32);
    do
    {
      v32 = v8;
      v10 = *(_QWORD *)(v0 + 176);
      v11 = *(_QWORD *)(v0 + 184);
      v13 = *(_QWORD *)(v0 + 160);
      v12 = *(_QWORD *)(v0 + 168);
      v14 = *(_QWORD *)(v0 + 144);
      v15 = *(_QWORD *)(v0 + 152);
      v16 = swift_allocObject();
      v31 = v9;
      *(_OWORD *)(v16 + 16) = *v9;
      sub_20A9BF828(v12, (uint64_t)v30);
      v17 = (_QWORD *)swift_allocObject();
      v17[2] = 0;
      v18 = v17 + 2;
      v17[3] = 0;
      v17[4] = &unk_254611D80;
      v17[5] = v16;
      sub_20A9C13A0(v30, (uint64_t)(v17 + 6));
      v17[11] = v14;
      v17[12] = v15;
      v17[13] = v13;
      v19 = sub_20A9E0194();
      v20 = *(_QWORD *)(v19 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56))(v11, 1, 1, v19);
      sub_20A9C1710(v11, v10, &qword_254611C48);
      LODWORD(v10) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v10, 1, v19);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_retain();
      v21 = *(_QWORD *)(v0 + 176);
      if ((_DWORD)v10 == 1)
      {
        sub_20A9C16D4(*(_QWORD *)(v0 + 176), &qword_254611C48);
        if (!*v18)
          goto LABEL_14;
      }
      else
      {
        sub_20A9E0188();
        (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v21, v19);
        if (!*v18)
        {
LABEL_14:
          v22 = 0;
          v24 = 0;
          goto LABEL_15;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      v22 = sub_20A9E0170();
      v24 = v23;
      swift_unknownObjectRelease();
LABEL_15:
      v25 = **(_QWORD **)(v0 + 136);
      v26 = swift_allocObject();
      *(_QWORD *)(v26 + 16) = &unk_254611D88;
      *(_QWORD *)(v26 + 24) = v17;
      v27 = v24 | v22;
      if (v24 | v22)
      {
        v27 = v0 + 56;
        *(_QWORD *)(v0 + 56) = 0;
        *(_QWORD *)(v0 + 64) = 0;
        *(_QWORD *)(v0 + 72) = v22;
        *(_QWORD *)(v0 + 80) = v24;
      }
      *(_QWORD *)(v0 + 112) = 1;
      *(_QWORD *)(v0 + 120) = v27;
      *(_QWORD *)(v0 + 128) = v25;
      swift_task_create();
      swift_release();
      swift_release();
      v9 = v31 + 1;
      v8 = v32 - 1;
    }
    while (v32 != 1);
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9B5854(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v3;
  *v3 = v2;
  v3[1] = sub_20A9C1758;
  return v5();
}

uint64_t sub_20A9B58B4(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v14)(uint64_t);

  v8[6] = a7;
  v8[7] = a8;
  v8[5] = a6;
  v11 = sub_20A9E0050();
  v8[8] = v11;
  v8[9] = *(_QWORD *)(v11 - 8);
  v8[10] = swift_task_alloc();
  v14 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  v12 = (_QWORD *)swift_task_alloc();
  v8[11] = v12;
  *v12 = v8;
  v12[1] = sub_20A9B5950;
  return v14(a5);
}

uint64_t sub_20A9B5950()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 96) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_20A9B59C4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 64);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 40) + 144), *(_QWORD *)(*(_QWORD *)(v0 + 40) + 168));
  sub_20A9E026C();
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0xE000000000000000;
  sub_20A9E0110();
  sub_20A9E0110();
  sub_20A9E0110();
  *(_QWORD *)(v0 + 32) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611D98);
  sub_20A9E02CC();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, *MEMORY[0x24BE1F7C0], v4);
  sub_20A9DFFA8();
  swift_bridgeObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9B5B28(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t result;
  int64_t v8;
  int v9;
  int v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  char v20;
  BOOL v21;
  uint64_t v22;
  _QWORD *v23;

  swift_beginAccess();
  v2 = swift_bridgeObjectRetain();
  v3 = sub_20A9B5CDC(v2);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 16);
  v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v22 = v3;
    v23 = (_QWORD *)MEMORY[0x24BEE4AF8];
    sub_20A9BF10C(0, v5, 0);
    v6 = v23;
    result = sub_20A9C0FFC(a1);
    v8 = result;
    v10 = v9;
    v12 = v11 & 1;
    while ((v8 & 0x8000000000000000) == 0 && v8 < 1 << *(_BYTE *)(a1 + 32))
    {
      if (((*(_QWORD *)(a1 + 56 + (((unint64_t)v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_13;
      if (*(_DWORD *)(a1 + 36) != v10)
        goto LABEL_14;
      v13 = sub_20A9E00E0();
      v15 = v14;
      v17 = v23[2];
      v16 = v23[3];
      if (v17 >= v16 >> 1)
        sub_20A9BF10C((char *)(v16 > 1), v17 + 1, 1);
      v23[2] = v17 + 1;
      v18 = &v23[2 * v17];
      v18[4] = v13;
      v18[5] = v15;
      result = sub_20A9C109C(v8, v10, v12 & 1, a1);
      v8 = result;
      v10 = v19;
      v12 = v20 & 1;
      if (!--v5)
      {
        sub_20A9C13E4(result, v19, v20 & 1);
        v4 = v22;
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
  }
  else
  {
LABEL_11:
    v21 = sub_20A9C1180(v6, v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v21;
  }
  return result;
}

uint64_t sub_20A9B5CDC(uint64_t a1)
{
  uint64_t result;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;

  result = sub_20A9E020C();
  v3 = 0;
  v18 = result;
  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      v3 = v14 + 1;
      if (v14 + 1 >= v8)
        goto LABEL_23;
      v15 = *(_QWORD *)(v4 + 8 * v3);
      if (!v15)
      {
        v3 = v14 + 2;
        if (v14 + 2 >= v8)
          goto LABEL_23;
        v15 = *(_QWORD *)(v4 + 8 * v3);
        if (!v15)
        {
          v3 = v14 + 3;
          if (v14 + 3 >= v8)
            goto LABEL_23;
          v15 = *(_QWORD *)(v4 + 8 * v3);
          if (!v15)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    v11 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_20A9BDAA8(&v17, v12, v13);
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  v15 = *(_QWORD *)(v4 + 8 * v16);
  if (v15)
  {
    v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    v3 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v3);
    ++v16;
    if (v15)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_20A9B5E70(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  id v13[2];

  type metadata accessor for ODIAttributeKey(0);
  sub_20A9BA454((unint64_t *)&qword_254611C08, (uint64_t (*)(uint64_t))type metadata accessor for ODIAttributeKey, (uint64_t)&unk_20A9E116C);
  v2 = 0;
  v13[1] = (id)sub_20A9E020C();
  v3 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v10 >= v7)
      goto LABEL_23;
    v11 = *(_QWORD *)(v3 + 8 * v10);
    ++v2;
    if (!v11)
    {
      v2 = v10 + 1;
      if (v10 + 1 >= v7)
        goto LABEL_23;
      v11 = *(_QWORD *)(v3 + 8 * v2);
      if (!v11)
      {
        v2 = v10 + 2;
        if (v10 + 2 >= v7)
          goto LABEL_23;
        v11 = *(_QWORD *)(v3 + 8 * v2);
        if (!v11)
        {
          v2 = v10 + 3;
          if (v10 + 3 >= v7)
            goto LABEL_23;
          v11 = *(_QWORD *)(v3 + 8 * v2);
          if (!v11)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v2 << 6);
LABEL_5:
    sub_20A9BDC54(v13, *(id *)(*(_QWORD *)(a1 + 48) + 8 * v9));

  }
  v12 = v10 + 4;
  if (v12 >= v7)
  {
LABEL_23:
    swift_release();
    return;
  }
  v11 = *(_QWORD *)(v3 + 8 * v12);
  if (v11)
  {
    v2 = v12;
    goto LABEL_22;
  }
  while (1)
  {
    v2 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v2 >= v7)
      goto LABEL_23;
    v11 = *(_QWORD *)(v3 + 8 * v2);
    ++v12;
    if (v11)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
}

uint64_t sub_20A9B6014()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 144);
  v1 = v0 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_coalescingReferenceDate;
  v2 = sub_20A9E02B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_20A9B60E4()
{
  sub_20A9B6014();
  return swift_defaultActor_deallocate();
}

uint64_t sub_20A9B60FC()
{
  return type metadata accessor for ODIBindingsFiller();
}

uint64_t type metadata accessor for ODIBindingsFiller()
{
  uint64_t result;

  result = qword_254611B58;
  if (!qword_254611B58)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20A9B6140()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20A9E02B4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_20A9B6204(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 8) + *(_QWORD *)(a2 + 8));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20A9C1758;
  return v7(a1, a2);
}

uint64_t sub_20A9B6270()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_20A9B627C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  char v10;

  result = swift_beginAccess();
  v8 = *(_QWORD *)(v3 + 112);
  if (*(_QWORD *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = sub_20A9BAC84(a1, a2);
    if ((v10 & 1) != 0)
    {
      sub_20A9BF828(*(_QWORD *)(v8 + 56) + 40 * v9, a3);
    }
    else
    {
      *(_QWORD *)(a3 + 32) = 0;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t sub_20A9B6334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t v10;
  char v11;
  char isUniquelyReferenced_nonNull_native;
  uint64_t (*v13)();
  _QWORD *v14;
  void (*v15)(_QWORD *);
  _QWORD **v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  _QWORD v24[4];
  _BYTE v25[32];

  v9 = (_QWORD *)(v4 + 120);
  swift_beginAccess();
  v10 = *(_QWORD *)(*(_QWORD *)(v4 + 120) + 16);
  swift_bridgeObjectRetain();
  if (v10)
  {
    swift_bridgeObjectRetain();
    sub_20A9BAC84(a1, a2);
    if ((v11 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v24[0] = *v9;
  *v9 = 0x8000000000000000;
  sub_20A9BCA4C(MEMORY[0x24BEE4AF8], a1, a2, isUniquelyReferenced_nonNull_native);
  *v9 = v24[0];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
LABEL_6:
  swift_bridgeObjectRetain();
  v13 = sub_20A9B3F70();
  v15 = sub_20A9B654C(v24, a1, a2);
  if (*v14)
  {
    v16 = (_QWORD **)v14;
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = a3;
    *(_QWORD *)(v17 + 24) = a4;
    v18 = *v16;
    swift_retain();
    v19 = swift_isUniquelyReferenced_nonNull_native();
    *v16 = v18;
    if ((v19 & 1) == 0)
    {
      v18 = sub_20A9BA8D4(0, v18[2] + 1, 1, v18);
      *v16 = v18;
    }
    v21 = v18[2];
    v20 = v18[3];
    if (v21 >= v20 >> 1)
    {
      v18 = sub_20A9BA8D4((_QWORD *)(v20 > 1), v21 + 1, 1, v18);
      *v16 = v18;
    }
    v18[2] = v21 + 1;
    v22 = &v18[2 * v21];
    v22[4] = &unk_254611BE8;
    v22[5] = v17;
  }
  ((void (*)(_QWORD *, _QWORD))v15)(v24, 0);
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(_BYTE *, _QWORD))v13)(v25, 0);
}

void (*sub_20A9B654C(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *a1)
{
  _QWORD *v6;

  v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_20A9BF4F0(v6, a2, a3);
  return sub_20A9B65B8;
}

void sub_20A9B65B8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t sub_20A9B65F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v5;
  *v5 = v3;
  v5[1] = sub_20A9C1758;
  return v7(a2);
}

uint64_t sub_20A9B6650()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = *v0;
  return swift_task_switch();
}

uint64_t sub_20A9B6668()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(uint64_t);

  swift_beginAccess();
  v3 = *(uint64_t (**)(uint64_t))(v0 + 8);
  v1 = swift_bridgeObjectRetain();
  return v3(v1);
}

uint64_t sub_20A9B66B8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);

  v2 = *(_QWORD *)(*v0 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_geoCoder);
  v3 = *(uint64_t (**)(uint64_t))(v1 + 8);
  swift_retain();
  return sub_20A9BF86C(v3, v1, v2);
}

uint64_t sub_20A9B6704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a1;
  v4[3] = a2;
  v5 = *v3;
  v4[4] = a3;
  v4[5] = v5;
  return swift_task_switch();
}

uint64_t sub_20A9B6720()
{
  uint64_t v0;

  sub_20A9B627C(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9B6754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;

  v5[4] = a3;
  v5[5] = a4;
  v5[2] = a1;
  v5[3] = a2;
  v5[6] = *v4;
  return swift_task_switch();
}

uint64_t sub_20A9B6774()
{
  uint64_t v0;

  sub_20A9B6334(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9B67AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v1 = sub_20A9E0050();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  *(_WORD *)(v0 + 112) = 0;
  *(_QWORD *)(v0 + 120) = MEMORY[0x24BEE4B00];
  v8 = sub_20A9DFA98();
  v9 = MEMORY[0x24BE1F190];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v7);
  sub_20A9DFA74();
  sub_20A9C13A0(&v7, v0 + 128);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 152));
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BE1F7C0], v1);
  sub_20A9DFF9C();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v0;
}

uint64_t sub_20A9B68E8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;

  v37 = sub_20A9DFB40();
  v3 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_20A9E0050();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = v1;
  v10 = swift_bridgeObjectRetain();
  v11 = sub_20A9B5CDC(v10);
  v12 = swift_bridgeObjectRetain();
  v13 = sub_20A9BFB14(v12, v11);
  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(v13 + 16);
  swift_release();
  if (v14)
  {
    v15 = v37;
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BE1F290], v37);
    sub_20A9E0038();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v15);
    swift_willThrow();
  }
  else
  {
    v33 = v7;
    v37 = (uint64_t)v9;
    v16 = v34;
    swift_bridgeObjectRetain();
    v17 = sub_20A9E008C();
    swift_bridgeObjectRelease();
    v18 = v6;
    if ((v17 & 1) == 0)
    {
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v16 + 128), *(_QWORD *)(v16 + 152));
      v19 = v33;
      v20 = v37;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v33 + 104))(v37, *MEMORY[0x24BE1F7E8], v18);
      sub_20A9DFF9C();
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v18);
      *(_BYTE *)(v16 + 113) = 1;
    }
    if ((*(_BYTE *)(v16 + 112) & 1) != 0 || *(_BYTE *)(v16 + 113) != 1)
    {
      v26 = *(_QWORD *)(v16 + 160);
      v31 = *(_QWORD **)(v16 + 152);
      v32 = v26;
      v30 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v16 + 128), (uint64_t)v31);
      v35 = 0;
      v36 = 0xE000000000000000;
      sub_20A9E026C();
      sub_20A9E0110();
      sub_20A9E0110();
      swift_bridgeObjectRelease();
      sub_20A9E0110();
      sub_20A9E0110();
      swift_bridgeObjectRelease();
      v27 = v33;
      v28 = v37;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v33 + 104))(v37, *MEMORY[0x24BE1F7C0], v18);
      sub_20A9DFF9C();
      swift_bridgeObjectRelease();
      LOBYTE(v3) = 0;
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v28, v18);
    }
    else
    {
      LOBYTE(v3) = 1;
      *(_BYTE *)(v16 + 112) = 1;
      v30 = a1;
      v31 = (_QWORD *)(v16 + 128);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v16 + 128), *(_QWORD *)(v16 + 152));
      LODWORD(v32) = *MEMORY[0x24BE1F7E8];
      v21 = v33;
      v22 = *(void (**)(uint64_t))(v33 + 104);
      v23 = v37;
      v22(v37);
      sub_20A9DFF9C();
      v24 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
      v24(v23, v18);
      *(_BYTE *)(v16 + 113) = 0;
      *(_QWORD *)(v16 + 120) = v30;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v25 = *(_QWORD *)(v16 + 152);
      v34 = *(_QWORD *)(v16 + 160);
      __swift_project_boxed_opaque_existential_1(v31, v25);
      v35 = 0;
      v36 = 0xE000000000000000;
      sub_20A9E026C();
      sub_20A9E0110();
      __swift_instantiateConcreteTypeFromMangledName(&qword_254611D28);
      sub_20A9E0080();
      sub_20A9E0110();
      swift_bridgeObjectRelease();
      ((void (*)(uint64_t, _QWORD, uint64_t))v22)(v23, v32, v18);
      sub_20A9DFFD8();
      swift_bridgeObjectRelease();
      v24(v23, v18);
    }
  }
  return v3 & 1;
}

uint64_t sub_20A9B6DF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t, uint64_t);
  void (*v8)(char *, uint64_t);
  uint64_t v9;
  _QWORD *v11[2];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  v1 = sub_20A9E0050();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(v0 + 160);
  v12 = *(_QWORD *)(v0 + 152);
  v13 = v5;
  v11[0] = (_QWORD *)(v0 + 128);
  v11[1] = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 128), v12);
  v14 = 0;
  v15 = 0xE000000000000000;
  sub_20A9E026C();
  sub_20A9E0110();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  sub_20A9E0110();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  sub_20A9E0110();
  v6 = *MEMORY[0x24BE1F7E8];
  v7 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  v7(v4, v6, v1);
  sub_20A9DFF9C();
  swift_bridgeObjectRelease();
  v8 = *(void (**)(char *, uint64_t))(v2 + 8);
  v8(v4, v1);
  *(_BYTE *)(v0 + 112) = 0;
  v9 = *(unsigned __int8 *)(v0 + 113);
  if ((_DWORD)v9 == 1)
  {
    *(_BYTE *)(v0 + 113) = 0;
    __swift_project_boxed_opaque_existential_1(v11[0], *(_QWORD *)(v0 + 152));
    v7(v4, v6, v1);
    sub_20A9DFF9C();
    v8(v4, v1);
  }
  return v9;
}

uint64_t sub_20A9B700C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 128);
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_20A9B7038()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  v2 = sub_20A9DFC84();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9B7098()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *v1 = v0;
  v1[1] = sub_20A9B70E8;
  return sub_20A9D9FF0(0);
}

uint64_t sub_20A9B70E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 56) = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9B713C()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 32);
    v16 = MEMORY[0x24BEE4AF8];
    sub_20A9BF128(0, v2, 0);
    v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v15 = *(_QWORD *)(v3 + 72);
    v5 = v3;
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v7 = v16;
    do
    {
      v8 = *(_QWORD *)(v0 + 40);
      v9 = *(_QWORD *)(v0 + 24);
      v6(v8, v4, v9);
      sub_20A9DFC60();
      v10 = sub_20A9E00BC();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v9);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_20A9BF128(0, *(_QWORD *)(v7 + 16) + 1, 1);
        v7 = v16;
      }
      v12 = *(_QWORD *)(v7 + 16);
      v11 = *(_QWORD *)(v7 + 24);
      if (v12 >= v11 >> 1)
      {
        sub_20A9BF128((_QWORD *)(v11 > 1), v12 + 1, 1);
        v7 = v16;
      }
      *(_QWORD *)(v7 + 16) = v12 + 1;
      *(_QWORD *)(v7 + 8 * v12 + 32) = v10;
      v4 += v15;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v7 = MEMORY[0x24BEE4AF8];
  }
  v13 = sub_20A9C1300(v7);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v13);
}

uint64_t sub_20A9B72D0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[6] = v0;
  v2 = sub_20A9DFCCC();
  v1[7] = v2;
  v1[8] = *(_QWORD *)(v2 - 8);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  v3 = sub_20A9DFC84();
  v1[11] = v3;
  v1[12] = *(_QWORD *)(v3 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9B7390()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v1;
  *v1 = v0;
  v1[1] = sub_20A9B73E0;
  return sub_20A9D9FF0(0);
}

uint64_t sub_20A9B73E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 144) = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_20A9B7434()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, unint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(unint64_t, uint64_t, uint64_t);
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = MEMORY[0x24BEE4AF8];
  v45 = MEMORY[0x24BEE4AF8];
  v41 = *(_QWORD *)(v1 + 16);
  if (v41)
  {
    v3 = 0;
    v4 = *(_QWORD *)(v0 + 96);
    v40 = *(_QWORD *)(v0 + 64);
    v38 = *MEMORY[0x24BE1F488];
    v39 = *(_QWORD *)(v0 + 144);
    do
    {
      if (v3 >= *(_QWORD *)(v1 + 16))
      {
        __break(1u);
        return;
      }
      v7 = *(_QWORD *)(v0 + 120);
      v6 = *(_QWORD *)(v0 + 128);
      v8 = *(_QWORD *)(v0 + 88);
      v43 = *(_QWORD *)(v4 + 72);
      v44 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
      v9 = *(void (**)(uint64_t, unint64_t, uint64_t))(v4 + 16);
      v9(v6, *(_QWORD *)(v0 + 144) + v44 + v43 * v3, v8);
      v10 = sub_20A9DFC78();
      v9(v7, v6, v8);
      if (v10 == 1)
      {
        v42 = v2;
        v11 = *(_QWORD *)(v0 + 72);
        v12 = *(_QWORD *)(v0 + 56);
        sub_20A9DFC6C();
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v40 + 104))(v11, v38, v12);
        sub_20A9BA454(&qword_254611D08, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F498], MEMORY[0x24BE1F4A0]);
        sub_20A9E0158();
        sub_20A9E0158();
        v13 = *(_QWORD *)(v0 + 120);
        v15 = *(_QWORD *)(v0 + 80);
        v14 = *(_QWORD *)(v0 + 88);
        v16 = *(_QWORD *)(v0 + 72);
        v17 = *(_QWORD *)(v0 + 56);
        if (*(_QWORD *)(v0 + 16) == *(_QWORD *)(v0 + 32) && *(_QWORD *)(v0 + 24) == *(_QWORD *)(v0 + 40))
        {
          swift_bridgeObjectRelease_n();
          v18 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
          v18(v16, v17);
          v18(v15, v17);
          (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v13, v14);
          v2 = v42;
          v1 = v39;
LABEL_12:
          v20 = *(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32);
          v20(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 88));
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_20A9BF144(0, *(_QWORD *)(v2 + 16) + 1, 1);
            v2 = v45;
          }
          v22 = *(_QWORD *)(v2 + 16);
          v21 = *(_QWORD *)(v2 + 24);
          if (v22 >= v21 >> 1)
          {
            sub_20A9BF144(v21 > 1, v22 + 1, 1);
            v2 = v45;
          }
          v23 = *(_QWORD *)(v0 + 112);
          v24 = *(_QWORD *)(v0 + 88);
          *(_QWORD *)(v2 + 16) = v22 + 1;
          v20(v2 + v44 + v22 * v43, v23, v24);
          v45 = v2;
          goto LABEL_5;
        }
        v37 = sub_20A9E032C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v19 = *(void (**)(uint64_t, uint64_t))(v40 + 8);
        v19(v16, v17);
        v19(v15, v17);
        v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
        v5(v13, v14);
        v2 = v42;
        v1 = v39;
        if ((v37 & 1) != 0)
          goto LABEL_12;
      }
      else
      {
        v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
        v5(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 88));
      }
      v5(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 88));
LABEL_5:
      ++v3;
    }
    while (v41 != v3);
  }
  swift_bridgeObjectRelease();
  v25 = *(_QWORD *)(v2 + 16);
  if (v25)
  {
    v26 = *(_QWORD *)(v0 + 96);
    v46 = MEMORY[0x24BEE4AF8];
    sub_20A9BF128(0, v25, 0);
    v27 = v2 + ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80));
    v28 = *(_QWORD *)(v26 + 72);
    v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16);
    do
    {
      v30 = *(_QWORD *)(v0 + 104);
      v31 = *(_QWORD *)(v0 + 88);
      v29(v30, v27, v31);
      sub_20A9DFC60();
      v32 = sub_20A9E00BC();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v30, v31);
      v33 = v46;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_20A9BF128(0, *(_QWORD *)(v46 + 16) + 1, 1);
        v33 = v46;
      }
      v35 = *(_QWORD *)(v33 + 16);
      v34 = *(_QWORD *)(v33 + 24);
      if (v35 >= v34 >> 1)
      {
        sub_20A9BF128((_QWORD *)(v34 > 1), v35 + 1, 1);
        v33 = v46;
      }
      *(_QWORD *)(v33 + 16) = v35 + 1;
      *(_QWORD *)(v33 + 8 * v35 + 32) = v32;
      v27 += v28;
      --v25;
    }
    while (v25);
    swift_release();
  }
  else
  {
    swift_release();
    v33 = MEMORY[0x24BEE4AF8];
  }
  v36 = sub_20A9C1300(v33);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  (*(void (**)(uint64_t))(v0 + 8))(v36);
}

uint64_t sub_20A9B78B8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[7] = v0;
  v2 = sub_20A9E0050();
  v1[8] = v2;
  v1[9] = *(_QWORD *)(v2 - 8);
  v1[10] = swift_task_alloc();
  sub_20A9DFAD4();
  v1[11] = swift_task_alloc();
  v3 = sub_20A9DFAE0();
  v1[12] = v3;
  v1[13] = *(_QWORD *)(v3 - 8);
  v1[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9B7960()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = v0[10];
  v2 = v0[8];
  v3 = v0[9];
  v4 = (_QWORD *)v0[7];
  sub_20A9DFE94();
  sub_20A9DFAEC();
  __swift_project_boxed_opaque_existential_1(v4 + 3, v4[6]);
  sub_20A9C3FB0(v1);
  sub_20A9DFFF0();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  v0[15] = v4[11];
  v5 = (_QWORD *)swift_task_alloc();
  v0[16] = v5;
  *v5 = v0;
  v5[1] = sub_20A9B7A4C;
  return sub_20A9DA5D8(0);
}

uint64_t sub_20A9B7A4C()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v4 = *v0;
  swift_task_dealloc();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 136) = v2;
  *v2 = v4;
  v2[1] = sub_20A9B7AB4;
  return sub_20A9D9FF0(0);
}

uint64_t sub_20A9B7AB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 144) = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9B7B08()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(_QWORD, void *, _QWORD, _QWORD *);

  v1 = *(_QWORD *)(v0[7] + 72);
  v0[5] = type metadata accessor for ODIBindingsFiller();
  v2 = sub_20A9BA454(&qword_254611CC0, (uint64_t (*)(uint64_t))type metadata accessor for ODIBindingsFiller, (uint64_t)&unk_20A9E1104);
  v0[2] = v1;
  v0[6] = v2;
  v5 = (uint64_t (*)(_QWORD, void *, _QWORD, _QWORD *))((int)*MEMORY[0x24BE1F450] + MEMORY[0x24BE1F450]);
  swift_retain();
  v3 = (_QWORD *)swift_task_alloc();
  v0[19] = v3;
  *v3 = v0;
  v3[1] = sub_20A9B7BCC;
  return v5(v0[18], &unk_254611CB8, v0[7], v0 + 2);
}

uint64_t sub_20A9B7BCC()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *v0 + 16;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v1);
  return swift_task_switch();
}

uint64_t sub_20A9B7C34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 96);
  sub_20A9DFAC8();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9B7CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_task_switch();
}

uint64_t sub_20A9B7CC8()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = *(_QWORD *)(*(_QWORD *)(v0 + 32) + 72);
  return swift_task_switch();
}

uint64_t sub_20A9B7CE4()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0[5] + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller__locationHelper);
  if (v1)
  {
    v0[7] = v1;
    swift_retain();
    return swift_task_switch();
  }
  else
  {
    sub_20A9BA454(&qword_254611C60, (uint64_t (*)(uint64_t))type metadata accessor for ODIBindingsFiller, (uint64_t)&unk_20A9E1144);
    v3 = (_QWORD *)swift_task_alloc();
    v0[6] = v3;
    sub_20A9DFE28();
    *v3 = v0;
    v3[1] = sub_20A9B7DD8;
    return sub_20A9E0314();
  }
}

uint64_t sub_20A9B7DD8()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9B7E2C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 56) = *(_QWORD *)(v0 + 16);
  return swift_task_switch();
}

uint64_t sub_20A9B7E48()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD **)(v0 + 24);
  v3 = sub_20A9DFE28();
  v4 = MEMORY[0x24BE1F5B8];
  v2[3] = v3;
  v2[4] = v4;
  *v2 = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9B7E90()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[2] = v0;
  v2 = sub_20A9E0050();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v3 = sub_20A9DFCFC();
  v1[6] = v3;
  v1[7] = *(_QWORD *)(v3 - 8);
  v1[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9B7F18()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v1;
  *v1 = v0;
  v1[1] = sub_20A9B7F68;
  return sub_20A9D9FF0(0);
}

uint64_t sub_20A9B7F68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 80) = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9B7FBC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 88) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 80);
  sub_20A9DFCC0();
  sub_20A9BA454(&qword_254611C98, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F470], MEMORY[0x24BE1F480]);
  sub_20A9E0170();
  return swift_task_switch();
}

uint64_t sub_20A9B8038()
{
  sub_20A9DFC90();
  return swift_task_switch();
}

uint64_t sub_20A9B8078()
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
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 64);
  v10 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 24);
  v5 = *(_QWORD *)(v0 + 32);
  v6 = *(_QWORD *)(v0 + 16);
  sub_20A9DFCE4();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v6 + 24), *(_QWORD *)(v6 + 48));
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  sub_20A9BA454(&qword_254611CA0, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F4C0], MEMORY[0x24BE1F4D0]);
  sub_20A9E0308();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v2, *MEMORY[0x24BE1F7B0], v4);
  sub_20A9DFF9C();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  v7 = sub_20A9DFCF0();
  v8 = sub_20A9DFCD8();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v7, v8);
}

uint64_t sub_20A9B8204()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_20A9B824C;
  return sub_20A9B8294();
}

uint64_t sub_20A9B824C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_20A9B8294()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  v2 = sub_20A9E0050();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9B82F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  void (*v5)(uint64_t, uint64_t);
  _QWORD *v6;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 24);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 16) + 24), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 48));
  *(_DWORD *)(v0 + 80) = *MEMORY[0x24BE1F7C0];
  v4 = *(void (**)(uint64_t))(v2 + 104);
  *(_QWORD *)(v0 + 48) = v4;
  v4(v1);
  sub_20A9DFF9C();
  v5 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  *(_QWORD *)(v0 + 56) = v5;
  v5(v1, v3);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v6;
  *v6 = v0;
  v6[1] = sub_20A9B83C8;
  return sub_20A9B78B8();
}

uint64_t sub_20A9B83C8()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9B841C()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 48);
  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 56);
  v3 = *(unsigned int *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 24);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 16) + 24), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 48));
  v2(v4, v3, v5);
  sub_20A9DFF9C();
  v1(v4, v5);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v6;
  *v6 = v0;
  v6[1] = sub_20A9B84E8;
  return sub_20A9B8CAC();
}

uint64_t sub_20A9B84E8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_20A9B853C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[7] = v0;
  v2 = sub_20A9DFCCC();
  v1[8] = v2;
  v1[9] = *(_QWORD *)(v2 - 8);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  v3 = sub_20A9DFC84();
  v1[12] = v3;
  v1[13] = *(_QWORD *)(v3 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9B85F0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v1;
  *v1 = v0;
  v1[1] = sub_20A9B8640;
  return sub_20A9D9FF0(0);
}

uint64_t sub_20A9B8640(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 144) = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9B8694()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  char v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(unint64_t, uint64_t, uint64_t);
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  result = *(_QWORD *)(v0 + 144);
  v2 = MEMORY[0x24BEE4AF8];
  v38 = MEMORY[0x24BEE4AF8];
  v34 = *(_QWORD *)(result + 16);
  if (v34)
  {
    v3 = 0;
    v4 = *(_QWORD *)(v0 + 104);
    v5 = *(_QWORD *)(v0 + 72);
    v32 = *MEMORY[0x24BE1F490];
    v6 = MEMORY[0x24BEE4AF8];
    v33 = *(_QWORD *)(v0 + 144);
    while (1)
    {
      if (v3 >= *(_QWORD *)(result + 16))
      {
        __break(1u);
        return result;
      }
      v7 = *(_QWORD *)(v0 + 80);
      v8 = *(_QWORD *)(v0 + 64);
      v36 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
      v35 = *(_QWORD *)(v4 + 72);
      (*(void (**)(_QWORD, unint64_t, _QWORD))(v4 + 16))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 144) + v36 + v35 * v3, *(_QWORD *)(v0 + 96));
      sub_20A9DFC6C();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v7, v32, v8);
      sub_20A9BA454(&qword_254611D08, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F498], MEMORY[0x24BE1F4A0]);
      sub_20A9E0158();
      sub_20A9E0158();
      v10 = *(_QWORD *)(v0 + 80);
      v9 = *(_QWORD *)(v0 + 88);
      v11 = *(_QWORD *)(v0 + 64);
      if (*(_QWORD *)(v0 + 16) == *(_QWORD *)(v0 + 32) && *(_QWORD *)(v0 + 24) == *(_QWORD *)(v0 + 40))
        break;
      v13 = sub_20A9E032C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
      v14(v10, v11);
      v14(v9, v11);
      if ((v13 & 1) != 0)
        goto LABEL_10;
      (*(void (**)(_QWORD, _QWORD))(v4 + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 96));
LABEL_4:
      ++v3;
      result = v33;
      if (v34 == v3)
      {
        v2 = MEMORY[0x24BEE4AF8];
        goto LABEL_17;
      }
    }
    swift_bridgeObjectRelease_n();
    v12 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v12(v10, v11);
    v12(v9, v11);
LABEL_10:
    v15 = *(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 32);
    v15(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 96));
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_20A9BF144(0, *(_QWORD *)(v6 + 16) + 1, 1);
      v6 = v38;
    }
    v17 = *(_QWORD *)(v6 + 16);
    v16 = *(_QWORD *)(v6 + 24);
    if (v17 >= v16 >> 1)
    {
      sub_20A9BF144(v16 > 1, v17 + 1, 1);
      v6 = v38;
    }
    v18 = *(_QWORD *)(v0 + 120);
    v19 = *(_QWORD *)(v0 + 96);
    *(_QWORD *)(v6 + 16) = v17 + 1;
    v15(v6 + v36 + v17 * v35, v18, v19);
    v38 = v6;
    goto LABEL_4;
  }
  v6 = MEMORY[0x24BEE4AF8];
LABEL_17:
  swift_bridgeObjectRelease();
  v20 = *(_QWORD *)(v6 + 16);
  if (v20)
  {
    v21 = *(_QWORD *)(v0 + 104);
    v39 = v2;
    sub_20A9BF128(0, v20, 0);
    v22 = v6 + ((*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80));
    v37 = *(_QWORD *)(v21 + 72);
    v23 = v21;
    v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16);
    do
    {
      v25 = *(_QWORD *)(v0 + 112);
      v26 = *(_QWORD *)(v0 + 96);
      v24(v25, v22, v26);
      sub_20A9DFC60();
      v27 = sub_20A9E00BC();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v25, v26);
      v2 = v39;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_20A9BF128(0, *(_QWORD *)(v39 + 16) + 1, 1);
        v2 = v39;
      }
      v29 = *(_QWORD *)(v2 + 16);
      v28 = *(_QWORD *)(v2 + 24);
      if (v29 >= v28 >> 1)
      {
        sub_20A9BF128((_QWORD *)(v28 > 1), v29 + 1, 1);
        v2 = v39;
      }
      *(_QWORD *)(v2 + 16) = v29 + 1;
      *(_QWORD *)(v2 + 8 * v29 + 32) = v27;
      v22 += v37;
      --v20;
    }
    while (v20);
  }
  swift_release();
  v30 = sub_20A9C1300(v2);
  swift_bridgeObjectRelease();
  v31 = *(_QWORD *)(v30 + 16);
  swift_bridgeObjectRelease();
  if (v31)
  {
    *(_QWORD *)(v0 + 152) = *(_QWORD *)(*(_QWORD *)(v0 + 56) + 72);
    return swift_task_switch();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20A9B8AE0()
{
  uint64_t v0;
  _QWORD *v2;

  if (*(_QWORD *)(*(_QWORD *)(v0 + 152) + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller__locationHelper))
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    sub_20A9BA454(&qword_254611C60, (uint64_t (*)(uint64_t))type metadata accessor for ODIBindingsFiller, (uint64_t)&unk_20A9E1144);
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v2;
    sub_20A9DFE28();
    *v2 = v0;
    v2[1] = sub_20A9B8BF0;
    return sub_20A9E0314();
  }
}

uint64_t sub_20A9B8BF0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9B8C44()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9B8CAC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  v2 = sub_20A9E0050();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9B8D0C()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[6] = *(_QWORD *)(v0[2] + 72);
  v1 = (_QWORD *)swift_task_alloc();
  v0[7] = v1;
  *v1 = v0;
  v1[1] = sub_20A9B8D60;
  return sub_20A9B72D0();
}

uint64_t sub_20A9B8D60(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9B8DBC()
{
  uint64_t v0;

  sub_20A9B5B28(*(_QWORD *)(v0 + 64));
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_20A9B8E1C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  void (*v6)(uint64_t, uint64_t);
  _QWORD *v7;

  v2 = v0[4];
  v1 = v0[5];
  v3 = v0[3];
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0[2] + 24), *(_QWORD *)(v0[2] + 48));
  v4 = *MEMORY[0x24BE1F7C0];
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 104);
  v0[9] = v5;
  v5(v1, v4, v3);
  sub_20A9DFF9C();
  v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[10] = v6;
  v6(v1, v3);
  v7 = (_QWORD *)swift_task_alloc();
  v0[11] = v7;
  *v7 = v0;
  v7[1] = sub_20A9B8EEC;
  return sub_20A9B78B8();
}

uint64_t sub_20A9B8EEC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9B8F40()
{
  _QWORD *v0;
  void (*v1)(uint64_t, uint64_t);
  void (*v2)(uint64_t, _QWORD, uint64_t);
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = (void (*)(uint64_t, _QWORD, uint64_t))v0[9];
  v1 = (void (*)(uint64_t, uint64_t))v0[10];
  v3 = v0[5];
  v4 = v0[3];
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0[2] + 24), *(_QWORD *)(v0[2] + 48));
  v2(v3, *MEMORY[0x24BE1F7E8], v4);
  sub_20A9DFF90();
  v1(v3, v4);
  v5 = (_QWORD *)swift_task_alloc();
  v0[12] = v5;
  *v5 = v0;
  v5[1] = sub_20A9B9010;
  return sub_20A9B96E0(0);
}

uint64_t sub_20A9B9010()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_20A9B905C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[4];
  v1 = v0[5];
  v3 = v0[3];
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0[2] + 24), *(_QWORD *)(v0[2] + 48));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BE1F7C0], v3);
  sub_20A9DFF9C();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = (_QWORD *)swift_task_alloc();
  v0[13] = v4;
  *v4 = v0;
  v4[1] = sub_20A9B9124;
  return sub_20A9B78B8();
}

uint64_t sub_20A9B9124()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_20A9B9174(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v2[19] = a1;
  v2[20] = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v2[21] = v3;
  *v3 = v2;
  v3[1] = sub_20A9B91BC;
  return sub_20A9B7038();
}

uint64_t sub_20A9B91BC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 176) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9B9218()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_BYTE *)(v1 + 32);
  *(_BYTE *)(v0 + 224) = v2;
  v3 = -1;
  v4 = -1 << v2;
  if (-(-1 << v2) < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(v1 + 64);
  v6 = (_QWORD *)swift_bridgeObjectRetain();
  if (v5)
  {
    v7 = 0;
    v8 = __clz(__rbit64(v5));
    v9 = (v5 - 1) & v5;
LABEL_5:
    v10 = *(void **)(v6[6] + 8 * v8);
    *(_QWORD *)(v0 + 64) = v10;
    sub_20A9BF828(v6[7] + 40 * v8, v0 + 72);
    v11 = v10;
    goto LABEL_12;
  }
  v12 = 63 - v4;
  if ((unint64_t)(63 - v4) <= 0x7F)
  {
    v7 = 0;
  }
  else
  {
    v13 = v6[9];
    if (v13)
    {
      v7 = 1;
LABEL_9:
      v9 = (v13 - 1) & v13;
      v8 = __clz(__rbit64(v13)) + (v7 << 6);
      goto LABEL_5;
    }
    if (v12 < 0xC0)
    {
      v7 = 1;
    }
    else
    {
      v13 = v6[10];
      if (v13)
      {
        v7 = 2;
        goto LABEL_9;
      }
      if (v12 < 0x100)
      {
        v7 = 2;
      }
      else
      {
        v13 = v6[11];
        if (v13)
        {
          v7 = 3;
          goto LABEL_9;
        }
        if (v12 < 0x140)
        {
          v7 = 3;
        }
        else
        {
          v13 = v6[12];
          if (v13)
          {
            v7 = 4;
            goto LABEL_9;
          }
          v18 = 0;
          v19 = v12 >> 6;
          v20 = 5;
          if (v19 > 5)
            v20 = v19;
          v21 = v20 - 5;
          while (v21 != v18)
          {
            v13 = v6[v18++ + 13];
            if (v13)
            {
              v7 = v18 + 4;
              goto LABEL_9;
            }
          }
          v7 = v19 - 1;
        }
      }
    }
  }
  v9 = 0;
  *(_OWORD *)(v0 + 80) = 0u;
  *(_OWORD *)(v0 + 96) = 0u;
  *(_OWORD *)(v0 + 64) = 0u;
LABEL_12:
  *(_QWORD *)(v0 + 184) = v7;
  *(_QWORD *)(v0 + 192) = v9;
  sub_20A9C1710(v0 + 64, v0 + 16, &qword_254611DC0);
  v14 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 200) = v14;
  if (v14)
  {
    v15 = *(_QWORD *)(v0 + 160);
    sub_20A9C13A0((__int128 *)(v0 + 24), v0 + 112);
    *(_QWORD *)(v0 + 208) = *(_QWORD *)(v15 + 72);
    return swift_task_switch();
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v17;
    *v17 = v0;
    v17[1] = sub_20A9B9698;
    return sub_20A9B8CAC();
  }
}

uint64_t sub_20A9B9444()
{
  uint64_t v0;

  sub_20A9B4854(v0 + 112, *(void **)(v0 + 200), *(_QWORD *)(v0 + 176));
  return swift_task_switch();
}

uint64_t sub_20A9B9488()
{
  uint64_t v0;
  uint64_t result;
  unint64_t v2;
  int64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  result = __swift_destroy_boxed_opaque_existential_1(v0 + 112);
  v3 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 192);
  if (v2)
  {
    v4 = (v2 - 1) & v2;
    v5 = __clz(__rbit64(v2)) | (v3 << 6);
    v6 = *(_QWORD *)(v0 + 152);
LABEL_3:
    v7 = *(void **)(*(_QWORD *)(v6 + 48) + 8 * v5);
    *(_QWORD *)(v0 + 64) = v7;
    sub_20A9BF828(*(_QWORD *)(v6 + 56) + 40 * v5, v0 + 72);
    v8 = v7;
    goto LABEL_22;
  }
  v9 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
    goto LABEL_26;
  }
  v10 = (unint64_t)((1 << *(_BYTE *)(v0 + 224)) + 63) >> 6;
  if (v9 < v10)
  {
    v6 = *(_QWORD *)(v0 + 152);
    v11 = v6 + 64;
    v12 = *(_QWORD *)(v6 + 64 + 8 * v9);
    if (v12)
    {
LABEL_7:
      v4 = (v12 - 1) & v12;
      v5 = __clz(__rbit64(v12)) + (v9 << 6);
      v3 = v9;
      goto LABEL_3;
    }
    v13 = v3 + 2;
    ++v3;
    if (v9 + 1 < v10)
    {
      v12 = *(_QWORD *)(v11 + 8 * v13);
      if (v12)
      {
LABEL_10:
        v9 = v13;
        goto LABEL_7;
      }
      v3 = v9 + 1;
      if (v9 + 2 < v10)
      {
        v12 = *(_QWORD *)(v11 + 8 * (v9 + 2));
        if (v12)
        {
          v9 += 2;
          goto LABEL_7;
        }
        v13 = v9 + 3;
        v3 = v9 + 2;
        if (v9 + 3 < v10)
        {
          v12 = *(_QWORD *)(v11 + 8 * v13);
          if (v12)
            goto LABEL_10;
          while (1)
          {
            v9 = v13 + 1;
            if (__OFADD__(v13, 1))
              break;
            if (v9 >= v10)
            {
              v3 = v10 - 1;
              goto LABEL_21;
            }
            v12 = *(_QWORD *)(v11 + 8 * v9);
            ++v13;
            if (v12)
              goto LABEL_7;
          }
LABEL_26:
          __break(1u);
          return result;
        }
      }
    }
  }
LABEL_21:
  v4 = 0;
  *(_OWORD *)(v0 + 80) = 0u;
  *(_OWORD *)(v0 + 96) = 0u;
  *(_OWORD *)(v0 + 64) = 0u;
LABEL_22:
  *(_QWORD *)(v0 + 184) = v3;
  *(_QWORD *)(v0 + 192) = v4;
  sub_20A9C1710(v0 + 64, v0 + 16, &qword_254611DC0);
  v14 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 200) = v14;
  if (v14)
  {
    v15 = *(_QWORD *)(v0 + 160);
    sub_20A9C13A0((__int128 *)(v0 + 24), v0 + 112);
    *(_QWORD *)(v0 + 208) = *(_QWORD *)(v15 + 72);
    return swift_task_switch();
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v16;
    *v16 = v0;
    v16[1] = sub_20A9B9698;
    return sub_20A9B8CAC();
  }
}

uint64_t sub_20A9B9698()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_20A9B96E0(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v2 + 88) = v1;
  *(_BYTE *)(v2 + 81) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C48);
  *(_QWORD *)(v2 + 96) = swift_task_alloc();
  v3 = sub_20A9E0050();
  *(_QWORD *)(v2 + 104) = v3;
  *(_QWORD *)(v2 + 112) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 120) = swift_task_alloc();
  v4 = sub_20A9E02C0();
  *(_QWORD *)(v2 + 128) = v4;
  *(_QWORD *)(v2 + 136) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 144) = swift_task_alloc();
  v5 = sub_20A9E02B4();
  *(_QWORD *)(v2 + 152) = v5;
  *(_QWORD *)(v2 + 160) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 168) = swift_task_alloc();
  *(_QWORD *)(v2 + 176) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9B97C8()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 81) & 1) != 0)
  {
    *(_QWORD *)(v0 + 216) = 0;
    *(_QWORD *)(v0 + 224) = *(_QWORD *)(*(_QWORD *)(v0 + 88) + 80);
    sub_20A9DFCC0();
    sub_20A9BA454(&qword_254611C98, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F470], MEMORY[0x24BE1F480]);
    sub_20A9E0170();
  }
  else
  {
    *(_QWORD *)(v0 + 184) = *(_QWORD *)(*(_QWORD *)(v0 + 88) + 72);
  }
  return swift_task_switch();
}

uint64_t sub_20A9B986C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v0[20];
  v1 = v0[21];
  v3 = v0[19];
  v4 = v0[23] + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_coalescingReferenceDate;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  return swift_task_switch();
}

uint64_t sub_20A9B98E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 168);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 160);
  sub_20A9E029C();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(_QWORD *)(v0 + 192) = v4;
  v4(v1, v2);
  *(_QWORD *)(v0 + 72) = 0;
  *(_QWORD *)(v0 + 64) = 0;
  *(_BYTE *)(v0 + 80) = 1;
  sub_20A9E0350();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 200) = v5;
  sub_20A9BA454(&qword_254611CD0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E98], MEMORY[0x24BEE6EA8]);
  *v5 = v0;
  v5[1] = sub_20A9B99C0;
  return sub_20A9E01DC();
}

uint64_t sub_20A9B99C0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc();
  v3 = (void (*)(uint64_t, uint64_t))v2[24];
  v4 = v2[22];
  v5 = v2[19];
  (*(void (**)(_QWORD, _QWORD))(v2[17] + 8))(v2[18], v2[16]);
  v3(v4, v5);
  return swift_task_switch();
}

uint64_t sub_20A9B9A74()
{
  _QWORD *v0;

  v0[27] = v0[26];
  v0[28] = *(_QWORD *)(v0[11] + 80);
  sub_20A9DFCC0();
  sub_20A9BA454(&qword_254611C98, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F470], MEMORY[0x24BE1F480]);
  sub_20A9E0170();
  return swift_task_switch();
}

uint64_t sub_20A9B9AF8()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 82) = sub_20A9DFCB4() & 1;
  return swift_task_switch();
}

uint64_t sub_20A9B9B3C()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_BYTE *)(v0 + 82) == 1)
  {
    v1 = *(_QWORD *)(v0 + 88);
    *(_QWORD *)(v0 + 232) = *(_QWORD *)(v1 + 64);
    *(_QWORD *)(v0 + 240) = *(_QWORD *)(v1 + 72);
    return swift_task_switch();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20A9B9BE4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 240);
  swift_beginAccess();
  *(_QWORD *)(v0 + 248) = *(_QWORD *)(v1 + 112);
  swift_bridgeObjectRetain();
  return swift_task_switch();
}

uint64_t sub_20A9B9C3C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 216);
  *(_BYTE *)(v0 + 83) = sub_20A9B68E8(*(_QWORD **)(v0 + 248)) & 1;
  swift_bridgeObjectRelease();
  if (!v1)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9B9CF8()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_BYTE *)(v0 + 83) == 1)
  {
    v1 = MEMORY[0x20BD29F38](*(_QWORD *)(v0 + 88) + 96);
    *(_QWORD *)(v0 + 256) = v1;
    if (v1)
      return swift_task_switch();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9B9DA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = *(_QWORD *)(v0 + 256);
  v3 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 104);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, *MEMORY[0x24BE1F7E8], v5);
  sub_20A9DFF9C();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v5);
  v6 = sub_20A9E0194();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v4, 1, 1, v6);
  v7 = sub_20A9BA454(&qword_254611CD8, type metadata accessor for ODISessionInternal, (uint64_t)&protocol conformance descriptor for ODISessionInternal);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v1;
  v8[3] = v7;
  v8[4] = v1;
  swift_retain_n();
  sub_20A9C3E64(v4, (uint64_t)&unk_254611CE0, (uint64_t)v8);
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9B9F28()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9B9F98()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_20A9C13C0(v0 + 96);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_20A9B9FFC()
{
  sub_20A9B9F98();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ODIBindingsManager()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ODIBindingsManager.CallbackQueuer()
{
  return objc_opt_self();
}

void type metadata accessor for ODITypeOfID(uint64_t a1)
{
  sub_20A9BA0AC(a1, &qword_254611B70);
}

void type metadata accessor for ODIOutcomeType(uint64_t a1)
{
  sub_20A9BA0AC(a1, &qword_254611B78);
}

void type metadata accessor for ODIAttributeKey(uint64_t a1)
{
  sub_20A9BA0AC(a1, &qword_254611B80);
}

void type metadata accessor for ODIServiceProviderId(uint64_t a1)
{
  sub_20A9BA0AC(a1, &qword_254611B88);
}

void sub_20A9BA0AC(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_20A9BA0F0(uint64_t a1, uint64_t a2)
{
  return sub_20A9BA544(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_20A9BA108(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_20A9E00C8();
  *a2 = 0;
  return result;
}

uint64_t sub_20A9BA17C(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_20A9E00D4();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_20A9BA1F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_20A9E00E0();
  v2 = sub_20A9E00BC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_20A9BA238(uint64_t a1, uint64_t a2)
{
  return sub_20A9BA544(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_20A9BA250()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_20A9E00E0();
  v2 = v1;
  if (v0 == sub_20A9E00E0() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_20A9E032C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

BOOL sub_20A9BA2D8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_20A9BA2F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_20A9E00E0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20A9BA318@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_20A9E00BC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

_QWORD *sub_20A9BA35C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_20A9BA36C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_20A9BA378()
{
  sub_20A9BA454(&qword_254611C18, (uint64_t (*)(uint64_t))type metadata accessor for ODIServiceProviderId, (uint64_t)&unk_20A9E0E94);
  sub_20A9BA454(&qword_254611C20, (uint64_t (*)(uint64_t))type metadata accessor for ODIServiceProviderId, (uint64_t)&unk_20A9E0E34);
  return sub_20A9E02FC();
}

uint64_t sub_20A9BA3FC()
{
  return sub_20A9BA454(&qword_254611B90, (uint64_t (*)(uint64_t))type metadata accessor for ODIServiceProviderId, (uint64_t)&unk_20A9E0DF8);
}

uint64_t sub_20A9BA428()
{
  return sub_20A9BA454(&qword_254611B98, (uint64_t (*)(uint64_t))type metadata accessor for ODIServiceProviderId, (uint64_t)&unk_20A9E0DCC);
}

uint64_t sub_20A9BA454(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x20BD29DF4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20A9BA494()
{
  return sub_20A9BA454(&qword_254611BA0, (uint64_t (*)(uint64_t))type metadata accessor for ODIServiceProviderId, (uint64_t)&unk_20A9E0E68);
}

uint64_t sub_20A9BA4C0()
{
  sub_20A9BA454((unint64_t *)&qword_254611C08, (uint64_t (*)(uint64_t))type metadata accessor for ODIAttributeKey, (uint64_t)&unk_20A9E116C);
  sub_20A9BA454(&qword_254611C10, (uint64_t (*)(uint64_t))type metadata accessor for ODIAttributeKey, (uint64_t)&unk_20A9E0F8C);
  return sub_20A9E02FC();
}

uint64_t sub_20A9BA544(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_20A9E00E0();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_20A9BA580()
{
  sub_20A9E00E0();
  sub_20A9E0104();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20A9BA5C0()
{
  uint64_t v0;

  sub_20A9E00E0();
  sub_20A9E0368();
  sub_20A9E0104();
  v0 = sub_20A9E0380();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_20A9BA630()
{
  return sub_20A9BA454(&qword_254611BA8, (uint64_t (*)(uint64_t))type metadata accessor for ODIAttributeKey, (uint64_t)&unk_20A9E0F50);
}

uint64_t sub_20A9BA65C()
{
  return sub_20A9BA454(qword_254611BB0, (uint64_t (*)(uint64_t))type metadata accessor for ODIAttributeKey, (uint64_t)&unk_20A9E0F24);
}

uint64_t sub_20A9BA688()
{
  return sub_20A9BA454(&qword_254611BD8, (uint64_t (*)(uint64_t))type metadata accessor for ODIAttributeKey, (uint64_t)&unk_20A9E0FC0);
}

uint64_t sub_20A9BA6B4(int *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))((char *)a1 + *a1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_20A9BA70C;
  return v4();
}

uint64_t sub_20A9BA70C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

size_t sub_20A9BA758(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C70);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254611C50) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254611C50) - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

_QWORD *sub_20A9BA8D4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254611BF0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[2 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254611BF8);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *sub_20A9BA9F4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254611C78);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4])
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    type metadata accessor for ODIServiceProviderId(0);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_20A9BAB10(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C40);
  v10 = *(_QWORD *)(sub_20A9DFBAC() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(sub_20A9DFBAC() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

unint64_t sub_20A9BAC84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_20A9E0368();
  sub_20A9E0104();
  v4 = sub_20A9E0380();
  return sub_20A9BAE3C(a1, a2, v4);
}

unint64_t sub_20A9BACE8(__int16 a1)
{
  uint64_t v2;

  sub_20A9E0368();
  sub_20A9E0374();
  sub_20A9E0374();
  v2 = sub_20A9E0380();
  return sub_20A9BAF1C(a1 & 0xFF01, v2);
}

unint64_t sub_20A9BAD50(uint64_t a1)
{
  uint64_t v2;

  sub_20A9DFC84();
  sub_20A9BA454(&qword_254611C30, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F420], MEMORY[0x24BE1F430]);
  v2 = sub_20A9E00A4();
  return sub_20A9BAFA8(a1, v2);
}

unint64_t sub_20A9BADBC(uint64_t a1)
{
  uint64_t v2;

  sub_20A9E00E0();
  sub_20A9E0368();
  sub_20A9E0104();
  v2 = sub_20A9E0380();
  swift_bridgeObjectRelease();
  return sub_20A9BB0E8(a1, v2);
}

unint64_t sub_20A9BAE3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_20A9E032C() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_20A9E032C() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_20A9BAF1C(unsigned __int16 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t result;
  int v6;
  int v7;
  uint64_t v8;

  v4 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v6 = a1;
    v7 = HIBYTE(a1);
    v8 = ~v4;
    do
    {
      if (!((v6 ^ *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + 2 * result)) & 1 | (v7 != *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + 2 * result + 1))))
        break;
      result = (result + 1) & v8;
    }
    while (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

unint64_t sub_20A9BAFA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_20A9DFC84();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_20A9BA454(&qword_254611C38, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F420], MEMORY[0x24BE1F438]);
      v14 = sub_20A9E00B0();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_20A9BB0E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_20A9E00E0();
    v8 = v7;
    if (v6 == sub_20A9E00E0() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_20A9E032C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_20A9E00E0();
          v15 = v14;
          if (v13 == sub_20A9E00E0() && v15 == v16)
            break;
          v18 = sub_20A9E032C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_20A9BB25C(uint64_t a1, char a2)
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
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;
  __int128 v38[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611DA0);
  v37 = a2;
  v6 = sub_20A9E02E4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35)
      break;
    v19 = (_QWORD *)(v5 + 64);
    v20 = *(_QWORD *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v35)
        goto LABEL_34;
      v20 = *(_QWORD *)(v36 + 8 * v13);
      if (!v20)
      {
        v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v20 = *(_QWORD *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            v13 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_43;
            if (v13 >= v35)
              goto LABEL_34;
            v20 = *(_QWORD *)(v36 + 8 * v13);
            ++v21;
            if (v20)
              goto LABEL_21;
          }
        }
        v13 = v21;
      }
    }
LABEL_21:
    v10 = (v20 - 1) & v20;
    v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    v22 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v24 = *v22;
    v23 = v22[1];
    v25 = (__int128 *)(*(_QWORD *)(v5 + 56) + 40 * v17);
    if ((v37 & 1) != 0)
    {
      sub_20A9C13A0(v25, (uint64_t)v38);
    }
    else
    {
      sub_20A9BF828((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_20A9E0368();
    sub_20A9E0104();
    result = sub_20A9E0380();
    v26 = -1 << *(_BYTE *)(v7 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v31 = v28 == v30;
        if (v28 == v30)
          v28 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
    *v15 = v24;
    v15[1] = v23;
    result = sub_20A9C13A0(v38, *(_QWORD *)(v7 + 56) + 40 * v14);
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v19 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v19 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_20A9BB580(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C00);
  v36 = a2;
  v6 = sub_20A9E02E4();
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
    sub_20A9E0368();
    sub_20A9E0104();
    result = sub_20A9E0380();
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

uint64_t sub_20A9BB894(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _BYTE *v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  char *v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  _QWORD *v32;
  char v33;

  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C80);
  v33 = a2;
  result = sub_20A9E02E4();
  v6 = result;
  if (*(_QWORD *)(v4 + 16))
  {
    v7 = 0;
    v32 = (_QWORD *)(v4 + 64);
    v8 = 1 << *(_BYTE *)(v4 + 32);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v4 + 64);
    v31 = (unint64_t)(v8 + 63) >> 6;
    v11 = result + 64;
    while (1)
    {
      if (v10)
      {
        v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v18 = v17 | (v7 << 6);
      }
      else
      {
        v19 = v7 + 1;
        if (__OFADD__(v7, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        result = v4 + 64;
        if (v19 >= v31)
          goto LABEL_33;
        v20 = v32[v19];
        ++v7;
        if (!v20)
        {
          v7 = v19 + 1;
          if (v19 + 1 >= v31)
            goto LABEL_33;
          v20 = v32[v7];
          if (!v20)
          {
            v21 = v19 + 2;
            if (v21 >= v31)
            {
LABEL_33:
              if ((v33 & 1) != 0)
              {
                v30 = 1 << *(_BYTE *)(v4 + 32);
                if (v30 >= 64)
                  bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v32 = -1 << v30;
                *(_QWORD *)(v4 + 16) = 0;
              }
              break;
            }
            v20 = v32[v21];
            if (!v20)
            {
              while (1)
              {
                v7 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_41;
                if (v7 >= v31)
                  goto LABEL_33;
                v20 = v32[v7];
                ++v21;
                if (v20)
                  goto LABEL_30;
              }
            }
            v7 = v21;
          }
        }
LABEL_30:
        v10 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v7 << 6);
      }
      v26 = (char *)(*(_QWORD *)(v4 + 48) + 2 * v18);
      v27 = *v26;
      v28 = v26[1];
      v29 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v18);
      if ((v33 & 1) == 0)
        swift_bridgeObjectRetain();
      sub_20A9E0368();
      sub_20A9E0374();
      sub_20A9E0374();
      result = sub_20A9E0380();
      v12 = -1 << *(_BYTE *)(v6 + 32);
      v13 = result & ~v12;
      v14 = v13 >> 6;
      if (((-1 << v13) & ~*(_QWORD *)(v11 + 8 * (v13 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v13) & ~*(_QWORD *)(v11 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v12) >> 6;
        do
        {
          if (++v14 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v24 = v14 == v23;
          if (v14 == v23)
            v14 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v14);
        }
        while (v25 == -1);
        v15 = __clz(__rbit64(~v25)) + (v14 << 6);
      }
      *(_QWORD *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      v16 = (_BYTE *)(*(_QWORD *)(v6 + 48) + 2 * v15);
      *v16 = v27;
      v16[1] = v28;
      *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v15) = v29;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release();
  *v2 = v6;
  return result;
}

uint64_t sub_20A9BBB8C(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;

  v4 = sub_20A9DFC84();
  v42 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = v2;
  v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C28);
  v8 = sub_20A9E02E4();
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
  {
    result = swift_release();
    v35 = v38;
LABEL_42:
    *v35 = v9;
    return result;
  }
  v10 = 1 << *(_BYTE *)(v7 + 32);
  v11 = *(_QWORD *)(v7 + 64);
  v40 = (_QWORD *)(v7 + 64);
  if (v10 < 64)
    v12 = ~(-1 << v10);
  else
    v12 = -1;
  v13 = v12 & v11;
  v39 = (unint64_t)(v10 + 63) >> 6;
  v14 = v8 + 64;
  result = swift_retain();
  v16 = 0;
  HIDWORD(v37) = a2;
  v17 = 16;
  if ((a2 & 1) != 0)
    v17 = 32;
  v41 = v17;
  while (1)
  {
    if (v13)
    {
      v19 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v20 = v19 | (v16 << 6);
      goto LABEL_24;
    }
    v21 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_43:
      __break(1u);
      goto LABEL_44;
    }
    if (v21 >= v39)
    {
      swift_release();
      v35 = v38;
      v22 = v40;
      if ((v37 & 0x100000000) != 0)
      {
LABEL_37:
        v36 = 1 << *(_BYTE *)(v7 + 32);
        if (v36 >= 64)
          bzero(v22, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
        else
          *v22 = -1 << v36;
        *(_QWORD *)(v7 + 16) = 0;
      }
LABEL_41:
      result = swift_release();
      goto LABEL_42;
    }
    v22 = v40;
    v23 = v40[v21];
    ++v16;
    if (!v23)
    {
      v16 = v21 + 1;
      if (v21 + 1 >= v39)
        goto LABEL_34;
      v23 = v40[v16];
      if (!v23)
        break;
    }
LABEL_23:
    v13 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v16 << 6);
LABEL_24:
    v25 = *(_QWORD *)(v42 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v42 + v41))(v6, *(_QWORD *)(v7 + 48) + v25 * v20, v4);
    v26 = v7;
    v27 = *(_BYTE *)(*(_QWORD *)(v7 + 56) + v20);
    sub_20A9BA454(&qword_254611C30, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F420], MEMORY[0x24BE1F430]);
    result = sub_20A9E00A4();
    v28 = -1 << *(_BYTE *)(v9 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v14 + 8 * (v29 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v14 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_43;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v14 + 8 * v30);
      }
      while (v34 == -1);
      v18 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v42 + 32))(*(_QWORD *)(v9 + 48) + v25 * v18, v6, v4);
    *(_BYTE *)(*(_QWORD *)(v9 + 56) + v18) = v27;
    ++*(_QWORD *)(v9 + 16);
    v7 = v26;
  }
  v24 = v21 + 2;
  if (v24 >= v39)
  {
LABEL_34:
    swift_release();
    v35 = v38;
    if ((v37 & 0x100000000) != 0)
      goto LABEL_37;
    goto LABEL_41;
  }
  v23 = v40[v24];
  if (v23)
  {
    v16 = v24;
    goto LABEL_23;
  }
  while (1)
  {
    v16 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v16 >= v39)
      goto LABEL_34;
    v23 = v40[v16];
    ++v24;
    if (v23)
      goto LABEL_23;
  }
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_20A9BBF28(uint64_t a1, char a2)
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
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  void *v20;
  __int128 *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  int64_t v33;
  _QWORD *v34;
  char v35;
  __int128 v36[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611DC8);
  v35 = a2;
  v6 = sub_20A9E02E4();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v32 = v2;
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v15 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v16 = v15 | (v13 << 6);
      }
      else
      {
        v17 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v17 >= v33)
          goto LABEL_34;
        v18 = v34[v17];
        ++v13;
        if (!v18)
        {
          v13 = v17 + 1;
          if (v17 + 1 >= v33)
            goto LABEL_34;
          v18 = v34[v13];
          if (!v18)
          {
            v19 = v17 + 2;
            if (v19 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v32;
              if ((v35 & 1) != 0)
              {
                v31 = 1 << *(_BYTE *)(v5 + 32);
                if (v31 >= 64)
                  bzero(v34, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v31;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v18 = v34[v19];
            if (!v18)
            {
              while (1)
              {
                v13 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v18 = v34[v13];
                ++v19;
                if (v18)
                  goto LABEL_21;
              }
            }
            v13 = v19;
          }
        }
LABEL_21:
        v10 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v13 << 6);
      }
      v20 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v16);
      v21 = (__int128 *)(*(_QWORD *)(v5 + 56) + 40 * v16);
      if ((v35 & 1) != 0)
      {
        sub_20A9C13A0(v21, (uint64_t)v36);
      }
      else
      {
        sub_20A9BF828((uint64_t)v21, (uint64_t)v36);
        v22 = v20;
      }
      sub_20A9E00E0();
      sub_20A9E0368();
      sub_20A9E0104();
      v23 = sub_20A9E0380();
      result = swift_bridgeObjectRelease();
      v24 = -1 << *(_BYTE *)(v7 + 32);
      v25 = v23 & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v11 + 8 * v26);
        }
        while (v30 == -1);
        v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v14) = v20;
      result = sub_20A9C13A0(v36, *(_QWORD *)(v7 + 56) + 40 * v14);
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_20A9BC250(uint64_t a1, char a2)
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
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C88);
  v38 = a2;
  v6 = sub_20A9E02E4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
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
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_20A9E0368();
    sub_20A9E0104();
    result = sub_20A9E0380();
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
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_20A9BC55C(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  unint64_t v17;
  __int128 *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_20A9E0230();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_20A9E0368();
        swift_bridgeObjectRetain();
        sub_20A9E0104();
        v11 = sub_20A9E0380();
        result = swift_bridgeObjectRelease();
        v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8)
            goto LABEL_5;
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(a2 + 48);
          v14 = (_OWORD *)(v13 + 16 * v3);
          v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1)
            *v14 = *v15;
          v16 = *(_QWORD *)(a2 + 56);
          v17 = v16 + 40 * v3;
          v18 = (__int128 *)(v16 + 40 * v6);
          if (v3 != v6 || (v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            v9 = *v18;
            v10 = v18[1];
            *(_QWORD *)(v17 + 32) = *((_QWORD *)v18 + 4);
            *(_OWORD *)v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_20A9BC744(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_20A9E0230();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_20A9E0368();
        swift_bridgeObjectRetain();
        sub_20A9E0104();
        v9 = sub_20A9E0380();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_20A9BC918(__int128 *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
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

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_20A9BAC84(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = v18[7] + 40 * v12;
        __swift_destroy_boxed_opaque_existential_1(v19);
        return sub_20A9C13A0(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_20A9BCFC0();
      goto LABEL_7;
    }
    sub_20A9BB25C(v15, a4 & 1);
    v21 = sub_20A9BAC84(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_20A9BCF00(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_20A9E0344();
  __break(1u);
  return result;
}

uint64_t sub_20A9BCA4C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_20A9BAC84(a2, a3);
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
    sub_20A9BD1A8();
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
  sub_20A9BB580(v15, a4 & 1);
  v21 = sub_20A9BAC84(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_20A9E0344();
  __break(1u);
  return result;
}

uint64_t sub_20A9BCBA8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20A9BCBCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_20A9C1758;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_254611BE0 + dword_254611BE0))(a1, a2, v6);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD29DDC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_20A9BCC90(uint64_t a1, __int16 a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v7;
  __int16 v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t result;
  unint64_t v19;
  char v20;

  v4 = (_QWORD **)v3;
  v7 = (_QWORD *)*v3;
  v8 = a2 & 0xFF01;
  v10 = sub_20A9BACE8(a2 & 0xFF01);
  v11 = v7[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v7[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = v16[7];
        result = swift_bridgeObjectRelease();
        *(_QWORD *)(v17 + 8 * v10) = a1;
        return result;
      }
      return sub_20A9BCF6C(v10, v8, a1, v16);
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_20A9BD35C();
      goto LABEL_7;
    }
    sub_20A9BB894(v13, a3 & 1);
    v19 = sub_20A9BACE8(v8);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
      return sub_20A9BCF6C(v10, v8, a1, v16);
    }
  }
  result = sub_20A9E0344();
  __break(1u);
  return result;
}

void sub_20A9BCDA4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_20A9BAC84(a2, a3);
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
    sub_20A9BD8F8();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_20A9BC250(v15, a4 & 1);
  v20 = sub_20A9BAC84(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_20A9E0344();
  __break(1u);
}

uint64_t sub_20A9BCF00(unint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, _QWORD *a5)
{
  _QWORD *v6;
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_20A9C13A0(a4, a5[7] + 40 * a1);
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

unint64_t sub_20A9BCF6C(unint64_t result, __int16 a2, uint64_t a3, _QWORD *a4)
{
  _BYTE *v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  a4[(result >> 6) + 8] |= 1 << result;
  v4 = (_BYTE *)(a4[6] + 2 * result);
  *v4 = a2 & 1;
  v4[1] = HIBYTE(a2);
  *(_QWORD *)(a4[7] + 8 * result) = a3;
  v5 = a4[2];
  v6 = __OFADD__(v5, 1);
  v7 = v5 + 1;
  if (v6)
    __break(1u);
  else
    a4[2] = v7;
  return result;
}

void *sub_20A9BCFC0()
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
  __int128 v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611DA0);
  v2 = *v0;
  v3 = sub_20A9E02D8();
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
    v19 = *v17;
    v18 = v17[1];
    v20 = 40 * v15;
    sub_20A9BF828(*(_QWORD *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_20A9C13A0(v26, *(_QWORD *)(v4 + 56) + v20);
    result = (void *)swift_bridgeObjectRetain();
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

void *sub_20A9BD1A8()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C00);
  v2 = *v0;
  v3 = sub_20A9E02D8();
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

void *sub_20A9BD35C()
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
  char *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C80);
  v2 = *v0;
  v3 = sub_20A9E02D8();
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
    v16 = 2 * v15;
    v17 = (char *)(*(_QWORD *)(v2 + 48) + 2 * v15);
    v18 = *v17;
    LOBYTE(v17) = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_BYTE *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v18;
    v21[1] = (_BYTE)v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
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

void *sub_20A9BD510()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int64_t v25;

  v1 = sub_20A9DFC84();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C28);
  v23 = v0;
  v5 = *v0;
  v6 = sub_20A9E02D8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v23 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v24 = v5 + 64;
  v25 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v25)
      goto LABEL_26;
    v20 = *(_QWORD *)(v24 + 8 * v19);
    ++v11;
    if (!v20)
    {
      v11 = v19 + 1;
      if (v19 + 1 >= v25)
        goto LABEL_26;
      v20 = *(_QWORD *)(v24 + 8 * v11);
      if (!v20)
        break;
    }
LABEL_25:
    v14 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v16);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_BYTE *)(*(_QWORD *)(v7 + 56) + v16) = v18;
  }
  v21 = v19 + 2;
  if (v21 >= v25)
    goto LABEL_26;
  v20 = *(_QWORD *)(v24 + 8 * v21);
  if (v20)
  {
    v11 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v11 >= v25)
      goto LABEL_26;
    v20 = *(_QWORD *)(v24 + 8 * v11);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_20A9BD730()
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
  void *v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  __int128 v22[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611DC8);
  v2 = *v0;
  v3 = sub_20A9E02D8();
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
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v13)
        goto LABEL_26;
      v20 = *(_QWORD *)(v6 + 8 * v9);
      if (!v20)
        break;
    }
LABEL_25:
    v12 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 40 * v15;
    sub_20A9BF828(*(_QWORD *)(v2 + 56) + 40 * v15, (uint64_t)v22);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    sub_20A9C13A0(v22, *(_QWORD *)(v4 + 56) + v18);
    result = v17;
  }
  v21 = v19 + 2;
  if (v21 >= v13)
    goto LABEL_26;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_20A9BD8F8()
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C88);
  v2 = *v0;
  v3 = sub_20A9E02D8();
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
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
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

uint64_t sub_20A9BDAA8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_20A9E0368();
  swift_bridgeObjectRetain();
  sub_20A9E0104();
  v8 = sub_20A9E0380();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_20A9E032C() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_20A9E032C() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_20A9BE468(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_20A9BDC54(_QWORD *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  char isUniquelyReferenced_nonNull_native;
  id v24;
  void *v26;
  id v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  sub_20A9E00E0();
  sub_20A9E0368();
  swift_bridgeObjectRetain();
  sub_20A9E0104();
  v7 = sub_20A9E0380();
  swift_bridgeObjectRelease();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v3;
    *v3 = 0x8000000000000000;
    v24 = a2;
    sub_20A9BE600((uint64_t)v24, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v28;
    swift_bridgeObjectRelease();
    *a1 = v24;
    return 1;
  }
  v10 = sub_20A9E00E0();
  v12 = v11;
  if (v10 == sub_20A9E00E0() && v12 == v13)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v15 = sub_20A9E032C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      v16 = ~v8;
      do
      {
        v9 = (v9 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
          goto LABEL_15;
        v17 = sub_20A9E00E0();
        v19 = v18;
        if (v17 == sub_20A9E00E0() && v19 == v20)
          goto LABEL_16;
        v22 = sub_20A9E032C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      while ((v22 & 1) == 0);
    }
  }

  swift_bridgeObjectRelease();
  v26 = *(void **)(*(_QWORD *)(*v3 + 48) + 8 * v9);
  *a1 = v26;
  v27 = v26;
  return 0;
}

uint64_t sub_20A9BDE7C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611D30);
  v3 = sub_20A9E0254();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_20A9E0368();
      sub_20A9E0104();
      result = sub_20A9E0380();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_20A9BE158()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  int64_t v28;
  _QWORD *v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611D10);
  v3 = sub_20A9E0254();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v27 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v29 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v28 = (unint64_t)(v5 + 63) >> 6;
    v8 = v3 + 56;
    result = swift_retain();
    v10 = 0;
    while (1)
    {
      if (v7)
      {
        v12 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v13 = v12 | (v10 << 6);
      }
      else
      {
        v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v14 >= v28)
          goto LABEL_33;
        v15 = v29[v14];
        ++v10;
        if (!v15)
        {
          v10 = v14 + 1;
          if (v14 + 1 >= v28)
            goto LABEL_33;
          v15 = v29[v10];
          if (!v15)
          {
            v10 = v14 + 2;
            if (v14 + 2 >= v28)
              goto LABEL_33;
            v15 = v29[v10];
            if (!v15)
            {
              v16 = v14 + 3;
              if (v16 >= v28)
              {
LABEL_33:
                swift_release();
                v1 = v27;
                v26 = 1 << *(_BYTE *)(v2 + 32);
                if (v26 > 63)
                  bzero(v29, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v29 = -1 << v26;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v15 = v29[v16];
              if (!v15)
              {
                while (1)
                {
                  v10 = v16 + 1;
                  if (__OFADD__(v16, 1))
                    goto LABEL_39;
                  if (v10 >= v28)
                    goto LABEL_33;
                  v15 = v29[v10];
                  ++v16;
                  if (v15)
                    goto LABEL_23;
                }
              }
              v10 = v16;
            }
          }
        }
LABEL_23:
        v7 = (v15 - 1) & v15;
        v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v13);
      sub_20A9E00E0();
      sub_20A9E0368();
      sub_20A9E0104();
      v18 = sub_20A9E0380();
      result = swift_bridgeObjectRelease();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = v18 & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v8 + 8 * (v20 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v8 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v8 + 8 * v21);
        }
        while (v25 == -1);
        v11 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v11) = v17;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_20A9BE468(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_20A9BDE7C();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_20A9BE82C();
      goto LABEL_22;
    }
    sub_20A9BEB84();
  }
  v11 = *v4;
  sub_20A9E0368();
  sub_20A9E0104();
  result = sub_20A9E0380();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_20A9E032C(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_20A9E0338();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_20A9E032C();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

uint64_t sub_20A9BE600(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;

  v4 = v3;
  v6 = result;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_22;
  if ((a3 & 1) != 0)
  {
    sub_20A9BE158();
  }
  else
  {
    if (v8 > v7)
    {
      result = (uint64_t)sub_20A9BE9DC();
LABEL_22:
      v25 = *v4;
      *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
      *(_QWORD *)(*(_QWORD *)(v25 + 48) + 8 * a2) = v6;
      v26 = *(_QWORD *)(v25 + 16);
      v27 = __OFADD__(v26, 1);
      v28 = v26 + 1;
      if (!v27)
      {
        *(_QWORD *)(v25 + 16) = v28;
        return result;
      }
      __break(1u);
      goto LABEL_25;
    }
    sub_20A9BEE30();
  }
  v9 = *v3;
  sub_20A9E00E0();
  sub_20A9E0368();
  sub_20A9E0104();
  v10 = sub_20A9E0380();
  result = swift_bridgeObjectRelease();
  v11 = -1 << *(_BYTE *)(v9 + 32);
  a2 = v10 & ~v11;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
    goto LABEL_22;
  v12 = sub_20A9E00E0();
  v14 = v13;
  if (v12 == sub_20A9E00E0() && v14 == v15)
  {
LABEL_25:
    swift_bridgeObjectRelease_n();
    goto LABEL_26;
  }
  v17 = sub_20A9E032C();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v17 & 1) == 0)
  {
    v18 = ~v11;
    do
    {
      a2 = (a2 + 1) & v18;
      if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
        goto LABEL_22;
      v19 = sub_20A9E00E0();
      v21 = v20;
      if (v19 == sub_20A9E00E0() && v21 == v22)
        goto LABEL_25;
      v24 = sub_20A9E032C();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
    }
    while ((v24 & 1) == 0);
  }
LABEL_26:
  type metadata accessor for ODIAttributeKey(0);
  result = sub_20A9E0338();
  __break(1u);
  return result;
}

void *sub_20A9BE82C()
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
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611D30);
  v2 = *v0;
  v3 = sub_20A9E0248();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_20A9BE9DC()
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611D10);
  v2 = *v0;
  v3 = sub_20A9E0248();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_20A9BEB84()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611D30);
  v3 = sub_20A9E0254();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_20A9E0368();
    swift_bridgeObjectRetain();
    sub_20A9E0104();
    result = sub_20A9E0380();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_20A9BEE30()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611D10);
  v3 = sub_20A9E0254();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v27 = v0;
  v28 = v2 + 56;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v8 = v3 + 56;
  result = swift_retain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v29)
      goto LABEL_33;
    v15 = *(_QWORD *)(v28 + 8 * v14);
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_33;
      v15 = *(_QWORD *)(v28 + 8 * v10);
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_33;
        v15 = *(_QWORD *)(v28 + 8 * v10);
        if (!v15)
          break;
      }
    }
LABEL_23:
    v7 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v13);
    sub_20A9E00E0();
    sub_20A9E0368();
    v18 = v17;
    sub_20A9E0104();
    v19 = sub_20A9E0380();
    result = swift_bridgeObjectRelease();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = v19 & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v8 + 8 * (v21 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v8 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v8 + 8 * v22);
      }
      while (v26 == -1);
      v11 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v11) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v15 = *(_QWORD *)(v28 + 8 * v16);
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v29)
      goto LABEL_33;
    v15 = *(_QWORD *)(v28 + 8 * v10);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

char *sub_20A9BF10C(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_20A9BF160(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_20A9BF128(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_20A9BF260(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

size_t sub_20A9BF144(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_20A9BF37C(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

char *sub_20A9BF160(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254611D38);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

_QWORD *sub_20A9BF260(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254611D18);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4])
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    type metadata accessor for ODIAttributeKey(0);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

size_t sub_20A9BF37C(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611D20);
  v10 = *(_QWORD *)(sub_20A9DFC84() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(sub_20A9DFC84() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

void (*sub_20A9BF4F0(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  _QWORD *v6;
  char isUniquelyReferenced_nonNull_native;

  v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_20A9BF738(v6);
  v6[10] = sub_20A9BF5D0(v6 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_20A9BF580;
}

void sub_20A9BF580(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 72);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(*(_QWORD *)a1 + 32, 0);
  swift_bridgeObjectRelease();
  v2(v1, 0);
  free(v1);
}

void (*sub_20A9BF5D0(_QWORD *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1)
{
  uint64_t *v4;
  uint64_t *v5;
  _QWORD *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  void (*result)(uint64_t **);

  v5 = v4;
  v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v5;
  v10[1] = a2;
  v11 = *v5;
  v13 = sub_20A9BAC84(a2, a3);
  *((_BYTE *)v10 + 40) = v12 & 1;
  v14 = *(_QWORD *)(v11 + 16);
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    v17 = v12;
    v18 = *(_QWORD *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if ((v17 & 1) != 0)
      {
LABEL_8:
        v19 = *(_QWORD *)(*(_QWORD *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *v10 = v19;
        return sub_20A9BF6FC;
      }
LABEL_11:
      v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_20A9BD1A8();
      goto LABEL_7;
    }
    sub_20A9BB580(v16, a4 & 1);
    v20 = sub_20A9BAC84(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      v13 = v20;
      v10[4] = v20;
      if ((v17 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  result = (void (*)(uint64_t **))sub_20A9E0344();
  __break(1u);
  return result;
}

void sub_20A9BF6FC(uint64_t **a1)
{
  uint64_t *v1;

  v1 = *a1;
  sub_20A9BF764(*a1, *((_BYTE *)*a1 + 40), (uint64_t *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();
  free(v1);
}

uint64_t (*sub_20A9BF738(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_20A9BF758;
}

uint64_t sub_20A9BF758(uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

uint64_t *sub_20A9BF764(uint64_t *result, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  v8 = *result;
  if (!*result)
  {
    if ((a2 & 1) != 0)
    {
      swift_arrayDestroy();
      sub_20A9BC744(a4, *a3);
    }
    return (uint64_t *)swift_bridgeObjectRetain();
  }
  v9 = (_QWORD *)*a3;
  if ((a2 & 1) != 0)
  {
    *(_QWORD *)(v9[7] + 8 * a4) = v8;
    return (uint64_t *)swift_bridgeObjectRetain();
  }
  v9[(a4 >> 6) + 8] |= 1 << a4;
  v10 = (_QWORD *)(v9[6] + 16 * a4);
  *v10 = a5;
  v10[1] = a6;
  *(_QWORD *)(v9[7] + 8 * a4) = v8;
  v11 = v9[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (!v12)
  {
    v9[2] = v13;
    swift_bridgeObjectRetain();
    return (uint64_t *)swift_bridgeObjectRetain();
  }
  __break(1u);
  return result;
}

uint64_t sub_20A9BF828(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_20A9BF86C(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_20A9BF87C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254611C50);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_20A9BF8FC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254611C50) - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_20A9C1758;
  return sub_20A9B4438(a1, v5, v6, v7, v8);
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_20A9BF9F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_20A9C1758;
  v4[3] = a1;
  v4[4] = v1;
  return swift_task_switch();
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_20A9BFA74(uint64_t a1)
{
  uint64_t v1;

  return sub_20A9B4168(a1, v1);
}

uint64_t sub_20A9BFA7C()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20A9BFAA8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_20A9C1758;
  return sub_20A9D213C(a1, v4, v5, v6);
}

uint64_t sub_20A9BFB14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  BOOL v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t isStackAllocationSafe;
  char v29;
  unint64_t v30;
  size_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  unint64_t v42;
  uint64_t v43;

  v2 = a2;
  v43 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a2 + 16))
  {
    v4 = *(_QWORD *)(a1 + 64);
    v37 = a1 + 64;
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v35 = ~v5;
    if (-v5 < 64)
      v6 = ~(-1 << -(char)v5);
    else
      v6 = -1;
    v7 = v6 & v4;
    v36 = (unint64_t)(63 - v5) >> 6;
    v8 = a2 + 56;
    swift_bridgeObjectRetain();
    v9 = 0;
    while (1)
    {
      if (v7)
      {
        v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v11 = v10 | (v9 << 6);
      }
      else
      {
        v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v36)
          goto LABEL_47;
        v13 = *(_QWORD *)(v37 + 8 * v12);
        v14 = v9 + 1;
        if (!v13)
        {
          v14 = v9 + 2;
          if (v9 + 2 >= v36)
            goto LABEL_47;
          v13 = *(_QWORD *)(v37 + 8 * v14);
          if (!v13)
          {
            v14 = v9 + 3;
            if (v9 + 3 >= v36)
              goto LABEL_47;
            v13 = *(_QWORD *)(v37 + 8 * v14);
            if (!v13)
            {
              v14 = v9 + 4;
              if (v9 + 4 >= v36)
                goto LABEL_47;
              v13 = *(_QWORD *)(v37 + 8 * v14);
              if (!v13)
              {
                v15 = v9 + 5;
                if (v9 + 5 >= v36)
                {
LABEL_47:
                  sub_20A9C13B8();
                  return v2;
                }
                v13 = *(_QWORD *)(v37 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    v14 = v15 + 1;
                    if (__OFADD__(v15, 1))
                      break;
                    if (v14 >= v36)
                      goto LABEL_47;
                    v13 = *(_QWORD *)(v37 + 8 * v14);
                    ++v15;
                    if (v13)
                      goto LABEL_24;
                  }
LABEL_49:
                  __break(1u);
                }
                v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        v7 = (v13 - 1) & v13;
        v11 = __clz(__rbit64(v13)) + (v14 << 6);
        v9 = v14;
      }
      v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
      v18 = *v16;
      v17 = v16[1];
      sub_20A9E0368();
      swift_bridgeObjectRetain();
      sub_20A9E0104();
      v19 = sub_20A9E0380();
      v20 = -1 << *(_BYTE *)(v2 + 32);
      v21 = v19 & ~v20;
      if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) != 0)
        break;
LABEL_6:
      swift_bridgeObjectRelease();
    }
    v22 = *(_QWORD *)(v2 + 48);
    v23 = (_QWORD *)(v22 + 16 * v21);
    v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_20A9E032C() & 1) != 0)
    {
      isStackAllocationSafe = swift_bridgeObjectRelease();
      v38 = a1;
      v39 = v37;
      v40 = v35;
      v41 = v9;
      v42 = v7;
    }
    else
    {
      v25 = ~v20;
      do
      {
        v21 = (v21 + 1) & v25;
        if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          goto LABEL_6;
        v26 = (_QWORD *)(v22 + 16 * v21);
        v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_20A9E032C() & 1) == 0);
      v38 = a1;
      v39 = v37;
      v40 = v35;
      v41 = v9;
      v42 = v7;
      isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    v29 = *(_BYTE *)(v2 + 32);
    v30 = (unint64_t)((1 << v29) + 63) >> 6;
    v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
    {
      MEMORY[0x24BDAC7A8](isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      v32 = sub_20A9C0458((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v21, &v38);
      swift_release();
      sub_20A9C13B8();
    }
    else
    {
      v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      v32 = sub_20A9C0458((uint64_t)v33, v30, v2, v21, &v38);
      swift_release();
      sub_20A9C13B8();
      MEMORY[0x20BD29E9C](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x24BEE4B08];
  }
}

uint64_t sub_20A9BFF7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v32;
  uint64_t isStackAllocationSafe;
  char v34;
  unint64_t v35;
  size_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v42;
  int64_t v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  _QWORD v47[7];

  v2 = a2;
  v47[5] = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x24BEE4B08];
  }
  v3 = *(_QWORD *)(a1 + 64);
  v44 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  v42 = ~v4;
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & v3;
  v43 = (unint64_t)(63 - v4) >> 6;
  v7 = a2 + 56;
  v8 = swift_bridgeObjectRetain();
  v45 = v8;
  v46 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v46 << 6);
    }
    else
    {
      v11 = v46 + 1;
      if (__OFADD__(v46, 1))
      {
        __break(1u);
        goto LABEL_49;
      }
      if (v11 >= v43)
        goto LABEL_47;
      v12 = *(_QWORD *)(v44 + 8 * v11);
      v13 = v46 + 1;
      if (!v12)
      {
        v13 = v46 + 2;
        if (v46 + 2 >= v43)
          goto LABEL_47;
        v12 = *(_QWORD *)(v44 + 8 * v13);
        if (!v12)
        {
          v13 = v46 + 3;
          if (v46 + 3 >= v43)
            goto LABEL_47;
          v12 = *(_QWORD *)(v44 + 8 * v13);
          if (!v12)
          {
            v13 = v46 + 4;
            if (v46 + 4 >= v43)
              goto LABEL_47;
            v12 = *(_QWORD *)(v44 + 8 * v13);
            if (!v12)
            {
              v14 = v46 + 5;
              if (v46 + 5 >= v43)
              {
LABEL_47:
                sub_20A9C13B8();
                return v2;
              }
              v12 = *(_QWORD *)(v44 + 8 * v14);
              if (!v12)
              {
                while (1)
                {
                  v13 = v14 + 1;
                  if (__OFADD__(v14, 1))
                    break;
                  if (v13 >= v43)
                    goto LABEL_47;
                  v12 = *(_QWORD *)(v44 + 8 * v13);
                  ++v14;
                  if (v12)
                    goto LABEL_24;
                }
LABEL_49:
                __break(1u);
              }
              v13 = v46 + 5;
            }
          }
        }
      }
LABEL_24:
      v6 = (v12 - 1) & v12;
      v10 = __clz(__rbit64(v12)) + (v13 << 6);
      v46 = v13;
    }
    v15 = *(void **)(*(_QWORD *)(v8 + 48) + 8 * v10);
    sub_20A9E00E0();
    sub_20A9E0368();
    v16 = v15;
    sub_20A9E0104();
    v17 = sub_20A9E0380();
    swift_bridgeObjectRelease();
    v18 = -1 << *(_BYTE *)(v2 + 32);
    v19 = v17 & ~v18;
    if (((*(_QWORD *)(v7 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) != 0)
      break;
LABEL_6:

    v8 = v45;
  }
  v20 = sub_20A9E00E0();
  v22 = v21;
  if (v20 != sub_20A9E00E0() || v22 != v23)
  {
    v25 = sub_20A9E032C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v25 & 1) != 0)
      goto LABEL_41;
    v26 = ~v18;
    while (1)
    {
      v19 = (v19 + 1) & v26;
      if (((*(_QWORD *)(v7 + ((v19 >> 3) & 0xFFFFFFFFFFFFF8)) >> v19) & 1) == 0)
        goto LABEL_6;
      v27 = sub_20A9E00E0();
      v29 = v28;
      if (v27 == sub_20A9E00E0() && v29 == v30)
        break;
      v32 = sub_20A9E032C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v32 & 1) != 0)
        goto LABEL_41;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_41:

  v47[0] = v45;
  v47[1] = v44;
  v47[2] = v42;
  v47[3] = v46;
  v47[4] = v6;
  v34 = *(_BYTE *)(v2 + 32);
  v35 = (unint64_t)((1 << v34) + 63) >> 6;
  v36 = 8 * v35;
  if ((v34 & 0x3Fu) < 0xE
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    memcpy((char *)&v42 - ((v36 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v36);
    sub_20A9C074C((unint64_t *)((char *)&v42 - ((v36 + 15) & 0x3FFFFFFFFFFFFFF0)), v35, v2, v19, v47);
    v38 = v37;
    swift_release();
    sub_20A9C13B8();
  }
  else
  {
    v39 = (void *)swift_slowAlloc();
    memcpy(v39, (const void *)(v2 + 56), v36);
    sub_20A9C074C((unint64_t *)v39, v35, v2, v19, v47);
    v38 = v40;
    swift_release();
    sub_20A9C13B8();
    MEMORY[0x20BD29E9C](v39, -1, -1);
  }
  return v38;
}

uint64_t sub_20A9C0458(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t i;
  unint64_t v33;
  _QWORD *v34;
  BOOL v35;
  int64_t v36;
  uint64_t v38;
  unint64_t *v39;
  uint64_t v40;

  v7 = *(_QWORD *)(a3 + 16);
  v39 = (unint64_t *)result;
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v8 = v7 - 1;
  v40 = a3 + 56;
  while (2)
  {
    v38 = v8;
    do
    {
      while (1)
      {
        v9 = a5[3];
        v10 = a5[4];
        if (v10)
        {
          v11 = (v10 - 1) & v10;
          v12 = __clz(__rbit64(v10)) | (v9 << 6);
          goto LABEL_16;
        }
        v13 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_47;
        }
        v14 = (unint64_t)(a5[2] + 64) >> 6;
        v15 = a5[3];
        if (v13 >= v14)
          goto LABEL_45;
        v16 = a5[1];
        v17 = *(_QWORD *)(v16 + 8 * v13);
        if (!v17)
        {
          v18 = v9 + 2;
          v15 = v9 + 1;
          if (v9 + 2 >= v14)
            goto LABEL_45;
          v17 = *(_QWORD *)(v16 + 8 * v18);
          if (!v17)
          {
            v15 = v9 + 2;
            if (v9 + 3 >= v14)
              goto LABEL_45;
            v17 = *(_QWORD *)(v16 + 8 * (v9 + 3));
            if (v17)
            {
              v13 = v9 + 3;
              goto LABEL_15;
            }
            v18 = v9 + 4;
            v15 = v9 + 3;
            if (v9 + 4 >= v14)
              goto LABEL_45;
            v17 = *(_QWORD *)(v16 + 8 * v18);
            if (!v17)
            {
              v13 = v9 + 5;
              v15 = v9 + 4;
              if (v9 + 5 >= v14)
                goto LABEL_45;
              v17 = *(_QWORD *)(v16 + 8 * v13);
              if (!v17)
              {
                v15 = v14 - 1;
                v36 = v9 + 6;
                while (v14 != v36)
                {
                  v17 = *(_QWORD *)(v16 + 8 * v36++);
                  if (v17)
                  {
                    v13 = v36 - 1;
                    goto LABEL_15;
                  }
                }
LABEL_45:
                a5[3] = v15;
                a5[4] = 0;
                swift_retain();
                return sub_20A9C0AD0(v39, a2, v38, a3);
              }
              goto LABEL_15;
            }
          }
          v13 = v18;
        }
LABEL_15:
        v11 = (v17 - 1) & v17;
        v12 = __clz(__rbit64(v17)) + (v13 << 6);
        v9 = v13;
LABEL_16:
        v19 = (uint64_t *)(*(_QWORD *)(*a5 + 48) + 16 * v12);
        v21 = *v19;
        v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_20A9E0368();
        swift_bridgeObjectRetain();
        sub_20A9E0104();
        v22 = sub_20A9E0380();
        v23 = -1 << *(_BYTE *)(a3 + 32);
        v24 = v22 & ~v23;
        v25 = v24 >> 6;
        v26 = 1 << v24;
        if (((1 << v24) & *(_QWORD *)(v40 + 8 * (v24 >> 6))) == 0)
          goto LABEL_3;
        v27 = *(_QWORD *)(a3 + 48);
        v28 = (_QWORD *)(v27 + 16 * v24);
        v29 = *v28 == v21 && v28[1] == v20;
        if (v29 || (sub_20A9E032C() & 1) != 0)
          break;
        v31 = ~v23;
        for (i = v24 + 1; ; i = v33 + 1)
        {
          v33 = i & v31;
          if (((*(_QWORD *)(v40 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0)
            break;
          v34 = (_QWORD *)(v27 + 16 * v33);
          v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_20A9E032C() & 1) != 0)
          {
            result = swift_bridgeObjectRelease();
            v25 = v33 >> 6;
            v26 = 1 << v33;
            goto LABEL_23;
          }
        }
LABEL_3:
        result = swift_bridgeObjectRelease();
      }
      result = swift_bridgeObjectRelease();
LABEL_23:
      v30 = v39[v25];
      v39[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    v8 = v38 - 1;
    if (__OFSUB__(v38, 1))
    {
LABEL_47:
      __break(1u);
      return result;
    }
    if (v38 != 1)
      continue;
    return MEMORY[0x24BEE4B08];
  }
}

void sub_20A9C074C(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v29;
  uint64_t v30;
  unint64_t i;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v38;
  unint64_t v39;
  uint64_t v41;
  id v43;
  uint64_t v44;

  v6 = *(_QWORD *)(a3 + 16);
  *(unint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v7 = v6 - 1;
  v44 = a3 + 56;
  while (2)
  {
    v41 = v7;
    do
    {
      while (1)
      {
        v8 = a5[3];
        v9 = a5[4];
        if (v9)
        {
          v10 = (v9 - 1) & v9;
          v11 = __clz(__rbit64(v9)) | (v8 << 6);
        }
        else
        {
          v12 = v8 + 1;
          if (__OFADD__(v8, 1))
          {
            __break(1u);
            goto LABEL_47;
          }
          v13 = (unint64_t)(a5[2] + 64) >> 6;
          v14 = a5[3];
          if (v12 >= v13)
            goto LABEL_45;
          v15 = a5[1];
          v16 = *(_QWORD *)(v15 + 8 * v12);
          if (!v16)
          {
            v14 = v8 + 1;
            if (v8 + 2 >= v13)
              goto LABEL_45;
            v16 = *(_QWORD *)(v15 + 8 * (v8 + 2));
            if (v16)
            {
              v12 = v8 + 2;
            }
            else
            {
              v14 = v8 + 2;
              if (v8 + 3 >= v13)
                goto LABEL_45;
              v16 = *(_QWORD *)(v15 + 8 * (v8 + 3));
              if (v16)
              {
                v12 = v8 + 3;
              }
              else
              {
                v12 = v8 + 4;
                v14 = v8 + 3;
                if (v8 + 4 >= v13)
                  goto LABEL_45;
                v16 = *(_QWORD *)(v15 + 8 * v12);
                if (!v16)
                {
                  v14 = v13 - 1;
                  v17 = v8 + 5;
                  while (v13 != v17)
                  {
                    v16 = *(_QWORD *)(v15 + 8 * v17++);
                    if (v16)
                    {
                      v12 = v17 - 1;
                      goto LABEL_21;
                    }
                  }
LABEL_45:
                  a5[3] = v14;
                  a5[4] = 0;
                  swift_retain();
                  sub_20A9C0D64(a1, a2, v41, a3);
                  return;
                }
              }
            }
          }
LABEL_21:
          v10 = (v16 - 1) & v16;
          v11 = __clz(__rbit64(v16)) + (v12 << 6);
          v8 = v12;
        }
        v18 = *(void **)(*(_QWORD *)(*a5 + 48) + 8 * v11);
        a5[3] = v8;
        a5[4] = v10;
        sub_20A9E00E0();
        sub_20A9E0368();
        v43 = v18;
        sub_20A9E0104();
        v19 = sub_20A9E0380();
        swift_bridgeObjectRelease();
        v20 = -1 << *(_BYTE *)(a3 + 32);
        v21 = v19 & ~v20;
        v22 = v21 >> 6;
        v23 = 1 << v21;
        if (((1 << v21) & *(_QWORD *)(v44 + 8 * (v21 >> 6))) == 0)
          goto LABEL_3;
        v24 = sub_20A9E00E0();
        v26 = v25;
        if (v24 == sub_20A9E00E0() && v26 == v27)
        {
          swift_bridgeObjectRelease_n();
          break;
        }
        v29 = sub_20A9E032C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v29 & 1) != 0)
          break;
        v30 = ~v20;
        for (i = v21 + 1; ; i = v32 + 1)
        {
          v32 = i & v30;
          if (((*(_QWORD *)(v44 + (((i & v30) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v30)) & 1) == 0)
            break;
          v33 = sub_20A9E00E0();
          v35 = v34;
          if (v33 == sub_20A9E00E0() && v35 == v36)
          {
            swift_bridgeObjectRelease_n();
LABEL_41:

            v22 = v32 >> 6;
            v23 = 1 << v32;
            goto LABEL_38;
          }
          v38 = sub_20A9E032C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v38 & 1) != 0)
            goto LABEL_41;
        }
LABEL_3:

      }
LABEL_38:
      v39 = a1[v22];
      a1[v22] = v39 & ~v23;
    }
    while ((v23 & v39) == 0);
    v7 = v41 - 1;
    if (__OFSUB__(v41, 1))
    {
LABEL_47:
      __break(1u);
      return;
    }
    if (v41 != 1)
      continue;
    break;
  }
}

uint64_t sub_20A9C0AD0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;

  v4 = a4;
  if (!a3)
  {
    v8 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611D30);
  result = sub_20A9E0260();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_36;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_36;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_36;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    sub_20A9E0368();
    swift_bridgeObjectRetain();
    sub_20A9E0104();
    result = sub_20A9E0380();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_36;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_36;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_20A9C0D64(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  unint64_t *v30;
  uint64_t v31;

  v4 = a4;
  if (!a3)
  {
    v9 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v9;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611D10);
  result = sub_20A9E0260();
  v9 = result;
  v30 = a1;
  v31 = a2;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_39;
    if (v15 >= v31)
      goto LABEL_36;
    v16 = v30[v15];
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= v31)
        goto LABEL_36;
      v16 = v30[v11];
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= v31)
          goto LABEL_36;
        v16 = v30[v11];
        if (!v16)
          break;
      }
    }
LABEL_23:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    v18 = *(void **)(*(_QWORD *)(v4 + 48) + 8 * v14);
    sub_20A9E00E0();
    sub_20A9E0368();
    v19 = v18;
    sub_20A9E0104();
    v20 = sub_20A9E0380();
    result = swift_bridgeObjectRelease();
    v21 = -1 << *(_BYTE *)(v9 + 32);
    v22 = v20 & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v12 + 8 * (v22 >> 6))) != 0)
    {
      v24 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v27 = v23 == v26;
        if (v23 == v26)
          v23 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v23);
      }
      while (v28 == -1);
      v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(_QWORD *)(v12 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v24) = v19;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v17 = v15 + 3;
  if (v17 >= v31)
    goto LABEL_36;
  v16 = v30[v17];
  if (v16)
  {
    v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= v31)
      goto LABEL_36;
    v16 = v30[v11];
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_20A9C0FFC(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

int64_t sub_20A9C109C(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

BOOL sub_20A9C1180(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  BOOL v15;
  _BOOL8 result;
  uint64_t v17;
  unint64_t i;
  uint64_t v19;
  _QWORD *v20;
  BOOL v21;
  _QWORD *v22;

  v2 = a1[2];
  if (!v2)
    return 1;
  if (*(_QWORD *)(a2 + 16))
  {
    v4 = a1 + 4;
    v5 = a1 + 5;
    v6 = a2 + 56;
    v7 = 1;
    v22 = a1 + 4;
    while (1)
    {
      v8 = *v5;
      v9 = *v4;
      swift_bridgeObjectRetain();
      sub_20A9E0368();
      sub_20A9E0104();
      v10 = sub_20A9E0380();
      v11 = -1 << *(_BYTE *)(a2 + 32);
      v12 = v10 & ~v11;
      if (((*(_QWORD *)(v6 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
        break;
      v13 = *(_QWORD *)(a2 + 48);
      v14 = (_QWORD *)(v13 + 16 * v12);
      v15 = *v14 == v9 && v14[1] == v8;
      if (!v15 && (sub_20A9E032C() & 1) == 0)
      {
        v17 = ~v11;
        for (i = v12 + 1; ; i = v19 + 1)
        {
          v19 = i & v17;
          if (((*(_QWORD *)(v6 + (((i & v17) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v17)) & 1) == 0)
            break;
          v20 = (_QWORD *)(v13 + 16 * v19);
          v21 = *v20 == v9 && v20[1] == v8;
          if (v21 || (sub_20A9E032C() & 1) != 0)
            goto LABEL_10;
        }
        break;
      }
LABEL_10:
      swift_bridgeObjectRelease();
      result = v7 == v2;
      if (v7 == v2 || !*(_QWORD *)(a2 + 16))
        return result;
      v4 = &v22[2 * v7++];
      v5 = v4 + 1;
    }
    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_20A9C1300(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  void **v4;
  void *v5;
  id v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  type metadata accessor for ODIAttributeKey(0);
  sub_20A9BA454((unint64_t *)&qword_254611C08, (uint64_t (*)(uint64_t))type metadata accessor for ODIAttributeKey, (uint64_t)&unk_20A9E116C);
  result = sub_20A9E020C();
  v7 = result;
  if (v2)
  {
    v4 = (void **)(a1 + 32);
    do
    {
      v5 = *v4++;
      sub_20A9BDC54(&v6, v5);

      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_20A9C13A0(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_20A9C13B8()
{
  return swift_release();
}

uint64_t sub_20A9C13C0(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_20A9C13E4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_20A9C13F0()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return swift_deallocObject();
}

uint64_t sub_20A9C142C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[4];
  v5 = v1[5];
  v6 = v1[6];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_20A9B824C;
  v7[5] = v6;
  v7[6] = v1 + 7;
  v7[3] = v4;
  v7[4] = v5;
  v7[2] = a1;
  return swift_task_switch();
}

uint64_t sub_20A9C14B0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = v2[2];
  v7 = v2[3];
  v9 = v2[4];
  v8 = v2[5];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v10;
  *v10 = v3;
  v10[1] = sub_20A9C1758;
  return sub_20A9B5494(a1, a2, v6, v7, v9, v8);
}

uint64_t sub_20A9C1530(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20A9C1758;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254611D68 + dword_254611D68))(a1, v4);
}

uint64_t sub_20A9C159C()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20A9C15E0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = v0[5];
  v6 = (uint64_t)(v0 + 6);
  v7 = v0[11];
  v8 = v0[12];
  v9 = v0[13];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v10;
  *v10 = v1;
  v10[1] = sub_20A9C1758;
  return sub_20A9B58B4(v2, v3, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_20A9C1670()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;

  v2 = *(int **)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_20A9B824C;
  return ((uint64_t (*)(int *))((char *)&dword_254611D78 + dword_254611D78))(v2);
}

uint64_t sub_20A9C16D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_20A9C1710(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_20A9C1778(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;

  v29 = a1;
  v1 = sub_20A9E0050();
  v32 = *(_QWORD *)(v1 - 8);
  v33 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_20A9DFA98();
  v30 = *(_QWORD *)(v4 - 8);
  v31 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20A9DFB40();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A9DF9B4();
  swift_allocObject();
  sub_20A9DF9A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611DE8);
  v11 = sub_20A9C2BBC(0xD00000000000C460, 0x800000020A9E2D90);
  v13 = v12;
  sub_20A9C3C3C();
  sub_20A9DF99C();
  sub_20A9C3D54(v11, v13);
  swift_release();
  v14 = v34;
  v15 = sub_20A9C27C8(v29);
  if (*(_QWORD *)(v14 + 16) && (v17 = sub_20A9BAC84(v15, v16), (v18 & 1) != 0))
  {
    v19 = *(_QWORD *)(*(_QWORD *)(v14 + 56) + 8 * v17);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v34 = 0;
    v35 = 0xE000000000000000;
    sub_20A9E026C();
    v20 = sub_20A9E00E0();
    v22 = v21;
    swift_bridgeObjectRelease();
    v34 = v20;
    v35 = v22;
    sub_20A9E0110();
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BE1F288], v7);
    v23 = (void *)sub_20A9E0038();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    swift_willThrow();
    v25 = v32;
    v24 = v33;
    v27 = v30;
    v26 = v31;
    sub_20A9DFA8C();
    v34 = 0;
    v35 = 0xE000000000000000;
    sub_20A9E026C();
    swift_bridgeObjectRelease();
    v34 = 0xD000000000000023;
    v35 = 0x800000020A9EF200;
    swift_getErrorValue();
    sub_20A9E035C();
    sub_20A9E0110();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, _QWORD, uint64_t))(v25 + 104))(v3, *MEMORY[0x24BE1F7F0], v24);
    sub_20A9DFA80();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v3, v24);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v26);
    return MEMORY[0x24BEE4AF8];
  }
  return v19;
}

uint64_t sub_20A9C1B54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = _sSo20ODIServiceProviderIda7CoreODIE8allCasesSayABGvgZ_0();
  *a1 = result;
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> static ODIServiceProviderId.workflowIdFromServiceProviderId(_:)()
{
  swift_bridgeObjectRetain();
  sub_20A9E0110();
}

uint64_t sub_20A9C1BD0()
{
  uint64_t result;

  result = sub_20A9E00BC();
  qword_2546133D8 = result;
  return result;
}

uint64_t sub_20A9C1C04(uint64_t a1)
{
  return sub_20A9C1CE4(a1, &qword_254611AD8, (uint64_t)&qword_2546133F8);
}

uint64_t sub_20A9C1C20(uint64_t a1)
{
  return sub_20A9C1CE4(a1, &qword_254611AE0, (uint64_t)&qword_254613400);
}

uint64_t sub_20A9C1C3C(uint64_t a1)
{
  return sub_20A9C1CE4(a1, &qword_254611AD0, (uint64_t)&qword_2546133F0);
}

uint64_t sub_20A9C1C58(uint64_t a1)
{
  return sub_20A9C1CE4(a1, &qword_254611AE8, (uint64_t)&qword_254613408);
}

uint64_t sub_20A9C1C74(uint64_t a1)
{
  return sub_20A9C1CE4(a1, &qword_254611AF8, (uint64_t)&qword_254613418);
}

uint64_t sub_20A9C1C90(uint64_t a1)
{
  return sub_20A9C1CE4(a1, &qword_254611AF0, (uint64_t)&qword_254613410);
}

uint64_t sub_20A9C1CAC(uint64_t a1)
{
  return sub_20A9C1CE4(a1, &qword_254611B08, (uint64_t)&qword_254613428);
}

uint64_t sub_20A9C1CC8(uint64_t a1)
{
  return sub_20A9C1CE4(a1, &qword_254611B00, (uint64_t)&qword_254613420);
}

uint64_t sub_20A9C1CE4(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v25;

  if (*a2 != -1)
    swift_once();
  v4 = *(_QWORD *)(*(_QWORD *)a3 + 16);
  if (!v4)
    return 0;
  v5 = sub_20A9E00E0();
  v7 = v6;
  if (v5 == sub_20A9E00E0() && v7 == v8)
    goto LABEL_16;
  v10 = sub_20A9E032C();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v10 & 1) != 0)
  {
LABEL_9:
    v11 = 1;
LABEL_17:
    swift_bridgeObjectRelease_n();
    return v11;
  }
  if (v4 == 1)
  {
LABEL_12:
    v11 = 0;
    goto LABEL_17;
  }
  v12 = sub_20A9E00E0();
  v14 = v13;
  if (v12 == sub_20A9E00E0() && v14 == v15)
  {
LABEL_15:
    swift_bridgeObjectRelease_n();
LABEL_16:
    v11 = 1;
    goto LABEL_17;
  }
  v17 = sub_20A9E032C();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v17 & 1) != 0)
    goto LABEL_9;
  if (v4 == 2)
    goto LABEL_12;
  v18 = 6;
  while (1)
  {
    v19 = v18 - 3;
    if (__OFADD__(v18 - 4, 1))
      break;
    v20 = sub_20A9E00E0();
    v22 = v21;
    if (v20 == sub_20A9E00E0() && v22 == v23)
      goto LABEL_15;
    v25 = sub_20A9E032C();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v25 & 1) != 0)
      goto LABEL_9;
    ++v18;
    if (v19 == v4)
      goto LABEL_12;
  }
  __break(1u);
  return result;
}

uint64_t sub_20A9C1ED0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t inited;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  uint64_t v76;

  v2 = sub_20A9E0050();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_20A9DFA98();
  MEMORY[0x24BDAC7A8](v3);
  if ((sub_20A9C1CE4(a1, &qword_254611AF0, (uint64_t)&qword_254613410) & 1) != 0)
  {
    v4 = 0xD000000000000775;
    v5 = "[\n"
         "  {\n"
         "    \"identifier\": \"icloud_dsid\",\n"
         "    \"fieldName\": \"aa_personID\",\n"
         "    \"source\": \"Accounts\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"itunes_dsid\",\n"
         "    \"fieldName\": \"normalizedDSID\",\n"
         "    \"source\": \"Accounts\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"software_version\",\n"
         "    \"fieldName\": \"BuildVersion\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": null\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"signed_seid\",\n"
         "    \"fieldName\": \"seid\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": 1500,\n"
         "    \"privileged\": null\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_seid\",\n"
         "    \"fieldName\": \"seid\",\n"
         "    \"source\": \"NearField\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_serial_number\",\n"
         "    \"fieldName\": \"SerialNumber\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_udid\",\n"
         "    \"fieldName\": \"UniqueDeviceID\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"ecid_baa_certified\",\n"
         "    \"fieldName\": \"ECID\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": 1500,\n"
         "    \"privileged\": null\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"os_version_baa_cert\",\n"
         "    \"fieldName\": \"osVersion\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": 1500,\n"
         "    \"privileged\": null\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_ecid\",\n"
         "    \"fieldName\": \"UniqueChipID\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"time_zone\",\n"
         "    \"fieldName\": \"identifier\",\n"
         "    \"source\": \"TimeZone\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": null\n"
         "  }\n"
         "]";
LABEL_9:
    v11 = (unint64_t)(v5 - 32) | 0x8000000000000000;
    goto LABEL_10;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C78);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20A9E11C0;
  *(_QWORD *)(inited + 32) = CFSTR("com.apple.bko.application_create");
  *(_QWORD *)(inited + 40) = CFSTR("com.apple.bko.application_submit");
  *(_QWORD *)(inited + 48) = CFSTR("com.apple.bko.id_update");
  v7 = CFSTR("com.apple.bko.application_create");
  v8 = CFSTR("com.apple.bko.application_submit");
  v9 = CFSTR("com.apple.bko.id_update");
  v10 = sub_20A9C421C(a1, inited);
  swift_setDeallocating();
  type metadata accessor for ODIServiceProviderId(0);
  swift_arrayDestroy();
  if ((v10 & 1) != 0)
  {
    v4 = 0xD000000000000915;
    v5 = "[\n"
         "  {\n"
         "    \"identifier\": \"software_version\",\n"
         "    \"fieldName\": \"BuildVersion\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 3\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"signed_seid\",\n"
         "    \"fieldName\": \"seid\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": 1500\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_seid\",\n"
         "    \"fieldName\": \"seid\",\n"
         "    \"source\": \"NearField\",\n"
         "    \"priority\": 2,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_serial_number\",\n"
         "    \"fieldName\": \"SerialNumber\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_udid\",\n"
         "    \"fieldName\": \"UniqueDeviceID\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"ecid_baa_certified\",\n"
         "    \"fieldName\": \"UniqueChipID\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": 1500\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"os_version_baa_cert\",\n"
         "    \"fieldName\": \"osVersion\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 3,\n"
         "    \"timeoutMilli\": 1500\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_ecid\",\n"
         "    \"fieldName\": \"UniqueChipID\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 2,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"phone_number_device\",\n"
         "    \"fieldName\": \"number\",\n"
         "    \"source\": \"CoreTelephony\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"pac_data_list\",\n"
         "    \"fieldName\": \"serverVerifiableEncoding\",\n"
         "    \"source\": \"IDS\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"iccid\",\n"
         "    \"fieldName\": \"SIMIdentity\",\n"
         "    \"source\": \"CoreTelephony\",\n"
         "    \"priority\": 2,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"imsi\",\n"
         "    \"fieldName\": \"MobileSubscriberIdentity\",\n"
         "    \"source\": \"CoreTelephony\",\n"
         "    \"priority\": 2,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"gps_location\",\n"
         "    \"fieldName\": \"location\",\n"
         "    \"source\": \"CoreLocation\",\n"
         "    \"priority\": 2\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"gps_location_enabled\",\n"
         "    \"fieldName\": \"locationServicesEnabled\",\n"
         "    \"source\": \"CoreLocation\",\n"
         "    \"priority\": 2\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"screen_share_status\",\n"
         "    \"fieldName\": \"isSharingScreen\",\n"
         "    \"source\": \"TelephonyUtilities\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"time_zone\",\n"
         "    \"fieldName\": \"identifier\",\n"
         "    \"source\": \"TimeZone\",\n"
         "    \"priority\": 2\n"
         "  }\n"
         "]";
    goto LABEL_9;
  }
  if ((sub_20A9C1CE4(a1, &qword_254611AD0, (uint64_t)&qword_2546133F0) & 1) != 0)
  {
    v4 = 0xD00000000000080ELL;
    v5 = "[\n"
         "  {\n"
         "    \"identifier\": \"software_version\",\n"
         "    \"fieldName\": \"BuildVersion\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 3\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"signed_seid\",\n"
         "    \"fieldName\": \"seid\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": 1500\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_seid\",\n"
         "    \"fieldName\": \"seid\",\n"
         "    \"source\": \"NearField\",\n"
         "    \"priority\": 2,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_serial_number\",\n"
         "    \"fieldName\": \"SerialNumber\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_udid\",\n"
         "    \"fieldName\": \"UniqueDeviceID\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"ecid_baa_certified\",\n"
         "    \"fieldName\": \"UniqueChipID\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": 1500\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"os_version_baa_cert\",\n"
         "    \"fieldName\": \"osVersion\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 3,\n"
         "    \"timeoutMilli\": 1500\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_ecid\",\n"
         "    \"fieldName\": \"UniqueChipID\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 2,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"phone_number_device\",\n"
         "    \"fieldName\": \"number\",\n"
         "    \"source\": \"CoreTelephony\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"pac_data_list\",\n"
         "    \"fieldName\": \"serverVerifiableEncoding\",\n"
         "    \"source\": \"IDS\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"iccid\",\n"
         "    \"fieldName\": \"SIMIdentity\",\n"
         "    \"source\": \"CoreTelephony\",\n"
         "    \"priority\": 2,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"imsi\",\n"
         "    \"fieldName\": \"MobileSubscriberIdentity\",\n"
         "    \"source\": \"CoreTelephony\",\n"
         "    \"priority\": 2,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"screen_share_status\",\n"
         "    \"fieldName\": \"isSharingScreen\",\n"
         "    \"source\": \"TelephonyUtilities\",\n"
         "    \"priority\": 1,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"time_zone\",\n"
         "    \"fieldName\": \"identifier\",\n"
         "    \"source\": \"TimeZone\",\n"
         "    \"priority\": 2\n"
         "  }\n"
         "]";
    goto LABEL_9;
  }
  if ((sub_20A9C1CE4(a1, &qword_254611AF8, (uint64_t)&qword_254613418) & 1) != 0)
  {
    v4 = 0xD000000000000628;
    v5 = "[\n"
         "  {\n"
         "    \"identifier\": \"signed_seid\",\n"
         "    \"fieldName\": \"seid\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": 1500,\n"
         "    \"privileged\": null\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_seid\",\n"
         "    \"fieldName\": \"seid\",\n"
         "    \"source\": \"NearField\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_serial_number\",\n"
         "    \"fieldName\": \"SerialNumber\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"unsigned_udid\",\n"
         "    \"fieldName\": \"UniqueDeviceID\",\n"
         "    \"source\": \"MobileGestalt\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"ecid_baa_certified\",\n"
         "    \"fieldName\": \"ECID\",\n"
         "    \"source\": \"baaCertificate\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": 1500,\n"
         "    \"privileged\": null\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"phone_number_device\",\n"
         "    \"fieldName\": \"number\",\n"
         "    \"source\": \"CoreTelephony\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"iccid\",\n"
         "    \"fieldName\": \"SIMIdentity\",\n"
         "    \"source\": \"CoreTelephony\",\n"
         "    \"priority\": 1,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": true\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"gps_location\",\n"
         "    \"fieldName\": \"location\",\n"
         "    \"source\": \"CoreLocation\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": null\n"
         "  },\n"
         "  {\n"
         "    \"identifier\": \"gps_location_enabled\",\n"
         "    \"fieldName\": \"locationServicesEnabled\",\n"
         "    \"source\": \"CoreLocation\",\n"
         "    \"priority\": 2,\n"
         "    \"timeoutMilli\": null,\n"
         "    \"privileged\": null\n"
         "  }\n"
         "]";
    goto LABEL_9;
  }
  v4 = 0xD000000000000585;
  v16 = sub_20A9E00E0();
  v18 = v17;
  v11 = 0x800000020A9EFD50;
  if (v16 == sub_20A9E00E0() && v18 == v19)
    goto LABEL_14;
  v20 = sub_20A9E032C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v20 & 1) != 0)
    goto LABEL_10;
  v21 = sub_20A9E00E0();
  v23 = v22;
  v11 = 0x800000020A9EFD50;
  if (v21 == sub_20A9E00E0() && v23 == v24)
    goto LABEL_14;
  v25 = sub_20A9E032C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v25 & 1) != 0)
    goto LABEL_10;
  v26 = sub_20A9E00E0();
  v28 = v27;
  v11 = 0x800000020A9EFD50;
  if (v26 == sub_20A9E00E0() && v28 == v29)
    goto LABEL_14;
  v30 = sub_20A9E032C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v30 & 1) != 0)
    goto LABEL_10;
  v31 = sub_20A9E00E0();
  v33 = v32;
  v11 = 0x800000020A9EFD50;
  if (v31 == sub_20A9E00E0() && v33 == v34)
    goto LABEL_14;
  v35 = sub_20A9E032C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v35 & 1) != 0)
    goto LABEL_10;
  v36 = sub_20A9E00E0();
  v38 = v37;
  v11 = 0x800000020A9EFD50;
  if (v36 == sub_20A9E00E0() && v38 == v39)
    goto LABEL_14;
  v40 = sub_20A9E032C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v40 & 1) != 0)
    goto LABEL_10;
  v41 = sub_20A9E00E0();
  v43 = v42;
  v11 = 0x800000020A9EFD50;
  if (v41 == sub_20A9E00E0() && v43 == v44)
    goto LABEL_14;
  v45 = sub_20A9E032C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v45 & 1) != 0)
    goto LABEL_10;
  v46 = sub_20A9E00E0();
  v48 = v47;
  v11 = 0x800000020A9EFD50;
  if (v46 == sub_20A9E00E0() && v48 == v49)
    goto LABEL_14;
  v50 = sub_20A9E032C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v50 & 1) != 0)
    goto LABEL_10;
  v51 = sub_20A9E00E0();
  v53 = v52;
  v11 = 0x800000020A9EFD50;
  if (v51 == sub_20A9E00E0() && v53 == v54)
    goto LABEL_14;
  v55 = sub_20A9E032C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v55 & 1) != 0)
    goto LABEL_10;
  v56 = sub_20A9E00E0();
  v58 = v57;
  v11 = 0x800000020A9EFD50;
  if (v56 == sub_20A9E00E0() && v58 == v59)
    goto LABEL_14;
  v60 = sub_20A9E032C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v60 & 1) != 0)
    goto LABEL_10;
  v61 = sub_20A9E00E0();
  v63 = v62;
  v11 = 0x800000020A9EFD50;
  if (v61 == sub_20A9E00E0() && v63 == v64)
    goto LABEL_14;
  v65 = sub_20A9E032C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v65 & 1) != 0)
    goto LABEL_10;
  v66 = sub_20A9E00E0();
  v68 = v67;
  v4 = 0xD00000000000072BLL;
  v11 = 0x800000020A9EF620;
  if (v66 == sub_20A9E00E0() && v68 == v69)
    goto LABEL_14;
  v70 = sub_20A9E032C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v70 & 1) != 0)
    goto LABEL_10;
  v71 = sub_20A9E00E0();
  v73 = v72;
  v4 = 0xD0000000000002DBLL;
  v11 = 0x800000020A9EF340;
  if (v71 == sub_20A9E00E0() && v73 == v74)
  {
LABEL_14:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v75 = sub_20A9E032C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v75 & 1) == 0)
      return MEMORY[0x24BEE4AF8];
  }
LABEL_10:
  sub_20A9DF9B4();
  swift_allocObject();
  sub_20A9DF9A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611E00);
  v12 = sub_20A9C2BBC(v4, v11);
  v14 = v13;
  sub_20A9C3CA8();
  sub_20A9DF99C();
  sub_20A9C3D54(v12, v14);
  swift_release();
  return v76;
}

uint64_t sub_20A9C27C8(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = 0xD000000000000010;
  if ((sub_20A9C1CE4(a1, &qword_254611AD0, (uint64_t)&qword_2546133F0) & 1) != 0)
  {
    v3 = sub_20A9E00E0();
    v5 = v4;
    if (v3 == sub_20A9E00E0() && v5 == v6)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v8 = sub_20A9E032C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v8 & 1) == 0)
        return 0xD000000000000011;
    }
  }
  if ((sub_20A9C1CE4(a1, &qword_254611AE8, (uint64_t)&qword_254613408) & 1) == 0)
  {
    sub_20A9C1CE4(a1, &qword_254611B00, (uint64_t)&qword_254613420);
    return sub_20A9E00E0();
  }
  return v2;
}

uint64_t sub_20A9C2918@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  if ((sub_20A9C1CE4(a1, &qword_254611AD8, (uint64_t)&qword_2546133F8) & 1) != 0)
  {
    v4 = (unsigned int *)MEMORY[0x24BE1F3B8];
    goto LABEL_20;
  }
  if ((sub_20A9C1CE4(a1, &qword_254611AE0, (uint64_t)&qword_254613400) & 1) != 0)
  {
    v4 = (unsigned int *)MEMORY[0x24BE1F3D0];
    goto LABEL_20;
  }
  if ((sub_20A9C1CE4(a1, &qword_254611AE8, (uint64_t)&qword_254613408) & 1) != 0)
  {
    v4 = (unsigned int *)MEMORY[0x24BE1F3D8];
    goto LABEL_20;
  }
  if ((sub_20A9C1CE4(a1, &qword_254611AF0, (uint64_t)&qword_254613410) & 1) != 0)
  {
    v4 = (unsigned int *)MEMORY[0x24BE1F3E8];
    goto LABEL_20;
  }
  if ((sub_20A9C1CE4(a1, &qword_254611AF8, (uint64_t)&qword_254613418) & 1) != 0)
  {
    v4 = (unsigned int *)MEMORY[0x24BE1F3C0];
    goto LABEL_20;
  }
  if ((sub_20A9C1CE4(a1, &qword_254611B00, (uint64_t)&qword_254613420) & 1) != 0)
  {
    v4 = (unsigned int *)MEMORY[0x24BE1F3C8];
    goto LABEL_20;
  }
  if ((sub_20A9C1CE4(a1, &qword_254611B08, (uint64_t)&qword_254613428) & 1) != 0)
  {
    v4 = (unsigned int *)MEMORY[0x24BE1F3A0];
    goto LABEL_20;
  }
  v5 = sub_20A9E00E0();
  v7 = v6;
  if (v5 == sub_20A9E00E0() && v7 == v8)
  {
    swift_bridgeObjectRelease_n();
LABEL_19:
    v4 = (unsigned int *)MEMORY[0x24BE1F3B0];
    goto LABEL_20;
  }
  v9 = sub_20A9E032C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
    goto LABEL_19;
  v13 = sub_20A9E00E0();
  v15 = v14;
  if (v13 == sub_20A9E00E0() && v15 == v16)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v17 = sub_20A9E032C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
    {
      v4 = (unsigned int *)MEMORY[0x24BE1F3E0];
      goto LABEL_20;
    }
  }
  v4 = (unsigned int *)MEMORY[0x24BE1F3A8];
LABEL_20:
  v10 = *v4;
  v11 = sub_20A9DFC3C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(a2, v10, v11);
}

uint64_t sub_20A9C2BBC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v14[2];
  uint64_t v15;
  __int128 v16;
  _QWORD v17[7];

  v17[5] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v16 = a1;
  *((_QWORD *)&v16 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611E10);
  if (!swift_dynamicCast())
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_20A9C3D98((uint64_t)v14);
    if ((a2 & 0x1000000000000000) != 0)
      goto LABEL_20;
    if ((a2 & 0x2000000000000000) != 0)
    {
      v17[0] = a1;
      v17[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      v4 = (char *)v17 + (HIBYTE(a2) & 0xF);
      v5 = v17;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v2 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v3 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v2 = sub_20A9E0284();
      }
      if (v2)
        v4 = (_BYTE *)(v2 + v3);
      else
        v4 = 0;
      v5 = (_BYTE *)v2;
    }
    v6 = sub_20A9C37E4(v5, v4);
    v8 = v7;
    if (v7 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(_QWORD *)&v14[0] = v6;
      *((_QWORD *)&v14[0] + 1) = v8;
      return *(_QWORD *)&v14[0];
    }
    if ((a2 & 0x1000000000000000) != 0)
    {
LABEL_20:
      v9 = sub_20A9E011C();
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v9 = HIBYTE(a2) & 0xF;
    }
    else
    {
      v9 = a1 & 0xFFFFFFFFFFFFLL;
    }
    *(_QWORD *)&v14[0] = sub_20A9C3848(v9);
    *((_QWORD *)&v14[0] + 1) = v10;
    MEMORY[0x24BDAC7A8](*(_QWORD *)&v14[0]);
    sub_20A9C30B8();
    __asm { BR              X12 }
  }
  sub_20A9C13A0(v14, (uint64_t)v17);
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  sub_20A9DFA14();
  swift_bridgeObjectRelease();
  v14[0] = v16;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return *(_QWORD *)&v14[0];
}

void sub_20A9C30B8()
{
  __asm { BR              X11 }
}

_QWORD *sub_20A9C3118@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
}

_BYTE *sub_20A9C33A8@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_20A9C362C(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_20A9C36EC((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_20A9C3764((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

_QWORD *sub_20A9C341C(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

char *sub_20A9C3480(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)sub_20A9DF9D8();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)sub_20A9DF9FC();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = sub_20A9DF9F0();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

uint64_t sub_20A9C352C(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_20A9E014C();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x20BD29758](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_20A9C35A4@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  char v3;
  uint64_t v4;

  if (result)
  {
    swift_bridgeObjectRetain();
    result = sub_20A9E0278();
    if ((v3 & 1) == 0)
    {
      v4 = result;
      result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_20A9C362C(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_20A9C36EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_20A9DFA08();
  swift_allocObject();
  result = sub_20A9DF9CC();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_20A9DFA38();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_20A9C3764(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_20A9DFA08();
  swift_allocObject();
  result = sub_20A9DF9CC();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

_BYTE *sub_20A9C37E4(_BYTE *result, _BYTE *a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (_BYTE *)sub_20A9C362C(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)sub_20A9C36EC((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (_BYTE *)sub_20A9C3764((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_20A9C3848(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_20A9DFA08();
      swift_allocObject();
      sub_20A9DF9E4();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_20A9DFA38();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

uint64_t _sSo20ODIServiceProviderIda7CoreODIE8allCasesSayABGvgZ_0()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v12;

  v12 = MEMORY[0x24BEE4AF8];
  if (qword_254611AD0 != -1)
    swift_once();
  v0 = (_QWORD *)swift_bridgeObjectRetain();
  sub_20A9C4128(v0);
  if (qword_254611AD8 != -1)
    swift_once();
  v1 = (_QWORD *)swift_bridgeObjectRetain();
  sub_20A9C4128(v1);
  if (qword_254611B08 != -1)
    swift_once();
  v2 = (_QWORD *)swift_bridgeObjectRetain();
  sub_20A9C4128(v2);
  if (qword_254611AE0 != -1)
    swift_once();
  v3 = (_QWORD *)swift_bridgeObjectRetain();
  sub_20A9C4128(v3);
  if (qword_254611AE8 != -1)
    swift_once();
  v4 = (_QWORD *)swift_bridgeObjectRetain();
  sub_20A9C4128(v4);
  if (qword_254611AF8 != -1)
    swift_once();
  v5 = (_QWORD *)swift_bridgeObjectRetain();
  sub_20A9C4128(v5);
  if (qword_254611B20 != -1)
    swift_once();
  v6 = (_QWORD *)swift_bridgeObjectRetain();
  sub_20A9C4128(v6);
  if (qword_254611B18 != -1)
    swift_once();
  v7 = (_QWORD *)swift_bridgeObjectRetain();
  sub_20A9C4128(v7);
  if (qword_254611B00 != -1)
    swift_once();
  v8 = (_QWORD *)swift_bridgeObjectRetain();
  sub_20A9C4128(v8);
  if (qword_254611AF0 != -1)
    swift_once();
  v9 = (_QWORD *)swift_bridgeObjectRetain();
  sub_20A9C4128(v9);
  if (qword_254611B10 != -1)
    swift_once();
  v10 = (_QWORD *)swift_bridgeObjectRetain();
  sub_20A9C4128(v10);
  return v12;
}

unint64_t sub_20A9C3BAC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254611DD8;
  if (!qword_254611DD8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254611DE0);
    result = MEMORY[0x20BD29DF4](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_254611DD8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD29DE8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_20A9C3C3C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_254611DF0;
  if (!qword_254611DF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254611DE8);
    v2 = sub_20A9C3CA8();
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x20BD29DF4](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_254611DF0);
  }
  return result;
}

unint64_t sub_20A9C3CA8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_254611DF8;
  if (!qword_254611DF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254611E00);
    v2 = sub_20A9C3D0C();
    result = MEMORY[0x20BD29DF4](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_254611DF8);
  }
  return result;
}

unint64_t sub_20A9C3D0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254611E08;
  if (!qword_254611E08)
  {
    v1 = sub_20A9DFC84();
    result = MEMORY[0x20BD29DF4](MEMORY[0x24BE1F440], v1);
    atomic_store(result, (unint64_t *)&qword_254611E08);
  }
  return result;
}

uint64_t sub_20A9C3D54(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_20A9C3D98(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254611E18);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *sub_20A9C3DD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[2];

  v5 = *(uint64_t **)(v3 + 16);
  v7 = *v5;
  v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  result = sub_20A9C341C((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_20A9C3E48, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_20A9C3E34(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_20A9C3D54(a1, a2);
  return a1;
}

uint64_t sub_20A9C3E48@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_20A9C35A4(a1, a2);
}

uint64_t sub_20A9C3E64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_20A9E0194();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_20A9E0188();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_20A9C16D4(a1, &qword_254611C48);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_20A9E0170();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_20A9C3FB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BE1F7F0];
  v3 = sub_20A9E0050();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_20A9C3FF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_20A9E0194();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_20A9E0188();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_20A9C16D4(a1, &qword_254611C48);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_20A9E0170();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

_QWORD *sub_20A9C4128(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;

  v2 = result[2];
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= v3[3] >> 1)
  {
    if (v6[2])
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v10 = v4 + v2;
  else
    v10 = v4;
  result = sub_20A9BA9F4(result, v10, 1, v3);
  v3 = result;
  if (!v6[2])
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  type metadata accessor for ODIServiceProviderId(0);
  result = (_QWORD *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = (_QWORD *)swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v7 = v3[2];
  v8 = __OFADD__(v7, v2);
  v9 = v7 + v2;
  if (!v8)
  {
    v3[2] = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_20A9C421C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v3 = sub_20A9E00E0();
  v5 = v4;
  if (v3 == sub_20A9E00E0() && v5 == v6)
  {
LABEL_20:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  v8 = sub_20A9E032C();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v2 == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  v10 = 5;
  while (1)
  {
    v11 = v10 - 3;
    if (__OFADD__(v10 - 4, 1))
      break;
    v12 = sub_20A9E00E0();
    v14 = v13;
    if (v12 == sub_20A9E00E0() && v14 == v15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    v17 = sub_20A9E032C();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v17 & 1) != 0)
      goto LABEL_7;
    ++v10;
    if (v11 == v2)
      goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_20A9C4370(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  _BOOL8 v5;
  BOOL v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  if (*(_QWORD *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 5; ; ++i)
  {
    v4 = i - 3;
    if (__OFADD__(i - 4, 1))
      break;
    v6 = *(_QWORD *)(a2 + 8 * i) == result;
    v5 = v6;
    v6 = v6 || v4 == v2;
    if (v6)
      return v5;
  }
  __break(1u);
  return result;
}

id sub_20A9C43D4(uint64_t a1)
{
  return sub_20A9C4780(a1, (void **)ODIServiceProviderIdApplicationCreate, (id *)ODIServiceProviderIdApplicationSubmit, &qword_2546133E0);
}

__CFString *sub_20A9C43F0()
{
  uint64_t v0;
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C78);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_20A9E1220;
  *(_QWORD *)(v0 + 32) = CFSTR("com.apple.bko.ach_ingest");
  *(_QWORD *)(v0 + 40) = CFSTR("com.apple.bko.repayment");
  *(_QWORD *)(v0 + 48) = CFSTR("com.apple.bko.repayment_change");
  *(_QWORD *)(v0 + 56) = CFSTR("com.apple.bko.installment_repayment_change");
  *(_QWORD *)(v0 + 64) = CFSTR("com.apple.bko.installment_request_auth");
  *(_QWORD *)(v0 + 72) = CFSTR("com.apple.bko.id_update");
  qword_2546133E8 = v0;
  v1 = CFSTR("com.apple.bko.ach_ingest");
  v2 = CFSTR("com.apple.bko.repayment");
  v3 = CFSTR("com.apple.bko.repayment_change");
  v4 = CFSTR("com.apple.bko.installment_repayment_change");
  v5 = CFSTR("com.apple.bko.installment_request_auth");
  return CFSTR("com.apple.bko.id_update");
}

_QWORD *sub_20A9C44B4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *result;

  if (qword_254611AC0 != -1)
    swift_once();
  v0 = qword_2546133E0;
  if (qword_254611AC8 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v1 = (_QWORD *)swift_bridgeObjectRetain();
  result = sub_20A9C4128(v1);
  qword_2546133F0 = v0;
  return result;
}

id sub_20A9C4564(uint64_t a1)
{
  return sub_20A9C4780(a1, (void **)ODIServiceProviderIdEnhancedFraudProtection, (id *)ODIServiceProviderIdEnhancedFraudProtectionTopup, &qword_2546133F8);
}

__CFString *sub_20A9C4580()
{
  uint64_t v0;
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C78);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_20A9E1230;
  *(_QWORD *)(v0 + 32) = CFSTR("com.apple.cash.topup");
  *(_QWORD *)(v0 + 40) = CFSTR("com.apple.cash.cip");
  *(_QWORD *)(v0 + 48) = CFSTR("com.apple.cash.ach");
  *(_QWORD *)(v0 + 56) = CFSTR("com.apple.cash.p2p");
  *(_QWORD *)(v0 + 64) = CFSTR("com.apple.cash.p2p.proximity");
  qword_254613400 = v0;
  v1 = CFSTR("com.apple.cash.topup");
  v2 = CFSTR("com.apple.cash.cip");
  v3 = CFSTR("com.apple.cash.ach");
  v4 = CFSTR("com.apple.cash.p2p");
  return CFSTR("com.apple.cash.p2p.proximity");
}

__CFString *sub_20A9C4634()
{
  uint64_t v0;
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C78);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_20A9E1240;
  *(_QWORD *)(v0 + 32) = CFSTR("com.apple.saving.add");
  *(_QWORD *)(v0 + 40) = CFSTR("com.apple.saving.others");
  *(_QWORD *)(v0 + 48) = CFSTR("com.apple.saving.fromcash");
  *(_QWORD *)(v0 + 56) = CFSTR("com.apple.saving.setting");
  *(_QWORD *)(v0 + 64) = CFSTR("com.apple.saving.onboard");
  *(_QWORD *)(v0 + 72) = CFSTR("com.apple.saving.firstaccess");
  *(_QWORD *)(v0 + 80) = CFSTR("com.apple.saving.frombank");
  *(_QWORD *)(v0 + 88) = CFSTR("com.apple.saving.fromsplit");
  *(_QWORD *)(v0 + 96) = CFSTR("com.apple.saving.tocash");
  *(_QWORD *)(v0 + 104) = CFSTR("com.apple.saving.tobank");
  qword_254613408 = v0;
  v1 = CFSTR("com.apple.saving.add");
  v2 = CFSTR("com.apple.saving.others");
  v3 = CFSTR("com.apple.saving.fromcash");
  v4 = CFSTR("com.apple.saving.setting");
  v5 = CFSTR("com.apple.saving.onboard");
  v6 = CFSTR("com.apple.saving.firstaccess");
  v7 = CFSTR("com.apple.saving.frombank");
  v8 = CFSTR("com.apple.saving.fromsplit");
  v9 = CFSTR("com.apple.saving.tocash");
  return CFSTR("com.apple.saving.tobank");
}

id sub_20A9C4750(uint64_t a1)
{
  return sub_20A9C4A14(a1, (void **)ODIServiceProviderIdAppleCare, &qword_254613410);
}

id sub_20A9C4764(uint64_t a1)
{
  return sub_20A9C4780(a1, (void **)ODIServiceProviderIdBCConsent, (id *)ODIServiceProviderIdBCValidation, &qword_254613418);
}

id sub_20A9C4780(uint64_t a1, void **a2, id *a3, uint64_t *a4)
{
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C78);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_20A9E1250;
  v8 = *a2;
  v12 = *a3;
  v9 = *a3;
  *(_QWORD *)(v7 + 32) = *a2;
  *(_QWORD *)(v7 + 40) = v9;
  *a4 = v7;
  v10 = v8;
  return v12;
}

__CFString *sub_20A9C47F4()
{
  uint64_t v0;
  void *v1;
  id v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C78);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_20A9E1250;
  if (qword_254611AB8 != -1)
    swift_once();
  v1 = (void *)qword_2546133D8;
  *(_QWORD *)(v0 + 32) = qword_2546133D8;
  *(_QWORD *)(v0 + 40) = CFSTR("com.apple.amp.paidBuy");
  qword_254613420 = v0;
  v2 = v1;
  return CFSTR("com.apple.amp.paidBuy");
}

__CFString *sub_20A9C4890()
{
  uint64_t v0;
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C78);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_20A9E1260;
  *(_QWORD *)(v0 + 32) = CFSTR("com.apple.apc.provision.supereasy");
  *(_QWORD *)(v0 + 40) = CFSTR("com.apple.apc.provision.easy");
  *(_QWORD *)(v0 + 48) = CFSTR("com.apple.apc.provision.manual");
  *(_QWORD *)(v0 + 56) = CFSTR("com.apple.apc.provision.inapp");
  *(_QWORD *)(v0 + 64) = CFSTR("com.apple.apc.provision.transit");
  *(_QWORD *)(v0 + 72) = CFSTR("com.apple.apc.provision.access");
  *(_QWORD *)(v0 + 80) = CFSTR("com.apple.apc.provision.identity");
  *(_QWORD *)(v0 + 88) = CFSTR("com.apple.apc.provision.mdp");
  *(_QWORD *)(v0 + 96) = CFSTR("com.apple.apc.provision.cash");
  *(_QWORD *)(v0 + 104) = CFSTR("com.apple.apc.provision.bw");
  *(_QWORD *)(v0 + 112) = CFSTR("com.apple.apc.provision.tap");
  *(_QWORD *)(v0 + 120) = CFSTR("com.apple.apc.provision.other");
  qword_254613428 = v0;
  v1 = CFSTR("com.apple.apc.provision.supereasy");
  v2 = CFSTR("com.apple.apc.provision.easy");
  v3 = CFSTR("com.apple.apc.provision.manual");
  v4 = CFSTR("com.apple.apc.provision.inapp");
  v5 = CFSTR("com.apple.apc.provision.transit");
  v6 = CFSTR("com.apple.apc.provision.access");
  v7 = CFSTR("com.apple.apc.provision.identity");
  v8 = CFSTR("com.apple.apc.provision.mdp");
  v9 = CFSTR("com.apple.apc.provision.cash");
  v10 = CFSTR("com.apple.apc.provision.bw");
  v11 = CFSTR("com.apple.apc.provision.tap");
  return CFSTR("com.apple.apc.provision.other");
}

id sub_20A9C49D8(uint64_t a1)
{
  return sub_20A9C4A14(a1, (void **)ODIServiceProviderIdTDMTrustedInference, &qword_254613430);
}

id sub_20A9C49EC(uint64_t a1)
{
  return sub_20A9C4A14(a1, (void **)ODIServiceProviderIdPaymentOffersAcquisition, &qword_254613438);
}

id sub_20A9C4A00(uint64_t a1)
{
  return sub_20A9C4A14(a1, (void **)ODIServiceProviderIdAccessTransfer, &qword_254613440);
}

id sub_20A9C4A14(uint64_t a1, void **a2, uint64_t *a3)
{
  uint64_t v5;
  void *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C78);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_20A9E1270;
  v6 = *a2;
  *(_QWORD *)(v5 + 32) = *a2;
  *a3 = v5;
  return v6;
}

uint64_t (*sub_20A9C4A64())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

_QWORD *sub_20A9C4AA8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  id v11;
  _BYTE v13[40];

  v1 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal____lazy_storage____bindingsManager;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal____lazy_storage____bindingsManager))
  {
    v2 = *(_QWORD **)(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal____lazy_storage____bindingsManager);
  }
  else
  {
    v3 = *(void **)(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_providerID);
    sub_20A9BF828(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger, (uint64_t)v13);
    v4 = *(void **)(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__locationBundle);
    v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__locationBundleIdentifier);
    v6 = *(_QWORD *)(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__locationBundleIdentifier + 8);
    v7 = *(_QWORD *)(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionIdentifier);
    v8 = *(_QWORD *)(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionIdentifier + 8);
    type metadata accessor for ODIBindingsManager();
    v9 = (_QWORD *)swift_allocObject();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    v10 = v3;
    v11 = v4;
    v2 = sub_20A9D72A0(v10, (uint64_t)v13, v4, v5, v6, v7, v8, v0, v9);

    swift_release();
    *(_QWORD *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

uint64_t sub_20A9C4BEC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v6 + 16) = a5;
  *(_QWORD *)(v6 + 24) = a6;
  *(_BYTE *)(v6 + 72) = a4;
  v7 = sub_20A9E0050();
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v6 + 48) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9C4C54()
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (!*(_BYTE *)(v0 + 72))
  {
    v8 = *(_QWORD *)(v0 + 40);
    v7 = *(_QWORD *)(v0 + 48);
    v10 = *(_QWORD *)(v0 + 24);
    v9 = *(_QWORD *)(v0 + 32);
    v11 = *(_QWORD *)(v0 + 16);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v11 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(v11 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
    sub_20A9E026C();
    swift_bridgeObjectRelease();
    v12 = sub_20A9DFC84();
    MEMORY[0x20BD29788](v10, v12);
    sub_20A9E0110();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 104))(v7, *MEMORY[0x24BE1F7B0], v9);
    sub_20A9DFF90();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    *(_QWORD *)(v0 + 56) = *(_QWORD *)(v11 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
    return swift_task_switch();
  }
  if (*(_BYTE *)(v0 + 72) == 1)
  {
    v2 = *(_QWORD *)(v0 + 40);
    v1 = *(_QWORD *)(v0 + 48);
    v4 = *(_QWORD *)(v0 + 24);
    v3 = *(_QWORD *)(v0 + 32);
    v5 = *(_QWORD *)(v0 + 16);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(v5 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
    sub_20A9E026C();
    swift_bridgeObjectRelease();
    v6 = sub_20A9DFC84();
    MEMORY[0x20BD29788](v4, v6);
    sub_20A9E0110();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BE1F7B0], v3);
    sub_20A9DFF90();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
    *(_QWORD *)(v0 + 64) = *(_QWORD *)(v5 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
    return swift_task_switch();
  }
  v15 = *(_QWORD *)(v0 + 40);
  v14 = *(_QWORD *)(v0 + 48);
  v16 = *(_QWORD *)(v0 + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v15 + 104))(v14, *MEMORY[0x24BE1F7B0], v16);
  sub_20A9DFF90();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9C4F48()
{
  uint64_t v0;
  uint64_t v1;
  unsigned int v2;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(unsigned __int8 *)(v1 + 112);
  if (v2 <= 2)
    LOBYTE(v2) = 2;
  *(_BYTE *)(v1 + 112) = v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9C4F90()
{
  uint64_t v0;
  uint64_t v1;
  unsigned int v2;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(unsigned __int8 *)(v1 + 112);
  if (v2 <= 1)
    LOBYTE(v2) = 1;
  *(_BYTE *)(v1 + 112) = v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9C509C()
{
  sub_20A9E026C();
  sub_20A9E0110();
  type metadata accessor for ODIServiceProviderId(0);
  sub_20A9E02CC();
  return 0;
}

uint64_t sub_20A9C5140()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[7] = v0;
  v2 = sub_20A9E0050();
  v1[8] = v2;
  v1[9] = *(_QWORD *)(v2 - 8);
  v1[10] = swift_task_alloc();
  v3 = sub_20A9DFF60();
  v1[11] = v3;
  v1[12] = *(_QWORD *)(v3 - 8);
  v1[13] = swift_task_alloc();
  v4 = sub_20A9DFC3C();
  v1[14] = v4;
  v1[15] = *(_QWORD *)(v4 - 8);
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9C5200()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unsigned int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator;
  *(_QWORD *)(v0 + 144) = OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator;
  if (*(_QWORD *)(v1 + v2))
  {
    v4 = *(_QWORD *)(v0 + 72);
    v3 = *(_QWORD *)(v0 + 80);
    v5 = *(_QWORD *)(v0 + 64);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v3, *MEMORY[0x24BE1F7D8], v5);
    sub_20A9DFFB4();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 128);
    v7 = *(_QWORD *)(v0 + 136);
    v9 = *(_QWORD *)(v0 + 112);
    v10 = *(_QWORD *)(v0 + 120);
    sub_20A9C2918(*(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_providerID), v7);
    sub_20A9E00E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v7, v9);
    v11 = *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__dsidType);
    if (v11 > 3)
      v12 = (unsigned int *)MEMORY[0x24BE1F6C0];
    else
      v12 = (unsigned int *)qword_24C355DA0[v11];
    v13 = *(_QWORD *)(v0 + 56);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 104))(*(_QWORD *)(v0 + 104), *v12, *(_QWORD *)(v0 + 88));
    sub_20A9DFB70();
    v14 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
    *(_QWORD *)(v0 + 152) = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
    sub_20A9BF828(v13 + v14, v0 + 16);
    v15 = swift_allocObject();
    sub_20A9C13A0((__int128 *)(v0 + 16), v15 + 16);
    *(_QWORD *)(v15 + 56) = v13;
    swift_bridgeObjectRetain();
    swift_retain();
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v16;
    *v16 = v0;
    v16[1] = sub_20A9C545C;
    return sub_20A9DFB4C();
  }
}

uint64_t sub_20A9C545C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 168) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9C54BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v17 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);
  v5 = (_QWORD *)(v4 + *(_QWORD *)(v0 + 152));
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v6 = *MEMORY[0x24BE1F7F0];
  v7 = sub_20A9E0050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v1, v6, v7);
  sub_20A9DFFF0();
  v8 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v8(v1, v3);
  v9 = *(_QWORD *)(v0 + 136);
  v10 = *(_QWORD *)(v0 + 112);
  v11 = *(_QWORD *)(v0 + 120);
  if (*(_QWORD *)(v4 + v17))
  {
    v12 = *(_QWORD *)(v0 + 72);
    v13 = *(_QWORD *)(v0 + 80);
    v14 = *(_QWORD *)(v0 + 64);
    v16 = *(_QWORD *)(v0 + 112);
    v18 = *(_QWORD *)(v0 + 136);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 56) + *(_QWORD *)(v0 + 152)), v5[3]);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v12 + 104))(v13, *MEMORY[0x24BE1F7D8], v14);
    sub_20A9DFFB4();
    swift_release();
    v8(v13, v14);
    v10 = v16;
    v9 = v18;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(v0 + 56) + *(_QWORD *)(v0 + 144)) = *(_QWORD *)(v0 + 168);
  }
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9C5670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  v4 = sub_20A9E0050();
  v3[11] = v4;
  v3[12] = *(_QWORD *)(v4 - 8);
  v3[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9C56D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;

  v2 = *(_QWORD *)(v0 + 96);
  v1 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 88);
  __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 72), *(_QWORD *)(*(_QWORD *)(v0 + 72) + 24));
  *(_DWORD *)(v0 + 272) = *MEMORY[0x24BE1F7B0];
  v4 = *(void (**)(uint64_t))(v2 + 104);
  *(_QWORD *)(v0 + 112) = v4;
  v4(v1);
  sub_20A9DFF9C();
  v5 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  *(_QWORD *)(v0 + 120) = v5;
  v5(v1, v3);
  v6 = sub_20A9DFDEC();
  *(_QWORD *)(v0 + 128) = v6;
  if (!v6)
  {
    v7 = sub_20A9DFDF8();
    *(_QWORD *)(v0 + 168) = v7;
    v8 = *(void (**)(uint64_t, uint64_t))(v0 + 120);
    v9 = *(_QWORD *)(v0 + 104);
    v10 = *(_QWORD *)(v0 + 88);
    if (v7)
    {
      v11 = *(void (**)(uint64_t, uint64_t))(v0 + 120);
      __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 72), *(_QWORD *)(*(_QWORD *)(v0 + 72) + 24));
      sub_20A9E026C();
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_254611E00);
      sub_20A9E0080();
      sub_20A9E0110();
      swift_bridgeObjectRelease();
      v12 = *MEMORY[0x24BE1F7F0];
      *(_DWORD *)(v0 + 276) = v12;
      v13 = sub_20A9E0050();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v9, v12, v13);
      sub_20A9DFFE4();
      swift_bridgeObjectRelease();
      v11(v9, v10);
    }
    else
    {
      __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 72), *(_QWORD *)(*(_QWORD *)(v0 + 72) + 24));
      v14 = *MEMORY[0x24BE1F7F0];
      v15 = sub_20A9E0050();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v9, v14, v15);
      sub_20A9DFFE4();
      v8(v9, v10);
      *(_DWORD *)(v0 + 280) = v14;
      v16 = sub_20A9DFE04();
      v18 = v17;
      v19 = *(_QWORD *)(v0 + 80);
      if ((v18 & 1) != 0)
      {
        *(_QWORD *)(v0 + 216) = v19;
        *(_QWORD *)(v0 + 224) = *(_QWORD *)(v19 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
      }
      else
      {
        *(_QWORD *)(v0 + 208) = v16;
      }
    }
  }
  return swift_task_switch();
}

uint64_t sub_20A9C5994()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = v0[16];
  v0[17] = *(_QWORD *)(v0[10] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_fieldsCachingManager);
  swift_retain();
  v2 = (_QWORD *)swift_task_alloc();
  v0[18] = v2;
  *v2 = v0;
  v2[1] = sub_20A9C5A10;
  return sub_20A9DACE4(1, v1);
}

uint64_t sub_20A9C5A10()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v4 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 152) = v2;
  *v2 = v4;
  v2[1] = sub_20A9C5A90;
  return sub_20A9D5268();
}

uint64_t sub_20A9C5A90()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9C5AF4()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;

  v1 = sub_20A9DFDF8();
  *(_QWORD *)(v0 + 168) = v1;
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 120);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 88);
  if (v1)
  {
    v5 = *(void (**)(uint64_t, uint64_t))(v0 + 120);
    __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 72), *(_QWORD *)(*(_QWORD *)(v0 + 72) + 24));
    sub_20A9E026C();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254611E00);
    sub_20A9E0080();
    sub_20A9E0110();
    swift_bridgeObjectRelease();
    v6 = *MEMORY[0x24BE1F7F0];
    *(_DWORD *)(v0 + 276) = v6;
    v7 = sub_20A9E0050();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v3, v6, v7);
    sub_20A9DFFE4();
    swift_bridgeObjectRelease();
    v5(v3, v4);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 72), *(_QWORD *)(*(_QWORD *)(v0 + 72) + 24));
    v8 = *MEMORY[0x24BE1F7F0];
    v9 = sub_20A9E0050();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v3, v8, v9);
    sub_20A9DFFE4();
    v2(v3, v4);
    *(_DWORD *)(v0 + 280) = v8;
    v10 = sub_20A9DFE04();
    v12 = v11;
    v13 = *(_QWORD *)(v0 + 80);
    if ((v12 & 1) != 0)
    {
      *(_QWORD *)(v0 + 216) = v13;
      *(_QWORD *)(v0 + 224) = *(_QWORD *)(v13 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
    }
    else
    {
      *(_QWORD *)(v0 + 208) = v10;
    }
  }
  return swift_task_switch();
}

uint64_t sub_20A9C5D1C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 176) = sub_20A9C4AA8();
  return swift_task_switch();
}

uint64_t sub_20A9C5D5C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 + 168);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 184) = v2;
  *v2 = v0;
  v2[1] = sub_20A9C5DB0;
  return sub_20A9DACE4(0, v1);
}

uint64_t sub_20A9C5DB0()
{
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_20A9C5E24()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 192) = sub_20A9C4AA8();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 200) = v1;
  *v1 = v0;
  v1[1] = sub_20A9C5E78;
  return sub_20A9B78B8();
}

uint64_t sub_20A9C5E78()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9C5ED4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;

  *(_DWORD *)(v0 + 280) = *(_DWORD *)(v0 + 276);
  v1 = sub_20A9DFE04();
  v3 = v2;
  v4 = *(_QWORD *)(v0 + 80);
  if ((v3 & 1) != 0)
  {
    *(_QWORD *)(v0 + 216) = v4;
    *(_QWORD *)(v0 + 224) = *(_QWORD *)(v4 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  }
  else
  {
    *(_QWORD *)(v0 + 208) = v1;
  }
  return swift_task_switch();
}

uint64_t sub_20A9C5F44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v7)(uint64_t, uint64_t);

  v1 = *(unsigned int *)(v0 + 280);
  v7 = *(void (**)(uint64_t, uint64_t))(v0 + 120);
  v2 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 88);
  *(double *)(v4 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_profileSla) = (double)*(uint64_t *)(v0 + 208) * 0.001;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v4 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(v4 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 48) = 0xE000000000000000;
  sub_20A9E0110();
  sub_20A9E01F4();
  v5 = sub_20A9E0050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(v2, v1, v5);
  sub_20A9DFFF0();
  swift_bridgeObjectRelease();
  v7(v2, v3);
  return swift_task_switch();
}

uint64_t sub_20A9C6090()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[10];
  v0[27] = v1;
  v0[28] = *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  return swift_task_switch();
}

uint64_t sub_20A9C60B8()
{
  sub_20A9DDC0C();
  return swift_task_switch();
}

uint64_t sub_20A9C60F4()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  void (*v2)(uint64_t, _QWORD, uint64_t);
  uint64_t v3;
  uint64_t v4;

  v2 = *(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 112);
  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 120);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 88);
  __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 72), *(_QWORD *)(*(_QWORD *)(v0 + 72) + 24));
  v2(v3, *MEMORY[0x24BE1F7E8], v4);
  sub_20A9DFF90();
  v1(v3, v4);
  return swift_task_switch();
}

uint64_t sub_20A9C61AC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 232) = sub_20A9C4AA8();
  return swift_task_switch();
}

uint64_t sub_20A9C61EC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 240) = *(_QWORD *)(*(_QWORD *)(v0 + 232) + 80);
  sub_20A9DFCC0();
  sub_20A9BA454(&qword_254611C98, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F470], MEMORY[0x24BE1F480]);
  sub_20A9E0170();
  return swift_task_switch();
}

uint64_t sub_20A9C6268()
{
  sub_20A9DFCA8();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9C62AC()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 248) = sub_20A9C4AA8();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 256) = v1;
  *v1 = v0;
  v1[1] = sub_20A9C6304;
  return sub_20A9B96E0(1);
}

uint64_t sub_20A9C6304()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 264) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_20A9C6380()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  void (*v7)(uint64_t, uint64_t);

  v1 = *(void **)(v0 + 160);
  v2 = *(unsigned int *)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 104);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 112);
  v4 = *(_QWORD *)(v0 + 88);
  v7 = *(void (**)(uint64_t, uint64_t))(v0 + 120);
  __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 72), *(_QWORD *)(*(_QWORD *)(v0 + 72) + 24));
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_20A9E035C();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  v6(v3, v2, v4);
  sub_20A9DFFA8();
  swift_bridgeObjectRelease();

  v7(v3, v4);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9C64C4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  void (*v7)(uint64_t, uint64_t);

  swift_release();
  v1 = *(void **)(v0 + 264);
  v2 = *(unsigned int *)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 104);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 112);
  v4 = *(_QWORD *)(v0 + 88);
  v7 = *(void (**)(uint64_t, uint64_t))(v0 + 120);
  __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 72), *(_QWORD *)(*(_QWORD *)(v0 + 72) + 24));
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_20A9E035C();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  v6(v3, v2, v4);
  sub_20A9DFFA8();
  swift_bridgeObjectRelease();

  v7(v3, v4);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

char *ODISessionInternal.__allocating_init(serviceIdentifier:forDSIDType:locationBundle:andLocationBundleIdentifier:sessionStateDelegate:)(void *a1, unint64_t a2, void *a3, uint64_t a4, uint64_t *a5, uint64_t a6)
{
  swift_allocObject();
  return ODISessionInternal.init(serviceIdentifier:forDSIDType:locationBundle:andLocationBundleIdentifier:sessionStateDelegate:)(a1, a2, a3, a4, a5, a6);
}

char *ODISessionInternal.init(serviceIdentifier:forDSIDType:locationBundle:andLocationBundleIdentifier:sessionStateDelegate:)(void *a1, unint64_t a2, void *a3, uint64_t a4, uint64_t *a5, uint64_t a6)
{
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  _QWORD *v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t inited;
  unint64_t v45;
  unint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  _QWORD *v57;
  objc_class *v58;
  id v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v62;
  _QWORD *v63;
  char *v64;
  _QWORD *v65;
  char *v66;
  _QWORD *v67;
  char *v68;
  _QWORD *v69;
  char *v70;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  uint64_t *v88;
  id v89;
  uint64_t v90;
  id v91;
  objc_super v92;
  unint64_t v93;
  unint64_t v94;
  __int128 v95;
  uint64_t v96;
  _QWORD *v97;

  v7 = v6;
  v90 = a6;
  v88 = a5;
  v73 = a4;
  v89 = a3;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254611C48);
  MEMORY[0x24BDAC7A8](v10);
  v82 = (char *)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_20A9DFAD4();
  MEMORY[0x24BDAC7A8](v12);
  v81 = (char *)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = sub_20A9DFAE0();
  v84 = *(_QWORD *)(v85 - 8);
  MEMORY[0x24BDAC7A8](v85);
  v83 = (char *)&v72 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = sub_20A9DFB28();
  v78 = *(_QWORD *)(v80 - 8);
  MEMORY[0x24BDAC7A8](v80);
  v77 = (char *)&v72 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = sub_20A9E0050();
  v75 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  v74 = (char *)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  v17 = (uint64_t)&v6[OBJC_IVAR____TtC7CoreODI18ODISessionInternal__pendingFeedback];
  v18 = type metadata accessor for ODISessionInternal.PendingFeedback(0);
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v87 = v17;
  v19(v17, 1, 1, v18);
  *(_QWORD *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator] = 0;
  v20 = &v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnAtorSessionId];
  *v20 = 0;
  v20[1] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal____lazy_storage____bindingsManager] = 0;
  v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal__lastAssessmentTimedOut] = 0;
  v86 = (_QWORD *)OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask;
  *(_QWORD *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_profileSla] = 0x400B333333333333;
  v21 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_authorizedDsidTypes;
  *(_QWORD *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_authorizedDsidTypes] = &unk_24C355030;
  v22 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_authorizedServices;
  swift_retain();
  v23 = _sSo20ODIServiceProviderIda7CoreODIE8allCasesSayABGvgZ_0();
  *(_QWORD *)&v7[v22] = v23;
  v24 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_providerID;
  v25 = a1;
  *(_QWORD *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_providerID] = a1;
  v26 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal__dsidType;
  v79 = a2;
  *(_QWORD *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal__dsidType] = a2;
  v27 = v25;
  swift_bridgeObjectRetain();
  v91 = (id)v27;
  LOBYTE(v27) = sub_20A9C421C(v27, v23);
  swift_bridgeObjectRelease();
  if ((v27 & 1) != 0 && (sub_20A9C4370(*(_QWORD *)&v7[v26], *(_QWORD *)&v7[v21]) & 1) != 0)
  {
    v28 = v89;
    *(_QWORD *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal__locationBundle] = v89;
    v29 = &v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal__locationBundleIdentifier];
    v30 = v88;
    *v29 = v73;
    v29[1] = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254611E80);
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_20A9E1270;
    v89 = v28;
    v32 = sub_20A9D6E58(0xFFFFFFFFFFFFFFFELL);
    v33 = MEMORY[0x24BEE1ED8];
    *(_QWORD *)(v31 + 56) = MEMORY[0x24BEE1E88];
    *(_QWORD *)(v31 + 64) = v33;
    *(_QWORD *)(v31 + 32) = (v32 + 1);
    v34 = sub_20A9E00EC();
    v35 = (uint64_t *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionIdentifier];
    v88 = (uint64_t *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionIdentifier];
    *v35 = v34;
    v35[1] = v36;
    v96 = sub_20A9DFA98();
    v97 = (_QWORD *)MEMORY[0x24BE1F190];
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v95);
    swift_bridgeObjectRetain();
    sub_20A9DFA74();
    v37 = (uint64_t)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger];
    sub_20A9C13A0(&v95, (uint64_t)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger]);
    v87 = v37;
    sub_20A9BF828(v37, (uint64_t)&v95);
    v86 = v97;
    __swift_project_boxed_opaque_existential_1(&v95, v96);
    v93 = 0;
    v94 = 0xE000000000000000;
    sub_20A9E026C();
    swift_bridgeObjectRelease();
    v93 = 0xD000000000000023;
    v94 = 0x800000020A9F21C0;
    sub_20A9E00E0();
    sub_20A9E0110();
    swift_bridgeObjectRelease();
    v38 = v75;
    v39 = v74;
    v40 = v76;
    (*(void (**)(char *, _QWORD, uint64_t))(v75 + 104))(v74, *MEMORY[0x24BE1F7D8], v76);
    sub_20A9DFF90();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v38 + 8))(v39, v40);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v95);
    sub_20A9BF828(v37, (uint64_t)&v95);
    v86 = __swift_project_boxed_opaque_existential_1(&v95, v96);
    v41 = v78;
    v42 = v77;
    v43 = v80;
    (*(void (**)(char *, _QWORD, uint64_t))(v78 + 104))(v77, *MEMORY[0x24BE1F230], v80);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254611E98);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_20A9E11C0;
    *(_QWORD *)(inited + 32) = 0x776F6C666B726F77;
    *(_QWORD *)(inited + 40) = 0xEA00000000004449;
    v93 = sub_20A9E00E0();
    v94 = v45;
    swift_bridgeObjectRetain();
    sub_20A9E0110();
    swift_bridgeObjectRelease();
    v46 = v94;
    *(_QWORD *)(inited + 48) = v93;
    *(_QWORD *)(inited + 56) = v46;
    strcpy((char *)(inited + 64), "odiSessionID");
    *(_BYTE *)(inited + 77) = 0;
    *(_WORD *)(inited + 78) = -5120;
    v47 = v88;
    v48 = v88[1];
    *(_QWORD *)(inited + 80) = *v88;
    *(_QWORD *)(inited + 88) = v48;
    *(_QWORD *)(inited + 96) = 0x6570795464697364;
    *(_QWORD *)(inited + 104) = 0xE800000000000000;
    v93 = v79;
    swift_bridgeObjectRetain();
    *(_QWORD *)(inited + 112) = sub_20A9E0308();
    *(_QWORD *)(inited + 120) = v49;
    v93 = sub_20A9C7190(inited);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254611EA0);
    sub_20A9D7124();
    sub_20A9DFFC0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v43);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v95);
    sub_20A9DFCC0();
    v50 = *v47;
    v51 = v47[1];
    swift_bridgeObjectRetain();
    *(_QWORD *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal__armandDataFiller] = sub_20A9DFC9C();
    sub_20A9DFE70();
    v52 = v83;
    sub_20A9DFAEC();
    sub_20A9BF828(v87, (uint64_t)&v95);
    type metadata accessor for ODISessionStateMachine(0);
    swift_allocObject();
    v53 = v91;
    v54 = v90;
    swift_unknownObjectRetain();
    v55 = sub_20A9DEAF8((uint64_t)&v95, v53, v54);
    swift_unknownObjectRelease();

    *(_QWORD *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState] = v55;
    type metadata accessor for ODIFieldsManager();
    swift_allocObject();
    v56 = v53;
    swift_bridgeObjectRetain();
    v57 = sub_20A9DC71C(v50, v51, v56);

    *(_QWORD *)&v7[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_fieldsCachingManager] = v57;
    swift_release();
    v58 = (objc_class *)type metadata accessor for ODISessionInternal(0);
    v92.receiver = v7;
    v92.super_class = v58;
    v59 = objc_msgSendSuper2(&v92, sel_init);
    v60 = sub_20A9E0194();
    v61 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 56);
    v62 = (uint64_t)v82;
    v61(v82, 1, 1, v60);
    v63 = (_QWORD *)swift_allocObject();
    v63[2] = 0;
    v63[3] = 0;
    v63[4] = v59;
    v64 = (char *)v59;
    *(_QWORD *)&v64[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask] = sub_20A9C3FF4(v62, (uint64_t)&unk_254611ED0, (uint64_t)v63);
    swift_release();
    v61((char *)v62, 1, 1, v60);
    v65 = (_QWORD *)swift_allocObject();
    v65[2] = 0;
    v65[3] = 0;
    v65[4] = v64;
    v66 = v64;
    sub_20A9C3E64(v62, (uint64_t)&unk_254611EE0, (uint64_t)v65);
    swift_release();
    v61((char *)v62, 1, 1, v60);
    v67 = (_QWORD *)swift_allocObject();
    v67[2] = 0;
    v67[3] = 0;
    v67[4] = v66;
    v68 = v66;
    sub_20A9C3FF4(v62, (uint64_t)&unk_254611EF0, (uint64_t)v67);
    swift_release();
    v61((char *)v62, 1, 1, v60);
    v69 = (_QWORD *)swift_allocObject();
    v69[2] = 0;
    v69[3] = 0;
    v69[4] = v68;
    v70 = v68;
    sub_20A9C3E64(v62, (uint64_t)&unk_254611F00, (uint64_t)v69);
    swift_release();
    sub_20A9DFAC8();

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v84 + 8))(v52, v85);
  }
  else
  {

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    sub_20A9C16D4(v87, &qword_254611E68);
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();

    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    type metadata accessor for ODISessionInternal(0);
    swift_defaultActor_destroy();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v70;
}

uint64_t type metadata accessor for ODISessionInternal.PendingFeedback(uint64_t a1)
{
  return sub_20A9D70F0(a1, (uint64_t *)&unk_254611FD8);
}

unint64_t sub_20A9C7190(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254612110);
  v2 = (_QWORD *)sub_20A9E02F0();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_20A9BAC84(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_20A9C72B0(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611DC8);
  v2 = sub_20A9E02F0();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_20A9D8A70(v6, (uint64_t)&v13, &qword_254611DA8);
    v7 = v13;
    result = sub_20A9BADBC(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = sub_20A9C13A0(&v14, v3[7] + 40 * result);
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_20A9C73E0(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611DA0);
  v2 = sub_20A9E02F0();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_20A9D8A70(v6, (uint64_t)&v15, &qword_2546120A0);
    v7 = v15;
    v8 = v16;
    result = sub_20A9BAC84(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = sub_20A9C13A0(&v17, v3[7] + 40 * result);
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 56;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_20A9C7520(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C88);
  v2 = (_QWORD *)sub_20A9E02F0();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_20A9BAC84(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_20A9C7638()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_20A9BA70C;
  return sub_20A9C5140();
}

uint64_t sub_20A9C7680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_20A9C7698()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  return swift_task_switch();
}

uint64_t sub_20A9C76BC()
{
  uint64_t v0;

  sub_20A9DDBEC();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9C76EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 96) = a4;
  return swift_task_switch();
}

uint64_t sub_20A9C7704()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 104) = sub_20A9C4AA8();
  return swift_task_switch();
}

uint64_t sub_20A9C7744()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  unint64_t v7;
  _QWORD *v8;

  v1 = v0[12];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254612100);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20A9E1270;
  *(_QWORD *)(inited + 32) = CFSTR("debugSessionId");
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionIdentifier);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionIdentifier + 8);
  v5 = MEMORY[0x24BEE0D10];
  *(_QWORD *)(inited + 64) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 72) = v5;
  *(_QWORD *)(inited + 40) = v3;
  *(_QWORD *)(inited + 48) = v4;
  v6 = CFSTR("debugSessionId");
  swift_bridgeObjectRetain();
  v7 = sub_20A9C72B0(inited);
  v0[14] = v7;
  v8 = (_QWORD *)swift_task_alloc();
  v0[15] = v8;
  *v8 = v0;
  v8[1] = sub_20A9C7810;
  return sub_20A9B9174(v7);
}

uint64_t sub_20A9C7810()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

uint64_t sub_20A9C788C()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 136) = sub_20A9C4AA8();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v1;
  *v1 = v0;
  v1[1] = sub_20A9C78E0;
  return sub_20A9B853C();
}

uint64_t sub_20A9C78E0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_release();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_20A9C7934()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9C7970()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_20A9C1758;
  return sub_20A9C7A4C();
}

uint64_t sub_20A9C7A4C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[6] = v0;
  v2 = sub_20A9DFE64();
  v1[7] = v2;
  v1[8] = *(_QWORD *)(v2 - 8);
  v1[9] = swift_task_alloc();
  v3 = sub_20A9DFF18();
  v1[10] = v3;
  v1[11] = *(_QWORD *)(v3 - 8);
  v1[12] = swift_task_alloc();
  v4 = sub_20A9E0050();
  v1[13] = v4;
  v1[14] = *(_QWORD *)(v4 - 8);
  v1[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9C7AFC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  _QWORD *v7;

  v2 = v0[14];
  v1 = v0[15];
  v3 = v0[13];
  v4 = v0[6];
  v5 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  v0[16] = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v4 + v5), *(_QWORD *)(v4 + v5 + 24));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BE1F7D8], v3);
  sub_20A9DFF9C();
  v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[17] = v6;
  v6(v1, v3);
  v0[18] = *(_QWORD *)(v4 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_fieldsCachingManager);
  swift_retain();
  v7 = (_QWORD *)swift_task_alloc();
  v0[19] = v7;
  *v7 = v0;
  v7[1] = sub_20A9C7BFC;
  return sub_20A9DA5D8(1);
}

uint64_t sub_20A9C7BFC()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9C7C5C()
{
  uint64_t *v0;
  _QWORD *v1;

  sub_20A9DFE4C();
  v1 = (_QWORD *)swift_task_alloc();
  v0[20] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_20A9C7CC8;
  return sub_20A9CB8D4(v0[12], v0[9], 0, 1);
}

uint64_t sub_20A9C7CC8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  *(_QWORD *)(*(_QWORD *)v1 + 168) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v2[11] + 8))(v2[12], v2[10]);
  return swift_task_switch();
}

uint64_t sub_20A9C7D6C()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
  v2 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = (_QWORD *)(*(_QWORD *)(v0 + 48) + *(_QWORD *)(v0 + 128));
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  v5 = *MEMORY[0x24BE1F7F0];
  v6 = sub_20A9E0050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v2, v5, v6);
  sub_20A9DFFF0();
  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9C7E54()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v8)(uint64_t, uint64_t);

  v1 = *(void **)(v0 + 168);
  v8 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
  v2 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = (_QWORD *)(*(_QWORD *)(v0 + 48) + *(_QWORD *)(v0 + 128));
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_20A9E026C();
  sub_20A9E0110();
  swift_getErrorValue();
  sub_20A9E035C();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  v5 = *MEMORY[0x24BE1F7F0];
  v6 = sub_20A9E0050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v2, v5, v6);
  sub_20A9DFFFC();
  swift_bridgeObjectRelease();

  v8(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9C7FC8(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  id v23;
  void *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  _QWORD *v29;
  id v30;
  void *v31;
  char *v32;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  _QWORD v45[3];
  uint64_t v46;
  uint64_t v47;

  v2 = v1;
  v42 = sub_20A9E0050();
  v40 = *(_QWORD **)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254611C48);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_20A9DFAD4();
  MEMORY[0x24BDAC7A8](v9);
  v10 = sub_20A9DFAE0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A9DFE7C();
  v41 = v13;
  sub_20A9DFAEC();
  v14 = sub_20A9E0194();
  v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v2;
  swift_retain();
  sub_20A9C3E64((uint64_t)v8, (uint64_t)&unk_254611F10, (uint64_t)v16);
  swift_release();
  if (a1)
  {
    v17 = sub_20A9D8AD0((_QWORD *)(v2 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger));
    if (v17)
    {
      v18 = v17;
      if (*(_QWORD *)(v17 + 16))
      {
        v15(v8, 1, 1, v14);
        v19 = (_QWORD *)swift_allocObject();
        v19[2] = 0;
        v19[3] = 0;
        v19[4] = v2;
        v19[5] = v18;
        swift_retain();
        sub_20A9C3FF4((uint64_t)v8, (uint64_t)&unk_254611F20, (uint64_t)v19);
        swift_release();
        goto LABEL_14;
      }
      swift_bridgeObjectRelease();
    }
  }
  v35 = v11;
  v20 = v2 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  sub_20A9BF828(v2 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger, (uint64_t)v45);
  v21 = v47;
  v22 = __swift_project_boxed_opaque_existential_1(v45, v46);
  v43 = 0;
  v44 = 0xE000000000000000;
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  v43 = 0xD00000000000002FLL;
  v44 = 0x800000020A9F2210;
  v38 = (_QWORD *)v20;
  v39 = v10;
  v36 = v22;
  v37 = v21;
  if (a1)
  {
    v23 = objc_msgSend(a1, sel_attributes);
    if (v23)
    {
      v24 = v23;
      type metadata accessor for ODIAttributeKey(0);
      sub_20A9BA454((unint64_t *)&qword_254611C08, (uint64_t (*)(uint64_t))type metadata accessor for ODIAttributeKey, (uint64_t)&unk_20A9E116C);
      sub_20A9E0074();

      sub_20A9E0098();
      swift_bridgeObjectRelease();
    }
  }
  v25 = v42;
  v26 = v40;
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  v27 = *MEMORY[0x24BE1F7F0];
  v40 = (_QWORD *)v26[13];
  ((void (*)(char *, uint64_t, uint64_t))v40)(v5, v27, v25);
  sub_20A9E0008();
  swift_bridgeObjectRelease();
  v28 = (void (*)(char *, uint64_t))v26[1];
  v28(v5, v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  sub_20A9BF828((uint64_t)v38, (uint64_t)v45);
  v29 = __swift_project_boxed_opaque_existential_1(v45, v46);
  v43 = 0;
  v44 = 0xE000000000000000;
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  v43 = 0xD000000000000026;
  v44 = 0x800000020A9F2240;
  v38 = v29;
  if (a1 && (v30 = objc_msgSend(a1, sel_attributes)) != 0)
  {
    v31 = v30;
    type metadata accessor for ODIAttributeKey(0);
    sub_20A9BA454((unint64_t *)&qword_254611C08, (uint64_t (*)(uint64_t))type metadata accessor for ODIAttributeKey, (uint64_t)&unk_20A9E116C);
    sub_20A9E0074();

    sub_20A9E0080();
    v25 = v42;
    swift_bridgeObjectRelease();
    v11 = v35;
  }
  else
  {
    v11 = v35;
  }
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  ((void (*)(char *, uint64_t, uint64_t))v40)(v5, v27, v25);
  sub_20A9E002C();
  swift_bridgeObjectRelease();
  v28(v5, v25);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  v10 = v39;
LABEL_14:
  v32 = v41;
  sub_20A9DFAC8();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v32, v10);
}

uint64_t sub_20A9C853C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[2] = a4;
  type metadata accessor for ODISessionStateMachine.ApplyTimingCase(0);
  v4[3] = swift_task_alloc();
  v5 = sub_20A9DFDE0();
  v4[4] = v5;
  v4[5] = *(_QWORD *)(v5 - 8);
  v4[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9C85BC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[3];
  v0[7] = *(_QWORD *)(v0[2] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 5, v2);
  return swift_task_switch();
}

uint64_t sub_20A9C862C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[6];
  v2 = v0[4];
  v3 = v0[5];
  v4 = v0[3];
  sub_20A9DE440(v4);
  sub_20A9D80D0(v4, type metadata accessor for ODISessionStateMachine.ApplyTimingCase);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  return swift_task_switch();
}

uint64_t sub_20A9C86A8()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9C86E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_20A9C86FC()
{
  uint64_t *v0;
  _QWORD *v1;

  v0[4] = (uint64_t)sub_20A9C4AA8();
  v1 = (_QWORD *)swift_task_alloc();
  v0[5] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_20A9C8758;
  return sub_20A9B9174(v0[3]);
}

uint64_t sub_20A9C8758()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_release();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_20A9C87CC()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9C884C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = sub_20A9DFE64();
  v4 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20A9E0050();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(v2 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BE1F7E0], v7);
  sub_20A9DFF90();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_20A9DFE4C();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v13;
  *(_QWORD *)(v11 + 24) = a2;
  swift_retain();
  sub_20A9CFE60((uint64_t)v6, (uint64_t)sub_20A9D7770, v11);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v14);
}

void sub_20A9C8BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;
  id v8;

  if (!a2)
  {
    v6 = 0;
    if (a3)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v6 = (void *)sub_20A9E00BC();
  if (!a3)
    goto LABEL_5;
LABEL_3:
  v7 = sub_20A9DFA20();
LABEL_6:
  v8 = (id)v7;
  (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v6);

}

uint64_t sub_20A9C8C2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254611C48);
  MEMORY[0x24BDAC7A8](v3);
  v24 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_20A9DFB28();
  v21 = *(_QWORD *)(v5 - 8);
  v22 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_20A9E0050();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger);
  v13 = *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24);
  v20 = *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), v13);
  v26 = 0;
  v27 = 0xE000000000000000;
  sub_20A9E026C();
  sub_20A9E0110();
  v25 = a1;
  sub_20A9E0308();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BE1F7F0], v8);
  sub_20A9DFFE4();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  v15 = v21;
  v14 = v22;
  (*(void (**)(char *, _QWORD, uint64_t))(v21 + 104))(v7, *MEMORY[0x24BE1F238], v22);
  v26 = a1;
  sub_20A9E0308();
  sub_20A9DFFCC();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v14);
  v16 = sub_20A9E0194();
  v17 = (uint64_t)v24;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v24, 1, 1, v16);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v23;
  v18[5] = a1;
  swift_retain();
  sub_20A9C3E64(v17, (uint64_t)&unk_254611F30, (uint64_t)v18);
  return swift_release();
}

uint64_t sub_20A9C8F10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v7;
  *v7 = v5;
  v7[1] = sub_20A9C1758;
  return sub_20A9C91E4(a5);
}

uint64_t sub_20A9C8F94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254611C48);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_20A9E0194();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v2;
  v9[5] = a1;
  v9[6] = a2;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_20A9C3E64((uint64_t)v7, (uint64_t)&unk_254611F40, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_20A9C9070(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return swift_task_switch();
}

uint64_t sub_20A9C908C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  return swift_task_switch();
}

uint64_t sub_20A9C90B0()
{
  uint64_t v0;

  sub_20A9DDE10(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9C91E4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[28] = a1;
  v2[29] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C48);
  v2[30] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611E68);
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  v3 = sub_20A9DFA68();
  v2[33] = v3;
  v2[34] = *(_QWORD *)(v3 - 8);
  v2[35] = swift_task_alloc();
  v4 = sub_20A9DFE10();
  v2[36] = v4;
  v2[37] = *(_QWORD *)(v4 - 8);
  v2[38] = swift_task_alloc();
  type metadata accessor for ODISessionStateMachine.ApplyTimingCase(0);
  v2[39] = swift_task_alloc();
  v5 = sub_20A9E0050();
  v2[40] = v5;
  v2[41] = *(_QWORD *)(v5 - 8);
  v2[42] = swift_task_alloc();
  v6 = sub_20A9DFDE0();
  v2[43] = v6;
  v2[44] = *(_QWORD *)(v6 - 8);
  v2[45] = swift_task_alloc();
  v2[46] = swift_task_alloc();
  v2[47] = swift_task_alloc();
  v2[48] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9C935C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 392) = *(_QWORD *)(*(_QWORD *)(v0 + 232) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  return swift_task_switch();
}

uint64_t sub_20A9C9380()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);

  v1 = v0[48];
  v2 = v0[43];
  v3 = v0[44];
  v4 = v0[49] + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTiming;
  swift_beginAccess();
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[50] = v5;
  v5(v1, v4, v2);
  return swift_task_switch();
}

uint64_t sub_20A9C940C()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  unsigned int *v10;
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

  v1 = sub_20A9DFD68();
  v2 = *(_QWORD *)(v0 + 384);
  if ((v1 & 1) != 0)
  {
    v3 = *(_QWORD *)(v0 + 344);
    v4 = *(_QWORD *)(v0 + 352);
    v6 = *(_QWORD *)(v0 + 328);
    v5 = *(_QWORD *)(v0 + 336);
    v7 = *(_QWORD *)(v0 + 320);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 232) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(*(_QWORD *)(v0 + 232) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v5, *MEMORY[0x24BE1F7C8], v7);
    sub_20A9DFFB4();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v9 = sub_20A9DFDBC();
    v10 = (unsigned int *)MEMORY[0x24BE1F7C8];
    if ((v9 & 1) == 0)
    {
      v12 = *(_QWORD *)(v0 + 328);
      v11 = *(_QWORD *)(v0 + 336);
      v13 = *(_QWORD *)(v0 + 320);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 232) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(*(_QWORD *)(v0 + 232) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v12 + 104))(v11, *v10, v13);
      sub_20A9DFFB4();
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    }
    if ((sub_20A9DFD08() & 1) != 0)
    {
      v15 = *(_QWORD *)(v0 + 328);
      v14 = *(_QWORD *)(v0 + 336);
      v17 = *(_QWORD *)(v0 + 312);
      v16 = *(_QWORD *)(v0 + 320);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 232) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(*(_QWORD *)(v0 + 232) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v15 + 104))(v14, *v10, v16);
      sub_20A9DFF90();
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 5, 5, v18);
    }
    else
    {
      v19 = *(_QWORD *)(v0 + 312);
      *(_QWORD *)(v0 + 408) = swift_allocBox();
      *(_QWORD *)(v0 + 416) = v20;
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v19, 5, 5, v21);
    }
    return swift_task_switch();
  }
}

uint64_t sub_20A9C9714()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 312);
  sub_20A9DE440(v1);
  sub_20A9D80D0(v1, type metadata accessor for ODISessionStateMachine.ApplyTimingCase);
  return swift_task_switch();
}

uint64_t sub_20A9C9778()
{
  uint64_t v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 400))(*(_QWORD *)(v0 + 376), *(_QWORD *)(v0 + 416), *(_QWORD *)(v0 + 344));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 424) = v1;
  *v1 = v0;
  v1[1] = sub_20A9C97DC;
  return sub_20A9D01D4(*(_QWORD *)(v0 + 376), *(_QWORD *)(v0 + 224));
}

uint64_t sub_20A9C97DC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  _QWORD *v6;
  uint64_t v8;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 376);
  v3 = *(_QWORD *)(*v0 + 344);
  v4 = *(_QWORD *)(*v0 + 352);
  v8 = *v0;
  swift_task_dealloc();
  v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  *(_QWORD *)(v1 + 432) = v5;
  v5(v2, v3);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 440) = v6;
  *v6 = v8;
  v6[1] = sub_20A9C9864;
  return sub_20A9D0A50();
}

uint64_t sub_20A9C9864()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9C98BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double *v17;
  double *v18;
  uint64_t v19;
  char v20;
  double v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  _QWORD *v34;
  uint64_t (*v35)();
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t, uint64_t);
  int v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t (*v54)();
  uint64_t *v55;
  uint64_t *v56;
  int v57;
  void (*v58)(uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t, uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(uint64_t, uint64_t);
  uint64_t v78;

  v2 = *(_QWORD *)(v0 + 224);
  v1 = *(_QWORD *)(v0 + 232);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__lastAssessmentTimedOut) == 1 && v2 == 0)
  {
    v8 = *(_QWORD *)(v0 + 328);
    v7 = *(_QWORD *)(v0 + 336);
    v9 = *(_QWORD *)(v0 + 320);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 104))(v7, *MEMORY[0x24BE1F7C8], v9);
    sub_20A9DFF90();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    goto LABEL_10;
  }
  switch(v2)
  {
    case 0:
      v44 = *(_QWORD *)(v0 + 328);
      v43 = *(_QWORD *)(v0 + 336);
      v45 = *(_QWORD *)(v0 + 320);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v44 + 104))(v43, *MEMORY[0x24BE1F7C8], v45);
      sub_20A9DFF90();
      v46 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
      *(_QWORD *)(v0 + 448) = v46;
      v46(v43, v45);
      v47 = *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask);
      *(_QWORD *)(v0 + 456) = v47;
      if (v47)
      {
        swift_retain();
        v34 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 464) = v34;
        __swift_instantiateConcreteTypeFromMangledName(&qword_254611D98);
        v35 = sub_20A9CA2D4;
        goto LABEL_21;
      }
      v67 = *(_QWORD *)(*(_QWORD *)(v0 + 232) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
      *(_QWORD *)(v0 + 480) = v67;
      if (!v67)
        goto LABEL_32;
      v69 = *(_QWORD *)(v0 + 296);
      v68 = *(_QWORD *)(v0 + 304);
      v70 = *(_QWORD *)(v0 + 288);
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 400))(*(_QWORD *)(v0 + 376), *(_QWORD *)(v0 + 416), *(_QWORD *)(v0 + 344));
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v69 + 104))(v68, *MEMORY[0x24BE1F598], v70);
      swift_retain();
      return swift_task_switch();
    case 2:
LABEL_10:
      sub_20A9DFABC();
      if (MEMORY[0x20BD290D4]())
      {
        v10 = *(_QWORD *)(v0 + 416);
        v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 400);
        v12 = *(_QWORD *)(v0 + 368);
        v13 = *(_QWORD *)(v0 + 344);
        v14 = *(_QWORD *)(v0 + 280);
        v75 = *(_QWORD *)(v0 + 272);
        v78 = *(_QWORD *)(v0 + 264);
        v71 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
        v15 = sub_20A9E0044();
        sub_20A9BA454(&qword_254612058, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F790], MEMORY[0x24BE1F798]);
        v16 = (void *)swift_allocError();
        v18 = v17;
        v11(v12, v10, v13);
        v19 = sub_20A9DFD98();
        LOBYTE(v11) = v20;
        v71(v12, v13);
        v21 = *(double *)&v19;
        if ((v11 & 1) != 0)
          v21 = 0.0;
        *v18 = v21;
        (*(void (**)(double *, _QWORD, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v18, *MEMORY[0x24BE1F780], v15);
        sub_20A9E00E0();
        sub_20A9DFA5C();
        sub_20A9DFAA4();
        swift_release();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v14, v78);

      }
      v22 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
      v23 = *(_QWORD *)(v0 + 360);
      v24 = *(_QWORD *)(v0 + 344);
      v25 = *(_QWORD *)(v0 + 232);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 400))(v23, *(_QWORD *)(v0 + 416), v24);
      sub_20A9DFDC8();
      v27 = v26;
      v22(v23, v24);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v25 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(v25 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
      v28 = *(_QWORD *)(v0 + 328);
      v29 = *(_QWORD *)(v0 + 336);
      v30 = *(_QWORD *)(v0 + 320);
      if ((v27 & 1) != 0)
      {
        v36 = *(_QWORD *)(v0 + 256);
        v73 = *(_QWORD *)(v0 + 232);
        sub_20A9E026C();
        *(_QWORD *)(v0 + 192) = 0;
        *(_QWORD *)(v0 + 200) = 0xE000000000000000;
        sub_20A9E0110();
        sub_20A9E01F4();
        sub_20A9E0110();
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v28 + 104))(v29, *MEMORY[0x24BE1F7C8], v30);
        sub_20A9DFF9C();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v29, v30);
        v37 = v73 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__pendingFeedback;
        swift_beginAccess();
        sub_20A9D8A70(v37, v36, &qword_254611E68);
        v38 = type metadata accessor for ODISessionInternal.PendingFeedback(0);
        v39 = *(_QWORD *)(v38 - 8);
        v40 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 48);
        v41 = v40(v36, 1, v38);
        v42 = *(_QWORD **)(v0 + 256);
        if (v41 || !*v42)
        {
          sub_20A9C16D4(*(_QWORD *)(v0 + 256), &qword_254611E68);
        }
        else
        {
          swift_retain();
          sub_20A9C16D4((uint64_t)v42, &qword_254611E68);
          __swift_instantiateConcreteTypeFromMangledName(&qword_254611D98);
          sub_20A9E01AC();
          swift_release();
        }
        v53 = *(char **)(v0 + 248);
        (*(void (**)(char *, _QWORD, _QWORD))(v0 + 400))(&v53[*(int *)(v38 + 20)], *(_QWORD *)(v0 + 416), *(_QWORD *)(v0 + 344));
        *(_QWORD *)v53 = 0;
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v39 + 56))(v53, 0, 1, v38);
        swift_beginAccess();
        sub_20A9D8088((uint64_t)v53, v37);
        swift_endAccess();
        v54 = sub_20A9C4A64();
        v56 = v55;
        v57 = v40((uint64_t)v55, 1, v38);
        v58 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
        v59 = *(_QWORD *)(v0 + 408);
        v60 = *(_QWORD *)(v0 + 384);
        v61 = *(_QWORD *)(v0 + 344);
        if (!v57)
        {
          v62 = *(_QWORD *)(v0 + 232);
          v63 = *(_QWORD *)(v0 + 240);
          v76 = v63;
          v64 = sub_20A9E0194();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 56))(v63, 1, 1, v64);
          v65 = sub_20A9BA454(&qword_254611CD8, type metadata accessor for ODISessionInternal, (uint64_t)&protocol conformance descriptor for ODISessionInternal);
          v66 = (_QWORD *)swift_allocObject();
          v66[2] = v62;
          v66[3] = v65;
          v66[4] = v62;
          v66[5] = v59;
          swift_retain_n();
          swift_retain();
          *v56 = sub_20A9C3FF4(v76, (uint64_t)&unk_2546120B0, (uint64_t)v66);
          swift_release();
        }
        ((void (*)(uint64_t, _QWORD))v54)(v0 + 16, 0);
        v58(v60, v61);
        goto LABEL_33;
      }
      v31 = *(_QWORD *)(v0 + 232);
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v28 + 104))(*(_QWORD *)(v0 + 336), *MEMORY[0x24BE1F7C8], *(_QWORD *)(v0 + 320));
      sub_20A9DFF9C();
      v32 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
      *(_QWORD *)(v0 + 512) = v32;
      v32(v29, v30);
      v33 = *(_QWORD *)(v31 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask);
      *(_QWORD *)(v0 + 520) = v33;
      if (v33)
      {
        swift_retain();
        v34 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 528) = v34;
        __swift_instantiateConcreteTypeFromMangledName(&qword_254611D98);
        v35 = sub_20A9CA75C;
LABEL_21:
        *v34 = v0;
        v34[1] = v35;
        return sub_20A9E01A0();
      }
      v49 = *(_QWORD *)(*(_QWORD *)(v0 + 232) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
      *(_QWORD *)(v0 + 544) = v49;
      if (!v49)
        goto LABEL_32;
      v51 = *(_QWORD *)(v0 + 296);
      v50 = *(_QWORD *)(v0 + 304);
      v52 = *(_QWORD *)(v0 + 288);
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 400))(*(_QWORD *)(v0 + 376), *(_QWORD *)(v0 + 416), *(_QWORD *)(v0 + 344));
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v51 + 104))(v50, *MEMORY[0x24BE1F590], v52);
      swift_retain();
      return swift_task_switch();
    case 1:
LABEL_32:
      (*(void (**)(_QWORD, _QWORD))(v0 + 432))(*(_QWORD *)(v0 + 384), *(_QWORD *)(v0 + 344));
      goto LABEL_33;
  }
  v74 = *(_QWORD *)(v0 + 384);
  v77 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
  v4 = *(_QWORD *)(v0 + 336);
  v6 = *(_QWORD *)(v0 + 320);
  v5 = *(_QWORD *)(v0 + 328);
  v72 = *(_QWORD *)(v0 + 344);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 208) = v2;
  sub_20A9E0308();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v4, *MEMORY[0x24BE1F7C8], v6);
  sub_20A9DFFB4();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v77(v74, v72);
LABEL_33:
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9CA2D4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 472) = v0;
  swift_task_dealloc();
  if (v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9CA348()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_release();
  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 232) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
  *(_QWORD *)(v0 + 480) = v1;
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 296);
    v2 = *(_QWORD *)(v0 + 304);
    v4 = *(_QWORD *)(v0 + 288);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 400))(*(_QWORD *)(v0 + 376), *(_QWORD *)(v0 + 416), *(_QWORD *)(v0 + 344));
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, *MEMORY[0x24BE1F598], v4);
    swift_retain();
    return swift_task_switch();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0 + 432))(*(_QWORD *)(v0 + 384), *(_QWORD *)(v0 + 344));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20A9CA4B0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(*(_QWORD *)(v0 + 392) + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_feedbackTracker);
  swift_beginAccess();
  *(_QWORD *)(v0 + 488) = *v1;
  swift_bridgeObjectRetain();
  return swift_task_switch();
}

uint64_t sub_20A9CA518()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t);

  v1 = (uint64_t *)(v0[29] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnAtorSessionId);
  v2 = *v1;
  v3 = v1[1];
  v0[62] = v3;
  v6 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))((int)*MEMORY[0x24BE1F2D8] + MEMORY[0x24BE1F2D8]);
  swift_bridgeObjectRetain();
  v4 = (_QWORD *)swift_task_alloc();
  v0[63] = v4;
  *v4 = v0;
  v4[1] = sub_20A9CA5BC;
  return v6(v0[47], v0[38], v0[61], v2, v3);
}

uint64_t sub_20A9CA5BC()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)v0 + 432);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 376);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 344);
  v5 = *(_QWORD *)(*(_QWORD *)v0 + 296);
  v4 = *(_QWORD *)(*(_QWORD *)v0 + 304);
  v6 = *(_QWORD *)(*(_QWORD *)v0 + 288);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v1(v2, v3);
  return swift_task_switch();
}

uint64_t sub_20A9CA684()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(v0 + 432))(*(_QWORD *)(v0 + 384), *(_QWORD *)(v0 + 344));
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9CA75C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 536) = v0;
  swift_task_dealloc();
  if (v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9CA7D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_release();
  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 232) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
  *(_QWORD *)(v0 + 544) = v1;
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 296);
    v2 = *(_QWORD *)(v0 + 304);
    v4 = *(_QWORD *)(v0 + 288);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 400))(*(_QWORD *)(v0 + 376), *(_QWORD *)(v0 + 416), *(_QWORD *)(v0 + 344));
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, *MEMORY[0x24BE1F590], v4);
    swift_retain();
    return swift_task_switch();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0 + 432))(*(_QWORD *)(v0 + 384), *(_QWORD *)(v0 + 344));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20A9CA938()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(*(_QWORD *)(v0 + 392) + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_feedbackTracker);
  swift_beginAccess();
  *(_QWORD *)(v0 + 552) = *v1;
  swift_bridgeObjectRetain();
  return swift_task_switch();
}

uint64_t sub_20A9CA9A0()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t);

  v1 = (uint64_t *)(v0[29] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnAtorSessionId);
  v2 = *v1;
  v3 = v1[1];
  v0[70] = v3;
  v6 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))((int)*MEMORY[0x24BE1F2D8] + MEMORY[0x24BE1F2D8]);
  swift_bridgeObjectRetain();
  v4 = (_QWORD *)swift_task_alloc();
  v0[71] = v4;
  *v4 = v0;
  v4[1] = sub_20A9CAA44;
  return v6(v0[47], v0[38], v0[69], v2, v3);
}

uint64_t sub_20A9CAA44()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)v0 + 432);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 376);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 344);
  v5 = *(_QWORD *)(*(_QWORD *)v0 + 296);
  v4 = *(_QWORD *)(*(_QWORD *)v0 + 304);
  v6 = *(_QWORD *)(*(_QWORD *)v0 + 288);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v1(v2, v3);
  return swift_task_switch();
}

uint64_t sub_20A9CAB14()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v1 = v0[47];
  v2 = v0[43];
  v3 = v0[44];
  v4 = v0[39];
  sub_20A9DE440(v4);
  sub_20A9D80D0(v4, type metadata accessor for ODISessionStateMachine.ApplyTimingCase);
  v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[72] = v5;
  v5(v1, v2);
  return swift_task_switch();
}

uint64_t sub_20A9CAB9C()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(v0 + 576))(*(_QWORD *)(v0 + 384), *(_QWORD *)(v0 + 344));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9CAC68()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t, uint64_t);

  v1 = *(void **)(v0 + 472);
  v9 = *(void (**)(uint64_t, uint64_t))(v0 + 448);
  v10 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
  v2 = *(_QWORD *)(v0 + 336);
  v7 = *(_QWORD *)(v0 + 344);
  v8 = *(_QWORD *)(v0 + 384);
  v3 = *(_QWORD *)(v0 + 320);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 232) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(*(_QWORD *)(v0 + 232) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_20A9E035C();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  v4 = *MEMORY[0x24BE1F7F0];
  v5 = sub_20A9E0050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(v2, v4, v5);
  sub_20A9E0014();
  swift_bridgeObjectRelease();

  v9(v2, v3);
  v10(v8, v7);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9CAE5C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t, uint64_t);

  v1 = *(void **)(v0 + 536);
  v9 = *(void (**)(uint64_t, uint64_t))(v0 + 512);
  v10 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
  v2 = *(_QWORD *)(v0 + 336);
  v7 = *(_QWORD *)(v0 + 344);
  v8 = *(_QWORD *)(v0 + 384);
  v3 = *(_QWORD *)(v0 + 320);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 232) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(*(_QWORD *)(v0 + 232) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_20A9E035C();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  v4 = *MEMORY[0x24BE1F7F0];
  v5 = sub_20A9E0050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(v2, v4, v5);
  sub_20A9E0014();
  swift_bridgeObjectRelease();

  v9(v2, v3);
  v10(v8, v7);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9CB050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[14] = a4;
  v5 = sub_20A9DFE10();
  v4[15] = v5;
  v4[16] = *(_QWORD *)(v5 - 8);
  v4[17] = swift_task_alloc();
  v6 = sub_20A9DFDE0();
  v4[18] = v6;
  v4[19] = *(_QWORD *)(v6 - 8);
  v4[20] = swift_task_alloc();
  v7 = sub_20A9E0050();
  v4[21] = v7;
  v4[22] = *(_QWORD *)(v7 - 8);
  v4[23] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611E68);
  v4[24] = swift_task_alloc();
  v4[25] = swift_projectBox();
  return swift_task_switch();
}

uint64_t sub_20A9CB138()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 208) = v1;
  *v1 = v0;
  v1[1] = sub_20A9CB18C;
  return sub_20A9E01D0();
}

uint64_t sub_20A9CB18C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (!v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_20A9CB228()
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
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 176);
  v2 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 168);
  v5 = *(_QWORD *)(v0 + 112);
  v6 = type metadata accessor for ODISessionInternal.PendingFeedback(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v1, 1, 1, v6);
  v7 = v5 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__pendingFeedback;
  swift_beginAccess();
  sub_20A9D8088(v1, v7);
  swift_endAccess();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(v5 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, *MEMORY[0x24BE1F7C8], v4);
  sub_20A9DFF9C();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_beginAccess();
  sub_20A9DFD5C();
  swift_endAccess();
  v8 = *(_QWORD *)(v5 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask);
  *(_QWORD *)(v0 + 216) = v8;
  if (v8)
  {
    swift_retain();
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 224) = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254611D98);
    *v9 = v0;
    v9[1] = sub_20A9CB4E4;
    return sub_20A9E01A0();
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 112);
    v12 = *(_QWORD *)(v11 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
    *(_QWORD *)(v0 + 240) = v12;
    v13 = *(_QWORD *)(v0 + 160);
    if (v12)
    {
      v14 = *(_QWORD *)(v0 + 200);
      v15 = *(_QWORD *)(v0 + 144);
      v16 = *(_QWORD *)(v0 + 152);
      v18 = *(_QWORD *)(v0 + 128);
      v17 = *(_QWORD *)(v0 + 136);
      v19 = *(_QWORD *)(v0 + 120);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v18 + 104))(v17, *MEMORY[0x24BE1F590], v19);
      *(_QWORD *)(v0 + 248) = *(_QWORD *)(v11 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
      swift_retain();
      return swift_task_switch();
    }
    else
    {
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
}

uint64_t sub_20A9CB4E4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 232) = v0;
  swift_task_dealloc();
  if (v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9CB558()
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

  swift_release();
  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
  *(_QWORD *)(v0 + 240) = v2;
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 200);
    v5 = *(_QWORD *)(v0 + 152);
    v4 = *(_QWORD *)(v0 + 160);
    v7 = *(_QWORD *)(v0 + 136);
    v6 = *(_QWORD *)(v0 + 144);
    v8 = *(_QWORD *)(v0 + 120);
    v9 = *(_QWORD *)(v0 + 128);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v3, v6);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 104))(v7, *MEMORY[0x24BE1F590], v8);
    *(_QWORD *)(v0 + 248) = *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
    swift_retain();
    return swift_task_switch();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20A9CB688()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(*(_QWORD *)(v0 + 248) + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_feedbackTracker);
  swift_beginAccess();
  *(_QWORD *)(v0 + 256) = *v1;
  swift_bridgeObjectRetain();
  return swift_task_switch();
}

uint64_t sub_20A9CB6F0()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t);

  v1 = (uint64_t *)(v0[14] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnAtorSessionId);
  v2 = *v1;
  v3 = v1[1];
  v0[33] = v3;
  v6 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))((int)*MEMORY[0x24BE1F2D8] + MEMORY[0x24BE1F2D8]);
  swift_bridgeObjectRetain();
  v4 = (_QWORD *)swift_task_alloc();
  v0[34] = v4;
  *v4 = v0;
  v4[1] = sub_20A9CB794;
  return v6(v0[20], v0[17], v0[32], v2, v3);
}

uint64_t sub_20A9CB794()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v1 = *(_QWORD *)(*v0 + 152);
  v7 = *(_QWORD *)(*v0 + 160);
  v3 = *(_QWORD *)(*v0 + 136);
  v2 = *(_QWORD *)(*v0 + 144);
  v5 = *(_QWORD *)(*v0 + 120);
  v4 = *(_QWORD *)(*v0 + 128);
  v8 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v7, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v8 + 8))();
}

uint64_t sub_20A9CB878()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9CB8D4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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

  *(_BYTE *)(v5 + 624) = a4;
  *(_QWORD *)(v5 + 104) = a3;
  *(_QWORD *)(v5 + 112) = v4;
  *(_QWORD *)(v5 + 88) = a1;
  *(_QWORD *)(v5 + 96) = a2;
  v6 = sub_20A9DFB40();
  *(_QWORD *)(v5 + 120) = v6;
  *(_QWORD *)(v5 + 128) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 + 136) = swift_task_alloc();
  type metadata accessor for ODISessionStateMachine.ApplyTimingCase(0);
  *(_QWORD *)(v5 + 144) = swift_task_alloc();
  v7 = sub_20A9DFDE0();
  *(_QWORD *)(v5 + 152) = v7;
  *(_QWORD *)(v5 + 160) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v5 + 168) = swift_task_alloc();
  v8 = sub_20A9DFE64();
  *(_QWORD *)(v5 + 176) = v8;
  *(_QWORD *)(v5 + 184) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v5 + 192) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254612060);
  *(_QWORD *)(v5 + 200) = swift_task_alloc();
  v9 = sub_20A9DFE40();
  *(_QWORD *)(v5 + 208) = v9;
  *(_QWORD *)(v5 + 216) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v5 + 224) = swift_task_alloc();
  v10 = sub_20A9DFA68();
  *(_QWORD *)(v5 + 232) = v10;
  *(_QWORD *)(v5 + 240) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v5 + 248) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C48);
  *(_QWORD *)(v5 + 256) = swift_task_alloc();
  v11 = sub_20A9DFCFC();
  *(_QWORD *)(v5 + 264) = v11;
  *(_QWORD *)(v5 + 272) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v5 + 280) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254612068);
  *(_QWORD *)(v5 + 288) = swift_task_alloc();
  *(_QWORD *)(v5 + 296) = swift_task_alloc();
  v12 = sub_20A9E0050();
  *(_QWORD *)(v5 + 304) = v12;
  *(_QWORD *)(v5 + 312) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v5 + 320) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9CBAC8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_BYTE *)(v0 + 624);
  v3 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  *(_QWORD *)(v0 + 328) = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  v21 = (_QWORD *)(v1 + v3);
  sub_20A9BF828(v1 + v3, v0 + 16);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  sub_20A9E026C();
  sub_20A9E0110();
  sub_20A9DFE58();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  sub_20A9E0110();
  if ((v2 & 1) == 0)
  {
    *(_QWORD *)(v0 + 80) = *(_QWORD *)(v0 + 104);
    sub_20A9D8554();
    sub_20A9E0224();
  }
  v4 = *(_QWORD *)(v0 + 312);
  v5 = *(_QWORD *)(v0 + 320);
  v7 = *(_QWORD *)(v0 + 296);
  v6 = *(_QWORD *)(v0 + 304);
  v8 = *(_QWORD *)(v0 + 128);
  v22 = *(_QWORD *)(v0 + 120);
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  v9 = *MEMORY[0x24BE1F7C0];
  *(_DWORD *)(v0 + 616) = v9;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 104);
  *(_QWORD *)(v0 + 336) = v10;
  v10(v5, v9, v6);
  sub_20A9DFF9C();
  swift_bridgeObjectRelease();
  v11 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  *(_QWORD *)(v0 + 344) = v11;
  v11(v5, v6);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
  *(_QWORD *)(v0 + 352) = v12;
  v12(v7, 1, 1, v22);
  if ((sub_20A9DFE58() & 1) != 0)
  {
    v13 = *(_QWORD *)(v0 + 320);
    v14 = *(_QWORD *)(v0 + 304);
    __swift_project_boxed_opaque_existential_1(v21, v21[3]);
    v10(v13, v9, v14);
    sub_20A9DFF9C();
    v11(v13, v14);
    *(_QWORD *)(v0 + 360) = sub_20A9C4AA8();
    return swift_task_switch();
  }
  else
  {
    sub_20A9E01C4();
    v16 = *(void (**)(uint64_t))(v0 + 336);
    v23 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
    v17 = *(_QWORD *)(v0 + 320);
    v18 = *(_QWORD *)(v0 + 304);
    v19 = (_QWORD *)(*(_QWORD *)(v0 + 112) + *(_QWORD *)(v0 + 328));
    __swift_project_boxed_opaque_existential_1(v19, v19[3]);
    *(_DWORD *)(v0 + 620) = *MEMORY[0x24BE1F7B0];
    v16(v17);
    sub_20A9DFF9C();
    v23(v17, v18);
    swift_retain();
    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 376) = v20;
    *v20 = v0;
    v20[1] = sub_20A9CC280;
    return sub_20A9DFAF8();
  }
}

uint64_t sub_20A9CBF4C()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 336);
  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
  v3 = *(unsigned int *)(v0 + 616);
  v4 = *(_QWORD *)(v0 + 320);
  v5 = *(_QWORD *)(v0 + 304);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 360) + 24), *(_QWORD *)(*(_QWORD *)(v0 + 360) + 48));
  v2(v4, v3, v5);
  sub_20A9DFF9C();
  v1(v4, v5);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 368) = v6;
  *v6 = v0;
  v6[1] = sub_20A9CC01C;
  return sub_20A9B78B8();
}

uint64_t sub_20A9CC01C()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9CC07C()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  void (*v7)(uint64_t, uint64_t);

  sub_20A9E01C4();
  v1 = *(void (**)(uint64_t))(v0 + 336);
  v7 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
  v2 = *(_QWORD *)(v0 + 320);
  v3 = *(_QWORD *)(v0 + 304);
  v4 = (_QWORD *)(*(_QWORD *)(v0 + 112) + *(_QWORD *)(v0 + 328));
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  *(_DWORD *)(v0 + 620) = *MEMORY[0x24BE1F7B0];
  v1(v2);
  sub_20A9DFF9C();
  v7(v2, v3);
  swift_retain();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 376) = v5;
  *v5 = v0;
  v5[1] = sub_20A9CC280;
  return sub_20A9DFAF8();
}

uint64_t sub_20A9CC280()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 384) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9CC2F0()
{
  _QWORD *v0;

  v0[49] = v0[48];
  v0[50] = *(_QWORD *)(v0[14] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__armandDataFiller);
  sub_20A9DFCC0();
  sub_20A9BA454(&qword_254611C98, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F470], MEMORY[0x24BE1F480]);
  swift_retain();
  sub_20A9E0170();
  return swift_task_switch();
}

uint64_t sub_20A9CC390()
{
  sub_20A9DFC90();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9CC3DC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[14];
  v2 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_fieldsCachingManager;
  v0[51] = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_fieldsCachingManager;
  v0[52] = *(_QWORD *)(v1 + v2);
  swift_retain();
  v3 = (_QWORD *)swift_task_alloc();
  v0[53] = v3;
  *v3 = v0;
  v3[1] = sub_20A9CC448;
  return sub_20A9D9FF0(1);
}

uint64_t sub_20A9CC448(char a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_BYTE *)(v3 + 625) = a1;
  *(_QWORD *)(v3 + 432) = a2;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9CC4B4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;

  v1 = *(_QWORD *)(v0 + 432);
  v2 = *(_BYTE *)(v0 + 625);
  v3 = *(_QWORD *)(v0 + 256);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = sub_20A9E0194();
  *(_QWORD *)(v0 + 440) = v5;
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
  *(_QWORD *)(v0 + 448) = v6;
  v6(v3, 1, 1, v5);
  v7 = sub_20A9BA454(&qword_254611CD8, type metadata accessor for ODISessionInternal, (uint64_t)&protocol conformance descriptor for ODISessionInternal);
  *(_QWORD *)(v0 + 456) = v7;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v4;
  *(_QWORD *)(v8 + 24) = v7;
  *(_BYTE *)(v8 + 32) = v2;
  *(_QWORD *)(v8 + 40) = v4;
  *(_QWORD *)(v8 + 48) = v1;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_20A9C3E64(v3, (uint64_t)&unk_254612088, v8);
  swift_release();
  sub_20A9DFCE4();
  if ((sub_20A9DFE58() & 1) != 0)
  {
    v9 = *(_QWORD *)(v0 + 392);
    sub_20A9E01C4();
    *(_QWORD *)(v0 + 464) = v9;
    if (v9)
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 272) + 8))(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 264));
LABEL_6:
      sub_20A9C16D4(*(_QWORD *)(v0 + 296), &qword_254612068);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    *(_QWORD *)(v0 + 472) = sub_20A9C4AA8();
    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 480) = v14;
    *v14 = v0;
    v14[1] = sub_20A9CC9F8;
    return sub_20A9B7E90();
  }
  else
  {
    v10 = MEMORY[0x24BEE4AF8];
    v11 = sub_20A9C73E0(MEMORY[0x24BEE4AF8]);
    v12 = *(_QWORD *)(v0 + 392);
    *(_QWORD *)(v0 + 504) = v10;
    *(_QWORD *)(v0 + 512) = v11;
    sub_20A9E01C4();
    if (v12)
    {
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 272) + 8))(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 264));
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    v15 = *(_QWORD *)(v0 + 112);
    v16 = *(_QWORD *)(v15 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask);
    *(_QWORD *)(v0 + 520) = v16;
    if (v16)
    {
      swift_retain();
      v17 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 528) = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254611D98);
      *v17 = v0;
      v17[1] = sub_20A9CD140;
      return sub_20A9E01A0();
    }
    else
    {
      v18 = *(_QWORD *)(v15 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
      *(_QWORD *)(v0 + 544) = v18;
      if (!v18)
      {
        v20 = *(_QWORD *)(v0 + 272);
        v19 = *(_QWORD *)(v0 + 280);
        v21 = *(_QWORD *)(v0 + 264);
        v23 = *(_QWORD *)(v0 + 128);
        v22 = *(_QWORD *)(v0 + 136);
        v24 = *(_QWORD *)(v0 + 120);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v23 + 104))(v22, *MEMORY[0x24BE1F278], v24);
        sub_20A9E0038();
        (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
        swift_willThrow();
        (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
        goto LABEL_6;
      }
      swift_retain();
      if ((sub_20A9DFE58() & 1) != 0)
      {
        *(_QWORD *)(v0 + 552) = *(_QWORD *)(*(_QWORD *)(v0 + 112)
                                          + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
        return swift_task_switch();
      }
      else
      {
        if ((sub_20A9DFE58() & 1) == 0)
        {
          v25 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 352);
          v26 = *(_QWORD *)(v0 + 296);
          v27 = *(_QWORD *)(v0 + 120);
          v28 = *(_QWORD *)(v0 + 128);
          sub_20A9C16D4(v26, &qword_254612068);
          (*(void (**)(uint64_t, _QWORD, uint64_t))(v28 + 104))(v26, *MEMORY[0x24BE1F298], v27);
          v25(v26, 0, 1, v27);
        }
        v29 = *(_QWORD *)(v0 + 408);
        v30 = *(_QWORD *)(v0 + 272);
        v31 = *(_QWORD *)(v0 + 264);
        v32 = *(_QWORD *)(v0 + 200);
        v33 = *(_QWORD *)(v0 + 112);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v30 + 16))(v32, *(_QWORD *)(v0 + 280), v31);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v30 + 56))(v32, 0, 1, v31);
        *(_QWORD *)(v0 + 560) = *(_QWORD *)(v33 + v29);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        v34 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 568) = v34;
        *v34 = v0;
        v34[1] = sub_20A9CD664;
        return sub_20A9D9FF0(1);
      }
    }
  }
}

uint64_t sub_20A9CC9F8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 488) = a1;
  *(_QWORD *)(v3 + 496) = a2;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9CCA60()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  unsigned int v37;
  void (*v38)(uint64_t, uint64_t);

  v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 336);
  v38 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
  v2 = *(unsigned int *)(v0 + 616);
  v37 = *(_DWORD *)(v0 + 616);
  v3 = *(_QWORD *)(v0 + 320);
  v4 = *(_QWORD *)(v0 + 304);
  v5 = (_QWORD *)(*(_QWORD *)(v0 + 112) + *(_QWORD *)(v0 + 328));
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611D28);
  sub_20A9E0080();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1(v3, v2, v4);
  sub_20A9DFFD8();
  swift_bridgeObjectRelease();
  v38(v3, v4);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  v6 = swift_bridgeObjectRetain();
  MEMORY[0x20BD29788](v6, MEMORY[0x24BEE0D00]);
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1(v3, v37, v4);
  sub_20A9DFF9C();
  swift_bridgeObjectRelease();
  v38(v3, v4);
  if (*(_QWORD *)(v6 + 16))
  {
    sub_20A9DFABC();
    if (MEMORY[0x20BD290D4]())
    {
      v7 = *(_QWORD *)(v0 + 496);
      v9 = *(_QWORD *)(v0 + 240);
      v8 = *(_QWORD *)(v0 + 248);
      v10 = *(_QWORD *)(v0 + 232);
      v11 = sub_20A9E0044();
      sub_20A9BA454(&qword_254612058, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F790], MEMORY[0x24BE1F798]);
      v12 = (void *)swift_allocError();
      *v13 = v7;
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v13, *MEMORY[0x24BE1F778], v11);
      sub_20A9E00E0();
      swift_bridgeObjectRetain();
      sub_20A9DFA5C();
      sub_20A9DFAA4();
      swift_release();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);

    }
  }
  v14 = *(_QWORD *)(v0 + 488);
  v15 = *(_QWORD *)(v0 + 464);
  *(_QWORD *)(v0 + 504) = *(_QWORD *)(v0 + 496);
  *(_QWORD *)(v0 + 512) = v14;
  sub_20A9E01C4();
  if (v15)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 272) + 8))(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 264));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_6:
    sub_20A9C16D4(*(_QWORD *)(v0 + 296), &qword_254612068);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v17 = *(_QWORD *)(v0 + 112);
  v18 = *(_QWORD *)(v17 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask);
  *(_QWORD *)(v0 + 520) = v18;
  if (v18)
  {
    swift_retain();
    v19 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 528) = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254611D98);
    *v19 = v0;
    v19[1] = sub_20A9CD140;
    return sub_20A9E01A0();
  }
  else
  {
    v20 = *(_QWORD *)(v17 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
    *(_QWORD *)(v0 + 544) = v20;
    if (!v20)
    {
      v22 = *(_QWORD *)(v0 + 272);
      v21 = *(_QWORD *)(v0 + 280);
      v23 = *(_QWORD *)(v0 + 264);
      v25 = *(_QWORD *)(v0 + 128);
      v24 = *(_QWORD *)(v0 + 136);
      v26 = *(_QWORD *)(v0 + 120);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v25 + 104))(v24, *MEMORY[0x24BE1F278], v26);
      sub_20A9E0038();
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
      swift_willThrow();
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
      goto LABEL_6;
    }
    swift_retain();
    if ((sub_20A9DFE58() & 1) != 0)
    {
      *(_QWORD *)(v0 + 552) = *(_QWORD *)(*(_QWORD *)(v0 + 112)
                                        + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
      return swift_task_switch();
    }
    else
    {
      if ((sub_20A9DFE58() & 1) == 0)
      {
        v27 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 352);
        v28 = *(_QWORD *)(v0 + 296);
        v29 = *(_QWORD *)(v0 + 120);
        v30 = *(_QWORD *)(v0 + 128);
        sub_20A9C16D4(v28, &qword_254612068);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v30 + 104))(v28, *MEMORY[0x24BE1F298], v29);
        v27(v28, 0, 1, v29);
      }
      v31 = *(_QWORD *)(v0 + 408);
      v32 = *(_QWORD *)(v0 + 272);
      v33 = *(_QWORD *)(v0 + 264);
      v34 = *(_QWORD *)(v0 + 200);
      v35 = *(_QWORD *)(v0 + 112);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v32 + 16))(v34, *(_QWORD *)(v0 + 280), v33);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v32 + 56))(v34, 0, 1, v33);
      *(_QWORD *)(v0 + 560) = *(_QWORD *)(v35 + v31);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      v36 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 568) = v36;
      *v36 = v0;
      v36[1] = sub_20A9CD664;
      return sub_20A9D9FF0(1);
    }
  }
}

uint64_t sub_20A9CD140()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 536) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

uint64_t sub_20A9CD1D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;

  swift_release();
  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 112) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
  *(_QWORD *)(v0 + 544) = v1;
  if (v1)
  {
    swift_retain();
    if ((sub_20A9DFE58() & 1) != 0)
    {
      *(_QWORD *)(v0 + 552) = *(_QWORD *)(*(_QWORD *)(v0 + 112)
                                        + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
      return swift_task_switch();
    }
    else
    {
      if ((sub_20A9DFE58() & 1) == 0)
      {
        v9 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 352);
        v10 = *(_QWORD *)(v0 + 296);
        v11 = *(_QWORD *)(v0 + 120);
        v12 = *(_QWORD *)(v0 + 128);
        sub_20A9C16D4(v10, &qword_254612068);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v12 + 104))(v10, *MEMORY[0x24BE1F298], v11);
        v9(v10, 0, 1, v11);
      }
      v13 = *(_QWORD *)(v0 + 408);
      v14 = *(_QWORD *)(v0 + 272);
      v15 = *(_QWORD *)(v0 + 264);
      v16 = *(_QWORD *)(v0 + 200);
      v17 = *(_QWORD *)(v0 + 112);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v14 + 16))(v16, *(_QWORD *)(v0 + 280), v15);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(v16, 0, 1, v15);
      *(_QWORD *)(v0 + 560) = *(_QWORD *)(v17 + v13);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      v18 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 568) = v18;
      *v18 = v0;
      v18[1] = sub_20A9CD664;
      return sub_20A9D9FF0(1);
    }
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 272);
    v3 = *(_QWORD *)(v0 + 280);
    v5 = *(_QWORD *)(v0 + 264);
    v7 = *(_QWORD *)(v0 + 128);
    v6 = *(_QWORD *)(v0 + 136);
    v8 = *(_QWORD *)(v0 + 120);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 104))(v6, *MEMORY[0x24BE1F278], v8);
    sub_20A9E0038();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    sub_20A9C16D4(*(_QWORD *)(v0 + 296), &qword_254612068);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20A9CD500()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 626) = *(_BYTE *)(*(_QWORD *)(v0 + 552)
                                  + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTriggered);
  return swift_task_switch();
}

uint64_t sub_20A9CD52C()
{
  uint64_t v0;
  unsigned int *v1;
  void (*v2)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  if (*(_BYTE *)(v0 + 626) != 1)
  {
    v1 = (unsigned int *)MEMORY[0x24BE1F2A0];
    goto LABEL_5;
  }
  if ((sub_20A9DFE58() & 1) == 0)
  {
    v1 = (unsigned int *)MEMORY[0x24BE1F298];
LABEL_5:
    v2 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v0 + 352);
    v3 = *(_QWORD *)(v0 + 296);
    v4 = *(_QWORD *)(v0 + 120);
    v5 = *(_QWORD *)(v0 + 128);
    sub_20A9C16D4(v3, &qword_254612068);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v3, *v1, v4);
    v2(v3, 0, 1, v4);
  }
  v6 = *(_QWORD *)(v0 + 408);
  v7 = *(_QWORD *)(v0 + 272);
  v8 = *(_QWORD *)(v0 + 264);
  v9 = *(_QWORD *)(v0 + 200);
  v10 = *(_QWORD *)(v0 + 112);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 16))(v9, *(_QWORD *)(v0 + 280), v8);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v8);
  *(_QWORD *)(v0 + 560) = *(_QWORD *)(v10 + v6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 568) = v11;
  *v11 = v0;
  v11[1] = sub_20A9CD664;
  return sub_20A9D9FF0(1);
}

uint64_t sub_20A9CD664(char a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_BYTE *)(v3 + 627) = a1;
  *(_QWORD *)(v3 + 576) = a2;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9CD6D4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(_QWORD, _QWORD);

  v1 = *(_QWORD *)(v0 + 576);
  v2 = *(_BYTE *)(v0 + 627);
  v3 = *(_QWORD *)(v0 + 456);
  v4 = *(_QWORD *)(v0 + 288);
  v5 = *(_QWORD *)(v0 + 256);
  v14 = *(_QWORD *)(v0 + 296);
  v6 = *(_QWORD *)(v0 + 192);
  v12 = *(_QWORD *)(v0 + 184);
  v13 = *(_QWORD *)(v0 + 176);
  v7 = *(_QWORD *)(v0 + 112);
  v8 = *(_QWORD *)(v0 + 96);
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v0 + 448))(v5, 1, 1, *(_QWORD *)(v0 + 440));
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  *(_QWORD *)(v9 + 24) = v3;
  *(_BYTE *)(v9 + 32) = v2;
  *(_QWORD *)(v9 + 40) = v7;
  *(_QWORD *)(v9 + 48) = v1;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_20A9C3E64(v5, (uint64_t)&unk_254612090, v9);
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v6, v8, v13);
  sub_20A9D8A70(v14, v4, &qword_254612068);
  sub_20A9DFE34();
  v15 = (uint64_t (*)(_QWORD, _QWORD))((int)*MEMORY[0x24BE1F2E8] + MEMORY[0x24BE1F2E8]);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 584) = v10;
  *v10 = v0;
  v10[1] = sub_20A9CD844;
  return v15(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 224));
}

uint64_t sub_20A9CD844()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 592) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_20A9CD8C0()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[64];
  v0[75] = *(_QWORD *)(v0[14] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  v0[76] = sub_20A9D6D74(v1);
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_20A9CD920()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0[76];
  v2 = v0[63];
  v3 = v0[20];
  v4 = v0[21];
  v6 = v0[18];
  v5 = v0[19];
  v7 = v0[11];
  sub_20A9DFEF4();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 0, 5, v8);
  sub_20A9DE440(v6);
  sub_20A9D80D0(v6, type metadata accessor for ODISessionStateMachine.ApplyTimingCase);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  sub_20A9DD350(*(_QWORD *)(v2 + 16), *(_QWORD *)(v1 + 16), 0, v7);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_20A9CDA1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 296);
  v2 = *(_QWORD *)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 280);
  v4 = *(_QWORD *)(v0 + 264);
  v5 = *(_QWORD *)(v0 + 216);
  v6 = *(_QWORD *)(v0 + 224);
  v7 = *(_QWORD *)(v0 + 208);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v4);
  sub_20A9C16D4(v1, &qword_254612068);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9CDB3C()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  void (*v11)(uint64_t, uint64_t);

  v1 = (_QWORD *)v0;
  v2 = *(void **)(v0 + 384);
  v3 = *(unsigned int *)(v0 + 620);
  v11 = *(void (**)(uint64_t, uint64_t))(v0 + 344);
  v5 = v0 + 328;
  v4 = *(_QWORD *)(v0 + 328);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 8);
  v6 = v1[40];
  v7 = v1[38];
  v8 = v1[14];
  swift_release();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v8 + v4), *(_QWORD *)(v8 + v4 + 24));
  sub_20A9E026C();
  v1[7] = 0;
  v1[8] = 0xE000000000000000;
  sub_20A9E0110();
  v1[9] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611D98);
  sub_20A9E02CC();
  v10(v6, v3, v7);
  sub_20A9DFFA8();
  swift_bridgeObjectRelease();
  v11(v6, v7);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v8 + v4), *(_QWORD *)(v8 + v4 + 24));
  v10(v6, v3, v7);
  sub_20A9DFF90();

  v11(v6, v7);
  v1[49] = 0;
  v1[50] = *(_QWORD *)(v1[14] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__armandDataFiller);
  sub_20A9DFCC0();
  sub_20A9BA454(&qword_254611C98, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F470], MEMORY[0x24BE1F480]);
  swift_retain();
  sub_20A9E0170();
  return swift_task_switch();
}

uint64_t sub_20A9CDD68()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 272) + 8))(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 264));
  sub_20A9C16D4(*(_QWORD *)(v0 + 296), &qword_254612068);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9CDE64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 272);
  v1 = *(_QWORD *)(v0 + 280);
  v3 = *(_QWORD *)(v0 + 264);
  v5 = *(_QWORD *)(v0 + 216);
  v4 = *(_QWORD *)(v0 + 224);
  v6 = *(_QWORD *)(v0 + 208);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_20A9C16D4(*(_QWORD *)(v0 + 296), &qword_254612068);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9CDF88()
{
  uint64_t v0;

  return sub_20A9D8598(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_20A9CDF94()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_20A9C1758;
  return sub_20A9D5268();
}

uint64_t sub_20A9CDFDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
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

  v5[19] = a4;
  v5[20] = v4;
  v5[17] = a2;
  v5[18] = a3;
  v5[16] = a1;
  v6 = sub_20A9DFF3C();
  v5[21] = v6;
  v5[22] = *(_QWORD *)(v6 - 8);
  v5[23] = swift_task_alloc();
  v7 = sub_20A9DFB7C();
  v5[24] = v7;
  v5[25] = *(_QWORD *)(v7 - 8);
  v5[26] = swift_task_alloc();
  v8 = sub_20A9DFA68();
  v5[27] = v8;
  v5[28] = *(_QWORD *)(v8 - 8);
  v5[29] = swift_task_alloc();
  v9 = sub_20A9DFB40();
  v5[30] = v9;
  v5[31] = *(_QWORD *)(v9 - 8);
  v5[32] = swift_task_alloc();
  type metadata accessor for ODISessionStateMachine.ApplyTimingCase(0);
  v5[33] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254612038);
  v5[34] = swift_task_alloc();
  v10 = sub_20A9DFB28();
  v5[35] = v10;
  v5[36] = *(_QWORD *)(v10 - 8);
  v5[37] = swift_task_alloc();
  v11 = sub_20A9DFE64();
  v5[38] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v5[39] = v12;
  v5[40] = *(_QWORD *)(v12 + 64);
  v5[41] = swift_task_alloc();
  v13 = sub_20A9DFF18();
  v5[42] = v13;
  v5[43] = *(_QWORD *)(v13 - 8);
  v5[44] = swift_task_alloc();
  v5[45] = swift_task_alloc();
  v5[46] = swift_task_alloc();
  v5[47] = swift_task_alloc();
  v14 = sub_20A9E0050();
  v5[48] = v14;
  v5[49] = *(_QWORD *)(v14 - 8);
  v5[50] = swift_task_alloc();
  v15 = sub_20A9DFDE0();
  v5[51] = v15;
  v5[52] = *(_QWORD *)(v15 - 8);
  v5[53] = swift_task_alloc();
  v5[54] = swift_task_alloc();
  v5[55] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9CE210()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 448) = *(_QWORD *)(*(_QWORD *)(v0 + 160) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  return swift_task_switch();
}

uint64_t sub_20A9CE234()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v2 = v0[55];
  v1 = v0[56];
  v3 = v0[51];
  v4 = v0[52];
  v5 = OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTiming;
  v0[57] = OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTiming;
  v6 = v1 + v5;
  swift_beginAccess();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[58] = v7;
  v7(v2, v6, v3);
  return swift_task_switch();
}

uint64_t sub_20A9CE2C4()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t result;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  void (*v25)(uint64_t);
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 464);
  v2 = *(_QWORD *)(v0 + 432);
  v3 = *(_QWORD *)(v0 + 440);
  v4 = *(_QWORD *)(v0 + 408);
  v5 = sub_20A9DFDB0();
  v1(v2, v3, v4);
  v6 = *(_QWORD *)(v0 + 432);
  v7 = *(_QWORD *)(v0 + 408);
  v8 = *(_QWORD *)(v0 + 416);
  if ((v5 & 1) != 0)
  {
    v9 = sub_20A9DFD68();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    if ((v9 & 1) == 0)
    {
      v11 = *(_QWORD *)(v0 + 392);
      v10 = *(_QWORD *)(v0 + 400);
      v12 = *(_QWORD *)(v0 + 384);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 160) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(*(_QWORD *)(v0 + 160) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v11 + 104))(v10, *MEMORY[0x24BE1F7A0], v12);
      sub_20A9DFFB4();
      (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    }
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v8 + 8))(*(_QWORD *)(v0 + 432), *(_QWORD *)(v0 + 408));
  }
  v13 = *(double *)(*(_QWORD *)(v0 + 160) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_profileSla);
  result = sub_20A9DFD74();
  v16 = v13 - v15;
  v17 = v16 * 1000000000.0;
  v18 = v16 > 0.5;
  v19 = 500000000.0;
  if (v18)
    v19 = v17;
  if ((~*(_QWORD *)&v19 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v19 <= -1.0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v19 < 1.84467441e19)
  {
    v20 = *(_QWORD *)(v0 + 392);
    v21 = *(_QWORD *)(v0 + 400);
    v22 = *(_QWORD *)(v0 + 384);
    v36 = *(_QWORD *)(v0 + 328);
    v37 = *(_QWORD *)(v0 + 320);
    v34 = *(_QWORD *)(v0 + 312);
    v35 = *(_QWORD *)(v0 + 304);
    v38 = *(_QWORD *)(v0 + 160);
    v32 = (unint64_t)v19;
    v33 = *(_QWORD *)(v0 + 136);
    v23 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
    *(_QWORD *)(v0 + 472) = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
    v24 = (_QWORD *)(v38 + v23);
    __swift_project_boxed_opaque_existential_1(v24, v24[3]);
    sub_20A9E026C();
    sub_20A9E0110();
    sub_20A9DFE58();
    sub_20A9E0110();
    swift_bridgeObjectRelease();
    sub_20A9E0110();
    *(_DWORD *)(v0 + 616) = *MEMORY[0x24BE1F7E0];
    v25 = *(void (**)(uint64_t))(v20 + 104);
    *(_QWORD *)(v0 + 480) = v25;
    v25(v21);
    sub_20A9DFF90();
    swift_bridgeObjectRelease();
    v26 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    *(_QWORD *)(v0 + 488) = v26;
    v26(v21, v22);
    __swift_project_boxed_opaque_existential_1(v24, v24[3]);
    sub_20A9E026C();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 104) = v32;
    sub_20A9E0308();
    sub_20A9E0110();
    swift_bridgeObjectRelease();
    v27 = *MEMORY[0x24BE1F7F0];
    *(_DWORD *)(v0 + 620) = v27;
    v28 = sub_20A9E0050();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 104))(v21, v27, v28);
    sub_20A9DFFF0();
    swift_bridgeObjectRelease();
    v26(v21, v22);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v36, v33, v35);
    v29 = (*(unsigned __int8 *)(v34 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
    v30 = swift_allocObject();
    *(_QWORD *)(v0 + 496) = v30;
    *(_QWORD *)(v30 + 16) = v38;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v34 + 32))(v30 + v29, v36, v35);
    *(_QWORD *)(v30 + ((v37 + v29 + 7) & 0xFFFFFFFFFFFFFFF8)) = v32;
    swift_retain();
    v31 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 504) = v31;
    *v31 = v0;
    v31[1] = sub_20A9CE75C;
    return sub_20A9DFAF8();
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_20A9CE75C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 512) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9CE7D0()
{
  uint64_t v0;
  void (*v1)(uint64_t, _QWORD, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = *(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 480);
  v12 = *(_QWORD *)(v0 + 416);
  v2 = *(_QWORD *)(v0 + 400);
  v14 = *(_QWORD *)(v0 + 408);
  v15 = *(_QWORD *)(v0 + 440);
  v3 = *(_QWORD *)(v0 + 384);
  v13 = *(_QWORD *)(v0 + 344);
  v16 = *(_QWORD *)(v0 + 336);
  v4 = *(_QWORD *)(v0 + 288);
  v8 = *(void (**)(uint64_t, uint64_t))(v0 + 488);
  v9 = *(_QWORD *)(v0 + 296);
  v10 = *(_QWORD *)(v0 + 376);
  v5 = *(_QWORD *)(v0 + 280);
  v11 = *(_QWORD *)(v0 + 128);
  v6 = (_QWORD *)(*(_QWORD *)(v0 + 160) + *(_QWORD *)(v0 + 472));
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v1(v2, *MEMORY[0x24BE1F7D0], v3);
  sub_20A9DFF90();
  v8(v2, v3);
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v9, *MEMORY[0x24BE1F240], v5);
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  sub_20A9E00E0();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  sub_20A9E0110();
  sub_20A9DFEE8();
  sub_20A9DFFCC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v9, v5);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v14);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(v11, v10, v16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9CEAB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void (*v8)(uint64_t, _QWORD, uint64_t);
  void (*v9)(uint64_t, uint64_t);

  v1 = v0[64];
  v2 = v0[59];
  v8 = (void (*)(uint64_t, _QWORD, uint64_t))v0[60];
  v9 = (void (*)(uint64_t, uint64_t))v0[61];
  v3 = v0[50];
  v4 = v0[48];
  v5 = v0[20];
  swift_release();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 + v2), *(_QWORD *)(v5 + v2 + 24));
  sub_20A9E026C();
  v0[8] = 0;
  v0[9] = 0xE000000000000000;
  sub_20A9E0110();
  v0[12] = v1;
  v0[65] = __swift_instantiateConcreteTypeFromMangledName(&qword_254611D98);
  sub_20A9E02CC();
  v8(v3, *MEMORY[0x24BE1F7D0], v4);
  sub_20A9DFFA8();
  swift_bridgeObjectRelease();
  v9(v3, v4);
  v0[66] = sub_20A9C4AA8();
  v6 = (_QWORD *)swift_task_alloc();
  v0[67] = v6;
  *v6 = v0;
  v6[1] = sub_20A9CEC30;
  return sub_20A9B7E90();
}

uint64_t sub_20A9CEC30(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 544) = a1;
  *(_QWORD *)(v3 + 552) = a2;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9CECA0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[20];
  v2 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator;
  v0[70] = OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator;
  v3 = *(_QWORD *)(v1 + v2);
  v0[71] = v3;
  if (v3)
  {
    sub_20A9DFB70();
    sub_20A9BA454(&qword_254612050, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F2F8], MEMORY[0x24BE1F308]);
    swift_retain();
    sub_20A9E0170();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v4 = v0[34];
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v0[43] + 56))(v4, 1, 1, v0[42]);
    sub_20A9C16D4(v4, &qword_254612038);
  }
  return swift_task_switch();
}

uint64_t sub_20A9CED94()
{
  sub_20A9DFB64();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9CEE48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(_QWORD *)(v0 + 368);
  v2 = *(_QWORD *)(v0 + 336);
  v3 = *(_QWORD *)(v0 + 344);
  v4 = *(_QWORD *)(v0 + 272);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(v4, 0, 1, v2);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32);
  v5(v1, v4, v2);
  if ((sub_20A9DFEDC() & 1) != 0)
  {
    v6 = *(void **)(v0 + 512);
    v7 = *(unsigned int *)(v0 + 620);
    v14 = *(_QWORD *)(v0 + 416);
    v15 = *(void (**)(uint64_t, uint64_t))(v0 + 488);
    v8 = *(_QWORD *)(v0 + 400);
    v16 = *(_QWORD *)(v0 + 408);
    v17 = *(_QWORD *)(v0 + 440);
    v9 = *(_QWORD *)(v0 + 384);
    v18 = *(_QWORD *)(v0 + 336);
    v19 = *(_QWORD *)(v0 + 368);
    v10 = *(_QWORD *)(v0 + 128);
    v11 = (_QWORD *)(*(_QWORD *)(v0 + 160) + *(_QWORD *)(v0 + 472));
    __swift_project_boxed_opaque_existential_1(v11, v11[3]);
    v12 = sub_20A9E0050();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(v8, v7, v12);
    sub_20A9DFFF0();

    v15(v8, v9);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v17, v16);
    v5(v10, v19, v18);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 344) + 8))(*(_QWORD *)(v0 + 368), *(_QWORD *)(v0 + 336));
    return swift_task_switch();
  }
}

uint64_t sub_20A9CF098()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  char v7;

  v1 = v0[56];
  if ((*(_BYTE *)(v1 + 136) & 1) == 0)
  {
    v3 = v0[43];
    v2 = v0[44];
    v4 = v0[42];
    v5 = v1 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_partialAssessment;
    swift_beginAccess();
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v6(v2, v5, v4);
    v7 = sub_20A9DFEDC();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    if ((v7 & 1) != 0)
      v6(v0[45], v5, v0[42]);
  }
  return swift_task_switch();
}

uint64_t sub_20A9CF164()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(unsigned int *)(v0 + 620);
  v2 = *(void (**)(uint64_t, uint64_t))(v0 + 488);
  v3 = *(_QWORD *)(v0 + 400);
  v4 = *(_QWORD *)(v0 + 384);
  v5 = *(_QWORD *)(v0 + 264);
  v6 = (_QWORD *)(*(_QWORD *)(v0 + 160) + *(_QWORD *)(v0 + 472));
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 344) + 32))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 336));
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v7 = sub_20A9E0050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v3, v1, v7);
  sub_20A9DFFF0();
  v2(v3, v4);
  sub_20A9DFEF4();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 0, 5, v8);
  return swift_task_switch();
}

uint64_t sub_20A9CF298()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v2 = v0[52];
  v1 = v0[53];
  v3 = v0[51];
  v4 = v0[33];
  sub_20A9DE440(v4);
  sub_20A9D80D0(v4, type metadata accessor for ODISessionStateMachine.ApplyTimingCase);
  v5 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[72] = v5;
  v5(v1, v3);
  return swift_task_switch();
}

uint64_t sub_20A9CF320()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 576);
  v2 = *(_QWORD *)(v0 + 440);
  v3 = *(_QWORD *)(v0 + 408);

  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9CF444()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  uint64_t v19;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  char v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  void (*v47)(uint64_t, _QWORD, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t, uint64_t);
  uint64_t v56;

  v53 = *(_QWORD *)(v0 + 560);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 480);
  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 488);
  v3 = *(unsigned int *)(v0 + 616);
  v4 = *(_QWORD *)(v0 + 400);
  v5 = *(_QWORD *)(v0 + 384);
  v6 = *(_QWORD *)(v0 + 160);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v6 + *(_QWORD *)(v0 + 472)), *(_QWORD *)(v6 + *(_QWORD *)(v0 + 472) + 24));
  v2(v4, v3, v5);
  sub_20A9DFF9C();
  v1(v4, v5);
  if (!*(_QWORD *)(v6 + v53))
  {
    v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 480);
    v21 = *(void (**)(uint64_t, uint64_t))(v0 + 488);
    v23 = *(unsigned int *)(v0 + 616);
    v24 = *(_QWORD *)(v0 + 400);
    v25 = *(_QWORD *)(v0 + 384);
    v26 = (_QWORD *)(*(_QWORD *)(v0 + 160) + *(_QWORD *)(v0 + 472));
    __swift_project_boxed_opaque_existential_1(v26, v26[3]);
    v22(v24, v23, v25);
    sub_20A9DFFB4();
    v21(v24, v25);
    sub_20A9DFABC();
    if (MEMORY[0x20BD290D4]())
    {
      v28 = *(_QWORD *)(v0 + 224);
      v27 = *(_QWORD *)(v0 + 232);
      v29 = *(_QWORD *)(v0 + 216);
      v30 = sub_20A9E0044();
      sub_20A9BA454(&qword_254612058, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F790], MEMORY[0x24BE1F798]);
      v31 = (void *)swift_allocError();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v30 - 8) + 104))(v32, *MEMORY[0x24BE1F788], v30);
      sub_20A9E00E0();
      sub_20A9DFA5C();
      sub_20A9DFAA4();
      swift_bridgeObjectRelease();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);

    }
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 104))(*(_QWORD *)(v0 + 256), *MEMORY[0x24BE1F258], *(_QWORD *)(v0 + 240));
    goto LABEL_9;
  }
  v7 = *(void **)(v0 + 512);
  *(_QWORD *)(v0 + 120) = v7;
  v8 = v7;
  if ((swift_dynamicCast() & 1) == 0)
  {
    v33 = *(_QWORD *)(v0 + 512);
    v46 = *(_DWORD *)(v0 + 616);
    v34 = *(_QWORD *)(v0 + 400);
    v35 = *(_QWORD *)(v0 + 384);
    v51 = *(_QWORD *)(v0 + 256);
    v55 = *(void (**)(uint64_t, uint64_t))(v0 + 488);
    v47 = *(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 480);
    v48 = *(_QWORD *)(v0 + 248);
    v49 = *(_QWORD *)(v0 + 240);
    v36 = (_QWORD *)(*(_QWORD *)(v0 + 160) + *(_QWORD *)(v0 + 472));
    __swift_project_boxed_opaque_existential_1(v36, v36[3]);
    sub_20A9E026C();
    *(_QWORD *)(v0 + 80) = 0;
    *(_QWORD *)(v0 + 88) = 0xE000000000000000;
    sub_20A9E0110();
    *(_QWORD *)(v0 + 112) = v33;
    sub_20A9E02CC();
    sub_20A9E0110();
    v47(v34, v46, v35);
    sub_20A9DFFA8();
    swift_bridgeObjectRelease();
    v55(v34, v35);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v48 + 104))(v51, *MEMORY[0x24BE1F260], v49);
LABEL_9:
    v37 = 0;
    goto LABEL_10;
  }
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 480);
  v10 = *(unsigned int *)(v0 + 616);
  v11 = *(_QWORD *)(v0 + 400);
  v12 = *(_QWORD *)(v0 + 384);
  v13 = *(_QWORD *)(v0 + 248);
  v50 = *(_QWORD *)(v0 + 256);
  v54 = *(void (**)(uint64_t, uint64_t))(v0 + 488);
  v14 = *(_QWORD *)(v0 + 240);
  v15 = (_QWORD *)(*(_QWORD *)(v0 + 160) + *(_QWORD *)(v0 + 472));
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 192));
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  v9(v11, v10, v12);
  sub_20A9DFFA8();
  v54(v11, v12);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v13 + 104))(v50, *MEMORY[0x24BE1F250], v14);
  sub_20A9DFABC();
  v16 = MEMORY[0x20BD290D4]();
  *(_QWORD *)(v0 + 584) = v16;
  if (v16)
  {
    v17 = sub_20A9E0044();
    v18 = (uint64_t (*)(uint64_t))MEMORY[0x24BE1F790];
    *(_QWORD *)(v0 + 592) = v17;
    sub_20A9BA454(&qword_254612058, v18, MEMORY[0x24BE1F798]);
    *(_QWORD *)(v0 + 600) = swift_allocError();
    *(_QWORD *)(v0 + 608) = v19;
    return swift_task_switch();
  }
  v37 = 1;
LABEL_10:
  v38 = *(void **)(v0 + 512);
  v39 = *(_QWORD *)(v0 + 416);
  v52 = *(_QWORD *)(v0 + 408);
  v56 = *(_QWORD *)(v0 + 440);
  v40 = *(_QWORD *)(v0 + 248);
  v41 = *(_QWORD *)(v0 + 256);
  v42 = *(_QWORD *)(v0 + 240);
  v44 = *(_QWORD *)(v0 + 176);
  v43 = *(_QWORD *)(v0 + 184);
  v45 = *(_QWORD *)(v0 + 168);
  *(_BYTE *)(*(_QWORD *)(v0 + 160) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__lastAssessmentTimedOut) = v37;
  sub_20A9E00E0();
  sub_20A9DFF24();
  sub_20A9DFF30();

  (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v43, v45);
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v41, v42);
  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v56, v52);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9CFAC4()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 464))(*(_QWORD *)(v0 + 424), *(_QWORD *)(v0 + 448) + *(_QWORD *)(v0 + 456), *(_QWORD *)(v0 + 408));
  return swift_task_switch();
}

uint64_t sub_20A9CFB14()
{
  uint64_t v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = *(_QWORD **)(v0 + 608);
  v2 = *(void **)(v0 + 600);
  v3 = *(_QWORD *)(v0 + 592);
  v5 = *(_QWORD *)(v0 + 416);
  v4 = *(_QWORD *)(v0 + 424);
  v6 = *(_QWORD *)(v0 + 408);
  v7 = *(_QWORD *)(v0 + 232);
  v19 = *(_QWORD *)(v0 + 224);
  v21 = *(_QWORD *)(v0 + 216);
  sub_20A9DFD74();
  v9 = v8;
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  *v1 = v9;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v1, *MEMORY[0x24BE1F780], v3);
  sub_20A9E00E0();
  sub_20A9DFA5C();
  sub_20A9DFAA4();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v7, v21);

  v10 = *(void **)(v0 + 512);
  v11 = *(_QWORD *)(v0 + 416);
  v20 = *(_QWORD *)(v0 + 408);
  v22 = *(_QWORD *)(v0 + 440);
  v12 = *(_QWORD *)(v0 + 248);
  v13 = *(_QWORD *)(v0 + 256);
  v14 = *(_QWORD *)(v0 + 240);
  v16 = *(_QWORD *)(v0 + 176);
  v15 = *(_QWORD *)(v0 + 184);
  v17 = *(_QWORD *)(v0 + 168);
  *(_BYTE *)(*(_QWORD *)(v0 + 160) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__lastAssessmentTimedOut) = 1;
  sub_20A9E00E0();
  sub_20A9DFF24();
  sub_20A9DFF30();

  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v14);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v22, v20);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9CFD8C()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[34];
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v0[43] + 56))(v1, 1, 1, v0[42]);
  sub_20A9C16D4(v1, &qword_254612038);
  return swift_task_switch();
}

uint64_t sub_20A9CFDEC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  _QWORD *v8;

  v7 = a4 >> 1;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_20A9B824C;
  return sub_20A9CB8D4(a1, a3, v7, 0);
}

uint64_t sub_20A9CFE60(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v29 = a2;
  v30 = a3;
  v27 = a1;
  v31 = sub_20A9DFE64();
  v3 = *(_QWORD *)(v31 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v31);
  v25 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254611C48);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = v7;
  v8 = sub_20A9DFAD4();
  MEMORY[0x24BDAC7A8](v8);
  v9 = sub_20A9DFAE0();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v24 - v14;
  sub_20A9DFE88();
  sub_20A9DFAEC();
  v16 = sub_20A9E0194();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v7, 1, 1, v16);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v27, v31);
  v17 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v18 = (v11 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = (*(unsigned __int8 *)(v3 + 80) + v18 + 8) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = 0;
  *(_QWORD *)(v20 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v20 + v17, v13, v9);
  *(_QWORD *)(v20 + v18) = v28;
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v20 + v19, v25, v31);
  v21 = (_QWORD *)(v20 + ((v4 + v19 + 7) & 0xFFFFFFFFFFFFFFF8));
  v22 = v30;
  *v21 = v29;
  v21[1] = v22;
  swift_retain();
  swift_retain();
  sub_20A9C3E64((uint64_t)v26, (uint64_t)&unk_2546120F8, v20);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_20A9D00D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v12;

  *(_QWORD *)(v8 + 16) = a4;
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 24) = v12;
  *v12 = v8;
  v12[1] = sub_20A9D0144;
  return sub_20A9D19C0(a6, a7, a8);
}

uint64_t sub_20A9D0144()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9D0198()
{
  uint64_t v0;

  sub_20A9DFAC8();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9D01D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  v4 = sub_20A9DFDE0();
  v3[11] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[12] = v5;
  v3[13] = *(_QWORD *)(v5 + 64);
  v3[14] = swift_task_alloc();
  v6 = sub_20A9DFC18();
  v3[15] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v3[16] = v7;
  v3[17] = *(_QWORD *)(v7 + 64);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9D0278()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_20A9C4AA8()[9];
  swift_retain();
  swift_release();
  *(_QWORD *)(v0 + 160) = *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller_geoCoder);
  swift_retain();
  swift_release();
  sub_20A9DFF84();
  sub_20A9BA454(&qword_254612030, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F6E0], MEMORY[0x24BE1F6F0]);
  sub_20A9E0170();
  return swift_task_switch();
}

uint64_t sub_20A9D032C()
{
  sub_20A9DFF6C();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9D0374()
{
  _QWORD *v0;
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
  unint64_t v14;
  unint64_t v15;
  char *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;

  v2 = v0[18];
  v1 = v0[19];
  v24 = v1;
  v3 = v0[16];
  v4 = v0[14];
  v5 = v0[15];
  v6 = v0[12];
  v21 = v0[17];
  v7 = v0[11];
  v8 = v0[8];
  v22 = v0[9];
  v9 = sub_20A9E00E0();
  v19 = v10;
  v20 = v9;
  v23 = (void *)sub_20A9E00BC();
  v11 = v1;
  v12 = v5;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v11, v5);
  v13 = v4;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v8, v7);
  v14 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v15 = (v21 + *(unsigned __int8 *)(v6 + 80) + v14) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v16 = (char *)swift_allocObject();
  *((_QWORD *)v16 + 2) = v20;
  *((_QWORD *)v16 + 3) = v19;
  *((_QWORD *)v16 + 4) = v22;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(&v16[v14], v2, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(&v16[v15], v13, v7);
  v0[6] = sub_20A9D833C;
  v0[7] = v16;
  v0[2] = MEMORY[0x24BDAC760];
  v0[3] = 1107296256;
  v0[4] = sub_20A9D09DC;
  v0[5] = &block_descriptor_69;
  v17 = _Block_copy(v0 + 2);
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v17);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v24, v12);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

unint64_t sub_20A9D0554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t inited;
  unint64_t v5;
  uint64_t v6;
  char v7;
  id v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  char v11;
  id v12;
  char v13;
  uint64_t v14;
  char v15;
  id v16;
  char v17;
  unint64_t v18;
  unint64_t v20;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254612028);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20A9E1240;
  *(_QWORD *)(inited + 32) = 0x4965636976726573;
  *(_QWORD *)(inited + 40) = 0xE900000000000064;
  *(_QWORD *)(inited + 48) = sub_20A9E00BC();
  *(_QWORD *)(inited + 56) = 0x54656D6F6374756FLL;
  *(_QWORD *)(inited + 64) = 0xEB00000000657079;
  *(_QWORD *)(inited + 72) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedInteger_, a3);
  *(_QWORD *)(inited + 80) = 0xD000000000000018;
  *(_QWORD *)(inited + 88) = 0x800000020A9F2B30;
  *(_QWORD *)(inited + 96) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, sub_20A9DFBD0());
  strcpy((char *)(inited + 104), "geocodeErrors");
  *(_WORD *)(inited + 118) = -4864;
  *(_QWORD *)(inited + 120) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, sub_20A9DFBC4());
  *(_QWORD *)(inited + 128) = 0xD000000000000018;
  *(_QWORD *)(inited + 136) = 0x800000020A9F2B50;
  *(_QWORD *)(inited + 144) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, sub_20A9DFBF4());
  *(_QWORD *)(inited + 152) = 0xD00000000000001FLL;
  *(_QWORD *)(inited + 160) = 0x800000020A9F2B70;
  *(_QWORD *)(inited + 168) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, sub_20A9DFC0C());
  *(_QWORD *)(inited + 176) = 0xD00000000000001DLL;
  *(_QWORD *)(inited + 184) = 0x800000020A9F2B90;
  *(_QWORD *)(inited + 192) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, sub_20A9DFBE8());
  *(_QWORD *)(inited + 200) = 0xD000000000000011;
  *(_QWORD *)(inited + 208) = 0x800000020A9F2BB0;
  *(_QWORD *)(inited + 216) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, sub_20A9DFBDC());
  *(_QWORD *)(inited + 224) = 0xD000000000000021;
  *(_QWORD *)(inited + 232) = 0x800000020A9F2BD0;
  *(_QWORD *)(inited + 240) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, sub_20A9DFC00());
  *(_QWORD *)(inited + 248) = 0xD000000000000021;
  *(_QWORD *)(inited + 256) = 0x800000020A9F2C00;
  *(_QWORD *)(inited + 264) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, sub_20A9DFBB8());
  v5 = sub_20A9C7520(inited);
  v20 = v5;
  v6 = sub_20A9DFDA4();
  if ((v7 & 1) != 0)
  {

  }
  else
  {
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *(double *)&v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_20A9BCDA4((uint64_t)v8, 0xD000000000000018, 0x800000020A9F2C30, isUniquelyReferenced_nonNull_native);
    v20 = v5;
    swift_bridgeObjectRelease();
  }
  v10 = sub_20A9DFDC8();
  if ((v11 & 1) != 0)
  {

  }
  else
  {
    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *(double *)&v10);
    v13 = swift_isUniquelyReferenced_nonNull_native();
    sub_20A9BCDA4((uint64_t)v12, 0xD000000000000021, 0x800000020A9F2C50, v13);
    swift_bridgeObjectRelease();
  }
  v14 = sub_20A9DFD14();
  if ((v15 & 1) != 0)
  {

    return v20;
  }
  else
  {
    v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, *(double *)&v14);
    v17 = swift_isUniquelyReferenced_nonNull_native();
    sub_20A9BCDA4((uint64_t)v16, 0xD000000000000016, 0x800000020A9F2C80, v17);
    v18 = v20;
    swift_bridgeObjectRelease();
  }
  return v18;
}

id sub_20A9D09DC(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_20A9D8244();
    v4 = (void *)sub_20A9E005C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t sub_20A9D0A50()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[11] = v0;
  v2 = sub_20A9DFDE0();
  v1[12] = v2;
  v1[13] = *(_QWORD *)(v2 - 8);
  v1[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9D0AB0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 120) = *(_QWORD *)(*(_QWORD *)(v0 + 88) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  return swift_task_switch();
}

uint64_t sub_20A9D0AD4()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 128) = *(_BYTE *)(*(_QWORD *)(v0 + 120) + 112);
  return swift_task_switch();
}

uint64_t sub_20A9D0AF0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[14];
  v2 = v0[12];
  v3 = v0[13];
  v4 = v0[15] + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTiming;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  return swift_task_switch();
}

uint64_t sub_20A9D0B78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  char v7;
  char v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v1 = *(unsigned __int8 *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 88);
  v5 = *(_QWORD *)(v0 + 96);
  v6 = COERCE_DOUBLE(sub_20A9DFD8C());
  v8 = v7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v5);
  if ((v8 & 1) != 0)
    v9 = -1.0;
  else
    v9 = v6;
  v10 = (void *)sub_20A9E00BC();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v4;
  *(_QWORD *)(v11 + 24) = v1;
  *(double *)(v11 + 32) = v9;
  *(_QWORD *)(v0 + 48) = sub_20A9D8220;
  *(_QWORD *)(v0 + 56) = v11;
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v0 + 24) = 1107296256;
  *(_QWORD *)(v0 + 32) = sub_20A9D09DC;
  *(_QWORD *)(v0 + 40) = &block_descriptor;
  v12 = _Block_copy((const void *)(v0 + 16));
  swift_retain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v12);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_20A9D0CA4(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t inited;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v6 = sub_20A9E0050();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254612028);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20A9E11C0;
  *(_QWORD *)(inited + 32) = 0x4965636976726573;
  *(_QWORD *)(inited + 40) = 0xE900000000000064;
  sub_20A9E00E0();
  v11 = sub_20A9E00BC();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 48) = v11;
  *(_QWORD *)(inited + 56) = 0x7954656372756F73;
  *(_QWORD *)(inited + 64) = 0xEA00000000006570;
  *(_QWORD *)(inited + 72) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, a2);
  *(_QWORD *)(inited + 80) = 0xD000000000000013;
  *(_QWORD *)(inited + 88) = 0x800000020A9F2AC0;
  *(_QWORD *)(inited + 96) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithDouble_, a3);
  v12 = sub_20A9C7520(inited);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(a1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  v15 = 0;
  v16 = 0xE000000000000000;
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  v15 = 0xD00000000000001CLL;
  v16 = 0x800000020A9F2AE0;
  sub_20A9D8244();
  sub_20A9E0080();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BE1F7F0], v6);
  sub_20A9DFFE4();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

uint64_t sub_20A9D0EF4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v4 + 64) = a2;
  *(_QWORD *)(v4 + 72) = v3;
  *(_BYTE *)(v4 + 249) = a3;
  *(_QWORD *)(v4 + 56) = a1;
  v5 = sub_20A9DFEB8();
  *(_QWORD *)(v4 + 80) = v5;
  *(_QWORD *)(v4 + 88) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 96) = swift_task_alloc();
  v6 = sub_20A9E0050();
  *(_QWORD *)(v4 + 104) = v6;
  *(_QWORD *)(v4 + 112) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 120) = swift_task_alloc();
  v7 = sub_20A9DFC30();
  *(_QWORD *)(v4 + 128) = v7;
  *(_QWORD *)(v4 + 136) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v4 + 144) = swift_task_alloc();
  *(_QWORD *)(v4 + 152) = swift_task_alloc();
  v8 = sub_20A9DFF18();
  *(_QWORD *)(v4 + 160) = v8;
  *(_QWORD *)(v4 + 168) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v4 + 176) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9D0FE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
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
  _QWORD *v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, uint64_t);

  v2 = *(_QWORD *)(v0 + 168);
  v1 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 160);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 16))(v1, *(_QWORD *)(v0 + 64), v3);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v4 == *MEMORY[0x24BE1F678])
  {
    v5 = *(_QWORD *)(v0 + 176);
    v6 = *(_QWORD *)(v0 + 152);
    v7 = *(_QWORD *)(v0 + 128);
    v8 = *(_QWORD *)(v0 + 136);
    v9 = *(unsigned __int8 *)(v0 + 249);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 168) + 96))(v5, *(_QWORD *)(v0 + 160));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v5, v7);
    v10 = *(_QWORD *)(v0 + 176);
    v11 = *(_QWORD *)(v0 + 152);
    if (v9 == 1)
    {
      v12 = *(_QWORD *)(v0 + 120);
      v47 = *(_QWORD *)(v0 + 136);
      v50 = *(_QWORD *)(v0 + 128);
      v13 = *(_QWORD *)(v0 + 104);
      v14 = *(_QWORD *)(v0 + 112);
      v15 = *(_QWORD *)(v0 + 72);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v15 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(v15 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
      sub_20A9E026C();
      sub_20A9E0110();
      sub_20A9DFC24();
      sub_20A9E0110();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v14 + 104))(v12, *MEMORY[0x24BE1F7E0], v13);
      sub_20A9DFF9C();
      swift_bridgeObjectRelease();
      v16 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
      v16(v12, v13);
      v17 = sub_20A9DFC24();
      v18 = (uint64_t *)(v15 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnAtorSessionId);
      *v18 = v17;
      v18[1] = v19;
      swift_bridgeObjectRelease();
      v20 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
      v20(v11, v50);
      v20(v10, v50);
    }
    else
    {
      v31 = *(_QWORD *)(v0 + 136);
      v32 = *(_QWORD *)(v0 + 144);
      v34 = *(_QWORD *)(v0 + 120);
      v33 = *(_QWORD *)(v0 + 128);
      v35 = *(_QWORD *)(v0 + 112);
      v36 = *(_QWORD *)(v0 + 72);
      v49 = *(_QWORD *)(v0 + 104);
      v52 = *(void (**)(uint64_t, uint64_t))(v31 + 8);
      v52(v11, v33);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32))(v32, v10, v33);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v36 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(v36 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
      sub_20A9E026C();
      sub_20A9E0110();
      sub_20A9DFC24();
      sub_20A9E0110();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v35 + 104))(v34, *MEMORY[0x24BE1F7E0], v49);
      sub_20A9DFF9C();
      swift_bridgeObjectRelease();
      v16 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
      v16(v34, v49);
      v52(v32, v33);
    }
  }
  else
  {
    v22 = *(_QWORD *)(v0 + 168);
    v21 = *(_QWORD *)(v0 + 176);
    v23 = *(_QWORD *)(v0 + 160);
    v25 = *(_QWORD *)(v0 + 112);
    v24 = *(_QWORD *)(v0 + 120);
    v51 = *(_QWORD *)(v0 + 104);
    if (v4 == *MEMORY[0x24BE1F668])
    {
      v46 = *(_QWORD *)(v0 + 112);
      v27 = *(_QWORD *)(v0 + 88);
      v26 = *(_QWORD *)(v0 + 96);
      v28 = *(_QWORD *)(v0 + 72);
      v29 = *(_QWORD *)(v0 + 80);
      v48 = v27;
      (*(void (**)(uint64_t, uint64_t))(v22 + 96))(v21, v23);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v26, v21, v29);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v28 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(v28 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
      sub_20A9E026C();
      sub_20A9E0110();
      *(_QWORD *)(v0 + 48) = sub_20A9DFEAC();
      sub_20A9E0308();
      sub_20A9E0110();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v46 + 104))(v24, *MEMORY[0x24BE1F7E0], v51);
      sub_20A9DFFA8();
      swift_bridgeObjectRelease();
      v16 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
      v16(v24, v51);
      v30 = (_QWORD *)(v28 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnAtorSessionId);
      *v30 = 0;
      v30[1] = 0;
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v26, v29);
    }
    else
    {
      __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 72) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(*(_QWORD *)(v0 + 72) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
      v37 = *MEMORY[0x24BE1F7F0];
      v38 = sub_20A9E0050();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 104))(v24, v37, v38);
      sub_20A9DFFFC();
      v16 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      v16(v24, v51);
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    }
  }
  v40 = *(_QWORD *)(v0 + 112);
  v39 = *(_QWORD *)(v0 + 120);
  v41 = *(_QWORD *)(v0 + 104);
  v42 = *(_QWORD *)(v0 + 72);
  v43 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  *(_QWORD *)(v0 + 184) = v16;
  *(_QWORD *)(v0 + 192) = v43;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v42 + v43), *(_QWORD *)(v42 + v43 + 24));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v40 + 104))(v39, *MEMORY[0x24BE1F7E8], v41);
  sub_20A9DFF9C();
  v16(v39, v41);
  v44 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 200) = v44;
  *v44 = v0;
  v44[1] = sub_20A9D15C4;
  return sub_20A9D38D8(*(_QWORD *)(v0 + 56));
}

uint64_t sub_20A9D15C4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9D1628()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 216) = *(_QWORD *)(*(_QWORD *)(v0 + 72)
                                    + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_fieldsCachingManager);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_20A9D1674()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 224) = *(_QWORD *)(*(_QWORD *)(v0 + 216) + 64);
  return swift_task_switch();
}

uint64_t sub_20A9D1690()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 224) + 120);
  *(_QWORD *)(v0 + 232) = v1;
  if (v1)
  {
    swift_retain();
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v2;
    *v2 = v0;
    v2[1] = sub_20A9D177C;
    return sub_20A9E01B8();
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20A9D177C()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9D17DC()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9D1848()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v8)(uint64_t, uint64_t);

  v1 = (void *)v0[26];
  v8 = (void (*)(uint64_t, uint64_t))v0[23];
  v2 = v0[15];
  v3 = v0[13];
  v4 = (_QWORD *)(v0[9] + v0[24]);
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_20A9E026C();
  sub_20A9E0110();
  swift_getErrorValue();
  sub_20A9E035C();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  v5 = *MEMORY[0x24BE1F7F0];
  v6 = sub_20A9E0050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v2, v5, v6);
  sub_20A9E0014();
  swift_bridgeObjectRelease();

  v8(v2, v3);
  v0[27] = *(_QWORD *)(v0[9] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_fieldsCachingManager);
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_20A9D19C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4[22] = a3;
  v4[23] = v3;
  v4[20] = a1;
  v4[21] = a2;
  v5 = sub_20A9DFB28();
  v4[24] = v5;
  v4[25] = *(_QWORD *)(v5 - 8);
  v4[26] = swift_task_alloc();
  v6 = sub_20A9DFF18();
  v4[27] = v6;
  v4[28] = *(_QWORD *)(v6 - 8);
  v4[29] = swift_task_alloc();
  type metadata accessor for ODISessionStateMachine.ApplyTimingCase(0);
  v4[30] = swift_task_alloc();
  v7 = sub_20A9DFDE0();
  v4[31] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v4[32] = v8;
  v4[33] = *(_QWORD *)(v8 + 64);
  v4[34] = swift_task_alloc();
  v4[35] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9D1AA8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[30];
  v0[36] = *(_QWORD *)(v0[23] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 3, 5, v2);
  return swift_task_switch();
}

uint64_t sub_20A9D1B1C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 240);
  sub_20A9DE440(v1);
  sub_20A9D80D0(v1, type metadata accessor for ODISessionStateMachine.ApplyTimingCase);
  return swift_task_switch();
}

uint64_t sub_20A9D1B7C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = v0[34];
  v2 = v0[32];
  v3 = v0[31];
  v4 = v0[23];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v0[35], v3);
  v5 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v6 = swift_allocObject();
  v0[37] = v6;
  *(_QWORD *)(v6 + 16) = v4;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v6 + v5, v1, v3);
  swift_retain();
  v7 = (_QWORD *)swift_task_alloc();
  v0[38] = (uint64_t)v7;
  *v7 = v0;
  v7[1] = sub_20A9D1C58;
  return sub_20A9CDFDC(v0[29], v0[20], (uint64_t)&unk_254612018, v6);
}

uint64_t sub_20A9D1C58()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9D1CB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void (*v13)(uint64_t);

  v2 = v0[25];
  v1 = v0[26];
  v3 = v0[24];
  v13 = (void (*)(uint64_t))v0[21];
  sub_20A9BF828(v0[23] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger, (uint64_t)(v0 + 14));
  __swift_project_boxed_opaque_existential_1(v0 + 14, v0[17]);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BE1F220], v3);
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  sub_20A9E00E0();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611E98);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20A9E1250;
  *(_QWORD *)(inited + 32) = 0x64616F6C796170;
  *(_QWORD *)(inited + 40) = 0xE700000000000000;
  *(_QWORD *)(inited + 48) = sub_20A9DFF0C();
  *(_QWORD *)(inited + 56) = v5;
  *(_QWORD *)(inited + 64) = 1684632436;
  *(_QWORD *)(inited + 72) = 0xE400000000000000;
  v6 = sub_20A9DFEE8();
  if (v7)
    v8 = v6;
  else
    v8 = 0;
  if (v7)
    v9 = v7;
  else
    v9 = 0xE000000000000000;
  *(_QWORD *)(inited + 80) = v8;
  *(_QWORD *)(inited + 88) = v9;
  v0[19] = sub_20A9C7190(inited);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611EA0);
  sub_20A9D7124();
  sub_20A9DFFC0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 14));
  v10 = sub_20A9DFF0C();
  v13(v10);
  swift_bridgeObjectRelease();
  v11 = (_QWORD *)swift_task_alloc();
  v0[39] = v11;
  *v11 = v0;
  v11[1] = sub_20A9D1F08;
  return sub_20A9D0EF4(v0[35], v0[29], 1);
}

uint64_t sub_20A9D1F08()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9D1F60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 280);
  v2 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD *)(v0 + 256);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 224) + 8))(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 216));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9D1FF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v4 = sub_20A9E0050();
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9D205C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[6];
  v1 = v0[7];
  v3 = v0[5];
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0[3] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(v0[3] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BE1F7E0], v3);
  sub_20A9DFF9C();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = (_QWORD *)swift_task_alloc();
  v0[8] = (uint64_t)v4;
  *v4 = v0;
  v4[1] = sub_20A9B5444;
  return sub_20A9D0EF4(v0[4], v0[2], 0);
}

uint64_t sub_20A9D213C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4[9] = a4;
  type metadata accessor for ODISessionStateMachine.ApplyTimingCase(0);
  v4[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254612038);
  v4[11] = swift_task_alloc();
  v5 = sub_20A9DFF18();
  v4[12] = v5;
  v4[13] = *(_QWORD *)(v5 - 8);
  v4[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254612068);
  v4[15] = swift_task_alloc();
  sub_20A9DFE64();
  v4[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254612060);
  v4[17] = swift_task_alloc();
  v6 = sub_20A9DFE40();
  v4[18] = v6;
  v4[19] = *(_QWORD *)(v6 - 8);
  v4[20] = swift_task_alloc();
  v7 = sub_20A9DFDE0();
  v4[21] = v7;
  v4[22] = *(_QWORD *)(v7 - 8);
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  v8 = sub_20A9E0050();
  v4[25] = v8;
  v4[26] = *(_QWORD *)(v8 - 8);
  v4[27] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C48);
  v4[28] = swift_task_alloc();
  v9 = sub_20A9DFCFC();
  v4[29] = v9;
  v4[30] = *(_QWORD *)(v9 - 8);
  v4[31] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9D2320()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 256) = *(_QWORD *)(*(_QWORD *)(v0 + 72)
                                    + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__armandDataFiller);
  sub_20A9DFCC0();
  sub_20A9BA454(&qword_254611C98, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F470], MEMORY[0x24BE1F480]);
  swift_retain();
  sub_20A9E0170();
  return swift_task_switch();
}

uint64_t sub_20A9D23B8()
{
  sub_20A9DFC90();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9D2400()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[9];
  v2 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_fieldsCachingManager;
  v0[33] = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_fieldsCachingManager;
  v0[34] = *(_QWORD *)(v1 + v2);
  swift_retain();
  v3 = (_QWORD *)swift_task_alloc();
  v0[35] = v3;
  *v3 = v0;
  v3[1] = sub_20A9D246C;
  return sub_20A9D9FF0(1);
}

uint64_t sub_20A9D246C(char a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_BYTE *)(v3 + 508) = a1;
  *(_QWORD *)(v3 + 288) = a2;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9D24D8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v1 = *(_QWORD *)(v0 + 288);
  v2 = *(_BYTE *)(v0 + 508);
  v3 = *(_QWORD *)(v0 + 224);
  v4 = *(_QWORD *)(v0 + 72);
  v5 = sub_20A9E0194();
  *(_QWORD *)(v0 + 296) = v5;
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56);
  *(_QWORD *)(v0 + 304) = v6;
  v6(v3, 1, 1, v5);
  v7 = sub_20A9BA454(&qword_254611CD8, type metadata accessor for ODISessionInternal, (uint64_t)&protocol conformance descriptor for ODISessionInternal);
  *(_QWORD *)(v0 + 312) = v7;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v4;
  *(_QWORD *)(v8 + 24) = v7;
  *(_BYTE *)(v8 + 32) = v2;
  *(_QWORD *)(v8 + 40) = v4;
  *(_QWORD *)(v8 + 48) = v1;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_20A9C3E64(v3, (uint64_t)&unk_2546120D0, v8);
  swift_release();
  sub_20A9DFCE4();
  *(_QWORD *)(v0 + 320) = sub_20A9C4AA8();
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 328) = v9;
  *v9 = v0;
  v9[1] = sub_20A9D2600;
  return sub_20A9B7E90();
}

uint64_t sub_20A9D2600(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 336) = a1;
  *(_QWORD *)(v3 + 344) = a2;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9D2668()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD *)(v0 + 208);
  v1 = *(_QWORD *)(v0 + 216);
  v3 = *(_QWORD *)(v0 + 200);
  v12 = *(_QWORD *)(v0 + 344);
  v13 = *(_QWORD *)(v0 + 72);
  v4 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  *(_QWORD *)(v0 + 352) = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  v5 = (_QWORD *)(v13 + v4);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v13 + v4), *(_QWORD *)(v13 + v4 + 24));
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611D28);
  sub_20A9E0080();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  v6 = *MEMORY[0x24BE1F7E8];
  *(_DWORD *)(v0 + 504) = v6;
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 104);
  *(_QWORD *)(v0 + 360) = v7;
  v7(v1, v6, v3);
  sub_20A9DFFD8();
  swift_bridgeObjectRelease();
  v8 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  *(_QWORD *)(v0 + 368) = v8;
  v8(v1, v3);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  sub_20A9E026C();
  sub_20A9E0110();
  MEMORY[0x20BD29788](v12, MEMORY[0x24BEE0D00]);
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  v7(v1, v6, v3);
  sub_20A9DFF9C();
  swift_bridgeObjectRelease();
  v8(v1, v3);
  v9 = *(_QWORD *)(v13 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask);
  *(_QWORD *)(v0 + 376) = v9;
  if (v9)
  {
    swift_retain();
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 384) = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254611D98);
    *v10 = v0;
    v10[1] = sub_20A9D2930;
    return sub_20A9E01A0();
  }
  else
  {
    *(_QWORD *)(v0 + 400) = *(_QWORD *)(*(_QWORD *)(v0 + 72) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
    return swift_task_switch();
  }
}

uint64_t sub_20A9D2930()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 392) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

uint64_t sub_20A9D29C0()
{
  uint64_t v0;

  swift_release();
  *(_QWORD *)(v0 + 400) = *(_QWORD *)(*(_QWORD *)(v0 + 72) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  return swift_task_switch();
}

uint64_t sub_20A9D2A0C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[24];
  v2 = v0[21];
  v3 = v0[22];
  v4 = v0[50] + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTiming;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  return swift_task_switch();
}

uint64_t sub_20A9D2A98()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0[33];
  v2 = v0[30];
  v3 = v0[29];
  v4 = v0[17];
  v5 = v0[9];
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 16))(v4, v0[31], v3);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v4, 0, 1, v3);
  v0[51] = *(_QWORD *)(v5 + v1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v6 = (_QWORD *)swift_task_alloc();
  v0[52] = v6;
  *v6 = v0;
  v6[1] = sub_20A9D2B60;
  return sub_20A9D9FF0(1);
}

uint64_t sub_20A9D2B60(char a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_BYTE *)(v3 + 509) = a1;
  *(_QWORD *)(v3 + 424) = a2;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9D2BCC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t (*v13)(_QWORD, _QWORD);

  v1 = *(_QWORD *)(v0 + 424);
  v2 = *(_BYTE *)(v0 + 509);
  v3 = *(_QWORD *)(v0 + 312);
  v4 = *(_QWORD *)(v0 + 224);
  v5 = *(_QWORD *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 72);
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v0 + 304))(v4, 1, 1, *(_QWORD *)(v0 + 296));
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *(_QWORD *)(v7 + 24) = v3;
  *(_BYTE *)(v7 + 32) = v2;
  *(_QWORD *)(v7 + 40) = v6;
  *(_QWORD *)(v7 + 48) = v1;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_20A9C3E64(v4, (uint64_t)&unk_2546120D8, v7);
  swift_release();
  sub_20A9DFE4C();
  v8 = sub_20A9DFB40();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  sub_20A9DFE34();
  v9 = *(_QWORD *)(v6 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
  *(_QWORD *)(v0 + 432) = v9;
  if (v9)
  {
    v13 = (uint64_t (*)(_QWORD, _QWORD))((int)*MEMORY[0x24BE1F2E8] + MEMORY[0x24BE1F2E8]);
    swift_retain();
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 440) = v10;
    *v10 = v0;
    v10[1] = sub_20A9D2DD0;
    return v13(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 160));
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 88);
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 104) + 56))(v12, 1, 1, *(_QWORD *)(v0 + 96));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_20A9C16D4(v12, &qword_254612038);
    *(_QWORD *)(v0 + 456) = sub_20A9C4AA8();
    return swift_task_switch();
  }
}

uint64_t sub_20A9D2DD0()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9D2E58()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = v0[42];
  v3 = v0[13];
  v2 = v0[14];
  v5 = v0[11];
  v4 = v0[12];
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(v5, 0, 1, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v2, v5, v4);
  v0[56] = sub_20A9D6D74(v1);
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_20A9D2EEC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0[56];
  v2 = v0[43];
  v3 = v0[22];
  v4 = v0[23];
  v5 = v0[21];
  v6 = v0[14];
  v7 = v0[10];
  sub_20A9DFEF4();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 5, v8);
  sub_20A9DE440(v7);
  sub_20A9D80D0(v7, type metadata accessor for ODISessionStateMachine.ApplyTimingCase);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  sub_20A9DD350(*(_QWORD *)(v2 + 16), *(_QWORD *)(v1 + 16), 0, v6);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_20A9D2FE8()
{
  _QWORD *v0;

  (*(void (**)(_QWORD, _QWORD))(v0[13] + 8))(v0[14], v0[12]);
  v0[57] = sub_20A9C4AA8();
  return swift_task_switch();
}

uint64_t sub_20A9D3038()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 464) = *(_QWORD *)(*(_QWORD *)(v0 + 456) + 64);
  return swift_task_switch();
}

uint64_t sub_20A9D3054()
{
  uint64_t v0;

  *(_BYTE *)(v0 + 510) = sub_20A9B6DF0() & 1;
  return swift_task_switch();
}

uint64_t sub_20A9D3098()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_BYTE *)(v0 + 510) != 1
    || (v1 = MEMORY[0x20BD29F38](*(_QWORD *)(v0 + 456) + 96), (*(_QWORD *)(v0 + 472) = v1) == 0))
  {
    swift_release();
  }
  return swift_task_switch();
}

uint64_t sub_20A9D3104()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 472);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 360);
  v3 = *(unsigned int *)(v0 + 504);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 304);
  v12 = *(_QWORD *)(v0 + 312);
  v9 = *(void (**)(uint64_t, uint64_t))(v0 + 368);
  v10 = *(_QWORD *)(v0 + 296);
  v5 = *(_QWORD *)(v0 + 216);
  v4 = *(_QWORD *)(v0 + 224);
  v6 = *(_QWORD *)(v0 + 200);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
  v2(v5, v3, v6);
  sub_20A9DFF9C();
  v9(v5, v6);
  v11(v4, 1, 1, v10);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = v1;
  v7[3] = v12;
  v7[4] = v1;
  swift_retain_n();
  sub_20A9C3E64(v4, (uint64_t)&unk_254611CE0, (uint64_t)v7);
  swift_release();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9D3254()
{
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9D3290()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 360);
  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 368);
  v3 = *(unsigned int *)(v0 + 504);
  v4 = *(_QWORD *)(v0 + 216);
  v5 = *(_QWORD *)(v0 + 200);
  v6 = (_QWORD *)(*(_QWORD *)(v0 + 72) + *(_QWORD *)(v0 + 352));
  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v2(v4, v3, v5);
  sub_20A9DFF9C();
  v1(v4, v5);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 480) = v7;
  *v7 = v0;
  v7[1] = sub_20A9D336C;
  return sub_20A9D38D8(*(_QWORD *)(v0 + 192));
}

uint64_t sub_20A9D336C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 488) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9D33D0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = v0[30];
  v2 = v0[24];
  v3 = v0[21];
  v4 = v0[22];
  (*(void (**)(_QWORD, _QWORD))(v0[19] + 8))(v0[20], v0[18]);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  v5 = v0[9];
  (*(void (**)(_QWORD, _QWORD))(v1 + 8))(v0[31], v0[29]);
  v0[62] = *(_QWORD *)(v5 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  return swift_task_switch();
}

uint64_t sub_20A9D3458()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 496) + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTriggered) = 1;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9D3538()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 240) + 8))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 232));
  v1 = *(void **)(v0 + 392);
  v2 = *(_QWORD *)(v0 + 216);
  v3 = (_QWORD *)(*(_QWORD *)(v0 + 72) + *(_QWORD *)(v0 + 352));
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_20A9E035C();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  v4 = *MEMORY[0x24BE1F7F0];
  v5 = sub_20A9E0050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(v2, v4, v5);
  sub_20A9E0014();
  swift_bridgeObjectRelease();

  v6 = *(_QWORD *)(v0 + 72);
  (*(void (**)(_QWORD, _QWORD))(v0 + 368))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 200));
  *(_QWORD *)(v0 + 496) = *(_QWORD *)(v6 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  return swift_task_switch();
}

uint64_t sub_20A9D36AC()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[11];
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v0[13] + 56))(v1, 1, 1, v0[12]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20A9C16D4(v1, &qword_254612038);
  v0[57] = sub_20A9C4AA8();
  return swift_task_switch();
}

uint64_t sub_20A9D3734()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(_QWORD *)(v0 + 240);
  v1 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 192);
  v5 = *(_QWORD *)(v0 + 168);
  v6 = *(_QWORD *)(v0 + 176);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v7 = *(void **)(v0 + 488);
  v8 = *(_QWORD *)(v0 + 216);
  v9 = (_QWORD *)(*(_QWORD *)(v0 + 72) + *(_QWORD *)(v0 + 352));
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_20A9E035C();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  v10 = *MEMORY[0x24BE1F7F0];
  v11 = sub_20A9E0050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v8, v10, v11);
  sub_20A9E0014();
  swift_bridgeObjectRelease();

  v12 = *(_QWORD *)(v0 + 72);
  (*(void (**)(_QWORD, _QWORD))(v0 + 368))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 200));
  *(_QWORD *)(v0 + 496) = *(_QWORD *)(v12 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  return swift_task_switch();
}

uint64_t sub_20A9D38D8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[23] = a1;
  v2[24] = v1;
  v3 = sub_20A9DFE10();
  v2[25] = v3;
  v2[26] = *(_QWORD *)(v3 - 8);
  v2[27] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611E68);
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  v4 = type metadata accessor for ODISessionInternal.PendingFeedback(0);
  v2[30] = v4;
  v2[31] = *(_QWORD *)(v4 - 8);
  v2[32] = swift_task_alloc();
  v5 = sub_20A9E0050();
  v2[33] = v5;
  v2[34] = *(_QWORD *)(v5 - 8);
  v2[35] = swift_task_alloc();
  type metadata accessor for ODISessionStateMachine.ApplyTimingCase(0);
  v2[36] = swift_task_alloc();
  v6 = sub_20A9DFDE0();
  v2[37] = v6;
  v2[38] = *(_QWORD *)(v6 - 8);
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9D3A2C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);

  v1 = v0[41];
  v2 = v0[42];
  v3 = v0[37];
  v4 = v0[23];
  v5 = v0[24];
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[38] + 16);
  v0[43] = v6;
  v6(v2, v4, v3);
  sub_20A9DFD5C();
  v6(v1, v2, v3);
  v0[44] = *(_QWORD *)(v5 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  return swift_task_switch();
}

uint64_t sub_20A9D3AB0()
{
  _QWORD *v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[43];
  v1 = v0[44];
  v3 = v0[40];
  v4 = v0[37];
  v5 = OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTiming;
  v0[45] = OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTiming;
  v6 = v1 + v5;
  swift_beginAccess();
  v2(v3, v6, v4);
  return swift_task_switch();
}

uint64_t sub_20A9D3B3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t);
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t);
  _QWORD *v45;
  _QWORD *v46;

  v1 = *(_QWORD *)(v0 + 320);
  v2 = *(_QWORD *)(v0 + 328);
  v3 = *(_QWORD *)(v0 + 296);
  v4 = *(_QWORD *)(v0 + 304);
  v5 = sub_20A9DFD80();
  v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  *(_QWORD *)(v0 + 368) = v6;
  v6(v1, v3);
  v6(v2, v3);
  if ((v5 & 1) != 0)
  {
    v7 = *(_QWORD *)(v0 + 288);
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 4, 5, v8);
    return swift_task_switch();
  }
  v10 = *(_QWORD *)(v0 + 192);
  sub_20A9DFD74();
  sub_20A9DFD98();
  v12 = v11;
  v13 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  *(_QWORD *)(v0 + 376) = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  v14 = v10 + v13;
  sub_20A9BF828(v14, v0 + 16);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  sub_20A9E026C();
  sub_20A9E0110();
  v45 = (_QWORD *)v14;
  if ((v12 & 1) == 0)
    sub_20A9E01E8();
  v15 = *(_QWORD *)(v0 + 272);
  v16 = *(_QWORD *)(v0 + 280);
  v17 = *(_QWORD *)(v0 + 264);
  v42 = *(_QWORD *)(v0 + 248);
  v43 = *(_QWORD *)(v0 + 240);
  v40 = *(_QWORD *)(v0 + 192);
  v41 = *(_QWORD *)(v0 + 232);
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  sub_20A9E0110();
  v18 = *MEMORY[0x24BE1F7B8];
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 104);
  v19(v16, v18, v17);
  sub_20A9DFF9C();
  swift_bridgeObjectRelease();
  v20 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  *(_QWORD *)(v0 + 384) = v20;
  v20(v16, v17);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_project_boxed_opaque_existential_1(v45, v45[3]);
  sub_20A9E026C();
  sub_20A9E0110();
  sub_20A9E01E8();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  sub_20A9E0110();
  v21 = v18;
  v22 = v19;
  v19(v16, v21, v17);
  sub_20A9DFF9C();
  v23 = v20;
  swift_bridgeObjectRelease();
  v20(v16, v17);
  v24 = v40 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__pendingFeedback;
  swift_beginAccess();
  sub_20A9D8A70(v24, v41, &qword_254611E68);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v41, 1, v43) == 1)
  {
    v25 = *(_QWORD *)(v0 + 232);
    (*(void (**)(_QWORD, _QWORD))(v0 + 368))(*(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 296));
    sub_20A9C16D4(v25, &qword_254611E68);
  }
  else
  {
    v26 = v22;
    v27 = *(_QWORD *)(v0 + 256);
    v28 = *(_QWORD *)(v0 + 240);
    sub_20A9D8044(*(_QWORD *)(v0 + 232), v27);
    v29 = *(int *)(v28 + 20);
    *(_DWORD *)(v0 + 448) = v29;
    v30 = v27 + v29;
    if ((sub_20A9DFD80() & 1) != 0)
    {
      v31 = *(_QWORD *)(v0 + 280);
      v44 = v23;
      v32 = *(_QWORD *)(v0 + 264);
      v46 = *(_QWORD **)(v0 + 256);
      __swift_project_boxed_opaque_existential_1(v45, v45[3]);
      v26(v31, *MEMORY[0x24BE1F7E8], v32);
      sub_20A9DFF9C();
      v44(v31, v32);
      if (*v46)
      {
        swift_retain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_254611D98);
        sub_20A9E01AC();
        swift_release();
      }
      v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 344);
      v34 = *(_QWORD *)(v0 + 328);
      v35 = *(_QWORD *)(v0 + 296);
      v36 = *(_QWORD *)(v0 + 224);
      (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 248) + 56))(v36, 1, 1, *(_QWORD *)(v0 + 240));
      swift_beginAccess();
      sub_20A9D8088(v36, v24);
      swift_endAccess();
      v33(v34, v30, v35);
      return swift_task_switch();
    }
    v37 = *(void (**)(uint64_t, uint64_t))(v0 + 368);
    v38 = *(_QWORD *)(v0 + 336);
    v39 = *(_QWORD *)(v0 + 296);
    sub_20A9D80D0(*(_QWORD *)(v0 + 256), type metadata accessor for ODISessionInternal.PendingFeedback);
    v37(v38, v39);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9D40CC()
{
  _QWORD *v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (void (*)(uint64_t, uint64_t))v0[46];
  v2 = v0[41];
  v4 = v0[36];
  v3 = v0[37];
  sub_20A9DE440(v4);
  sub_20A9D80D0(v4, type metadata accessor for ODISessionStateMachine.ApplyTimingCase);
  v1(v2, v3);
  return swift_task_switch();
}

uint64_t sub_20A9D414C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  _QWORD *v37;
  _QWORD *v38;

  v1 = *(_QWORD *)(v0 + 192);
  sub_20A9DFD74();
  sub_20A9DFD98();
  v3 = v2;
  v4 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  *(_QWORD *)(v0 + 376) = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  v5 = v1 + v4;
  sub_20A9BF828(v5, v0 + 16);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  sub_20A9E026C();
  sub_20A9E0110();
  v37 = (_QWORD *)v5;
  if ((v3 & 1) == 0)
    sub_20A9E01E8();
  v6 = *(_QWORD *)(v0 + 272);
  v7 = *(_QWORD *)(v0 + 280);
  v8 = *(_QWORD *)(v0 + 264);
  v34 = *(_QWORD *)(v0 + 248);
  v35 = *(_QWORD *)(v0 + 240);
  v32 = *(_QWORD *)(v0 + 192);
  v33 = *(_QWORD *)(v0 + 232);
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  sub_20A9E0110();
  v9 = *MEMORY[0x24BE1F7B8];
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 104);
  v10(v7, v9, v8);
  sub_20A9DFF9C();
  swift_bridgeObjectRelease();
  v11 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  *(_QWORD *)(v0 + 384) = v11;
  v11(v7, v8);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_project_boxed_opaque_existential_1(v37, v37[3]);
  sub_20A9E026C();
  sub_20A9E0110();
  sub_20A9E01E8();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  sub_20A9E0110();
  v12 = v9;
  v13 = v10;
  v10(v7, v12, v8);
  sub_20A9DFF9C();
  v14 = v11;
  swift_bridgeObjectRelease();
  v11(v7, v8);
  v15 = v32 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__pendingFeedback;
  swift_beginAccess();
  sub_20A9D8A70(v15, v33, &qword_254611E68);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v33, 1, v35) == 1)
  {
    v16 = *(_QWORD *)(v0 + 232);
    (*(void (**)(_QWORD, _QWORD))(v0 + 368))(*(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 296));
    sub_20A9C16D4(v16, &qword_254611E68);
LABEL_10:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v17 = v13;
  v18 = *(_QWORD *)(v0 + 256);
  v19 = *(_QWORD *)(v0 + 240);
  sub_20A9D8044(*(_QWORD *)(v0 + 232), v18);
  v20 = *(int *)(v19 + 20);
  *(_DWORD *)(v0 + 448) = v20;
  v21 = v18 + v20;
  if ((sub_20A9DFD80() & 1) == 0)
  {
    v29 = *(void (**)(uint64_t, uint64_t))(v0 + 368);
    v30 = *(_QWORD *)(v0 + 336);
    v31 = *(_QWORD *)(v0 + 296);
    sub_20A9D80D0(*(_QWORD *)(v0 + 256), type metadata accessor for ODISessionInternal.PendingFeedback);
    v29(v30, v31);
    goto LABEL_10;
  }
  v22 = *(_QWORD *)(v0 + 280);
  v36 = v14;
  v23 = *(_QWORD *)(v0 + 264);
  v38 = *(_QWORD **)(v0 + 256);
  __swift_project_boxed_opaque_existential_1(v37, v37[3]);
  v17(v22, *MEMORY[0x24BE1F7E8], v23);
  sub_20A9DFF9C();
  v36(v22, v23);
  if (*v38)
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254611D98);
    sub_20A9E01AC();
    swift_release();
  }
  v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 344);
  v25 = *(_QWORD *)(v0 + 328);
  v26 = *(_QWORD *)(v0 + 296);
  v27 = *(_QWORD *)(v0 + 224);
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 248) + 56))(v27, 1, 1, *(_QWORD *)(v0 + 240));
  swift_beginAccess();
  sub_20A9D8088(v27, v15);
  swift_endAccess();
  v24(v25, v21, v26);
  return swift_task_switch();
}

uint64_t sub_20A9D4660()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 344))(*(_QWORD *)(v0 + 320), *(_QWORD *)(v0 + 352) + *(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 296));
  return swift_task_switch();
}

uint64_t sub_20A9D46B0()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 368);
  v2 = *(_QWORD *)(v0 + 320);
  v3 = *(_QWORD *)(v0 + 328);
  v4 = *(_QWORD *)(v0 + 296);
  v5 = sub_20A9DFD80();
  v1(v2, v4);
  v1(v3, v4);
  if ((v5 & 1) != 0)
  {
    v6 = *(_QWORD *)(v0 + 288);
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 4, 5, v7);
    return swift_task_switch();
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 344))(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 256) + *(int *)(v0 + 448), *(_QWORD *)(v0 + 296));
  sub_20A9DFD5C();
  v9 = *(_QWORD *)(v0 + 192);
  v10 = *(_QWORD *)(v9 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask);
  *(_QWORD *)(v0 + 392) = v10;
  if (v10)
  {
    swift_retain();
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 400) = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254611D98);
    *v11 = v0;
    v11[1] = sub_20A9D4BB0;
    return sub_20A9E01A0();
  }
  else
  {
    v12 = *(_QWORD *)(v9 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
    *(_QWORD *)(v0 + 416) = v12;
    if (v12)
    {
      v14 = *(_QWORD *)(v0 + 208);
      v13 = *(_QWORD *)(v0 + 216);
      v15 = *(_QWORD *)(v0 + 200);
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 344))(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 296));
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v14 + 104))(v13, *MEMORY[0x24BE1F590], v15);
      swift_retain();
      return swift_task_switch();
    }
    v16 = *(void (**)(uint64_t, uint64_t))(v0 + 368);
    v17 = *(_QWORD *)(v0 + 336);
    v18 = *(_QWORD *)(v0 + 296);
    v19 = *(_QWORD *)(v0 + 256);
    v16(*(_QWORD *)(v0 + 312), v18);
    sub_20A9D80D0(v19, type metadata accessor for ODISessionInternal.PendingFeedback);
    v16(v17, v18);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20A9D494C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 288);
  sub_20A9DE440(v1);
  sub_20A9D80D0(v1, type metadata accessor for ODISessionStateMachine.ApplyTimingCase);
  return swift_task_switch();
}

uint64_t sub_20A9D49B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 192);
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_setODNAtorTask);
  *(_QWORD *)(v0 + 392) = v2;
  if (v2)
  {
    swift_retain();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 400) = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254611D98);
    *v3 = v0;
    v3[1] = sub_20A9D4BB0;
    return sub_20A9E01A0();
  }
  else
  {
    v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
    *(_QWORD *)(v0 + 416) = v5;
    if (v5)
    {
      v7 = *(_QWORD *)(v0 + 208);
      v6 = *(_QWORD *)(v0 + 216);
      v8 = *(_QWORD *)(v0 + 200);
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 344))(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 296));
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 104))(v6, *MEMORY[0x24BE1F590], v8);
      swift_retain();
      return swift_task_switch();
    }
    else
    {
      v9 = *(void (**)(uint64_t, uint64_t))(v0 + 368);
      v10 = *(_QWORD *)(v0 + 336);
      v11 = *(_QWORD *)(v0 + 296);
      v12 = *(_QWORD *)(v0 + 256);
      v9(*(_QWORD *)(v0 + 312), v11);
      sub_20A9D80D0(v12, type metadata accessor for ODISessionInternal.PendingFeedback);
      v9(v10, v11);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }
}

uint64_t sub_20A9D4BB0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 408) = v0;
  swift_task_dealloc();
  if (v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9D4C24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  swift_release();
  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 192) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnator);
  *(_QWORD *)(v0 + 416) = v1;
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 208);
    v2 = *(_QWORD *)(v0 + 216);
    v4 = *(_QWORD *)(v0 + 200);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 344))(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 296));
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, *MEMORY[0x24BE1F590], v4);
    swift_retain();
    return swift_task_switch();
  }
  else
  {
    v6 = *(void (**)(uint64_t, uint64_t))(v0 + 368);
    v7 = *(_QWORD *)(v0 + 336);
    v8 = *(_QWORD *)(v0 + 296);
    v9 = *(_QWORD *)(v0 + 256);
    v6(*(_QWORD *)(v0 + 312), v8);
    sub_20A9D80D0(v9, type metadata accessor for ODISessionInternal.PendingFeedback);
    v6(v7, v8);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20A9D4D9C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(*(_QWORD *)(v0 + 352) + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_feedbackTracker);
  swift_beginAccess();
  *(_QWORD *)(v0 + 424) = *v1;
  swift_bridgeObjectRetain();
  return swift_task_switch();
}

uint64_t sub_20A9D4E04()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t);

  v1 = (uint64_t *)(v0[24] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__odnAtorSessionId);
  v2 = *v1;
  v3 = v1[1];
  v0[54] = v3;
  v6 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))((int)*MEMORY[0x24BE1F2D8] + MEMORY[0x24BE1F2D8]);
  swift_bridgeObjectRetain();
  v4 = (_QWORD *)swift_task_alloc();
  v0[55] = v4;
  *v4 = v0;
  v4[1] = sub_20A9D4EA8;
  return v6(v0[41], v0[27], v0[53], v2, v3);
}

uint64_t sub_20A9D4EA8()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)v0 + 368);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 328);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 296);
  v5 = *(_QWORD *)(*(_QWORD *)v0 + 208);
  v4 = *(_QWORD *)(*(_QWORD *)v0 + 216);
  v6 = *(_QWORD *)(*(_QWORD *)v0 + 200);
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v1(v2, v3);
  return swift_task_switch();
}

uint64_t sub_20A9D4F6C()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 368);
  v2 = *(_QWORD *)(v0 + 336);
  v3 = *(_QWORD *)(v0 + 296);
  v4 = *(_QWORD *)(v0 + 256);
  v1(*(_QWORD *)(v0 + 312), v3);
  sub_20A9D80D0(v4, type metadata accessor for ODISessionInternal.PendingFeedback);
  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9D5054()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 368);
  v12 = *(_QWORD *)(v0 + 336);
  v9 = *(void (**)(uint64_t, uint64_t))(v0 + 384);
  v10 = *(_QWORD *)(v0 + 312);
  v2 = *(_QWORD *)(v0 + 296);
  v3 = *(_QWORD *)(v0 + 280);
  v11 = *(_QWORD *)(v0 + 256);
  v4 = (_QWORD *)(*(_QWORD *)(v0 + 192) + *(_QWORD *)(v0 + 376));
  v8 = *(_QWORD *)(v0 + 264);
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_20A9E026C();
  sub_20A9E0110();
  swift_getErrorValue();
  sub_20A9E035C();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  v5 = *MEMORY[0x24BE1F7F0];
  v6 = sub_20A9E0050();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v3, v5, v6);
  sub_20A9E0014();
  swift_bridgeObjectRelease();
  v9(v3, v8);
  swift_willThrow();
  v1(v10, v2);
  sub_20A9D80D0(v11, type metadata accessor for ODISessionInternal.PendingFeedback);
  v1(v12, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9D5268()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[22] = v0;
  v2 = sub_20A9DFCFC();
  v1[23] = v2;
  v1[24] = *(_QWORD *)(v2 - 8);
  v1[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C48);
  v1[26] = swift_task_alloc();
  v3 = sub_20A9E0050();
  v1[27] = v3;
  v1[28] = *(_QWORD *)(v3 - 8);
  v1[29] = swift_task_alloc();
  sub_20A9DFAD4();
  v1[30] = swift_task_alloc();
  v4 = sub_20A9DFAE0();
  v1[31] = v4;
  v1[32] = *(_QWORD *)(v4 - 8);
  v1[33] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9D535C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void (*v7)(uint64_t, uint64_t);
  _QWORD *v8;

  v1 = *(_QWORD *)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 216);
  v3 = *(_QWORD *)(v0 + 224);
  v4 = *(_QWORD *)(v0 + 176);
  sub_20A9DFEA0();
  sub_20A9DFAEC();
  v5 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  *(_QWORD *)(v0 + 272) = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v4 + v5), *(_QWORD *)(v4 + v5 + 24));
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  sub_20A9E00E0();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  *(_DWORD *)(v0 + 416) = *MEMORY[0x24BE1F7B0];
  v6 = *(void (**)(uint64_t))(v3 + 104);
  *(_QWORD *)(v0 + 280) = v6;
  v6(v1);
  sub_20A9DFF9C();
  swift_bridgeObjectRelease();
  v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  *(_QWORD *)(v0 + 288) = v7;
  v7(v1, v2);
  *(_QWORD *)(v0 + 296) = *(_QWORD *)(v4 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_fieldsCachingManager);
  swift_retain();
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 304) = v8;
  *v8 = v0;
  v8[1] = sub_20A9D54E0;
  return sub_20A9D9FF0(1);
}

uint64_t sub_20A9D54E0(char a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_BYTE *)(v3 + 420) = a1;
  *(_QWORD *)(v3 + 312) = a2;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9D554C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 312);
  v2 = *(_BYTE *)(v0 + 420);
  v3 = *(_QWORD *)(v0 + 208);
  v4 = *(_QWORD *)(v0 + 176);
  v5 = sub_20A9E0194();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v3, 1, 1, v5);
  v6 = sub_20A9BA454(&qword_254611CD8, type metadata accessor for ODISessionInternal, (uint64_t)&protocol conformance descriptor for ODISessionInternal);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v4;
  *(_QWORD *)(v7 + 24) = v6;
  *(_BYTE *)(v7 + 32) = v2;
  *(_QWORD *)(v7 + 40) = v4;
  *(_QWORD *)(v7 + 48) = v1;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_20A9C3E64(v3, (uint64_t)&unk_254611FF0, v7);
  swift_release();
  v8 = *(_QWORD *)(v1 + 16);
  v9 = *(_QWORD *)(v0 + 312);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
  v21 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
  v11 = *(unsigned int *)(v0 + 416);
  v12 = *(_QWORD *)(v0 + 272);
  if (v8)
  {
    v13 = *(_QWORD *)(v0 + 232);
    v14 = *(_QWORD *)(v0 + 216);
    v15 = *(_QWORD *)(v0 + 176);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v15 + v12), *(_QWORD *)(v15 + v12 + 24));
    sub_20A9E026C();
    swift_bridgeObjectRelease();
    v16 = sub_20A9DFC84();
    *(_QWORD *)(v0 + 320) = v16;
    MEMORY[0x20BD29788](v9, v16);
    sub_20A9E0110();
    swift_bridgeObjectRelease();
    v10(v13, v11, v14);
    sub_20A9DFF9C();
    swift_bridgeObjectRelease();
    v21(v13, v14);
    *(_QWORD *)(v0 + 328) = *(_QWORD *)(v15 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
    return swift_task_switch();
  }
  else
  {
    v18 = *(_QWORD *)(v0 + 232);
    v19 = *(_QWORD *)(v0 + 216);
    v20 = *(_QWORD *)(v0 + 176);
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v20 + v12), *(_QWORD *)(v20 + v12 + 24));
    v10(v18, v11, v19);
    sub_20A9DFF9C();
    v21(v18, v19);
    sub_20A9DFAC8();
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 256) + 8))(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 248));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20A9D5834()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  char v10;

  v1 = v0[39];
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = *(_QWORD *)(v0[40] - 8);
    v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v5 = v0[41] + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_armandDataInitialized;
    swift_bridgeObjectRetain();
    swift_beginAccess();
    v6 = *(_QWORD *)(v3 + 72);
    while (1)
    {
      v7 = *(_QWORD *)v5;
      if (!*(_QWORD *)(*(_QWORD *)v5 + 16))
        break;
      swift_bridgeObjectRetain();
      v8 = sub_20A9BAD50(v4);
      if ((v9 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        break;
      }
      v10 = *(_BYTE *)(*(_QWORD *)(v7 + 56) + v8);
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
        break;
      v4 += v6;
      if (!--v2)
      {
        swift_bridgeObjectRelease();
        return swift_task_switch();
      }
    }
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_20A9D5940()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(_QWORD, void *, _QWORD, _QWORD *);

  v0[42] = *(_QWORD *)(v0[22] + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__armandDataFiller);
  swift_retain();
  v1 = sub_20A9C4AA8()[9];
  swift_retain();
  swift_release();
  v0[5] = type metadata accessor for ODIBindingsFiller();
  v2 = sub_20A9BA454(&qword_254611CC0, (uint64_t (*)(uint64_t))type metadata accessor for ODIBindingsFiller, (uint64_t)&unk_20A9E1104);
  v0[2] = v1;
  v0[6] = v2;
  v5 = (uint64_t (*)(_QWORD, void *, _QWORD, _QWORD *))((int)*MEMORY[0x24BE1F450] + MEMORY[0x24BE1F450]);
  v3 = (_QWORD *)swift_task_alloc();
  v0[43] = v3;
  *v3 = v0;
  v3[1] = sub_20A9D5A28;
  return v5(v0[39], &unk_254612000, v0[22], v0 + 2);
}

uint64_t sub_20A9D5A28(char a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)v1 + 16;
  *(_BYTE *)(*(_QWORD *)v1 + 421) = a1;
  swift_task_dealloc();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v2);
  return swift_task_switch();
}

uint64_t sub_20A9D5AA4()
{
  uint64_t v0;

  sub_20A9DE1F8(*(_QWORD *)(v0 + 312), *(_BYTE *)(v0 + 421));
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_20A9D5B00()
{
  uint64_t v0;
  __int128 v1;

  sub_20A9BF828(*(_QWORD *)(v0 + 176) + *(_QWORD *)(v0 + 272), v0 + 56);
  v1 = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v0 + 352) = v1;
  *(_QWORD *)(v0 + 368) = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v1);
  sub_20A9E026C();
  *(_QWORD *)(v0 + 144) = 0;
  *(_QWORD *)(v0 + 152) = 0xE000000000000000;
  sub_20A9E0110();
  return swift_task_switch();
}

uint64_t sub_20A9D5BB0()
{
  uint64_t v0;
  __int128 v1;

  swift_bridgeObjectRelease();
  sub_20A9BF828(*(_QWORD *)(v0 + 176) + *(_QWORD *)(v0 + 272), v0 + 56);
  v1 = *(_OWORD *)(v0 + 80);
  *(_OWORD *)(v0 + 352) = v1;
  *(_QWORD *)(v0 + 368) = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v1);
  sub_20A9E026C();
  *(_QWORD *)(v0 + 144) = 0;
  *(_QWORD *)(v0 + 152) = 0xE000000000000000;
  sub_20A9E0110();
  return swift_task_switch();
}

uint64_t sub_20A9D5C68()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(*(_QWORD *)(v0 + 328) + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_armandDataInitialized);
  swift_beginAccess();
  *(_QWORD *)(v0 + 376) = *v1;
  swift_bridgeObjectRetain();
  return swift_task_switch();
}

uint64_t sub_20A9D5CD4()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;

  v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
  v8 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
  v2 = *(unsigned int *)(v0 + 416);
  v3 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 216);
  v9 = *(_QWORD *)(v0 + 176);
  v5 = (_QWORD *)(v9 + *(_QWORD *)(v0 + 272));
  sub_20A9BA454(&qword_254611C30, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F420], MEMORY[0x24BE1F430]);
  sub_20A9E0080();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1(v3, v2, v4);
  sub_20A9DFF9C();
  swift_bridgeObjectRelease();
  v8(v3, v4);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  v6 = v5[3];
  *(_QWORD *)(v0 + 384) = v6;
  *(_QWORD *)(v0 + 392) = v5[4];
  *(_QWORD *)(v0 + 400) = __swift_project_boxed_opaque_existential_1(v5, v6);
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 160) = 0xD000000000000014;
  *(_QWORD *)(v0 + 168) = 0x800000020A9F2640;
  *(_QWORD *)(v0 + 408) = *(_QWORD *)(v9 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__armandDataFiller);
  sub_20A9DFCC0();
  sub_20A9BA454(&qword_254611C98, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F470], MEMORY[0x24BE1F480]);
  swift_retain();
  sub_20A9E0170();
  return swift_task_switch();
}

uint64_t sub_20A9D5EAC()
{
  sub_20A9DFC90();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9D5EF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  void (*v9)(uint64_t, uint64_t);

  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 280);
  v1 = *(unsigned int *)(v0 + 416);
  v9 = *(void (**)(uint64_t, uint64_t))(v0 + 288);
  v2 = *(_QWORD *)(v0 + 232);
  v3 = *(_QWORD *)(v0 + 216);
  v5 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 200);
  v6 = *(_QWORD *)(v0 + 184);
  sub_20A9BA454(&qword_254611CA0, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F4C0], MEMORY[0x24BE1F4D0]);
  sub_20A9E0308();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  v8(v2, v1, v3);
  sub_20A9DFFD8();
  swift_bridgeObjectRelease();
  v9(v2, v3);
  sub_20A9DFAC8();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 256) + 8))(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 248));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9D6078(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_task_switch();
}

uint64_t sub_20A9D608C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = sub_20A9C4AA8();
  return swift_task_switch();
}

uint64_t sub_20A9D60CC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 48) = *(_QWORD *)(*(_QWORD *)(v0 + 40) + 72);
  return swift_task_switch();
}

uint64_t sub_20A9D60E8()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0[6] + OBJC_IVAR____TtC7CoreODI17ODIBindingsFiller__locationHelper);
  if (v1)
  {
    v0[8] = v1;
    swift_retain();
    swift_release();
    return swift_task_switch();
  }
  else
  {
    sub_20A9BA454(&qword_254611C60, (uint64_t (*)(uint64_t))type metadata accessor for ODIBindingsFiller, (uint64_t)&unk_20A9E1144);
    v3 = (_QWORD *)swift_task_alloc();
    v0[7] = v3;
    sub_20A9DFE28();
    *v3 = v0;
    v3[1] = sub_20A9D61E8;
    return sub_20A9E0314();
  }
}

uint64_t sub_20A9D61E8()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9D623C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 64) = *(_QWORD *)(v0 + 16);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9D6280()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD **)(v0 + 24);
  v3 = sub_20A9DFE28();
  v4 = MEMORY[0x24BE1F5B8];
  v2[3] = v3;
  v2[4] = v4;
  *v2 = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9D62C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254611C48);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_20A9E0194();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_20A9C16D4((uint64_t)v4, &qword_254611C48);
    v9 = 0;
    v10 = 0;
  }
  else
  {
    sub_20A9E0188();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v9 = sub_20A9E0170();
      v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = &unk_254611F50;
  *(_QWORD *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_20A9D649C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[5] = a4;
  v5 = sub_20A9E0050();
  v4[6] = v5;
  v4[7] = *(_QWORD *)(v5 - 8);
  v4[8] = swift_task_alloc();
  v6 = sub_20A9DFDE0();
  v4[9] = v6;
  v4[10] = *(_QWORD *)(v6 - 8);
  v4[11] = swift_task_alloc();
  v4[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9D6534()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 104) = *(_QWORD *)(*(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_sessionState);
  return swift_task_switch();
}

uint64_t sub_20A9D6558()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);

  v1 = v0[12];
  v2 = v0[9];
  v3 = v0[10];
  v4 = v0[13] + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTiming;
  swift_beginAccess();
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[14] = v5;
  v5(v1, v4, v2);
  return swift_task_switch();
}

uint64_t sub_20A9D65D8()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 112);
  v3 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 72);
  v5 = sub_20A9DFDB0();
  v2(v1, v3, v4);
  if ((v5 & 1) != 0)
  {
    v7 = *(_QWORD *)(v0 + 80);
    v6 = *(_QWORD *)(v0 + 88);
    v8 = *(_QWORD *)(v0 + 72);
    v9 = sub_20A9DFD68();
    v10 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v10(v6, v8);
    if ((v9 & 1) == 0)
    {
      v11 = *(_QWORD *)(v0 + 64);
      v12 = *(_QWORD *)(v0 + 56);
      v13 = *(_QWORD *)(v0 + 48);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(_QWORD *)(*(_QWORD *)(v0 + 40) + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 24));
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v12 + 104))(v11, *MEMORY[0x24BE1F7A0], v13);
      sub_20A9DFFB4();
      (*(void (**)(_QWORD, _QWORD))(v12 + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 48));
    }
  }
  else
  {
    v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 80) + 8);
    v10(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  }
  v10(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 72));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ODISessionInternal.deinit()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD v17[5];

  v14 = sub_20A9E0050();
  v12 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v2 = (char *)v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_20A9DFB28();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (_QWORD *)(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger);
  sub_20A9BF828(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger, (uint64_t)v17);
  v11[1] = v17[4];
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BE1F228], v3);
  v15 = 0;
  v16 = 0xE000000000000000;
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  v15 = 0xD00000000000001ELL;
  v16 = 0x800000020A9F2330;
  v13 = OBJC_IVAR____TtC7CoreODI18ODISessionInternal_providerID;
  sub_20A9E00E0();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  sub_20A9E0020();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  v8 = v12;
  v9 = v14;
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v2, *MEMORY[0x24BE1F7A0], v14);
  sub_20A9DFF90();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v2, v9);
  sub_20A9C16D4(v0 + OBJC_IVAR____TtC7CoreODI18ODISessionInternal__pendingFeedback, &qword_254611E68);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t ODISessionInternal.__deallocating_deinit()
{
  ODISessionInternal.deinit();
  return swift_defaultActor_deallocate();
}

void ODISessionInternal.__allocating_init()()
{
  swift_allocObject();
  swift_defaultActor_initialize();
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ODISessionInternal.init()()
{
  swift_defaultActor_initialize();
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t ODISessionInternal.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_20A9D6B4C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_20A9D8AB4;
  return v6(a1);
}

double sub_20A9D6BB0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  double result;
  uint64_t v13;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_20A9BAC84(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_20A9BCFC0();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_20A9C13A0((__int128 *)(*(_QWORD *)(v11 + 56) + 40 * v8), a3);
    sub_20A9BC55C(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(a3 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t sub_20A9D6CA8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_20A9BAC84(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_20A9BD8F8();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_20A9BC744(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *sub_20A9D6D74(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611D38);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_20A9D6EE0((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_20A9C13B8();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

unint64_t sub_20A9D6E58(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = result;
    v3 = 0;
    MEMORY[0x20BD29EB4](&v3, 8);
    result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          v3 = 0;
          MEMORY[0x20BD29EB4](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20A9D6EE0(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ODISessionInternal(uint64_t a1)
{
  return sub_20A9D70F0(a1, (uint64_t *)&unk_254611F68);
}

uint64_t sub_20A9D70F0(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_20A9D7124()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254611EA8;
  if (!qword_254611EA8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254611EA0);
    v2[0] = MEMORY[0x24BEE0D08];
    v2[1] = MEMORY[0x24BEE0D08];
    result = MEMORY[0x20BD29DF4](MEMORY[0x24BEE04C0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254611EA8);
  }
  return result;
}

unint64_t sub_20A9D7180(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  __int16 v4;
  __int16 v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  unsigned __int8 *v9;
  _BYTE *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  char v16;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C80);
  v3 = (_QWORD *)sub_20A9E02F0();
  v4 = *(unsigned __int8 *)(a1 + 32);
  v5 = *(unsigned __int8 *)(a1 + 33);
  v6 = *(_QWORD *)(a1 + 40);
  result = sub_20A9BACE8(v4 | (unsigned __int16)(v5 << 8));
  if ((v8 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v9 = (unsigned __int8 *)(a1 + 48);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (_BYTE *)(v3[6] + 2 * result);
    *v10 = v4 & 1;
    v10[1] = v5;
    *(_QWORD *)(v3[7] + 8 * result) = v6;
    v11 = v3[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      break;
    v3[2] = v13;
    if (!--v1)
      goto LABEL_8;
    v14 = v9 + 16;
    v4 = *v9;
    v5 = v9[1];
    v15 = *((_QWORD *)v9 + 1);
    swift_bridgeObjectRetain();
    result = sub_20A9BACE8(v4 | (unsigned __int16)(v5 << 8));
    v9 = v14;
    v6 = v15;
    if ((v16 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

_QWORD *sub_20A9D72A0(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _QWORD *a9)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v26;
  uint64_t v27;

  v27 = a5;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254611C48);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  a9[13] = 0;
  swift_unknownObjectWeakInit();
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1648]), sel_init);
  a9[15] = 0;
  a9[16] = 0;
  a9[2] = a1;
  a9[13] = &off_24C355120;
  a9[14] = v18;
  swift_unknownObjectWeakAssign();
  sub_20A9BF828(a2, (uint64_t)(a9 + 3));
  type metadata accessor for ODIBindingsFiller();
  swift_allocObject();
  v19 = a3;
  v20 = a1;
  swift_bridgeObjectRetain();
  a9[9] = sub_20A9B3FB0(a6, a7, (uint64_t)a3, a4, v27);
  type metadata accessor for ODIBindingsManager.CallbackQueuer();
  swift_allocObject();
  swift_bridgeObjectRetain();
  a9[8] = sub_20A9B67AC();
  sub_20A9DFCC0();
  swift_bridgeObjectRetain();
  a9[10] = sub_20A9DFC9C();
  type metadata accessor for ODIFieldsManager();
  swift_allocObject();
  v21 = v20;
  v22 = sub_20A9DC71C(a6, a7, v21);

  a9[11] = v22;
  v23 = sub_20A9E0194();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v17, 1, 1, v23);
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = a9;
  swift_retain();
  sub_20A9C3FF4((uint64_t)v17, (uint64_t)&unk_2546120E0, (uint64_t)v24);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a2);
  return a9;
}

uint64_t sub_20A9D74E0()
{
  return objectdestroyTm();
}

uint64_t sub_20A9D74E8()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_20A9C1758;
  v2 = (_QWORD *)swift_task_alloc();
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_20A9BA70C;
  return sub_20A9C5140();
}

uint64_t sub_20A9D7550()
{
  return objectdestroyTm();
}

uint64_t sub_20A9D7558()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_20A9C1758;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_20A9D75B8()
{
  return objectdestroyTm();
}

uint64_t sub_20A9D75C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_20A9C1758;
  v3[12] = v2;
  return swift_task_switch();
}

uint64_t sub_20A9D7620()
{
  return objectdestroyTm();
}

uint64_t sub_20A9D7628()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_20A9C1758;
  v2 = (_QWORD *)swift_task_alloc();
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_20A9C1758;
  return sub_20A9C7A4C();
}

uint64_t sub_20A9D7690()
{
  return objectdestroyTm();
}

uint64_t sub_20A9D7698(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_20A9C1758;
  return sub_20A9C853C(a1, v4, v5, v6);
}

uint64_t sub_20A9D7704()
{
  return objectdestroy_19Tm((void (*)(_QWORD))MEMORY[0x24BEE4BC0]);
}

uint64_t sub_20A9D7710()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc();
  v3 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_20A9C1758;
  *(_OWORD *)(v2 + 16) = v3;
  return swift_task_switch();
}

uint64_t sub_20A9D7774()
{
  return objectdestroyTm();
}

uint64_t sub_20A9D777C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 40);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_20A9C1758;
  v4 = (_QWORD *)swift_task_alloc();
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_20A9C1758;
  return sub_20A9C91E4(v2);
}

uint64_t sub_20A9D77F8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[4];
  v3 = v0[5];
  v4 = v0[6];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_20A9C1758;
  v5[3] = v3;
  v5[4] = v4;
  v5[2] = v2;
  return swift_task_switch();
}

uint64_t sub_20A9D7868()
{
  return objectdestroyTm();
}

uint64_t sub_20A9D7870(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_20A9C1758;
  return sub_20A9D649C(a1, v4, v5, v6);
}

uint64_t sub_20A9D78DC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20A9C1758;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254611F58 + dword_254611F58))(a1, v4);
}

uint64_t sub_20A9D794C()
{
  return type metadata accessor for ODISessionInternal(0);
}

void sub_20A9D7954()
{
  unint64_t v0;

  sub_20A9D7AF8();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for ODISessionInternal()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ODISessionInternal.description.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of ODISessionInternal.__allocating_init(serviceIdentifier:forDSIDType:locationBundle:andLocationBundleIdentifier:sessionStateDelegate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 496))();
}

uint64_t dispatch thunk of ODISessionInternal.update(additionalAttributes:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x200))();
}

uint64_t dispatch thunk of ODISessionInternal.getAssessment(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x208))();
}

uint64_t dispatch thunk of ODISessionInternal.provideFeedbackOnPayloadOutcome(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of ODISessionInternal.provideFeedbackOn(partialAssessmentID:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of ODISessionInternal.validateForDeinit()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x280))();
}

void sub_20A9D7AF8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254611FD0)
  {
    type metadata accessor for ODISessionInternal.PendingFeedback(255);
    v0 = sub_20A9E0218();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254611FD0);
  }
}

uint64_t *sub_20A9D7B4C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_20A9DFDE0();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_retain();
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_20A9D7BE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_20A9DFDE0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_20A9D7C2C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_20A9DFDE0();
  v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
  swift_retain();
  v8(v5, v6, v7);
  return a1;
}

_QWORD *sub_20A9D7C9C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_20A9DFDE0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_QWORD *sub_20A9D7D10(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_20A9DFDE0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_20A9D7D6C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_20A9DFDE0();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_20A9D7DD8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20A9D7DE4(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = sub_20A9DFDE0();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v9);
  }
}

uint64_t sub_20A9D7E6C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_20A9D7E78(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    v7 = sub_20A9DFDE0();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_20A9D7EEC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20A9DFDE0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_20A9D7F64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  _QWORD *v9;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 40);
  v7 = *(_QWORD *)(v1 + 48);
  v8 = *(_BYTE *)(v1 + 32);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_20A9C1758;
  return sub_20A9C4BEC(a1, v4, v5, v8, v6, v7);
}

uint64_t sub_20A9D7FE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_20A9C1758;
  v4[3] = a1;
  v4[4] = v1;
  return swift_task_switch();
}

uint64_t sub_20A9D8044(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ODISessionInternal.PendingFeedback(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A9D8088(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254611E68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A9D80D0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_20A9D810C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_20A9DFDE0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_20A9D8180(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_20A9DFDE0() - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = v1 + ((v4 + 24) & ~v4);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_20A9C1758;
  return sub_20A9D1FF8(a1, v5, v6);
}

uint64_t sub_20A9D81FC()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_20A9D8220()
{
  uint64_t v0;

  return sub_20A9D0CA4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_20A9D8244()
{
  unint64_t result;

  result = qword_254612020;
  if (!qword_254612020)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254612020);
  }
  return result;
}

uint64_t sub_20A9D8280()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_20A9DFC18();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_20A9DFDE0();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

unint64_t sub_20A9D833C()
{
  uint64_t *v0;

  sub_20A9DFC18();
  sub_20A9DFDE0();
  return sub_20A9D0554(v0[2], v0[3], v0[4]);
}

uint64_t sub_20A9D83A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_20A9DFE64();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_20A9D8424(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v4 = *(_QWORD *)(sub_20A9DFE64() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = v1 + v5;
  v7 = *(_QWORD *)(v1 + ((*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8));
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_20A9C1758;
  v9 = (_QWORD *)swift_task_alloc();
  v8[2] = v9;
  *v9 = v8;
  v9[1] = sub_20A9B824C;
  return sub_20A9CB8D4(a1, v6, v7 >> 1, 0);
}

uint64_t sub_20A9D84E8()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_20A9C1758;
  v2 = (_QWORD *)swift_task_alloc();
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_20A9C1758;
  return sub_20A9D5268();
}

unint64_t sub_20A9D8554()
{
  unint64_t result;

  result = qword_254612098;
  if (!qword_254612098)
  {
    result = MEMORY[0x20BD29DF4](MEMORY[0x24BEE45A0], MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_254612098);
  }
  return result;
}

uint64_t sub_20A9D8598(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_20A9D85A0()
{
  return objectdestroy_19Tm((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t objectdestroy_19Tm(void (*a1)(_QWORD))
{
  uint64_t v1;

  swift_unknownObjectRelease();
  swift_release();
  a1(*(_QWORD *)(v1 + 40));
  return swift_deallocObject();
}

uint64_t sub_20A9D85EC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_20A9C1758;
  return sub_20A9CB050(a1, v4, v5, v6);
}

uint64_t sub_20A9D8664()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20A9D8690(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = v1 + 16;
  v5 = *(_QWORD *)(v1 + 56);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_20A9B824C;
  return sub_20A9C5670(a1, v4, v5);
}

uint64_t objectdestroy_42Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20A9D8730()
{
  return objectdestroyTm();
}

uint64_t sub_20A9D8738()
{
  return objectdestroyTm();
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20A9D8778()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_20A9B824C;
  return sub_20A9B8204();
}

uint64_t objectdestroy_30Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20A9D881C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_20A9D8840(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_20A9C8BB4(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_20A9D8848()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20A9D886C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_20A9D888C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = sub_20A9DFAE0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = sub_20A9DFE64();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20A9D8980()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  v2 = *(_QWORD *)(sub_20A9DFAE0() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = *(_QWORD *)(sub_20A9DFE64() - 8);
  v6 = (v4 + *(unsigned __int8 *)(v5 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = v0 + v3;
  v8 = v0 + v6;
  v9 = (uint64_t *)(v0 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  v10 = *v9;
  v11 = v9[1];
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v12;
  *v12 = v1;
  v12[1] = sub_20A9C1758;
  v12[2] = v7;
  v13 = (_QWORD *)swift_task_alloc();
  v12[3] = v13;
  *v13 = v12;
  v13[1] = sub_20A9D0144;
  return sub_20A9D19C0(v8, v10, v11);
}

uint64_t sub_20A9D8A70(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_20A9D8AD0(_QWORD *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  id v33;
  char isUniquelyReferenced_nonNull_native;
  char v35;
  unint64_t v36;
  uint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  char v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t, uint64_t);
  char *v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  _QWORD *v57;
  uint64_t result;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  _QWORD *v68;
  char *v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  _QWORD *v73;
  _QWORD *v74;
  __int128 v75[2];
  char v76[32];
  _OWORD v77[2];
  __int128 v78[2];
  uint64_t v79;
  unint64_t v80;
  __int128 v81;

  v3 = sub_20A9E0050();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(v1, sel_attributes);
  if (!v7)
    return 0;
  v8 = v7;
  v72 = v4;
  type metadata accessor for ODIAttributeKey(0);
  v10 = v9;
  v11 = sub_20A9D93E4();
  v12 = sub_20A9E0074();

  sub_20A9D942C(v12);
  swift_bridgeObjectRelease();
  v13 = objc_allocWithZone(MEMORY[0x24BDBCE70]);
  v14 = (void *)sub_20A9E005C();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v13, sel_initWithDictionary_copyItems_, v14, 1);

  v80 = 0;
  sub_20A9E0068();

  v16 = v80;
  if (!v80)
    return 0;
  if (!*(_QWORD *)(v80 + 16))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v65 = v11;
  v66 = v10;
  v69 = v6;
  v70 = v3;
  v17 = (_QWORD *)sub_20A9C72B0(MEMORY[0x24BEE4AF8]);
  v18 = (_QWORD *)(v16 + 64);
  v19 = 1 << *(_BYTE *)(v16 + 32);
  v20 = -1;
  if (v19 < 64)
    v20 = ~(-1 << v19);
  v21 = v20 & *(_QWORD *)(v16 + 64);
  v22 = (unint64_t)(v19 + 63) >> 6;
  v62 = v22 - 1;
  swift_bridgeObjectRetain();
  v23 = 0;
  v73 = (_QWORD *)v22;
  v64 = v22 - 5;
  v63 = v16 + 104;
  if (!v21)
    goto LABEL_9;
LABEL_7:
  v24 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  v25 = v24 | (v23 << 6);
LABEL_8:
  v26 = *(_QWORD *)(v16 + 56);
  *(_QWORD *)&v78[0] = *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * v25);
  v27 = *(void **)&v78[0];
  sub_20A9D97F0(v26 + 32 * v25, (uint64_t)v78 + 8);
  v28 = v27;
  while (1)
  {
    sub_20A9D982C((uint64_t)v78, (uint64_t)&v80);
    v32 = (void *)v80;
    if (!v80)
    {
      swift_release();
      v68 = (_QWORD *)a1[3];
      v71 = (id)a1[4];
      v67 = __swift_project_boxed_opaque_existential_1(a1, (uint64_t)v68);
      v80 = 0;
      *(_QWORD *)&v81 = 0xE000000000000000;
      v73 = v17;
      sub_20A9E026C();
      swift_bridgeObjectRelease();
      v80 = 0xD00000000000001ALL;
      *(_QWORD *)&v81 = 0x800000020A9F3990;
      *(_QWORD *)&v78[0] = v73[2];
      sub_20A9E0308();
      sub_20A9E0110();
      swift_bridgeObjectRelease();
      v50 = *MEMORY[0x24BE1F7C0];
      v51 = v72;
      v52 = *(void (**)(char *, uint64_t, uint64_t))(v72 + 104);
      v53 = v69;
      v54 = v70;
      v52(v69, v50, v70);
      sub_20A9DFFD8();
      swift_bridgeObjectRelease();
      v72 = *(_QWORD *)(v51 + 8);
      ((void (*)(char *, uint64_t))v72)(v53, v54);
      v55 = a1[3];
      v71 = (id)a1[4];
      v68 = __swift_project_boxed_opaque_existential_1(a1, v55);
      v80 = 0;
      *(_QWORD *)&v81 = 0xE000000000000000;
      sub_20A9E026C();
      sub_20A9E0110();
      *(_QWORD *)&v78[0] = v73[2];
      sub_20A9E0308();
      sub_20A9E0110();
      swift_bridgeObjectRelease();
      sub_20A9E0110();
      LODWORD(v64) = v50;
      v67 = v52;
      v52(v53, v50, v54);
      v56 = (void (*)(char *, uint64_t))v72;
      sub_20A9DFF90();
      v57 = v73;
      swift_bridgeObjectRelease();
      v56(v53, v54);
      if (v57[2] == *(_QWORD *)(v16 + 16))
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_20A9B5E70(v16);
        v60 = v59;
        v61 = swift_bridgeObjectRetain();
        sub_20A9BFF7C(v61, v60);
        swift_bridgeObjectRelease();
        __swift_project_boxed_opaque_existential_1(a1, a1[3]);
        v80 = 0;
        *(_QWORD *)&v81 = 0xE000000000000000;
        sub_20A9E026C();
        swift_bridgeObjectRelease();
        v80 = 0xD000000000000013;
        *(_QWORD *)&v81 = 0x800000020A9F3A00;
        sub_20A9E0200();
        sub_20A9E0110();
        swift_release();
        swift_bridgeObjectRelease();
        ((void (*)(char *, _QWORD, uint64_t))v67)(v53, v64, v54);
        sub_20A9DFFB4();
        v57 = v73;
        swift_bridgeObjectRelease();
        v56(v53, v54);
      }
      return (uint64_t)v57;
    }
    sub_20A9D9874(&v81, v77);
    sub_20A9D97F0((uint64_t)v77, (uint64_t)v75);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254612120);
    if (swift_dynamicCast())
    {
      v67 = v18;
      v68 = a1;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v78);
      sub_20A9D97F0((uint64_t)v77, (uint64_t)v76);
      v33 = v32;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254611D28);
      swift_dynamicCast();
      sub_20A9C13A0(v78, (uint64_t)v75);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v74 = v17;
      v71 = v33;
      v36 = sub_20A9BADBC((uint64_t)v33);
      v37 = v17[2];
      v38 = (v35 & 1) == 0;
      v39 = v37 + v38;
      if (__OFADD__(v37, v38))
        goto LABEL_50;
      v40 = v35;
      if (v17[3] >= v39)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_20A9BD730();
      }
      else
      {
        sub_20A9BBF28(v39, isUniquelyReferenced_nonNull_native);
        v41 = sub_20A9BADBC((uint64_t)v71);
        if ((v40 & 1) != (v42 & 1))
          goto LABEL_52;
        v36 = v41;
      }
      a1 = v68;
      v17 = v74;
      if ((v40 & 1) != 0)
      {
        v43 = v74[7] + 40 * v36;
        __swift_destroy_boxed_opaque_existential_1(v43);
        sub_20A9C13A0(v75, v43);
        v18 = v67;
        v44 = v71;
      }
      else
      {
        v74[(v36 >> 6) + 8] |= 1 << v36;
        v45 = v71;
        *(_QWORD *)(v17[6] + 8 * v36) = v71;
        sub_20A9C13A0(v75, v17[7] + 40 * v36);
        v46 = v17[2];
        v47 = __OFADD__(v46, 1);
        v48 = v46 + 1;
        if (v47)
          goto LABEL_51;
        v17[2] = v48;
        v49 = v45;
        v44 = v45;
        v18 = v67;
      }

      swift_bridgeObjectRelease();
    }
    else
    {

    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v77);
    if (v21)
      goto LABEL_7;
LABEL_9:
    v29 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v29 >= (uint64_t)v73)
    {
      v31 = v23;
    }
    else
    {
      v30 = v18[v29];
      if (v30)
        goto LABEL_12;
      v31 = v23 + 1;
      if ((uint64_t)(v23 + 2) < (uint64_t)v73)
      {
        v30 = v18[v23 + 2];
        if (v30)
        {
          v29 = v23 + 2;
LABEL_12:
          v21 = (v30 - 1) & v30;
          v25 = __clz(__rbit64(v30)) + (v29 << 6);
          v23 = v29;
          goto LABEL_8;
        }
        v31 = v23 + 2;
        if ((uint64_t)(v23 + 3) < (uint64_t)v73)
        {
          v30 = v18[v23 + 3];
          if (v30)
          {
            v29 = v23 + 3;
            goto LABEL_12;
          }
          v29 = v23 + 4;
          v31 = v23 + 3;
          if ((uint64_t)(v23 + 4) < (uint64_t)v73)
          {
            v30 = v18[v29];
            if (v30)
              goto LABEL_12;
            while (v64 != v23)
            {
              v30 = *(_QWORD *)(v63 + 8 * v23++);
              if (v30)
              {
                v29 = v23 + 4;
                goto LABEL_12;
              }
            }
            v31 = v62;
          }
        }
      }
    }
    v21 = 0;
    v79 = 0;
    v23 = v31;
    memset(v78, 0, sizeof(v78));
  }
  __break(1u);
LABEL_50:
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  result = sub_20A9E0344();
  __break(1u);
  return result;
}

unint64_t sub_20A9D93E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254611C08;
  if (!qword_254611C08)
  {
    type metadata accessor for ODIAttributeKey(255);
    result = MEMORY[0x20BD29DF4](&unk_20A9E116C, v1);
    atomic_store(result, (unint64_t *)&qword_254611C08);
  }
  return result;
}

uint64_t sub_20A9D942C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  _OWORD v31[2];
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[2];
  _OWORD v37[2];
  uint64_t v38;
  _OWORD v39[2];
  uint64_t v40;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254612128);
    v2 = sub_20A9E02F0();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v26)
        goto LABEL_37;
      v14 = *(_QWORD *)(v27 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v26)
          goto LABEL_37;
        v14 = *(_QWORD *)(v27 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v26)
            goto LABEL_37;
          v14 = *(_QWORD *)(v27 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = *(void **)(*(_QWORD *)(a1 + 48) + 8 * v12);
    sub_20A9D97F0(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v39 + 8);
    *(_QWORD *)&v39[0] = v17;
    v37[0] = v39[0];
    v37[1] = v39[1];
    v38 = v40;
    *(_QWORD *)&v36[0] = v17;
    type metadata accessor for ODIAttributeKey(0);
    v18 = v17;
    swift_dynamicCast();
    sub_20A9D9874((_OWORD *)((char *)v37 + 8), v31);
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_20A9D9874(v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_20A9D9874(v35, v36);
    sub_20A9D9874(v36, &v32);
    result = sub_20A9E023C();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(_QWORD *)(v10 + 32) = v30;
    result = (uint64_t)sub_20A9D9874(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_20A9C13B8();
    return v2;
  }
  v14 = *(_QWORD *)(v27 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_20A9D97F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_20A9D982C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612118);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_20A9D9874(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

id ODIPartialAssessmentInitiator.__allocating_init(providerID:)(void *a1)
{
  objc_class *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  id v9;
  id v10;
  objc_super v12;

  v3 = sub_20A9DFF3C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v7[OBJC_IVAR____TtC7CoreODI29ODIPartialAssessmentInitiator_providerID] = a1;
  sub_20A9E00E0();
  v8 = v7;
  v9 = a1;
  sub_20A9DFF24();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v8[OBJC_IVAR____TtC7CoreODI29ODIPartialAssessmentInitiator_adapter], v6, v3);

  v12.receiver = v8;
  v12.super_class = v1;
  v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

id ODIPartialAssessmentInitiator.init(providerID:)(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  id v8;
  objc_class *v9;
  id v10;
  objc_super v12;

  v3 = sub_20A9DFF3C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v1[OBJC_IVAR____TtC7CoreODI29ODIPartialAssessmentInitiator_providerID] = a1;
  sub_20A9E00E0();
  v7 = v1;
  v8 = a1;
  sub_20A9DFF24();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(&v7[OBJC_IVAR____TtC7CoreODI29ODIPartialAssessmentInitiator_adapter], v6, v3);

  v9 = (objc_class *)type metadata accessor for ODIPartialAssessmentInitiator();
  v12.receiver = v7;
  v12.super_class = v9;
  v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

uint64_t type metadata accessor for ODIPartialAssessmentInitiator()
{
  uint64_t result;

  result = qword_254612140;
  if (!qword_254612140)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20A9D9BB4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  uint64_t v18;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612138);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_20A9DFB40();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20A9DFF18();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v18 - v12;
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BE1F280], v3);
  sub_20A9DFF30();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_20A9DFF0C();
  v14 = sub_20A9E0290();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v2, 1, 1, v14);
  sub_20A9DFF00();
  v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v11, v7);
  v16 = sub_20A9DFF0C();
  v15(v13, v7);
  return v16;
}

unint64_t sub_20A9D9DE0()
{
  return 0xD000000000000024;
}

id ODIPartialAssessmentInitiator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void ODIPartialAssessmentInitiator.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id ODIPartialAssessmentInitiator.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ODIPartialAssessmentInitiator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_20A9D9F24()
{
  return type metadata accessor for ODIPartialAssessmentInitiator();
}

uint64_t sub_20A9D9F2C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20A9DFF3C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ODIPartialAssessmentInitiator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ODIPartialAssessmentInitiator.__allocating_init(providerID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of ODIPartialAssessmentInitiator.makeInitialPartialAssessmentPayload()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of ODIPartialAssessmentInitiator.makeInitialPartialAssessmentID()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t sub_20A9D9FF0(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 88) = v1;
  *(_BYTE *)(v2 + 163) = a1;
  v3 = sub_20A9E0050();
  *(_QWORD *)(v2 + 96) = v3;
  *(_QWORD *)(v2 + 104) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 112) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9DA054()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 120) = *(_QWORD *)(*(_QWORD *)(v0 + 88) + 64);
  return swift_task_switch();
}

uint64_t sub_20A9DA070()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 120);
  swift_beginAccess();
  *(_QWORD *)(v0 + 128) = *(_QWORD *)(v1 + 112);
  swift_bridgeObjectRetain();
  return swift_task_switch();
}

uint64_t sub_20A9DA0C8()
{
  uint64_t v0;
  unint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v10;
  uint64_t v11;

  if (*(_QWORD *)(*(_QWORD *)(v0 + 128) + 16) && (v1 = sub_20A9BACE8(*(_BYTE *)(v0 + 163) & 1), (v2 & 1) != 0))
  {
    v4 = *(_QWORD *)(v0 + 104);
    v3 = *(_QWORD *)(v0 + 112);
    v6 = *(_QWORD *)(v0 + 88);
    v5 = *(_QWORD *)(v0 + 96);
    v7 = *(_BYTE *)(v0 + 163) & 1;
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 128) + 56) + 8 * v1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v6 + 24), *(_QWORD *)(v6 + 48));
    sub_20A9E026C();
    *(_QWORD *)(v0 + 72) = 0;
    *(_QWORD *)(v0 + 80) = 0xE000000000000000;
    *(_BYTE *)(v0 + 162) = v7;
    sub_20A9E02CC();
    sub_20A9E0110();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v3, *MEMORY[0x24BE1F7B0], v5);
    sub_20A9DFF90();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD, uint64_t))(v0 + 8))(0, v8);
  }
  else
  {
    v10 = *(_BYTE *)(v0 + 163);
    swift_bridgeObjectRelease();
    v11 = swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v11;
    *(_QWORD *)v11 = v0;
    *(_QWORD *)(v11 + 8) = sub_20A9DA2AC;
    *(_QWORD *)(v11 + 40) = *(_QWORD *)(v0 + 88);
    *(_BYTE *)(v11 + 64) = v10 & 1;
    return swift_task_switch();
  }
}

uint64_t sub_20A9DA2AC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9DA308()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 96);
  v5 = *(_BYTE *)(v0 + 163) & 1;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 88) + 24), *(_QWORD *)(*(_QWORD *)(v0 + 88) + 48));
  sub_20A9E026C();
  if (v1)
  {
    *(_QWORD *)(v0 + 56) = 0;
    *(_QWORD *)(v0 + 64) = 0xE000000000000000;
    *(_BYTE *)(v0 + 161) = v5;
    sub_20A9E02CC();
    sub_20A9E0110();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, *MEMORY[0x24BE1F7B0], v4);
    sub_20A9DFF90();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(1, v1);
  }
  else
  {
    *(_QWORD *)(v0 + 40) = 0;
    *(_QWORD *)(v0 + 48) = 0xE000000000000000;
    *(_BYTE *)(v0 + 160) = v5;
    sub_20A9E02CC();
    sub_20A9E0110();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, *MEMORY[0x24BE1F7B0], v4);
    sub_20A9DFF90();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    v7 = swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v7;
    *(_QWORD *)v7 = v0;
    *(_QWORD *)(v7 + 8) = sub_20A9DA580;
    *(_QWORD *)(v7 + 64) = *(_QWORD *)(v0 + 88);
    *(_BYTE *)(v7 + 96) = v5;
    return swift_task_switch();
  }
}

uint64_t sub_20A9DA580(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(2, a1);
}

uint64_t sub_20A9DA5D8(char a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v2 + 64) = v1;
  *(_BYTE *)(v2 + 200) = a1;
  v3 = a1 & 1;
  v4 = sub_20A9E0050();
  *(_QWORD *)(v2 + 72) = v4;
  *(_QWORD *)(v2 + 80) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 88) = swift_task_alloc();
  v5 = sub_20A9DFB40();
  *(_QWORD *)(v2 + 96) = v5;
  *(_QWORD *)(v2 + 104) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 112) = swift_task_alloc();
  v6 = swift_task_alloc();
  *(_QWORD *)(v2 + 120) = v6;
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = sub_20A9DA694;
  *(_QWORD *)(v6 + 40) = v1;
  *(_BYTE *)(v6 + 64) = v3;
  return swift_task_switch();
}

uint64_t sub_20A9DA694(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20A9DA6F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v5)(_QWORD, unint64_t);
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 128);
  swift_bridgeObjectRelease();
  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v6 = sub_20A9E00E0();
    v7 = v3;
    swift_bridgeObjectRetain();
    sub_20A9E0110();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 136) = v6;
    *(_QWORD *)(v0 + 144) = v7;
    sub_20A9E0110();
    swift_bridgeObjectRelease();
    sub_20A9E0110();
    sub_20A9E0110();
    *(_QWORD *)(v0 + 152) = 0xE000000000000000;
    sub_20A9DFB1C();
    *(_QWORD *)(v0 + 160) = sub_20A9DFB04();
    v5 = (uint64_t (*)(_QWORD, unint64_t))((int)*MEMORY[0x24BE1F208] + MEMORY[0x24BE1F208]);
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 168) = v4;
    *v4 = v0;
    v4[1] = sub_20A9DA8A0;
    return v5(0, 0xE000000000000000);
  }
}

uint64_t sub_20A9DA8A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 176) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    *(_QWORD *)(v4 + 184) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_20A9DA930()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 192) = *(_QWORD *)(*(_QWORD *)(v0 + 64) + 64);
  return swift_task_switch();
}

uint64_t sub_20A9DA94C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(_BYTE *)(v0 + 200);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v6 = *(_QWORD *)(v2 + 112);
  *(_QWORD *)(v2 + 112) = 0x8000000000000000;
  sub_20A9BCC90(v1, v3 & 1 | 0x100, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v2 + 112) = v6;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9DAA10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 96);
  swift_release();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_20A9DFA20();
  v5 = objc_msgSend(v4, sel_code);

  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BE1F2A8], v3);
  v6 = sub_20A9DFB34();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v8 = *(_QWORD *)(v0 + 80);
  v7 = *(_QWORD *)(v0 + 88);
  v10 = *(_QWORD *)(v0 + 64);
  v9 = *(_QWORD *)(v0 + 72);
  v11 = *(void **)(v0 + 176);
  if (v5 == (id)v6)
  {
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v10 + 24), *(_QWORD *)(v10 + 48));
    sub_20A9E026C();
    sub_20A9E0110();
    sub_20A9E0110();
    swift_bridgeObjectRelease();
    sub_20A9E0110();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 104))(v7, *MEMORY[0x24BE1F7B0], v9);
    sub_20A9DFF9C();
  }
  else
  {
    swift_bridgeObjectRelease();
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v10 + 24), *(_QWORD *)(v10 + 48));
    sub_20A9E026C();
    *(_QWORD *)(v0 + 40) = 0;
    *(_QWORD *)(v0 + 48) = 0xE000000000000000;
    sub_20A9E0110();
    *(_QWORD *)(v0 + 56) = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254611D98);
    sub_20A9E02CC();
    sub_20A9E0110();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 104))(v7, *MEMORY[0x24BE1F7B0], v9);
    sub_20A9DFFB4();
  }

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20A9DACE4(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 80) = a2;
  *(_QWORD *)(v3 + 88) = v2;
  *(_BYTE *)(v3 + 120) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C48);
  *(_QWORD *)(v3 + 96) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9DAD44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 80);
  v7 = sub_20A9E00E0();
  v8 = v2;
  swift_bridgeObjectRetain();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v1 + 16) && (v3 = sub_20A9BAC84(v7, v8), (v4 & 1) != 0))
  {
    v5 = *(_QWORD *)(v0 + 88);
    *(_QWORD *)(v0 + 104) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 80) + 56) + 8 * v3);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 112) = *(_QWORD *)(v5 + 64);
    return swift_task_switch();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20A9DAE34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  v3 = *(_BYTE *)(v0 + 120);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v6 = *(_QWORD *)(v2 + 112);
  *(_QWORD *)(v2 + 112) = 0x8000000000000000;
  sub_20A9BCC90(v1, v3 & 1, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v2 + 112) = v6;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_task_switch();
}

uint64_t sub_20A9DAEE4()
{
  swift_retain();
  swift_bridgeObjectRetain();
  return swift_task_switch();
}

uint64_t sub_20A9DAF2C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 112) + 112);
  if (*(_QWORD *)(v1 + 16) && (v2 = sub_20A9BACE8(*(_BYTE *)(v0 + 120) & 1 | 0x100u), (v3 & 1) != 0))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v2);
    swift_bridgeObjectRetain();
  }
  else
  {
    v4 = 0;
  }
  v5 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(v0 + 112);
  v8 = *(_QWORD *)(v0 + 88);
  v7 = *(_QWORD *)(v0 + 96);
  v9 = *(_QWORD *)(v0 + 80);
  v10 = *(_BYTE *)(v0 + 120) & 1;
  v11 = sub_20A9E0194();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 1, 1, v11);
  sub_20A9BF828(v8 + 24, v0 + 16);
  v12 = swift_allocObject();
  sub_20A9C13A0((__int128 *)(v0 + 16), v12 + 16);
  *(_QWORD *)(v12 + 56) = v4;
  *(_QWORD *)(v12 + 64) = v5;
  *(_QWORD *)(v12 + 72) = v9;
  *(_BYTE *)(v12 + 80) = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_254612188;
  v13[5] = v12;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_254612198;
  v14[5] = v13;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(_QWORD *)(v6 + 120) = sub_20A9C3E64(v7, (uint64_t)&unk_2546121A8, (uint64_t)v14);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9DB0B0()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

BOOL sub_20A9DB0FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_20A9DB114()
{
  sub_20A9E0368();
  sub_20A9E0374();
  return sub_20A9E0380();
}

uint64_t sub_20A9DB158()
{
  return sub_20A9E0374();
}

uint64_t sub_20A9DB180()
{
  sub_20A9E0368();
  sub_20A9E0374();
  return sub_20A9E0380();
}

BOOL sub_20A9DB1C0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_20A9DB1D4()
{
  sub_20A9E0368();
  sub_20A9E0374();
  sub_20A9E0374();
  return sub_20A9E0380();
}

uint64_t sub_20A9DB230()
{
  sub_20A9E0374();
  return sub_20A9E0374();
}

uint64_t sub_20A9DB26C()
{
  sub_20A9E0368();
  sub_20A9E0374();
  sub_20A9E0374();
  return sub_20A9E0380();
}

BOOL sub_20A9DB2C4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t sub_20A9DB2F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_20A9C1758;
  return v6();
}

uint64_t sub_20A9DB344(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_20A9C1758;
  return v7();
}

uint64_t sub_20A9DB398()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_20A9DB3C4(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = v1;
  *(_BYTE *)(v2 + 64) = a1;
  return swift_task_switch();
}

uint64_t sub_20A9DB3E0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 48) = *(_QWORD *)(*(_QWORD *)(v0 + 40) + 64);
  return swift_task_switch();
}

uint64_t sub_20A9DB3FC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_beginAccess();
  *(_QWORD *)(v0 + 56) = *(_QWORD *)(v1 + 112);
  swift_bridgeObjectRetain();
  return swift_task_switch();
}

uint64_t sub_20A9DB454()
{
  uint64_t v0;
  unint64_t v1;
  char v2;
  uint64_t v3;

  if (*(_QWORD *)(*(_QWORD *)(v0 + 56) + 16) && (v1 = sub_20A9BACE8(*(_BYTE *)(v0 + 64) & 1 | 0x100u), (v2 & 1) != 0))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 56) + 56) + 8 * v1);
    swift_bridgeObjectRetain();
  }
  else
  {
    v3 = 0;
  }
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

uint64_t sub_20A9DB4C4(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = v1;
  *(_BYTE *)(v2 + 96) = a1;
  return swift_task_switch();
}

uint64_t sub_20A9DB4E0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 72) = *(_QWORD *)(*(_QWORD *)(v0 + 64) + 64);
  return swift_task_switch();
}

uint64_t sub_20A9DB4FC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  swift_beginAccess();
  *(_QWORD *)(v0 + 80) = *(_QWORD *)(v1 + 112);
  swift_bridgeObjectRetain();
  return swift_task_switch();
}

uint64_t sub_20A9DB554()
{
  uint64_t v0;
  unint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  if (*(_QWORD *)(*(_QWORD *)(v0 + 80) + 16) && (v1 = sub_20A9BACE8(*(_BYTE *)(v0 + 96) & 1 | 0x200u), (v2 & 1) != 0))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 80) + 56) + 8 * v1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 64);
    v6 = *(_BYTE *)(v0 + 96);
    swift_bridgeObjectRelease();
    v7 = *(_QWORD *)(v5 + 16);
    if ((v6 & 1) != 0)
      v8 = sub_20A9C1ED0(v7);
    else
      v8 = sub_20A9C1778(v7);
    *(_QWORD *)(v0 + 88) = v8;
    return swift_task_switch();
  }
}

uint64_t sub_20A9DB610()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_BYTE *)(v0 + 96);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v6 = *(_QWORD *)(v2 + 112);
  *(_QWORD *)(v2 + 112) = 0x8000000000000000;
  sub_20A9BCC90(v1, v3 & 1 | 0x200, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v2 + 112) = v6;
  swift_bridgeObjectRelease();
  swift_endAccess();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 88));
}

uint64_t sub_20A9DB6C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v5 + 196) = a5;
  *(_QWORD *)(v5 + 56) = a3;
  *(_QWORD *)(v5 + 64) = a4;
  *(_QWORD *)(v5 + 40) = a1;
  *(_QWORD *)(v5 + 48) = a2;
  v6 = sub_20A9E0050();
  *(_QWORD *)(v5 + 72) = v6;
  *(_QWORD *)(v5 + 80) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 + 88) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20A9DB728()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 80);
  v2 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD **)(v0 + 40);
  v40 = *(_QWORD *)(v0 + 48);
  v5 = v4[3];
  *(_QWORD *)(v0 + 96) = v5;
  *(_QWORD *)(v0 + 104) = v4[4];
  *(_QWORD *)(v0 + 112) = __swift_project_boxed_opaque_existential_1(v4, v5);
  v6 = *MEMORY[0x24BE1F7B0];
  *(_DWORD *)(v0 + 192) = v6;
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 104);
  *(_QWORD *)(v0 + 120) = v7;
  v7(v2, v6, v3);
  sub_20A9DFF90();
  v41 = *(void (**)(uint64_t, uint64_t))(v1 + 8);
  *(_QWORD *)(v0 + 128) = v41;
  v41(v2, v3);
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 32) = v40;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2546121B0);
  sub_20A9E00F8();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  v7(v2, v6, v3);
  sub_20A9DFF90();
  swift_bridgeObjectRelease();
  v41(v2, v3);
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  sub_20A9DFC84();
  swift_bridgeObjectRetain();
  MEMORY[0x20BD29788]();
  swift_bridgeObjectRelease();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  v39 = v7;
  v7(v2, v6, v3);
  sub_20A9DFF90();
  swift_bridgeObjectRelease();
  v41(v2, v3);
  if (v40 && (sub_20A9DC188(*(_QWORD *)(v0 + 56), v40) & 1) != 0)
  {
    v8 = *(_QWORD *)(v0 + 88);
    v9 = *(_QWORD *)(v0 + 72);
    v7(v8, v6, v9);
    sub_20A9DFF90();
    v41(v8, v9);
LABEL_35:
    v36 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
    v37 = *(_QWORD *)(v0 + 88);
    v38 = *(_QWORD *)(v0 + 72);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 120))(v37, *(unsigned int *)(v0 + 192), v38);
    sub_20A9DFF90();
    v36(v37, v38);
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v10 = *(_QWORD *)(v0 + 88);
  v11 = *(_QWORD *)(v0 + 64);
  v12 = *(_QWORD *)(v0 + 72);
  sub_20A9E026C();
  swift_bridgeObjectRelease();
  sub_20A9E0110();
  swift_bridgeObjectRelease();
  sub_20A9E0110();
  v39(v10, v6, v12);
  sub_20A9DFF90();
  swift_bridgeObjectRelease();
  v41(v10, v12);
  v13 = *(_BYTE *)(v11 + 32);
  *(_BYTE *)(v0 + 197) = v13;
  v14 = -1;
  v15 = -1 << v13;
  if (-(-1 << v13) < 64)
    v14 = ~(-1 << -(char)v15);
  v16 = v14 & *(_QWORD *)(v11 + 64);
  swift_bridgeObjectRetain();
  if (!v16)
  {
    v26 = 63 - v15;
    v20 = *(_QWORD **)(v0 + 64);
    if ((unint64_t)(63 - v15) > 0x7F)
    {
      v27 = v20[9];
      if (v27)
      {
        v17 = 1;
LABEL_18:
        v19 = (v27 - 1) & v27;
        v18 = __clz(__rbit64(v27)) + (v17 << 6);
        goto LABEL_8;
      }
      if (v26 >= 0xC0)
      {
        v27 = v20[10];
        if (v27)
        {
          v17 = 2;
          goto LABEL_18;
        }
        if (v26 >= 0x100)
        {
          v27 = v20[11];
          if (v27)
          {
            v17 = 3;
            goto LABEL_18;
          }
          if (v26 >= 0x140)
          {
            v27 = v20[12];
            if (v27)
            {
              v17 = 4;
              goto LABEL_18;
            }
            v28 = 0;
            v29 = v26 >> 6;
            if (v29 <= 5)
              v29 = 5;
            v30 = v29 - 5;
            while (v30 != v28)
            {
              v27 = v20[v28++ + 13];
              if (v27)
              {
                v17 = v28 + 4;
                goto LABEL_18;
              }
            }
          }
        }
      }
    }
    v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 120);
    v31 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
    v33 = *(unsigned int *)(v0 + 192);
    v34 = *(_QWORD *)(v0 + 88);
    v35 = *(_QWORD *)(v0 + 72);
    swift_release();
    v32(v34, v33, v35);
    sub_20A9DFF90();
    v31(v34, v35);
    goto LABEL_35;
  }
  v17 = 0;
  v18 = __clz(__rbit64(v16));
  v19 = (v16 - 1) & v16;
  v20 = *(_QWORD **)(v0 + 64);
LABEL_8:
  *(_QWORD *)(v0 + 136) = v17;
  *(_QWORD *)(v0 + 144) = v19;
  if ((*(_BYTE *)(v0 + 196) & 1) != 0)
    v21 = 0xED000073646C6569;
  else
    v21 = 0xEE0073646C656946;
  if ((*(_BYTE *)(v0 + 196) & 1) != 0)
    v22 = 0x4661746144776172;
  else
    v22 = 0x73676E69646E6962;
  *(_QWORD *)(v0 + 152) = *(_QWORD *)(v20[6] + 16 * v18 + 8);
  *(_QWORD *)(v0 + 160) = *(_QWORD *)(v20[7] + 8 * v18);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(_QWORD *)(v0 + 16) = v22;
  *(_QWORD *)(v0 + 24) = v21;
  swift_bridgeObjectRetain();
  sub_20A9E0110();
  sub_20A9E0110();
  v23 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 168) = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 176) = v23;
  sub_20A9DFB1C();
  v24 = (uint64_t (*)(uint64_t))MEMORY[0x24BE1F210];
  *(_QWORD *)(v0 + 184) = sub_20A9DFB04();
  sub_20A9BA454(&qword_2546121B8, v24, MEMORY[0x24BE1F218]);
  sub_20A9E0170();
  return swift_task_switch();
}

uint64_t sub_20A9DBE0C()
{
  sub_20A9DFB10();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_20A9DBE60()
{
  uint64_t v0;
  uint64_t result;
  int64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 144);
  if (!v3)
  {
    v10 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
    }
    else
    {
      v11 = (unint64_t)((1 << *(_BYTE *)(v0 + 197)) + 63) >> 6;
      result = *(_QWORD *)(v0 + 64);
      if (v10 >= v11)
        goto LABEL_24;
      v12 = result + 64;
      v13 = *(_QWORD *)(result + 64 + 8 * v10);
      ++v2;
      if (v13)
      {
LABEL_13:
        v4 = (v13 - 1) & v13;
        v5 = __clz(__rbit64(v13)) + (v2 << 6);
        goto LABEL_3;
      }
      v2 = v10 + 1;
      if (v10 + 1 >= v11)
        goto LABEL_24;
      v13 = *(_QWORD *)(v12 + 8 * v2);
      if (v13)
        goto LABEL_13;
      v2 = v10 + 2;
      if (v10 + 2 >= v11)
        goto LABEL_24;
      v13 = *(_QWORD *)(v12 + 8 * v2);
      if (v13)
        goto LABEL_13;
      v14 = v10 + 3;
      if (v14 >= v11)
      {
LABEL_24:
        v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 120);
        v15 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
        v17 = *(unsigned int *)(v0 + 192);
        v18 = *(_QWORD *)(v0 + 88);
        v19 = *(_QWORD *)(v0 + 72);
        swift_release();
        v16(v18, v17, v19);
        sub_20A9DFF90();
        v15(v18, v19);
        v20 = *(void (**)(uint64_t, uint64_t))(v0 + 128);
        v21 = *(_QWORD *)(v0 + 88);
        v22 = *(_QWORD *)(v0 + 72);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v0 + 120))(v21, *(unsigned int *)(v0 + 192), v22);
        sub_20A9DFF90();
        v20(v21, v22);
        swift_task_dealloc();
        return (*(uint64_t (**)(void))(v0 + 8))();
      }
      v13 = *(_QWORD *)(v12 + 8 * v14);
      if (v13)
      {
        v2 = v14;
        goto LABEL_13;
      }
      while (1)
      {
        v2 = v14 + 1;
        if (__OFADD__(v14, 1))
          break;
        if (v2 >= v11)
          goto LABEL_24;
        v13 = *(_QWORD *)(v12 + 8 * v2);
        ++v14;
        if (v13)
          goto LABEL_13;
      }
    }
    __break(1u);
    return result;
  }
  v4 = (v3 - 1) & v3;
  v5 = __clz(__rbit64(v3)) | (v2 << 6);
  result = *(_QWORD *)(v0 + 64);
LABEL_3:
  *(_QWORD *)(v0 + 136) = v2;
  *(_QWORD *)(v0 + 144) = v4;
  if ((*(_BYTE *)(v0 + 196) & 1) != 0)
    v6 = 0xED000073646C6569;
  else
    v6 = 0xEE0073646C656946;
  if ((*(_BYTE *)(v0 + 196) & 1) != 0)
    v7 = 0x4661746144776172;
  else
    v7 = 0x73676E69646E6962;
  *(_QWORD *)(v0 + 152) = *(_QWORD *)(*(_QWORD *)(result + 48) + 16 * v5 + 8);
  *(_QWORD *)(v0 + 160) = *(_QWORD *)(*(_QWORD *)(result + 56) + 8 * v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(_QWORD *)(v0 + 16) = v7;
  *(_QWORD *)(v0 + 24) = v6;
  swift_bridgeObjectRetain();
  sub_20A9E0110();
  sub_20A9E0110();
  v8 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 168) = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 176) = v8;
  sub_20A9DFB1C();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x24BE1F210];
  *(_QWORD *)(v0 + 184) = sub_20A9DFB04();
  sub_20A9BA454(&qword_2546121B8, v9, MEMORY[0x24BE1F218]);
  sub_20A9E0170();
  return swift_task_switch();
}

uint64_t sub_20A9DC188(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, uint64_t);
  BOOL v20;
  uint64_t v22;
  uint64_t v23;

  v4 = sub_20A9DFC84();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v22 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v17 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v22 = *(_QWORD *)(v8 + 72);
      v23 = v8;
      v13 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
      v14 = v11 - 1;
      do
      {
        v15 = a1;
        v13(v10, a1 + v12, v4);
        v16 = a2;
        v13(v7, a2 + v12, v4);
        sub_20A9BA454(&qword_254611C38, (uint64_t (*)(uint64_t))MEMORY[0x24BE1F420], MEMORY[0x24BE1F438]);
        v17 = sub_20A9E00B0();
        v18 = *(void (**)(char *, uint64_t))(v23 + 8);
        v18(v7, v4);
        v18(v10, v4);
        v20 = v14-- != 0;
        if ((v17 & 1) == 0)
          break;
        v12 += v22;
        a2 = v16;
        a1 = v15;
      }
      while (v20);
    }
  }
  else
  {
    v17 = 0;
  }
  return v17 & 1;
}

uint64_t sub_20A9DC30C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ODIFieldsManager()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ODIFieldsManager.FieldsKeeper()
{
  return objc_opt_self();
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ODIFieldsKey(unsigned __int16 *a1, unsigned int a2)
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
  if (a2 + 65281 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65281 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65281;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65281;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65281;
  }
LABEL_17:
  v6 = *(unsigned __int8 *)a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ODIFieldsKey(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65281 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65281 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_20A9DC470 + 4 * byte_20A9E1415[v4]))();
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_20A9DC4A4 + 4 * byte_20A9E1410[v4]))();
}

uint64_t sub_20A9DC4A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_20A9DC4AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x20A9DC4B4);
  return result;
}

uint64_t sub_20A9DC4C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x20A9DC4C8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20A9DC4CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_20A9DC4D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ODIFieldsKey()
{
  return &type metadata for ODIFieldsKey;
}

unint64_t sub_20A9DC4F4()
{
  unint64_t result;

  result = qword_254612150;
  if (!qword_254612150)
  {
    result = MEMORY[0x20BD29DF4](&unk_20A9E1494, &type metadata for ODIFieldsKey);
    atomic_store(result, &qword_254612150);
  }
  return result;
}

uint64_t sub_20A9DC538()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20A9DC574()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _QWORD *v7;

  v2 = v0 + 16;
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 72);
  v6 = *(_BYTE *)(v0 + 80);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_20A9B824C;
  return sub_20A9DB6C0(v2, v3, v4, v5, v6);
}

uint64_t sub_20A9DC5F0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_20A9C1758;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_254612190 + dword_254612190))(v2, v3, v4);
}

uint64_t objectdestroy_7Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20A9DC698(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_20A9C1758;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2546121A0 + dword_2546121A0))(a1, v4, v5, v6);
}

_QWORD *sub_20A9DC71C(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v4 = v3;
  v6 = sub_20A9E0050();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_20A9DFA98();
  v16 = MEMORY[0x24BE1F190];
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v14);
  sub_20A9DFA74();
  sub_20A9C13A0(&v14, (uint64_t)(v3 + 3));
  __swift_project_boxed_opaque_existential_1(v4 + 3, v4[6]);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BE1F7C0], v6);
  sub_20A9DFF9C();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v3[2] = a3;
  type metadata accessor for ODIFieldsManager.FieldsKeeper();
  v10 = swift_allocObject();
  v11 = a3;
  swift_defaultActor_initialize();
  *(_QWORD *)(v10 + 112) = sub_20A9D7180(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v10 + 120) = 0;
  v4[8] = v10;
  return v4;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ODIFieldsSource(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ODIFieldsSource(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20A9DC968 + 4 * byte_20A9E141F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_20A9DC99C + 4 * byte_20A9E141A[v4]))();
}

uint64_t sub_20A9DC99C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20A9DC9A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20A9DC9ACLL);
  return result;
}

uint64_t sub_20A9DC9B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20A9DC9C0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_20A9DC9C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20A9DC9CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20A9DC9D8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_20A9DC9E4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ODIFieldsSource()
{
  return &type metadata for ODIFieldsSource;
}

uint64_t getEnumTagSinglePayload for ODIFieldsCategory(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ODIFieldsCategory(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20A9DCAD8 + 4 * byte_20A9E1429[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_20A9DCB0C + 4 * byte_20A9E1424[v4]))();
}

uint64_t sub_20A9DCB0C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20A9DCB14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20A9DCB1CLL);
  return result;
}

uint64_t sub_20A9DCB28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20A9DCB30);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20A9DCB34(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20A9DCB3C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_20A9DCB48(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ODIFieldsCategory()
{
  return &type metadata for ODIFieldsCategory;
}

unint64_t sub_20A9DCB68()
{
  unint64_t result;

  result = qword_2546121C0;
  if (!qword_2546121C0)
  {
    result = MEMORY[0x20BD29DF4](&unk_20A9E1594, &type metadata for ODIFieldsCategory);
    atomic_store(result, (unint64_t *)&qword_2546121C0);
  }
  return result;
}

unint64_t sub_20A9DCBB0()
{
  unint64_t result;

  result = qword_2546121C8;
  if (!qword_2546121C8)
  {
    result = MEMORY[0x20BD29DF4](&unk_20A9E15FC, &type metadata for ODIFieldsSource);
    atomic_store(result, (unint64_t *)&qword_2546121C8);
  }
  return result;
}

BOOL sub_20A9DCBF4(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _BOOL4 v8;

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 16))
    {
      v5 = 3;
      return v2 < v5;
    }
LABEL_6:
    v6 = v3 | v4;
    if (v3 ^ 1 | v4)
      v5 = 2;
    else
      v5 = 1;
    if (!v6)
      v5 = 0;
    return v2 < v5;
  }
  if ((*(_BYTE *)(a2 + 16) & 1) != 0)
  {
    v2 = 3;
    goto LABEL_6;
  }
  v8 = *(_QWORD *)(a1 + 8) < v4;
  if (v2 == v3)
    return v8;
  else
    return v3 < (uint64_t)v2;
}

BOOL sub_20A9DCC6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _BOOL4 v8;
  _BOOL4 v9;

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)a2;
  if ((*(_BYTE *)(a2 + 16) & 1) != 0)
  {
    if (!*(_BYTE *)(a1 + 16))
    {
      v5 = 3;
      return v4 >= v5;
    }
LABEL_6:
    v6 = v2 | v3;
    if (v2 ^ 1 | v3)
      v5 = 2;
    else
      v5 = 1;
    if (!v6)
      v5 = 0;
    return v4 >= v5;
  }
  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    v4 = 3;
    goto LABEL_6;
  }
  v8 = *(_QWORD *)(a2 + 8) < v3;
  if (v4 == v2)
    v9 = v8;
  else
    v9 = v2 < (uint64_t)v4;
  return !v9;
}

BOOL sub_20A9DCCEC(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _BOOL4 v8;
  _BOOL4 v9;

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 16))
    {
      v5 = 3;
      return v2 >= v5;
    }
LABEL_6:
    v6 = v3 | v4;
    if (v3 ^ 1 | v4)
      v5 = 2;
    else
      v5 = 1;
    if (!v6)
      v5 = 0;
    return v2 >= v5;
  }
  if ((*(_BYTE *)(a2 + 16) & 1) != 0)
  {
    v2 = 3;
    goto LABEL_6;
  }
  v8 = *(_QWORD *)(a1 + 8) < v4;
  if (v2 == v3)
    v9 = v8;
  else
    v9 = v3 < (uint64_t)v2;
  return !v9;
}

BOOL sub_20A9DCD6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _BOOL4 v8;

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)a2;
  if ((*(_BYTE *)(a2 + 16) & 1) != 0)
  {
    if (!*(_BYTE *)(a1 + 16))
    {
      v5 = 3;
      return v4 < v5;
    }
LABEL_6:
    v6 = v2 | v3;
    if (v2 ^ 1 | v3)
      v5 = 2;
    else
      v5 = 1;
    if (!v6)
      v5 = 0;
    return v4 < v5;
  }
  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    v4 = 3;
    goto LABEL_6;
  }
  v8 = *(_QWORD *)(a2 + 8) < v3;
  if (v4 == v2)
    return v8;
  else
    return v2 < (uint64_t)v4;
}

uint64_t *sub_20A9DCDE4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __int128 v3;

  v2 = *result;
  if (*result == 1)
  {
    v3 = 1uLL;
    goto LABEL_9;
  }
  if (v2 == 2)
  {
    v3 = 2uLL;
LABEL_8:
    LOBYTE(v2) = 1;
    goto LABEL_9;
  }
  if (v2 != 3)
  {
    v3 = 0uLL;
    goto LABEL_8;
  }
  LOBYTE(v2) = 0;
  v3 = *(_OWORD *)(result + 1);
LABEL_9:
  *(_OWORD *)a2 = v3;
  *(_BYTE *)(a2 + 16) = v2;
  *(_BYTE *)(a2 + 17) = 0;
  return result;
}

void sub_20A9DCE3C(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)v1;
  v3 = *(_QWORD *)(v1 + 8);
  v4 = 3;
  if (*(_BYTE *)(v1 + 16))
  {
    v4 = *(_QWORD *)v1;
    v2 = 0;
    v3 = 0;
  }
  *a1 = v4;
  a1[1] = v2;
  a1[2] = v3;
}

BOOL sub_20A9DCE64(uint64_t *a1, unint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v8;
  BOOL v9;

  v3 = *a1;
  v2 = a1[1];
  v5 = *a2;
  v4 = a2[1];
  if (*((_BYTE *)a1 + 16) == 1)
  {
    if (v3 | v2)
    {
      if (v3 ^ 1 | v2)
      {
        if (*((_BYTE *)a2 + 16) && __PAIR128__(v4, v5) >= 2)
          return 1;
      }
      else if (*((_BYTE *)a2 + 16) && !(v5 ^ 1 | v4))
      {
        return 1;
      }
    }
    else
    {
      v8 = v5 | v4;
      if (*((_BYTE *)a2 + 16))
        v9 = v8 == 0;
      else
        v9 = 0;
      if (v9)
        return 1;
    }
    return 0;
  }
  if ((a2[2] & 1) != 0)
    return 0;
  return v3 == v5 && v2 == v4;
}

uint64_t *sub_20A9DCEEC@<X0>(uint64_t *result@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  v2 = *result;
  if ((unint64_t)*result >= 3)
    LOBYTE(v2) = 3;
  *a2 = v2;
  return result;
}

void sub_20A9DCF04(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

BOOL sub_20A9DCF10(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_20A9DCF24(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_20A9DCF38(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_20A9DCF4C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

uint64_t sub_20A9DCF60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  void (*v19)(char *, char *, uint64_t);
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  char *v23;
  uint64_t v24;
  void *v25;
  void (*v26)(char *, uint64_t, uint64_t);
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t result;
  _QWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;

  v1 = v0;
  v2 = sub_20A9E0050();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_20A9DFF18();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v41 = (char *)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v34 - v10;
  v12 = sub_20A9DFC30();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v40 = (char *)v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = v1 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_partialAssessment;
  swift_beginAccess();
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v42 = v15;
  v17 = v15;
  v18 = v16;
  v16(v11, v17, v6);
  if ((*(unsigned int (**)(char *, uint64_t))(v7 + 88))(v11, v6) == *MEMORY[0x24BE1F678])
  {
    v37 = v5;
    v38 = v3;
    v39 = v2;
    (*(void (**)(char *, uint64_t))(v7 + 96))(v11, v6);
    v35 = v13;
    v36 = v12;
    v19 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v20 = v40;
    v19(v40, v11, v12);
    v21 = MEMORY[0x20BD29F38](v1 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_delegate);
    v22 = v18;
    v23 = v41;
    v24 = v42;
    if (v21)
    {
      v25 = (void *)v21;
      v22(v41, v42, v6);
      sub_20A9DFF0C();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v23, v6);
      v26 = v22;
      v27 = (void *)sub_20A9E00BC();
      swift_bridgeObjectRelease();
      sub_20A9DFC24();
      v28 = (void *)sub_20A9E00BC();
      swift_bridgeObjectRelease();
      objc_msgSend(v25, sel_didChangeStateWith_assessmentID_, v27, v28);

      v22 = v26;
      v24 = v42;

      swift_unknownObjectRelease();
    }
    v29 = *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger + 24);
    v34[1] = *(_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger + 32);
    v34[0] = __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger), v29);
    v43 = 0;
    v44 = 0xE000000000000000;
    sub_20A9E026C();
    swift_bridgeObjectRelease();
    v43 = 0xD000000000000029;
    v44 = 0x800000020A9F4010;
    sub_20A9DFC24();
    sub_20A9E0110();
    swift_bridgeObjectRelease();
    sub_20A9E0110();
    v22(v23, v24, v6);
    sub_20A9DFF0C();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v23, v6);
    sub_20A9E0110();
    swift_bridgeObjectRelease();
    sub_20A9E0110();
    v31 = v37;
    v30 = v38;
    v32 = v39;
    (*(void (**)(char *, _QWORD, uint64_t))(v38 + 104))(v37, *MEMORY[0x24BE1F7A8], v39);
    sub_20A9DFF9C();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v32);
    result = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v20, v36);
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  }
  if (*(_BYTE *)(v1 + 136) == 1 && *(_OWORD *)(v1 + 120) >= 2uLL)
  {
    swift_beginAccess();
    sub_20A9DFD20();
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_20A9DD350(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[3];
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t v27;

  v5 = v4;
  v9 = a3 & 1;
  v10 = sub_20A9E0050();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v5 + 120);
  if ((*(_BYTE *)(v5 + 136) & 1) != 0)
  {
    if (!v9)
      goto LABEL_14;
    if (!(a1 | a2))
      goto LABEL_9;
  }
  else
  {
    if (!v9)
    {
      if (v14 == a1)
      {
        if (*(_QWORD *)(v5 + 128) >= a2)
          goto LABEL_9;
      }
      else if ((uint64_t)v14 <= a1)
      {
        goto LABEL_9;
      }
      goto LABEL_14;
    }
    v14 = 3;
    if (!(a1 | a2))
    {
LABEL_9:
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger), *(_QWORD *)(v5 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger + 24));
      v23 = 0;
      v24 = 0xE000000000000000;
      sub_20A9E026C();
      v26 = v23;
      v27 = v24;
      sub_20A9E0110();
      v23 = a1;
      v24 = a2;
      v25 = v9 != 0;
      sub_20A9E02CC();
      (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BE1F7A8], v10);
      sub_20A9DFF90();
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
  }
  if (a1 ^ 1 | a2)
  {
    if (v14 >= 2)
      goto LABEL_9;
  }
  else if (v14)
  {
    goto LABEL_9;
  }
LABEL_14:
  v21 = v9 != 0;
  v16 = *(_QWORD *)(v5 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger + 24);
  v20[2] = *(_QWORD *)(v5 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger + 32);
  v20[1] = __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger), v16);
  v23 = 0;
  v24 = 0xE000000000000000;
  v22 = a4;
  sub_20A9E026C();
  v26 = v23;
  v27 = v24;
  sub_20A9E0110();
  v23 = a1;
  v24 = a2;
  v25 = v9 != 0;
  sub_20A9E02CC();
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BE1F7A8], v10);
  sub_20A9DFF90();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v17 = v5 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_partialAssessment;
  swift_beginAccess();
  v18 = sub_20A9DFF18();
  v19 = v22;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v17, v22, v18);
  swift_endAccess();
  *(_QWORD *)(v5 + 120) = a1;
  *(_QWORD *)(v5 + 128) = a2;
  *(_BYTE *)(v5 + 136) = v21;
  sub_20A9DCF60();
  return sub_20A9DD68C(v19, a1, a2);
}

uint64_t sub_20A9DD68C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  int v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  _QWORD **v24;
  _QWORD *v25;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  _QWORD **v31;
  _QWORD *v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v43 = a3;
  v4 = sub_20A9DFEB8();
  v40 = *(_QWORD *)(v4 - 8);
  v41 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v39 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_20A9DFBAC();
  v45 = *(_QWORD *)(v42 - 8);
  v6 = MEMORY[0x24BDAC7A8](v42);
  v38 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v37 - v8;
  v10 = sub_20A9DFC30();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_20A9DFF18();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, v14);
  v18 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v17, v14);
  if (v18 == *MEMORY[0x24BE1F678])
  {
    (*(void (**)(char *, uint64_t))(v15 + 96))(v17, v14);
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v17, v10);
    sub_20A9DFC24();
    sub_20A9DFB94();
    v24 = (_QWORD **)(v44 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_feedbackTracker);
    swift_beginAccess();
    v25 = *v24;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v24 = v25;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v25 = (_QWORD *)sub_20A9BAB10(0, v25[2] + 1, 1, v25);
      *v24 = v25;
    }
    v27 = v42;
    v29 = v25[2];
    v28 = v25[3];
    if (v29 >= v28 >> 1)
    {
      v25 = (_QWORD *)sub_20A9BAB10(v28 > 1, v29 + 1, 1, v25);
      *v24 = v25;
    }
    v25[2] = v29 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v45 + 32))((unint64_t)v25+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(_QWORD *)(v45 + 72) * v29, v9, v27);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else if (v18 == *MEMORY[0x24BE1F668])
  {
    (*(void (**)(char *, uint64_t))(v15 + 96))(v17, v14);
    v20 = v39;
    v19 = v40;
    v21 = v17;
    v22 = v41;
    (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v39, v21, v41);
    v23 = v38;
    sub_20A9DFEAC();
    sub_20A9DFB94();
    v31 = (_QWORD **)(v44 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_feedbackTracker);
    swift_beginAccess();
    v32 = *v31;
    v33 = swift_isUniquelyReferenced_nonNull_native();
    *v31 = v32;
    if ((v33 & 1) == 0)
    {
      v32 = (_QWORD *)sub_20A9BAB10(0, v32[2] + 1, 1, v32);
      *v31 = v32;
    }
    v34 = v42;
    v36 = v32[2];
    v35 = v32[3];
    if (v36 >= v35 >> 1)
    {
      v32 = (_QWORD *)sub_20A9BAB10(v35 > 1, v36 + 1, 1, v32);
      *v31 = v32;
    }
    v32[2] = v36 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v45 + 32))((unint64_t)v32+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(_QWORD *)(v45 + 72) * v36, v23, v34);
    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v20, v22);
  }
  else
  {
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
}

uint64_t sub_20A9DDBEC()
{
  return sub_20A9DDC2C(MEMORY[0x24BE1F268], 0x800000020A9F3F60, 1);
}

uint64_t sub_20A9DDC0C()
{
  return sub_20A9DDC2C(MEMORY[0x24BE1F270], 0x800000020A9F3F30, 2);
}

uint64_t sub_20A9DDC2C(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  _QWORD v21[3];
  uint64_t v22;

  v21[2] = a2;
  v22 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612138);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20A9DFB40();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_20A9DFF18();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v21 - v16;
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *a1, v7);
  sub_20A9DFF30();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_20A9DFF0C();
  v18 = sub_20A9E0290();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v6, 1, 1, v18);
  sub_20A9DFF00();
  v19 = *(void (**)(char *, uint64_t))(v12 + 8);
  v19(v15, v11);
  sub_20A9DD350(v22, 0, 1, (uint64_t)v17);
  return ((uint64_t (*)(char *, uint64_t))v19)(v17, v11);
}

uint64_t sub_20A9DDE10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v13;
  void (*v14)(_QWORD);
  void (*v15)(char *, uint64_t);
  char **v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  void (*v33)(char *, uint64_t);
  char *v34;
  char *v35;
  uint64_t v36;
  unsigned int v37;
  void (*v38)(char *, _QWORD, uint64_t);
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;

  v36 = sub_20A9DFBAC();
  v40 = *(_QWORD *)(v36 - 8);
  v5 = MEMORY[0x24BDAC7A8](v36);
  v34 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v35 = (char *)&v33 - v7;
  v8 = sub_20A9E0050();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)(v2 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger);
  v13 = *(_QWORD *)(v2 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger + 24);
  v41 = *(_QWORD *)(v2 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger), v13);
  v45 = 0;
  v46 = 0xE000000000000000;
  sub_20A9E026C();
  sub_20A9E0110();
  sub_20A9E0110();
  v14 = *(void (**)(_QWORD))(v9 + 104);
  v37 = *MEMORY[0x24BE1F7A8];
  v38 = (void (*)(char *, _QWORD, uint64_t))v14;
  v14(v11);
  sub_20A9DFF9C();
  swift_bridgeObjectRelease();
  v15 = *(void (**)(char *, uint64_t))(v9 + 8);
  v39 = v11;
  v41 = v8;
  v15(v11, v8);
  v16 = (char **)((char *)v42 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_feedbackTracker);
  swift_beginAccess();
  v17 = *v16;
  v18 = *((_QWORD *)*v16 + 2);
  if (!v18)
  {
LABEL_10:
    __swift_project_boxed_opaque_existential_1(v12, v12[3]);
    v43 = 0;
    v44 = 0xE000000000000000;
    sub_20A9E026C();
    swift_bridgeObjectRelease();
    v43 = 0xD000000000000027;
    v44 = 0x800000020A9F3F00;
    sub_20A9E0110();
    v25 = v39;
    v26 = v41;
    v38(v39, v37, v41);
    sub_20A9DFFB4();
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(char *, uint64_t))v15)(v25, v26);
  }
  v42 = (uint64_t *)v16;
  v33 = v15;
  v19 = (*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
  v20 = *(_QWORD *)(v40 + 72);
  swift_bridgeObjectRetain();
  v21 = 0;
  while (1)
  {
    v23 = sub_20A9DFB88();
    if (!v24)
      goto LABEL_4;
    if (v23 == a1 && v24 == a2)
      break;
    v22 = sub_20A9E032C();
    swift_bridgeObjectRelease();
    if ((v22 & 1) != 0)
      goto LABEL_11;
LABEL_4:
    ++v21;
    v19 += v20;
    if (v18 == v21)
    {
      swift_bridgeObjectRelease();
      v15 = v33;
      goto LABEL_10;
    }
  }
  swift_bridgeObjectRelease();
LABEL_11:
  swift_bridgeObjectRelease();
  v28 = v40;
  v29 = v42;
  v31 = v35;
  v30 = v36;
  if (v21 >= *(_QWORD *)(*v42 + 16))
  {
    __break(1u);
    goto LABEL_17;
  }
  v32 = v34;
  (*(void (**)(char *, unint64_t, uint64_t))(v40 + 16))(v34, *v42 + v19, v36);
  sub_20A9DFBA0();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v32, v30);
  swift_beginAccess();
  v17 = (char *)*v29;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v29 = (uint64_t)v17;
  if ((result & 1) == 0)
  {
LABEL_17:
    result = sub_20A9DEAE4(v17);
    v17 = (char *)result;
    *v29 = result;
  }
  if (v21 >= *((_QWORD *)v17 + 2))
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v28 + 40))(&v17[v19], v31, v30);
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_20A9DE1F8(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  int isUniquelyReferenced_nonNull_native;
  _QWORD *v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  char v24;
  _QWORD *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  _QWORD *v33;

  v5 = sub_20A9DFC84();
  v6 = *(_QWORD *)(v5 - 8);
  result = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a1 + 16);
  if (!v10)
    return result;
  v11 = (_QWORD *)(v2 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_armandDataInitialized);
  v12 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  v13 = *(_QWORD *)(v6 + 72);
  v30 = a2 & 1;
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v31 = v13;
  v32 = v14;
  v29 = a1;
  swift_bridgeObjectRetain();
  while (1)
  {
    v32(v9, v12, v5);
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v33 = (_QWORD *)*v11;
    v16 = v33;
    *v11 = 0x8000000000000000;
    v18 = sub_20A9BAD50((uint64_t)v9);
    v19 = v16[2];
    v20 = (v17 & 1) == 0;
    v21 = v19 + v20;
    if (__OFADD__(v19, v20))
      break;
    v22 = v17;
    if (v16[3] >= v21)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v25 = v33;
        if ((v17 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        sub_20A9BD510();
        v25 = v33;
        if ((v22 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      sub_20A9BBB8C(v21, isUniquelyReferenced_nonNull_native);
      v23 = sub_20A9BAD50((uint64_t)v9);
      if ((v22 & 1) != (v24 & 1))
        goto LABEL_20;
      v18 = v23;
      v25 = v33;
      if ((v22 & 1) != 0)
      {
LABEL_3:
        *(_BYTE *)(v25[7] + v18) = v30;
        goto LABEL_4;
      }
    }
    v25[(v18 >> 6) + 8] |= 1 << v18;
    v32((char *)(v25[6] + v18 * v31), (uint64_t)v9, v5);
    *(_BYTE *)(v25[7] + v18) = v30;
    v26 = v25[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
      goto LABEL_19;
    v25[2] = v28;
LABEL_4:
    *v11 = v25;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    swift_endAccess();
    v12 += v31;
    if (!--v10)
      return swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  result = sub_20A9E0344();
  __break(1u);
  return result;
}

void sub_20A9DE440(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612138);
  MEMORY[0x24BDAC7A8](v2);
  v3 = type metadata accessor for ODISessionStateMachine.ApplyTimingCase(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A9DEA58(a1, (uint64_t)v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
  v7 = (char *)sub_20A9DE520
     + 4
     * byte_20A9E1630[(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v5, 5, v6)];
  __asm { BR              X10 }
}

uint64_t sub_20A9DE520()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_20A9DEA9C(v1, v3);
  swift_beginAccess();
  sub_20A9DFD2C();
  swift_endAccess();
  sub_20A9C16D4(v3, &qword_254612138);
  v5 = v2 + *(_QWORD *)(v4 + 1136);
  swift_beginAccess();
  v6 = sub_20A9DFDE0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v0, v5, v6);
}

uint64_t sub_20A9DE678()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_partialAssessment;
  v2 = sub_20A9DFF18();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  v3 = v0 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTiming;
  v4 = sub_20A9DFDE0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger);

  swift_bridgeObjectRelease();
  sub_20A9C13C0(v0 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_delegate);
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_20A9DE73C()
{
  return type metadata accessor for ODISessionStateMachine(0);
}

uint64_t type metadata accessor for ODISessionStateMachine(uint64_t a1)
{
  return sub_20A9D70F0(a1, (uint64_t *)&unk_2546121F8);
}

uint64_t sub_20A9DE758()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_20A9DFF18();
  if (v1 <= 0x3F)
  {
    result = sub_20A9DFDE0();
    if (v2 <= 0x3F)
      return swift_updateClassMetadata2();
  }
  return result;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for State(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for State(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = 0;
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
  *(_BYTE *)(result + 17) = v3;
  return result;
}

uint64_t sub_20A9DE89C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_20A9DE8B8(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    *(_BYTE *)(result + 16) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for State()
{
  return &type metadata for State;
}

uint64_t storeEnumTagSinglePayload for DeviceDataOrigin(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20A9DE934 + 4 * byte_20A9E163B[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_20A9DE968 + 4 * byte_20A9E1636[v4]))();
}

uint64_t sub_20A9DE968(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20A9DE970(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20A9DE978);
  return result;
}

uint64_t sub_20A9DE984(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20A9DE98CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_20A9DE990(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20A9DE998(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DeviceDataOrigin()
{
  return &type metadata for DeviceDataOrigin;
}

unint64_t sub_20A9DE9B8()
{
  unint64_t result;

  result = qword_254612208;
  if (!qword_254612208)
  {
    result = MEMORY[0x20BD29DF4](&unk_20A9E17F4, &type metadata for DeviceDataOrigin);
    atomic_store(result, (unint64_t *)&qword_254612208);
  }
  return result;
}

unint64_t sub_20A9DEA00()
{
  unint64_t result;

  result = qword_254612210;
  if (!qword_254612210)
  {
    result = MEMORY[0x20BD29DF4](&unk_20A9E181C, &type metadata for State);
    atomic_store(result, (unint64_t *)&qword_254612210);
  }
  return result;
}

uint64_t type metadata accessor for ODISessionStateMachine.ApplyTimingCase(uint64_t a1)
{
  return sub_20A9D70F0(a1, (uint64_t *)&unk_254612218);
}

uint64_t sub_20A9DEA58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ODISessionStateMachine.ApplyTimingCase(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20A9DEA9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612138);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

size_t sub_20A9DEAE4(_QWORD *a1)
{
  return sub_20A9BAB10(0, a1[2], 0, a1);
}

uint64_t sub_20A9DEAF8(uint64_t a1, void *a2, uint64_t a3)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_class *v21;
  char *v22;
  void *v23;
  id v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  void (*v34)(char *, uint64_t, uint64_t);
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  char *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  objc_super v46;

  v4 = v3;
  v38 = a3;
  v39 = a2;
  v45 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612138);
  MEMORY[0x24BDAC7A8](v5);
  v42 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20A9DFF18();
  v43 = *(_QWORD *)(v7 - 8);
  v44 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v40 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v41 = (char *)&v32 - v10;
  v11 = sub_20A9DFF3C();
  v36 = *(_QWORD *)(v11 - 8);
  v37 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_20A9DFB40();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_defaultActor_initialize();
  *(_BYTE *)(v3 + 112) = 0;
  *(_QWORD *)(v3 + 120) = 0;
  *(_QWORD *)(v3 + 128) = 0;
  *(_BYTE *)(v3 + 136) = 1;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_armandDataInitialized) = MEMORY[0x24BEE4B00];
  *(_BYTE *)(v3 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_assessmentTriggered) = 0;
  sub_20A9DFDD4();
  v18 = OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_feedbackTracker;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254611C40);
  sub_20A9DFBAC();
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_20A9E1270;
  v20 = *MEMORY[0x24BE1F280];
  v34 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 104);
  v34(v17, v20, v14);
  sub_20A9DFB34();
  v33 = *(void (**)(char *, uint64_t))(v15 + 8);
  v33(v17, v14);
  v35 = 0x800000020A9F3A20;
  sub_20A9DFB94();
  *(_QWORD *)(v3 + v18) = v19;
  swift_unknownObjectWeakInit();
  sub_20A9BF828(v45, v3 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_logger);
  swift_unknownObjectWeakAssign();
  v21 = (objc_class *)type metadata accessor for ODIPartialAssessmentInitiator();
  v22 = (char *)objc_allocWithZone(v21);
  v23 = v39;
  *(_QWORD *)&v22[OBJC_IVAR____TtC7CoreODI29ODIPartialAssessmentInitiator_providerID] = v39;
  sub_20A9E00E0();
  v24 = v23;
  v25 = v22;
  sub_20A9DFF24();
  (*(void (**)(char *, char *, uint64_t))(v36 + 32))(&v25[OBJC_IVAR____TtC7CoreODI29ODIPartialAssessmentInitiator_adapter], v13, v37);

  v46.receiver = v25;
  v46.super_class = v21;
  *(_QWORD *)(v4 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_initiator) = objc_msgSendSuper2(&v46, sel_init);
  v34(v17, v20, v14);
  v26 = v40;
  sub_20A9DFF30();
  v33(v17, v14);
  sub_20A9DFF0C();
  v27 = sub_20A9E0290();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v42, 1, 1, v27);
  v28 = v41;
  sub_20A9DFF00();
  v30 = v43;
  v29 = v44;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v26, v44);
  __swift_destroy_boxed_opaque_existential_1(v45);
  (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v4 + OBJC_IVAR____TtC7CoreODI22ODISessionStateMachine_partialAssessment, v28, v29);
  return v4;
}

uint64_t *sub_20A9DEF28(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 5, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v10 = sub_20A9E0290();
      v11 = *(_QWORD *)(v10 - 8);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v11 + 48))(a2, 1, v10))
      {
        v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612138);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v11 + 16))(a1, a2, v10);
        (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v11 + 56))(a1, 0, 1, v10);
      }
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 5, v7);
    }
  }
  return a1;
}

uint64_t sub_20A9DF058(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 5, v2);
  if (!(_DWORD)result)
  {
    v4 = sub_20A9E0290();
    v5 = *(_QWORD *)(v4 - 8);
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4);
    if (!(_DWORD)result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  }
  return result;
}

void *sub_20A9DF0E8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 5, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = sub_20A9E0290();
    v9 = *(_QWORD *)(v8 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612138);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(a1, a2, v8);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
    }
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 5, v6);
  }
  return a1;
}

void *sub_20A9DF1F4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void *, uint64_t, uint64_t);
  int v18;
  int v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 5, v6);
  v10 = v8(a2, 5, v6);
  if (!v9)
  {
    if (!v10)
    {
      v15 = sub_20A9E0290();
      v16 = *(_QWORD *)(v15 - 8);
      v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
      v18 = v17(a1, 1, v15);
      v19 = v17(a2, 1, v15);
      if (v18)
      {
        if (!v19)
        {
          (*(void (**)(void *, void *, uint64_t))(v16 + 16))(a1, a2, v15);
          (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(a1, 0, 1, v15);
          return a1;
        }
      }
      else
      {
        if (!v19)
        {
          (*(void (**)(void *, void *, uint64_t))(v16 + 24))(a1, a2, v15);
          return a1;
        }
        (*(void (**)(void *, uint64_t))(v16 + 8))(a1, v15);
      }
      v14 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254612138) - 8);
      goto LABEL_8;
    }
    sub_20A9C16D4((uint64_t)a1, &qword_254612008);
LABEL_7:
    v14 = *(_QWORD *)(a3 - 8);
LABEL_8:
    memcpy(a1, a2, *(_QWORD *)(v14 + 64));
    return a1;
  }
  if (v10)
    goto LABEL_7;
  v11 = sub_20A9E0290();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612138);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v12 + 16))(a1, a2, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
  }
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 5, v6);
  return a1;
}

void *sub_20A9DF3DC(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 5, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = sub_20A9E0290();
    v9 = *(_QWORD *)(v8 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(a2, 1, v8))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612138);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(a1, a2, v8);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(a1, 0, 1, v8);
    }
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 5, v6);
  }
  return a1;
}

void *sub_20A9DF4E8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void *, uint64_t, uint64_t);
  int v18;
  int v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 5, v6);
  v10 = v8(a2, 5, v6);
  if (!v9)
  {
    if (!v10)
    {
      v15 = sub_20A9E0290();
      v16 = *(_QWORD *)(v15 - 8);
      v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
      v18 = v17(a1, 1, v15);
      v19 = v17(a2, 1, v15);
      if (v18)
      {
        if (!v19)
        {
          (*(void (**)(void *, void *, uint64_t))(v16 + 32))(a1, a2, v15);
          (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(a1, 0, 1, v15);
          return a1;
        }
      }
      else
      {
        if (!v19)
        {
          (*(void (**)(void *, void *, uint64_t))(v16 + 40))(a1, a2, v15);
          return a1;
        }
        (*(void (**)(void *, uint64_t))(v16 + 8))(a1, v15);
      }
      v14 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254612138) - 8);
      goto LABEL_8;
    }
    sub_20A9C16D4((uint64_t)a1, &qword_254612008);
LABEL_7:
    v14 = *(_QWORD *)(a3 - 8);
LABEL_8:
    memcpy(a1, a2, *(_QWORD *)(v14 + 64));
    return a1;
  }
  if (v10)
    goto LABEL_7;
  v11 = sub_20A9E0290();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v12 + 48))(a2, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612138);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v12 + 32))(a1, a2, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
  }
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 5, v6);
  return a1;
}

uint64_t sub_20A9DF6D0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20A9DF6DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 6)
    return v5 - 5;
  else
    return 0;
}

uint64_t sub_20A9DF72C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20A9DF738(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 5);
  else
    v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_20A9DF790(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 5, v2);
}

uint64_t sub_20A9DF7CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254612008);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 5, v4);
}

void sub_20A9DF810()
{
  unint64_t v0;

  sub_20A9DF864();
  if (v0 <= 0x3F)
    swift_initEnumMetadataSinglePayload();
}

void sub_20A9DF864()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254612228)
  {
    sub_20A9E0290();
    v0 = sub_20A9E0218();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254612228);
  }
}

uint64_t sub_20A9DF99C()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_20A9DF9A8()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_20A9DF9B4()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_20A9DF9C0()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_20A9DF9CC()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_20A9DF9D8()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_20A9DF9E4()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_20A9DF9F0()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_20A9DF9FC()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_20A9DFA08()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_20A9DFA14()
{
  return MEMORY[0x24BDCC1E0]();
}

uint64_t sub_20A9DFA20()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_20A9DFA2C()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_20A9DFA38()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_20A9DFA44()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_20A9DFA50()
{
  return MEMORY[0x24BDCDC40]();
}

uint64_t sub_20A9DFA5C()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_20A9DFA68()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_20A9DFA74()
{
  return MEMORY[0x24BE1F180]();
}

uint64_t sub_20A9DFA80()
{
  return MEMORY[0x24BE1F188]();
}

uint64_t sub_20A9DFA8C()
{
  return MEMORY[0x24BE1F198]();
}

uint64_t sub_20A9DFA98()
{
  return MEMORY[0x24BE1F1A0]();
}

uint64_t sub_20A9DFAA4()
{
  return MEMORY[0x24BE1F1A8]();
}

uint64_t sub_20A9DFAB0()
{
  return MEMORY[0x24BE1F1B0]();
}

uint64_t sub_20A9DFABC()
{
  return MEMORY[0x24BE1F1B8]();
}

uint64_t sub_20A9DFAC8()
{
  return MEMORY[0x24BE1F1C0]();
}

uint64_t sub_20A9DFAD4()
{
  return MEMORY[0x24BE1F1C8]();
}

uint64_t sub_20A9DFAE0()
{
  return MEMORY[0x24BE1F1D0]();
}

uint64_t sub_20A9DFAEC()
{
  return MEMORY[0x24BE1F1E0]();
}

uint64_t sub_20A9DFAF8()
{
  return MEMORY[0x24BE1F1E8]();
}

uint64_t sub_20A9DFB04()
{
  return MEMORY[0x24BE1F1F8]();
}

uint64_t sub_20A9DFB10()
{
  return MEMORY[0x24BE1F200]();
}

uint64_t sub_20A9DFB1C()
{
  return MEMORY[0x24BE1F210]();
}

uint64_t sub_20A9DFB28()
{
  return MEMORY[0x24BE1F248]();
}

uint64_t sub_20A9DFB34()
{
  return MEMORY[0x24BE1F2B0]();
}

uint64_t sub_20A9DFB40()
{
  return MEMORY[0x24BE1F2B8]();
}

uint64_t sub_20A9DFB4C()
{
  return MEMORY[0x24BE1F2C8]();
}

uint64_t sub_20A9DFB58()
{
  return MEMORY[0x24BE1F2E0]();
}

uint64_t sub_20A9DFB64()
{
  return MEMORY[0x24BE1F2F0]();
}

uint64_t sub_20A9DFB70()
{
  return MEMORY[0x24BE1F2F8]();
}

uint64_t sub_20A9DFB7C()
{
  return MEMORY[0x24BE1F310]();
}

uint64_t sub_20A9DFB88()
{
  return MEMORY[0x24BE1F318]();
}

uint64_t sub_20A9DFB94()
{
  return MEMORY[0x24BE1F320]();
}

uint64_t sub_20A9DFBA0()
{
  return MEMORY[0x24BE1F328]();
}

uint64_t sub_20A9DFBAC()
{
  return MEMORY[0x24BE1F330]();
}

uint64_t sub_20A9DFBB8()
{
  return MEMORY[0x24BE1F340]();
}

uint64_t sub_20A9DFBC4()
{
  return MEMORY[0x24BE1F348]();
}

uint64_t sub_20A9DFBD0()
{
  return MEMORY[0x24BE1F350]();
}

uint64_t sub_20A9DFBDC()
{
  return MEMORY[0x24BE1F358]();
}

uint64_t sub_20A9DFBE8()
{
  return MEMORY[0x24BE1F360]();
}

uint64_t sub_20A9DFBF4()
{
  return MEMORY[0x24BE1F368]();
}

uint64_t sub_20A9DFC00()
{
  return MEMORY[0x24BE1F370]();
}

uint64_t sub_20A9DFC0C()
{
  return MEMORY[0x24BE1F378]();
}

uint64_t sub_20A9DFC18()
{
  return MEMORY[0x24BE1F380]();
}

uint64_t sub_20A9DFC24()
{
  return MEMORY[0x24BE1F390]();
}

uint64_t sub_20A9DFC30()
{
  return MEMORY[0x24BE1F398]();
}

uint64_t sub_20A9DFC3C()
{
  return MEMORY[0x24BE1F3F0]();
}

uint64_t sub_20A9DFC48()
{
  return MEMORY[0x24BE1F3F8]();
}

uint64_t sub_20A9DFC54()
{
  return MEMORY[0x24BE1F400]();
}

uint64_t sub_20A9DFC60()
{
  return MEMORY[0x24BE1F408]();
}

uint64_t sub_20A9DFC6C()
{
  return MEMORY[0x24BE1F410]();
}

uint64_t sub_20A9DFC78()
{
  return MEMORY[0x24BE1F418]();
}

uint64_t sub_20A9DFC84()
{
  return MEMORY[0x24BE1F420]();
}

uint64_t sub_20A9DFC90()
{
  return MEMORY[0x24BE1F448]();
}

uint64_t sub_20A9DFC9C()
{
  return MEMORY[0x24BE1F458]();
}

uint64_t sub_20A9DFCA8()
{
  return MEMORY[0x24BE1F460]();
}

uint64_t sub_20A9DFCB4()
{
  return MEMORY[0x24BE1F468]();
}

uint64_t sub_20A9DFCC0()
{
  return MEMORY[0x24BE1F470]();
}

uint64_t sub_20A9DFCCC()
{
  return MEMORY[0x24BE1F498]();
}

uint64_t sub_20A9DFCD8()
{
  return MEMORY[0x24BE1F4A8]();
}

uint64_t sub_20A9DFCE4()
{
  return MEMORY[0x24BE1F4B0]();
}

uint64_t sub_20A9DFCF0()
{
  return MEMORY[0x24BE1F4B8]();
}

uint64_t sub_20A9DFCFC()
{
  return MEMORY[0x24BE1F4C0]();
}

uint64_t sub_20A9DFD08()
{
  return MEMORY[0x24BE1F4D8]();
}

uint64_t sub_20A9DFD14()
{
  return MEMORY[0x24BE1F4E0]();
}

uint64_t sub_20A9DFD20()
{
  return MEMORY[0x24BE1F4E8]();
}

uint64_t sub_20A9DFD2C()
{
  return MEMORY[0x24BE1F4F0]();
}

uint64_t sub_20A9DFD38()
{
  return MEMORY[0x24BE1F4F8]();
}

uint64_t sub_20A9DFD44()
{
  return MEMORY[0x24BE1F500]();
}

uint64_t sub_20A9DFD50()
{
  return MEMORY[0x24BE1F508]();
}

uint64_t sub_20A9DFD5C()
{
  return MEMORY[0x24BE1F510]();
}

uint64_t sub_20A9DFD68()
{
  return MEMORY[0x24BE1F518]();
}

uint64_t sub_20A9DFD74()
{
  return MEMORY[0x24BE1F520]();
}

uint64_t sub_20A9DFD80()
{
  return MEMORY[0x24BE1F528]();
}

uint64_t sub_20A9DFD8C()
{
  return MEMORY[0x24BE1F530]();
}

uint64_t sub_20A9DFD98()
{
  return MEMORY[0x24BE1F538]();
}

uint64_t sub_20A9DFDA4()
{
  return MEMORY[0x24BE1F540]();
}

uint64_t sub_20A9DFDB0()
{
  return MEMORY[0x24BE1F548]();
}

uint64_t sub_20A9DFDBC()
{
  return MEMORY[0x24BE1F550]();
}

uint64_t sub_20A9DFDC8()
{
  return MEMORY[0x24BE1F558]();
}

uint64_t sub_20A9DFDD4()
{
  return MEMORY[0x24BE1F560]();
}

uint64_t sub_20A9DFDE0()
{
  return MEMORY[0x24BE1F568]();
}

uint64_t sub_20A9DFDEC()
{
  return MEMORY[0x24BE1F578]();
}

uint64_t sub_20A9DFDF8()
{
  return MEMORY[0x24BE1F580]();
}

uint64_t sub_20A9DFE04()
{
  return MEMORY[0x24BE1F588]();
}

uint64_t sub_20A9DFE10()
{
  return MEMORY[0x24BE1F5A0]();
}

uint64_t sub_20A9DFE1C()
{
  return MEMORY[0x24BE1F5A8]();
}

uint64_t sub_20A9DFE28()
{
  return MEMORY[0x24BE1F5C0]();
}

uint64_t sub_20A9DFE34()
{
  return MEMORY[0x24BE1F5D0]();
}

uint64_t sub_20A9DFE40()
{
  return MEMORY[0x24BE1F5D8]();
}

uint64_t sub_20A9DFE4C()
{
  return MEMORY[0x24BE1F5E0]();
}

uint64_t sub_20A9DFE58()
{
  return MEMORY[0x24BE1F5E8]();
}

uint64_t sub_20A9DFE64()
{
  return MEMORY[0x24BE1F5F0]();
}

uint64_t sub_20A9DFE70()
{
  return MEMORY[0x24BE1F600]();
}

uint64_t sub_20A9DFE7C()
{
  return MEMORY[0x24BE1F608]();
}

uint64_t sub_20A9DFE88()
{
  return MEMORY[0x24BE1F610]();
}

uint64_t sub_20A9DFE94()
{
  return MEMORY[0x24BE1F618]();
}

uint64_t sub_20A9DFEA0()
{
  return MEMORY[0x24BE1F620]();
}

uint64_t sub_20A9DFEAC()
{
  return MEMORY[0x24BE1F628]();
}

uint64_t sub_20A9DFEB8()
{
  return MEMORY[0x24BE1F630]();
}

uint64_t sub_20A9DFEC4()
{
  return MEMORY[0x24BE1F638]();
}

uint64_t sub_20A9DFED0()
{
  return MEMORY[0x24BE1F640]();
}

uint64_t sub_20A9DFEDC()
{
  return MEMORY[0x24BE1F648]();
}

uint64_t sub_20A9DFEE8()
{
  return MEMORY[0x24BE1F650]();
}

uint64_t sub_20A9DFEF4()
{
  return MEMORY[0x24BE1F658]();
}

uint64_t sub_20A9DFF00()
{
  return MEMORY[0x24BE1F660]();
}

uint64_t sub_20A9DFF0C()
{
  return MEMORY[0x24BE1F670]();
}

uint64_t sub_20A9DFF18()
{
  return MEMORY[0x24BE1F680]();
}

uint64_t sub_20A9DFF24()
{
  return MEMORY[0x24BE1F690]();
}

uint64_t sub_20A9DFF30()
{
  return MEMORY[0x24BE1F698]();
}

uint64_t sub_20A9DFF3C()
{
  return MEMORY[0x24BE1F6A0]();
}

uint64_t sub_20A9DFF48()
{
  return MEMORY[0x24BE1F6B0]();
}

uint64_t sub_20A9DFF54()
{
  return MEMORY[0x24BE1F6B8]();
}

uint64_t sub_20A9DFF60()
{
  return MEMORY[0x24BE1F6C8]();
}

uint64_t sub_20A9DFF6C()
{
  return MEMORY[0x24BE1F6D0]();
}

uint64_t sub_20A9DFF78()
{
  return MEMORY[0x24BE1F6D8]();
}

uint64_t sub_20A9DFF84()
{
  return MEMORY[0x24BE1F6E0]();
}

uint64_t sub_20A9DFF90()
{
  return MEMORY[0x24BE1F700]();
}

uint64_t sub_20A9DFF9C()
{
  return MEMORY[0x24BE1F708]();
}

uint64_t sub_20A9DFFA8()
{
  return MEMORY[0x24BE1F710]();
}

uint64_t sub_20A9DFFB4()
{
  return MEMORY[0x24BE1F718]();
}

uint64_t sub_20A9DFFC0()
{
  return MEMORY[0x24BE1F720]();
}

uint64_t sub_20A9DFFCC()
{
  return MEMORY[0x24BE1F728]();
}

uint64_t sub_20A9DFFD8()
{
  return MEMORY[0x24BE1F730]();
}

uint64_t sub_20A9DFFE4()
{
  return MEMORY[0x24BE1F738]();
}

uint64_t sub_20A9DFFF0()
{
  return MEMORY[0x24BE1F740]();
}

uint64_t sub_20A9DFFFC()
{
  return MEMORY[0x24BE1F748]();
}

uint64_t sub_20A9E0008()
{
  return MEMORY[0x24BE1F750]();
}

uint64_t sub_20A9E0014()
{
  return MEMORY[0x24BE1F758]();
}

uint64_t sub_20A9E0020()
{
  return MEMORY[0x24BE1F760]();
}

uint64_t sub_20A9E002C()
{
  return MEMORY[0x24BE1F768]();
}

uint64_t sub_20A9E0038()
{
  return MEMORY[0x24BE1F770]();
}

uint64_t sub_20A9E0044()
{
  return MEMORY[0x24BE1F790]();
}

uint64_t sub_20A9E0050()
{
  return MEMORY[0x24BE1F800]();
}

uint64_t sub_20A9E005C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_20A9E0068()
{
  return MEMORY[0x24BDCF828]();
}

uint64_t sub_20A9E0074()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_20A9E0080()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_20A9E008C()
{
  return MEMORY[0x24BE1F808]();
}

uint64_t sub_20A9E0098()
{
  return MEMORY[0x24BEE02C0]();
}

uint64_t sub_20A9E00A4()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_20A9E00B0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_20A9E00BC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_20A9E00C8()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_20A9E00D4()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_20A9E00E0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_20A9E00EC()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_20A9E00F8()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_20A9E0104()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_20A9E0110()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_20A9E011C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_20A9E0128()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_20A9E0134()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_20A9E0140()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_20A9E014C()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_20A9E0158()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_20A9E0164()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_20A9E0170()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_20A9E017C()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_20A9E0188()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_20A9E0194()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_20A9E01A0()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_20A9E01AC()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_20A9E01B8()
{
  return MEMORY[0x24BEE6AD8]();
}

uint64_t sub_20A9E01C4()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_20A9E01D0()
{
  return MEMORY[0x24BEE6B28]();
}

uint64_t sub_20A9E01DC()
{
  return MEMORY[0x24BEE6B38]();
}

uint64_t sub_20A9E01E8()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_20A9E01F4()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_20A9E0200()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_20A9E020C()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_20A9E0218()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_20A9E0224()
{
  return MEMORY[0x24BEE2090]();
}

uint64_t sub_20A9E0230()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_20A9E023C()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_20A9E0248()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_20A9E0254()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_20A9E0260()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_20A9E026C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_20A9E0278()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_20A9E0284()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_20A9E0290()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_20A9E029C()
{
  return MEMORY[0x24BEE6E48]();
}

uint64_t sub_20A9E02A8()
{
  return MEMORY[0x24BEE6E58]();
}

uint64_t sub_20A9E02B4()
{
  return MEMORY[0x24BEE6E70]();
}

uint64_t sub_20A9E02C0()
{
  return MEMORY[0x24BEE6E98]();
}

uint64_t sub_20A9E02CC()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_20A9E02D8()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_20A9E02E4()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_20A9E02F0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_20A9E02FC()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_20A9E0308()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_20A9E0314()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_20A9E0320()
{
  return MEMORY[0x24BEE7058]();
}

uint64_t sub_20A9E032C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_20A9E0338()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_20A9E0344()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_20A9E0350()
{
  return MEMORY[0x24BEE7150]();
}

uint64_t sub_20A9E035C()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_20A9E0368()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_20A9E0374()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_20A9E0380()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}


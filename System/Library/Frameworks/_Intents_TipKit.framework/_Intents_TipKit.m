void sub_23558468C()
{
  qword_25428E120 = MEMORY[0x24BEE4B00];
}

uint64_t sub_2355846A0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[3] = a1;
  v2[4] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25428E108);
  v2[5] = swift_task_alloc();
  v3 = sub_23558732C();
  v2[6] = v3;
  v2[7] = *(_QWORD *)(v3 - 8);
  v2[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25428E110);
  v2[9] = swift_task_alloc();
  v4 = sub_2355873C8();
  v2[10] = v4;
  v2[11] = *(_QWORD *)(v4 - 8);
  v2[12] = swift_task_alloc();
  v5 = sub_2355873EC();
  v2[13] = v5;
  v2[14] = *(_QWORD *)(v5 - 8);
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2355847A8()
{
  uint64_t v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;

  v1 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v2 = objc_msgSend(v1, sel_bundleIdentifier);

  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 120);
    v4 = *(_QWORD *)(v0 + 128);
    v6 = *(_QWORD *)(v0 + 104);
    v5 = *(_QWORD *)(v0 + 112);
    v7 = *(_QWORD **)(v0 + 72);
    v8 = *(void **)(v0 + 32);
    sub_2355874B8();

    sub_2355873E0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v4, v6);
    sub_235584DA4(MEMORY[0x24BEE4AF8]);
    *v7 = v8;
    v9 = *MEMORY[0x24BEA76B0];
    v10 = sub_235587410();
    v11 = *(_QWORD *)(v10 - 8);
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(v11 + 104))(v7, v9, v10);
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v7, 0, 1, v10);
    v12 = v8;
    sub_2355873BC();
    if (qword_25428E0F0 != -1)
      swift_once();
    v13 = sub_235587434();
    __swift_project_value_buffer(v13, (uint64_t)qword_25428E128);
    v14 = sub_23558741C();
    v15 = sub_2355874E8();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_235582000, v14, v15, "Calling SiriSuggestionsAPI to fetch example utterance for intent", v16, 2u);
      MEMORY[0x23B7CE854](v16, -1, -1);
    }

    sub_235587350();
    *(_QWORD *)(v0 + 136) = sub_235587344();
    v19 = *(_QWORD *)(v0 + 40);
    sub_235587320();
    v20 = sub_2355873D4();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v19, 1, 1, v20);
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v21;
    *v21 = v0;
    v21[1] = sub_235584C3C;
    return sub_235587338();
  }
  else
  {
    v17 = *(_QWORD *)(v0 + 24);
    v18 = sub_235587374();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_235584C3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)v0 + 56);
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 64);
  v4 = *(_QWORD *)(*(_QWORD *)v0 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  swift_task_dealloc();
  swift_release();
  sub_235584EE8(v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch();
}

uint64_t sub_235584CC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 112);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7CE80C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_235584DA4(uint64_t a1)
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
  __int128 v17[3];

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562484D0);
  v2 = sub_235587554();
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
    sub_235584F28(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_235586574(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_235584F70(v17, (_OWORD *)(v3[7] + 48 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 64;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_235584EE8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25428E108);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_235584F28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2562484D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_235584F70(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t static SiriKitIntentTip.create(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5[8] = a4;
  v5[9] = v4;
  v5[6] = a2;
  v5[7] = a3;
  v5[5] = a1;
  v7 = sub_2355873B0();
  v5[10] = v7;
  v5[11] = *(_QWORD *)(v7 - 8);
  v5[12] = swift_task_alloc();
  v8 = sub_235587398();
  v5[13] = v8;
  v5[14] = *(_QWORD *)(v8 - 8);
  v5[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25428E0F8);
  v5[16] = swift_task_alloc();
  v5[17] = swift_task_alloc();
  v9 = sub_235587374();
  v5[18] = v9;
  v5[19] = *(_QWORD *)(v9 - 8);
  v5[20] = swift_task_alloc();
  v5[21] = *(_QWORD *)(a3 - 8);
  v5[22] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_235585094()
{
  uint64_t *v0;
  _QWORD *v1;

  (*(void (**)(uint64_t))(v0[8] + 40))(v0[7]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[23] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_2355850F8;
  return sub_2355846A0(v0[17], v0[6]);
}

uint64_t sub_2355850F8()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23558514C()
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 136);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    v4 = *(_QWORD *)(v0 + 168);
    v5 = *(_QWORD *)(v0 + 56);
    v6 = *(_QWORD *)(v0 + 40);
    (*(void (**)(_QWORD, uint64_t))(v4 + 8))(*(_QWORD *)(v0 + 176), v5);
    sub_2355865D8(v3, &qword_25428E0F8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v6, 1, 1, v5);
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 112);
    v7 = *(_QWORD *)(v0 + 120);
    v9 = *(_QWORD *)(v0 + 96);
    v23 = *(_QWORD *)(v0 + 104);
    v24 = *(_QWORD *)(v0 + 88);
    v26 = *(_QWORD *)(v0 + 80);
    v10 = *(_QWORD *)(v0 + 64);
    v28 = *(_QWORD *)(v0 + 56);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v2 + 32))(*(_QWORD *)(v0 + 160), v3, v1);
    sub_23558735C();
    sub_235587380();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v23);
    v11 = sub_2355873A4();
    v13 = v12;
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v9, v26);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 24))(v11, v13, v28, v10);
    if (qword_25428E100 != -1)
      swift_once();
    v29 = *(_QWORD *)(v0 + 168);
    v15 = *(_QWORD *)(v0 + 152);
    v14 = *(_QWORD *)(v0 + 160);
    v16 = *(_QWORD *)(v0 + 144);
    v17 = *(_QWORD *)(v0 + 128);
    v18 = *(_QWORD *)(v0 + 56);
    v25 = *(_QWORD *)(v0 + 176);
    v27 = *(_QWORD *)(v0 + 40);
    v19 = sub_235587440();
    v21 = v20;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v17, v14, v16);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v15 + 56))(v17, 0, 1, v16);
    swift_beginAccess();
    sub_2355853E4(v17, v19, v21);
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(v27, v25, v18);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v29 + 56))(v27, 0, 1, v18);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2355853E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25428E0F8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_235587374();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(a1, 1, v10) == 1)
  {
    sub_2355865D8(a1, &qword_25428E0F8);
    sub_235586774(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_2355865D8((uint64_t)v9, &qword_25428E0F8);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v13, a1, v10);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v17 = *v4;
    *v4 = 0x8000000000000000;
    sub_235586E08((uint64_t)v13, a2, a3, isUniquelyReferenced_nonNull_native);
    *v4 = v17;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t SiriKitIntentTip.exampleUtterance.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t SiriKitIntentTip.siriDidExecuteIntent.getter(uint64_t a1, uint64_t a2)
{
  return sub_23558599C(a1, a2, MEMORY[0x24BEA6CA0]);
}

uint64_t sub_23558556C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34[3];
  uint64_t v35;
  unint64_t v36;

  v0 = sub_235587404();
  v31 = *(_QWORD *)(v0 - 8);
  v32 = v0;
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v29 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_235587398();
  v3 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_235587374();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25428E0F8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = 0;
  v36 = 0xE000000000000000;
  if (qword_25428E100 != -1)
    swift_once();
  v12 = sub_235587440();
  v14 = v13;
  swift_beginAccess();
  v15 = qword_25428E120;
  if (*(_QWORD *)(qword_25428E120 + 16) && (v16 = sub_235586574(v12, v14), (v17 & 1) != 0))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v11, *(_QWORD *)(v15 + 56) + *(_QWORD *)(v7 + 72) * v16, v6);
    v18 = 0;
  }
  else
  {
    v18 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v11, v18, 1, v6);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v11, 1, v6))
  {
    sub_2355865D8((uint64_t)v11, &qword_25428E0F8);
    swift_endAccess();
    v19 = 0;
    v20 = 0xE000000000000000;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v11, v6);
    sub_2355865D8((uint64_t)v11, &qword_25428E0F8);
    swift_endAccess();
    sub_23558735C();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    sub_23558738C();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v30);
    v19 = sub_2355873F8();
    v20 = v21;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v2, v32);
  }
  v35 = v19;
  v36 = v20;
  v22 = qword_25428E0F0;
  swift_bridgeObjectRetain();
  if (v22 != -1)
    swift_once();
  v23 = sub_235587434();
  __swift_project_value_buffer(v23, (uint64_t)qword_25428E128);
  swift_bridgeObjectRetain();
  v24 = sub_23558741C();
  v25 = sub_2355874E8();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = swift_slowAlloc();
    v34[0] = v27;
    *(_DWORD *)v26 = 136315138;
    swift_bridgeObjectRetain();
    v33 = sub_235585F34(v19, v20, v34);
    sub_2355874F4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_235582000, v24, v25, "Derived loggingIntentIdentifier: %s", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7CE854](v27, -1, -1);
    MEMORY[0x23B7CE854](v26, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  return v35;
}

uint64_t SiriKitIntentTip.siriEducatedIntent.getter(uint64_t a1, uint64_t a2)
{
  return sub_23558599C(a1, a2, MEMORY[0x24BEA6C98]);
}

uint64_t sub_23558599C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  sub_23558556C();
  sub_2355874D0();
  swift_bridgeObjectRelease();
  return sub_23558744C();
}

uint64_t (*SiriKitIntentTip.notifySiriTipOnDisplay.getter())()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v19;

  v0 = sub_235587374();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25428E0F8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25428E100 != -1)
    swift_once();
  v6 = sub_235587440();
  v8 = v7;
  swift_beginAccess();
  v9 = qword_25428E120;
  if (*(_QWORD *)(qword_25428E120 + 16) && (v10 = sub_235586574(v6, v8), (v11 & 1) != 0))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v5, *(_QWORD *)(v9 + 56) + *(_QWORD *)(v1 + 72) * v10, v0);
    v12 = 0;
  }
  else
  {
    v12 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v5, v12, 1, v0);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v5, 1, v0))
  {
    sub_2355865D8((uint64_t)v5, &qword_25428E0F8);
    swift_endAccess();
    if (qword_25428E0F0 != -1)
      swift_once();
    v13 = sub_235587434();
    __swift_project_value_buffer(v13, (uint64_t)qword_25428E128);
    v14 = sub_23558741C();
    v15 = sub_2355874E8();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_235582000, v14, v15, "Could not get callback function from cache", v16, 2u);
      MEMORY[0x23B7CE854](v16, -1, -1);
    }

    return nullsub_1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v3, v5, v0);
    sub_2355865D8((uint64_t)v5, &qword_25428E0F8);
    swift_endAccess();
    v17 = sub_235587368();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return (uint64_t (*)())v17;
}

uint64_t SiriKitIntentTip.siriIcon.getter()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2562484E8);
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)&v15 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_235587470();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (AFDeviceSupportsSystemAssistantExperience())
  {
    sub_23558747C();
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDF3FD0], v2);
    sub_235587494();
    swift_release();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_235587458();
    v6 = sub_235587464();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v1, 0, 1, v6);
    v7 = sub_235587488();
    swift_release();
    sub_2355865D8((uint64_t)v1, &qword_2562484E8);
  }
  else
  {
    v8 = (void *)sub_2355874AC();
    v9 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v8);

    if (v9)
    {
      return sub_2355874A0();
    }
    else
    {
      if (qword_25428E0F0 != -1)
        swift_once();
      v10 = sub_235587434();
      __swift_project_value_buffer(v10, (uint64_t)qword_25428E128);
      v11 = sub_23558741C();
      v12 = sub_2355874E8();
      if (os_log_type_enabled(v11, v12))
      {
        v13 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_235582000, v11, v12, "Could not get bundle for identifier to get the siriIcon", v13, 2u);
        MEMORY[0x23B7CE854](v13, -1, -1);
      }

      return 0;
    }
  }
  return v7;
}

uint64_t sub_235585F34(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_235586004(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_235586734((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_235586734((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_235586004(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_235587500();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2355861BC(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_235587524();
  if (!v8)
  {
    sub_235587530();
    __break(1u);
LABEL_17:
    result = sub_235587560();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_2355861BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_235586250(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_235586428(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_235586428(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_235586250(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_2355863C4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_235587518();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_235587530();
      __break(1u);
LABEL_10:
      v2 = sub_2355874DC();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_235587560();
    __break(1u);
LABEL_14:
    result = sub_235587530();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2355863C4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2562484F0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_235586428(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2562484F0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_235587560();
  __break(1u);
  return result;
}

unint64_t sub_235586574(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_235587584();
  sub_2355874C4();
  v4 = sub_235587590();
  return sub_235586634(a1, a2, v4);
}

uint64_t sub_2355865D8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t dispatch thunk of SiriKitIntentTip.exampleUtterance.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SiriKitIntentTip.exampleUtterance.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of SiriKitIntentTip.exampleUtterance.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of SiriKitIntentTip.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

unint64_t sub_235586634(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23558756C() & 1) == 0)
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
      while (!v14 && (sub_23558756C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_235586734(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_235586774@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_235586574(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v17 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_235586FD4();
      v11 = v17;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56);
    v13 = sub_235587374();
    v14 = *(_QWORD *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v14 + 32))(a3, v12 + *(_QWORD *)(v14 + 72) * v8, v13);
    sub_235586C0C(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a3, 0, 1, v13);
  }
  else
  {
    v16 = sub_235587374();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a3, 1, 1, v16);
  }
}

uint64_t sub_2355868A4(uint64_t a1, int a2)
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
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
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
  int64_t v41;
  _QWORD *v42;
  int v43;
  char *v44;
  uint64_t v45;

  v3 = v2;
  v45 = sub_235587374();
  v5 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8]();
  v44 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25428E118);
  v43 = a2;
  v8 = sub_235587548();
  v9 = v8;
  if (*(_QWORD *)(v7 + 16))
  {
    v40 = v2;
    v10 = 1 << *(_BYTE *)(v7 + 32);
    v11 = *(_QWORD *)(v7 + 64);
    v42 = (_QWORD *)(v7 + 64);
    if (v10 < 64)
      v12 = ~(-1 << v10);
    else
      v12 = -1;
    v13 = v12 & v11;
    v41 = (unint64_t)(v10 + 63) >> 6;
    v14 = v8 + 64;
    result = swift_retain();
    v16 = 0;
    while (1)
    {
      if (v13)
      {
        v19 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v20 = v19 | (v16 << 6);
      }
      else
      {
        v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v41)
          goto LABEL_34;
        v22 = v42[v21];
        ++v16;
        if (!v22)
        {
          v16 = v21 + 1;
          if (v21 + 1 >= v41)
            goto LABEL_34;
          v22 = v42[v16];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v41)
            {
LABEL_34:
              swift_release();
              v3 = v40;
              if ((v43 & 1) != 0)
              {
                v38 = 1 << *(_BYTE *)(v7 + 32);
                if (v38 >= 64)
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v42 = -1 << v38;
                *(_QWORD *)(v7 + 16) = 0;
              }
              break;
            }
            v22 = v42[v23];
            if (!v22)
            {
              while (1)
              {
                v16 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v16 >= v41)
                  goto LABEL_34;
                v22 = v42[v16];
                ++v23;
                if (v22)
                  goto LABEL_21;
              }
            }
            v16 = v23;
          }
        }
LABEL_21:
        v13 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      v24 = *(_QWORD *)(v7 + 56);
      v25 = v7;
      v26 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v20);
      v28 = *v26;
      v27 = v26[1];
      v29 = *(_QWORD *)(v5 + 72);
      v30 = v24 + v29 * v20;
      if ((v43 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v44, v30, v45);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v44, v30, v45);
        swift_bridgeObjectRetain();
      }
      sub_235587584();
      sub_2355874C4();
      result = sub_235587590();
      v31 = -1 << *(_BYTE *)(v9 + 32);
      v32 = result & ~v31;
      v33 = v32 >> 6;
      if (((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_40;
          }
          v36 = v33 == v35;
          if (v33 == v35)
            v33 = 0;
          v34 |= v36;
          v37 = *(_QWORD *)(v14 + 8 * v33);
        }
        while (v37 == -1);
        v17 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v17);
      *v18 = v28;
      v18[1] = v27;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v9 + 56) + v29 * v17, v44, v45);
      ++*(_QWORD *)(v9 + 16);
      v7 = v25;
    }
  }
  result = swift_release();
  *v3 = v9;
  return result;
}

unint64_t sub_235586C0C(unint64_t result, uint64_t a2)
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
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_23558750C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_235587584();
        swift_bridgeObjectRetain();
        sub_2355874C4();
        v9 = sub_235587590();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v10 < v8)
          goto LABEL_11;
LABEL_12:
        v11 = *(_QWORD *)(a2 + 48);
        v12 = (_OWORD *)(v11 + 16 * v3);
        v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1)
          *v12 = *v13;
        v14 = *(_QWORD *)(a2 + 56);
        v15 = *(_QWORD *)(*(_QWORD *)(sub_235587374() - 8) + 72);
        v16 = v15 * v3;
        result = v14 + v15 * v3;
        v17 = v15 * v6;
        v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v16 == v17)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v10 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v10)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_235586E08(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  char v23;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_235586574(a2, a3);
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
        v19 = v18[7];
        v20 = sub_235587374();
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v12, a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_235586FD4();
      goto LABEL_7;
    }
    sub_2355868A4(v15, a4 & 1);
    v22 = sub_235586574(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_235586F44(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_235587578();
  __break(1u);
  return result;
}

uint64_t sub_235586F44(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = sub_235587374();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1, a4, v10);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

void *sub_235586FD4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = sub_235587374();
  v1 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25428E118);
  v31 = v0;
  v4 = *v0;
  v5 = sub_23558753C();
  v6 = *(_QWORD *)(v4 + 16);
  v35 = v5;
  if (!v6)
  {
    result = (void *)swift_release();
    v29 = v35;
    v28 = v31;
LABEL_28:
    *v28 = v29;
    return result;
  }
  v7 = v5;
  result = (void *)(v5 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    v7 = v35;
  }
  v32 = v4 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v4 + 16);
  v12 = 1 << *(_BYTE *)(v4 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v4 + 64);
  v33 = (unint64_t)(v12 + 63) >> 6;
  v15 = v34;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      v11 = v25 + 1;
      if (v25 + 1 >= v33)
        goto LABEL_26;
      v26 = *(_QWORD *)(v32 + 8 * v11);
      if (!v26)
        break;
    }
LABEL_25:
    v14 = (v26 - 1) & v26;
    v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(_QWORD *)(v4 + 56) + v22, v15);
    v23 = v35;
    v24 = (_QWORD *)(*(_QWORD *)(v35 + 48) + v18);
    *v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v23 + 56) + v22, v3, v15);
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    result = (void *)swift_release();
    v28 = v31;
    v29 = v35;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v32 + 8 * v27);
  if (v26)
  {
    v11 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v11 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v11);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_235587230()
{
  uint64_t v0;

  v0 = sub_235587434();
  __swift_allocate_value_buffer(v0, qword_25428E128);
  __swift_project_value_buffer(v0, (uint64_t)qword_25428E128);
  return sub_235587428();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_2355872F0()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_235587320()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23558732C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_235587338()
{
  return MEMORY[0x24BEA6BA0]();
}

uint64_t sub_235587344()
{
  return MEMORY[0x24BEA6BB0]();
}

uint64_t sub_235587350()
{
  return MEMORY[0x24BEA6BB8]();
}

uint64_t sub_23558735C()
{
  return MEMORY[0x24BEA6BC8]();
}

uint64_t sub_235587368()
{
  return MEMORY[0x24BEA6BD0]();
}

uint64_t sub_235587374()
{
  return MEMORY[0x24BEA6BD8]();
}

uint64_t sub_235587380()
{
  return MEMORY[0x24BEA6C00]();
}

uint64_t sub_23558738C()
{
  return MEMORY[0x24BEA6C10]();
}

uint64_t sub_235587398()
{
  return MEMORY[0x24BEA6C30]();
}

uint64_t sub_2355873A4()
{
  return MEMORY[0x24BEA6C40]();
}

uint64_t sub_2355873B0()
{
  return MEMORY[0x24BEA6C48]();
}

uint64_t sub_2355873BC()
{
  return MEMORY[0x24BEA7008]();
}

uint64_t sub_2355873C8()
{
  return MEMORY[0x24BEA7030]();
}

uint64_t sub_2355873D4()
{
  return MEMORY[0x24BEA7248]();
}

uint64_t sub_2355873E0()
{
  return MEMORY[0x24BEA7298]();
}

uint64_t sub_2355873EC()
{
  return MEMORY[0x24BEA72B8]();
}

uint64_t sub_2355873F8()
{
  return MEMORY[0x24BEA7640]();
}

uint64_t sub_235587404()
{
  return MEMORY[0x24BEA7648]();
}

uint64_t sub_235587410()
{
  return MEMORY[0x24BEA76B8]();
}

uint64_t sub_23558741C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_235587428()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_235587434()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_235587440()
{
  return MEMORY[0x24BDF6090]();
}

uint64_t sub_23558744C()
{
  return MEMORY[0x24BDF62A0]();
}

uint64_t sub_235587458()
{
  return MEMORY[0x24BDEF0B8]();
}

uint64_t sub_235587464()
{
  return MEMORY[0x24BDEF0E8]();
}

uint64_t sub_235587470()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_23558747C()
{
  return MEMORY[0x24BDF4048]();
}

uint64_t sub_235587488()
{
  return MEMORY[0x24BDF4050]();
}

uint64_t sub_235587494()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_2355874A0()
{
  return MEMORY[0x24BDF4130]();
}

uint64_t sub_2355874AC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2355874B8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2355874C4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2355874D0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2355874DC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2355874E8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2355874F4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_235587500()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23558750C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_235587518()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_235587524()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_235587530()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23558753C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_235587548()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_235587554()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_235587560()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23558756C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_235587578()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_235587584()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_235587590()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AFDeviceSupportsSystemAssistantExperience()
{
  return MEMORY[0x24BE08CC8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
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

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

